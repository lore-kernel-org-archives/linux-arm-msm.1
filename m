Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829855;
	b=zMC+nTkUmZL09SvF2iX03YGAdTAqkgkYRj6wDs90CjL0N5BNSg261W0XUmk3masPIXyM
	 e3TdvDfDDCqvawchVjzAKKMZBt9z7i0a2wtAT0mimqOpt0UrGJ++vc+9P0pf47BFv+Jxk
	 a3axOwmEXjLTIuoqY7Eb79db8smh9tXDI+36VAsRGrToanYilRLmUD1nGmqSNoBvfXZ/f
	 oCHlwOoFXbnChU54OlYW4F4cARhU8Q2rc4aJALnhKkAM7Naykh3RUJ+C7R8hfNe0tOp79
	 CgEtjhur6Z7SJJZam+LOB8uZEJm5fk8fjhSm5SOuEArdTLefucxRg/w2QKuY1oazJHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=f/c+EwpzzrIdTL0a0bddGX7KBZ15+Zku2avwoxWG2Wk=;
	b=SCh1plhjeM//03Jh4dZEenGi3U09zw3Yzx2l91wyIwgP7/6kJw0WR7JOip65W90BscZB
	 w7RwpuT7XS/0fUhZMK7DsBQooh5ENm6YyE3quSJD/tHcb3b40R3R9hCBxMGacrsRaGnJD
	 mdnpZXU6dLSiIKaIfYBhiQI3goxzmWl+u/23G5DKJV5YTkVHEPaZH6rSyEcvhCbg6i94m
	 G6ygST+6dWAfzubNOuJoTHxkSpLlaswlwt8lvAOjLsy/OT8skty0/TG2aEWVy0RSmFG0I
	 nTP2tA9JOXHeBVaasFtxrpX4I6jKBB41sZIwiVcWEBOe5WkpwTmQEKE6X5Ch/oinJzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=k059ccS5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29529606A322
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 08:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29529606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=k059ccS5
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so1314311a91.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 01:17:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829854; cv=none;
        d=google.com; s=arc-20260327;
        b=f3W086oUnRlD524b6fjIcp/uwJp7ibcudlY+mcM7G07E8EfdYQ1areqkhFHBQbqaW1
         yieSIMR6+t9n1enN8Z6HfjE4Qx4nhpI2dtlRJ81s13N0J5kI/TcvX79r1OVGvIv662oP
         4LfpbNsz/frIS2BcMGUHCQLTJMZ12onaQQcSsLL9j8SiNouvLKI11hWwEmcfGFrsFIrp
         p3sG9T84Jn80v/2Yi+SEuU8v+0E0kojZMLOJyXM+Vg3P9bJXOTTBjLiD0C+sO+x8R4Yl
         VOKxJ2E9xiqlYl+54ytkTVdMHsz/vuTlD/QXPUEEp2IalOq64Pb6lOi5oEtlhtMHqnS9
         7eTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=f/c+EwpzzrIdTL0a0bddGX7KBZ15+Zku2avwoxWG2Wk=;
        fh=DPfeH16mGgxIIGC2HLIrxo2EkG1lE7o8fI/INiftokQ=;
        b=acT+DnTsU2EtGoixOw90wWmQtcmB/lEb0zyrtCnuafb2OnaCon1TI6/DFeJWu9Hbpz
         20qXTzzqWESJWrH8+xXtR+uyqnjMAwp50allkfY4NTnVnkA6LU847H490rUp5sj26+Qy
         ZMpeFVHTNV3PW49WSQHmBsoydozGl77NGSpUKtKzScDLvQrVoO/h8lZ1P9brMMCErKFZ
         xUTWpDiT2TDdsp0n9+I+jRrrVoGawwOdw0wreX01FuyDPZXSm/VC+4kMTlcGrV9UkcZz
         tgCKiWyYChp4ClA00UHsz8FpVFuN/AWwWJerdUs7uL9kL4bd5GVqs0cjxX3vwXeuc2j5
         ntEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829854; x=1793434654; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=f/c+EwpzzrIdTL0a0bddGX7KBZ15+Zku2avwoxWG2Wk=;
        b=k059ccS55T1YaNzStugk5ne3uFifaL4k2aSKrT12fShPJOVrNwIpZsTVvJguE9dBVX
         ygElTWkmgtdIXDyK+7PyNXPPrJ9Md9fuHPq/S6rSCxD0nkfAZFvNflsz/tXuQHDdBLHD
         xL65BHj8HVU1+f0FgiCizf5ZuSn5MRY7FWfjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829854; x=1793434654;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f/c+EwpzzrIdTL0a0bddGX7KBZ15+Zku2avwoxWG2Wk=;
        b=16yQFmafY+QoNswn9PNwiNF78Y+zfuopg3APnfgy/GZW2WHq5wcx546Ac1dEOU6eVL
         qCsPKy9EFzzA0XV6QAtuiEAVKLw4cnHL9jUgu5THhw0JsD+1hg/SNETRGHujCbBqdiwh
         zHQOVXpJtn/4wbB0FMEuJEzzBgZS8AO2SHP9LXrldXAE+1CFIQYYUliDYvjX1xM1DNUp
         GKkwplDNRd7r827aQ72CnjrZ+br0Q/Jme7AfuqVz2QqYD2kfP5qw/o0PHV6C6eJPf99o
         FiBY2FDfgtS3vz85RBkBzTUqJwE/HRyfC1T5YtBakE8CxyCWfAhV2H9SVmLkKNYX8N81
         qiWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxVcnlW1EJzOm/TTrEC0WX17606Z0v3xl1tgp2Wxr78zGxuMfWOEyCd6yUwNpfZDu9n3aqYmLWcwkH/bzZ@vger.kernel.org
X-Gm-Message-State: AFq9FYKNLtMY7cdbgKuZ99bEFWqvEfZ40LPvX2eNCN2cF1FYHoH7Dyp6
	kKsEX8MKZnP0lupJcFu2MupaX8tmJ89umGTVq1XheG4Gwj8+TCQ7EAh8yNGrm/YVnu2FeP6pNWw
	uG3ZkTHSgI/0ODizJVcTCdQk29lSXYRxtopXdyisw
X-Gm-Gg: AYBFou2bjwR3p7Grs94f2pfE2sm5hSuvHELEnjLZAOcDb6SMZVCCqWZY+HJ1jVsybGa
	jQiBEYidk7ntCRgsHkEYxM/ovg49b0jk7Vn3LtGfPkscporBwEAjoGibv9QlUTPVxWO9fp/lZ96
	m4OeNjUUu97+A1PZ4cPNtRJArXQC/a+la9JRGkVWATYAyRynu/SsB7eVMp+zOrnB5pOteCMbvbR
	MxTXaUvywo9R2vn8MFQrcRFxHLHNDuMX0hiDVHq9+xgC2p/0vgZvJ0yAEVo2/0TQRJynZSgQPA+
	SIeMukp2JBgWbPuCAOXR86VTzsMXC/7EXfab2F8ece6UVYy1suRm+5i5DR/Ue2ggMPpcAYtlma6
	6bO9QoBaVJIfIs5TcfpAaHKVX/jZGUNKmN6i9
X-Received: by 2002:a17:90b:1fc8:b0:3ad:c14:35ce with SMTP id
 98e67ed59e1d1-3adeb0f4b03mr1215366a91.64.1792829854594; Sat, 24 Oct 2026
 01:17:34 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:32 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:15:41 -0700
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.7.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.7.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:31 -0700
X-Gm-Features: AclHuK_RH6hRiswn7VkHcSfsxk2rWaTJ0grpI4PKmWKFGktw6V3bTGvWs-_Kz3M
Message-ID: <CAFLszTgz66uz4gU6deR_go028R6MhwYuB=Jb5RJ8hqtzb5j80Q@mail.gmail.com>
Subject: Re: [RFC PATCH 7/7] arm64: dts: qcom: sc7180: Add sc7180-trogdor.its
 FIT image script
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
	Bjorn Andersson <andersson@kernel.org>, cros-qcom-dts-watchers@chromium.org
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> arm64: dts: qcom: sc7180: Add sc7180-trogdor.its FIT image script
>
> Add an Image Tree Source (`sc7180-trogdor.its`) describing the FIT
> image for SC7180 Trogdor family boards using `Image-framed.lz4` and
> LZ4-compressed board DTBs (`*.dtb.lz4`), allowing the Trogdor FIT image
> to be built with:

This says what the file is but not why it is wanted. Please can you
move a short version of your notes below the --- into the commit
message (matching what the ChromeOS scripts produce, a model for
future Chromebooks, helping people who run upstream kernels on
trogdor)?

>
>   make FIT_ITS=qcom/sc7180-trogdor.its image.fit
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.its | 728 ++++++++++++++++++++++++++++
>  1 file changed, 728 insertions(+)

> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.its b/arch/arm64/boot/dts/qcom/sc7180-trogdor.its
> @@ -0,0 +1,728 @@
> +	configurations {
> +		conf-1 {
> +			description = "sc7180-trogdor-coachz-r1-lte";
> +			kernel = "kernel-1";
> +			fdt = "fdt-1";
> +		};

One thing I'd like to check. Patch 4 says the main reason for a
checked-in .its is to have a hand-written description per
configuration, but here each description is just the DTB filename, the
compatible is filled in automatically, and patch 5 adds fdtfactor to
cmd_fit too. So as far as I can tell, the only thing this file gives
over 'make FIT_COMPRESSION=lz4 image.fit' is limiting the FIT to the
trogdor DTBs. In exchange there are 47 entries which must be updated
by hand whenever a trogdor board is added to or removed from
qcom/Makefile, and nothing checks this. The list matches the Makefile
today, but the two are likely to drift apart. Would a way to filter
the dtbs-list passed to make_fit.py (e.g. by a pattern such as
sc7180-trogdor-*) get you the same result without the duplication?
What do you think?

Regards,
Simon
