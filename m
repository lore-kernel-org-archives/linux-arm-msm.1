Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ECA5372E8
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 19:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791918222; cv=none; b=tuNPUrqUbcGRDIg1x/dsadIgAssQRxNfIPQIBNazVRaCI3njiLLZffowhaAVyNsYtf9zFHwoRC7/ev/moxIhlXYeTPSoMbBS+2U274kQyosryHKpZXgE+XxOHKjaWSHt5WbPzxmc7jMd26HV1FRVvATc/Px+Qpg+TZwsjWCOrXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791918222; c=relaxed/simple;
	bh=DLwihrgna3d0G0IZ8VFeYrlHIvdRySXk+DYF3Jc7hNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aov3ehYlyQK00n7MV4MpBdMHfH4A2V8/zO2BDUSrQHAGI/IlErY/7BIZeZ7ElKkUMHFeeObQoCbxk2wFTlnwbyb1UiKvM+Xzo9DbTtguIIny18ZY5v5GJ3b89c0n5xb6xBHXe/LPmRY79usNJlYB5V8MImWlzKj81aH2jrCVTic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OA1RUBI5; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OA1RUBI5"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c350db5a761so393951966b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 12:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791918219; x=1792523019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DLwihrgna3d0G0IZ8VFeYrlHIvdRySXk+DYF3Jc7hNg=;
        b=OA1RUBI5p6oTskft5kg1CNZv7p4vVbidUhYnjFLH5F4qKevumdZsjD//aMqKnEBNUX
         pJT5DkN5WSTV3U2CK+kEtWWHJ1XBOJHclR7DqZUbsX/QGFkIlC3OHrMmf7a8J53wOpmi
         I4Q95KzNrTfwOjMNS9hDdpzEUWzW5RiivIyz0CmleSN6F+t3tUWG37JlEoZJVWAPWY2E
         yAHbc+XfBCUsvX9Ny4U9NwbL93Na6iMwgNarK9oAxWJD0Yb8WbV4dyusU31y/CY9yyjF
         P3I8Mfw38rdc6+HfS/nB0rRthjdItudhg74FBVEjBHuzihuS2BkwKaiOCVo/vY9g9EqO
         isvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791918219; x=1792523019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DLwihrgna3d0G0IZ8VFeYrlHIvdRySXk+DYF3Jc7hNg=;
        b=V6OtQ6dlq+YueAsZ2d6ZLdSVPMYrT5V3ZaPrr3suT6PS3kEaV1515Wu1RkJ5m5lpZk
         OPAig/vBh+L1xWKqtUmX+WC4i3fJqptB9w/4gmMIqWZuDiXdKeVIC9+qItw2K+9N/fT4
         Gb9ar6K1f4iPSemHzlwSMyUc5pGNEhSSrckxCXHZQbKpN9+i79LkyEZDDIms+VhJGuE9
         8skf5jzVnXUv5aBJoCL5BqTHol5M671hKRmbmwdkXEGDAbJrdsJkaTEktgTjx0DH+Nmg
         jMAs9R1IRTu+IXzOw6QXRg8kInG2Pg9Es9pachtxKCDmM55C2fXFKFO+mYpyNvC0WH0D
         EF4Q==
X-Forwarded-Encrypted: i=1; AKwUvByepF1Sk7KhRdtPvZFRCgMnt2qI0+XNYZz/D7VJfMnydkLIDnXaz1UN0lwtURbg9Vxuq/YaBhasNumnYBAa@vger.kernel.org
X-Gm-Message-State: AFq9FYLHh+pwtjO33upVUTsJ/+sCtIjLWf1lhnr3UREUx+SEtrJChU/S
	wbCq+XsTtT+jFodsD2BHSfdKn4TfrCg07pzKr5lc1zhWmoKsY8lkSz/v
X-Gm-Gg: AYBFou1F5mXWONOmL79paEvPRoi6g5F3z3AtQihpZZUlMaxgkDaO2rEjYYoMpEJ2cA4
	+TEE7kuZELVHgBxp3c1wE5c7tMM8SZmsip1Uy5Lr/Y+OQtSxZMdmSEClk6v7N10sjkif5uhgNZp
	9jlicOhqS3vmR/Yv4DrEpoK0IKE5Ibp+34EHbRlaYzNi/jIAOHn1fRmgT7GrcTuysd95cY1jTJp
	2hYDpVU0QM/VSyF5ua2YjVuP2Q83g7RBrlsAiORdSJYwpIrpf4LWCt/o9DUVHORBDQ7nGxhrygP
	+9FLLqxhptK+foN0E8qPq5fPJCosjiCMAzNsZx73/dyxawFfwk+LFKNov3zF92CSdsNVNGq5n+H
	bS0bkb4UU4q1AIVUByuC5ZxzZcVnobiZpKVYDGsLP2jBRAzR3+E4MKZO5My0GSDT68wN0k8mi4a
	nxRGXy6Ap3JGNOJdllVhstEsKStJU3qQS6aTAaIcOMXrWBj8hKtXQ7Mc2TBeoSqhvaxWGSZcmRp
	69iFK8lJTt2xIUFYEekdhgvyn8/OS4fnzDcs3MRTX+xyNd+bBzOZICLgq7lFMN0/1Xwh8UKGbEJ
	WKHeuZ2VrlIXaHrxGTJp84U=
X-Received: by 2002:a17:907:d8f:b0:c29:d31f:7d73 with SMTP id a640c23a62f3a-c31a9fd5dc1mr1304257866b.9.1791918219119;
        Tue, 13 Oct 2026 12:03:39 -0700 (PDT)
Received: from localhost.localdomain (94-255-221-162.cust.bredband2.com. [94.255.221.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c363d61243fsm182695366b.6.2026.10.13.12.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 12:03:38 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v4] net: phy: qca83xx: read resolved QCA8337 link status
Date: Tue, 13 Oct 2026 21:03:26 +0200
Message-ID: <20261013190326.51893-1-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
In-Reply-To: <179183374827.434549.12054936309141943394@kernel.org>
References: <20261008193515.14880-1-yongzhao.derek@gmail.com> <179183374827.434549.12054936309141943394@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 12 Oct 2026 19:35:48 +0000 netdev-bot+sashiko@kernel.org wrote:
> Should more of the link-up state be cleared here?

Yes. genphy_read_status() has already filled master_slave_state and
lp_advertising for an up link by then, and a reserved speed value
leaves a concrete duplex. phylink is not told about the link in this
case, so only ethtool sees the stale values until the next poll, but
v5 clears them anyway: duplex, master_slave_state and lp_advertising,
as the PHY_HALTED path does.

> Does the QCA8327 internal PHY need the same fix?

Possibly. The AR8327 data sheet (MKG-15791 Rev. 1.0) gives PHY ID 2
as 0xd033, which matches QCA8327_A_PHY_ID. It documents the same
PHY-specific status layout, and SmartSpeed (register 0x14, bit 5) is
enabled after a hardware reset. I found nothing for the QCA8327-B
PHY ID.

I have no QCA8327 hardware, and the failure and the tests were on
QCA8337 only, so v5 stays limited to QCA8337 and says why in the
commit message. Using the same function for the QCA8327 entries would
also give qca83xx_link_change_notify() the resolved speed. I think
that should be a separate patch, tested by someone with such a board.

The model test now has a check for the state left after an unresolved
or reserved status, and v4 fails it. v5 has not been tested on
hardware. I will send it separately.

Thanks,
Yongzhao Chen

pw-bot: cr
