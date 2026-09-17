Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7F73AE713
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647602; cv=none; b=rkPPek5XU6zcPaH7SZElmHWLbm+YGGueOtISAsfCxTZEhelVEsGgHWIqv6QPl69q+joIGsEfnyWBHpRO1z0MTMMkGLPE+aWjVzgjA7EI0C1jvVsNawEKHPVsE3pNHhD1RF5qrZnJK4vYGevJuSAfYFIYR5V0JIEpGsOcv1zAbRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647602; c=relaxed/simple;
	bh=BUpmdv3yOABSaaCiExNiD0lkwdJRXVvydhQLoJCt0a4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Jo11UJo+CGT1Z3UzHPa8WlnoQmice/LKmrlDlItHhtlID1YfkwPfBBI6zIIF8BDq7r0x7vXhlbP2i2vovyGhs+s7A+Lh9hGnzkWIV71Rn7qpp04YeAL+xAF786kVBLeJWNGZmjZw9ICe2LbsNPGaG4H874MgqrSq4F2zxX/rzcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dWHpNKBh; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dWHpNKBh"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so4039785e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 05:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789647584; x=1790252384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YWz1IO4gEG1KiaogT+jmIsPzwVgEJdUuS/B+omVUn1A=;
        b=dWHpNKBhGHckTq266MbrnLtOaPJ5IbMlgozG3vwygezPqbPquI+7A1glG3evpIusPn
         RVff95mat7aTMKZwkLk/Q6t0TxwX3fFDIzl3ub+slNQmtJYZebKWp/K7LFGO7hE4k0EC
         77LGvx3mNkG2B/TJMinBEz2RHQkt9Dz14V2wehV5dbSa2wunQLX9MbBIjgoeYPq1ST5J
         jK+X+p/e/J/cJNIsRCZMWLFtQFlQEZvnGsf6iY1BFwRCbqbdCSMNiwSeSiVSZqhSowah
         gAbOZZT9PmJEKjzZvGaEdf5XX1JELrI5sZflX9nngWmDqXpHxyVx50F0eo4kOPZ16Quj
         /09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647584; x=1790252384;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YWz1IO4gEG1KiaogT+jmIsPzwVgEJdUuS/B+omVUn1A=;
        b=gKZeVLxugYqCdPrGkqsdcqAAGizTF5ur77fTNVRoE1YVQFPCTpGkMJWCriD3zXVi7x
         /nQqEHEN8NW3cIy3+6r00peVmclEM+2NS+ch+ZBDr1OwrIjI9aOWzCAoYdkQaYqSP6+X
         6UfnIj/i+kTp4o9QK4gQbz2KctMkH/MBw78E37S/ncWnxO1RccSM4cHS/RED7NXNDiD4
         NZqGcDNzlkArU2dWQwVzK0s8Y5hGk3dYSsxsIgozpdDaYcHPJMGWYJ0umlUzOTkTjnNW
         gojGbkqA8QIc1+hbTdrQ8tll3J4HldBZKunJBNgTLLw2xX0nOKTOa8yYRLMs2TED7Nf9
         MetQ==
X-Gm-Message-State: AFuF++kKKoBj0NVoHn1sm/BSJ6elPmd3twnjofQfD6w5KpRfpGkSqvyC
	kyTYuynjoICV8O5rgn9cdIBiVyrh+bpIK1sxmspnOgGcpUvet6aS4c7KUsbRMdrJllak1FjDDFY
	hkLjFPN8=
X-Gm-Gg: AYBFou1N4ZwXocXoHiBXbxKCjx/FMShEvVAd+E+yjHtU+NuWOYLr3MX4adFB50zYskI
	ev6lQSsUiwwgtEcyx4PN5i04Ijy//TGu55uKy4JM5AtL+Mih2KRo9r1ja216buMa6/5RCQr8qjW
	H9Ky2sKtGJMltEv3Kz0lY/2hGgCytJihnCaInfQpSUkscLR+RpZ0PN6VxIPiy7CJqXmldejxjWU
	hqoeCTK+ht26yqr1kFIenuJINdHvtIhfPjJ+X9M883c1QMhhTfic6QLqg7FGcgnVpI1IyCjX4FB
	3MucGTTOAiCwYAJLQg8DFPeO4u2/b0PVq9zDe0L/ukarqVyCh3m2C3mYvzZnyIdSI1Ql+hZdUrv
	bwfnBpkfovR8IdzS23OtSNX3hENXRymHJW6LfBEEayKgBq/7fXNBuiSFCBQZMMuzLrUZewbi45j
	Dw1SWOqLrKI3mHc0qfJ9d72H5Go6E+fvbzX34WFbV5LQteABwXNk0WNlF/HriE5fZe6w9cT0zQ0
	HvhKhiM8FZDv7B5CVoDhAm+2fzRboRtp4jCTEMO3vVBGRfw/nnMiA==
X-Received: by 2002:a05:600c:4f14:b0:49c:f13e:e4d with SMTP id 5b1f17b1804b1-49fbd51fc62mr44068345e9.10.1789647583958;
        Thu, 17 Sep 2026 05:19:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:b5f0:971e:8fd2:f1c9? ([2a01:e0a:106d:1080:b5f0:971e:8fd2:f1c9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd24a6basm75812395e9.12.2026.09.17.05.19.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 05:19:43 -0700 (PDT)
Message-ID: <95577e52-918d-4346-a5c2-f3e73e730959@linaro.org>
Date: Thu, 17 Sep 2026 14:19:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] soc: qcom: geni-se: ignore invalid PROG_RAM_DEPTH when
 checking for firmware size
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260917-topic-sm8x50-i2c-hub-fw-ram-v1-1-f49286d8c8db@linaro.org>
 <0c4ee857-d8b7-4bd1-a74b-6618b45d4be2@oss.qualcomm.com>
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
In-Reply-To: <0c4ee857-d8b7-4bd1-a74b-6618b45d4be2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/26 11:21, Konrad Dybcio wrote:
> On 9/17/26 11:07 AM, Neil Armstrong wrote:
>> The I2C Hub serial elements lacks DMA, so the SE_HW_PARAM_2 register which
>> is in the DMA register space doesn't exist for those instances.
>>
>> Simply ignore the ram depth if it return 0.
>>
>> Fixes: 522bfb4f33c0 ("soc: qcom: geni-se: Use HW PROG_RAM_DEPTH to validate firmware size")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/soc/qcom/qcom-geni-se.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
>> index 873bfbd6b2b7..e75349f2c15d 100644
>> --- a/drivers/soc/qcom/qcom-geni-se.c
>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>> @@ -1308,7 +1308,7 @@ static struct se_fw_hdr *geni_find_protocol_fw(struct geni_se *se, const struct
>>   
>>   		prog_ram_depth = FIELD_GET(PROG_RAM_DEPTH_MSK,
>>   					   readl_relaxed(se->base + SE_HW_PARAM_2));
>> -		if (fw_size >= prog_ram_depth) {
>> +		if (prog_ram_depth && fw_size >= prog_ram_depth) {
>>   			dev_err(dev, "Firmware size (%u) exceeds RAM size (%u)\n",
>>   				fw_size, prog_ram_depth);
> 
> The RAM size on 8650's i2c master hub SEs is 1020 registers (correct,
> not 1024) - Viken, would that be true for all implementations?

Seems to be right for 8650, if all HUB Ses have 1020 I'll prepare
a v2 with the prog_ram_depth in the se_desc

Thanks,
Neil

> 
> Konrad

