Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BFF3E8C74
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 12:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747587; cv=none; b=HK2hmfIBuwdUs/Ig5GtnzP8dsC2m+sxNysCBTX4Mz9H4shQDL7tdxXNBwoDWK8wXBeDDLxxZBYEVEYrWxNYhKCLrEyzUnv/WWnzrmPU62O5V0e0UQUbEbya+rjZfMzWrUDoo/STPoG0ktCOmepGVU41XsgIVAQI5xdb3Dio1xqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747587; c=relaxed/simple;
	bh=bsF2O0QzRUz7DhEi1bN5nLauj1ZE0TtFB5DCQFlz3/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FDIrGCv75IFk1HW7S16x0h79Ofrg5mJ21bGf+ugFVrEVhCuNtJjo6FoJ1YSjfVZipyUi6YXLARYyWNPVrn3tzCyPWqsGkKioU7glm8CUioHu3/NctZG+YMla/aD2H9KQLikESaY3neCSRsw7+rICstV2J3p5Ifh7DAGYM83IEWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a0+yo9JR; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a0+yo9JR"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b014810feeso72032e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 05:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787747583; x=1788352383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LW3/cUZ0yhDUOtbElevLu9Sr6PNvBj7VNVdJLKYtu2E=;
        b=a0+yo9JR8FwA1bagcgr9HcSL7UeOg17ggalyzP5WlQG+a5HeRcITnbGdoq0KjL8HGW
         dE/n1EcOfESxcC328yIxs0hpWYdbZA36WCgJcqTVL/EWitD/pm/WBxbI/IiP8ZhzKEqy
         +R6S46shTwRQ6dBARgsuN3ovwA+hmtg+eTDWufUdvDSfK3RUvIv59J0PT40kCNmCUS1x
         /8bKk6rR2J7aYVhauOhet4nKaZKXRR6sKkgauob+Y0rtkVlNFrFO6dcRgb2iKykkbVXo
         3epsc2uUbGv2m9H1yT+CPqsEcXMTtcFjoqGivE6CUyqW0wn/j8c3Z9iKS+UKwE4M8JkG
         Dr7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787747583; x=1788352383;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LW3/cUZ0yhDUOtbElevLu9Sr6PNvBj7VNVdJLKYtu2E=;
        b=T73n7nUP1Vry2NJNUXoGh4BuAtiVuf7dtypUJ1y3cBlNx/kT7FtSmCX//ygBTmgi8Q
         zriyUxCsr3xtqCJQK7UQ9dIGfXN6HTV9MiLfUcxzwnAIn92K6g37N0T7GVIDGY18f+4b
         Un5BhI83wVniaoG/gE7Qrk1DI+8uwk0DWPW/n1W6Tb/EqcvtDcNZ7nZ/wU5umOlmXrAI
         WwjOM4YSKtdDQIOjHV2aBIu/VWHpACU2cJpSD5d5oSSMqzdlp7whp1Vs3js7bWccA02N
         1+t5GCjHfSGQjFKuQyYTTQweBSCcTGhI2yQsm6MU0n9uDl3rAaZQxLDZeu8sv7zg9Xv/
         W43Q==
X-Forwarded-Encrypted: i=1; AHgh+Rpy9xm/LMn1GRBwWQXnA3p48XpcLa/J5oFyh7+4klG3qJG7LUFjjdz4ANUFJAULLf6X0knVao/Hp4izC+Ea@vger.kernel.org
X-Gm-Message-State: AFuF++mY6nHKM4pjLQRCKVvAw/j02LUrkeb6xy0V0AvWVm/LWOZ6Lwbx
	s+zWo103o6Dog9GRKCPCKA6KNufafzFFaFWtZzMq4d3EAA+oS0lakcyQvfAN93iM6EQ=
X-Gm-Gg: AR+sD10RULKbqC3AcIcJKKArsRULy1vqwwXHZYLOYDxu2th3YONktDWLsby0PVTY1bp
	qI0YJC8U4Kk6x63Fj+VMZOU5HvVFhsUD8F1i6tdrGG7adzdI5Bz+i0d2Ex9Alp455CqjNIoNniJ
	DTF9BDX2EOhHkahifISeMxNQ3kjwO693Nwk9HHBKMMGVByIBe7vrSgKyukMuZCYFtP9SuAyI8T9
	EbWZWiYZIDumKqoCngxaVeI+oXMHIauCpMgrXqN2jI2KxNDB24bEYF5kIFTD9+tuzhpTtA5lgCd
	MHmFF4G7OGxThdGIigxlnr/ZO6MZud32WfRdP5JXyz0jCZN2gwtTKGpsLIOnO7oOn79g50HY56I
	DxKDr51iMIk1DZqq1rRULcgXfBTIa/B6NEXilF/kSSrdUSHO+EOLEnjfaKzdHhJX3A6xcmG53ZY
	4O1hfCtRtA+t1I/MCOrFvFNIzbT/UkmCvY76sw/vuGQ7oX8gNXod8tAINKWc/nXnPNW6Momlwbp
	05Ks3Wkpd9IHHGBwHR5hJ4WY8+rOSff/mxkg370UA==
X-Received: by 2002:a05:6512:3502:b0:5b0:1f1b:854 with SMTP id 2adb3069b0e04-5b4a904e6c3mr904768e87.1.1787747583057;
        Wed, 26 Aug 2026 05:33:03 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4a41c240asm545217e87.83.2026.08.26.05.33.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 05:33:02 -0700 (PDT)
Message-ID: <a144bd80-f49a-42bc-90ef-a114467e4b39@linaro.org>
Date: Wed, 26 Aug 2026 15:33:02 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: common: Tune clock controller dependency
 on runtime PM framework
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20260826112021.1455707-1-vladimir.zapolskiy@linaro.org>
 <20260826112021.1455707-2-vladimir.zapolskiy@linaro.org>
 <r3nxoo4w56oiyhbs6ysdh3rzfntwwk75m4csktar2hoxdhmfmu@rh4ghbaav4lu>
 <5c5a5617-1a74-435c-bff8-8813e4acc5b7@linaro.org>
 <6xbm6uq266y42ga54wkdn6364gjj44v4mmsjg53rhfi4e7rzmq@i2uwudm7pxcf>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <6xbm6uq266y42ga54wkdn6364gjj44v4mmsjg53rhfi4e7rzmq@i2uwudm7pxcf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/26/26 15:10, Abel Vesa wrote:
> On 26-08-26 14:50:03, Vladimir Zapolskiy wrote:
>> On 8/26/26 14:31, Abel Vesa wrote:
>>> On 26-08-26 14:20:20, Vladimir Zapolskiy wrote:
>>>> A clock controller driver is expected to be embedded into runtime
>>>> PM framework iff there are specified power domains to supply the clock
>>>> controller. If there is no power domain, then it's a noop to add
>>>> the driver into the runtime PM framework, and if there is a power domain,
>>>> the dependency can be considered using this fact rather than relying on
>>>> a probably stale data from a particular clock controller device driver.
>>>>
>>>
>>> I don't think this is right.
>>>
>>
>> Please elaborate what is wrong in the statement above.
> 
> Enabling runtime PM just because there is a power domain attached to it
> is prone for breaking consumers. If for whatever reason the power
> domains parent child relationship isn't right, the child PD vote might

If so, it's a bug on the consumer's side, likely this is unrelated to
this particular change, and it should be fixed independently from this
changeset.

To be precise, I don't see any interference between this series and
any side fixes, the changes can coexist IMO.

> not trickle down to the parent PD. So if runtime PM suspend happens, it will
> drop the vote on its PD just because the genpd tree is missing stuff.
> 
> And you're enabling runtime PM for all controllers that have a PD attached,
> even for those that do not have the use_rpm set to true currently (e.g.
> Eliza).

What is the point of specifying 'power-domains' property for Eliza GCC,
if it is anyway explicitly ignored by the driver? It sounds like anattempt
to cloak a bug, and if it is necessary before the bugs are got fixed, then
the 'use_rpm' flag shall be inverted to 'do_not_use_rpm' flag for broken
platforms.

-- 
Best wishes,
Vladimir
