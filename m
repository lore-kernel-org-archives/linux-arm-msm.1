Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A402B361675
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Aug 2026 01:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787965227; cv=none; b=Sfs2/5K41VSPsJpcPRtqjBHLQ1vPRxqKSdgtr3lFfcWAr583F9uxZb8X38p4FowE6VzxLQ2XP/9SuwqFSVSqUUmgUW2rTuAFO77qfCwe9Y1HnqSMDG+iPQRehj40Ho7/98ti+SOSptJfrwG4U7AcWxSxemhyEYRF443dAOu9svQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787965227; c=relaxed/simple;
	bh=YEjOxh3abV9nYYZexFyLXeBBibH2C1bqXkH2TfSE2G0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=m6a957o3k3wAy7IUxt11LaVsfYKEFOH27VGu4f+BVqTXnGuDoRqLQtN0KrUTccmhWHKWmdkm7W7mKzaeZaGsSazzs8Iy8JBKHje/bhew00IhSr/69hpuIatEIPPgiN/yf7scZbD7vWMT5L7hSkHVKLb5q7gslfA+J/rtTEnk1hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mrungta.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ihBTkcbf; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mrungta.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ihBTkcbf"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6c166bafcso20881105ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 18:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787965225; x=1788570025; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ffPiTixVm2rFGoJCgY8dBo6+b5XD1+apcgvg2E1whV4=;
        b=ihBTkcbfhnHkUoWi4L95f1UsVPVIVnq7DrfnSCIFd34e2Edmpulot0rAR16WhXdNvp
         ftlxOBE4a+emWAyO9bVGztmOlCyQINN/e1/SEodG37WicfZMmknVn/cPukSEcXiSRIVo
         QuHnULvlnGHhm/flf85U7QnEJ6X2N7WBhQCicDA/dOZeTpPFcZGFZsUjQ7qc+fqvig/e
         jjtg923laeP+ZKuG7JhVJXwQ0SXC2Pd7XXOueZy7pw3FkjSO3/Xw90DpOZXm4quy/bcr
         qD7OauL6SyA3UhQqQFK9yBPPF1RBDXRCB8B9ro7VX1lG3hjTPohaS6rxeSZdx9fn4HHz
         YX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787965225; x=1788570025;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ffPiTixVm2rFGoJCgY8dBo6+b5XD1+apcgvg2E1whV4=;
        b=jp6s2O3oIsT6N15C2e8hGxRJn3PjRysOP8pJpQWOfckwPxqQhAwwMHyfxBuZuPT7FO
         nU7/XgOEMbwC5Q9gY+ygFLXXUGJg06kAODg38eX3563JShDyJIGuNKUw2dtjMaiIRuIt
         kduKHMVurAL2K9NYCMSL7jk+Ye+o8q4baotA/xJnHmYo2JUeW+HucLj3/qZQbhVmXcwc
         jmzkQqTfQ+Kd06gFWLdR/wMUJ8yXLjkLtt4Jc2Sc9kml44wqlSAmrr+qkgYs98Pov8R4
         lLJPzbUXrbAf7o9cYcGzTbzrrpv70hDJLRbjQroaxHTHTscmJiGW8utjdqxV1er30vvK
         Tccg==
X-Forwarded-Encrypted: i=1; AHgh+RrIu0yLQb9Ypl06KUeyrTxTR2b07xbBjRQm8h30nQO0LCR5R6/SHG9GWDUwS/hkt8Jn2YCgLCYYx3sqOMVK@vger.kernel.org
X-Gm-Message-State: AFuF++mLwwOzyLKPsBZgzZ+tuPw9MB50wDre5I3fZGrBUS+QxgeoFSUs
	EGbnsN9n/bQodZxCIxGkdMZI3EK99YaFGhaIfxX4NDshJPxnlcR9IvzDpZmenhfsuYnTzT1UxII
	N1OQhtaNbjw==
X-Received: from dldyr20-n2.prod.google.com ([2002:a05:701b:4514:20b0:13f:c741:a50b])
 (user=mrungta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:4326:b0:3c4:3112:45
 with SMTP id adf61e73a8af0-3d3bf1583f5mr4114750637.1.1787965224379; Fri, 28
 Aug 2026 18:00:24 -0700 (PDT)
Date: Fri, 28 Aug 2026 17:59:56 -0700
In-Reply-To: <20260828-qcom-wdt-nmi-series-v2-0-363979fe6b6b@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260828-qcom-wdt-nmi-series-v2-0-363979fe6b6b@google.com>
X-Developer-Key: i=mrungta@google.com; a=ed25519; pk=2Bjwbv/ibL10QnyvK9G7DoKpffXy7z6+M4NawEYgYDI=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787965218; l=1887;
 i=mrungta@google.com; s=20260212; h=from:subject:message-id;
 bh=YEjOxh3abV9nYYZexFyLXeBBibH2C1bqXkH2TfSE2G0=; b=MqlBZa9OrFvnbU3ImY1iRbCpQUFfONMZGfbOxNY18pw74YyrjcchXgMwTR2uL+113EMHY5BGH
 kfYSKCrY/wpDgzdmEim6bAlxBtdA9MGkRJxoAdTGePXZ5OkarKEaRYh
X-Mailer: b4 0.14.3
Message-ID: <20260828-qcom-wdt-nmi-series-v2-2-363979fe6b6b@google.com>
Subject: [PATCH v2 2/5] genirq: Implement synchronous disable_nmi()
From: Mayank Rungta <mrungta@google.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, "Kirill A. Shutemov" <kas@kernel.org>, 
	Douglas Anderson <dianders@chromium.org>, Mayank Rungta <mrungta@google.com>
Content-Type: text/plain; charset="utf-8"

Currently, disable_nmi_nosync() is the only interface to disable an NMI
line. Drivers stopping their devices in process context need a synchronous
variant that guarantees any running instance of the NMI handler has
completed on other CPUs before returning.

Implement disable_nmi() by wrapping disable_irq().

Assisted-by: Antigravity:gemini
Signed-off-by: Mayank Rungta <mrungta@google.com>
---
 include/linux/interrupt.h |  1 +
 kernel/irq/manage.c       | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
index 3bf969ad8fe0..f13b3ab3829a 100644
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -243,6 +243,7 @@ DEFINE_LOCK_GUARD_1(disable_irq, int,
 		    disable_irq(*_T->lock), enable_irq(*_T->lock))
 
 extern void disable_nmi_nosync(unsigned int irq);
+extern void disable_nmi(unsigned int irq);
 extern void disable_percpu_nmi(unsigned int irq);
 extern void enable_nmi(unsigned int irq);
 extern void enable_percpu_nmi(unsigned int irq, unsigned int type);
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 61384925b921..40013aa94481 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -767,6 +767,21 @@ void disable_nmi_nosync(unsigned int irq)
 	disable_irq_nosync(irq);
 }
 
+/**
+ * disable_nmi - disable an nmi and wait for any pending handlers
+ * @irq: Interrupt to disable
+ *
+ * Disable the selected interrupt line. Disables and enables are nested.
+ *
+ * The interrupt to disable must have been requested through request_nmi.
+ * This function ensures existing instances of the NMI handler have
+ * completed before returning.
+ */
+void disable_nmi(unsigned int irq)
+{
+	disable_irq(irq);
+}
+
 void __enable_irq(struct irq_desc *desc)
 {
 	switch (desc->depth) {

-- 
2.55.0.897.gb25b4bd76c-goog

