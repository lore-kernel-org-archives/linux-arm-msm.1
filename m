Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEEE34DCC7
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 08:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791535162; cv=none; b=E4AC7NY29SktQL5wQk4WZz30OEifHPPHEfS8U+CQF3I86bCCX02gB3flOPh0mKnBUURFVZ4r8KemAKehBbewnsRWtFLaeoEmzP00ICM6GdAlt5Lq/TutFGuyJuTUOpTyeVfL+aOf1IBrEB/rBCTOHXwYG9ssQZoJy6VFa0yAeXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791535162; c=relaxed/simple;
	bh=+e4H2njOhdGoAJi63SmPW8H1YZ7+lUPpHguznv3trDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lbQ0AP0oUW8R+OKEo/ReTUN8su7+3Z/ln+NQtY2Oy1tYLr5I5S6pFkzCb+YX7zKO7RPW1iFW1JW5IzmjCL5N7G1CPpTEYmWTZAPpRaEGWAniZDItT33q569ZjdSxqagPWWX2azUxa4k7ymWQe1EODW7oxkKc6Pi1jeivskVGsDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MyKnmoP8; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MyKnmoP8"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c247f6687dcso608570566b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 01:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791535159; x=1792139959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p+vqQSz3CWMehrnqKQx0wIXwhLvGj+tDDI6FZmqwFVU=;
        b=MyKnmoP8osjJjnTq5n1sqFyk/h8RL2ekclvLPOpQ4xihAKJLebXAsadFS2WfGs/8Cu
         hdPZYyVsomXvfJb0xwo+UwdWQIpzl3jNcULeN61QzsamL93HwR8F+Paat0MF6NywGS2a
         Hi7YCO5+QdKQeYXDoWRwUiimzM842y2Ofseyov5y4sF0fEMs+41xlhi6OgQ4vTgqacLO
         15t7bH/+fYAGxP5ZNDS+QaY5A8tGxZeDJfQAdJ+aX79xf+6LKA2D9SQcRGNh/3QjUZ6K
         9RgnoZ95YTHfQi0QA6x14pAiHsbqmdf44Hvq4ggT6+JK04N2084RmaXOEmRefIc5w22S
         xG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791535159; x=1792139959;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+vqQSz3CWMehrnqKQx0wIXwhLvGj+tDDI6FZmqwFVU=;
        b=Axh8kPCL7j/c7JrXVnAJ62eKALvPV4tH5IwL9JzU16I6rsLkiLyUTEnm2tHUvazzt0
         lh+KJgyTjFlwxUDf2mGKFpGsvhstwXsFFXuluQce5Cu1zZRpvMj8eTKHfW7kd7OCFok1
         XF3NBRG0KEUrFJQLh4Tb672XBH0KEb+h6/PFSTHySQKNhtA5LhROHc4VQGKP9CDmYo4y
         uTbdcCGBiDOjdiNV4i4hcFHnBsqy4dpjGDj8wWlIg6ojPhmQWwLYxPNp6pv21cqmeyx0
         euc6C6WKD9jq6dHpaTDQfcAs5m8AIlmgQxZ1sz7+zoc+7a5+Mme7dNrk2N4VmsNU3acU
         ODwA==
X-Forwarded-Encrypted: i=1; AKwUvBz4MDu/ZtKsKr2PnqiQbxSlHRC67sgpNTq2DXTGqMihQA66eNRBBCeNHTSeqCP0SEuewg2wJRKJUwKyY4Bx@vger.kernel.org
X-Gm-Message-State: AFq9FYIGe6GvKGOaE5YI911U+Ns9UiiyKcJpH/Y5aQCYANNUfZ/R9beX
	kMel8Cyu9lok8wu1W5rgqesPIj5q4wtnL5ptbzW6yA/kD85kWT/JjqtwRBCpRG6vDF4=
X-Gm-Gg: AYBFou1ptEsoersjCkGatNQ/NbYj+yHbkHhYAWi2JoF49DGTjU64PWcGroVLlHNiWky
	YMcFYB5EWY8p24CypVTZ+3wRQY7JcTl6xL/ldRwUEvGXQgUWcF+6N8J9EfUqLLwQPz/xDvwPSO1
	mwB4JJUR8j+auWyj2Sb6wBBv3MYElPEh/N4VnIrYEeqQrNVm84zBmGYu6DNXcuhRK6xJBMEgpQZ
	NDCHMgHZuayjj/Yr6q3JHlcOuTUW2lQxB2AO49Akz9jHexBGEE4MNRmM1qXoUqaxohGKlFlpJwq
	zQScnqdiXHQ6PzWs73nNi/xMq7MAmaGxjtlMgqIWVJXqoMKGc6NCS5YIeOKpqe2tB6lnQAVBhsW
	WrPE3G57YXYONYXIeriHkKL+BRaYIQjACnjRNkzFF/LUZZWmdrjRpooIN9sAdWIep30iAnzqAqr
	rFsIVw3o+Iiu/Q8xAjxYfPDQsnz1Ev5Fb4MC44JYtmTWYXmZUSrhpFXFA0Dl7Txb1TEjhqEWJKa
	ktAAA+62Q==
X-Received: by 2002:a17:907:3d52:b0:c26:1648:a076 with SMTP id a640c23a62f3a-c31aa0e93bdmr117241666b.49.1791535159415;
        Fri, 09 Oct 2026 01:39:19 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.78.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3ae32sm64239766b.28.2026.10.09.01.39.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 01:39:18 -0700 (PDT)
Message-ID: <8a2ff836-57ce-4df6-aaae-0db3f36e8b58@linaro.org>
Date: Fri, 9 Oct 2026 09:39:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 08/12] media: qcom: camss: vfe: Add support for VFE
 1080
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, bod@kernel.org
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
 <20261008-kaanapali-camss-v19-8-b2c583ef50e0@oss.qualcomm.com>
 <179149982796.2596899.756044515233442982.b4-reply@b4>
 <7452d85d-83a8-493c-8d74-5020ab72982d@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <7452d85d-83a8-493c-8d74-5020ab72982d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/10/2026 03:59, Hangxiang Ma wrote:
>>> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/ 
>>> media/platform/qcom/camss/Makefile
>>> index 218ba3a95939..42a14e8fe1b7 100644
>>> --- a/drivers/media/platform/qcom/camss/Makefile
>>> +++ b/drivers/media/platform/qcom/camss/Makefile
>>> @@ -26,6 +26,7 @@ qcom-camss-objs += \
>>>           camss-vfe-340.o \
>>>           camss-vfe-480.o \
>>>           camss-vfe-680.o \
>>> +        camss-vfe-1080.o \
>>
>> Can't say I'm 1000000% clear on when reg_update() is supposed to 
>> happen in
>> the flow of the logic you have here.
>>
>> I'm a bit suspicious of adding a new flag which skips the update but
>> assumes some other bit of code executes later and does that update.
>>
>> Can you explain this some more please.
>>
> 
> Thanks for the review. These points were discussed in an earlier 
> revision, but I should have explained them directly in this version.
> 
> Vijay once clarified that the configuration principle became more strict 
> since Kaanapali. We can back to <https://lore.kernel.org/all/662a21a3- 
> de8b-406f-a15d-b8a572aa79ab@oss.qualcomm.com/> for more details.
> 
> In short, the hardware guidance asks to issue the REG_UPDATE after all 
> of the CSID configuration registers are written. Kaanapali seems to have 
> very strict dependency in the hardware about this sequence and with the 
> original sequence, no RUP DONE or BUF DONE events are received at all. 
> While other chipsets can work normally.

But how/where are we saying that happens ?

---
bod
