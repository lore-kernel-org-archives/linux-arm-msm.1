Received: from mail-ej2-f22.google.com (mail-ej2-f22.google.com [74.125.228.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5588751CF44
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 21:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790803444; cv=none; b=qLnRY+HLFTDx4pR5wAshudOhll9xDj476Lgjs4PwjrUBBz0ujsRAjjgKBg1xr8pCGV/SCEj/3nsl+dWixHkOQ6bTpFVcIILSC5iZkem/G7zfIEsHDmpaVywMwsykICjtFSBxkIGkvShY63TVOyRLO36hqDtckYbhHfulwYJbFTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790803444; c=relaxed/simple;
	bh=ql8LGLP+FbssYsb6X9SkqbxuRTizCwXQDy7f/v3NOK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bGfnjbARu97u/8NLrha8Z/fo4Ksc5ykdD/t2RzYJWf8u4LlPxWpr1i4wXPTgGDsKrQtyLcf1FXSOMz34c1Pw1YZTn03DU/GkWts5onwwzZavccU7DdK3CCzE8ZlIo9wYpP5emd6iLDGnNjI3UW/9ZGeffCd+7Lz7PXB1rdyVugw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R55/N2tl; arc=none smtp.client-ip=74.125.228.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R55/N2tl"
Received: by mail-ej2-f22.google.com with SMTP id a640c23a62f3a-c2e17e5de00so216126166b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 14:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790803440; x=1791408240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ql8LGLP+FbssYsb6X9SkqbxuRTizCwXQDy7f/v3NOK8=;
        b=R55/N2tlfKi/TzSJhou4ccC0LR7owi5hDDjl6evHqBcCduqk+EaL/+brIlxBExLovy
         YK0/3s5tky7xOoZG+ezLUxZcnDsgXxOJTo2G0x37Bvk6rdgY6x1JoUpdd4iUDiLs6ISR
         aShW4lhXjcfqBRo811fxIXUYCe7tPwxp1s4+jAQooWEh+P3KF9+uFc/Lf5R73gwlBnb1
         ruTqAKp0yiWsRKDCtlRpvBzHO8/tx3bMjg5CuCSzazk3OkvHLPwW0DTJbTC3ZTZ4wd+m
         XgD7X+bHeOZ57XpSNz7gQHGxVYeBGkH4rzY9Pn3MOc5z5a/hDIskQw3uGQuvh70Jx6cm
         NlbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790803440; x=1791408240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ql8LGLP+FbssYsb6X9SkqbxuRTizCwXQDy7f/v3NOK8=;
        b=ZXfotqkdgUxTCMEDRCNr8iIW0glh6zdXjRw3ebNTtHHphauMFtWE/RIpo2hTY2o1Cv
         41AhlpB8yNx9XLtTe7UszREhX89YqJciTMGoJMedFKD8MJpRYydcl7otiHmWZbnBA8lX
         d0Q0txWlZ/cmc+G0ll1Tyni+HAFoAwSEofvxr0mIW1GJ70hdYvYXq7Lp95ieFM8Xqus2
         0Bk3A8uoN7xYp7VHCobe7qeFN1gX3e3WXoOrLq6LfKTyGkYObwZ4qlHB8QvOVoV9Hd8y
         UBloWZ1LsyKVi4yYauDwnoRP8tO6YUUYwLjBKyg7Iq84ybkPUsrnH49ceCpdiepPh+rk
         CWVA==
X-Forwarded-Encrypted: i=1; AKwUvBzEXmHG/zx5mVDpI6NYq30lc5rz+ZRO2D9k+hOSFIhsIv6DpANu13P3HnwhPXFyf/liYFvmkA+wK6htGo8c@vger.kernel.org
X-Gm-Message-State: AFuF++kBb75WkhtCOCiOKFfDH5nQtsbfOYDKeKsFN5b+/3AGMauK07Gk
	cItqhn34yzDZUSsNJI39BkUlntwrokJ1ETVMMhR9S1aE6pctt/pk/shC
X-Gm-Gg: AYBFou2V9ez8slzRFRAcLYSlgSpckO3ZQCmn5dHmqeJcKzCLKDDhBnFvC7Qxnq2YDsO
	MqJhRhKyy6s1+I+RHT56/yoifS8YsDeTNSUwV/hbJc39uWiJ7H3xuxNiNeXsfYi3esQO/5xtnt0
	pcYoDOr9LZWza3adxe93DJVNcDbkkfRsAkyjFInfdORMW6SFSkJ4Ar0kQj7+KaF4DQ+NHMlhDVS
	IxzmPLU4G1gDj94u7nuGYZvP3v43zYi3Ke1SHg842M7nZmo5OcqJLAS0zBJu5j0zmt+mPDmVIpP
	b+vWDl9QrIuiVLC7ftsF0l0oFxknyC2dyZse6WzmM0Cd5AA+YX4KWpoQdlaq89qSWmOmMm13L/I
	7RLKV0mam30BXGm7Fnn9fCG8G0zijoaJ+UjTGIML3yGkTgMyBqgjwRLdIaYZrKd/arXrNRzGG2r
	Nhimj+ZQotYO8C08i8ld/kTvfLR9vzdGVfS086cmmVn6Ml5EOxM/zQySwY9hXN0rkMyjxGPvtaB
	8QL4BJM2MkJHKodBJlK+/CeyY7c7ma0oXg20BB4IBfSgRGdvxV8L+OmpYzz/xH4aq1DHFhUJj/e
	3j1//TfBvF20qUemAq1I93SHSukhm5s=
X-Received: by 2002:a17:907:72d2:b0:c2a:fd39:f23b with SMTP id a640c23a62f3a-c2e23d6425emr246236266b.24.1790803440171;
        Wed, 30 Sep 2026 14:24:00 -0700 (PDT)
Received: from localhost.localdomain (83-233-221-82.cust.bredband2.com. [83.233.221.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31d867ffsm57071466b.59.2026.09.30.14.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 14:23:59 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: phy: qca83xx: read resolved QCA8337 link status
Date: Wed, 30 Sep 2026 23:23:47 +0200
Message-ID: <20260930212348.1919-1-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
In-Reply-To: <01a62e77-6c4e-4665-ba46-26d12b1c77b4@lunn.ch>
References: <20260928220749.857-1-yongzhao.derek@gmail.com> <01a62e77-6c4e-4665-ba46-26d12b1c77b4@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Andrew,=0D
=0D
> If there is no link, genphy_read_status() will of already set these to=0D
> _UNKNOWN etc. There is no need to clear them.=0D
=0D
Right, thanks. In the next revision I have replaced the custom decoding=0D
and state clearing with at803x_read_status(), followed by=0D
genphy_read_master_slave() to keep the master/slave reporting from the=0D
generic path.=0D
=0D
> Can this really happen? BCMR says there is link, but this says there=0D
> is no link? What does the data sheet say? It seems unlikely to me.=0D
=0D
I have not observed it on hardware. The QCA8337 datasheet (80-Y0619-3=0D
Rev. D, p. 328) describes the resolved bit and the speed/duplex fields=0D
in register 0x11, and says speed/duplex are valid after autonegotiation=0D
completes. I could not find anything there about the ordering of that=0D
bit and the BMSR link status across separate reads. The unresolved case=0D
in my test was synthetic input, not a state captured on hardware.=0D
=0D
In that synthetic sequence, at803x_read_status() reports link up with=0D
SPEED_UNKNOWN. If BMSR stays up when 0x11 later resolves, the speed=0D
remains SPEED_UNKNOWN until the next link transition. So switching to=0D
the helper does not by itself answer whether this state can occur on=0D
real hardware. Is there a QCA8337-specific rule about when register 0x11=0D
is updated relative to BMSR that I should check before deciding whether=0D
this needs separate handling?=0D
=0D
Separately, I have not yet reproduced on hardware the case this patch=0D
targets, a QCA8337-side SmartSpeed downshift where the old code reports=0D
the wrong speed; so far that difference is only shown by the model test.=0D
With a two-pair cable, the link partner advertised gigabit and then=0D
withdrew it, and the link came up at 100 Mb/s without the QCA8337=0D
downshift status set.=0D
=0D
If you know of a link partner or setup that reliably makes the QCA8337=0D
side downshift, I would be glad to test with it.=0D
=0D
Thanks,=0D
Yongzhao Chen=0D
