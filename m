Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046604;
	b=fzpiWL+LvA0sZ+Y43ZmvEXzECAm8IFJvOIXRAUmgsu7cPoZY9UEMrF1wXR1nmM7z4v/7
	 jwt8PifhbDe4eYLEcuphKqwxzzOGO4aUJ4NOLyp67RTxqawiMQRYjvkS/zoJk+/zzga7H
	 N49CYc8x56eabem1LUBOvj+kw8Ed8m2e18wzoyqrd0GHpIxhfiGqkDELdGpgGM/5Wjfc/
	 pO31SC4Q3Ab9xDYMeedlouS/RaATc0ajck9/xTsIsu2du3zGv3K7Sub3hqDV5g6jGQ003
	 40SLijGExMZzHUnhXgnfGpT6JjrBTwhrHjO47hLPClw06G97DdDdCguXEcMszVR2YSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=kdpl0vJugGlz+uyTjhhRSpimIDWsRp0py3ymgbcmz+M=;
	b=fUmtIOcZ0JO9JXNlUgNwQrOxpzNa3fDBTsvHLt0UING8aBkmT22nfxQjdPn7mfCi41kt
	 bY/xc/xfkNtqxm7X7xDbradShlGUxU5CZ1phQ1rNLcfnWTsdA9Ok2FD1ZdWAvO5eUOM/l
	 D1A8Gk5pDnnMiWLpyoUWWecJpGOXqZfl2VDgN5xaYecCgQ2+1HcfCaNF2YHcfTi/VB3Bq
	 rll+VhSNNoNX9Z5Bm6JmmoyTjn6hbC8lgsk1MqLACSGO2Rd0GJk8z9QIZChfHdl0AzT5Y
	 hC7RDupYvF0w5Lux6xFjBJE75D8pUCagul5QQmZtgFw9zcD9W2I25fC0XVA8mpdabkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aO8RG3WS;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67D3606D827
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 10:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A67D3606D827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aO8RG3WS
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-846566246e8so395252a34.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 02:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046602; x=1794651402; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kdpl0vJugGlz+uyTjhhRSpimIDWsRp0py3ymgbcmz+M=;
        b=aO8RG3WSN85Oc/jLNxr3u0TD40PcAUMRT8KkpkkubGBYTSXTT0yeXUGx4jASB/VQyc
         aujtwo5AGpXdEBDMcEa2qx0/jX4uxlw9yTB6vxEYirQkhV8GW+pdcyvgyEHo2j7NMAyL
         mRTcjmonqsTND9RWVpABL6yNh/dQ2SPbk2q6nE5EZAoHQcIqH0iHqlnPKR6sF00yxg0+
         T61M/KN1qz4wyi4WZv54n4pU1Vsi75SWWN+1oWe6LS9U9nfp751s92vg/xHEYRGxZz6I
         OrkjGSVbPACH8Uj3uWYKQPoTEyYhXWC+EYyFSxecqpaV3RqdljxPIHNIeZtTkWJR4+eW
         UWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046602; x=1794651402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kdpl0vJugGlz+uyTjhhRSpimIDWsRp0py3ymgbcmz+M=;
        b=ODCJMYE/AriKXI+vMecNYQWB7OM8kwDlsaJ1lgRsJlPGJ1r1guHN1PTT6HC6a/1piz
         dq5VJjUknSTddAFAO+LdJ1zcY5P4r2lfswXOnRo6jXxDEC8oKeZ+IRpWr3u8gshkxE+e
         ql7TmN6F9jhmCziKD+hmWPv7LxEvtxQU7DY6cDcuaG1yI7K0ZZXkRVQklPfHAxZMMvAO
         eVWwRGH8M1R4ItHam5ee7w/EymoxftdM/ujBS+Yfdq89IRWY0Ea31KmA4THb2OvJeubw
         tlsuur/LJ439q9416xW66bVjsYAwNuSG3/spVNT0O+S4MgplOwkcZ+gqHdEQt5hmhXxq
         9Zxg==
X-Forwarded-Encrypted: i=1; AKwUvBxqJSKBPUL3K0TMMuhhiMLfpwlujpY31UUVHQysUL5LcGpE6izYNZCS3dsCl058HiOzfsdO6WND7tuSp5Os@vger.kernel.org
X-Gm-Message-State: APuU4Z9AhRGCTq1PrDLg8f985rGohKBZA+uSDTh2DQDeq9j+CcuwAFsR
	JECycbjnAJB/2kRO9vw5tZ1nHE8woNR/Gc96mi2VA1rjz8m9947Nb0g1
X-Gm-Gg: AYBFou0viU3lDBkmObZf1k5GSyfY0k2bvNw3WhHj++64EUKgSDppkmeDqjuHrp3DzLM
	unIydHV2Ub/UejdvcDOdrb1kzWvnddYLUi1C9jsYg/uPH6L59vOEY6tCnIf0yAn0hF8jX6H5NKH
	h/nQFgtx+gyWs3YxFNLuVH6UMVuOJnIvcboaWG36raptLXMPlHt2bCJ6z+xqM4fKjvP4uhiTZFi
	bGqWTcxx49jwV9sz5POmnF7sld7PQDvzGBoeCLKKwyJ1MqJ23YV3baXMQe1df7TxcN3sF8mFHF0
	7JK16G094/f0c1uWn6KqTKlgAOB0icAmEatp2Auzkh5BTHfWowo8jVKtjvOHQ4OVGGNq0FcMtQI
	0juxo7hAoHfJMK/uQ3I2INVCDwfS7OgpqF835tYSuUuCkk/dS5/mMmkUQ2ZPa3MyqbjdQqVSLXc
	YOR8+PwBMDMQFu/EUJ96+GhTI/PLDT37VhL620cOVx0QVHzJLAUXcPJB0yr5dVPKiUw/IDRIkmp
	n1Ef1JGWF5ZugPn8igZ15Y9+YbT1oHN2nc9svSP6H0u8a4cOwiVVSoag59JYtKlNKy3N5gvxuRH
	Bx9+u5mXOmIcKnPVQvHEi5PiAa/uDEMQAhGcFPMwd7AH1dH1VphTEjMhs5dLoidTWCqqTlDXQhm
	QLDFA7X0mQpXMKucaASDsCSdCDMS1fN5RN43Gh6A2SSsszXMQs/hSC47dSbVYycVt+Ne/4O8O3p
	J29OJJRtMGgbLfbpLrRis704FkdleOocQaYM4OZUsnAlumrdt7qdn8u8qCSRoHG8x4O0b+dPEc/
	Q==
X-Received: by 2002:a05:6830:314f:b0:823:e626:277e with SMTP id 46e09a7af769-85f3419d333mr1085835a34.4.1794046602585;
        Sat, 07 Nov 2026 02:16:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:03 -0700
Subject: [PATCH 06/58] mtd: rawnand: macronix: serialize OTP access with
 NAND operations
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-6-0181ef0cc4c8@gmail.com>
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

The Macronix OTP callbacks select a target and issue feature and page
commands without taking the chip or controller locks. A retained OTP
handle can therefore issue commands after controller disconnection, and
normal NAND I/O can also interfere with the temporary OTP mode.

Take the common NAND operation locks around the entire OTP transaction,
including restoring normal mode. This also rejects operations on a
disconnected chip and waits for suspended chips using the normal NAND
rules.

Fixes: e87161321a40 ("mtd: rawnand: macronix: OTP access for MX30LFxG18AC")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/internals.h     | 2 ++
 drivers/mtd/nand/raw/nand_base.c     | 4 ++--
 drivers/mtd/nand/raw/nand_macronix.c | 4 ++++
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index b8b29341b88c..dcd9536da449 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -81,6 +81,8 @@ extern const struct nand_manufacturer_ops toshiba_nand_manuf_ops;
 extern const struct mtd_pairing_scheme dist3_pairing_scheme;
 
 /* Core functions */
+int nand_get_device(struct nand_chip *chip);
+void nand_release_device(struct nand_chip *chip);
 const struct nand_manufacturer_desc *nand_get_manufacturer_desc(u8 id);
 int nand_bbm_get_next_page(struct nand_chip *chip, int page);
 int nand_markbad_bbm(struct nand_chip *chip, loff_t ofs);
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 8f7d2571e8d9..2667faf02a91 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -207,7 +207,7 @@ EXPORT_SYMBOL_GPL(nand_deselect_target);
  *
  * Release chip lock and wake up anyone waiting on the device.
  */
-static void nand_release_device(struct nand_chip *chip)
+void nand_release_device(struct nand_chip *chip)
 {
 	/* Release the controller and the chip */
 	mutex_unlock(&chip->controller->lock);
@@ -336,7 +336,7 @@ static int nand_isbad_bbm(struct nand_chip *chip, loff_t ofs)
  *
  * Lock the device and its controller for exclusive access
  */
-static int nand_get_device(struct nand_chip *chip)
+int nand_get_device(struct nand_chip *chip)
 {
 	/* Wait until the device is resumed. */
 	while (1) {
diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index 03237310852c..1ffe2fc4943e 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -380,6 +380,9 @@ static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
 	int ret;
 
 	nand = mtd_to_nand(mtd);
+	ret = nand_get_device(nand);
+	if (ret)
+		return ret;
 	nand_select_target(nand, 0);
 
 	ret = macronix_30lfxg18ac_otp_enable(nand);
@@ -426,6 +429,7 @@ static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
 			write ? "write" : "read");
 
 	nand_deselect_target(nand);
+	nand_release_device(nand);
 
 	return ret;
 }

-- 
2.53.0

