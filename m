Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672795;
	b=pil5Gr38agq0v0G9MHFrzG0r1Rd8Ja0jycOJUlye1smJz5FN5GDenHHcHfSVsMNkZS5r
	 TCh9CsJOAy92ZDRg3Zbh/yORqEv7oHWCJQt+ANFXQ0REjaI4J8yMjiL3L1zTNMTRaZull
	 3Qp5JXWcG4Jxd1pT4MW9wuq37RdCJdafRx19FfymvKhaAWX7dwztNxizhsY83lrrhhU01
	 qFoIqSzpljSxhw0peWPZB11zFe9hW2kafdT7zaNZXJ+GE7x5xYzJPDyGSjEyCgk/KXYRv
	 O6qS0Gm8ehKE56/5btVj1iV2u8bvDzvEU6rnZMmW600MYFUQHZLoEIhNgB5UMZmiBKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672795;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=k2IRBl9gY5e2oSUNrEWY6jjQeC8ZZ1pQO6bdpjOXj2I=;
	b=wQz1IE4WBs0k8UfwqxweIWB9XSq+xxqB4+YqCl7acN6h8iiDUoA+2BoHb9+XF2qh/eVc
	 ZL6khIFKn/lP8B1OZufUfCtJPm37JCAxBhwhwgV5xAmcB+vEbOGLqwukzBmcToRMoWe4n
	 EGADg5KZWGgrS6N1NwAU4rxMnn9Gz8piAQ2/k8nw+3ehevFiSq2Ih6I6c96g+VoqRV9wk
	 sGeIQvHvhKVmEHr6RhnlTN0VbyU+fejxlmKvzwznvfmmqSh2fOp69kzfi+Bz59mOv/omd
	 fPinB3fSg0PVwTJ8VWK3J9iftxT4EzcXXgQ9AUPE4hBUCJ3JmcUQKd/4/rcFufyQh/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eXnfkOdx;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BC8606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 05:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8BC8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eXnfkOdx
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c00b0866b0so382029e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 21:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795672793; x=1796277593; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k2IRBl9gY5e2oSUNrEWY6jjQeC8ZZ1pQO6bdpjOXj2I=;
        b=eXnfkOdxJc0Gj7vmJ8rNyjwrixGiB80YcEjr3kfxXXWycGgRixJo8zxbnIzNFq3yNc
         2mMdoAgIIepQ2rgKnIcqF0K8Ll9eeCF+H+HCXTEzWIn2DGA2jL4fMrPxUFQy3HCk3Xho
         YM+CEtXOh/+YQemc6c8XUTfwL7cc73Wxn5BAxKVko7gF0qH8FaoP1GFQFthtGnYhYhj4
         v/6KADYgbLYCA3z2UPDOvPzdlYW2TEnWANnnfLA9bWYQTYBGWmyjVSZkSQtsixl6N+8z
         7fuqCjnuZdhE5DFOtA9to/FYLZvKfJdwZDx64/SawBHM+x+VrPGbavm2BWt0jy8yf4eq
         00cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795672793; x=1796277593;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k2IRBl9gY5e2oSUNrEWY6jjQeC8ZZ1pQO6bdpjOXj2I=;
        b=A0H2bA0mlQJPPHk9J+DoDD3sMj0DUnJCoddtiCihu3ry+IFLyTSxbLkKLlETHQR7wo
         87QkZq734tYNc+9hsyuZ116HH7FhbysTPvUZocPWfuajvmFaRMQ0kJg3uC0wGDvQHbml
         rjIj2+G5I1uRzrOUMg1dvaQpQU78/t1HHL5Tpeoy1qwvjD12bNnb9kKFhYp7ee8AIWFH
         vFF/ouhAW/V9VXEtMRdI1Eve9s0kW1goIT+Zb9rG38+oBoDcRRJFSC47KP6EZgLTtOwc
         dRDncmEY+0G6dvyxhe84IHe2lynFLanUeVY4/YFe7bb7vwq0igijz7RlZqJoOY5uFrLb
         sTDg==
X-Gm-Message-State: APuU4Z+2xnKyMcDmOl3N/hATYM71ZxQMukHBOVa8xm1Xr8Y/FjlGGSBm
	iYTEal6yY45LApIEB2ncLLZxOtXmS96loFZ7FBoNAuqfWJemSEf5pTEo7EO6mTuicxg=
X-Gm-Gg: AZFdTZfZaIiW47LdRWZSHaTBn/BZGeeP6eL2HhGjY86Z4Tz2pFodhCg72vbhnB/a8Zy
	xHY//uRpG/oPSU9H5h8rS2gpl66+vjAK3VoscZ84qP/iqNIdpXM5FzgPrXAhctg17llzOlIPp6C
	16l5GQqnwZ8nlz/dI2+sFClDcIXdKJoZeZZlqQeO+IVmojZzJIjWfQGk5wgRDLbz2gNXVZCvbbr
	Hk060HuQzFS+1k7IaVHEJsvsaDZA8wcZY/uCVm5h5Gn8qEctRfzndGYIOKp4IEfnJ81bQKBkEKu
	WOrwcd3DsoU0qBsFmYIzyZ4mPlm33v6dthaSycH4Vu1QRN6CjbSoduHuCCFMtMYcNmq9WgwlJoT
	i1tpF/6vq0M9/aW31yWtzbJT0zk8+AFncCbL/r7cBVNuSC544IT9is6pj7kmOVeO5dGlYkthfb1
	+uv+QJVSC8dC0LVGYXwo3aZ19chl570SdQKgpj+2UFDZUIl/7FUkgRoJgGWX7lgC+MViooi8w7K
	MBCXfEkw2yQRKI53gx/ONLHLr1mdRADcEiLyHMY7lBhGu4yb3zy03WERZJMZ7tWQzy+O+ErufzL
	a1JhdX+tLaGs2XXzgz+xGtCq8G2zQkRAMeQwo2eh2N6Uiy+/sEUOBCTLFcK4fAhXnhYyggiPyxp
	LlD5BUQY=
X-Received: by 2002:a05:6512:12c7:b0:5bf:a48b:7827 with SMTP id 2adb3069b0e04-5c1bc6bf385mr6662753e87.2.1795672792982;
        Wed, 25 Nov 2026 21:59:52 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd01b3eesm5192662e87.42.2026.11.25.21.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 21:59:52 -0800 (PST)
Message-ID: <6d7257a7-92dd-4a1a-a598-9a4cd2be6e2e@linaro.org>
Date: Thu, 26 Nov 2026 07:59:51 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] media: qcom: camss: Add Glymur-specific resources
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261123-glymur_camss-v4-0-d7db74f59e22@oss.qualcomm.com>
 <20261123-glymur_camss-v4-2-d7db74f59e22@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261123-glymur_camss-v4-2-d7db74f59e22@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 13:36, Nihal Kumar Gupta wrote:
> Glymur has three CSIPHY instances while X1E80100 has four. Reusing the
> X1E80100 CSIPHY resources also exposes CSIPHY2, which is not present on
> Glymur.
> 
> Add Glymur-specific CSIPHY resources for the three available PHYs while
> continuing to reuse the common X1E80100 CAMSS resources.
> 
> Fixes: 09d6c30d3fae ("media: qcom: camss: Add Glymur compatible")
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 42 ++++++++++++++++++++++++++++++-
>   1 file changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index f8e5cf9f3ff09e96d3b48cd5628489715385cc5c..f3cab9ecef04273e09b81ee0cd4e31ca45d1c915 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4103,6 +4103,30 @@ static const struct resources_icc icc_res_sa8775p[] = {
>   	},
>   };
>   
> +static const struct camss_subdev_resources csiphy_res_glymur[] = {
> +	/* CSIPHY0 */
> +	{
> +		.csiphy = {
> +			.id = 0,
> +			.formats = &csiphy_formats_sdm845
> +		},
> +	},
> +	/* CSIPHY1 */
> +	{
> +		.csiphy = {
> +			.id = 1,
> +			.formats = &csiphy_formats_sdm845
> +		},
> +	},
> +	/* CSIPHY4 */
> +	{
> +		.csiphy = {
> +			.id = 4,
> +			.formats = &csiphy_formats_sdm845
> +		},
> +	},
> +};
> +
>   static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
>   	/* CSIPHY0 */
>   	{
> @@ -5572,6 +5596,22 @@ static void camss_remove(struct platform_device *pdev)
>   	camss_genpd_cleanup(camss);
>   }
>   
> +static const struct camss_resources glymur_resources = {
> +	.version = CAMSS_X1E80100,
> +	.pd_name = "top",
> +	.csiphy_res = csiphy_res_glymur,
> +	.tpg_res = tpg_res_x1e80100,
> +	.csid_res = csid_res_x1e80100,
> +	.vfe_res = vfe_res_x1e80100,
> +	.csid_wrapper_res = &csid_wrapper_res_x1e80100,
> +	.icc_res = icc_res_x1e80100,
> +	.icc_path_num = ARRAY_SIZE(icc_res_x1e80100),
> +	.csiphy_num = ARRAY_SIZE(csiphy_res_glymur),
> +	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
> +	.csid_num = ARRAY_SIZE(csid_res_x1e80100),
> +	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
> +};
> +
>   static const struct camss_resources msm8916_resources = {
>   	.version = CAMSS_8x16,
>   	.csiphy_res = csiphy_res_8x16,
> @@ -5806,6 +5846,7 @@ static const struct camss_resources x1e80100_resources = {
>   };
>   
>   static const struct of_device_id camss_dt_match[] = {
> +	{ .compatible = "qcom,glymur-camss", .data = &glymur_resources },
>   	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
>   	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
>   	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
> @@ -5824,7 +5865,6 @@ static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>   	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
>   	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
> -	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
>   	{ }
>   };
>   
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
