Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C5E3FD13F
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 11:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783425389; cv=none; b=LM4OjNpxLY/6DcNUqJCA8/VPDnIwFjvX4Bdi7ndVcE56N5nVHKIoFCvyGYn/YO1I3TenjKlGvr9LAmgyzYHkom/BjgGEU9euPTO89rmL4jzrD3ak0L8aWGv8p/VGZg8V1tCsxJGMKA5yZ6/AgJ+O8eHi5iiQGsUC/iOTMhYdxqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783425389; c=relaxed/simple;
	bh=NPw7AL+7/2ko4WbmcGBfuKBzm3c3YFNL6LvGaiStyXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lCiCWSC15bgsMWJL1dwkT+9flWp3QVDH6FnC1Z8b0IuKg8NiM4l9bkSljNBfDqubO7TiWw7ZD3OW4IjNG2V3Eicfg8V6/b44lryHXDsOC54AUbmivlKjLYRUqlo/D+f84ErhnmbuiJnZwYR/Woaze34FI1952JTw99FUA+X7e6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kExqnykF; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kExqnykF"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so28409705e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 04:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783425385; x=1784030185; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pYUWRJnW/MhZHFw3RjZknhHWFzNTW5ezdgGfJXL4swE=;
        b=kExqnykFCQP+V1D/Xy5431vdDuFRW9Rcusw6ZqM5gzz4efVV3Qj+mwZ4yoMVDOHmy6
         8XIloDTDYdEX3L+J1bFgLfxpbnq87Vanx3u7Lhh3hibd3oJSgrIs1TvpK9AyCNu4Yv5G
         nxog0tyWshQF9btADB1gpszZ0ldaWGDVmO8DLp2YsXBTiCN4VwIsI9vecWKdFl8XCzQB
         q+w5Bwe0K8KQiI1WSZBwmzHSFlI74JapjyExpyQxI4NTuXcJbVp3G/99NZRkM5kgaiVX
         0ZYNa6OzrqTMkBNRsEH1VX5dGxRyXGgqDFZ3XDDUKza6qVFd9FyZpvWvJFAplvCEyjEI
         UQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783425385; x=1784030185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pYUWRJnW/MhZHFw3RjZknhHWFzNTW5ezdgGfJXL4swE=;
        b=X6OsVmmEhM0pj4YLgVJtlrpGwa2MNRFGQwuP9sdOjdZQ08QGu6yJGDadCqFFXyritH
         LY/hGkbvZ4vT4RGpU/k4w4yJSglhI0YER/3tLcr6qvktIEv4c8VagnOqJxlELtyIhZ4U
         o2A0coY7qJ54/vJ2Q4t36R0Eh4wxn2q1bDmns0UeoQ8MhuOelvxU7rER5Sypzvkyc/UU
         /zQYYSpuaQCvUknqf1cfSHUj816qmhZPjbOeRzo6xAz+7cpYJ+PeZRgY0GlwEKcGf8Z3
         UyFjTisLgZvBBRfU3F9b1YzMuymrywz0ftZT5NLmDlVDl1m6L8m+ER2Qn1jqi9Kmc8WK
         7Nig==
X-Forwarded-Encrypted: i=1; AHgh+RpCRncr43eSbfEeongVkeuZziuR22lXHJVufGQccql0TkfSVRVHPbafZvwhEMUWyqkNn2CwzexRGDJrEDE3@vger.kernel.org
X-Gm-Message-State: AOJu0YwJG6HeT7erIGy3grIcdOZo3JumsKJMXgvQkGIZeXiwIEFN0QVJ
	Ga8u8Wz8cHT3b43WZx95jGHF6BkSwhzEWbR7F21xFTowxvBJI1KHFB2Aeg6BLCArO10=
X-Gm-Gg: AfdE7cl5n9XZI+TZsUeQVuUQKWkz1Wx3Ef2+7V5OFZloOdTpm6Pa/BYbB8r7OkGcoMv
	ltFlZTXyK24q3P2qu+QnhDDOgLNTe/r8ZAL6OSS550qdo0pzzTuRh6AW9+luXuZlQ39t16Pej7m
	Hwo3vG4Ir9aYZqQrd1Cwgwr5HbR1Xht6ST3x2mWUTlNhkpS/4UA2sp5POcRvqIDo4Yi6Pnbd6Dr
	2zioxt4g/vL8i5Z98UPY6RNfIfs2MwaqGGjEqTwpRf4mJZzN8UfWHdvhTJ+VmmHPJFg6J0HRuT/
	6gzNcL/nm9M/Nz7UXKRV7oMxdmB7mb4wlcoUR78PVXwxCwknVfozhvtszVOIFMPj/hz04Ls77i3
	nry4jczxamvn+/D3L/MftYG58Tk6I0ADvq2HvUITuzfHxl9AeZaKZ+PsGySFNjG2Mn1PfOb+uK3
	YpUjd/8wJW8TSZ7/ymyu3hKmv1UQ==
X-Received: by 2002:a7b:c00b:0:b0:493:bdaf:83a7 with SMTP id 5b1f17b1804b1-493df06cffcmr37309825e9.28.1783425384758;
        Tue, 07 Jul 2026 04:56:24 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:adab:817c:53a0:8f31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f5ca1fsm55401235e9.15.2026.07.07.04.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 04:56:24 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 07 Jul 2026 13:56:03 +0200
Subject: [PATCH v2 3/4] mtd: rawnand: qcom: Make has_onfi_read_op separate
 from qpic_version2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-qcom-nandc-mdm9607-v2-3-d906f7e8b814@linaro.org>
References: <20260707-qcom-nandc-mdm9607-v2-0-d906f7e8b814@linaro.org>
In-Reply-To: <20260707-qcom-nandc-mdm9607-v2-0-d906f7e8b814@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2

QPIC v1.5 requires using the OP_PAGE_READ_ONFI_READ command, but is missing
the rest of the hardware changes that are currently covered by the QPIC v2
(qpic_version2) check in the driver. Split that into an extra
has_onfi_read_op feature flag so it can be separately enabled.

No functional change.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c    | 15 ++++++++-------
 include/linux/mtd/nand-qpic-common.h |  2 ++
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 0251dd591d40..9217e8de5512 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1564,7 +1564,7 @@ static int qcom_op_cmd_mapping(struct nand_chip *chip, u8 opcode,
 		cmd = OP_FETCH_ID;
 		break;
 	case NAND_CMD_PARAM:
-		if (nandc->props->qpic_version2)
+		if (nandc->props->has_onfi_read_op)
 			cmd = OP_PAGE_READ_ONFI_READ;
 		else
 			cmd = OP_PAGE_READ;
@@ -1903,7 +1903,7 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 		nandc->regs->ecc_buf_cfg = cpu_to_le32(ECC_CFG_ECC_DISABLE);
 
 	/* configure CMD1 and VLD for ONFI param probing in QPIC v1 */
-	if (!nandc->props->qpic_version2) {
+	if (!nandc->props->has_onfi_read_op) {
 		nandc->regs->vld = cpu_to_le32((nandc->vld & ~READ_START_VLD));
 		nandc->regs->cmd1 = cpu_to_le32((nandc->cmd1 & ~READ_ADDR_MASK) |
 						FIELD_PREP(READ_ADDR_MASK, NAND_CMD_PARAM));
@@ -1911,7 +1911,7 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 
 	nandc->regs->exec = cpu_to_le32(1);
 
-	if (!nandc->props->qpic_version2) {
+	if (!nandc->props->has_onfi_read_op) {
 		nandc->regs->orig_cmd1 = cpu_to_le32(nandc->cmd1);
 		nandc->regs->orig_vld = cpu_to_le32(nandc->vld);
 	}
@@ -1925,7 +1925,7 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 	else
 		nandc_set_read_loc_first(chip, reg_base, 0, len, 1);
 
-	if (!nandc->props->qpic_version2) {
+	if (!nandc->props->has_onfi_read_op) {
 		qcom_write_reg_dma(nandc, &nandc->regs->vld, NAND_DEV_CMD_VLD, 1, 0);
 		qcom_write_reg_dma(nandc, &nandc->regs->cmd1, NAND_DEV_CMD1, 1, NAND_BAM_NEXT_SGL);
 	}
@@ -1939,7 +1939,7 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 			   nandc->buf_count, 0);
 
 	/* restore CMD1 and VLD regs */
-	if (!nandc->props->qpic_version2) {
+	if (!nandc->props->has_onfi_read_op) {
 		qcom_write_reg_dma(nandc, &nandc->regs->orig_cmd1, NAND_DEV_CMD1_RESTORE, 1, 0);
 		qcom_write_reg_dma(nandc, &nandc->regs->orig_vld, NAND_DEV_CMD_VLD_RESTORE, 1,
 				   NAND_BAM_NEXT_SGL);
@@ -2041,7 +2041,7 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 	if (!nandc->props->nandc_part_of_qpic)
 		nandc_write(nandc, SFLASHC_BURST_CFG, 0);
 
-	if (!nandc->props->qpic_version2)
+	if (!nandc->props->has_onfi_read_op)
 		nandc_write(nandc, dev_cmd_reg_addr(nandc, NAND_DEV_CMD_VLD),
 			    NAND_DEV_CMD_VLD_VAL);
 
@@ -2063,7 +2063,7 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 	}
 
 	/* save the original values of these registers */
-	if (!nandc->props->qpic_version2) {
+	if (!nandc->props->has_onfi_read_op) {
 		nandc->cmd1 = nandc_read(nandc, dev_cmd_reg_addr(nandc, NAND_DEV_CMD1));
 		nandc->vld = NAND_DEV_CMD_VLD_VAL;
 	}
@@ -2385,6 +2385,7 @@ static const struct qcom_nandc_props sdx55_nandc_props = {
 	.ecc_modes = (ECC_BCH_4BIT | ECC_BCH_8BIT),
 	.supports_bam = true,
 	.nandc_part_of_qpic = true,
+	.has_onfi_read_op = true,
 	.qpic_version2 = true,
 	.dev_cmd_reg_start = 0x7000,
 	.bam_offset = 0x30000,
diff --git a/include/linux/mtd/nand-qpic-common.h b/include/linux/mtd/nand-qpic-common.h
index 006ca8c978a9..437448995187 100644
--- a/include/linux/mtd/nand-qpic-common.h
+++ b/include/linux/mtd/nand-qpic-common.h
@@ -443,6 +443,7 @@ struct qcom_nand_controller {
  * @dev_cmd_reg_start - NAND_DEV_CMD_* registers starting offset
  * @supports_bam - whether NAND controller is using BAM
  * @nandc_part_of_qpic - whether NAND controller is part of qpic IP
+ * @has_onfi_read_op - whether ONFI param page read command is supported
  * @qpic_version2 - flag to indicate QPIC IP version 2
  * @use_codeword_fixup - whether NAND has different layout for boot partitions
  */
@@ -452,6 +453,7 @@ struct qcom_nandc_props {
 	u32 bam_offset;
 	bool supports_bam;
 	bool nandc_part_of_qpic;
+	bool has_onfi_read_op;
 	bool qpic_version2;
 	bool use_codeword_fixup;
 };

-- 
2.54.0

