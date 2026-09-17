Received: from mail-ed2-f3.google.com (mail-ed2-f3.google.com [74.125.228.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2CB391513
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633279; cv=pass; b=mB7orAAWr3CA6NKcofqlzk4qdEMtcFh6aXXvNC9jLrG3dWnzU26pPUQ2bzuktionKFUqPgKtTmYRNFU+oOpztxPqaN727MRmn6aWqZ9S2ZeZpOlCYnDr5gtFdsW8Iw6vscMcNRNG8jHH0YiNftkuPvS91RViFYS2jmqgP85Fu4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633279; c=relaxed/simple;
	bh=Mt2nG22gQ2VlhRCDsFPAMB9fHywKLlkANeCXC+o2mY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=adYk0vEwPHZ07dfkGD4rduKEY9P1la/qk8eqZZ9Mhm2Q4sBaTcf6nOCknJLbwyPS8KY3t3zPWNi0tzgj/NbkgO3ecZyqF1bc6qLzc7JRLiIpruA+3uQ/DgBpbIv28SECwSil2B7h01WWu5Mj5U7rzGZw74GyLHWNfaXPepDPJP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LkNgSj6j; arc=pass smtp.client-ip=74.125.228.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LkNgSj6j"
Received: by mail-ed2-f3.google.com with SMTP id 4fb4d7f45d1cf-6a5d1305572so41701a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 01:21:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789633275; cv=none;
        d=google.com; s=arc-20260327;
        b=PGkl8G4XxVZk8bwjifFTyThFF5fRFk37CdLUEqAORCrQ0Rn3/cZbImKx16kofkGq/N
         cFnNGqI/fbzDcz+CFi2F25atmTQblriXPRaCBpepWkSFezDeRS/6VLonihXpFjLb3z5F
         Li9Qmbfj/MIZCk4/DIVBH3ZQ8A56avNHRhYIIkMAlMEXa7OPg0n7Sxevk9qdgY3LZK9M
         uLJw+HDMwO+SXPA95ZwN3pnTXHsPL+MlCq8OQRiY3rsWx9jOFbziMNCO6sP3aK3DnhqN
         YFtG6thT41XcD1ESkU0LVT/0GOWrrXwJe6/PpAlhvrUL9X10i7ZXlUISlSV8PeYXovNt
         YrRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mt2nG22gQ2VlhRCDsFPAMB9fHywKLlkANeCXC+o2mY4=;
        fh=xWjrAUZtMG7DDUYCZN/bQcp6Mg82fx95WMDjsJrBI7c=;
        b=fQbVbrHS8eRAb3XgSpYKR3hF8sxg+mGEyxynGc352xqh/Hahh4i1eBKcJMIZXDIUSK
         BXOWXy9ycjfX/K5s4ueDD1dhCuNQJCEpXhcZI53hBOKB5iB83zbDUXC1JUHZVpDVq6O4
         DmtCgdoAX62UTHt9EsXvX99U9xoMEriWGv0a+GSv227l4ylRS1c4X6tZj9fymp6QPZ9v
         CoeCcx1NBsjWTMZd7sUiwMqnXQ+T2bhGTPrsROAuLo/5z60Uz8JJnmyzK9IyFOYCNln4
         tBNq2dQ2m6C2quUQlznAGtcS5fkmxymBdOVnlTwGmC0NRW6qrqoE/+LAdv/4YGEWRBef
         qqMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789633275; x=1790238075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mt2nG22gQ2VlhRCDsFPAMB9fHywKLlkANeCXC+o2mY4=;
        b=LkNgSj6j1mh+t4RwWFqK0oZGmHByGzWfcY/zg1MYPjx1xJGUsm3Levzmg417PBZ/GX
         lS4n4bDiQ7tLC+iV/ptYNIlTQKgCmtD1qqq8DZwX9nwKvUybD/WxwuNLq4XlqOFraN6J
         e2pkajBHBVhw76hnQuSRkrcUSmYLUl2cuqQsGypWILVEmLEgyVf7iCYEaFBHfJOGlAVO
         OkhaajhhQu9KyE5sB+km8AUYGVWRbxEDjZUgMUXB26aVb+rynQUFpvOtQ6Q6gekDOdPp
         PhRf1Uhn6Mpea/EwRT/oMizBfmS2ibRJGktxgpXutOxCGzD+nfIksnWachRymFwffUsd
         RH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789633275; x=1790238075;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mt2nG22gQ2VlhRCDsFPAMB9fHywKLlkANeCXC+o2mY4=;
        b=BPe4WQ18wM8hyAWaLXo4RHzymylAyoNN4Rp0ES1Buwt/vI6CTCOR0yIhAlbMLaeTCf
         8LrUwfJ5ZaKZf3NYZEfFlSGdE5LAtNhCpVVtKH/9So18dkD8UhtBDKFO5WN70Rzty5St
         a0qYqgjQOEMbtkus1GGDKBwaZCapjn7WBhkjI01NLPTYYzC3dVrAcd8/vgDqsfUFAfu/
         sWk1Fma/2Gtm+oM2WfSGJIxRkE02QC420/rUAinz8YZM5pTFGevk0M61WdfCFHxLMn/c
         RCg3kF+3uP0SP1TfhcC/sLJ5Xavz4opDciSui420Iw4GjJMGUf+EmDryJMHL8hWKejn7
         Bjaw==
X-Forwarded-Encrypted: i=1; AKwUvBwn2WklOSceC9Y1x6NER7jFj3DL0MA3VJ/CJC9l0LrFOjIRDJTgLxOyrd2LlllNCbqxFlk4CDXHaT6q9w5Q@vger.kernel.org
X-Gm-Message-State: AFuF++ntTcRS7GQoU+ml45aQNlCRYAnQZtVKAtH6o5fA/2wP0gPq71rf
	ja4wQFPJdvHiJs/Oo8S1VfYcxMNmZJm1HGBYWOG+2Xwxs/gYwmU6mIUQj/bHfqHkDjKTzlUBtzi
	FqDFHN71BRwYjOsCJ3J1VTwlNy0arUtQ=
X-Gm-Gg: AYBFou2Pk3Bo38iKwKAjd8kycWmFCqHI1vsmzJbUqatXlNqVPVSW4lNxDgGEnCIGFXJ
	QWJnWW/KBY3RhJErBvGmBu8/845BdKtA3vQH8jImOK3loj41mzmU6E9o8gpXE9Zu7gqlXsHS6Mp
	sp9SZ2/ryy+lyrTKsNOo1DB4ICdauOoq04nwdCiej1GwEUSta9PwDJkjIwV7pklB1PKjV/jF2EH
	wwtPmOBW7PbwWDp3jjyjgaZKDfYkqRl/TdfjQR9qGMQVYMuxau9p1welr78Gg3xbLgGTPaF3cFy
	NgCVpZWJ3IiX5IDT+6y7s4ivwxMcWcAdG70YSJCvi7hzR+0MWheXlj1ZXBI8sLbixRE96w==
X-Received: by 2002:a17:907:3f11:b0:c25:35cd:fdb2 with SMTP id
 a640c23a62f3a-c29f526dd2dmr190379266b.7.1789633275095; Thu, 17 Sep 2026
 01:21:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CH3PR11MB8413FCBA598F7FABC04ADCFEE4B92@CH3PR11MB8413.namprd11.prod.outlook.com>
 <CH3PR11MB841353E5708DDD7C5E2EA1D5E4B92@CH3PR11MB8413.namprd11.prod.outlook.com>
 <aqqI9wOnradk9d7K@oss.qualcomm.com> <97924d2f-45f9-44d5-b482-97fcbb70abdc@bootlin.com>
 <CH3PR11MB8413131D50175690DF9FDAB0E4B82@CH3PR11MB8413.namprd11.prod.outlook.com>
 <3bdf2ecc-9dd1-428c-8841-36b1f19916e7@bootlin.com>
In-Reply-To: <3bdf2ecc-9dd1-428c-8841-36b1f19916e7@bootlin.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 17 Sep 2026 16:21:03 +0800
X-Gm-Features: AcwNN1XL07xRu5XXN3J_i5sQYnNCkDU2pPnYaE7rXj6dGCxz8rSrRM8IV9aR83Q
Message-ID: <CALj3r0gXP0+bwsPVtuw=9RRQ6gpmuHzGc5PzF_a3XXXTTZYcqQ@mail.gmail.com>
Subject: Re: [PATCH net 2/2] net: stmmac: qcom-ethqos: advertise supported
 SerDes interfaces
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Thomas Karpiniec <tom.karpiniec@outlook.com>, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, netdev@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Choong Yong Liang <yong.liang.choong@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Russell King <rmk+kernel@armlinux.org.uk>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Maxime Chevallier <maxime.chevallier@bootlin.com> =E4=BA=8E2026=E5=B9=B49=
=E6=9C=8817=E6=97=A5=E5=91=A8=E5=9B=9B 13:36=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Thomas,
>
> +Coia
>
> On 9/17/26 06:29, Thomas Karpiniec wrote:
>
> >> Can you test settung the STMMAC_FLAG_SERDES_SUPPORTS_2500M flag in
> >> dwmac-qcom-ethqos ?
> >
> > I can confirm that dma_cap.pcs =3D Y.
>
> Thanks for looking up :) This is a good start
>
> >
> > I tested setting STMMAC_FLAG_SERDES_SUPPORTS_2500M on hardware and unfo=
rtunately the flag alone doesn't solve the problem.
>
> Yeah, but it's still the right first move. Russell planned to do that as =
well :
>
> https://lore.kernel.org/netdev/E1vvDJi-0000000ArhH-3ipf@rmk-PC.armlinux.o=
rg.uk/#t
>
> >
> > I think there are a couple of things missing. stmmac_phylink_setup does=
n't use the integrated PCS bitmap to populate config->supported_interfaces,=
 so SGMII is still not advertised to phylink as a usable host interface. Al=
so stmmac_integrated_pcs_init is adding 1000BASE-X unconditionally, which w=
ouldn't be appropriate here.
>
> Ok so, the missing bit seems to be that priv->integrated_pcs isn't taken
> into account in stmmac_phylink_setup(). This needs to be added then :)
>
> Looks like there's also the inband support that needs addressing, that wa=
s
> part of his RFC here :
>
> https://lore.kernel.org/netdev/E1vvDJi-0000000ArhH-3ipf@rmk-PC.armlinux.o=
rg.uk/#t
>
> > I did a proof-of-concept fixing those things and the end result looks a=
 little messy: config->supported_interfaces could come from either get_inte=
rfaces _or_ the integrated PCS with unclear (to me) responsibility.
>
> There's only dwmac-intel, dwmac-spacemit and dwmac-rk that use the
> .get_interfaces() API. Let me add Coia in CC, as they're working
> on better PCS support specifically for Rockchip :
>
> https://lore.kernel.org/netdev/20260915123802.1561724-1-coiaprant@gmail.c=
om/
>
> For spacemit, looks like it's not really a problem as there's no PCS
> involved. For intel though, heh... Intel platforms with dwmac AND PCS
> are hard to come by, but I think at that point let's roll with the
> bitwise or'int of get_interfaces + pcs interfaces.
>
> > This POC did show that STMMAC_FLAG_SERDES_SUPPORTS_2500M enabled phylin=
k to configure the integrated PCS for 2500BASE-X and a 2.5 Gbps link came u=
p with no apparent issues.
>
> Maybe the blind spot is inband aneg. Mohd, you were quite involved in
> this, do you remember where we stand on that front ?
>
> Thanks,
>
> Maxime

Thanks for adding me.

For the Rockchip side, rk_get_interfaces() no longer needs to advertise
SGMII: stmmac_phylink_setup() already OR's the PCS's supported_interfaces
into config->supported_interfaces, and the XPCS driver provides SGMII
there. I'll drop the SGMII line from rk_get_interfaces() so RGMII ports
don't advertise SGMII unnecessarily.

On the qcom issue: the missing bit seems to be that
stmmac_phylink_setup() only looks at priv->hw->xpcs and
priv->hw->phylink_pcs, not priv->integrated_pcs. Extending the existing
OR to cover the integrated PCS would let qcom-ethqos work without a
new get_interfaces() callback.

Best,
Coia
