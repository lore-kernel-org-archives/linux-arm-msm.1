Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D843A30DEA3
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 23:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790293712; cv=none; b=t1LH6Z0S8kUNGez6vNsXWsWwaMkAarVYg0DqDqemLQ6nJNhbzdxyFqIlNe2fdqSYVQmomNWDPAarC1ZqS3nN7qAI2GQsaPEltzas/VzjWpWmbn3XjH+qiquJLXXzUYKncqTHYNIxp2iZAu/nxZad5zygHb2y/SE61PYG2/zGMN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790293712; c=relaxed/simple;
	bh=hTYJ14te7p3/8tBxHYBWaHZUm0lfhODe827miPf3xkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FKGraM4DXJWZn7pQTLwEYF1gYNC+5FPRmNuBRGH/AVxjjceDAwoJTRbKJg9X1xvePdhk5GBHJaBsPOMT1ZfHa9u9XXu8QvyvAOHQMySCpcgbO3iqXmNeWiCi3EucYwMeOGDl1H2eUdo3DIr8Gka6wTBOmigGGoCqTeDs/SIgO/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qBVFtLBH; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qBVFtLBH"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c294af0caa8so40942066b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 16:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790293709; x=1790898509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTYJ14te7p3/8tBxHYBWaHZUm0lfhODe827miPf3xkE=;
        b=qBVFtLBHXgfqQCXXcoxj7qkzhAsEivvXU6kw4vyxa1TKK6wRL79uYkcq+a9EAl7nZI
         K0CaNxnX3fg+uHjmPuWaQXbTdOAi96NkVZ7QZ9ZC2X9Ik1W8qGh4vIpa+DxYQprpCug6
         Ex7gB96zEO5fot+yVby4Gor4bw5nNFpOVAcZm3s63cAV2ZmSpNPtJNS70KLVHozKDwqK
         WpJb4tTNMFAap7Rxtdgj+gx4tTB+iLHgXalyO8duI1sN5kVCOuxy+zcsShp0fBN4oX5d
         leZweJz501CDmXn8Dx+dqW0m8I5vAgg9XzoacPCPvUP3euVyoQ65UJOiXYyRRTdCh1X7
         4Ufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790293709; x=1790898509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hTYJ14te7p3/8tBxHYBWaHZUm0lfhODe827miPf3xkE=;
        b=KOQ9MLoxXgWstpYppsuGXFBFCUwRGxuKEdnq6y5hY8ZjbkqnESONqftPX98Yg8s53R
         vSCUfXrU9y0zjxkyP0OklWzjV0KSajGQROqdad0f8ttwyBp8Q4oLiVb0rXaVBT64ezbv
         dnnG5AbslzvMlSixYulmRzRiP0ZkNZV4mYlh9/NwL5dA5ezDPHKRRILsnmBhCBARUpIt
         Hi5qqnMr63waPaizzquYf5GWoP15LizLZY89dHDaOVGOCzCdTinFxoHNFLOSXMoy40wG
         EC7T99Wu7wScWT1z18G4vYDsq+Pifl7jHcfVLVaeS5VvEFl47vlqhDnSUSFl6HwCdO1V
         kVUg==
X-Forwarded-Encrypted: i=1; AKwUvBz9N0fi9KvHKVItK4MUBRcU3AGukqYuhAJTt2ROFEFuDDGYvNku6fYRL0xCCy/w3tDrnjx2KHbN161DO89J@vger.kernel.org
X-Gm-Message-State: AFuF++lqgsL6KVNTW6GtQo1WtmcKn7nvu8NU/8braNp4VIfYzY2UUGjX
	51e/GODnl1TT5SaGKpMuJafaRFsYl52k/G8KA6odL40WLLpe3qXgnNAg
X-Gm-Gg: AYBFou2/UlXEAoh4tyGP/rwG8vsQS1DyBF7M+aryD69IE9+rjYwlTKemFEBp/RFd9FS
	dvACBEGxH0bWLCmW57KsqLyS1TpioZk3vj8IpF9i9T02+lSHQFbb1G7ESyJtvXWr61qcBvtbL0Q
	iyJXm4RMe58OqOPbdmgm45Noh0oyf2O3RorMV6hdoiCQwab/7sr6eoiFtdCkTAIHY6BDOgpxpTa
	6uToO7OTUOw5wOM+jEvicL6FeYJLaCn75bj+I/k/bQpjkUxHJs+AtayBi18+rsARl8l9qJZ2Iv7
	uUKU7cZvVtOfmu/NyXcit3kxYYCaT908j47Qe9QTQ74p5+UHWvFw7A9+7mCMBrQ+U/YqYaF8BNL
	kMNqte/ocprJPegCcvqopCtqolfQRgEUkQRtEWfB8DgQI64wcHKYc7zukg6YdE3mEjZmtQ6Vm4X
	/5SfY7ko5r6CBV9Gg/+KlrU5oJf88/LCdOIgXFi6sxJFxdhoXNrTvKREieAoMgLIHM0kaB7CQPU
	Cf4Jnz1nQbFKKdKg2oOt3kgI1IPxL75TXpRwDWp/o4GrBHAZSbBxZ8zDX94e9CARM0Hg0OkGqcn
	3CnqXDQH5mp2zL/yhe+k
X-Received: by 2002:a17:907:94cc:b0:c1f:e9d9:64d4 with SMTP id a640c23a62f3a-c2ac24747fbmr368025566b.11.1790293708996;
        Thu, 24 Sep 2026 16:48:28 -0700 (PDT)
Received: from localhost.localdomain (31-208-26-100.cust.bredband2.com. [31.208.26.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae757b9c1sm30757766b.33.2026.09.24.16.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:48:28 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Ziyang Huang <hzyitc@outlook.com>
Subject: Re: [RFC PATCH net-next v3 4/5] net: dsa: qca8k: flag QCA8337 internal CPU PHYs for SmartSpeed
Date: Fri, 25 Sep 2026 01:48:14 +0200
Message-ID: <20260924234814.1734-1-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
In-Reply-To: <09d669ff-7aad-4414-880a-21c2e7bf2cd7@lunn.ch>
References: <20260923215858.1653-1-yongzhao.derek@gmail.com> <20260923215858.1653-5-yongzhao.derek@gmail.com> <09d669ff-7aad-4414-880a-21c2e7bf2cd7@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andrew,

The register 0x14 configuration is in patch 5. For a QCA8337 CPU PHY
marked by patch 4, qca8337_soft_reset() clears SmartSpeed enable and
bypass before the software reset. I should have made that relationship
explicit in patch 4.

I have a local read_status change for QCA8337, which I plan to include
in the next RFC. When autonegotiation is enabled, it reads the resolved
speed and duplex from register 0x11, retaining generic link-partner and
master/slave handling. It holds the link down until those values are
valid; forced mode keeps the generic BMCR handling. Local tests that run
the callback and the PHY state machine against a simulated MDIO bus
pass, including a case where 0x11 reports 100 Mb/s while the generic
path resolves 1 Gb/s. W=1 object builds for x86 and arm64 are clean.

I also tested it on RA74 in an OpenWrt backport on Linux 6.18.52, not
the net-next series itself, with the existing CPU SmartSpeed workaround.
On normal 100 and 1000 Mb/s LAN links the reported speed matched 0x11,
including after renegotiating the 100 Mb/s port and after a warm
reboot. These were normal links; I could not force a downshift, so the
downshifted case is only covered by the simulated test.

The existing at803x downshift tunable cannot be reused directly here.
Its setter calls phy_init_hw() after writing 0x14, which would run
qca8337_soft_reset() and clear a requested enable on the flagged CPU
PHY. This shared-port PHY also has no net_device->phydev through which
ethtool can reach it; ethtool on the conduit or wan addresses a
different PHY. I have left tunable support out of this follow-up.

I don't know whether downshift is broken in general or only in
switch-integrated PHYs. My only data point is the RA74 CPU link
failure, and I have no downshift results from user ports or discrete
at803x PHYs. phydev->is_internal is set for every PHY that qca83xx
matches, since they are all switch-internal, including user ports and
QCA8327, so it cannot select just the CPU link. I have not found a
verified erratum for this switch revision.

Thanks,
Yongzhao Chen
