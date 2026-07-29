Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C72847ACCE
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 11:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785325868; cv=none; b=XK4sryXL9umE98GIj7JwcdwqwObY80tLeVRGzf//5R3rfiRtU2ykoGw8Jf2UcNqRFQnzOHHPgG7CUw2Gyl01otmsd801M8seJbYrEWZsCojA+fgxSnsKRxk9K8Vv3fAipxVMD0zgNr0X28M7mlZC6BArxSHTlZJOoWNDXnxyNE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785325868; c=relaxed/simple;
	bh=ps9R+WRpeXjoGcemPQ95b5leWKPu9wUmCCyJRD0MZGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H/4/b++HrOIisInx5PJLOV0rdLLSO5MUzEeHLkgoWiJi7Pp1SINaY4cY1AwpBewVWlVz7m5BBEqUaodF4HPuIHXjxGio1e0OXiox/5G9umz7vCM7zDqpjBX8OUgJ2Ma9Wm4yBwzgxZ0g1cZ+WAhvS7fIHhE44/LpllWEzJTXSX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RXL5QToA; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RXL5QToA"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39dbc0de4ccso489341fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 04:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785325863; x=1785930663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Pf6/BJ4e0IhMjvUwkKUwtDlKqoO+k+Whm0k3Afr/NKU=;
        b=RXL5QToAApnxSIXYZ6VZ7aFpQeTNx2RRQOFePeiz6kCBFkYhOBm4iHGY5cP6anFRNN
         80gq9cPKWTQ3GCK/q5TxxIIK392kHkvOVLkDidLMDfNdSaGzFKHhruBNE3tXhYV59K84
         omHYLOpwMWGIdeTe9GmFQ3Nd4iZLvDUyFDDWZGBRFNvyaSbeNxglQEJCinfsH74crJH0
         H+NAKHuEQIddCJps03AGWN1ItKVKr6nPdp69uGd+SSEHm0428EtBEjhFwpisLxmQHhDs
         znz7ogjozltY/f8ke5omJF906Y7VSFLIQdlM0mzpk37IuLw+oVDi1xsds4Usf3gISCF1
         tE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785325863; x=1785930663;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pf6/BJ4e0IhMjvUwkKUwtDlKqoO+k+Whm0k3Afr/NKU=;
        b=FQMqNioDL9ob6sIewi87oh/k10QcxbwMpMAAiW0UEaz0MXPGgg3I3QMEz+UIH1eGhh
         9SBaCZtXrF4RFhxwiaY9xhrV8ieJR78XKseKdHNVnDoPmeuGGfKe5BT6giamfxMWwhCp
         /6+creBKG2rCu2wHS8U3ao9Srl87Woo5fqc8MzhA5uGAwC5b7P42rC3zFyHF9yVxM4g1
         dAyHSyFPKnOCekSKKBfq+hlxhA/8inQLiur8ZW3PU4iqXsgb7ICbOr7C16JBttilg7Fp
         kMmsxX7rcdNrwLbCE4PhGxXpYkbiW/skCRkxWaP0ajI+11uKlqOGJBPBw9qPAVriWL8N
         pHOQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqx/SO7+BCYZeOYgjlNvBa1sjSY3FuxUORqiE0lkrSJ2uLVmgo3WD4GUPFiblput3szqCZSZLGjc72RILOA@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvnqm+d1ddE/rAdvphkxFtKynm87kvezPS2bckif/zP/5bB3pf
	n8du7Dvz2eeMtoke3cM37DOfXtCOvYgZS+pJb8wcMQyD0/t/cxN6NTbmWghtcHGV7tE=
X-Gm-Gg: AR+sD10AeeQPY5Iiu2Vjr7p6PVCZqqs+XtbGkUGp30el/8gPujz3StSCvBeCrCCN+G3
	B2XeqFzQgvgDgJ7FGeA/AKJgnJpRlTm0+m4U2giyGYSVTgS3O3d/LgODdYH9IaMDRwYdOQPv7hy
	vhwybVLu8dJouiUgflwZUdEBPU9vmqBCUrxQ3ZAv11r3Z0a53qWTkvpmAEGJuvWiG0Ek8L+CVmB
	pzhWeeA0U7s2qmwO9TT8ogwQtRAoqTIwxOCOEneGP8y6/z9LS8EpH1QDiuZWoTtVsJdgOviVAZ3
	iWBsdUe+/bW6IXT+e1XN2FrLEM+Sd5yucD0u5TDHV2DWn4UKYUa97njHw9PtFUTpk9N/uxQFQX4
	6DgfiJWx3IJyioy3SsoHp/NSO532WwXRAIv9mP4F0QA4fjYkSkvDhqTduhk+bFrckwM3BA3GlC1
	3t+zhWMyoz3JngLrj9262yuk71rr8h3JyqU1Ub9DmBvCJldUHu7PchQTbrX5LXjETif4dCfOsCH
	cz4EhR5GAj7QqB1EHluWAhPbtclcTgvMDBjioryh7g=
X-Received: by 2002:a05:6512:12c2:b0:5b0:2ba4:542d with SMTP id 2adb3069b0e04-5b2d025ed7dmr962428e87.3.1785325863005;
        Wed, 29 Jul 2026 04:51:03 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2d76aa204sm343394e87.30.2026.07.29.04.51.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 04:51:02 -0700 (PDT)
Message-ID: <3fc1ea66-4186-4924-96cc-c522d7563736@linaro.org>
Date: Wed, 29 Jul 2026 14:51:01 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] i2c: qcom-cci: Fix CCI clock rate enforcement
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Luca Weiss <luca@lucaweiss.eu>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Stephen Boyd <sboyd@kernel.org>, Stephan Gerhold <stephan.gerhold@linaro.org>
References: <20260727-cci-clk-fix-v2-0-c3958f28b045@oss.qualcomm.com>
 <20260727-cci-clk-fix-v2-3-c3958f28b045@oss.qualcomm.com>
 <9fc0577e-ce2a-43fe-85ac-e382e930d5da@linaro.org>
 <CAFEp6-1tvsg1gNHYwiyaBWqw2=bQazwRViN4ia3VHz9VWNOJjg@mail.gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <CAFEp6-1tvsg1gNHYwiyaBWqw2=bQazwRViN4ia3VHz9VWNOJjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Loic.

On 7/29/26 14:35, Loic Poulain wrote:
> Hi Vladimir,
> 
> On Tue, Jul 28, 2026 at 5:58 PM Vladimir Zapolskiy
> <vladimir.zapolskiy@linaro.org> wrote:
>>
>> Hi Loic.
>>
>> On 7/27/26 12:21, Loic Poulain wrote:
>>> The hw_params timing values (thigh, tlow, etc.) are in CCI clock ticks
>>> and were calibrated for a specific clock rate per hardware variant. If
>>> the clock is running at a different rate the I2C timings will be wrong,
>>> potentially violating the I2C specification.
>>>
>>> Rather than just warning about a mismatch like before, actively set
>>> the clock to the expected rate, using the OPP framework so that boards
>>> which (will) describe an opp table also get the required power-domain and
>>> regulator votes for that rate. The OPP table is optional, boards without
>>> one simply fall back to a plain clk_set_rate() behavior, so existing DTs
>>> keep working.
>>>
>>
>> Can you please share any deficiencies you see, if a regular mechanism
>> of 'assigned-clock-rates' is used in dt descriptions instead of setting
>> a supported clock rate from the driver? Or is opps mechanism supposed to
>> substitute it?
> 
> assigned-clock-rates describes an initial hardware clock configuration
> applied before probe, but is a bit unclear about when we should really
> use it. In our case the CCI core rate isn't a fixed hardware property,
> it's a software policy tied to the I2C mode(s) the driver programs.
> The driver is then component that knows which rate a given mode
> needs, so it should own that decision.

Sent you a verbose comment, but we can continue discussion here.

I'm fine with 'assigned-clocks' variant, but what you say is also fine
with me, if the CCI device driver forcibly sets the desired clock rate,
please note that it does not exclude to set 19.2MHz rate for CCI v2
revisions, for instance, that's why I believe my change shared with
you is a step towards the right direction. A change to implement
a policy mechanism and set the wanted rate can be done on top of it.

> Driving it from DT means the DT author has to know the per-mode rate
> constraints (effectively reading the driver) and keep the two in sync
> (the CCI/I2C bus rate and the CCI core rate), which is probably why
> several dts files got it wrong today. Enforcing the rate in the driver
> fixes all of those cases in one go.
> 
> OPP doesn't really substitute the  assigned-clock-rates, we just use
> it to describe the constraints/votes (power-domain, regulator)
> associated with each operating rate (picked at runtime), if any.
> 
>> For instance qcom,i2c-cci.yaml example uses 'assigned-clock-rates'
>> properly, in many .dtsi files (NB, but not all, which means for a number
>> of platforms CCI hw programming is done incorrectly today) CCI clock
>> rate is set this way.
> 
> Yes and that's fragile. I think we should remove that from the example.
> 

It's up to you, there will be no objections from my side. There might be
pro et contra arguments about 'assigned-clocks' mechanism though.

>>
>> It seems to be sufficient to get the clock rate in probe, compare it
>> against the supported clock rate associated with a wanted mode, return
>> -EOPNOTSUPP if there is no match.
> 
> Certainly valid, but I don't think it would hurt to complement it with
> additional enforcement in the driver. I don't see why the CCI driver
> should be prevented from configuring its own clock. It has all the
> information required to determine the correct rate and should not have
> to rely on or trust whatever clock state happens to be programmed
> beforehand. Instead of merely rejecting an unexpected rate, it can
> program the correct one itself, which is standard driver behavior and
> not particularly different from what many other drivers do.
> 
>> To get a better idea of my proposal please check this simple commit:
>>
>> * https://github.com/torvalds/linux/compare/master...vzapolskiy:linux-lpc32xx:cci-speed-modes
> 
> Thanks, I think I have a clear understanding of what you're advocating
> for. While it does expand the scope of the original series somewhat,
> now we've discussed it in enough detail, I've taken your suggestions
> into account for the upcoming v3. Let's continue the discussion on
> that version.
> 

Thank you!

-- 
Best wishes,
Vladimir
