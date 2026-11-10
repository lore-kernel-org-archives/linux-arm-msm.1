Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794354734;
	b=Ms02/kcIZHWU37m6O5y4qKl+1NgI2uxRJnIMboT8E3knBszZ/WDgRiFsnOc91FKkNVOQ
	 1L/sItlBuXsl/SuMXoIXxZRSxehfG6xWvCPm2DXwYLO/ZMPSKpyjc/d3eN/qtb7Y7R1vj
	 F3mjJvIMU8f5kZBxl690XTZC3ytkXaP9RUz8HYXzRPwmM0051+fw4jX3bFJIbfUZHtugx
	 +dAYZfJnkIRT/Cx58Cw3ZHPHFdiIhCZPaM4ZKgNUKiTXISfGDatq5e2m2M+k/koo4YZZi
	 4dS9ZJcUJEgbfm2OgkSyLJvZHL5M2cpCU91ZX9f25A3cUVy/bKX2rjyiLrZu3I2BfkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794354734;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ZW6/d6tafc93+2es2jKCUdQztkgttkGrcDy02n1rkws=;
	b=j1aoEXb3NrBNVf/qYCvLU70dXSaTdAz3vkT7reX8ahqyrGKg0FjeE1qK2PQ56WRe0M90
	 W8S9hgdtKeOpYwUftWskXXz0Q9+AtZh/Rur5+cDK+uucYzrCt4TuKKqvjNQ2YonEMoEz7
	 QTfg+3bUns0FmGGj6oRgRlT0nkWWbD6aeJWSPf8BPTNxs6aHqCIdtGXahbGxEqrDzMAtT
	 f+6kWzPbt26M3op1KLKxpXCcnYtK6WwrWSkQEWPHLxHApFzRnyAq0HHxvaooDppFQsLwN
	 4VEn655zD3c035s4PMaZaiKIgz+7keijLCz0QTLRxTc10RuRneGJSRoENUG+lXiwt4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB247606A33C
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 23:52:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB247606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67be7b9abc8so2310901d50.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 15:52:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794354733; x=1794959533;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZW6/d6tafc93+2es2jKCUdQztkgttkGrcDy02n1rkws=;
        b=sPyWdFseeDqnupHY+j7KmTvCMl12Yw04PXl1kWWlYJIsj5tCv2TlvVgHowEg3Dm6Nt
         kbmKpiNqYbN6lWBtgAZ23vX+9SEZuEchNUyPLBrPQ6icLp6B5wIVCAPeUPZkxvEZa48z
         pclfR4aiPTntqRQhVCZ/dQteKpVuyjmhju+Mo2P4a922umkwlcIe+y3kKi76Fu/dKbuR
         KZH/a98kxAiREMpWKgcgaKz00sfzmnX/Bjtkse3ICYFSchX+XGl9vgQ/5j99iPkBbRfx
         yRcDDp4PfzYiF3UbbOqkNY+/qsb4an0XWnXz5vaDB1eJemKX55J2V94g+Cde3znfIS27
         j7/A==
X-Gm-Message-State: APuU4Z+7qXoVW44pXhVybrWnJkgNuaSAW2DItbYxRPCYMpdWZ4vsvfXL
	RnYrVXVx6A5DbeJSWjaBZD+Lwe7cU+G88474ef6k9AdA8whdP7doPDZI
X-Gm-Gg: AYBFou1cS3skSSFuNDl4h8cd3T68sM6BkbjqSUukSWOrMpYJVPHE0dG0hsGFr3lOVQs
	1BcT8RMoyvSF/6DIgAHVXgiMN3NfMvY+eRRYMPnKPhkTY/+IcDF4X22PNgceBiTexn7qtdjieZj
	1HDFMCb0FBh235ht9JtMTGg2MI8fcuO5nksk3TZ6SeHidUCMMWY9MhF84Qa4nQ1KUJFbJQ1HEki
	Q7ZcaPzAYl2t748zN1jQgUJSzGxKwuuETiC210tXgMNu4Vfnbk+okTTaa2rrZ2mh+kkWbvEcy5D
	gszb4Wq5bgEihAIapBnKFYcFTDtCEjVDD8M/R7uwiTzMPMCL10PRZefGSBSR4r+y3IUuVIGHmby
	B5IC664mD0ZUv/zUEyimYUDKhfxGGvqTNllNgYAdFio3ns4Ve18yvhMmu9PPppP23hPULotU/X1
	RVWrl5pX9ly9EjwsMlLUNy4QKIvtSi6ILgkWvnlWCHblSa19hNAyeMSd5mCNz5dPlfWDQWlPIhI
	u4WEAdlkmxD39KgmRUCHelUGsxc/wVkYqDh/08066tqAp3+BWw31eHoWUpumZZg9UDkcAjhTkgt
	ybcOZrr5TCxEd4ES2AvnF2zQLhIbMDD6hkRI+NEjpl+MhN0giWc87mn8t+U4BknRyZJMr1+B
X-Received: by 2002:a05:690e:16a1:b0:67c:17fb:ecaf with SMTP id 956f58d0204a3-67c67ee4a9dmr690322d50.26.1794354732657;
        Tue, 10 Nov 2026 15:52:12 -0800 (PST)
Received: from ?IPV6:2800:a4:806:ef00:2f77:7097:372d:6d14? ([2800:a4:806:ef00:2f77:7097:372d:6d14])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589f065dsm3149000d50.16.2026.11.10.15.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 15:52:12 -0800 (PST)
Message-ID: <f127954b-2255-482b-aa3c-cedd2311f77e@andrewgigena.dev>
Date: Tue, 10 Nov 2026 23:52:03 +0000
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
Subject: Re: [PATCH v3 3/7] dt-bindings: phy: qcom,sm8150-csi2-phy: Add SM8150
 CSI2 PHY
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v3-3-0103e8a0bbcd@andrewgigena.dev>
 <a9ab1add-5f04-4687-83bf-ca29a068ee33@linaro.org>
Content-Language: en-US
From: Andrew Gigena <mail@andrewgigena.dev>
In-Reply-To: <a9ab1add-5f04-4687-83bf-ca29a068ee33@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Vladimir,

Thanks for the review, replies below.

> Please double check if SM8150 CSIPHY v1.1 is capable of C-PHY:

The hardware can do combo mode, but the driver only implements D-PHY and
returns -EOPNOTSUPP for C-PHY, so the binding stays D-PHY. Would you
like it documented as "not yet supported" anyway?

> D-PHY combo mode is also supported on the SM8150 CSIPHY apparently,
> it shall be reflected in a way that two endpoints could be present.

Split mode is described in the binding, but the driver rejects it, so it
cannot be used today. Is it fine to keep it out until the driver
supports it?

> In downstream camcc-sm8150.c, PLL0 is on MX, and PLL0 supplies CSIPHY
> clocks. I believe MX shall be added to the list of 'power-domains'.

You are right that PLL0 uses the MX corner in camcc, but that corner is
internal to the clock controller, not a power domain of the CSIPHY. The
PHY only consumes the top GDSC; SM8150 uses legacy GDSCs, while on X1E
MX is a real power domain attached by the PHY driver.

> Still it would be preferred to get 'vdda-0p9-supply' and
> 'vdda-1p2-supply' properties.

Renamed in the binding on v4, the driver and the DTS, matching the X1E naming.

> In general the change looks good, thank you, but likely it can be
> embedded into the scheme for X1E.

Clocks, register offset, power domains, lane table and timer all differ,
so folding it in would need if/then blocks for almost every property.
Would you still prefer that, or is a separate schema acceptable?

Best regards,
Andrew
