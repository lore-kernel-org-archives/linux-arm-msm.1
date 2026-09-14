Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0017403B0A
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383810; cv=none; b=rgfodWOT3uyKdXzcuDd7bAlEep1Ck9qkGXizJnFvWYnEKtV0dq/NSfVN3vIi8WPEjxU9XjXq+VpqToFGg2dGM5srnPh3O9amPG2BbWlrmxeGGIDJtUmBjuKeKGrcBdd6aHBtOdlSm5RdJIg76Tq/GoFWq/vo+YKvaGC/Uy556Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383810; c=relaxed/simple;
	bh=u1qAW3Ps1/ms8o++TePT35PSy+z+WCTmNWWT04eGCYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QM/MuqZfpZskLO1I0VPHu16RBlXCLf3bU4Tyi6OXZk+mMjvrXGlb1RUaIvokLEuvoohi+p6gSbJ9FJgX0YEX0if9zrGbooRvv4jToR4Jgie+VFZF8KF6hIr+3JUh7m9xrxZIco1WbnEksoxnkI3KlIvzasX1Gdc9aAraFbViR8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vS0ld2F7; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vS0ld2F7"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c169ae1cb26so501718466b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 04:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789383803; x=1789988603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xbly740beuemqSo1bscqb84tM6a/tiFHYniiF7SfuVo=;
        b=vS0ld2F7cJuuK+ywGYMMAdd5Yi+fY+WhBzUAHWxaFr4PEJ/UpeToQjsjRt3xkBYX5b
         p+Tgj6TVvRe/yNdPLIl1fb5LUIQSaXT3CZKQ8tawm2cS+/LDYspSAb2tl3Kp2Y7+tEvB
         /O6ZYmMH1HNjJD0Os1SSe5z6BX6yrm9pi8spaC4c3K+adW9kgxTyv5kqLPE0zwP/ky2V
         kxGaYHywiEolYwJyXT7FCmOA6wPW2FjaZcbnmG+AODyqxnIqDRS92s7jtp5+AsAxpho0
         iEyURcYAAx6lskuaDffNKcpHBi2Tpqa2TXflnBqkOqlHJH2y8qsnhf6qALW4HizoQOYh
         kzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383803; x=1789988603;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xbly740beuemqSo1bscqb84tM6a/tiFHYniiF7SfuVo=;
        b=l1DrpgoKnkBliHb+sjgTKCyPfmATr6JEkH2l+QPTX+7Y11eMjI75nL4Dkqu6UREFxv
         Ef5kbKy4a/GcpXsacfcjkiCfOi9UUSkroLg3po7cGCOPrU5Buell0VHD2mieL2gMmsq0
         1oI8j5JmV9KxSfvOaQHIEIyoPssYJwz5uX3N+PLatP91RxCWWtKcZk67+Lbp7UPBmnCc
         3+aIrrWVkCiz5kONUOejAN1ALzk1ixAXlYgLZiixghV0Xbwvdut53deBo6U4EZ9MV8pa
         qIYsInwQxHRQ7LClc79aE5ePkRKRrIh0aOlX2l9xCtlM50hhpOSRzzVk+aELA7pgkNEZ
         9tTg==
X-Forwarded-Encrypted: i=1; AKwUvBwtEXbEa1+FQ5084144COCqqWwApPNMKT1+oNro+FnTPvYPsygTwpxvvY7lAxqlTNYawoVSgdxF4ZYm0zgs@vger.kernel.org
X-Gm-Message-State: AFuF++kCMTg0aCOJdsVmollTY8dzYsctxBPnt/yPdhTAmwFch1qywBPT
	hUkiPb1XTEFCX/rRReHyZbIexRFX8E69vaCv1B3eYguCElmtY9oO1+8NhFbf48nDHOE=
X-Gm-Gg: AYBFou26OELEcN5EWIqI0E8BflGfZ9cxehD8ThK0E48MvHEkOr1Ir8BRX6Pi7NiZH3K
	R2n7Zhp9oglRMjXHwqPzVfpMZ/fZFashSlpj3UBTckmwFGRH7V0gDYsZMeyUE+DIt831m7ECtfb
	0Q2d5wRDHbHZjKLpJuMKFVIazEA+vfMm1JqvYhwqoan+AFqP30ujZEOpKBMtG746WPHC+ZKxb2j
	RP1IWGFDuZFs3OyygD2Iplk1YMA437LDn+J5jISsl3Nv6WoELWwLaObSTkvLrvPQPd3LY29Pdjp
	D3Wryd2cuQsmqD6CiCNN+oHcZpHtfTF2atu74grCSSFQh/AJQrX7WRQWTmXqo4ln12acQ0pniNX
	0XKClIb4Ei1ULj6vagPfRDBCZdjfjFdfEowwuSiMt00lMF4kdtcCMoVIXq52sEqELV0nH18rtz9
	kpW0s1qMQRACyVeFAeDUevmzxUuqtpL1iPTRr6OHXH6HW5xHXy5gchHuu7H+qAKmKR6CaB71iA8
	RDUO8+I+C4wSQ0Jzrmj
X-Received: by 2002:a17:906:c156:b0:c25:833d:3839 with SMTP id a640c23a62f3a-c29a437c67amr329463066b.15.1789383803122;
        Mon, 14 Sep 2026 04:03:23 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.248.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29852497b0sm286364666b.38.2026.09.14.04.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:03:22 -0700 (PDT)
Message-ID: <ceca8547-ff15-4f5a-8844-8ec9061a5e6c@linaro.org>
Date: Mon, 14 Sep 2026 12:03:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 3/5] phy: core: Add devm_phy_get_by_of_node()
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-0-f7bd68b5369f@linaro.org>
 <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-3-f7bd68b5369f@linaro.org>
 <aqRuCfmgPqa5h0y4@lizhi-Precision-Tower-5810>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <aqRuCfmgPqa5h0y4@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/2026 22:09, Frank Li wrote:
>> +	if (!link)
>> +		dev_dbg(dev, "failed to create device link to %s\n",
>> +			dev_name(phy->dev.parent));
> Is it okay to print dbg message()? suppose return NULL or some error?

This should be dev_err() for sure thx

---
bod
