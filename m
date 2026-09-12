Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588B731E830
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 01:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789176510; cv=none; b=DwlNxCLvCARR9WV/IMWFINByYarFQ+yn3GL6QTy6Q7ZEPMGM7HoGCiUDopxUUoqnUxRYP7cqVZM/7gdpkFNrE2DWhjmWR8VUAp2/Q0dS65/LjG7MHEOfgOPUPFV+9/xRWJ8SPPkcC6DORBnspmMqDjzqyFNtpNFFK4I6ZAgCmN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789176510; c=relaxed/simple;
	bh=uVvlkd3r7AzFL0bwoPRshRxUVPE5PJY2DyGjC0onaAw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CdU/AH6/hNL+9FDo4OXeebrru5MSnpPiVt0+lboXT8UIsh9gjaNVOACG+w/tZIbMAKBVqasnjcmkn1U2aobpT15q81nSRVLvN19Iu98K80pknYMW9U6kj2uXyVeg1OApcarFvFO5Y5CPaUm6zWtTX25kM430RaIz5HXY0wgvjPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g03UzGRQ; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g03UzGRQ"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8631d0023daso87369b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 18:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789176506; x=1789781306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Ohl5GXWK7z9PSL07FA+1qnT/VjHf89JQfhIV3tvy2o=;
        b=g03UzGRQ9ZwuOM24HyaKxUOZBtLeszngZetHR/AM1wKRhPNdOc8dRDPwVpOuKaR/lb
         P/w3KGQ/fATjOO3sU1bmsrbdbr5GvPHjKRjWT5Jnp3UdMvdvpZk+3j2BsJFY/+CVlKhT
         66ko0/1OzzCC3zyHvTgsrYRZ5U65thM+N9vsz0SSh7YMIOYaT8l9JIg7MlXpbwV7xMvm
         IQKM36WfZ48cwoia5ZgwYRQPDyeRP2xCL+/YNGWsRTKkvda27Z2YcgcNt2Hqk6LWo4AR
         tnPSEndhX+ucn9QwLf2dP0T4cjVk2joD8XgvfsJke9bkvBsqe76dEgqvtdu53i4zAyoQ
         7CwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789176506; x=1789781306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Ohl5GXWK7z9PSL07FA+1qnT/VjHf89JQfhIV3tvy2o=;
        b=lhBASMgMGDrpy+lwttQtJ910A0htcHtEwQhBjJWFUC4/54ODK3FnkznukVL9QRZ6S7
         S+iXDCMIw0tPwahdDHG/PyCvVMN3s/7oNvZFgM0kO0dGyE+HktpnNhBxkALz0033vmp5
         JjDcTO3Vx2l5rfJJ7sLLJILCk9qDpq7w8kZy3N0rH0DU6ihJxjMacMtO/JATEHeXx5MG
         6WcqX4IEJi0iftjU5zhrHxuVPa6ziBNilOauZk4QGsnli0kATdyBgDeqdmTk3CzGD/Bb
         Q/yiF8y7MkoVm8ey5hxVNMWna6tGQFhqpiKRRNMK4z0SjhQNzOyqzUoPsBgZcjX0GH0W
         BqIw==
X-Forwarded-Encrypted: i=1; AKwUvBweC837blu9OVeoiQTGVHfvYmUxXp0FB2JpXCje068h9bewp+rvQ3HvqjwUpwznxWOA9xHwyItl9V2oABqz@vger.kernel.org
X-Gm-Message-State: AFuF++mADYfXt2wPLaUgb98gfH0WxP9IQdySKwXCiXVITwwMAS2beOUY
	JgCnzrDWFUiF4Eie6LX7W6R58VnVDgNV2wS1nCsW1jA4m2AqYv2PeoE=
X-Gm-Gg: AYBFou2jtTM+30xa7a44zQX7Ajq3vvLJLK8RZMuP9JD5bm0t52yrhyNO08R+4Z4p1c1
	GBWqh6F1k4XPJoQGxF+CByLbJ8sHnQH2qdXC75+Z51vyCb/+zoBOAz70ANWoVCOVC0xzmPHFZcR
	FDVz60uOkRdC/RdXbvvwZTsKT67/A3fTwxP3bPPrue4DKHJjt68PMRCQaVxeAnJrJH0UX0cQrCo
	T9rq8aLv2G4eKAGowgvvp9bkHmzo7H8qxWhZIaES/4KhKCRRLLxNgK7glEkO9PmoF+Lw5ayS5Ae
	oBmjv6dpvR5KNVk0B1V0DHvNk4wOGFJRn9wavtREYjGp7pm7eJ/nX9ipbq0ikTDpcoarGgRHOTM
	6LfY7Tpd5WjJe+vm2QsCzYGyws/rv9p6xiL0SjSQdpOBiKXmBPnVsybmaZGzH0Vk7kHjkzsOOvB
	PIIfRzsK0+oBTszqIkde2SmLlw24JiVUdWYcktOujFTULOLMZlyzI2IxOcXS3IQjJjSfGjIa2YC
	BV8LpZm6Ow7BVf8Ky0JiD+dhNRIpNKB1og=
X-Received: by 2002:a05:6a00:94fd:b0:84e:89a:b8ec with SMTP id d2e1a72fcca58-86cca73e429mr1155632b3a.11.1789176506482;
        Fri, 11 Sep 2026 18:28:26 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b291c1601sm1805850b3a.31.2026.09.11.18.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 18:28:25 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Russell King <linux@armlinux.org.uk>,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	donggeunyoo.kernel@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH net] net: phy: qca808x: handle the active-high LED polarity mode
Date: Sat, 12 Sep 2026 10:28:19 +0900
Message-ID: <20260912012819.2072067-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit a274465cc3be ("net: phy: support 'active-high' property for PHY
LEDs") added PHY_LED_ACTIVE_HIGH but did not cover qca808x, so
qca808x_led_polarity_set() returns -EINVAL for it. phy_probe() propagates
that, leaving the mdio device unbound and phy_attach_direct() falling back
to the genphy driver.

Accepting the mode alone is not enough: led_polarity_mode records
active_low, so an explicit 'active-high' node stores 0, while
qca808x_config_init() re-asserts QCA808X_LED_ACTIVE_HIGH only for -1. The
bit does not survive the reset phy_init_hw() runs first, so the LED would
come up active-low.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260908105959.70453-1-donggeunyoo.kernel%40gmail.com
Cc: stable@vger.kernel.org
Fixes: a274465cc3be ("net: phy: support 'active-high' property for PHY LEDs")
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Assisted-by: Claude:claude-fable-5 checkpatch sparse
---
Supersedes [PATCH net v3 3/3] (20260908105959.70453-4-donggeunyoo.kernel@gmail.com);
1/3 and 2/3 are in mainline. Andrew Lunn's Reviewed-by on v3 3/3 is dropped --
this changes behavior.

Compile-tested only (W=1, sparse). I have no QCA808x hardware, and there is no
KUnit suite or MDIO mock under drivers/net/phy to exercise the MMD7 write
without it.
 drivers/net/phy/qcom/qca808x.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/qcom/qca808x.c b/drivers/net/phy/qcom/qca808x.c
index 8eb51b1a006c..68fd4d0fe31b 100644
--- a/drivers/net/phy/qcom/qca808x.c
+++ b/drivers/net/phy/qcom/qca808x.c
@@ -200,8 +200,8 @@ static int qca808x_config_init(struct phy_device *phydev)
 	struct qca808x_priv *priv = phydev->priv;
 	int ret;
 
-	/* Default to LED Active High if active-low not in DT */
-	if (priv->led_polarity_mode == -1) {
+	/* Set LED Active High unless active-low was requested in DT */
+	if (priv->led_polarity_mode != 1) {
 		ret = phy_set_bits_mmd(phydev, MDIO_MMD_AN,
 				       QCA808X_MMD7_LED_POLARITY_CTRL,
 				       QCA808X_LED_ACTIVE_HIGH);
@@ -603,6 +603,9 @@ static int qca808x_led_polarity_set(struct phy_device *phydev, int index,
 		case PHY_LED_ACTIVE_LOW:
 			active_low = true;
 			break;
+		case PHY_LED_ACTIVE_HIGH:
+			active_low = false;
+			break;
 		default:
 			return -EINVAL;
 		}
-- 
2.53.0

