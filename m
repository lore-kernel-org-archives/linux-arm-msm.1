Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E85357D05
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785488119; cv=none; b=pPL3KxwxWM95kR7/2j5+H3mRlGbXwA/vIIkpye+QosHZYiL0050sFK7LyfXsfFgDfRn/221xnC9WVrN397dop6Zee4bexJt07Qj4I0u2iSghr7ozAku1Y5ODCWIdpzKRVw4KXAVAL3Vh+NMeqRKeb82I0mvsy32lwb9ptg2WUDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785488119; c=relaxed/simple;
	bh=yIpEzvjKVOlYYV/ZI/h1Drlk6YvOIqNwrObuWA/sS8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PJLtJ4Ex9X5OiA3oOMq95JKJNvyI4AvCyetRUBnTDGpr46GnfiiX3Qw7Mh7b9o/xtiAhc1QZi/ZRIhdkjj9fOCGj++pTzm/GlTOhsdnJMvlm6qINYVl2donX772F1VQOwLo3KuzXr0WSjjzGORFFBLm6ZOxKymWSU06/McD74no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qgG72Ui5; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qgG72Ui5"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-476a130c138so873151f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 01:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785488114; x=1786092914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fkKzcL3RL55Va2wcGsVulbs5kxhckxkItU6uV2P+1l4=;
        b=qgG72Ui5UTjTwxE2CpyF4iAszRHTIfR8E9CMDd2PIxVp7x0ZowUJZiwk/Gjhc3BKbJ
         jXoJNbnnTXvd0DvgVbCteyDfVvgfK2ITaUgWzXcCCXeBziaIqBFNYjTqNFQsu9X+D57A
         kYCIuOPHgRCJiPKRSZCC1HiKJ/zffTzfzKj8MsA0pys8CkQGVHJDfMk/xKcAa54Ap6cD
         n7T+MUzPODDLdfjNBUmt7Jo3PAG1ZtffqtW52NRu25dClFg5NEoXzOxRXvTXJA3xHzLv
         +dU2rkYlIT8svlXTExftOco7jpq29QpZTomkSRH/CR0P+oDLJ2VPxGtJr6u6Ud17/Vce
         oH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785488114; x=1786092914;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fkKzcL3RL55Va2wcGsVulbs5kxhckxkItU6uV2P+1l4=;
        b=WRXDfQ9kh/hQKg3GRL4uhkCdYQkPCvIaBscbJplLH3VXUKBz52xUOI8It1wF2nJoSg
         Pzsbu/IZrVK0KXZaRPJeM16pboKdoA86pGqw93+oa4f4shqT/rIMdijrU5rvCduv0I2c
         OisBisHLap3+nVmj/YQRTAj+kTtiiEBdIko+ga5omSi8N9MtvZ1tKWeJiIESFIwbe5R1
         hKhyAAOm9OwfjUp+pPODWAbxgCAc5EKDTcq3dEIgzkdwtZzKfR19Vt56HWVY0ztjsROq
         1IeCUS2h5x9G1cAM29USMuRYMArOcSb8sjmKN+nudg9ZcPDIrWsbiWBRUKt4HAdkB+Cq
         evWA==
X-Forwarded-Encrypted: i=1; AHgh+RrsBtond7kXE0H1mkwMgqvTiTLOxo4E2NCJKlBdtXTmYIKIQDHpmVqgWPjts3AULZ77OJ1puEtC6NNEpMxF@vger.kernel.org
X-Gm-Message-State: AOJu0Yws6aJquA4VdPj7kApzr+/Ck60hgscQToiHAtL1A9jrlMQCCkB9
	e0t+SSETx9NzY1El3whlhPjWsjPSIYmyff5s+SdJGFKmVZGv4oHSTj3g9AhUMrXPmSg=
X-Gm-Gg: AR+sD10V+H0d8P77XCCv9hbCdQ6jtND7/yAXhK5fWJzyhwjXexVuZxULcOyvxuc3PlU
	gYA0Y1UXQRXSuDBtQ3f8UUZfmKXgHH0N0AA1suzS42vVfUmSlWnZKqSj/LBJ2Lmc0g9sI3BIr4w
	DC+0jWpFw5PHOo2+BJZjcJzMirzzoJ3VlUuLdxCO443o7ymrazZNDWV9xvz3EkYG8+IbnViP/0x
	AfvXH6H6XsAW8oQfhNwDqmLCHoV6oo0dAvlGyN0ej2zRZ52Q4NBEN3C/ibEwS4EUhGkXB5mzs2J
	jnFihhsJP3vj8CxtlmCBndgpKEAYv8o8lXwhf2K/hsN4SP+C6O1uWjHnL//KuobigUlTBprBHww
	pHJAF6NgmgT/+4zJZ/uoCIKy3PLxTtwkbB3J+GyGF2LvX4PmWgH1cH0qLJy4lvB7kwyGf0tMDcp
	e4UvlTafJz0IFqkz0hPbKnWoIPjOsCVjacAobsoVGfLZhMtZobTDp1ZPqfyUn38yQuaeVjB2h6O
	hJnTrdwCEWP3VINEVReXgacHLAcgLNTvj1zEcIONg==
X-Received: by 2002:a05:6000:70e:b0:47f:91eb:342 with SMTP id ffacd0b85a97d-47fd2ac9f82mr3008798f8f.13.1785488113613;
        Fri, 31 Jul 2026 01:55:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6c49:d2f1:f94:1fb2? ([2a01:e0a:106d:1080:6c49:d2f1:f94:1fb2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458ab61sm2254023f8f.25.2026.07.31.01.55.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 01:55:13 -0700 (PDT)
Message-ID: <34d2df7e-1754-4c0c-a685-c1b511161702@linaro.org>
Date: Fri, 31 Jul 2026 10:55:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: Assign CCI clock rates to
 37.5MHz
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260729112719.1151700-1-vladimir.zapolskiy@linaro.org>
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
In-Reply-To: <20260729112719.1151700-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/29/26 13:27, Vladimir Zapolskiy wrote:
> Setting CCI supply clock rate to higher value of 37.5MHz allows to
> program the controller to configure its I2C bus speed to Fast-mode plus.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index a64922c21267..a14e11d81488 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -5615,6 +5615,8 @@ cci0: cci@ac15000 {
>   			clock-names = "camnoc_axi",
>   				      "cpas_ahb",
>   				      "cci";
> +			assigned-clocks = <&camcc CAM_CC_CCI_0_CLK>;
> +			assigned-clock-rates = <37500000>;
>   			pinctrl-0 = <&cci0_0_default &cci0_1_default>;
>   			pinctrl-1 = <&cci0_0_sleep &cci0_1_sleep>;
>   			pinctrl-names = "default", "sleep";
> @@ -5648,6 +5650,8 @@ cci1: cci@ac16000 {
>   			clock-names = "camnoc_axi",
>   				      "cpas_ahb",
>   				      "cci";
> +			assigned-clocks = <&camcc CAM_CC_CCI_1_CLK>;
> +			assigned-clock-rates = <37500000>;
>   			pinctrl-0 = <&cci1_0_default &cci1_1_default>;
>   			pinctrl-1 = <&cci1_0_sleep &cci1_1_sleep>;
>   			pinctrl-names = "default", "sleep";
> @@ -5681,6 +5685,8 @@ cci2: cci@ac17000 {
>   			clock-names = "camnoc_axi",
>   				      "cpas_ahb",
>   				      "cci";
> +			assigned-clocks = <&camcc CAM_CC_CCI_2_CLK>;
> +			assigned-clock-rates = <37500000>;
>   			pinctrl-0 = <&cci2_0_default &cci2_1_default>;
>   			pinctrl-1 = <&cci2_0_sleep &cci2_1_sleep>;
>   			pinctrl-names = "default", "sleep";

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
