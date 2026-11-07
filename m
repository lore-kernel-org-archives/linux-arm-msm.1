Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082418;
	b=ALUadKUlZY1g2zmayJw0VzJuR6f/9ja4FwAbo/GDf0FVV6bun8tFlxW0l7jr7uCbNLv6
	 Y4x3sWyiFsDRpGuPFLuTp+/U4lYAWAUaLSaFUU4KQfpsKYU/Z3U6Rp0ps53T1CWa66kFF
	 0Il+KrDHpi1MEnl0WIoDn6Wwe+VH4t4GAtpEm60C0hrzEaoEGs8GTH2FxidxvyzSCqmQT
	 BJhIYjLzHw4+EM0rau62ezVK+CTEybN5gMJ6D3MaOYguSDONlXfTtnZnOLMpUa1srQAoy
	 BajTBlG/Vz4kpDYcAGk+JxA3H0TLHd9om5GNRRKnvD3rCvzlzdOY6Z+djW4IrV76I+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082418;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=JrxepS2J9VPceqdGkgV52/qe1YoRSs0JHMfO/RKE6Vo=;
	b=IqRJND093s0fQ52VwP3MC6yOeMxFWB9LWyjY4MufYNCO1FsA891X9P5e07fNmBcN5hgR
	 aGHq6YDepwvSVqLYnEckWSKCPzCRkD/lTJLPGo9y8fBtTSMoxp0Xr9SnT8rmTfHPNm1v3
	 EZ8czYjBV/2ny4bvEROZ2FhQuCqncHlfZuw/48GZnj0T9b8Uz0vy24t7WKULqXrrZW4BA
	 A2zcaTa3t/nqsVHIh2ylDOGerccKgT6dSPCODXr9V33W7gTsUHZE5phlYcq64s93nJKS6
	 8AAkuyn6qAs26jY7Y+qsb314R2c9+fvpYjJFGpe+QQ0wthY4Nny2ZoVdDI4/eXZDUdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9120A606D81E
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 20:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9120A606D81E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-716ea2598eeso980477eaf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 12:13:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082416; x=1794687216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JrxepS2J9VPceqdGkgV52/qe1YoRSs0JHMfO/RKE6Vo=;
        b=QrU1ySUf9x26TphdIybqwFy7hcJ1WODqdat3dtgm9beMWhpg3QRAZox4TBOMQzvvTd
         kwuGJuhlixZd7rPh6r1sdXOiYYROHwvVCmV0rpb11lWxPMlxZaBzJcpM8j/Vxi7gR4GR
         8wZVjXvxytJOdAX3um5g7WmPGYwuun+3X3FvED5tCV80auJt4xN9i/OsC+7k1ZEvhxYU
         NsZkttl3Jvz0Tezzcp5VuuDj0RqJ/NpNGe/buCq7vJBTxezmFzZvjnR/m3DrgL/Ry41r
         7q6aeYvNtxq6h+63mPwG6MidEj8Hv/f9GR4pZNAueQByy+Jnxxi90AjwEJCPi8xHmVYi
         JnpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZh6cLQ902hLe/lTPGsqs3tI9bqrZtF6efkwe7SohS/+JnA7etNE9gQxNCyHfdrVQsBu7vrpQQzmM0YJQ8@vger.kernel.org
X-Gm-Message-State: APuU4Z9dfGOMMVObKTdhllplmhG4CJW5ClcHrWu9ipfa5jZjnX3W6cTb
	+NPTVlK9mqe6vuz4Qd9lwp2fGir73UsNNFDO80Wi3/l2kpZTWYve1YejSj0M8G4EgIE=
X-Gm-Gg: AYBFou0HYlHMmhf/wdC/TbWyzmj0+ahtIhj3B6LvBUgiDsyitsXMFmBKtm4yx61T51Z
	BnxAuYpvG7gegmDmC66CnybyCF2nqIbiSvHHC5X0lLCkhSsHFV/PF7DI+q3MOkRN2RFRtYCTrsV
	b4eIwdjuHkKMHzUMVR6eJcUhP7mgPXj9GSrb6XG1IvDmLgDXhe8K4BlUyb2XPBdx8qnLa8LK9HW
	x9sn3dohAM0vBA3Jnj42HC1Yw0jgtu8FftGVKH1Jpse8Eh2YUCnKkc1Orjubx+kztfvPOUXJXpm
	g77tP7+GGO0aDuWGza5umr66GsTH+FF1F7upvE6PpXOAvGzSsUTSzJfpfcNtRxl87uD3sqdSC6A
	RCOk/FIGlDLfRbMDQ0FkhleQg0XPqd7bJij/bslGhKyt4biz9VoSG3+0Dw75JmNx8TG+PczYjMw
	hi36FKd6B/FeE47ADhGzUMitoAjLrolK+nt/UGgwXanINs+oJ+63yT4sI66MdneWlKR2yKilD+B
	W4ILmaHGh/hxS4rOaEL0hLHCY0sQH5HmKqL0DeQXGrPXcHSPmonmRjHGKtIGJL7pCQjZ/stbEPe
	3Fc2kV7njqXjUW8NdMVJ6PTzXlBGKQFAen17l6JTJ6N/mngz9AcyBjGTyE8q
X-Received: by 2002:a05:6820:60b:b0:6b7:46fa:1693 with SMTP id 006d021491bc7-7170f2e8271mr15281eaf.40.1794082416544;
        Sat, 07 Nov 2026 12:13:36 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:39 -0700
Subject: [PATCH 42/58] mtd: rawnand: au1550nd: retain chip state across
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-42-0181ef0cc4c8@gmail.com>
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

Drain NAND access before unmapping the chip-select window, and retain
the chip and controller until the final MTD reference is released. Check
MTD registration errors so unsuccessful publication releases the same
ownership.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/au1550nd.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/au1550nd.c b/drivers/mtd/nand/raw/au1550nd.c
index f1e99197ab84..bd78bcc84282 100644
--- a/drivers/mtd/nand/raw/au1550nd.c
+++ b/drivers/mtd/nand/raw/au1550nd.c
@@ -251,6 +251,11 @@ static const struct nand_controller_ops au1550nd_ops = {
 	.attach_chip = au1550nd_attach_chip,
 };
 
+static void au1550nd_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct au1550nd_ctx, controller));
+}
+
 static int au1550nd_probe(struct platform_device *pdev)
 {
 	struct au1550nd_platdata *pd;
@@ -269,6 +274,9 @@ static int au1550nd_probe(struct platform_device *pdev)
 	ctx = kzalloc_obj(*ctx);
 	if (!ctx)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &ctx->controller, au1550nd_release);
+	if (ret)
+		return ret;
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!r) {
@@ -302,7 +310,6 @@ static int au1550nd_probe(struct platform_device *pdev)
 	}
 	ctx->cs = cs;
 
-	nand_controller_init(&ctx->controller);
 	ctx->controller.ops = &au1550nd_ops;
 	this->controller = &ctx->controller;
 
@@ -322,7 +329,17 @@ static int au1550nd_probe(struct platform_device *pdev)
 		goto out3;
 	}
 
-	mtd_device_register(mtd, pd->parts, pd->num_parts);
+	ret = nand_set_release(this, NULL);
+	if (ret) {
+		nand_cleanup(this);
+		goto out3;
+	}
+	ret = mtd_device_register(mtd, pd->parts, pd->num_parts);
+	if (ret) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		goto out3;
+	}
 
 	platform_set_drvdata(pdev, ctx);
 
@@ -333,7 +350,6 @@ static int au1550nd_probe(struct platform_device *pdev)
 out2:
 	release_mem_region(r->start, resource_size(r));
 out1:
-	kfree(ctx);
 	return ret;
 }
 
@@ -346,10 +362,10 @@ static void au1550nd_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	iounmap(ctx->base);
 	release_mem_region(r->start, 0x1000);
-	kfree(ctx);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver au1550nd_driver = {

-- 
2.53.0

