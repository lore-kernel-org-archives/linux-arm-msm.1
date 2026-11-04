Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793809043;
	b=xD7V7umnxBPv8GzQD5JYo88VEWEf43kcWlKhR2MAurMW8XCw3q2UgBA5+oVxLI8p4zOd
	 +ePp5nKNLNEBAZASIDZaGqfNvsA3OE7FX3RSbj/u5HL9rih9qpzCmEcTMjcGFlH29/I/q
	 ukPVD4yLclGIIModAKTgLxsmqdR1ruI84dbpLyHLfbSDKrAgkR/ds8tsKn7g1DJ9WTZ+l
	 dlVbKGkIzY/IJMM8xKgMRDO8vmi8NBqhd4R0iWm1601vaaMMq0oN5ToEmGOBfVSiWGgFB
	 iYMFDgstwZZWVzAMriuMLljfsSHAUHGtcADr64Dzgg3HbU3kgllb30CbWrMmmQY3yEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793809043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=WGjQzXDbihJeW6cw6LNSbBuxJDvDK/XLahSbUoADWnY=;
	b=RANtt+/pSHTrDFOqov0CnnfJz5ZfywSqAXh6m+4Ka6SyQBFQGYYVBDAXixDuOymyivrP
	 hRdN64xjMvi1pJNXtVaUrIjM86dd+kPUvEFBxUrAA6k4Fo2fWlyVQDol0ape8CP0l4o09
	 3BGANnPJ9OhMQk4Y1kVCgsizWk4lTpea/Y9pKbJXLfXUo0JEZmCCQS/ecUovT17fMrQlN
	 uDdVOYt2eyezx/8dSvbFhvLEzBImT0QtohaHdvIYTkajv+Mt2j8xRl9X/2+E8DW1lBRAY
	 qbHReGj6/cS+sCNPZW5Tl3Sb04AAohPzLQ0ycerB34U0LJdvnnw6szetXOG075VgbNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=raiqF4yg;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E03C606A33C
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 16:17:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E03C606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=raiqF4yg
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso9538495e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 08:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793809036; x=1794413836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WGjQzXDbihJeW6cw6LNSbBuxJDvDK/XLahSbUoADWnY=;
        b=raiqF4ygK5JlaCGtO2waCV60lOHlih3bqY/lQOUAr5R3FP/h9GqOq9C9WlKrIiK43p
         DXycWEIoorIOR+t0tgYbutbTXDTie3myKpP4X/w5OiftollhGD7cR4paG4TEfRddYHv9
         XXIbRBhINwHfyoqGWrS9Vzfs//UNKLRrC2EWrOL2dcp4OVQSaWoaQWAwyz+o/PMv2ir3
         pSHwmu64dQI8dodQraZsnCHpfI8Iyysr7ciYmkqsXNvK50Z6BrjiHgO/cUi37Am3CwGN
         HUsYStNjCWrLTzU8jLkNGuDqPZI8Oqq2d/qm61DK56PrvpeVwwMhLbF+GHtnzFmAgAvJ
         M9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793809036; x=1794413836;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WGjQzXDbihJeW6cw6LNSbBuxJDvDK/XLahSbUoADWnY=;
        b=xlcKmKejmIaCZ49v5UcG/VmRSHAyaS/f3600kLbJH4Sef0CWmKHIIMUUPnZlgIe1FD
         GiZgCLxeOK8KIFdk8zKbixzO0stIheuKra74CM1YzVzmf5AaZNzQ+Lrauscj5j3Sf4Ab
         edLxfNrmNo2P/X59r+ot8xfgQFWNweJy25J/KBrhe7lQRk+8piLYMl2qqVC1dX+9+bBK
         5U+rheWE7AXL1wjaGQznYRktau4H7cTo10iQETFeIUXQFf6mIQuR1fZWBssia8yoE14e
         ScxGJz3c63nMMWVYp5qfXQdvfcNdKSCBlZxNsVIEJlPeiDmVF8C9UglKsB7a4WnF6rvh
         aesg==
X-Forwarded-Encrypted: i=1; AKwUvByQJwTGnL6dJdHjYV0vZOrra3HZDovTNAVUcjQHXFZpvwZcAIRfUwUZ4jDL8/xFVYOZqHR+UAspnMxvRC7N@vger.kernel.org
X-Gm-Message-State: APuU4Z+CH5iT7v6VBhELmJ/CqR6fYwBayL6zO8IGOUwwobqZkSZcfBax
	neduPsHQ5tecV9/85x0yYS3RMnPshRS3XAgqDRmZWhbys1JUzyIb1v/7Y7W55z/6Dqc=
X-Gm-Gg: AYBFou1hSStYUfQWhWI9Dgfo2WnlCf6nzm89KC4N6us9KCFNKKQrbG82t9iqaX78z8i
	rfunZmXfbGB/M1Ve45QHFVC1Oa6e1Q/312NvCgvg2tyqSLYhwnjSBBz9fxcXKr8MWhzamNIqqDk
	aC+LNdporOw4d30GREl9TE9iiF+savHGGhNtudxioKj4wKjNXuG2dzf7hrPwc0lCj7+1T6QTBXp
	MJo3wcZonO563PEDA7uRTuQknXsPnTXhP8hl6wrP771P4BgqGVdoWu2uQNFocTqyArtH/WZ63pJ
	rGyrEI7Np+VLPaUxkRS+PYTPUhRpwrVouzpQBFxeZQLjPWLvC4zeNpr/bg7bEoqPD0NAeZ1Ztz2
	kqvY+dJALdXW46DolOoZaZ/MzYWuxE0rNgTKlE8Rhzw5/7HbNGd8AETi5ZTSq9PSb29fO6wAvfW
	zCK06Y+qVg9E/+GQmhjBJGfiWVnN0qfVSdUe4hbXfbogGZdxs5M84hKfNGrIOwUPfGNq93n+JeQ
	+l+6AlCEG/6eCrkgWnxgSIAl4YAn3G3BGnikz8JVlMtN2pZukLlJebCePIfejaAcyMspJPjaL1E
	hlZhnsuMxFOTyNtU9lWCSVIQIs8UFB7HBxfrNtBHhPQ=
X-Received: by 2002:a05:600c:5295:b0:4a1:e92b:ae4a with SMTP id 5b1f17b1804b1-4b3c3545146mr75677375e9.21.1793809035955;
        Wed, 04 Nov 2026 08:17:15 -0800 (PST)
Received: from [192.168.0.167] ([109.76.163.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9faff90sm169274795e9.5.2026.11.04.08.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 08:17:15 -0800 (PST)
Message-ID: <7acf1f64-a2ac-411d-a235-69ea52231623@linaro.org>
Date: Wed, 4 Nov 2026 16:17:13 +0000
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
Subject: Re: [PATCH v3 5/5] media: qcom: camss: Add support for Hawi
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
 <fFfGGWaoXA-LdO6s8Xh_kQWQfncXe9YNdpcj2yNkphWHAR_V69LdLOcuhXPsbg8dEUSN4j4yygq4wPre5cz79w==@protonmail.internalid>
 <20261030-hawi-maili-camss-v3-5-9742bca8cef2@oss.qualcomm.com>
 <5817be6b-7180-407b-acb5-8c5fdef4edfb@kernel.org>
 <73b1f591-69cf-471b-9763-a0b719c74501@oss.qualcomm.com>
 <fac8cd6d-c3f7-4ed3-b0d4-7cb8a7a6f451@linaro.org>
 <d92a8aaa-5cef-4416-b1c9-46ecfc6b2745@oss.qualcomm.com>
 <CAFEp6-3ka3ZKzCoLQ5BNv0YR+yhYXVRwV6G6rM8Lx_9hZ0RqVw@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <CAFEp6-3ka3ZKzCoLQ5BNv0YR+yhYXVRwV6G6rM8Lx_9hZ0RqVw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2026 16:11, Loic Poulain wrote:
>>> We have a series from Antans to address this though.
>>>
>>> We should list the clocks the SoC supports not constrain that list for
>>> one specific sensor on a test-case.
>>>
>>> ---
>>> bod
>> Good to know that Antans has a series addressing this. I agree that we
>> should list all the clock rates supported by the SoC rather than
>> constraining them for a specific sensor.
>>
>> One additional concern: if the clock selection logic still always picks
>> freq[0], listing a lower rate first could leave CAMSS unable to work
>> properly with sensors that need higher bandwidth.
>>
>> Could you please share the link to the series? I'll rebase the next
>> revision on top of it.
> I don't think Atanas' series targets the CSID clocks, only the VFE
> clocks. Ideally, we should make similar changes for the CSID clocks as
> well, but for now they are not being considered here.
> 
> Perhaps add a few comments documenting the supported rates and use a
> single rate for the time being. Once the CSID clock changes land, we
> should be able to revisit and adapt this accordingly?

Its the same principle though.

I don't think there's a valid case to exclude clock-rates purely because 
one sensor requires the higher rate and we aren't willing to do the work 
to make the clocks smarter.

---
bod
