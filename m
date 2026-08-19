Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2776A451988
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 11:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787138777; cv=none; b=XiccDISeu42pTJWbSvDO25BmKYZvYy/McHzAgDk35SGS/rAXHHDmr193yaVehYMf7BjKRnw0jFRx43UqY10AvKX5Px914Siziq0g9gW/kGCxQsDNYyWl79n6luNRa1f4jYg86vixfQy66N60pKek0ox7q1SPZsj4ocCl/HX717g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787138777; c=relaxed/simple;
	bh=2exsr9B1VhH/4+XIcP3p7XB3jhd+x/TzyxxBmfhy5cc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W0UkQY7YNh2JIpYWiSBj5ToMU6BQwoub95009Yz0YlD88Usq7Hr9pYTSqk8HKtmfTYlMMmX5UjO+55H/PU5tUrjL04sSzBOBWiwa7iFUgcNyEPp4PWhgVS/WCDb6MuEaPOJ5jL6xRuHjVP9jYu1kTbId32e0JVEi5tQN0Bkmsus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hbAQa5Ww; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hbAQa5Ww"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39c93a972b9so505131fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 04:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787138774; x=1787743574; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bx06gBGBnxZIUZCUgLDVahEccXm0GWObp7LT5QC3fPM=;
        b=hbAQa5WwHC0TcCRzILpW1Rrr8x7EwdJCeRm4XNwQ4PIhmKSOkIWKAEMdLbXR8J0dmj
         lN3p82IPiWmrJK7+Qu0/AVBYNtiADEIHOk4oJIFbpWRYeDzP2HXyXKjXRt+TWQZKY5is
         B9mt0/alb78Kklic2hHZJPCVsPShqGofJKO3FJi13XC5r/WLyzEsJOdlfNbYrN5w/bt9
         Iu+rIQk+Jy1Io7/wniy8XHTQ3b79LIYCVhj/xgzFwaiFqNVMnVZApR+jxrNn+5q75Ylp
         bzcB+TkxYfcI+G8Yvl1nOLqkCZ8sDAIHEHYSmOfDLuKW8/oIWYv7XpraoKmXM3IojeN9
         2XrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787138774; x=1787743574;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bx06gBGBnxZIUZCUgLDVahEccXm0GWObp7LT5QC3fPM=;
        b=OJDPBq87gvCZeoqS2q9tTdHfOa+i/VDD46o+YzqubmUuWOPUrYuSII2zGaTKzogOuo
         EtnUt15xuoOkSJXDxJO91DpcFYUZhsSsnTwLhY16rroyjqt44fE7X3Cd1ARct6ranpgo
         EkaHKCu5toSb2foDGBuAORzZ5eIylDl73cVtBJ7itUgHorqPm5SwbB3wi7r9tHJoIxth
         86mwcOtfWNk/i0v0O9xYZDxptk9TPOT5QWKo0/QPVyjBfZSv+ZmlVACVYz8dvELuTLqw
         6yOEpy1BHlMU2mTpDcENVry4VugStLD6TCkQAIbAfI/pz/aeOfzshwWOgtMKNi84iX6l
         UOHA==
X-Forwarded-Encrypted: i=1; AHgh+RqKztRVcTvlgTvSMMuzjxD/S4N57+Bpww/JUjiyZUkpuIA4r+az4QTOTYa3EybFOwKt/fks1Os9DPULgKBD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8ovEj1AQsymXCIXcd9RaTipqTW7LNnjp+MVRJ0SgFTHLUCy0+
	cw9TjbghlDE2ZBcAEutr8CHekVfcvlb8MokUnz8nFm7thI11MuaVubSeBSVnEm0w34g=
X-Gm-Gg: AR+sD104IYkr59hkk84owOn0jwZiJh5xj0KwzWkFiooSKlwoXQynl9Os6g/krALfAij
	zKwGgPjeM4uIjJf3Y1CZXVNl4KuVH7bOecKHU/wRCplJU+BLaa8gKfS9wNaeXzRRcpcrMSSzST4
	QKNd9dk3n06oW7wLa8fk1La3HLLiAVTFNTdbE9TI6yQ4IEgpVT2yV3/e3R+KjLwHJB9y2Foe4wc
	dVQg5qvltYwguSFizMdw4JpR3/QGxo2CBmlTzLvul7eyNN9J8ry60PyNvW1k7qFiIWiqsWUyNEu
	SNXxDw6BhjdrKzmRqu+uJriBOqqWi7WUlOpUg1t4nTTFN/kRNDIX7La0RO1CqZzQM2H3f6wQMnz
	1KKO0643VrU9gHrS7B0P+AQTCDeKWvSAr+JSJj+je6Htg7FaW67+r0nuZgOPsIWRS3HCeq3wQ1G
	LSDzVKE8tk8Clui0aQg0r9kYIa0Oatmdy5jZTfeBA09dCxQRLQVlbsg2AlZs1B2JS2oW6RI/tGE
	zjiQYNVykPI2lRE6HY0hUeOrvgQuXXKBvvx4H6NCg==
X-Received: by 2002:a2e:b8cf:0:b0:3a1:6357:1a46 with SMTP id 38308e7fff4ca-3a18944db2fmr4630841fa.0.1787138774009;
        Wed, 19 Aug 2026 04:26:14 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a18aadb151sm4149081fa.20.2026.08.19.04.26.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 04:26:13 -0700 (PDT)
Message-ID: <b3983732-cacf-4b39-b437-d0d6e13fbf8e@linaro.org>
Date: Wed, 19 Aug 2026 14:26:12 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] i2c: qcom-cci: Add 19.2 MHz timings for the v2 CCI
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, konradybcio@kernel.org,
 stephan.gerhold@linaro.org
References: <20260801-cci-clk-fix-v4-0-e1d80da54e01@oss.qualcomm.com>
 <20260801-cci-clk-fix-v4-3-e1d80da54e01@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260801-cci-clk-fix-v4-3-e1d80da54e01@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/1/26 23:10, Loic Poulain wrote:
> The v2 CCI (msm8996/sdm630/msm8953/...) is normally clocked at 37.5 MHz,
> but its CCI clock can also be configured and run at 19.2 MHz. Add the
> Standard and Fast timing sets calibrated for 19.2 MHz so that a v2
> controller left at that rate still has valid timings for those modes
> (Fast+ requires 37.5 MHz).
> 
> The values mirror the v1/v1.5 19.2 MHz Standard/Fast timings, which
> share the same CCI clock rate.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/i2c/busses/i2c-qcom-cci.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index 1092ce0371429ef64c7cc44cc23a42ba4c135af5..b6fa37a306758ec33ede6fcc39ce4412b86d9a84 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -762,6 +762,30 @@ static const struct cci_data cci_v2_data = {
>   		.max_write_len = 11,
>   		.max_read_len = 12,
>   	},
> +	.params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_STANDARD] = {
> +		.thigh = 78,
> +		.tlow = 114,
> +		.tsu_sto = 28,
> +		.tsu_sta = 28,
> +		.thd_dat = 10,
> +		.thd_sta = 77,
> +		.tbuf = 118,
> +		.scl_stretch_en = 0,
> +		.trdhld = 6,
> +		.tsp = 1
> +	},
> +	.params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_FAST] = {
> +		.thigh = 20,
> +		.tlow = 28,
> +		.tsu_sto = 21,
> +		.tsu_sta = 21,
> +		.thd_dat = 13,
> +		.thd_sta = 18,
> +		.tbuf = 32,
> +		.scl_stretch_en = 0,
> +		.trdhld = 6,
> +		.tsp = 3
> +	},
>   	.params[CCI_CLK_RATE_37_5MHZ][I2C_MODE_STANDARD] = {
>   		.thigh = 201,
>   		.tlow = 174,
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
