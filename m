Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793346345;
	b=sIF2ChSIWIHduLhCuyNpeJ93AaFyntYWU0TkGRKRLRYgfm5dFAVtA6rKz1HkwE1z6kR8
	 Sk1DOwNCGn+WsbzYyH6PCR9lQujq/01wILl1F9xFivYRttoWHK3Ybvvtcfqw6g7IRu7NJ
	 JMr4iPExjD/ddXV9dcGa+tXxaVbvh388G7jcdM96wpQrlWbTlBxE/HmN8YEoCBVoUCcxJ
	 m8JdfHCiXA1bygz/cyoAFWOHStuU2ZgFaJ4CuiDi9V/b9jMymNeUfdRDqVnIHp5MiSAKn
	 UlZyHXY5RTR5NyCCEbuapPua8LBISEWQMf41pusEiejr+w4dsNZ/XR/1pUzLKuhGXMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793346345;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=MGbJXiJFi31yIeTwiAlfmLLlnxlqKdJgzbKeOHsVxXA=;
	b=r32jYQ8kpRw9YUjlLyq2pZBBZQ/e0pqYzVIYy/yS2GGddrGCq7cBBLBfpwjtfGiR/vmu
	 WmfiNIy972MHfiiy2dg+CwvQjXTNG09jjC3dfwINRut77W6PZN1XWV8Z2KV3xF/yt1WTN
	 mxMPjwHdSN296c/oFfksXy3mj2wSZSLw4TJsse2yjZzXAkJKkayPtEZfOZ4NFlUvDitya
	 EJ6e52TM1cjjEp6MyW9yGmv4cP5J83MwgVYYv+hi0arUmIcRfBlNo4th/vMg7XdlU4fDP
	 kxDRynKBDTaR9VZxx4lJFshMokV11PZOJRErsQLcc3xFl+8pDBcQXeDwzwwQOHJKsZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=vAymN4aF;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539E2606A31A
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 07:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 539E2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=vAymN4aF
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261030074535euoutp01fcb828b5e2dac66d7f539c5a354adc49~jPv16ZATz2698926989euoutp01Q
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 07:45:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261030074535euoutp01fcb828b5e2dac66d7f539c5a354adc49~jPv16ZATz2698926989euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793346335;
	bh=MGbJXiJFi31yIeTwiAlfmLLlnxlqKdJgzbKeOHsVxXA=;
	h=From:To:Cc:Subject:Date:References:From;
	b=vAymN4aFGzNvAaFiV9K/kAJeIecunRmnvMio0iBO0taTwcppQM4cq1rOkr5wwBija
	 uZdmeIrUy0LGrZjbwvrzDjLpt42lgRt119H4pKWl7W64YQKQQJuwv43eXwGj5PP78E
	 6Ne46PVFUKJlj22vrIO/WXF7SlHYx49NONu+531U=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261030074534eucas1p152cccb0576c7a59dc713845077353904~jPv1h4bJu0876108761eucas1p14;
	Fri, 30 Oct 2026 07:45:34 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261030074533eusmtip1e981b5adbd76f64066708854250e130a~jPv0rz1Ek0978809788eusmtip1V;
	Fri, 30 Oct 2026 07:45:33 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	linux-arm-msm@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda
	<andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
	Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
	Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>, Bjorn
	Andersson <andersson@kernel.org>, Hongyang Zhao
	<hongyang.zhao@thundersoft.com>
Subject: [PATCH] drm/bridge: lt9611: Don't override ADDR strap when strapped
 low
Date: Fri, 30 Oct 2026 08:45:17 +0100
Message-ID: <20261030074518.516993-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261030074534eucas1p152cccb0576c7a59dc713845077353904
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261030074534eucas1p152cccb0576c7a59dc713845077353904
X-EPHeader: CA
X-CMS-RootMailID: 20261030074534eucas1p152cccb0576c7a59dc713845077353904
References: <CGME20261030074534eucas1p152cccb0576c7a59dc713845077353904@eucas1p1.samsung.com>

lt9611_sleep_setup() writes 0x8023 = 0x01, which overrides the ADDR
strap and moves the chip to I2C address 0x3b, and then configures the
ADDR pin as an output (0x8157/0x8149). On boards where the pin is
strapped low (address 0x39, e.g. Thundercomm RUBIK Pi 3) the chip
becomes unreachable as soon as the bridge is disabled: all further
register accesses NACK and on resume the bridge fails with "power on
failed", leaving HDMI dead until reboot.

Skip the address override and ADDR pin setup when the device sits at
the low-strap address.

While touching this driver, also fix the misleading error messages in
atomic disable path.

Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
The issue was analyzed and the patch was prepared with LLM assistance.
The fix was tested on the real Thundercomm RubikPi3 board - the HDMI
display now comes back after system suspend/resume cycle.

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 2d1a28261037..9e4f45d9f6d3 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -35,6 +35,9 @@
 
 #define LT9611_4LANES	0
 
+/* I2C address with the ADDR pin strapped low */
+#define LT9611_ADDR_LOW	0x39
+
 struct lt9611 {
 	struct device *dev;
 	struct drm_bridge bridge;
@@ -440,10 +443,13 @@ static void lt9611_sleep_setup(struct lt9611 *lt9611)
 {
 	const struct reg_sequence sleep_setup[] = {
 		{ 0x8024, 0x76 },
+	};
+	const struct reg_sequence addr_pin_setup[] = {
 		{ 0x8023, 0x01 },
 		{ 0x8157, 0x03 }, /* set addr pin as output */
 		{ 0x8149, 0x0b },
-
+	};
+	const struct reg_sequence power_down[] = {
 		{ 0x8102, 0x48 }, /* MIPI Rx power down */
 		{ 0x8123, 0x80 },
 		{ 0x8130, 0x00 },
@@ -452,6 +458,18 @@ static void lt9611_sleep_setup(struct lt9611 *lt9611)
 
 	regmap_multi_reg_write(lt9611->regmap,
 			       sleep_setup, ARRAY_SIZE(sleep_setup));
+
+	/*
+	 * The ADDR pin selects the I2C address and addr_pin_setup overrides
+	 * it to high (0x8023 bit 0), which moves a chip strapped low over
+	 * to 0x3b and makes it unreachable. Skip it in that case.
+	 */
+	if (lt9611->client->addr != LT9611_ADDR_LOW)
+		regmap_multi_reg_write(lt9611->regmap, addr_pin_setup,
+				       ARRAY_SIZE(addr_pin_setup));
+
+	regmap_multi_reg_write(lt9611->regmap,
+			       power_down, ARRAY_SIZE(power_down));
 	lt9611->sleep = true;
 }
 
@@ -712,12 +730,12 @@ static void lt9611_bridge_atomic_disable(struct drm_bridge *bridge,
 	/* Disable HDMI output */
 	ret = regmap_write(lt9611->regmap, 0x8130, 0x6a);
 	if (ret) {
-		dev_err(lt9611->dev, "video on failed\n");
+		dev_err(lt9611->dev, "video off failed\n");
 		return;
 	}
 
 	if (lt9611_power_off(lt9611)) {
-		dev_err(lt9611->dev, "power on failed\n");
+		dev_err(lt9611->dev, "power off failed\n");
 		return;
 	}
 }
-- 
2.43.0

