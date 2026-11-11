Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398014;
	b=fR7x0hTAUZbHCKFQ5zML3TANA7T2sgtFj4SG7SgseLYaxRUBw4Yybi5+8D2d/l8Xb9jL
	 YmyySK6PQ0ejAGkSYs1bbU5O6zONjdYQBML4WlBSHeJQHzIWBh5Y8l/ygdQkZinJOsjt2
	 nMpd+XPWex0p1mB7vKONAgQu8AzX6R3Hfm8L1pLvsY8kAR9b4MYe6k/ePtroab6tFykXx
	 YOUrOxRAqE7H/Y6XE+9oirJqgQ91rJNc8hGNQuRpDyPhIZ70wVN+pgqBEC1zimeP3G9bl
	 8buR6ZMR1DG4WQUMPx/xQYf9sfDdPShbFXwyfcF7GB52TnR0sytLjTTGolru6sTJACg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=R1sC1VNhGnBtpHRUbV8Au5v/vixUhvc52DHmrj1EE2M=;
	b=XtMPRH2Y8QOBBpOiszX0Ae46yJkc6BZLs0KgzuPfo7visF7wdr7JBKRgdNP6Ucg8X4iI
	 bPrJaKD7fAkcW9Je8wW3+hmuie32huT2WkaE9/6ddHOK81MaUl99KEUvKAKMXAoiMC52l
	 0ARpCFXMHhEhTkxjqxbkg26C5bLwuyi1vstXagaJweebY9n3TfDs5bt7e05IqGJo2K3wT
	 nNpaSjC7znm1tkvvpqXJx6aPVF3H4BVHDVhMYKM4OvDkKIPsp9uNN7WNjq0/1kfIyE0IE
	 V9fhs6/c5kdTbnlBt0XljXwYtCqDMsmtUDhPFusfRB6et2Ji026gUm2Ukyv6WNhK6zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="ptwRo/QM";
	arc=none smtp.remote-ip=209.85.208.71
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C398A606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 11:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C398A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ptwRo/QM
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6a615ab0c06so3122007a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 03:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794398012; x=1795002812; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R1sC1VNhGnBtpHRUbV8Au5v/vixUhvc52DHmrj1EE2M=;
        b=ptwRo/QMJdw3S5C82EjctvnkPPJ/XAYr0iF68TBy5r0+WcXKKe6vONKJm8JO0ISz4x
         u2b8/pjiCjkLUOvWcyekobIqsxppo3xRlYVhASUoUkDm/oPhDtNEqPqEE2s7ZqsXjgyI
         7Zs9sMKpbDXSwJ7nDc9nsh29dUs3GY0dMDyLOjjIlj8YLlWKo51CHC3CUgvBoIe9yuSW
         QFPmvR5CbHEzlYOdLBm0Dq3Imft+ozDO9C5QLFDaUJqjB0+QpX8buLfqf934ki+Htj2D
         ftjuPQw3rvzKC5fE4uSgDekxRLO055IeGjBhvyxto2IqfkywufQyN7emniZqeLRODU0L
         Inmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398012; x=1795002812;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R1sC1VNhGnBtpHRUbV8Au5v/vixUhvc52DHmrj1EE2M=;
        b=j5q1wy6YuqVLv44HvQCLBkRj59rIDNYF9BK1l96j2y7WU2ZoShJ36NGDr7Oc5IJwaC
         dP4B4+HHkkY3ylqiMpVeUDJFpfhDOEYR2vGwtE75Pt/kjifEweAcN7XChJXqHAgT9Swj
         8RdHrH9d2dlKnKLrlUXsHto2kmjXIdeBACSlL1MKB4RNxK9S7H3bxLJlas5seor49LGj
         SIQDCOCAqEuYOupaFIVEkAGJwpJiFXkiWZTCs6sVZqSy6Ljo764AxvODgVZSBfS+pRv0
         PcnlnTeERXVV+RWdKPM60a33nLmCTiREFH7XgJu+zLtn8593J32/Cro9MobT6KN58TZ/
         YLBg==
X-Forwarded-Encrypted: i=1; AL+hErGiWEPOGGsh2h086kt7qlbx8NSGU4MTjA+QgT3+sdL9CFw4MNnb10nVnPKqCaRzO8N4EXthVeJMRlU41SF6@vger.kernel.org
X-Gm-Message-State: APuU4Z/iOdJUTi+dOVhRX0H3BX9yWj5sW0KsHaDrR6/Gh5vGZDcGEP/g
	Y9EnCx5ySnPqa7WdR/rCVGGM/nGxJ9gnxjQuhpKmVruCQuWsW3YHzhEpGM1h+mP2mDjqAv0Yqg=
	=
X-Received: from edr5.prod.google.com ([2002:a05:6402:44c5:b0:6b6:4dd3:1b66])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:a511:20b0:6b3:f81f:927d
 with SMTP id 4fb4d7f45d1cf-6b77733e8b0mr1246254a12.6.1794398011893; Wed, 11
 Nov 2026 03:53:31 -0800 (PST)
Date: Wed, 11 Nov 2026 12:53:08 +0100
In-Reply-To: <20261111115303.3749380-9-ardb+git@google.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111115303.3749380-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3183; i=ardb@kernel.org;
 h=from:subject; bh=f2/b8qqgKRe7hacc/4x5TBVKpXpp7q5tLsN3LE74ybM=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIetLuCpHgyIfm/LrS1FSu6Xvz1l0mHVTvFTtjONsay2OS
 q6pmSvbUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACZSOp3hf57brSnLdWznaZt/
 VjXienpp2Q2HkCnVj5+FXDa4G9HrPIWRob363M6NP8xKju40Zp5WMvOvZt+vmxc+vViYvc6VuXn qGX4A
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261111115303.3749380-13-ardb+git@google.com>
Subject: [PATCH 4/7] arm64: dts: qcom: c630: Use the idle states from the ACPI tables
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Commit 07db10de262f ("arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower
PSCI cluster idle") dropped bit 14 from the PSCI suspend parameter of the
cluster idle state, as the C630 would occasionally reset with the sdm845
default. However, the firmware refuses the resulting value of 0x41008244:
the cluster power domain is never entered, in EL1 or EL2, and the last CPU
of the cluster keeps retrying instead, including during suspend to idle.

In EL2, the firmware accepts the sdm845 default of 0x4100c244. However,
besides powering down the cluster, this state also puts the rest of the
SoC to sleep (LLCC off, AOSS sleep), and entering it at runtime while the
display is off, e.g., right after locking the screen, makes the C630
reset.

The _LPI objects in the C630's DSDT describe the states that Windows uses:
on top of CPU state C4 (0x40000004), the cluster container has
L3Cluster.D4 (0x40) at level 0x01000000, and the system container has
platform.F2 (0xc300). So use L3Cluster.D4, i.e., 0x41000044, which only
powers down the cluster and its L3 cache, as the cluster idle state.

Add platform.F2, i.e., 0x4100c344, as a second, deeper cluster idle state,
which lets the SoC reach AOSS sleep and CX collapse during suspend to idle.
It differs from the sdm845 default in bits 11:8, which are 3 rather than
2, like in the corresponding states of newer SoCs and of the sc8180x and
sc8280xp WoA platforms. Give it a minimum residency of about 71 minutes
to keep the runtime governor away from it: suspend to idle always picks
the deepest state that satisfies the CPU wakeup latency QoS constraint,
regardless of its residency.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 25 +++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 0645ab429177..3e4df4335be8 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -37,6 +37,24 @@ aliases {
 		serial1 = &uart6;
 	};
 
+	cpus {
+		domain-idle-states {
+			/*
+			 * platform.F2 on top of L3Cluster.D4 from the ACPI tables,
+			 * which also lets the rest of the SoC sleep. Suspend to idle
+			 * picks the deepest state regardless of its residency, so
+			 * use one that keeps the runtime governor away from it.
+			 */
+			cluster_sleep_1: cluster-sleep-1 {
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x4100c344>;
+				entry-latency-us = <3263>;
+				exit-latency-us = <6562>;
+				min-residency-us = <0xffffffff>;
+			};
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -340,8 +358,13 @@ &cdsp_pas {
 	status = "okay";
 };
 
+&cluster_pd {
+	domain-idle-states = <&cluster_sleep_0>, <&cluster_sleep_1>;
+};
+
+/* L3Cluster.D4 from the ACPI tables: powers down the cluster and its L3 */
 &cluster_sleep_0 {
-	arm,psci-suspend-param = <0x41008244>;
+	arm,psci-suspend-param = <0x41000044>;
 };
 
 &gcc {
-- 
2.56.0.611.g1030f0b940-goog

