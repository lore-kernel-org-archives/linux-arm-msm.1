Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082215;
	b=fXY1vetMunPeSMsbB65FZ8kfp3r9PSSWf0a6ZB6OLeDZo8CA1tl5PelT3Vo4xfQwevG/
	 jQxdCfu15LW3IumnOcEBHB/La2sJlH2IG6s3lh8KJioVI/qjH3PO8e3VDz1EN5f6h3VK0
	 hbkZMEP54OX/VXsQYOl0dm6e9YljhyVVliYQ8gWwN26oMaVb61IKv2TLkmeC60JrgAR5a
	 9GSq/JsiZuYYbU5TbJJsLnU53ewgo6CZLDja3Y3ldbg0b78kVjJAqTBCWCXWonkloIIFl
	 u5/3UaCep/UL3c6jI7cLZQxLFqjHEJCxi4OF2qOt2YH60kSvaXZ7VxqB1aTsOKy4fjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082215;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=/IYxRQsQO6UsoPYARG/MQ3DRm7b0plb/fBLBgAtsE5Q=;
	b=k6WWlBPEBaQK4cZh+un6LZgrr+LQ9zWe+BqSE1xSaZIpHtEi/i5fcWx1luIZRjVoMHuo
	 MK1VsRG2cfaQD6Mu1L/ZVFZPySAZ7epknGLc2IWX6RgE0Ni7JTICRaMujM9lLJBLiFqPi
	 HRP+tXuYLUDBZgQN/HQnd9D6sRxrHzzjly+k1cOwBpyIDd1We/MAe5mCVyhSI+hK1uY3O
	 Na4/3a20ytZXnD8khhlWldCac/dUD7guPzuwm6mtL30AO+y0/AIkaunBbd39J+FYzunjM
	 8G1YY7ogWJXzZsh/I5ljygjlmp3IRNut1ATp6HPWb2lvTefIYjKNGNBfAnQ+DAtMptw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD3D606D822
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 20:10:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BD3D606D822
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-4a85c656c58so2259fac.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 12:10:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082213; x=1794687013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/IYxRQsQO6UsoPYARG/MQ3DRm7b0plb/fBLBgAtsE5Q=;
        b=VN5l4nYsLz9l4eY8eeQVIxWDy1853zucr6hntnyFrDuOq8Y41KyeI+cpI2gRVmR0cx
         8yNUN/q3uf2YwPx+oMyoXmm60E5BQhk11LScaIgnb9TE/4dg64GmeKZhuh4D7fEA5Gb6
         WJ/sxpo2nI1mkZqK7ztSTzX4e71CB6LS82oa4bkNWFtw3YGeJd5P3rZSKNiDJ7FepPNf
         bqMOtI2k+98tM5NriMqrXpnEW05zdm8Y8dT84hNPs4HXKyw/GNluCX7Svmv+AYSExrCP
         /m1cMsqAhI013Ya24Bwg7WM2QrFA/rlWQjx06cjrcV9hvN+zCI6Rn8+hnHc9E/vqWMCE
         Dgag==
X-Forwarded-Encrypted: i=1; AL+hErHQytfL6jYaulRU0K9qBWCz3c9t6cE8BI1tA6I9vsb5Sw/mzOIsEWpFPumRDQKNdwVQFp3ZUvC6TNqldDyA@vger.kernel.org
X-Gm-Message-State: APuU4Z83erOEB4dWZ1ijWTmOPu+XpispZ0CwLU5Gp8xJudMRFVoKd5YF
	q8Y93p4bjpAj41DUbCuAR1l35qhvG01+Ee5KVFmcnzOBmr0xF+pIGoHA/8t90cRCy5o=
X-Gm-Gg: AYBFou1p2UxLl0ERh2UeoTvaGlBq7G0JEyV1TBpWUoh3qdMuCl4HOQKRzera5ls4OIL
	KDqF9ijNiTK+qWg5PbOUpGRoGVotDxHcqj4se6L5xZFFoAcDrxJGZVMMlNN3uH/qmmfNElNNWB9
	BeNa5LO4Qb8VX8T8aO6Cly/YE1hd+0u9tJ/pFSHA0gClFSmKZmGL3iWuLjevRdiUfg0sXMY1MI5
	UlY6jjeQMnl1yoNDh3LfpaJYtLFlf80t2YI88wI7gqRHm/NkVWqszrxOSf0neMwPKQuMoqQqYqH
	iH4vMYNPO9INlfj1xtSbdoxHq8JK2ON6+CP4IPJ3H5Fmsr9t10QaMlkDD+JihOEEFA/EAMoRstX
	pUQxwivp89R6C2zEnBsQVhA/wsvw8RIUB44j2jEKMTINGkOWTkB8yjW2/ZFd81eAdRrsBaNcxPj
	09LqWMRZ/pwjt2uRMs7CnQfcsfxITwCcysMtb3CSMDvYwLhsXCA6IzsZmsz3f1oAQUxz9nlCgLe
	1JSwSNYkOTly2Wy/q0VRMP/5L8MegALO42CYUmCcDDYnLObnQ3i4nr6dy0xqIC8nxJOZwhynim3
	621fivzZaxiBqL/HyCa5G07lYfvQhIUFAjxUHxHgYOJZ5gpBG23APUUr2T0=
X-Received: by 2002:a05:6870:4507:b0:4a7:4730:affa with SMTP id 586e51a60fabf-4ad98b59767mr3847741fac.24.1794082213294;
        Sat, 07 Nov 2026 12:10:13 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade6a26d74sm212708fac.15.2026.11.07.12.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:10:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 19:33:39 +0000
Subject: [PATCH 26/58] mtd: rawnand: vf610: retain open-handle state on removal
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
Message-ID: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-26-4311be01fa4f@gmail.com>
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

Keep managed register, IRQ and clock teardown after chip disconnection.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 9940681810cf..903a25c549d8 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -805,6 +805,11 @@ static const struct nand_controller_ops vf610_nfc_controller_ops = {
 
 };
 
+static void vf610_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct vf610_nfc, base));
+}
+
 static int vf610_nfc_probe(struct platform_device *pdev)
 {
 	struct vf610_nfc *nfc;
@@ -813,9 +818,12 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	int err;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &nfc->base, vf610_nfc_release);
+	if (err)
+		return err;
 
 	nfc->dev = &pdev->dev;
 	chip = &nfc->chip;
@@ -873,7 +881,6 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 	vf610_nfc_preinit_controller(nfc);
 
-	nand_controller_init(&nfc->base);
 	nfc->base.ops = &vf610_nfc_controller_ops;
 	chip->controller = &nfc->base;
 
@@ -885,9 +892,15 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, nfc);
 
 	/* Register device in MTD */
-	err = mtd_device_register(mtd, NULL, 0);
+	err = nand_set_release(chip, NULL);
 	if (err)
 		goto err_cleanup_nand;
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return err;
+	}
 	return 0;
 
 err_cleanup_nand:
@@ -903,7 +916,8 @@ static void vf610_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_PM_SLEEP

-- 
2.53.0

