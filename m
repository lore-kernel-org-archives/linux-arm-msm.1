Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE48408602
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 22:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789511514; cv=none; b=FJNsCEM+RQ6QvAd94zuOVS3yuAog87ANa1ulQfTU8s9JvcDbqZ89Brw1NSZkuLe2cc7PNE0v7DLz3iDRdU23ty8FIxS9i6Jfli8R2RmelMjZoTPO2d8QvswFCRfyJTMmEXRI/TTV9QQdZIc/Xng3z1hHLmc4HJtH7eTIx3bITMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789511514; c=relaxed/simple;
	bh=vq9B+WHtR7YcxOfQ0HtBcAM9E5zRf5ErIV6WMfZLrhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n6SP10+WLQqgLgv5DQvlfm76UtYMOKulaRAmXEpp7lBvBfkLzAUizULJ6kIgrFzvBefPU0VC8VX0K5qHwWEXrCczbPxFEPcL7V1IUhW1y6Cq1vs0sXs2xcsWILfCcQ2wcNvjdD2yoYNeM61ZqHKHO9ULI09jS3S17h13KFkuD90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VckqRcbO; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VckqRcbO"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb1a98fso205105a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 15:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789511512; x=1790116312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dY8BjpTJUvWkhY18qZeTDa5Pr7EX9PKwjyY0lXAdA+0=;
        b=VckqRcbOZ76p9baLN0i/tU4UeInXNMe1NOx2/5EtnFdLjZZch14O16Kh85glM2DYA8
         k/V8jbc4YnzXJ1mLfs/154OlhgxF/aCdpGhTWjeWOnF5dk+qOc68n4Ye1t/G2JQ2Sgwn
         rwcyvfUdmeeKpppH9MSedwYs3fi3SrW/MMZ4MNQAnhfL3hwvyxNUnkvLHUPLQ/P9swel
         Ajj0Vg17vzBSJ1UgCwzwdLXhEvaFHiLgzKwSSwtyTt+54Wf4PQxSw3TWgJwgRu18zrGS
         rTGS9drf7empPlX6Sftmxz+KYMt72XmQWwSY36lJTDC/WchL0hqUPEEgymova6qIcHtU
         sZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789511512; x=1790116312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dY8BjpTJUvWkhY18qZeTDa5Pr7EX9PKwjyY0lXAdA+0=;
        b=vr9B0uTKGxFrDDpFbRHUhOnrO4ZwlZZirbhakjkX5d6WppPYh5uzipgKAuXnpPxugY
         K8q5lNvxKP01WIon7Dr3TDqHKwlZgEmmXlNxU3N13NvLZnyc6fiDK6zQ1Fcayt0cOcQ6
         YpKkA6ZuCYH8rgXsp7/WZJ5QuEFJiYE+kP8MeYzQjeZRjqjYo5Nz3xGYd8cC4iNT791Z
         UtXY4oELfv2wQIMg2RymgJbySkIuHMDH87/OZMUWCd/+mJfCX2OwTliBvQ+hFgqp5L/n
         pevi6azxXcJT/x2xwgF4Xq/eLh7vy4Pzeiehu5qDg67GBLk8WrJX5bJ4OnbTo2GqfjxJ
         Mcuw==
X-Forwarded-Encrypted: i=1; AKwUvBwNKU4ohBTbhPuueI/CWeVnsbAAQtQ8nso13SORbJPb2E8fLUblI2UKaTynL3mNTF4+azevN9y8M16hepSS@vger.kernel.org
X-Gm-Message-State: AFuF++lbZUNWvAXDAEkNogEBAwT/IQz6T2TlYKTZduywsNIA5ULd+TGi
	b9P83D/s4/yF1OwmQeqZY8rOeJiRdUDkl20psfiQ5bSTvp1rRh29VGQ=
X-Gm-Gg: AYBFou28iRLIQXn70/3hGZ0E5hvcP6JB65YTwhKf+qxPHUoQLJ/4D2NT2k+vTOeirLA
	EB4cRNdK2TCwsTjpSoxfzzhR0IiYu2nYaanAypvzNqee1Pui6ljvQydG1uzUvPNEMrzAISJOazx
	MkQzs8SZo0gTfJa/ObeA9QTJLDXCGdgUgpVfjOFN/ztcG3Dza+/fTqd5YCYVPwqba3poAVAD/PL
	lTxQI19KY2ev4JyYXvsmJyUk9pKXvQUNc/xQAh7/YYX37R8VpXGQYobGr/H02XPcWXe74t5q6Qz
	6qZhtg9lOqAoCgraqreIW+xB91NqOwWlFu1vxN13o6l/FJBZKDU9kjTlVNY0LJFbRUhpvWhv9fp
	iiCQuVqpRDQzDsMsoShd+GQOBzB0UdH71FJgYXpvmk+G5gc3ZyWACcwp7sO92D8UyivCsL6Pc+Y
	YexaMVb0A2GgKEU8zb73Puva3Hm9iOdUplP1UzCCnlL1Ve/QQTXsERicLC9H+G//ebIZ6S9lkCI
	MyRMqxkdlhgDbLXo3trsEGOwA==
X-Received: by 2002:a17:90b:4987:b0:39d:f064:3a68 with SMTP id 98e67ed59e1d1-39e1e4d371bmr651073a91.21.1789511512282;
        Tue, 15 Sep 2026 15:31:52 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:556:537c:f7cd:8a1b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1c337e97sm208036a91.2.2026.09.15.15.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 15:31:51 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Daniel Golle <daniel@makrotopia.org>,
	Rosen Penev <rosenp@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Subject: [PATCH net v3 1/2] net: phy: qca808x: accept the active-high LED polarity mode
Date: Wed, 16 Sep 2026 07:31:37 +0900
Message-ID: <20260915223138.321307-2-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915223138.321307-1-donggeunyoo.kernel@gmail.com>
References: <20260915223138.321307-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit a274465cc3be ("net: phy: support 'active-high' property for PHY LEDs")
added PHY_LED_ACTIVE_HIGH, but qca808x_led_polarity_set() still rejects
everything except PHY_LED_ACTIVE_LOW. An LED node carrying 'active-high'
therefore falls into the default case and returns -EINVAL, which
phy_probe() propagates: the mdio device is left unbound and
phy_attach_direct() falls back to the genphy driver, so the PHY loses
every qca808x-specific feature, not just the LED.

Accept the mode. The register write below already handles both
polarities.

Cc: stable@vger.kernel.org
Fixes: a274465cc3be ("net: phy: support 'active-high' property for PHY LEDs")
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Assisted-by: Claude:claude-fable-5
---
Tested in QEMU against a synthetic MDIO bus answering as a QCA8081; see
the cover letter for the three-arm table.

 drivers/net/phy/qcom/qca808x.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/phy/qcom/qca808x.c b/drivers/net/phy/qcom/qca808x.c
index 8eb51b1a006c..3ba58f14e248 100644
--- a/drivers/net/phy/qcom/qca808x.c
+++ b/drivers/net/phy/qcom/qca808x.c
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

