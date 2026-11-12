Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794453398;
	b=EjG/eDVK39G2Pl8wF83B/uhAu4RT51j5OOdiTlsrgBpxpQwxhhIcMh4/quS6m9I1sJuF
	 0oRzIrnj9Vaq+JGk5jvzQCBcczeiWy2rvGY5f7HkPv8psdiH04ReYDN0e1k2rlCcum358
	 FE9sNVr7x/77BTS9KjLz1K1zDFAST/w7fn3m43C/VSSOMV0c9FF6TcWGvhN10Un3Akqt2
	 KzeGwEQWimK8hdIGuZ/c6xLaGpn1izZQst10nGCed7rJk3Oykb9zjZX1ilhCI833dTK21
	 3GLr6FG3Ap2vfLlkNqLAc6RECsY1CF4hIbuiU/6rMsM2Og+Il/m+qkHXTyaQTXJvFtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794453398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ddRQginrThQgj4nnc9G2rYqF4a54eNqys3J2p7naBLw=;
	b=zkd+H5vJHOViRVcwuFhedXg/PfKG4aEK1FZicC/cKajWwZghubunIZPjjI9/3w9Uc6EZ
	 ZspL4g5WKsU02U4blGdUu9kKOii3lzPgwuTHmVAXIwEIKmPjHkmV00tOJH5BwgFj8zzn3
	 FR1kjsuANvtsPUx1p799gwjtnRoaAXoVR38JVnqO6ctVOgKL5mXvkOxYg001PsDvpSXX8
	 rmcIFewchqQl/Z3NJtE7sFcExRnk0R/FIcRtq802mhsadww7pmMaXa+SEBqjCh9bfqCeM
	 CxtZP73EFWD9j74CvAGvYoicBoUhDJ/okVBlKimJYhy5VaY3KYIIKKRRiilER+y9MvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--mrungta.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HRp8aGHG;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04335606A888
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 03:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04335606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mrungta.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HRp8aGHG
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso6152283eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 19:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794453397; x=1795058197; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddRQginrThQgj4nnc9G2rYqF4a54eNqys3J2p7naBLw=;
        b=HRp8aGHG3i/zUXZgYZcozPi+RvF/MCbHk1NIEWzCJE8cI8ho6CmqDbNmO06BDEueOk
         0cRTadHFyZD7feerv+QI2T+TBlKBuqc6ub708Vc1734Rz6UCjhxKd4NNEUBCxDSwMU6B
         ujMXoww8G412RRkr6CfxxU6iOcq1NbPVU+kyqG2f+klB2VZqcrOns7TsZ+ZjfzvTsRAi
         xbxr1wtIE9lOoVeNzsFQA30H1KDE4a7V/Ab8pI0a/zckhdnuSu7pNUq8bDPuicSTjrl8
         43TWEw3NBV74WvTk9/zpttl0mNdZFit6OpZe4n2PjvKvl8ahtY0ax5kNx1Nh8Z8VZoJS
         9FVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794453397; x=1795058197;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ddRQginrThQgj4nnc9G2rYqF4a54eNqys3J2p7naBLw=;
        b=uNXf8BsyYEmvlvF65Q57dcFddzx7+A76AoS3RAX6tcfkpdiSGbFOYer1rVM4dtnB8y
         i1siIp6GB+qSuDdLe4Ze8+yBCjyRNaZA0uPb2ogkSF7SLgsEGpKUJS/+1nifI50Xuc1N
         5ArUh37MVaOmd/Wya+2s9W7Xumgma+bIQ+QicGKZQZiraiEFpHVzgilAnWdFREgqtfgI
         eKgP7OzR0qzYOz0iMbiaLn5JWlRymb4TZUlyv4H6s51jVArWELR5yL+3LR5LEcuecj1y
         xQ8NCSHN8SRYciIHSeEhW8meXWvSxmwbZVAdfb/Y+MKCvm1J2XWn+J6VVPPflRsbejJi
         mCpw==
X-Forwarded-Encrypted: i=1; AL+hErHsckGlTGG/rG8De6m1pg8qXjrAvI7skmWgt8VPn45XugrZAihXZf7hFcD5hfzT42QikSNlkfI13Ea5WQTl@vger.kernel.org
X-Gm-Message-State: APuU4Z/RNKJopiJfhfm5+oum0+tD501DheETFshzY6KGSlq/1fU7MnBy
	iP0oJoZ/lCIW6vZhDuO/u4t27AmhsqosUO4+DG/8fU4LVaYYPZhcUZtHdgvHq28E8h/yRqKpZVd
	LEgKoH37wMw==
X-Received: from dycqz3.prod.google.com ([2002:a05:7301:df43:b0:360:7b4:106a])
 (user=mrungta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:d18f:b0:366:703c:5ef8
 with SMTP id 5a478bee46e88-376850cefb9mr4096627eec.7.1794453396787; Wed, 11
 Nov 2026 19:16:36 -0800 (PST)
Date: Wed, 11 Nov 2026 19:16:24 -0800
In-Reply-To: <20261112031629.396819-1-mrungta@google.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261112031629.396819-1-mrungta@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261112031629.396819-3-mrungta@google.com>
Subject: [PATCH v4 2/7] genirq: Allow global interrupts in request_nmi()
From: Mayank Rungta <mrungta@google.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: Marc Zyngier <maz@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, "Kirill A . Shutemov" <kas@kernel.org>, 
	Douglas Anderson <dianders@chromium.org>, Mayank Rungta <mrungta@google.com>
Content-Type: text/plain; charset="UTF-8"

request_nmi() currently requires IRQF_PERCPU and forces
IRQF_NOBALANCING. For global system-wide interrupts (such as watchdog
pretimeout SPIs), forcing IRQF_PERCPU sets IRQD_PER_CPU and prevents CPU
hotplug teardown (migrate_one_irq()) from migrating the interrupt off an
offline CPU.

Now that in-flight NMI handlers are synchronized via
__synchronize_nmi(), drop the mandatory IRQF_PERCPU check and stop
forcing IRQF_NOBALANCING in request_nmi() (existing per-CPU callers
already pass both flags explicitly). Also check irq_is_nmi(desc) in
irq_seq_show() (matching kstat_irqs_desc() from commit c09cb1293523
("genirq: Update irq stats from NMI handlers")) so /proc/interrupts
emits per-CPU counts for non-IRQF_PERCPU NMIs.

Signed-off-by: Mayank Rungta <mrungta@google.com>
---
 kernel/irq/manage.c | 9 +++------
 kernel/irq/proc.c   | 6 ++++--
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 3fb77a2d954d..bd7cf91719d7 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -2352,8 +2352,8 @@ EXPORT_SYMBOL_GPL(request_any_context_irq);
  * An interrupt line delivering NMIs cannot be shared and IRQ handling
  * cannot be threaded.
  *
- * Interrupt lines requested for NMI delivering must produce per cpu
- * interrupts and have auto enabling setting disabled.
+ * Interrupt lines requested for NMI delivering must have auto enabling
+ * setting disabled.
  *
  * @dev_id must be globally unique. Normally the address of the device data
  * structure is used as the cookie. Since the handler receives this value
@@ -2376,9 +2376,6 @@ int request_nmi(unsigned int irq, irq_handler_t handler,
 	if (irqflags & (IRQF_SHARED | IRQF_COND_SUSPEND | IRQF_IRQPOLL))
 		return -EINVAL;
 
-	if (!(irqflags & IRQF_PERCPU))
-		return -EINVAL;
-
 	if (!handler)
 		return -EINVAL;
 
@@ -2396,7 +2393,7 @@ int request_nmi(unsigned int irq, irq_handler_t handler,
 		return -ENOMEM;
 
 	action->handler = handler;
-	action->flags = irqflags | IRQF_NO_THREAD | IRQF_NOBALANCING;
+	action->flags = irqflags | IRQF_NO_THREAD;
 	action->name = name;
 	action->dev_id = dev_id;
 
diff --git a/kernel/irq/proc.c b/kernel/irq/proc.c
index 0c0df16de581..d92f456191e1 100644
--- a/kernel/irq/proc.c
+++ b/kernel/irq/proc.c
@@ -559,10 +559,12 @@ static int irq_seq_show(struct seq_file *p, void *v)
 	seq_putc(p, ':');
 
 	/*
-	 * Always output per CPU interrupts. Output device interrupts only when
-	 * desc::tot_count is not zero.
+	 * Always output per CPU and NMI interrupts, as NMI handlers only
+	 * update per-CPU kstat counters and leave desc::tot_count zero.
+	 * Output other device interrupts only when desc::tot_count is not zero.
 	 */
 	if (irq_settings_is_per_cpu(desc) || irq_settings_is_per_cpu_devid(desc) ||
+	    irq_is_nmi(desc) ||
 	    data_race(desc->tot_count))
 		irq_proc_emit_counts(p, &desc->kstat_irqs->cnt);
 	else
-- 
2.56.0.611.g1030f0b940-goog

