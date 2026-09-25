Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AE54BE428
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 19:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790363194; cv=none; b=CupDJLF1w9HW6SJ6CNyOS26fp1yuv61pa3pEPT9jfk+eM7pTFyq7htl+BKZ+21zyaY/CVkrIoFx3rcjRLtvr8lpAFwWta2iCjbWa6R6GnWu/1OblpZSb/5I7oSo1LIJGLYlcCVfIK5Zx2299RyyoZcxJWtSqR1+Jd3W/pRCD95M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790363194; c=relaxed/simple;
	bh=IFRr4+k7bQz+8SmOA25c5x9CqNT4NgTehkHBc+nc+ZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ah+5wNsHA8n2rWQ+yWoYjakZaRgLZWxmgSaY+ATvaqnB1aX/heB3Y6bVy13bvz09pBFR+80mr/W7G5U+32BZBTw6JQWWqJnr/iQBRRy2kT+XVXxwfXoa8Gwngryq13BU5oTHPauY2G6/rJspvRDmQmoMoVpR+V2XP7VaFFlwBTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LPxqfPCD; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LPxqfPCD"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so711711f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 12:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790363190; x=1790967990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2qGsLFVBH+PkOR+pSsm1K1BuRl8tuo2QZGCmeMXdvZ8=;
        b=LPxqfPCD/8k3vg9EvcfwGjYNCCd5VP3XuJVPhFXodhTh80v8vcf5a+jmtsLGP5fT9q
         WJzB1FO0XWv0mt/QTyKSRPgtAnAdK/Jvg1X8gUQIbYCCGdCP94TUYUclAoyiJoPXYQ2p
         fY4ICAzu8u6XAQcpc0shX7I7vl6WggrOksHDSS/Oof/27HkzNUpbzSvz8s/2MNgsWuhC
         cPYRkalcAZ3DuCLbI9pcRlJw6p0Y8+YuEh+qaf3QPGjlVYCKKrOJuRtUm7iP7RaPEkOX
         UG7esJLtcIAudFogeQC0GpxGa4nb/SnJaOQdTSyAGrIm4h3B+J9eqwqgETg4gZe77bB/
         mRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363190; x=1790967990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2qGsLFVBH+PkOR+pSsm1K1BuRl8tuo2QZGCmeMXdvZ8=;
        b=zxO7dkQQNHOa8c0uqGQ2rqZWJXQi1BGbCWiQGdH2F922M3jNa2O/vpKtlxEvY50na/
         gbNtTut6vjErO1tbTNwAKTS2yBt7LI7aCZhgbm/FBq/+FVfushHTgMuvs8Of5/GsBL7U
         Sm0WFW/gjrHuxRDWcfg/M9JjEoJm14JjtuuP2PGseTKS8MgOfXG8bEsrBIvYEGqfvBi4
         +sni6I/LDHbDkCCI0JmLa/O6fbnwB9sgkhngpdNq5ncYxPIH4kj8WQ0eJuUPS8wtevfb
         i/WlCzORZ1jUWZeiqJcBo5xt8VbNMkNX1jkm2AwW1DL1A0U3Ch1zcCK3k1uBXxG78pSN
         kpyw==
X-Forwarded-Encrypted: i=1; AKwUvBxBdmLtpa7dui+oCHGUExw0KPnlSvlGyc9pWYFl17m5qMG46uLuBzvPsOkqEOPvcOFbLxU3X7KMgIaQwq7V@vger.kernel.org
X-Gm-Message-State: AFuF++mPJa09nM4tbaPVhzWzCbcm31K7/v7OdRsCEAh8Jzl8QE/0q2wK
	bmczsYBBiFX6zC96kOnKZYhBBO58H5H094w5N7JpjI2QxzjfILiiIbWznTCEgg==
X-Gm-Gg: AYBFou2HwMkJ4i8HFrxRImAwu5rqIsYKIw1FGcCQBUpA9yy4CCV8HW/DIEMq6+cwouj
	pBCJ7q2zG0D5L8ZH+n1cMUuVEUnVIX8r5Mc61Km7bvJ8ycy5q+K6au5Sa+Opd3l+fHJzkgvMZn2
	a48KimsVLLAaWpXTGokA6JluunLVUOBUlCZjbOMCuKE8BYU36MVgcDku5aU73TQDH7OgaDah3yb
	wkxxR1sLquK7Krqv/rLLKTPB87+zDoTUQnAjRfTcSM/9Obk7nBQvu+GrRkuWIrKNPPPU1Ftm/x5
	Oen+cbFNZ9Kab/Nj8hJTZPrGH8oYnp4zhsGUhptxOrBpIZlr05JMmuxar+fNCEah6Si6bnFa/Up
	pW5B7xkilw5Td++LJH0L0MmAJIP3QvcvVeYA7raOdN/PeTDR3UKvSeCXm14iUGJYEB22BxpxIpt
	QVkpHzpmK4tFs+CgauEZ8lnNXZo8jX01a63YEkzaoarGyOYKYzGT9bLS90hLna8abyYpaJq9p8j
	Gye5699MMt3zziuB456EJ04CDcZnzO2BgygmQ==
X-Received: by 2002:a05:6000:4b05:b0:488:8131:c684 with SMTP id ffacd0b85a97d-4888131c7f1mr3986610f8f.13.1790363190377;
        Fri, 25 Sep 2026 12:06:30 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm9467234f8f.4.2026.09.25.12.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:06:29 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Fri, 25 Sep 2026 21:06:13 +0200
Subject: [PATCH v2 4/8] mtd: rawnand: qcom: make config_nand_cw_write()
 more generic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-qcom_nandc-share-more-code-v2-4-a1b088052d6a@gmail.com>
References: <20260925-qcom_nandc-share-more-code-v2-0-a1b088052d6a@gmail.com>
In-Reply-To: <20260925-qcom_nandc-share-more-code-v2-0-a1b088052d6a@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

The function gets a 'nand_chip' pointer as a parameter but it is
only used to extract a pointer to the nand controller's private
structure from that.

In order to make the function more generic, change the declaration
to get a 'qcom_nandc_controller' pointer directly, and update the
callers accordingly. While at it, also change the function name to
use a 'qcom_nandc' prefix.

No functional changes intended. This is in preparation of moving
the function into the 'qpic_common' code to allow reusing it from
the 'spi-qpic-snand' driver.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - Replace 'qpic_nandc' to 'qcom_nandc' in the commit message to match
    the actual code (spotted by sashiko-bot)
---
 drivers/mtd/nand/raw/qcom_nandc.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 1f3c00823309..99fbf5458083 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -378,10 +378,8 @@ static void qcom_nandc_config_page_write(struct qcom_nand_controller *nandc)
  * Helper to prepare DMA descriptors for configuring registers
  * before writing each codeword in NAND page.
  */
-static void config_nand_cw_write(struct nand_chip *chip)
+static void qcom_nandc_config_cw_write(struct qcom_nand_controller *nandc)
 {
-	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
-
 	qcom_write_reg_dma(nandc, &nandc->regs->cmd, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
 	qcom_write_reg_dma(nandc, &nandc->regs->exec, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
 
@@ -1018,7 +1016,7 @@ static int qcom_nandc_write_page(struct nand_chip *chip, const u8 *buf,
 					    oob_buf, oob_size, 0);
 		}
 
-		config_nand_cw_write(chip);
+		qcom_nandc_config_cw_write(nandc);
 
 		data_buf += data_size;
 		oob_buf += oob_size;
@@ -1094,7 +1092,7 @@ static int qcom_nandc_write_page_raw(struct nand_chip *chip,
 		qcom_write_data_dma(nandc, reg_off, oob_buf, oob_size2, 0);
 		oob_buf += oob_size2;
 
-		config_nand_cw_write(chip);
+		qcom_nandc_config_cw_write(nandc);
 	}
 
 	ret = qcom_submit_descs(nandc);
@@ -1144,7 +1142,7 @@ static int qcom_nandc_write_oob(struct nand_chip *chip, int page)
 	qcom_nandc_config_page_write(nandc);
 	qcom_write_data_dma(nandc, FLASH_BUF_ACC,
 			    nandc->data_buffer, data_size + oob_size, 0);
-	config_nand_cw_write(chip);
+	qcom_nandc_config_cw_write(nandc);
 
 	ret = qcom_submit_descs(nandc);
 	if (ret) {
@@ -1220,7 +1218,7 @@ static int qcom_nandc_block_markbad(struct nand_chip *chip, loff_t ofs)
 	qcom_nandc_config_page_write(nandc);
 	qcom_write_data_dma(nandc, FLASH_BUF_ACC,
 			    nandc->data_buffer, host->cw_size, 0);
-	config_nand_cw_write(chip);
+	qcom_nandc_config_cw_write(nandc);
 
 	ret = qcom_submit_descs(nandc);
 	if (ret) {

-- 
2.55.0

