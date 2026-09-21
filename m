Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A4946EC99
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 09:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984409; cv=none; b=XhOQnj1GYLxL7YjhWBzJr7aYMFhc6kK68bDDbRzgfjgAz7/pU/4mB7NHIZL4HoU1Vu+FgPKf8arhBzIVu+8dV7IA+jHfv59Rt3jm5F9uX2WkeUa8Ul4OxDj4A6mNLfnq3yiY05Y5aivg2lWgtlls3VEbEIRWKLJvMRQMWVKwLdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984409; c=relaxed/simple;
	bh=PXzXHl6/d5bVoFIIqYQt3bgNTnT7joVzBNSPO0qiPMc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Xa06tHMXjjdIaP+ckOXV0ET6Y2usnjhghaTF5xFduiIIA9fwOJf1tliUeFHsH6XOCWNIr3toUu/IktZ08BKP0jw95RWqUuvEJpJs9KOMOH56HWUDRxX3wiibVCgkwaB6mq7rUjSXZJMWmlxqpimY3XxdcSWKeKMKgsYbeObgJ78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MxVx3Tmt; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MxVx3Tmt"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dc83so1955783f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 02:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789984406; x=1790589206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HGGQwgupkqrpkHOpj6oDdQyUFG/UOtLeaAkYO1fiXP8=;
        b=MxVx3TmtDGGRNE7lkzLH5fU+xIgsJ6T59P8AlCrKCLNRtQFjEuEGs3UolDk6WDF3TK
         cOBYN58CK4GwO/PistMcjVyKe46oi6mvk96sbiW2xhUCM3FxbDFscw+SAj4zszRh2Hiw
         dcJaNFpollrzY7bVceJt43XYLrYK6rkAxBGwa56ghxicBE04IPfLYGOzCljy+SlIathi
         wV+g4yUGqL2JEgN7FyzTqtBRIdEeTp2jFD5g3SNdWvRnDCFM6TvwgPM+9h3qO9wSe9+H
         esww17Mrr4xhe6B2rk/X9F1QHO0egrx2Z6c9NVbR+u31XD4tDp2vpNz/v8W6Bh5/xTBK
         eU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984406; x=1790589206;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HGGQwgupkqrpkHOpj6oDdQyUFG/UOtLeaAkYO1fiXP8=;
        b=nUeL/pdYEWMiAsx136qNF8mK0xIvzwX8i/IOhPpQcKO003Bd+zdgrf8+ldCDitoT/Z
         J+RYrb5UJ6Vwf/IOnb8omyBM2TFB/bEKfAaU3UBqvvudowf9fyzMxmuhAolZ77VLrby1
         T/P5ycf0eOPlnD6MivQ8Tg31k6UDiHwNz3i0aVyov579I/zhRxfjO9HqWFjb6SdsY04z
         npLDBoX7iAF4Ip6+cV/wfmmFUUH8q0YMiy3r7+Nw/SGKDVZe42wJpKhWE4/1DdmQi6sW
         hG3BZx9rhVnYPhehK7KLBxuYfhzSKENXSuVTqFv5IcMTPD2zYvG9wXB5xgw3WbHyrOqT
         jhYw==
X-Gm-Message-State: AFuF++mEblyD/dy7D67OD7rPzYpxE61SeDfZzo20LMLijD8yxPmqWliq
	QxA4P8TMlw0oFN8JB9imAr7VfB6dinTcDQBivsU++JONQ8J8KuWRx2cijUaUH4OreJU=
X-Gm-Gg: AYBFou2PqKAfy2Pmr9v3NreVCrRfF4HAiZe5Nm2ye/NJzbAz3lXMEbGRYiMa9q56IrR
	5F3tWy9157S62H+n42tGhfG0VG+S0Uex+fLwXGADOjy028wUWM8cKJZvic5KH3qeB7FykOcyz2E
	1NEko6itB8fwXvR1f6pAlDTqPQ5p0R4K4hIb5YQoB4i9Kgy7wiy6qCWCI3UqqZWgQnqOfYLZry9
	9sRls0oHs+OH0LUHSWLZ5J2f88xMCFqn/HM2Gv0uzp5QwOzk0rPOi4D5JSt84zGVZef71gByFVx
	m1MP72076fZuOfsvLHW7hbpeEIMiNulZwYiarl2hxycUR1+hGXErI6wuWs2Zwun8BRxLpELKU/D
	6M5hD8fx2BmFPHuW/y0Gf1jQ7YSU70NSBb4vqBxGMspHXjDiMcyuSIE3KOH4LCqeq6RoWfqAa+L
	uU4hsAB0/cfy3AeuyiSUrjOo2f0E4MIygHfhWHsck/9nKkIiHGdDdumBtKcenxA3FsKwRxXie3O
	pnzVkxXvzy1u5p7FG+7GLbG2Uc1910HUhuSxO0rYOi/CY+cKKPG0xLiflvUAe0C
X-Received: by 2002:a05:6000:18a9:b0:486:fe41:804d with SMTP id ffacd0b85a97d-4871e3b6a68mr14522308f8f.47.1789984405602;
        Mon, 21 Sep 2026 02:53:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:ddd5:3880:40aa:e4f9? ([2a01:e0a:106d:1080:ddd5:3880:40aa:e4f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872459a5d2sm19600201f8f.31.2026.09.21.02.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 02:53:25 -0700 (PDT)
Message-ID: <5ce1688b-e903-4503-85a7-cc0432aa6103@linaro.org>
Date: Mon, 21 Sep 2026 11:53:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 0/2] drm/msm/a6xx: use correct timestamp counter on
 A750 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260909-topic-sm8650-gmu-a750-timestamp-reg-v2-0-091d74958951@linaro.org>
 <7128505e-c8c9-4d00-96f9-2576ea2a0fda@oss.qualcomm.com>
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
In-Reply-To: <7128505e-c8c9-4d00-96f9-2576ea2a0fda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/26 23:20, Akhil P Oommen wrote:
> 
> 
> On 9/9/2026 6:37 PM, Neil Armstrong wrote:
>> The A750 uses a different counter register as used on the downstream
>> driver:
>>
>> static u64 gen7_9_0_read_alwayson(struct adreno_device *adreno_dev)
>> {
>> ...
>> 	/* Always use the GMU AO counter when doing a AHB read */
>> 	gmu_core_regread(device, GEN7_GMU_CX_AO_COUNTER_HI, &hi);
>> 	gmu_core_regread(device, GEN7_GMU_CX_AO_COUNTER_LO, &lo);
>> ...
>> }
>>
>> gen7_reg.h:#define GEN7_GMU_CX_AO_COUNTER_LO		0x1f880
>> gen7_reg.h:#define GEN7_GMU_CX_AO_COUNTER_HI		0x1f881
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> 
> This is correct. There was a register shuffling in the gmu_cx block in a750 and another shuffling later in gen8 family.
> 
> It is a good idea to review other GMU_CX* register offsets with KGSL. Also, please consider including a fixes tag.

OK thanks,
Neil

> 
> -Akhil.
> 
> 
>> ---
>> Changes in v2:
>> - Fix swapped H/L registers in XML
>> - Link to v1: https://patch.msgid.link/20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-0-284880d6e68b@linaro.org
>>
>> ---
>> Neil Armstrong (2):
>>        drm/msm/a6xx: Add CX AO Counter registers used for a750 GPUs
>>        drm/msm/a6xx: Use CX AO Counter register for timestamp on a750 GPUs
>>
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c             | 12 +++++++++---
>>   drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml |  2 ++
>>   2 files changed, 11 insertions(+), 3 deletions(-)
>> ---
>> base-commit: df2908090cda368b01ff43709f51890076c56157
>> change-id: 20260908-topic-sm8650-gmu-a750-timestamp-reg-2e7575e6279d
>>
>> Best regards,
>> --
>> Neil Armstrong <neil.armstrong@linaro.org>
> 

