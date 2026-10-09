Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A104E8E01
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 15:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791559683; cv=none; b=LvYlqXE74F5Mv3AHFch8C9lopV8xba0ynTHHBCIzYPiwN5m2pzHU01UeN7Vc5IqxPFsfdkeMW0Dvjae3EmaE7Dyzc5iOsGKetLGJ6odIas8pB7Ud8fxfFiOT823uNSxErv3IZjGybhHBhd4AFVjOyXlq3pzUgNL5sbrQJZje8Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791559683; c=relaxed/simple;
	bh=jfmaWnctqSBU1dtFJUXd14G5f+Bwt3u2QsKEHr4Doww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vE9lUtujKQd0jRwiY3KYZpd2zvXkXVXAuAA1BG/UzVR2Bc21i8Dmk1Qing54YgrQvG6SF84ig6kAajZxzkvx9QQ21lVo+08hToqI7m9HO3Cx/ZVkVVEo4+7ZPHPc1A6ata40jKi6j9vSD/UoKFm6L9wMPVxJxzTjt6eejS/KP8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=GFVMesmy; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="GFVMesmy"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-9142e83204aso25606726d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 08:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791559677; x=1792164477; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XWJIKajLi/Hl+bQHGE1r4qQlOKx5Aox6GAQJinOVg0Q=;
        b=GFVMesmyH/+lK1De9S/UhUOIGuSowSZ/JWylB+TNI4NI/iPlruc1C0JL8EuM3j16GS
         X2sOChe2yOk/4e8sQBL7IhdvnFWFHPo0u+M8P9OBQgLA0qfSNBb//NaIrmIhIBaiL1Sn
         IkZTNerL3Lx07Y1n9NJXbzsm+QOphGUeKmY5wYr1rorCc8MNJ+q0OR6LyW4uwG9LfAqz
         Qdhin89//2pCvCMusLmSrv22Nkqlk72pfKS0yKXVEKDVG3o0KYo4JV1y49/WtwhG6+u2
         KvfRzvb7RkixU5jz39hoXBosxxwpKopWAUM2Ao+L61jk0VCjgg1XIfGaeJcb8aw0HkFo
         7aHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791559677; x=1792164477;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XWJIKajLi/Hl+bQHGE1r4qQlOKx5Aox6GAQJinOVg0Q=;
        b=v05qVrUa63Hp7XOPiKf2AfkOYftP0nYaUGIk45siWKgcHLhIyKJECuHkfF8VTu8hlH
         gxbDyHuJNWnBJKB65Q4Q5S6fsCMwQMTJm2okgIDF0dM+vnsGiBiceciYNRitDgjmzZNA
         flUY1idcuNDTgFOkQH5wTgobSXuqRWoj/o0tbAiEJ3ZDup1JJb6rJTXg2UeIvG/uvdFN
         goIPMwklhoB5WLjjlQKTeiQP7W77k1YGkYkOR68RvR4PZQwLtbKb0DbeU/8j/rIdRu6F
         X5dKN0H21/EIumyxjMxfUPhyHtk3mc6IefAoEJimDBJ/ThClNnhOR4+2B8r9J8/yUt1Z
         3P6A==
X-Forwarded-Encrypted: i=1; AKwUvBzZr9H+Mrin3wfELhwwG/QQrd7EePWsfOmeQhIt21c4iWPdZEAHPuH9qxNX2T/XCK13ZGJ7r6804Prn2wdH@vger.kernel.org
X-Gm-Message-State: AFq9FYIH3t3jsU9eO8+vR38mle8e/1XbADfdUGjbFpMC4Xa/vlnU9XWR
	qiGkvwdDMs/ECpthvsBYRblVh8oAvVuj8P5G40ymCgpjnaI6KpC/0sAFlXDKFeNsVq8=
X-Gm-Gg: AYBFou2MK2yMBWzx+gfTdFrktg/vGvRJSJidooeR/9u4ThmWQYLAnCtJQnv9TQ2497g
	gOa9fwx9VvVv5EsQFiuH7Bi9y+2KDcNBAP0k41Vh2t07+GaubBBEe3D7AzWlwLS2iATj6vQhLzj
	2i7eZN6JnfAKmmlv8BkGH7M9yQkG5tkvhTelLLnGTpq66vo6eVvtCJocLIVWd9KWmVpJLmBplsy
	pgh8scTQHj4CQjFITqqmHq3DTUl6g8G8nMgiz/v82Fnb00pS9zcij1CppsNi3ocLg3V1ouhIDuj
	bRWpbsjFvKzzybf22sxZDSj6IEiXLe8jeDUSg2NMUolIqjJC0DYvwVhH5aQye0UMmAjLPvMvV72
	kIYq5PXUI4Pdm5E6CvFJ/9TNZ0TKbKncR17FU+yqJCAJzbeYh5HcDtLzLRV8mn+yTWmJpAgAltc
	ZzqQCP+j9thpK8HjvBfR85NTdeGSAt1ta97fFXFwMgWRec8EFW9LjJ0M7NkmX416JB8xtrxk4=
X-Received: by 2002:a05:6214:3015:b0:917:99d1:bda2 with SMTP id 6a1803df08f44-91b5d4bd16dmr23896676d6.8.1791559677476;
        Fri, 09 Oct 2026 08:27:57 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b55091fd4sm21019796d6.36.2026.10.09.08.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 08:27:57 -0700 (PDT)
Message-ID: <4a1dacc9-7642-48e4-b9e9-6a20c0e6aa43@riscstar.com>
Date: Fri, 9 Oct 2026 10:27:55 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: introduce
 toshiba,tc9564-clock.yaml
To: Jerome Brunet <jbrunet@baylibre.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
 kees@kernel.org, gustavoars@kernel.org, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, danielt@kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Thompson <daniel@riscstar.com>
References: <20261005230927.2000398-1-elder@riscstar.com>
 <20261005230927.2000398-2-elder@riscstar.com>
 <20261009-gifted-stylish-tortoise-95b14d@quoll>
 <b190fe58-364b-4b94-9cab-c5f81f874289@riscstar.com>
 <aafe2703-bfb8-43da-8472-b1dfa36fa8f9@kernel.org>
 <77dacc46-7294-47c8-899a-fd56b6a2af55@riscstar.com>
 <1jcxtjos65.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <1jcxtjos65.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/26 9:38 AM, Jerome Brunet wrote:
> On ven. 09 oct. 2026 at 09:23, Alex Elder <elder@riscstar.com> wrote:
> 
>> On 10/9/26 8:56 AM, Krzysztof Kozlowski wrote:
>>> On 09/10/2026 15:44, Alex Elder wrote:
>>>> On 10/9/26 4:31 AM, Krzysztof Kozlowski wrote:
>>>>> On Mon, Oct 05, 2026 at 06:09:24PM -0500, Alex Elder wrote:
>>>>>> Define the binding for the clock controller functionality present in
>>>>>> the Toshiba TC9564 SoC.
>>>>>>
>>>>>> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
>>>>>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>>>>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>
>> . . .
>>
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    const: toshiba,tc9564-clock
>>>>>> +
>>>>>> +  toshiba,config-syscon:
>>>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>>>> +    description:
>>>>>> +      Phandle for the configuration space system controller.
>>>>>
>>>>> I do not see my previous comment addressed - you have no resources here,
>>>>> so this belongs to the parent. You responded something about pci-ep, but
>>>>> the parent is not pci-ep. Open your code:
>>>>> https://lore.kernel.org/lkml/20260918165234.687224-5-elder@riscstar.com/
>>>>>
>>>>> I clearly see code like:
>>>>>      syscon {
>>>>>        clock@ {
>>>>>        };
>>>>>      };
>>>>>
>>>>> so I do not understand what pci-ep has anything to do here.
>>>>
>>>> What I have now (about to send) looks like this:
>>>>
>>>>        syscon@0 {
>>>>            compatible = "syscon", "simple-mfd";
>>>>            reg = <0x0 0x2000>;
>>>>
>>>>            clock {
>>>>                compatible = "toshiba,tc9564-clock";
>>>>                #clock-cells = <1>;
>>>>            };
>>>>        };
>>>>
>>>> A reset node will also go inside the syscon, so there is another
>>>> function for that MFD.
>>>>
>>>> The regmap belongs to the parent, and is looked up this way:
>>>>
>>>>        regmap = syscon_node_to_regmap(dev_of_node(dev->parent));
>>>
>>> That's driver code, so irrelevant. So how does this solve my comment
>>> from v1?
>>
>> I'm trying Krzysztof.
>>
>> The clock controller uses two registers, 0x1004 and 0x100c,
>> to manage whether a set of clock signals are enabled or not.
>> (The reset controller uses two adjacent registers, 0x1008
>> and 0x1010, to manage whether a set of reset signals are
>> asserted or not.)
>>
>> You said "no resources except a small address space" and I
>> guess it's not clear to me what size is "big enough" to
>> warrant representing something as a separate device.
>>
>> *One* of the managed clocks is a 25 MHz clock, exposed
>> through a pin on the SoC.  That one clock signal is
>> therefore usable by the platform (although on the RB3gen2
>> it's not used).
>>
>> Rather than expose the register addresses in the clock
>> node, a syscon is defined, covering 8 KB, and the actual
>> offsets used are just defined in the clock and reset
>> driver source code.
>>
>> If that's not the right thing to do, please say that.
>>
>>>>> What's more, I still do not see any usage of these clocks outside. And I
>>>>> still did not receive actual answers (or I missed them) how these clocks
>>>>> are routed OUTSIDE of the connector. You said for example:
>>>>> "Ultimately the TC9564 SoC has a single 25 MHz input clock,"
>> . . .
>>
>>>> The single exposed clock *might* justify presenting the
>>>> clock controller device in devicetree.  There are also
>>>> resets exposed externally via GPIOs, and these control
>>>> external entities (PHYs).
>>>
>>> I cannot find any of these exposed. Please point me to DTS code showing
>>> this.
>>
>> It is not used by this platform, but is available for other
>> platforms to use.  Its name is "REFCLKO" and is exposed on
>> ball C17 of the SoC, if a platform designer decided to use it.
>>
>> I only mention its existence as a reason to justify defining
>> the clock as a separate device, but I realize you are arguing
>> that I should do it somehow differently.
>>
>> 					-Alex
> 
> While on the topic of description, I'm little bit concerned that this
> controller does not any input ? Does it have an on-board oscillator
> somehow ?

No, it has an external fixed 25 MHz input, and this is a good
point, that should be represented.

> None of the clocks described in your driver take a parent from what I
> can see. It is as if the clocks of this device are generated out of thin
> air. Is it really how this works ?

No, you're right to point this out.  Thank you.

					-Alex
>>>
>>> Best regards,
>>> Krzysztof
>>
> 

