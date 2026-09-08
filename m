Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32242542801
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 13:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874791; cv=none; b=jW3sPYgzVupcuyUDD5mE2naplKXZ/LVg7qEHxcJAbEf2c5asBNUR8/ai0Lm+XZPKVRADr0tC1nwP5C8CUxZoKnPH8NtW0N3TYJ+Fn1JwHNvEAthCU+sTcnNq+Hyn6Yh0rj7e4zPa0VQg1o9PShtzXVBZDj4sbvSUY+L4cuJtsV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874791; c=relaxed/simple;
	bh=SdRROXN6EL+lU/WDjj/QcpJ5zvCkzpWhnGb6ShY7qIM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=iEXLptFqcLC6xwgKAPG7aSpwFYDq65K7StgcigzkPE9Zf0pz+AXfrC4TZL041goVqC/6IMLadUA6cn6zafgxkayvnIrOe88HWwYVz8/6JoZRLQ0Pbj3x5CrH3zB61nrz6VvzFvnnoXn3SHxNSiCFbVehcekyobowRbHcJJO6ApE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lPVWZ11z; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lPVWZ11z"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49d0b98d6d0so26632535e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 06:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788874777; x=1789479577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4c1OWqnqeFMUI7UCBm5h3sA/LSJxl6dx6ljBFoOkX0o=;
        b=lPVWZ11zQZDJe5pn2+abBNYQ6mbTzfQv4eSwJ/Y8Z0UPfJG2l1pTY4gnQJbqecxWPH
         RBGpwrKuv4WA4wetU5LpwWKfNX7vphDUNS0j3aAKjj137Wp1I/jC5ieDV9bFJegyF9MN
         l/G/I8DwUX/4Io2VzgaqgofU45Z5ExDrEXcHPXy/uBjzvuXIZe4PR/K7plE6hijoxKMW
         K84UHvqdmWzQmKzOLVKbsoygC2XKnY2EVUnyQ+zidcp4aFl8J6VHq1FwJMJDsv2YLLBg
         JcSmGTuf/UVlvSvwDMxnUyxh6AACvcPWsQHz3irkToDZ4odHRmVRSmPs9tx676aSnJQ4
         YLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788874777; x=1789479577;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4c1OWqnqeFMUI7UCBm5h3sA/LSJxl6dx6ljBFoOkX0o=;
        b=RKia83UTvtnS81RQj5mdKxqB9kwKKBv9vWQicMjrNRq0IvG4JZ8I1WboPVFKNelX4O
         XOrm3sBCXrQzl0q4qVbXbRspAQSBLoYSLOqd7ymjII4ogxIlPuAbK2w2SiBuGf2bxCIw
         OyQTKehTraXFyUUJYyuSPgscwn5P3CE4depJgaOaDv6/oCfYifRxsjKPNzvv/fa/2Doa
         dkSZrH9xN/sd0kw9zU7p/xZu0ftR7QQpTET7TuNrbNVL0CjgutOzi2bMlcd0oiLam8Av
         Ym5WwiuvHZy75Ir+sGY2QWPOuKwDkMkly6XmiFx+K3Yc+BlC9B/Bvr3ykws0GeSy/zw9
         fM/Q==
X-Gm-Message-State: AFuF++lHUSgavoFoxbC1SiP2FliCCAPqbC97Co2g8uTYjYYyz5bB0CGB
	M6uLhSlVnzNdjqLYP1DAL+b7e/yNAFxWypA0wrZP2ZqfWy8RI3UNK9QWLHXjwcTFWJc=
X-Gm-Gg: AYBFou2tXNDm/BL7uGiIYSukkK20fFZxa3Eb/sme/UcPIz/HT5B8VfNNG8uSMi3pp40
	uj7nGORKW5NBDlxOR2FpRYhj4Vzofer77NBd4qQto4x8h3vRPYtkaRjksg0r7QLncrGwgHsYING
	WvLjsnsh0fRqJf5EP56MppHDOMw0JhemxgiCl7y4aM/dimJ1SpzVCO3XZ6Hd7JNobzJWnNqyt4y
	F15CbCF7tJiCTuj4cLSgkql1hnXyyFad29Gm2Y26q/ntaEH4B5OZ2fsoZbtz58evmihRQh1jDHb
	/GHBIOfvo4T2vR5Mi3sydodtAzF02A9wvL2UFii4umyU94kh5gJ6QiiZF5e5VIc+vXwq7ExhruY
	SGcvmZMWFlrKkcCNOg3g9yRZ5JwaTALq7INvMn3XaEXZBc6VElfls172yJzBm6d0OBOSMv6VGD8
	9S3Oa+hTllN9tEUaXDlRhea45iU12PkGgmp3GMD3o6ryv38i7QILzyYMYxqhOvOrRTAjh6amNaC
	wBV7XjrqFSeocgu02JcNCV7pEmx872d2Yt3ZSE8zuI9uArlmvMyBvY=
X-Received: by 2002:a05:600c:358a:b0:49c:dada:30b7 with SMTP id 5b1f17b1804b1-49cf82070famr289134495e9.2.1788874776647;
        Tue, 08 Sep 2026 06:39:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:967d:afba:15af:27a2? ([2a01:e0a:106d:1080:967d:afba:15af:27a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7fec25sm559730545e9.13.2026.09.08.06.39.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:39:36 -0700 (PDT)
Message-ID: <6cb0a7eb-469c-4cbc-8592-8365d1514c2c@linaro.org>
Date: Tue, 8 Sep 2026 15:39:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] drm/msm/a6xx: Add CX AO Counter registers used for
 a750 GPUs
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-0-284880d6e68b@linaro.org>
 <20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-1-284880d6e68b@linaro.org>
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
In-Reply-To: <20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-1-284880d6e68b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/8/26 15:24, Neil Armstrong wrote:
> The a750 uses the CX AO Counters instead of the GMU_ALWAYS_ON_COUNTER
> register on A6xx and other A7xx GPUs.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
> index 33404eb18fd0..3fe7bc3ea93d 100644
> --- a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
> +++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
> @@ -141,6 +141,8 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
>   	<reg32 offset="0x1f9f0" name="GMU_BOOT_KMD_LM_HANDSHAKE"/>
>   	<reg32 offset="0x1f957" name="GMU_LLM_GLM_SLEEP_CTRL"/>
>   	<reg32 offset="0x1f958" name="GMU_LLM_GLM_SLEEP_STATUS"/>
> +	<reg32 offset="0x1f880" name="GMU_CX_AO_COUNTER_H" variants="A7XX"/>
> +	<reg32 offset="0x1f881" name="GMU_CX_AO_COUNTER_L" variants="A7XX"/>

It's swapped.... please ignore this patchset I'll send a v2 with the proper offsets

>   	<reg32 offset="0x1f888" name="GMU_ALWAYS_ON_COUNTER_L" variants="A6XX-A7XX"/>
>   	<reg32 offset="0x1f840" name="GMU_ALWAYS_ON_COUNTER_L" variants="A8XX-"/>
>   	<reg32 offset="0x1f889" name="GMU_ALWAYS_ON_COUNTER_H" variants="A6XX-A7XX"/>
> 

Neil

