Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3CB22D4E9
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 14:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842716; cv=none; b=XKRaqWZ4d7WiKR5hGrkts4p3WjXzJsQUAUoyrmQytbwiqsUgUnRfYoxwaeGoZFlUY7R3Q3T6eTxwS8LhuRwD+nES1fgDiL6X+B83TtDz92SV7VCvsBrl8+gE0Twr2Z2AlqreNpD7O1jZh8mF3kXOKvhFu7+XRyi0bl1eA3DVoBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842716; c=relaxed/simple;
	bh=ruciOHcoWR/AumoEkGRJS7gGI475d3VyC4GciR63C+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hnKlHdOijDkDKRpthUemPURNHlh6KiWFbxvF+Bbj+VKdE6hdR14IPXgOiZQj1XQ5HW9FI1PTrewN5bZjVp1YlGLFZ7gaDFSjFGgMPHAcn+sOW5wQytzi5eygLkMgPUiCOfdASzqhti9UMBVW/rJDzJ60yJR+A4X/BB6CBZ4Xh1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pSzTfLan; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pSzTfLan"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aeb7ccb9f0so216531e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 07:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787842712; x=1788447512; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ACbKtE14I/cMHm34yNKa84YaRHvuYaEQivDRdwGd6eA=;
        b=pSzTfLanu+KTkz6zLXCAzXlWdwrWmeIbokq07AJZ3a4aYgkk+Ev6s1L1cqynUDHFLH
         xBD83hBvrUw5+tecoZhRV5paHvgiha2eVvgCbCaZVM4XnCjFsDpZ5JBK1x0m4gF05i2s
         osENhqJiRLL3mkk1kb+fXT8bgfaNvYBg8wB4BX8nGg/GSvKzW5qBb3uk8vr3/UapLV5+
         UEdG0MC7PH8tIod5wldORHPF/aUG7xOY0kIGrHJotfQSE8bRoEawfdwqKUcDSv0PwGO7
         eiJ9ud6Cy9nIbquF0H63UXGKwis4O5wjtA4k8AHy0SgUvSSyb3EZOtR1ZrGZ4l4rMCnM
         adWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787842712; x=1788447512;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ACbKtE14I/cMHm34yNKa84YaRHvuYaEQivDRdwGd6eA=;
        b=AcqkC7kJoOjLj/rgHhjiKLWbyVb/VrfIoMjLxpzy2dyUMGqrZI2W2fgvYm5/eYcxRO
         wYid6MyAyFQjSRmDskMJ+Rhp8kX9LoOsDbuWvCj88gI7oxf30roPnw3tXwVu70n0rK+h
         xDhtGZu5LNMfs64XTWYy4Pym749GAIs4JIQMpkUdCIfZSm9bnG80vFtGH7rwufl4jmFj
         WulDV2RoUZ96JDfL3qtA9QW5E9eFtBI1i/HqCQTdz26+gKVZvaxrhUvzbusXa4weSmWJ
         iawvXfVdnT0lZM0lKZrGJ4QGqAeaqMbLsY+2LUPuHxxht5/J85KqwZd6jDHZM/1Z9+no
         W6bQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr0GnH5VpF+7+MoLSGUi+4M6u3FWPrRQ2EWZgNj6BeU8jyQCdx81xzff/SpIL8syDzW69mRqOdcpQz6IScH@vger.kernel.org
X-Gm-Message-State: AFuF++npXL3uNLSSf8lJbo2I7Itgh3Eg5zROrR9Lqg3cq2MDRhkbW+aX
	qzmbRPZ019P/ee/Z511Ls3tTsv0X+9gifsChwJONOO50WA1BtbuJpIDgJo0iMjeyMld0Bmh35jt
	Uzsa7zHU=
X-Gm-Gg: AR+sD13AzPZVbX+4zwXj4tK6FF7vdJm/Hed3OgWGU0CKKcO2JB+aVCAtOAwiqHsO1Hg
	WLo5VLcKt7gF+Er3bewxZ6eL/+Qh0m5apFWsIQsjK4+q0WIA2JTsD0W9CviL37RAHHGTrv/nAuf
	N8AR1M9jI7ddLpsIu0QvKhYmj/Dxr68LOkrDyzsFDBdCntid5TtKZ/89aVd0nrLEZlzBNIYtF/N
	8HJHUr0hFI4UFzW8YdEEjcpkAljMlOhadVJ7mKlgoDOk7VzVC32a5fz93i8H4FlV3g+RMXHQr99
	Tqt6awW/cou28ziZmd0C2mQrz2gwj+F06kdiXg843S4xUV1GEDgtuyqlr9rdDP42U7MZodjexCX
	VkTZnZ8k4BqZt1SjoRQ3MVlkbimlRM5HkIB5k6QEsGowNWnWZ5JZklezrdyfcG6nu23NLWDIgkD
	fJVmeOO1GDIvrlIXJUajl1SvQtbTo+he8SgMPau8TTe2nIRiOQk1k3zfUNyJ0fiylvuL9nLmGGr
	KA+/rXticVDrCDgyYSYqA7utfr5vB+MsuaK+IQAPQ==
X-Received: by 2002:a05:6512:224c:b0:5b4:59a3:c67 with SMTP id 2adb3069b0e04-5b4af823f98mr1552489e87.3.1787842711360;
        Thu, 27 Aug 2026 07:58:31 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4a41a2958sm1345681e87.44.2026.08.27.07.58.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 07:58:31 -0700 (PDT)
Message-ID: <abdfd5c1-1965-492b-bd02-13452278704e@linaro.org>
Date: Thu, 27 Aug 2026 17:58:30 +0300
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
 <b74c2990-ad2a-4ec3-b7e3-e78797c3d4e0@linaro.org>
 <zvs72iseaipj5ouljgrivq2y2cv245kt37gjavbh26he4576iu@d67g25es7ojs>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <zvs72iseaipj5ouljgrivq2y2cv245kt37gjavbh26he4576iu@d67g25es7ojs>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/27/26 14:36, Abel Vesa wrote:
> On 26-08-27 01:41:31, Vladimir Zapolskiy wrote:
>> On 8/26/26 16:05, Abel Vesa wrote:
>>> On 26-08-26 15:33:02, Vladimir Zapolskiy wrote:
>>>> On 8/26/26 15:10, Abel Vesa wrote:
>>>>> On 26-08-26 14:50:03, Vladimir Zapolskiy wrote:
>>>>>> On 8/26/26 14:31, Abel Vesa wrote:
>>>>>>> On 26-08-26 14:20:20, Vladimir Zapolskiy wrote:
>>>>>>>> A clock controller driver is expected to be embedded into runtime
>>>>>>>> PM framework iff there are specified power domains to supply the clock
>>>>>>>> controller. If there is no power domain, then it's a noop to add
>>>>>>>> the driver into the runtime PM framework, and if there is a power domain,
>>>>>>>> the dependency can be considered using this fact rather than relying on
>>>>>>>> a probably stale data from a particular clock controller device driver.
>>>>>>>>
>>>>>>>
>>>>>>> I don't think this is right.
>>>>>>>
>>>>>>
>>>>>> Please elaborate what is wrong in the statement above.
>>>>>
>>>>> Enabling runtime PM just because there is a power domain attached to it
>>>>> is prone for breaking consumers. If for whatever reason the power
>>>>> domains parent child relationship isn't right, the child PD vote might
>>>>
>>>> If so, it's a bug on the consumer's side, likely this is unrelated to
>>>> this particular change, and it should be fixed independently from this
>>>> changeset.
>>>
>>> Providers establish the parent child relationships for power domains.
>>> Consumers don't need to be aware of a specific PD being the child of
>>> another.
>>>
>>>>
>>>> To be precise, I don't see any interference between this series and
>>>> any side fixes, the changes can coexist IMO.
>>>
>>> This change basically says "look, there is a PD attached, lets enable
>>> runtime PM".
>>
>> Exactly, this is the expected situation to enable runtime PM if there
>> is an attached PD, this is normal, and it means the change is correct.
> 
> Wrong. There are tons of devices that cannot do runtime PM, yet they need a PD
> attached to be able to function.
> 
> This is why genpd doesn't try to enable runtime PM by default, just
> because there is a PD attached.
> 
>>
>>> But if genpd is missing information about the hierarchy,
>>
>> Sounds like a bug.
> 
> Yes. But most of the platforms still don't have an issue unless runtime PM
> gets enabled. And you are basically enabling runtime PM on all clock
> controllers with a PD attached, unaware of the consequencies.
> 
> This has been my point from the start.

My intention is to keep the change small and identical for all clock
controllers. But if some clock controller driver is known to be broken
I'd like to know it looking at its driver, however right now there
is no distinction between two cases of ".use_rpm = false":
1) there is no PD, and therefore runtime PM is not needed,
2) there is PD, but the driver is broken in a way, that runtime PM can
not be enabled.

The problem of distinction of these two cases is resolved by inverting
the "use_rpm" flag, and, of course, manually mark all broken drivers
thereafter.

>>
>>> enabling runtime PM could potentially leave the child PD unpowered due
>>> to parent being powered off.
>>
>> Sure, but it is not runtime PM enablement to blame, it's another problem
>> to be fixed in the driver.
> 
> So basically, you break all platforms and then we need to fix the PD
> hierarchy on all? I'd suggest we go the other way around:
> First we fix PD hierarchy, then we can get rid of this flag, if needed.

I'll revert the flag, so that it becomes a proper quirk flag for broken
drivers instead of serving as a questionable "quality control passed"
function.

>>
>>>>> not trickle down to the parent PD. So if runtime PM suspend happens, it will
>>>>> drop the vote on its PD just because the genpd tree is missing stuff.
>>
>> This is expected and it's a totally valid behaviour.
> 
> So consumers crashing when some clock controllers do runtime PM is
> expected and valid behaviour? Again, we need to make sure enabling

It's an absolutely expected and wanted behaviour for the PM framework to
turn off the power, if there is no consumers. It's someone's else mistake,
if the hierarchy is not described properly.

> runtime PM for a provider does not leave consumers hanging due to
> missing parent-child relationship in the genpd tree.
> 
>>
>>>>> And you're enabling runtime PM for all controllers that have a PD attached,
>>>>> even for those that do not have the use_rpm set to true currently (e.g.
>>>>> Eliza).
>>>>
>>>> What is the point of specifying 'power-domains' property for Eliza GCC,
>>>
>>> Having a 'power-domains' property in DT node, doesn't mean the device
>>> has to do runtime PM implicitly. The reason a PD gets attached to a
>>> DT node is to make sure that PD gets enabled and stays enabled for the
>>> device to be operational. Runtime PM is just a great way of reducing
>>> power consumption when the device is idle.
>>
>> A proper runtime PM enablement in a driver ensures this "PD gets enabled
>> and stays enabled for the device to be operational" target, no contradiction.
> 
> But it is not proper runtime PM yet. Not until we make sure genpd tree
> is accurate. Enabling runtime PM in bulk isn't a good idea.

Okay, I'll invert the flag and mark all incomplete in sense of runtime PM
support drivers by the new value.

>>
>>> So GCC needs the CX PD attached otherwise RPMh could drop the vote and
>>> result either in undervolt or actually failed reg access.
>>
>> Is it going to be fixed one day, so the drivers earn "use_rpm", or not?
> 
> Yes. I'm already working my way up through clock controllers, accross all
> platforms, attaching PDs where missing and enabling runtime PM one
> provider at the time. Even with this approach we might break stuff on
> some platforms, but at least we can revert that single commit, if
> necessary, instead of one that applies to all.
> 
>>
>> So far I get an impression that all these reasonings above are unrelated
>> to this change, it sounds like there is no problem in the runtime PM
>> framework, and something else is broken
> 
> You insist on breaking all platforms with this patch just because of
> it's a nice rework. I'm trying to prevent breaking all plaforms.

No worries, I'll take care that there will be no regressions.

> Again, first we fix genpd tree and enable runtime PM one provider at the
> time. Then we can rework this and drop the use_rpm entirely. That way is
> less hassle to debug and easier to pinpoint a commit that enabled
> runtime PM via the use_rpm flag for a single provider, rather than having
> to revert this patch that does this in a bulk.
> 
>>
>>>> if it is anyway explicitly ignored by the driver? It sounds like anattempt
>>>> to cloak a bug, and if it is necessary before the bugs are got fixed, then
>>>> the 'use_rpm' flag shall be inverted to 'do_not_use_rpm' flag for broken
>>>> platforms.
>>>
>>> Well, when you add support for a new platform, usually you don't enable
>>> runtime PM by default for these controllers,
>>
>> Why not?
> 
> Because runtime PM is usually an extra effort, on top of the existing
> functionality of a driver. Specially for a resource provider. Done
> wrong, you break all consumers.
> 
>>
>> So, today there is a flag to mark a properly supported platform like it
>> is a wonder.
> 
> No, it is a generic way of enabling runtime PM.
> 
> If this generic way would've not existed, you would've not added runtime
> PM APIs calls for all providers in a bulk way, right?
> 
>>
>> As I said above, a properly supported platform/driver shall be the norm,
>> and an ill platform should be marked as broken, and the quirk, if needed,
>> should be inverted to the yelling 'do_not_use_rpm, I'm broken in upstream'.
> 
> It's like saying genpd framework should enable runtime PM by default for every
> device, and provide a flag like 'do_not_use_rpm'. That would be bad all around.
> 
> Again, in general, just because there is a PD attached, doens't mean
> that that device has to do runtime PM. That's why genpd framework doesn't make
> such assumptions either, but rather gives you an API to add it yourself,
> if the device can actually do runtime PM.
> 
>>
>>> until you made sure that it actually works. So use_rpm is basically
>>> saying: "we're good with runtime PM now". So I'd not revert the flag either.
>>
>> I belive it's wrong to mark "good" drivers/platforms as "good" ones
>> explicitly, the purpose of quirks is totally opposite.
> 
> You are thinking of this the other way around. Again, if the Qualcomm
> common clock implementation would've not existed, the we would have
> added runtime PM API calls all over each provider, one at the time.
> 
> The benefit of the Qualcomm common clock implementation is that it
> basically takes care of calling RPM for us.
> 
>>
>> If a complete removal of the flag is not possible due to "broken" drivers,
>> then I'll invert the flag in v2, and then remove it for the clock drivers,
>> which does not require explicit PDs to be enabled at all.
> 
> Why?
> 
> Again, RPM is not a given in any scenario. Proper RPM is done per
> driver, after the driver brings the device into a functional state,
> therefore an extra step, sometimes even impossible for some devices.
> 
> Inverting it will just force us to add the flag from the start for each new
> provider until we figure out properly the PD tree for that platform.
> 
> The value of this patch is outweighed by the current functionality of
> all platforms. Taking this in will most likely break that.
> 
> Due to this facts, I think this should not be merged. But it's up to Bjorn.

v1 should not be merged.

I'll send v2 though, since there is a problem I need to resolve, namely,
as I've said above, there is a need to separate the clock drivers without
PDs, which are excluded from runtime PM due to this reason, and the clock
drivers with PDs, which are excluded from runtime PM due to their incomplete
support.

Thank you for review and fruitful discussion!

-- 
Best wishes,
Vladimir
