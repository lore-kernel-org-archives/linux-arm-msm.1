Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964269;
	b=FcbPTAyo14frsi2+MghpVDnq6XI6r8NtqSI+ZrzMfYAhD6SYC2OKdbdiGvTq51pNVFp2
	 +vNL3L7mH5s79lqSnokIWg/XfR2XOkEv0y9HhccenaRfSGAhWHsK2DgR7BOqU0Z3q6Qhw
	 FOBtQQbAhD7PxbIeNiNT7jZ/jRklIBYg1OBAsjWPJGWJCtj9WHHmx2gwWnOjQ+RUzT+p4
	 SSAPYalblD2YsXDyL3YBCmNTqfoCnT9bptdZISVykMPx+iHKg2j6WVZL7P4dicm3cUR4E
	 sXvLKkt1J9+68b2kfcrLjRELzTTPyL7rUViX7i8ZN8Rsge62XDH6d3sSDmbhuAeNguQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=WwjQyPIcMFf7inP5N0uSPmx3oh6JUfGi06PvuPXoUmM=;
	b=0VzNGS8RBhw70/LnslN4rg9znZaJsI+Djoo8hpEz5zRg5xQ7YJBX0L+H6nlZxVuFHLIl
	 /KzmPH7rEuQWuRLdhBh5B0M6Jt4WVzZlGMh2+ZSfGXiQ/NOa6w8XJOi8ZccbCWL7TgiQ1
	 CsdmesMJpBwasyOq7BF1PnoNG7EnQ11ktNV0PvpEwJCEOWrVufvRrx5uYF1VFHW87QLWM
	 UVNykmS7lKdOk18GGtunYVFHIx2XjYS92s8pz1OOP4D1pJtQJhkq38NVKETeM9aPMQszo
	 gt9QCsOosAio2tESJ6LysS6DTRjN4Jxx6AZe8KNo/R8ff7hyGTGo0L7ExGOG0HR8l7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=W7IAD3j7;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A949606A329
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 11:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A949606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=W7IAD3j7
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so4674025e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 03:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793964267; x=1794569067; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WwjQyPIcMFf7inP5N0uSPmx3oh6JUfGi06PvuPXoUmM=;
        b=W7IAD3j7PaGIDf/91PYdduPoopl0Q9ouvdY8e0OR047v2ydGBma50bpSXkBEDgiY+F
         5mQuqBExoEcIOhhqpi8MF/uGL1PVDtpHhPzeeI6iRe+aouiY5xYpVbqhyraynWZ9wdnK
         4AX1q5fpb5JivZx6yqIXU7uJ7FG7Lzj6bdQwou6uHde8yxu7rxwOqf60SWh4R1tfjQFL
         BTT4WF3Ab6pTw/xFW0rPqX5NGng2RDBa+uLSyavxZ7J5UFgnob1Dge//nFNmZCb6uBYW
         yvu0krcLOcah4SZExnmyIBhpDNDH1mmz7cVcy+54rbY0P43O8Y4PZ5xT+SZiPyxzhTBN
         GA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964267; x=1794569067;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WwjQyPIcMFf7inP5N0uSPmx3oh6JUfGi06PvuPXoUmM=;
        b=Ic/de4C51rd7mAndWZbIx+XZe13bPd2QLz+/iLIVmHOtxNtxZMq0Kq8wXMNFcqfZiA
         xlPJbmQvDLPJR5OCV/zuZBhvy0BybOv5RFtBM7hEPIJjbR930RA8G31XjODU29ihvC36
         TFdG27odFWzYsJp+O+xmdFFxoLoMeLcKfihpKyCIXaitR0IXcG11oH4OHjvpfqFaPq2n
         mTvNe+BmVF+vzdotn2rKsKURZl+E0XpITdV+iI0X9R7Re5hylZtvtEbXKCrV8ULu0O4s
         kKM9LcFiYCAGfkrS8Mon1DQK8htM2GAq9Blf+EgaU5SKbids4yH23Sxyx7sckG4zHYMZ
         JWQg==
X-Forwarded-Encrypted: i=1; AKwUvBx+oP7S3cDt8oGoHNp51X0QelDj/VSw+h8jdXjlylGOI/FTEzHqKx9+bRwKKzFOtGPpx6O2tdTzzq0PtUhm@vger.kernel.org
X-Gm-Message-State: APuU4Z9qsYIvU3gxuA/2nchYiF47bEZgEl74JlckFi/Rzl0P5hFECKWN
	T2avvuq6WpugLQWjgotEgCgRP6Gn0jbOj3+4T51YaIGJ6/JF7PwxvSo4l9UWaU+du0w=
X-Gm-Gg: AYBFou2QXgJWJwot6qXGaaXtw3qcPZS3enifmUfj4o/l0nbL4+6rhS8YzLA1CIWPbL/
	H2Jwrvay5qtbgG7e2uoNAGsU2DSy2j6TiQGNUgyMNQ+PhtGXIyptUjF0pOBGkK6rn5qIKAfemfh
	xedKkp35l5gxURZ+gCxq0AI/518XQnz8YU1trY8lX43H43wKhF3PEcOTRx3Sqpnrg3oJb9JoJDZ
	P9su7ObAzKpeN2dvP8m3Yim3ed7ftA68gi3w7CFRcfjN7CH/OTlL6s+GXe7iYfRELUIrg2kKOVr
	AhEBoRgK5fJgSRzNEGx28RoOflLIWpa+s6AnTeXAhiGtHtSr2UOz2kZOxKKZi8tC9CHQzXy/iWV
	JDlzaTGyLy9uRo4MUXVVfrFQWNcbxU+hujbPc9uirgcgSFSHoHnugQ1O9hKCMOQNW7JqFLp7/bg
	0WBtpKaoPcXAz0/IRLft+wGfAto9oa7qalAaVJJn6X1I1/xFWu86xeaIh/6sUAxdmJ7RCyQ6v46
	K+1fj9kq5mLkfH+WGxS3eviEJOJ96y/rHNJiGmqLdv9Zyy2f4Lhf/xG7791vVIlb7UiZvfPlUQH
	DleifFRYFIsyvaz1Y0ZZb5CFC4xvFTk0QzVXVL8fvw==
X-Received: by 2002:a05:600c:4443:b0:4a5:a5ca:de1d with SMTP id 5b1f17b1804b1-4b6e091e588mr38640345e9.30.1793964266527;
        Fri, 06 Nov 2026 03:24:26 -0800 (PST)
Received: from [192.168.0.167] ([109.77.115.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b741cdd8d7sm27597265e9.1.2026.11.06.03.24.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 03:24:25 -0800 (PST)
Message-ID: <1fd0e1a9-ef5a-4fb8-8c55-556b62b73ace@linaro.org>
Date: Fri, 6 Nov 2026 11:24:24 +0000
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
To: Andrew Gigena <mail@andrewgigena.dev>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-2-7a9534a9a22f@andrewgigena.dev>
 <904675e8-701d-4fd6-b418-6c0dcc9288b9@linaro.org>
 <5ba03b8e-1d51-4e66-a802-37e63814f5d5@linaro.org>
 <CANn8UmccjAh7PiLpbGHrhDR4yn=w6uiDYU01aoZvBs-tGkgNsQ@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <CANn8UmccjAh7PiLpbGHrhDR4yn=w6uiDYU01aoZvBs-tGkgNsQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2026 03:06, Andrew Gigena wrote:
> Hi Vladimir, Bryan,
> 
> Thank you both for the review and for taking the time to explain the
> direction.
> 
> Vladimir: I understand your point about the stand-alone CSI2 PHY model,
> and I agree that is where CAMSS should go. I hope this series does not
> give the impression of entrenching the legacy description; that is not
> my intention. My concern is that I don't think I can do the PHY-API
> conversion properly within this series: as far as I can see,
> qcom-mipi-csi2 currently only carries the x1e80100/glymur
> configuration and no upstream DTS uses the PHY-API path yet to take as
> a reference point.
> Converting SM8150 would also affect the other CAMSS SoCs that
> still use the legacy description, so it looks like a separate and
> larger piece of work.
> 
> If I'm missing something, or if there is an existing branch or series I
> should base that work on, I would be grateful for a pointer. I would
> also be glad to help with the conversion as a follow-up if that is the
> preferred path.
> 
> Bryan: as the CAMSS maintainer, could you let me know what you would
> like me to do for this series? I am happy to keep the legacy CSIPHY
> description for now and follow up with the PHY-API conversion, or to
> fold it into this series if you think that is the right thing. I will
> follow your guidance.
> 
> This is my first submission, so I appreciate the patience.
> 
> In the meantime, I will send v2 with the review fixes so the series
> does not stall.
> 
> Thanks,

A) No top posting pretty please with sugar on top.

B) Since we are reusing an existing PHY init sequence there is no need
    to port all of that stuff into drivers/phy right now

There are several complexities involved in porting existing bindings a 
new topology whilst supporting the old.

TBH adding a single new enum to a switch is a much better immediate outcome.

Happy to take a SoC enablement now and work-up the switch of older 
binginds to new over time.

---
bod
