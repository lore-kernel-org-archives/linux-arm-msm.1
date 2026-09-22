Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B25550DB9
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 13:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082808; cv=none; b=mE6SubMYWejlYg5PEEzpizzC2wwTz3qVrmMI8LTgEc4QVg2BJeuB9dVhJ/VPechvjpmvOuvAgCuyQ9JtynZWHpRreVa+bmYt90MqqWiPpdVN6VlMQ56queriVliPKlJYsq8ZusuR1W9MYkIYrzeZGWmXtuG88xTLUGeSavsPJK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082808; c=relaxed/simple;
	bh=7ScoP72loie+KDTnxQPNwCK69btdw+khKMf6M0k1bJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gh579xdXfMoforrlCIvgHEiMcIRVweyyIefRCFEgskTMz1/IxONeGcRk7kH43fU61HcOPE+EAEms2hSL1EwGs9bEkbG4gnCZwb9CoXXQvKhuHfAzZcBUfUnr/RiudFRCA70lSygpwLg5Cf2dbuQJacEvBBm6V8uqg/p4x4H/nXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=GBYP3/qi; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="GBYP3/qi"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d4ddd1d91so29715377b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 06:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790082802; x=1790687602; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5TqBGWJ1w7neWAQnzpWPy+Fm8xr9GVtFmSS2aSnE1bQ=;
        b=GBYP3/qiGHlVXy433bYLRW9PjhfS7OKvCDGOjVEmh9d8D8QRFCTG85fy55aM1kNQcc
         4O7+bbcwdWY7dEirIhHHkA/GQVc18SVOFYPn08OapoImcfZBytBY0BpiS9t0AYmXLw3C
         /eVOSXMeweM7ocPjjOJTB9938GX1m+RJdZmU23aZlnzqxc2YRI90NrWkYKGxiMZd+gmz
         4TNuuZ7TbB/Mn7+KY0z6pS9qDGD2n/lPg+kGGYc5DIVLQSZcTY4sPncRj6wU/ubL+OrO
         Jds89XV7bXART5XbrYckJI4rPlETlN7e0LrTvgQS96TEHKrVhTCsab87RLvMinOwDG4V
         YZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082802; x=1790687602;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5TqBGWJ1w7neWAQnzpWPy+Fm8xr9GVtFmSS2aSnE1bQ=;
        b=NtKlPhn9q4TcS3OKaSJvcdqYcAuhf+b4DB92BLnitA1WqfrpivVigtiaLlhHCtIXbP
         pGmQYowiLiEyi1UgHVId9MliiWnnbGXw3ZesN2aARbdE/zVifaSPcLqhBCkxML3KogVM
         ONqrhD0UOVZ59IAVYfS+IOAuMK1x4CptJbeazpuOcBKsqGei/U4WOzifjTG/yC/gt9IL
         8YOQKNEbeJgljFTdyO2wXdFeDaQx0uT0uSJsQGAp3oZdmOD0+wUiK/wrAHGQlU8j2tEh
         dc6JC8uUA4E1i4s2ouwVGivL0Z0lc+gCdypEI87Mkoo7+/3LRHE3/qV4PpCV65wTxiB7
         umRA==
X-Forwarded-Encrypted: i=1; AKwUvBxzyl+GIGkoqSNdvZugQoPjDTqDN4+7TAD0CK8b9JtvAKOy33AJa5znLRn8ClBCtMJKZjOCMFE8gr5zKLgK@vger.kernel.org
X-Gm-Message-State: AFuF++mVpR1ml9CiqI/650VqWE6j3vbxD64GAqd3sB9mICAZ+StU3Iai
	4s2ZYoRlVaRLowEypfpyzoiXEZ+jqPLge/ZUd2vIqcsqA948msm5P9QX5miNFfvMWT4=
X-Gm-Gg: AYBFou1W5+DTcEX07DYzAOBf/XnRJUWpb2k70muCoXxQrSh0LwUxQKXNtLtOqWjkfCq
	RN7HGUKG5r8WVLJl7cDHI3aCd1zLppW2rjYbx87tQKAYbdemoFtc9SfTfkFNSXm/iF0AODh6/Ly
	akeE/4IXVKhY6PArIIXOqJ6wS8NIaR80xWlYYt4XWYZ1alxukoUxmLyl0zcg4c8OCqEhO5gEvqj
	PIOJRO+HxUmEksiLaZjeXEiF3Tcgj3frl3Foliwd/ZOCXxbuYhULNGc0vIH6X44TgZhprWaBvP7
	3GezkRnhoBNo4sVNw4El0D5QcT+uUqchOPcNkeQE5QjrnN+vALF5bN5KWQw7KGeKQo10LdOtg8W
	FRy+itas/VN5fWFIJDoabyA8Ql80rusKzrgROlD72yCQD2a0H09AXs7tH4zgykeHbUgZLPjobKq
	+sWpzs0zwuR6WR4GKbPDL/ZOv6aHedrAd/v2e54qGVDZKwz/bO+bVBsUV+p/5Hi+pcFnL9RQuM+
	kuTQqvEDA==
X-Received: by 2002:a05:690c:d:b0:81d:472c:17a8 with SMTP id 00721157ae682-8972beadba5mr62389717b3.0.1790082801845;
        Tue, 22 Sep 2026 06:13:21 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a2c25bacffsm5463367b3.24.2026.09.22.06.13.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 06:13:21 -0700 (PDT)
Message-ID: <1ac16236-284a-4d01-b68a-4b32d5c5287c@riscstar.com>
Date: Tue, 22 Sep 2026 08:13:19 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: clock: introduce
 toshiba,tc9564-clock.yaml
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
 kees@kernel.org, gustavoars@kernel.org, p.zabel@pengutronix.de,
 daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, mfd@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260918165234.687224-1-elder@riscstar.com>
 <20260918165234.687224-3-elder@riscstar.com>
 <20260920-messy-successful-caracara-fcdbcd@quoll>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260920-messy-successful-caracara-fcdbcd@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/20/26 1:21 PM, Krzysztof Kozlowski wrote:
>> diff --git a/include/dt-bindings/clock/toshiba,tc9564.h b/include/dt-bindings/clock/toshiba,tc9564.h
>> new file mode 100644
>> index 0000000000000..75732fddd3025
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/toshiba,tc9564.h
>> @@ -0,0 +1,54 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +
>> +/*
>> + * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
>> + */
>> +
>> +#ifndef __ClOCK_TOSHIBA_TC9564_H__
>> +#define __ClOCK_TOSHIBA_TC9564_H__
>> +
>> +/* Clock IDs */
>> +
>> +#define CLOCK_MCU		0
>> +#define CLOCK_INTC		1
>> +/* #define CLOCK_PCIE		2 */
>> +/* #define CLOCK_I2C		3 */
> Drop both, and SRAM is number 2. Or enable and implement them.

I forgot to respond to this.  I think you are confused.

SRAM is BAR number 2.  This is defining clock IDs.

And the reason these are commented out is that, while they
do exist, we explicitly do not want anyone to disable either
of these clocks because PCIe uses them.  This clock (and
reset) control is accessed via PCIe.

I do accept that someone might want me to simply omit
these commented-out definitions, and I'd be fine with
that.

But your suggestion wasn't sensible so I wanted to clear
that up before deleting these.

					-Alex
