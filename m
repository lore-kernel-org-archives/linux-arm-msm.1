Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBC73C2BA4
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 11:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789126671; cv=none; b=Wil2/o9ZESFLtj+RguNvmZMdDXyUTHPM/Mg75G/JeHg2/Camg/JFcCvjNteYS/1oOOLtGTTRi4XeLgKTiXFUX5UL1wL9Htt//6ktU/iHSS0Co+AuORrw5oC4GP0cEvXgnXsosqbgig5SUY71WloAqxj/KG93qnx6vGtBbCwU2/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789126671; c=relaxed/simple;
	bh=/jtMl6nwlLDuuVrwItRXOP4Cc49Gq/vnQ53/lTMcuX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SxjlPAOTDMIvAKBf9n6+nXEqvalkZlBmQMF8F8QxatbaffiwhhzLAG/WUV0XgJ3E6DB+1Kwa8CyXT02sjxlvTe21XF8OQgeZCrHPOGWpTkb4J7Rb3gBWQKCiEhbb4fQYlwMKo5O+tLk/OHD9qfs0GZgl76SwtSX6ekr5C8DgL/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D91obaLK; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D91obaLK"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so8078455e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 04:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789126667; x=1789731467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EayMPOcZxyoCtg5IeG60fytW1fRTE2fWXUuuVgaKN5k=;
        b=D91obaLKb/MtutBWKUzzfICCxyjd9dFJV6jS+42Rzv6XGFKubnjI29CBjpbAholZVK
         /f1YLRBIa7FiWWyJvVb+faWKAgeiFa//RAYBANF9glQa01yPfyHQKY9Wp02Ij6GsgWdT
         /eQPSWoxXnufkv2x3SPn3elkNmYGjO2trDJrv1LNtMAU9sxtHJSRUBfBx37TSx2kuKuv
         +tKrdtxuAd1b1bx0+tHDbryzws/0ytnAvFHFnSCTdzYnahH+VZLWMVNM71gmm64/t+Tz
         cCnXQeDhMmOK0cMvB4WXX0HkeA8KWFdrBCn/yj1XeGWy4DK5xKwIm6hQxWQ7ZDhVuA3c
         vA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789126667; x=1789731467;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EayMPOcZxyoCtg5IeG60fytW1fRTE2fWXUuuVgaKN5k=;
        b=QNiVO5za3tYBlXKicVlxdp1CsnSz8sYLhaAho4VC354HFgnh1koKOapGjWQXrrOgaJ
         o4FLBU0+qhHj+mWEVCsP1o8zAYOmJ09h0wYXvT7E4eEgDTSav090JTdnDPHga/uce/xQ
         AkqTiPllQmiKLEtzzpcFcLUYpry+bjPNFvZU5h+yN2GW2vj5RmXzg+xhRIRmycu2PrKQ
         oJ5kMjsr3E81SmVvqw3+hu79GN9ZjQUJ35FvCX2a8qxaedKeW55IAG27Kgbz0IxYJ8SW
         +KCW0oGxtD/3F07X8K4bR/Qx9XLFpowz6foN9Ug3kSIwsyFpVGXRiN7ZEfllT1V8lvYG
         LI6w==
X-Forwarded-Encrypted: i=1; AKwUvBwJLonKomqix0ULQl5Vur7fNWTUaCWErZjXFgIMKDT7s7L7gfJN/evK+g8D2NnjfE4WYEO52xKqhHcS3ILO@vger.kernel.org
X-Gm-Message-State: AFuF++lr4jEUc2oYpIQUpvlWlsZ+JpHtU1s7DeUDNonoL3EhBw2FNzgu
	2rFI/y3OMqmZaK/RceVynuDansyL7SzB6/Md2F8H6HCzKMqIzdDCsrsCporwdwC0u8s=
X-Gm-Gg: AYBFou04jOB7f9fVWtXv+f27DxNcq+Sc4VbyT1XV7GyxuLViouVZFUllCdz/mUhYa3J
	Wi2U1exLvtX6RMEDmunJk5kFFlTpLHVa1lKAWbxin+uitvgwWTMN1TTjCDzop1ncsRad/6eCug9
	a324JH/xbUA3K/RavljeA41WC8b3NZlKHCdJHX8dEMSdMGy3CC63o64mMF+TnEbLMRbmIkkkSln
	291qXhHkLwcL5jtGYWjyxRGtrOz7B7iowZ1Kn9b/wPH1TuGIUkvY5iRp2Ll3duy2tlSTeJXlq4N
	GRqO/D1lM7YzCNX6E2vUwHYdDYDUXiXL98eK1R5NK9M6ja3Yh3Qbn55P4P7astiY1ge2GtHlM70
	45pXZqnC0U0WYWrPyAlz4txDkD2LLLcFdSEikUOQHs5L4aJJvL0oyqsWJRX+RhAZ46cVr3Sn/Ho
	/NqBiy6Kv67/Zmm8jAERcdimPM9BBgQ5m0V6GLyE46LdTgmzGYa7ACeVF0fncGXK6jVn+UnnTh/
	R+zhR4wQdfTu446YMzngkE=
X-Received: by 2002:a05:600c:4592:b0:49d:286:83d5 with SMTP id 5b1f17b1804b1-49e619ad1famr39547335e9.13.1789126667439;
        Fri, 11 Sep 2026 04:37:47 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.225.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c39086sm134278155e9.10.2026.09.11.04.37.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 04:37:46 -0700 (PDT)
Message-ID: <9b7cb871-1bdc-4a9e-9917-e16a53dd3fb8@linaro.org>
Date: Fri, 11 Sep 2026 12:37:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] media: qcom: camss: Fix CSID-to-VFE all-to-all link
 crossbar on sm8250
To: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20260911062213.195007-6-gjorgji.rosikopulos@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260911062213.195007-6-gjorgji.rosikopulos@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/2026 07:22, 
Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
> From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
> 
> camss_link_entities() unconditionally links every CSID to every VFE,
> creating an all-to-all crossbar. On SM8250 the hardware wiring is
> fixed: each CSID is hardwired to exactly one VFE (csid[i] <-> vfe[i]),
> with no crossbar between instances. Enabling a mismatched link (e.g.
> csid0 -> vfe1) creates a media link that does not correspond to any
> real hardware datapath.
> 
> Add a csid_vfe_fixed_pairing flag to struct camss_resources and set it
> for sm8250_resources. When set, camss_link_entities() skips creating
> links between CSID and VFE instances whose indices do not match.
> Other platforms keep the historical all-to-all link creation.
> 
> Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 7 ++++++-
>   drivers/media/platform/qcom/camss/camss.h | 7 +++++++
>   2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 2123f6388e3d..1bb22cd23c5e 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5000,7 +5000,10 @@ static int camss_link_entities(struct camss *camss)
>   				}
>   	} else {
>   		for (i = 0; i < camss->res->csid_num; i++)
> -			for (k = 0; k < camss->res->vfe_num; k++)
> +			for (k = 0; k < camss->res->vfe_num; k++) {
> +				if (camss->res->csid_vfe_fixed_pairing && i != k)
> +					continue;
> +

A) This should be a Fixes
B) This should not be limited to sm8250

>   				for (j = 0; j < camss->vfe[k].res->line_num; j++) {
>   					struct v4l2_subdev *csid = &camss->csid[i].subdev;
>   					struct v4l2_subdev *vfe = &camss->vfe[k].line[j].subdev;
> @@ -5017,6 +5020,7 @@ static int camss_link_entities(struct camss *camss)
>   						return ret;
>   					}
>   				}
> +			}
>   	}
>   
>   	return 0;
> @@ -5666,6 +5670,7 @@ static const struct camss_resources sm8250_resources = {
>   	.csiphy_num = ARRAY_SIZE(csiphy_res_8250),
>   	.csid_num = ARRAY_SIZE(csid_res_8250),
>   	.vfe_num = ARRAY_SIZE(vfe_res_8250),
> +	.csid_vfe_fixed_pairing = true,
>   };
>   
>   static const struct camss_resources sc8280xp_resources = {
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 93d691c8ac63..ad0b42719788 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -119,6 +119,13 @@ struct camss_resources {
>   	const unsigned int tpg_num;
>   	const unsigned int csid_num;
>   	const unsigned int vfe_num;
> +	/*
> +	 * True on platforms where each CSID is wired to exactly one VFE at
> +	 * the same index (csid[i] <-> vfe[i]). When set, camss_link_entities()
> +	 * only creates CSID->VFE links for matching indices instead of an
> +	 * all-to-all crossbar.
> +	 */
> +	const bool csid_vfe_fixed_pairing;

I think the number of platforms where all-to-all is possible is quite 
low - if possible on any.


>   };
>   
>   struct camss {

