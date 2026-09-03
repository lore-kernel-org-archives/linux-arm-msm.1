Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E534E8DF7
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 16:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788452223; cv=none; b=SJOZP07zWRUdswC4RxptIKaHRYtg0hVaQimH/aQgu34mllAVdzqxjGHxeMHzX0Pvyx7NHSixR1E/fbFHf4pVJh4azKUBNuRyjVXv75H8aCXLcZ53nAvSvoEBZ/t9Zeuv3xJgCVaCp+XsiGcDr9X4iJ2Hi3qI+jUPCwbu+n+8G5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788452223; c=relaxed/simple;
	bh=oXOvVfQx48pkiCnSTyly0SxfeaW66Tond0/xVvTUv6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mkLvts7OYWvjxqBM4uQ9m1AiPJHMGg5J0HW0rkNEKflqwBBKh6VoxT9JcEAE08iIYc1fQ5SPDjeMLKm2JlXeyITNakGjG+IQ1xoBhk6mq2yiuvhzo1jzLAJyssrdN5Hgxr3XZ1dX7S8982KZP8bED2lNj1Oajjm1HF3mlwVMODw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AbYDgrBW; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AbYDgrBW"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a34f16714dso113021fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 09:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788452219; x=1789057019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=igQxfgp7/0QiUpGltOrm94v15geXiIvSoDekjF5iba4=;
        b=AbYDgrBWhJveGv6k3LlstrFXNjqiRzZkJweE1wsitx6tq2GeCujkPNZTR6O020WpW9
         z1NhDbuMYRCQnIAuKmt5VnOkrWMxKSU6D3jzNTt/X9mo2rtnHGW9XNOSY0JDu+me/ayO
         KPDRXn0CbEXmm8HThkzDUaQ6ZIdTbEdTB7RIWrZc1oLK7P3CNgb342OCoX/OdPlTQWA/
         PrKALKCrQ5QQ5xSJ1H1Lk0i5jkViW1rruXvl6NZCDQslMIVRM+vyA5+MCoLv4uzvCXWE
         HWRkLtLjD4F9QkSdHgEkw2OnfaQNuU4TJWUJNObLAAbpVvttmBrLe9SCHlUyECJm69SP
         sdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788452219; x=1789057019;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=igQxfgp7/0QiUpGltOrm94v15geXiIvSoDekjF5iba4=;
        b=abTWp4U1/twkJDBW+5IGcWoCpYEXOaNBjoBzhh8Yotub40sLm8rgI6ptI6QMx9ZxgY
         vyqhHAkk7EhLgfTpae/DQ64iN7bP6ErcXASSIN2pW2kWW00YY0sKdtCU51zWLbyby5zC
         NlA76IvipGCsHVDFq6m3OOXeh56NwtDuWe7MzhcSt9kSlS9yuC8BjY+GEm6fsx7jXs38
         2yQsI5I99ZsbfUz9ve6aDdtFYAi/sMaWlh39tIMmXV8NzPw5GbF6Ii6yXGDcDGZP0EOA
         C5cOdMCU/hpLmMsvlcntX0mz/ssgXB6GszBfSFdjfcdltuwGQ36AbZu5NZVG2ag5Sydw
         Bwww==
X-Gm-Message-State: AFuF++mqgSIQy5tbg/ICKVBnrFS0DxRbHDNvunXumQP2e1S2B/Lk4+12
	hbEGe/0pp4VXlOPhhKC3BRZ9WDgOt2QcFLXzfd0v1eGDSO2fSxuljSC4UqW9Nwb2CQ0=
X-Gm-Gg: AYBFou0zc8RzIT/KWufF1+ptYwINkJIYMUHZDJJAlH6RLV0C1ZGFD5I7GDmp68Qq3TP
	VjZq407PPYT9qB1/qndabEIPr6esg02eqnEYcNJbCW18G3JnwKRa66+zMz0QUy+AVdZXypVBW/H
	AaUnY3kha0TyvCGQqyFpYj42rNV45YaBJLrb2bVCmfpJAWOHfv2nA5XL53z6YobpiePs4ltaJTj
	w9jn/Q0NDufQAYClxecLXMqz+8G7hUFgj6JYFgwDi079U0zqo3MsivT2JXEUVILlxRJaMmHMXp5
	U/m5klH4mkeXPM4SjFCzKtp6HH6cmj0knYd0glik+oq0gHcJiz6Bq1guPIvr2OD7LNNQkhDHPWU
	Gb8dR+APktPkJ6R1yBcZf+51PTLBCexn5TfUMbHMcq+ytZGjW0X88VFbUkI4EjVAFtM4LJfgmhN
	lQjZ6/QOBd+gC0Jduzl+h4eZtNHo/QITsADfWObEmFknn09eL/LmZhDnZ22u6BHzDVGWEThxMkQ
	ZrqUCveCR5rqadMAcj4iH3t/2XfKYoLbuTVOlCc4A6kZCcPzAjQcjo=
X-Received: by 2002:a2e:bcc3:0:b0:3a2:fc47:4c1f with SMTP id 38308e7fff4ca-3a34fcd002dmr15579741fa.1.1788452219071;
        Thu, 03 Sep 2026 09:16:59 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b606b0ebedsm1499193e87.5.2026.09.03.09.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 09:16:58 -0700 (PDT)
Message-ID: <65ef2024-4f5e-4df3-881c-50d5a72b655b@linaro.org>
Date: Thu, 3 Sep 2026 19:16:57 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
Content-Language: ru-RU
To: Bryan O'Donoghue <bod@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260901-x1e-csi2-phy-v16-0-dd863b929080@linaro.org>
 <20260901-x1e-csi2-phy-v16-1-dd863b929080@linaro.org>
 <RXmjC1LUSR46nHPlGyexr-0HTUa9z8BZY8CabY4J7P4YM9_ntzOucrOnanQBTZlD1jH69cHJEmPb_Xw7dRuqKA==@protonmail.internalid>
 <9b0ac659-999a-4caa-8578-f34a39a67e4f@linaro.org>
 <faa755f7-e5cc-46c0-b838-8d015a481edb@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <faa755f7-e5cc-46c0-b838-8d015a481edb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/26 15:32, Bryan O'Donoghue wrote:
> On 03/09/2026 12:53, Vladimir Zapolskiy wrote:
>> On 9/1/26 23:15, Bryan O'Donoghue wrote:
>>> Add a base schema for the MIPI CSI2 PHYs on Qualcomm SoCs. This PHY
>>> supports both DPHY and CPHY operation. A special mode of DPHY operation -
>>> called variously split-mode or combo-mode also allows for two sensors to be
>>> connected to one PHY.
>>>
>>> The submitted binding here describes the DPHY modes of operation only. CPHY
>>> is left to future work.
>>
>> Like I've said in v14 review, the statement above is incorrect, and it has
>> to be changed, for whatever reason it hasn't happened so far.
>>
>>    From https://lore.kernel.org/all/1e1bc17a-4c7a-4c08-b0c8-2a2ff31fe870@linaro.org/
> Well, I'm not trying to describe CPHY here so I'm not claiming it is
> adequately described.

The CSIPHY IP supports C-PHY bus type, and it should be represented in
the documentation.

Right in this presented change 'bus-type' property value can be either D-PHY
or C-PHY, so even if there is no intention to describe C-PHY, it's done.

> I'll reword this.
> 
>>>>> C-PHY bus type is also well described by this version of the bindings.
>>
>>> Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---
>>>     .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 222 +++++++++++++++++++++
>>>     1 file changed, 222 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>>> new file mode 100644
>>> index 0000000000000..17de0701eb103
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>>> @@ -0,0 +1,222 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm X1E80100 SoC CSI2 PHY
>>> +
>>> +maintainers:
>>> +  - Bryan O'Donoghue <bod@kernel.org>
>>> +
>>> +description:
>>> +  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI CSI2 sensors
>>> +  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and D-PHY
>>> +  modes.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: qcom,x1e80100-csi2-phy
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    maxItems: 3
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: core
>>> +      - const: timer
>>> +      - const: ahb
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  operating-points-v2: true
>>> +
>>> +  opp-table:
>>> +    type: object
>>> +
>>> +  power-domains:
>>> +    items:
>>> +      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
>>> +      - description: MMCX voltage rail
>>> +      - description: MXC or MXA voltage rail
>>> +
>>> +  power-domain-names:
>>> +    items:
>>> +      - const: top
>>> +      - const: mmcx
>>> +      - const: mx
>>> +
>>> +  vdda-0p9-supply:
>>> +    description: Phandle to a 0.9V regulator supply to a PHY.
>>> +
>>> +  vdda-1p2-supply:
>>> +    description: Phandle to 1.2V regulator supply to a PHY.
>>> +
>>> +  ports:
>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>> +
>>> +    properties:
>>> +      port@0:
>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>> +        description:
>>> +          Sensor input. Always present. A single sensor is described by a
>>> +          single endpoint with the clock lane at position 0 and one to four
>>> +          data lanes.
>>> +
>>> +          DPHY split mode, where two independent sensors share the same PHY,
>>> +          is described by two endpoints, each with its own clock lane position;
>>> +          endpoint@0 with clock-lanes = <0> and one or two data-lanes and
>>> +          endpoint@1 with clock-lanes = <3> and one data lane.
>>> +
>>> +        unevaluatedProperties: false
>>> +
>>> +        patternProperties:
>>> +          "^endpoint(@[01])?$":
>>> +            $ref: /schemas/media/video-interfaces.yaml#
>>> +            unevaluatedProperties: false
>>> +            properties:
>>> +              bus-type:
>>> +                enum:
>>> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
>>> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>>> +
>>> +              clock-lanes:
>>> +                maxItems: 1
>>> +
>>> +              data-lanes:
>>> +                minItems: 1
>>> +                maxItems: 4
>>> +                items:
>>> +                  minimum: 1
>>> +                  maximum: 4
>>> +                description:
>>> +                  Data lane positions following this endpoint's clock
>>> +                  lane. Positions are a per-port logical numbering, not
>>> +                  package pad or ball positions.
>>> +
>>> +            required:
>>> +              - bus-type
>>
>> A review comment given to v14 is still applicable, 'bus-type' property
>> should be set as optional with D-PHY mode fallback.
> 
> I believe you said "could" be optional in v14 but, if you actually
> _want_ it optional, I'll update this to reflect, np.

Sure, thank you.

>>
>>> +              - data-lanes
>>> +              - clock-lanes
>>
>> Here 'clock-lanes' is a truly optional proiperty since its value is
>> immutable in each endpoint, it should be removed from the list of
>> required properties.
> 
> Hmm.
> 
> I want to make sure clock-lanes is defined and set to the correct value.

It's not needed, the mutable properties make sense, the immutable ones
can be removed without any loss. The correctness of the propertly value
is checked by the driver in runtime.

> For example clock-lanes = <2> for split mode is wrong.

If there is a wrong value of 'clock-lanes' property given, the driver will
complain, because it knows the proper value.

And if there is no 'clock-lanes' property given, the driver knows the proper
value and it reuses it rightfully.

So, there is nothing got missed, if 'clock-lanes' becomes an optional
property, as I request. A comment in the documentation can be left though.

>>
>> Also 'clock-lanes' are not expected to be found in C-PHY bus type case.
> 
> Right so to both verify the property and not require it from CPHY I will
> make it required only for DPHY.

By making 'clock-lanes' optional both bus type cases will be well described.

For clarity, the property is not required for D-PHY bus type mode also,
please make it optional in the next version, thank you.

-- 
Best wishes,
Vladimir
