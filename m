Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267735;
	b=VBFJmGBpkXiMh9UDgphHdeo905VG+v1HD7jQQW7gk5D2pqeWxgwIUt8Dykng5pMOLBmg
	 VflFsMHpUlc1YVfyBICcjb5t1D/Mf+7/yqWR+vHc+JnjoRyBoDCEk3mb6/lOhScGEaEmr
	 bi3lCnryW6q4dbafL/qnDAStSq6tLEQGHO0E3R/20TqLLxT+05LiYzdERX6miRktZsXjD
	 K5TLCxCGZHoPraIyFuUmrx3DTGzE0O/a9q0b6U0CER/nRSZd+ZXFvUuRl3Cn2aDuyGWBH
	 WElooinnrz1wwPbVN2emdBorC/XmRV/gBkP6AECJljzMk4bnlzYtoZhTD/tAcBQxoeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=aiIeR3alBrog5cELvWkVvv/B3sd0ft76xr4SIvuC2Ug=;
	b=BwCBBEoMBO+WNk9+2KyfogmlKu1u2I9j4t2zvS0v9yD4k6FZIx7XxAK0wUIMHq7HAhwv
	 P9ubMXbGN5rOGfortOPH9noISw+LT22w3MS5kHLJ0xvF9o00jV+3Yni7p7ksJf3P3OFsd
	 GhFQGSfDJ7ECKUSJXzxCnFAwr48DFVy5Yi5ah0DpqrNgqgRWCUfUSFW6DUMIq+bRr733O
	 J3k3ZkXXSgz7Y5L7YMAENDlFi9fJdTk3THhv/pp9wZZ31uD9P8In4cSXCPrsp+MReAkXP
	 S9obARta+w0VZ4eUgB33bxrJ9jstvFje/OgLHoqokTmWmXsEmfhZbGaAuIfON92Qk8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cXMMokD7;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D96E60A2606
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D96E60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cXMMokD7
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e0d885929so1463395f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 02:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793267733; x=1793872533; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aiIeR3alBrog5cELvWkVvv/B3sd0ft76xr4SIvuC2Ug=;
        b=cXMMokD7mcfeH2AOuFyhj0i48INDwHmpExWFbj34kef61T201rUWCq2egO+Sas0o+f
         IbjuT4ao0gRrDFYhPtmpQjB1sNw1HSYXAz3wcA544TJQ5rdmdFbVsb3c334NEtivWSqQ
         PJjW5bBltS5K7lu3GtUkjzQ/veIAyJtWbETp16cxoJlh/Fr1hi3SzZVbeW+pRZ7yyI/R
         OUPX39mT1Hl5TpmOc8sk1O6KOLPqblSthDbRRigoqLWe7bQ0zk65VnaNn9i6e/aEkdvo
         Hjfrvlaoz68GUGchC+Y05/0P6kayJumcN4TLYW10u8W6xOvTP4fPj5ZA1td3u7Cvd/9l
         1nxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267733; x=1793872533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aiIeR3alBrog5cELvWkVvv/B3sd0ft76xr4SIvuC2Ug=;
        b=J9W9qowkQdVZHJ7P7Mv8kHl6rZUGaX523j4r42GW/AAPkpLMIWWKGmjzzjX3WUfwoC
         DWmNoUBniVhbwEnhKcGVlWH8aZ6eQmN2jxs+PHV3Ckqgu0ubGFVmIY2SzvGqhzn9PSJS
         0mffFWkV9HCD954a5HBFVF2tjx9mYFe0QedPESfY8yeown6CpmX1M5jYgopAOgzhvvzB
         OVpaLEuU+3Vbiz8BLFN89k4ScPaxnCHhOz+0HR+uo6P3rSZ+EdV9JGx1rHw08ZnRQnN3
         H8SbHVnA9N0sXuv2xvRo+9Y0BxnUlXSqyB9rsjO7ZP9ydKpBZVvFGwbmXrCyFabgW+PE
         nnUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWE2o321yZH7HzPRYnO4Q/Jdpm/lmOtCD4yS3q0U/F/3ltu1d40V7xbIlZyuG2V+zAFyjiJjW33wXYdP0W@vger.kernel.org
X-Gm-Message-State: AFq9FYLkglS5QVui7FGx3+Js29qSeicGb9nInO3vDzwDmm5bIWi4gTTt
	C1FiTy2jROpUEaakNYxq81InIaRQKdx6JTD++1Vw/pKsJzsTyY6kQyxR6A862uVd5U6jmofgCMK
	1Jhn5
X-Gm-Gg: AYBFou311L2ablwo/o08UpfcugvC9LdbewTgq4C4mW0WzvfXZ6nx94HHw9unellbj7Z
	uEC3TEeuQLudi+TxohaMz7ay6FLVi4MhkDUnvL3suF1PB7EpX5qM8OFBt5qSiDzHlgSbW/M/hmX
	2iAhbNIrXhntRr87bMYbE5hDNG2ZS6Y0Nqx1g7DdT2S1S9fkbPQebpwHPGIz+T0Wb8TRY0IrpeV
	c22qAp7l+715Qam+y2YW4oSV54sPAgxh23F+iOLrH0UhN7p3PWFbm7QZsmm9OPo4lR0Gz0sYlYt
	x+E/ZBnAA+yC8Z8jxv2wfc6xOYMrgfH7HomsKMPyrVZZsi8zG5t089N2U7M4lIQtAWXMx6vAeON
	JHEAEYIfMMbWcDthPikreMtBPzblB1jC71r5nCu/3OQhBcOzT7FoIkaxJo6P8iPXdCayc7xjakE
	NT4iT7KIU5T8ScilVYTZ5qodrHeXgLmg9lrCbj5kYzu6nzcSrT4/22Pk+o4sqBLG+Vq8ZY39N37
	opocmY0WM7J54lDczR2CFMhkgiV/LM01t+unUV0fmDh0mUmPWYvyZKkkXM6ek6cZ2UCc3cwXZMQ
	rMu6n1e1+zYBpk6ebFA=
X-Received: by 2002:a05:6000:4a0f:b0:48e:64e3:e923 with SMTP id ffacd0b85a97d-48e64e3eac0mr4729613f8f.28.1793267732733;
        Thu, 29 Oct 2026 02:55:32 -0700 (PDT)
Received: from [127.0.0.1] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm40437160f8f.44.2026.10.29.02.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:55:32 -0700 (PDT)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Thu, 29 Oct 2026 09:55:14 +0000
Subject: [PATCH 05/14] media: qcom: camss: csid-gen3: Enable RDI SOF
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
Message-Id: <20261029-v4l2-frame-sync-v1-5-d37992559c58@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
In-Reply-To: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2593; i=bod@kernel.org;
 h=from:subject:message-id; bh=9Su/hrp4xXNhLORySBV74mmMzNRxA4TivC+heqLtS6U=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq4xgLpTHdwbJ4RtkNN2neiyQX0O2KMdWh7Elly
 Uu053FBHDSJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauMYCwAKCRAicTuzoY3I
 Ot+wEACc+UqdBo/XlkBNjOV2Awsxijpo4r+lFLn9HbCpa4lp8yDmyg3yVTcMjgHTrzvkP2fjS/K
 HMAleA48S8gpbz3iCRLaEg78HZAs7tufiaV0PJScOhu7GrxzrfWOjiJ8m736JaRywRX4WOEny3E
 hO/WrgWaSqEMUiyN9Gilu00lI0iQ0muI2r1itia9oO+Zgx/3L1taJE3bKuvE28oNzVOn4plEMEq
 UCG47xyAcF6oPZrGDGtlzRyS2F+6BqORfy7CCJBXnlfNTjiIp0ZK3dVB8FFyawaziFah1LduT1D
 ar1BYVOIpFoT4thgXsZlC1ORj40Qm0faf/gWtWZr26exNp/gQpfNfYiT2mS25UOkgfgnTH6j7bj
 l6GihOpghINipjMzCgA37HgZECe+4L+3so/PC4f74XTlAn+3y26wFySo40ylJ+xdoxKXGWgTbHd
 RvHdOe/CihBsIyGvd9Cf21rbnDCLcgETlp/vMsIqpmZzJGPNouiPucd841fyi/tQYg4U5GY+sl2
 T3K3DXDdf+Td4g0KVUVy9RDRJsi/EUnCZbhh5m/f+mOwlRFAa4rZaqb3mgJ3fxG6618jIo9M1m5
 7hv3k++f5BFMrQYHpDjffGVSqcKoqzpxLJL/xPM10Oi48um2xNAVkTEoOTPpR35i5UEFUY8Ik6F
 owrW8qs5c2h/vig==
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

