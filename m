Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082412;
	b=4X3XI6r2v7Z6E7S02hQsKIqeK+/rOhCmCuZusdOb4vZlXAB0UBcs7F48rfrnDQbq25QY
	 ttoIRlHkp5bOB5QJDP55gsog9vkqsB++F9gDO4sGLBN2pfkYoRNkPlg2807C556V0Cwcu
	 WLHEOIp+G7LqX9PQpWGeh+3EBdkwRDRmU+RkTPi97SVrHVzz+3N3X4a3e76mRjBaD1/Ff
	 OwOp5lmW211xR4A7I8qI4KVSjOCVljpf4/ZO6klAkwvSoKGOJ4sO7ob2VKQ5XmAgxkXIE
	 U97BgfFI6WWltbzFbDSSdspN4ZG8L3lTCkK/hSbI38PB8kC4o3Rh7khjtSFurlSeBXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082412;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Y7c6OOYT+qEeDVQYiysesbJy0c+qB96uscD707pwGC0=;
	b=nn/JFtqLjhllwEsEoMnSK8aGJXxbwYH7LDsgINvnMv7yzxz1ZeuDz9l3e25F69M/kdAN
	 5N6FrzME5DGGKqU/G+VWTbv37omdagoaRUmd6pALQsprLLpv5x9NL6d28Deslo4hojwf+
	 TzCzg2IusOEQkRSRye3BUR0DaW8vNVVxfrRueT2W9bPm68ik68DO4UOyXepDXeZe22YMV
	 Eb2TmvaQImNRjxchXMJaIa+h/JijVWkNucHFVQ5UrA0xC/u4aqILI7To4y/xBWEH0l/qV
	 0peC/6TMI45dEa/2gAvgAeair/4AWOPHvawvZu+jI55zdDrjB4POOQ6qrlsBdHBl13Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A00606D81A
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 20:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2A00606D81A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-84a248254f4so733a34.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 12:13:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082411; x=1794687211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y7c6OOYT+qEeDVQYiysesbJy0c+qB96uscD707pwGC0=;
        b=AawlsgzwgxSwwP/IZxon2VWvxedxoPO7+tun9DmVIMXNc3GR4ZRMEQhfuPOGptc0/W
         u9hbNqWKnJGwonDsLCKfGngz4VKsavfw3biIZEI5paDxDXc4/5ApyscMUF1N2/hbmRz3
         TzEJ/7n+Lwk9/ezQICfJiJFMDX04c2WGTe6ikSbHP3KXiIEWG82UYQfMC/0eQ8LKcetq
         icX2IDrlOliPwSJTbhDu3EOBYL4LfmzDC5wmOXTZFAu19scgY+Jnvbpnh3nbkAkuAUFX
         5FR52mFXJOYmsWLY6d5QnY02TBt/4GQUCRDWSGw7hWwb31hD24a6GsNG0JCw7rskt5Ku
         0F+w==
X-Forwarded-Encrypted: i=1; AKwUvBzGVbfpu2Kcr66LIEmJ0as7fTmSMBAHppeiMHNZNLqzlm0QARzw66jY/TllpDf7R1tEBWed7DY/mQR2KKWk@vger.kernel.org
X-Gm-Message-State: APuU4Z9tKUOfBmDO8jnQrx9WOMuDGqkDBKebwb9Ohd5JGYJxGzzFxt6g
	YrY1N6SXOi31UMwl17IPLFAceRlGAgzpH0gsE4NrXgouyS9uz1kHUn2dgYVSvYMZaVI=
X-Gm-Gg: AYBFou15ycbMnahRZXRFe+PF8t+9NDkfzC1BlU5GyC3B1n72UxbECSpun+awMq+ux2m
	WrbwSz8wi51qqK51AyNPogFOnT7LbTlpx/p7KqaJd8J0gQrBUkvBWJBygJZqKZrkHZvPPb9cOuE
	zgg40l3/D3vIbpybOSWDVerZm26VKbINCs83IhY2zS7Vxj+aIpV6o2ClsORVeIOcjwzZyEXx3Df
	OV2ge+eR9ZRWsFyhuYNtVywxqpd36buMqNwO4BSwjPPmzY6TJRwak6VRccmsRIsnZYqTQRHIDGt
	wPp2b2gktHLrBi+1OVoz4Fc+msoNuvxqKBzUsAcdYnyR8khbh9cwCuyosyaMPxXdFRH5U3FGdX4
	4h3qhpWD9ZPHWaCXhHycqVQ0SiRXqB4Ev2nY3uoVXuWE1HAOInRUpurxUAKxPeyQgpcYBT/hnGW
	tw56gM8TPxJfX9AgdcpismdFopIDdT+Qnnjcjf8ZZT1WRf3EVZjRWinvhjNnbm4wRN6YHeyXIiX
	kWFBMPEafolksw6aX8Btvfutx9Q/uHRJ0emf33wRPwvX/BnIixvR6NFHrq+D7rmSc2i3dENNIBO
	zACf5D0tLcBH5gj5bObHmszmxwSIKQ2E60MhhPCLi/5riV4MTsdTz2ZQ4rF2
X-Received: by 2002:a05:6808:6412:b0:4cb:818f:d56f with SMTP id 5614622812f47-567e0f98da3mr4920477b6e.23.1794082410773;
        Sat, 07 Nov 2026 12:13:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:37 -0700
Subject: [PATCH 40/58] mtd: rawnand: cafe: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-40-0181ef0cc4c8@gmail.com>
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Free DMA memory at teardown and clear its pointer before deferred
detach.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/cafe_nand.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
index f3117b031cd2..bcf7482410e7 100644
--- a/drivers/mtd/nand/raw/cafe_nand.c
+++ b/drivers/mtd/nand/raw/cafe_nand.c
@@ -651,7 +651,10 @@ static void cafe_nand_detach_chip(struct nand_chip *chip)
 {
 	struct cafe_priv *cafe = nand_get_controller_data(chip);
 
-	dma_free_coherent(&cafe->pdev->dev, 2112, cafe->dmabuf, cafe->dmaaddr);
+	if (cafe->dmabuf) {
+		dma_free_coherent(&cafe->pdev->dev, 2112, cafe->dmabuf, cafe->dmaaddr);
+		cafe->dmabuf = NULL;
+	}
 }
 
 static const struct nand_controller_ops cafe_nand_controller_ops = {
@@ -659,6 +662,11 @@ static const struct nand_controller_ops cafe_nand_controller_ops = {
 	.detach_chip = cafe_nand_detach_chip,
 };
 
+static void cafe_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct cafe_priv, nand.legacy.dummy_controller));
+}
+
 static int cafe_nand_probe(struct pci_dev *pdev,
 				     const struct pci_device_id *ent)
 {
@@ -683,6 +691,10 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 		err = -ENOMEM;
 		goto out_disable_device;
 	}
+	cafe->nand.controller = &cafe->nand.legacy.dummy_controller;
+	err = devm_nand_controller_init(&pdev->dev, cafe->nand.controller, cafe_nand_release);
+	if (err)
+		goto out_disable_device;
 
 	mtd = nand_to_mtd(&cafe->nand);
 	mtd->dev.parent = &pdev->dev;
@@ -693,7 +705,7 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	if (!cafe->mmio) {
 		dev_warn(&pdev->dev, "failed to iomap\n");
 		err = -ENOMEM;
-		goto out_free_mtd;
+		goto out_disable_device;
 	}
 
 	cafe->rs = init_rs_non_canonical(12, &cafe_mul, 0, 1, 8);
@@ -785,9 +797,16 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	pci_set_drvdata(pdev, mtd);
 
 	mtd->name = "cafe_nand";
-	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	err = nand_set_release(&cafe->nand, NULL);
 	if (err)
 		goto out_cleanup_nand;
+	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	if (err) {
+		nand_disconnect(&cafe->nand);
+		cafe_nand_detach_chip(&cafe->nand);
+		mtd_put_master(mtd);
+		goto out_irq;
+	}
 
 	goto out;
 
@@ -801,8 +820,6 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	free_rs(cafe->rs);
  out_ior:
 	pci_iounmap(pdev, cafe->mmio);
- out_free_mtd:
-	kfree(cafe);
  out_disable_device:
 	pci_disable_device(pdev);
  out:
@@ -816,17 +833,17 @@ static void cafe_nand_remove(struct pci_dev *pdev)
 	struct cafe_priv *cafe = nand_get_controller_data(chip);
 	int ret;
 
+	ret = mtd_device_unregister(mtd);
+	WARN_ON(ret);
+	nand_disconnect(chip);
 	/* Disable NAND IRQ in global IRQ mask register */
 	cafe_writel(cafe, ~1 & cafe_readl(cafe, GLOBAL_IRQ_MASK), GLOBAL_IRQ_MASK);
 	free_irq(pdev->irq, mtd);
-	ret = mtd_device_unregister(mtd);
-	WARN_ON(ret);
-	nand_cleanup(chip);
+	cafe_nand_detach_chip(chip);
 	free_rs(cafe->rs);
 	pci_iounmap(pdev, cafe->mmio);
-	dma_free_coherent(&cafe->pdev->dev, 2112, cafe->dmabuf, cafe->dmaaddr);
-	kfree(cafe);
 	pci_disable_device(pdev);
+	mtd_put_master(mtd);
 }
 
 static const struct pci_device_id cafe_nand_tbl[] = {

-- 
2.53.0

