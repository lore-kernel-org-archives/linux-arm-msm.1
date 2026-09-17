Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FE04FB9D9
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789649049; cv=none; b=F+s9JNqlGXyKEBFhfVrMyZZexLxe3jtPoicpSdjSD9chINWutnXWUjznIASqb1w2RYVXs4K+imjlp3B2rZYuOXR1tievuHgs1n+CmuH2XOjYkuPHtTz5AHPhQxWOGFJlv+ZrFdREsN1O0t6wAWxLaix19HDPxrAurWovO29NJpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789649049; c=relaxed/simple;
	bh=X++7KAk2FmgKKTdfe031N+A5JegX9n/upfzGbRy0M9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pNwrKrw/Hrcc1Q+OvkmAzJIQzx6BLOJ0Y6lnkNaARdKZSIyXdcNMWPB8Wx5waKfOEtJmIxf8Z7UT4706XJx0evbgeZ+eqZ7e34bFq1vF2IdGvpjhNwbYBCL01VGhaNzWfVXiFglyLFbqOpcOngDFOckfWMU0quzFNvR6sCoYI1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H+K9UVO/; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H+K9UVO/"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a64c7cdb46so1341278a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 05:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789649035; x=1790253835; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T7EV5DL8qRH0a/MP26yVs5lc2kWIGglCyt84hDRgCrI=;
        b=H+K9UVO/rzs+TITURqIIFQIdtEsgnkt36Gcksij51sflBHS7pb0Tf0ho02panhb/gi
         ZmyLiNLheYB/+rvei3VN6O4nQmhSHo9RdtPa4J0pUQJd2bos6Ln5ciSUlHHrUS5z4Tsm
         YgdTixm3vBp/N4rxxojEaMQR3D+osNRqIYO2PEDo2KFFT/KdJBsFa4YagcIj0Nctr0iE
         DFg+epZMXHQdT+mH3oPNYFrV3gdIdflt+Tn/2i3Hf/kuGugxLE+gxwUIzjUsLLfScMX+
         rgvYppHKqbhKn3BupkNje3PGrJO/i2BF9S4omEic+GJo7eiH2E3dDw2iowKsaq7E/vFl
         sVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789649035; x=1790253835;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T7EV5DL8qRH0a/MP26yVs5lc2kWIGglCyt84hDRgCrI=;
        b=NJ+zc+4gf8xlEVnTUA4yuDpCoOBXA6+x1Hd5cEcl74ffEWpNdjXIVMMuEFYLtSkjTr
         Ut7c2E0ZCHcIEZXeKUdEm8TS967NAZ+WOCO2C1+h4ur5AmvV4DEwtrJ/5UhHlOWpmlAK
         hQyBVOPV0Z5r4a2+GKVJukgSV4Mu/u1Jdg3dHybOS3hnWy7fTOTO9OxJT6oJ8/GkcBJ2
         Qo0B7liei0nfLnAXgZoVA5UJcyfeysaqbICaqfPUek9ZYJvAktZ8IBJ1sG8kxMcIR+dr
         8dFZwYHfHokHWbw/gN0QWLMYYyXOqUggiHV2Ih07t95rI9Hx2LFFizpSFODNnWBIaP6f
         TNGw==
X-Gm-Message-State: AFuF++kjVb+ymhc9yZMXeoQD4ETDP/tXfupNU8xN2oD46tNeyqlsm81V
	uowKvNLP0MfcMSNUm9IPw3/XDOGd62fRkO3QTUuX5qljZ9oNYxkUkfwP54aZD8x20IQ=
X-Gm-Gg: AYBFou2b46rbeNHE95C1LMhx3//upInObVxbJRzj8DypVyv/QwPSZoxXhEtaZ5jq2UB
	2pec1qahOx2zgdc6o+XIKGdMYVyktTnw9fLqJ+SGF2iBqfmGE/fi1M0QeSIu1bDXfipj6lBVG9o
	JJUV2rifqXgO2Ccgghlsi+ZQn4krIi7zVSO3VnXknqGWQ7EsdXMUWRCbY6hpNYdHxJQhpHH0SEH
	TOVs9+SV+87gnKc4oXJyoIgGMiwXmKCqqJ/nCayB4jPOCt53qY1Huf+xdRJsNksN6ySy7He6FhM
	WLd7+RKyJkvts9MjY4gFF9S6xEelflsunGtu2NfUq5Mmb/er3sUzkYCPQw0HnYrJeEPTWRu9DNG
	mIFK0Tkti0ZT/4b34BbJNhWpEc2PYka/CSmsiv2V16k0kmjRnMTW3fpY9b69cXE5n7wu+O3JC2L
	CF09iK3e9vPcBvn66CY/NlR99EFVtHNueEit68MiCr/Gw22Q4Odle+SgdvS7HJbgRao2eriYIvg
	uEuMTi+vA0=
X-Received: by 2002:a05:6402:360d:b0:6a7:ea53:f62c with SMTP id 4fb4d7f45d1cf-6aa2246021dmr5023762a12.43.1789649034670;
        Thu, 17 Sep 2026 05:43:54 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d228baesm3705562a12.9.2026.09.17.05.43.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 05:43:54 -0700 (PDT)
Message-ID: <be9f9890-1bca-4f25-9005-faa5a4413e98@linaro.org>
Date: Thu, 17 Sep 2026 13:43:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 3/5] phy: core: Add devm_phy_get_by_of_node()
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-0-f85c9103177e@linaro.org>
 <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-3-f85c9103177e@linaro.org>
 <9e8ae55f-6d95-48a9-bef1-ab653d0f1c7d@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <9e8ae55f-6d95-48a9-bef1-ab653d0f1c7d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/09/2026 13:32, Neil Armstrong wrote:
>> +++ b/drivers/phy/phy-core.c
>> @@ -833,7 +833,7 @@ struct phy *phy_get(struct device *dev, const char 
>> *string)
>>       link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
>>       if (!link)
>> -        dev_dbg(dev, "failed to create device link to %s\n",
>> +        dev_err(dev, "failed to create device link to %s\n",
>>               dev_name(phy->dev.parent));
> 
> This change belongs in another patch.

yeah you're right I messed up my rebase ..
