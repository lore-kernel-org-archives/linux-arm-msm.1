Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B76424D79
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 10:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467969; cv=pass; b=VUmJlif3zOUS4CFc4/X+ElcMv2/qU/ejXfDVuxi21IiEMs90oeEYehUWyDpIgYdymle6jaW1A7PBKy+N0MorTFuEZPG3pWLMEGlqFWgfR/doN2VYWah4w2vhnRZjLgvbxMzlVbaUx5+W/ADuG8/sb3LwqeZ1MjnC4NH7+3TCbLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467969; c=relaxed/simple;
	bh=JBUy+nz8yoNC+BZ+++kswfX4CT9SuhGl69xtoGeYccI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FtjnyiWMurxFbz5WCQnYiX5lud7xVC8rJxB3zlzOPfv6YhPZmO8HQ6uZ8frAUlSPvnxiefXciP6T3Ak5tWJN7lFNT8EQZ3IcRhnhTMz01CRVmcqz1cwre6CLJZvMPAxe81ywcZPL6znBFrYwoHfPNhCILVF7Me5UhDeccsLcqWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jDeeb4TT; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jDeeb4TT"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfbd148aso33513516d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 03:26:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789467966; cv=none;
        d=google.com; s=arc-20260327;
        b=kcdyHypANygeMJe4CcNjy5XzAW1Cv+xXiv8TzdAUxKFfg+kbomidn/BUgC58Os/K4e
         GePwxY4RpLaVMqlMGyzE8E31/OeLy3YZB3ioXGvcyd/05w01mU8zlj8ghyhHHPmkrFVn
         7n/BpcFmAvkpcCQfVlOCc7dfpJ6Fmber0+mFmUj4FNE4PXQx+01F+j5JQ27nPax8YrOm
         D3bzN9IQlEX8nPHs+D30f1h79GtyOknDpPqh1crV5LrYbr5KXY9gC6XgKKGTrSS+mNs3
         lXOzkZKPeyP2pxdMxtFjdGc+kJ88aYrHcAvdtKAt05C/i9JPgAXiYmKAZKv9FzetU5rM
         IHug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TmqZCDgFfpZ8cNrOODbC41NVyTbNreASHxYyKCFmeq0=;
        fh=LxEEg3AOKL2Xp5Ln45pY+Wlohwq4J3OOs/vcHsx7sB4=;
        b=IGt7+MlP1E1jXU+z87uRxLk7EiOjUmWS2EvMQi2IPaff4qhqMn2ECKG9dZJNh2lWUL
         GDaylxcPSG+sDEAldAMIbi9FdmF6n3Os1l+r9/hFSwrCCTBOxPDqySUdBOTfoKXUxmzi
         d67yR6nc9kJBdZScdzYHFrIqYT5FadwSq3Jso7mA8FSWZLq+jfb0iLHCsotDnOoL5j9c
         hz5HFhFKRkR70rqULhagGYcPY/wDzdOnJeHstwrSb8UFw0UfCK/YRr7OS+3E5rE7ji+p
         DYyQSci9DO9ehduI1kz06eicWtdLKU4SPSFGpPBO2CX5J3z192+uYnEOUb8SDjrPPm+F
         RaEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789467966; x=1790072766; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TmqZCDgFfpZ8cNrOODbC41NVyTbNreASHxYyKCFmeq0=;
        b=jDeeb4TTmliDBWyDkhBxUQ/XHnCS0QKZvC65IAMifHD4q1oUfOho/THOonXqg+p7Np
         E28VsyDwBPuuaXEMNwAjapDB3aXXSMW4FARVzt8v4mrVeefS8WU5DyrM5jVrb/JBWeIQ
         YhkDMevzzlb4lvWLj7kB5+jvZ87PRT0uM0iOhGxqzUsJ76Yrd3rUTfBuWMVWDE/ohj1Q
         v1pDp3ouiORLcie65UTh4msG/vEKed3cFtHOZx5vooM9gOQaOoBPLqlxU7mqvjF5sfff
         gkGYItt+qdsjr6aqvWpLNRFmQcJt9gFEn4P3T++YLHMMt9ULMT9DrsrHwp4U1aKEY5VO
         Grag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789467966; x=1790072766;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TmqZCDgFfpZ8cNrOODbC41NVyTbNreASHxYyKCFmeq0=;
        b=b7a21wAhfl311eVvhhsT6Rpc6brsQPbLXL6zCEXLxNXJyyWTz1RkFBPN2nw4LHKbQI
         Fri+id3LeOJCjKlZj3S834wxnNvZT76VBzidXcPDnjKUSUS+YgYTHp2yQnnsQSnpIrxr
         2R2Ecmxr83EtJlWKrYg1ss4MUuP9T/ANfyVp1OZznsOGr+z76JX7LOEmL+H2OOGNJuAk
         qjyGpW7lh6W6sgJgcuVVRWlfywBOrQH9apuWV4gKbzwReZf4mhaOi3YpNbEiZ095Aw6V
         G5u/9zqA7dUVGDrgtCXRysmGcnmwHaPCr+LpXm/ChderSn+SWgPO29AnbKDMz3Lw+kfx
         1yrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxc9gacwVrUXJWJvmq3jcua44c71RFi6j3HUTmPg2d+FN75/nA9su5HGalGO1kwxKzxGSZ6g4OSRKYdaC+Q@vger.kernel.org
X-Gm-Message-State: AFuF++kkH60NsA+0kTmmTrGsNHCjSldP6OwOez/iLigukyHjsALuZgln
	qVy0aRQJhWyjEQMM79stkMcWpBGRex+EH0l7+XToppjguYp58BUJt1zRMfI+OLs6G/wREL+WXoL
	Z3BbST29awqcdEkX4oKx9zPCj1iCZVo/B3odA
X-Gm-Gg: AYBFou1guu+UdxnDGHaVwU0NwNFaQCXaLyM5smcqBlsDs99KBWybpqyxlIe3oCx0UA6
	T54UeqXXkbZem6fUdhVHh+OUhPQZ6tfOX0qFIm1u2Pn1jAtZM7wuZIjAgqe9qjV72LS2E/8/FVz
	ldpvGoEQp5RjttFuLof43xb+zP6BSkIU3dhJ5x6HseFwsWI9V+4pXeAE3bjsSIHT1W0OkSL57zy
	grG0fh45QPQOIX9GAleDpl0hxttgokiDl87BiJJ5WypkXvdBE2vOCEI/4mKV00C3V32MT7Av7oQ
	PWjVCnWZdg5W3uomsirM+mdUHq6UHU/zN4t2YPbNh1R+su5HIDtDYp1+XX+GEJwsMUc=
X-Received: by 2002:a05:6214:6285:20b0:912:3162:523e with SMTP id
 6a1803df08f44-9123162551bmr69922176d6.8.1789467966144; Tue, 15 Sep 2026
 03:26:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914214720.2467586-1-donggeunyoo.kernel@gmail.com>
In-Reply-To: <20260914214720.2467586-1-donggeunyoo.kernel@gmail.com>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 15 Sep 2026 12:25:54 +0200
X-Gm-Features: AcwNN1U-3EGl1dwa2s6HBcl5buSVBgdBb0MTb6m6SgGCBXYkYsN7vkg0bISTlEY
Message-ID: <CA+_ehUwT_RYztjGJ0P_czx++wxNShT3Zv3JhjQ_eBbaoGQoNRA@mail.gmail.com>
Subject: Re: [PATCH net v2] net: phy: qca808x: handle the active-high LED
 polarity mode
To: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Russell King <linux@armlinux.org.uk>, Daniel Golle <daniel@makrotopia.org>, 
	Rosen Penev <rosenp@gmail.com>, Sashiko <sashiko-bot@kernel.org>, netdev@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno lun 14 set 2026 alle ore 23:47 Donggeun Yoo
<donggeunyoo.kernel@gmail.com> ha scritto:
>
> Commit a274465cc3be ("net: phy: support 'active-high' property for PHY
> LEDs") added PHY_LED_ACTIVE_HIGH but did not cover qca808x, so
> qca808x_led_polarity_set() returns -EINVAL for it. phy_probe() propagates
> that, leaving the mdio device unbound and phy_attach_direct() falling back
> to the genphy driver.
>
> Accepting the mode alone is not enough: led_polarity_mode records
> active_low, so an explicit 'active-high' node stores 0, while
> qca808x_config_init() re-asserts QCA808X_LED_ACTIVE_HIGH only for -1. The
> bit does not survive the reset phy_init_hw() runs first, so the LED would
> come up active-low.
>
> An 'active-low' node needs nothing here: the bit is clear after the reset,
> which is the polarity it asks for.
>

The commit description looks a bit "dense" and took me well 2-3 minutes to
parse the english and understand the change. Was also the commit description
assisted by LLM?

Anyway more comments below for the patch.

> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260908105959.70453-1-donggeunyoo.kernel%40gmail.com
> Cc: stable@vger.kernel.org
> Fixes: a274465cc3be ("net: phy: support 'active-high' property for PHY LEDs")
> Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
> Assisted-by: Claude:claude-fable-5 sparse
> ---
> v2:
>   - No code change.  Rebased onto net/main.
>   - Cc Rosen Penev and Christian Marangi, per Andrew Lunn -- they may have
>     QCA808x hardware.  Christian wrote f203c8c77c76 ("net: phy: qcom:
>     qca808x: default to LED active High if not set"), the default this
>     patch extends.  If either of you can put an 'active-high' LED node on
>     a QCA8081 and confirm the LED comes up the right way round, I would
>     appreciate it.
>   - Say why an 'active-low' node needs nothing in qca808x_config_init().
> v1: https://lore.kernel.org/netdev/20260912012819.2072067-1-donggeunyoo.kernel@gmail.com/
>   - Supersedes [PATCH net v3 3/3],
>     20260908105959.70453-4-donggeunyoo.kernel@gmail.com, whose
>     Reviewed-by from Andrew Lunn is dropped: that version only accepted
>     the mode, this one also makes it survive the reset.
>
> Compile-tested only (W=1, sparse).  I have no QCA808x hardware, and there is
> no KUnit suite or MDIO mock under drivers/net/phy to exercise the MMD7 write
> without it.
>
>  drivers/net/phy/qcom/qca808x.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/phy/qcom/qca808x.c b/drivers/net/phy/qcom/qca808x.c
> index 8eb51b1a006c..68fd4d0fe31b 100644
> --- a/drivers/net/phy/qcom/qca808x.c
> +++ b/drivers/net/phy/qcom/qca808x.c
> @@ -200,8 +200,8 @@ static int qca808x_config_init(struct phy_device *phydev)
>         struct qca808x_priv *priv = phydev->priv;
>         int ret;
>
> -       /* Default to LED Active High if active-low not in DT */
> -       if (priv->led_polarity_mode == -1) {
> +       /* Set LED Active High unless active-low was requested in DT */

Why the comment was changed if it does say exactly the same thing?

> +       if (priv->led_polarity_mode != 1) {

This change is O.K but I would ask you to better clarify this. -1, 0 and 1
is very confusing here.

I would introduce a simple define like
#define QCA808X_PHY_LED_UNSET -1

And set this in probe and change the condition here to directly check
for the macro PHY_LED_ACTIVE_LOW.

>                 ret = phy_set_bits_mmd(phydev, MDIO_MMD_AN,
>                                        QCA808X_MMD7_LED_POLARITY_CTRL,
>                                        QCA808X_LED_ACTIVE_HIGH);
> @@ -603,6 +603,9 @@ static int qca808x_led_polarity_set(struct phy_device *phydev, int index,
>                 case PHY_LED_ACTIVE_LOW:
>                         active_low = true;
>                         break;
> +               case PHY_LED_ACTIVE_HIGH:
> +                       active_low = false;
> +                       break;

The ACTIVE_HIGH wasn't a thing when this was introduced if I'm not wrong.
Anyway this change looks good. The only problem is that I feel it would be
better to split this patch in 2 different commits.

This really addresses 2 different problems and splitting also makes the commit
description easier to understand.

One doesn't account the case where phy is reset, the other doesn't account
the mode in led_polarity set.

>                 default:
>                         return -EINVAL;
>                 }
>
