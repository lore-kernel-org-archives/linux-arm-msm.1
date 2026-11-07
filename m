Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082421;
	b=5cnfTTDFkXTo4cGHF1twwXicE1HshJrIa6/6L61Nw+uPWIDZuTqiyRocDl/VAG9IrSX2
	 CRwXlSuirv9ME9FgSy4lLkRGOyUQlVFjyInqMIB5Hvs8W0G2ypgzdnkCfiPOqUjuF+cwX
	 7/MuQfNPXUV64si1Z2e0BkVkD/VPquBj1las3jnOvcKXPsI8EMASyJEQeWdEQhW8Wfrb+
	 Af5wQ1UiAkqtbL4kb+HxmFyFje+y+pll4F/Butiar7TCuS4StF8qkfsFX4/8RX0aG5jn+
	 ySjBbC/RUNGF4TrnuseTW5iBCFZTI0EArBq8zE+6r+7ZnHb9bCXHVCAw1gSCETC6pZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082421;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=oX/04PSyv+m9ZWIAwPwysaJo9a7lukovrgxtc3xymbg=;
	b=kNZ7qYmxsw6Njupu3KLtQH/4bhCqfWryZDfb/G0wMBdM/3PLaH+AvD/z7WsRh26//cir
	 sn6S6sXMfOmjvixsvPZD7hR6GIxGwNCsmiNH1UZzDeJhD9D+X38IzYdUL+/2nlY0yfP4c
	 6+Y06gwlT5kE7gtVIvwS/RYMwpjmnvxh1n+XFo+AGqnxzdYM9biV9s5AVCGPaozW/JgyX
	 4LBjg1GqaWRUGbNnb25z5Z5ocmLdvMEGwGKLOHItySsYhbXjmG8tjCP09CKnmtg0lrRAN
	 xYfwl1Rns8LAwsdG10cpYt9EflwirFwwUUzwBLVAeMAEoXyybqRzZTOQ6tsvD7aIFug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00294606D82E
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 20:13:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00294606D82E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-43bf9548df4so20303fac.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 12:13:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082420; x=1794687220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oX/04PSyv+m9ZWIAwPwysaJo9a7lukovrgxtc3xymbg=;
        b=jtBLCwZx94Q0iosLui0m2F9Sz45mPPIMRu5ckyzd7kCpgvRjelF10gNIa7qrtTzln+
         k7/DtGiUWFsk2+cazHetmHizbjN4VCQiy+oxx3BtZqXurNUobX1m2U5e3vbqJEYZ1t5E
         6A/bOAum28Cv8f6AxJJUFSIixpJuZaiElDjPtufZEoypV01mfSjjPxOBwsCp7NYsB9u5
         BrnN4XMIXsuQWeo/pLvn+wedbdNHn9HBpoCEJZhWhSaeJ1dVwJ1L+Hwb/NCLhLpsKXBD
         647Tn3basHZG5SDgdW9cF9LugW/XE/mju2WYQFMJeiLE5xT5j1X7w0KHtWjwXStgergT
         2Ryw==
X-Forwarded-Encrypted: i=1; AKwUvBy+nfB2aeYAH+JroZvBU07pQpMhHpoxNqtxjb89HvBGeo1j+V4b72eGLH1LfFsKjuylUZCzua4HXeigQKKW@vger.kernel.org
X-Gm-Message-State: APuU4Z/B7SaTpT/vbJPdSTOLUMZWn+kWvkAGvo+6ie7jLa2Nf9euGoVq
	gAU+FWx1/5Q/r7yPwzJQaRrSUKIviWffOVjuL+xBjegjWMTA8430Oz/0PZi0RXhFoPM=
X-Gm-Gg: AYBFou1oc8XXu3QesWkKPBWs6XzVJ9CgmZfdVh+e5lL84Yr84AuGKi9q1UiJSBu+7Nm
	V+1VWsDyUTwKnkTfa50Ug7ZyYNJkITjhfbOnh1cfzUBpbb6x9NKbooo3l5CSiSkzVWMshWzMfGE
	2TcUFFNPSVET/XCzf9owK5HW0Qv8caLCLCEI/b9e7yYdhDELDKe+zsnNjdaLtus6SWaw2TwhPt/
	1lUl9bwXxaUfbc6UToi1ufm1hKE3fZMgshgxc3zxUbLpOEBD6f+fz8h+kflVakuzUg571iqUdJQ
	cI0MVaj3D/nNTYbnYaTm9gbeeyISZ1WLQicSezBrMXeM/69iFvce/wdh5Vr7ppFXhcOmUNH1z7V
	qaNgc92yUnatOoPssNWbq3n0kA3gczhgdFHvUEEzjjZXMr7v2tfW0d1leZQ6qyyvr4MwC/uwKMp
	K1SAb6n2vId/KlnBZBulIbcAPNJqs/k2R8RtEG4YNRfvUxf57cB/HGMGJ91z9DcOG548Lpiu4P2
	6C5TiwBtkuW/WWGTOsRLlPXixNtcwTaaGCcBFfKFQ3yg+/LVFoHWv/R/ejko/7Z4/MsOrcnHeXF
	yesh4Aqs/HwoisJZSzFF1C6x5iFjFYQihUa+beFstXbtVd3+PPRkvvtijJpY
X-Received: by 2002:a05:6870:d394:b0:4ad:8124:9235 with SMTP id 586e51a60fabf-4ad9881005emr3579674fac.9.1794082419546;
        Sat, 07 Nov 2026 12:13:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:40 -0700
Subject: [PATCH 43/58] mtd: rawnand: sharpsl: retain chip state across
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-43-0181ef0cc4c8@gmail.com>
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

Separate chip-select unmapping from chip storage reclamation.
Outstanding MTD references retain the scanned chip and layout metadata
after removal; new hardware operations fail once the chip is
disconnected.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sharpsl.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sharpsl.c b/drivers/mtd/nand/raw/sharpsl.c
index 4154ab74f169..1ffd2b210d20 100644
--- a/drivers/mtd/nand/raw/sharpsl.c
+++ b/drivers/mtd/nand/raw/sharpsl.c
@@ -114,6 +114,11 @@ static const struct nand_controller_ops sharpsl_ops = {
 	.attach_chip = sharpsl_attach_chip,
 };
 
+static void sharpsl_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct sharpsl_nand, controller));
+}
+
 /*
  * Main initialization routine
  */
@@ -135,6 +140,9 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	sharpsl = kzalloc_obj(struct sharpsl_nand);
 	if (!sharpsl)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &sharpsl->controller, sharpsl_nand_release);
+	if (err)
+		return err;
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!r) {
@@ -154,7 +162,6 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	/* Get pointer to private data */
 	this = (struct nand_chip *)(&sharpsl->chip);
 
-	nand_controller_init(&sharpsl->controller);
 	sharpsl->controller.ops = &sharpsl_ops;
 	this->controller = &sharpsl->controller;
 
@@ -188,10 +195,16 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	/* Register the partitions */
 	mtd->name = "sharpsl-nand";
 
-	err = mtd_device_parse_register(mtd, data->part_parsers, NULL,
-					data->partitions, data->nr_partitions);
+	err = nand_set_release(this, NULL);
 	if (err)
 		goto err_add;
+	err = mtd_device_parse_register(mtd, data->part_parsers, NULL,
+					data->partitions, data->nr_partitions);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		goto err_scan;
+	}
 
 	/* Return happy */
 	return 0;
@@ -203,7 +216,6 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	iounmap(sharpsl->io);
 err_ioremap:
 err_get_res:
-	kfree(sharpsl);
 	return err;
 }
 
@@ -221,12 +233,11 @@ static void sharpsl_nand_remove(struct platform_device *pdev)
 	WARN_ON(ret);
 
 	/* Release resources */
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	iounmap(sharpsl->io);
 
-	/* Free the driver's structure */
-	kfree(sharpsl);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver sharpsl_nand_driver = {

-- 
2.53.0

