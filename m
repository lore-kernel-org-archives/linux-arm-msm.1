Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B588B41686D
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 17:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791998588; cv=none; b=G70o9nI1jY9KH7ovtb0rYTulsUTN9ZsKzdv9fGw+IHv4vboGbr0bHpX872xB/CHpKn1KikLoeBvI6lJIvy6VrjMe0Vc5eft960EfHxrBNsD4MvxNMcskjjGZhr1KhRsYGQCMENSpQIr332OdrH5VDNGHif8naQLxCi4z38NmiA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791998588; c=relaxed/simple;
	bh=kwV6mI6CO5ixDdSeU2StLqiQxTrWodmaslZY1Exez0U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=la4MV9xQC6k6iBm7djt3eJoGWrLnRnqKoVplrb1zjJ6lKyLFK1FWKlVyw3FIFxE2ZhgoXCmlR3zdR5b7q3fzzW3+3V3aT9yydCHNAiIJh5g++Tap44Y9Fb1ONErlnPCDCUoXME9+jkHUNPA0lAHD7J7xvGN3lobPpm/Xlugjdrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=tWQ9jOxF; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="tWQ9jOxF"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-535179e995bso55139381cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 10:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791998584; x=1792603384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ww5U0pAT/EK2sJlV9E6NzHJiMJzSAUGDjX9HkzoR4OY=;
        b=tWQ9jOxF9a/FZa1sD10IWaILLqAqRkvvBgLaaT22oSTXbBQ/MVVaGz/eMvFWDmXoyP
         botnPZ8ZL1yusM6/Jhjsxdz6SnayiHv3xm9kmRpGBJEVBAf7Oh8vg+wuzw44mtAoYVoo
         pP8K3d0vmzuAqwbzKStZVOqPiP+9D3T+WnDTchp/Yn0Gv8KygHfIMQy8zg5ORVCMMfgH
         +S3HeeMH/V4YnX1u/WzTeTC3LJ/0sACGFNL8iupt6/D/b6dGDVwzyGM/uE6BveJ/w+99
         SHN0WF2iq2I/rXN9jit1W4qr0SdE6va5HMV9RlLbPBXnqlHtctWI84FIxENOcRqrIWqb
         Upew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791998584; x=1792603384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ww5U0pAT/EK2sJlV9E6NzHJiMJzSAUGDjX9HkzoR4OY=;
        b=zlDwRCdagQp801CiFVdzEoevdAphXjpiZjDo2uZlATN78lqq+h9TxtQNSFzD3WtXoy
         NIDiq+PNl9c0URGyKr3zgvwFMa2453beC5JMhZPetoqKXfRfl6j74rMAX38bqDVBMjjG
         YTZxSISiJ2h0ig+KXkoXVr2bfa0MIB5Jc+VYZqYd7akc+H7JiG89hWt2lxQIaMUU+0+Q
         KCFzJ5QACZN9vsR4pZp9pu5RTjsQl/4MAkkSn74NsbpQIPsHGys+n9uNd47PW/TLmOqV
         LQanSYwnyZE9Wv3ZKRFD6j0wmjXsGYEUYQ1sz7WNcDkLelA9y7D8wem1fAmAcEXFazyn
         SqiA==
X-Forwarded-Encrypted: i=1; AKwUvBx7vDx/LReX0rOi4k331XUtsZapMrZP5OKwNCApD5I/uRn/ilyxKp2oDv/HdZa4jo/Yxn2KaUrad3mIjgoa@vger.kernel.org
X-Gm-Message-State: AFq9FYIOr+I+6bP4Xrb0RKBjK/WrzeRLWV3X795LrKV7LNjPW0tk9gt0
	xtURm5f65jm3F83UGO5BN2M9SWTK9ScDD9PAcGQ80mB6INoz9ve/KwSS0eZrrcNu04o=
X-Gm-Gg: AYBFou2/wOTTsPRDZiwlxUXU1StUvHlAhBsrDhXFNSyFHhYuhAd86BiCYdimWoLpyXJ
	Ssy9aWC+bDt63rS8liUn2xfRwl9PZG7WJdvIp5q7KsFbQCTazgw/fZHdRigs/kqPzTpHhKXpWoI
	kyz1laNOqkGwvOrTNeYp+2J5zTpSJehscqVn8uz8DalPfmSTH8m63PvN6R/HYyYEhOGrAcFGdXQ
	s2Y+NyM3HUpk84+VmyBB/lHP/sOWZvkputIJXfrclQ+66trT9woYQCa3d2hrL3sqT5WSUtnnFID
	l9vNTzKb8MiqXSsvJlwqkD2Xl779lKydYo4EGJUz/CdgKmHAX9Ho3WGxhNpvk2yASSmnBaF472t
	iSTBDY2SrlHcKWke5omF+eTZz5yFRPzSY/Y135oeE/TwXsoUEasmJoVCz5BA0P2lXMghVJbbZOK
	xs9IE23N0nHu6m26MLNFapeoljJ5cO990LvcBUYzD7lhg3RgZc8V7INswXbBQIG28KnuvkJ54Uc
	XM=
X-Received: by 2002:ac8:6109:0:b0:533:4da1:b5d1 with SMTP id d75a77b69052e-5359fa724e6mr266172231cf.23.1791998584265;
        Wed, 14 Oct 2026 10:23:04 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97bdf05dsm57638436d6.38.2026.10.14.10.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:23:03 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: Daniel Thompson <daniel@riscstar.com>,
	donggeunyoo.kernel@gmail.com,
	ansuelsmth@gmail.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	danielt@kernel.org,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: phy: qcom: qca808x: Add regulator management
Date: Wed, 14 Oct 2026 12:22:59 -0500
Message-ID: <20261014172300.292324-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Thompson <daniel@riscstar.com>

QCA8081 appears in embedded board designs paired with GPIO controlled
regulators for its power rails. Add logic to allow these regulators to
be turned on during a probe.

In order to avoid the complexity of tracking state for suspend with and
without WoL we take a tremendously simple "always-on" approach to
regulator management, essentially relying on BMCR_PDOWN to conserve
power when the phy device exists.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Co-developed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/net/phy/qcom/qca808x.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/net/phy/qcom/qca808x.c b/drivers/net/phy/qcom/qca808x.c
index bab26e4c61408..6e2bd753257d9 100644
--- a/drivers/net/phy/qcom/qca808x.c
+++ b/drivers/net/phy/qcom/qca808x.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 
 #include <linux/phy.h>
+#include <linux/regulator/consumer.h>
 #include <linux/module.h>
 
 #include "qcom.h"
@@ -181,15 +182,44 @@ static void qca808x_fill_possible_interfaces(struct phy_device *phydev)
 		__set_bit(PHY_INTERFACE_MODE_2500BASEX, possible);
 }
 
+static int qca808x_power_on(struct phy_device *phydev)
+{
+#ifdef CONFIG_OF
+	static const char * const regulator_names[] = {
+		"avdd18", "vdd", "vdd18", "vdd125"
+	};
+	struct device *dev = &phydev->mdio.dev;
+	u32 count = 0;
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(regulator_names); i++) {
+		ret = devm_regulator_get_enable_optional(dev, regulator_names[i]);
+		if (!ret)
+			count++;
+		else if (ret != -ENODEV)
+			return ret;
+	}
+
+	if (count)
+		fsleep(phydev->mdio.reset_assert_delay);
+#endif
+	return 0;
+}
+
 static int qca808x_probe(struct phy_device *phydev)
 {
 	struct device *dev = &phydev->mdio.dev;
 	struct qca808x_priv *priv;
+	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
+	ret = qca808x_power_on(phydev);
+	if (ret)
+		return ret;
+
 	priv->led_polarity_mode = QCA808X_PHY_LED_UNSET;
 
 	phydev->priv = priv;
-- 
2.53.0

