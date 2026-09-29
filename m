Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188F250B8CB
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 11:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790679850; cv=none; b=iCm4conhwhieVx/AuYlOgUm9oGXEyxuq9Syx+icUMN66FWQvyrx+dsuE7P4ldMnT1Wrtx9/5n1LW0Cv2wajrFIWQBkzi3Eg3FYvAsjeMf71n1hASnATGoIfgVcod8S/xvwbTQT2gayrBHxvyjdSg/LFEIG1o8gOjh1TQhoR5CZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790679850; c=relaxed/simple;
	bh=vxKnnCHNNDSwrTGavRBlmv754hG+/NT0i3RV5dsh0hI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KL4Mn6KRxe7oBpvXCLYPdwfInzhmoJR4bwcNATqAPxq5fR0wGVJgOAflK0D1hMbWyrjgraNgp3/TJ8P895Zdsw1RC4H7LQER8fuhn0iBHIbSYnFhEX5clGa08VvSPYvFG5wO8kuiehyhq6x9NwXU/osv4+Aoa5/jxcPlYyk/x9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tDxwJMWu; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tDxwJMWu"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a006bb267eso9910165e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790679846; x=1791284646; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VVFrF0P3aNAlc4hqq61CHFto2LvhHViKAoylOIr9WSk=;
        b=tDxwJMWuugizDs2I4psTROy0SLT5ipl3kkWy26vNsOAy8e/GQulyifGMqaWbN/ownq
         +fIZrrnV35sowrliABqgJhuwe16ibzOTBp4dZ/BGT46vpfVYsgHBxv/HAFuLV06susyp
         SVQxdJw59vud8D8kdYAeTfyR6vt0D+00lVpo/TnMrJpUAoPqAGHQ0xH6Z1ZI4m1U134l
         K6fkt++7uwb0wRzs8cCSDWkaEFRYSs0T3wLeiGHTzcaNGvnK8WL3k3bmlxmKyTLfvkyU
         Sj/VPyOcJISmpFE2ag1uoxTY0Rkh2hbJkrmQJq1vjjX5RsoslfOVArkzYc+gz/DXne09
         150Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790679846; x=1791284646;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VVFrF0P3aNAlc4hqq61CHFto2LvhHViKAoylOIr9WSk=;
        b=aqySYFf7DQW/ZBONN0AZ0Wb94bFLTrnA1L2U++NeJUI5qSdbu0e3BF+R685kq5akp8
         WaBP0JNzZAyOM3oHAU4/dnhaYfjz2qg/PftQHOZkEZa/cOUKjnYwwUyIx+m72IzIjbtr
         chPExrohKDqmZbuYExBq2Nj52dBZp9PsP4JTf/kSKkAXJQZp8B6oQT4OvLjFEVQaQknB
         5LH4yZ+QfVuet1EA0iounbx2EBRH25RbwI88auLgcgXMVzVv1bKGlK99RC1ngoopvDw5
         lgb280cWv1H5iUjiUsWxEOCktuUlhedplx1kXf6bow6V+LfJd7PblNSFGJYpNize0s4R
         wevQ==
X-Forwarded-Encrypted: i=1; AKwUvBxotTA+3cqfl+fc+M/K79HqysjBV6GcN26OwZuNkqDb66SqabKlO3wFLRy8elZjMsihpt2eVQ6vVkVi8/5+@vger.kernel.org
X-Gm-Message-State: AFuF++mlWxOwUEsISly2OmfVfehPQC5qSoRyNlrMIxds6oRdbj/rEe6B
	XEbRpSKY51UiWJ8YiwQefT9CYpQjxv4fAbop4LrSPSgDYT6OMblryiU1DJXKAQ==
X-Gm-Gg: AYBFou1Kqs6lB00H6d1GY9fWZAABjMN9+i++sj4rkEFbR26IosWMAAOa2jxFe/oaWS0
	lE+ofp40ixw1xfhlQKvi1KyfD3qUxJL9XIPTDmrV40AisScF0i3sZs44XVhXyS/JGuAczbZMK0U
	jd33pBFsIl7hs/8plgQNQUVFUT3Bj9tFmdDe880Bnihcni/VWyamA0ppbkTdA7CBl3LJzc3BRI5
	q6kS9fzoTUaA9iFQzXzRF7qj7FGsTxImSvgja8aIksPwXiBEtUB6W9X/xXZf4zPFa81b67Xiokr
	rX0FMvB+A6I3e2JzwdLHORh+M6kQrOW3myvkPytXvCPCmBvz9qMo+qUyLC6CIuvMm+b4NSbFZzv
	BznPHrVry6uy0wLjD2jA9Uud3Y9RVumdWOWEaMp5lhV2PIwzggHMwoodvvWCZGq9/j2b3FnrSa8
	UdRhWaWphNX3+q9qxJGK+tE+FJbjTzD2EdlRwXnbDODtq+QxMWym1GPEp0UBJqStw1TrXDx7bH7
	eR7dEndUAZIHvFq+qMUShXjbZ3y6pohMi/QgQ==
X-Received: by 2002:a05:600c:354e:b0:49e:6e7c:d895 with SMTP id 5b1f17b1804b1-49fe66ef3f5mr281148975e9.26.1790679845901;
        Tue, 29 Sep 2026 04:04:05 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a00ebcd353sm83102985e9.3.2026.09.29.04.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 04:04:05 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Tue, 29 Sep 2026 13:04:00 +0200
Subject: [PATCH] spi: spi-qpic-snand: remove 'ecc_buf_cfg' member of struct
 'qpic_ecc'
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qpic-snand-drop-ecc_buf_cfg-v1-1-c9de93142815@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQpAQBAA0F/RnE2tScSvSGJ2lrmstRsp+Xeb4
 7u8B5JElQR98UCUS5PuPqMqC+Bt9qug2mwgQ43pqMMjKGPys7do4x5QmKfldBO7FRdn2qomJts
 Q5CFEcXr/+zC+7wfHG4LTbQAAAA==
X-Change-ID: 20260929-qpic-snand-drop-ecc_buf_cfg-bf07142c2d62
To: Mark Brown <broonie@kernel.org>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 linux-spi@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

The 'ecc_buf_cfg' member of struct 'qpic_ecc' is used to store
a configuration value for the QPIC_EBI2_ECC_BUF_CFG register.
However that register is obsolete on the QPIC v2 controller the
driver is written for and programming of the register has been
removed in commit 930a7312c946 ("spi: spi-qpic-snand: avoid
writing QPIC_EBI2_ECC_BUF_CFG register").

Since thaen, the value stored in 'ecc_buf_cfg' has no real use,
so drop the member from the structure. Also remove the remaining
code which uses that.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index edfac4866a96..00072c44db7a 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -97,7 +97,6 @@ struct qpic_ecc {
 	u32 cfg1;
 	u32 cfg0_raw;
 	u32 cfg1_raw;
-	u32 ecc_buf_cfg;
 	u32 ecc_bch_cfg;
 	bool bch_enabled;
 };
@@ -407,8 +406,6 @@ static int qcom_spi_ecc_init_ctx_pipelined(struct nand_device *nand)
 			       FIELD_PREP(ECC_MODE_MASK, ecc_cfg->ecc_mode) |
 			       FIELD_PREP(ECC_PARITY_SIZE_BYTES_BCH_MASK, ecc_cfg->ecc_bytes_hw);
 
-	ecc_cfg->ecc_buf_cfg = FIELD_PREP(NUM_STEPS_MASK, 0x203);
-
 	conf->step_size = ecc_cfg->step_size;
 	conf->strength = ecc_cfg->strength;
 
@@ -1198,13 +1195,12 @@ static int qcom_spi_program_ecc(struct qcom_nand_controller *snandc,
 	u8 *data_buf = NULL, *oob_buf = NULL;
 	int i, ret;
 	int num_cw = snandc->qspi->num_cw;
-	u32 cfg0, cfg1, ecc_bch_cfg, ecc_buf_cfg;
+	u32 cfg0, cfg1, ecc_bch_cfg;
 
 	cfg0 = (ecc_cfg->cfg0 & ~CW_PER_PAGE_MASK) |
 	       FIELD_PREP(CW_PER_PAGE_MASK, num_cw - 1);
 	cfg1 = ecc_cfg->cfg1;
 	ecc_bch_cfg = ecc_cfg->ecc_bch_cfg;
-	ecc_buf_cfg = ecc_cfg->ecc_buf_cfg;
 
 	if (snandc->qspi->data_buf)
 		data_buf = snandc->qspi->data_buf;
@@ -1222,7 +1218,6 @@ static int qcom_spi_program_ecc(struct qcom_nand_controller *snandc,
 	snandc->regs->cfg0 = cpu_to_le32(cfg0);
 	snandc->regs->cfg1 = cpu_to_le32(cfg1);
 	snandc->regs->ecc_bch_cfg = cpu_to_le32(ecc_bch_cfg);
-	snandc->regs->ecc_buf_cfg = cpu_to_le32(ecc_buf_cfg);
 	snandc->regs->exec = cpu_to_le32(1);
 
 	qcom_spi_config_page_write(snandc);
@@ -1275,13 +1270,12 @@ static int qcom_spi_program_oob(struct qcom_nand_controller *snandc,
 	u8 *oob_buf = NULL;
 	int ret, col, data_size, oob_size;
 	int num_cw = snandc->qspi->num_cw;
-	u32 cfg0, cfg1, ecc_bch_cfg, ecc_buf_cfg;
+	u32 cfg0, cfg1, ecc_bch_cfg;
 
 	cfg0 = (ecc_cfg->cfg0 & ~CW_PER_PAGE_MASK) |
 	       FIELD_PREP(CW_PER_PAGE_MASK, 0);
 	cfg1 = ecc_cfg->cfg1;
 	ecc_bch_cfg = ecc_cfg->ecc_bch_cfg;
-	ecc_buf_cfg = ecc_cfg->ecc_buf_cfg;
 
 	col = ecc_cfg->cw_size * (num_cw - 1);
 
@@ -1297,7 +1291,6 @@ static int qcom_spi_program_oob(struct qcom_nand_controller *snandc,
 	snandc->regs->cfg0 = cpu_to_le32(cfg0);
 	snandc->regs->cfg1 = cpu_to_le32(cfg1);
 	snandc->regs->ecc_bch_cfg = cpu_to_le32(ecc_bch_cfg);
-	snandc->regs->ecc_buf_cfg = cpu_to_le32(ecc_buf_cfg);
 	snandc->regs->exec = cpu_to_le32(1);
 
 	/* calculate the data and oob size for the last codeword/step */

---
base-commit: f3c0a2b557ea87cbd802b278783c32484a063ded
change-id: 20260929-qpic-snand-drop-ecc_buf_cfg-bf07142c2d62

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>

