Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE60399CEC
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 17:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791048758; cv=none; b=DOHODwzxQs5+ILJpT45qyp31nOj3idrpjwAPLWLjRUIqBi1Aivb4yxtYwn5avompPrFSI8C8tQ6DQMR8/IoHypCM1YU4Muto8NP2qruOFlL/CJU5CfRtirPD8DVNxUaLdsKuAUqXVeol/ldnaH2zHY5Mke9vdbTuvuaE9UCgcp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791048758; c=relaxed/simple;
	bh=QoRqzlPVZ4N5xoYxODT20puuFWUAgXPIHnwQx6BlFbU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tWNFqbZH+2ASGPBpQIMfyRIAxFggLTgi68WruL//oezjwxSBZT9QleUXMixwrIt1An949ykXrU6J7TZMgSP58oIpz/uqh9TXDLRVkLNJGhF77gJj2O/YQPDItZcJIFBKVfp53i8jxHbqVC8rfBN/OO4pAEdancRrMo+MWW2pCGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kfXoiA5Z; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kfXoiA5Z"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c29c49a977aso74023666b.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 10:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791048745; x=1791653545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LleUE9L6TCx7eK5ckWEfi/VBEFROX7GUZJBsnTVJ2/c=;
        b=kfXoiA5ZzBkmZkhZBNZlFNHF+THFF1lC5HYWTkqqd9+A+nHHfUlHzc/HPh+FwBMl7g
         iBi4y4LOsJA+AUkOQ9SIXsDgybwv7dWxSww8jzSLpb4T9WecQl7pOvq26lSdFm941j2F
         dO61WQs3BJV6sXYhBYmrmVQjN4nP4pCu+1e9jUwT4YwqvHLzmNPWnL3VzIuX7YJWMZ1B
         E8g5tS4maoIOrt3PO21NGJgaSxN4ieTei1dMchRlhp0WY9Yu+M4I12wEPpNyMk1teG9t
         NYOfV32OvouFbiXe3XysjaHZdGxr4yQT0613Jg5hYtvARmY9Vq9UzXd/jpH5iJyK3GHK
         P2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791048745; x=1791653545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LleUE9L6TCx7eK5ckWEfi/VBEFROX7GUZJBsnTVJ2/c=;
        b=DtVupWgx6KbVYf6ElPXEG9sifCsKN6nch2wcU8Wddw67Zldo092D/OvZxq3lv+fLrr
         r3zJT66jM+fjQQfuAZjt64XMTIoN88CZlf+6MnfICkYpbdIpZD6fI9+Lx2UM+bd3JNhb
         26b3Uor2h9iuAqxEvLsWIIKxnncTJzTn6N3E/h5s6BefV5Zx5YSk4qifPlpr4+YXvJez
         DyzRyjV5f5VQOOKaESqAFcBcN2uLgCZ8pRV8/EcjCfgGI6oyVnxaAWcwAzNosff70YiC
         8nMhsa4YNETBV/GRMhELjTRAH1iHKVUtk4Kc+f0t6opxa8UqprIXwQnUhWs6wOORcuJP
         xfPw==
X-Forwarded-Encrypted: i=1; AKwUvBzQHa/dIi+jy41I4nPFz/8udAVAwy4EQGJZDwc/hKLLhS8Pe7Nd287onF/RP0km4nmXRLtIXLhsAxmilsR6@vger.kernel.org
X-Gm-Message-State: AFuF++kwKsnhsmEm8qYHxMRqj9LioHkRi4kah7rMxF/yXC/A2Cc5RJIU
	YZvN/TM98q5o7kKVZsyCX46EcovwO1UHGjjS+cZm2fxm++WNMz3954NV
X-Gm-Gg: AYBFou0g+OYkgMCtxqk9enyr1xWqTT4t1vll18LGt9MBm2JvAxaJLQjdqXXr9TKzIsg
	82Lg8pL7x3VZkuwpdxUmegdcHFB3vMdFiFlRJVEGEjU96jNXmSb/ERPEazSqk7IU1BAHFLuHJ/k
	DQIHtDGW3Ww2QMqIbQyhihDr6F+aRC/NJ//Rb5dMvs978kte+m4ZPeaHHjnOokdeRKcxvm2b8PJ
	1WsXuh30McVBCmzyYfZR5vPGIANBDcS/gU9Yzmto8stLBAu6WSkcvlE/E8mNhAYss7QHFOWYVF+
	aAl1UZwIVma5zED+e01VGx3SK4w17PNSUx+AKOWW9ajgL2b9EwkoLW80HVLF8qrw5oRCQ/y71v1
	vbxZ97PMS47IOfg+IS0ZLA9bU/vbNip6f0v+78R2KKY/U6d0pEdb8c0v3wHrlRGxPJf/b50wvN7
	74S0TKRq1pV7Qr+jvnYZy73zLas8U80dLgwJdFczISRJuYvA7G8aWp1lOT7MAG3++B+DU9e6rXn
	d2O5/gOnWjCTzxUK5qQ+rDiW4Wtmk5oqkMo1yESWOzovkkz6dwZb5F3
X-Received: by 2002:a17:907:d08f:b0:c29:6400:ef8e with SMTP id a640c23a62f3a-c2e6f249ff1mr248303866b.42.1791048744873;
        Sat, 03 Oct 2026 10:32:24 -0700 (PDT)
Received: from localhost.localdomain ([2a00:801:793:68fd:7995:7ccd:ec2b:6712])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e71d58d94sm84957766b.1.2026.10.03.10.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:32:24 -0700 (PDT)
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
Subject: [PATCH net v2] net: phy: qca83xx: read resolved QCA8337 link status
Date: Sat,  3 Oct 2026 19:32:09 +0200
Message-ID: <20261003173210.1235-1-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After SmartSpeed lowers the speed of a link, the generic status code
still reports the advertised speed, because it derives speed from the
advertised and link partner modes.

This breaks traffic on a QCA8337 user port. With a downstream OpenWrt
6.18.52 kernel, a port connected to an Intel igb NIC over a two-pair
cable downshifted to 100 Mbit/s, but phylib reported 1000 Mbit/s. qca8k
then programmed the MAC for 1000 Mbit/s and no traffic passed. With
at803x_read_status() and genphy_read_master_slave(), as in this change,
the port reported 100 Mbit/s and traffic passed.

Use at803x_read_status() for QCA8337, so speed and duplex come from the
PHY-Specific Status register. The register layout matches what the
helper expects: speed encoding 3 is reserved and bits 9:7 read as zero
(QCA8337 data sheet 80-Y0619-3 Rev. D, page 328), and the MDI crossover
field of the function control register is the same as on AT803X (page
327).

Compared with genphy_read_status(), MDI-X is now reported. A reserved
speed encoding or an unresolved status leaves the speed at SPEED_UNKNOWN
with the link up. The new wrapper also calls genphy_read_master_slave(),
to keep the master/slave status that genphy_read_status() provides.
This refreshes master/slave status on each poll, including while the
link stays up. In forced mode, speed and duplex also come from the
PHY-Specific Status register instead of BMCR.

Fixes: b3591c2a3661 ("net: dsa: qca8k: Switch to PHYLINK instead of PHYLIB")
Suggested-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Yongzhao Chen <yongzhao.derek@gmail.com>
Assisted-by: LLM
---
v2:
 - Target net as Andrew requested and describe the observed user-port
   failure. The Fixes tag identifies the switch to phylink, after which
   the reported speed is used to program the user-port MAC.
 - Use at803x_read_status() instead of decoding the vendor status here. It
   reads that status only when the link changes, so the code that forced the
   link down for an unresolved status or a reserved speed encoding, and the
   code that cleared the state again when there is no link, is gone. That
   also answers Andrew's two questions on v1: the helper needs no special
   handling of those cases, and page 328 of the data sheet lists speed
   encoding 3 as reserved.
 - Keep the master/slave status of genphy_read_status() with a small wrapper
   around the helper.
 - Cite the data sheet pages in the commit message.
 - v1 could change speed and duplex while the link stayed up, without
   PHYLIB telling its consumers. The helper does not.

v1: https://lore.kernel.org/netdev/20260928220749.857-1-yongzhao.derek@gmail.com/

Testing: a model test compiles the real genphy_update_link(),
at803x_read_status(), at803x_read_specific_status(),
genphy_read_master_slave(), phy_resolve_aneg_pause() and
phy_check_link_status() against an MDIO stub. It covers speed and duplex on
link-up, no rereads of the vendor status while the link stays up, a BMSR
latch-low renegotiation, unresolved and reserved speed encodings, MDIO
errors, pause, forced mode and master/slave status. An arm64 W=1 build of
qca83xx.o, at803x.o and qcom-phy-lib.o is clean.

The hardware comparison in the commit message used one board, QCA8337
lan2 and default autonegotiation; the downshift resolved to 100 Mbit/s
full duplex. Ping was 0/20 in both directions with genphy_read_status()
and 20/20 each way with the new path. Each path ran two warm boots and
three port down/up cycles. I have not tested a cold boot, other boards,
forced mode, or an unresolved status on hardware. The latter two cases
are only modelled; whether QCA8337 sets the resolved bit on a forced
link has not been verified.

 drivers/net/phy/qcom/qca83xx.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/phy/qcom/qca83xx.c b/drivers/net/phy/qcom/qca83xx.c
index bc70ed8efd8..b8da6a41788 100644
--- a/drivers/net/phy/qcom/qca83xx.c
+++ b/drivers/net/phy/qcom/qca83xx.c
@@ -92,6 +92,17 @@ static int qca83xx_probe(struct phy_device *phydev)
 	return 0;
 }
 
+static int qca8337_read_status(struct phy_device *phydev)
+{
+	int ret;
+
+	ret = at803x_read_status(phydev);
+	if (ret)
+		return ret;
+
+	return genphy_read_master_slave(phydev);
+}
+
 static int qca83xx_config_init(struct phy_device *phydev)
 {
 	u8 switch_revision;
@@ -220,6 +231,7 @@ static struct phy_driver qca83xx_driver[] = {
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

