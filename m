Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC9D49F115
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 16:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791302614; cv=none; b=CbeaHSOM60jOcogJEGWtN18wd+e3tBsOUcHX7P26AbFEdrh9zIpThOHyvo6D27v4seAmHhopVpTJq8XzegYj8d88p9cyhgqDGDJ2Y4p+KoR2eLeSgHCc3NOGLprrYpbtJDX2rkJ03xX+tewezUjeiR5+iR4Plim012WFHNCuwIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791302614; c=relaxed/simple;
	bh=Rau+LzNHWZYAeVn0Lo/gXa5gPyDBw6O3gvc5Y7wY6Gw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PU1Gp+ho/AQ59fP5E89xS4jB8TdJWstcE2l+6gVPrXXWNxQDsGcfyXwggmWxklLzVHDYUbXIsMv6bX0AIAudrs9PTkve1k1iljAgz7iR+3leSNijyO1vxpAvdnaiMFjmMiUp7gPS91kckncTZ9pzcltc9Mvh5T+QTd29tLwjnKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qwJ63+pY; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qwJ63+pY"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2e8e738ae0so115567766b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 09:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791302610; x=1791907410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fI0Qv4IQdM0dKZJYz3zc0bdk7ApqZmNSv8l+M7VdwMQ=;
        b=qwJ63+pYJx5X86dv0BSRyx17BWUMCmybv4dYhCwG5dln7M1QhRGhJmf6wOQZSEAM2m
         0TdxhHT6c2Z4XzWiGS90L0ZJaUYI6llIZCeMhZwmyLYOMZIG0RQ24eA2Xy5aESSlbmiT
         Iujm0uvV6/9X27LswlyEriKT4Zag9bEY9Yu5Tt6V8M47OMQhz7uBcT5sz9EfLZHKQ4uj
         PRoMzCoxI0Qtpih+gJOYTx0i+RwWVqNQXtr3lCgVRRka+wPB3z/y3PwLOJLcC37OpCVg
         hm82N7Ymp9QxGQyFkM5mAO/nipunaCAwxmdZz9hI5R57gEqed+s9XT1pbglaNTVt/brp
         +jCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791302610; x=1791907410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fI0Qv4IQdM0dKZJYz3zc0bdk7ApqZmNSv8l+M7VdwMQ=;
        b=ukMOl7kIofpquwep+Fp/4yARXrp6LGvzZOUwMwA/4dAnZylXalFVHlh10xH45Pg2zk
         hF2JQOHxAK58a2HaUK1C9lC9VJSErJeJUkXyiSQU34loJQrqYVbRGGAdN+WYA5PKCStz
         wC09zUOhR8jmND4FRLV0fzBb3OLLu9eMk7l0erMHlZQi0i3D6C6BFFuHmQ06+Aarhsq2
         cb9kCe1Eb4kXYMeO/aCRnRTGowDP8RAH2CBiFIO2aYVMNwrK/3eEiKno9EUBJIyj41UE
         uQPHZEi/KRfKH0HdLXMIcHfvfwk/bSCV2Op0Lpc8/cDQZlbRytxRoeGDdZmF2Gj+M9Ho
         oi/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxsa29iMwnK0q9kHsmvyFfvrXTASmeHzqTYpQXiUq0AOYjDWsaKXG7ouMsY8YdPQ4aZ/aygaJqd5tMWHtcE@vger.kernel.org
X-Gm-Message-State: AFuF++lHOO1D8vpvZIWfIvhjHCUFH4XvW7TR+z0iRRkW98i9l4Z5b4M1
	gsSNcRtR0QziNt0r0i9CHsQ+AxOc+aPZs1CxIhrFO0ifjXFR4hT9+6KO
X-Gm-Gg: AYBFou34mO1LspuWA300puJqEVU5IfA7DeVHY0SNe8jhDzNpjj2zxnQ1Fp7Rl9gSWgu
	IvB1iiNbZEENhkUOmk0JGLvraF/mQSmhUniRZa10MPqE27SbFTRWCayzjSn80nuvXkQ3D6h8C4x
	ZjaxSogGgBQCV1SnwclxFEMmT2kLWT+FPRJB7daT9lff+1w/xWbCH7HEpbqMBXNjDk+yNGx6uNI
	jdXSAWOZ4Kml6pMB/rU7V90IuIeW/LS46SV+beYknpqMVCDVoKDoHkVjRUsqsJrimanYuOQJV3u
	AQM5y2kKjDc2/B1wZvTQyjFka0oYut9X+5Li1gbeRhvjQSG72ofILXVEpXyFyf2ajkZNQLwNOpS
	YtdQlSXxLK3PCgk/RCVYyx0l5Bh/WC3VrLv6D2EkKQMzF65DK3VtsQq/+nB1jiGaJKRDdeCh/qh
	e2HTv/JwcVqE2/Wu+3/6B8H9NvVCsV2MQAPKu1Hlpnl0UAJhRr6tEvh+RghRkyKHUZ9BTR3WRco
	3ur6YmZjJuuakQX0aFC4dj/T9NsvzWYIFjj4E4oGBINrsC5fCtARpLdYtPkpWyQ1Uk5MpKPTh+7
	xE0dA6jjvGcZlXLOh/lGoJA=
X-Received: by 2002:a17:907:2da4:b0:c2e:2fb6:ff37 with SMTP id a640c23a62f3a-c3169fb09ffmr192558266b.21.1791302610242;
        Tue, 06 Oct 2026 09:03:30 -0700 (PDT)
Received: from localhost.localdomain (94-255-221-162.cust.bredband2.com. [94.255.221.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3169ff5178sm75256866b.79.2026.10.06.09.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:03:29 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3] net: phy: qca83xx: read resolved QCA8337 link status
Date: Tue,  6 Oct 2026 18:03:16 +0200
Message-ID: <20261006160316.1356-1-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After a QCA8337 SmartSpeed downshift, genphy_read_status() can report
1000 Mbit/s from the advertised modes when the PHY is running at
100 Mbit/s. On a Redmi AX5400 running downstream OpenWrt Linux 6.18.52,
this caused qca8k to program the user-port MAC for 1000 Mbit/s and
traffic failed. An earlier prototype that read the resolved speed
from the PHY restored traffic.

Wrap genphy_read_status() and use at803x_read_specific_status() to
replace its speed and duplex result when autonegotiation is complete
and the link has not stayed up. Resolve pause for the resulting duplex.
QCA8337's register layout matches the helper (data sheet 80-Y0619-3
Rev. D, pages 327-328).

Keep the generic master/slave read order and the early return for a
steady autonegotiated link. This avoids additional reads of the
clear-on-read idle error count in MII_STAT1000. Forced mode continues
to use BMCR. Report the MDI-X state, but clear mdix_ctrl because this
driver does not implement MDI-X configuration.

Fixes: b3591c2a3661 ("net: dsa: qca8k: Switch to PHYLINK instead of PHYLIB")
Suggested-by: Andrew Lunn <andrew@lunn.ch>
Assisted-by: LLM
Signed-off-by: Yongzhao Chen <yongzhao.derek@gmail.com>
---
v3:
 - Keep genphy_read_status() instead of calling at803x_read_status()
   followed by genphy_read_master_slave(). This restores the generic
   MII_STAT1000 read frequency and master/slave-before-LPA order,
   addressing the idle-error and latched-fault issues raised by Sashiko.
 - Report mdix_ctrl as ETH_TP_MDI_INVALID, including after a steady
   poll, since QCA8337 has no MDI-X configuration callback.
 - Keep the generic BMCR result in forced mode. QCA8337's resolved-bit
   behavior in that mode has not been verified.

v2: https://lore.kernel.org/netdev/20261003173210.1235-1-yongzhao.derek@gmail.com/
v1: https://lore.kernel.org/netdev/20260928220749.857-1-yongzhao.derek@gmail.com/

Testing: the source-extraction model passes 26 checks covering speed
and duplex at the phylib notification boundary, latch-low transitions,
pause, forced mode, unresolved/reserved status, MDIO errors and the
three reported issues. The baseline fails the downshift checks; v2
reproduces the idle-error loss, one-shot MSFAIL ordering difference and
valid mdix_ctrl report. The MDIO model follows the read-clear and
saturating-counter definitions in Table 5-352, pages 324-325. An arm64
W=1 build of qca83xx.o, at803x.o and qcom-phy-lib.o is clean.

v3 has not been tested on hardware. The hardware result above used
v2's at803x_read_status() plus genphy_read_master_slave() on one board,
with an Intel igb peer, a two-pair cable and default autonegotiation.
Ping changed from 0/20 to 20/20 in each direction at resolved 100 Full.
No idle errors or MSFAIL were injected on hardware; whether MSFAIL can
remain latched while AN complete is set is still unknown.

 drivers/net/phy/qcom/qca83xx.c | 37 ++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/net/phy/qcom/qca83xx.c b/drivers/net/phy/qcom/qca83xx.c
index bc70ed8efd8..e70da092f42 100644
--- a/drivers/net/phy/qcom/qca83xx.c
+++ b/drivers/net/phy/qcom/qca83xx.c
@@ -92,6 +92,42 @@ static int qca83xx_probe(struct phy_device *phydev)
 	return 0;
 }
 
+static int qca8337_read_status(struct phy_device *phydev)
+{
+	struct at803x_ss_mask ss_mask = {
+		.speed_mask = AT803X_SS_SPEED_MASK,
+		.speed_shift = __bf_shf(AT803X_SS_SPEED_MASK),
+	};
+	int ret, old_link = phydev->link;
+
+	ret = genphy_read_status(phydev);
+	if (ret)
+		return ret;
+
+	/* genphy_read_status() derives speed and duplex from the
+	 * advertisements, which is wrong after a SmartSpeed downshift.
+	 * Whenever it has just done so, use what the PHY resolved instead.
+	 */
+	if (phydev->autoneg == AUTONEG_ENABLE && phydev->autoneg_complete &&
+	    !(old_link && phydev->link)) {
+		phydev->speed = SPEED_UNKNOWN;
+		phydev->duplex = DUPLEX_UNKNOWN;
+		phydev->pause = false;
+		phydev->asym_pause = false;
+
+		ret = at803x_read_specific_status(phydev, ss_mask);
+		if (ret)
+			return ret;
+
+		phy_resolve_aneg_pause(phydev);
+	}
+
+	/* MDI-X configuration is not implemented */
+	phydev->mdix_ctrl = ETH_TP_MDI_INVALID;
+
+	return 0;
+}
+
 static int qca83xx_config_init(struct phy_device *phydev)
 {
 	u8 switch_revision;
@@ -220,6 +256,7 @@ static struct phy_driver qca83xx_driver[] = {
 	.flags			= PHY_IS_INTERNAL,
 	.config_init		= qca83xx_config_init,
 	.soft_reset		= genphy_soft_reset,
+	.read_status		= qca8337_read_status,
 	.get_sset_count		= qca83xx_get_sset_count,
 	.get_strings		= qca83xx_get_strings,
 	.get_stats		= qca83xx_get_stats,

base-commit: 6dc989ea46b96ce170840174b4a38c4a387fb005
-- 
2.43.0

