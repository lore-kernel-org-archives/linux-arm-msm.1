Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39401486656
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 20:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790280279; cv=none; b=mLgTIxxSTReE+2K4jN7dFlWOwnM2xAVCrCd2YHDsnUUdls81u+w9FDh8kMC5j5cztmQVlwI8azAhel5xLyi3vRDTPM9NE9jx3IKa9sh2w5VhnlctxfhyW+NRpToYJIc2QvUlDvEuUkln4JLFfc3pailXdLKN/6H37VwzyQ3PsXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790280279; c=relaxed/simple;
	bh=WosMjBO+xf7IXWUPOWZ9UXNlQgliPHNXn6ddsipteq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XpHydl9yXtHHT1JOJw4TmeT0DLtP606wtth3UF4ITiVtqamP9z5qlsEJ+uQy4fuqCDMpQglKU0Pd57l2l3ttYSbU0HDAnchAVjac5iZcuQvQEIyt4oejW4IKS1byah4H0J13XllYwp3i2yGHsuguJzylEkEHmkPacEDdMVFYVs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cr+1xvj5; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cr+1xvj5"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so1269615e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 13:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790280276; x=1790885076; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=84MNNzdj38+RRn+cQS3dhseIihk2PiT9tbM5RlyvpmU=;
        b=Cr+1xvj576kVSz2HgeWXjU8Z896s4dqyV4CRDV7XKuyczrb2PyB6RwkuuNSjkyDE9+
         IYqdxi4gDgsgnF8en8lFORPcCqvfp9ImqOSAEMALmFLeQlD2nZMBOqOMH3tgRvmVySAa
         MzblSmXDQY9POgoTNY4QXAQgeiwt1wA39V+ev/NYEC9+rRfYDNSXtZ+2jrBH11sbI4Nt
         ++mGQIgHJQkEcfI+1QnndU9ZmcWxoLT/Ai7Vp+kSCy5dXJPo+we43c7+q87+HgHVjscl
         CkZARnpWNTIXhxVvMv+N2TZQM+syavbkx6MiWk94LcZ5sDqy9mxuCwxxe4enOqQPe0X+
         +PIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790280276; x=1790885076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=84MNNzdj38+RRn+cQS3dhseIihk2PiT9tbM5RlyvpmU=;
        b=A8p4zKlSvuLcXhfJxPeujSM05R8VtrDY/t8g8UXmsWGbT1Atoep/xgolV50N8EAL+m
         xLiITNrN8J5XHtGkVzZUz2LNyM/ZOLFQJgmXi3qEjRXswwMAU9XP1aDR3psfeUEdF17C
         RVEyZ4eKp891NzSCBX+9N7Y8rYfaODnc1qrgYcXUt+wK5iZOSLuZwYXZ3EqxJ+GQqrNd
         L1PMCZz+tL+p3g1/cIsnjzgDJpNKCKpLQjG3wSQbZ4XPTNV0zMkMfCtqcVNDB+BZgq/N
         8YKfygzEncMigx/Bg0DeiuwnNtgghGzeDDO53KV1TQuFLYBFDKqCa1P8GCOe9o6pzXPc
         oLHw==
X-Forwarded-Encrypted: i=1; AKwUvBy9Xc7GaQOkqIUwbXcyn/gcrIyLcXEoWcA/3oLdRK0GiVDFknD+a4Naru7VmE50S+8x89Bufu6lnSHk0mHE@vger.kernel.org
X-Gm-Message-State: AFuF++kIa1CxAyoKXEDyuZZZ8ZHKhH1rNPa0VL92vnWkTA83GEM8hRtr
	tslDofckznz05osyup+DNsakynZpw8FxWJGhj84kkl2J24txoR37cn+i
X-Gm-Gg: AYBFou2BfXL/esMkT+PyTKEjHzpBO0QLQnduzUP/ZJm6OX+ioOXfm2Xu9l8QHX1z7SM
	cJY3tM3X8EqKJUSXyPryVvzKZSWBygc5/jkBZnf7p7FcgrU6Ctu7AgTkei4WLtlaBv7z3IUGXKj
	uO/z5L0zu65eaVqCgFYHfhlCAuXT1i9pod7QKY4j91FVFmd2ke23SBhZLc40r5yFCNJMXJ4LJK4
	wDVR5oG8moR1K5xZKfINFCS/DKIegH09q5KIp4aRsEd6LcG2VT0X1HLVPmCR2y0egtrHRO0NGct
	JDO6vcd72q2KqzFU3wOouwVht8ExcKZGBTip/nyYZVZoVXw0gKTVRuRYF6uByLSEuQW7OqZiDqc
	cDK/OUnZxr8qA1dG48wXNbnQ1MhlD9ynoscn6p1LrCSg0Bg0Az+6w4Az/TuyAswVLgGZiGcPpC/
	t68G0/tfB6I1GoU2pwGyEWl8Beo0FQBvTCqKO1ItOIYkHTz+9l4IRlFuJ9FdPepbx98VevcVS9D
	o65uYr+afGZcWYhp66dX6n5jK5I4Pu7BXC25g==
X-Received: by 2002:a05:600c:a013:b0:49d:2555:1a6d with SMTP id 5b1f17b1804b1-49fe66f1ac3mr55486165e9.16.1790280276412;
        Thu, 24 Sep 2026 13:04:36 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm1551603f8f.4.2026.09.24.13.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:04:35 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 24 Sep 2026 22:04:16 +0200
Subject: [PATCH 1/8] mtd: rawnand: qcom: make check_flash_errors() more
 generic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom_nandc-share-more-code-v1-1-f3012199b161@gmail.com>
References: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
In-Reply-To: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

The function gets a 'qcom_nand_host' pointer as a parameter but it is
only used to extract the nand controller's private structure from that.
In order to make the function more generic, change the declaration to
get a 'qcom_nandc_controller' pointer directly, and update the callers
accordingly.

While at it, also change the function name to use a 'qpic_nandc' prefix.

No functional changes. This is in preparation of moving the function
into the 'qpic_common' code to allow reusing it from the 'spi-qpic-snand'
driver.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index d7642db2e2df..12bfb14cd9a3 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -449,10 +449,9 @@ struct read_stats {
 };
 
 /* reads back FLASH_STATUS register set by the controller */
-static int check_flash_errors(struct qcom_nand_host *host, int cw_cnt)
+static int qcom_nandc_check_flash_errors(struct qcom_nand_controller *nandc,
+					 int cw_cnt)
 {
-	struct nand_chip *chip = &host->chip;
-	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	int i;
 
 	qcom_nandc_dev_to_mem(nandc, true);
@@ -538,7 +537,7 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
 		return ret;
 	}
 
-	return check_flash_errors(host, 1);
+	return qcom_nandc_check_flash_errors(nandc, 1);
 }
 
 /*
@@ -1181,7 +1180,7 @@ static int qcom_nandc_block_bad(struct nand_chip *chip, loff_t ofs)
 	if (ret)
 		goto err;
 
-	if (check_flash_errors(host, 1)) {
+	if (qcom_nandc_check_flash_errors(nandc, 1)) {
 		dev_warn(nandc->dev, "error when trying to read BBM\n");
 		goto err;
 	}

-- 
2.55.0

