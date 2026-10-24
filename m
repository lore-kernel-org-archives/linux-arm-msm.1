Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829840;
	b=wVuz749ALyF5aNDom9PsshPpx0JTvRwL18WVGHIKh+McWhmUMZ2/I2E2/eTasIVFdLES
	 wlzq4nD6rXmr8+1YCYI7nm13CvMMFaUzD+NRiDmlel4TP0omFUnNxA+r5U973W6ok5m2Q
	 EzmytyMht2ozLcE6GQWvNj9nR7E0q6h4W91wPmYXY0lg6LW1VNxmUDNtYxV+HgID8U7jA
	 /wlm1pkgkA2mgNANvrHcckds2LTMbfytDeYdMtNk3ygHBBoOdNGY5mfOZUpYgAy1VpGBv
	 08h9/8iq01bRD2wIKUOsRASKb4zrWUl3Pid1oI8NIZ+9xw0SMJ9Nsp4cg75XIfdPZwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=hmSpVMPxaxNz8ENjMhpdf7ua68LrA5ybGxRvYwN8M/o=;
	b=y2GhAae2QNjbTjhbg0gNWq+dK5YOnJwHaZfQRF++NevvgQ+CUNwA5MilcHRImQY3HXVN
	 q5z7Ux3x3pklAV8FWZ8fEVKx8FMAQdvHfX1rDamx4T3aPBa2H+guM/yNzEwexh7koeIX9
	 gF1Bdko+8QqSSq62wyDMudsflYXvHPhUtUBS3m9+Hq+6nQ2MdJYA/0vJHiB9qled30taT
	 V06N+l+1RPD7J+/8aINM+VVH12p6x5oSFsEqs3tAF6c9zEh58yodd9S4oLS4yB3HBtCWf
	 Lp65fri26MPuzJ6rIHQCHZsJgjDq1VNFst4/0hNpv6JKRwC2EwG/8ecyXS66w2aPMmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ErxrGqoP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED8E606A31E
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 08:17:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ED8E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ErxrGqoP
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd5c9e52398so582950a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 01:17:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829839; cv=none;
        d=google.com; s=arc-20260327;
        b=g643NdRFQaZNc8gN/COSaz6RTErxoZpaKBhQbbX6J9p3yh1z11DiUijFl0G9YhbNU/
         KQznERdpW3HvOIEhxFJv0WWlyqnqaLEwrCruUoRZta810DXmcGhFDRBmaAf1cZEXWVYb
         0dqQnqP7reG2y+5SINdPu5tSu07+G91giu+e6tBpGcIHlX5L/tbugDm/nEBXOY/TjsqP
         LacVdymUTaUhb69FeoslUcc0WqbcbJvOJ7EakGLM9cCxpU9Nq+GtPPN7l9iRX0tA42ee
         CZGszXRzPnN+c2NrWTevMtUkHm3VqetD73B3Q72U0sl3ebFFUthoUz3wywATUEOwrlfJ
         8jXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=hmSpVMPxaxNz8ENjMhpdf7ua68LrA5ybGxRvYwN8M/o=;
        fh=a6UxW4MB0WudSr8bElDGqLc4JWz1cQMn+0wVTV+PQmY=;
        b=VQvFxhQeWGidAx9FjqmgcD1GWQOkvaCo7XIxjNkQO/M7hWE7xA488vdJRVCqdkmMB4
         ixOW9MfG+9CzZhGxNyIjIG9JecbqlYkec2HZNJbHAN7BOiM6kd3SPGstCuENdaDk2/dT
         tBb1+wd4zdZ9om7ueDeInksfNBl3oyg8dLGmwV+2igiQ3MFvQyk7CmxN9GnpZ67ij+AY
         PikX42NorZJl08dIrHOHzkkbSSUZAZwam37VLHc2WfA1qqokq7H2Md8VUpSUjNpPGJTl
         N48P9itJ6Yu9h7s51s1ms0m2ftiyjq9rcH1CE0AVc9Z73nYdglUaFOKGfM+e45N0HWHD
         4J7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829839; x=1793434639; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hmSpVMPxaxNz8ENjMhpdf7ua68LrA5ybGxRvYwN8M/o=;
        b=ErxrGqoPZ/nb9CghxeboTYWi19dHZA+oLth5nqNwXEPLgCivWeROkUq1jgI00pLPis
         mnvEJZESOATfA4bwGakbWHbrbZfTg6q/+BsXRBGx/nCeAqO9mecP3eklEPue7ZRetFgl
         WAQbY6p0/CHxOoA6764p2Z33kLx+HvfLIdMSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829839; x=1793434639;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hmSpVMPxaxNz8ENjMhpdf7ua68LrA5ybGxRvYwN8M/o=;
        b=njQM9I5swFtFKHWrQOu5gFR7UHFVBjP23nGhL3P8102a5JIyBm/uXjPnpbMJ9fEdtr
         v0X7pKFb+qbPoMYo9vCZzOrZCAkQJpJPlVBSYkZTBNz2K4grBeSLpvpLEm7EgzehBgXM
         LQ2vtTImHK6YaHGkYU4uJDrwyFuRz6Hlg1W6YYUgfPjZkGh5/TlV29yFnvrlfHRRuMuh
         SVSCjmYba6GHcSH7rg5f3JmpygbDFnOKeX4GBOrDLHuuzhAnC764849ZwSUNMRuVyv4k
         90jPv7w1CjxoCGH31jFEumPq6eSa33KarKL1FW5rvcn4DfHLbvVWR9qUgWEIEPYoFuwa
         Q1AQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvjKk6zCV4zjWLLfnXAqITRPmWz8duJIYYbDykTGriRShsvBoItwX5Uif8S0spwsxlwXuRT19Jd4pq0kWS@vger.kernel.org
X-Gm-Message-State: AFq9FYJp2VJ6xL00rDhAo0Vo188h0jqI2rqz8xXuIlUhXplw7xwfho8L
	x6BYsFJgWCvajxrCQUP4TR/0oTutmTp8HRuwLMfMwt0+wh07PY0OM2IX/m31GhGbc4vsJDFrHpp
	IJBroAvkbfczNPCtD3U4G98WQzcoqpPYryNC1K1pn
X-Gm-Gg: AYBFou3MLNsjvbsgoW73o8cRMyAXmqEdlbrnnLDd029fYqkTAJ+duzvq6xkc4PfymBp
	NAVFgKaCVp50oA0Qsim4Q0yuCX/y2TBVrW8LrrEGszvyOR3pNqSa9598TSGj87957lVEwWiCf9X
	YxFlySsnTM83Pyt07lxuN4VVb/RizekN2FIhWt2/4VRywry4B7eB7ZxJEYwHLVCr+zp5Bq2qxqC
	35oIg8HII9CQPY5JVp/RJhUIPCRO9k70QsGf5XZA9O9Wwv3mq+YNBmR77DhBjmN4JkIVEcq6+Jv
	8b2W44Tf98DKgzgr+oxp/RgzWmRjMg2GOP1NSMgTaO1Ql0VSXiroKVsIVtq3UFqJUJpnUolf807
	HOmNXfzVmC9bcYgMYUzeaWJbUd8TR0CKElMm1
X-Received: by 2002:a17:90b:2891:b0:3ad:4a8b:c6e1 with SMTP id
 98e67ed59e1d1-3adea9dca56mr1447422a91.19.1792829839011; Sat, 24 Oct 2026
 01:17:19 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:14 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:13:02 -0700
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:14 -0700
X-Gm-Features: AclHuK-tg0PdtuvuCVecn4H2MwI1d9lfukkzfH1KNqgDlJ_Y2JdAvjK8N50Iivk
Message-ID: <CAFLszTh6vmFGVD4_Reewe9p4QqQjN=CVJ3SgfQKosAhedJpAQA@mail.gmail.com>
Subject: Re: [RFC PATCH 5/7] kbuild: fit: Add opt-in FIT_FACTOR_DTBS support
 using fdtfactor
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
	Alice Ryhl <aliceryhl@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Marco Elver <elver@google.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> kbuild: fit: Add opt-in FIT_FACTOR_DTBS support using fdtfactor
>
> Add opt-in support for factoring the DTBs inside a compiled FIT image
> into shared base DTBs and per-board overlays using `fdtfactor` when
> `FIT_FACTOR_DTBS=1` is passed to make:

Please can you add a short paragraph at the start saying why this is
wanted (the bootloader needs a base DTB plus a per-board DTBO) and
where fdtfactor comes from? It is not in scripts/dtc, so someone
reading the git log won't know where the tool lives or which version
is needed. A link to the dtc series would help.

>
> - When `FIT_FACTOR_DTBS` is set, pass `-@ -L` to `dtc` for the DTBs
>   included in the FIT image so they retain `/__symbols__` and
>   `/__local_fixups__` metadata needed for factoring.
> - Run `$(FDTFACTOR) $(FDTFACTOR_ARGS) -f $@` (with `FDTFACTOR_ARGS`
>   defaulting to `--strip-local-fixups`) at the end of `cmd_fit` and
>   `cmd_fit_its` when `FIT_FACTOR_DTBS` is set.
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  scripts/Makefile.dtbs |  8 ++++++++
>  scripts/Makefile.lib  | 18 ++++++++++++------
>  2 files changed, 20 insertions(+), 6 deletions(-)

> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> @@ -425,6 +425,8 @@ quiet_cmd_uimage = UIMAGE  $@
>  MAKE_FIT := $(srctree)/scripts/make_fit.py
> +FDTFACTOR ?= fdtfactor
> +FDTFACTOR_ARGS ?= --strip-local-fixups

Patches 1-3 go to some trouble to build fdtget and fdtput in-tree, and
cmd_fit_its puts scripts/dtc on the PATH, but fdtfactor comes from the
host. So FIT_FACTOR_DTBS=1 uses whatever fdtfactor happens to be on
the PATH, and the build does not depend on it. Is the plan to sync
fdtfactor.c into scripts/dtc once it lands upstream? If so, it would
be worth saying so under the --- line.

> diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
> @@ -137,6 +137,14 @@ DTC_FLAGS += -Wnode_name_chars_strict \
> +# When FIT_FACTOR_DTBS is set, pass -@ -L to dtc so the built DTBs retain the
> +# /__symbols__ and /__local_fixups__ nodes required by fdtfactor.
> +ifneq ($(FIT_FACTOR_DTBS),)
> +ifneq ($(filter arch/$(SRCARCH)/boot/dts%, $(obj)),)
> +DTC_FLAGS += -@ -L
> +endif
> +endif

One thing I'd like to check is composite DTBs (the foo-dtbs :=
base.dtb bar.dtbo entries built by cmd_fdtoverlay). My understanding
is that fdt_overlay_apply() merges the overlay's __symbols__ into the
base but drops its __local_fixups__ after using them to renumber
phandles inside the overlay. So the __local_fixups__ in a composite
DTB only cover the base part, even though both inputs were built with
-L

This doesn't affect lga or trogdor, but the make_fit.py path packs
every DTB in dtbs-list, and qcom has lots of composite entries
(lemans-evk-camera.dtb, etc). If fdtfactor relies on __local_fixups__
to find phandle properties, it may silently produce a bad overlay for
these. Please can you check this? It might be enough to detect such
DTBs and skip or refuse them.

> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> @@ -486,7 +490,9 @@ quiet_cmd_fit_its = FIT     $@
> -		done
> +		done \
> +		$(if $(FIT_FACTOR_DTBS),; $(FDTFACTOR) $(FDTFACTOR_ARGS) \
> +			$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) -f $@)

Just to check, does fdtfactor handle compressed DTBs in the FIT, i.e.
nodes with compression = 'lz4' as in sc7180-trogdor.its from patch 7?
If not, FIT_FACTOR_DTBS=1 with that .its will either fail or silently
skip the DTBs. Either way, it would be worth mentioning in the commit
message.

Regards,
Simon
