Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793569515;
	b=OE0vv0go2cd2RxKn8CcNNRjbwdkoR2dKOB66GNXbWJcEJgrVXPDEbfO0suqJKgVbRvzK
	 d8RdTGGr6VICLS3ZCajoLqVA2a74w8DW0aNrHbezYnWtzrCraOS0x/xAk3K6N5yTmrk57
	 CrgPhI1FakktKTDXVhMbhNL92tROjtFkM3QE3llzpVStkI68iQWIXoTbokNjiM4v7NY+K
	 S3KTTlz16RAFjeEGx+oZLC+mdOIQdXCrVg+kJLfwKJIVCu3OMNdwPrSG8VP2DHINvKLdK
	 V45RP8f6mAKJqlaD5LDYkOlIsjvPhwVcMRvvMIBlo+jYx6RGs5KU2u8+4QTFIE9zqww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793569515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=y+s8DhqIO5ki4BPjT0hMEJ5bMlWwwKI5gQlDegeYWw4=;
	b=BzofTT/7BfDJY8jxgER7DSm/3RsjP9l6dNUC3qxJ/u2Gx6fYXfshhPPhKAlAmP7TA6+z
	 3wcxvC1uEteFMF5r9L6Ru0DZntCTUgjRc1lREjSxCt/BzsQvkUcir/xNBuvd3KGeT/NnB
	 PgMlmBUnvLrfsYQE/u0EWhmN84Aw+Oa4aIFYOwla6p/n5qqON/++BYOcLmUWkkyQ52gPr
	 3Z0qN47x4G5f0pQ01f7LpPOm3v6Ex7AsvKix4CNzA/4fE9QUInEN2PPebOzvzVrzTbL8I
	 Cn8bGK0sn71luoGuc7iNMj6cY5ocNshEudjfHvlDEvD6PhezIUs4NsoofK4cUYs9LKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PBYj53EX;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86500606A324
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 21:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86500606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PBYj53EX
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso4757927a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 13:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793569513; x=1794174313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y+s8DhqIO5ki4BPjT0hMEJ5bMlWwwKI5gQlDegeYWw4=;
        b=PBYj53EXcR+XFZ1OUkSLQK1G5Yu1p55JVRReGXhjK3OTKbCbIKsywDoFBe1ACfk+07
         pcuZ2ly1EmpL5m3TzDg7asRrBcp8CJr+kf6xtBWVIcu0OBPNYJBuEaDqFNvKakZHmfAc
         oc1LTFC1axR8mvsP5LDhEI8ubHXdcl8nuhR4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793569513; x=1794174313;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y+s8DhqIO5ki4BPjT0hMEJ5bMlWwwKI5gQlDegeYWw4=;
        b=xh3lRVCi5pPq5jeoKK8VS/ZJeIW9UqQ7u7/8NbdaD1xjOPliYFG1aPv5236a/QHq36
         fznOpI2KI4XRnKlvl1RgCLwmJXuZq20s9rQtkNs24tITFikUkrSEtY+iNv3ys3rmFkTZ
         KSzhNn+gHiOgFxyhIT+ry8sFcJKbDJpclRyNP9JAA32zeA3Q+Vw4JnaykLS95lGiRx+x
         nSf1SYarbwqLE2DFqiqABfAaXqhMK9rfjLqp2SAYcSdtbEevPupbTQ5dbJSiRuIGUubQ
         QozLQYAdIPlGbJyGWGiTJpeymmpyFqGUJ0OFDq4zw5mG1FnTknzZv4GuWzidL8/LbpXH
         fCJw==
X-Forwarded-Encrypted: i=1; AKwUvBw8HxLdMq9aeyv66UBQ8XSrKX8W4p1dsvCWadK2RqE1ynrFOKW5fG/A3W5ZcxvU60woWm2EUuPD8MxDluhR@vger.kernel.org
X-Gm-Message-State: APuU4Z/devzU3HGUaWCbyCKTiU/jRexfmojXJz1QZph/vq8d94mlRUpp
	W8RkpoKNDUwloVv+S9MNlOx6EqESUFKVwfQJvnzGRcqLo/9hbEe8ZO51reQcTuLv5dA41yyYE6H
	cyrn5Cg==
X-Gm-Gg: AYBFou1VHXziXKht1Vc6e5juVfhrLFkRvkQSOBbpIHhJc/w0AyfNs6i3gCD+vVrmEIH
	8++YuG5CjJn545+uT+UI5tsArLPyCMDRfmH5BfOoL06paAXMo7/4NXAOvpj0qKJteMHadI6gGBa
	514I9kzdrN0znrrK8g1naFKot+dZKhziwsC3FXhYRNeqgpZdMoSwgRrp/nTN7Xs8ZIdZaB85pUU
	RHX27vha0vDPwuSciuP13l890CxgNV+r8WZV8bF3WATuSwyGc4issHiWKlqerLuFDqS3pbcEysa
	MUHOMa84gcPLjlSDRv4xTLyfe06/e7DtBmGhQQhJ6t35WfFo2CZbER+5ZDIX2YiT6/AJE0k7K6j
	U4xEHpnd0KpGf79PZhiLpnRm7EcihBlx6Duu3tXEcNVf8Lpp4xrynVB8cSX5aFFggLbEemPOZLa
	qpCqtfpw0kYbs+8GJ6ngjwfMCIyelUbv9H0jJpMWfBfBH99Jg4+V8eZEGcH5KxvB1gqgqTHQqMI
	BQnCeXuNzweJh5+fDlL38W7TlNZrvc3etMURbi0ChBb/DlP5ve8XpsYMzR2tia6NAQMLTYxdV1y
	cpsmbrnc8fAf0UGTm9XGIiU4HEbYBNF+fRXOUIzZST5gBHxdqEFyVs5VTsQhjzNl0VY=
X-Received: by 2002:a05:6402:13c2:b0:6b4:5870:9c03 with SMTP id 4fb4d7f45d1cf-6b4d3372ca6mr6012441a12.6.1793569512793;
        Sun, 01 Nov 2026 13:45:12 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca0f2e6sm2551019a12.27.2026.11.01.13.45.09
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 13:45:12 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b4e814214aso2451177a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 13:45:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxwtDMGSKpvjwcLdQ6L3tRIZzdM+sV/hUOOK1heXyB59UIySeGfpb9hsyQy4LWPMkQEPjyQPZZZx/WKYTXv@vger.kernel.org
X-Received: by 2002:a05:6000:41d9:b0:48e:646e:fb61 with SMTP id
 ffacd0b85a97d-48e6e305b9emr20425341f8f.34.1793569013833; Sun, 01 Nov 2026
 13:36:53 -0800 (PST)
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
 <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com>
 <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com> <CAFLszTh8geCqamVZwO00fx6t8SDfVHCFP1Fx9PnA2x9TosDKqg@mail.gmail.com>
In-Reply-To: <CAFLszTh8geCqamVZwO00fx6t8SDfVHCFP1Fx9PnA2x9TosDKqg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 13:36:42 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WGtmBxQhc+ujm3qtVgftfKupqtp9sUpg_ubeQ=-_QG-A@mail.gmail.com>
X-Gm-Features: AclHuK83p4a2Vbxf-q7Oyea7vApFkqc_qnBlge2O9IlGicuQhVVmFjLkwyEXh7A
Message-ID: <CAD=FV=WGtmBxQhc+ujm3qtVgftfKupqtp9sUpg_ubeQ=-_QG-A@mail.gmail.com>
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

Hi,

On Sun, Nov 1, 2026 at 11:34=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> Hi Doug,
>
> Doug Anderson <dianders@chromium.org> wrote:
>
> > Putting the metadata in the configuration's `description` property came
> > out of discussions with Michal Simek at LPC 2026 (where Xilinx/AMD
> > already uses configuration descriptions for similar board matching).
>
> Thanks for the background. The Xilinx case is a bit different, though:
> the same project writes the string (the binman .dts) and parses it
> (board.c), so it can change both sides together. Here the kernel would
> write the string and the Pixel bootloader and outside packaging tools
> would parse it. That makes it a cross-project ABI, and I'd rather that
> ABI were typed properties than an unwritten string format.

OK, fair enough.


> > The proposal I've tried to push a few times is that it's OK that
> > different loaders have different types of information available
> > to them, but people don't like that. They want a universal standard,
> > which nobody can come up with.
>
> I agree with you here. We don't need a universal set. I've sent a
> proposed spec change [1] which lets a configuration node hold one or
> more match sub-nodes. Each one names its scheme with a vendor-prefixed
> compatible string and carries the properties that scheme defines, for
> example:
>
>     conf-1 {
>         compatible =3D "google,lga-...";
>         ...
>         match-1 {
>             compatible =3D "google,board-id";
>             board-id =3D <...>;
>             board-rev =3D <...>;
>             soc-id =3D <...>;
>             soc-rev =3D <...>;
>         };
>     };
>
> Trogdor would use its own scheme (board name as a string, rev and SKU
> as u32),

Sure. For now I might just leave the "match-" out for Trogdor and
simply have the config file simply be a list of DTBs. Trogdor
currently boots OK with the "compatible" strings. Maybe Chen-Yu will
want to propose something for a newer Chromebook where he can take
full advantage of it. :-)


> and Michal's loader could do the same. Each loader still gets
> what it needs, the types are explicit, and nobody has to parse
> 'description'. Please can you take a look and comment there? If it
> works for you, you can point to it in v2.

That looks reasonable to me. Do I need to respond directly to the
github proposal, or is my response here OK?

Yeah, I can point to it in v2.


> > Should I give it a shot for v2?
>
> Yes please. The DTB list already reaches make_fit.py from the Makefile
> through the @file argument, so the new file only has to say which DTBs
> to include and what metadata each one gets.

FWIW, I still liked the idea of limiting the DTBs that were actually
compiled based on the list of DTBs included in the FIT image. My
current v2 draft still has that feature. It adds an argument to
make_fit.py where we can give it the "fitconfig" file and it can spit
out the list of dtbs. Then the kernel Makefiles use this to limit
things. If you don't like that idea, though, it wouldn't be the end of
the world to (slightly wastefully) compile a bunch of DTBs that we
don't need.


> We'll need a simple
> per-platform file next to the .dts files, passed with a new option
> through FIT_EXTRA_ARGS

At the moment my v2 draft doesn't just use the FIT_EXTRA_ARGS but uses
something like this (which will be documented).

FIT_CONFIG=3Dgoogle/lga.fitconfig

Hopefully that looks good.


> Running fdtfactor can then be another make_fit.py option, like --decompos=
e-dtbs
>
> [1] https://github.com/open-source-firmware/flat-image-tree/pull/66

I don't think it buys us anything to have make_fit call fdtfactor
directly, does it? The kernel build can just call it. That also makes
it easier for people to pass non-standard options into fdtfactor if
they want (via FDTFACTOR_ARGS)

-Doug
