Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D653CC303
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 19:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785355073; cv=none; b=GQZecwcv7SQ78o+H9RMAD1QupV+j3rjQPqYnNMCfTyvw/sA6ymb880tIiJEtMDaL7VEHIuRaYXNB96af2gjt0RjrOIFVF+4ahQAjZgqtlLrxiS1sUqoh1muLLZTG2uoR7pQz3FUm+vm2CBjGYWaGX5ZwDyzHV7elv06Nz89RFWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785355073; c=relaxed/simple;
	bh=jbGSyWqJyLohTYmCLKvB730dHsQBMDNbc5XkanPK7/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X2+WWicic/AiNhiPSUptGCsmJ073C8YT9HGAsu9wL61bWsfa8sGgwh9F8G4xHVJ6OOR/LksTAARIykSq2kSL30/7en72ufTdvPrLBjT8yGwUeR1y6TwpTnhamY0hFHK5i59HHT2qn8qNsO6ymb8OE7LoWiReUpoQkLZNV05Iqqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a8zbIz3e; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a8zbIz3e"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aeb906d6c6so210590e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785355068; x=1785959868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LE8yxChc+WSkATkEhDd8gBfNPkNIzWWJVjtjI5ufJCo=;
        b=a8zbIz3e5YssqPIFskmSJFHAlHwnDJILzX0FZOsqLNOgP4KKGys/2ZuOLm7uFyfuyl
         8lHJgWtilFvmU/VltwU82KxyX8+yOFeOs0HOJubkGKRU02UduNgfK/xtY6fLXvjJbPtN
         lkxRIpVJuh5hbm3+WeQt3up/zZ87pcsdjg649ieYkU/0AXdeGSjjwMkSOFPplLm18VqC
         r3gxuwi/s8Swme5HMcc97NVjy8PJiVoNJQlPFkz+YVMx6KCiQMNtYgaZMkYcoZSodvgo
         FLcYyo4f1CBIaRruD23D/wp5UAKSv+0wmaJIiGba8T1AcTtZjNV5BReCkkrW0l5ZWN0r
         CKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785355068; x=1785959868;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LE8yxChc+WSkATkEhDd8gBfNPkNIzWWJVjtjI5ufJCo=;
        b=k3jXAp5P5bUnZ0YjWEI6a8yliHz645RsZ3jPjnlvm6egausXvaO/yx5QXzElsCqd56
         2n/gKCcdSxTK0kjFHYjrZY9wMOiaieE38eomG+HdvnYWpa82x9H7bCIdrTWGK6evm0Yj
         J0sMDv4mNSx7uzKu74aM60ndZtYs4GhtnPu2/TyPrTGLLh5yG5GDbADr4f1PA9wTc9/t
         WbieIwxD2eAlhCdfC1iHv0e3TcCcMLBNQ/6quQpubYB+t80vYKZbQUh1tZ4e3vCJ0w5h
         Il6Uyaq8k+DzaNxJU02TWWWadlhdKZhxsEzRb+MxS4jEqVSCR0WNwiSE4k0Nn7SIreka
         0mUg==
X-Forwarded-Encrypted: i=1; AHgh+RrBfAyazyBPoTZ/6p4Ky0b1yrrk935JqeXSFo3khW/QS1qMrMZFdmOeaIhBkewwFqhb+VlHfIJCTZz0LKj7@vger.kernel.org
X-Gm-Message-State: AOJu0YxIy+sUS/Z2ktSk96Vkinvmmc8/6Gf2qMTVJ4WP7ssxWbFYJXna
	RhLQb44aEyWawq6wL+EQp/XMvNYJ62rXw+r69+WHzhXQXYhJK6QXEGphPYiXu9nQhCU=
X-Gm-Gg: AR+sD107vun4Gj0EaSU/QsInFGMxYvbRfTWJunQ7cPQMIWGf1zRDFvO8hQkuBC6zwzh
	UmQRD5Pq4Yt0zMW5I6JBXgpIUFAxCHWfRAQ0bMjk6+hgHU7RhFjYL9yl1yjIMzXqiMaLhp53EWD
	X16yBb0gKwR6Gl+FWO2JIpubAvVWT/6ZilCYTAX903uSjmbFxJdH1be6hcgY83tapBiA0c8YkP3
	Lhx2iuu2iynaFDoN9P6cqwwZP/77A071hEr4agVnr4trZCbjnBqy0gl0B+D96DnHQL5RPplT4PM
	4Dgw9WkwijXwxbF1LVQhujPM4YayDkmx4ehPld+P1e5itRZgpEBw2AAmSztqH4WjkAD7tjRfsjZ
	d5v/x504tIPQT23thLhA6AmpgpnAuAYctRpiL+WDrkpwcAB+s9L3/5gaqmiHZDeRW6PXDAw3bdW
	/gzZBif91fdoUB2dJhKE3+o7pR9GoyU66ZC7LoSQw2ThiklSq8WDaG6RbLH/WLOhtZhCcyXyhdD
	coJXm04nymDR9GKiIYRGhNsNaLVu6UcHoxf2wXSSpQ24DM5k8Q5Sw==
X-Received: by 2002:a05:6512:2250:b0:5b1:5e89:30f6 with SMTP id 2adb3069b0e04-5b2da4cfa64mr16335e87.3.1785355068442;
        Wed, 29 Jul 2026 12:57:48 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2d78ea812sm572610e87.43.2026.07.29.12.57.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 12:57:47 -0700 (PDT)
Message-ID: <99ffd9e6-f47b-45cc-a039-d8cd5dacc28c@linaro.org>
Date: Wed, 29 Jul 2026 22:57:47 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260727-x1e-csi2-phy-v14-0-27d1bf477593@linaro.org>
 <20260727-x1e-csi2-phy-v14-1-27d1bf477593@linaro.org>
 <1e1bc17a-4c7a-4c08-b0c8-2a2ff31fe870@linaro.org>
 <e9cbff02-fd47-453d-8743-8816560f0f6b@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <e9cbff02-fd47-453d-8743-8816560f0f6b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/27/26 23:06, Bryan O'Donoghue wrote:
> On 27/07/2026 21:03, Vladimir Zapolskiy wrote:
>>> +                description:
>>> +                  Logical lane indices 0-3, not physical pad positions.
>>
>> In hardware description it's physical data lane indexes, the same is
>> said in
>> video-interfaces.yaml documentation, the numeration starting from zero is
>> selected to follow even bits in CSI_COMMON_CTRL5 register (D-PHY mode):
>>
>> * https://lore.kernel.org/
>> all/59331aa7-8430-4754-861c-4ba6a4810ccd@oss.qualcomm.com/
> 
> I'm not sure what you're asking for here - this exact text ?
> 

Returning to the description of 'data-lanes' property:

> Logical lane indices 0-3, not physical pad positions.

Logical lane index is the same as a position of a physical lane index in
the 'data-lanes' array, this array data cannot be "logical lane indices".

A valid description is found in video-interfaces.yaml: "An array of
physical  data lane indexes". So, it should be an array, and specifically
an array of physical data lane indices, this contradicts to the given
description for CSIPHY.

Here the open question is how physical lanes of CSIPHY are numerated, this
requires a verbose comment. For instance Qualcomm CSIPHY configured in D-PHY
combo mode (two sensors attached) has 2 or 3 data lanes and 2 clock lanes,
for such and other cases a 'data-lanes' property description should be clear
and unambiguous to allow a valid configuration to be provided.

-- 
Best wishes,
Vladimir
