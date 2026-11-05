Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872043;
	b=gTGL5T6lkBmN1zdzBUfFZ/kpgyCobcke2Nsr3gg0tihZG1TivEVOgjvdywtDkgnT/tp0
	 lDkSidEfAgWCpKM8UQCeqpzlwNZAk4P04SBIZ3szzpAlUvbYnxveeo2Y8RBwvf8wIbrFC
	 wEMQ+DFQzAbivr1cvbLEayd+9hVvqP+zg9GML2YBddWdxxNF2KQwkGArNtiI0gAccMwsw
	 0rhalzjq5Zrih9ZXJsCW867uw31lkuhzhjiBbVtpr+UjWbxLg2mYEyoUZfrJKaKA3ReNj
	 FScMwGFP+TXJtDGcZMfVpogdEn/zj75NBtimBBS3B3OVYNSRYcZ9ki5nE7icMUlZx0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=jyLL8ZmxrAARfweF0V8YGIXZS1Pegf4tg2ZATRaSJHc=;
	b=oP+7gTjb0g8qvIIuTVH6ngRPmvYUG8FHQSlSGsqX98ABwZ2qraH9tufYKMQ6wAAb8xwf
	 onb7Ou+4YAk10lQDx+6SHpND5vCHDVW0gJDVutaPx/ESA6XGtWFWZOS1hxQTJRU0jBkK+
	 vMqzwPF8s/VzjYWkU/S3rlymvwv0lPfoqYIhvxjhc55O265+j+FeN/XMVOY3IO5i0JIcb
	 Nli9SkXoo703emSf6+kAY5l0ckJoj6KBfLwx5qwXsay8PWVRjCK+lBmXgSOXg7xurtKQd
	 /Dcph1QMZO1uk3EmirrqXbNJSNcUbm2bcvs+kO9jglOcsf+az1cWS1TMXZDCVG7uafQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RASG78SQ;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD48606A32F
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 09:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FD48606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RASG78SQ
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so14731655e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 01:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793872041; x=1794476841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jyLL8ZmxrAARfweF0V8YGIXZS1Pegf4tg2ZATRaSJHc=;
        b=RASG78SQJZb7zly3rDtTUgyOxzbegHId3oxXTHrgcPPTO7wKUsm28sWnWodJU6lGHj
         Xl4lgSwi6T8p8iO48+EYJyut2DlkqBgDidTj54wXHNwFYg81frFZE8Q7apcHbehGyfUA
         oEBrf2dIpQtOCwWHURtTzf2Dzmg0FgcsA/tVffLX9VOTMSbrVTczidrPCVBSUmPfF8xr
         VdCf7x+UzAcuXIV8ZgZ7/IHSey42eTXQt/qVDbQZL/NKaCBoqsLCKXtWNZ4qjue5YjS9
         3KNNVGfvWsr5ovwtxywRvbMkqZpXcjcM2JDvQJQyfSpzT0jiqJ0bYD4srOLe6uto7P4W
         fyiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872041; x=1794476841;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jyLL8ZmxrAARfweF0V8YGIXZS1Pegf4tg2ZATRaSJHc=;
        b=V/8tf9vnVhD42O94McVQkxfc3+P6uduXbHBkNZ4YEg86PEW+TkvF9F5R5oFz8t5e0+
         qcyAdPpBHnTcDg/ynFw5lNudgzygp7AkO5BiU0Sp8Puc8Us9Q28K7TPX3AwkDq8m115e
         430vWoifq4NW5Y9nhahrApvgXSBEuZhf8nGNIGYiGHL7SwxELz8bmwR8mXwZ/ZU9KDqQ
         bddtRzaf3tNRQFFqSqDw8WfWqG7kGS01WA1KQwsSV7nKIPDjKHAs50hqQhKxYhVCdF4O
         hmmkSKCWUi6eJjRKJbjFGh5yocEbOAgim5i/njkRJA36sK4AvQlN0IgKgZVsmSotLWev
         47SA==
X-Gm-Message-State: APuU4Z8G4Xt+8MsPg1xZ3VRnaMxRUVFZWYsHyTkN8fChuV5xHEQoXJHk
	Q52jiZD0+sXdWj1tD70po31G+Xhqn0WXfmn1r1ulUN81LvleXVkzXvH04Idrm+3MXzo=
X-Gm-Gg: AYBFou2JPGeXX29oexxA9M6/lXxEI3LTsA9VEUmNxGlrxtNyswzNeWDJM59ckhHhuIO
	sNX3w8JMsAhqxzJ8KNt5A0exaFqxXn65HOxdwckz5XqgOpSI+IPTkRtPkNNYf8i2iI2liVdN+pc
	LUHEpaxv0fF0UjEaWJBQ3DCnevrP8k0xCLEP1k7/l0ui6Bb3WOpjp2cNpGrDjDlcij3rOAw8FPS
	kOzqspnIAt+8eaFsbiFM64F1rJ4RcBdWSiagl0Yr42cCnAYWDf+guDk1FK8LHHQHppsjt/YtNKl
	HizMOqlAXFXXD6yQGlLnWpNX3ixepFNV5TR9dKmZoqs3FW9GTJGgk0WYsUiob13h0EFKgOu8FJ/
	dK3vj4UOxVP/0phbVMCTxrkcKW32fBeMQhBodIJgB2mduSwhWGR8DGGkB7WasA1SU//5z/V6jT6
	xm0Zi/h6UTOgPsB0+jwNZTak74efUcl8pJYakcm3oHenU+x5Jc/oNSRtnx3z+NUA1iByuZC//Jn
	fM2yagmBSeqVB2Lwnf+wMgdE84BVimQbeod5TbTaoRrVcduR7sBOLGMZpfIGsQD/n/31z9356du
	Gktkzd5FWwMfJmd41PHhX3qhPVblMvctuexx24gX
X-Received: by 2002:a05:600c:4f86:b0:4a7:669c:c988 with SMTP id 5b1f17b1804b1-4ac18b7df2cmr429163325e9.23.1793872041405;
        Thu, 05 Nov 2026 01:47:21 -0800 (PST)
Received: from [192.168.0.167] ([51.37.126.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed45d71dsm8886594f8f.36.2026.11.05.01.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:47:20 -0800 (PST)
Message-ID: <5ba03b8e-1d51-4e66-a802-37e63814f5d5@linaro.org>
Date: Thu, 5 Nov 2026 09:47:19 +0000
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
Subject: Re: [PATCH 2/4] dt-bindings: media: qcom,sm8150-camss: Add SM8150
 CAMSS
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-2-7a9534a9a22f@andrewgigena.dev>
 <904675e8-701d-4fd6-b418-6c0dcc9288b9@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <904675e8-701d-4fd6-b418-6c0dcc9288b9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/11/2026 23:16, Vladimir Zapolskiy wrote:
>> +maintainers:
>> +  - Andrew Gigena <mail@andrewgigena.dev>
>> +
>> +description: |
>> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sm8150-camss
>> +
>> +  clocks:
>> +    minItems: 42
>> +    maxItems: 42
>> +
>> +  clock-names:
>> +    items:
>> +      - const: camnoc_axi
>> +      - const: camnoc_axi_src
>> +      - const: cpas_ahb
>> +      - const: cphy_rx_src
>> +      - const: csiphy0
>> +      - const: csiphy0_timer
>> +      - const: csiphy0_timer_src
>> +      - const: csiphy1
>> +      - const: csiphy1_timer
>> +      - const: csiphy1_timer_src
>> +      - const: csiphy2
>> +      - const: csiphy2_timer
>> +      - const: csiphy2_timer_src
>> +      - const: csiphy3
>> +      - const: csiphy3_timer
>> +      - const: csiphy3_timer_src
> 
> Please switch to the new model of describing and exploiting
> the stand-alone CSI2 PHY devices.
> 
> Any CAMSS drivers based on the legacy description of CSIPHYs
> should not be accepted into the upstream.

I mean we are just adding a new define for a SoC here - not a new init 
sequence.

We could move all of sc8280xp, sm8150 and sm8250 to a new driver 
topology but, I don't think that's a reasonable ask for a small change 
like this from a new contributor.

Certainly would welcome the transition given above as a defined and neat 
series but, I don't think there's a need for that to include this SoC in 
100% existing infrastructure.

---
bod
