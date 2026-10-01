Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7BA51CF46
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 18:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790878614; cv=none; b=ajAStLrRHJj9aPqksFcsA20reFscbWoGcSA21aK/GElOJp+bZmSXyYtWs0ARlSyWW+6aUeeRpDiTbsm60XFDB8odpk4vrDunW0Q5yLX1lTnfVry2l9DsYvnreeRoDAF6kb03Ta81JaDI7BxxFC9zKmW5BFOf+oCzMwZBrl/NmJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790878614; c=relaxed/simple;
	bh=lOPOj+hwF6beZboxUTFoQZFJWeAVApFzXJmPkp+2yg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OW181xk0ZEM4VbRe1/7ql+g6WiRuvXHVySs1MfzNVwbTabIqzumyY5y+lwQ5yWiDAmrCX6h/AtQvucQEZ0Hcd5l+tfy99zqEbXdv71SlCoRft2WTvCUSzxDg5YFY0vXi95hgEazJHcLqqBZmAyMFMNG01ywPI7Loc6gnC9bToGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBQmKyOj; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBQmKyOj"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2940ff2313so253865566b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 11:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790878608; x=1791483408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KDC4rdNZesiomwhC/lhVAYuLfkFarU9M9nfZVO8sWNg=;
        b=WBQmKyOjsmmA4Tap6/hyxNZlKBS79UEwefP31nPOsmzWh//0xS8bMnE4E2RoN2lO9p
         I9MUJaE2wkip4Qt4rIRnwg/nE7xfAronbGnCvAA3NtpBudLQM5Z7doiZY+fWUkD9ORgc
         GwE8HTlKx0YldZew5l6kLAGQs+ibrSsodqZj080NUSaoSkCaRm1r7XY5oY75TqAckFrA
         0xOo7KNoddsOI1uyiUtyfE1UIo9hlb4YmJTw4InGl3ZYkIX81rk9iVgl6Wvrr5Gtg+LO
         qmbNY471/beP6bXkvfNHv86YWQHWoQ2G+bhbYoGaEZtBjRyOvXA/7rkFeBX5ctmqVsr4
         2IYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790878608; x=1791483408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KDC4rdNZesiomwhC/lhVAYuLfkFarU9M9nfZVO8sWNg=;
        b=2Cj7W6bF3E1CGKruH2VEEiknFQfSLYTmOXu3Ze1DpEABVZYRWe5hzxy6HI47+GF83S
         wfBQ5+uFSdUNF8ejNYRhYtGsBDGwMW22H7NVnVq3whAHmoryxQU5QcxQi6rL/iNuKnvT
         gfrzFw8MrEMa1xZuSnEw1dmYkukvcugIpCU5k9aoQ+l3eNX8VuO4FIuEDewUVl0Zfaot
         8ibDUUAFBcbrYbFxMysdKf5XYJ9g3j4mNrveb7SwdHGuHFOm6+BZjrf3mbP5jqYgdGjZ
         FAPeALeJr/1nxh7AdCM7CXQd/x0we9jgKjfWnlajNOd+CPomsXiVfbWLB+mXKe7mHnep
         gCuw==
X-Forwarded-Encrypted: i=1; AKwUvBx/I4JzFAVSJeJ2dD08IrFpI3yIRalmQEtWwlwu2JaP9oH7JjAmk3nf6MP/NBJFzWWfw4J+JWhTjCcN8AxG@vger.kernel.org
X-Gm-Message-State: AFuF++n228+81LN+nxWWcw1D93A2Bw1nWC9uz9i/K2MGX0QR4obAiM0i
	Hy9kTfCiy+w0JoxFICNT6d0r8Q4dsMNQTOs5rNTdlMbe1x+8bVQI2xVA
X-Gm-Gg: AYBFou1yx1OggbclIDq5+cJNBSWelnvrku9McaUEROyLJ69Vd0JEt6nNEjFiDubgcUP
	cwhyuBqeoUuch9H3FYGIq2rxwbA0d2tcMQu7BHuGuE8SFecZxAz9BxhAwsI6p6Nty1HABmSYpjy
	TgbNY78u09JWwPcOaW+1h6KroLXfk3uYVbggCOSbK0XqO/H8S6xoiKcPHTt//yxWwvnXTsG+OgN
	qQ4qwg+sAz6DTb/Qis976gt6K784KQODajOQKaBXdQxbzVfY4FEyqGfMq9dAkS5rzHhlRxP5Nf4
	OdkiEr6Y6Z/gTk0W2Qiuh6zFxpI4YNk/p0u5pAVLwVti7gmRTR4L/Bln2t+vlX+rYMDjtX4KF/I
	6tkFyWWIIQA8+ogC71LrCpjFOzNyeGq0yKk27sKTZatZPTyS3iqCRU0diebT0+PIDU5z2O1oruG
	f/mQRmVrRKKdFU6O6tzebF6cR8eSKkL/D7ul85VpGHXI43sw3LdGffnFCJsK2eSYQZKz2sc8fIJ
	zBsb91sbl+BBmQrD2IPsB5NLliqPeRYWM5VEz5bZx3rorB0JP1Ayz2SGw==
X-Received: by 2002:a17:907:961a:b0:c26:3377:752b with SMTP id a640c23a62f3a-c2e4a8cc627mr38686766b.3.1790878607525;
        Thu, 01 Oct 2026 11:16:47 -0700 (PDT)
Received: from localhost.localdomain ([2a00:1598:d39a:9d00:1d5a:82f2:e8dd:65ef])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf5f4e4sm1916866b.42.2026.10.01.11.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 11:16:47 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	netdev@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: phy: qca83xx: read resolved QCA8337 link status
Date: Thu,  1 Oct 2026 20:16:34 +0200
Message-ID: <20261001181634.1508-1-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
In-Reply-To: <2ea832eb-33f4-4bf3-bdba-5d983038d012@lunn.ch>
References: <20260928220749.857-1-yongzhao.derek@gmail.com> <01a62e77-6c4e-4665-ba46-26d12b1c77b4@lunn.ch> <20260930212348.1919-1-yongzhao.derek@gmail.com> <2ea832eb-33f4-4bf3-bdba-5d983038d012@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andrew,

> One thing you can try is to set the link partner to only advertise 1G,
> not the lower speeds. I've no idea what it will do then, but you might
> get into the situation you are interested in.

Thanks. I tried that with an Intel igb link partner and a two-pair
cable. With only 1000baseT/Full advertised, the QCA8337 set its
downshift bit at times, but the link did not come up during the
observation window. With the partner's default advertisement, though,
the QCA8337 side did downshift: it was not advertising 1000BASE-T
(CTRL1000 0x0400) while the partner was (STAT1000 0x2800), and register
0x11 showed the downshift bit set and a resolved 100 Mb/s full-duplex
link.

For the subsequent old/new comparison, I kept the partner's default
advertisement and used one OpenWrt Linux 6.18.52 test image. A selector
switched only the tested user PHY between genphy_read_status() and
at803x_read_status() followed by genphy_read_master_slave(), with the
same tracing in both paths.

In both paths, phydev->advertising and lp_advertising still had
1000baseT/Full set. With genphy_read_status(), the driver reported
1000 Mb/s, phylink passed that to the MAC, and the MAC port status
register read back 1000 Mb/s. With the new path, the driver reported
100 Mb/s, phylink passed 100 Mb/s, and the MAC register agreed.
Outside in-band mode, qca8k_phylink_mac_link_up() in net programs the
port speed the same way.

Each path was tested across two warm boots and three port down/up
cycles, and the downshift was present in every stage. Ping was 0/20
in each direction in every old-path stage and 20/20 in every new-path
stage.

This covers the resolved downshift case only. It does not show whether
BMSR can report link up while register 0x11 is still unresolved, and
it does not change the SPEED_UNKNOWN limitation from my previous reply.

Given the traffic failure, I would like to target net for v2. Three
questions:

1. Is net appropriate, or should this stay in net-next?
2. Is 272833b9b3b3 ("net: phy: add support for qca8k switch internal
   PHY in at803x") the right Fixes target? It added the QCA8337 entry
   without .read_status; I have not checked whether the problem
   predates it. Christian, as its author, is now on Cc.
3. Compared with genphy_read_status(), the helper takes the forced-mode
   speed from register 0x11 rather than BMCR and adds MDI-X reporting,
   and the added genphy_read_master_slave() call runs on every poll. Is
   that scope acceptable for net, or would you prefer a narrower fix?

Thanks,
Yongzhao Chen
