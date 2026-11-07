Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046609;
	b=08oC1yW0hhRzX6AH1kPTnYv2b78M/Hq/IiQ497GvlYm3TXPr95uE8xrodfjy2Esk6a/C
	 1ef4hQcRLdERCyDYbKao/BKIjFDNVaAqg/N2piGrAWXkwbGfrbRsWrLveXbq9RL9DXnKn
	 oibtgAQ7dhVGeWrWI55JU9Q/Vi/ItyXz+dAB1jVTA/ip2qyAWhNhq5WkLAv5CmOq8ESef
	 J5X/ZocoTPEekVOY2Z7j/MjbFJWz6wZb3q757BpHT6/AjC9ut7Fk4t+QH40bxQXQDMYfK
	 7HYtkveariPUAGR0Oq91FW92FXbKb7YyAlHDWXpXcpdYvYIuzgMmmgZVeUznaTUPqjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=kjPwaFDbZuTJvqjQ+cQB8B42nBaUa83lSo+JE+gssUA=;
	b=4v3K+HhACiRrh3ffEq6eDuo8R6X2wBx+Fz9V8RcaU/NuTAQGvN1xfHd22EiCoY4hvyTL
	 Q/0Y2PRCzNOMVLPZ2UE3wy6Cu7EFILepfmldC/kJNST00Fhn7AR86eCC9UyNVv4yDBd98
	 4G0oVf+3a7B0xr4CAnlnXGR9x39huZUtR3SBYBVK+fP709Ri+gTdMi3hZ20GcW359VFYT
	 nZu4Vu95dFSzuedw7zozLdtVP18GvgBCEXxfgVhGa7r3EPfQs8ob849gRPOpz7jxS0xfL
	 PE0lv/y6bkG6upA2tb8HM/oFPd+cydW6qhRQUyFQRgVpAN44E7/QxIzAgymQW4vWKMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a27Vni2U;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6EF6082BF9
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 10:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF6EF6082BF9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a27Vni2U
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-85a5455bd3cso839897a34.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 02:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046608; x=1794651408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjPwaFDbZuTJvqjQ+cQB8B42nBaUa83lSo+JE+gssUA=;
        b=a27Vni2U4vhty3zCHojWT/sjM3GihDhQuCWecmRAa+CezosijLlI6ibQxtsdw5MD3p
         AcflRduOvCCXFyIadx03kqn0gw1p5fKhRzK5uLg2x6aGDEoC0gdSmlJrdCtNHhb6DU1k
         uoHJFW/0WxgERqZ9NBv017koirznsDX09uFeboHHI0cN6zvnWaY0/R7nMP7jZKWIIENG
         PBbvpu474GVHbYwPijjL6xfyC4gggP8zn0hONQzmuQ6vCUMIu+LiqzOD5gNr/LUpI9eu
         IX0uk4EyFVH/XOrX07zaFiqgtR35V1w2cggBN07xSR7cBnRR0BlSxD68LknjJmA2Agu9
         ZASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046608; x=1794651408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjPwaFDbZuTJvqjQ+cQB8B42nBaUa83lSo+JE+gssUA=;
        b=Za3069XkHFis69O9u1TuO/YeL9KBcLrj19G1pUjOQxAT20o70oeauqmXWsqKht6KVO
         C89dP/6RbUnKirvDqZU5ZSR37a2SOYANAvcTq6QC33V7EZ6tzr4ldPyXJkt9h/Kjkz7Q
         b+UgEc0IDyiafI9pP8GhXAtmsZBVEd/gdbT6Q+FSqSLsmi9frlubF+uCEaKD4rnpZ4XU
         pZB7dmrN1EHri4k7HWkPPFJDLf2AXa4rYa47Q0G/67Q8uzZ1cMY2GExqH3ePnnzflWxy
         zo9I/e4H8daxtaZmVzkTwXKdiVv0+onTqegVUrAgwvHy6aXCwgjL9g7IccVDS+WBJeHF
         UrwA==
X-Forwarded-Encrypted: i=1; AKwUvBzajsWJ+FmfdZTLn1x2l84rrv8C8u1x4F9uAD96EZN9ai+zrxMp6FZo3cmoZu/Mkxc0EgrqUmag7LY3H5et@vger.kernel.org
X-Gm-Message-State: APuU4Z92y6JeHxR2GfJ7NvIKGAPl541M5tEpOdMh/c2wfwgEZ+rGRAHF
	rE/HFLOIwM8YJMIgsNaDmwqfF50GmgOGO2kFYtYXx2rNGQCMuasv4jb/
X-Gm-Gg: AYBFou2zVzhNfkiQwZeSTQvJ6EW5+n2FfRPa3XG5GYk0WWvhVLpulqn9xD02aJFKNO0
	aQE8GbJvZ+roc3YcuWMIwuAMmz1aem6NZX2NHoKi1isvdYzJ4HGJFNlchZsBmqQCqNvfLV9bfVB
	NAgGzjj9jhIk09nPLAmquuakWts7NKNnXXrY/SajBg3pejSfcRXnvnnH95yPoH6gzVb+Y/+ti8l
	eH1xNuBCf2gS2616R/W9SeAnvQPjbiiAsR9GZS9/VEH0mVcsiSg9N519JDS2gXcq4aqTUc4HoDx
	cD8DZHPrQWS1Z1kHpmnjfc5aDKgwhd/63k+tlt1i/0Bfmv0vdRHz+Fqe0iRPJTKrS+cKfa+CZpo
	1rpR+MDM9zhLJHnF7k0HiVdBtsugMDbLUNNR65nGyC1drXQJ/aExJg6Pcftp4eI6qpbr8i6SEWB
	Z/ZO9JfQdXa9daPvbCPyG4vAivUR3ie8JD+41jc16SDEFSchbvULuj4YZjRA9AZCYPV47IfVBqT
	RbPfbnvKkhg7jpwLA2c4EHr+CaLn5cdFqlEE3dhlAQZCaYpddiP5/oNYP9zvwLixSBzykosk2Tx
	SfKMjN5SspVof+IYuer+TmPBaHgDhRjiVyWnZDcPI7fg35KyPagxtBt/RoyqbMAhmSDT3A//ZQM
	AfvQBM5X5Fjni2a8SmlIHmjs9mOnqymrIkYnxhDvwDBlKmSLqGUUELvfaBW8yFpKCFoj1HDIVzr
	c9iMhKlIYj8KzkuoqIX13WCquv+y2DuHsnUvYRrA9zsWwBdGQr9omc
X-Received: by 2002:a05:6830:4486:b0:81f:b198:5b6c with SMTP id 46e09a7af769-85f1d060dacmr4931533a34.22.1794046607890;
        Sat, 07 Nov 2026 02:16:47 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:05 -0700
Subject: [PATCH 08/58] mtd: rawnand: plat_nand: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-8-0181ef0cc4c8@gmail.com>
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

Unregister MTD while notifier clients can finish their I/O, then
disconnect the NAND chip before invoking the platform hardware teardown.
Keep the chip, controller lock and software ECC metadata until the last
MTD reference is dropped.

Handle registration failures through the same reference-counted cleanup,
since partitions can have become visible before registration fails.

Fixes: 711fdf627ce1 ("[MTD] [NAND] platform NAND driver: add driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/plat_nand.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/plat_nand.c b/drivers/mtd/nand/raw/plat_nand.c
index fe31551bcf5f..8321667fae2f 100644
--- a/drivers/mtd/nand/raw/plat_nand.c
+++ b/drivers/mtd/nand/raw/plat_nand.c
@@ -21,6 +21,11 @@ struct plat_nand_data {
 	struct gpio_desc	*ready_gpio;
 };
 
+static void plat_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct plat_nand_data, controller));
+}
+
 static int plat_nand_attach_chip(struct nand_chip *chip)
 {
 	if (chip->ecc.engine_type == NAND_ECC_ENGINE_TYPE_SOFT &&
@@ -65,10 +70,13 @@ static int plat_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Allocate memory for the device structure (and zero it) */
-	data = devm_kzalloc(&pdev->dev, sizeof(struct plat_nand_data),
-			    GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &data->controller,
+					plat_nand_release);
+	if (err)
+		return err;
 
 	data->ready_gpio = devm_gpiod_get_optional(&pdev->dev, "ready",
 						   GPIOD_IN);
@@ -77,7 +85,6 @@ static int plat_nand_probe(struct platform_device *pdev)
 				     "could not get READY GPIO\n");
 
 	data->controller.ops = &plat_nand_ops;
-	nand_controller_init(&data->controller);
 	data->chip.controller = &data->controller;
 	chip = &data->chip;
 	nand_set_controller_data(chip, data);
@@ -126,6 +133,11 @@ static int plat_nand_probe(struct platform_device *pdev)
 		goto out;
 
 	part_types = pdata->chip.part_probe_types;
+	err = nand_set_release(chip, NULL);
+	if (err) {
+		nand_cleanup(chip);
+		goto out;
+	}
 
 	err = mtd_device_parse_register(mtd, part_types, NULL,
 					pdata->chip.partitions,
@@ -134,7 +146,8 @@ static int plat_nand_probe(struct platform_device *pdev)
 	if (!err)
 		return err;
 
-	nand_cleanup(&data->chip);
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 out:
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
@@ -153,9 +166,10 @@ static void plat_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id plat_nand_match[] = {

-- 
2.53.0

