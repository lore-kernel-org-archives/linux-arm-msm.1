Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794561084;
	b=Fv6+3QYh98MFP7IF5JCMwCkcVFGPs8vXCKE2pfdp5L0ELPUMnmQC1ZaDzhZB17HaRlPJ
	 aqFXXQqTfzt48QYlSwvUddks++OGbdmadBIYGU3S+z25n8PFXPNrkTuHz5qfXmuiVCIAu
	 wyYUDiHLKodoeHUUAi5xOmEEmsv5erm2xsUt35AssMMz/LBpy0EJ3l2ozREaeC+xFh7gQ
	 I5AXDltVzpsSmnQLLwagTZVzkbQDR6uq+WZ5nojbr1wsG1yhl1eANwL5aHuOnytAOWYjQ
	 WcE6mbpOUzQZD4CCb8vBsKvSK1EmyFhcIDTH4ohhIyjA3dxi0nthFN5t9FWTkMQwvFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794561084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=EunWedFkJlngRyReK8nAXC9cfnD3+GRatU0Q8m95wmA=;
	b=Gqf/U2DaXPtw5cw7mXJhdQdJJLMNa0V1PlpEco+etU4cd9LsNEyHhhXTIf6T5lkB5MrS
	 azvQCh//GCgd8SN/wAyuj88v+Cq/h9ttZFvUirFcf73g5Ei+uKSc8WUgyd0nBVtNuqwas
	 S/3e1/ffsIwF0UL8A8Rn4UjF6WWS2aU8NixOSGnFyXtu1ZKPuFk1D2+Fp2k3lwXbQvVVa
	 kS7ahZO8VDAltAWqWa84OVulVZzFLZl7QNdO+XNm0a3xI1EwoEUfD3k6lFELXfmoW85rL
	 D3RIHIwfFcieSbJlivpRPm6833bnRMNY9gRcG51a9t9NwykdVUavm3uoDoDH5/McJbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=lcv3Y5zm;
	arc=none smtp.remote-ip=74.125.228.71
Received: from mail-ed2-f7.google.com (mail-ed2-f7.google.com [74.125.228.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FF7606A321
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 09:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89FF7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=lcv3Y5zm
Received: by mail-ed2-f7.google.com with SMTP id 4fb4d7f45d1cf-6aa912db07bso592898a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 01:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794561081; x=1795165881; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EunWedFkJlngRyReK8nAXC9cfnD3+GRatU0Q8m95wmA=;
        b=lcv3Y5zmurpAHupXx4gie7KopARoqv4KbTgXar/0T32CPJCWq8j7DeJRuv6zS9haqo
         mYMDg0QhXtVn1cPk8zSUB4uvjHp2DoTNKlDR0DIihp1REstySyixky5uaBO3iPjVzVc4
         naD1S81oeBXc2nFU2GDpnOaGumXQ0q43X0FGhV/7ggCt4n4Lr0fJPRg+HFe4RbOoG+Sa
         R6ShveyaB3GA5osyGeAeOlTahuDEmXfS323+coqu2RYo+Jvvvw3ZAMquR/x9iY2BJvf0
         yy/02OnENJgWyzAJ13v6+OzVcYHO+SdDutrmM0XE1UpH3lK11F9vrdu6tXy7b+TU3oC9
         Zkuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794561081; x=1795165881;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EunWedFkJlngRyReK8nAXC9cfnD3+GRatU0Q8m95wmA=;
        b=KFCQANLDq9O5Y20MRa0joAceeftKw+VQBtLze6GeHJD//uFW6jFGptJiySi61qXu0B
         LwdIgTMLSF0Kh9tBi8V17HqD7HfGdM0XY8N4WYeC6l3IpJDxr6c4BSkuQ6ZdxrCmma64
         ENW4avw8UfpQm1Q9TNNhASBK9ZGXM5wYOTZTQ7l400jBW8aFjG4Sb8Hq62NY1R18LTDD
         hRxM6c6UqTX+w3RNprXsSK2H3VVBfAgU2lILQVNv912c8u7J6ikE1uXYj2KbIp9ND30y
         Se0vVTBDteWxjXWheMR2nu93P6gi342/vqZrZRZwmgMXXBkj0sxTQMR11+1+2350u0Mb
         Txbg==
X-Gm-Message-State: APuU4Z/t/BNz1FFace8+a8pOnRp69JNqDIfUvAVQ5B6epcwYMUw+vyUq
	XPaF63STvxfrBYbX+0gl8QdkfouATGAZOb3n9XgRXwfaVkNuxw5ADp3oyL7yWH5B/Jw=
X-Gm-Gg: AYBFou197hFjuX9HYAYR2NxbVSxbNXcKdSxS9JGZ/UOtPW9SOz688rk9CvRCLyypviv
	OZq0WDYaNeOZS3rvfVuvTn9+ov89rtpmaHDjECPou9aoH2hBoBMsHytc2M8jPfFHAkBEuMlGtPK
	sR86sntMrRxnIh+zY+Fcah2TKbIXlFKUkEPwJR1pQctRCn33tkCIcPG3/WEOeFuUxPkG7YEMPft
	bbyYanPxezeXhLbBNqqYsvj1KOGSz/eLVqL7V/dGgkJhfBHn+dxlHFSkJduC6PdClZ1x5sc8cXL
	MHGdB1DYj5AgkUCCVdlQqb0I+rcN2MR+tCk+DGUccaqvbTT0PC0v6eoYhPBI9v6uXRCSl6iPMDc
	PkyiX+KtUGmi09OF3cIjZSALjl+vRcRpgTQ+VsXOKmY/7xXJ+96WJ0L1M2IzwZQDc8EJz+zTLbe
	3eKPls0+aR5i0ElTtEL2qPKitFSG4XfU9Zt37tGa+OTDSzLnfx1VWv/xCFD4g4vRW0Rn6u1qHrM
	UEFGKHrYELqkGg8T18R7vQR28uY1Z3lsuH6SBRMenZvrykGThDv4xPrdHc+dr33u4iJgydMs9ny
	Lu1A56KhWRF27B6DWJJ4x0yZc7uMPuFxEjwdafrxE333MPNzQUofdv6NrvxQRDQYDcubDpWD4w=
	=
X-Received: by 2002:a17:907:60d3:b0:c40:b59:f with SMTP id a640c23a62f3a-c5096645662mr160679066b.47.1794561081498;
        Fri, 13 Nov 2026 01:11:21 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b236e0sm69519466b.20.2026.11.13.01.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 01:11:21 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Nov 2026 10:11:20 +0100
Message-Id: <DMTYT7CTC6JP.2UXJ6MWGKPX49@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 "yzddMr6" <yzddmr6@gmail.com>
Subject: Re: [PATCH] soc: qcom: llcc-qcom Fix SM8750 settings
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Abel
 Vesa" <abelvesa@kernel.org>, "Melody Olvera"
 <melody.olvera@oss.qualcomm.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261113-topic-8750_llcc-v1-1-6536cb46d7fe@oss.qualcomm.com>
In-Reply-To: <20261113-topic-8750_llcc-v1-1-6536cb46d7fe@oss.qualcomm.com>

Hi Konrad,

Missing ":" after llcc-qcom in the subject?

Regards
Luca

On Fri Nov 13, 2026 at 10:01 AM CET, Konrad Dybcio wrote:
> Bring the settings in line with the with the recommendations (and also
> with the downstream kernel).
>
> Reported-by: yzddMr6 <yzddmr6@gmail.com>
> Closes: https://lore.kernel.org/linux-arm-msm/20261111-sm8750-llcc-island=
1-v1-1-64055702ca3f@gmail.com/
> Fixes: 2c04e58e30ce ("soc: qcom: llcc-qcom: Add support for SM8750")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/llcc-qcom.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> index d7a42a8040a16388a79c24e4d1f1e88de9c87ec0..df213548637351fdaeeb81b86=
0f0ee2631f2062a 100644
> --- a/drivers/soc/qcom/llcc-qcom.c
> +++ b/drivers/soc/qcom/llcc-qcom.c
> @@ -3869,7 +3869,8 @@ static const struct llcc_slice_config sm8750_data[]=
 =3D {
>  		.priority =3D 5,
>  		.fixed_size =3D true,
>  		.bonus_ways =3D 0xffffffff,
> -		.vict_prio =3D true,
> +		.ovcap_en =3D true,
> +		.parent_slice_id =3D 33,
>  	}, {
>  		.usecase_id =3D LLCC_MODPE,
>  		.slice_id =3D 29,
> @@ -3923,7 +3924,7 @@ static const struct llcc_slice_config sm8750_data[]=
 =3D {
>  		.max_cap =3D 7936,
>  		.priority =3D 7,
>  		.fixed_size =3D true,
> -		.bonus_ways =3D 0x7fffffff,
> +		.res_ways =3D 0x7fffffff,
>  	}, {
>  		.usecase_id =3D LLCC_DISP_WB,
>  		.slice_id =3D 23,
> @@ -3946,7 +3947,7 @@ static const struct llcc_slice_config sm8750_data[]=
 =3D {
>  		.fixed_size =3D true,
>  		.bonus_ways =3D 0xffffffff,
>  		.cache_mode =3D 2,
> -		.ovcap_prio =3D true,
> +		.ovcap_en =3D true,
>  		.parent_slice_id =3D 33,
>  	}, {
>  		.usecase_id =3D LLCC_CAMOFE,
> @@ -3956,7 +3957,7 @@ static const struct llcc_slice_config sm8750_data[]=
 =3D {
>  		.fixed_size =3D true,
>  		.bonus_ways =3D 0xffffffff,
>  		.stale_en =3D true,
> -		.ovcap_prio =3D true,
> +		.ovcap_en =3D true,
>  		.parent_slice_id =3D 33,
>  	}, {
>  		.usecase_id =3D LLCC_CAMRTIP,
> @@ -3966,7 +3967,7 @@ static const struct llcc_slice_config sm8750_data[]=
 =3D {
>  		.fixed_size =3D true,
>  		.bonus_ways =3D 0xffffffff,
>  		.stale_en =3D true,
> -		.ovcap_prio =3D true,
> +		.ovcap_en =3D true,
>  		.parent_slice_id =3D 33,
>  	}, {
>  		.usecase_id =3D LLCC_CAMSRTIP,
> @@ -3976,17 +3977,17 @@ static const struct llcc_slice_config sm8750_data=
[] =3D {
>  		.fixed_size =3D true,
>  		.bonus_ways =3D 0xffffffff,
>  		.stale_en =3D true,
> -		.ovcap_prio =3D true,
> +		.ovcap_en =3D true,
>  		.parent_slice_id =3D 33,
>  	}, {
>  		.usecase_id =3D LLCC_CAMRTRF,
>  		.slice_id =3D 7,
>  		.max_cap =3D 3584,
> -		.priority =3D 1,
> +		.priority =3D 3,
>  		.fixed_size =3D true,
>  		.bonus_ways =3D 0xffffffff,
>  		.stale_en =3D true,
> -		.ovcap_prio =3D true,
> +		.ovcap_en =3D true,
>  		.parent_slice_id =3D 33,
>  	}, {
>  		.usecase_id =3D LLCC_CAMSRTRF,
> @@ -3996,7 +3997,7 @@ static const struct llcc_slice_config sm8750_data[]=
 =3D {
>  		.fixed_size =3D true,
>  		.bonus_ways =3D 0xffffffff,
>  		.stale_en =3D true,
> -		.ovcap_prio =3D true,
> +		.ovcap_en =3D true,
>  		.parent_slice_id =3D 33,
>  	}, {
>  		.usecase_id =3D LLCC_CPUSSMPAM,
>
> ---
> base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
> change-id: 20261113-topic-8750_llcc-bd228d96b455
>
> Best regards,


