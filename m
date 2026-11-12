Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446953;
	b=0V363r2doPsTXp1/FVL2cKj18XDTTgK/D5xNu9iA52UvNx/TrYPbwphpQS4iI4qpCaNM
	 FEJOmFvsvZreopkkXoPU/3EzluQgCm2BQdBFqIjQ55IRKM8AcyLCmPKeHgSeSkD+g8yGh
	 B49IE57F2zZ9qnET8A0j61fMu0DXOI4cPEWDxbcMdz28ICylRiQzzxPUudkp7UrNcnqCh
	 G80eT3kLF3L1Dx8ms8lFWdScoBRRVt5fNeBza/35pQvm12NB8uNubajFKe+3aiHsxMdn5
	 F+8XmOImf18bjxAWDb/EUnTdCOe6QIreFN75jqL1EBQN2GUyJ7SLPdW7FETf6NK3Wlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=cPYf6hAVCpQUew2+XnRE+2ErB2I0G1vs/wGjfQG7r+A=;
	b=cfh+ISiF/5+5P6W45IiQYClbya3+agfFG+wbzlb5n6Bb/TP1mbH/Ax/4p7UTQpur0hOW
	 WGA+NWyd1ZrZ9XE2CFziY9/YiuvOYc/37AN/Na/tWPjXgIwHe7HE/roOkUB6lz23Dh0Vr
	 RYch8PWLOqPIqTc99FDpoY0U4ackvBPbvhbk4q/Pf25rTjJ+nDgixF4MoLboocyxKJPsi
	 iLFqc+v+IxXpbCe2i9ED/IcqNpdFi/ImRzGTzf3ubao8X1Jt4L3erL17Fy3O7QQC6uIog
	 AuMYq09DyqSFTq9xmBspV19G9aXGsyrkAXv1pyhplet+vcXrCwFbOTmmgfrHyHitbwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GYABgALX;
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CB6606AD6D
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 01:29:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23CB6606AD6D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GYABgALX
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-55e0090c580so1223210b6e.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446952; x=1795051752; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cPYf6hAVCpQUew2+XnRE+2ErB2I0G1vs/wGjfQG7r+A=;
        b=GYABgALXLi+ZPqW6skEeKqvOwOry+CnH5A7oZiN6XiP4xdC4ad303+lV97E6b8bieN
         4U0mOSY0pAviZZbD4DI4oK7TbTRUQYGB7nCTC6WhckZIomHaWJ0PJbPjdbv+NM+UwuNt
         1Lend/Gm5kVQmVdeXh7u8WpJfidvfMxmY05MsJVTlpoXjf255AK7cpuGET+UDsxHIdyi
         s7B/1fq6QWMHRh6586+C9Bkf9h501ViiZ/VXWsNDhzysVNDoQWeyTTc8+P93KjKAarNX
         E/X9w93InyKvYAIlGBdjsT44i2+0OU39V+bEKtNXqFDFGMSXPUqYppQZfxqXwqIB8Xbn
         /rOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446952; x=1795051752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cPYf6hAVCpQUew2+XnRE+2ErB2I0G1vs/wGjfQG7r+A=;
        b=XchgrYqA3stvQTtKjhH+2af+iP8YDf98Bmx/CwC3FRHH3DKoWyYbOOJfBSWmgOYoiZ
         3nDnj9pMkOxW2WjeshKCRLpfeLyrJIc2qj21/Zq/GorD0pIW/VxOPIZFd6SBDH8spcRg
         JGr8lBRZRftQgLcg4bJEo9oKXSlK9AzGu/ND/JHoxPSTBYmsmice1rMx90br/cp2EhuZ
         +H+mPvzLYFKpuenXo+JyiDKux6CP3aS4ePR5BDUKOdW5kvRXPE++DmVYZqbCnyQ01OfI
         6VMy3xXzNYeHLhbR2IXXoLYIpIN264+kuwWF/r4tujBipSdiliSW/RhHLbj27uSx+bZ0
         xBeg==
X-Forwarded-Encrypted: i=1; AL+hErEgzUZDa4NZM8CYxc1Rn1/EAY4rSMRw6RQTUi5DmWZB63vnsWaDPaMIr4AW8nMQaB0IzDEkRa5F0WOycEdE@vger.kernel.org
X-Gm-Message-State: APuU4Z+Sti+5e/StAZgfEUhrWiAJU1dQAyzyn0xmQ4eYr79tix5b1hiu
	dkp3TZ8z8giXhKsCXDUtqqHspOmcAqQ6bF0w33E4YEJhAhJ8KE3j/oKp
X-Gm-Gg: AYBFou3fzWT0dC5wXFVzeBHSW1dMGq044Q5Z9Py0cQn9EASSLyDu6qA0gZxn1rCvcNq
	VvXz6VvCngoA919fq61FHc+Sh2S//8/0l/+K+wg6JQJNU3uCeAvlAEmxcpNbke4yT+5jZgVg6xD
	pOfxTHKeQ6/+C5s6LhznqOZo2o9tfQIubLJCAt3/w5a4MXVKWqU6creLORFUPbO6BO2I/yRcLIe
	WyF3PG0HmN1gGi4T1xFpp1tnLLdYFcKv722MFeRE+ZVq6UbV8nusOINoNlmgw6WKnoKG3PFWFnM
	0+jvOUbV5fM13vkbjSMlRfofvadD2EnnIA2G2HPn2TCZWXQWIqz+nP9GMy1vOo67bnYkTbpmASQ
	VRwN0j6OvA44Ef1ddmqrLQg55Ekogi/zkt/Hj6Vm0Vf1ZYEcN5rGvLLJS1FiZ0mykPGsWO3jjXV
	93kj75rvaE/ox798RyNQQq6uJ/qo1mowakpLC0p3Jqbgr4IaK7PA9GCdwS3mL+iUNe1nCgepH86
	E4ZbJreYHIn0JAglF56AcE/XYhCWrBsH53ZMMR//uDKNT5ArALIMtgnq+vdnhFg2BGtD351NWaO
	rYrxWiX4bjsXmVi6ZMw3eqanm+6UsM4JKGNdAnyLRkygB6O0fE7u4avZJ1h4cOVejjNLepI9F/O
	lFBvxAfsO4PrZTzPUFIIkaCXUtMxvmIqGp9n/tOhR+ifAamg0t3p6K761pggUiruWm1BacFUkzK
	BCqHwTV33rRH5uZhqt+Ns/rK0r6HSAquOiDFU2Oz1dxzqqrNdYfYRonx7RvPw9bz5x3y13nJkH3
	w==
X-Received: by 2002:a05:6808:1304:b0:53a:6769:c35f with SMTP id 5614622812f47-56b967c9b4fmr4139860b6e.33.1794446951849;
        Wed, 11 Nov 2026 17:29:11 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:18 -0700
Subject: [PATCH v3 39/58] mtd: rawnand: qcom: retain open-handle state on
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-39-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
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

