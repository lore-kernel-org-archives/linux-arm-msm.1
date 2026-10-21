Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792594853;
	b=08EyrXRrVCdQsGoEYQJtEfJ0BxwPDmP6Q2xg4yI1MmtcpNhuTu58fuxJAGa0aa1RnJdZ
	 S1Jl2yq8Hhl8Q/AR2ewtAZylAp93bQjHJc8p6MUhgKKIVpaJfu27nLFR/hQwFybX7fEou
	 d+Y6qpn98pFvA69/gMJ7jVO5dMjJKpQ78d60WA2FKE5domIGa0IyLp2+eNUo0Fy+CU5jI
	 4qtHCihy9AoD504uLx3c/ev8+ObuWyy3lQH/MRWgRRAnkA7pKnUKOUqdZ19+ujyyT13HK
	 ugwyHUTaM6XYMcCiQyCTmttxF+/sw4kInS9djY/HeK58kGxa8xdoLylrlHN6buhQbxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792594853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=IJUFxlHAzttxqjIMcqfssbx3dgr60QqCU4WzOg2ixlY=;
	b=DvhmQpYeaawhQo8pHFtQTUNi3pvFWKpQWl4+AL89pSk53mu5UeWWwuPKfTrNkiMeF4zR
	 +HGKl289D5821tCn+sE9X+V4x0t3e7jXM9UlgKpM+39jTClOm7PeWHhwLyJmahc6B7kLf
	 PYOWtB6/6PDRyS5XW/p1AK/eTOqruzvywp0gQ/K90EYBKWg4sdjxJv/SXSKVrflnP3tjY
	 2aG/p6mzyBFWSRCRq9Cg7VNtAGaW8MHUPX2L2Q34UD0pK2mo5EhxAoA2ysNYnmviJOcp5
	 GX+0oXJOZl3OQLRlojUCYy6LJ0nrNzHkCZxj8rQ/okDX1H5vcXM8hdkx3DYInV21tKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A4xznEjy;
	arc=none smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B132F606A31D
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 15:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B132F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A4xznEjy
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b8b3c8c4bbso1826901e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792594851; x=1793199651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJUFxlHAzttxqjIMcqfssbx3dgr60QqCU4WzOg2ixlY=;
        b=A4xznEjyd9gjdzKJkX+mfkvPlnSAO+4xALnxI/8O+5f1RkwqiNl9G9bfCPcbIutDVY
         GVCQ6FNmtaV0q8s8YugGHDOeZRepbnQP7RqEqiqadKtcNsI9ax22vJGapQV9Lya740fX
         WpW+bitVEHaEIv6cCUxh5CRoe5V67OQ1ib4iDx0evFxiGLA8ifUnhFnOSsNECBJsOUOx
         7UCYNCH8OA24vPDw+EEq4bMJMiuWSAeDrkFaeVzQJH9s188awoox0hcdInX75Aaf5WEK
         O1lBSq2ov2DhdZVHI4M0oputoc8BXV4E6DsTtkiHjsWBEczfjA/T3rbIkHrVTTjE1Qil
         6IIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792594851; x=1793199651;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJUFxlHAzttxqjIMcqfssbx3dgr60QqCU4WzOg2ixlY=;
        b=WuavRn3ZI7v9bG824dvozXRuGx6oc7MZerovuZ5HgqgygDCPHD0AeA4NkN9aZkc/JE
         g96ssQd8B2Qh+6rf9adgIMu4ROBYC58DsM0QTJhtwyCx9tx253wvMoSJ9D7JK2T+pryu
         EjKqo8NadFC0Zlb3qf4ShzdDgZT1WE/cQe1yBty4lFbP1qCN0a9+HXwYhSyX1xIfHAY2
         U6znfHGZ0trADzJ9kznO9Dclqzga8BGp60ayPB0ncS6k71JnjN+JcGgsqLThQUtcPH3c
         Vhuu32Ym0Yi2TYVQ/V4muuQCRWqc2MESPKu/dcqmNyRqOrT7Rk9FqPWQfDr/9LeR/ejq
         3nwA==
X-Gm-Message-State: AFq9FYIpn2ZDoU0jyRc2z4eqfECzhqWazrOzq4nw6N3WFGvmHbEJaXyG
	0YreYe/Hgplo24Xz1HB2/7NaUw9k55TWXOAWLdIYcgZFmuOALQmVO1VT
X-Gm-Gg: AYBFou2pRmoeeaMRN65uhB9oEL5aWYJr7+q1Q7Ec++7oSAfacaqbVjaMHlot9ZZ3G12
	Qpz1r5ALUWQW29YXl0LQs8x2NsfsSqRKeBKmrOmm3keuOkdl6gEIVB/0Wbpsr++zJ4gMuE5xxhh
	vBHv3ZcNEvR8RrBHEWo0AO/mmlDxlpsSn4fVvdPChn8UD7v0XWB4Z1L53d1DOe4BnadeNXWLHGO
	p6SBSbLQk5xvHYqyK/YmWYFsOxb1ctcHbfBdWVUxkgjTY4K3oecLVqxdk2ZKCkGVYxDzqOAv2Sl
	bE5J/lExE91i5CLvb/wZt/ERnQcxxYEgx025PvTzK3ZAxJeP/cLpl87hUpQ+c0cO7aH9PgpJW6J
	bf3+XCqvCFgACIF19pWHsNtE9/kebPmnwHcY3F/4/AbcVUC60jFgnJJ+P5HL6e/kftprrd8JEXZ
	0Z1p090ERFTAQIc0aTDiBEh3CscC75iewXVKlKtPrjhshmLDT4ijE/9R6S5zeYj+I/cHODwjY2R
	SIYqz3LbNexZ8YGVu1GNjB50jXvQGjpCAKccclv3pX623cTSrzqCN/rnw==
X-Received: by 2002:a05:6512:158f:b0:5be:5184:a3c6 with SMTP id 2adb3069b0e04-5bfa1bf3e17mr812374e87.10.1792594850692;
        Wed, 21 Oct 2026 08:00:50 -0700 (PDT)
Received: from [192.168.0.68] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa48f1698sm168605e87.7.2026.10.21.08.00.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 08:00:49 -0700 (PDT)
Message-ID: <701defd4-79af-4ce3-9c49-d3f4378a9953@gmail.com>
Date: Wed, 21 Oct 2026 18:00:45 +0300
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
Subject: Re: [PATCH v4] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 David Heidelberg <david@ixit.cz>, Abel Vesa <abelvesa@kernel.org>
References: <20261013-sm7125-samsung-v4-1-3233901b48bb@gmail.com>
 <5fb086d1-7725-4d8b-a2c9-7627f6da7cd9@oss.qualcomm.com>
 <b33efcca-eaed-4efe-99c6-035afd73dec5@gmail.com>
 <eb559119-4d52-41be-a954-2c26492d6a2e@oss.qualcomm.com>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <eb559119-4d52-41be-a954-2c26492d6a2e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

>>> Have you tried using the bus through the normal QUP driver path?
>>>
>> No, I haven't. GPI DMA support for this platform is not yet upstream.
> 
> It's a copy-paste job, try it out please.
> 

The pinctrl driver for SC7180 has no QUPv3 mux for 51 and 52 GPIOs. I
also tried checking devcfg.mbn of my device using qc-devcfg-parser, but
it printed limited information:
https://bpa.st/PEZED3BN3JGND6HS6BOGNHQG7I>>>> +&usb_1 {
>>>> +	qcom,select-utmi-as-pipe-clk;
>>>
>>> Is there no superspeed / DP altmode?
>>>
>> I could not find anything that confirms super-speed or DP altmode on
>> these devices. Besides, ufshcd-qcom fails with "link startup failed 1"
>> after setting super-speed and removing "qcom,select-utmi-as-pipe-clk".
> 
> On the stock firmware, if you plug in a display via the type-c port
> (perhaps via a dock), does it show video output?
> 

I don't have a dock or a DP-compatible monitor at my disposal.
I found the schematic for these devices and found no wires for DP
altmode.> Konrad

