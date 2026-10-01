Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531363815D8
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 13:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790860704; cv=none; b=kqD+KMz814nACWffmnFklIxEqPbneFGO5hXCmf0R24U6WoYyxUPiLkoF7jmCUNIovKB22+IfPuUZ8mBkk8T9tc5P0fqlnd5APZlYCOPcQDEJ4obOCDMqw8k9w5cJc8ZXUH/Q7ah+RIMEk5yc+pY7W5TRKyvrQrP4a9EzQlKgk5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790860704; c=relaxed/simple;
	bh=9WLH9+Lg9mafi3RlCnOSyDHhnDNxTttruE8nd/FvIYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TrJDZNdLLhPwplGw7WW74KiO0LQHWBZBYDU6JdCrta49uEDiM122nxF9rzOb5MsU/0+NeHrjssua5rPXiY3NcWUlWWft74WVozrF1aOi4AwActd/wmWLUgcjZsl8WuybsDiIGyBLPz2G632xzkjEVQK1ao4xQ4BUhHvZ+9iMpMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Benfv2eI; arc=none smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Benfv2eI"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6ae19319854so2728801a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 06:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1790860700; x=1791465500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w6Ys2U4rK4qRXJ88N00bl2NDAdA3PBqSlYtGtuTGakU=;
        b=Benfv2eIvxCQLdwIoUdlKjZFoXqOIgCoFz5BK3CzSFWKVo/JtER14ZtCKiqFIFRiEc
         7qb7wITWfAeMlFaI6VPnl3R3mNOhxs542ujrjDIEDa5HJKO7cxX+UnigI/6+YLCYnnHA
         aHCkMSnRIpL78cIIVa9+ucWjf0zWKgc/kj5r+vNJ+tVlxbi7UTqcKB8wKRB8XeN968zx
         0+acpKAlk2AvubhDfKIIV1llbgB35wDkEP4ddge/Mux+n3wHnDO6df7iq45o5H50hxvW
         e2tk4poyfQyCIrtBFrIfV4iyUraccbDkRu+vAeoo7LB7sG/cCNT/hSaJkg2jXsRlOX3D
         VcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790860700; x=1791465500;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w6Ys2U4rK4qRXJ88N00bl2NDAdA3PBqSlYtGtuTGakU=;
        b=I8oABUbNBtxOCgKpy7UwfWsEteacBh808n8EYM7nsupfrwrOQg8auAKDKpwGGNw7Rr
         z+mK0cSBJXLQ0SQIovpVOIlctvEf+2tlkMbZrZZgzTfdQePbfbPnvU28Oj6qjfWgc47F
         +UqmL62VTH6k+k1OlQdv0N9ZX8ZpdepKTrCGQBwlUL8PRMESPdAtMsLvKrZ63EIB9UN6
         DxS9FkYoCiY9vxOxpdQwYWX06V3kHkQX+mj7Q+I/6AFYLmu0O71RGcahnUqUdv6+bQrk
         eTckz1FpuftU5oatJhFFsNErcee7RtNW5YsG0O07Hm3wvTIBY7VLHOhkesGkwTQKtWIJ
         /pSw==
X-Forwarded-Encrypted: i=1; AKwUvBxUy5ioeD/DEp3dm/2VvU2v3SK0wXHpULOOS4SfxqTpiw0dK6h4mYYRMcB0ca6aqV18qfU+qu/qmGGyGNvJ@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6hswherIrAcwyadB3oUqZoylMKOqWdrN+hkiZtnSbu7ACQ7CF
	u3j2a6iGlMV1d4CBfkyQTBv2+k15fZR2vWedaVPHL40czMVw3WfSTFt2hPQEcHjmnEY=
X-Gm-Gg: AYBFou2ALZJImj1w4Ssoibp1qv92uggjXPIx0rPMrOOEmF8Hc9gF5HQMrJEUxdMIOv5
	bys7z1NQw7KD3pz1B/SzYFY+Wtt8pC0gKalFMYaTpmdbD+8UrJ6EqH3rdpa3U2eXcNYrv9gwawt
	jl+kDcwEP+rKr/xiUxcVDVz97CY8qI4hSFeweH0Qt9ROFVXJyIIFWG6dEgu9AhxeNEB7PBtB0iA
	WrohAj7+ZyK3AwuinrrvSmrzsMXNNaRz8rFkx6dS+YJaQ1rt5aJKhmGoaQKFGcNDcNuPanhd6Wg
	G+ly/1Df2nbwGNpGrlUx8u/KWl2pEUCp8+gwgo16TxKCwUpYvGXDj9vxCKrwoGjMCWQMsGTy0zZ
	jatpnPOwvzV3uuPWITslbw99uk1gH89YTt9bXtmGKuJmapDjSKUKyZdSyWJ6XdzoNlZG0ovJrg8
	0ig7EPT9mJip9ETBnpUPEnNIszFo6A/MHyNsWXI1lG+rRCZgc3L/ArU3L9xEaQ7ga4bk4z4B2hn
	jx8lyS+yP5rVDV+VEmHUTaBmITZVJtV3ZVvqtV8BmdjXHCKnWZunqD+rg==
X-Received: by 2002:a05:6402:2794:b0:6ac:ae52:8b75 with SMTP id 4fb4d7f45d1cf-6ae19978a4fmr3453730a12.44.1790860676581;
        Thu, 01 Oct 2026 06:17:56 -0700 (PDT)
Received: from [172.16.220.225] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae5ca63130sm1146160a12.20.2026.10.01.06.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 06:17:56 -0700 (PDT)
Message-ID: <16efc0e1-8986-418c-87ba-9bf1ca4e4088@fairphone.com>
Date: Thu, 1 Oct 2026 15:17:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: dw9800: Redocument
 DW9800K
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, Luca Weiss <luca.weiss@fairphone.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260914-b4-dw9800k_cleanup-v2-0-6553273aaa33@fairphone.com>
 <20260914-b4-dw9800k_cleanup-v2-1-6553273aaa33@fairphone.com>
 <20260916-meek-qualified-penguin-fd8cea@quoll>
Content-Language: en-US
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
In-Reply-To: <20260916-meek-qualified-penguin-fd8cea@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/16/26 11:06, Krzysztof Kozlowski wrote:
> On Mon, Sep 14, 2026 at 12:25:56PM +0200, Griffin Kroah-Hartman wrote:
>> The DW9800K's properties are too different to justify sharing the same
>> bindings file as the dw9719, Create a separate bindings documentation
>> for the Dongwoon Anatech DW9800K with it's updated properties.
>>
>> More specifically:
>>
>> The DW9800K did not share the SAC1 and SAC6 modes
>> that the DW9719 used.
>>
>> The DW9800K does not actually have a register that matches the property
>> description of vcm-prescale, instead the description of the clock-presc
>> in the DW9768 is much more applicable to the functionality required
>> according to the DW9800K datasheet.
> 
> I don't get why it does not match. You have exactly the same first part
> of the description, look:
> 
There is no inherent difference between the two property names, the 
values that the previous binding was using was completely incorrect with 
the hardware.

The reason for this discrepancy in the first place was us guessing which 
properties that this driver would need based on the datasheets we had 
for older dongwoon devices.

> dw9719:
>    Indication of VCM switching frequency dividing rate select
> 
> Your code:
>    Indication of VCM internal clock dividing rate select,
> 
> Both are dividing the VCM clock rate, no?
> 
clock-presc is used in a different dongwoon binding (dw9768) which more 
accurately matches the function of the hardware, So we concluded that it 
was a more appropriate name.
either way, the values we were using with this property was completely 
incorrect, so it had to be changed either way.

If you'd really prefer us use the older property name we can change it.

> Best regards,
> Krzysztof
> 
many thanks,
Griffin
