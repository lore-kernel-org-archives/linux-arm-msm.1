Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C91A3E9C26
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 12:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788177650; cv=pass; b=t58eBW0bw/+eqpO6QJZvgDbYlHqwbuytiF7CnJbIddIEaiHpBXr8XjDycKpqby5b445ZRp6pBZ9JRUuIF/bgR3Lyv95iw4WA1yelskAAe8Lofz1UZgPiU0V8K1myLCL3fUdRZopqTdpjwJH1zilSKEJwBO+v/wmYBdLdOI5nawM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788177650; c=relaxed/simple;
	bh=59shnk5YdABVH7EU9lOkruHnUV5zrqz/LbWh9Ypnyqg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fQLgcA/jCE/lOU8NKjWN0r0mJdYRJft7lzyp9BqYRDXKG5RaF8n9jnzdyJ7UC27gVEl5HNvlLnLQrgN3Ao/t3jkDWF+yw7f+/pJK4RO2i9AtF6ucVizA73sPPf9Om+OhH0EOFl6p2HmnwJlLMG/z02qounVuTu0onZb7Kwcezlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBxlZsW/; arc=pass smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBxlZsW/"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so3124503a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 05:00:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788177646; cv=none;
        d=google.com; s=arc-20260327;
        b=s1FIB9wl/OajkGRYEc14adX4rok7PxxwlkKjxfSFIje1CEe6DUtxL9vpJ369VyLsRf
         njk4M3ODJsxsFEdFck7Ht7MygRO7M//l8JcOJc1VFyOFQKt4i36hV4aGkAFUDlKlN8ql
         FJp6BJ8LE+tE23SoAj/5Nh5VC0fZReMwTlSY9zZKWaW1iDZkgoN5N8nv+UtXnVNpS06a
         8bTmNYe1zOTplQlsB2/WtQxW2pencI1iput64nXbcymA+IwGus9PSJqKzkLXMP/TYnGh
         CRK2JcpWNZCYpF+6ctkl7T0L1c7fM1qCr0Y5qbCrJ2Mcyy/qpdcSZg4gkK5MFTbrIAqt
         LtKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZEdPHPT/tITKhrVTG+XJ0o1wyuPtLccyUlcKppXSZJ8=;
        fh=6UrU7qt79hNWx51NvivYpViKepkjhyApSYUUXIwAkuc=;
        b=XxcUkKD0XfEW74Lpehcrd5TEWgMherd6soeMYf4cWRSepd4pyx/YWFuiWPlpMd/4iK
         Io8TgLV/2LCNPb3wqTPrZgm2Aywq758F8gL0c3teqMToqmmqBhGHEzfeVtYTyeCy7NKz
         +Z7CKodsS60OD4dVSc1Pb7xyjX4JA8LtokG0hIlu8JlDN3z4Mmw+MUjODi+LPxdy/oae
         Z3XkeNmH5ZhGCQJnUEJngzQ8SVFPSsOCZlL5SGHOfnvuheJWElnTAA7wSiarU0oo+iHJ
         pgEDShE/hkSgqsBTDpG4xLm1+X/6aiS9UKWKThXMrmLn/uwtBv4/u2oXR+fekSafF2OW
         ZlpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788177646; x=1788782446; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZEdPHPT/tITKhrVTG+XJ0o1wyuPtLccyUlcKppXSZJ8=;
        b=lBxlZsW/pua3ZKWe3TJwtxVW/UCXGciH8vbGkOkDS/FAbkKBCA+/O3p9Nc/+js1kML
         8yc9b3jAWk/088oDJB56b5tnXVumODO/4xDY8iS2//cBH5LBuCZ4Trloz5vY4CPnHzkc
         9WX6NEdDiclktz2fJNCRYtVvJZUVXUAqOmggZ8OeM1ZADOixmBH54bZPMr8z3dphHZut
         EfPEm3VHyGnvhRIZm3iMHhXMfN9iXvy9WgamGr2v/w0yUKWSJlzfqy6ZOg61AQWtVjx2
         Fym1t9T+ZNbycJmn/xMr83p3PXp0Vuk2Jb6z8ZswtREbklS3RFrZx0k4bWWDCku/lsY1
         HLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788177646; x=1788782446;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZEdPHPT/tITKhrVTG+XJ0o1wyuPtLccyUlcKppXSZJ8=;
        b=D2PtL+yoRIslMx8GuxCX+uIxn/Y7rfhZ/n0m5x5Pzl2ToKChbzOGBJ/iBwQ/Z4S4xW
         KDJQmNC74IDIeWpaq+npg1EQC1DwhJ/D3wfWS06HIsV0qIKtwJ4NcTk2s8WcGHVRgEia
         gM66KZOPSUwui5FUq9QvqNewsTqtNrkBJYD9nVHRB31Dhqzuj2IQOy5EVLKWxe14YNeq
         HmTL83cnRRiJUM1hDF0eqxrvMwX8GhnTjuQyYq+tdX0t4OQexRvuVX5t1zJkrHEUAr7O
         A0udY3rDjhWZVYO9qkwkO0VpkvBc5fp3lIptUAWg2Wn4otJPXBfcO0gq39ddiHTApxZD
         QVsg==
X-Forwarded-Encrypted: i=1; AHgh+RoP0Bh3r7U92AbiBSjsHsebR8jAlkeI/A2Ualczh3sxi56FvRCuDhvNZAZkPAmQXCraOJfmGjprEIKICxHl@vger.kernel.org
X-Gm-Message-State: AFuF++ks0BJ08aCw2LM4z+vNwzyeTBX0t84pOGihByhhv6Teg3Qu+mhQ
	XMwJLj3YA6IIjx3VRDpKdxL1S3bd/r8W1bYPWIwK/YqeSnJRIq34NLblfudc+FPOREWUPhQmwR/
	cywVxvgZ7+9qdMmM4m1vVV3xoBz8vrg==
X-Gm-Gg: AR+sD12zkz4e+uoZnFCu9pSSdF3k/N55NzPu+HCs2EL1rNU9kmt/hekVPqnlmqQq/KM
	UKj/HaXJpbgtt5Od5+WqlLEkgCgK96nhJvRnCbcUtsP1E5vdVCdwHUTFQPXpQlaJzbT1oI3UDJR
	4wB0RL38AM5U8JcUqOe+hQGO9bWsnP/yTsb63kwWJ2Cd3cRfrncp6/urMCMeFESpLRq0A1VnPBH
	OIMtM7RwQU1nBdcPrPfPmuKZ3hBlvQ/uMk+OCovcu9ES/KJXGWnrw0M8+CDpJZT4bZ9ww8Be5i/
	Ydd71dJPVhhYXCsZY3MJN5HuYmzejSYoex47Nvx3Qw==
X-Received: by 2002:a05:6a20:748b:b0:3d1:3c2:85b6 with SMTP id
 adf61e73a8af0-3d266570c5dmr35694751637.5.1788177646257; Mon, 31 Aug 2026
 05:00:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
 <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-4-5b202de8c74f@oss.qualcomm.com>
In-Reply-To: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-4-5b202de8c74f@oss.qualcomm.com>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Mon, 31 Aug 2026 14:00:35 +0200
X-Gm-Features: AcwNN1U55-Spe1BCyB8yOmgMhN2oooSN-83xVQjBn7AtVurkhafkoP6j4ImL0r4
Message-ID: <CAMcHhXqCFzMy=VX+Pm+T21DuJ==-28wBwSJxKzCi1NMJhBKqfg@mail.gmail.com>
Subject: Re: [PATCH 4/9] arm64: dts: qcom: x1e80100-dell-xps13-9345: Mark the
 EC reset gpio as reserved
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Marc Zyngier <maz@kernel.org>, 
	Konstantin Shabanov <mail@etehtsea.me>, Srinivas Kandagatla <srini@kernel.org>, 
	Georg Gottleuber <ggo@tuxedocomputers.com>, Ettore Chimenti <ettore.chimenti@linaro.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Konrad Dybcio <quic_kdybcio@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Aug 2026 at 12:05, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
>
> GPIO 65 from TLMM is used by the embedded controller as its reset line.
> Reserve it to prevent Linux from requesting or reconfiguring it.
>
> Fixes: f5b788d0e8cd ("arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Hi Abel,

For XPS 9345 this change is already included in my series for EC driver:
https://lore.kernel.org/all/20260809-dell-xps-9345-ec-v4-0-88306dbbc7aa@vinarskis.com/

To avoid conflict, could you drop the XPS 9345 from your series? I'm hoping my
change will land shortly, its already reviewed.

Thanks,
Alex

> ---
>  arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> index 2be5a37c00cc..b795b65d604e 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> @@ -1072,6 +1072,7 @@ &smb2360_1_eusb2_repeater {
>  &tlmm {
>         gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
>                                <76 4>,  /* SPI19 (TZ Protected) */
> +                              <65 1>, /* EC reset */
>                                <238 1>; /* UFS Reset */
>
>         cam_indicator_en: cam-indicator-en-state {
>
> --
> 2.54.0
>
