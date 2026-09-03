Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0081832142B
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 01:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788400479; cv=none; b=vCjE3CHhozoUQVRnuM5LjSTpPxo8jqmdxNOdJt7H+YyLrAdAbOibp29jJ3byb4bGhsJruV/NkDiNSkOtxSTojPJQOL97WFb5jY9YXO8UR8zaJNKFlsb30RIKI6vFUQECQWAQlJxY48eKMuhJbStVLcfB9OwFBmRlOKOt0nbGhho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788400479; c=relaxed/simple;
	bh=wedRPiAO/DhYjzS65XL5l3RIbBJTHI5WnzKxvRx2w6M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aed2NgHyjt6RptBAWiq2N9ScErLxG04yvmbLZq/+iV7qWZ4+RrNNmsT7HKYxeLGJx5jxvAtK9uCKKrljsGbZTNf+17HcGCkR1tZ7UWnKAYIwtWfCJCpedutuvNDercmXTpcGOYu3V7Sv0c9pg2Pi4ywdObHpCl90JtsPctjAUME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mrungta.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rr7trrTp; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mrungta.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rr7trrTp"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so3123199a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 18:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788400477; x=1789005277; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0gERcKiJvkri4DmMi/VqLqHTF/JjRCW5D7m7rLo+8Tk=;
        b=Rr7trrTpEa5AALTc0Y64Q1swCFPhDAt+kwgufDkpkQKv4IQdBr8u8fdS5p153h6CsY
         wLySNri11D2XbKC0436e53m74JS3yAiq8M6QnICh4BCFGwAq3BIBf16ySxGSdNf45ed/
         ZX6THRldnyhhIRAl8a73mxpHP529aqqhBHlmvI98Ye/UbIL5pqxlKG/JJwxiNy13g3fM
         iJkR8v7wV7yOp6j0QItNtlhKZetXIHpUQjG7tdqpb+iaEqQ2KFPoCK2SGdOHolwZ5CYK
         vvRtsFmBllThmsWuqXB1ZZeXGXFZcckxovAEHL3ewMBFHuaIQe3CMaBKvwTowLJOdLFD
         wn0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788400477; x=1789005277;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0gERcKiJvkri4DmMi/VqLqHTF/JjRCW5D7m7rLo+8Tk=;
        b=QH+ALP2QVkoGZ00/vM9/OkgMuyolJJ6ekhl8qTLdNBXY9Q68fh8epfbOtNPhP3rw3m
         TzsuuKmqlh46ldkOnscaNojSv0ey+hUZQd9YsHkheml3FArDrfTG06DHKXH/MYZkPQJX
         wyOgmEK5Ikw9QtCa2EXgETTH88tqXl+g8uETbiULM+wXduAR2nF6s56s2KTonx5rko4d
         FH8mAHE9CAatv6YgcmKBa7bQoS4N+Lhe8lxvrW7pVz1olvy5GjRy6C/rBf1Q+eerk0ZD
         9uhDZZiLGV9jyTm+mz+G8ofhyvXBD5wLESL5i+xlGXPItrDulU7wkZEeHiImuVvO1gXO
         Dq3w==
X-Forwarded-Encrypted: i=1; AKwUvBwY9ctgekCWuAt25LbMzbbOiAE7QEvaqQljyi4YgLHlltBaELyRtwx2sdmIWfRdShrY9RwYv3eCqeid0UM/@vger.kernel.org
X-Gm-Message-State: AFuF++mutQdjNg/+JZqG4TDWy0yJxtVOLTiznW73hdsuN59btQQvZHBG
	cHxwMmqeCwIZCtiIriireqs9BER6Q3F8Zw3yqOc/nf3sOW/JRr44RYdtmL84W4jaydXcXoOT79d
	NX93onJlH7w==
X-Received: from dltt19.prod.google.com ([2002:a05:701a:c973:b0:141:37f6:f90a])
 (user=mrungta job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2750:b0:398:e73e:5a0c
 with SMTP id 98e67ed59e1d1-39aedf5d887mr13782819a91.1.1788400477127; Wed, 02
 Sep 2026 18:54:37 -0700 (PDT)
Date: Wed, 02 Sep 2026 18:54:19 -0700
In-Reply-To: <20260902-qcom-wdt-nmi-series-v3-0-f3999362a9ea@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902-qcom-wdt-nmi-series-v3-0-f3999362a9ea@google.com>
X-Developer-Key: i=mrungta@google.com; a=ed25519; pk=2Bjwbv/ibL10QnyvK9G7DoKpffXy7z6+M4NawEYgYDI=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788400471; l=1942;
 i=mrungta@google.com; s=20260212; h=from:subject:message-id;
 bh=wedRPiAO/DhYjzS65XL5l3RIbBJTHI5WnzKxvRx2w6M=; b=Bk+0b9J+Ip6aLIdap95wpcVo+WSJNhfEkYqvG9iufWjfAIILdJI9E93ZPSzsVW9AKSzT0G3JG
 AQrXvjsTwEpDpuE0LB53ta58tWomN/xbNxv2UYqa6QC1ZNos5kXoTtw
X-Mailer: b4 0.14.3
Message-ID: <20260902-qcom-wdt-nmi-series-v3-2-f3999362a9ea@google.com>
Subject: [PATCH v3 2/5] genirq: Implement synchronous disable_nmi()
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
Reviewed-by: Douglas Anderson <dianders@chromium.org>
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
index a9973b61163a..009633b5b654 100644
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
2.55.0.970.g62bdec98f9-goog

