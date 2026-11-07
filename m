Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046618;
	b=GXR5L7fBBXxf0OtuMPq/FLP1WE5gZCUum02eKAWkmnBT8kfe66EGypyzCs1pQqbCMBvR
	 HCxnLFmNjxtl9vjMIKUGlnvMuR2UckKF86hXJhSlLVFGm4dKSzZkHzEVFBZ4rBqmqBHj7
	 PO6Rvc25iRyvwIoWg+7aMc4FwmL3u38ySHq23b/5FDhg9MQPMxXkf3hf9x96Axv4MFqMq
	 ARV0b99W6GhBnM9Q97fJwZR61V+dqesb7Wn6yZvQmHhrXGsS+IgKNvHAMlzGdTTuKInM4
	 MkPrT+8Fjpk3hF15Ql7MeTePCTW+6Vy2p1ZmnyEWDJRaNACGT7v/iDI8ZktSuGQG7jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ib7/4t+CqeW+ELFBrguCKORu8M1jUc2Wnk+ciSZCkkU=;
	b=LpYgUA/a9Cy2CUUsPUZVUeKZkcIyzl8hHSXFRetpqtrRcKCVdLFwVqpgFXYyZpToRGHR
	 LuDiJJ3C41jFWCF7VC8b6WEqSES59CDjvAIQbEAcjiyffursY8VbxRhJwtgwr/eax+nQ+
	 LjDkMZCE06XKFi7hoSeYGUAdJvOooPsz6S6cdaLHHQHZX2ccg5HcyVM5oRP+zmC/+qszu
	 cG5Sc/tsJy451eDZuvtHPFMDAOx79hCfkcnTCuAOBed4ELrEOAvtWKTqbTnF0NwiQd54H
	 Uk8Tl6h2TOd7jlM/MRmykwfO1SrbZCh6zoCezmzDCkYXcegVtQlOsZh6vXvOCN/uUDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A5fFxik+;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C6C606EE86
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 10:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8C6C606EE86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A5fFxik+
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-8490a7d6696so973703a34.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 02:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046616; x=1794651416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ib7/4t+CqeW+ELFBrguCKORu8M1jUc2Wnk+ciSZCkkU=;
        b=A5fFxik+UIeM2oh27+Dxjwhq8Jb03VBOlU1GUWZuqGKLO25gebDW911M3+B6nrNv3Y
         sLd5ygCuKKg8Ni0+wqyt3y0npeSLV8ZlPut2ZDdBQqqcly79GPMajYVatlPFCEt3N0ti
         AT9yQDVY7G+rF+BJqicvJmo8y/GIMgvagzoDcK7CcgUHNF+ZQ0rxyEPH+lU8CnNmTH8B
         esLQ3D+JVawfo9YMtXq+w8G18aFHrdajzIXV/WoVtroGbnpUiWncyNSO2b3oaxeghfbg
         fIaqWZPpHldbBWvcwsouymRBUMPTt3Ju671ds2sB19d2IS4p7GqbMPRLC0OCNAENrnML
         /iFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046617; x=1794651417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ib7/4t+CqeW+ELFBrguCKORu8M1jUc2Wnk+ciSZCkkU=;
        b=YrmFAXJVBQ9GGCm8oVsRq0x5IRA8pkir2sERKAmorcZbwWXw23eue/in2au9sDPOHm
         vfVoX3YkswbtpLfQL/6sQp2CIsSdXILGDYr57hQCn72X1tm/ry60M41Crc2fDi3aJrar
         8AwSK5s9c9mYnJfxlBM7Q1z9paHm0VC8KB7LNzodkzU3pn7OFKRxP/UDQgJ7IHYujm5u
         kvG8md+So31lOJRCAZw0mfbA9FDr5ZK5/lpSBYNJomumV7js+xwDLxzfKQiyP2sXfV9A
         utMTQalMN5DsB4kuPSikh+O6rvlYXlo+2UVmmiIViYZGH3DRXsgaTulJPsfR3gWU4uAL
         Yv2g==
X-Forwarded-Encrypted: i=1; AKwUvBzWT1QFS6j2YkkUpx2flzGaaswisMoayo7/581mk0ZBYAqx9Qtcu1oYDR2fGkYvDMSekhQWZzn84jF3sBkO@vger.kernel.org
X-Gm-Message-State: APuU4Z8iJtYFXKfuM0dkv43Ok7fAfVKX/3K0Fa7kg2MPQ4fG1UVifnkZ
	aji2W4D17OfgR7yiRDQYRvFFEefXbho8eVVhKQ4YYAQ9t/L0wwQqdQMG
X-Gm-Gg: AYBFou3budFIw31l6Pgsnlxj5GJPyb6U1tZ06wOn/ZVRSNaljVP/zAD586Wq4+GYIA3
	ZTdhYlSXVrh4/y/OjiqyGfu8tbBYaa0fb2TR+woBKKYjbptPEDF/k6ZyypRLVNLnGe7KMb2P46P
	gnVmg6nTlFeuAgoUN0/B937bjK8mOo/qC/OnxKgs1OcEXZA7C/2YL5MVVhiwbNEyf28JCtNaWSc
	cOebzd+pnR/7xQg+kbCOP49NOg29TWiyw34dAi8A9GQvtam1FXt451bkZ4Hp1ee40Vx3j9mSfrm
	iw6t3ECpgPwAnioAHwRN5o8qbu6Yp1L/I0BFDZapVtGLfI/rJhRpO+4qswBWHplBLyQDkQSJ369
	flj2OXIP8p5BM1msgEmKXNJaHBihH+eWy2BMrkA7xhQHZ5h5/B29Z1O8w7gwpqRfc/+z5vIQvyD
	V+lIKB8cmVCfpldOraVgQST1cgHaIlWkE+3Fqyn0JyU0qoKK31+/jKcWmuaUfnj4KdVcVHbOSUh
	D18Cy74RljGs57HbR5losZs0Hi8ehGJGLnQUpmWAbo82K5dQtsyXE/I9SpmSn9WDi89lw+mjyvD
	417kie1TbfbzJ49srR/oOFkCwyFcfUUt6qWad4BYSbV/GsAY8Lbypqu6WS8zszEW+csMTZ/ZFYw
	7Fyx1sjHe4lk/Qw1fyfNBo7h6yChusXwU/3YFbJNzgS+Tz2WBZ/7CemlZ9IBchLNL+hzHhq4BCU
	eKOTVPwUsQAz6dpm902d3U/EaXP1Yn4UO+U58PYbERvyYSyBFCdlN4
X-Received: by 2002:a05:6830:310e:b0:821:d65d:37c1 with SMTP id 46e09a7af769-85f1d102bf6mr5942686a34.25.1794046616620;
        Sat, 07 Nov 2026 02:16:56 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:08 -0700
Subject: [PATCH 11/58] mtd: rawnand: denali: retain chips across controller
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-11-0181ef0cc4c8@gmail.com>
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

Both Denali frontends allocate chip and controller objects with
device-managed storage that disappears on unbind even when MTD
references remain. Give each chip a retained lifetime and a reference to
the controller, and keep the initial controller reference until IRQ and
mapped hardware resources have been released.

Unregister and disconnect each chip before disabling the controller.
Remove its list entry before dropping ownership, and use the same
release path for partially published probe failures. Denali chip
initialization now consumes its chip allocation on both success and
failure.

Fixes: ce082596ae43 ("mtd/nand: Add Intel Moorestown/Denali NAND support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/denali.c     | 31 +++++++++++++++++++++++--------
 drivers/mtd/nand/raw/denali_dt.c  | 21 ++++++++++++++++-----
 drivers/mtd/nand/raw/denali_pci.c | 15 ++++++++++++---
 3 files changed, 51 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index fa2439cb4daa..4525cec3cae8 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -1176,6 +1176,12 @@ static const struct nand_controller_ops denali_controller_ops = {
 	.setup_interface = denali_setup_interface,
 };
 
+static void denali_chip_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct denali_chip, chip));
+}
+
+/* Takes ownership of dchip, including on failure. */
 int denali_chip_init(struct denali_controller *denali,
 		     struct denali_chip *dchip)
 {
@@ -1192,7 +1198,8 @@ int denali_chip_init(struct denali_controller *denali,
 
 		if (bank >= denali->nbanks) {
 			dev_err(denali->dev, "unsupported bank %d\n", bank);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		for (j = 0; j < i; j++) {
@@ -1200,7 +1207,8 @@ int denali_chip_init(struct denali_controller *denali,
 				dev_err(denali->dev,
 					"bank %d is assigned twice in the same chip\n",
 					bank);
-				return -EINVAL;
+				ret = -EINVAL;
+				goto free_chip;
 			}
 		}
 
@@ -1210,7 +1218,8 @@ int denali_chip_init(struct denali_controller *denali,
 					dev_err(denali->dev,
 						"bank %d is already used\n",
 						bank);
-					return -EINVAL;
+					ret = -EINVAL;
+					goto free_chip;
 				}
 			}
 		}
@@ -1250,12 +1259,17 @@ int denali_chip_init(struct denali_controller *denali,
 
 	ret = nand_scan(chip, dchip->nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_release(chip, denali_chip_release);
+	if (ret)
+		goto cleanup_nand;
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(denali->dev, "Failed to register MTD: %d\n", ret);
-		goto cleanup_nand;
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return ret;
 	}
 
 	list_add_tail(&dchip->node, &denali->chips);
@@ -1264,7 +1278,8 @@ int denali_chip_init(struct denali_controller *denali,
 
 cleanup_nand:
 	nand_cleanup(chip);
-
+free_chip:
+	kfree(dchip);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(denali_chip_init);
@@ -1274,7 +1289,6 @@ int denali_init(struct denali_controller *denali)
 	u32 features = ioread32(denali->reg + FEATURES);
 	int ret;
 
-	nand_controller_init(&denali->controller);
 	denali->controller.ops = &denali_controller_ops;
 	init_completion(&denali->complete);
 	spin_lock_init(&denali->irq_lock);
@@ -1368,8 +1382,9 @@ void denali_remove(struct denali_controller *denali)
 		chip = &dchip->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&dchip->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 
 	denali_disable_irq(denali);
diff --git a/drivers/mtd/nand/raw/denali_dt.c b/drivers/mtd/nand/raw/denali_dt.c
index 8c822eae72e7..8d813cc05d04 100644
--- a/drivers/mtd/nand/raw/denali_dt.c
+++ b/drivers/mtd/nand/raw/denali_dt.c
@@ -15,6 +15,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
+#include <linux/slab.h>
 
 #include "denali.h"
 
@@ -81,7 +82,7 @@ MODULE_DEVICE_TABLE(of, denali_nand_dt_ids);
 static int denali_dt_chip_init(struct denali_controller *denali,
 			       struct device_node *chip_np)
 {
-	struct denali_chip *dchip;
+	struct denali_chip *dchip __free(kfree) = NULL;
 	u32 bank;
 	int nsels, i, ret;
 
@@ -89,8 +90,7 @@ static int denali_dt_chip_init(struct denali_controller *denali,
 	if (nsels < 0)
 		return nsels;
 
-	dchip = devm_kzalloc(denali->dev, struct_size(dchip, sels, nsels),
-			     GFP_KERNEL);
+	dchip = kzalloc(struct_size(dchip, sels, nsels), GFP_KERNEL);
 	if (!dchip)
 		return -ENOMEM;
 
@@ -106,7 +106,15 @@ static int denali_dt_chip_init(struct denali_controller *denali,
 		nand_set_flash_node(&dchip->chip, chip_np);
 	}
 
-	return denali_chip_init(denali, dchip);
+	return denali_chip_init(denali, no_free_ptr(dchip));
+}
+
+static void denali_dt_release(struct nand_controller *controller)
+{
+	struct denali_controller *denali;
+
+	denali = container_of(controller, struct denali_controller, controller);
+	kfree(container_of(denali, struct denali_dt, controller));
 }
 
 static int denali_dt_probe(struct platform_device *pdev)
@@ -117,10 +125,13 @@ static int denali_dt_probe(struct platform_device *pdev)
 	struct denali_controller *denali;
 	int ret;
 
-	dt = devm_kzalloc(dev, sizeof(*dt), GFP_KERNEL);
+	dt = kzalloc_obj(*dt);
 	if (!dt)
 		return -ENOMEM;
 	denali = &dt->controller;
+	ret = devm_nand_controller_init(dev, &denali->controller, denali_dt_release);
+	if (ret)
+		return ret;
 
 	data = of_device_get_match_data(dev);
 	if (WARN_ON(!data))
diff --git a/drivers/mtd/nand/raw/denali_pci.c b/drivers/mtd/nand/raw/denali_pci.c
index f53df1b32dda..c39abe71941f 100644
--- a/drivers/mtd/nand/raw/denali_pci.c
+++ b/drivers/mtd/nand/raw/denali_pci.c
@@ -9,6 +9,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/slab.h>
 
 #include "denali.h"
 
@@ -27,6 +28,11 @@ MODULE_DEVICE_TABLE(pci, denali_pci_ids);
 
 NAND_ECC_CAPS_SINGLE(denali_pci_ecc_caps, denali_calc_ecc_bytes, 512, 8, 15);
 
+static void denali_pci_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct denali_controller, controller));
+}
+
 static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	resource_size_t csr_base, mem_base;
@@ -35,9 +41,13 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	struct denali_chip *dchip;
 	int nsels, ret, i;
 
-	denali = devm_kzalloc(&dev->dev, sizeof(*denali), GFP_KERNEL);
+	denali = kzalloc_obj(*denali);
 	if (!denali)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&dev->dev, &denali->controller,
+					denali_pci_release);
+	if (ret)
+		return ret;
 
 	ret = pcim_enable_device(dev);
 	if (ret) {
@@ -92,8 +102,7 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	nsels = denali->nbanks;
 
-	dchip = devm_kzalloc(denali->dev, struct_size(dchip, sels, nsels),
-			     GFP_KERNEL);
+	dchip = kzalloc(struct_size(dchip, sels, nsels), GFP_KERNEL);
 	if (!dchip) {
 		ret = -ENOMEM;
 		goto out_remove_denali;

-- 
2.53.0

