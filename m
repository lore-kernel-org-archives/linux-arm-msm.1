Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B53C439321
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 13:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785418765; cv=none; b=LRdnyaaZrnhB7i9UkfhqT1XiJq+D5HujSETGddYQWoiXHQ03zZW/oPPNZbhMzgFoeGQPci5/1A6ZxlTPI+KvbXSj1WJg93AYVzUCrejlz+jL7jIGZesg7cLUEJwWVsUtWm/b1utADk2CoJv5ypsuDbiLadWsK/k+wkuMmDoH2Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785418765; c=relaxed/simple;
	bh=KoNnzooy73mkGE1MMnlljXlXlW5tan3oZKrmL+jEchc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g0MpyLrMYsboasQJSldZjVOkoUTyMNaTov6G+/e+GiW9bPInsK/3J92U+LYKXXaG8kkiibWohrBjlbl4kwwM3sLdO8X5nbXAacbO8GyEKXcJB3cF9PR3flH0v81rpski56csVPE++41W0i/3OUanJFM5u/tq2sNjzi9dM/cXfrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l/8Vs/Fu; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l/8Vs/Fu"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so19197815e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 06:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785418762; x=1786023562; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FZ0URd66xYQO2WbFq5K2awD76ulReYGN9/+hmSG3+vU=;
        b=l/8Vs/FuDSFQdjEaFHUXWmfz84xcKsnAj9bFO5zKilxbl8/4qG5W1vNpTkCKvJ3a62
         EkhAbNvzFe/muXmVT1+WR0gZ1Zre2PfUln7BLXJ81L+Hl/jUWc0sKUcVvPw0m2WejPWy
         j3LyFJNvyTZnyfjw+Zf/ZdO6V0uX8R+/FdpL0kQQrs6mOrYOjIsRjE7yJpnjaRjheI5Z
         s0gZaRkMYzUlkKihXMm56VxOu6ZhXvvCMBTfs50xfOBSCMrh0mrjbetHmRqHeEUoAOHr
         Iw99nomrgioMo+Ui+VkjlDJIjYRVq/WQ5glEHPo/qc64kKYIxvhIwKpIWIADGMvPT2d6
         LYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785418762; x=1786023562;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FZ0URd66xYQO2WbFq5K2awD76ulReYGN9/+hmSG3+vU=;
        b=s03KF3WkuC0LY4ZkUhSv2tONzgIq3ChRhWBQbfZLn+x617R2jPnyG5Usrk6AjEjWI+
         EG6w2hCMmNTFspO0iZ3k5PUfIPXsABrHaIak3t49FMZpLupHlDvOSr3Fsnoj6hkDyuWx
         M+AdzHBcpymTPgZ/wErgD7a8Tjj9xImD2U4thJSgzX2LgLmWtY60bTSyHB9ZxlMkVEFc
         JbYPyxtlPWiw0pWOo9wYXhrlgnblopqBeflQ1uw/SUkmjPsO1yuJ6Ow2IXY4KHkKnYBM
         HglbvwT/zqBlXsqB3Nmu3gxSuVCC0gZQONFreE3HLVSaGDfuppJtFoxsdHQgc+Q74qQK
         +gxg==
X-Gm-Message-State: AOJu0Yw3hylxtqj41YwU51Kl+K3s6N2G514vRVTm/Y+KiObs0wK2VPQz
	qJJ/E/gMta7SHg3zrhtwFEG+QuojGK2SDP/YCpRoNuc22MrOUK4nf/ZHt74v7qhZ6F4=
X-Gm-Gg: AR+sD100Curt7aBakTVNK6dW40AHc5XI+xxu8LU8v6mv90Nxzi3ZrYvSHBgZtHFlOba
	uMI/acHQ6/JMSh0alud5WOKH/xD2+E94GSDl1u8Zu7ORUhrP/Zv+7s6H0I2rg8UcMKOt28X7s5k
	VN0QgEEfM8fz01Pa0Gu65xXQzL4OGrL6WTbfwC7hLgKR4KgXZjoIVFt0pEXUjZt7F71zPyPld3j
	Os5OdL/ZbAtI6I1p0RQpDvbFmSV4VOB01ogjbXoby45/N3wu373YOTjZS0wPKCUmcx42SBkD5iR
	ndbcGDMm25a2Ysy2IQ64DQFbNI/l/P4WZIfYaR1n/wxcnjmcHlnSfh6VDjiulgY8jVFuZt9OioM
	WcWeiaOQLIlB+nhpd3dEbjVagRP7cZyOCR7UBpPxz/HqpdNjJkBP1Z8rtWfdJOy/1qE22QfDxIZ
	YlqPykUWVLB28ZZrYeaEjFsn3linoUHcBZ1OO+g4ol8tHVwzoGSwI18/xyin6M2/gArN+5kwvi0
	WJngQ7iMLNNjhaE56HvC+o8ezt7xvBEzLDKaI6WUixz
X-Received: by 2002:a05:600c:524d:b0:492:4e09:9fc1 with SMTP id 5b1f17b1804b1-49800e76529mr36974075e9.15.1785418762138;
        Thu, 30 Jul 2026 06:39:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:dc56:4d92:c5ac:40a6? ([2a01:e0a:106d:1080:dc56:4d92:c5ac:40a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc8935d83sm6067101f8f.30.2026.07.30.06.39.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 06:39:21 -0700 (PDT)
Message-ID: <f1ca716c-6303-4a35-9a96-276c8c4131f4@linaro.org>
Date: Thu, 30 Jul 2026 15:39:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 11/22] arm64: dts: qcom: sm8650: Fix the PCIe iommu-map
 entries
To: manivannan.sadhasivam@oss.qualcomm.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260730-iommu-map-fix-v1-0-83405d37ba41@oss.qualcomm.com>
 <20260730-iommu-map-fix-v1-11-83405d37ba41@oss.qualcomm.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20260730-iommu-map-fix-v1-11-83405d37ba41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/30/26 13:55, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> The IOMMU provider apps_smmu uses '#iommu-cells = <2>', but the PCIe
> iommu-map entries specify only one cell for the SID, omitting the SID
> mask. This went unnoticed until the OF core started warning with commit
> ccb2fd725d41 ("of: Respect #{iommu,msi}-cells in maps"):
> 
>    iommu-map has 1-cell entries targeting 2-cell #iommu-cells, treating as 1-cell output
> 
> So fix the entries to match the provider's '#iommu-cells' property.
> 
> Fixes: 10e024671295 ("arm64: dts: qcom: sm8650: add interconnect dependent device nodes")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 160ead25ecf7..eabceb7d6904 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -3626,8 +3626,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>   
>   			operating-points-v2 = <&pcie0_opp_table>;
>   
> -			iommu-map = <0     &apps_smmu 0x1400 0x1>,
> -				    <0x100 &apps_smmu 0x1401 0x1>;
> +			iommu-map = <0     &apps_smmu 0x1400 0x0 0x1>,
> +				    <0x100 &apps_smmu 0x1401 0x0 0x1>;
>   
>   			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH 0>,
>   					<0 0 0 2 &intc 0 0 GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH 0>,
> @@ -3819,8 +3819,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>   
>   			operating-points-v2 = <&pcie1_opp_table>;
>   
> -			iommu-map = <0     &apps_smmu 0x1480 0x1>,
> -				    <0x100 &apps_smmu 0x1481 0x1>;
> +			iommu-map = <0     &apps_smmu 0x1480 0x0 0x1>,
> +				    <0x100 &apps_smmu 0x1481 0x0 0x1>;
>   
>   			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH 0>,
>   					<0 0 0 2 &intc 0 0 GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH 0>,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
