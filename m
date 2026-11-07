Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082211;
	b=hDMnigsmEozcjHzwKRgwgPSOBzmigC/wcBP/nhuFbTqSYzcRLcO3aUwCfuQYyh8FIhAY
	 wlclYEXyeSa9rZ16k/C+bUkb261AtXKCxRTZocJhHbwwwfVzacDUCajEU9DRuhQgo+yyy
	 8JY1mzKVps3vyp8O3gwuWtbUzDoifeJM6wBYtYBKhZRnVodB/BVg9E5am24KYmGk4HAl9
	 lpp77/irBTPbNw7Hi6oaFVpZxYP+rMHQJ6NIRrb1NHnrdBouRikksp6GOCA/MZPImSf7z
	 CC4RP4d0dxOoMc/QylQ+pTo94KN4v7ocfU0HRhajAg86oIfHBfmEmIuvTXsLH008qFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082211;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=0BAmvwUewoGLOJLuXxq6dZ5RycZKZl8yqwoNBMJWREA=;
	b=xpHZboxofw6vOAmff3rvn/xTm++nLP5NverolJQn234VUqBSlVRJmYQLwNRkgCa3Pnl0
	 kaswX28SQHZZDL9p0DnpMq/tphxC2BnC5YHcCnLvPMehenll2ChMQrzVQN3a5mR3Fe/gt
	 aNuod8+f0xkTrYY+Nhs9yPrsX6iY/6CVhXPx+L4a+mKXSPVHJtD9zLnGMizWiGJ7Ezann
	 TlZrULzHfvp9elmVYL62Z9hfH8ZEQNJECDP1Ta2OsO/MQ5uS7LnejjwT47G5FUR7+xyII
	 6teqm4ONxeqyYgMnD9ug6Bcu/Wy9L2krkVwsdjdNf7MbU6QnEgmtP6NegDNt3AKMPcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B75606D81B
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 20:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44B75606D81B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-70b875f6f1fso1600187eaf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 12:10:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082210; x=1794687010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0BAmvwUewoGLOJLuXxq6dZ5RycZKZl8yqwoNBMJWREA=;
        b=PKviu29Sldkcgqz1BnBJxUqemi4e1k6xKKusVemeAHowEogDrquRNBo62AikOlYy9p
         trAEBGV6ByqRYTE5Us076V5ukyAdYnGaOcqMsw1/7QoXBVDIJp87XhhLXDHb7BQwWUzg
         nLlkgluozNgnMp/S37zRQ9uAHr14vcJFxoUZRP8/QdxnINvTX8DI1ec6GI9eK4mUf/qy
         1nWgeihqUSzMmh+Bg+zLGBdKfaYIz2Ihh42jD+SHPLkvDdmECJ241rr78RLPCpgakxv2
         IxQgpeY4LBvyDkf2l1d091q51Bd6EXHxDi9OFOQVWLPI7vP4R9OkOPuyyeVW/YGP3SIr
         xiwA==
X-Forwarded-Encrypted: i=1; AKwUvBzQAccxtyFYibZVfMOPgrobxY5ZoVLByFIVBm789iMH/0vUViOXl2fxQvBLrpE7xQ87Q5MqhLiV6VXY8PVs@vger.kernel.org
X-Gm-Message-State: APuU4Z8ObZrMv73ITC2qfcX5frI4lf7zv/P9RmBFP2BMjfiE/PSLtgaV
	z5NXewpbXeocWQppX3w0ReEjz99MuVsQeobNEFB8KHB5qrhm7YTR2gu11CAuq5jznaE=
X-Gm-Gg: AYBFou0VGb1W0who3IKUNP9LSej0lpkVa1nIKlcFZ7Xvhg0GAWZhEgDHKR4Ig4o87F1
	xA660qH0CLntrMKa83hZVeIInUrHm9YORXKqdGVOPRL0+qj5lzU7KhC48PeRaSfXlrwScVMrHJc
	I1beB1Nq4zPfjOlnim7LM2QFYSWBLRXptvz+xVBxwUjf7ALQ719dSe6/y6aJkSBAUTbKi+a9D33
	yMAyqiwhQ95CJLFfw+SWQE3l1cTVJoczcfJwa7OYWBhvRmhAoS6g46T6GzqbDbMJZ/gHnoO1s3t
	XN1MZooF5JUXRsgV/FcF7q+7wi/lRlqM1do6lQg9vZKY9dRNkIc8+/gfHjrwWSbFMyYXA8ycaal
	fVh3mpDIGyyZMX7BVgUnRbmsDHcEYp9txXBj/6K5D929b3PgaUKVbu7A+VRA4FGXS8eVdlVLmiY
	as/D1X45u8IDzw9YWdieW1eoBWjlX7QHyOnkteNFQ62uFgfGPB4eJ9tKQpRC3bi9qVvegranVz2
	ZQFVnl0MALCLbe9wLzY6sh7SOIjGy0UKjEGyuobNBdUTsQyHIOwfy6kwRLDA0oM6TDxGEJ17B3r
	TCrMB22aNa5+rBIBXKJz8dTRjMp2TTnXxEkCSe/HFM0GamPiW+x0kSBkPv0=
X-Received: by 2002:a05:6820:7054:b0:6de:25a7:3be4 with SMTP id 006d021491bc7-7170f349085mr6610eaf.75.1794082210155;
        Sat, 07 Nov 2026 12:10:10 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade6a26d74sm212708fac.15.2026.11.07.12.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:10:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 19:33:38 +0000
Subject: [PATCH 25/58] mtd: rawnand: hisi504: retain open-handle state on removal
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
Message-ID: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-25-4311be01fa4f@gmail.com>
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

Retain the host through its embedded legacy controller.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/hisi504_nand.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/hisi504_nand.c b/drivers/mtd/nand/raw/hisi504_nand.c
index d97270ec1185..36427a242c2b 100644
--- a/drivers/mtd/nand/raw/hisi504_nand.c
+++ b/drivers/mtd/nand/raw/hisi504_nand.c
@@ -731,6 +731,11 @@ static const struct nand_controller_ops hisi_nfc_controller_ops = {
 	.attach_chip = hisi_nfc_attach_chip,
 };
 
+static void hisi_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct hinfc_host, chip.legacy.dummy_controller));
+}
+
 static int hisi_nfc_probe(struct platform_device *pdev)
 {
 	int ret = 0, irq, max_chips = HINFC504_MAX_CHIP;
@@ -740,9 +745,14 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	struct mtd_info   *mtd;
 	struct device_node *np = dev->of_node;
 
-	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	chip = &host->chip;
+	chip->controller = &chip->legacy.dummy_controller;
+	ret = devm_nand_controller_init(dev, chip->controller, hisi_nfc_release);
+	if (ret)
+		return ret;
 	host->dev = dev;
 
 	platform_set_drvdata(pdev, host);
@@ -788,10 +798,16 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = nand_set_release(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		return ret;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "Err MTD partition=%d\n", ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
@@ -806,7 +822,8 @@ static void hisi_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_PM_SLEEP

-- 
2.53.0

