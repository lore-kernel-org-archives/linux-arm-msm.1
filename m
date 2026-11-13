Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593778;
	b=QXYnd8r2bFuRLtk8lJn58EF4OrQ8RCJ6ExrHTd2VTpg1YDfcISH2VsaxMjBzC+l6rNKJ
	 Z0iGMXAvScBSvZuTiUce0fERjnsejPWu2f873X7d+GqJS0uQCPu/mYF3E2Bs6tVQD9aWB
	 Gr0NUdkPAS2FKFeduToMbgCnGvvlH9sK4fkwrmmOzLSinrL9hI7jLOLVSDNuSWnRegLVJ
	 quoYAQzoLUaDe/61D0GkFjSai9BT5mEsely+vAMNC9V+DtV6wRR8mCzWsDsFwql76MlGS
	 okJfpBwj7/63F+B0yv/Ghl7gbm8AP+TBT6NbBGyIhl4Zd7OT4yH7zrEGG5bv+gva/dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=cPYf6hAVCpQUew2+XnRE+2ErB2I0G1vs/wGjfQG7r+A=;
	b=S8MX10P+butDngeeBcpJRQ3q582u8l3FKds9kHS4yl/6HpNAsT3kE6bb7u4GL268D2k4
	 nJtMB4sfOV5bU3YMPT0rpEIbdbFfDmWMVwmp8s/ppk3JkP6RJGqvDnbq0scC0W05lBYEX
	 EQro8/4Oe1X74nLvtBTnmuVriX13lt1RJrp1/+q3UGfMpVZ8r3XDRoEawMGioTzFqXNj8
	 s9YykZbvdhkNwKe2POYl3d+pECLfAqyyk64SeoUWVO0jHHEECrG4pKkLoydCBgRECMJcK
	 ohjYgfKRONHVy590KSd8Rm+twVX2Q/vORfsHaPXJXH0IsdxWz5lfOxyTkqR+9hJMJYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gjsk1ij+;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E844360A3826
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 18:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E844360A3826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gjsk1ij+
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-843b6f8e2c7so2090465a34.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 10:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593777; x=1795198577; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cPYf6hAVCpQUew2+XnRE+2ErB2I0G1vs/wGjfQG7r+A=;
        b=gjsk1ij+TMXehC6idcCFSaAmIE4QZkpthjx1TmCgF70w4d4JMLkwZobwuAC+RLkRLn
         DgZZTPjsBk70CiiL5c+DrmT7kekaOsf24gkixesUkjxJYwjaQD8HCtEz6x28s7hox5NM
         igCCXQeMrYsGoYrvDC26e3H8Y5SBb6hKxmp1Qws6Q2vFsPFFqLThA5efjyKkAFfb4QN4
         IQmbsuNxNg7Q9kTqzsSOfn+kL5vhJoO76O/2pP6NmGfyl+DqqSWKntjx8ekDZehNAwrm
         /55fwPZHxW23wiep42tb8TzenYqP5QFHrRp8lWU5J/0f9q/vZniOxzSJ0/ueq3k3mITm
         98jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593777; x=1795198577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cPYf6hAVCpQUew2+XnRE+2ErB2I0G1vs/wGjfQG7r+A=;
        b=sR0YL+xGS5OIKZWzAJcSsBNp5o2k0YkTlWuMeo5uzGOWNJfSq8kJPT/rkXapfls7ES
         Kt8IRbJj+MVqal/+UtJCrm3R61WO2pro6tSs3C/PxoglJDFTP6/3zyRdJ+0Ukc6h4Jyc
         AXP6RipBdM4AO5k2HELxZyuBVecAexECQP0F2YRGScwp/krz0DKnOX/+72hhPqLt56sT
         jPdKe7JqGR3n8d4oFrwjOSq0W340BP4WShTs+iFTyU9ZDEKyK1TKnEPqQLe5rQXb9BJD
         kVQyOb+lrONiqYV5OWkKttuVoPjRrjLsNJLqF3V7bBwkWn3+7zESBDy3EmA5xITcxCI3
         tyAQ==
X-Forwarded-Encrypted: i=1; AL+hErGoztq8UFww7G9B1TpMPFCfIhuarfeY2NeMVWI7j/EIpM6nF1UFokinRxQPXDCueTm7qTrlmEIRoYj0jyKY@vger.kernel.org
X-Gm-Message-State: APuU4Z/RjeC6g07lckMC6ihvulLuP1oe0CJIAYKXg5RahjRqAPr9irZj
	+dHUoXhnaocJ4zoZGoNfyKGUb1mCKrfvYTGqHiuYwlyjebHmH3lcY9DZ
X-Gm-Gg: AYBFou0WwCryvkPQCYym88Y6PDv38v0oynYOXg190TdAX8htZxi8j02tKjxY7Z/xise
	e7giod2QqjwvSR4bygFUWl1aPzR/B4KzSxg5xLxYLuEVJUpLKLlTRs2Wk0qKLp8vukaP8n1dM9C
	ZuwvDnTdM5UZZFSa4MGWXmm6x6UbZiYCvONd3a0QRwM6cVviW6jR3GNsxRMGakxpL6zuwXK3f5s
	KDpTrMqW+0XwoBT1PdNHiXZ3f9xUZ7qMaDhJ7TpI/NJm0hygNeIuEOPXWNRgL3v2GnnwHx8Zye3
	pscFve0iMZ5YVkPYFFAi5A7t/dZyzIFTui+QCKwlDyXWkQS1z2zFIpg6pAQ7uR4TgvK36Bg3VSk
	/t4/yyifMQgAFaU1RqYbbpYSt+X4s619SW8mJC1L+VUXMB5W8J5lq+ekb0SCJgFIlMi7scsbnUQ
	SmcL2ydKtrhvO24K2vYKViQyDyI3Wxqak7nAtqldILIvnOLltOoJyBq4Cb6tqHnVB9r1Gyg8hBS
	cDwv7UPM69wOBUHN3ShLGG9bYsXRvq5SB/nit2gu8adKJefEcRUFozA8nTRj7U/U3+iVna1+/HS
	RB7TTQNGVd3Sk/WH8Pc+QvOyZXDcb8L+T7jeZlAtkNUDaDytSDjhjTpGX5/rhJ6mi9kiiTKacld
	udZ0SSvdSQKcQIsZq6a4b0hsZr8a8tqYyS8dW4SwzIxBV3tOtIOCgTZ/O5ftrlCrxthA0pYwsqT
	3bho2DgHQcXrUaTWUyBt3ykILZi+x/2k+1N1fwWruWLoprano7UTU=
X-Received: by 2002:a05:6830:3491:b0:829:2866:3106 with SMTP id 46e09a7af769-8628989b101mr2619090a34.21.1794593776899;
        Fri, 13 Nov 2026 10:16:16 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:55 -0700
Subject: [PATCH v4 39/58] mtd: rawnand: qcom: retain open-handle state on
 removal
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-39-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, linux-arm-msm@vger.kernel.org, 
 Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Install lifetime ownership after scanning each chip and before any MTD
device is published. On a partial probe failure, unregister only the
published chips, then disconnect and release every initialized chip.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: linux-arm-msm@vger.kernel.org
Cc: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index c2ccb999ad8d..3451687a2bf4 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1903,7 +1903,6 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 {
 	u32 nand_ctrl;
 
-	nand_controller_init(&nandc->controller);
 	nandc->controller.ops = &qcom_nandc_ops;
 
 	/* kill onenand */
@@ -2022,15 +2021,17 @@ static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
 	ret = of_property_read_u32(dn, "reg", &host->cs);
 	if (ret) {
 		dev_err(dev, "can't get chip-select\n");
-		return -ENXIO;
+		ret = -ENXIO;
+		goto free_host;
 	}
 
 	nand_set_flash_node(chip, dn);
 	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "qcom_nand.%d", host->cs);
-	if (!mtd->name)
-		return -ENOMEM;
+	if (!mtd->name) {
+		ret = -ENOMEM;
+		goto free_host;
+	}
 
-	mtd->owner = THIS_MODULE;
 	mtd->parent_dev = dev;
 
 	/*
@@ -2053,7 +2054,7 @@ static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
 
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_host;
 
 	if (nandc->props->use_codeword_fixup) {
 		ret = qcom_nand_host_parse_boot_partitions(nandc, host, dn);
@@ -2061,10 +2062,15 @@ static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
 			goto err;
 	}
 
+	ret = nand_set_lifetime(chip, to_qcom_nand_host(chip));
+	if (ret)
+		goto err;
 	return 0;
 
 err:
 	nand_cleanup(chip);
+free_host:
+	kfree(host);
 	return ret;
 }
 
@@ -2076,15 +2082,13 @@ static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
 	int ret = -ENODEV;
 
 	for_each_available_child_of_node_scoped(dn, child) {
-		host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+		host = kzalloc_obj(*host);
 		if (!host)
 			return -ENOMEM;
 
 		ret = qcom_nand_host_init(nandc, host, child);
-		if (ret) {
-			devm_kfree(dev, host);
+		if (ret)
 			return ret;
-		}
 
 		list_add_tail(&host->node, &nandc->host_list);
 	}
@@ -2106,12 +2110,16 @@ static void qcom_nandc_cleanup_chips(struct qcom_nand_controller *nandc)
 	int ret;
 
 	list_for_each_entry_safe(host, tmp, &nandc->host_list, node) {
+		struct nand_chip *chip = &host->chip;
+		struct mtd_info *mtd = nand_to_mtd(chip);
+
 		if (host->registered) {
-			ret = mtd_device_unregister(nand_to_mtd(&host->chip));
+			ret = mtd_device_unregister(mtd);
 			WARN_ON(ret);
 		}
-		nand_cleanup(&host->chip);
+		nand_disconnect(chip);
 		list_del(&host->node);
+		mtd_put_master(mtd);
 	}
 }
 
@@ -2149,9 +2157,12 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 	struct resource *res;
 	int ret;
 
-	nandc = devm_kzalloc(&pdev->dev, sizeof(*nandc), GFP_KERNEL);
+	nandc = kzalloc_obj(*nandc);
 	if (!nandc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nandc->controller, nandc);
+	if (ret)
+		return ret;
 
 	platform_set_drvdata(pdev, nandc);
 	nandc->dev = dev;

-- 
2.53.0

