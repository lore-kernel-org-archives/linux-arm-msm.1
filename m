Received: from mail-ej2-f0.google.com (mail-ej2-f0.google.com [74.125.228.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F1536C0D6
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 05:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790229312; cv=pass; b=TvEpyQL2/99uDFvmhs4jGIvnlqhzEFHe7mITteTjRNVvXBLjwgH7V+kQ6G2Wza6rDj3VPVtep5hJbOd6CCuynywh2AZtRRIcfKOz9Wfl97dHBK5DC9+D2+0DpAtOA9OLuEzxy2ByOlBvMToZRf6a8k6iBUzB7rV4SDsQ0CAybTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790229312; c=relaxed/simple;
	bh=gtEA+FGZX/W33bqy9v+TYqYktmjvuE7CeQbFETs9Iac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EKDXsFm326bxi1Q+yomLn7xxZP/wJHerFJ2n2Lb7ocIAwDFa+6Dm2qzY4KpYcAjwpk8Uf8mlYJaD2B7Ifmnsy3ONwg6rRbVe7SasahjfeACJv8bKuO8+swPQHWATxDqmlpQ7mLubdDDQUbPme+a25fUufpfaJjucLDk8A2tS6Ww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=izmD6KJB; arc=pass smtp.client-ip=74.125.228.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="izmD6KJB"
Received: by mail-ej2-f0.google.com with SMTP id a640c23a62f3a-c293a9e09b9so80325266b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 22:55:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790229308; cv=none;
        d=google.com; s=arc-20260327;
        b=c3iF0W7qGNkMrKwnoMoa0Fm/j9USsMJFg7XH7uXyMrfg1uV0vPQ5E8jaRdlg2xdkFk
         6KN7YRcGRlWHvroirc7BEG2oyVcPowhMCP0Lf3y/71HBHnVbQVtCQUC6D4Ysm3faF1qr
         wypECFz/Fcy6IVbFniRLH8wBQLvUNWdbjoi69Ff+BXvJR4f8i0nequjs7CR7Asyml6nR
         86Qdx2mRlPC7V9t+tf4tZhiZgYgBEWowqbnx6P80mIspa2MM7sgT4TQexvMQ1wYwdtuX
         0vY0FwpguIwN/MNp/ix+mb3LRdiX8Msr3JqKclIKryS8WISIeHprJsFLfhAPIpwMf80g
         2trQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M7/suQeptALUdsHaayyxRg2Z7cAgGugdiTyYw6qUQKs=;
        fh=ZEv+0hjF000tuH+XQeESgn7vqIprEzC4fjCtQqx74K8=;
        b=Pf3aECcB6WtEaDBs/XOst3ipnjSp2qG4TKbCkuYe6xO/amhaHWfSbqQpiIVWb/v+yw
         zRPYmKmz0dcOsTkOFMaMBYCkkS8RSvCgcitX4GFuAlfy9Ti8G8e+rI7OvO9Mq/F4xDkc
         lsSP5BFQHIIdOF602NcITcPrDs4e/oHkDI0+xKWyEaIHdLmcBAcFMcEurspqjl1h3i2t
         uLGyw0S3rY0NegmwlSlF9KZyiQgY08ixWD1VOyR+wqIodfhzOzlgRy6/5stXgcv7UO/a
         2hfcW2VRPVZL+b9dt14S3oqzCGZfaV55jx5lg1Kd0fzzzDilVuPAeQX+jMVp/1ePK0y/
         1DQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790229308; x=1790834108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M7/suQeptALUdsHaayyxRg2Z7cAgGugdiTyYw6qUQKs=;
        b=izmD6KJBuy5XVvZsEZSM3aCN6jM+9LGQagyH++m9zc/exJp6A9XS1QFuE4HVzWN2LY
         a8aCGKDCJbVQ/cei7oHPyyttjDCcAyqT5y7glrFuFRScnfVbZbnV6pw8HgGlTrv+8uGz
         X0JQXhiZ7wfQERNqbegAR3U81BfKc8C0VYymPtK2YSQI/9VlGNAE6evL4yyX5aqGG6AZ
         QK05XqpxMePOGaYwvD7WVpOl0P6zqNtW7tiLxl2K8L3H4td0Yb/RfEZ5jPtklePUpqKB
         zUAAgcNWxy9N30TFwb9ZR1YBKN6kv3BFlbl/m647s4a0jTimB+gCtqEctDcQ3AEFKxVD
         2eNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790229308; x=1790834108;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M7/suQeptALUdsHaayyxRg2Z7cAgGugdiTyYw6qUQKs=;
        b=nukWrMFOezFRLoUQYuMz7/RiIGo5DmHPMexhcop/wcUzvoNDv1Fh1e+kP7wV3ayHM+
         +qOYg8QdUNkwLkOHU0V5Qjsja0ljFs6cDKnEzbMuEsbSoBBDDeuHdk4JK6+5Yhl3THb3
         Z0pYkFNu6W66NgrkFHTc0mzhn6y7DCb4R+rnaa5opW7a+OXxSSVvztIOHoT7g/d2LVxu
         atkDFTCHIFWYJkCePs0ubLzj9zdSBFKIdSOzHAXW/qBAkuCkDYsBDXYy8+TPxb3tZKK7
         D+W137J+V8T3qb369Sv3PS+gbw7UKrtDE4NQG6MAX2NzDOHOkoRpvc2Wde3/Xdul0DRA
         NIKA==
X-Forwarded-Encrypted: i=1; AKwUvByWoitKJYgIWoAAAuIebq8yT6yoxHqzfNCzc1HvbCaqk0RExhsDlcJJHpM2SOZ4OQmlyb/96Gomzp8+3uy+@vger.kernel.org
X-Gm-Message-State: AFuF++k2/5yfVL/r6x4APN2UF48S3k1jkVebN7YtfHY180aizUSbCGZx
	XJDhYZ3VczCUmtnG/W0Mp/jOVB2JpLALXVtWoMjF3TwayCHLppHfINpqyn6zMySvVLnVJeLfR2U
	UN5U6kp0zArwPr4dJapDLqIrsltXjNVw=
X-Gm-Gg: AYBFou1Pyx1HmV4KrQPlNLBEDcAuu/Lx+kHfU/JnIx8jwvMONmvO47guM1l6hVuoty+
	jJ3lXvV/gL0rNfhogyHUMllBcPD6QiQYxPA+2eyeaJzB7iNQAjvpIOd46VgdSWgC44M15lsYVyH
	ULYV/fNx+ptcMz3sii3YJiBE6g8ZdvlaxPKzxbrAGX1U8MBxgtbLtQy/DuD/2tPmNqJU1/lRLDL
	VogLXpn4f7EuNa8qwCyAVSEBuZyYZzhH9ZgBDLmtB4rvcgdliTovlKMa7HtFAIlyBfuN57CEelg
	cgbpOIQaDaCqszWVWMhjVZuI0RAvodny+dlmon52pRYJTs5hzKJlXv4AKQ==
X-Received: by 2002:a17:907:3e23:b0:c20:53c7:488d with SMTP id
 a640c23a62f3a-c2ac23a5ff8mr94779466b.14.1790229308282; Wed, 23 Sep 2026
 22:55:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <5135e15d-b6ac-476c-9a7d-b7d64e4eed5c@bootlin.com> <arOtU15iv5CWPUEu@oss.qualcomm.com>
 <CALj3r0gAaQ_CoS5_9Mmf5HY+Fu5_e74fbb+r0LstafMhagHx6A@mail.gmail.com> <arPcHSGFLrxXFEyC@oss.qualcomm.com>
In-Reply-To: <arPcHSGFLrxXFEyC@oss.qualcomm.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 24 Sep 2026 13:54:57 +0800
X-Gm-Features: AclHuK8aPw4t0qe9OTv6pasVNbTw4PRHtP09UUP7WaSlSf6YYjQMVV3B1tdNgXM
Message-ID: <CALj3r0hMLa96XtuPxjdJJnsn0hzEc23_kMUZ=GWmDAeP2AtFCg@mail.gmail.com>
Subject: Re: [PATCH RFC net-next 0/9] net: introduce Qualcomm XPCS support and
 add Nord Ethernet plumbing
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Richard Cochran <richardcochran@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, 
	"Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>, 
	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>, Alex Elder <elder@riscstar.com>, 
	Daniel Thompson <daniel@riscstar.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B49=E6=
=9C=8823=E6=97=A5=E5=91=A8=E4=B8=89 22:03=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Sep 23, 2026 at 09:17:44PM +0800, Coia Prant wrote:
> > Hello,
> >
> > Thanks for the RFC. A few comments.
> >
> > XPCS_ID
> > -------
> > Is 0x00000030 documented for Qualcomm, or is it derived from
> > NXP_SJA1110_XPCS_ID + 0x10? If it's the latter, it's a magic value and
> > I'd rather see it confirmed against the Qualcomm documentation or a
> > register dump from real hardware before it's used for platform
> > identification.
> >
>
> It's the latter (NXP XPCS ID + 0x10). The Qualcomm hardware returns the
> standard XPCS identifier (0x7996ced0) upon reading the 3.2, 3.3
> PCS_DEV_ID registers. I tried following a similar approach to the NXP
> DSA driver of reporting a synthetic value to bind to the Qualcomm part.
>
> All this was just to make it work with pcs-xpcs-plat without introducing
> a ton of code.

OK, so it's a deliberate workaround, not a hardware value. I see the
NXP precedent, but I'm not sure it's a good one to extend: the ID space
is global and finite, so a synthetic 0x30 could collide with a future
real part and bind the wrong glue. NXP at least needs its synthetic ID
to select a platform-specific PMA config; if the Qualcomm part is
otherwise standard XPCS, matching on a fabricated ID just to bind the
same generic code seems like the wrong place to solve the problem.

Leaving the final call to the maintainers, I just wanted to make sure
we weren't matching on something made up.

> > Structure
> > ---------
> > pcs-xpcs-plat is itself a platform glue driver, for SoCs that don't
> > need any platform-specific handling. Adding another abstraction layer
> > on top of it to cover Qualcomm would be glue on glue. Generic, Qualcomm
> > and Rockchip differ in power management, address window size (2M vs 8M,
> > ...) and MMD redirection, so they don't share a probe path.
> >
> > Pushing that into pcs-xpcs-plat would also drag every existing user of
> > the generic glue along: they would suddenly depend on GENERIC_PHY,
> > PM_GENERIC_DOMAINS and whatever else the Qualcomm path needs, or they
> > would have to carry per-platform branches in a driver that is supposed
> > to be platform-agnostic. A per-SoC-family glue driver, the same way
> > dwmac-intel, dwmac-rk, dwmac-renesas-gbeth and dwmac-rzn1 are
> > separate, keeps each integration self-contained and leaves the generic
> > glue alone.
> >
> > Would it make sense to take that route here? My pcs-xpcs-rk does the
> > MMD redirection through a custom MDIO bus; maybe the Qualcomm glue can
> > reuse that idea directly instead of extending pcs-xpcs-plat. Happy to
> > help with the generic parts if that's useful.
> >
>
> I agree with your concerns regarding the glue on glue architecture. I
> also don't know if each platform glue should define a custom MDIO bus
> with similar logic. Maybe we can have a generic abstraction for it?
>
> I know that Alex had a patch introducing pcs-xpcs-regmap.c [1]. My
> original code for this platform actually built on top of it before I
> moved to the current implementation.
>
> At least I now know that multiple vendors have an MMIO based XPCS,
> albeit with differing MMD redirection mechanisms.

I looked at both pcs-xpcs-regmap and pcs-xpcs-plat. Neither fits.

The regmap helper targets a window that doesn't align to a page
boundary, but still assumes a single contiguous region. pcs-xpcs-plat's
indirect mode uses only 8 lower address bits for the register and a
viewport CSR for the upper bits. Your own patch describes the Nord
layout as "separate direct-MMIO windows" with MMD 3 at 0x0000, MMD 1 at
0x3000, MMD 31 at 0x4000 and so on. That is not a contiguous Clause 45
space, and it is not the indirect paged layout either.

Mapping the Nord registers onto pcs-xpcs-plat's indirect mode would
mean claiming the memory is something it isn't: the hardware exposes
direct windows, but the driver would have to lie about the access
model. It also doesn't match the DT binding, which describes a single
reg-names =3D "indirect" region. A platform with separate direct windows
should describe those windows, not pretend they are paged.

The Rockchip glue differs from pcs-xpcs-plat in more than just address
translation:

- it marks PD_PIPE as part of the wakeup path so genpd keeps the
  power domain on during system suspend, which is required for MAC WoL
- it keeps PD_PIPE on at runtime via dev_pm_genpd_rpm_always_on()
- it adds a separate "eee" clock on top of the csr/core/pad clocks that
  the generic driver knows about, and derives the
  DW_VR_MII_EEE_MULT_FACT_100NS value from the EEE clock rate at runtime
- the read and write remapping paths differ

None of that is address translation. Folding it into a generic glue
means either per-platform conditionals or an ops layer where each
platform stubs half the callbacks. I'd rather keep them separate, the
same way dwmac-intel, dwmac-rk, dwmac-renesas-gbeth and dwmac-rzn1 are
separate.

If the common parts can be factored out cleanly later, I'm happy to
rebase onto that. But the platform glue is where the platform
differences live, and right now those differences are substantial.

> I am going through the pcs-xpcs-rk patch and the eee_clk already stood
> out to me. On my board, the PCS link does not come up if the EEE clock
> is stopped. Going through the databook, I did find a barebones
> explanation of why that might be happening for USXGMII, but I need to
> dig more into it.

Same on RK3568. Without clk_xpcs_eee the SGMII link is unstable, which
is how the Rockchip glue ended up enabling it unconditionally in
xpcs_rk_init_clk(). Downstream carried a fix for the same problem:

  https://github.com/immortalwrt/immortalwrt/commit/2ff0f9435f688b1d9ae2757=
10e13ecd0c54e9724

The databook calls it clk_xpcs_eee, but the generic XPCS driver only
knows about the core/pad clocks, so the Rockchip glue adds a separate
"eee" clock for it.

Looking forward to seeing where the Qualcomm glue lands.

Best regards,
Coia
