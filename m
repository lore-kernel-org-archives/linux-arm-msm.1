Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5727382283
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812847; cv=none; b=AnceEsGpiwBcFaMN52HLSJqU6vqA/iaCMv6aABo77kti8ppQ++rKsGBNaB8Aq08klcR1dZv6SuWc18ap5uKIrx17tuVJGO0uOEogmkpRlDctQ1k9nhDpZHXDo5vLzD6hnzIE59I53F/cUytWcGasn8cs/O/qb9/xM6R5FD3fREY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812847; c=relaxed/simple;
	bh=mvoMyMEF23qiE7YbRO+z3EFZlH5bVE9dBQLlox9zVQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iPN/NXocxDKt/4nSc/80QSNk75BDwH8KQKOMYrFA5eUXh76Z1tyzueTMqla30AcUbtCV8QIIr8urVaUfzkUlXqq6LqhAjcb4UU4lE0MNqyvmmwUQd0qCYp6NrSvmCidWq9HBtITwt/Me42tgYo7jsojwnulMRarQc7Ii6zqLoO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TXJK4xXy; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TXJK4xXy"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b1cc392d8bso855770a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791812844; x=1792417644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WDpmXyGOWYzIAfqCmBiCkL6X89MoKxiD5dfOJNrnyDY=;
        b=TXJK4xXyKL7Z0gzdB/vtTB92XHZWI2Uz19d3O20VRCVjGux+32YW9jqNhDWN/LWmCe
         jMInVfAdf/YVMUp+iqg2HAf9fMWlEvK4aqeMq1nNx3f9hgWksXbBUZfh7pEdkhga1wH+
         Cb7VunNJ1+XXn+Yf0Z2qUy3S99fbeF8jjOu5/gZNRcvp0Usrtrq6Ji4u/wlbIlCB3CGJ
         r1acUFcyEAzJ0eaWo7R0/C05aq2TEFEEEcWg7lUgRtHkOrl2zdqZ4haxBPNYB6/+PXBQ
         57HjBM/w4/fb0SRzkYFv1KiDS/iJC8k/9SQBVfYkW4AUBu6rktSZtDujCjvZA31EOz8A
         6sRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812844; x=1792417644;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WDpmXyGOWYzIAfqCmBiCkL6X89MoKxiD5dfOJNrnyDY=;
        b=UnGo8BXZHnjB9mKpnFdwXPKpDXwVrgpXlADTXXfHOajlrZgc5NekxuKOFOxcrOZVSF
         RpL/uElAUiR86JSo+xtCXK1VCr6WKrtm753Apio3GVx5OSNl0PUHOKrwlTXrtOAjFqGe
         8nHHtYSxLNy2L8fuqYhflzORAfnivoq+Eux7U/WouWfbhtIkJCp7OVuqVp7cQ3dKpARu
         f62z8Gr8hd1eKe0dAsIzjcvtxBrpSzYEGbGoeSajUEf3e1moMWi8liTI/AZRKX1p3bhg
         Bo1EEz6gT8qv8AQQYvavgYTQvWtxtZTL9yrcEcSJS7zIjDDJaSCVFGx/FHJ7G6DLaFHQ
         P/jw==
X-Forwarded-Encrypted: i=1; AKwUvBzw34T41mZ4f7TzQj1ZxlJUZz3+tKBmnlW3x0tBoKZkbagbRutZFRhAGNqaKfvOBxTUZuKXgDbcDeyMWHk8@vger.kernel.org
X-Gm-Message-State: AFq9FYIGiZnOp5R87VK4FUuCK+dLZA+whKSyfLYmFi+ApzFfSkY1cDE9
	iZUZQ2b4jwsyhIVYv6zXHUlosac2S2uesrFU3Rl+QAaRkn6BOikhqdvhd4DKzOWfLSo=
X-Gm-Gg: AYBFou18SxizXlVa7L2vyDa5Go0A6OMsxG5LhwH168GjFToj+NGYXgmEPl4oh1a9YWD
	YgDCX27FAZxn3+vxgECTyez4dhNv06ji26rcdhYojY8dJafYsMHSjI9pYjlDXQHO2n4x44bLIYI
	1guXgm/ob/5oTLX+bKec3/MHwM5K/ko9wpNP6TJT+BlxBqsMu9l/XsKpjcaa33PnOa2IjZhlCl4
	EV6v0awCjd4vzXBpACrJFIL3qo5fcraxxPV14Ll63lzTA6PqQ+lu94weAlgwcv8ubJE9FZu8jP0
	9s4B1hbtC9KAk4kvF5QaznzZkgjM1fRxdo5Q6MZOlEEwqtsqoImcKArn8blYyq6ptUEhIF2gdCJ
	1U95FUFSZM5GglzanJ6fwG1mm4Hs9HoQxJJqE2eOYceDRrYwKvTgZSIOZVsvu1rNm51x20F8iHD
	lmwEtr3NTc1JJaM03huge8LpHVJGgDN74qytXA+3yR8dyzkWqUjZIY0cGjPTs2LmKzwCwPh8S/b
	8aHK04h+cV1P/AhxGOsMA==
X-Received: by 2002:a05:6402:c4ce:20b0:6b1:dd07:8e64 with SMTP id 4fb4d7f45d1cf-6b1dd079bd0mr624426a12.5.1791812843956;
        Mon, 12 Oct 2026 06:47:23 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.202.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1c27f0f3esm1350124a12.27.2026.10.12.06.47.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 06:47:22 -0700 (PDT)
Message-ID: <66eaf57e-9023-45ea-9c21-737304f6d1e7@linaro.org>
Date: Mon, 12 Oct 2026 14:47:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] media: qcom: camss: csid: Match the current
 set_fmt pad op signature
To: Hitesh Patel <hitesh@ebytelogic.com>, linux-media@vger.kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
 vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
 dmitry.baryshkov@oss.qualcomm.com, atanas.filipov@oss.qualcomm.com,
 jigarkumar.zala@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ravi@ebytelogic.com
References: <20261012120542.1140157-1-hitesh@ebytelogic.com>
 <20261012120542.1140157-2-hitesh@ebytelogic.com>
 <6f40cf25-1967-4a7a-9952-a0fba3bb5fe6@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <6f40cf25-1967-4a7a-9952-a0fba3bb5fe6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/10/2026 14:46, Bryan O'Donoghue wrote:
> On 12/10/2026 13:05, Hitesh Patel wrote:
>> v4l2_subdev_pad_ops::set_fmt gained a
>> const struct v4l2_subdev_client_info * parameter, so
>> csid_streams_set_format() no longer matches the op it is assigned to
>> and the driver fails to build with -Werror=incompatible-pointer-types.
>>
>> Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
>> ---
>>   drivers/media/platform/qcom/camss/camss-csid.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/ 
>> media/platform/qcom/camss/camss-csid.c
>> index 2559ebe98..991275398 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
>> @@ -1696,6 +1696,7 @@ static int csid_streams_get_format(struct 
>> v4l2_subdev *sd,
>>    * Return -EINVAL or zero on success
>>    */
>>   static int csid_streams_set_format(struct v4l2_subdev *sd,
>> +                   const struct v4l2_subdev_client_info *ci,
>>                      struct v4l2_subdev_state *sd_state,
>>                      struct v4l2_subdev_format *fmt)
>>   {
> 
> Please add an appropriate Fixes: tag and Cc: stable@vger.kernel.org
> 
> ---
> bod

Ah my mistake, this is a patch for Gjorgji's streams series.

---
bod
