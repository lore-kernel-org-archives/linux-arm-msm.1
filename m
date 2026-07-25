Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BFC2DCF74
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jul 2026 06:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784961737; cv=none; b=V9gHZTHnauthAbA9FmJCg8fHlYCXZFBeIKB9wu2rmME3B04s25Uqp8NMy/Q+arhaIWRnDsgJ9xmyJ8YDeiZ5sKWukdopFf9xgRfrpimT4HlpVuRqhu+AIrmKCZcb6/gfOz6qWFLf9Yhq5qc7ICNAbE5DmnUG+B7xtdouOpgzR6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784961737; c=relaxed/simple;
	bh=zoKbMi978nDgj2HDslbMe1w2uEVfSZWEuUvbMtbMgfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eJJmf9T1s2snSsxZXe8Tz1hSkrVJc4Dx7e1+ekmtWax5S4MO3popAQK8OlVxZx+CJ3+XwCP4NZ42dUi9P1zxKWo2cga8hJmH2J5GpY8Si1homuJri+ELpwGrGzDNJvHod0Q9j9FwNlhbXmwkZPb4SrL6/mLnmrGNsvLZ1FIZSjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wer8gqfe; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wer8gqfe"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aebe49b227so267528e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 23:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784961734; x=1785566534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3rcLlOj89gK3OxZv2MR+AlxF2Au5na5W1MCm2dKXaFM=;
        b=wer8gqfeqtJpHsTiQCQd8MJFHAlF+kQRpAa7vylCBDbyBFFwlSmIo2m0kWyrJ4OIcG
         envWaXZ9cR56DLUwmVRqcuc6Yen7Q5U4hxjeSAxRMcgyNmzeIHGYFuMQIECGDZfluCSZ
         tHOkmgOVA6pgJ416X1imJOCQIsR28O8O3P32v4fMZeZJckDjWfmRXjN55QejjLtvIS+D
         au/qGVZzd+VJgMf9++PdOh4i2sdat+EEzpI37POhrPkiMl3yv9MJ0NblpQEmL5DKSuyB
         afZd760FjPy4LubYRyKLyxVQ/lTDoyhfcA77Rm3VyIrLuoxw2AdAIlpA7JUT/nDzWr8l
         27yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784961734; x=1785566534;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3rcLlOj89gK3OxZv2MR+AlxF2Au5na5W1MCm2dKXaFM=;
        b=b0wpSGvEnRocznvkLc6A4fKI7y2Prib3OMl5HDoYqIDX34YLxvOQFpGn7c4U8wwvcZ
         yWvd4pHfXeh8xIrkQGBNjNhZforvwyUjU/QCeQ/FxhtbXbOAOf2WHKCx/QdXcfzW7IaZ
         FMVk0h707kFzj5YQMhOZrL55lDYjQtKoHtGxSWitjA3yDGOCbyhNQXABaFKiyk4tIaP5
         cbdh0KThfQtg92+YEpBMz6+zYCRONKGxXQ3ovou0+DC924qRKuYMp/J8srmFtfkyUyjr
         dFENvM5WKZ3m0lUyAZhHCBuPKSJnk+i0d0qY+2KWp/b/OU4Vr84KGjar06EOu23YG82B
         ea3Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp1amqaC9yUJOqPqcGkqnvBd+SbB8VMcpl/dBCNom9rlvHus+B6iaKa2gj8CZTrNnFPxxi7n2AO9TkZuoJI@vger.kernel.org
X-Gm-Message-State: AOJu0YyhnOw/VbuwIswB5DaZ0JSy3AL5Jr/zkZLT2wPc1DY0CTmcHHUs
	n+/dv/wOYsrYhtGzb/pVCznlfgogMN8c+ExZkpqDOmXczzrBsBHZSGkNL59G8Ji82v8=
X-Gm-Gg: AR+sD10Md8CnHNm0r5K8k4K6RbdFPzS8eJCEjYUDH+HUT2QENbDD2k9xoLfkSCbd9Y8
	kOhQO6dYTd8+nUKyh9HHLKepivqwC+8cF4mywM5KwDL92qVhxcioSTPWywbQZY1kqHhU7r+WhUc
	SCCRbGP9FwwmO0E2++tXDjL+TcnxTddWM4gOuNHFADtfWiNnz/RCrVuxcK7hSIP2drdZJQ4sW2L
	s16/xZAlBUNwASORIeFMbozfdl2r1nkeCMJ3O1J8QP89hAXpiho3ZQk6dsnmWPRAeHqPveuqF6J
	xSA6TR+Vs2qpQAeFteW0qq+SM+1diD20i7Y4YHoH89zma3jLehmhD5xU8qXTOs2a0nhYWJrI8I4
	zfOMBmo7gZd7UjUj/AJbQMnN4eYFp6uWNLMj6RvqSdyI4MNBv4hSsu0jnvEq3PnWlmUoESyfwgb
	NIYJCWrlxAeW5/J9W41MCsot6r5SvUYfUEZtC4HmyhdTjYyrYVuBdnu53S
X-Received: by 2002:a05:6512:2520:b0:5b0:6aea:cdb5 with SMTP id 2adb3069b0e04-5b2c1af7abemr136512e87.1.1784961734099;
        Fri, 24 Jul 2026 23:42:14 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be1d863bsm291890e87.53.2026.07.24.23.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 23:42:12 -0700 (PDT)
Message-ID: <b0bfb2a9-6918-49b7-a28e-c0c822c6f957@linaro.org>
Date: Sat, 25 Jul 2026 09:42:11 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] i2c: qcom-cci: Add missing cci_clk_rate for msm8953
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260721-cci-clk-fix-v1-0-5eae78700da8@oss.qualcomm.com>
 <20260721-cci-clk-fix-v1-2-5eae78700da8@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260721-cci-clk-fix-v1-2-5eae78700da8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/21/26 17:58, Loic Poulain wrote:
> The msm8953 CCI data was added after cci_clk_rate was removed from the
> driver, so it never got a clock rate entry. The DT assigns 19.2 MHz to
> GCC_CAMSS_CCI_CLK and the hw_params values match those of v1/v1.5 which
> were also calibrated for 19.2 MHz.
> 
> Fixes: d202341d9b0c ("i2c: qcom-cci: Add msm8953 compatible")

By the way this commit also does not fix anything, moreover its backport
won't solve any bugs, but may break the build, if 1/3 is not applied.

I'd ask to consider to remove the Fixes tag here.

> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/i2c/busses/i2c-qcom-cci.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index 19e4719f13b29b2cf60e113565b1b63f19d0e669..5f74edde8558382e63e2c3d0fbe19489f325e8ce 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -783,6 +783,7 @@ static const struct cci_data cci_msm8953_data = {
>   		.max_write_len = 11,
>   		.max_read_len = 12,
>   	},
> +	.cci_clk_rate = 19200000,
>   	.params[I2C_MODE_STANDARD] = {
>   		.thigh = 78,
>   		.tlow = 114,
> 

-- 
Best wishes,
Vladimir
