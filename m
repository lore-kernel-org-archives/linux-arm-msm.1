Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876628;
	b=sycN71F1hkdfgV0s27gpGDM4vCSeAqhy2IynhdJWLgc3+gET6SDsMN3cRAZBNzYnxxQG
	 L/j0ZN3eKiF7aWPWNvKK4T2VYhH6RWfcxeXdH5MKsdFavx8TpKkG223zk4/BE7D84XJtD
	 6GXWQDmQvjnwRPylGxmJNiqxBdre7AZtrAquhm+CDD4n56uWB/lpACCBbOykubtkV8jBA
	 PxFe2Bxp/XidLswDnYd+SGoNzw6/uTDmUdcyMs+asH4bycDufiQz9dC5+QQWbV9QQ5MzZ
	 gd04ULxt/th6f3sGmDhrK3Fe5Ds+s/qd/7Xtwo0YRBF1Q/8ZEUX47V33xocT9GwmvbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Gap8H+IWEcYnPmZ+NpEifKFD4ejmr9XNlelO2dmBy3s=;
	b=RFrKs51JM0YC0RCUPmEeoRvICoEozH6vVkNtDIDJYBf7Z3JJPB7sZS/Y6PWr8feyu8dI
	 8p+DsieMS51hfPk/BkZjvWw9tpIIesGuXOGe31GrlXSGG1Bz2D/B6HYV70SaP63zeYi9C
	 sZQHPjjBY/YZfAzZPEX+/JkQHjsgfDQFbNHkLtxYgw3/laVvfa9vNgjc5qL3DP+ZpZiFC
	 Y+SpDBZwEl6DuSs5+yDV2ejyDBj1e4rxjSyv2+zuJI2i2wCTgeEBDDIwr95gfU6ves40/
	 UEskYBHciWBpFgF8G54Yd0X/+P6PynBoWVVLN6JO1vn/caJCEfwlWvenqwkakZJOK6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZS6D4tKb;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93A2606D803
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 11:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D93A2606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZS6D4tKb
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1495988f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 03:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793876626; x=1794481426; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gap8H+IWEcYnPmZ+NpEifKFD4ejmr9XNlelO2dmBy3s=;
        b=ZS6D4tKbZiEH2mERnF+Ya/FotzT7AxXe9zZq6uitUC0iNulayZCb5AVtqeul+gaxjm
         Es6ERyVhbVZEVyshBUWs6W7AqPdzHtb3qURAq//6k1LUnB0f9cJ69onPW2nADa0b/AQ9
         RH8/TSuC/cmert5IvEsC3GDqI7Tip4oLqVEOuVpRk2HdPrSnm0nnyWXQbQgrqHY0Vjsj
         9yyliiv9jT11HqITClzAJrvZIdAXiqmc5tyIxFoO4RVXA8u9AAH3sS0jouyXvj7eZc6z
         JozuF292Oup3gUb15/SmhnZX3XHaq/VLHz/DST2va+7cGmRneaiFVG00jMGn0xE6ASPy
         C6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876626; x=1794481426;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gap8H+IWEcYnPmZ+NpEifKFD4ejmr9XNlelO2dmBy3s=;
        b=B7baas/EjGV+l971ApoUyjNLAljJCsekYXSyKheHYGth4rmGoiKFERkViwGghevigZ
         MAWcxLKtJm7acf5f5ub2LJLOXNXMOCB3j/6iJA4xMYVzryUQ3rdcpDeO06san9pmPbwL
         /viM8sTLi0S9K3XMFJyYZJiDm7ogujIsrpG0a67ZheZ2fvh49FHZwJjWwJu4Vs2kRj2b
         aA86xXqPCMEqrABqYKePQg55NJxVtGuZu5g08JuQePpzeImxCujGDq8588aZ9HXHTNI/
         sl5ThUfQykXMuBVfi9dnka/CtSnidei4utxH7EptvuTWgqgaJQmS0T8d5H4d+8NDEvY6
         dwHw==
X-Forwarded-Encrypted: i=1; AKwUvBy/0z/dQsc3ZaLZgwPlzdaJiyHVRaMdpWfHcMBDBI/Z2zxhD8T6gRZYPQGqHWVhzQrLY5u5thgvzKHMclmI@vger.kernel.org
X-Gm-Message-State: APuU4Z9YB27Oav2oF9YNUaewyvCxrtARsjVn1aubbOq1XCV+g8jORddW
	pzDI14oHQnY4lBqryKXO0BIwnbcKwgGOsvnjq4CrPGzFOMJNBFd5CqB+irLFzGc7AOk=
X-Gm-Gg: AYBFou2r+DGTP9kqg+rRcONTF4LmuRlz0zrWOLEkOWrAB6lXaM464IJfoEFUErKO/wo
	RdacxOhW9lSIFccIt/5eGshCVbb0INiyBvvH61fqXI0n69fD2qCgn4WKRyIU1fsBoLEC019ghZn
	5RFZpLhnQgXpqRRuCC5Svv/ZKTOqFnhMU2GwfvzAddpBc0Bs5q3KD2J98yIHRYbEevGbsV1X4Vy
	EAl6iY90rorPHimadCTnBVISBSh18e/43L3M3M1qnqr3Xawg5/hM88I/KJXu5XcYlJTa2Rf4epS
	y9LuRo+mHcvbcd4tyUxX00ydorrmNfWm6q0Tm/TwPS9Gna42KfTFc+YDdNfYSWC2jKlsexjX0OM
	0Q/iO4QyQPR0Mq9wDkAD+kj44tJSQ9pRY5B7XZrxxrnczXqWL1x/E0vqySCxrRYaLg2bM9WXqtG
	YfshtLkCG0DNSJiW0rw6zupN2B8TfQ5lRUrRPoahmWG7FU9i4dxYJhdThy0zQrZAkGXf0jVvHXW
	MTb6Hse400p9T6ksmxIx9pizRBeyfd18ztLs+3OTp+Ka6qSJHrPmZf3GxhSNIfa0zW4O8kUpolm
	k6x2diPzMCRBNrEtbA9jyJgTxmsKMLKBBImrjCfX
X-Received: by 2002:a05:6000:4202:b0:48f:bcdf:6f83 with SMTP id ffacd0b85a97d-48fbcdf713emr12222197f8f.22.1793876626103;
        Thu, 05 Nov 2026 03:03:46 -0800 (PST)
Received: from [192.168.0.167] ([51.37.126.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fece99a5dsm9321835f8f.21.2026.11.05.03.03.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 03:03:45 -0800 (PST)
Message-ID: <a59cdf0a-cb91-4c18-af0a-2e49e93ae620@linaro.org>
Date: Thu, 5 Nov 2026 11:03:43 +0000
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
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
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
 <1db9bf48-01d8-44fe-8dd2-7a3c84ecc556@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <1db9bf48-01d8-44fe-8dd2-7a3c84ecc556@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/11/2026 10:45, Krzysztof Kozlowski wrote:
> On 05/11/2026 10:53, Loic Poulain wrote:
>> So some chipsets share the same IP blocks, with some block/phy
>> instances disabled. As a result, we need to decide whether we're
>> numbering based on active instances or on the actual hardware instance
>> index/offset. If we use active-instance numbering, then yes, it should
>> be @2 (CSIPHY4 being the third active instance). Alternatively, if the
>> port numbering is intended to reflect the hardware instance offset,
>> matching the register prop, then @4 would be more appropriate. It also
>> has the advantage of directly identifying the underlying hardware
>> instance, without requiring any additional driver-side mapping. In any
>> case, @3 is incorrect.
>>
>> That said, since the bindings have already been merged in its current
>> form, we'll need to preserve backward compatibility when addressing
>> this.
> 
> This is the input port to camss, so how is it called in camss, not the
> csi phy?
> 
> 
> Best regards,
> Krzysztof

When you have legacy PHYs the port number indicates the PHY - this has 
been the case since 2015.

With standalone PHYs the port number just means "input data port here" 
with no specific hardware mapping

Which to me implies the correct port numbering for systems which have a 
standalone PHY is {0, 1, 2}

On hamoa which supports both legacy and new we have to stick to the old 
way of {0, 1, 2, 4}

Since any PHY can mux to any CSI decoder the old port scheme should IMO 
be dropped for new standalone PHY DTs.

Not sure what to do about Glymur since the example is upstream already.

---
bod
