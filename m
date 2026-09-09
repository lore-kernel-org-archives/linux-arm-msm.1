Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC751577E42
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 14:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965973; cv=none; b=r3ygLIDdYDhZvbpzbMLuAl0laRB6kS8YfssMjYCZdcMXfGAE6ejFyHk/wZRkhp4IB13ksB+r9EEpmporxQZhff4xua+b4MrGOZW6h+0rB310JcLQxEM+2R697rvWftoQuiDkJf6XICWlEDJTt9dwIUP2UGBsbRJ0lI1WY05uKEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965973; c=relaxed/simple;
	bh=drY8kln+BrxQaXWQfZyFkLzaCoRxh9DNMq+5RNOp4Tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=teRE4yUF8qPBJKiazkYAt+1yn3BxMZY7ppfTzSuKKzN4h6KfzSHZSBluPJDVWHQFD6TmBBlz9PMYdrFL7TEhvAHUkxk/PF9/IeeyROhhCsyry0Nrx9uX9gTEMeY+jZC7ISCRxNaFw6AMGJsR8Wc8VRZ0Lmt1YLZPG2IQNl3R9SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gIq8wfEd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V4LsgQz9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIq8wfEd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V4LsgQz9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU1iA1810021
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 14:59:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e54EbhbbjxbNn3hH0o0iVyQp
	ZJxdrsa3hetZg+vrQVI=; b=gIq8wfEdEzwY5g240avguM89X3tRMzosuKP6mN38
	GF7zqYjStaHTOeGgrPVFCksIW+B0IICzq3HloEZHvkMw9V9YTa1cVvSgWmnlDjWb
	LNLafD5QDt3j3mGaScpGu2pxYY3uK3TWmbmUThMTMETFKVXlKHHdhdKQBI2BFwY9
	VTv+XFmE0Fbi25lYKakrnvpJ6POApDBnmjBz6qR8KFdSbrZxDH6vPo+xfmhfKFvT
	j/U5/MrJWXThTak7Xo1YLBkdMRy6SxBThe6mxCMpMPLxHmeVbLAzfWkgCLHNANco
	/T1w5hPh2NdyxzKMOtGrYOZNSE4GFM4x61T0G5OATuL1CQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk4xj19pb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 14:59:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d63bad3d09so89587615ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 07:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965970; x=1789570770; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e54EbhbbjxbNn3hH0o0iVyQpZJxdrsa3hetZg+vrQVI=;
        b=V4LsgQz9WFn2pcqBgSaEUTNrfHnrxK7G+1RpcJVP59m8KQYVGgg7icJizmU2/55WSI
         cFp9FR+3Vyj8E/SX/EoonhHcAmLyyUj1dQwa42xgntHnWs3Kq+G68VmyVzSBujEHOOgG
         f8yAuiBRUYcExGDG9ks77qNRK1DdugJVvWBIVkHnPKdeNqOEP/X5yqx6K/ICi5XM2FsZ
         T7MwBRDgjeeEx5KXca75VUzZefn0DmACfAI3Lq+zigqytknUDgflszQLRiHik0IumUvd
         N4H9e0xQJm1yf5LY+9fPaoE7oqEboAnzqlKtQGsPvvhZY6KINFsfHzD7SWH+yw6cdDwc
         FAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965970; x=1789570770;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e54EbhbbjxbNn3hH0o0iVyQpZJxdrsa3hetZg+vrQVI=;
        b=BAMNdFP0NUAQ9YYK33z4ufo/rz/Win4v/Q+8qzARNsbcYDB4yF5Yj/iy6CoMHmmYcx
         Ch/AjxWG6JZqqXP9sCZQ5v6hBeZeyiLfuXHHsVJPl0azRVl5zNQ7CTsCXHC8jzeLhHds
         hw8xhkKFzInLxUm3qmF/xiGFCN188GxdrXUZlWU1SCm19oUzKCuRhXi25e2KvR159vom
         iwuG2Ad6RgpIwiKn3LzIjCyE6UvXox5/CvuB+AmxLfnOT6pErNI/XexrngPNt2Y2jWlM
         FbgUFGefVt06GBzckt3X/bX2j1hgSzzJ+aGe+8y9vE9iVITZjnwqr3P/k7ov4F4SRy86
         kv/A==
X-Forwarded-Encrypted: i=1; AKwUvByz2/a9NyEzSIdOM+98BWvgqW6EqxKV3Y2urhUwEiEVCHnTXYCh6un05J8YhEp68EMli+VhwBulC5NoXtj9@vger.kernel.org
X-Gm-Message-State: AFuF++ltkqsyDccP3R+G6PsUbb9c+cmp1v7J1hZsABCr9jPZEJJA2zwU
	ZnoWFxOnzg2wvqGOnaZMg1uqskCFOB0jm/i3pUpUBoUNjc9rov4/fyxhpsmQf3cdXSpQWAeQA6M
	Z5/XervhRDjMz8XtEO6YXT3sNccPNWYnxiKWfPBZBhiFoe0Ut0SiewJg4IYdqwtV6WWuB
X-Gm-Gg: AYBFou2HYjvcJAdbDVkYm5XgnL4NALl0+0c8szbekcy+dAnmIwxrhmSlg69sxNBiOoK
	HOXqLTBaZMTWSgvtny3lfAhI9njrDeSbQsKDD4BdQryXqENqqNaEvov9c8jNPt268lhJgeJQ98o
	oR/ncouB78KmuL1tJAPluGunKGir2FlASo15+mZm3ph/fPpG5zcy9D67pZykmRDNCPgMAs16haw
	Vycl8lXWuyHzumImM4cC/QNKUCYvpJeog5Im6MjTPsvXRcB7+S5WZLtwPfPjN5vLLSMI1egWejg
	XSDrnVYanUZCJ9a95/J40es2SKHUhx6abyV62QS2M0qg0MzmUgI85PZgjklFkMDm2uENKWjTU/6
	S+0oMIHr6bnsV3RTST+Gm05GGSSMZy+vTN1+yCkl9ZS8=
X-Received: by 2002:a17:90b:3c48:b0:398:e436:384 with SMTP id 98e67ed59e1d1-39b260d335dmr54355548a91.1.1788965969469;
        Wed, 09 Sep 2026 07:59:29 -0700 (PDT)
X-Received: by 2002:a17:90b:3c48:b0:398:e436:384 with SMTP id 98e67ed59e1d1-39b260d335dmr54355467a91.1.1788965968764;
        Wed, 09 Sep 2026 07:59:28 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b2612d3f1sm32456833a91.13.2026.09.09.07.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:59:28 -0700 (PDT)
Date: Wed, 9 Sep 2026 22:59:19 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 3/5] ASoC: codec: pcm1681: Enable system clock before
 regmap access
Message-ID: <aqF0R0FVrnC3hi6K@QCOM-aGQu4IUr3Y>
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
 <20260907-nord-asoc-driver-support-v1-3-997d3b20cf43@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-nord-asoc-driver-support-v1-3-997d3b20cf43@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfXyOpN6vCn52OL
 WkTrBn2F7JwittXeGvuRq6M2tsIOqJf/aiV7/A1VEs5G7EZv03xqmBsYovyCS1xsgS1comp9DKX
 7x551m63p8O+lVLS2jqcwNFlgJenX2o=
X-Authority-Analysis: v=2.4 cv=J52aKgnS c=1 sm=1 tr=0 ts=6aa17452 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=0Zc5S7fWRYNTRwHQfoIA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: Ijh6KpGu4DHBbIRSxM7L9QZtkGRjwfWS
X-Proofpoint-GUID: Ijh6KpGu4DHBbIRSxM7L9QZtkGRjwfWS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX0gZCZEaYXol/
 X7FSaG1YlF/uXn6egwTcexNzwlfq8C09YHfAr5fFO0Jv0Iem0mnzRCjc++rpVoP/2rU9t9PNGTa
 6aP6sRXB9JcM0x4S1U8Ou1cc0GOkjvtGxc+KohbaQj+3jz1qAeP0+DtqLOHXcfkv+trImuZDrL8
 FGr557WbtC0gUe/6838kFE4OGP8MpvrfSbE9OkpgcFRltFOa1W44p3KOfmMTR1Ni6tZ9xjkpA6N
 SBFgNNg3blOudbkWEcSwy+bzDAoYTgkM89ZT7z/dkl9mD3RzgwZW4YDx8RyYpiht4VTKGvj5vKS
 V69WlxycM2/1qpZlUkFAIskxy5Zf/cSVUavM2WFTzT5BdiBwMFp8YvhV4cpgvHKwpyVTjx2XATt
 lSrbj9WwuwGMpFcf4ThS6ahHyOR5jXTjTy5kiowkXLhD7QtpmMpPh8Yj5rKAinh/k3cRBp49/P9
 N1x5BzXm73JqXAyTnrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090167

On Mon, Sep 07, 2026 at 11:39:44PM +0530, Mohammad Rafi Shaik wrote:
> The PCM1681 DAC requires the SCK (system clock) input to be
> present for proper device operation. On platforms where SCK
> is provided by a controllable clock source, register accesses
> over I2C may fail when the clock is not enabled.
> 
> Add optional clock support to the PCM1681 driver by acquiring
> the "sck" clock, enabling it during probe, and registering a
> managed cleanup action to disable it during device removal or
> probe failure.
> 
> This allows platforms to model the PCM1681 system clock through
> the common clock framework and ensures the device is operational
> before regmap initialization and register accesses occur.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  sound/soc/codecs/pcm1681.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
> index 60fdbe5c4e05..cfe549176d14 100644
> --- a/sound/soc/codecs/pcm1681.c
> +++ b/sound/soc/codecs/pcm1681.c
> @@ -12,6 +12,7 @@
>  #include <linux/i2c.h>
>  #include <linux/regmap.h>
>  #include <linux/of.h>
> +#include <linux/clk.h>
>  #include <sound/pcm.h>
>  #include <sound/pcm_params.h>
>  #include <sound/soc.h>
> @@ -74,6 +75,7 @@ struct pcm1681_private {
>  	unsigned int deemph;
>  	/* Current rate for deemphasis control */
>  	unsigned int rate;
> +	struct clk *sclk;
>  };
>  
>  static const int pcm1681_deemph[] = { 44100, 48000, 32000 };
> @@ -311,6 +313,22 @@ static int pcm1681_i2c_probe(struct i2c_client *client)
>  	if (!priv)
>  		return -ENOMEM;
>  
> +	priv->sclk = devm_clk_get_optional(&client->dev, "sck");
> +	if (IS_ERR(priv->sclk))
> +		return dev_err_probe(&client->dev, PTR_ERR(priv->sclk),
> +				     "Failed to get sck\n");
> +
> +	ret = clk_prepare_enable(priv->sclk);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "Failed to enable sck\n");
> +
> +	ret = devm_add_action_or_reset(&client->dev,
> +				       (void (*)(void *))clk_disable_unprepare,
> +				       priv->sclk);
> +	if (ret)
> +		return ret;
> +

All three calls can collapse into one?

	priv->sclk = devm_clk_get_optional_enabled(&client->dev, "sck");
	if (IS_ERR(priv->sclk))
		return dev_err_probe(&client->dev, PTR_ERR(priv->sclk), "Failed to get sck\n");

Also, priv->sclk is never used after probe, so drop the struct member
and use a local.

Shawn

>  	priv->regmap = devm_regmap_init_i2c(client, &pcm1681_regmap);
>  	if (IS_ERR(priv->regmap)) {
>  		ret = PTR_ERR(priv->regmap);
> 
> -- 
> 2.34.1
> 
> 
