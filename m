Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893152;
	b=cEV4l8lrj+7TcYe3lcDrOMGHyAVzrBed85rtVBrc0xFUfIX0sDsidED7AwDY76Wzc/gq
	 VH/xXZbld2/jNYNid+nuNEgcTZD9g06VIvqxEoZipbKFgEkN3WrVXDcNLiJyyKbY6M6p0
	 G1uBl5Ff8+N7atbFAMtLHPXF08Vm5R+NP/+KL5GXxxpDdIqPHWZbOaDWNteMxlIhE67po
	 V4lJmnhBZMzjz/8AgM3IIpbU4kD2ZwbjE27nC22cCN9bSoHPRG/H9ScS8dYp7sKHLBobQ
	 xKYeJ7hzdMYEEcLy70SkJlP0pl0pKcyW3AmBPraEAclKWzhlBocNzmlhOj7vHNoTU8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Z5K5hANiP4hKvDWgB+1UuOsMTO32b8ekKek1eVxjOKw=;
	b=qnmzE/P0rAoHjdJNn8LxkOzW/WioZXCIu+bM/K9Rw+EPaqV0AfS5W78ClHaOaVTk4qWy
	 cr/ip9OxCYuvyfmO1ua948nC0AiycaErrm/sE6Gga4Eypu1GJ1TY3kecNzVWozLo7Eba2
	 Jl46dlgjCJRECyTZiEZnuhcbICHbcNo6oB93BiSOQAFzhP3nU79VjO7Tqzj3WX0lsE8zP
	 AkyOET0JqoAwHqkHtRiWDMl0OJI7OpAxSi+nHsmLisjnlVQLiWCPIL/g4i8gGPwCL4oeG
	 aKtuFAHuW/7jKqZk2C0Hp8S8PV8h/D037ok3aMdUyyYq5sNEL8JoJmdOfxP+46omMBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="NAJ6/dW1";
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A3E606EE96
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 15:39:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59A3E606EE96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NAJ6/dW1
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be4bed05b5so171229e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 07:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793893150; x=1794497950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z5K5hANiP4hKvDWgB+1UuOsMTO32b8ekKek1eVxjOKw=;
        b=NAJ6/dW1nNAVv5R+uX3W5IJtd67R+F0lgLEmD9I0ASfgwmXwO68uagcQFee1bXpMzX
         /6K6Wiz1xN7GQobFBDvwjYth98PaWzz2StfLEijXVxgd0ai01lNQduJdItoH0rY7mNOM
         Z4mrBiVTJmVQ1bhYdDEbWXIJ66Owovkmmi0H8qeuN8Y0ZrXJymDGgS7Wt3tFcfVO7Mn/
         ky/qEi9xlbfRbqU2rEMwa0pGjc68SLAfpjgpemuUG99osK0OuczkdeMv5ejwGqCOPivU
         my88SK+ooURsBq+1kLvPZxDAvSnQw302cdQcqHytJ8DqambTc5TMyfuunxoXIS97/8Xs
         RekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893150; x=1794497950;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z5K5hANiP4hKvDWgB+1UuOsMTO32b8ekKek1eVxjOKw=;
        b=SYzVAUwL5mlMmvLMvkdUKj4ZfmPVL67UxO0qwFoGWpqKvyyEQ9TH6N795BYYkczhj6
         ugBDRHAhj8W7DoY+sXQ7R+rFqRO/SfbkKhV94XMmenXlvHEtr5oPeKvL86oV2nEf/Zxd
         DdY/o11jSLcQKPQrFdMTyEa0paVmY58Db65YN99SUu01bRIW+aAHnRyzB8RSHoMuhK2W
         w60H9G1L8h9OiiH2zZq8tvPVnQjD4HMK7+EPtsuag69Jj900Q8pVEkMDlKLomTG2VA+W
         2YSeWytifnNqzZ8N7hyVmA6SzsDm7CqqGYApAJZFn0qmPl9pwIlmx9mj+uHJrYdRxYHL
         B90Q==
X-Forwarded-Encrypted: i=1; AKwUvBx0mSeZaZCdACxfLAmIasrgk9/NZGsUT337so8ApNti3fLv1WSfeOskpyca7eugLcS+2T0nO/CWeivemCpP@vger.kernel.org
X-Gm-Message-State: APuU4Z9I/CQpTZvStvdrQfvX5ld5HQ5j/rzpZ6IN/5DNgdIKgg6cyGD4
	/Id7uhowoLSB3F2tH8ISWzK3eUh9W4rpJgWrMlcusmt2Nf5dKtCmY3D5HpR/uQWcPEo=
X-Gm-Gg: AYBFou3eDCZM/fgSv/XM4GUXAu6qwYlvEWgo/KVOmGkAneLMwPrIxHyYeaAGy1yNFhq
	AJptqB59HfFjUhuvPL7pjZHAyKV+3dSAAZ1l0Ejd6bFbdQ1tAVgcbaR2U27CbYw/HCnX/rM0K5u
	ixtrRs+pySnPvH3Wd7XRtOQ5piNWoC5N6PCtnIBe9kw/Mbfw3NCQ8x+WbJQ+z2wOmxDBU9WdBg7
	2cRKASARkwqkWXM0+4EApwJiUe/Kx04D4rT4CSjmRsWyn+i7JLANrGsMplf0XmiDLEDy2m9XziI
	CTIebHF9PkxSzrnVfaharu1LzP06CaQs6/E3HvEefdJMsstgO9YMvo0bcMezTzO2tC6cgHX2s7Z
	0XutaO4HUts74bZlDg9stve8HqwykoNWDoq6cqVR3Hrw1VP4+sqM1XhP3p3Qx+Vjydl9yrTdh2T
	W6KpsW85TlpQMwyiPaD/pFoX/z4HkjAEX5csruqkBcX8CuZiGZGro5zI/adNc9qvf43sqa5fBpP
	dnIHG4nuOF/a/3BdFXC2140fb0j5ip0fLnFRaNotYhy5RBlwmmrQpm4wN8lYz630Zx4tE3El4my
	vuUUFqMJndUj3pUap/aXAGsUnd6wv5PjJT2b0eflFJY/u5rRgLqngZ21nybiMxIuBBZrcRRFXiI
	UaCGnLna2bQpZvqyUuJw1R5Tvv00=
X-Received: by 2002:a05:6512:4041:b0:5bf:a48b:7807 with SMTP id 2adb3069b0e04-5bfd952024bmr6876236e87.1.1793893150208;
        Thu, 05 Nov 2026 07:39:10 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff9a660b0sm485831e87.11.2026.11.05.07.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:39:09 -0800 (PST)
Message-ID: <4d656385-fd3b-426d-b326-b1d20ba1e2d7@linaro.org>
Date: Thu, 5 Nov 2026 17:39:09 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-1-fcb619fc7319@oss.qualcomm.com>
 <20261104-real-nebulous-ostrich-017e92@quoll>
 <72064a9a-1b2e-4c24-99e2-2cc15a8dd7f1@oss.qualcomm.com>
 <a2d3190f-bfd1-4548-aba9-a186cfea878b@kernel.org>
 <c5af7192-c923-4fbc-bbfc-7f03e310fddb@oss.qualcomm.com>
 <fc9acaf2-f214-434e-bbe1-88e8e1af7683@kernel.org>
 <539842db-c672-4549-b861-4a6f3be47556@oss.qualcomm.com>
 <d586b7b3-675d-48a8-b0d4-564e571ef69f@kernel.org>
 <CAFEp6-25QrLAF=-KgGJ-rC9pDpGa2YgoQAMKxU-FoByu2CJpMw@mail.gmail.com>
 <1db9bf48-01d8-44fe-8dd2-7a3c84ecc556@kernel.org>
 <CAFEp6-1fSPP41cVFmu8=0z2xibDpHuH5Lxrw7W_rvnt+Fw9EpA@mail.gmail.com>
 <62fba00d-831c-44cc-8d3e-083a95abfbe8@kernel.org>
 <CAFEp6-2_opRq3pj6S=2nDFxXBv0waeyGBKSxp3t8OOe6vvKcoQ@mail.gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <CAFEp6-2_opRq3pj6S=2nDFxXBv0waeyGBKSxp3t8OOe6vvKcoQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/5/26 16:01, Loic Poulain wrote:
> On Thu, Nov 5, 2026 at 2:21 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 05/11/2026 13:04, Loic Poulain wrote:
>>> On Thu, Nov 5, 2026 at 11:45 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>
>>>> On 05/11/2026 10:53, Loic Poulain wrote:
>>>>> So some chipsets share the same IP blocks, with some block/phy
>>>>> instances disabled. As a result, we need to decide whether we're
>>>>> numbering based on active instances or on the actual hardware instance
>>>>> index/offset. If we use active-instance numbering, then yes, it should
>>>>> be @2 (CSIPHY4 being the third active instance). Alternatively, if the
>>>>> port numbering is intended to reflect the hardware instance offset,
>>>>> matching the register prop, then @4 would be more appropriate. It also
>>>>> has the advantage of directly identifying the underlying hardware
>>>>> instance, without requiring any additional driver-side mapping. In any
>>>>> case, @3 is incorrect.
>>>>>
>>>>> That said, since the bindings have already been merged in its current
>>>>> form, we'll need to preserve backward compatibility when addressing
>>>>> this.
>>>>
>>>> This is the input port to camss, so how is it called in camss, not the
>>>> csi phy?
>>>
>>> The CSIPHYs are connected to the CAMSS input ports, which can then be
>>> multiplexed and routed to different CSIDs. The mux identifies its PHY
>>> inputs using the hardware PHY IDs, so the CSIPHY4 is identified as the
>>> CAMSS PHY4 input. In this configuration, PHY2 and PHY3 inputs are not
>>> connected.
>>
>> I could not find that information in Glymur HPG, but maybe I looked
>> wrong. CSID Wrapper lists CSID 0-2, not 0, 1 and 4, but again maybe I am
>> looking at wrong device description/interface...
> 
> Yes, there are three CSIDs (CSID0-2) and two CSID_LITEs
> (CSID_LITE0-1). These blocks select the PHY source to be routed by
> programming their PHY ID (PHY ID = PHY index + 1), as defined by the
> PHY_NUM_SEL field in CSI2_RX_CFG0.
> 
> If the CAMSS port ID matches the PHY index, the port ID can be used
> directly as a routing reference, which keeps the implementation
> straightforward.
> 
> Alternatively, exposing logical port IDs such as { 0, 1, 2 } also
> makes sense. In that case, the driver would simply maintain an
> internal mapping table, for example mapping DT/logical ports { 0, 1, 2
> } to PHY indices { 0, 1, 4 }. As long as we establish and document the
> convention, either approach should work fine.
> 
> Today, the Glymur bindings define DT ports { 0, 1, 3 } to map to PHY
> indices { 0, 1, 4 }. One could argue that this is already an
> established convention, as it is documented in the bindings. However,
> it is somewhat confusing.
> 

I believe it should be fine to have incontiguous port indices, because
there is no need to link unused phys to CAMSS on any particular board,
therefore there will be unavoidable "holes", and this can be set right
in the documentation of CSIPHY to CAMSS connection.

-- 
Best wishes,
Vladimir
