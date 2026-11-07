Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082440;
	b=vIaEzvxJv8jNw0X2HaNiPqbP+2vLJkkgcesrsButtP7ce4NbZhdR2+ga7CcH33fvsbMf
	 qsgtWkceYVo/3r8wKb5xXmcA4nhqgIMb9k+0GomN26Rq+SIhPSjTIS6MXNVqse63D5WMP
	 wQ2IVS58bQMKHpECq50LZoOCNck48Sy69BiSdF5VOb8alUxYdJmzQx6/XzpWOdhWOAVnO
	 h5nht8be1FsyMfKjyAcL6ILiEMS3uyGjncxtf9P6cDpWryDyk9xkmUNndCahx4VsdVUQt
	 ebjFtRWEpIS1Nmm2TwoFFyYyR38+XLbPkACNhZI4kdTur/HD5OdxGdqiQepf/Ac1FDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082440;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=boAlKmZhAnSEjyKx8nKFVkQ3l/nt4gG98JRt8SYVseE=;
	b=JmJDWveSa4vqt4bYl/oZISyJ3f/v6lLl1nXNjQTufEPxiKqtjeeNM0wg57txgvhYRbyH
	 YtiG0cgmtg87avpiRNx0DAZKj6aWbcjT7fw2EakMX8IsGFWHoaqW3G5hTT7hm/vrJT4x4
	 gvfPPblWrqaLUwbYQ2H+3lZkgHZovS80qOA8ZzoJ4ZWHOLbRFDtli5DGENULy13mhDk1V
	 LZR4URZ+B13ptemPFDxOHrTwEmtJVwWKX6xc73JNEFkrXyzPx0HR7mZYrPMiNB6nQIwgq
	 yMoR83SX0xUN+ESSwzhXOh5JCdgpZE8lGCjJo82UAcIG5BFMMtTHssJzJhuTqOawrGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8776E606D81F
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 20:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8776E606D81F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4a71d0c4233so5752fac.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 12:14:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082440; x=1794687240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=boAlKmZhAnSEjyKx8nKFVkQ3l/nt4gG98JRt8SYVseE=;
        b=dqcBb+lbd/Ipz0HkQilIJ9xfjBNZo5N4CUs0SCpAfoBhZNnfT4K4DuMyb8ou4B6AWD
         trgddCOP25jAnigbfzQMt1xD+oNhyit/3xGgMr9hWOnUVzLD8+7ZfJPYc9/dbXdbxK/Q
         FffilFbfNcFp2roKES5naaJtokxl8+iI9KM6jR7D4GtFgiO+DlsVmQYzNGtLxUlBL392
         baGVYDfOJCRq5qffqUY478XscVUO1oj4zNefVwvP3vTiZiWeb/V6MURHbunV2MjPvltH
         i5cIfYXaKq0ySZYoARSXNbO/9DHledaLJyXKDIkdGYyAn/VnBn0GxyVJKQjWIoEgqynz
         iysA==
X-Forwarded-Encrypted: i=1; AL+hErFpB1a3VHyHKOuiApqcUdOi/zKj/RsFmJ7wLafDbKI8CUsWEW68XtaeBCjIFQnaHHswYwn2SVM5jqnJ8wr8@vger.kernel.org
X-Gm-Message-State: APuU4Z/hFmfXYWAVSfTpW7dK4wutyxu1roka6BThhg0EsplxKf4OBW+R
	+zrRjJETS/1JCRlDhI2fjY4XbM40lBreXO2cG6tHgiJbxaV2F68Jvdj0DA91l2HO90g=
X-Gm-Gg: AYBFou0wwwOSae8XH2AUn/W3RdsKeV+95d13Jui0ohXrpoOgHcs7ztgfqLol3DrXgcf
	5hhwNk4eW/NP6OBdefsei6KdE4iF/4JTsE60dXQg9zoLSXzaqwI2LIy1/x+jKLA26PiXvi/cKpa
	9QztuMehcmMHHzapJCHj1D0de8DRd+5xXlvlzx/FWTqf67EmlMaZybVwYslxZfW/uAbGFYIm36B
	vnnu8oANRRUn7isxBk+MAmUDUM3XK/0HtlRhnxj48opD0u+6aR/iLJ7hQa3kmFuaaZ4g+LPN4Qb
	7tYYDbGEf8mWc/f9uvchPka1uTYuCv06jinXhA1izqQgAHHX8vdJnI5KeLpuN8LjdF2Z+dDY/tE
	+KLlCVylUWxi+Uuat7StWarLgasJN2qgN+Y9x5LlgXLBZT2KASdVAB+aQYBUwkkafRtFUydTObA
	yAKWpqzDcxBZz2aN89ikyfIu187W4v8zitXr3IEkLKbeRKZ8JmV14fnocwn7xrtz3jRgnTrzdYV
	tkcyU7joNgS4+kpLqLDlqeJc2nTO5YwPZ5KiVToPYb3SbFwPqqlpbNFKMZRvUxnlIRDmE+TxX+a
	bdN40T3E7fj03/ZoLoguksEwa1Hsw67/HptlYJQRHmRCcEIDCyix1KJI09n4
X-Received: by 2002:a05:6871:2218:b0:494:a2cf:8dce with SMTP id 586e51a60fabf-4ad986b296emr3644337fac.4.1794082439518;
        Sat, 07 Nov 2026 12:13:59 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:47 -0700
Subject: [PATCH 50/58] mtd: rawnand: ingenic: retain chip state across
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-50-0181ef0cc4c8@gmail.com>
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
  Kamal Dasu <kamal.dasu@broadcom.com>,  Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,  Vladimir Zapolskiy <vz@mleia.com>,
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

Unregister and disconnect all chips before releasing the ECC provider.
Retain each chip and its shared controller until the final MTD put,
while releasing hardware resources during device removal.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 49 +++++++++++++++++++------
 1 file changed, 37 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
index f1e2c82936b3..775ebf4dd3b9 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
@@ -341,6 +341,11 @@ static const struct nand_controller_ops ingenic_nand_controller_ops = {
 	.exec_op = ingenic_nand_exec_op,
 };
 
+static void ingenic_nand_release(struct nand_chip *chip)
+{
+	kfree(to_ingenic_nand(nand_to_mtd(chip)));
+}
+
 static int ingenic_nand_init_chip(struct platform_device *pdev,
 				  struct ingenic_nfc *nfc,
 				  struct device_node *np,
@@ -368,7 +373,7 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 	if (IS_ERR(cs->base))
 		return PTR_ERR(cs->base);
 
-	nand = devm_kzalloc(dev, sizeof(*nand), GFP_KERNEL);
+	nand = kzalloc_obj(*nand);
 	if (!nand)
 		return -ENOMEM;
 
@@ -377,7 +382,7 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 	if (IS_ERR(nand->busy_gpio)) {
 		ret = PTR_ERR(nand->busy_gpio);
 		dev_err(dev, "failed to request busy GPIO: %d\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
 	nand->wp_gpio = devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_LOW);
@@ -385,15 +390,17 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 	if (IS_ERR(nand->wp_gpio)) {
 		ret = PTR_ERR(nand->wp_gpio);
 		dev_err(dev, "failed to request WP GPIO: %d\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
 	chip = &nand->chip;
 	mtd = nand_to_mtd(chip);
 	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "%s.%d", dev_name(dev),
 				   cs->bank);
-	if (!mtd->name)
-		return -ENOMEM;
+	if (!mtd->name) {
+		ret = -ENOMEM;
+		goto free_chip;
+	}
 	mtd->dev.parent = dev;
 
 	chip->options = NAND_NO_SUBPAGE_WRITE;
@@ -404,17 +411,27 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 	chip->controller->ops = &ingenic_nand_controller_ops;
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_release(chip, ingenic_nand_release);
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&nand->chip_list, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(nand);
+	return ret;
 }
 
 static void ingenic_nand_cleanup_chips(struct ingenic_nfc *nfc)
@@ -429,8 +446,9 @@ static void ingenic_nand_cleanup_chips(struct ingenic_nfc *nfc)
 		chip = &ingenic_chip->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&ingenic_chip->chip_list);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -461,6 +479,11 @@ static int ingenic_nand_init_chips(struct ingenic_nfc *nfc,
 	return 0;
 }
 
+static void ingenic_nfc_release(struct nand_controller *controller)
+{
+	kfree(to_ingenic_nfc(controller));
+}
+
 static int ingenic_nand_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -474,9 +497,12 @@ static int ingenic_nand_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	nfc = devm_kzalloc(dev, struct_size(nfc, cs, num_banks), GFP_KERNEL);
+	nfc = kzalloc(struct_size(nfc, cs, num_banks), GFP_KERNEL);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->controller, ingenic_nfc_release);
+	if (ret)
+		return ret;
 
 	nfc->soc_info = device_get_match_data(dev);
 	if (!nfc->soc_info)
@@ -493,7 +519,6 @@ static int ingenic_nand_probe(struct platform_device *pdev)
 	nfc->dev = dev;
 	nfc->num_banks = num_banks;
 
-	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
 
 	ret = ingenic_nand_init_chips(nfc, pdev);
@@ -511,10 +536,10 @@ static void ingenic_nand_remove(struct platform_device *pdev)
 {
 	struct ingenic_nfc *nfc = platform_get_drvdata(pdev);
 
+	ingenic_nand_cleanup_chips(nfc);
+
 	if (nfc->ecc)
 		ingenic_ecc_release(nfc->ecc);
-
-	ingenic_nand_cleanup_chips(nfc);
 }
 
 static const struct jz_soc_info jz4740_soc_info = {

-- 
2.53.0

