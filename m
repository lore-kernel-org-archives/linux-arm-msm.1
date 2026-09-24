Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219334CC267
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 20:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790280284; cv=none; b=CSP3yB370g026rTNeGvj8uzaFUuWv7vyPBHZVdRcAGlH/ciSyzTCgi4n725uqQoxAjMyGHDCurhrcgFlMbY9d/QxIypf/W5Zyv+LmOJEeElTOjMsTQMlvrtkQxgiSp5IzpyQoMY9olnhE0XlTQ+qpPKw9CStN+FJuD7GlwQmenM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790280284; c=relaxed/simple;
	bh=DMFbDtxDxzTU0blumPnTcfeaoGFThDy6cVflVpMuxmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V8CIrY9SHK8qENBUHHkJaxCGhUHF5w6a0c6K7Le3sXmQ5aCgy0+M9oywzsPW98VqdnZ/RoCWpO+YFCXCTzIFnjsd8h1Aoeggw99b0c32WjddvWWOSN0XvUfSwaPm9NJxNT75D73hRauqaaC32iYR6KpWlBsqfo/p825rLDhe1dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBO8113d; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBO8113d"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so1130385e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 13:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790280280; x=1790885080; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=girgJjULVwYK69uHVXTl40PhKgdfAEex+6Vx4Om71qs=;
        b=GBO8113dPZTVwPF/thJwo50ZwOsEGE7DZFgiYsJJ0jWViOarhxRB2tU11cKKZqT45P
         kVnbf9e/q2wgv2b6zxrGFuBd/hO6DRqT0msNE8Iagov2iUU+f1s2WfeKMPISBTpeuXcK
         Pda/DEdP8gD3BipmqStrj06Anilo9l7mbYHxisdLDeEU3Kd+5l8IH+8+zV/gaUIuMtwi
         Sio1Sj9hL0Aa47qigr6JPRuA6tASjVksxgG2S6Q5tRz3vrNRWR1B40GbkqhVFdu7MJbq
         a/ETOgL694eNvZNYRlGEYDR4UgVoYOOnVTOKz6Xwx53wnNcvSSKXfnMtg90Wn3lxVwjJ
         YcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790280280; x=1790885080;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=girgJjULVwYK69uHVXTl40PhKgdfAEex+6Vx4Om71qs=;
        b=PAmRa7Ia2LQvQqAB9V54zFJd4sRMfY2LagyJICtO5NR1VmDwkAQr2Q0expraF0oTpr
         6Dq53SUgmUF3VQhkdSWMIBDLlRbRLLQ1RP/zfW8Xo2kLy8/+x/TJ0oYkCCSB/HVMvl2V
         PNwAcI4jjyfhgJXmwQN6r/2lyiU3a1IwSY70lsJx/99Td/7itOLQA4as4hMGDPPCOn09
         Stw3c7CYSqwE/ZYJIwVqQbygX2157elv4Xeo/LCs1Sm0rYXSFK9sewT1JTwagTU9M4rP
         5YOdt/SvXbIuYHktGZs5NY7t0PTHorGar+jvIZ/Z12jhpxZvdXikxLlGrEP1IaFtzDIv
         tT8A==
X-Forwarded-Encrypted: i=1; AKwUvBzMImQi3Ahq3QrDK+pTslWyakz+FMDpj7rUVlCQXxdYCMg9fOzT3S0mKVcpFYfi9jQLFdbjrT34MDBsp/Xu@vger.kernel.org
X-Gm-Message-State: AFuF++m4S8T0wbLLYBm2S4nBxOjZQ2IDiF3mtYFhANXlv2Zm4QOUrD9w
	ir/qS1sbaVf67xXHRjg1axw+4d4MaYcqekTnJh54L3Yj80rrR5IUET7h
X-Gm-Gg: AYBFou2QL168j3B38x5njHeg7xh1Lx83xgfHNAI6W7s9PriBVRDRxpGCrkW5Bn2E2BK
	LdOZ/vhusmnx8lDVXnm+yxvF9DWOD2H+Yqb37flb7TjnnUmyqcdKkUeU2RM0NJF9hD84KaNzXde
	SpiE72ySLmAJfuo8w0OeR8jmIwW25a1R1DOdf68SNpVqr5xia+8WxbXjyGj0ceppw0nHMLLtNt8
	PkjPcb2pwPBP0RaW/NajFj3dGYvcMf0Ty2zSJCho6/VlPepNRPa5JVvuf03S5ff427X142BQ32X
	Y7CjGoijfqWUFe885Zydaw/HDhPr32M3WJvlK+txb6zo4khfrE3iqFJWzOtb9t8Zc18eUEcwWDv
	wyhQfyrlq/zOQlyZp9GcXc5xbf+AiIoM/+nFrU3yztdGo5b81IqVod9/vLUGidZCLWvJR7gfR3I
	Bf7JJroKHJavDqSBfwts4m6dI8yjjF1pvA9FZrbgGzSg3h8jCRtb8VDQ5TyNej25otgusPN6qjC
	QrrRiIzd5MS8f5na1S/6dNxJQU=
X-Received: by 2002:a05:600c:698d:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-49ff06e504dmr1234455e9.21.1790280280382;
        Thu, 24 Sep 2026 13:04:40 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm1551603f8f.4.2026.09.24.13.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:04:39 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 24 Sep 2026 22:04:19 +0200
Subject: [PATCH 4/8] mtd: rawnand: qcom: make config_nand_cw_write() more
 generic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom_nandc-share-more-code-v1-4-f3012199b161@gmail.com>
References: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
In-Reply-To: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
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
use a 'qpic_nandc' prefix.

No functional changes intended. This is in preparation of moving
the function into the 'qpic_common' code to allow reusing it from
the 'spi-qpic-snand' driver.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
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

