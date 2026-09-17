Received: from mail-ed2-f30.google.com (mail-ed2-f30.google.com [74.125.228.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDBE4FECDB
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648334; cv=none; b=EzNq3uu8ZVBncL5d8eF7vd6Y9gV2NXSTGnEVtUD8UL9Tcul+fyqklZ/o2IDPo3izlSUcRHmoGkhzs8LXpHSKWNwmopo9QwVhcZbSO9FOe8BYPiefDEYS4zRiThIPh4V4AR/TFOTnopJfa3yajoqoswOIK+2sJ4TqJjMp2DSfuEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648334; c=relaxed/simple;
	bh=3w1QO9RRjV2P//77/vuGY3t+8liMQZidimN+GXQ/Shw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rVGjzcmf/QkMwIr0+L430+wbEd5kGcOF4PTl9QTJX1sdAPnGm6Y6unPbtwzTPRkJwNEUQBXfCdh9Xl8tDxVOsPS/SvXLi/paEBgxKPo49/lf1rsFBzgjNVOMBpqRN9hGjNFtm5s9jsFxP7MvewscWPi3/lm14nBM96YEfzXY7KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e/fiuBNL; arc=none smtp.client-ip=74.125.228.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e/fiuBNL"
Received: by mail-ed2-f30.google.com with SMTP id 4fb4d7f45d1cf-6aa06e51bc3so1368989a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 05:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789648323; x=1790253123; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ls/PIdXgwRaJNqkytOniziANCA/o27n7uKp1MTR7az8=;
        b=e/fiuBNLG4E9oZeVsqDRZUNO6JWwxgCRIyimmkUghYQJnr2LhxsdxwaEvvpCdtStT9
         u0Cz2Xeowdpk7x0SKOZbSgxmJN46MGJE+ZFeQA4S0wBM2uZZOay4bh6EJXPcol3DYd18
         3R5++iHttO7Zp/N0uoYJpa1OgoCbiUlY910aXYyOd9O+/k2FigozCEmn99+I4rxW16Pm
         5jJb2ROGGdfsyeOU0SbAxG1m5vwxLm5/2LltsV+9RpfJ0C0ZHu8hdflC1XRtfZsm4NDl
         FSGDOB+UXLIQ9DORzJDy5aF0EkLB7fkm27qqdP9LAku2yBqxmD0HhyPYTiLjfpMu831F
         vkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789648323; x=1790253123;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ls/PIdXgwRaJNqkytOniziANCA/o27n7uKp1MTR7az8=;
        b=tjKdpBA8veGtiCTqhHO73/X1U6BDgwB8zc1g8Cafp/2ffo9RXB4L5I6C2M/mTUwDGf
         cHkD1S5n2SvQtba6xe4HkPn+BUBV3V1WQoAjHRRgrofH0VT2CgZgfaqM+k8ryIUjr2GY
         zKaGPZ+qjdzSuxMsXh92Tglk/Et1iQiyn72vCZY6w3wTeKcYFidhKaLGrWqfg0hRYFV2
         y8wQ3rA53yLghNGdsbOlWfmBy9y/itvr3w8g+37Ak8g1HHAF2CODVVZoF+V858gDOMrv
         9sLFghZ0WglW8iGccsc5bSSDQVmXVpOmr/cQ1ETNGd2uj3Jf2zkDZnqz7gwlzHe6SJyO
         /T0g==
X-Gm-Message-State: AFuF++lF+UWox4VBcvy93gQOrOtlxg9JcVuzq9Rx5sDV2RANkMM7uE2h
	0tOeGy5iP+5LhoxD3FQ/nAs8fs5B6n+9v5bpB0jCVsn4rKg5RxaPc64fBJ4vHfWX5HU=
X-Gm-Gg: AYBFou3gTnL5m4b6spkX3ASNTo+5pRwg2fjQzwT2ulWu9yYpdzEAFarHQU0RNkVG0Pk
	1z3LMuvc5NWAb5NnlA5ouYPF8w7dueWCRd2sdJz92ngXb2G58gP64G2J25snOvLiH7NgWDCs9PU
	E+tqF2SFfFo4N4Nw1In0Jvknx5IRHZN4MUYAz2FU0rKbXd4SdSzpLvv4rHnRYnGcs94MM+nxxhi
	3cHHzNLd9wW2hYWs+Nl0BDj21JaTtsHZpawQg67ayzAwHMICyOAwwqYTY/5dN2GzuazKB5frn0N
	rfMNU4+EXWBhmDYxrtL7vIZEPWiGP9vJEcpPSGmm/XaidFSVzkIIF6JlkTRs3pkaVO4+WO9zfjS
	2d1FfEbm5vkUBVTC5ZDYMK/SLAvcAY4G1qFY3Hv4NkGVjmrkn5XVeiq8HxfF44HZDFUdYWEj/03
	Klgdj5UyDC3lRL0Z7bI84MzqE6PuE7DAi2P1NRLSqgn/UbHpCyaL1oxIcvVG7ysQT8EEQ29jb/i
	kYloXWmGro=
X-Received: by 2002:a05:6402:3242:b0:6a7:f25b:d281 with SMTP id 4fb4d7f45d1cf-6aa22383344mr3922846a12.13.1789648323558;
        Thu, 17 Sep 2026 05:32:03 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d2ab4ebsm3576964a12.30.2026.09.17.05.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 05:32:03 -0700 (PDT)
Message-ID: <8bed3f8f-52dd-4ab7-9ce2-cc756724893d@linaro.org>
Date: Thu, 17 Sep 2026 13:32:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 2/5] phy: core: Add phy_get_by_of_node()
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
 <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-2-f85c9103177e@linaro.org>
 <a06040ea-4af1-4083-9b69-7f62be7c9bce@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <a06040ea-4af1-4083-9b69-7f62be7c9bce@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/09/2026 13:29, Neil Armstrong wrote:
>>   /**
>>    * _of_phy_get() - lookup and obtain a reference to a phy by phandle
>>    * @np: device_node for which to get the phy
>>    * @index: the index of the phy
>>    *
>> - * Returns the phy associated with the given phandle value,
>> - * after getting a refcount to it or -ENODEV if there is no such phy or
>> - * -EPROBE_DEFER if there is a phandle to the phy, but the device is
>> - * not yet loaded. This function uses of_xlate call back function 
>> provided
>> - * while registering the phy_provider to find the phy instance.
>> + * Returns the phy associated with the given phandle value after getting
>> + * a refcount to it; -ENODEV if there is no such phy or the phy is
>> + * disabled; -EPROBE_DEFER if the phy provider is not yet available.
>>    */
> 
> Why changing the comment here ? You're not supposed to changes the 
> _of_phy_get() behaviour.

I have no real memory of that change probably seemd like a good idea at 
the time.

Will drop

---
bod
