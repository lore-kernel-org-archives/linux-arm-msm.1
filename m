Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645462;
	b=CmdUBYZX0oTQfYWYXuW4zo3nuwnDCX4TofhZ6IsKaRnd3Q/+QZovThCHJCquF/T2/mDP
	 jF4LNKmzKeOk9k+62E+1zMtSzWHD5hVQtdKGlwg3vP4xx61ylbpuMAyqcYDccMTfuPFcT
	 8E/LV2ukk/3uxD/DskFuso6w6+8xdiXFEzsZoYaSTAH1Zu8sIgq4wSAMJIDhi1tKpaPz2
	 6CpcQ9+oOuhIQliKZSq6WwQf6P+vjUYiQVRyyLK0c7LOQp4TdKPT87shTTgnfgRpKuj1t
	 ZoFK4BLiQkrZdafazeFzO7GYCXwjxqE/AF07ZA57CmSSA18QeVco/pxLvXg+Olwt+5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645462;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=SOFAaT+uPLKdHc2EywygUDmblsMvboK7RkS5a496ayI=;
	b=13njk5P/H69KtsQdg2FvghQrqdzW5Sm4wN5rFNAx3gLrTzLD1Qumj6Iuwe/QLKc4Mwvi
	 kPlgl/vN+HYSl6ofYxSArKMvVBg6K7HLZHvbJhCWKCxiaPUtE5sb6Ia9P5/c9rx7GxQ+E
	 l3cVtsAzu2iAhbSaJuc2Bvpu5SFtcPiIrf392oxSuhz/y8hx43KFwNSN9wiVQd0J4wPV8
	 R9N4pNQPcV1Q4YZwfFI7XRzwV3TUodr2toSJ1IB8FhBqBJev/o0lCakrY1gO/Lqi4djPi
	 TcsT6IShP1gT/uR0tmuvC5smIg7ymfDYzFgfHgeFN7LVDBM6hOmoE3LmigoEfE0PY9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OlxckOFU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87CA606A323;
	Wed, 25 Nov 2026 22:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OlxckOFU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF8E1F000C0;
	Wed, 25 Nov 2026 22:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645461;
	bh=SOFAaT+uPLKdHc2EywygUDmblsMvboK7RkS5a496ayI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OlxckOFU4Mt/slqwfAsNCyBy3K1yV0H0V786wpEWYu5kMrdkomZ7/LeDKxVS3c9Gj
	 7eoU5yTft5h4LyRLrFAFf90Qb5yxR3s1++5oKrQn62WD0ZoK3thUyLD5r3dLXfZGAN
	 AOV2tlhY42V2j6jWzHwbc0yHEZe4yCl+npsu/T9lGYNrbFMxKYOgM7HlRpQIHIQ0ck
	 NOGGk9JYPdxAW2+CfHn0g4fKCRke75CSpQwJyMLbuQC3LJcrbkIaGH75o5mIiIbVye
	 W57jhXo5bzYniOmk0E6Ws0NIHU7LoFMe6IVTUyk3xeFEtHnAMs4ciobXtreYWPN1Sa
	 uj+kG2bHxYC/A==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 28/47] clocksource/drivers/qcom: Move CPUHP_AP_QCOM_TIMER_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:22:11 +0100
Message-ID: <20261125222230.22508-29-frederic@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125222230.22508-1-frederic@kernel.org>
References: <20261125222230.22508-1-frederic@kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Between CPUHP_TEARDOWN_CPU and CPUHP_AP_OFFLINE, stop_machine executes
all the teardown callbacks while temporarily stopping/pausing all CPUs
in the system. This doesn't mix well with running RT or isolated tasks.

In order to transition smoothly from global stop_machine to finer
grained synchronization between teardown callbacks and the other CPUs,
a new stop machine post function has been introduced to be executed
after the main one with IRQs still disabled while other CPUs can exit
stop_machine().

The teardown callback here simply performs IRQ disablement, which can
run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index d7a6dcb14885..fc29c33a03e1 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_TWD_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_QCOM_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_ARM_TWD_STARTING);
+	WARN_ON(st->state != CPUHP_AP_QCOM_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1

