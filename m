Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810634;
	b=zGAaItNydx0AxZx3EpcihqnjaieacqPiHL/kPxWmlvhP365S/ld1LZadKtlxVGSctD2y
	 FVwzBBmA1QUylQFPn8mEJotBlfGJ6HbulFz0TUHFCHsgQLsfBXR7rHCmam+tFudN21Sjn
	 j9DSE2przuWjUhnkUdGLiO10woKHO+/mM6YLfh78poR/SaEaS/eaLmNa1v6Uy/Zo8aj5T
	 fvQ/3wcWXgZjGC8V433Vf8Etohdo3c7ZDwxosrnakG4+beKw7Vzc3tC5AMUCNFPdAba3+
	 t5sYuK8ZmKYjP6yfuEjYK7SYFXx4gmhpHKPLHsRcZM1SpOIE7xh2C3AAzPgRqlxqpDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=cPYf6hAVCpQUew2+XnRE+2ErB2I0G1vs/wGjfQG7r+A=;
	b=FWa9hP9kkgqd71jwTXxm3kjg2l6S9SWbSh+bfn7ixNbI6QO6Ifa44KzY5+EyE8oSBa8M
	 KMceGXJeCGelnNBPXdtew7709IxnVXkChoBtRYKCSTEN3/fEI4t5Yqtylmg/qpUB/8qaU
	 LKPNuWy4Cie4zeMSzw39ywf1TYD7oMIxq10iueTS9F492oqJ9sADunpgEHiH6PMybEqvt
	 NtJgo/2VwqmeqmRozFhYgbgD20sS651R0HErg9CvPjSqCbc81IOhLJggj8kBdGrO1k7ka
	 FWo3hsq7jc2hQQAfZAXX0YRh8dz9c6Amfp4GutSNsSesDLuM+Fxumtn6z3eSyfrKDrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PFXI705S;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7426E606B5CE
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 06:30:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7426E606B5CE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PFXI705S
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-71ae5389c00so642817eaf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 22:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810633; x=1795415433; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cPYf6hAVCpQUew2+XnRE+2ErB2I0G1vs/wGjfQG7r+A=;
        b=PFXI705SGC37+hek6XQ+e54Y+FmE61eEBcqSxdQNqczOlHqaWTquCcVTZ9mi92fSMy
         XY5rEb6Cecizl3XbYiMYprY2IPq9txcBTTkr7gsm5djCZcNNZjJZ90uoFpNZTC8ClcY1
         T6W7gK/+3h604nMG0S/U6V35J6g4x4b+qRfTi6ZKQBcahJZ1rTO1rKBshGETTAkCoUc/
         IFhe+uJYE72qP+rkpvYeAnT/zHw/ydzb6TvNx9XdlvJ+dwTL7OGi05gEH4cFSoEPXcL4
         vFAPSFEsgngFWj/fudruHzjCeE0iA1yZUt0t4WyEfX+Guit8n6fJoMUD4rUnazQVJmrz
         5bBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810633; x=1795415433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cPYf6hAVCpQUew2+XnRE+2ErB2I0G1vs/wGjfQG7r+A=;
        b=Q4WezbUWA+1/mAvOwiTLtkXADd9WreyMzbBCw9TRluS6are2+S26i+qjl8Bd926Eh7
         aDAnmsz6JGl3/0GVF+r67ypAfRHlnF6Z+rbwzZc6VA+xHk2qSSI1s+fzSqVBLVAp1Jxh
         kjZykxRF6sccu9lhPjtyUw6HVf2LPx5hNdIdYTx+EG/0UsSuIm//1O+Uk2ewY06jYaMQ
         B1aOYU8voEJCPpOp58tg5RJyo+57S3hNa9reKppjUviXoDll2m3l4Xf6+epsc3jLVwG6
         E6JeNQRCMzoPlCRKpCvUP7DkcJEw7zfaBHthzdFeMq/BqSRfJqBMdFZdnmeeMXn189F0
         qtbw==
X-Forwarded-Encrypted: i=1; AL+hErEB7dfJJaCOvvk47eUz6qpyBvJcZ2poiBXhDIcLlkzxV3qwsN4759G/IMy+j54BGFoZQoy5i9tNBC1KT1sC@vger.kernel.org
X-Gm-Message-State: APuU4Z+18c9m4fwdlpQRcuOwfxD6GJGUn0jcDN5LnCj9xylIUCfVuRvk
	q00BbfDUv+jBmmgUntv09sEXdFpDB0HusOX6ZgfP07LNxVrpQo6DzTfH
X-Gm-Gg: AYBFou02lyTpcAR/XU1LO1bp8/9xQZdS22Eq9wLyd04t/p7xOB6c2QCnhbydNfIq0Tz
	lHVB5d2soGNqndRn7+o6MfWy4ALDGlvZgheMsGr9uwGV+vvpfBKkGp+bIt6JFVdyPYw8fpgKkFg
	blw/8wo34MOsj7jJ96fOBQkDIbh/C8LzRn3cT8SWVWXnDMqAGh07N2BgSVR6A5nBKVpZgk2yf3G
	7uN8WXSrNXBBZeVHdSLQAZ6FBuFe2zFrOjoqPU8pNjw8z/TcZ23yjcCRgMnlR/10OsbOAmtYbIX
	EQDE3c6IZWADLWUXbrHfyAmQAAviefD5QxRT5wrXjd2Nqm3mXeUXWnQnnLBhW/Zt0W8rTJ5o77e
	+ujWFdZtSJ1+Gqux7yZtQNDSPd/nuhg7VSu78sOGvsgYHPN9fMVIp3UgNvMO/eJ04cb93kuctQ7
	Q6sRCJ0bavrNNugt0U7TcfM4FeaogS8/N3lOjKSo1QHg1GZmz6E5Sr+16m6ylfYTCTUQwlQpXz2
	963O4WtULElCAHBahzpI0MIBTT7u0miGCX/GyPeNsHVD/6KNH4dd8W5rUxBzoavsiKllbLWe+G3
	KdjfwUvlYDjd1fwzwugwgAQsYLSpLj9V1uXWp62+9uspcU+502sT6Tl0OFnBHXnnUDRtDIeWf/h
	DKVGvZAYrkvbNX5U+R8R29BfnNk/JM5pxLO37f+WnQoig59HVTe3J0WrCZgfrcMZpm8yKcN9oUB
	HVfOffEN6Vso6DfLhqFj05yMOBxVnqJeww3kg8lygzgpc+smysk4rZLhIz3lkRJR2c7emtMB8p
X-Received: by 2002:a05:6820:1396:b0:71a:e21b:8213 with SMTP id 006d021491bc7-71ae688ed43mr2480312eaf.13.1794810633535;
        Sun, 15 Nov 2026 22:30:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:54 -0700
Subject: [PATCH v5 39/58] mtd: rawnand: qcom: retain open-handle state on
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-39-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, linux-arm-msm@vger.kernel.org, 
 Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.17-dev

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

