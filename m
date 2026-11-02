Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627824;
	b=oCqH2xIsbv53DeN1T0nBomLNrsP+gQXejsFYwkZp9RhAskSqqTnlFNDqAwZOv4Pgj+nW
	 ZZCHhG9W2xfSoF1viVD0TDniu08+XlymV5u8JRO3f2SaYoMcVLwjs9Q+Te4GO3J7AysUD
	 bqB8AYSePMw3/tzmmqU86nmAPBHaFXUGJIRdXXSSagAamwAf4V2aqLQSCZ+OmMNJoVxsS
	 i7KEFLgvldxdAWIsETI3R0FpBtK6pAL6bKE1E+OYXVAa7vGjLyGVKC+UFiOOeRTLQRidw
	 J9BJvYeEugGuM2XLeiRgaHwwJX7QYvtDPj8uub5PDlmC+pGUTTdZaUBqukaGCvronNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=aiIeR3alBrog5cELvWkVvv/B3sd0ft76xr4SIvuC2Ug=;
	b=0y4YCSTMX1Sc5zfqy3MMCxITrEHJ75sHxNmKx53t+VSGWuH4axKIL3CkHa+7aDXyLkzA
	 QyaE4IJXxcUiUaKmlH/AfukaW3EjKpw3IuvErV7tu0Rxz5qt46JzHmdUr06xrI7aWNkLS
	 SJVud3t7t6mxf9YaOavQTVHdOZf0sy55wrLfU++0Xq9PzM7abe3009O/D9ANa9bhn3H9B
	 jjtooKeMyS/vtMPAkvt5spT8l9T0LNCA8jlLhWRo5N/kNlOPytkJ5EpOZCgvciP7gSqQu
	 rKfRw7w9Wg7s535SdYwou57ZsmDn6GO6rdU+/mHPYb5nLTZ2WOha+/bLjDDxXZ/JWVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qh5hrq8A;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31FA60A3808
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 13:57:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A31FA60A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qh5hrq8A
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso21206285e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 05:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793627822; x=1794232622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aiIeR3alBrog5cELvWkVvv/B3sd0ft76xr4SIvuC2Ug=;
        b=qh5hrq8ATk2xevegmYrJJe/V3SZi+adLjiCL067pCp86DV+2uw6V49Hawh225VpKUx
         PAFz0T3i8OredE4nceP0qjiYQk3Zk92QrpI2Yx8OJg3ubhgGqv3kkue9gxvfUkFkWKY3
         C4Nno2ToGmNq6dIT9jciXm7gH2kbyLq5MDBgVeF/qX3GbC/3d1lRphylu5r9tz8Ju9eM
         Gap3+TQv0JcMrwi7lhlQQxhbdg1RlqPfiXUv75gJQ07tezDWQ5SCEpBaZRuIjNxvlru+
         AVlTIIEiTyEm9VpjB07YeWp7KiD5EAmy5pe3/EEiv+hTZIFD4Cqxzew9wo4k2sA3Ja3x
         b40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627822; x=1794232622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aiIeR3alBrog5cELvWkVvv/B3sd0ft76xr4SIvuC2Ug=;
        b=fFuL70L57YgorIcaTeVS+4vYGQLtvUhdrEdYCtXpw6pMjtFX0ofssFybQmcJDg7hQJ
         1azXLRThI0fu8yMcSGdpfOmF9A5//Iga7I5ArBulRor283YKkDwgFYXX08WlqUBHmOcX
         Xe7rY0vRPUNXhuABTOD9Gh+Ucy3GZm5+7V0kwFK5xhQqHGKq/xO/jC2kD8p7tzG1WI+0
         ExzRY2yt7pp3SEgwpZ6f9SsNtQc4oJVjHn9sTDbGAr0vmx0l4fYdhdmemW0hsrTS+EiD
         9P/Z/G2LBmrq1bVF6Ix0011PuhWJSG/cwoT5zpM1+Vp7KqWB75p+JqfMFEIHPfuhafGu
         rb2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzPtwVh/BrvovnjOuQqqZH/F21HBL5Jl4MZcAk2usf8qahuDwybg+h0IpwYNnVdlX8QYID75YV6rQwX1gTi@vger.kernel.org
X-Gm-Message-State: AFq9FYI4nYA8IWtNHjgN5XqekvhwQllDGwmsSNjTXp4htr4TjL9xlyDB
	2CrRuHy3Vy8lNdlH7IRe8z0gFHEC2rArje1EsKnQOpbHAJ5DZ3mSGkD2JCZVmAEN4u8=
X-Gm-Gg: AYBFou09qzGJPzBhQgORpU4J6qbPXsfomKqkccCo+EG3ofI6eao2X2H+h4ogTLmXszW
	KCG76cHB8TqA+ti47PC79ZaWuya2ZJQLmlt2Azs0BYtu2Q7LHzxP9gwBs1KzQrrGXQwQHbfv15F
	1bA1N0e8i6uI6+tZtYShdxojMirYd7ZZhqKx4wH2lb5SU5QHfUcEwrTW9icrFiBwgwGsfOj/UW9
	8fHQMF5dCFTn83/B9Fi5Kjb5THJNp+QoAi821rIGstCFPZdV/gjbO1ZhMX037m4bRb5jWzC3vog
	o1LS5tne6uX6gUN90iYoZowCz9IcUl/2Wdlx8oME+Ifq1U/XP0P0Ogxbyvw9fMmAfrlZmHoyZn1
	QexERkFxkGx6OUMoXQcllE4NpWg1/fZHrXzfSNWDNyuLk2/24zuBg0+35v0e+kSVweir6SMGLfr
	kbR9fRBk2fj0xAlJ18WLBez4r+h5GEJXUhYcCbLV12H8+IGFDixC+561hCbgJWqiQWpaq4pjHlj
	nNYrqUWbY5TW/xAedK/TIsDfR/4Imk/kpumqGuaDL1d3dpRQ7LdFunNzpGJ5lu/m5SIetjdnygo
	zTGAQQrZTAg33PKvHnrammwcIj7UEs4f/h+dnPg=
X-Received: by 2002:a05:600c:3b8f:b0:4a6:42cc:bf66 with SMTP id 5b1f17b1804b1-4ac16acfdd5mr241592915e9.11.1793627821995;
        Mon, 02 Nov 2026 05:57:01 -0800 (PST)
Received: from [127.0.0.1] ([64.43.42.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe77053fesm126145375e9.0.2026.11.02.05.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:57:01 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Mon, 02 Nov 2026 13:56:50 +0000
Subject: [PATCH v2 4/9] media: qcom: camss: csid-gen3: Enable RDI SOF
 driving
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-v4l2-frame-sync-v2-4-25cbed7a772f@kernel.org>
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
In-Reply-To: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2593; i=bod@kernel.org;
 h=from:subject:message-id; bh=9Su/hrp4xXNhLORySBV74mmMzNRxA4TivC+heqLtS6U=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq6Jalz9XQqKDvt0dR0lQ7lPSaYS37WBDsZAvqv
 MK6PK5/8WmJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauiWpQAKCRAicTuzoY3I
 Ots8D/922kQlxHfwFZkbSTpEPLuETpxaOpt/qs/eYXUxVdAL0YuRvrqkX8CdEPIJzUXNUQSnPgz
 zkdUUqKV1DZkhRSS7eKOOfqFWOB+Kq8Wt8aZQK3OuLqVcPDxQxMMVO1J2FnkSVTT4ltdBddmQbO
 5HYYigYviM4zK7kno8nQj2OLGdQ5Npm9NezE99niA1gkW4sPhfGCEkHQq8lRXtmAuc8IE1xmJhA
 JXCQ3Ir+5ynSmsuF012mfJ3Wii8qwF/xhnkR82JMLTU9GZ2drtHvHWFh/Ga7T63uXQkBf5vzzCG
 ayApNVHf23to/7jHqzW3hl0l5pwBbiQUZl22dbCsu3rSlA++zltBr91OvntFFb0mDb56FX4xKlR
 rQYjupgCsrdb8WqOvMBhXBXxmxTpvUBxxASYY0hxG2eCWyo2w9HDbGn/xg+Tg1E8eanddVxBr1Q
 9uQ15RPXNdzUdqRM4Dwo8uVtl9wtJGI5mmuCyDdb+bERSJD6FE1qmE+5MFb+ZOIfOG9xw3TaZ9x
 LhwigVpajL1zRPgaEfKnNZbyrHXQ8V+ZVbBt5IdH6XpTELd3H1k0ug/oyp1H9uUsLgJ4sC5mk3j
 SwbDWVmtDVmFX1v7m3Xa26y7dN/vegjF93ZvY/B2ajulPNizZYmaR/1Ss2OYv4mHNqhdoNdmqux
 o3a/NNgOjgdh2ow==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Add in silicon enabling code to generate SOF and trigger the routine which
produces V4L2_EVENT_FRAME_SYNC based on SOF per standard v4l2 behaviour.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../media/platform/qcom/camss/camss-csid-gen3.c    | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 0fdbf75fb27db..6a538d825f78b 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -34,6 +34,7 @@
 #define		CSID_RUP_AUP_RDI(rdi)		((BIT(4) | BIT(20)) << (rdi))
 
 #define CSID_TOP_IRQ_STATUS		0x7C
+#define		TOP_IRQ_RDI(rdi)		BIT(8 + (rdi))
 #define		 TOP_IRQ_STATUS_RESET_DONE	BIT(0)
 
 #define CSID_TOP_IRQ_MASK		0x80
@@ -58,6 +59,9 @@
 #define CSID_CSI2_RDIN_IRQ_STATUS(rdi)	(0xEC + 0x10 * (rdi))
 #define		RUP_DONE_IRQ_STATUS		BIT(23)
 
+#define CSID_CSI2_RDIN_IRQ_MASK(rdi)	(0xF0 + 0x10 * (rdi))
+#define		INFO_INPUT_SOF_IRQ		BIT(12)
+
 #define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)	(0xF4 + 0x10 * (rdi))
 #define CSID_CSI2_RDIN_IRQ_SET(rdi)	(0xF8 + 0x10 * (rdi))
 
@@ -219,6 +223,25 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	writel(val, csid->base + CSID_RDI_CFG0(port));
 }
 
+static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable, u8 rdi)
+{
+	u32 val = 0;
+
+	if (enable)
+		val = INFO_INPUT_SOF_IRQ;
+
+	writel(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
+
+	val = readl(csid->base + CSID_TOP_IRQ_MASK);
+
+	if (enable)
+		val |= TOP_IRQ_RDI(rdi);
+	else
+		val &= ~TOP_IRQ_RDI(rdi);
+
+	writel(val, csid->base + CSID_TOP_IRQ_MASK);
+}
+
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
 {
 	u8 i;
@@ -230,6 +253,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 		if (csid->phy.en_vc & BIT(i)) {
 			__csid_configure_rdi_stream(csid, enable, i, 0);
 			__csid_configure_rx(csid, &csid->phy, 0);
+			__csid_configure_rdi_irq(csid, enable, i);
 			__csid_ctrl_rdi(csid, enable, i);
 		}
 }
@@ -279,6 +303,9 @@ static irqreturn_t csid_isr(int irq, void *dev)
 			val = readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
 			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
 
+			if (val & INFO_INPUT_SOF_IRQ)
+				csid_sof_event(csid, i);
+
 			if (val & RUP_DONE_IRQ_STATUS)
 				/* clear the reg update bit */
 				csid_subdev_reg_update(csid, i, true);

-- 
2.56.0

