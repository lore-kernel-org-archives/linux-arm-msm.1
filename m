Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377272;
	b=mDRc6am9Wz2HSORovrAlK8dNTiBC+rpFyh8foD1iPDdYj+S5QJvSxzYR3xhSSRayokgv
	 oAauDv/S/CV1x5gIDuy4ub6u0WMsL2M/ZzhquI8svob8SMGiL/rcq3ppxGh7ofytFpGCT
	 R1M6HIkZn5y/ZZZga7qquqx1CmpUEdGCOLn2Sc5zPvOvAjJNR1JX3ctLhDvn5FSbMI6Br
	 7Q7wqfJh4RyY4uHpUnboFsva8JADArpJ1TnKMUkM++nldZZ5MW7zh5zfA/3450vWpQY/7
	 tuqC14rOU8+OOw/5PwWGjWtkUmGCMmlTG88+b1dKaS3A9M+N1owITUDbP8pc/yW2T6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OLRD/nhwFUuDTpwXog0Q7Wc+ALgde2fM6C+mADcBMYM=;
	b=D+ciTRQtKbIah2Xzy+z+XsHFz6rFVoO2oT9/nTCx5zIKxbRWr0dD2Dp9/Z7GSg7mNgiB
	 pttiFrEH3Q74sIBqbfFTtwDWjLVdIAtMF7n8Q+QiJP9XmliWiBpPw80cTZ9U1zjtSkpV3
	 clFydv1Nv3WvLTBcEZbNkhktkyMIzWguSK9J8h8qE45gQoZfnIz+WV1dZ6hM8v5fzaOkW
	 Aqe+w44JUDF3P5Drfy660O8gP9tKleOB+MqsgXUFnphDXALeYhkrWhf/XG7gawGXx2pUR
	 kovjhtWq1ChZkvs/Fs05vwcu4pqpzPpnbIAr9wZ5kxJ0S/Zr7U5gR5NmkC/IgnXtyww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tAevl8Y+;
	arc=none smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A38606A33B
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 16:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31A38606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tAevl8Y+
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4a755bbe158so623300fac.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377270; x=1793982070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLRD/nhwFUuDTpwXog0Q7Wc+ALgde2fM6C+mADcBMYM=;
        b=tAevl8Y+5DrICexIk5cjnG2iKmtgb0MM1HxmwMduH30mPH5r2hIJWjSoii84r/jQUI
         V1rGi991IrBGJt88WHX1H9a2vcOCv47S1x4oXEgqV77SSnh+BfG1ekpj22ViyvjukgkF
         kUK6T7NwJXkHWmNNpc+qc5cVRhYrutEdvSJe6HvsgC5/lllKwS9SvErtr5o5fqC+uR1v
         Fsrp7l/p8ba5DHF4UXOLtOPiM0alHjw4jDCm00yCC42zEFCRNnQpPjp5jSjcrflVqIU0
         ZOBWNy2B556H8GeJzGXgfPA61u8hWu5mcYKC16nvtn8XbtfgB8i5JZWcdE/2TGZgKnYm
         mJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377270; x=1793982070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OLRD/nhwFUuDTpwXog0Q7Wc+ALgde2fM6C+mADcBMYM=;
        b=QKyGBHZTzoOEAFShMF1opBSjmXI76AlAlRkuGv+MTPS0r7YKPVr0Z4pHQaezNmEQf6
         m5KZ1UUns8LSwOs4AyXRmHqIKlbHEXc8WAEDbgBwgf7qaCBUDH+tTf8iAS5zNqkvMcRY
         VMN2RcwiW1N9llqshmGcipforj5s688wVBOkF9v42zD3A49qjKuacIqibTSMRnHRUMLb
         UgNzkV7Pl5ieEAm/k3XOLfTaWHo/fZVHDkIkN20fJT0iJugFTnTWpH0sWls4pbCWHSB2
         /jfp7S5Ph7yT/YrDnNHadRFD8JAJ51OwXo3Va7ZoI9boTDCXNOHjI4mgHe+tJ2QQpy8E
         lSWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYRLkN2SFOe047UEO8pubM1iDy78Hg4Geg5+AsiD8O0v/3C3fXwp7l6+Xer1DOu3oXxBXDt9AjRTN9MacI@vger.kernel.org
X-Gm-Message-State: AFq9FYLS9CLxE6nYv17mBOfTj+4Rk8S2jpo86kJntNLqx+8ZjSBLCmOM
	LQL5kZ7hvFF0Eo/UgvSsL5Naz/Mre7ye+3DivLrgoTCgQ7o3xBrRjpY5
X-Gm-Gg: AYBFou047oc1WEnPXHadi/sFh+A+QD/V0xfKRRd3zyn/M6Syi8IgZNyL6yqyVhWdSYD
	BAvXZO7eNqPySs34jo1YHGFR+PuG9QYL3erlbZeeX6foxELEUaaZSAz89vO4fM/eGQBiXjfcmJR
	7vZWJu4cWED0oZt18Digb46JZlPhNNRXSCkrqK9FcKyDr0jyrtYWVsl2GRHB8w8SnLUjSeB3qsF
	mlH2JKy1M+rIPXUdwfeOU8e4r5RejLSTH4CoQIyPWdsHHOwDRjuktUrEO/hVLF3JEOrDX/xxltz
	Em1wPWU0gkwcaU70lf3hrk67tS/nCKnTfTAhiCtIwcemrXuBeoa8UWS2nfZN/NE3+DfIhlS+9n1
	rONLxP7wo623+2cMYzAt6xJitvKJ4VaO+6bvn5cQGegn1HPiI8/kgwcN1hV451zNuuGFkHyn5DK
	ihPCkOlVikhrGEMY6WX9eUnHk6b+v7AFXWxZC9xwo1ejDH7xKurf7iOBkE6OnaH6IlJ/pHbD7+Z
	aAJVMMBX5KbqWkwrJP5vmbJRe/2AP6zYMZ9lGR+OfewKoRiW3uX1kWC41JWtetyTV70zAgPjeK4
	ozqc13KHya6CtYvg7hMq95sO/XataND36r3i0Z+Ns78Z/W9CoIqmcDkxuDoT1LW00EroH9D6Tdq
	SrJEowqKbPzPLlyzq4REW0hG+rUBX3TE3aNrmhurW57YzZDYYDJPO8XTaHTMP8ZTLWOtksnQIOq
	3Wk60kN6yOkAB+RcR7
X-Received: by 2002:a05:6871:5224:b0:470:e96b:43e6 with SMTP id 586e51a60fabf-4a90775db3amr1316890fac.18.1793377269740;
        Fri, 30 Oct 2026 09:21:09 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167b03csm322536fac.2.2026.10.30.09.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:21:09 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Han Xu <han.xu@nxp.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH v2 3/6] mtd: rawnand: stm32_fmc2: retire data DMA before unmapping on errors
Date: Fri, 30 Oct 2026 16:20:38 +0000
Message-Id: <20261030162041.2998170-4-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030162041.2998170-1-samarth.colleges@gmail.com>
References: <20261030162041.2998170-1-samarth.colleges@gmail.com>
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

When ECC descriptor preparation or submission fails in
stm32_fmc2_nfc_xfer(), the driver unmaps the data scatterlist without
terminating the previously issued DMA descriptor. The descriptor may
remain queued and execute when the next page operation starts,
potentially writing into a buffer that has already been unmapped and
returned to the NAND core. The timeout paths have a similar issue, as
they use dmaengine_terminate_all(), which does not guarantee that DMA
has stopped before the buffer is unmapped.

Terminate the outstanding data descriptor on ECC error paths and use
dmaengine_terminate_sync() on timeout paths, ensuring that DMA has
stopped before the associated mapping is released.

Fixes: 2cd457f328c1 ("mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash controller driver")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index c08d6b176..82d630106 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -915,6 +915,7 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 						   DMA_PREP_INTERRUPT);
 		if (!desc_ecc) {
 			ret = -ENOMEM;
+			dmaengine_terminate_sync(dma_ch);
 			goto err_unmap_data;
 		}
 
@@ -922,8 +923,10 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 		desc_ecc->callback = stm32_fmc2_nfc_dma_callback;
 		desc_ecc->callback_param = &nfc->dma_ecc_complete;
 		ret = dma_submit_error(dmaengine_submit(desc_ecc));
-		if (ret)
+		if (ret) {
+			dmaengine_terminate_sync(dma_ch);
 			goto err_unmap_data;
+		}
 
 		dma_async_issue_pending(nfc->dma_ecc_ch);
 	}
@@ -939,9 +942,9 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 	if (!wait_for_completion_timeout(&nfc->complete, timeout)) {
 		dev_err(nfc->dev, "seq timeout\n");
 		stm32_fmc2_nfc_disable_seq_irq(nfc);
-		dmaengine_terminate_all(dma_ch);
+		dmaengine_terminate_sync(dma_ch);
 		if (!write_data && !raw)
-			dmaengine_terminate_all(nfc->dma_ecc_ch);
+			dmaengine_terminate_sync(nfc->dma_ecc_ch);
 		ret = -ETIMEDOUT;
 		goto err_unmap_data;
 	}
@@ -949,7 +952,7 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 	/* Wait DMA data transfer completion */
 	if (!wait_for_completion_timeout(&nfc->dma_data_complete, timeout)) {
 		dev_err(nfc->dev, "data DMA timeout\n");
-		dmaengine_terminate_all(dma_ch);
+		dmaengine_terminate_sync(dma_ch);
 		ret = -ETIMEDOUT;
 	}
 
@@ -958,7 +961,7 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 		if (!wait_for_completion_timeout(&nfc->dma_ecc_complete,
 						 timeout)) {
 			dev_err(nfc->dev, "ECC DMA timeout\n");
-			dmaengine_terminate_all(nfc->dma_ecc_ch);
+			dmaengine_terminate_sync(nfc->dma_ecc_ch);
 			ret = -ETIMEDOUT;
 		}
 	}
-- 
2.34.1

