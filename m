Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC552C032C
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 04:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786422774; cv=none; b=cXe5cDpqFKojbiPvFX65wxPSFr7Sd0e3LKn3VDXvcKd9/g1ITp0NSnnqnn7Qm6+gbWtoT4VutUamMtcied3XMS0i9KJd3gFT6WnUduHyy3ZWGsxT0maHR3i2MUzTEleJhnH/stU6ebcsUZuryEDm11dDIzL82cwjP0KTpzYKgXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786422774; c=relaxed/simple;
	bh=fJmU+BIwJkrdiLINGSNpueASUlZY1S3BdHncMRZDVgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XQwvDwiRTCm24afZLbHEs4vFWGy8ozc2s3D+kiIYi9/wq0yMidnw5O5miWSCtthQ34NIRcigVLaiKiXVhtBP+tVMKyrU7E5WOub8fwe7uRr4uknm2FaJpNPr7/2WTs3tUGkoXbQ0d+kfZ8+Rd6JVUq33S42+l1S4DRScjyQgvy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MqDk/kHM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MqDk/kHM"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so29060775e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 21:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786422771; x=1787027571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uevAQqN80mKQhlZ8WcniYbzi6l/HLyUq4gvUDP8ovMo=;
        b=MqDk/kHMTP5D7zgVlfvttc6Mqka0uuA5mJNIjnDcWLghQRgUKUi1Ik8+LM4YJtXSI/
         kGFyikur818OYAyr1HI+XEczQXwmdGED48AdO9WC/AI99dBcJ5zlHQhAzyX5BFimml9z
         7vwFQZeBe60LEGHjuXh8GvSNFCe+/mpqyyr66yP/2+x8ULTM6vHJ9GtbYgj4MvaLjQP+
         qPIe0ckvCK51H6PVu2upSUo7Vc8XdCCtPl4FszM/3avS4QxFCqoFHP1AQL+7d2JszyRP
         tN+bCT8LfSoriys+tkml8vWCOS+SFMMdOGS7IiQRgrMw9RgeDfjtZYXDTL7+pQPYQezb
         u6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786422771; x=1787027571;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uevAQqN80mKQhlZ8WcniYbzi6l/HLyUq4gvUDP8ovMo=;
        b=mtyD+kTrdKP+a6a4Jksk/cZN5ugqbQ7Aaqz9WtNh7A+sELO+5wNdkQD6jJT9PwWr9B
         P9W4u+wWfv5ce0ZALeIm7sq87GBXzX8pgmJAmxmuFuKcnEOJLXc+Kl6WBAgruT3jW057
         vh/1BjyUOusIOZJ3GkN16L5eD3wlCA23bMfikh1shsEUay6yvkShLaPBeeRjWI0W0em6
         8fgsGNx3m4uDcqlBmHGA5FPElC9t0UF6furoHAjH0Y1kLmvoXAV+bFchf0EM1ugpRFWX
         /oaSOKvYXHn8smykXiM0v02MGQ+QYmXpwoJu3JA1U0w4tqqIvGcaIGWAoCrzLM9977Ut
         Jwtg==
X-Gm-Message-State: AOJu0YyhIqxBsI51fOH2pUgpg04ZsOfsPA8kXFQIw93yTLymW5zvPlbR
	pg5NgJmLQMra0Cw8UZuHWCiOdzWh1jD6PdT8M+u2jZGsfPhMg692SIbp
X-Gm-Gg: AR+sD13c7nWz87AWDvjGkqLI4oRfWkMLoodZ0+HVy77SDDy10BV8q052Q0N/vU4B+Z1
	/pNxFMJ1HaGYDSLzcAFgOuCWz+0PopIlkt7ixoyqTsVUvEF12L/YECM8uUi1AKCeSbmsN+o8iiN
	ZAOJ3zj2G+fgXd3RPX2rqIyQpco5LOwD6McntL2izpLBeV1tv+3GVUS4nH2pKD33f9Y5B//P/Pf
	4ZXirAqJtzt/M63mquV8Xh0dpxFC4EQkInInv5G74n/gVchgQLgzv46meYinB1gzyvht6AsCArt
	WIWNdzZOGmLWva3wUAU1K5Zk+EUW6zfdgWpjLitUerOxI980z2xzi8/VJfq+VaP20C3X/jnk5sT
	RM5XAdGYV7CKFDjl6Rpnnq3crkRAyFak+b2pHTWrymM7wt/GWTIS0UFd/1Kxmd00gv/+2hIo6B3
	Ij6KxFDiG+ieX3kt1Foil5KNjaiw8lM7zvnZ44EvMiS0R94QI3P2Icf6bPUeDTRwuT
X-Received: by 2002:a05:6000:4a19:b0:47f:ec8a:214f with SMTP id ffacd0b85a97d-4814adc3281mr627184f8f.15.1786422770569;
        Mon, 10 Aug 2026 21:32:50 -0700 (PDT)
Received: from [192.168.0.104] ([88.223.153.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4814a6b2ea8sm1050589f8f.16.2026.08.10.21.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 21:32:50 -0700 (PDT)
Message-ID: <71c1a0e4-73f5-4c22-a443-731be59d0d99@gmail.com>
Date: Tue, 11 Aug 2026 07:32:48 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm7125-samsung: add initial
 device tree
To: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>,
 phone-devel@vger.kernel.org
References: <20260705-sm7125-samsung-v2-0-d3b17005ecb3@gmail.com>
 <20260705-sm7125-samsung-v2-3-d3b17005ecb3@gmail.com>
 <a89e90e8-a1d3-4e70-8714-c9862044a62d@ixit.cz>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <a89e90e8-a1d3-4e70-8714-c9862044a62d@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/5/26 9:41 PM, David Heidelberg wrote:
> On 05/07/2026 12:30, Erikas Bitovtas wrote:
>> Samsung Galaxy A52/A72 are devices released on atoll (SM7125) platform
>> in 2021. Add initial device tree for SM7125 Samsung platform with
>> support for:
>> - Framebuffer
>> - GPIO keys
>> - Hall sensor
>> - Vibrator
>> - Regulators
>> - Reset input
>> - Real-time clock
>> - SD card
>> - UFS
>> - USB
>>
>> Tested-by: Stefan Hansson <newbyte@postmarketos.org>
>> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile                  |   2 +
>>   arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts   |  20 +
>>   arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts   |  20 +
>>   .../arm64/boot/dts/qcom/sm7125-samsung-common.dtsi | 536 +++++++++++
>> ++++++++++
>>   4 files changed, 578 insertions(+)
>>
> 
> Nice,
> 
> Reviewed-by: David Heidelberg <david@ixit.cz>
> 
> small nitpick, the Copyright inside the files should be yours, at least
> unless you giving up your contributions or you been paid by LF ;-) .
> 
I replaced LF copyright with mine in v3.
I found this patch series from a developer who preferred to stay
pseudonymous. They were licensed under GPLv2, and I got in touch with
the developer and they permitted me to claim ownership for these patches.
https://github.com/map220v/sm7125-mainline/blob/a72q-6.10/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
> David

