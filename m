Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007766;
	b=EVP6HxuHG4vlhUUodKAvt0ydAftZtiQelmAwK9dtMMrHgC3w9VuYxWopEXcVbAYWzHEA
	 I8A/hRAW0tTcxA9Ss31jUaPoGO3hRHnub37p6TQIfLEP443seLzS1aPlBHzE6KErdxwO+
	 8Z8kIknPcAP0N05pCzHiZuDxjI7nC7eoN16Md/a2CUeJqLTWpSAZ5Z4Czf8wu/GwpEpT1
	 ICTi+k7gY+ZBYmuQbkFfedl97C0+R8g5/fiXAbejBd4qodNDRsKmP6r+m7NF9mK2o2laD
	 RiBDjKpwLjXhGf/L2f4iPObVo+tUw2kEnFtYvlEGrzkUMs/SMhb60WFrLH/6ryvlYcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007766;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=LVM1zKwOem7H0QI/yuEoDgds1LHQI9owDhiOzYcdXp0=;
	b=w1cqGMmeG4QBiZGizCHFXHYnhZ6uRlFvkVAQX3mXx9W3Gioqea6WVn6+cLZlQEzwbig4
	 vEWPZehdo7q3QD7t8hNGGqbl0A06gZqqFZGL7m0m3DTB4kJVTkdKkkrZdh62c9W/5Q5/3
	 ceFobWBscrbLd3oc7jJVjUo2TJeSuS2VjX3l1o3KYTHYsgr+8TR4bNQ2Ll5cXoCVxhVKs
	 gjpWVS0HfAfIUQNIm8hW0ETEeVRvWQczMiqv2T19zYiJluzkFHCQ6P+MiYuNPm7IqKSuZ
	 Nn6AwtMWZ1qKb04e3tA9laCt+VNob+dAiyNSGi8B9O/IAZFMphVfGTDK59zZlOtK18g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WT8IsEt7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14832606A320;
	Wed, 18 Nov 2026 13:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WT8IsEt7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86CE91F000CB;
	Wed, 18 Nov 2026 13:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795007765;
	bh=LVM1zKwOem7H0QI/yuEoDgds1LHQI9owDhiOzYcdXp0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=WT8IsEt7X1/cDN5NAXiiZkei//2xi6oSIf8KUcpx0N4xnsgiNBj7OgjukpiVknpUi
	 tEWXfkBnevD1A+68DETxQ1R17J0pLLlj7C9ws6A67pJQDsVX/W31pGUq3jU/9sI0MK
	 7TGojM5ujZHe4TTToNJIJzOZL9vCJjuMTnU/m8wOHZmmTA8BEbTPKAll2cQv9i27f5
	 u032/BslNlrsD69OZRA55dGaztv/w4JT778SBKejw3898nsrKMtg6chuLAqBilrA7n
	 qnbEC8BUiQWJ09M/JNh73fj76yAt2wAxmsC2hPRMnNZIVl2vfcH50byJdtKB1ysuf+
	 sV6acvUK17VBg==
Message-ID: <fdfd177d-b7b5-4583-9dee-b7c593c4a059@kernel.org>
Date: Wed, 18 Nov 2026 14:15:59 +0100
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
Subject: Re: [PATCH] arm64: defconfig: enable the SerDes PHY for Qualcomm
 SA8255p
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118-qcom-scmi-sgmii-phy-defconfig-v1-1-d0c7d2e881c7@oss.qualcomm.com>
 <c20a2a9f-f40d-4ef0-9aa3-f6eee24ed2b1@kernel.org>
 <zcqjdhqvdieq7kwbhfbw6s74q35xedzuzcsffsugqgz7yzfs7q@dynjfs6njtix>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <zcqjdhqvdieq7kwbhfbw6s74q35xedzuzcsffsugqgz7yzfs7q@dynjfs6njtix>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/11/2026 13:51, Bartosz Golaszewski wrote:
> On Wed, Nov 18, 2026 at 01:42:57PM +0100, Krzysztof Kozlowski wrote:
>> On 18/11/2026 11:31, Bartosz Golaszewski wrote:
>>> Enable the SGMII/SerDes PHY driver for the firmware-managed variant of
>>> the Lemans platform. This module is required for ethernet to work on
>>
>> Which Lemans? This is a generic defconfig, not vendor specific.
>>
> 
> SA8255p as per the subject line. In order to not repeat myself, I called
> it "firmware-managed variant of Lemans". I feel like this is
> nit-picking. It's pretty clear on which platform requires that driver.

No, it's not clear. Only you and Qualcomm knows what is Lemans. No one
else knows.

I repeated this feedback already 5 times this month and then every other
month as well.

> 
>>> sa8255p-ride.
>>>
>>
>> `git grep` gives me only piece of a compatible, not even DTS. There is
>> no such board simply. We don't take changes for non-upstream boards.
>>
> 
> What do you mean? The full compatible is "qcom,sa8255p-ride", I dropped
> the vendor prefix as this is a commit message and I mentioned it's
> Qualcomm in the previous paragraph.
> 
> The .dts is now in next as:
>   arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts

OK, I looked at next from 13th Nov, so indeed a bit stalled.

Best regards,
Krzysztof
