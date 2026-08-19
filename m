Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCF440DFC6
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 08:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787128678; cv=none; b=CsdNjxiXClOWtRXASZ9KQNie0uUkGctX91aeDv/bMHL5Vq2jhvALIYSDBgUMGauVQKsIjwpy1r69h0x+jcEK91eRynOKm2hga2TGR9bYlSRgIIY+kFXyBN+8ZR6qahYwTz/rUL2a/FWxFZJHJs2jHadqQiNSqIPJSSw7wzhYWHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787128678; c=relaxed/simple;
	bh=J8OvenS2hCs5THMJYtmCxf16EEHr+bum+fX8PSaJgqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jiibpJVVMmie76ANzwqSIY+AB2kyDEl1BaxaX3EYpwBNwQOIwwoHroIVmaW0CYZHnbWsXA7+E+SQ7mIB9LuO7jMWTVithF7GgTi8NmkLrevQg++L6zUIKgh7F5F+1n0ekMGc1jClCEh+tdpC4hSk7/g65FEiVUwme/JNcpD58ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ak616cRj; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ak616cRj"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c15f020a223so104668866b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 01:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787128674; x=1787733474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OWyG58LZRk0FpypFIgr97MJusUzcaJB4SA6RQG40M3M=;
        b=Ak616cRjhRj8soNDK7wk18/0mrwuHmdnqpxX9rrWLfhizs9Iqf4aYqJbi6lgW3v1RW
         BV65ktICdj4HQYf8U4oDZnXSCvPtQyEUdxbr8WuDAZ1kMo6lP+laox5xnAFgKppfUWvm
         1kRQ9oMBpOFimzkWqsEbddmOlvbwpm+b5/ftM7Gke4OnGpSvzYYGJ0MroM/bOsJilYRc
         6zNsJus2INwTfkMb7hKoy5Lwdckmhn8y5dghJhWU00EYEkavTQVsbvMahvvLP0uTm3RO
         NpfT43vvnK12MTUqQGurkY+9Bzi/+SlAOnVsYpuoXUUlOsuHVudpqdf7DzcQR6NTjJsF
         g9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787128674; x=1787733474;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWyG58LZRk0FpypFIgr97MJusUzcaJB4SA6RQG40M3M=;
        b=SuipLWjhpIyrNsRFtgJOcOK6zecKAYefonSkOFX7ZLM4ZtMy2hxn1kzsENlAPwee1+
         eXjqzoKCMC446Z8wpxxy7CkzThblIR29LHwnShA+H5dbgo7cN/ibeGzwTRCILxG9Je1A
         Q4P4nzbdKgvJLg7oZzIAeX4FFiNfWy2gEwlS9KtQ86NyzdyLUcYyn8nc6R+0l1CDVHcm
         FUmsedHm/ruU+NuIKlTiG+x8X08MPV20QlxPHGMORjDJ614hZRGRepdNg52iXeRKEGSq
         ss5FphEX7c2Ko2r3xtbCTHRgUIyol++daHB80gKsUFvjnTmqcKY0zfXfM4bntQ0glcrc
         Q/TA==
X-Forwarded-Encrypted: i=1; AHgh+RpRLuUBi3s2Pc16ncJDx5lc5KYFXwJcmktJKqbwliangjrM3bOtAN9upxOK3NMu9Nxd7fWpX01gzjxyBB5Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwB8qIwfuNoaC9h53KK8QuPvu47WK8GeYsAdt046jXJ/gMvbK36
	mGZvRHaLRhubC/TNqOo0L7OSGQkHvw6lOCGtU2aluUz/8apjYsIkyODe
X-Gm-Gg: AR+sD12dzLQbcWs//5VowdtKMfZSeRBNcdwnOngDMT5wd//+PrO+AT9/jRlwSukDySN
	9B4WK4/4Kfyb0+qWeUbNfcbRelTey1BIVrNyGL3wMk3uMh8tEZbaIijknNzMwk2GwOHRbVPl58E
	/7G5P0MnqU6tREfMJq7Ek5azKzuiX3ZrIAGxF9heFpFd0cqTowub5lVUmysrISUrlKSTTXfuG0b
	23IxkWIG3hP5Eig+rEQ0egVBmmrAdNCMbVjIaHGvyzKU/tzhFTHGh8I8GnaSSfpWGsevFT+AgI8
	pPpZGrFNxzSbm7pmc0+fWL/TCpulPKZhWmdPwJDUzp4ehRgG0mPSZ8o6KdH4gxicBrsOozCZiC9
	ZXFxR1BArj2eHwd0c86QCkY/XqbMgpp6Xgu1eKc24592KQvdLLuIOHDLukeRf7WHH6x6OyA2FCg
	z+QcReaVRlCYrgv6irhGHjk107qPsxGsdQFr5D1sK4I+f3+aCs+/guzTWaovTwudoa/NyqbobXm
	FJhfxGiTcMS5CaXfjxFE8JpCg==
X-Received: by 2002:a17:907:3e1e:b0:c15:fc59:cdf3 with SMTP id a640c23a62f3a-c242e206084mr165876966b.12.1787128674163;
        Wed, 19 Aug 2026 01:37:54 -0700 (PDT)
Received: from [192.168.1.30] (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c38b379sm43248966b.39.2026.08.19.01.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 01:37:53 -0700 (PDT)
Message-ID: <590e7881-de96-4de4-bb50-1e91439b92ef@gmail.com>
Date: Wed, 19 Aug 2026 10:37:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] power: supply: qcom_battmgr: add Xiaomi taoyao
 support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260818151039.409767-1-zstaseg@gmail.com>
 <20260818151039.409767-3-zstaseg@gmail.com>
 <20260819-slick-spotted-chamois-962510@quoll>
Content-Language: en-US
From: Stanislav Zaikin <zstaseg@gmail.com>
In-Reply-To: <20260819-slick-spotted-chamois-962510@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/19/26 9:11 AM, Krzysztof Kozlowski wrote:
> On Tue, Aug 18, 2026 at 05:10:38PM +0200, user.email wrote:
>> From: Stanislav Zaikin <zstaseg@gmail.com>
>>
>> The Xiaomi taoyao firmware defines an additional BATT_CONSTANT_CURRENT
>> property (ID 12) between BATT_CHG_CTRL_LIM_MAX and BATT_TEMP, shifting
>> all higher battery property IDs by one.
>>
>> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
>> ---
>>   drivers/power/supply/qcom_battmgr.c | 86 +++++++++++++++++++++++++++--
>>   1 file changed, 82 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
>> index 490137a23d00..390d7c75e36f 100644
>> --- a/drivers/power/supply/qcom_battmgr.c
>> +++ b/drivers/power/supply/qcom_battmgr.c
>> @@ -24,6 +24,7 @@ enum qcom_battmgr_variant {
>>   	QCOM_BATTMGR_SM8350,
>>   	QCOM_BATTMGR_SM8550,
>>   	QCOM_BATTMGR_X1E80100,
>> +	QCOM_BATTMGR_TAOYAO,
> 
> T < X, do not introduce entries in random order

Hello Krzysztof,
Thank you for the review.

Will fix in v3.

>> @@ -1381,6 +1453,11 @@ static void qcom_battmgr_sm8350_callback(struct qcom_battmgr *battmgr,
>>   	switch (opcode) {
>>   	case BATTMGR_BAT_PROPERTY_GET:
>>   		property = le32_to_cpu(resp->intval.property);
>> +
>> +		if (battmgr->variant == QCOM_BATTMGR_TAOYAO &&
>> +		    property < ARRAY_SIZE(taoyao_to_canonical))
>> +			property = taoyao_to_canonical[property];
> 
> So device is or is not compatible with sm7325? Above code suggests that
> it is not. How does it work when bound by sm7325 compatible?

The device is sm7325-based and when bound to sm7325-pmic-glink it falls 
back to QCOM_BATTMGR_SM8350 property map. However, due to shifted 
property IDs baked into taoyao's firmware the parsing of roughly the 2nd 
half of properties is broken.

And any userspace process that reads the battery properties via sysfs 
suffers from 1s timeouts and it basically hangs my DE.

Since this is an RFC: do you think this approach is better than what I 
described in cover letter? (manually shifting property IDs)

>> @@ -1617,6 +1694,7 @@ static const struct of_device_id qcom_battmgr_of_variants[] = {
>>   	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = (void *)QCOM_BATTMGR_SC8280XP },
>>   	{ .compatible = "qcom,sm8550-pmic-glink", .data = (void *)QCOM_BATTMGR_SM8550 },
>>   	{ .compatible = "qcom,x1e80100-pmic-glink", .data = (void *)QCOM_BATTMGR_X1E80100 },
>> +	{ .compatible = "xiaomi,taoyao-pmic-glink", .data = (void *)QCOM_BATTMGR_TAOYAO },
> 
> And here as well wrong order

Will fix in v3.

--
Best regards,
Stanislav

