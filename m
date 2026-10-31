Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793408998;
	b=Wf+smVKZrX/eIyXAOA58uU8bJTOd2H90hpqWFXDz+ximtenjA6jA+Dne1bNOTXwLz+oz
	 XMqBz6WkGtIaEbj1vo7XYsZRyE3hTe3hi8nEtExCARWBhonYPWOir7I575G08+CQCyZET
	 P+33rN8ygA73CQZxpdF56ybY5E1Xj6CDJy6JRJvwDUGB/tdon6biGZS4cBhR9yDHdWp2N
	 F+XJ+mbbVhGeGzoF86BSAFX+R9aFxJbY1kPMqVWOmhpkChAMlIuP2VYwSJGk5+0cuhlTE
	 79+7BI4Ub2WpPWLbT4nNcB7/BowqS8sZrNF2Kk1TRXc1pn0iHZ9aAIunnvIRGZ4Vz4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793408998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=t12/gzZv3Vh9NEgi2dyQThdTzmEZzU4w5/1G0K00qvs=;
	b=yMmeUvIE+uwTAO7EQ3ZPkKjwAZi5oqxMKKftm0gYW6aJda+WBTsiJxvAsgPP09PVuZNO
	 MSnggnBDOYKFyNUjgLJJ6ZkxViujyVoP5nejtm+M/WTJGaOPED2XnGkBC88N/aMzSZYgD
	 wzYUTpOlBB0eK4Qcy6vkqDRyXzzyn7qNGKzQn4os2H9/0RrM9ywZsudiHKbp8R/iDwKAP
	 XqCQs0SYePR2pmh9B9chLHaBOjh4aFAOT8HbyKK/O7PjpdpR1gItCJphWhsL4X3JcTIhl
	 KnPuuRB/WhC8Q9gfHA3MWMf3YcooajM2ZZanPLn7A/8VCM0pB8JRkixyPaKt+kBX9Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QSbI4k1r;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AB7606A31A
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 01:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0AB7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QSbI4k1r
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b1dae0febeso1783691a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 18:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793408996; x=1794013796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t12/gzZv3Vh9NEgi2dyQThdTzmEZzU4w5/1G0K00qvs=;
        b=QSbI4k1rhYoFx+cLxFDHte7y6LBwqxYLkd/QFxmipdAu2oj32n5ukvs4zgLizvEOw4
         hpNs2a6NhiFDFmjOUtshgti1W0+eO8jlfQy0Kr8yUFqiRaLRbOZ8SlypAbZJJdgDM/JN
         L55D/+fBz87zUp4azX2degJPvuUtsokJbfFAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793408996; x=1794013796;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t12/gzZv3Vh9NEgi2dyQThdTzmEZzU4w5/1G0K00qvs=;
        b=sbVqxwlDVSJ6GKIOurHssKpxgKhwXHdPnmsdeA5/7QgOBic67JGdC9at0eIeMzgVy7
         YROKNsAtikdYgBUMHHrQNPnmmnvIBKzWeE+zInYHj6RsmJfmQ9aDKcu5PGHesXxf/uWD
         HJY/qpjP1d5H1pG07uy8EXdmVO5VZ0wXMUTtsPqEYuIWQZzDjQOQvGz0v8ajE+q+XbQ9
         CUOLg+64Y2Jrj2WWIatP2rFwAFIsaCVh/HIVWhNclh1mkHpogzM/YLhRSOKsRU2KlcCb
         F99SbaIEwzWrm06e9tBm/SzEK3+12HVvzvIL5HuinrhN4pypbVVdiWOTpax3+3+cVPtc
         VpHQ==
X-Forwarded-Encrypted: i=1; AKwUvByGnVpDXEtnhFnx7IdP2fapdTc92UU/rAhRcGrJUP90r+qYoj4W89AmIh950zcSZsL0KoENNtohmgEX/HT6@vger.kernel.org
X-Gm-Message-State: AFq9FYLkqQ22YEegb1fs2WlQrJ/xpb+UjnxUjcGZcIZCbe/2siVznv3w
	84nVbadwj/lNWrWKtDGFtJ7/y2IdgARIxXs0c9e4LY+z06HE73a2O7JKxoXZHWqCT1qUirZydb3
	k1W4g9w==
X-Gm-Gg: AYBFou3+lpj/yP3uOB0pZ1+hBi22C20DX5mdhL3ZAkQi1/7Jx0tJwEug4EjlJwBoP41
	VNmOvC1oRX7IwpikZhW0LTynNX3Sk8pZRXBSFGmt+NIkk+zgpdmJa5VwneQH5Ngp/3LUxlwsbCY
	35LR8KgWx49h995pEouNKsOhlCaQMs7RMRHnfDlNtvvKfNZnCQp97oTScDLZT6JxrrueZh9hxrB
	9eAyF/aodOZhh5Y3LiF1V7UcpQQI1QhMHebYZzeOfo0v+X+S2TRbVp63cX4oyrUNAnG5LwViJh6
	Yro/Ge4INHDfi4kk1feCLySvIY9syF3gbpAFSlrBuM1/MiYw/GRviSIr/om1gtmLWp9remZDT7E
	dawOYVkmmnhRopz+cCI9+tEukNJXltNSaDEJwCmONPoasTmGvg33VbO+pZmYTZSU2JmTYYcizLF
	3nuvGD5j/N7+4+II3X9lK7pe0uVuiMNSD/eygLz7HMOFaJynuXXaXoMpXcVFWmfp8vMicgv+ATH
	2oDtRhPtNsGcVvmdzb1Fx/m8/ziIcJOFRox/f/I066t6LDBZtaY6n2bUf1VpKt2UsDacACGdmGY
	B4TJNw1TscUr1o5zPHlCG6Ci8vcL4Zk8o1+joEDk+v+ohn1BG4htzOWp1uMbJtj4nfMp
X-Received: by 2002:a17:907:3ea1:b0:c46:cf73:bdf9 with SMTP id a640c23a62f3a-c4ca7a49db9mr344188166b.21.1793408996169;
        Fri, 30 Oct 2026 18:09:56 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe1003fsm124231066b.44.2026.10.30.18.09.53
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 18:09:54 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso13818745e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 18:09:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwZd6Tlw324n6vUVIm18JWuByo4/9v3ns/WXs4FPqur/2zN1URJ6pjfFsTdDRkDPdUmXPlT7nvA8NqFeQ5O@vger.kernel.org
X-Received: by 2002:a05:600c:609a:b0:4a1:7c56:d4e2 with SMTP id
 5b1f17b1804b1-4ac1709aa77mr83103245e9.16.1793408992269; Fri, 30 Oct 2026
 18:09:52 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020153652.2907186-1-dianders@chromium.org> <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com>
In-Reply-To: <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 30 Oct 2026 18:09:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
X-Gm-Features: AclHuK9Km6WTJvvTvOnJ9g5USO9Th2gdTGYh9-cjnPaFh3hhpAF88g-93yWA4Zk
Message-ID: <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] arm64: Add fit images for sc7180-trogdor and google,lga
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
	Alice Ryhl <aliceryhl@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Bjorn Andersson <andersson@kernel.org>, Breno Leitao <leitao@debian.org>, 
	David Sterba <dsterba@suse.com>, Gary Guo <gary@garyguo.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Luis Augenstein <luis.augenstein@tngtech.com>, 
	Marco Elver <elver@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	cros-qcom-dts-watchers@chromium.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Fri, Oct 23, 2026 at 5:26=E2=80=AFPM Simon Glass <sjg@chromium.org> wrot=
e:
>
> > 1. It uses a checked-in .its script to associate metadata with each
> >    board's devicetree. Other tools can parse this metadata in order to
> >    craft a package that the Pixel bootloader can understand.
>
> One thing I'd like to check before this goes further. In lga.its the
> metadata is a string packed into the configuration description
> (board_id=3D...,board_rev=3D...,soc_id=3D...,soc_rev=3D...). The FIT spec
> treats 'description' as human-readable text, so this turns a
> free-form, undocumented string into an ABI that bootloaders and
> packaging tools must parse. I'd much prefer proper properties in the
> configuration node, defined in the FIT spec [1], so that every tool
> can rely on the same names and types. I'm happy to help get that into
> the spec. What do you think?

Putting the metadata in the configuration's `description` property came
out of discussions with Michal Simek at LPC 2026 (where Xilinx/AMD
already uses configuration descriptions for similar board matching).

You can actually find one of Michal's files here in U-Boot:
* arch/arm/dts/zynqmp-binman-som.dts

Then parsing happens in:
* board/xilinx/common/board.c

I honestly still think this information would be better to live
directly in a board's devicetree itself and then extracted to put
in the FIT, but I've decided that fight is lost. Honestly, the
allure of using `description` for me was that, since it as
free-form / non-standardized, my hope was that nobody would really
care what I put there.

If you want to help get something more structured into the spec
then I'd be happy to use that instead. It's my opinion, though,
that the metadata that we need will be different depending on
the loader. For instance, on Pixel phones the loader has this
information to help pick devicetrees:
* board ID (number)
* board rev (number)
* SoC ID (number)
* SoC rev (number)

On trogdor Chromebooks, the bootloader instead had this information
to help pick a device tree:
* Board name (string)
* Board revision (numbrer)
* SKU ID (number, though actually made up of a number of bitfields)

Michal's loader obviously has a whole different set of information
that it uses to figure out which configuration to pick.

The proposal I've tried to push a few times is that it's OK that
different loaders have different types of information available
to them, but people don't like that. They want a universal standard,
which nobody can come up with. Thus we end up with no solution and
everyone does something different / downstream...

In any case, assuming we keep this as 'description', I'll document
the exact format in v2.


> > How does this series help us?
>
> The FIT_ITS path is a second way to build image.fit alongside
> make_fit.py, and much of it repeats what make_fit.py already does: it
> puts the root compatible from each DTB into the configuration and
> compresses the DTBs. The series adds fdtget/fdtput, sed parsing of
> /incbin/ paths and a shell loop in Makefile.lib to do the same for a
> hand-written .its file, and the .its files repeat the DTB lists from
> the Makefiles.
>
> Have you thought about extending make_fit.py to take the per-board
> metadata (e.g. from a small file next to the DTs, or via
> FIT_EXTRA_ARGS) and to run fdtfactor itself? That would avoid the
> in-tree fdtget/fdtput, the mkimage dependency and most of the Makefile
> logic, and trogdor would come almost for free.

I certainly can do that if that's what people want. ...and, yes, I
think it would simplify some stuff in this patch series. The
question is: what does it look like? Is it a file that is a list
of devicetrees along with descriptions? The list of devicetrees
would be to limit which devicetrees are built into the FIT
and then each would have a description. ...and yes, that would mean
it would need to be updated in parallel with the Makefile, but I
don't see a significantly better way to do it. Yeah, I guess that
could work OK.

If so, I think a bunch of the patches in this series will be
dropped or look very different. I probably won't directly reply
to your comments on patch 2, 4, 6, and 7 if we go this way.

Should I give it a shot for v2?


> The new FIT_ITS, FIT_FACTOR_DTBS and FDTFACTOR_ARGS variables aren't
> documented anywhere, including the image.fit entry in the arm64 'make
> help' output. Please can you add something, perhaps alongside wherever
> FIT_DECOMPOSE_DTBS ends up being described.

Sure, I will make sure that any newly-introduced variables are
documented in v2.
