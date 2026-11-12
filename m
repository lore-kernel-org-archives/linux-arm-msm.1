Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794453408;
	b=zJ/g5PyQXRCyZmzJQex5PkhcJAyw7meATBZO7ayW5BfTPQm4qrkQuQq0F8xYPCrrICFJ
	 dDxlcckjoQvyfwbcMVjjbPfdfkVfjoSFJV4qO3UMUW1KqcMCZ7YCNJOMjqwBq9otrlSkX
	 Hl2d9AdcEKvnjiuO3J3c6YBfmCbjslF7aVs4s1xYBMGP2ez+lMoMgpjWG7DmV4w3QvLU7
	 U3NcRswpxrJbwhyDRZ3kOlCCwerFMYASBTehEVrwEoocGtDOepmoWPXw6htGwwAD8A8Pz
	 s6ubiXpqeLhDLipNnqV8OiWqRiYUChTKn1uhidf5p9mKdicQ/LqvvONbDxSGi9jypYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794453408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=lZW+gmoGRsyxzo4WZhRv/r2tVUKs5H5gx3c1REXho3A=;
	b=HrCapKeFa9iePNFsVcjJwUMBnTFoh0V54vmLM4jENo+JwmHfpudyoa96bB3PTP+r14BV
	 69vx/o1r48n2SbJ0Gg4suoCbDPGnQtoOLqfx4DuPAE21EpwgPcar3rs3muKevESCE/yUN
	 zuPZ9RzuQKhUYeNHG/FJiU4MFKiShagLUcU/KNmBjskcbqpy45R3wFqjA/SxbKqErjp9m
	 tS1jfS8pgOwwVPcyekwzN75QMDAuhIruEujjk1MplMvCKGZLEJg96biIHWvyNRpmeTuTo
	 pKmGkDS5MpnWzNNqL9fA6zoPlTQZrrJ2vpphTxG89LHPBvDmUkSE8qswNfHihVQhywg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--mrungta.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Igj2c8PD;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F3860A2638
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 03:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20F3860A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mrungta.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Igj2c8PD
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3ae17c536so4044735c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 19:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794453407; x=1795058207; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lZW+gmoGRsyxzo4WZhRv/r2tVUKs5H5gx3c1REXho3A=;
        b=Igj2c8PDGnbRQ8aKkyOza4Np51eZ1P5nFTI2410sbp5Wpp4Bl8cwoZesVfxexAUm15
         FEZdQnX8dk+v1HuPbhnD0hmIzATEhlqIWjZWEWA0RB03VQRuamkbUWcxY0b0+4d5rWXZ
         NdWHwucMlXp+NC5/iXiqwYkJrUHLd/N32DKxDTQvnpwHcLSZoTBGi5lQZ2sCmFlc0DFy
         unAhYSE7xF3t+PkmzejDx4YRsVXo6tfsw2CNryR9zbwqarP6jLxr6ICM8STNakp2peJ6
         vqkXNwe5M/EaEsZBjfyXbeHoQAY+ZSgAms2izP/zx7ltU0VuictFg3LKnhXnfsfBYhLV
         koug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794453407; x=1795058207;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lZW+gmoGRsyxzo4WZhRv/r2tVUKs5H5gx3c1REXho3A=;
        b=xSjhmTDoeNSVXkgxl3+gput1CYR8KfX7oAfGf39ZGp0VgWwETUrTDCq6Qm6su3WbIU
         fJzyLpjYk/6nbFpKx1ahm+qDmaR+l37iIURXp7OaXf9qLeJ9djGIK2HH15euJ0v54UT2
         yFQ+sfcnNlTv7oX47080KTRGZIEwzhNHFHryGRdHqe2XZqrI7VIuWElvbKejxgYKfxi6
         93+VR+ovgK7VXhVJwJGymWLMLrtYg1fFJXxKEKRWOOMwHibeFA+q1O3iubDHksg+s4n8
         OPXLI18xHj6TQS8hQeqiD8e6kmgO2zcrrs3C06unLNv/tziVHbfVeIkZErmAd/sOwNl3
         1yPw==
X-Forwarded-Encrypted: i=1; AL+hErEf3XIX9YfcTug5+XWnv/NnBW3uei9EREQ/eRcEo+EXVA/8HijZEFj1yqZJ+Z34DUC1eQukrzQMdhmz0Su+@vger.kernel.org
X-Gm-Message-State: APuU4Z/yvEpQ4TbIh7xmETzWSTQyTHSGfSmy5HHVbuVJcFFctK8DNjzU
	ZsUW9sQmUyh8v7K9sRHmBN9iMhU9ALsKJ5axftjtP/9yW+NMw8KHwELV8vT7Py+4wZZ5ATG286Y
	kVMi0DweFCw==
X-Received: from dlbsn14.prod.google.com ([2002:a05:7022:b90e:b0:1b2:450f:bfdf])
 (user=mrungta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7023:a4c:b0:1b2:6d3f:6305
 with SMTP id a92af1059eb24-1b3c023d80dmr3948812c88.1.1794453406916; Wed, 11
 Nov 2026 19:16:46 -0800 (PST)
Date: Wed, 11 Nov 2026 19:16:29 -0800
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
Message-ID: <20261112031629.396819-8-mrungta@google.com>
Subject: [PATCH v4 7/7] watchdog: qcom: Register pretimeout interrupt as NMI
From: Mayank Rungta <mrungta@google.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: Marc Zyngier <maz@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, "Kirill A . Shutemov" <kas@kernel.org>, 
	Douglas Anderson <dianders@chromium.org>, Mayank Rungta <mrungta@google.com>
Content-Type: text/plain; charset="UTF-8"

When a system is completely unresponsive due to an interrupt storm or
deadlocked CPU cores with standard interrupts disabled, a standard
watchdog pretimeout bark interrupt will fail to execute, preventing the
pretimeout governor from capturing CPU backtraces before the hardware
reset bite.

Attempt to request the Qualcomm watchdog pretimeout bark interrupt as an
NMI (or pseudo-NMI) using request_nmi(). If NMI registration is not
supported on the platform (e.g. pseudo-NMIs are disabled), gracefully
fall back to a standard interrupt via devm_request_irq().

When NMI is used, enable the NMI during probe to balance IRQF_NO_AUTOEN
and register a devres cleanup action to disable and free the NMI upon
driver unbind.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Mayank Rungta <mrungta@google.com>
---
 drivers/watchdog/qcom-wdt.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index 4eb1bf979012..4a99cf43c4e1 100644
--- a/drivers/watchdog/qcom-wdt.c
+++ b/drivers/watchdog/qcom-wdt.c
@@ -52,6 +52,7 @@ struct qcom_wdt {
 	unsigned long		rate;
 	void __iomem		*base;
 	const u32		*layout;
+	int			irq;
 };
 
 static void __iomem *wdt_addr(struct qcom_wdt *wdt, enum wdt_reg reg)
@@ -74,6 +75,14 @@ static irqreturn_t qcom_wdt_isr(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
+static void qcom_wdt_free_nmi(void *arg)
+{
+	struct qcom_wdt *wdt = arg;
+
+	disable_nmi(wdt->irq);
+	free_nmi(wdt->irq, &wdt->wdd);
+}
+
 static int qcom_wdt_start(struct watchdog_device *wdd)
 {
 	struct qcom_wdt *wdt = to_qcom_wdt(wdd);
@@ -311,10 +320,23 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 		if (irq < 0 && irq != -ENXIO)
 			return irq;
 		if (irq > 0) {
-			ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
-					       "wdt_bark", &wdt->wdd);
-			if (ret)
-				return ret;
+			wdt->irq = irq;
+
+			ret = request_nmi(irq, qcom_wdt_isr, IRQF_NO_AUTOEN,
+					  "wdt_bark", &wdt->wdd);
+			if (ret) {
+				/* Fallback to normal interrupt if NMI not supported */
+				ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
+						       "wdt_bark", &wdt->wdd);
+				if (ret)
+					return ret;
+			} else {
+				enable_nmi(irq);
+				ret = devm_add_action_or_reset(dev, qcom_wdt_free_nmi,
+							       wdt);
+				if (ret)
+					return ret;
+			}
 
 			wdt->wdd.info = &qcom_wdt_pt_info;
 			wdt->wdd.pretimeout = 1;
-- 
2.56.0.611.g1030f0b940-goog

