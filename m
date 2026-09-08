Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C2C524B1B
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 11:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788865209; cv=none; b=W1oifInyLqtoqio81rHVFC8jTawGBS/0CMLXv38U7MXed8RZJbxdgtpOEviTddLr4h9247yw1i56Zc6/b86+BPd3bu1tuT3tlHaXoFFPBuT0Sbhv9vT7iCejpfctjvMe06m+J0kEXKiXu7EujGFNBonMiQ5VLTAOLmVy/flT+V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788865209; c=relaxed/simple;
	bh=8YTFKS1gIdMvKjHceC8WCGeaJ3Tt3+sMDQ22Q2fAGns=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hw7EKJys+D6ZhL4ldQH/ItFhxdUFsTwKjyO580d+7zpwrzd/d+KOAOY9W0gcXib0bEeSeG4Qm7IRuqrC5HUX1KDPMQxrf01bNkZPg6w6A+/61r/Rx6Rv08G+nsjrhW/SFJg2kJLyZlOTWEfjTCPqGP043PAwJYL+P050uJz4K0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cm51llJB; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cm51llJB"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-3989fdf58bcso229636a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 04:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788865207; x=1789470007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1MUi2XRPwjF/pI/qfQzJ3ednwuCIXcpoQGAgnhFM4yc=;
        b=Cm51llJBwwH6bylDW76pv6mAUfDU/KGJ88yPfjK012uqO95yJGtNlbFma73w+QZUpt
         W3Ffslrfel3x0+9oi2sGPioSjbUjAh4lXyVMMm/P+h3+LaPAY5RdlA8wKGUxDDmhDAWl
         NSkgi7IPb/dJYQmq9xBvxhkjxKU/NhhPatGqAHlCmD0YF7NrqQg5FNs+kU6fwqWgOhKc
         70W3OlaM0yF0dSis+cX9IYV4jAvuAis2mNG8GKjre/imOsRhvUtI6mmX0V9Nw9PgPejB
         N1XoR06cdb09boT/iCkZrpXcJHd95Y2A5uLwbuAcMSkahW/iJwJSDI4jrEe7C3KC8Cz5
         vwXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788865207; x=1789470007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1MUi2XRPwjF/pI/qfQzJ3ednwuCIXcpoQGAgnhFM4yc=;
        b=hUggM1yCulqUsn09z9vU3yrg3mDPnwyycdRFyzSQFeDGJeEGWd8s0KqstY+pCCCulU
         zDovjtSq7dXgesYXvmuVljcoLJC6o2uvvVOt8QvP/Bti48uqykaIr2hnSL7sW72TPu7L
         U8oh4FvCpIa6bO+qVOO+ama6CKkQEF+MAFhT6njqMv8RJGvXHn2gzLvwTvBO+9jExbJN
         Y4kA3wmEfvg7iNYZZVBguwmLjgvaFGj4/ZZgdxncy7Lg+L1geikmz9EASkSvsMnEvQTY
         rS3iYuuzOPiTuLIfAulqViZ+9vvwEkpEZjg6Ivf2EY1VoVwdURbYc8k9dUGGUGFKMM8W
         5t7Q==
X-Forwarded-Encrypted: i=1; AKwUvBw5pDiQ23FdtObazabtiv2fTLPpwJ8MNMMZVbc0AXOJMwpnUNVnvEbgqqBpU9zcrvHK/eO7Bc7uVjmT2BFg@vger.kernel.org
X-Gm-Message-State: AFuF++kC6oabzDMVatmAK0j9q9JcOzLnx4dIe73GYNkHZyGg5XpK2JO7
	VojpWr8TqDdLA6dwmwhFZ/Sx38sbfNCq8Qh4MJIk+deGj9OtSysvveE=
X-Gm-Gg: AYBFou0Myc2x1GLThGP/rYRKmJTBGnx7JoAVvUATvLowJtzLC5ZRD7CL8OEm5fedfcE
	py5xwdMQiUIqb95LNL04NYtSi76B+lzDUn9gkO93evct3WvDmy10BYAb26PqdSECGWckS0YWcJV
	zFry46FqlqnLm09M+Qh3Z2optugC093oIeaJMEKlp19Mym+zVuYiOelxrpDPzuGdKHgcxwBpt88
	NkMCKfxZazjBHRZCD49PzrlHIfyKvdgMX95Gl2QbV5xXdpNUNW/pRGOO+pIvaskAmpOYETIghjC
	e3zjVYQmcVf0HEzz9g5WKitGvkO31x+W/KrEuY0yjjL3iIFpmQpRj7QYriZccRNQ2xBCnkfkxh7
	YeK0qmKx6Ika8IgR59yBejpN+7IBjKcz9lfGUOmjLYHSXjfHXXV4mxGvh06oV/SqbPXqDNDP+1w
	Q8LZsEGMRguNeNh+HnphiEAy0IUnJ9y622bXRI7icIC8bqokeDQA9nECG9KBUuQ1wAEKPy0ESQb
	feRXe5kAJl2nNNV
X-Received: by 2002:a17:90a:4cc3:b0:398:ba46:1d9f with SMTP id 98e67ed59e1d1-39b97d98709mr1926967a91.13.1788865207066;
        Tue, 08 Sep 2026 04:00:07 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:f6ea:9d29:b387:9ed5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08cacbb0sm32429842a91.13.2026.09.08.04.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:00:06 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: linux@armlinux.org.uk,
	daniel@makrotopia.org,
	o.rempel@pengutronix.de,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH net v3 0/3] net: phy: handle the active-high LED polarity mode
Date: Tue,  8 Sep 2026 19:59:56 +0900
Message-ID: <20260908105959.70453-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit a274465cc3be ("net: phy: support 'active-high' property for PHY
LEDs") let a device tree LED node request PHY_LED_ACTIVE_HIGH, but a
->led_polarity_set() that only handles PHY_LED_ACTIVE_LOW returns -EINVAL
for it. of_phy_leds() propagates that, phy_probe() fails, the mdio device
is left unbound, and phy_attach_direct() falls back to the genphy driver,
so the PHY loses its driver-specific configuration. Three in-tree drivers
still have that gap; each already programs active high as its default, so
the fix is one case label per driver.

Unlike commit eb89c79c1b8f ("net: phy: mxl-gpy: correctly describe LED
polarity") and commit 9d55e68b19f2 ("net: phy: aquantia: correctly
describe LED polarity override"), which restructured their callbacks to
fix inverted polarity, these three program active high correctly at reset
and only lack the case label, so each fix is a single case label.

The three drivers take different Fixes: tags. dp83867 and qca808x had
their LED callbacks before a274465cc3be and should have been updated by
it, so they point at that commit. dp83td510 gained its callback later and
was born rejecting active high, so it points at its own introducing commit.

Compile tested only; I have no affected hardware. The failure path was
traced by inspection through of_phy_led(), of_phy_leds(), phy_probe() and
phy_attach_direct().

Changes in v3:
- Cc: stable on all three, and state the observable consequence (fall back
  to genphy, driver configuration lost) rather than only "phy_probe fails".
- Drop the mxl-gpy/aquantia reference from patch 1; contrast the two at the
  series level here instead.

Changes in v2:
- Add dp83td510 and qca808x, so the a274465cc3be regression class is
  fully closed.
- Link: https://lore.kernel.org/all/20260903022839.4006614-1-donggeunyoo.kernel@gmail.com/

Donggeun Yoo (3):
  net: phy: dp83867: handle the active-high LED polarity mode
  net: phy: dp83td510: handle the active-high LED polarity mode
  net: phy: qca808x: handle the active-high LED polarity mode

 drivers/net/phy/dp83867.c      | 3 +++
 drivers/net/phy/dp83td510.c    | 3 +++
 drivers/net/phy/qcom/qca808x.c | 3 +++
 3 files changed, 9 insertions(+)

-- 
2.53.0

