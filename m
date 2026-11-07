Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046655;
	b=L2FCRhQwIBbhSGt1HKSMyhjWx+F3QJSxwevgIxwryV5SntahZTu190K90e23kh+uhRgM
	 KR+DMPcMMeEBEWbUqFg81nQKjaqWBdq2uuDzbhRdOpFXGVJHpskkOh38IbXL1Qiq5ZRFv
	 6L+Nsi9Bgt0FJ5aeHb1E49oi0bOUfdYTZ3bJoA1k/FnnWMSvMMUZqc+VKP6gdqHibCQJN
	 90juyGXj3GJDQwPR1oWxs1cr5x4Vet+g1rP9pnFl/0fAp/OXyeFejxw86OCXaHZYbPzYB
	 1wz+aKZ3AVAMHhUdHXdBiiuVfTSl0quJQUJ5WCBWyq59BoXuNbqUzrDqcljDrPjJOSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=PzgbI8X4Voq5iI6HG1dOPbCOfJ17p492ut7p3i4sm7o=;
	b=yv/4KwGyNbsXLsbGqRWZmXbi4zZDJbHExRYGaC5UPsyq/a6TYDzvOHR1uFmtsy63wPow
	 3tLBjD2s6PY7+miomi4l4eIYGwrB+TCqFFz6LF9i+6naZsmlmLb2r+6eTfBfLQcTcN9ux
	 2cHq7or2pVpW29uZ/7UvLncXHPPgdVPrT3bGLtecflHwDbhKZ2wxRm/l/2Upgh+Vq7gnF
	 dDh2D4e7oi56Oo2Wt3IcakEM0jAfikXyl83JsXV0IeimfKAEPn5QEWJuERGxEuzzyILtX
	 /qH29WUYk1xiT8p1MW5dtSGYoL6pYo0pZp3/tMVHTC2XA3GzknkUaSLQ/6Hp2ymXG1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N+2Pngc6;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B60606A8E4
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 10:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86B60606A8E4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N+2Pngc6
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7f48c750afcso836172a34.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 02:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046653; x=1794651453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PzgbI8X4Voq5iI6HG1dOPbCOfJ17p492ut7p3i4sm7o=;
        b=N+2Pngc64OPWMAkTL0wtY+HdVSNWRS5ssOjU6wjCQWiMlvQ/y58voNZv1HDc2ucjeu
         nC5VhBH+gOC4ECeYBmyNZrNgyoomfvMfPRZZZNLK6M5XPtAzOc4/XK6yATGwkgYoLetO
         KqB1HSk1eZ+gvMyXhwLqMGaiCR2eVl4qPl1AYLxFYYuFrSCzDBaatVqFK+bCyIgai8Lq
         72I4EUedZiWAfyzN9WgeHZNNIXcSV17EkU37ODCwHs/DXHO4YqdebPTON9srLa6MW7ZT
         zmzWs+VxVSzc2estggAdIJWlnPQoYKQJZxgINd1VmT9HCeZ2d/154RofmBbRjIU1a9VT
         FCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046653; x=1794651453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PzgbI8X4Voq5iI6HG1dOPbCOfJ17p492ut7p3i4sm7o=;
        b=WOm75IduchRMmPwlAz7OLoEBeuG9Nvmz7/BNbT1guNCFbJGU01/sZjReHTTv2HZ4l9
         uMGyCG39KZ5lyQZ86/Ubc07pMbdKMcgEcJTb8OYgmwwBvql/xz+txPa0odBMRlX6VHfC
         pm09mH2NtgY8D/0xP6z+ukpa7FEyJ6Ok6Dwbevj4RtvoyphUaN1CVEesx/tLsJtejqm2
         rQRdekawHiRb2c9qg3acJhOsezsepAfYm9pH6V1A9wweHyQKGR5Iri6XcmPgHTg++nkS
         dXN4dXzQCHHUPw3gpEnZSot0sIfdKDa2hT/hM/RbhJbCkvk4yoERMx+Hocg7uONoFMj2
         RC8w==
X-Forwarded-Encrypted: i=1; AKwUvBzRZznpfRlffd0v76XzRM+XtwZb1p+9vJWN5OxfEy3Ezs/jF0nhoQ/mDowzW5TeN+zhAILZj9syfgyeZRLo@vger.kernel.org
X-Gm-Message-State: APuU4Z94imlnlwTxFgxakGueq4Sk40Jeis6hOpEqDSabCXBdmR/98u3/
	Jr6e3cmeZ7QXdOjVY3z3EeQ2+75C2fYlhRb5bnWpcxjFvdFycCrJh+Sy
X-Gm-Gg: AYBFou3OJqdnwXAufdISlsecXomJ2eD/OAroqgVaeeCaA5ttIHabwOakIcwUFeZ+8CQ
	1StJcNNPIqah+v4LQapCO4YPlBWaf+fMBRs8ndfkdsTd8QYmog+yAJE49PmA5TtyD8oRiMxrMCR
	7uoCj/vKy3guISDac+nSxs5SZN6evYARobr+TGkgEeAJ6dpZjvZocd7NI0rSfdRRBi8cmSvt1p1
	xFSQZ+PHb8u3FvoFEQa1172PTU2uPLxX2DknJAamGE6Hm3vBuuywCakCQu/oXrgZzLL+wDfrki3
	v+y/va3QmAARi7GdtAwEUiefUq17r7l7Q3ZMrPZBszdpgg64sU0LoSN7vaet2YRMxyFKVbPpKkI
	kEEAM9NXgHAHOskm4mZz/PXDD8v+BL1vEy4z2/oCvGk/8Oh2QUdIjaHTcdZsVY3N/EjrTrgbe5q
	VZO1T1hsRtMeu9Qm7Nx1tdWKFQVYqEdhjyhGXkjMlxjigqp9SwTtkpe1qxYcCozAt0TTq2ZI2lW
	p+aNaJv4FJnCdu4n2G/vD4a7P7Tjqd0muYq5UtGiORPndrRP325mLsLA9uAuEuGriw7vlMIJJBk
	NVA0CwOdgfX/SPNoVfg3JKN5zlrKvALgirJLn/LjYyUa0rJIYMCOWdl3k4MGFqDPBXTG5DBgCjv
	WTVeQqHLHuPfLOpI3gM/liRkNwwIUtDlZqjBoWdNwNjLQaPR/qPEbx//d6O6xsD+adNTCmVVKYG
	DDNSsY7M8wy3e7iB5BU5WJs07vieIH3EUof1V6DkdC4BguogYAiYLIkFSZrdOP+sPkfUOGrxE6+
	g==
X-Received: by 2002:a05:6830:2306:b0:81c:5aac:798a with SMTP id 46e09a7af769-85f1d000dcamr4738701a34.13.1794046653358;
        Sat, 07 Nov 2026 02:17:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:21 -0700
Subject: [PATCH 24/58] mtd: rawnand: xway: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-24-0181ef0cc4c8@gmail.com>
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Retain the embedded controller and chip across platform-device removal.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/xway_nand.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/xway_nand.c b/drivers/mtd/nand/raw/xway_nand.c
index af84395dc66e..4686f28797bc 100644
--- a/drivers/mtd/nand/raw/xway_nand.c
+++ b/drivers/mtd/nand/raw/xway_nand.c
@@ -8,6 +8,7 @@
 #include <linux/mtd/rawnand.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include <lantiq_soc.h>
 
@@ -162,6 +163,11 @@ static const struct nand_controller_ops xway_nand_ops = {
 /*
  * Probe for the NAND device.
  */
+static void xway_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct xway_nand_data, controller));
+}
+
 static int xway_nand_probe(struct platform_device *pdev)
 {
 	struct xway_nand_data *data;
@@ -171,10 +177,12 @@ static int xway_nand_probe(struct platform_device *pdev)
 	u32 cs_flag = 0;
 
 	/* Allocate memory for the device structure (and zero it) */
-	data = devm_kzalloc(&pdev->dev, sizeof(struct xway_nand_data),
-			    GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &data->controller, xway_nand_release);
+	if (err)
+		return err;
 
 	data->nandaddr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(data->nandaddr))
@@ -192,7 +200,6 @@ static int xway_nand_probe(struct platform_device *pdev)
 	data->chip.legacy.read_byte = xway_read_byte;
 	data->chip.legacy.chip_delay = 30;
 
-	nand_controller_init(&data->controller);
 	data->controller.ops = &xway_nand_ops;
 	data->chip.controller = &data->controller;
 
@@ -228,9 +235,16 @@ static int xway_nand_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	err = mtd_device_register(mtd, NULL, 0);
-	if (err)
+	err = nand_set_release(&data->chip, NULL);
+	if (err) {
 		nand_cleanup(&data->chip);
+		return err;
+	}
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(&data->chip);
+		mtd_put_master(mtd);
+	}
 
 	return err;
 }
@@ -246,7 +260,8 @@ static void xway_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id xway_nand_match[] = {

-- 
2.53.0

