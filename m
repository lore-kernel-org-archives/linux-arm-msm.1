Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046648;
	b=XAvvbickkwb1SiTsi7oRqJbjrriOsLAw9+iwQVmvS7bNV8pDBj0g2E5jQAQUtGPTkNsh
	 sclVHCxqpzBVSkS2jbOyX9ZpciJl0PLM8EonFCvieq2c5K+Nh6D7/1/8ZrnT5tNyKLzf0
	 o649la/J3LEhBNfCWvoZ/NScNXchGB8W3Nxh9v0FG2MNKVVaVN9AuwwHzO2EHgaUdGcoi
	 82CZjJ4ePhQix4aNTOn/kVF5LwPrgP5aU6EIwDnm+/xhxex2orWJGyN3g2ESROrYpOpon
	 KLEThbXHzDpebi9FAbBJ4X/yUyo97W4GUPdfJlrMx8RfmlPVTvRUD8ObBqEzG1gSNyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=FiM3FdgX/n0U5FfSnJDnohTAFRzhZZoozip4F2zbWJU=;
	b=Xf4BuacbwIN9fbTF4jpXCKewYDxdlxXU1Vk3VhyYikR2p1j8OSG6MArEXqAwAZXZVgo7
	 URNJ6yNSL0Whazp+MpN3qAgucNhZLFVac7IA4PTz1uzfvs3R/0D0HOjUA4ZS5ReMVFyNS
	 c7dGqJMc1RKXUEXgZ1aZkWoHpgKN5OpBi/3OiJfJClK0r9NM8g2yYaDDRYpwGhdPZ2B1L
	 LZVHFwof7d7u6V8VPqMc/d2X3dbv8khPgp9Qctk0s7szGKrWsm38/gzs9PGNI26GY28Gb
	 YUJuPWLRDJ7JId4KyP8x3JmR1VErOV9jbjo7lMfNleP17uOeGLG7lTePLD6hE2TbuZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zQSJNtam;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8981F606EEA6
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 10:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8981F606EEA6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zQSJNtam
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-8253bc5a613so872402a34.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 02:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046647; x=1794651447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FiM3FdgX/n0U5FfSnJDnohTAFRzhZZoozip4F2zbWJU=;
        b=zQSJNtamhK5SrvhCY6qJK7P2GezzcQ77DYD3sYjRLULvrn1hy8viO3/ptg4ahw+t+T
         gY1SnDZ/2WzQuZXBrp3PVyhaII0cm0UAlYH+eBsPIBTvDG6L1OVKkhg5Pm9jIb64ySGc
         xu98+BrvSRilZ8CztSrSAWXFFaUjRxRqV+EW3bNUbjJ4KLOXBQ4PPVQip4OBQGKbMLcE
         3+lBZD52VHWHZSRJS5mLRKEUEjHO8gKLRUT3Z57ftGTAlfnYbB9+UKvkuebdIHaBfT1D
         UPr0uCtIlKt4/eaYmPO/8uG/eH1/GH2IOqfax9dre5G/486CMtclECzKfyO0G7dg2MgW
         V/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046647; x=1794651447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FiM3FdgX/n0U5FfSnJDnohTAFRzhZZoozip4F2zbWJU=;
        b=JSlv78iUJnJlLfzRmx6Qon5qtYz6m/NxptndyR8bF5AL2ZEgBVMPlW6rrJQeoV8VAp
         s/7C2UwB5+FchYBGvIzMygcnGqfWD60poOPlBo4iutzSk4UXrbk5kwyMfKmOrYP/uv76
         FZWgl9ZMPDWUJ3QJJXf1987tJjNYhl0QH+JXULtZGTTwp329x/Zc8nTfzodDnVFu6C+1
         ZR1lopruGqz4yDk5PJdlkYuAQO8JDfNx7obc/yF+IX1Nm2azAHPC0cJHpWlGR9HKrnXe
         wQnGdaFY24veE3vsDw/6YqWlWWMo/ZncLoQ1BmdZFiji9NPru5a0yQP0qF2YB1LZK9cX
         dDeA==
X-Forwarded-Encrypted: i=1; AKwUvBxLcvKWUosltFyvYdFU3En+BGgbYyUVvRvB9ui5Gb5nEiK0Dr50h5DyorRkcfUpiBfPU7jko4JGkcOFfvqu@vger.kernel.org
X-Gm-Message-State: APuU4Z+86sJ1vy2zA6G1l78QrLvk2eNVFcCu3U8XmfEinpXWW/uMNUww
	YcUOlOhaJHoOf3DF8r8fgW1cQiDhxKifpAciJSdroMexjLIH8jfoHOqV
X-Gm-Gg: AYBFou0DHDKaBUT5jG1VOsAsusdlbJAOVTahKF9IHvHCIigWeyGBn1eqjiBH/9sC8La
	qVuCe1Km90IHE34xkq6a38Pt4l0JJgxciLG7fn5t7W65DIDWkEsaQTeYKCtNoW65Q5+eMLBZUtU
	cgERyUvz1u2t/KuLnG/8L38S7hr20bh/C/hXKeKhkxbkEz98h0XYtt33LR4Bwy93Jg+Lx7jih+k
	45lGV5Jhx8HTk58ks4tHvicfQm0dcVfkWyVVVBCtfzrXk3pLkNCBJewiv+fr1SgCZG8lUuJOwEG
	l3zLVA7WiXxRj8TXRfaXQUJzaVPG+Xojl5HJ5k5ChpJ2cIFhMoPBiTcb38532kXxG636BAmbFPg
	OKiE2G8rSw8e7MMsKBFxSRDA/VREboYNkrkJrGbVY05yeDUBEiSbdKkaa9hJarsDx6qR9jP46Ia
	8J/RMgrsy6gBR8EVFnSP0o2+J0uyH+XDp98/8zYkJm3qVAvWiawcuG0SzzjXupwix0Eyuo79oI8
	tOwn6GL78R5hSf6gP8fb22ZlJHvHXMfj+6cozXjcyf5mNwxxthTsMEndgBzTmwsYdbzbPErDvzQ
	F/5ZBW45EH1tREwQO75tlhIBUWzmx1xC6iNGgzaLSHWORqIAES08Q9VnEgy1hqK7f31/H0zPr3F
	mKSB+BO8QMw0XlgtmRE+2P9GRRyIWNBulV7KuGtQIl+qeU9SxJPhQv81CgzdTPj3ORP73mWYLYo
	9ANId1Mibngm0vI9lovQiFyLcSTYq4x2475dwctGoSY5EX8c2VxtMA
X-Received: by 2002:a05:6830:4c0e:b0:846:7d51:d9d7 with SMTP id 46e09a7af769-85f1d18bb98mr4287417a34.28.1794046647554;
        Sat, 07 Nov 2026 02:17:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:19 -0700
Subject: [PATCH 22/58] mtd: rawnand: pasemi: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-22-0181ef0cc4c8@gmail.com>
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

Release the LPC region and NAND mapping after disconnection.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/pasemi_nand.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/pasemi_nand.c b/drivers/mtd/nand/raw/pasemi_nand.c
index 09409b703d93..d00d57cbb0f1 100644
--- a/drivers/mtd/nand/raw/pasemi_nand.c
+++ b/drivers/mtd/nand/raw/pasemi_nand.c
@@ -93,6 +93,11 @@ static const struct nand_controller_ops pasemi_ops = {
 	.attach_chip = pasemi_attach_chip,
 };
 
+static void pasemi_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct pasemi_ddata, controller));
+}
+
 static int pasemi_nand_probe(struct platform_device *ofdev)
 {
 	struct device *dev = &ofdev->dev;
@@ -122,8 +127,10 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	chip = &ddata->chip;
 	controller = &ddata->controller;
 
+	err = devm_nand_controller_init(dev, controller, pasemi_nand_release);
+	if (err)
+		return err;
 	controller->ops = &pasemi_ops;
-	nand_controller_init(controller);
 	chip->controller = controller;
 
 	pasemi_nand_mtd = nand_to_mtd(chip);
@@ -136,7 +143,7 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 
 	if (!chip->legacy.IO_ADDR_R) {
 		err = -EIO;
-		goto out_mtd;
+		goto out;
 	}
 
 	pdev = pci_get_device(PCI_VENDOR_ID_PASEMI, 0xa008, NULL);
@@ -174,10 +181,15 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	if (err)
 		goto out_lpc;
 
+	err = nand_set_release(chip, NULL);
+	if (err)
+		goto out_cleanup_nand;
 	if (mtd_device_register(pasemi_nand_mtd, NULL, 0)) {
 		dev_err(dev, "Unable to register MTD device\n");
 		err = -ENODEV;
-		goto out_cleanup_nand;
+		nand_disconnect(chip);
+		mtd_put_master(pasemi_nand_mtd);
+		goto out_lpc;
 	}
 
 	dev_info(dev, "PA Semi NAND flash at %pR, control at I/O %x\n", &res,
@@ -191,8 +203,6 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	release_region(ddata->lpcctl, 4);
  out_ior:
 	iounmap(chip->legacy.IO_ADDR_R);
- out_mtd:
-	kfree(ddata);
  out:
 	return err;
 }
@@ -210,14 +220,13 @@ static void pasemi_nand_remove(struct platform_device *ofdev)
 	/* Release resources, unregister device */
 	ret = mtd_device_unregister(pasemi_nand_mtd);
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	release_region(ddata->lpcctl, 4);
 
 	iounmap(chip->legacy.IO_ADDR_R);
 
-	/* Free the MTD device structure */
-	kfree(ddata);
+	mtd_put_master(pasemi_nand_mtd);
 }
 
 static const struct of_device_id pasemi_nand_match[] =

-- 
2.53.0

