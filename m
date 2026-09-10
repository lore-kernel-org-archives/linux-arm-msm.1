Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB24361941
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789023464; cv=none; b=e/lzo/+k49gatbJB3TDF2FIbYGJy4Jw/rOmjgK93ARHzW4dOWRG/7JVpsnc73JACVmAevGLT3ml+/J6lMDCpWeD8O5Nz9hHCVU17dsVbcmAE1/vAff8IVTIoAcaIE8uvhBahBYiAfmgdNjgStt+C9WfPrHRSDI2hqt31fTq6Aeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789023464; c=relaxed/simple;
	bh=8zCB3XDTQqRRJheXMBCRqlhKHCGn633+lnizqGt9veo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=u5sx0m0XwsCxG1xywJaS+ytTGhrYfp5UJw69OFQyxR7T+5xXr4GKNQxSh/lbPkDOjZUMpNr7xblqZw1jWN6CmLkzTCbisTMN0C30b22j7Z2oUDtHaVtqBb80DyYXsT2bGWG2Mk0hfzKTcNpBjz4NBs76RZ5eenyywcuh7DljRgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MvJ3XwVc; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MvJ3XwVc"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48441fa5c37so4755569f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 23:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789023461; x=1789628261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AcmCJbwx/4qEbhmcq6QO09FkYuh+y7eiZNBz/riiUA0=;
        b=MvJ3XwVcFJ8dAZ7CJCsVn2whpzhPZol4wO0tRCELnKgOUjWVja9GcIXwV2mu4aN0Jt
         7v+NkYKv3RLwTZh3ZwdnTftegL3HcLsPFa/1S+2t+5lAf4U6VftfdaiOxUDc+Iy2XwiM
         4+jUQchqm5JKqmUn5Vn2P1JVXdxTf9+XLmxUQoY4+rBnHKtw+jqjqBHimOKWdguLgkFI
         C9bAZR5hVmZH5wxRmcd5hErvC4MdASKPCjQstYye3Qz/LYBdswu3ykKMHybmMdaruw6J
         7CI+RisnOLX9m77mEFHNEPqCjnQm6jNrI0q1lDdRBS1ATJ1oZlog6v30ttXeR9KZIxuM
         GRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789023461; x=1789628261;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AcmCJbwx/4qEbhmcq6QO09FkYuh+y7eiZNBz/riiUA0=;
        b=fuyAHXy6tXD+k4D1/YQOLljlIpC570N4I/520G+lNY7Jro0YDiCwK3fjTY1uL6Iqr0
         AT2u7pbd3B/SjpCdHOJigvvWGEHMv3597GV+nW4W/E4tsbDi81AdA/vhTbG5bKP0Pfsb
         iSgg5VmEG4ZlAklYuIcoAFrCD+0SoQHHaX3hlr9mJddQ/IZjYlWojSvBgp3ToLhKsmoS
         ooTLjLyk34iQOYFdKPDnE0WXK4DlRF2RjC4k74A6lw5H2WZN7sqAVwdgUoyQtxqrQYMr
         4gz/08mGMMtv+gg8P2K+Kahrvlq5QfaJ2VJ1GVw9Pws/28a7+S9p2olf6s7WU2+Rp6tT
         3K1A==
X-Gm-Message-State: AFuF++mCe/pyE40Tpoy0P1k1LOvjOPHRumrdys+CS+L1hshpqCMbUhqu
	NUALcQqePcBU36OpF72fr4V6MXn2YMKY99IGyvyeNkukiQQkt6BcTbofmOP8TJ4HVF4=
X-Gm-Gg: AYBFou3y/cS1/hd9PUOSnjiVVhHWyheY90srd4ma1jIkw7iaXGG7lsZWghbcXe5HfGL
	WkLdnjHZGJ9DgePT1jlVBFwGoGAed+myl2mqh2kHIe5E8e0lD5Id0v4lRIA8cNZgbaX5eM0pRbU
	EEL+pejreVLsvMa4qZBbZ071rOqC450UibUbSy2HDKSGpGIAiT8hWaOu1iAPZRDdbt1YYnG/5Hu
	BJezk3AHWnGIFGLNvbxMt7EIMTe5ZYDyfhaWxM2ibwJfhqk3FBcGUHqg41lrZupXAl+jTmXTnYZ
	R7nfSCC8seeX6v88pL/hI8chg9GiC+1i/xH0eqSQ19Qcq3nGvCAzNidg7+egtOqrKlKe+/H7zAD
	cUevwyGIXUARqayBUw7oaJ36kVTeJwuHu2N+R2WmDeEefZJn3a1PJZLCJqJENv1LvCOT0DLmbmK
	x2pXT3aKXxCSHHOzd4N/XC4XX3lOSMTFUXrd9CXMNdQozshZeFylDBJ1RP0bszk9AjQFlp8z/DV
	P4+cb4sp1DtLCZGaC+/W+quVzErxR52XBrMS0EXxbUYgDxXhokd8Q==
X-Received: by 2002:a05:6000:2307:b0:485:ac96:724b with SMTP id ffacd0b85a97d-485ac967324mr11008750f8f.7.1789023461206;
        Wed, 09 Sep 2026 23:57:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:3caf:d840:c911:29a9? ([2a01:e0a:106d:1080:3caf:d840:c911:29a9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883acd33sm49605447f8f.18.2026.09.09.23.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 23:57:38 -0700 (PDT)
Message-ID: <67ba8a92-beb2-4b72-a7fd-4ad88723dd4e@linaro.org>
Date: Thu, 10 Sep 2026 08:57:35 +0200
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
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-0-284880d6e68b@linaro.org>
 <20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-2-284880d6e68b@linaro.org>
 <33be46a9-207d-4f0d-b3e8-18adb8197a57@oss.qualcomm.com>
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
In-Reply-To: <33be46a9-207d-4f0d-b3e8-18adb8197a57@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/26 20:31, Akhil P Oommen wrote:
> 
> 
> On 9/8/2026 6:54 PM, Neil Armstrong wrote:
>> The a750 uses the CX AO Counters instead of the GMU_ALWAYS_ON_COUNTER
>> register on A6xx and other A7xx GPUs, use it when running a A750 GPU.
> 
> Do you see any difference in behavior? Both counters are synchronized.

GMU_ALWAYS_ON_COUNTER_H/L returns 0 on SM8650

Neil

> 
> -Akhil.
> 
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
>> +		} else {
>> +			count_hi = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
>> +			count_lo = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_L);
>> +			temp = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
>> +		}
>>   	} while (unlikely(count_hi != temp));
>>   
>>   	return (count_hi << 32) | count_lo;
>>
> 

