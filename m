Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793561696;
	b=FdaJA6C1ovxCVwrBqm88YBbrRU9olhMPeRbvMxKyHA5CBOkLnbjXT1hg8K4WTMBwLy5R
	 YBHsOrQwCRY0jYkmXXNtNn5cGkmz9lA1AOm7+DmE61jdtxJYGRbUweytGBVIQf1QonlG1
	 3R13KXfuscrCEzTv7KKYSmugsHmW+H4moEv9D91I/hp0sYQZ76OtojGWmMKt2vQsmKXSY
	 619CdFMGz9OtUQEcd+aMlsGVE9264tPlHCRkuAPkPtjWkiyRFlpowYa1wUFtRHKodhe/e
	 7i8z1ZiHp2k7cGmOSH9L3LGujWR/AJoadtvBmsA5Jprvb5Bs2j2rOF2DhpYEelWWM2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793561696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:from:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=wdJlAy0M0lu3nCDv3njq9XZb0WjIsN4409XaMh24jfs=;
	b=Q6kln8G2k5eUI2MtuKSEYEE45+OyHYRF7AitoFzuwJsUh+MQx3fV1fjiy3y9+yKtaOtv
	 V+3cNdbs/Kg+ZG5jjDET/S6kMWl9y3/A7lPh4vB1cbyfMo1R5th+t2HMjCnI3tp9babMG
	 N9/awpnZ0cyEjo/xqtnlPq4CFa190Gl2aNyXqMXS0qpTVulaPtYI3h30xiFXmOuNnlzpq
	 q7XmvtOv8mew8fxXzPLDJ1zYO6DGsi7Ey2ndc/ejJum1TLBFWj1D3YcSLRrwAPt6hGrg4
	 DQC6JfkzuqYq0ZdHsZlCOTdkeXdQd+IHSdFUnvNgmLksSJy0tqOLkJ5doIQe71HVogg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Lfqcc5GG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5623606A324
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 19:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5623606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Lfqcc5GG
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6acb9c018ffso3411178a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 11:34:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793561694; cv=none;
        d=google.com; s=arc-20260327;
        b=FaDBy4oXwMW1XU5ouNJj6sibYTCRRML7CtMu1/pU8mGdxwUkwsoX13XpuZXaRZ5GWb
         +uFAAX3tOv9vZJoBJMGzLNBrgPPypCIbUP7G7SyNJfbeXMXYqSlFlUawmaKecLk+QlaX
         jHqOj7LGsUcrkXwHZ7Ubf8EVrBYpTDQlV9U0H4b8A+Je6sueEyVgnE28b6EViYj8YzpR
         y7oJghLwS3GaIQ1/4Lex75xRQPk5ZRmW5apmJyBWtL7U6kQ4jdHa3FBi6mRF//wNeWyp
         GVqccQ7Eh97gePcLXSenelr9WKuCnzb/jW+pbyZBF1UDCv8VM4zcjC7jxMyGj8YDVaVg
         T+Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=wdJlAy0M0lu3nCDv3njq9XZb0WjIsN4409XaMh24jfs=;
        fh=p0LRhEwVgeZ5qWDvL7RjOlqVcQFejknwUblpGwLNyJ8=;
        b=Ouv7RZs2n2WTHCHuXK27hE5Lh9SMwkJ3QwX9gsspSJoyrtvRYON1ufRgslO5GpP9s+
         BI3gvsEch4HvuyZVvC7AYsxlhHGJ5sJwSl1WELtHs16farIG5GmvI9pr58CA039lZdBL
         I7InOuTpKAZ32A08/8v4PrCasJU72EDLPOJ2eTUcNV7BNCDBbGIrjMWH6qG6q2nxpHol
         Gg+RSGv9I9svC7ayRGpp53WZCu11aWX487lEVUEMIuBj+4RYjeAFWWOetTnN723Vhsep
         Jj7znqtbWEiqIMuN72ifU47rBaOZz2CfMSUbdB2HclSJQttnnlc7AY+3ty3Uuni8FJ+N
         teHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793561694; x=1794166494; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wdJlAy0M0lu3nCDv3njq9XZb0WjIsN4409XaMh24jfs=;
        b=Lfqcc5GG/SwjR7rhF6i9wN+51zewpGS58ukrmB9LGRdbbpKdip3M+YroJNl6U5AaZ4
         rF//L/DV6VSxmy/1UQsFeJhmoDWwkPFReDLBiC+oRpU55av1FrMnZVBw20fY7l4UynL3
         HVfRKiNvpd9FUkbDQyR76hW+g1Owj32N3MUEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793561694; x=1794166494;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wdJlAy0M0lu3nCDv3njq9XZb0WjIsN4409XaMh24jfs=;
        b=W2JCqnIFgFjI8xvUIz1xK5coBbL0Trmpq54IokEvoTtfIDrnfxBgHOzmr715cy5knc
         Kmprkc/f/VxT5Oh8yjaNIU/qmFeFoF4niQMu2ZBUZlTJroEqB6hbz4u0saQBSq12MErR
         YMVUmF5SRUhSwMBiysI10t0LO0tXC8pOf1ePDgHEcvS9VkVv3vKMSf3UB5IRpMtFokHM
         scrFmev02nE5HdiPskzOm/zk7lFLRC7eVc8OxV4F6w70HKpyEqMWaxqS2erQs4IKT71i
         3gh6sia4/Dn6EwUBH2WyaLrKItOjuTvZ45qVMTFIpLD3XoNRuME/EqKRhxdsOkzmF48e
         hxXg==
X-Forwarded-Encrypted: i=1; AKwUvBzUMsq3T6hkIiYuKdURJW8pXVBQmPLWKHvhDrIWvI3vdpknlSmCzRBs1pgqTTaAYNURULrtXknRVeg6Rlb1@vger.kernel.org
X-Gm-Message-State: APuU4Z9S9/5ZfXJSMTXhMTI5fjsRMC7RraQ/F2+pIUurBxwuur538enj
	v2vWDK0MphQ2wIO4x8i94bqmxR3LEFk082Md5uAgvFFOlLfW18PBWfcG4UKIyuubv4OUOBObOll
	SSB+92IGnGi/G/gdvhwn3mffTEuB0/VyjeS0l7mIY
X-Gm-Gg: AYBFou2MZrbBWRjd5PvKSaBu4ZC4s6D0Oc6YiRGBVWtuiiTjnho6lwVBPlOutM7WeQ1
	PW4FyzDxAeCno//9dqaHV/DVyaPHxMELrXbcMasrNqjnl3e/V4H+mBoqrSsl5AX7TMsiJax5UIa
	ob8vTkxtYIY5nEUSCizUwcKpGsNUVElhuYiMUVcYUMvMWrAmXUZimRhQsnoMd/wdVZajxuAtobD
	dn4l0zTmsNmRi1MLPjQGof61STqmC/GvHNqwH2sn0z5znoAfuAWGWmcsLSyTNK4wAHZo3KCYgKq
	MSzywi1643Ezln4tOxGXWJrkBq5uTB9nepR5RXpnQcKoHhRi9vSfZ+QybNbu4cxAnpbc9Zi5BI4
	CAJ8Ydb4CHWXtWwD3CstIV2swzcQYpLChaZHlgN4rSkS6VkmogaDD+C/eenySJ7NyrSGAJuXL
X-Received: by 2002:aa7:da45:0:b0:6b3:e89b:128f with SMTP id
 4fb4d7f45d1cf-6b4d4d6d938mr4052419a12.9.1793561694122; Sun, 01 Nov 2026
 11:34:54 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 11:34:51 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 11:34:38 -0800
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
from: Simon Glass <sjg@chromium.org>
In-Reply-To: <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
References: <20261020153652.2907186-1-dianders@chromium.org>
 <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com> <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
Date: Sun, 1 Nov 2026 11:34:51 -0800
X-Gm-Features: AclHuK-OENc2MfogrHTK6nr_VXdYPKQaHTgRVjZY6Us3vAfjaHxM1Qejmm0CbCs
Message-ID: <CAFLszTh8geCqamVZwO00fx6t8SDfVHCFP1Fx9PnA2x9TosDKqg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] arm64: Add fit images for sc7180-trogdor and google,lga
To: Doug Anderson <dianders@chromium.org>
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

Hi Doug,

Doug Anderson <dianders@chromium.org> wrote:

> Putting the metadata in the configuration's `description` property came
> out of discussions with Michal Simek at LPC 2026 (where Xilinx/AMD
> already uses configuration descriptions for similar board matching).

Thanks for the background. The Xilinx case is a bit different, though:
the same project writes the string (the binman .dts) and parses it
(board.c), so it can change both sides together. Here the kernel would
write the string and the Pixel bootloader and outside packaging tools
would parse it. That makes it a cross-project ABI, and I'd rather that
ABI were typed properties than an unwritten string format.

> The proposal I've tried to push a few times is that it's OK that
> different loaders have different types of information available
> to them, but people don't like that. They want a universal standard,
> which nobody can come up with.

I agree with you here. We don't need a universal set. I've sent a
proposed spec change [1] which lets a configuration node hold one or
more match sub-nodes. Each one names its scheme with a vendor-prefixed
compatible string and carries the properties that scheme defines, for
example:

    conf-1 {
        compatible = "google,lga-...";
        ...
        match-1 {
            compatible = "google,board-id";
            board-id = <...>;
            board-rev = <...>;
            soc-id = <...>;
            soc-rev = <...>;
        };
    };

Trogdor would use its own scheme (board name as a string, rev and SKU
as u32), and Michal's loader could do the same. Each loader still gets
what it needs, the types are explicit, and nobody has to parse
'description'. Please can you take a look and comment there? If it
works for you, you can point to it in v2.

> Should I give it a shot for v2?

Yes please. The DTB list already reaches make_fit.py from the Makefile
through the @file argument, so the new file only has to say which DTBs
to include and what metadata each one gets. We'll need a simple
per-platform file next to the .dts files, passed with a new option
through FIT_EXTRA_ARGS

Running fdtfactor can then be another make_fit.py option, like --decompose-dtbs

[1] https://github.com/open-source-firmware/flat-image-tree/pull/66

Regards,
Simon
