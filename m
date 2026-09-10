Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B729647206D
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 11:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789039388; cv=none; b=Oej0QeJpVqljjE9Sc6uX6uTKsh/HTWO8i85QsLOt2f59RIUYekUULF0xCSyr7JZDWDugbeenHrSRUVaLU1+65HzQMMNrfxWF7GB8o2wW9ALooSiXER3ngIev/W7vqMXgaGeMQodgVWqhqsYFWtyJQ1Mf4gxFudkFX6mzP6yMoWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789039388; c=relaxed/simple;
	bh=0rLmdhugKR3AaWo1I6VkwG7mO4YyZDQnlj/ImdNHepI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YOuoRboAw5a2XcgxKlk4GAdNXSiWzK9Tg/cmExqlZ56dccHWTLbaDLlMiEHjO1NPWmWjI13Bq6bXALus4X4NWUwnxSYb7bsi5up/pbo8anaYxUrYySPKOPPrMl+Sgzmu1DUnJjS/DCRbn/Pf+vWbra9PH/X01Sl4LmcEGYX58ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CM1vYxNa; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CM1vYxNa"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae52so3425984a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 04:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789039385; x=1789644185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o+RIOnrjfi5WjulGjMzj5AAE/stVLVJYNR0oKvYswt0=;
        b=CM1vYxNaXshAAEj7vzxBBmb9MSd9ozKxeYsYazQDIZJovZiCWIqerAqF0/tnDEXY0e
         2MeGKLVw/d3xqujrOkC5r4wyP15m9AT805po5NuMLjcvpvMajRmczEg3/DU5U/84yNrH
         7KrzDUHMeacHADxH7Iq7+LxJjeRA0zqJO9aU92IFfRZVTC81IuSwXth3apm9QSe2Qr6R
         ltozdJI2R4DZRcykGwIGPLoYeqIAdtnedvt2ZwUGsevyKYRYil9WF8f6n5mYyjgZq+b0
         tJgrVogw2sxbSkCOyeDzmOPOPleiwl6CFy0kAea6NZPoEsnC127e6ubUOpxzeVV7CzE/
         MUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789039385; x=1789644185;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o+RIOnrjfi5WjulGjMzj5AAE/stVLVJYNR0oKvYswt0=;
        b=g+cTo8aqEdBbnYzgSMhANdy6FissV7XUdVTzagoOVLtZSZYhHharOFJ2duchWf9CWx
         5LKyQbRXELG74N05953qY205JTO1UA2w3qo8it/gZi7egYxULzFh43pqAoES9jAfV7tR
         GNXSknTJjDE03mOd6V9f8B1PW1WKZbOTvpApqYtKz5ddGVPr+rMpZ/X5tHAH3BvBRBtn
         9hEfBoNEx4fN3+jkB/veIJetjrEXKxbe8qPUPSNFLLMYUK/V8cvgZCPlUmVJJ5Wu5Erg
         aWXT+x0jxNDhQcGWEbTOrWxAoujViIx1sRyTPO/6bNb+oIsF0DGfLhOP2tJq3e1vV6Tj
         5UyA==
X-Forwarded-Encrypted: i=1; AKwUvBwS6zWj4Irp92lfE4ic3XpJV/EmYhVVE1SuZSI9tGYeHB9/0q/gdN/JhlelHB5WLQAoqQ6HHrxMSvizbVbU@vger.kernel.org
X-Gm-Message-State: AFuF++kj5P6Pu7yjSLEPmtxe6g8HDTb3ryT2sBtwAp1ew8+DDo4UrI36
	gn2U7P2f12T6Zg3pq/5BLEAF9cnQtWXi9FdhYA3zGkJzvOGR1smt69nennh0nNQ/QBVjRA==
X-Gm-Gg: AYBFou1XEmYyTZtVjqeJB9x08cC3rPCXMGPiNTjjSlm+lduNFsff/gREgEuVIIp6w9j
	A3Qlp/BqxXan4hHCxEEkn+qxk+Z0KXatLPET1zOIQTdz+GPoUznRb1/nLeszEQsgXJdFPVy7SiI
	PjkmxjIgXVeWj4gnJFdL9EKxlxOptdKM3cl679QVmnJOzXLUvniXdOB3gP8xbWEqrHipdrM+8CL
	HvBqWIUVBQqjjMvbuKBVIDpuUKVdprxK/O/XzpaZ3QRCba8nRJ+RW3ecONag3XufEglNRE9rEVZ
	7K+565aeS/QiQGnC7SU6JAxWlaFJR6KKJTdkUmXth0n06rHBY+7E3t7u5UbwhdcR9MB8Z4Hm2Xm
	zxKvC8U0ymebdoJaCAZrsiAZnFuL5HrN36wOCQ/fYGlA0O7oRNuvVPgEIxMKmY6NAVzyxz4oIvK
	HWTNAFT7Y1ekQRnCXktxhq1VMdCnVfX0lIo7mAGYfvh/8cCOwUZlmiEWo8tbakRxjW2sov7OKA2
	eSSdcg5S7fzlkY/sOn7wyjnR47ifwqFuaFFPw==
X-Received: by 2002:a05:6402:4518:b0:6a6:8dd:c76b with SMTP id 4fb4d7f45d1cf-6a98df7ffd5mr9834225a12.1.1789039384622;
        Thu, 10 Sep 2026 04:23:04 -0700 (PDT)
Received: from [192.168.1.124] (89-172-245-174.adsl.net.t-com.hr. [89.172.245.174])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68c42c2sm8194210a12.14.2026.09.10.04.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 04:23:03 -0700 (PDT)
Message-ID: <51344c03-b651-40a1-8efb-f7e47c9f359c@gmail.com>
Date: Thu, 10 Sep 2026 13:23:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mailbox: qcom: Add MDM9607 APCS IPC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260908081158.2399852-1-sinyavin@gmail.com>
 <47344b6d-d64c-43ef-9344-0409a434ee44@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Sinyavin <sinyavin@gmail.com>
In-Reply-To: <47344b6d-d64c-43ef-9344-0409a434ee44@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Konrad,

Thanks for the review!

I based this on the downstream MDM9607 DT and clock driver (see 
https://android.googlesource.com/kernel/msm.git/+/android-7.1.0_r0.3/arch/arm/boot/dts/qcom/mdm9607.dtsi): 
the CPU mux/divider uses a separate register resource at 0x0b010008, and 
the APCS mailbox register is at 0x0b011008. But I see your point, I 
found SDX55 is using a layout very close to what you're proposing. That 
design might be superior indeed, although both would work. Let me think 
about it a bit more and come out with v2.

Best regards,
Dmitry


08.09.2026 13:02, Konrad Dybcio wrote:
> On 9/8/26 10:11 AM, Dmitry Sinyavin wrote:
>> The MDM9607 APCS IPC register is at offset 0x8 in the KPSS global block.
>> Its CPU clock controller is in a separate block, so the existing MSM8994
>> APCS match data can be used without registering a clock device.
> 
> Aren't you going to bind one to APCS though? IIRC the setup on MDM9607
> is somewhat similar to the one on 8916, although naturally a bit simpler.
> 
> +Stephan may know more
> 
> Konrad

