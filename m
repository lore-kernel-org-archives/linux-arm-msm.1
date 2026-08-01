Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBB729D291
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Aug 2026 14:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785595185; cv=none; b=OxWE7rDQQ+EvWbM6qyLecdddDAFEzxyjFGOCGSSgpmEhiNXBElSsKPLsNJVUNWP1FHtDlCVkR+79xgDwVQuO4pU1/jtFQptYcmGxumdoWZsFiCYF5kbHOFA+XDwl4oGTuGToxkhK9scpAHeMmhQuwIWMELyhUetYUF/xMj7leP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785595185; c=relaxed/simple;
	bh=/KVplR/jDx/ewYgD6tEgoRgfG/EbO0MVvx+y0+WvWuw=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Wxcp6D1bG27qORF+utWchYki4k6rCxSxzomRZkKUstGdqOj55nXGHXqJYvZYnAg0gsOEB55VgUla2hIAN9GleGAdfQJx9iyR9Gk3rZmW2lp5XVOaWZHMYfkSXQEmlrgVoIvYShDnSRoZJcxcuB2wYf8xsrZnMJt4Nx7fvOV+iIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y8pjQaPN; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8pjQaPN"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so6750255e9.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 07:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785595182; x=1786199982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/KVplR/jDx/ewYgD6tEgoRgfG/EbO0MVvx+y0+WvWuw=;
        b=Y8pjQaPNDft1ZKsMKmNK7UUi4yXeHOryG710Zyfm61S8jkyWxzv4uqOaGaybDtgBcG
         q7GRCBrM1csx2RFSFLp9esOa1FhERUM5MWlO/6cGq0nPoAJffVLNIh2dcie6hEGa8+9o
         ZRQmcnqsUWFx0iylNibBO5VJyKtqkaV8eM/4yfX60PjRpsc8xDjyqh/JgLKqP48IlELy
         Nmop455k6/rr4jj5eR0yrGUzziLDMxLPvCqbZB6JwBjpcrqTE1hFHE5SfNpQIoEwiO+3
         LIhKdh9a6ROe15uWck/iKH3GUTmzwFsHrsbM1gLNmU6ykjxb9O9E2pVMZQnpEbzYSNeD
         9W3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785595182; x=1786199982;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/KVplR/jDx/ewYgD6tEgoRgfG/EbO0MVvx+y0+WvWuw=;
        b=nrvojODaPqVmAiuzOHfF+oZNezl4WX5MjP0IqKrFQqbIllfJlRgdMaY3kAZwtp2IyT
         MFNfCcYCJ9HqR468GqUGsb1F9GY8uNyRNkNemQhXq6GyY3QRAXTwueyR9cJlrYA0w1oH
         eU79nZtOl0RiFNCUJKook+fwLD2ujhNyp9kU6wSEBZWl6Ja/xRhHndrhzaW+knD5X4RV
         CF/44zmCBwPTh9IYrkqFPV8cK2BS85jKKVdsxH6KloGs5kiWZ46Lb4YfmhqT0Dk+bv/p
         37tpSdWd4wE/1cQoWwSoGKkBMq41QjzL7fn2xiSPShsfmOkudTFMUbP9KMG28QLv+HxU
         iykQ==
X-Gm-Message-State: AOJu0YzS2l+8fZ53x6r6mw2uHmfWtLgZZ3jT2Jb+pQ1G22EDSnHG18QD
	43+/os6TefI7XDHXpepPAtmq7v79lFei2O8D3pUwjvOMec0VyDhGspBg
X-Gm-Gg: AR+sD13e5HegfBhPj52YwtXFWv6VCFxVs4zZNfeAeon1PIErzvNnForsKnV3QF/J3Ge
	avz4V5R8oGE8WedI1IRYeO/iye/Do+e4csjmMAgwJZkoShuvoSJ6MRUnk/TrKUtjf0BbqmMAJzJ
	/ZRUTpErIXwYHq8mW84kRwPEEwcVCMdM+ovneOS2zopQrlpuIshySnFxKlKpGP+oGotmINLdVZp
	cbHMjONNDrMALx0EDsJ+sEI3Gh4KSjV9PJuwSD+ZD3Bt03hO/oNAeMdcHVdw3x0gAj/gGdMMoUJ
	Wg9/1/1IVUydCaDQHf8Oj9n+EHjdP65x9P7nFlQxy4tKaUQAq5bfbfESHh1t8enfqLkyIRxf5PI
	b7wzKL5cURu/ipYUQA2gRSoj4V6cr/bqyz82OxpUJyD1ceOfAGZFqnRWEeiSrzjXFjeOcA1fuBV
	8lGcEieUFQGwxTnGjX3au1SFpyLWMK0ETpDT1UO4d15REO/Bv6I5uk9U0R6GS/ZnEr
X-Received: by 2002:a05:600c:46c6:b0:495:4a22:d684 with SMTP id 5b1f17b1804b1-4980c674700mr50576495e9.10.1785595182002;
        Sat, 01 Aug 2026 07:39:42 -0700 (PDT)
Received: from [172.23.0.7] ([64.188.68.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49808199a68sm42289715e9.4.2026.08.01.07.39.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 07:39:41 -0700 (PDT)
From: Neko <nekodevelopper@gmail.com>
X-Google-Original-From: Neko <neko@altlinux.org>
Message-ID: <27e91278-8c9c-4ee5-82f6-99030c644fd6@altlinux.org>
Date: Sat, 1 Aug 2026 17:39:39 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drivers: media: i2c: s5kjn1: Add support for 19.2MHz
 MCLK
To: Danila Tikhonov <danila@mainlining.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Eugene Lepshy
 <fekz115@gmail.com>, Achill Gilgenast <achill@achill.org>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20260801143125.267054-1-danila@mainlining.org>
 <20260801143125.267054-2-danila@mainlining.org>
Content-Language: en-US
In-Reply-To: <20260801143125.267054-2-danila@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/1/26 5:31 PM, Danila Tikhonov wrote:
> The S5KJN1 sensor supports a range of external clock frequencies (MCLK),
> while the driver currently only supports a 24MHz MCLK.
>
> The 19.2MHz clock is used by the S5KJN1 camera sensor on the
> Nothing Phone (1) aka sm7325-nothing-spacewar.
>
> Add support for this frequency.
>
> While splitting the clock settings into separate register sequences,
> add definitions for the known clock-related registers and values instead
> of using raw register addresses and magic values.

Tested-by: Vasiliy Doylov <neko@altlinux.org>

