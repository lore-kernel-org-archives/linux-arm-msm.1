Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082397;
	b=Mol5DQ44JeZhV/LFyk0J+yvDFQdruu7+e75JrFbzN82TgSaNHLjWnTchFZuQRS8p0J2U
	 6hJLKa2W0O/BcHgl+aT+sVFjIiQ7I09VRMstxD65OtMe0Ysm4n9N7n5RpIKcRBejy74xB
	 uZnl4dz3HYGor6+hDfggybMEahEWRaL7f69xwJw48kN8HEZWjQsQIUg5zXPIHujMpj0Ig
	 dKFS9F50ACEmkzklGNVrJz3Ixci9uSzJxVVydye/2q6G8XGXarLxazoZNVWWwYzEMa4RW
	 TYcTYptQCM+1xVgDZMLA2+ktTNuwCjaXxwM2dD1N0GcSS4kPpbyg5aLi9+ZZePKIi1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082397;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=yGaeVaifk9LejzpVmSA+OCqgtCKl6gm08dCAtuGNp9Y=;
	b=YVZutye22agZO3j9qqRC+T3Ws9wGZ9dE3wXNy4wBna+/HBvCo0XX7ya7+8GdBISIjb6g
	 KMhAAgCRzxAPdXPdsHzD0gbCcDC9GCKSuySPkocJTSvtMCIQLGyX9tXcmQ2M8hsjIyWxF
	 QRKZyaWJZVHPUvwa7DlfKNOBkQGadE4/qdVih9d72CYvcSCmha65qNMwZBdsAIOKWQhtC
	 svCf5rZzYYvLoKg6ucvNDSBVhLSxA01D/W8+antkOlhNeB/Vqah9IGlZ5itKQFsECA7vg
	 L4TbRjr35l4a/Al7qSW3DU7GYQmH+bLvKLj1n1bBC5jjn7bE2z64dLpGjdNJQ9gwQgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5209F606A33E
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 20:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5209F606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-48e9476e26aso1183fac.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 12:13:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082396; x=1794687196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yGaeVaifk9LejzpVmSA+OCqgtCKl6gm08dCAtuGNp9Y=;
        b=Kbnx15BTGiHlLqQwLKooaXv5LyMhN05xBFtrBVKmuLz2o/8j2TQ0NhU2PUByJwk2mB
         wtb1rblc+Y270pyx6/ncaGbD7XXD3d9cQz7qHvF6CiC+bEzrT+C3/7ejx+kbwKccXIo/
         dsgBJ1PXLnK2yLk097CRsAH6uqZL1bViTx4Qy6wGePK5a8Du8xJgyPxK3wam14Kla2wm
         Wh2PQAwGvDGDWqnMjKZLzfSBTwLesOA0m6XZE5/v0PWCUB3FG2e4qoKT5cHYfVFYxaB4
         cD3gZD1lFUj51i18sEBKm+XD6Pwp7zhb/XzfYfhYco40wgkDkM1Q9WMdfrvsfiQhjYpc
         wBBw==
X-Forwarded-Encrypted: i=1; AL+hErEV34ItFMxg5Co1oKfJE8jvW91Y/acUc8R2YBAGKSB8tjwooTSk7xAdIX9FtCd5mwhK5j0KDwVY2UeBICdo@vger.kernel.org
X-Gm-Message-State: APuU4Z/BUMmmyRKilH5ULbNOkfevBa9DGaHTqdshvyUp8QEt/QQ0yo2R
	8Rrk/tWp2R3VY940XpwmPVI3fnrzgqsxNqvS0psmTdKZL+mDePwiJTQoYV4Hwpq37zA=
X-Gm-Gg: AYBFou35bd1PcEJNc8VJ3Db1sRp4Nc7IUScbG5lS8HQFG17Q608JvZlMMCX7nDBlIxK
	KG3bHdUKwh92jw2OrZ2kM6+PHXSqDsZlaUeUcPQLivQdeTAfXAELehgn+o9FbR9sAVDo6tqUNRT
	/bVD7wSvEL81WcjHHODhu/+1b52adEaUgfkQNXtysKlp4qxj9NgFeEDjnCJ6HzKZRoK0z7Ffxxx
	P+/s/oWgA2g9klOhkVDCK+CAst2+HWIYcWlsMR9MODOcG1DiXyWe7ifEfvxVEo9R/6y/gI9MiKr
	jPUn9/tExSwlz/QruKDcsaxOWrckwv/SnXOvIADkUpQI/eE06dHz+tx5RvDZMXgBz7CFmdUC3Zn
	yDq2+6zzwwD0MOy9ZzkQy6uXsm3nzqAWZ/SONw7jmkijyvAje1W/SYS0oGV1AabIwX+B33GhXTR
	qn9vfjiOL46Q+AgKBaZdR9xHvl51y1lvNVkPPx32mMNGxEgadxS47IX8pJXZt8BqZ6DJ72l3qgl
	t5us8p4UN1qzsBrJZNKhxd+YA4MfqAjtp8DIJ9DTma8dzHPXrXUxJZAd6+1Q8SJ6wcG2RufIAya
	srVyd6RIjew3AOLrebaPtKOcR+OVIV1mNJHudqaYk6ewDG5Mkx9RwJeqp4eG
X-Received: by 2002:a05:6870:16c2:b0:49e:6fbc:cd5b with SMTP id 586e51a60fabf-4ad98df7d0amr4149316fac.55.1794082396094;
        Sat, 07 Nov 2026 12:13:16 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:32 -0700
Subject: [PATCH 35/58] mtd: rawnand: marvell: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-35-0181ef0cc4c8@gmail.com>
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

Retain the layout metadata used by OOB queries and unlink before put.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/marvell_nand.c | 54 ++++++++++++++++++++++++++-----------
 1 file changed, 39 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 38b7eb5b992c..f3967024411c 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -2600,6 +2600,11 @@ static const struct nand_controller_ops marvell_nand_controller_ops = {
 	.setup_interface = marvell_nfc_setup_interface,
 };
 
+static void marvell_nand_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct marvell_nand_chip, chip));
+}
+
 static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 				  struct device_node *np)
 {
@@ -2630,9 +2635,7 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 	}
 
 	/* Alloc the nand chip structure */
-	marvell_nand = devm_kzalloc(dev,
-				    struct_size(marvell_nand, sels, nsels),
-				    GFP_KERNEL);
+	marvell_nand = kzalloc(struct_size(marvell_nand, sels, nsels), GFP_KERNEL);
 	if (!marvell_nand) {
 		dev_err(dev, "could not allocate chip structure\n");
 		return -ENOMEM;
@@ -2654,19 +2657,21 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 			if (ret) {
 				dev_err(dev, "could not retrieve reg property: %d\n",
 					ret);
-				return ret;
+				goto free_chip;
 			}
 		}
 
 		if (cs >= nfc->caps->max_cs_nb) {
 			dev_err(dev, "invalid reg value: %u (max CS = %d)\n",
 				cs, nfc->caps->max_cs_nb);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(cs, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %d already assigned\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		/*
@@ -2688,7 +2693,8 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 			marvell_nand->sels[i].ndcb0_csel = NDCB0_CSEL;
 			break;
 		default:
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		/* Retrieve RB id */
@@ -2702,14 +2708,15 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 				dev_err(dev,
 					"could not retrieve RB property: %d\n",
 					ret);
-				return ret;
+				goto free_chip;
 			}
 		}
 
 		if (rb >= nfc->caps->max_rb_nb) {
 			dev_err(dev, "invalid reg value: %u (max RB = %d)\n",
 				rb, nfc->caps->max_rb_nb);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		marvell_nand->sels[i].rb = rb;
@@ -2737,9 +2744,14 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 	ret = nand_scan(chip, marvell_nand->nsels);
 	if (ret) {
 		dev_err(dev, "could not scan the nand chip\n");
-		return ret;
+		goto free_chip;
 	}
 
+	ret = nand_set_release(chip, marvell_nand_release);
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 	if (pdata)
 		/* Legacy bindings support only one chip */
 		ret = mtd_device_register(mtd, pdata->parts, pdata->nr_parts);
@@ -2747,13 +2759,18 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 		ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "failed to register mtd device: %d\n", ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&marvell_nand->node, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(marvell_nand);
+	return ret;
 }
 
 static void marvell_nand_chips_cleanup(struct marvell_nfc *nfc)
@@ -2766,8 +2783,9 @@ static void marvell_nand_chips_cleanup(struct marvell_nfc *nfc)
 		chip = &entry->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&entry->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -2932,6 +2950,11 @@ static int marvell_nfc_init(struct marvell_nfc *nfc)
 	return 0;
 }
 
+static void marvell_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct marvell_nfc, controller));
+}
+
 static int marvell_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -2939,13 +2962,14 @@ static int marvell_nfc_probe(struct platform_device *pdev)
 	int ret;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(struct marvell_nfc),
-			   GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->controller, marvell_nfc_release);
+	if (ret)
+		return ret;
 
 	nfc->dev = dev;
-	nand_controller_init(&nfc->controller);
 	nfc->controller.ops = &marvell_nand_controller_ops;
 	INIT_LIST_HEAD(&nfc->chips);
 

-- 
2.53.0

