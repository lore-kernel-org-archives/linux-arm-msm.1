Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7925437D8
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 12:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080680; cv=none; b=IVA6Y8urLRG1eb7NAktomE7D/jdz2VAfjWB2QM8T0xa+pe44XQmUvO6ThgoPeBxm420rhsQDFn/GweZabhUCgHgeWhJf7ZrzoulaEEwTZw+rf4W/DZKe3wdx5RO2qPGWOOZNQ+jR9Yhxk5fJhkPxPqu65nrMT5XggZSKlti6VVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080680; c=relaxed/simple;
	bh=H/P/6p4tn/F1HONtpik9rVj8NHKsX7jwfbvX1rYbyC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZITdheuBhWC5tRCvrti8zQS2hmLz8rugU9iC6qRuG1beWlRgpXOEqrJ0VuoXhL6wKjb3gn//Rj9hyOHLD4eYo8Ha6OTZP7+A50Pe64hAOKmAP1KXGh9GjXbc1MYrEtAf9/HsqSlR5L0Hsw2OLTs4OZIIrEcJ8XwBQL6vScT7CMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=FkfWRGaZ; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="FkfWRGaZ"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb7692a57so50174841cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 05:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790080676; x=1790685476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DMkuwapQF5xBh7yi5E/o9NS5zNE7MVMoqBZQFdDzhrg=;
        b=FkfWRGaZwREVIsrqzjVFGBGzPV1U1peitkJIphN7YFqzJ6K67G2ePRscEg1Sldl5Ap
         mZr741X53n5wqw2unVOMRQJqYlVP2vgxX1CgV3LDSH2QHN64dDiK9wTXTx1E1cZFu+iG
         4wIUG+I5m/uwL/t7YZixMmRU4tlLbZYRPWOKO8NrM0aT3wZT+/2JzoF530Xyn4d5GXpA
         GkSb9lmn5d2QL3o6aRABwaKepKcHuIm6Y4Vv/EG+Tr14bqDOiIY+EDphfJE70aeiDUzl
         t0hlGCLOI91vmsUOolLi67nxaV3NokjtYRjiXM+BWRxsqkwJu2YnrJC/MnfJ7CsEDZG1
         ciMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790080676; x=1790685476;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DMkuwapQF5xBh7yi5E/o9NS5zNE7MVMoqBZQFdDzhrg=;
        b=jKciGMiCQaKOXMXc/R6qM3Dn08EqIVOrgGHNr9ZWfIlrzkSLhr/yo2ySKPYJcehO9h
         HCeK2QcqbyRXm5CkeSEUikywwmEcrZAOuPhC2yKq6xRJqbzBzRZvkpGhI7ci3VzmRcu6
         JABZU9MCqHej56g4UKCFIXzNrdt6CQmHJffILEXn1LFMEqg2Nk3ooLsmhnIRm1jWr7z1
         TFHbFuA4vnqq+0OeOWqib3yDEKAj4ZQX2S2f5nNeJ8p5lI0V90HGNnApBYOATzud5JbP
         Q+7mTCKKr5ly/shxBFaftvYUqlvQWrfiNnqAyYr6L1WFU+EPYYNSEXPotUEroIi781aw
         6/bw==
X-Forwarded-Encrypted: i=1; AKwUvBwjfEMNTi/b5Di1P0S3SB54f6Tw5HPZDAoK8V4M6gnNEcnuMATYU0H/e+gMw5TUncFjinc2++oS0wwbMitd@vger.kernel.org
X-Gm-Message-State: AFuF++lo/XNSCyb1BhW3AlQCXDZ4E3J19NZGNEH+niVI7pAJeHpZnVXR
	jA/MXRFU6nwpa09sHV3+lFT7mYv7F9kGJ6Pxf9BpZGq0PVYCLnxYwKkAzBym3a3J0/c=
X-Gm-Gg: AYBFou1zQ+GFlWVxr1tjkTUFAt5TtCZGiv0Is6AaYHdHcbi9sbEhVl7ct/dv/T69bGf
	sc2A830LnzStz1Sacrv1U/HC/CJbESMHK0qJXMFsGqiS8qU1NKL/Xr/0VjNzegA1DHBOwYe82Xd
	weTqvS2B9crEgjPQMU8xYooDCHLpU0PlY9JmNrQbo2k8NtHH4CwcUOvT99XmwZLhDqFbFNBvsn6
	Dl4wpXTn/D85u8pEQjumkpM76Ahio8Let/7xvuBFuYgs37XFyFib0T6kNrr52TtqWe9QEo1cBCE
	bN1F2j3HM/tjOBVcibvuBFhXL5iyt4EX6CpgPKqX5r7I2G5z9/T53m0KZlXNT28s73wMejDyOCm
	eCSZpQjlJA0vb+/AWoJ/iOhMrCgjVHQTepUtmhIZi2NNkIIqaqzMTtLvBJt+8Y7QQvRTLJUdPxb
	cH2COdbdUIoFKo+ZYs6Qwy3osB/mevEtgCbEULus2KlFJz3gPkrYGZBkie3AGl+yseqA9QBmIv
X-Received: by 2002:a05:622a:1790:b0:531:190c:85d4 with SMTP id d75a77b69052e-532dd3ccc11mr36804681cf.1.1790080675565;
        Tue, 22 Sep 2026 05:37:55 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532e18d753fsm11687481cf.13.2026.09.22.05.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 05:37:55 -0700 (PDT)
Message-ID: <28ebbf27-24db-4b5f-87f0-831d13f93b8f@riscstar.com>
Date: Tue, 22 Sep 2026 07:37:53 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: toshiba: introduce a TC9564 SoC clock and reset
 driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
 kees@kernel.org, gustavoars@kernel.org, p.zabel@pengutronix.de,
 daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, mfd@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260918165234.687224-1-elder@riscstar.com>
 <20260918165234.687224-4-elder@riscstar.com> <arA1svdQzaj3VanR@monoceros>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <arA1svdQzaj3VanR@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/20/26 2:39 PM, Uwe Kleine-König wrote:
> Hello Alex,
> 
> On Fri, Sep 18, 2026 at 11:52:32AM -0500, Alex Elder wrote:
>> +#include <linux/bits.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/reset-controller.h>
> 
> Please rely on linux/platform_device.h to provide of_device_id and drop
> including <linux/mod_devicetable.h>. (If you want to go full iwyu,
> include <linux/device-id/of.h> instead.)

In general I would like to "go full iwyu" but have never heard
it expressed that way.  Can you recommend a tool available that
will help me do that?

It looks like "mod_devicetable.h" doesn't help much unless I
need struct_cpu_feature (which I do not), so I'll include "of.h".

>> +static const struct of_device_id tc9564_clk_ids[] = {
>> +	{ .compatible = "toshiba,tc9564-clock" },
>> +	{ },
>> +};
> 
> Drop the trailing comma after the list terminator please.

OK.  Only for the list terminator, right, because nothing
will ever follow it?  Non-empty final initializer is OK
to have a comma as far as you're concerned?

Thanks for your review.

					-Alex

> Best regards
> Uwe

