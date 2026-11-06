Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964455;
	b=xRZekoIXY3QfR9ktHVPbzRyok1yvFwQnsTB0k1NnCUIBb0S44nj/+WXfCtvcMDvmN/s+
	 9408s2Djr6b9JaMy3vRFcEggf1lyPVWmi8j6AiGZ8vGICUztchqqEBGAdJECE0B3am39X
	 gowAA8oH7/sr9egQf3hBeBaJpukMdJXKW4xTiz1bRHzk2wdABuvnDtGGhz+Dwb6lMKmtz
	 e0Q6JJAaL7pUqtV9Abn4S8OU76jxqr0GJEseO2w0Oe7wi0lkyXkFR0oZGFqSiXWzcLu3m
	 ZEDlzk4akRKCLGsRREt4xHWAx82ajdV6e348s7ap/picLsdsch/WDifuZ6Kj2nBDEnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=GqsfXmArDx1BFEFrYigXSG4u66Q+cf083qtsOl4mkRI=;
	b=YwwOQB3JxTRXzM/WTcK/xE49qfxIWLiqmXvtXemKcucZxCa4nrnLZvfDeHaCmcI+sK+Y
	 WxeU5jiSGD+glXwlAmSFkpCz7WIYR6LjlgxHae9qiV/+7ZbBlHasUXtUQocZXNw0lG9by
	 wLDUg4GG/FT1yFlCN3XUhoi2CF3CYbZkreQjkrDPnMBAWZtYIoHsk1+07cw5xurWasbtX
	 5zsqFkmn5/04BtCJcEoxx7XNgtPhPUr67TbeB/xsuBlpaO7SBGvnimlygU2Kxn2Ua5yqJ
	 73B3tcFxqUF1kdnbUJSXFQ5kezBKudkqeq2nQhsvY5ezLzA0Ptwxpm8pRQPVmMI17zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="zXO+/C32";
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84664606A32E
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 11:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84664606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zXO+/C32
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4910b863b84so1134724f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 03:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793964453; x=1794569253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GqsfXmArDx1BFEFrYigXSG4u66Q+cf083qtsOl4mkRI=;
        b=zXO+/C32AlStvgI0+EYAWE2/Lakk51WyJPlKb6utiwbTK9+74CTcnXu12Wf+J/7NuB
         BdOoD4ctlP0nDHnnTAP14y2UXjeKB14fwhpho2iJ6q3ClTWXfFk6Cj7nJ3WNYSFpcTMg
         jbCSpb8ga0BL23ipmALQoFILzAVZewCiMgRMMW2zkFbS9UT+Qybk7Io3KpC7M1GZdodh
         a4QITzKhwTU1iA4HYSCnhVhpR2eMx2R+icRk2lyGDB+DtlyGJoVlMLPk2lzYyA7Btcjt
         I/jJS3hmHNXqxs01UtHPwjiHIwg+VofbkfZQOarqN7o6L2TO6HQavWc368QZ0IZdGvhP
         iBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964453; x=1794569253;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqsfXmArDx1BFEFrYigXSG4u66Q+cf083qtsOl4mkRI=;
        b=0QeK8QitHlKegMW3nv/TsY2mNCL0+FGdLs2hMtxATfYisA+sXX0y0wdzfEk1l4LuCr
         JzVU0h1Y1s38gL61LoX2hew4CHHZXumsq2GsmqMQtO/OWrGMM26PyDdAaevPf8jKsUl0
         v9icHs4BhuiGiQbMYnuiEnEO6esyFMPI50lM5Milq25LOjXJG6X9rhTq9Lu93EboJrov
         4ell+dM8ipVVGxu02K7wC0RzK3AwmRm2R7rOR9JgnOIqLob736zq1+gOsiquzSyXnBcg
         2XwXeaHnMDdwCMdMXz7/gl27JeTwuQ07grjnRxm7wrGP3hi/6K8sOkeEveTq2BcJ5qT7
         PEpg==
X-Gm-Message-State: APuU4Z8V93RYl4/Kf8dbG3mFzu2wlBycx59XPYcNgy45dOiVAxnyY4WF
	L7+l+Mvd8h9pGCUCD073h9+/DDlGJ26PPhaphN6YIXGIpTT+sLIWsH0QDuP3xKOpj34=
X-Gm-Gg: AYBFou2qylOljMTFH2RWEQpu9dbKeo36J9kLycwh8hFW+G17TMqFxqM+eAkFv17dAqh
	Eisa5PVLcK1MsUTqaXAb7zy1eHvwkEi/i+aZpWpH7OUZc2QEsO2kd8A0rrUfqg82BwxXZO/0Ysl
	py5d21+LTxFk4JqH8PSfchvKFhgCIfyk6zON8BQ3f3TsBO3GZ6v4R95qqT3jZUlnms2vU/baROZ
	xh2o6JkGABWT7sslTTLHtv9rVrazU8rr93lYXWOCOsg7J38ireg99LdyeupzjjjNhcUaXorgl0G
	xpXX49TSvZ0Yr5+3PyYyqcjRwAVNqCG1wQWN3Hz40d4MwGDPzau76GlPeoySEI2tFhqUEBgTDBI
	Tt0yawkZZ5Isc3iKkSiAOtrnt9FkHJ7PV55Q4LnlhV/Io82CDYrS1XjKPxrjViIpYkuQe88s64a
	MisQZ3IRbCRPt4x3w2rDDJnarV7tpR33pwz809LQPfL+AeRlBag2o6wKcdZM7JFvE0PQ4Fh/LAW
	+4A3XgzRoCPorOPTy+xrZ+T+2C7LNPleBXU5tscH9IMGiDXLFfbj6emXKpnsdd036oJwfFEasjx
	mcS1Xpr/0yAuiUgDN6nRKdIYYjm4XBip6lNEkK50CEep0Azr+4AURoFlSkCZa/s=
X-Received: by 2002:a05:6000:3c7:b0:48e:7475:fe7b with SMTP id ffacd0b85a97d-4911906d185mr9499122f8f.6.1793964453377;
        Fri, 06 Nov 2026 03:27:33 -0800 (PST)
Received: from [192.168.0.167] ([109.77.115.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d73286cdsm2941196f8f.28.2026.11.06.03.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 03:27:32 -0800 (PST)
Message-ID: <e210c5f1-6a93-4387-ad1f-66d4ed35e00b@linaro.org>
Date: Fri, 6 Nov 2026 11:27:31 +0000
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
Subject: Re: [PATCH v2 4/5] media: qcom: camss: Add support for SM8150
To: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20261106-sm8150-v7.4-rc1-camss-v2-0-39ee37787b00@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v2-4-39ee37787b00@andrewgigena.dev>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261106-sm8150-v7.4-rc1-camss-v2-4-39ee37787b00@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2026 03:24, Andrew Gigena via B4 Relay wrote:
> From: Andrew Gigena <mail@andrewgigena.dev>
> 
> Add CAMSS platform data for the Qualcomm SM8150 SoC. The camera
> subsystem contains four CSIPHY, four CSID (two full and two lite), two
> VFE and two VFE-Lite instances.
> 
> The hardware reuses the existing 3-phase 1.0 CSIPHY, Gen2 CSID and
> VFE 17x implementations; the CSIPHY uses the SC8280XP lane register
> layout. Add CAMSS_8150 to the version enum and to the shared code
> paths, then add the per-block clock, regulator, power domain,
> interrupt and interconnect resources.
> 
> Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
