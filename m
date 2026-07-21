Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85415367293
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640914; cv=none; b=HBoKIVXsyv6TMEGV6kOJMVHxY87ujw73fWtJ1zeJGuJepqochOWp2rkVqFZFtbhM6+60hgmmk4Ql9py9U0tqM87weZc0uzq0+jVETnbMtlgsuH+xWPYbJeVJoNzxY0MttTODMVn0B7IAXw7JcKNCupBubq7Tw0CpYTlqa+z6l4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640914; c=relaxed/simple;
	bh=a782tGijlNjR0oP5USP7fhxgWawGH8U5duyNoKInPNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dwiRXDN/eDZ6QiRA0Fb84m0jMnHAu1BXTItzxEbVyqrtydQixQuw4/GWSnQ2rEBvJnFQz+6EaEaiCHzp6g6hcLSXenwZRT6pCu/vhsWBcXtPfraEY0FyI317ZFt3YLg+yZ8xsNHzqLaenHB1n40B4sxlP5+NAKSf8DADzqQ9lhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yBFQ3rMY; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yBFQ3rMY"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aeb99bc721so1232105e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 06:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784640910; x=1785245710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XBEoUQBhQJegFsZb7/UMDUnu+Fzmn8HXOU/ouOdSNmw=;
        b=yBFQ3rMYXrLzIaa1ePdLUY71Czf6KTyrKw5EvuJcuREXLLA86ItJqPfmO8DrRIqYMQ
         jWQsxAuxJHAjOsKJrOz3BlYxTx6FPr0V+udxwZSlVlHOAIUCMYzEkFAnxbrBdSuEX2S/
         nDC8EA31prIuyeSmOM40sxWlVc98Gu6Xe0hAnMt5WvcxjHDVrkcBPFjKWsuCcHDEt565
         L0NInvS3Ry3H3txA2n/vWjKM7pJKpIdQHwNdz7MrvbKiM6rwqS43gzk6Kmv4aeNGbbBC
         5uOPTrc/oAWz67jWBvY4CTnKhoE/kY4shzf+DVxKMaPUhcyQ+haYjLrNChNnyo2Uo3oH
         M9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640910; x=1785245710;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XBEoUQBhQJegFsZb7/UMDUnu+Fzmn8HXOU/ouOdSNmw=;
        b=k6PwTUQfOYZhXgIHStrCLnx+2eNdw+TwMzuVfg1Cf6GrepvjT4xTnFy6gR3JndPAb1
         3p5D1dK9n1zZOsVI/9aET03IGhlGJjxtq38n9M3xX0tsQhvS9KFZSOYRsm/FzHFNp8rx
         BrhTg7znnTxQAeTeoWv03DI6jSbZvGUuEtgzDP3IIUZNzVj1C0oknA6vp6rv9ZfZd3S4
         lR6zI/XwZzuoEp8VgR6KmgxwQ6g8nEUJtI3vs1wC9SNEatbKdu2MGOsR8S7z4ayo+Hoq
         CvXaN0+hDEqiNbkxRtK5F39be/HqKYRI35bvk0Ny4KVQ+/iwhILtsDFOgeSTRKiPywD2
         Y2iw==
X-Gm-Message-State: AOJu0Yy+j1c2dbPmwFas1M+Nw1N3TALzcocKdlb7EMDK08bSXtcTQU53
	br5EgXorXt3nvhVI9NLv+HiDIMEsmgB+nsuscn91KzL0FNYCZrCwCrXMxFTHp7eP2EQ=
X-Gm-Gg: AR+sD12rCBZd01VnC9uw1oTwOo8Xw2fn7In1uobendP0DeD3M9BP+G2ArA22BD0b+uz
	FhFd7KofhpPdO8wCiOhqk6Bbe7AmH9C5iCbW8r1kxf3N/kUgisdqnoyQj1oH5ZSVVbRPspzmCvC
	KgOb31zpYXikSewEf93eaaPit1ATGfSyrCmtY3v3HaJ++omGT4e2EuqOm8AOXuXqp5HyKlP3DsB
	WhJmgP266+WZLw8GizJqGvU95bL1PdFNM6R+aYc1qDEb1F2ZeIqavAK1e7YBqzVq/Fk/lhirlxR
	bjqaMv8EoHPZfIt9iYDNA+GQ4LDMwB7q4gN2MOV5kMR5zGXFpVgpMH/1d3tyhyohqRNSkIadg9v
	EEz/FW4QQTXen3Y68dWvZ6/EiQG8ODKTYK74eeGtPY2QDUkstmx4yd7GQBElglO5I/o+ZzcrZ6u
	3H/ATs3cMTg6lEe+saWcaPEfUItIkcCB/kA/elBvPHJkUDq28rs+1/uceI
X-Received: by 2002:a05:6512:b93:b0:5b1:5b9e:8de7 with SMTP id 2adb3069b0e04-5b2a49fca14mr515212e87.2.1784640910132;
        Tue, 21 Jul 2026 06:35:10 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a5588e11sm426572e87.42.2026.07.21.06.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 06:35:09 -0700 (PDT)
Message-ID: <864c13a0-a52c-43f4-9d94-646bf66ba31a@linaro.org>
Date: Tue, 21 Jul 2026 16:35:08 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
To: Bryan O'Donoghue <bod@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260720-x1e-csi2-phy-v13-0-160c31958863@linaro.org>
 <20260720-x1e-csi2-phy-v13-1-160c31958863@linaro.org>
 <LyWJAb2qKsAFTMHNJUce9VqoqbkFKUQanb6z8ziA63RYZ1P9jj1XpA83uGPvz9m4QnWvEjJFK8dGD_8EtioHVQ==@protonmail.internalid>
 <0da6d314-bfa9-493a-bcc6-8c3b75751d0c@linaro.org>
 <88ae6662-cb85-4e3a-bbb5-1b536348df34@kernel.org>
 <_t1jiMTX3iIXhUkTDz0Cbh_uZhdUK_Y8vlIwxt1VNRbuKuRnpVCWabal-b4AuFrVaKrDnQSFOWtDn6-VCbS3DA==@protonmail.internalid>
 <345ca98e-09f6-4965-87bb-e64dac096498@linaro.org>
 <c236cf94-a775-4158-88db-9a337c7fa862@kernel.org>
 <e8bc8ade-d699-497e-8c4a-fbdc03fcc549@linaro.org>
 <wzsAes-UM4_r8scRyy_yhd39ZdxvT8W9VroVPOGWABLsw7MqR05o_z2MwhgiC1gTSBgfVHpXWADbsqoIOsR0Uw==@protonmail.internalid>
 <ec3d6035-d4de-4e38-8c72-b29a04b263ae@linaro.org>
 <1f128571-ed46-4a60-9594-74fdd5f440d0@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <1f128571-ed46-4a60-9594-74fdd5f440d0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/21/26 16:19, Bryan O'Donoghue wrote:
> On 21/07/2026 12:24, Bryan O'Donoghue wrote:
>> On 21/07/2026 12:05, Vladimir Zapolskiy wrote:
>>> On 7/21/26 13:47, Bryan O'Donoghue wrote:
>>>> On 21/07/2026 10:56, Vladimir Zapolskiy wrote:
>>>>> On 7/21/26 12:39, Bryan O'Donoghue wrote:
>>>>>> On 21/07/2026 09:17, Vladimir Zapolskiy wrote:
>>>>>>>> +  "#phy-cells":
>>>>>>>> +    const: 1
>>>>>>>> +    description:
>>>>>>>> +      The single cell specifies the PHY operating mode.
>>>>>>> This has been reported before, #phy-cells shall be 0, the operation
>>>>>>> mode is selected by bus-type of endpoints as it is described in
>>>>>>> video-interfaces.yaml
>>>>>>>
>>>>>>> Two competing values are redundant and it opens a door to a wrong
>>>>>>> hardware description, the technical discussion has not been started
>>>>>>> yet.
>>>>>> So as I said before, I'm following Rob Herring's input on this and
>>>>>> Krzysztof has given RB for this binding. At this stage, I don't see
>>>>>> scope to change it.
>>>>>>
>>>>>> Adding endpoints was already a compromise to address your feedback,
>>>>>> which I hoped would bring you on board with the design.
>>>>> That's my comment dated March 27, 2026, and it says moving phy type
>>>>> from phy cell to the endpoint property excludes the need to set any
>>>>> phy cells:
>>>>>
>>>>> https://lore.kernel.org/linux-arm-msm/e37ce438-12c7-462d-
>>>>> b2bc-1351be62b806@linaro.org/
>>>>>
>>>>> The technical comment is left unresponded so far since then.
>>>>>
>>>>> Since there is no expected phy cells to get on consumer's side, and
>>>>> since there is another link between CSIPHY and CSID described in
>>>>> video-interfaces.yaml, any kind of dependency of this IP on phy can
>>>>> be just removed, which serves the purpose of hardware description
>>>>> simplification.
>>>>
>>>> Rob's v1 feedback was consumer-decides-mode via the cell; Krzysztof has
>>>> R-b'd the binding with cells=1.
>>>
>>> Unfortunately this is not a technical discussion to move forward
>>> a better hardware description.
>>>
>>>> I'm happy to lock down this binding as-is on that basis.
>>>>
>>>> Are you arguing about phy-cells or are you actually arguing the entire
>>>> instantiation of Qualcomm MIPI CSI2 as a standalone generic driver in
>>>> drivers/phy ? Its not the same debate at all.
>>>
>>> So far I don't review the driver, only CSIPHY IP hardware description.
>>>
>>> In the current version of the hardware description one may find that
>>> the exploited 'video-intefaces' interface completely covers the 'phys'
>>> interface between CSIPHY and CSID, quite probably both are not needed
>>> at the same time, and the simpler 'phys' can be removed without any
>>> losses. But if it is kept, then its cell value is anyway redundant.
>>>
>>>> As the CAMSS maintainer, I'm fully against adding more inline monolithic
>>>> CSIPHY init sequences. That could be represented as a separate
>>>> linux-media driver but, then that implies that _all_ upstream CSIPHY
>>>> drivers in drivers/phy are wrong, and I just don't accept that.
>>>
>>> Other two drivers are different and should be excluded as good
>>> references, both of them links exactly one sensor to exactly one
>>> CSI-2 decoder, it's not the case here. Also one of these two drivers
>>> has no upstream users.
>>>
>>>> The bindings have DT maintainer RB, and the driver has Qcom engineer
>>>> tested-by, review-by.
>>>>
>>>> Vinod, Kishon - Again, I'd request this merges as-is.
>>>>
>>>
>>
>> The graph and phys are different layers, endpoints describe the
>> media topology, phys is how CSID controls the PHY through the PHY
>> framework (phy_get/configure/power_on).
>>
>> Removing phys doesn't simplify the description, it removes the control
>> interface which is the monolith again.
>>
>> We have multiple examples of this model upstream, cdns-dphy-rx +
>> ti-csi2rx in-tree, with users.
>>
>> I'm still kicking this up to Vinod, Kishon, request stands.
>>
>> Multiple DT and driver users are RB/Tested-by on the schema and driver,
>> lots of other work is gated.
>>
>> It is time to merge.
>>
>> Please adjudicate.
>>
>> ---
>> bod
> 
> Had a brief discussion with Vlad, Neil and Vinod
> 
> Resolution:
> 
> - phys = <> retained

It should suffice as an optional property, moreover any kind of
phy interface usage is not supposed to be done from CSID driver.

> - phy-cells = <0>
> - bus-type from the media-controller
>     Already specified with camss still aligns with Rob's declaration
>     "the consumer defines the mode" so I'm comfortable with this
>     compromise position.
>     This will still facilitate CPHY work/mode-selection via
>     phy_ops->configure() with how to define the CPHY part TBD.

As it was discussed there should be no phy specific interfaces
between this phy driver and CAMSS driver.

> - data-lanes = <0 1 2 3> valid

Would be nice to get an ack from linux-media maintainers on it.

> - MAX_LANES 8 instead of MAX_DATA_LANES 7

Since 'data-lanes' value follows some register bits and not
the actual PCB lanes as in video-intefaces.yaml, this shall be
explicitly described in the CSIPHY dt binding documentation.

> - v14 with these changes shortly.
> 

-- 
Best wishes,
Vladimir
