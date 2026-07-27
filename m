Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1339B423EA2
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 16:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785169945; cv=none; b=hHXTfvshADnzQzYIUm/4mIQuyI5azDPxbTkt7rTCnsphfqreNHiuNOjsVsPMRLyrBKXk0Lkw9iKisT1ACSIMSOKEREYfJe92AGxan2Vxv+01Qvv4i24UFmSNSS4uWBF6KyeUtlM7R0TQwj7jI8kQ8ExHX1D/uBI3dPcHgr8wL2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785169945; c=relaxed/simple;
	bh=RGCKEOMha9P/cJMiFFMNuTbLtfsjjddXLsvFvL+tt60=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DYXpEnVIYg3FFHkw7FfXo4ihxpDrg0tSvTS7UntotjjrkfbWCObk+5eQp24tWNehROc1ZN+QSxJGIlsqpj6q0eWNsTKpeVQvMlIEZ3uw2Ox35s9AP0WSxPHxmYylk99AvyKiwkYVobLy8UDoqakRJMQ9NGk2TEHDcDcZR3NSUDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kcGoiiRj; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kcGoiiRj"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so13837355e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785169940; x=1785774740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jjStuC+Z5BSoMlb9btbKypwZnxjerVTTywVtGN/OSE0=;
        b=kcGoiiRjLmw7au3yEla2o5cWEH15nz6h5ymWmcmPQWZ6qYFp4mKTZ64gMF0DR6HQp/
         FbouctBjmBU79XgT2xCkP1jvn59PrgJlEEawAbB25kDln/yBsJ6g0V4Y7Z94Tz1s3Tdk
         iLSkZyzYs53ONfqIrbJ4+oiXrMKbAHa+t/r5JogQxdS+niKXCfyj3l3eTausYX7EvD6k
         4Jqy9dT9X0eoALfY8ac6mFqqF0L8yirHCYSzc7ZSLwo1d4zPqqTeO/BTA1L3sJA2Wlkt
         FUFmOYmdbJvUlfGIcyUlKm9pziDFkRyDoGHedkLPsBJAGK0ogtCmU6MxClW47ukpM210
         yRlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785169940; x=1785774740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jjStuC+Z5BSoMlb9btbKypwZnxjerVTTywVtGN/OSE0=;
        b=UXj2ZoFTZ/oMG741aaXDlwjMmUxLwbfJJWqSRwvcdnxzFFYypWmmF0FwbjHP0qqDdX
         XwZ3ww9NtS4XyYWVxLsMMdScUUcmWFd99LuEr3HkGSNFwJC6XjD7yaXibo2LrZA4c2TZ
         eJmqqFLfkPAIy25tcZjkCJRcM0IJ4KUvSjPO8GPttticjd6ACLkzFTz5YO2CP1xaiM8S
         jxsTw+x2W2K8J/BEDMAI00f4kTYFGAz0v2BRNDNgkkqRz9Urv1ai70VxuF5Vwl/zFcdt
         Y2Cqf5BQ05sRnRdiAahUkJvWDu583boFr7LXvo89SYO6UuXr7AeAwzWYd2x3RhABstBh
         wD0Q==
X-Forwarded-Encrypted: i=1; AHgh+RqvhqckOglo+bokZiQ3gVJmtmQN13InFZ11syPGiSDUgvqsZY27t16o3jquywLbXea2G93CQvSF2jaM6b+X@vger.kernel.org
X-Gm-Message-State: AOJu0YyTm7yhyW8sZJ7HXEVHzl4P4x9U/IrZGfPYZIutumovHIJjValj
	KUfzk6oMcH6UA2O1SY932V0msH2wtpVPAqmZKN9KCySrxCdBOnN1kX5k
X-Gm-Gg: AR+sD105ZU5EvBF59T5cM5Sr5xOcXb0obVAKH/Zax3q1W0IZutMKvgD/O1Tgr8pRqIM
	fn6wLhrnMe3dSpoinJ7KriI1ihMAn6MzMe7IWBPvZZuPYGjYRWwAwMhVRB7BCJOnfu+rhRQDYhM
	v+iGCKOiNd9JJJ9ckOEfH3AczSo/an4USxaoFkmnTytzLxf/BaM7gCY++mwppkV5tVl3b92qQm3
	58L5++AcpOcPBOHmVtxqbNsFnSr0K1gs9env2gJ85uog0R81awWF/pWkLdUC1f++6H6xNt8kaLT
	Lu7Wb3kq9wlsKSXaGToqekQxQXbplIyvVaK8hqZTHMsdGK+YA9OcbK79uHUudp6unNhmX/DZPxQ
	fATYRcgj6TscFf3URwFvYsAArl40BgbRLr4XU36uI0usmlMSCTQS+GmLsrx4CMGKe1qFCfyJgrR
	zqacw1NExB1lfiJss1ZFTdPXNg/Ii43b/+SU/rHcFF28h0mnI+/PW0Wtck+LJlII1v
X-Received: by 2002:a05:600c:5253:b0:495:636b:e519 with SMTP id 5b1f17b1804b1-496b56ff142mr126651835e9.21.1785169939939;
        Mon, 27 Jul 2026 09:32:19 -0700 (PDT)
Received: from VivoBook-ASUS-X712UA-M712UA.lan (public-gprs192625.centertel.pl. [46.134.91.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c44a91ebsm4458925e9.3.2026.07.27.09.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 09:32:19 -0700 (PDT)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Stanislaw Pal <kuncy7@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] spi: spi-qpic-snand: write the feature value before executing SET_FEATURE
Date: Mon, 27 Jul 2026 18:32:16 +0200
Message-ID: <20260727163216.109938-1-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qcom_spi_send_cmdaddr() programs NAND_FLASH_CMD/NAND_EXEC_CMD and submits
the descriptors, which makes the controller execute the command
immediately. For SPINAND_SET_FEATURE the value to be written is only
placed into NAND_FLASH_FEATURES afterwards, by qcom_spi_io_op(), in a
second submission - so the chip is programmed with whatever that register
happened to hold from a previous operation, and the intended value is only
applied by the *next* SET_FEATURE.

Measured on a TP-Link Archer AX55 v1 (IPQ5018, ESMT F50L1G41LB): writing
0x40 to the configuration register (0xb0) leaves the chip at 0x00, and the
subsequent write of 0x00 leaves it at 0x40 - every write lands one
operation late.

This stayed unnoticed until v6.18 added SPI-NAND OTP support together
with OTP entries for ESMT chips. spinand_otp_rw() enables OTP mode,
reads, and disables it again, and mtd_otp_nvmem_add() does this during
MTD registration. With the off-by-one, the "disable" write actually
applies the previously requested value, so CFG_OTP_ENABLE ends up set:
the chip stays in OTP mode, every subsequent array read returns the OTP
area instead of the array (UBI reports an empty device) and all writes
fail with -EIO because the OTP area is write protected. On this board
that makes the whole flash unusable and the device unbootable.

Write the feature value into NAND_FLASH_FEATURES as part of the same
transaction, before NAND_EXEC_CMD. While at it, copy only the bytes the
operation actually carries - the previous code dereferenced a 4-byte
pointer on a one-byte buffer (spinand->scratchbuf).

With this patch the flash contents read back bit-identical to a
known-good dump of the same board taken under the vendor firmware
(md5-verified across partitions), and writes work.

Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
Cc: stable@vger.kernel.org
Signed-off-by: Stanislaw Pal <kuncy7@gmail.com>
---
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -1358,6 +1358,22 @@
 	snandc->regs->addr0 = cpu_to_le32(op->addr.val);
 	snandc->regs->addr1 = cpu_to_le32(0);
 
+	/*
+	 * The feature value has to reach NAND_FLASH_FEATURES before the
+	 * command is executed, otherwise the controller programs the chip
+	 * with whatever the register happened to hold from a previous
+	 * operation.
+	 */
+	if (opcode == SPINAND_SET_FEATURE) {
+		u32 ftr = 0;
+
+		memcpy(&ftr, op->data.buf.out,
+		       min_t(size_t, op->data.nbytes, sizeof(ftr)));
+		snandc->regs->flash_feature = cpu_to_le32(ftr);
+		qcom_write_reg_dma(snandc, &snandc->regs->flash_feature,
+				   NAND_FLASH_FEATURES, 1, NAND_BAM_NEXT_SGL);
+	}
+
 	qcom_write_reg_dma(snandc, &snandc->regs->cmd, NAND_FLASH_CMD, 3, NAND_BAM_NEXT_SGL);
 	qcom_write_reg_dma(snandc, &snandc->regs->exec, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
 
@@ -1395,10 +1411,8 @@
 		copy_ftr = true;
 		break;
 	case SPINAND_SET_FEATURE:
-		snandc->regs->flash_feature = cpu_to_le32(*(u32 *)op->data.buf.out);
-		qcom_write_reg_dma(snandc, &snandc->regs->flash_feature,
-				   NAND_FLASH_FEATURES, 1, NAND_BAM_NEXT_SGL);
-		break;
+		/* fully handled by qcom_spi_send_cmdaddr() */
+		return 0;
 	case SPINAND_PROGRAM_EXECUTE:
 	case SPINAND_WRITE_EN:
 	case SPINAND_RESET:
