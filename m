Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10E13A1683
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 08:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459497; cv=none; b=HpDrYtQ+c1nmHcXzrzofcy4bd/Xqcxg+W9/bVRMJWYzfUm2TqWVacs0HrJOJaDKyxmztr4Oc2R7fLu9hSY2qyl/AguOUdpQ5wmbONY6vJyL2VM4ePzvBs5ySb1A2ryYu6Pt3sKllbPukdGfJ86ghG1Z+87RRM7G9qDzYxgTN6i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459497; c=relaxed/simple;
	bh=0oTshtxPlnqGnJFpFlsNGtOZIMoAHkXNWQJYJcuMq1I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=F29BeJO31YCYB0tlONKPdrhtuizuQcATP9HWk+WbyTl8n7J/GL7EYmza219InjB28ilExI1k7HkCdwEBPh7SHnC5J+WO6X/6l6/fChNV5ll7IUh3aqh0AvN4fpi24kAFEz9b5wMNXPOwnlxl+TdChbzH37H+9S5K0cmkCf6d9bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IORpcRNg; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IORpcRNg"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49e6deb520eso39270115e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 01:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789459494; x=1790064294; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2kATBR0QOSU9fXXjvSA3WJqKNnMFONEMjfJxwyv31kI=;
        b=IORpcRNgxtnx8AN+BUFfnJwue9pcSmrL/tb4w7ozvyJU5fFPp7MwzK8s+gUHOv7P4V
         s0UhyJqLDu3Yq+1LObcxq3ZgTE62DDHVqN5K59pFmlfNPh1hEgSRM2snCiDyCdLOBr2o
         81G040B1ZIXtuRizAm4Tb7sl50982ghI9Q7L9nYbe38gPVUlUY2IHwxZvFeKV1/GeiIl
         43AkJlgzjMlg/4Xo/RhDCPEbiDMlE5PbeaxBeQHafu8mmx/7LwBLgSFnglHVgn9HRt5L
         nEndo7rMMz4J8jeIejlDQrZi+8vBHljzZcRNm3PWEDOYP5t8EctR/CIncZSkPHF9QcSF
         oWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459494; x=1790064294;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2kATBR0QOSU9fXXjvSA3WJqKNnMFONEMjfJxwyv31kI=;
        b=BfdEa5wkDfBhDA2RrmIn93G8GOXpXwuIYxe58Qk7QpDEVnPfSmrfd2JrwsRolwCQBz
         2vhI1ccQqVUCcaoX2bm9yFApiHYjD2jm+U+Y9FzbaoFt/8OEyaOeT+9Xt/hwArEjehgD
         erFqD55UBzgMhdAbjtWBgwBqNovLS5PAwOpDvuKBiyIaWq4EIrsfdWP+4IYRBvhDvpnI
         GSh3wqpvU/mbcwN0FdKQNEVKZHfH8n2EwNbdnpbTWV1+bHq/BPZuWtiX1jJpKAJIKqzZ
         5viNmxj04xoTfXkcSateAxLsu9zY2EL2IKLOUHJbrKeptzCuE4tSSctm3pvAAERS3+lV
         ATRw==
X-Gm-Message-State: AFuF++lPiOPoQZcaX4dvhu/QWeFH5n0w5YGHINvt/EEeS1o7d7U5saqT
	lTmM6Zwb/rEpWtL9sGATl2eePfJQwUqBZwuQnriY1bcPjkkiLU3ABwE2p0Ve4MtJh9Q=
X-Gm-Gg: AYBFou0aLxGCrPIbKsM5vHBQQNipNj5B/2EHiV0J74+IMWs8E7+F1w4GpCfBl0FphNw
	AY16cEo6ILwH6Q3uU4Oi6nVmOTfG7g+yESL/xmCue94M0KuV/zZIkOoHOlfBjHu3wIYWh+Oy2BR
	YJPISh0ovGmgtM3rgKppi1TUwpb14LDiDHjywDjWnC8fQTPcGhu4EmAFzHTYL9IOwGJuAOVUicg
	0wUBm11FctIPqa8oW68OH+KLij752PKDoMGBhUlU4OIDf2s8ijKjxj3JNhSRLcUTW3EiQWnRBzc
	IoZfVBBjDhUGroTM0Ofjg/YXWIwksS3fqCehNVaoXz6ViMGFvjPQ0WuuQ5HWUd5YruP7oOiTiea
	fkEJAWs2o/ji5nkPvpWUluYIrx9X8TgKxyIpjdPvf7pJlJ+e4eFdYdV/YX8gy5Dw+KzttNWjVKV
	QSoqYh4N3QxfqevsTYkp5KJPY3VIqKWxCKR9jTgHOSRmMWfl0TETr8uCdv0jduC0gyUdS5tE34W
	FcPkoNSGqRfCDkflABXeJMgQ++23c63CO6OnXfksv72AX/pc1E=
X-Received: by 2002:a05:6000:2c0b:b0:486:e77c:ba4 with SMTP id ffacd0b85a97d-48702b00eddmr6889231f8f.22.1789459493717;
        Tue, 15 Sep 2026 01:04:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:ff86:16e:fede:9407? ([2a01:e0a:106d:1080:ff86:16e:fede:9407])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee5csm32961569f8f.20.2026.09.15.01.04.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 01:04:53 -0700 (PDT)
Message-ID: <ad089a64-5708-4ad9-ae82-924cecb23f85@linaro.org>
Date: Tue, 15 Sep 2026 10:04:52 +0200
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
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260909-topic-sm8650-gmu-a750-timestamp-reg-v2-0-091d74958951@linaro.org>
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
In-Reply-To: <20260909-topic-sm8650-gmu-a750-timestamp-reg-v2-0-091d74958951@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rob, Akhil,

On 9/9/26 15:07, Neil Armstrong wrote:
> The A750 uses a different counter register as used on the downstream
> driver:
> 
> static u64 gen7_9_0_read_alwayson(struct adreno_device *adreno_dev)
> {
> ...
> 	/* Always use the GMU AO counter when doing a AHB read */
> 	gmu_core_regread(device, GEN7_GMU_CX_AO_COUNTER_HI, &hi);
> 	gmu_core_regread(device, GEN7_GMU_CX_AO_COUNTER_LO, &lo);
> ...
> }
> 
> gen7_reg.h:#define GEN7_GMU_CX_AO_COUNTER_LO		0x1f880
> gen7_reg.h:#define GEN7_GMU_CX_AO_COUNTER_HI		0x1f881
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v2:
> - Fix swapped H/L registers in XML
> - Link to v1: https://patch.msgid.link/20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-0-284880d6e68b@linaro.org

Gentle ping for review

Thanks,
Neil

> 
> ---
> Neil Armstrong (2):
>        drm/msm/a6xx: Add CX AO Counter registers used for a750 GPUs
>        drm/msm/a6xx: Use CX AO Counter register for timestamp on a750 GPUs
> 
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c             | 12 +++++++++---
>   drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml |  2 ++
>   2 files changed, 11 insertions(+), 3 deletions(-)
> ---
> base-commit: df2908090cda368b01ff43709f51890076c56157
> change-id: 20260908-topic-sm8650-gmu-a750-timestamp-reg-2e7575e6279d
> 
> Best regards,
> --
> Neil Armstrong <neil.armstrong@linaro.org>
> 

