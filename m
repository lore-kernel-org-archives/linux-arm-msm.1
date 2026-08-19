Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B5246D540
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 11:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787137860; cv=none; b=LVMLm3X50ijoubapee8P+0bdKB7w4awAvir1/jT4mF+V9f2DjYdxJG5ZiVZe8/Cs/9ItOtDFNl4BfAfr8mlUG+WO0/K/WGfPqn/zG9FouL4gPTVlMG7Cl2RKUPaMZ6xA/C6Mt7sXSRj+1LBx65FDsZBKI78UwglKEH3GpqzBI7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787137860; c=relaxed/simple;
	bh=T8G0ZcWK/K84AczPHDRHSzzAJA9uLSt710Kf5KRx7gc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bp5l2CnOjexnGbXSGOsi5GaD1rdHFZFODbqcqkoyKpcx6j4yScCp5ZkfaEjLXlJ4gVcPj3YqcN/DOpuv7enDTvRLfvYassg9OtqZTc2NKL5sjXcXU+LS7VqYgnevV/KsTYP4a/33PodvQUl8V5pqq/kkCcvX9bnaibdZ+OZKjFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jrda/MTn; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jrda/MTn"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b2960ea2fbso152332e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 04:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787137854; x=1787742654; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MHM+2qgBqc21q4hkz2G6UjCV2/ZpXTwtrV94xxu9kWA=;
        b=Jrda/MTnlQALPEJSlfv8bjyXT0hAyNcBr2EIVHbFG1G907aMrSl+BCIvo4nhAu/6US
         SaULGUGaFI0DwNk71wkl96dB3XOIylvx4ORl2D1G1qquBebUPkrKRIjfUqhZgtma+vl+
         YH/IC5yXorE6YbsYxe7fr1U3PVgtdtJZhByxaxlsjt+PQkmuKSs5ZKHZIDn0xzySTIaf
         wQ0n92dViXPpfM4afSOfxwkvlYtI3yYKPUezpeQgnnd9u5n/XBxTiSY0GY1GjgE8U/u4
         RL2IN2aGznaypEtAx05iR0lDlKm2KZgHDFns27GgD1+chxuS4YvUVZ77w0gxvm1/xvDQ
         VQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787137854; x=1787742654;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MHM+2qgBqc21q4hkz2G6UjCV2/ZpXTwtrV94xxu9kWA=;
        b=oj/pO1QjRWWxidzkyxoDZAHv/A0k2moMlSfTyuAZjbHjrBbwnkAMAzBoE9giZDTkwz
         KVnIVSbpX0f/crwjaQSZnEJZPC3vQeG/Mcplh9Kl/Z5dByGZ8DrEFleNzMdsPudxmjGD
         beKaHBCaiGOXY0Xb1SnG1FOfM4TjeHTSvUB8ZAV1UKJlBQh0YpWHKqs3b7MZ7mpp7hFp
         H3csbFYIFyVQdtgnx2dHxmmKM5I8eM3Cec+LDxEo3gVRt69Yh2EzQxzztnTqFiLkOQNH
         /Xx5eYSqOD4CZnZYNiOsJAXsxLJxnWwUlAIBMwNk6b9/L+Ex3Lpm7Q0xM1Y2FqPZEkPc
         zeoA==
X-Forwarded-Encrypted: i=1; AHgh+RoxNFriwH7NcoSpeGUk7Jqae4SiC0OuttJK2hTU75DBhdTjEHHDOi+Gj5OLX+aDHSsjTKCJnxwyjlbi1XN7@vger.kernel.org
X-Gm-Message-State: AOJu0YxDUQg/AwiQFe3AmRLU++6lrDajNPyrkV7d4cp6j5NQs/TqHLeB
	uFLcN6zJhc5ARhteZ0KeREqcJmVFT4kf6x2wK6rM7Tjl0IPzmHrkC46LezvfZfcCZzc=
X-Gm-Gg: AR+sD11ADz7kUCjRhHgrGDryS8IbAkrmqnBT9oCQ+/NCF+j8v/KjC9bYNXku0T3CGxa
	GySvsJU+8JM7X51gz/7qqFihr8Wd3X0b6RBKB8jZnryJFoS3KzfJL96P4zBi1mF7p82QDPo19y/
	RDehR0+0d54RJSWPZHjobaIu3NmHZBjfFQtdxo+bWQM9jAy9aRqgLNgb3W70+SxJT2kB0UhygSh
	U0653DJD1yrq3pR2s2bHWSeTtDHxXL/md315MHlUzgKlo6EeOshvsTQNv5a+d483ESuEuEGMsum
	cVYG4nsystc2y2bZpI2kxzPgXKC0OZFsg/KsLKtsCjap6E/YZonCqkay3b5oXKC8k0XUN3eTt27
	ZmCSmmjpjiHCOgKQSTPHDxez0SRsE1i8msnFN9XjpXfHG8ya8JnAoUk3mwdS/EzjEsEoXmd/xvb
	f3IxPMGbRWkDgWFtTPml0xbEK0Jx6UYmjCi1baSStkucoRRQF6XrJjML/SrcHWRWNkzOEvvI5WF
	Mv2bOL1i8zr4nENdhQSo7HA0DTEPJWHKqJOvnL9HQ==
X-Received: by 2002:a05:6512:68f:b0:5b4:59a3:c67 with SMTP id 2adb3069b0e04-5b478d15f12mr694543e87.3.1787137854067;
        Wed, 19 Aug 2026 04:10:54 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4788fa30bsm433544e87.82.2026.08.19.04.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 04:10:53 -0700 (PDT)
Message-ID: <62bf3468-a485-4255-80e5-76997398431f@linaro.org>
Date: Wed, 19 Aug 2026 14:10:52 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] i2c: qcom-cci: Switch msm8953 to the CCI v2
 timing/rate config
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, konradybcio@kernel.org,
 stephan.gerhold@linaro.org
References: <20260801-cci-clk-fix-v4-0-e1d80da54e01@oss.qualcomm.com>
 <20260801-cci-clk-fix-v4-1-e1d80da54e01@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260801-cci-clk-fix-v4-1-e1d80da54e01@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/1/26 23:10, Loic Poulain wrote:
> The msm8953 CCI timing table is internally inconsistent. Its Standard
> and Fast timings match v1/v1.5, which are calibrated for a 19.2 MHz CCI
> clock, but its Fast+ timings are essentially the v2 values, which are
> calibrated for 37.5 MHz. Since all masters share a single CCI clock,
> no single rate can satisfy all three modes with the current table, and
> the DT assigns 19.2 MHz, so Fast+ timings are wrong.
> 
> The msm8953 CCI is the same hardware version as msm8996/sdm630, which
> already use the cci_v2_data config (37.5 MHz). 37.5 MHz is supported by
> the msm8953 CCI RCG, so reuse cci_v2_data for msm8953 as well and drop
> the redundant, inconsistent standalone table. This makes all three I2C
> modes self-consistent under a single clock rate.
> 
> Note this requires the CCI clock to run at 37.5 MHz, the driver selects
> and enforces the proper rate in following patches.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
