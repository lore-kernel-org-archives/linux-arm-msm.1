Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0BD30F526
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 22:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787784096; cv=none; b=S6JXck7F9U0cQxYAIy7GnLY1DFBrdPLbtohz9ff5ER5zJIt8OBreS+mCGqR4La/mcO6TojaXc4Yw0skfm8HVidamfyUx6lr5yDQw43lvh0j0WTrl6DstJPi6KUIpeXzOOZ7bmiJf9x1fP1xoN8qTCxnp4v6CmQ+SlQpXbthKXtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787784096; c=relaxed/simple;
	bh=YYP4LDWXmiVuY4BifmOxZHgSPLWqAFlVz+yqVaK9xjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RDVjcPGx8F8XetutkLs+Zcg6/p9ml6WsvwUM9A5ZBhYCoZONhrmXc1oUjjsLLsnBGzbrelKqPVDwCk5VkmuD2OJrPzOzYiLKs/gi4OjHSeNc1h5lYpR/tDR8CeU6vhut0u3OchdTZSTuqRVVEoHuTKJ1aXTamAAjjNWdDbDcpMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Grulj4bS; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Grulj4bS"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b4afb31f42so70339e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 15:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787784093; x=1788388893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GTHFPFjzAIX6+cbdIahV/L/cBl8xgXAW8UO1u2AMYdE=;
        b=Grulj4bS2RWbOVK3QoaS5z9nJSC/BERxR6wGBHU+BHuLLJJqZfc/3GOObJIQcbC/kD
         0VavTiw6SCM4uIG6+j27dIYYFYa7z1U7Liu8PSlJzBmU0nHzWvtDxZfJ2HovzWjZLP25
         UBEHtZUsihMjsj5Q8vHpjmVFlxB2oOAaMsnY/L+gPS9IbO4xo0Zqqxymu38jR6va0Y3O
         aSBan+lZL8aEtvtcK6y401L7C/7qZy3TwIiXsiPPEz3qv+Bkz8d+7pXtZMpEUGGZMNeU
         I1yYmdCnAqdUCskqpe8IgktxblaEC/rWJDxFpiA2HTNX9HErpiUsAfxPzuCqLqbZ3/wU
         /X5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787784093; x=1788388893;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GTHFPFjzAIX6+cbdIahV/L/cBl8xgXAW8UO1u2AMYdE=;
        b=nyOGQf86TS6TE+U3n+/TOu/O8Fzl28Ot7LaESS7DUC0AqeIMal+wyPXc5ZrFxemFSM
         i1dFLfYT5RRCtUnOtVJPXonhYaoCENmDzQIN7KJwe6GN5qBlwMblgN2rqUr4DCGHda/f
         HghqDVHYHwK8whNFiwLM2Q0SAZ5/KU0jj1gksLwJUpWE14/7d+CbTmelffS9ZkNvZAsQ
         k+7USLhAiTFKP0fu0Q7CDw41vpoBqhwCoZWo5AQ+OEORYf44/i71JcJgf+sjRkGdFY2E
         +n/3czpSk28QOv6hBlj6WuvCUu+KG7qX95pR1493cyz1IfaoagGxJMq8J7XZAFe4+LG/
         esCQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqh4++hKIm7fTe7FGZWJHGjsho29ZBSFq9Z/VFoGPFasdFxXhZSTWW67/z85Y5vZwwSu67i1VzAAIghXXmZ@vger.kernel.org
X-Gm-Message-State: AFuF++lNWSYmexHn0IYg5Llpef9sRldP495f47aSeLNlo+/4f7YRzT6K
	ZzKKi/SJUe3N276PxJJvzRFmyTHi/QdfLiCAfabFij2hDXEhb0e59f3bJHvP4fHDYw0=
X-Gm-Gg: AR+sD12OtPspiflps+DFamH4OeDVoQlJipyymTGidikPVBANu+2ZoZ4qZ1nVWrKVVgU
	z4huu3brHLVjCRjFCT7WPTG1tB4H2NT8FrKd8HgK12hw4abhT6akQB+IZFwo1sSkIGJ61/cz88C
	/ObE6RDCKY1IcIqAfRHhWL9f0E/0lOSrwB6cdTIpbfFfpWCORB2YQY8foG7YwrZOPjopC/uhaa6
	XAHyASsUc4v+Y37cWcHkQDP7jF58gcZSqqJ3YfGE0LYVPYRZC0w5PiPUelPsfCje2SVkTE0eNcR
	B+zjtqXlrMgc9ehoxmh1RIqVI7SUj2IJZVWjnSbEY2O/VetcRCQcOlcrVbvXWgxwBFYJi8PV/9E
	MGidZkwxf2KgQ/ezuXDLnMCZNHTcQwtZbZ7yULUbJJJuG/4khALE0arJuMrIjv7AfiTQQcC7jun
	9ibUVvAvAGYXaV5hSO+lvTB8hq5ZljHqNS9YkquNHDRmba/CnRVPAeRM90SoOR38i7n9N/VgB/L
	XehtqdqcP7u3Wt2L9i+/cR+OYKEpzbzOznCmXcvwLEg2IWHF5JC
X-Received: by 2002:a05:6512:3d8b:b0:5b1:5b9e:8de7 with SMTP id 2adb3069b0e04-5b4af80f515mr492279e87.2.1787784092777;
        Wed, 26 Aug 2026 15:41:32 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4a41ae602sm855942e87.56.2026.08.26.15.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 15:41:32 -0700 (PDT)
Message-ID: <b74c2990-ad2a-4ec3-b7e3-e78797c3d4e0@linaro.org>
Date: Thu, 27 Aug 2026 01:41:31 +0300
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
 <a144bd80-f49a-42bc-90ef-a114467e4b39@linaro.org>
 <tpoqvfsrny7xqykjevjiyyuctwceenfjry6pf6zbwf2yg5hi7j@5rq554qe7ghj>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <tpoqvfsrny7xqykjevjiyyuctwceenfjry6pf6zbwf2yg5hi7j@5rq554qe7ghj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/26/26 16:05, Abel Vesa wrote:
> On 26-08-26 15:33:02, Vladimir Zapolskiy wrote:
>> On 8/26/26 15:10, Abel Vesa wrote:
>>> On 26-08-26 14:50:03, Vladimir Zapolskiy wrote:
>>>> On 8/26/26 14:31, Abel Vesa wrote:
>>>>> On 26-08-26 14:20:20, Vladimir Zapolskiy wrote:
>>>>>> A clock controller driver is expected to be embedded into runtime
>>>>>> PM framework iff there are specified power domains to supply the clock
>>>>>> controller. If there is no power domain, then it's a noop to add
>>>>>> the driver into the runtime PM framework, and if there is a power domain,
>>>>>> the dependency can be considered using this fact rather than relying on
>>>>>> a probably stale data from a particular clock controller device driver.
>>>>>>
>>>>>
>>>>> I don't think this is right.
>>>>>
>>>>
>>>> Please elaborate what is wrong in the statement above.
>>>
>>> Enabling runtime PM just because there is a power domain attached to it
>>> is prone for breaking consumers. If for whatever reason the power
>>> domains parent child relationship isn't right, the child PD vote might
>>
>> If so, it's a bug on the consumer's side, likely this is unrelated to
>> this particular change, and it should be fixed independently from this
>> changeset.
> 
> Providers establish the parent child relationships for power domains.
> Consumers don't need to be aware of a specific PD being the child of
> another.
> 
>>
>> To be precise, I don't see any interference between this series and
>> any side fixes, the changes can coexist IMO.
> 
> This change basically says "look, there is a PD attached, lets enable
> runtime PM".

Exactly, this is the expected situation to enable runtime PM if there
is an attached PD, this is normal, and it means the change is correct.

> But if genpd is missing information about the hierarchy,

Sounds like a bug.

> enabling runtime PM could potentially leave the child PD unpowered due
> to parent being powered off.

Sure, but it is not runtime PM enablement to blame, it's another problem
to be fixed in the driver.

>>> not trickle down to the parent PD. So if runtime PM suspend happens, it will
>>> drop the vote on its PD just because the genpd tree is missing stuff.

This is expected and it's a totally valid behaviour.

>>> And you're enabling runtime PM for all controllers that have a PD attached,
>>> even for those that do not have the use_rpm set to true currently (e.g.
>>> Eliza).
>>
>> What is the point of specifying 'power-domains' property for Eliza GCC,
> 
> Having a 'power-domains' property in DT node, doesn't mean the device
> has to do runtime PM implicitly. The reason a PD gets attached to a
> DT node is to make sure that PD gets enabled and stays enabled for the
> device to be operational. Runtime PM is just a great way of reducing
> power consumption when the device is idle.

A proper runtime PM enablement in a driver ensures this "PD gets enabled
and stays enabled for the device to be operational" target, no contradiction.

> So GCC needs the CX PD attached otherwise RPMh could drop the vote and
> result either in undervolt or actually failed reg access.

Is it going to be fixed one day, so the drivers earn "use_rpm", or not?

So far I get an impression that all these reasonings above are unrelated
to this change, it sounds like there is no problem in the runtime PM
framework, and something else is broken

>> if it is anyway explicitly ignored by the driver? It sounds like anattempt
>> to cloak a bug, and if it is necessary before the bugs are got fixed, then
>> the 'use_rpm' flag shall be inverted to 'do_not_use_rpm' flag for broken
>> platforms.
> 
> Well, when you add support for a new platform, usually you don't enable
> runtime PM by default for these controllers,

Why not?

So, today there is a flag to mark a properly supported platform like it
is a wonder.

As I said above, a properly supported platform/driver shall be the norm,
and an ill platform should be marked as broken, and the quirk, if needed,
should be inverted to the yelling 'do_not_use_rpm, I'm broken in upstream'.

> until you made sure that it actually works. So use_rpm is basically
> saying: "we're good with runtime PM now". So I'd not revert the flag either.

I belive it's wrong to mark "good" drivers/platforms as "good" ones
explicitly, the purpose of quirks is totally opposite.

If a complete removal of the flag is not possible due to "broken" drivers,
then I'll invert the flag in v2, and then remove it for the clock drivers,
which does not require explicit PDs to be enabled at all.

-- 
Best wishes,
Vladimir
