Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046647;
	b=uQHxE/19iBbmR9z64/70FCsz/ZRM+kbaGoNQ+dvLFNPZZKs65JP326bMIGLUawPAmZ72
	 7uTPLodCFaTv5pXQJF0Nmjv/UJ0vlQiiZv5oVl4PU6lYq8IBKX0WzD2ORwIgHfsMllqul
	 jqMFK7bT8C3vwqYFH8CaVleuhfRY4SQ9shlZftP/knPxgt0A7CxBp3FnrVRvFWLjxgLhR
	 yocvqJ5V7jnIu4CR9ruV0o73Hhf+OhMw6hGGZsTe8WFceXXV+729/9Y9zUl6gdZjKjcJK
	 UOHxABw7LZ9n0SIP4P389/Ky9uMXRWTxY9Kf0WGpKMoQsVTymhV5zEpMNBOFB+oS4lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+X9Wh0VhZwdXQo9xIloNpny3dCBPLPixF7cRCMQpCJE=;
	b=CrVv4TdFOSbSt6gBGxxzqA8zjB7SI7d8w/FlQn41vhveb40avj2cZtYsgFMbHd7zcFZb
	 wMNjb1oC5pqb+w2jLshKcRvv3jiBebPFZCIAviCHTkvvkLeqo857td6x6zv75HBjeixpR
	 GlCIn8s5caMzuOivsQSIiSxQwP8EDcAo4y+nH3qeaH6zetqwY4ldXvWUtbJSig0WqYxH1
	 KNd1VaogiMAqczwP57K6zGxhEJRYK5EpLM9QCEzC6ItUHyfTt+dsQiDWWKAE94xw7a4kv
	 1EE2+S558GWV0hxeNnPQ/HF8RoJfOHoJb8Qgx+bvy+aC41UDzSiiR1rkFUbEmPphZOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=boJBpOFa;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B059608D94E
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 10:17:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B059608D94E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=boJBpOFa
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-825b40f8a26so617717a34.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 02:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046646; x=1794651446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+X9Wh0VhZwdXQo9xIloNpny3dCBPLPixF7cRCMQpCJE=;
        b=boJBpOFaWXg9wXq+ltfLnmSjfqVCLDxUnagUBw8rsO1tBphZe7VQCAIg/O0e1c2fqf
         6umNyLECihkc0RDlzAPpHR+SRuPpebGzgJ+WLx12WqRj2ur7VWbUThbmfLfLRFUy2vLV
         AYTjfe+Ttp2wxQeIcLVaidcALI+9s1sXrVEQOp3H+tHBy+IEUVuyIemQ3IffBSEBE4Lp
         PWZoJabAXG19eRFOvq2nap8ufj+8BWpIebDwRnDIMvGSKVrtFX9TRKL9i2wn2RYL/1vX
         eZoNWOLrAtlWDyctlpgwuXsyWWboJtO7d7rZpl1UK7VPE7utQiRxD3nu0e5YqpgwP1CK
         YPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046646; x=1794651446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+X9Wh0VhZwdXQo9xIloNpny3dCBPLPixF7cRCMQpCJE=;
        b=rh7ZkUKx3NSdJzHqaMC7xYEGqK/9S7CDnlprIQfXCFBvpBlDGpsnPQF2wwXCAORaxG
         RGtBoeqPqdZJHqVKBj1w2qNtEig/KxbwOXuo2SZBPEej7YP+Ov+fhSfrh4XcBv6gO5p5
         xcxmGXBkcyhhEcvnKE5otgBr0674gfgYYvJaPjK7Azo9gL6bcnNlHojX79XtADK6kLCy
         hjiAwCo2nKz77RAIJJw3Eype7YfIHF9oWj2UNDko6+0c5PTmWpXwvxLRY9q6j3410Jam
         BiEeOAMev/I2bsc3E3rEV26/t4fNnNczGdk6lz1GJcGbQ9tLMZAVgf+Gx0+SgBi4nVdY
         Vv5A==
X-Forwarded-Encrypted: i=1; AKwUvBypKKwHFXRIRSHwKm3trTHwE7lIN5pYtrH37hTYhHAOewD9iLZ5onHb+YJ/JnaiqOt7hT+Uvg9egZ0BBaIm@vger.kernel.org
X-Gm-Message-State: APuU4Z/aN9JOh0kbNnQUp9MlK1H6TJAODZsUzaRc7qBXF2G+VmJnbbE9
	bNfUtlRkwzehicBiO6EJ0Mk3RL+iQWwds4uPb3OVzjNtBjOhcf9O3hno
X-Gm-Gg: AYBFou17JML96gi+ICSQsCvj3wvV3WrZPDhs1Wl0A6/FJDaExrWZWdSEz1EMcvZwBTC
	v885QgGFyLDbmTyp+80rGzbIiI8LGgdyelNTSXwJjmW+kARzUjKsm1+SEiTFi/V6BEptfztNnB1
	Qlnf8c9GPpOwA5GLkqY9GqcdnH3O7ONGBPEtYZyI2qSEsZfsDWMfu0ahMCoV/vxVnLkHzo6uRVV
	IVfMzLSpRVlMqbUHCUQbKThgGLsPfLG/hAPTo3IUDJzh1aNTuQfaj3FpX3yDt4MWkM96EHiDKBH
	uaW1g3eXR0ROWkJcfm6kG4zExikB2MzBYcdojvO+imYSomIzICuZW96wxfzBJOI0Z2IRMfgjAqZ
	kX6e1sz7e7fdt0wi0lC7AB7xJ6mEEGaX2lIG6F0waJ5euXAhgm3J3Xkymb+t9NrrsAqqt3W7WvS
	htAch7Lum7k32IYSOkaKnOOTUxiJwO9qnycOrAbSRUU5D1g8IAhiZlGCGBGSkw/N956LhDdxg2A
	lMRC4oNgsWtDdjNcfiuKtN3AS+KxFyxDFzNYJy+KDV2v/SuZ5y6Pkt3dqE7m8NAUjcFWAMhD+a4
	ZcasWtTDL/H0kEIxyy1bnPMVQDQAb8S3A/Z8ycgZtPiOtIE8qQIicgG4ai6qE4sAxEkTARrXsBn
	efwM3Dde+VsLGN51ZXlYdqE5bSbdOvdDIY6JZej1JkVro1dTwN7Ax7ceT3iEZ/YEwolT19PVX8P
	x1O3uiGzkSuD5r5rQ2UNkMTIG8ZmqRI1Zy1A26rpZG75YQKmal47ZQ
X-Received: by 2002:a05:6830:2546:b0:834:200b:49b7 with SMTP id 46e09a7af769-85f1cf63bedmr4454506a34.17.1794046644873;
        Sat, 07 Nov 2026 02:17:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:18 -0700
Subject: [PATCH 21/58] mtd: rawnand: fsl_upm: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-21-0181ef0cc4c8@gmail.com>
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

Also clean up scanned chips when partition registration fails.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/fsl_upm.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_upm.c b/drivers/mtd/nand/raw/fsl_upm.c
index f4dc990a8da1..bfa4f450d7c6 100644
--- a/drivers/mtd/nand/raw/fsl_upm.c
+++ b/drivers/mtd/nand/raw/fsl_upm.c
@@ -69,7 +69,16 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
 	if (ret)
 		goto err;
 
+	ret = nand_set_release(&fun->chip, NULL);
+	if (ret) {
+		nand_cleanup(&fun->chip);
+		goto err;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(&fun->chip);
+		mtd_put_master(mtd);
+	}
 err:
 	of_node_put(flash_np);
 	return ret;
@@ -160,6 +169,11 @@ static const struct nand_controller_ops fun_ops = {
 	.exec_op = fun_exec_op,
 };
 
+static void fun_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct fsl_upm_nand, base));
+}
+
 static int fun_probe(struct platform_device *ofdev)
 {
 	struct fsl_upm_nand *fun;
@@ -169,9 +183,12 @@ static int fun_probe(struct platform_device *ofdev)
 	int size;
 	int i;
 
-	fun = devm_kzalloc(&ofdev->dev, sizeof(*fun), GFP_KERNEL);
+	fun = kzalloc_obj(*fun);
 	if (!fun)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&ofdev->dev, &fun->base, fun_release);
+	if (ret)
+		return ret;
 
 	fun->io_base = devm_platform_get_and_ioremap_resource(ofdev, 0, &io_res);
 	if (IS_ERR(fun->io_base))
@@ -222,7 +239,6 @@ static int fun_probe(struct platform_device *ofdev)
 		}
 	}
 
-	nand_controller_init(&fun->base);
 	fun->base.ops = &fun_ops;
 	fun->dev = &ofdev->dev;
 
@@ -244,7 +260,8 @@ static void fun_remove(struct platform_device *ofdev)
 
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id of_fun_match[] = {

-- 
2.53.0

