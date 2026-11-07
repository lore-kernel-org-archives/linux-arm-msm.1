Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082461;
	b=cF3EiYLrGFrCkiruYkrzjQWc6WjnxVo9A3nBGInCcfEtKDaR0kYIy8pTLe3i+s0rtRCj
	 nvPF+m0Ffzn4C+EXlUTxTffIm4o3GWv19fcUXgvGp8Lxkdn43BfHNp9n8fvuhkCUGaukV
	 MEB/kfCnD97euUJx6EUuTpz0hAUUwFAP+col3CaFTpTurp5RTAE98lDdlmta06V9N6NG1
	 fWekS9R14lWiTZf6n6rQS1mTh+8HmIL3qWNCRF5gjgRkdHzKAH8eUCqyZ30g/hml+CFGK
	 kXln6oKFAoNr2d83aLnt8pOKHj18ELwPyRXrlmNpTP/+039e5IwI/p+eOTVHYH6Pamg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082461;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=nxY1HbO6C2RfpZ036fxI7eWu/qhT1X06/xSohH0ZsQg=;
	b=C2ORiTEMvivEPMCrpHfbuOuVGOXt62haPSjmBqeBLDWDFmG/Jzg8Ze1zKwyuwIlKBSpr
	 fscQGAoygyIc9f47sbVx1LEovjfGgMJM+zVE4JlAHA9A97/0UHZd0Rbae4nKNURWyIpCC
	 YYcg63m8bKZU63oAl/w0vENpd8vReHqWsgUNunmVIx1kIruZZJ3l1HL12pMQKdWnTNihS
	 yvYFKr5TXQhY+DAs9oMwQnNSOScwvVQAs0bZXnC5t1U7OaPvQz/p/D9f0r/Wa2Fg6mtHU
	 rg+yykI5c1gvH5GpgbEH0X17TxnKoMk0eC2MzZtPEOrKfvKsnDIGWG3U+78yKpgWFvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584CA6082BF7
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 20:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 584CA6082BF7
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4a76f0cce5fso2323fac.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 12:14:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082460; x=1794687260;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nxY1HbO6C2RfpZ036fxI7eWu/qhT1X06/xSohH0ZsQg=;
        b=GPYZd/7xPKYKuDoAIXqpkHCa7psVzBWkLfSarT+64x49WRI6+i8bMTsIgJVNHStXN1
         OUIqRpLxSgKTdTLasuekTwcem+a1acl6mInMbVw7uCV94AhMSY7k9EBOLzdCJrXVOfrp
         tgbKwKEe83Z7ijTDIXGBWGkyoSFYr/LJRmcu04C+EgfinvCkrAqGb6dc4EH5rEVRRh5w
         SPyYfFYLbAd+9ziYraA97v9b7eEYJeYz0dT4+64fS3dYatN8xYyNn5Yj9wBI8dm5gzdw
         g6TTx+rNYDIyzGyttOsfQLJ0sc5H+A2wS9+TCTmWh15sVoiWnpr8lPGeOVy3TceGE1+N
         i/3A==
X-Forwarded-Encrypted: i=1; AL+hErEoJ7XY9mATL8mGl8sgNvExGyHUS1/yFgl3P8qPGj0h6kucHiThuYOz3O7Q7eXtiHEKtoPnhXFxue+Qj3YL@vger.kernel.org
X-Gm-Message-State: APuU4Z8DYONInG94uM6OQmOUmnybW95C5yatjgq7Oj0PRurJzAPg2aRy
	w6m95GNmnkguUueG1bzp05FJK2eOV5dzrOqrve0/lnXN5qK75VBxv4i0K7zpkgHglp8=
X-Gm-Gg: AYBFou0ZQDJOuQNCQeljVricpbkAF77oRKOXQCgbYytjIMkHcAwRaf0sVenGi0ZCCB9
	xc8zgbUo4JFzX2TU5mVCFbzwHA3ffdzZ6cMEzfzcQTSy/CN29WV2Dyq+qNNZmYMD3ZHdWBMOm8P
	eBAs6omHMEh9a++kTFC4IpoM41+56DxWRjHneKGYoHoztRHoL7YBRpNpYiZe13jthy0TkpQOfXt
	2rcWRfv1QYIvhxSzuqLezNkhl7Zzq4hEIblFXtQ3GqHK/vtCgSQZ/NLDUKxk0BEOWoM4qOOBRpV
	DxFy53iKkGLoXTLu2maJEaJJZCd9v/lNcOY4HJmyDDvlFu/9D9ARwlG+crZbyJC6KOBrAid1W3l
	CSnMoRkD5XuqYxrz9y1SQ9S65xsDcyuAgOwSaMp2G8VolghBFPnsynTJWNbO6o/GryVih+3MCRf
	o38KdEx40o6yZpWTkBmHossBlvyTvL6Ur0i0S8LC7j4ytdaLsbQRRAeMthUKeTpFPM4yKWawYpT
	p+mVcQYqAXPZCJYI9wEPtz4iJo47Zmc58N2n2nolsx0o/ZEjE/sEZIwLbE94956khYU69i7Afkj
	CRT00tbWxq4J1LgTvVAApJ9ppkqYypFvrz4hprk7WokUQtvs7vF8tjyrRIwqyA==
X-Received: by 2002:a05:6870:218c:b0:4a7:4a8e:237 with SMTP id 586e51a60fabf-4ad98ae42cbmr3680833fac.19.1794082460109;
        Sat, 07 Nov 2026 12:14:20 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:14:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:54 -0700
Subject: [PATCH 57/58] mtd: rawnand: cs553x: retain chip state across
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-57-0181ef0cc4c8@gmail.com>
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

Keep chip metadata alive while MTD device references remain after module
removal unregisters the device. Disconnect before unmapping the
controller, and release the backing allocation at the final MTD put.

Check registration failures and release the corresponding controller
without leaving it in the registered-device array.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/cs553x_nand.c | 46 ++++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/cs553x_nand.c b/drivers/mtd/nand/raw/cs553x_nand.c
index 0b872b1e3b04..7419308a740d 100644
--- a/drivers/mtd/nand/raw/cs553x_nand.c
+++ b/drivers/mtd/nand/raw/cs553x_nand.c
@@ -257,12 +257,18 @@ static const struct nand_controller_ops cs553x_nand_controller_ops = {
 	.attach_chip = cs553x_attach_chip,
 };
 
+static void cs553x_chip_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct cs553x_nand_controller, chip));
+}
+
 static int __init cs553x_init_one(int cs, int mmio, unsigned long adr)
 {
 	struct cs553x_nand_controller *controller;
 	int err = 0;
 	struct nand_chip *this;
 	struct mtd_info *new_mtd;
+	const char *name;
 
 	pr_notice("Probing CS553x NAND controller CS#%d at %sIO 0x%08lx\n",
 		  cs, mmio ? "MM" : "P", adr);
@@ -309,6 +315,13 @@ static int __init cs553x_init_one(int cs, int mmio, unsigned long adr)
 	err = nand_scan(this, 1);
 	if (err)
 		goto out_free;
+	name = new_mtd->name;
+	err = nand_set_release(this, cs553x_chip_release);
+	if (err) {
+		nand_cleanup(this);
+		goto out_free;
+	}
+	kfree(name);
 
 	controllers[cs] = controller;
 	goto out;
@@ -344,6 +357,7 @@ static int __init cs553x_init(void)
 {
 	int err = -ENXIO;
 	int i;
+	int registered = 0;
 	uint64_t val;
 
 	/* If the CPU isn't a Geode GX or LX, abort */
@@ -374,14 +388,22 @@ static int __init cs553x_init(void)
 	   do mtdconcat etc. if we want to. */
 	for (i = 0; i < NR_CS553X_CONTROLLERS; i++) {
 		if (controllers[i]) {
-			/* If any devices registered, return success. Else the last error. */
-			mtd_device_register(nand_to_mtd(&controllers[i]->chip),
-					    NULL, 0);
-			err = 0;
+			struct cs553x_nand_controller *controller = controllers[i];
+			struct mtd_info *mtd = nand_to_mtd(&controller->chip);
+
+			err = mtd_device_register(mtd, NULL, 0);
+			if (err) {
+				nand_disconnect(&controller->chip);
+				iounmap(controller->mmio);
+				controllers[i] = NULL;
+				mtd_put_master(mtd);
+			} else {
+				registered++;
+			}
 		}
 	}
 
-	return err;
+	return registered ? 0 : err;
 }
 
 module_init(cs553x_init);
@@ -392,25 +414,25 @@ static void __exit cs553x_cleanup(void)
 
 	for (i = 0; i < NR_CS553X_CONTROLLERS; i++) {
 		struct cs553x_nand_controller *controller = controllers[i];
-		struct nand_chip *this = &controller->chip;
-		struct mtd_info *mtd = nand_to_mtd(this);
+		struct nand_chip *this;
+		struct mtd_info *mtd;
 		int ret;
 
-		if (!mtd)
+		if (!controller)
 			continue;
+		this = &controller->chip;
+		mtd = nand_to_mtd(this);
 
 		/* Release resources, unregister device */
 		ret = mtd_device_unregister(mtd);
 		WARN_ON(ret);
-		nand_cleanup(this);
-		kfree(mtd->name);
+		nand_disconnect(this);
 		controllers[i] = NULL;
 
 		/* unmap physical address */
 		iounmap(controller->mmio);
 
-		/* Free the MTD device structure */
-		kfree(controller);
+		mtd_put_master(mtd);
 	}
 }
 

-- 
2.53.0

