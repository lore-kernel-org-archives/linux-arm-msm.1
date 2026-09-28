Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C0E45562C
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 07:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578934; cv=none; b=ioycYjFJfnY29xPIEScghiwV7l8SrXdMxBaJpxwFPgWK3fLxn9P8vH3ruGiPGidnQPWup3ho+hWw/aBmsVENkUWJ9wfXzIE5dmsUGPSle+xZ1AtMgesl4DAfuYhjr5xMdNkJuAeH40J6J8cw5eX4VoD3Y5l7P2WgvE+NtV7WctU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578934; c=relaxed/simple;
	bh=zza9TnXjTa58vqN+CvSp3ju1UX2D2hlDXXN3AqqsBZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=diR0KdlPczRhiG1dH/8PKp3YQT334NR1zp+Kik6/WBQ/NitKuyFESflI9N0JEeCE7l300GwsB6zl+DhFzv1z2VFD2Hecj0v0tCBDcV8XyC2LGDDNNZ4Iva3Rt1a8EAaxiOwVWng5tede9ImtUHNo23ibAB7hcH42PHfzxpNcEz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZLt4zvMq; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZLt4zvMq"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c294ad260fdso443103566b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 00:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790578930; x=1791183730; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OPkNPJmzSuKsV3tYjzk5WCFitXsvoG1mbaUmgEkFosA=;
        b=ZLt4zvMqIZ4IGgQIZPIovTA2RjGBg09wOaal7DScEU/WgnzVCgFC7WM6+vvPsaDDYv
         C/fmdo2utPvbA8QvCzBUyyz+BcRpJjvHL+ngd7Yxt2/syI+1tviMBInt4WCe3HVjkrJO
         Gl9QqizNBPmzQlp9w51cAG9ZAJZb4d/ceZ/k76ZlVXrIGfhEi298Z9JgrMx2mvWPVQDT
         TSM2e0p4ew/jQ1Z1N7cGUvBj8kElXihfZlluB0dTnQsN/aCwiOSYnSt20YWwhdN+7X0o
         yBOX/cUnb8z0DgbowQUWjwdF//OXevQALtqPNrtr2QxZL4Le01iNv3wAoSNF2OHNjUXC
         990g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790578930; x=1791183730;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OPkNPJmzSuKsV3tYjzk5WCFitXsvoG1mbaUmgEkFosA=;
        b=mmTJfa9JHlRLTSjkKzYqS955Ix6fEBiKWP63Ss6XjcKHroox0OuFDrO5bdPHUBkGlh
         aYi8BqrRzG7s10X1KrSZ1ZJGPIsKJd7DCXx+MhsAyIr3W6VVfVKVXTwbbseIRyjwWCXN
         G7WwvQZj7QyiqP6rsI/+ew5yvcXMv+5N2geSNafXKmO3yFnOnguKvoQWudGKooQ3KBoi
         GJj9ujCQlVdZXIDjIrABeODTI3tKOMTIgNPM2iHIWtfcRvn0ehe6Vkws0Vn4AO4tk/K8
         vvUK27zh5y6fdOCEqsdbx2RtP5/eb9+/+n/matxxC0ASzWOIkkebcLxeNX5GX5a4SbrV
         Oucg==
X-Forwarded-Encrypted: i=1; AKwUvBz4GAXKEe9pFoDPut7P8r4Cnx3SeacpY/RRoUTYmbManYrBX1zrbwE7IbDou/HRFvdbogYA6WRkAdaDcQeU@vger.kernel.org
X-Gm-Message-State: AFuF++mf7Nh2yZk96gtejgZCZ+fB0BK++MdK4OLTyhEG1t00F0rH+Ime
	W2ue7kK0ccRqbUMCVO4TAEU3lqmGDk2d50vBxx4s8TYbZMkJbTZXnZ/v
X-Gm-Gg: AYBFou12uasWA8lVCNdxZ1YndM4HrAhvR9HFydpkveCaUtXTNcN8zxYXcGImLcckiF5
	kihPOWze7jfABw1fiCGsrvM3I2H2vJYHE0DoEont91XJrhZzucxbuer8vhGUhZ96knfcTdlKArt
	MtCN83xdnRn4PRZUJ01JnpfXc2XPUSo2Urd/E1KUo7eaHUKvdwXhOx3rfhgV72ctx2j30Wk0Mqc
	AAeWU8Mkqhs1mfEda6mwMoelFdpXF3V9VH6vU7FsSMN73TBoZdPFu11O1HdNCQz7BrXBeh++XML
	9p/SbsFZihdRK7SefwGAvPa2B9PDg/Q6YrSnN02GOycmDau4Kp41H3cmPLXyu1vaSY2Df/jpq1J
	cG9iaMSG/f1jXgavz5aCdYHXloGQYvcU+Tfk1EygxbQ4md6oRTI++0GfuV3V+EZ5H2Umm4zRzrW
	AfK04pR6+JzdhUKdmZB3ItR6q2DfFleEgfGihRqlFtYmEz/783PGGJUxElgyFU7jEgAMmNFHnxP
	3FEI8MJoglsj9eXBRR2QAVBPAU=
X-Received: by 2002:a17:907:9301:b0:c2a:b008:8cc0 with SMTP id a640c23a62f3a-c2ac2382bf4mr1095005966b.28.1790578930459;
        Mon, 28 Sep 2026 00:02:10 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a349a0esm35536952f8f.10.2026.09.28.00.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 00:02:09 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 28 Sep 2026 09:01:53 +0200
Subject: [PATCH] mtd: rawnand: qcom: fix read location register usage in
 config_nand_cw_read()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-qcom_nandc-config_nand_cw_read-fix-v1-1-98edccaaea0f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NQQqDMBCF4avIrB2I01bRq0gJYTLaWXRSE7AF8
 e4NLr9/8d4BRbJKgak5IMuuRZNVdG0D/Aq2CmqsBnLUu5EIN05vb8EiIydbdL3g+euzhIiL/lD
 Ge/+4DcF1NEAd+mSp+TqZn+f5B4jgbIN0AAAA
X-Change-ID: 20260922-qcom_nandc-config_nand_cw_read-fix-e946537a0127
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Md Sadre Alam <md.alam@oss.qualcomm.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

On QPIC v2 controllers, when the last codeword is being read, the read
location values must be programmed into the READ_LOCATION_LAST_CW_*
registers. Prior to commit 8c52932da5e6 ("mtd: rawnand: qcom: cleanup
qcom_nandc driver"), the config_nand_cw_read() function did it right,
but since then it always writes the read location values to the
READ_LOCATION_* registers even if the actual codeword is the last one.

Change the function to always configure the registers corresponding to
the actual codeword to restore the correct behaviour.

Cc: stable@vger.kernel.org
Fixes: 8c52932da5e6 ("mtd: rawnand: qcom: cleanup qcom_nandc driver")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index d7642db2e2df..170af9f26d47 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -328,14 +328,16 @@ config_nand_cw_read(struct nand_chip *chip, bool use_ecc, int cw)
 {
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
-
 	__le32 *reg = &nandc->regs->read_location0;
+	int reg_base = NAND_READ_LOCATION_0;
 
-	if (nandc->props->qpic_version2 && qcom_nandc_is_last_cw(ecc, cw))
+	if (nandc->props->qpic_version2 && qcom_nandc_is_last_cw(ecc, cw)) {
 		reg = &nandc->regs->read_location_last0;
+		reg_base = NAND_READ_LOCATION_LAST_CW_0;
+	}
 
 	if (nandc->props->supports_bam)
-		qcom_write_reg_dma(nandc, reg, NAND_READ_LOCATION_0, 4, NAND_BAM_NEXT_SGL);
+		qcom_write_reg_dma(nandc, reg, reg_base, 4, NAND_BAM_NEXT_SGL);
 
 	qcom_write_reg_dma(nandc, &nandc->regs->cmd, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
 	qcom_write_reg_dma(nandc, &nandc->regs->exec, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);

---
base-commit: 55c5b6d5f59f59a8c98a7effc3195226cc20175c
change-id: 20260922-qcom_nandc-config_nand_cw_read-fix-e946537a0127

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>

