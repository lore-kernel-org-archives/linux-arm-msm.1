Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951CF2D0C72
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jul 2026 05:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784958096; cv=none; b=PTU1+KEZQLRahqg1vGtIs0j2BkQHGXAl4xN6QXhosiEq5XdEgDBJ13IPg7ZhIHdXTES41yzT9lbgJZS/EP9NQh5p/NuQzO71ro9/6eSq6SKu2SkfEH96ISC+aMQCTuwtm98+4fqWQyUgM1hJD2U1+5NM5s1/gFxso+FMJp4XyCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784958096; c=relaxed/simple;
	bh=/RjlJI1tcU+fQgj2sW2Iofa6fH5Ee2zC3WdA1A2qVFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qCLHv+HAw4cGHosO8oLBopTBYiuW8kNltvpM0ijx9e+x1lM7P3KNZwF4OWab5P0jMWaw8LZC76CIb85G9xTvOvUhjNDEEX4xfiHD6hBYHpIiSncVVMgThyqhatB3tRAPYcRFkwD1JkBSi/Nu3gEkfoH2oxc0tcSdZetxFAboGjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FAUufZML; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FAUufZML"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aebf96bc89so173127e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 22:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784958092; x=1785562892; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=090uL/0+UckPvFSEk0Snf0xihVIwbpOzrvl2u/5Apcc=;
        b=FAUufZMLTDLvln9pl0TWcIQDgO5RxxfYh2ot6Su3DyAx3u8o4aYSleqjSe0RIAXHtv
         otJi8Y30uMMn3i+VXeKknf/4+dRIcN+kLCp9Ez6zb7qWwnduFfR7CyD1rruZq3qfuzrD
         aAdlx3bMnac0UcfEJqZoRajub9iidHzOoBPNOYNDPw5zGK9Fn/6VDbzy73EbYoIAYYXx
         ORRc1/1gKzAltIlC8xTdCs2aMEJlh6pvzQL5yAt/se4+VE88YuhEW8V8SkPQbIHrAQtc
         FV4pwaFLgwFh2PRke0/8o8iGga8w00O5B9rOGDqWMlMg5fbGNSV+KUSeoZKABy/bXyYs
         7TRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784958092; x=1785562892;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=090uL/0+UckPvFSEk0Snf0xihVIwbpOzrvl2u/5Apcc=;
        b=IYlSEKN3vmWWsRSf3YLtLEL8il81KHhLG2psiRt01addVnu2KYyBvnJNmKkVDZWFOq
         k24MKSJUGnh/RMuTSrS3QaCPg/hUWP/6bb9RnmMYUcFyLNwdb7UUEBemgfbTpaLVYt/n
         F0a+H8+bZut630ZIfY0W5oL+aHVxk5iXhMjrStGrjtkKWpz2Cih9z+zPNBQfsjwFJNay
         4LY4NzWSj3b6LbUQCqkLqLbtrFHOM45AZN9l2cQs/y5fkY2f9353aDq/+IAi4DkOZz4F
         cPw/EUieqSA5b/qxdVNOAaOWnRm717WcQJ/PQS7EkFB2I9ibX9iHSDgz7j+ptXoC+mSt
         vsxw==
X-Forwarded-Encrypted: i=1; AHgh+RrMLN8KlB6cSSsGWcHyXIh0Mckr/6QGx6UJrVSnqWPBopwufDs4WlvKwUU0guVGwTcu4TiJx1lZw7G/sHnQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl+AqRprtOj7WI4zr0qnrwxhqS83fJoBcqfL6e8GGRB6B3aw+5
	SsbfFSvUtiJHP/jSzwzcSSYnaUu8k53+FotA6zlj7hguDIFlEdhb8yDN5QRjKtLuUUA=
X-Gm-Gg: AR+sD12MQFQPWWznwqe+V8ObNCaxlEkwz/XIUfDddxQ22JWzp8f+XqvGcMUuG0eK7us
	d87T5C0MTZaKIK9ZTTMyy1/RnXnTc93ViXJikOoDkGWU7CgKSjNGqJ3PogTQP1MQz/2QUV2ZWk5
	+gmjnUHSNTVsGlGtk4BxY45txr5TwrRXcIeC5Cy7ZHbmsL5SyRn3H/n96dpr8UA/TiciQgV38bE
	4ajD/f/0wAjBXKmqofg1OBPJOEQGN3f3YPdWpEhEEST4EnctmZ3KGNeiPOvrX/yhS7WOxT/hN8g
	Qs5ZyWCKO6QQshaLM0ahqgHUIrlz4vzfsrIRxCWpJ3LBVVuykaYpT77R/W2YU0mbAoI4zu/ruzJ
	j2RhxcQ8HCNyJvCewP8pKhn2doxu05j+oZqaWeUs0Kez2t5MAgv2g2qftyZOa/9M7y6ovVLEAoV
	Pg+HXtffAruPrstvri0tFpI6jNTic06OnPDtaVOQ/ivAtjPL5TfYYer6Rr
X-Received: by 2002:a05:6512:1591:b0:5b1:5b9e:8de7 with SMTP id 2adb3069b0e04-5b2c1afdec6mr98432e87.2.1784958092471;
        Fri, 24 Jul 2026 22:41:32 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be1d8b21sm253424e87.44.2026.07.24.22.41.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 22:41:31 -0700 (PDT)
Message-ID: <261a03cd-62f6-4ab8-956e-f5ae8969a978@linaro.org>
Date: Sat, 25 Jul 2026 08:41:30 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] Revert "i2c: qcom-cci: Remove unused struct member
 cci_clk_rate"
To: Andi Shyti <andi.shyti@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Luca Weiss <luca@lucaweiss.eu>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260721-cci-clk-fix-v1-0-5eae78700da8@oss.qualcomm.com>
 <20260721-cci-clk-fix-v1-1-5eae78700da8@oss.qualcomm.com>
 <amPtXU_RkseFbpKm@zenone.zhora.eu>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <amPtXU_RkseFbpKm@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/25/26 01:57, Andi Shyti wrote:
> Hi Loic,
> 
> On Tue, Jul 21, 2026 at 04:58:19PM +0200, Loic Poulain wrote:
>> This reverts commit b641af684fc28a07bee9c808eb6c433f9d9bcec6.
>>
>> The cci_clk_rate field is needed to enforce the correct CCI clock rate
>> at probe time. The hw_params timing values are in clock ticks and were
>> calibrated for a specific frequency per hardware variant, so running at
>> the wrong rate would violate I2C timing specifications.
>>
>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> 
> Does this revert need a Fixes tag? I haven't seen very often
> reverts with Fixes tag, but it makes sense if they need to be
> backported.

This revert commit does not need a Fixes tag, since there is no bug
fixed by the revert commit, I believe. But perhaps a series of commits
may need Fixes tags each, if the series is to be backported.

> I'm going to take patch 1 and 2 already while we discuss patch 3
> separately, but please let me know first if you agree adding the
> Fixes tag.
> 

-- 
Best wishes,
Vladimir
