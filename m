Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22563CB2DC
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 19:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791488117; cv=none; b=oHvtdnqQWLjEXzSw+gsSy5bk21bN5z7MBJMjaAZ21wZcdmVkrp2vvzXJBamKH54Xrl8DaB15rMO5vdsp96LUpeIT+1rZc+SateEa75wEXVq6agu6hH+xrMXUoQfj2jsOu+iE+X/G58baEViq9HjiivXPLU32KjolIZf6NRoECEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791488117; c=relaxed/simple;
	bh=fpC1Eme3VEz18Iit7OxfXGD+XO5w8Dx1LlQClNa1prs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QekG9+z3cSLcbrRzcnMZP64Ph2vCOnNdxdv2y9HhwddDytBt5pXEYhIQtdV054e39hYyZ86PQY+uXeu3XRkOU/vhttvcbAzP/SuxiWuxLnKuGwCI4Kx0RWyzIed0hJeyPLE5Us5x7pKbUlD1xq/3HxXnlXcB5qoOIvOPipoLf0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hh6mZ6Ye; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hh6mZ6Ye"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c3156e7705cso679530666b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 12:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488114; x=1792092914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fpC1Eme3VEz18Iit7OxfXGD+XO5w8Dx1LlQClNa1prs=;
        b=Hh6mZ6YeeckXZTR898XQjBmLEGbeXw18sCPz7rrAH0DuUv+vdP8pbPif/pDiYRKL7R
         nUPe5AtsHFadO2iY1o8pqu5SCzUVNgD4X+et6qr7dTpucw+MSJrrVQ4L50I5CWwtLInN
         hS/6ObJCLQaAXVo2sMtLURdBW6mjJ3cENnPLWDoB7niy7pUeyTxHM/BWFQu3vgpEtbR5
         sczdqKEJliAQWLjKI3px7mufo3ABznZ6gcRmvhOW7Eqz5aKQ5slIv5w0vOSc6XReXirn
         9GhND3HcpCqYNB68PMFrc5oG9/9dswu/4byiZtoVS/oXVtGtIk+5V3t08abYwQP1n5TV
         k1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488114; x=1792092914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fpC1Eme3VEz18Iit7OxfXGD+XO5w8Dx1LlQClNa1prs=;
        b=dTqwQaiuWg3NnQNn1Q03odFC00lbRj95dX0O3xer5nPvbM6Ms0ED9AL0xiI5STdPaI
         FuF5JRRoh5DlV/qdW1xAX9zfg+QRwd72cdSvRuDaAsQKok8Ekzf5NQwVmQ/+ldp6vTUe
         fWL/wGuGkdYfc/s35VOAcWVtVj55qWU6E/eDz1fOmjJzOXxQzAP3w3rThJNFUcq9SvnJ
         oZAHtu5uh6Y/gi0e93Ozj3VMVDP1yoP4d46ZefoeyJM/RNFTJ6/LEW1tX3j8hfaPP9yY
         6JKcF5Pk/XDt/6AwkXRErA6REnIBrVKH4PMmoyrGifFTg9APzxMCukOxzWZaPwGeft3S
         dJTg==
X-Forwarded-Encrypted: i=1; AKwUvBzDWzTeiTITToTap44AUlfUeNoYzh89s5qXwnZ3/yHhV/CsPKibZ8RwAol7SsC+qWntm+mkDyY+8MAAVPGE@vger.kernel.org
X-Gm-Message-State: AFuF++nygFqTPkgTX8GiLTyZm7Q2ft+qN9sTdWaQ8HVawAgL6/1YuwtS
	6us/KQbZb9RB93+I+7OEdK3g5qC6AdzBiy+KcmUBFgExRuD11tSsfkIz
X-Gm-Gg: AYBFou3Bo+ynHyDJzr5AwTEl4i8TS2ccARciP4AHMEhq4xEBB4UO0IwmcjAbDIZGOTd
	EPaI+0eoiTCyPLnonoSnjz5CS9wEunGq0CwdapobmhD4eBxu/5pAzoCxQ+i1qDixOvtx3tp1a6p
	iTQwXlh5IEXiALa58aDEclxnQjnF4AJgbR6Dj0bTnGq0ansPsJt31FDLMxuk0I3UEK02B6leDoz
	ejWK7FSaKG+bVOiKAi4SFgiA/n6spk5FcOvpdCRbgUi4ZY0qH1NwXnd+//H2J1vt5vJXfqCCheJ
	vi3PuH5JeXaLwZVt1bdvRcjfVpcd1S/AG4OCy3YLj/n6YCtWSHg/aacHNxmdQPSKnPmD+3OtMLL
	xwInGQ+yDVGtnrA/yEla4pVrIYq6xk4wdSv6wXzblgseaLd9LWKeCpawDhHei3o7JCjbRb5tcyH
	sYXBN2+iY4fMK5nHgK8M0xN+eEcb5tWAyL2fe4wnwhHDNqi/mWRIlnPE8yvMO9LRg10cd4hpZsJ
	SyQrFsxJmZtD/VL7dFlrZ9km26IOBlRMHDEIquQZpN/EZBE7hMKK7b8UkgDOajkZ7RTpAv00qjn
	J86dA8NgPZCzSSZCcopjn34=
X-Received: by 2002:a17:906:7316:b0:c2a:fd39:f231 with SMTP id a640c23a62f3a-c317c094878mr682956966b.26.1791488113806;
        Thu, 08 Oct 2026 12:35:13 -0700 (PDT)
Received: from localhost.localdomain (94-255-221-162.cust.bredband2.com. [94.255.221.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a4758795sm10017366b.5.2026.10.08.12.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:35:13 -0700 (PDT)
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
Subject: Re: [PATCH net v3] net: phy: qca83xx: read resolved QCA8337 link status
Date: Thu,  8 Oct 2026 21:35:00 +0200
Message-ID: <20261008193501.14850-1-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
In-Reply-To: <179147542415.434549.1369676326541511457@kernel.org>
References: <20261006160316.1356-1-yongzhao.derek@gmail.com> <179147542415.434549.1369676326541511457@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 08 Oct 2026 16:03:44 +0000 netdev-bot+sashiko@kernel.org wrote:
> Suppose BMSR shows link up and autoneg complete before
> AT803X_SS_SPEED_DUPLEX_RESOLVED is set in AT803X_SPECIFIC_STATUS. What ends
> up in phydev->speed and phydev->duplex in that case?

Both points are valid. Thanks.

In that case v3 reports the link up with SPEED_UNKNOWN, and the early
return in genphy_read_status() keeps it that way until the link
drops. The reserved speed value ends up the same way. I don't know
whether QCA8337 can report link up before the resolved bit is set,
but the driver should not depend on that.

v4 follows marvell_read_status_page_an(): if speed or duplex is still
unknown after at803x_read_specific_status(), it reports the link as
down. This driver has no interrupt support, so phylib polls the PHY
and reads the status again on the next poll. The qca808x approach does
not fit here. The value it falls back to is the advertisement-derived
speed this patch replaces, so after a downshift it would keep
1000 Mbit/s.

> Should mdix also be reset to ETH_TP_MDI_INVALID when the resolved status is
> not read?

Yes. v4 sets mdix to ETH_TP_MDI_INVALID on every poll except during
a steady autonegotiated link and reads it again only at link-up. That
covers both a link drop and autonegotiation being disabled.

at803x_read_status(), used by the other AT803x PHYs, clears speed and
duplex the same way before it calls the helper. I have not changed it
in this patch.

The model test now covers both cases, and v3 fails them. v4 has not
been tested on hardware. I will send it separately.

Thanks,
Yongzhao Chen

pw-bot: cr
