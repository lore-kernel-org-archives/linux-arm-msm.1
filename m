Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046620;
	b=Gx/KvZ4HYs+u/GBS+sWKmzcpv8ko8Ck0b2OrJkrqxjSf1/pyiPN+mFOf5CdJfPo4tKGY
	 fysxM+94PBlx4zXYHa+xC+gIWEZtverPKDMd2JRd0PlhljB7J5O4JCXkog5y8OiPPilvr
	 2M+j554DIjCBGLUW2HafUheknNao0XGZSYLB7sVN3ZUH4YHIHOFSJC2nACgg5hI62N4vT
	 vBcyjlZWEtkuYYXicsAShRNF4HEX2ZsWlFqmVYHCsZZ9gU+n4LNPww8rx0cTWplpYqnc4
	 9jp7RShfU/n4+//Ty50Ai4xP5mhfQa23vF0zr7GADsQ1J6E/C3lpah1yS98By4lePng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=zPNlTJQB2JtnHksSH6UTNWuXH1VDaK++sm3Uz94AgtA=;
	b=eDvpQjM7KtJarGZEPwqss7yA3nwFOxh7GYnJzC4Hy/mhUCVnuUZlMbbGSa4qVwvOpuX8
	 LrCfSrE27flgIG/S1mnGZE1xkrcamZejlUZU+a3aglX0MFn2VbpqP/LX6icqjEGiOl3Dj
	 owNfZoqqJR14NeX5jwjMDbOUasfI+VIu1GzxxnRJEg1piCbVT++SYZl5UmipqVjn/nVxU
	 CDCUPaq47Xfj9NS3zd+BtGvWWcAHHsLlVmeaNSi045myeCSSC+GEXCKefB7zG2s9eMbPT
	 iLFgAzu0LXoN3SdYxvJdrzGEvL6tg47tzdODtRLrgOIKk8b15Xn/9F4fYgnK0wX1YOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cXya4JAu;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4E260A260B
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 10:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED4E260A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cXya4JAu
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-8253bc5a613so872296a34.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 02:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046619; x=1794651419; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zPNlTJQB2JtnHksSH6UTNWuXH1VDaK++sm3Uz94AgtA=;
        b=cXya4JAuj5tEUALyKmvNSPlWdirJXyYmgFDcWB/5JVyREb5d8ejPsldlzD12oiAjz2
         Kf54eb8Tr7R2RD/xHP1BTxC/jFoqJFtJ+0ukNcz9HXL/J2UgaJc01cDIbHeh2h5AQMmo
         rOJGLCaG9WwIhkluVCfvxh/o6Zq1ad13DWixV7/P0fbSG0AUCN6RZuZKbMnwdFuAmKn2
         t1M9kLwucpA91jANYMiUqxfNxUHzKPLT2idSF9MdfJ/Mw5HE0XWLKAwiW/wj7cCGL33U
         MN6oGXcjibltHyHF+lzImAHum1q++PzKgwPqw1UwTBs4+DjfNXk89vXLLE8gQWldtHAS
         oI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046619; x=1794651419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zPNlTJQB2JtnHksSH6UTNWuXH1VDaK++sm3Uz94AgtA=;
        b=I030R9ktftEvpSB4kol6HJq0YTvGXI6uKTRIX9ZUtDahQFDs2aGN0fBghfzlsfUWsn
         UfyIGVgWbSN2QUijhGAYRUryi0ZgsrnEY5q3PIEL5vE4+rnuX4E5Ahk6g3o8PgrjhuIS
         iiRP4Rbh1RBQoqhPCIPpwnjRxbvDc0n8zW4drLSgtK4TxQRMR9LsfHpTn0EwOAvjJrpe
         svwf/Cqd4bx2Dymv+SAb33eYCu2UnWVzPEV8coe3z7MStPIlj1uQjuRSVgT8UoaQImUY
         b1P6b6aJ8Sor8v3o16crH9tl4JdhPwOfsGS+j/u3JFKdPdvrx+cpdX4ClA7wCNHppLX7
         SExQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyWm/JAmkbyoBMJEVumaDPwiJnGU+4ENWqwMjJCAF93gVx2Z7hULQV3X6SEwOA0H/Z7cXcqoqC1RtaExC6@vger.kernel.org
X-Gm-Message-State: APuU4Z9wrTktdvd0kcrLpJtI5mNwocYfK3xGEqgUZS8cipW/A0QSOIIC
	TQk8lCZ5UirV6uPpOwMuxupPn0QKvTlEqThZWLeZz+YoANfc8+EFGc1c
X-Gm-Gg: AYBFou1H2KqsTFc6Xh785tvSFDVstIXdDgBnGYi7tpiHQ0FOdMGAL2N1s8voWjPuUi+
	+FbWASKEgiOPyAQTrWXmHlU8NBiNAUfoiA9QjIvAvgjUArueMfk8JznU6IqUGQ2m/y8hU9iSA5r
	73L1pJjghAj3kGYLDoLzxy0jdLI4rANrvj2TXUtWSXCFXcf7M3dOOXqqsh+LOfwEOrrUzejl7jx
	7so7JA/QL96qIBk3eb0RESOQET5KwM6jbBFFR18VHKNwiUCBvmsHAuW5gOxisuMbKdRBjfep1Km
	m4VRJ6G3AGxESleFh7kx7LKJGmcul0TZKlaWpYCv5Ig6CDdGz+Y4FSFMvKJN+x4yn/oUWbeJ8Hd
	XnFspdgl7sTQCB+5JGp0rVtg6H6oDWCVQNWF2x3xF6MZYjJcsWhSGCznyuy1eQYcRqJS9GXQSJC
	CNRCFJnbsoEOG4+bBbbSNP5b7T2X+dRm+UoYG/ZBCRz/ZB2NPp1yr4iXrOgsWY8pYOSscaYHHyV
	Mts3PhGIzG+5qkO8HtznX2C6mHliGMNfJ/ySyhHR6CJBl3RJQ0iNeaLVYikp38f1BYT6QzSyNv6
	YgCOfwOv7UhTBzl63c70higR2mtXrFhieVAhn/GLTRWg8INEENd1GuW2PkgHKw9xj0Wg2sz1bQ6
	Nfsmiv4DspsY4QGvxKRwddyzbFEScQ1vq749L7yOJGu1CBVgef+adLNKxXJEHYgzpIBlsf2n2uM
	bqzfYdD16LR/xRa3ncZzt8CfUEVP8/Ty69gnav8P2nD81QEH8IiNmj
X-Received: by 2002:a05:6830:7182:b0:85e:f82d:4389 with SMTP id 46e09a7af769-85f1d001fdemr4006750a34.14.1794046618968;
        Sat, 07 Nov 2026 02:16:58 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:09 -0700
Subject: [PATCH 12/58] mtd: rawnand: arasan: retain chips across controller
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-12-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vitaly Wool <vitalywool@gmail.com>, David Woodhouse <dwmw2@infradead.org>, 
 Russell King <rmk+kernel@arm.linux.org.uk>, 
 David Woodhouse <David.Woodhouse@intel.com>, 
 Mike Rapoport <rppt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christophe Kerello <christophe.kerello@st.com>, 
 Jason Roberts <jason.e.roberts@intel.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Mason Yang <masonccyang@mxic.com.tw>, 
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>, 
 Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
 Heiko Stuebner <heiko@sntech.de>, Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>, 
 Liang Yang <liang.yang@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Michael Walle <michael@walle.cc>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Tze Yee Ng <tze.yee.ng@altera.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Keep chip metadata, BCH state and controller storage until the last MTD
reference is released. Unregister and disconnect the chips before
releasing chip-select GPIOs, so notifier I/O and active NAND operations
finish while the hardware is usable.

Free unpublished chip allocations directly and use retained cleanup
after MTD registration has been attempted.

Fixes: 197b88fecc50 ("mtd: rawnand: arasan: Add new Arasan NAND controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/arasan-nand-controller.c | 57 ++++++++++++++++++++-------
 1 file changed, 42 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index 865754737f5f..57b5d6119b70 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -1269,6 +1269,11 @@ static const struct nand_controller_ops anfc_ops = {
 	.detach_chip = anfc_detach_chip,
 };
 
+static void anfc_chip_release(struct nand_chip *chip)
+{
+	kfree(to_anand(chip));
+}
+
 static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 {
 	struct anand *anand;
@@ -1276,7 +1281,7 @@ static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 	struct mtd_info *mtd;
 	int rb, ret, i;
 
-	anand = devm_kzalloc(nfc->dev, sizeof(*anand), GFP_KERNEL);
+	anand = kzalloc_obj(*anand);
 	if (!anand)
 		return -ENOMEM;
 
@@ -1284,31 +1289,35 @@ static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 	anand->ncs_idx = of_property_count_elems_of_size(np, "reg", sizeof(u32));
 	if (anand->ncs_idx <= 0 || anand->ncs_idx > nfc->ncs) {
 		dev_err(nfc->dev, "Invalid reg property\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	anand->cs_idx = devm_kcalloc(nfc->dev, anand->ncs_idx,
 				     sizeof(*anand->cs_idx), GFP_KERNEL);
-	if (!anand->cs_idx)
-		return -ENOMEM;
+	if (!anand->cs_idx) {
+		ret = -ENOMEM;
+		goto free_chip;
+	}
 
 	for (i = 0; i < anand->ncs_idx; i++) {
 		ret = of_property_read_u32_index(np, "reg", i,
 						 &anand->cs_idx[i]);
 		if (ret) {
 			dev_err(nfc->dev, "invalid CS property: %d\n", ret);
-			return ret;
+			goto free_chip;
 		}
 	}
 
 	/* Ready-busy init */
 	ret = of_property_read_u32(np, "nand-rb", &rb);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	if (rb >= ANFC_MAX_CS) {
 		dev_err(nfc->dev, "Wrong RB %d\n", rb);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	anand->rb = rb;
@@ -1323,24 +1332,35 @@ static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 	nand_set_flash_node(chip, np);
 	if (!mtd->name) {
 		dev_err(nfc->dev, "NAND label property is mandatory\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	ret = nand_scan(chip, anand->ncs_idx);
 	if (ret) {
 		dev_err(nfc->dev, "Scan operation failed\n");
-		return ret;
+		goto free_chip;
 	}
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(chip, anfc_chip_release);
 	if (ret) {
 		nand_cleanup(chip);
+		goto free_chip;
+	}
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&anand->node, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(anand);
+	return ret;
 }
 
 static void anfc_chips_cleanup(struct arasan_nfc *nfc)
@@ -1353,8 +1373,9 @@ static void anfc_chips_cleanup(struct arasan_nfc *nfc)
 		chip = &anand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&anand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1431,17 +1452,24 @@ static int anfc_parse_cs(struct arasan_nfc *nfc)
 	return 0;
 }
 
+static void anfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct arasan_nfc, controller));
+}
+
 static int anfc_probe(struct platform_device *pdev)
 {
 	struct arasan_nfc *nfc;
 	int ret;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &nfc->controller, anfc_release);
+	if (ret)
+		return ret;
 
 	nfc->dev = &pdev->dev;
-	nand_controller_init(&nfc->controller);
 	nfc->controller.ops = &anfc_ops;
 	INIT_LIST_HEAD(&nfc->chips);
 
@@ -1481,13 +1509,12 @@ static void anfc_remove(struct platform_device *pdev)
 	int i;
 	struct arasan_nfc *nfc = platform_get_drvdata(pdev);
 
+	anfc_chips_cleanup(nfc);
 	for (i = 0; i < nfc->ncs; i++) {
 		if (nfc->cs_array[i]) {
 			gpiod_put(nfc->cs_array[i]);
 		}
 	}
-
-	anfc_chips_cleanup(nfc);
 }
 
 static const struct of_device_id anfc_ids[] = {

-- 
2.53.0

