Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CAA519919
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 13:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651685; cv=none; b=O32+oO56UdJhBLnKvkuZVKPnhI2mxVVw9m1fasQa5UOADMVSsOR4+ixcPYOpG+0qJr3B5uUv0RPU0BGbMxgmbMU+WQ2AAT2Vr99Bza8sjWAsSMdqImPjOW5A4wX73O03SrjazwE+zXRxme1PQYTwnMWNBx+t2DUOZ2dpv8MMN6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651685; c=relaxed/simple;
	bh=TX6xhS4Vhis/cVqkO7iD2bmIOPGH7N8MJNCWfFGrVr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FK5nQWvshAHememSfwnPEgQCUYZilkBpHBKJlURMffxsWgjt4jjH0qbb+/IORn0kLasRIxfhQlkk2NcAWmz7Xaq7zgpeCW/AoINmpKfBtA90vgpcIokRDky7qt8kxeM7mZZXyomf99y7Yi/pgKFNz485095omLUFuPeSUfBSZYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OJPx/VkR; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OJPx/VkR"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2953a01240so144064166b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 06:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789651676; x=1790256476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rajuo6bzngXrBhLYotQd0SgbFpshLprnWII6O4/hths=;
        b=OJPx/VkRtQ1fIdASIxegqFHT0i3xYB+awFm099+ZIEeVsYTarq+xHv0polyYdj22JM
         BHvYD3HpW5LLY1/Aq8nBlVzmuN57UM6PNT5gIDypU8XJwCcRqvqCmU7RAddDDNNjgdrS
         l+cZxshTdscz6asGb3tqJaQeBOYVFwmuFO0GPKGphIrO9LfQv81y+dlfRDREHa1+jy1Y
         ALBFDSqNVCwkuWI7zjO2/kwMmxKRnYoe+9z+Ugs8VuwC6HHpsOkYI48vRu0NwfJ1pk75
         M/AG25D3IuNO7Ftmcd8Oo0IgT18PvFy/PPpoj833Kj7kh8Eil9yogKdpr9WEo8d+BaXY
         8DpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651676; x=1790256476;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rajuo6bzngXrBhLYotQd0SgbFpshLprnWII6O4/hths=;
        b=OWi8/KmbegTtrpC25iL3fupkoOsiMGn/JfkrW6z0xSCkYiwDuSgRE+PCbcIFPQMZcJ
         jKBuEnAxIaRnFsH4AEr9vNYsti6tUW296H73GH277dpgqFfw68ygQvcVyRgxB6Aku1k6
         zy5eBF/Tvy0xDyPa3cqitLB/bS7CIz4T/cOnr0XFJk+EwR+dYnGp1ghOIvpsqblJLDJd
         UCqAaJP/cLT+GxcEFkXX0xiSg6doC17dcVlWqESIqMzsRNeAZEI2YtE0kkg257i7By1L
         e0l05+OCn3niU+enORZN1SfGJ+a8OSe1PpvOe9rUAmrCU4CP7IcGhUDz2eoXxudh+s/w
         u8uw==
X-Gm-Message-State: AFuF++m0d6qJJ4ea3V7m3tPnXtjj7Tq99DIkIILp2vwZ8UCjj3ns0G7h
	Ln/qpRaI39kUqqmijWezZthcts9Hjifa0UZMXy6Zuby4fhWkaw7YI0jasZijVJRWVrE=
X-Gm-Gg: AYBFou11skLtFqfMnuGf9oikG0pCxCSSAsg6kSxQVgNIBqRJoj/dwSNXgLe7MjqWGTv
	T4Wj39lKa1NkAuLyjGUfb1EH1bb8aM0Uy8XQfvJ7zyWhd/JRaULYzNqT6iiIk/Xmd9kjKTNi+oA
	dzWO7YjVZDtvCynl/ED18ySdvaG4yQSXtYTwd1fp6dUDPdaAmb+zxfJsBP+qSMOeJa8dLWATAa/
	pN552YihEWq/DvZeLSUBiWSVvbTnPs3TKrhacHZTNPM4Z0CjP0auWVzpU4I0U5INlrbUJrty1WJ
	twwDxsZ7PIg0OdvBcc7qvC0jMm1aC13BS7QhABBCDOAf1v/Nm8BHN+pKOzzP74eNpfzLjhvEi06
	Kte4Z+X8fVgGM+VPbKIhzCfm068lChatK7E6lToDa6RM+rAtAXD3OVeY8DvWwhwear0/pncxoXc
	0oE3/k0P13wFiDO/sw01mkqydATXdroFVgBub29CfsBDldOkJiwaSUWogmO0Jhv4nUSCmDjngyV
	A3fQWIEEE8=
X-Received: by 2002:a17:907:d0b:b0:c26:19de:9acd with SMTP id a640c23a62f3a-c29e5308381mr463526666b.37.1789651676039;
        Thu, 17 Sep 2026 06:27:56 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de453f04sm293940366b.15.2026.09.17.06.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 06:27:55 -0700 (PDT)
Message-ID: <37f182ad-a137-4066-9e94-b06be2cd03da@linaro.org>
Date: Thu, 17 Sep 2026 14:27:54 +0100
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
>> -        dev_dbg(dev, "failed to create device link to %s\n",
>> +        dev_err(dev, "failed to create device link to %s\n",
>>               dev_name(phy->dev.parent));
> 
> This change belongs in another patch.

Doh Frank gave me a comment on this and I just changed it without 
realising this isn't in my series at all.

I'll drop this altogether

---
bod
