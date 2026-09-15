Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A65D27B4F7
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 00:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789431586; cv=pass; b=dhQ/h656sipkRwygrl/dVHfOPulHt8+FhK+Mx2PZFg1RcaYXbZrlWNbL3nzJVxkyAB0gsRc+VN3mEw2XqnjRPDx5ACllhiTDnuFzVMnDAc3WnDonrMhzAO1rCAjEgahdGxPRe7MuHlUmpaOpP/AvRL4xioemAyw3K3azFv4npw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789431586; c=relaxed/simple;
	bh=EdKInOD+E6jqh6viJs2EtgOk8z4C7E9EBNp/xGdSPnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gRcRL6aajMIgvSvhHwwPTpO6IknxwEKe1cJz2GNdeikmrtw/oZncNFut4auHsJUUEM9lBJe9bYYbAx4fU4KQGpBvjwtVe5Y2lCnbXTWoGw5agvylS7StbvHNSjmH18IwEVhPXJjvV9KV+8tZ7gSw4er9Mcfwuumt3+vD4QoMT6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bs0lTwvi; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bs0lTwvi"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c29c49a977aso100149266b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 17:19:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789431583; cv=none;
        d=google.com; s=arc-20260327;
        b=SzgYy3w4lkr2NmGFW/M/dVlaXutlyOX0Ol6tPvPLevHbnXxxEvr2A5FqkkwmywN0xm
         TxtKPJX1u2dyUkmOc6xRzlykafCnLfK71rRtfk9Y5BS+zXOPMVN3yiqx7T9smBUYtY/2
         YrdjG97om+RHtrK5ogIIRzdHyDlniVJZVgjegyFqwMydEyNvGI+7K6icRthQZp1pGb6r
         7ZL0e0sbhEhqvzhTVrvO29VgBxK+/nIxWu8oKjgJf3oS3ZvD7uInh5d/rnTL4Y1RR52n
         j+omJ7VDr9oHVZBghjVBsuKWcMCpw193csm/eMdPy/oKVWaq/iCNlDCfEXmqM0kyZPXk
         8gKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fhSnpJaF0zIlzRRxfxVLp3csW4mX+RohYNQStTeeaVI=;
        fh=j80y9ICju34isPnsXu55ZUlfcliiJ7MSezhPQM52N/o=;
        b=EjARu2D1tx/yZpgCQ0Gy5Q+YJXb/wzCp93TerFpaa7ag7j6dYU5cUbZ3zNaEwe8Zt6
         t1ZmJysCOdWZbfcuEfWOPCvfdiqMXuRaOirKu1d/RWld2PZhwJKmP5KSXYFd+qUiZc00
         jmtLBhNgsQ34YykE3hQYquPDTauI0H0zASt69TcF4cFb6HSj2bkTgiFDpEC1bZYtRNSS
         Z6gz840sNxeeBIIvIQTfiYcHZnp7O1M/DrdWxKYWJwrkOMlTm2sFzf1CMuExDRe/rx1J
         IDCf2AHD7RGDi4ZJRieUmeGVcS8/D6aWTnkxAOJnc0dKijCxY3SAkW2b2YwNo9DytBx3
         5C8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789431583; x=1790036383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fhSnpJaF0zIlzRRxfxVLp3csW4mX+RohYNQStTeeaVI=;
        b=bs0lTwviMi/7oiOjjHHoDId/9KLD2tEHe6j+XUdo3m5DIgyWvZtShT05Ahhc9p1l8o
         Tnn/Bg6YASjpgK9l472Ez4jT6SEAsOZkIy7fFsvimRYjr1dqB/ud/z8w+vZpc7ZwkbH7
         YjcrS6y16fBvkEMbwdV6tPraAbRXPFb2pMA6W4y6tT7bwNMSFrSO7eaj0IHQGm8XKP6h
         S8Lhg0vPMx80Z+AxKNtTzi0LkWTOaj1dJnJyxEsExODbSScEDyUm/VIpC9zaA5DKGGFi
         GdDbEOQKDrFmhfl32TVvBUEZmo3Pv9/K9LjLJZOPKhTjYflHgC5j//88rCG2pHMzacx4
         aJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789431583; x=1790036383;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhSnpJaF0zIlzRRxfxVLp3csW4mX+RohYNQStTeeaVI=;
        b=lkf9Brw1zNukHMbPfD8t+cOOEdNjyjlHv9xvpOIExV6zhQ4qmirsPg4ac1z+Te8mdF
         GgTG3914WNXUd1fvxVpdfTB2nr9tfxqaWJp9jqgL+hfrdcJ6D+xVtj8C1+oaHMszTDRa
         T2Ajs/2reJ+imwIIupUB96mm2HC0lajDMDSeg/A0SX3DdCAcXL5DNk32/nSSJO/OQe6v
         kfwpPwHHaxn0zwItwcLK7yK/jWN+QDv+uJm8uwm2oM68QXAj2kVoVxY1cw2Xdt4FBTo0
         cThZNyydaPFRVwvZpoIQYdsjPpo3/qzd4Sz73mBKk8VyT5odhsH6kSg1N9pEfpY+cbwe
         yk2w==
X-Forwarded-Encrypted: i=1; AKwUvBxQUzfoq1JwOEhc+4Lzgo4i2jk8i8eKnJQBLQN302dc3bEzuIMzYP8x3W/uQhVWqTTjYx8mbSTaZiT4WMBw@vger.kernel.org
X-Gm-Message-State: AFuF++noyvm/ByO33TpjY/JnCoYOnmMmxJbS5r2pgdPJjr2M5ftYUF7Z
	sv+Z9JzP554ePMF+ZQI96Yb3odyskFbK/Z5LvrNtXb7/OdqixvuNKNtmRcf2HaMdbRLD3hArcqT
	0X1V+Bs6rQJHfizVoBSLCuCSKIrHddno=
X-Gm-Gg: AYBFou2jPKFQRBKSnOR1o2oBofR4+hZY6rJVp3TUgIibwgcN1kfbVQCQKaa3m3N2qU0
	0KsbUS2J62yN8AmkDdSSopK0WIJTGFNgJ2yelkHFZoEQtOugK2VONoJRhVZzMHAtHGYhAhJPBbw
	IFAdgWp6lVq/w5JwaqByvvydKVpOkLaJMtSfl/9ZEqY+HWQqYB4WkPzuDks/+EPIfw5fhAV/vve
	A7jGlRu9t3Tnei0+6n+Nkrz8F7sTSzgHJje2nlfxN4o3r3g86nG0yN36ej3I3rnRXzgRb/yLvUi
	OCHnvvMLXZveHuWE77HEcme7HUrXrRl64AFbcakgc+gqKCN96FYhnjnJYjZgBJif9QtJChAru8x
	P0C/m4TLJaM4FRsJbvowlhy9gXxr+UPQG4lsPdIt9phLSU3Sp3aUoMoTFaYy9d0Kyaieos+j5JL
	lzVgAndDprO+HA9UPlLneX2O0jogx+vluo+oOHK1Xi/HNawF4HZqg7mHC6nZPAJdlVWA==
X-Received: by 2002:a17:907:7245:b0:c29:566f:531c with SMTP id
 a640c23a62f3a-c29b870633dmr347632066b.31.1789431583089; Mon, 14 Sep 2026
 17:19:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914214720.2467586-1-donggeunyoo.kernel@gmail.com>
In-Reply-To: <20260914214720.2467586-1-donggeunyoo.kernel@gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 14 Sep 2026 17:19:31 -0700
X-Gm-Features: AcwNN1U5EfGdgTc1xsFDmc6062Wi3vW51HrhRuGo76kBeV0qilCmtX4PEonDaJg
Message-ID: <CAKxU2N-h7ooJ8BOhFz2HqaxJfAs6=9W4oEef_9C11kNMcm61qA@mail.gmail.com>
Subject: Re: [PATCH net v2] net: phy: qca808x: handle the active-high LED
 polarity mode
To: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Russell King <linux@armlinux.org.uk>, Daniel Golle <daniel@makrotopia.org>, 
	Christian Marangi <ansuelsmth@gmail.com>, Sashiko <sashiko-bot@kernel.org>, netdev@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 2:47=E2=80=AFPM Donggeun Yoo
<donggeunyoo.kernel@gmail.com> wrote:
>
> Commit a274465cc3be ("net: phy: support 'active-high' property for PHY
> LEDs") added PHY_LED_ACTIVE_HIGH but did not cover qca808x, so
> qca808x_led_polarity_set() returns -EINVAL for it. phy_probe() propagates
> that, leaving the mdio device unbound and phy_attach_direct() falling bac=
k
> to the genphy driver.
>
> Accepting the mode alone is not enough: led_polarity_mode records
> active_low, so an explicit 'active-high' node stores 0, while
> qca808x_config_init() re-asserts QCA808X_LED_ACTIVE_HIGH only for -1. The
> bit does not survive the reset phy_init_hw() runs first, so the LED would
> come up active-low.
>
> An 'active-low' node needs nothing here: the bit is clear after the reset=
,
> which is the polarity it asks for.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/2026090810595=
9.70453-1-donggeunyoo.kernel%40gmail.com
> Cc: stable@vger.kernel.org
> Fixes: a274465cc3be ("net: phy: support 'active-high' property for PHY LE=
Ds")
> Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
> Assisted-by: Claude:claude-fable-5 sparse
> ---
> v2:
>   - No code change.  Rebased onto net/main.
>   - Cc Rosen Penev and Christian Marangi, per Andrew Lunn -- they may hav=
e
>     QCA808x hardware.

In my case, qca8k controls the LEDs. I don't think I have any devices
that control LEDs through qca808x.

>     Christian wrote f203c8c77c76 ("net: phy: qcom:
>     qca808x: default to LED active High if not set"), the default this
>     patch extends.  If either of you can put an 'active-high' LED node on
>     a QCA8081 and confirm the LED comes up the right way round, I would
>     appreciate it.
>   - Say why an 'active-low' node needs nothing in qca808x_config_init().
> v1: https://lore.kernel.org/netdev/20260912012819.2072067-1-donggeunyoo.k=
ernel@gmail.com/
>   - Supersedes [PATCH net v3 3/3],
>     20260908105959.70453-4-donggeunyoo.kernel@gmail.com, whose
>     Reviewed-by from Andrew Lunn is dropped: that version only accepted
>     the mode, this one also makes it survive the reset.
>
> Compile-tested only (W=3D1, sparse).  I have no QCA808x hardware, and the=
re is
> no KUnit suite or MDIO mock under drivers/net/phy to exercise the MMD7 wr=
ite
> without it.
>
>  drivers/net/phy/qcom/qca808x.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/phy/qcom/qca808x.c b/drivers/net/phy/qcom/qca808=
x.c
> index 8eb51b1a006c..68fd4d0fe31b 100644
> --- a/drivers/net/phy/qcom/qca808x.c
> +++ b/drivers/net/phy/qcom/qca808x.c
> @@ -200,8 +200,8 @@ static int qca808x_config_init(struct phy_device *phy=
dev)
>         struct qca808x_priv *priv =3D phydev->priv;
>         int ret;
>
> -       /* Default to LED Active High if active-low not in DT */
> -       if (priv->led_polarity_mode =3D=3D -1) {
> +       /* Set LED Active High unless active-low was requested in DT */
> +       if (priv->led_polarity_mode !=3D 1) {
>                 ret =3D phy_set_bits_mmd(phydev, MDIO_MMD_AN,
>                                        QCA808X_MMD7_LED_POLARITY_CTRL,
>                                        QCA808X_LED_ACTIVE_HIGH);
> @@ -603,6 +603,9 @@ static int qca808x_led_polarity_set(struct phy_device=
 *phydev, int index,
>                 case PHY_LED_ACTIVE_LOW:
>                         active_low =3D true;
>                         break;
> +               case PHY_LED_ACTIVE_HIGH:
> +                       active_low =3D false;
> +                       break;
>                 default:
>                         return -EINVAL;
>                 }
>
> base-commit: e6b6078ea1731b05b3b552497b3bce4bf8b014ae
> --
> 2.53.0
>
