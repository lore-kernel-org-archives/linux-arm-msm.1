Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872465;
	b=OHOKSy3Di73QFxZYBU6Gwy25x4RqsC9E6oEXhIHBOJv8w3V1SWx72OUx3sEo/d9ULqCH
	 gcdTwhhiBKZtDgvHV4KMn836ydYQ7R2pvx+Tr8U/OSb4W6sEY2QGWA/U0n8znShVM1OyA
	 C8HoqaahRWiIHdIVYkmZw/IMnFVe0h2lYJoQPL7jV2YkxQrgPfDXdtjV+43GcqGxNd2Ir
	 YLwxnaSqUgdeiHi+XzxVHAiKi9x8K0VJoG6nUXWNtdmm02Bkr62qM8soSJ3MXvsDmd9fR
	 ACFd/S+IdxadKDhseZ8g08vgxicP5iBPAwPQk1orPK9NZmWDJxSRiwfIx9KfUKAtb9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=bHA2T46sCuBYYbzvf6id/DX/kPTJVcKbHipURIwsPzI=;
	b=kj60qppMjNZ+/nCNkKWzQUu6ZD12NpRIGVuMhcfdgavQHkfKB7PUn50fCVG0xd1/7A7U
	 a3SzLjDNCwiau88YOsQ60BcM3YkPRvFEuP2srxA9g1k1/kMMxnpDzjraE7dtBl02XjZLU
	 b3owce9Ibeb/nTxUOKxTNv/dWeIJBvJ/YLEgteMG+QQakMfT6IK5HBCtAjF9NZfgg9OBb
	 STn8RCRkhyp+yxmBqUes9qew/fFvLivLtXh3c4vt8PRhGf7OnzO/8FuYny9XV/p6RcYN5
	 EMm6agkzu6tNSMe3L5hGa/burqHuSb0Jw8wwglqB8KbRpR1HEGufIzViaqN/DZYIj5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=u5fjdwl0;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAAE606A31B
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 09:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AAAE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=u5fjdwl0
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso11044235e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 01:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793872463; x=1794477263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bHA2T46sCuBYYbzvf6id/DX/kPTJVcKbHipURIwsPzI=;
        b=u5fjdwl0lTWSaSIEzx139mydxtXWqrSt8vY2zyXiD9mYugFWNCbtSyddgACYhIMH8t
         9pa7u5hZxCXUo7LLOmp6x9srKSC0xdw/wThtTCXY+sia6WTxp5cBqPy/FCu40ne5Nj4C
         cVQBiKFYRxxcBUmQYkviodfufSqTRP2S8rEpOv1WnRzb3597DxmkBULCuz5sjZrbosNF
         mzwxKwBSF/9onBAQmhqcfUcJKegFnq4WgmpxJLjZQFY7/6hUXOvHivsGkgDlVWEGj9y4
         34Hx+rJFGgrLcHpcBWIezUJxTyA2pG83VIrfCKzfiGnxGMDr7zVlBE/DkshcnvcSndmc
         w4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872463; x=1794477263;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bHA2T46sCuBYYbzvf6id/DX/kPTJVcKbHipURIwsPzI=;
        b=Ap/17lEN5ld6Wm0u27iMG7/iCOIFRpzVvRUZLmD1aEua28jfIdZ4PLiLWfE81Lc+lo
         /Od1UgpUdWM3+2gPz9gRBR6x8eavSZ6ZvqDjXwUGuBevTHei1GUSp1QMaS9sD1d/kJp4
         Tvtqr/tuIE4mpd1aJHvlxjZEG4VA9PDbVcdZEDXbqMKTgh0sGKocnWo8U/0zB+x8b/hY
         1zi1Ixh8Ia0AncNVpyvrcUJ5149e4ncdg/3EfTIqzrGM15SY34CS8YYGiaS1fs1PgmX+
         XVVtZzpjdb2KuEZenV3Rl8ZYqP2VwtN8joRzMJoCdNQOsSv7bpdyGKb12bIM049uscjW
         BUsg==
X-Forwarded-Encrypted: i=1; AKwUvBynttPoudPx2BS48Jf13gKqsgGuctnsA3QYWc3xTC9Q/ShQ6H39TcJoUiybKcW5qZROjg1BIsa9sLU3Nf78@vger.kernel.org
X-Gm-Message-State: APuU4Z9UD7lJpTZvA2vKiXgWhAhLejkcOPSX6+TihYTd6LGMyS7OlBqM
	uvVQeENzvhY8moR1FTSAQoUqbiaBDcE4OeRhDdpVUpQQSeoCkX033lRF33Nkw6Yd3FE=
X-Gm-Gg: AYBFou030QKDOC2g4OgV/2oCC/JsmQdRmnNi8eZkmNSfmXDQiCth2fwWyplNzpR0fcm
	XqaN+Ta4olDrXoe331iCvYwLyROeweSYmVQus/bK1q6HvaKP/Ab8AIx5OF33GUBCf2siriYNMAT
	abFn7dQi+bqqEk7IjoMjo0R4BTyktdG0nA8WEAlCeGOQwZok2AdARefCWCgANfoBimwQIzjzkJ/
	bsFzHK8xXUATGd17IQJXLBa1QgxvyYRg2GkYTfa8QnNPjePvm3xeHTB1/HPOd/1SYJcY8H6ORvM
	v7ZR8Po3EvDhv39oVZYxfVcFuWH7JI0DY1GxiTYPJ1zPcbWkUoOTTYfZzyQ1veJO03yRF4P97El
	+JK2IhmsQCngq58OcVSYsvjCgo6GU3sB6uSip3A06tvX1ZmRvdjdXP2QkoM1s1Uk5rEY8U/U/k5
	D3bLu4HDvHKO1xAYxSmNbyncoSxQzd++qBkytL11wKzgpUtHsKSq7dCbs97L9/uCFO2e1DARfxX
	WdPDPrMEXD/8znwJE51NuR8EIvvg5UmNU1GIcVr/3Aj6DkCHGItZ30uriWq2DaZYbq5QnaQ+7si
	t/5p77C5kv4QHM/tPYstAo4LctRmbX3tDY0LX6Du
X-Received: by 2002:a05:600c:6089:b0:4a2:a8c:22b0 with SMTP id 5b1f17b1804b1-4ac14ec75fbmr396131445e9.1.1793872462901;
        Thu, 05 Nov 2026 01:54:22 -0800 (PST)
Received: from [192.168.0.167] ([51.37.126.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac2772sm8669912f8f.18.2026.11.05.01.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:54:22 -0800 (PST)
Message-ID: <28793651-1a46-4589-a9c6-97ac979a5b48@linaro.org>
Date: Thu, 5 Nov 2026 09:54:20 +0000
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
Subject: Re: [PATCH 1/4] dt-bindings: media: Add Qualcomm SM8350 CAMSS
To: Vladimir Zapolskiy <vz@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261104234533.3044265-1-vz@kernel.org>
 <20261104234533.3044265-2-vz@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261104234533.3044265-2-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2026 23:45, Vladimir Zapolskiy wrote:
> Add device tree bindings documentation of Qualcomm SM8350 camera
> subsystem.
> 
> Qualcomm SM8350 CAMSS contains:
> * three CSID and two CSID lite blocks,
> * three VFE and two VFE lite blocks,
> * six CSIPHY devices are described as separate CSI2 PHY devices.
> 
> The SM8350 CAMSS is very similar to the previous generation SM8250 CAMSS,
> CSID register spaces are placed inside VFE register spaces.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
