Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E8635E93B
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Aug 2026 13:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787407004; cv=pass; b=ckCmNKHQZZlad04M5ZeB9ggcZxnmLulqjmj8/Yrt7OJlbO8hcv0QTLtdGPUl06ac1sZ+R1EJtPghdx2gk0w1Xn9vxYIZ33TQRpHOWzKvmi7dfscOjSL1B39hho8kUkqgRB7JhVVfgvl29VuuNporlRe0U0ZUUIl0tU4gJaZD3VA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787407004; c=relaxed/simple;
	bh=LW/8llNNM8/lpri29fLU+15TtvguEYyj6F7r2cvmV5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tzr4f7+stIt0QU+tsEI8Hn9a9YCXZtlD1BB0AZxe2uZepMmm5sTNpZ4mm5njpkId5htaNs9s5ZTiCjRwWZ9tHUzsauOoHzes5vWqiEA+V6jVS+1Z5quNKET5P8rFP77/OuiYjqOIUm+pz7lE0/hNl+N2NsbLiwbbPvJmnRU++wk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8eiVGNG; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8eiVGNG"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c20fb91ed0fso280941966b.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Aug 2026 06:56:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787407001; cv=none;
        d=google.com; s=arc-20260327;
        b=at/Ynst1AlnRn2hcNQPvDF9yU35HZWFbCP4ZPx/3WRLdhhNDCZaqlhIxYP0o+yfHc/
         Er7reA98HACt6QVTkokP2xRU74lKgXmTmk/Snu3BB4w6QQQ1Z6lD8CgtSQLdtPBUhirn
         6b/I1IyGLLNk2HEMocls1XFAq1Z6bqqVdFdFtJ0+olIyYiUpKvgXaZty36Hff2/PTQ4t
         l7bL6cF6tW7VcEs0lWAWMVhd0QrG7PnNgHD433lDIvRBV72PKQ2wdmgjGKReuMTtm/N5
         z6XUGFOda2E+FDJmEga5E6xu29fbiHldbQf1w2ied/rmv77kp1o3TPBtMc8TIW8xG6Wd
         OtVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hC9XiiM8sQUJSSN/bi+LmoQHRVBCAyQ4fxY0zA6GP98=;
        fh=FscmRAORpwxAOorHi5AYylTnwUt9v7L7ExmBL/eUpUE=;
        b=g0TIclPAJpi26Lr6pZjO2C/73GkC/tDyX4t70nxLxcrf85IcL5PUHBotXJqiuSI3NS
         P6Y7mDMwOISS/hxSxJ7itVzxaoaoFJp06bBeLGhtGmHixqP7wWOND+1POwsy7hF3oa1c
         8kLWmCGR17oG/aWyWm1G+TAYFKKTIsr/Dz5uf0R0KHaYqUxdhM4l+MGMbUgrCKnnlc6f
         0wWsEVUwd3GuNWCD4/LtLaw+YsFIHvAlMcnezImie9ak+B3xMbPj5Gm5r6NLofDcluLz
         mUlGPdAXxKMML1gJlECC2+MkCyoS4wvEzScYGgym8MXyCQ4fBThOIpYOEspre5Mr6i/B
         8MKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787407001; x=1788011801; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hC9XiiM8sQUJSSN/bi+LmoQHRVBCAyQ4fxY0zA6GP98=;
        b=h8eiVGNGBiRfxE8jFQtlR5oz43YH+yRvwxShK99ji4wyxvmN6OLUsIwT4U8UTUT0ZS
         xh8Ze9cK632Mh9j5GOYHjrRqT9iHesH/4py7DNpz+/oXtrHa8N452nInAUTILjHfyIW9
         9kRiLF0i8sE8EQv0sQdJXI2XKdNjekQwiy6nvFwefWfB4Uc1THGRFeANLmdCGU95gpce
         I2o6ujPfVVjJYF6m0WNxfhJenS5nLWl+yKsUnT/D/sjvK2EYrjiSAEieeg0yIXl41FOB
         QkEN3VBAhtNc8+1rkDyG0wDzw5+0VOrZYVAgdE4lMJTgcRkiSuwlc+psgpPLxnaaRISB
         htCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787407001; x=1788011801;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hC9XiiM8sQUJSSN/bi+LmoQHRVBCAyQ4fxY0zA6GP98=;
        b=c/5N7GRWgDQe27g/d3fRbGUBk+a1ZmIllYUi9SeN3DXyOP472NosrAHc4hRfJTREeJ
         ZTYOLD5k+NP/oS00iTENhuVHNY7ALaWU14aA6bywY2qDhMTce8oqF9uA9XRmM7vW96c3
         K6Vfngth5YoKWzG87K7xsP3ZGnBLmj6u8ecswm251KTOfGXmRPMGt3mdfJ94unn20g+b
         nNLkRVhcyWj3totkMABWCNr8W1ZMBivgW2e63j/7/VajZfSJVlxSvG2X7DChYBunbOow
         0Av/I3dlfr/Dob8umDft7sJndeOssXpYR+vAT/4awR5UYwlxaGav1VApbPJV1wFjKnfm
         CGwA==
X-Forwarded-Encrypted: i=1; AHgh+RqNCp0XhuOWEw+3xsIzmGkEhMsb0BQ+D3J9AP4i7HX639Mq42iTMtvIwD5BO/PQn8zJqamipr+JBh5/x3/o@vger.kernel.org
X-Gm-Message-State: AFuF++k0kioqjFsrLSem5B4cEdNeJXVWtYpV90Q8Y7VrnGjn2R0IiSdR
	iWbkIr4IzrnCA5dZfqhOZPwIYNSdWdTFMX6NNUT3sbbKoMxK0RY4ga08y+O6rxnSmdEtA2OeOMr
	GPgjEfKwFcaH0R84eh72qfdnom0SBqMs=
X-Gm-Gg: AR+sD10M6hWHtHYnd4dHIuCXMLoGNVopXYO8NjFaM4zRH0lDjvAKGMBFuq4TOqyJhsh
	gHNPygl28vLUG5OheS/ySjBHa89hWGFT7eUsT52O689lunsLJtp+U44exSOm2x/+kALkYsVNb09
	3Ixm21yqTU0UpiJbYyKBE4CEWwMZHrpZU36MlQjR9xU5wohs6us9OXnaPInJH6AqCB4/wBTuojJ
	mX6gj698oKIeXxeeUzuLcGgD2zH5Le49mNr6q6kGQFTlMxyycdFnHFppfXU7gNMjpmsyfb7iLSs
	5dLoniUzubhFom2HAkrawwo7FJM5taB8MgKqv1gmeI1Oz5UwhnB+ywTpwWR2FP0Flj39IwRKa3y
	CPQ==
X-Received: by 2002:a17:906:eec4:b0:c20:1bc5:6ff1 with SMTP id
 a640c23a62f3a-c246a2cf049mr1459910466b.5.1787407000605; Sat, 22 Aug 2026
 06:56:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
 <20260818080754.4362-2-sreeshankar0910@gmail.com> <20260819-statuesque-shrewd-sparrow-deead1@quoll>
In-Reply-To: <20260819-statuesque-shrewd-sparrow-deead1@quoll>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Sat, 22 Aug 2026 19:26:32 +0530
X-Gm-Features: AcwNN1V8umJNfcbQppuc1ASR1pboBIkKFdS9EHV8sj10gVhB0jnzTf8DX2VpIH4
Message-ID: <CAA-+ukJTs1yb6yig2k6oHLeGYk4Y_ATman7f6tfpZWb71T+gWQ@mail.gmail.com>
Subject: Re: [PATCH 01/12] dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org, bmasney@redhat.com, 
	lpieralisi@kernel.org, quic_tdas@quicinc.com, danila@mainlining.org, 
	davidwronek@gmail.com, robimarko@gmail.com, linux@gurudas.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Aug 2026 at 15:20, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Tue, Aug 18, 2026 at 08:07:43AM +0000, Sreeshankar K wrote:
> > Add the ID for the Qualcomm SM7250 SoC.
> >
> > Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> > ---
> >  include/dt-bindings/arm/qcom,ids.h | 1 +
> >  1 file changed, 1 insertion(+)
>
> I will not be doing work twice. I drop all your patches from DT
> Patchwork now.
>
> <form letter>
> This is a friendly reminder during the review process.
>
> It looks like you received a tag and forgot to add it.
>
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions of patchset, under or above your Signed-off-by tag, unless
> patch changed significantly (e.g. new properties added to the DT
> bindings). Tag is "received", when provided in a message replied to you
> on the mailing list. Tools like b4 can help here. However, there's no
> need to repost patches *only* to add the tags. The upstream maintainer
> will do that for tags received on the version they apply.
>
> Please read:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
>
> If a tag was not added on purpose, please state in the patch changelog
> or cover letter why and what changed.
> </form letter>
>
> Best regards,
> Krzysztof
>

I sincerely apologize for the issue caused by my action.
I am new to kernel patch submission and am still learning
the workflow of the patch review process.

I have corrected this in the new version and ensured all received
Reviewed-by and Acked-by tags are properly included.

The latest patchset has been submitted here:
Link: https://lore.kernel.org/linux-arm-msm/20260821154030.2514-1-sreeshankar0910@gmail.com

Thank you for your patience and for guiding me through the process.

Best regards,
Sreeshankar K
