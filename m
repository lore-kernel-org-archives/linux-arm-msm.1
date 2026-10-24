Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829829;
	b=r6dDLB3Hpgv4LOzzcqoUJ4YPrFayVbA4qh3ADsM/Hcm0uB1OLO+9wuU8n2XT08KYpU1w
	 egzdXNrISsnorpq+8XMlLLm9kuytE+XYEHyLXwGR+N4pb2b5g5saqpsZaH8AyZ/PDqzhM
	 v06EwziH6UJzQfoMwrLeZc2ZBHVar5ig4WA0IFEV9z7aD2JNL9cnU9TlSDO2EPmJChyCw
	 CpyFyT5+uI8YCvQIEERrb27mFaauRvSc+a5zOzFy92j8Vb/QLF4nSHtRf/RVdr9FGj6bH
	 AvZxrAa5YKmv0+e5GgyZ549i0eUIK9K11OVZolCWg0puIgxUqOjDIJKqPHIedc9ftoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=EbwGmFVvCxw7pb1kddFLIfy9dvMVnOkwwNvXwS42h3c=;
	b=x5p4L/hEUs6b+O+/qjmnOKY8Gk6RIrRU6hMagn9mfvHb+1hraw2NRwLILdNYOrgnKkR5
	 qrpKLXJid6Ai9/fTXAbPJHHkoYvG2oC93e0zUoLxm8lYasxDiLdGNKJmqvBDfrNEG8e3j
	 9uJPOjRZybIhVd6joqnALjUZ/BCPoQt6t5bgJdiV40w+E2mb7PIjTeyQ7QYtM/LAdl+K7
	 AIjbnh4W3IxbKwLTESPXQ98FKwePBkecaDM/Fd1ZizRtIH5NnZ+m9ZbKsLMo8ePovwnrS
	 cTHSZ43Y7WeMDhg3QGdY3z4ddGiqrIPgd8vrGY7SGbqDWQkCFIaH4C5pNVdpfYqhDeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QwTwqqUY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3B0606A33B
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 08:17:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE3B0606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QwTwqqUY
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1afcd2d23so2209382a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 01:17:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829827; cv=none;
        d=google.com; s=arc-20260327;
        b=QItBA4SdGXEuG2Sl6UnhGk6/R8T3Guw8h3Bm9W6LHLo0K1yPnOpXAwgBTwVt0oIN1o
         +T1t5VohG3vTEl2B0L0zQs4H5YNnJQkZlNlhg0O93hlhg8F3BcVPzjMtVuBIxAp6h7tg
         kp/rjfu5a5cSyXbiBMju45R86pAI72TIdlFua9da2G7oCLFDS8fQrl0kG0ehQAIIMmsQ
         CpAigKyxC3uHtlPsKRlRa5Tv61XMJRqwmSGNz6zmkwdOADsh6z61rFGOGP9M3UxXBVca
         VKgDndlrJY432M7PkzfaWyclnYgqhgqEqYPo/+kcXTSg1KVw7jf0RcJe78Z2CMybAbd6
         URLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=EbwGmFVvCxw7pb1kddFLIfy9dvMVnOkwwNvXwS42h3c=;
        fh=n8DegjbIFfdBwUONovhDQ5iDxePPM7beO8idYKH9uWE=;
        b=jkwTiAK4Cx7BGRa86Zda72/TMNINVgs5JLqlJB71JOmtfYB5NnnNMPJ4ST2kWgGuX6
         faMeuz4ibj1cAGtUFepyizDaBHCy/ZdW0uIQypJuodGKbgyQzBoC2rZc63AHZkPI+G0O
         ulXQkpLbI5VdLFmccVvcKK5MlPiGlNB4Bl0yN6js66c1tunUiErFzGd0XoHzibrVoYhy
         9vhUHVP4DQY/eTJrOMqeb1dM+hjzbatQFPz3j9oJDpv6iI839TX3ze3IHECNXkqifHsi
         fOINOLNTlOdI7O8DHVAM5hCOjaU7pcahzd2yybTCgu0GvEkKb2ZLoxaY7aHjJTJF0Iff
         JJ/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829827; x=1793434627; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EbwGmFVvCxw7pb1kddFLIfy9dvMVnOkwwNvXwS42h3c=;
        b=QwTwqqUYzR4KMcjZ6tN3E7hw4q93B9dRCKd+92TnzApqiNKVxy9e3nOyWW54DY3jbg
         Ojsm+hc5971JCcfIrnwHh5AOki5VuhkbJKi2mOzK7wpGE4KFLMdJKywO6CuWLrvqLilv
         4iZB7FUgOsGFsggrv3fVelxSSBSYmX9hCrd+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829827; x=1793434627;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EbwGmFVvCxw7pb1kddFLIfy9dvMVnOkwwNvXwS42h3c=;
        b=oaCK3UHyeGlVBYO7UPyOQealOK4CLhnMiBniAPxu1PydFJtvGsWGphmh/8klPvrCk8
         vwAwTgMMLAuufHdY9EVolB2wUsc977Sv6f+Q8qgKnyT5JDR25yAJljcPUH/CU86q4A1t
         Cp6gqaDLbKjZJ/TGATf3cUvXaCi0CIfz9GyErc/SwHI2LiWutSRxyt8m3yA4HclFMoCY
         FDN0dCf1dL0dsLfjXZXl52f6iHSX47vchoHYa2dbaElDeYDD505biLSVKYLoM/7A/5dG
         rNz+gp6zOwoPI9kdXVMGKlLIQmFyKh1ZgtWPlhYrVHuyI+mWbfp2bFsvpUDfOqyvs9Rs
         FtgA==
X-Forwarded-Encrypted: i=1; AKwUvBxL4OBsTTaEw6pRWdUSvXaFcrw4PMaOXsSElr5eRVV/mBjn046J9i7HoxulbqE8ScsddMZJBXeniUXH0EYZ@vger.kernel.org
X-Gm-Message-State: AFq9FYIib0ScHW9fNh8lOvw6KIrYLIR7iCYGseZ1SOwzo4DTcnP8Tfpr
	ZnbBV5O4gJnnxk0icLw2H/Xhi/P8ecik7TTJh5tT+wfvjvDjyd/fgnznYt+eQwjA+JCLkVsVfM/
	eWqn+VFyHP83+N4bD3tsXZlU4F5bOVhDWWfSHmwuX
X-Gm-Gg: AYBFou31Aslq/KSHBHSmaEpBMSbcU4/NyjIxaDC7pm/Xj8EKvJnH4RCMh9YtL9d0ppV
	g38ljsXAPxsHkiU/DK/ITDnQqx8N1qk6z9lCvdWm/j2PQFxvWFPo3d+zNYPxwSN1zk+cis9DlRo
	KPsP0N/cDrZoCVR5GlRM9ujPmoEilX+L2FYlQmDW2oec0tRckwupwLLjCu/rXKwafNOnDULYd3M
	s9xLjJbDpTqyTJRxl+GDLYsjmPewCLPmIB8y8E11akAMIhPiF9+hQ7SCVCWhsD3nCOGjklMkV4A
	pk/y3PCXQ+KpUqxHV02qAjQSM/MhOwo4rpvosHZAeWhUpRRj/9Z+gtcCXAylXMc+tRb8lX07DUZ
	fuMkLb/h0X4mXrNdFh2gFA4bNh4GrjT5JooQYYwKBJlLCU4m6hx3QVWET
X-Received: by 2002:a05:6402:e0d:b0:6b4:20bc:f94 with SMTP id
 4fb4d7f45d1cf-6b442fd5c0emr1861005a12.19.1792829827097; Sat, 24 Oct 2026
 01:17:07 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:03 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 00:46:35 -0700
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.4.I5cd8aab4380bc4cfd302c4e4708af58c43370715@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.4.I5cd8aab4380bc4cfd302c4e4708af58c43370715@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:03 -0700
X-Gm-Features: AclHuK9YCJ7Mk4mSQDTbJDAZNMre28fNrdZjyMOx5ekb1ShhYgH8OFHnaV7iO1Y
Message-ID: <CAFLszTg6B2p30-RcmO6fk+2mdHwSdghU6PXotz0m=gqdk5dRNg@mail.gmail.com>
Subject: Re: [RFC PATCH 4/7] arm64: boot: Support building image.fit from a
 specified FIT_ITS script
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Andrew Jones <andrew.jones@linux.dev>, Breno Leitao <leitao@debian.org>, 
	David Sterba <dsterba@suse.com>, Gary Guo <gary@garyguo.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Luis Augenstein <luis.augenstein@tngtech.com>, 
	Marco Elver <elver@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	Peter Zijlstra <peterz@infradead.org>, Rong Xu <xur@google.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> arm64: boot: Support building image.fit from a specified FIT_ITS script

Most of this patch is generic kbuild rather than arm64: the top-level
Makefile clean pattern, cmd_lz4_frame, the compressed .dtb rules, the
dtb-y filtering in Makefile.dtbs and the FIT_ITS handling in
Makefile.lib. Please can you split the lz4-frame and compressed-DTB
rules into their own 'kbuild:' patch, with the kbuild maintainers on
Cc?

>
> Allow passing `FIT_ITS=<path>` on the make command line (relative to
> either `$(srctree)` or `arch/arm64/boot/dts/`) when building `image.fit`
> to assemble the FIT image from a checked-in `.its` script via `mkimage`
> instead of auto-generating a FIT image with `scripts/make_fit.py`. When
> `FIT_ITS` is not specified, `image.fit` continues to be built using
> `scripts/make_fit.py` as before.
>
> Supporting a checked-in `.its` script includes:
> - Adding `cmd_lz4_frame` (`Image-framed.lz4` and `%.dtb.lz4`) for
>   standard LZ4 frame compression (magic `0x184d2204`) expected by FIT
>   bootloaders such as U-Boot and depthcharge, plus generic compressed
>   DTB rules (`bz2`, `gz`, `lz4`, `lzma`, `lzo`, `zst`, `xz`) in
>   `scripts/Makefile.dtbs`.
> - Restricting `$(dtb-y)` to the DTBs referenced via `/incbin/(...)` in
>   `$(FIT_ITS)` and automatically building the referenced kernel image
>   target (e.g. `Image-framed.lz4`) and any compressed `.dtb.<ext>`
>   blobs.
> - Populating any omitted `compatible` property on
> [...]
>
>  Makefile                 |  2 +-
>  arch/arm64/Makefile      |  3 +++
>  arch/arm64/boot/Makefile |  9 +++++---
>  scripts/Makefile.dtbs    | 43 ++++++++++++++++++++++++++++++++++-
>  scripts/Makefile.lib     | 59 ++++++++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 111 insertions(+), 5 deletions(-)

> diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
> @@ -5,6 +5,26 @@ all-dtb := $(dtb-y) $(dtb-)
> +ifdef FIT_ITS_FILE
> +ifneq ($(filter arch/$(SRCARCH)/boot/dts%, $(obj)),)
> +its-dtb-files := $(notdir $(shell $(call fit_its_incbin,\.dtb)))

Just to check, is it intended that this also restricts 'make dtbs' and
'make dtbs_install' whenever FIT_ITS is set, not just image.fit? If
so, please say so in the commit message. Also, matching on notdir
means a DTB with the same name in another vendor directory would be
built too. There are no such duplicates today, but comparing the
directory with $(obj) would be more robust.

> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> @@ -429,6 +436,58 @@ quiet_cmd_fit = FIT     $@
> +			fdt=$$(fdtget $@ $$conf fdt); \
> +			inc=$$($(call fit_its_incbin,\.dtb,$$fdt)); \
> +			dtb="$(objtree)/$${inc%.dtb*}.dtb"; \
> +			compat=$$(fdtget -ts "$$dtb" / compatible); \

A FIT configuration can list more than one fdt (a base followed by
overlays, e.g. fdt = 'fdt-1', 'fdt-2'). Then $$fdt is 'fdt-1 fdt-2',
the sed range never matches, $$inc is empty and fdtget fails on
'$(objtree)/.dtb', breaking the build. Please can you use only the
first word here, since the base DTB carries the root compatible?

> +		configs=$$(fdtget -l $@ /configurations); \
> +		for c in $$configs; do \

BTW, adding 'compatible' to the configuration nodes after mkimage runs
would break any configuration signature, since the properties of a
signed config node are hashed. mkimage isn't given -k here, so signing
isn't supported anyway, but a comment would stop someone adding
signing later without noticing.

Regards,
Simon
