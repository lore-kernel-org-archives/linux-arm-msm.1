Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0CB422555
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 12:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783339254; cv=none; b=TtltJxiX/2U53299TxEdnWrBV+71kwy1MwuvJywgvmSad+SwmdN2YMd2RVXmR2Rwp8hdT6odL+yfxGG3nZNeTQRGSlhm4HZA1Z4+ee1LtkXmV+UcZsOaJa/ATtvPrCBJdHtgvMyjQ6BA/mcZijD6YV2b2tYq1PxsQEim7yFjdJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783339254; c=relaxed/simple;
	bh=r9XUtHpKfeTdXDwgOjlZYIyK35oBv8vrawLZipTt11Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BvXpAvNGczU86NuTkbib3F2GPnx3YYYbxUOEV6gl8/vMMwOTPc+wZQdmAb32V/POkqY9aU59dQ1GsLjcuvH1bu/gy+N/cUrFEfYxKLTxGVEiVUTFAqs15zSiVp3EcrA/VpGXmPwcY5dnRP/54aU7/pjzE6Uk7okv3SskW3D4YRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TIJAuIeQ; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TIJAuIeQ"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aeb36c46bbso260994e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 05:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783339252; x=1783944052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=biOXAUvJRswLbNqI7JWxyP6Sd5/K1iR+OePGqxXqYqY=;
        b=TIJAuIeQdUVxneW1BXRkIaJnMy01Z/U574xTj0MpR7Gdt20jRThYWvII9tGddlU7UF
         THcgBVC7VEoJSTqPbuiMJGuc373I5ITnLAx2iYWP3IZTQUO+OdhIh32fw0fue2+SXqfa
         fCCxaHsZr4WvXKKn6wBcecsmP50nugO6h54EAvPV9OYJqvRlxgX/Y40Drw4aSU1g68nY
         ZIiEQ80NGeahRb70yt6B1JyTlnnj2aFbtm6+GJzQsfIu5VUXmn0N+Bmt3hpH0+8jxvdU
         c3JEOIn7k28yX50GecTTPJ6ifRltsU1CXaxaAi4pw9iN5fZT+1Pg/mDI0JlEp5cGMX84
         /mAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783339252; x=1783944052;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=biOXAUvJRswLbNqI7JWxyP6Sd5/K1iR+OePGqxXqYqY=;
        b=RSINQGtnToUv6ZPd74xnlXsBoIoMlF5FuuCAKi9NXhYW0WMuNqBZaQbDs4rWJH/FJW
         lC1B/tkNNusQN3bYU85K7UP7/txQ12dRHH+pQ+sCwjon3ci+QfOwiI/0Wa1FMebqZweV
         Ize2CIglTEozHCFEZJnpmOmBA6hObC0fZjoFIVNGefhFIc0Lhy9b7nciKO2w1vqD4C/S
         r947FrPicpCP1H19IKHbKeGPtyEqvW+vGYupEoMhhlVprQXGi2bTHU+O52ySQVLdKOGT
         lsfLgG7KQYwRxMymMBD8aDOBPgJ5AVnE1B1OBDwl47hsJYTLgaIZ9J4hrF9vynsk8Nyc
         bHgw==
X-Forwarded-Encrypted: i=1; AHgh+RrVeNrE3WWcTLkDBz+qMmJ6BHA90uxQzBVSQUC/SK6ujzWj8OQCbISXQDqxUmtudBXrIOUogHpGv8GoHn91@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0tWc6mvCuD6wJRTJGJMG07//mDZKAZQTevYyBote2VgPHfplW
	qQOzzWkjB9sXxqCexo/TEH6C3Ad9lkS9S8ZdLejwwEWrlv8XAAQwMJqT6f3TzEr5+wI=
X-Gm-Gg: AfdE7cmDglASIDO5uiNSLDSxf+W/knZhbffKvsdkM0L5VVCjRdjXvIocYrFmeZPQhp+
	lPw0168NXSaXP77syrTQcSHbbxndc/+jmKfOoDgSEcIOh9vCIKWoI05l5V8zQ5I1h0TOCGH55eh
	rv9Gtxs8w75pxk9+4SBwom95Yj6VdhoHLi8XKnW1pMiQC4Rv8MPHIQuiuXUkISvVJSeX+fKSMf/
	zu9GGyOHvYIATdC7VbW10bw9uDu6Fo2aig1SXASwAwE+fBxW75ibh3M4nzu5qojdklTu6Ajo/tl
	ZF1yCJX+nfrzoO6tpOm2X30jdDagfXIPwosC32zeJNdz+OIcwxODSUThMHOLYpSCV91740EvJAq
	T8YcriDLbQaNyslKS7/NRTszrbIBwFtT0v4citMrDodh6wsNLzxpKUKEUfaAqPqHPNkdYluLMwj
	cJo8TeAvrdcxXUATT3wM4uGYHh8BWoeyuA+ycD6cFbu/4NGYmRrS391zwQZo90U7sQm3S9Y2SOW
	zMWgw==
X-Received: by 2002:a05:6512:8348:b0:5ae:ba8f:ad39 with SMTP id 2adb3069b0e04-5aed454f924mr766872e87.4.1783339251496;
        Mon, 06 Jul 2026 05:00:51 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c8b5bsm2866776e87.80.2026.07.06.05.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:00:50 -0700 (PDT)
Message-ID: <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
Date: Mon, 6 Jul 2026 15:00:50 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/6/26 13:12, Bryan O'Donoghue wrote:
> On 06/07/2026 08:11, Atanas Filipov wrote:
>> Note: The handling of shared camera subsystem resources (power domains,
>> interconnects) for child IP blocks is still an open design question.
> 
> Why ?
> 
> A device needs to vote on its own interconnect and power-domains on any
> bus. A sub-device of another device may wish to ramp a clock for
> whatever reason.

Certainly a CAMSS device will vote on all needed to it resources, some of
which are shared and got their description under CAMSS device tree node.

> There is no "master" device in this block of devices - save perhaps for
> the CSID mux / wrappers on some of these parts.
> 
> We have shared resources like camera noc, system noc and external clocks.
> 
> Please include power-domains and interconnects.
> 

Why? The common power domain and interconnects have already been
described as resources of the parent CAMSS device, there is no need
to duplicate descriptions in every child device tree node of CAMSS.

-- 
Best wishes,
Vladimir
