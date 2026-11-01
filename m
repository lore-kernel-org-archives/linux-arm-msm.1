Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793568550;
	b=ydzFOOwCqKQPgr8STAeN4E3YRCKIvzlAFuTSziwkDyPJIXx4TSopU6ELkSZVkCiiFI3Y
	 GsYH8/x/KIotqr02Zbr06X37fOVEJYES5uVQ24DZG6n+Qnqsr4nQQ0eilF2vessRr7wBF
	 y8KOIFBlDDPMhdasxa9HDy+TdJ5/GU7nMsQ6T19s8da0lZ/KJnrO7uknUpRKl5+zDOP/n
	 v8yD+bolnm3jozh1Lx8mAnwX25MCTK7PFmRz67rgaXHnAMiSoM2q8oCvoR0XeWjTNjY1G
	 XizAcRw+h1E4Cese7Xxxc6NB4F421CEdP5t6HvBzU1yCGZg2cG+TQHBSueVXFV3/eRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793568550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iA4nPd0I6kv/auIuMoh3730KHkV9NOXvNkpunrQQ30I=;
	b=uNVBdR8LG5Iqyg8LbqV9KZXDgYs2ehu2snibSY0j8sKP1fhM0wYclY2k3wjzRduSyDA7
	 7QH/iW7RBjwFHAhhsUisrgKcFKuTBc2QdrX+aQ86qWZJe4SbviV0H+nsP9W4JKpLdBnkX
	 6tlqZs6E0TGRZuxvoAXvt/jCBxXSe62q4bvkulKTmmsTnTR3vA435TcxsaiW3Q2Cx4PRC
	 sySbEo6A6idUa+tMOdgGB3u/UrszdQJDo0cQpVZ6CQKXLA6GQSqHiLwYYAsx0kAeRqU/H
	 MHLGAvgUzGyiTuoh1ND1kdbw24FD2K8EQXUI0o3p8GKmj4xmWde2uonCNsm/9OkAgrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IEGmRE8I;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92649606A324
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 21:29:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92649606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IEGmRE8I
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b4a13789b0so3260888a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 13:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793568548; x=1794173348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iA4nPd0I6kv/auIuMoh3730KHkV9NOXvNkpunrQQ30I=;
        b=IEGmRE8IlrkKdcH7OyQFrMDXl0y49jfXIf981bP4rWcpoAUXCbHLuP5KJ54FaunxKp
         hv6AlDu/bRLBcJtXT7etiiDxwtl83ZoilZFzeAkN9tZqotyefnEsB1RTQazGzpZi3EX5
         c3X4K13A0pxOOYkcP4q9ncmV5uQZ/ZY461G8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793568548; x=1794173348;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iA4nPd0I6kv/auIuMoh3730KHkV9NOXvNkpunrQQ30I=;
        b=jUUyCL7+IL4h9c9H5hchibAqEpKVcRXr1bMK6Ki8urPRGpaXCNd9iK8DE733JQw/V1
         vS8YoyYJIHFd1dLq4DBjRoxC1fHdpUYroh2NDv1poMyVtwnxsSjs/c869OclK/UZ3EcR
         O8k+qQiBRV8o3FeLo5gyV1Wrc/+XgnBS0tWNLaDxRzVEv3mKodQbzyzgyxFZdEw84I2S
         wkGs8x61RyxuCmBBT6O9j26GidDBFGUGpU7mQ2rGhGvrvvFd0L0Dp7+EUaksnB1vTtjh
         BlJoSuDwhiFbHchT5ntR5hZuc8lcAUUyRQxjxmrvhn2Zqj3ipk+q/mpXsjD0oKFqTccQ
         gsbg==
X-Forwarded-Encrypted: i=1; AKwUvBz8UmtBwYBoZIpRZ0PyQ2Zy/rpty+LYV0Y1WPhOVYcg0wkzqmXSPqvheJSqJalqH7mZlef27dIiEVzonh9z@vger.kernel.org
X-Gm-Message-State: APuU4Z+Q+hWv2uJ+Zrqbz+pg+omoXl2EnVGZx6Rv6vEznxtorsHfkqRS
	lDHvOmDhI1MEhZ1HkvbCLYNaILjb6pa2MIViOHFCMfxrzJ2xWEZEearDtHYqYT5UjtU0/UZaXHR
	sT3QJoQ==
X-Gm-Gg: AYBFou0JLzKJQm1nGwIbvTaoWotVrcbme0EdUp2W0anmWTKTK+OWWrOzK4T2H9dK8Qc
	kWY4wMEPwvHGks4ciHsD8APBxjdpAiRY21WdLHzuntxniVliMoXyj8npIynzzApSxk3cwb6PFx3
	hzc2B+sQIlz/vb70r+lOwHa6IMAf4B9PSHdSgmHCXSN2/eYUyMjQONUBISWdAAX0vTmQgKpmhpA
	lOOvkJ3z8ySvlWzKwWU4BwJJE8BRZOkiU+h9Hw0CcA+LVh7pn859i9VwKtzLMmPyAbozgieL7G3
	gAFwXMWYUeanAC4vCnrUy+cNjsLwhVe6GQZ6GBnDCz4dpnx8cPdMTS4EEX9C/PZiY7xcSoU7eB1
	kJWpiTL7ivFgI5OOFcY6c7NGW84AOujIs/82amhW0A2rtEM9dun6weRTMgtQTSzixa4u6mA84Bc
	rtndijMW46lhhAhM61goPPiwrzVn/RHpV/vxQj5STLaYDP/vSYNK26mUDNqy7et3tASXkUgXe3s
	1IrOu6p9M9sF8sEdDL2CCC+vN/9axbuDGMrcYfKW9J9oOzbGRdJC66di1FqZZyKKmypMd+o7qqg
	Ln0ohJSSYLlAFSZuCDYjIJ9kDfC3dYt8y31V/QJOQOb7CT8bohy3DQlgAc1nlYkXaCw=
X-Received: by 2002:aa7:c418:0:b0:6ae:16f5:5be9 with SMTP id 4fb4d7f45d1cf-6b4d4c78d8fmr3792509a12.7.1793568547892;
        Sun, 01 Nov 2026 13:29:07 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca2112bsm2562190a12.32.2026.11.01.13.29.07
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 13:29:07 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso5541215a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 13:29:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxJqkRNUu2UzPa8CDU/S05XwDenwluY+ct2xMJgygl3vj23Deiph9SNUqueO17rzpff5AY494wd77jxxbtd@vger.kernel.org
X-Received: by 2002:a5d:64c9:0:b0:48c:585b:8825 with SMTP id
 ffacd0b85a97d-48e6e2db4a1mr23331343f8f.18.1793568064814; Sun, 01 Nov 2026
 13:21:04 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020153652.2907186-1-dianders@chromium.org>
 <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
 <CAFLszTh6vmFGVD4_Reewe9p4QqQjN=CVJ3SgfQKosAhedJpAQA@mail.gmail.com>
 <CAD=FV=V7neyofHdv-LdAtFaEhAcWEHHNRYAKrr5f2EHXWmKAuA@mail.gmail.com> <CAFLszTiVvuaMUsRHjhRTFxFf8Q2hbN1a1K-G=QFv4DyXNpWY6w@mail.gmail.com>
In-Reply-To: <CAFLszTiVvuaMUsRHjhRTFxFf8Q2hbN1a1K-G=QFv4DyXNpWY6w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 13:20:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XAj0f7vm89eCor2Ea7_nHaZmE-6VC+vsQ4vXido7Kj0A@mail.gmail.com>
X-Gm-Features: AclHuK8iDQf3Hi4FgB3rVtlO2TSTt5l2todvm4T0h7_4dZ5xTXqg7HY4PS9Cbco
Message-ID: <CAD=FV=XAj0f7vm89eCor2Ea7_nHaZmE-6VC+vsQ4vXido7Kj0A@mail.gmail.com>
Subject: Re: [RFC PATCH 5/7] kbuild: fit: Add opt-in FIT_FACTOR_DTBS support
 using fdtfactor
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alice Ryhl <aliceryhl@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Marco Elver <elver@google.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Nov 1, 2026 at 12:55=E2=80=AFPM Simon Glass <sjg@chromium.org> wrot=
e:
>
> Hi Doug,
>
> Doug Anderson <dianders@chromium.org> wrote:
> > I think that was in the the "after the cut" part, where I said:
> >
> > You can see the fdtfactor post at:
> >  http://lore.kernel.org/r/20261015182221.2931742-1-dianders@chromium.or=
g
>
> OK, that covers where the tool comes from, and the question goes away
> once fdtfactor is imported. Text below the cut doesn't reach the git
> log, though, so a sentence or two in the commit message on why this is
> wanted would still help.

Sounds good. I'll plan this for v2.



> > The goal was to make sure that we could fully reconstruct
> > __local_fixups__ after applying the overlay to the base. v2 of the
> > fdtfactor series handled this more properly, and I'm planning to see
> > this through and land it unless there are major objections.
> >
> > By default here, I'm running fdtfactor with "-S" to strip the
> > __local_fixups__ out with the assumption that today people don't
> > really need them. However, someone could easily override that locally.
> >
> > I'm a little unclear how things would silently produce a bad overlay, t=
hough.
>
> Sorry, I should have been clearer. This is about overlays which kbuild
> applies at build time, not runtime ones like Beaglebone capes. An
> entry such as:
>
>     lemans-evk-camera-dtbs :=3D lemans-evk.dtb lemans-evk-camera.dtbo
>
> is merged by fdtoverlay into a plain lemans-evk-camera.dtb, which the
> make_fit.py path then puts in the FIT like any other DTB. There are
> several hundred of these on arm64.
>
> My concern is the input to fdtfactor, not its output. In the in-tree
> libfdt, fdt_overlay_apply() uses the .dtbo's __local_fixups__ and
> __fixups__ to resolve its phandles, then overlay_merge() copies only
> the __overlay__ contents into the base. Only __symbols__ is merged, so
> the __local_fixups__ in lemans-evk-camera.dtb cover just the
> lemans-evk.dtb part. Cells from the .dtso such as:
>
>     avdd-supply =3D <&vreg_cam1_1p8>;
>     remote-endpoint =3D <&imx577_ep1>;
>
> end up as plain numbers, with nothing marking them as phandles. If
> fdtfactor needs to renumber them, or puts those nodes in a per-board
> overlay, it cannot tell they are phandles, so the overlay applies
> cleanly but the links are wrong. Stripping the fixups from the output
> with -S doesn't change that, since the information is already gone
> from the input.
>
> Does v2 make fdt_overlay_apply() keep the overlay's __local_fixups__?
> If so, composite DTBs would be fine once that is synced into
> scripts/dtc, and my concern goes away. If not, one option is for
> FIT_FACTOR_DTBS to imply FIT_DECOMPOSE_DTBS, so that make_fit.py puts
> the original .dtb and .dtbo files in the FIT separately and the .dtbo
> keeps its own fixups. Leaving composite DTBs out would be a simpler
> fallback. What do you think?

I think your concern just goes away. ;-) The fdtfactor v2 series (and
soon to be sent v3 series) includes a bunch of patches to the overlay
code, and this code produces a fully valid __local_fixups__ in the
final dtb after an overlay is merged in (assuming the original dtb
already had a valid __local_fixups__).

The idea is that fdtfactor and the overlay fixes will all land in the
upstream dtc project. Then as part of this series we will bring both
in, so we should be all good.

-Doug
