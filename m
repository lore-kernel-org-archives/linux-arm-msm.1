Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465463FF1AE
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 09:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946351; cv=none; b=k+zC0xQKXzET49bisIEdxe9yjh3gRfbGlrX9CAjKgce0evUr5zl2Isy+h0RTdzIXcG1hfOcIi7UpQEhAwaoZXyVCO+o+6paczqSrwB01wFhT2X8/2jyjrrUyhZhdjDkS3F2GGRonluPeUnvN913SpREZK/Pv2UddlpX7HXfCY8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946351; c=relaxed/simple;
	bh=90UuAAkLCdH21lgVdH/mZSVMe6f0qL49N1SsKkZ74vs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UaWaDZLz2HCD5fxW/vhqm8e6MsJafED6Z6+3aHEA//bPZCNq5C19hfJNNRjQkjHTgQvOzYZD8Lpl22s/CjDIHLMHgfVwRM8sbHJTPKlG2tkX8/pnc55HquqwZj9sDakxWdwwHx/DIo+cwupuccX6yOYCvB19aJvalhbZI/0bvFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mfaq+Ykb; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mfaq+Ykb"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b9320423cso63732035e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 02:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788946338; x=1789551138; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qtG69rbhI5dj5FSdbtZU04DqnJ+za1Yd8VMlYpZeS9Q=;
        b=mfaq+YkbzlvAClwHLeIfQfRDDQr9LrFL8z+V0GoaDRzDKYYUdXjs12KQjnBUyqzFVc
         yloj51pEo5ljiiQ+Ue6GwUqt8GFHbvkdJ1PBGSSx2HJG4Q0XqhtRxU2oj7YXY7X9Kc8o
         BLBi+C0Vg0pMV2oK6FMkz1cAGkktH0muoDBaXRPUvcQi2XYxyJChhAgxZONZCuMmC5Ai
         FsjIxvuv/fgH8wDJn4J2mZbvR+vyBqEDR/OizfKlZCBKnC0l1d+RXoQWJhnSyMcskXZk
         zWRn/6wApHTgUs3NJtJ4h/QAbjSXblhEgQYIxXL6WHxUz4YXpSTgDLjCrOVvwKih9SFD
         CWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788946338; x=1789551138;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qtG69rbhI5dj5FSdbtZU04DqnJ+za1Yd8VMlYpZeS9Q=;
        b=fbzr0BxuGgTqokQEbcMeD6tmhftd7iGLPH5I3ouR4XKjveejiwXR6ZhNnTghPKFtyO
         0wVen3KzYzia0+PTsIOnogCMvLans66NMtTj6jBWxQI8wcjM8ynYrfE9s6j8kkZMHlrm
         eqhWUQVjZk4pmBw52AkzCf914sHs6pqytPuJ4E1Ro7hcfUTi7Z8GZx7P5fXkx1I8wl/f
         Kj9AKAcpfBmfq9zDOxMd7xW5XFmALiX5jjkQXzEFeRc9HSqr9UPBDkngTYRbEgJuFehO
         zZulfk22mcxfYcnUp7tGVtaZLL7KZB7e87G3RNvPYfaZrlZks/2ZuO5c/7HtD714gs98
         9TQQ==
X-Gm-Message-State: AFuF++nTXWgtbGyXsfuYf8l+WwP3eaTijiYYauTLmwWi5VsGs79ofJ7I
	o9jn8ewYtku+mD1pgcC3n3VG+YZN4L90AG5uwgrHQvngkoOhTYNjhh2y6jM5iuPeR9Y=
X-Gm-Gg: AYBFou32BvrxVUFjpMTi/2YFoN+lCxNoQPW3vMcTTY1yHOTLGfX75N20rL599sb+jY2
	ubBNpeSobwyrpZUpufVPv1WFnyEzdpyX57QFKUL3FFH81kp66QJXNbnpY33Np4feyqcpQ5UnVxz
	HYLDWz6keHSKQ5H1oxqrccqPCfBtJ7AfKf5eHa5BbJq33yi6gW08yXRqwHde9lFrjWI6cvRotUe
	UAJy2hFpVS1JZpEGEqYLzZgmzdDaNdgGWZkWSVHm3VCpoYEfsZTnt/QATydhS+oAcX5xZSeYnQK
	mHuGOfZ7FO4WmHBcySTG6JnG8O3lcMnbTg0h3BewQjDl+JhHljau7RrMaKZrNTdsE0ZM3SH6nc1
	Mg2aHeHFBgx2JUmtH+qRQyr1ZK+hL/1GrrS5InHpJONaExcu78d6rHLbi4gBBg0M1lDCdZabzFi
	/Ghi/3e4SVbQJxrguDhQ5eJSLxYzeIBTEcIupJkMtO5b70xt74qHjVyDwze/QKxTmUzc004KBWe
	VrKiQ+T5NY/VlBzqZPawQyj5o25zFkfywwvKo4HZZDgCaQH/5etbBw6e/7f4tpA3w==
X-Received: by 2002:a05:600c:4712:b0:499:7a15:fcec with SMTP id 5b1f17b1804b1-49cf8248cd3mr570725515e9.13.1788946337959;
        Wed, 09 Sep 2026 02:32:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:14f1:e0b5:e1a0:a97c? ([2a01:e0a:106d:1080:14f1:e0b5:e1a0:a97c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf75cd8d0sm431347165e9.2.2026.09.09.02.32.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 02:32:15 -0700 (PDT)
Message-ID: <5bd35343-1bd9-43c6-90f9-d57d67e6d416@linaro.org>
Date: Wed, 9 Sep 2026 11:32:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/msm/a6xx: Use CX AO Counter register for
 timestamp on a750 GPUs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-0-284880d6e68b@linaro.org>
 <20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-2-284880d6e68b@linaro.org>
 <47f0399d-bb31-48bc-b69d-4abd445727b4@oss.qualcomm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <47f0399d-bb31-48bc-b69d-4abd445727b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/26 11:06, Konrad Dybcio wrote:
> On 9/8/26 3:24 PM, Neil Armstrong wrote:
>> The a750 uses the CX AO Counters instead of the GMU_ALWAYS_ON_COUNTER
>> register on A6xx and other A7xx GPUs, use it when running a A750 GPU.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 +++++++++---
>>   1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index f9de9329dee3..081e79ea4652 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -23,9 +23,15 @@ static u64 a6xx_gmu_get_timestamp(struct msm_gpu *gpu)
>>   	u64 count_hi, count_lo, temp;
>>   
>>   	do {
>> -		count_hi = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
>> -		count_lo = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_L);
>> -		temp = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
>> +		if (adreno_is_a750_family(adreno_gpu)) {
>> +			count_hi = gmu_read(&a6xx_gpu->gmu, REG_A7XX_GMU_CX_AO_COUNTER_H);
>> +			count_lo = gmu_read(&a6xx_gpu->gmu, REG_A7XX_GMU_CX_AO_COUNTER_L);
>> +			temp = gmu_read(&a6xx_gpu->gmu, REG_A7XX_GMU_CX_AO_COUNTER_H);
> 
> KGSL apparently *writes* the system time to these registers, is that
> an idiosyncrasy regarding how the vendor userland drivers then use
> this counter?

This is a GMU counter, no sure why & how KGSL or freedreno would write anything to it...

> 
> Konrad
> 
> P.S. looks like a8xx also has this counter
> 

