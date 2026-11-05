Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872605;
	b=pBvQsols6IndC1OxypW+iWaT91I+8EZYgu10yiPZKUSgOJ0L4JZNaLiFX6xhelATPLXZ
	 BeiWJLTmzbon/QG1veytNhL5nO6YXPChUwprMISMG9viLBN6zu7AtppKUUt83IisZvpQf
	 bh1hgrH/qciZqiU8rSQKIq4XhbR/FvasF/4S/zBdlSK8dSAwQui3kZ32A4AZFduqqzZuG
	 l0XODEa6JH6liLkh0VEER8SLKlvNMftP08OiNh9Z+rfulk0gLKOV75oVXb8ZM14uDT7Hm
	 uyCSJ4cy0BmmgRraIQbx8tmo9fGjZOSkeQJ+9kzSsiNDUiR+BTSQ1rTWewcK5erIz5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=2frlz/ems5IejHKiFsfGGWOinpbQU8f1d97fQ0qUPvQ=;
	b=3ynTiLG05sa3+0mbtwWv9Zj4EsaiO3i5itciFnMwDuH0xa7gW9Gs5xTYXiBBYS5flEjf
	 TYZpOdxTfLhtQZj8kuh/HcbptrtBidMJub7CMj7mdbHZfYAKaCzkgShYcLwr8vKvSbfbB
	 chKObEeCBugdU/qsyWHvylerrjeK7SQkHrmpXP+HwFI7QuONVdROXjGG42Y4BpNrYj5TK
	 J2EU1lgo1ZmDoAd8YUnb6PNKV7UdT40mnSbqY4k/cEPNU7K2elHBq9jGDdzCbD0oXcPKC
	 F31nVMLQF/6MC2zPFTRtAZYjvwgDZ0tzI6+VASWoh1pfHGv3BkGWrFbyPCQVte1FlTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="iEX+lGE/";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14BA606A330
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 09:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B14BA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iEX+lGE/
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso12846315e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 01:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793872603; x=1794477403; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2frlz/ems5IejHKiFsfGGWOinpbQU8f1d97fQ0qUPvQ=;
        b=iEX+lGE/bIUyOkTKslBRe0Vr9Go2pnoRPTtF4VMJljqH9BHFaC6Lcq0U63Nxwz9730
         KMEubulTOJC60T3skacMuGfKdJCRouE3/yQwChyXueGlZNHbT1RB3h0A19ZvPqfux/+7
         v4ISUE2DjCJfubXmbiVpFBcom6Mo777vsKq1aTySR9bQUNldKuDpdVQOks7fwvN287GW
         GG4+wyuFrXZNUaF1ax7i1FbPaB/2bPABfb2GuY+1OXZO7ZH1xfD697yUYefytNspXdca
         HBer2y/cskrNGHLPtE7LbCUscNHm7biKiU1pHuvMLMiPKi43+yE8rtzNffSpECIHNS4s
         4MqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872603; x=1794477403;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2frlz/ems5IejHKiFsfGGWOinpbQU8f1d97fQ0qUPvQ=;
        b=BLw7J0BS2n6/baYbmlE1e7Y8MQMFCRzHffZhciOvriQVHiLNQ40LyV1XYr3kULKuwE
         qo046TlNFRMEvv4e1CO2l76DRVI+ZcqT0KSiAep6pDC/gbwiNhCKWNkphalI/2tln+iH
         GX/7K6kq9ETzqPmAwEtgoowjJLc2KchKQWqn9d++qwtGPJlv4kOhIFLEdzusYUWcsftT
         A9gWQmnp4AsYPC80zjj0NZhy7K+49pZIoEU62gXYd7E9fVOUDofv4LZ8jpot4ygP9LB2
         eOlUo9tUlvfr1xFLLFDkR1CZufmVzY/RSX5UmgHHwI3Ugm3jUuVxMak3eEcppP9PPNuk
         tt6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzSrp/RQfxFP7szM0BPYKKhohh3UqNgb9osekiWzLBYOu6wBjMmfNHFEm3sDWdtqTiuO7sYTN7uvvWIEv4/@vger.kernel.org
X-Gm-Message-State: APuU4Z93NTR96EMtgVgIJQSeUPg8iworHPnQI6bkFNYITzD++UEPs5E8
	P6G71O+2HThqgKjOtw1zxnIKKB4LcbxB9243ulrIPwQGslW6Hz/hwmU7MYBy5gy5VyQ=
X-Gm-Gg: AYBFou0704rc4LgPVpdZE2/v+yZN2SMzyAv8ErjxhR80wOXogaICfgKQ85nlkAfMY80
	yOGigxw99wshWQ0DZdBamy1gclxDmpBqtReaURgVa2EB3uFBppOxekOXdEH7S2O+Mt0RZPu6okD
	m5bjseG9x4cogpvxNRzf+1cUwbwCzF4ozG+9OanO7wZziOcCI0fVKSs+b7uhLXOcJ4TdJLTMt6j
	sI2ZIxjE06yJpgqfAqeybhiAVGw+sZuAL9JQQcMt1vIGbEkhdUj5+G2FyGvYEU9CX/kfnZsA43a
	nWRRrxsi5mkafVlSo47XoColOr3BAhp5M0wbXQU4MLPE8gi9F2+qya49ULurNGdTKk4yVWbB+NL
	UDaxIj14wHSzAzDRjhn5I5pvlyRp2l/fpmWSxNmNCBusn7HVrlWAZnMtuWI0yPh/pKM+8HyLQV9
	Qtc/bvqzZPp+jsOHH1hFemYK9ucPFhpc1i5zyGro3tNgH8IJedovheLqw1Tds/UGwwHu+W9idw4
	qPSpK37WU3JLV2pgPRJxIw0glkWPG9KuC0i1qxGNVWXLGs6B1q/JDe4Da3p4mowYV7wDT9YPjW6
	/W0W+bbWs3f20PThQEbtDNQBxFrPbh2YkAuOjM5E
X-Received: by 2002:a05:600c:1c06:b0:4a2:fe11:9a8a with SMTP id 5b1f17b1804b1-4ac121940c8mr531574055e9.0.1793872603069;
        Thu, 05 Nov 2026 01:56:43 -0800 (PST)
Received: from [192.168.0.167] ([51.37.126.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b64809c39csm3908275e9.4.2026.11.05.01.56.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:56:42 -0800 (PST)
Message-ID: <1a644699-cc69-47fd-b72e-aac320f2d84f@linaro.org>
Date: Thu, 5 Nov 2026 09:56:41 +0000
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
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm8350: Add CAMSS device tree node
To: Vladimir Zapolskiy <vz@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261104234533.3044265-1-vz@kernel.org>
 <20261104234533.3044265-5-vz@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261104234533.3044265-5-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2026 23:45, Vladimir Zapolskiy wrote:
> Add Qualcomm SM8350 CAMSS device tree node to the platform dtsi file.
> 
> The CAMSS input ports will be described along with adding CSIPHY
> device tree nodes, which are connected to them.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
Missing ports {}

---
bod
