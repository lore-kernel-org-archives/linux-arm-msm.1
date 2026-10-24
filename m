Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829846;
	b=iQnQYoStifwVM3g3iVIOaVv3TkiVdcm7brwVCDQjnzRHGjf4d45wpLgz9gm5+NEUJCxB
	 osw3JNqHqfglY4yNs7xfKNM4GcuQJ7Y1rVDqg1fUu3IrIFny8mMHDZztkOBGoktzi9QYL
	 bvayIcqDmhpikYmRYldTRnoHv/+LySupP5gBCekkVjXCUeigM0AgbC6N5O55tu0sfgNwL
	 Wzy6h+eGIgOe2pQuVEb7vIcut3E5rNxRC4syZj5U2TQOXOJI1FEqeIOuWGKFrBXhD86eR
	 xd6scyvYJWVDxyAbKBiHuCLNgq+H1uVCzWseh1tc827EswhVAXEvm2kMcSkBap/wj5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829846;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=cyqk+XMSMcVf9vVXU4rdRbRmiDkDjXgnwovnotWECc4=;
	b=pzKbuiDEbY7jMyZrx4tV0s3ej8kZ5DrRr/Hly9qNQ1D38f3ofW6K4Irnhyz78xbE+bs5
	 nJzecmnJKmqQKNjV5o1UUlaXL4qJBUdvvfgxcWx/hfLKsQ3bhh6BRsJcHytdfLnrBvFjb
	 +GdOBkw+7J8Z78M2Bh07c7bTbviQrrSBxK34NiFNjSc/OtEMou0iZu1d9wHfnT6+3fMge
	 SYdFmosMm/bNbcZD4Os3jS5L8xfZkafjgR6tsm+Y9L/zjGPq7JakJCM7hCylc/Zj8VCJu
	 CQVsrI5sZfO2QFtGgZ3BVTRYFSIjpMo2WuyaHd1v2CZP+YevSYC/WYSLqPw5wONg3yw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=W+scGDok;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA722606A327
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 08:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA722606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=W+scGDok
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so838661a91.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 01:17:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829845; cv=none;
        d=google.com; s=arc-20260327;
        b=EWfMFRucQrCVMNOp1v1B+f41SvCkXVhceNhQVITK5uG8nMhgauSVfC4JUm5GBS93mc
         WvnHr65pqKympA4ArF6HPOwZTHtaP7l98iyx4lKjZZLtGq6NSyth0SvEc1Srjwt13urJ
         ZWNVqBqQa78yx4geBBHxKXAziNtWAN2c3jYGVig6edtx+8mS8/cAw/drtITg+PuKhO7c
         ELDM2dR4fCOGOSU81ULQDM9DyVDSIvMHdYtl3vcE0iqmnT7abi1mAQDIbtMVpDGEBBYg
         VYu8JXYnS4iH64s4xDVJa04p9omt8++D0BB2/w0uVht4cQGZhqUGRlycL2brfVfaPEsS
         TfKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=cyqk+XMSMcVf9vVXU4rdRbRmiDkDjXgnwovnotWECc4=;
        fh=JU2FmjQq1m3H8mdh4CsuqwNIXsJYidIlLVqLBf0fl1w=;
        b=siRlbx9mQiatHM59PTASqegq0GyEI6tgs3zqrxaMNXMjKjhPEv1J3c2ePeklbNxa2q
         fFpMAs3oDvaDqQKqOD0044Mf/3VlMwKdp7DvualByk+vz6X39dMgHvvgtgh8BPS3p2sL
         M2o4eP2EgNFSTZ0b+Uy+3mILkpSBw3QR9l3M/MEuFCaDyDS/U0JSXpYdg4QK053aIxay
         Utj7clkEFV/T07nkBIbL2FyLfGnvUxJMlo7U3eHfKwM2k+xsARgagdRqiX6UCHcYCs/H
         sdQZ4O+EmIxH7sawKMSeFz6v/zPRi6+ts0YsFN/D4/tKTIMykFZ+JOSr1kihQkaln0WP
         xFow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829845; x=1793434645; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cyqk+XMSMcVf9vVXU4rdRbRmiDkDjXgnwovnotWECc4=;
        b=W+scGDokeW8IVUlPw1qaHOR19xQPyTOtn+x7HYHtCqXqHaqa9rlnDqjOM+2Ceue7fL
         Aju4fOv9xr3yNjCoA1fmjYX1vQStbRNTO4lyjJ+X0ScdnOQnU3gmpoLqAC4vffWd2TMB
         smWVx5HbLNJaVGD3+OBLLSqtnKQQ46IxDRMvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829845; x=1793434645;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cyqk+XMSMcVf9vVXU4rdRbRmiDkDjXgnwovnotWECc4=;
        b=KReaUMwlqHTB9zY5bS9NYE1cQyhrl9J9pMDz/bybBVfV20gdjijxMQbL+ZmtOnT22G
         W2rqBFq9RO2WDd8LAix0GW9qurwLpdLjLfNkZGrzYtrvdNo06rYHmawdJlPH20KKQgnS
         jKqP1dIgkImMuByFrMgNn3FfCMRAVrlUOmkZE6lQveEtwwUZwAgJ30ElgrSxqY5V03Ly
         bquIuMwukImdKBU4V1fNUXBQWLh6NtxlWFQ2FtrbePXtMXgM2GnhtXb66k/kGylSpsab
         1Iqhq+vqzkizKar6ohUtGLGR/0NW7Yof6ghLsh76NXcNGyrlcINk7sqNrqpAm1UgihBn
         LgRg==
X-Forwarded-Encrypted: i=1; AKwUvBzxezjBfeDdgY2ifzNtPmYoOQHGQt23qJdBEkkg+OAKu3SyVNZ4xSM5XEuXRCbLI/QNs9pBtjZEkC7YuINF@vger.kernel.org
X-Gm-Message-State: AFq9FYLKrC3R9qZgHWImQ1xJl/3ZmXW4Zz3UTLZNQXCEZyPmwqVG2QSW
	Yshu1eumXXZGI+BDFRbp7JZdaX7qpEnuZnJguGSNnhbPHWW4KR3NhxjZwihqG7pRTl3HXsry9E+
	K0BVHBMh9RQjgsLExk7XIzwGcyAT2kXt2MTcgqDlu
X-Gm-Gg: AYBFou2Rfu01DSR3FSrZrYVK81Oio3H4xiLmn3rONaFSz87tgfJeVdIG3FrAIUD70gJ
	qZlG3Wyv6tu1gO9Tf87GVQFiCF56ngb1sWjCHnhDu69dm4ZgFDHm/D1tQVcpzfB7YH/h95dACOp
	v6RBJooAyt9xYK5i1I73AxoKsfchVnw5Y3zqrwkuwG17dO6uqlhLRxBxgNhBjpqtPGrBvPjYOLZ
	g0uwbRJsKgKB8YqPQum9dyUV7CbjuD5n73cuxvVxbb/dUdKlcy78cSYvMoUE5Maa39kyfm0CmzG
	CL7z8Fj9v/qlspJvkaFo+Uq/U4RfKNeOCXR+odfy6FLitZoXjo05VL5h5SUlay2w/ryGAoFQs4/
	9x1gM/Q1PvxekwE/5v6vV7KVnOOVFDb3YXsc=
X-Received: by 2002:a17:90b:4d09:b0:3ab:31e6:12fc with SMTP id
 98e67ed59e1d1-3ade9475f03mr1281929a91.0.1792829845190; Sat, 24 Oct 2026
 01:17:25 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:19 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:14:33 -0700
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.6.Idfb669fd6c518bc86e45d8555f159c0ec611a6f9@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.6.Idfb669fd6c518bc86e45d8555f159c0ec611a6f9@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:19 -0700
X-Gm-Features: AclHuK9OzNbsUxoUq8dndEPiTUrFf9OR8thbHVNZoTYdjjGKeFC-1VE0qwrhJ4E
Message-ID: <CAFLszThr=rPCTxQxst2_Br6MWwaRFe_rHamzLXY=ua4Qr8mAeA@mail.gmail.com>
Subject: Re: [RFC PATCH 6/7] arm64: dts: google: lga: Add lga.its FIT image script
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
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> arm64: dts: google: lga: Add lga.its FIT image script
>
> Add an Image Tree Source (`lga.its`) describing the FIT image for Google
> Tensor G5 (LGA) Pixel 10 family boards (`lga-blazer.dtb`,
> `lga-frankel.dtb`, and `lga-mustang.dtb`) with board and SoC ID/revision
> metadata in the configuration descriptions, allowing the LGA FIT image
> to be built with:
>
>   make \
>     FIT_ITS=google/lga.its \
>     FIT_FACTOR_DTBS=1 \
>     FDTFACTOR_ARGS="--strip-local-fixups --single-base-dtb" \
>     image.fit
>
> NOTE: At the moment, Pixel 10 doesn't directly boot from a FIT
> image. However, packaging scripts will be able to take an image as
> built above and convert it into a format that the bootloader can
> handle.
>
> It should also be noted that the "description" of the various
> [...]
>
>  arch/arm64/boot/dts/google/lga.its | 68 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)

> diff --git a/arch/arm64/boot/dts/google/lga.its b/arch/arm64/boot/dts/google/lga.its
> @@ -0,0 +1,68 @@
> +		fdt-1 {
> +			description = "lga-blazer.dtb";
> +			data = /incbin/("arch/arm64/boot/dts/google/lga-blazer.dtb");
> +			type = "flat_dt";
> +			arch = "arm64";
> +			compression = "none";
> +			hash-1 {
> +				algo = "sha1";
> +			};
> +		};

Just to check, does fdtfactor recalculate hash-1 when it rewrites the
fdt-N data? With FIT_FACTOR_DTBS=1 (as used in the commit message),
mkimage computes the sha1 over the full lga-blazer.dtb and then the
data is replaced by the base or overlay. If the hash is not updated,
anything that verifies it will reject the image. I'm also not sure why
the FDTs get a hash but kernel-1 does not. If the hashes are only
there because the trogdor script has them, it might be simpler to drop
them here, since the packaging scripts repack everything anyway.

> diff --git a/arch/arm64/boot/dts/google/lga.its b/arch/arm64/boot/dts/google/lga.its
> @@ -0,0 +1,68 @@
> +		conf-1 {
> +			description = "Blazer (board_id=0x070406,board_rev=0x010000,soc_id=0x0005,soc_rev=0x010000)";

Since tools are expected to parse this string, please can you add a
comment at the top of the file describing the format? For example: are
the keys required or optional, can they come in any order, are the
numbers always hex, and does the width matter (6 digits for board_id
but 4 for soc_id)? Otherwise the format is whatever the first
packaging script happens to accept, and anyone adding a board or
revision has to copy the existing lines and hope. But I think we
should get this into the FIT spec - will mention that on the cover
letter.

Regards,
Simon
