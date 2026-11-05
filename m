Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873723;
	b=ZzbmcnpaSlVQzZZ9DBaQ7tc9daaIOEFmsh6k/OQQV5+VoTVtQZVdj0MO6nfrBJCrBvj3
	 wY9nLpQ9P4VPLkyO3fr6mZ2BDtx8V9vufxFUTAQ/ZdYmxiy95zTqWWcp7baxjriFBHIAC
	 devOWksd8trXbqEOSZdmfYWChy5/AvOUBkEvS0cAwnDrxM+XzsG5R0kYnkaV9lQ2S2FMZ
	 OTV3lCuQ4Lu+NpXC35ZpmCZ7R2R8suZXA5Xsw8b9F2+aqQmtRhTqcq65CiN16GOXMKzjk
	 rqOecIreaPDRliN29AgOtlGIgn8yWdXF04Fh5oftY05XOf6p5qxEqkruYLZRK34KBZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=urNqgcOG/VrzbWXCcGLN+pX0aRbGOhwKNVrteIsGA4Y=;
	b=UJwHa9oVNGVOdjAEAAQk/kPdbyetHfIJx4bSjoyFI8mFkzbMEsfgY4sS9c7vbpBdm2nu
	 6iEq4dyh4u/set0cmn0HKZePf3rbZLikXagTamaOSTSgA0V/AxCxyjGxj/Xk1nHMIsEgV
	 noodkDlV+xMwNZoYwmSOScXDE1i7Y1x+kXQJ09fFAy42fr9Kh8UWBK/z6ZOHuHWTs1Z7s
	 Nxiaqjujy3TZGKtIwfX0RCZgGt/AK0y1Z8hKz1ERrU8GsyjiI2R82RrtiLofev10wUGLu
	 HPhh0ptVmHlcpGgbIlpHsxqKWqPb5DGyfPegHwxh9FBL2axm61OxP/O1q0ccgCrzYqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="kGP5Oc/f";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1C0606A33D
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 10:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC1C0606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kGP5Oc/f
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48df54150dfso1149862f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 02:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793873721; x=1794478521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=urNqgcOG/VrzbWXCcGLN+pX0aRbGOhwKNVrteIsGA4Y=;
        b=kGP5Oc/f5yju5LJSuRExjVZcM3fGAthALokpKF7wjscDvjMNn0rxBbVTPjItD0ifCM
         SWs8FiuDDQqKbzMRohVKFH+KyKwjAH84rvghv0SlQNzYY7Bu8GTVcY0tU7M8jSRjRZ6x
         MWxTgsr+utuo9o6ALgpRsA2CIhaVoW/1x+OBjbAJwG5KIsVBvsPCrlRG1j1gOFcF+5Lv
         uFCdHQ2zaja1wh9+wir2csDE+C8xLpQCwj78HpI+GXA6aJtAs7Ac6+dizVO//Qo3jOGE
         8OW15ggEG9EtMsZ0wSj6DA4FDlvw1KelqMblNjFzUGmpKOE2vEEm5ywFRMau8WRym8+V
         E/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873721; x=1794478521;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=urNqgcOG/VrzbWXCcGLN+pX0aRbGOhwKNVrteIsGA4Y=;
        b=MopI5o4+UtTcVJTO+0dvK7uftVjD155X4t1K5gL3C0g/9u+XHCGpr7ZLS7X+5kfAUv
         WcMAIlcmiN09zGFz5rQlPUtgSPi2dZHBJUV91UTmZyvQYMIvjhrevFJl3PjguY1epkuk
         mSgJvinPn1B6nH9YVSrEkquhDufg/UpjL1gXqQTc6WFAv7oM5z7dEhCRTYM7YPSoovoN
         AB2nMkKuK8SLha0ZW6nUD4h69iOte6K3KMtItyG8KXdWawGoeNNFh+FF6k/rNIk6QGCa
         zbs69dM2G7IkgfbjFOxZKx0761Nje+Pg1CYNVfvWltm+TMS2xdhikwrmRkyedBPz5/XJ
         i6Ew==
X-Forwarded-Encrypted: i=1; AKwUvBx5H/RWqi5JztcWHc1NTOpN+tdyTI8/sr10lFI1AQ7cIKILDtEQ2E9dq0Vmj15E3zl+qGzpe1qD660EpkpC@vger.kernel.org
X-Gm-Message-State: APuU4Z8+d3xZNUQa37Vioba5wiwkPjpxYQpnVXGbJ5eBmgRSbSExW1rP
	x+BpDAK6T5QqTTqH2QYvpXYDBepnhYsYNNtQKeqxvo8luai3eDCPqO0QrcN0yzGieGM=
X-Gm-Gg: AYBFou0g1vSpI4PX2tHQLA5VbbEEH94zmxl/7BEMEjjP7AkgRJ3cK/rqUnG+4wOqAJb
	kmEN47zcjIQY+lwj8U89UZ+eutGt/DxbqqxjWMWCZ4lp1PbPHsWVMsscQMU2a2+H/4eROe0KAf7
	GmRpnz2d9que7Mm9Y0TU1a4oliXshLTOYr488VO4dRza29UAPzL21XjybOHnr1+oYK6ZoWAopI+
	XUhiQ1QablztChn9UGcsm6XsDUkoCXJnsPldAyCbFFlZd/vejxFZRq4E6hf36ePnMXgVxC9XwCX
	zDYEv66SaM5F0zkaqTtXlThOqKo1H3YLa7FHxqhMRVelfohKMN445nXfQZM01GwYlKsO6qqxU7E
	kKQgVg9bSNR2i79WBdhP1lbQNf03iB0QxZEtqU/UXnmZl2/X8gjpEq3xYBpffjF3VI6yhXBHAnI
	EKKLg/SLEVfhRka53S0yXMtCBo9tT+wrtovpTXCiPOae9hd2+a1tPyn62j8SHSXu9KT4qwr5RLI
	YCgBitLvna5EAiXOSDYqZ53zxWfJtKF8VCjqViw7y4AglW3UeK9O8c7wGT9QGeDNct8p1YqJ1ua
	FQstM79meOGf+nN1a8/RtyaCz81C20iRaz5MTu79
X-Received: by 2002:a05:6000:4282:b0:48f:e6cb:ed5a with SMTP id ffacd0b85a97d-48fe6cbf060mr10321901f8f.9.1793873720998;
        Thu, 05 Nov 2026 02:15:20 -0800 (PST)
Received: from [192.168.0.167] ([51.37.126.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea1811c4sm9108120f8f.3.2026.11.05.02.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:15:19 -0800 (PST)
Message-ID: <c75fcc12-a4b5-4e18-ad4b-6ba417baf299@linaro.org>
Date: Thu, 5 Nov 2026 10:15:17 +0000
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
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Suresh Vankadara <svankada@qti.qualcomm.com>,
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
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <CAFEp6-25QrLAF=-KgGJ-rC9pDpGa2YgoQAMKxU-FoByu2CJpMw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/11/2026 09:53, Loic Poulain wrote:
> On Thu, Nov 5, 2026 at 10:23 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 05/11/2026 10:18, Nihal Kumar Gupta wrote:
>>>
>>>
>>> On 05-11-2026 13:03, Krzysztof Kozlowski wrote:
>>>>>> What is the problem exactly you are solving?
>>>>>>
>>>>> The problem is that CSIPHY4 is connected to CAMSS interface 4, so the
>>>>> graph should describe it as port@4, not port@2.
>>>> Nothing like this is explained in commit msg.
>>>>
>>> I will update commit message to explain it better.
>>>
>>>>> The previous port@3 description only worked through the X1E80100 resource
>>>>> table indirection:
>>>>>
>>>>>    port@3 -> csiphy_res[3] -> .csiphy.id = 4 -> CSID selects CSIPHY4
>>>>>
>>>>> New standalone PHY path:
>>>>>    port@4 -> no csiphy_res[] lookup -> port number is id 4 -> CSID selects CSIPHY4
>>>> Then this breaks existing users, no? Anyway, what stops you from having
>>>> there proper mapping?
>>>>
>>> No existing upstream user should break here; this is still part of the Glymur
>>> CAMSS enablement.
>>>
>>> This follows the earlier discussion that CSIPHY4 should use the
>>> CAMSS-side interface index as its graph port number:
>>>
>>> https://lore.kernel.org/all/CAFEp6-23L+4+yzVxX815ZA2x1_tN8SpzL7ciNcb9b+gBT67AdQ@mail.gmail.com/
>>
>> Should use? Since when? Do you have DT maintainers ack on that?
>>
>>>
>>>> Did you find any existing practice of numbering ports logical numbering
>>>> in this device, but some other logic coming from datasheet? Where?
>>>>
>>>
>>> Glymur has only CSIPHY0, CSIPHY1 and CSIPHY4; CSIPHY2 and CSIPHY3 are not
>>> present on the SoC.
>>
>> Then CSIPHY4 is basically the third (so @2 counting from 0) input port,
>> no? Not fifth.
>>>
>>> Using port@2 for CSIPHY4 would require a Glymur-specific port-to-CSIPHY mapping.
>>> port@4 describes the CAMSS input directly and avoids introducing separate logical
>>> numbering for Glymur.
>>
>> Seems you opened a new can of worms, so this needs proper justification.
>> Again, do you see any recent preexisting DT review which would help to
>> convince me? I know I usually ask not to use poor existing code as
>> reason to do the same, but here I actually want to see proofs of current
>> accepted practice.
> 
> So some chipsets share the same IP blocks, with some block/phy
> instances disabled. As a result, we need to decide whether we're
> numbering based on active instances or on the actual hardware instance
> index/offset. If we use active-instance numbering, then yes, it should
> be @2 (CSIPHY4 being the third active instance). Alternatively, if the
> port numbering is intended to reflect the hardware instance offset,
> matching the register prop, then @4 would be more appropriate. It also
> has the advantage of directly identifying the underlying hardware
> instance, without requiring any additional driver-side mapping. In any
> case, @3 is incorrect.
> 
> That said, since the bindings have already been merged in its current
> form, we'll need to preserve backward compatibility when addressing
> this.
> 
> Regards,
> Loic

Without reading this long thread - Hamoa hardware IDs are {0, 1, 2, 4} 
so Glymur is either like that or not please check yourselves.

I think Nihal says Glymur as 2 and 3 missing so suggest hardware numbers 
scheme follows established Hamoa scheme.

---
bod
