Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837723D3CFB
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785487034; cv=none; b=fI+0Qjm4T43ljr5DL2UGsJjgYCeyH9WCKB9t2EZIGJ8ejjINeWdz+zxkO5eImWxg6QRY9D7ksh3nT0U0JoZDW4yksjQn+Erif9N54wGsT+vZdz2FjrHuK7ZZUbYPynasDbfs1uu7dyuHO67N4ey2uXkpNcwasAAY7e+fbA1AKFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785487034; c=relaxed/simple;
	bh=vQ5rVmRcjhG3dspKydXeLI0zH+ohQHhWeIHCWc5UuMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m6Rx/ltkeRNRV/z0forNethurPdXbn71JFxacV/FfhSheTSRvh0ccBLVAMv2Va6yCMGgdW43zf5zv+YGOr461HqbKhYAbXD4BASO47Y3QMY2ctrhgthDfi0Ao4g4CNwJI76dtDmnz+8T9fJ3sbV6VJZB6XQfykmzYsOTIL8TdQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=shLEnrHw; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="shLEnrHw"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aebd7da975so87530e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 01:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785487030; x=1786091830; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3dyMR+of+eppojoqn/WYKEbq0hKR8UKNgWRGxQVm9Do=;
        b=shLEnrHwQxXqDMajIzdpFelHY/Ytg5FSVUB0HDi40gno93vIMcoftPl6CairWIaWgH
         IowD83qLHMJ2I1gsiJv+BUfuWUYPqC695Abmo9ouNVKBGd31hA/cGKwQofo4mUkzcg6W
         L6/IVs4qIHyKtSega32fHGKrF4FFrooq/x+UkAOpRWk0Kpf+yLrtWRgRp/IuNgJq1waW
         rK65Xwua8yBXyTrRJeV/jCWtfWlLZbkZ9ka0D7nOmYL8bn2ST7am7R0qDXu4zlmdibav
         RO9Hb1B0WQaKFMnKldajHbhwqIzkDmsFKeUiteD7vXwvNEEIvVpnhp1/rtjLQOdBKK6D
         OxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785487030; x=1786091830;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3dyMR+of+eppojoqn/WYKEbq0hKR8UKNgWRGxQVm9Do=;
        b=Kh9SP4zhOj8FByM+kvr5MZlQUd/om5CuvGXNKwf2XwpmxxUotrwZD7lNmsCq6kkvgZ
         3wBh2WI2EypoT5EcouyI6kd9cztB7l2Ec6uYyoW+lQTyT6idZCmamRQXLXOlyly0AW+O
         rP1UTYT4Snkm5gzXF5+NGvyHGg/emVdKdPJZrU5lI6/tFLG7ozgD+yxJqLZo27KCESom
         ULbnh1kg5k/Og5es/h/2CXqMj1eg1mhqmHZc9ESuLykmpZiPiOIHE/vnfha70NBLHLSX
         u/7xwcJ4LJcwXpwHV21sBCa+q1hElEAg1G8BtxLm7D4ZV9L3n83xeHB2mPqVFbt5lxWf
         N6cQ==
X-Forwarded-Encrypted: i=1; AHgh+RopmXal6hlHSeHMU9w8+RVCyszJBnkBlsaRU47spyma1kdcoeRBgMpF/gm/XvQnIEh1sqlrIXpaQ0PU0Znh@vger.kernel.org
X-Gm-Message-State: AOJu0YyQjNnLzCyEXPL1+uqpO213Y05Kot6VRbXWhDqd809w+r+hu4ct
	x6yhm1SAWbOTeQUwgqfeqDWUHHO2IdC4s5S4vxtWYK0wSE/YvzvMp2C5AJC3gdiMa38=
X-Gm-Gg: AR+sD11ZEKob35PeElFw2dVp9gRIRKCy3MzeD5LSNk/++4bZTV1dZDLiaujzhYuRhG8
	EA9BdIXmqa5YEZK7USTMFbXTaRjpvC3rp9PcmBo+jxWB536gn1FBG5jvzjkPB6Gps+bZc3YTVk4
	pse/f2NX2v3GD7VIH5GCs5HCtGf/dkG2R6HI9D+hUSx3eB3PLyApkrmvlPXCbc9FsVpup4/AF0S
	NDjYzqFnGHRqLGYTJHXEc8ftB6mCsw8XdJn26meV5lEvCeYMxvR/GqfDnG4kuQuxq/8bD14yALb
	9MJo6XwjAX6zdBObvdubeqBEnW4T00fL0mWxFOnJ7sV8y/KWy6ZNO1OE1n1HkavLvGKU3jQy8iQ
	kihYX8xdjZrLgl2JmR4LOrRbn5Vfon7icXEgicR8WBiTqfXXk9hT7ejwhePONMbIBvKOKC30rUS
	hylk0dgv8DgfSjhN7BnXrWTHSQ2k4sleR+7YqWOoEFhqPkyIh1A1NuYE0i6qsestbUUf/Khf+Qt
	WwP6wAEuD92nJ6QWXhmgEB3j5zM1msn8HHc+7fhqtiWMSkKvnDntg==
X-Received: by 2002:a05:6512:2395:b0:5b1:5c72:2f0d with SMTP id 2adb3069b0e04-5b2e1fe7701mr326410e87.4.1785487030431;
        Fri, 31 Jul 2026 01:37:10 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e245c435sm163128e87.82.2026.07.31.01.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 01:37:08 -0700 (PDT)
Message-ID: <744b80e3-9350-470e-ab2b-9e3efb89fe32@linaro.org>
Date: Fri, 31 Jul 2026 11:37:08 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: Assign CCI clock rates to
 37.5MHz
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260729112719.1151700-1-vladimir.zapolskiy@linaro.org>
 <CAFEp6-34g7MBY0-HUUZ+hStiASTCJJT-Cj+kSdWwoKuqwu_f6g@mail.gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <CAFEp6-34g7MBY0-HUUZ+hStiASTCJJT-Cj+kSdWwoKuqwu_f6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Loic.

On 7/31/26 10:46, Loic Poulain wrote:
> On Wed, Jul 29, 2026 at 10:13 PM Vladimir Zapolskiy
> <vladimir.zapolskiy@linaro.org> wrote:
>>
>> Setting CCI supply clock rate to higher value of 37.5MHz allows to
>> program the controller to configure its I2C bus speed to Fast-mode plus.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 
> This works for upstream dts/dtso as the SoC sets a default I2C rate to
> 1Mhz (fast+) for the CCI bus masters, so the 37.5 rate is the right
> rate for it. I'm however unsure we want 1Mhz as default and still

As a generic note the specifications of modern camera sensors do not
mention 100 KHz bus speed mode, today 400 KHz and 1000 KHz are the only
found speed modes in "SCCB interface timing" or similar section of
modern camera sensors, and 1000 KHz is the standard I2C bus speed mode
for the last 20 years.

What is more important, this change "fixes" out-of-spec and very likely
unsupported by I2C slaves SCL rates, which are 192/375 multiplies of
the wanted rates.

> think we should avoid relying on assigned-clock, but until a proper
> solution lands, this simple fix/patch is consistent:
> 
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Thank you for discussion and review!

>> ---
>>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index a64922c21267..a14e11d81488 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -5615,6 +5615,8 @@ cci0: cci@ac15000 {
>>                          clock-names = "camnoc_axi",
>>                                        "cpas_ahb",
>>                                        "cci";
>> +                       assigned-clocks = <&camcc CAM_CC_CCI_0_CLK>;
>> +                       assigned-clock-rates = <37500000>;
>>                          pinctrl-0 = <&cci0_0_default &cci0_1_default>;
>>                          pinctrl-1 = <&cci0_0_sleep &cci0_1_sleep>;
>>                          pinctrl-names = "default", "sleep";
>> @@ -5648,6 +5650,8 @@ cci1: cci@ac16000 {
>>                          clock-names = "camnoc_axi",
>>                                        "cpas_ahb",
>>                                        "cci";
>> +                       assigned-clocks = <&camcc CAM_CC_CCI_1_CLK>;
>> +                       assigned-clock-rates = <37500000>;
>>                          pinctrl-0 = <&cci1_0_default &cci1_1_default>;
>>                          pinctrl-1 = <&cci1_0_sleep &cci1_1_sleep>;
>>                          pinctrl-names = "default", "sleep";
>> @@ -5681,6 +5685,8 @@ cci2: cci@ac17000 {
>>                          clock-names = "camnoc_axi",
>>                                        "cpas_ahb",
>>                                        "cci";
>> +                       assigned-clocks = <&camcc CAM_CC_CCI_2_CLK>;
>> +                       assigned-clock-rates = <37500000>;
>>                          pinctrl-0 = <&cci2_0_default &cci2_1_default>;
>>                          pinctrl-1 = <&cci2_0_sleep &cci2_1_sleep>;
>>                          pinctrl-names = "default", "sleep";
>> --
>> 2.53.0
>>

-- 
Best wishes,
Vladimir
