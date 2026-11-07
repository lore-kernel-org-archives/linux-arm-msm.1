Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082444;
	b=GWycQHvWS8IHbJDBdV0JTHR3+l86czNkhHo5Of0WktA+MbCDS2kJ2zUv7CnPQ/fOm+JM
	 Me9RWblFC5vZUB4JmlBSUUDyNqWhzGLfw/s5EvLPoTkeHTwQS25b5heJ0ORJSD7pTKATZ
	 k1+RqroBgSCUM4povlrl2aCZWltUg+MVbC0GVaOnH8BCSn5EHTXbCiGM7gtUlE6rNMmng
	 3TSy3QECqYFXQK8am3r/O5vhacCX6N8il1BVcQ9KxovU41k2fxGP9hOdZP+o52syTqQ/U
	 C6KRhtytw4+rRXuEL8VHjpA6F4hpBK8qbFFPuf6J6uaU7CQwmyLbOln0UdC8NtbdDpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082444;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=7Q5e5yIGTXK7xHQdIJMFEChTgYJAM4yLdAHkjKqEUeE=;
	b=4t509JIiyRdqiy8ncoEE/envHRPTbRvxALlD5JhOBsv2TYXY5QKzmXq0kjvs5NtmNJEo
	 s9kudPjkgFBu5J84oSoQEYOSqtN2kfDDFs/EAaMxEuQcUSznDx6s3ygSH1q+IpnoDeBbw
	 hTS1VkDJTj2JSWAfyBoT3vzkQSuqD71bF8yAw664GsZ06szMiyhESZk3/r6qgUSLgqgrA
	 jmjFHkuentSoyrGE2nULXjZqLRvruDtVue4JpDkrjJGgvznF5kpVatvDt7/PkvPPZXGy1
	 nCL+G7S/tGWGjXzupHf/SDdjjvB8vWczyF3TFDKTf4hZ4JpiLKue7YJcZPMN2RcpUrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEBD6082BCA
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 20:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCEBD6082BCA
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4877837890fso3568fac.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 12:14:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082443; x=1794687243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Q5e5yIGTXK7xHQdIJMFEChTgYJAM4yLdAHkjKqEUeE=;
        b=djXaq87I0arEvxZUL0Oe5uS56rUqCO7Fk5Hkq7cn3QVp1Uep/8qEQa88nDaq10OYec
         24v4Ef1h+WRPDdu/24leCDiE8Yhk8kBffGvtrGc84Z2wMFvu+XQ6BZwqtwFnF/2ZxpfJ
         qFemN6qAImMtEotQ+2Q0s2DySfx0Gkm3kRk56pX2czjvw7xOIwtL8SoJeU0Pjp9te7pZ
         y3AgC8o7F4XIBWrjmO2zukIllkl2nomzgl8dGu/TTzYIxd0FJOJnNzKeR9/F9uGb4RWp
         uyb5xGdJ+oAttfPWUWgdL9DkmaS28o7YaAhyMM8sow8ucakm8pg8Zt6x8n+DrStnftk8
         zByg==
X-Forwarded-Encrypted: i=1; AL+hErGLEeiZe4W1RgnjvBBE1dgs6ELmvu8vnC3HVTOca8OL2v9fw0PMxlWhzTzasQUzmACTF2U+YBULpwvYPAT6@vger.kernel.org
X-Gm-Message-State: APuU4Z98mHVHlCnifrO9SJZs3QeBaDSNuaTPXQOULDtjjWrUHsmP5Wbn
	+k6gyIqrHsBie8IwrUJwWWkKGyR5dKxBgiO39C9IAh21wqUcg449Hy9/Gg3v3VloSxU=
X-Gm-Gg: AYBFou1zijJVzgcZLSC5k4AvMmULQA8YKbpiAD4GUk2TljvJls4dsNuwjuT+KFxZV2S
	Dk7FvXcrVi9NFTulN7Swakrh90/xIoXiazi1AAXF6vOqc2JoABOpWsJNCF1C1bDlbkiFvh0Z4G5
	FB48HlqwFPum/WBe8bgq3tPml06bfgO0i7k4zr5+QJgMjH2tjocLbhJ57bWHAicQyhN0L4w20Ry
	YRqsZrU2aDtVYxc5yYWR7ZN1SnGAu4YwHiDJGXhoLtNhwomynDybD6le9ctP4YRM9m747EYoJiZ
	6YwJ0VMtLQXslI7Z+ytaOazOtCYr56Jefqzt5cYpGFKCNpZnTEBb02XHieh5Z14GMjhqjjO7+Dx
	d/iBHOPmdWMTjOYezplqFMYsZzNIq605xk3KiB7JJRPwlH2bp+AEoA6GLknzhuXQR34L2s9Y48f
	HPszeGYSTKFTmOvPHLJMT3ZKuJsMWoc/WoV/ompyVdHdYqcVJDBcsyJ0jSDVXRm9aW4PjX9sTZX
	yd7pL+XfhOlfx/IGAxciKcFI0xGye/ZKK6rvNLxtg9dnAsyxmCd4axXu3sPE3C/BHCtmiiG2guH
	cT+MNIlo/34SwZF8xBKPE/3Q3ruzJ+46cU5AogwTpDYpawtW3xyPzYTKxkt4
X-Received: by 2002:a05:6871:3a10:b0:459:fe2:ef54 with SMTP id 586e51a60fabf-4ad984fa6famr4620570fac.1.1794082442478;
        Sat, 07 Nov 2026 12:14:02 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:14:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:48 -0700
Subject: [PATCH 51/58] mtd: rawnand: mpc5121: retain chip state across
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-51-0181ef0cc4c8@gmail.com>
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

Drain NAND access before unmapping the external chip-select registers.
Keep the embedded chip and controller alive until the final MTD
reference, and unwind scanned NAND state on unsupported geometry and
publication failure.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mpc5121_nfc.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/mpc5121_nfc.c b/drivers/mtd/nand/raw/mpc5121_nfc.c
index e6594548b7e0..1618f46f69df 100644
--- a/drivers/mtd/nand/raw/mpc5121_nfc.c
+++ b/drivers/mtd/nand/raw/mpc5121_nfc.c
@@ -611,6 +611,11 @@ static const struct nand_controller_ops mpc5121_nfc_ops = {
 	.attach_chip = mpc5121_nfc_attach_chip,
 };
 
+static void mpc5121_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct mpc5121_nfc_prv, controller));
+}
+
 static int mpc5121_nfc_probe(struct platform_device *op)
 {
 	struct device_node *dn = op->dev.of_node;
@@ -636,6 +641,13 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 		return -ENXIO;
 	}
 
+	prv = kzalloc_obj(*prv);
+	if (!prv)
+		return -ENOMEM;
+	retval = devm_nand_controller_init(dev, &prv->controller, mpc5121_nfc_release);
+	if (retval)
+		return retval;
+
 	regs = devm_platform_ioremap_resource(op, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
@@ -644,14 +656,9 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	if (irq < 0)
 		return irq;
 
-	prv = devm_kzalloc(dev, sizeof(*prv), GFP_KERNEL);
-	if (!prv)
-		return -ENOMEM;
-
 	chip = &prv->chip;
 	mtd = nand_to_mtd(chip);
 
-	nand_controller_init(&prv->controller);
 	prv->controller.ops = &mpc5121_nfc_ops;
 	chip->controller = &prv->controller;
 
@@ -782,19 +789,26 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	default:
 		dev_err(dev, "Unsupported NAND flash!\n");
 		retval = -ENXIO;
-		goto error;
+		goto cleanup_nand;
 	}
 
 	dev_set_drvdata(dev, mtd);
 
 	/* Register device in MTD */
+	retval = nand_set_release(chip, NULL);
+	if (retval)
+		goto cleanup_nand;
 	retval = mtd_device_register(mtd, NULL, 0);
 	if (retval) {
 		dev_err(dev, "Error adding MTD device!\n");
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		goto error;
 	}
 
 	return 0;
+cleanup_nand:
+	nand_cleanup(chip);
 error:
 	mpc5121_nfc_free(dev, mtd);
 	return retval;
@@ -808,8 +822,9 @@ static void mpc5121_nfc_remove(struct platform_device *op)
 
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(mtd_to_nand(mtd));
+	nand_disconnect(mtd_to_nand(mtd));
 	mpc5121_nfc_free(dev, mtd);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id mpc5121_nfc_match[] = {

-- 
2.53.0

