Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046643;
	b=BL5tEyulj2zqI02Q07KvlHcqgKpvVnkLFGLC5og5hb2dZ5JCLRfiq38k09P5xN9WUehT
	 u46+sSVdPZyup6f9ICxvW6dOBgrtGfq1SpCiIvP/9L/MrnSupzhn2y0dlXSc5thTQxK5x
	 imgkUbu7P7oRsJ3DRu/SsPXVUbSiUOkYB7yTEyPdbajLZfbMkUbP87vjyeRI0swtmEown
	 6K6YwLr5twnJHnW1Bx1FEJwmLIcJ1M+NBgAd1U2BC/UzxQFnTcbZVvWEJuLQqVJQUNkN1
	 ph+J7/VnJaEnFSQnsZU+M7s2acropSFXLU0JNXwxwK68guURW33JBTCV84ogU4/bdeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=98WfkaBe62oy8EQO4YfBFKlZx62rcetVL3VyED26UPM=;
	b=Xqt5yNwuxDd7APCkVuB4kjlLcvPax+NyUzdaAfMPlsl0fRqxpWHEB9gtcI9UQadhORgA
	 EJLglarsT6wJ5xS2rM6ir4HtUePwKtXeV2DzHjN6V4aVcsTKKev+NMq49fWdTU2EdT2ew
	 Mx+qpxn8zqSTouYIPsL7iuSl+pkR38IEYGHWb8Aj1KSQ54YlQqoi8f1T/xL7Jevlg7pP+
	 u47lDhqTFZZooCEBdrmS/Cfh7ra+mjNlgBPHvFFyHP1H09/Ovn8gD2O/cHHUa1nKsqXAo
	 DpH4zCpV7WnU9gNYsmTsnIKJpF96v38HKHKEb+JwU0tLT4i7cZtKqGOvekVLrOQYWaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QzurEor0;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F094160A6F55
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 10:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F094160A6F55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QzurEor0
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-843cf077f10so2138270a34.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 02:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046642; x=1794651442; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98WfkaBe62oy8EQO4YfBFKlZx62rcetVL3VyED26UPM=;
        b=QzurEor09KQWby5w9iBH8G1at6wJN3jzeiDNHvmVvEV3UperlyvGiohPUNtpTXuebf
         nUBlApWnEH9u190AGD7/nDlvhUJXlJ4D8sLxawMKMgEuUWtV0C6U9+mSXyoDNoAX3Uhu
         N33cRUYYbDvA2tqXLnJEKYC9qcL4YNyxNBkNyicSaNDvAvB1AnZZ04viZY9h3PQTWs3U
         B400yG7gwAiOF4uGjYhowh5PZ+gQ6/kzclM52SAS/nY9urcW8xmaCnFGm5ApffXBXiAp
         nEFrR7B4PiADuVbccHVQO3T3Gh2VYRIvDDGiGLGRZ2Zkm8GFyIT57e151A/ob4ZhV5uY
         /nuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046642; x=1794651442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=98WfkaBe62oy8EQO4YfBFKlZx62rcetVL3VyED26UPM=;
        b=UmM4Q2vy/rWEZssgqvGd9zQc3YCm5qsScbff2davS9TD4SYjwINOMOHDeBBLtYbt3w
         z1zyF0ncTzaUb3LIjJ0dcInusHabBV4/KW/964JCCul/c7g+3vGAjURWpCHOCUCFdBNt
         HReLwLVTCOzSK+m63RrLPtA69NFFs6kEBaj/BLiJR7bA0gwOLrMPTlAeHOkSAcKE23sC
         n1+ifEQEBtoTnYxDyCVAta1//mWVfxZ3/08tqYVvYUqoZ4bxIwQR/SLHmw4Ivgp0uBuX
         C2teGkK/tFLj4F1nnMz5ZciHBdgX2aoSvq8ikfWMKJ8DTXR+ZdMsGdJw2p0f79DdDzH8
         pS5A==
X-Forwarded-Encrypted: i=1; AKwUvBzFEvygEsBnYDaYPNuYksqw1MgOnwjqV3OOvw9kUd/MLk8HQGKqEXgHMMK8llK+JEx0IHARF+uoOkQZAg5e@vger.kernel.org
X-Gm-Message-State: APuU4Z9nls/SK+eKwPnsx6l0oMf+8uPMKnWVVeAC0TUguV0vnzmktuWR
	00TT+7pjCUiUfa0A7uLLBEli3u3RXnyyV2GhyavC2c4L9Y/GM+9mXQPr
X-Gm-Gg: AYBFou384FkmXzp7prI+gW3JJk3pEA7E2+ZJ3FOBDmWVDgRV4bWbEZYkg4dN38gRF6Q
	VoMcvVvJ+KdpqdCq/YfwVT4kpT2m15o235e0EaBtD98t+Kzp97OcD/jrl9JpL/vxHG/8QNjRqOR
	78ufzcm+w597M0CIX6b0tdFcl7bxWGFF5BBLZB6KtwkReMOL0DzWPTsRY1sUSpuIUIsgY7zHzx4
	YyXcbumRqtX+g8uLCTFfGqNmcrngemQZFv1JWU1tnuwuMqzeFCx/GG3np2Y3v+mpzRkbCkY9HTa
	ZaQ3Lb8CF7EjlbLoo95bYrnAKE8UQdFuamU37sMicwpH0C9J0sg+L3j5gGCz6O0LNEyoL2ubW9C
	2MTCwoPghEFebGyUgDG9Mw5UTY4jLaDf/dN9utnI/LXRBFo6G7PocDrMeMWGio2szcr0fj5jrU1
	MPH1WU+rZkV/5foYfJIvXMNuLKgHEmbZbcHMsKCN6doxQs+gjbCfIvykrgi9Wq9Bw4OEmIzbAJs
	ee33lFpj/Tc1Hz+S7z7wFpUGRVFhOUzIqpwJt/AeMMm5vKc9TxrfTkDLGbeiLSJvun7HtVF0+v9
	bcxpyCidu0domvXeuimPVru1yH7uxnn2ZFG0i/UPPflIyQSlBViLpdxH74MCmA+QiWte2M3YIa7
	Ouunk/BvTCXQS2LbskUovVYKB/TkYrB8Qp++V80yYrrjuzH+o80cp5YPQyeC9mDtaOgm1a5/wdK
	E986iaGRtgUqm82u4GDbEOFYQJ7Rb2JKymlDTTlnnrefdJe5/5Cp3KjgSgyyIHqLaaza0JO8CgO
	A==
X-Received: by 2002:a05:6830:258f:b0:85f:33c2:c863 with SMTP id 46e09a7af769-85f33c2f865mr1221076a34.14.1794046641843;
        Sat, 07 Nov 2026 02:17:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:17 -0700
Subject: [PATCH 20/58] mtd: rawnand: socrates: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-20-0181ef0cc4c8@gmail.com>
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

Drain operations before unmapping the FPGA registers.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/socrates_nand.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/socrates_nand.c b/drivers/mtd/nand/raw/socrates_nand.c
index 668584683ce5..508e3afac4f2 100644
--- a/drivers/mtd/nand/raw/socrates_nand.c
+++ b/drivers/mtd/nand/raw/socrates_nand.c
@@ -134,6 +134,11 @@ static const struct nand_controller_ops socrates_ops = {
 /*
  * Probe for the NAND device.
  */
+static void socrates_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct socrates_nand_host, controller));
+}
+
 static int socrates_nand_probe(struct platform_device *ofdev)
 {
 	struct socrates_nand_host *host;
@@ -142,9 +147,12 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	int res;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&ofdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	res = devm_nand_controller_init(&ofdev->dev, &host->controller, socrates_nand_release);
+	if (res)
+		return res;
 
 	host->io_base = of_iomap(ofdev->dev.of_node, 0);
 	if (host->io_base == NULL) {
@@ -156,7 +164,6 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	mtd = nand_to_mtd(nand_chip);
 	host->dev = &ofdev->dev;
 
-	nand_controller_init(&host->controller);
 	host->controller.ops = &socrates_ops;
 	nand_chip->controller = &host->controller;
 
@@ -188,11 +195,17 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	if (res)
 		goto out;
 
+	res = nand_set_release(nand_chip, NULL);
+	if (res) {
+		nand_cleanup(nand_chip);
+		goto out;
+	}
 	res = mtd_device_register(mtd, NULL, 0);
 	if (!res)
 		return res;
 
-	nand_cleanup(nand_chip);
+	nand_disconnect(nand_chip);
+	mtd_put_master(mtd);
 
 out:
 	iounmap(host->io_base);
@@ -210,9 +223,10 @@ static void socrates_nand_remove(struct platform_device *ofdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	iounmap(host->io_base);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id socrates_nand_match[] =

-- 
2.53.0

