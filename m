Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4763C1F24
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 21:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783719665; cv=none; b=R7CqsIBPUgX6hn9daTvecb+zIt7QyO8HuGWV5TvFvWnlrjvOnQCGFvC1TfG0xkp58pugpPp1wfqjFm1p0ayH5V0/ZuMGjGKbyJnWbiLaE0r/8G+uDB6oAMUzqLty2DEEd9Hqp6mtvczk93ntlD6123k9NpaJMs2S6T/Dhkbp/Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783719665; c=relaxed/simple;
	bh=sRLsKhX3nbX3ip0h+lFJX6a9doiDlrP1aVmvc5UQZsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GIiLuXf71dZUAmk5vgLmFHM4Wc55mWedSWX+zIdW6GX17lRfu+FFSL8ik/yj+2B3PjHDZZ31YTQpGGCVegqfzX1yYvEEbg6yZ7Y1EJOS5UVxp06Fu18lP7gytmxVWLXwzNPL8ISJtV1UmYIio4OxM8XtBV5uXOsnlykVcEiltak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F7RIYxd7; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F7RIYxd7"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-475cb71a4ebso1311896f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 14:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783719663; x=1784324463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=98z+F18zm2o1eM5nkxQ5VKYEoQh7CpUJdp3ti2B74Ec=;
        b=F7RIYxd708YM3jQHsLdNtcVcoZ7aOviKcVmkiiGo0mw7fvIMpGl0CsQgrlft/cOoKG
         kSxqFPAhQEDSKD9vtdUO3nC8TR95bDPsIkFAJZPEzeKXeLh6zN56ERp8njtiz0nSwJLV
         rFDjyB0UhTpMquTModkqZZTPRT8CKZ6o/8cq0vORdwFq3+SxTucffQf5BWaSl1Q+ChcT
         3c74Gxh4yEFqLyla7jImI1NifWzRXT0u8zNHNGUMFntD/kF4BbVw2BZ5FIuqrMae5j9Y
         OOn8SwEYz1BCFmSSeTPf2aMLro5JZ0hBakzJ2mCcNneCI2K82MuGjRldftO5ZY+sZ84q
         SMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783719663; x=1784324463;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98z+F18zm2o1eM5nkxQ5VKYEoQh7CpUJdp3ti2B74Ec=;
        b=Ed5G0V1qASZQqcVpqWfE4n4Cz4IgklnD+ID3vz7Q0PJO7IoI2Bk9ZRVmj3YNfpYO8T
         OyI5CyDTeGJkotlV8CxOw7CqQPobHAZENVscij/6WAjFgXV6KiL135b5VuRmxYuxdCWI
         ATnZan/fap/JSNcLYHINHwocfzlCfSkPFrXGmrAZ/jMyltIU6pkZCpPyZSKYRkSI6QJS
         Qd9FDk9ycuQebFPWoj8nbKRzVH/zjzSjpw8e2HLhE1oog94GBKg2XYFDVII5h6qJLe0h
         /quGf1eEIJa/OaqD9FDpFDAfXLFXYc16d7SNtx19EqN62DgMwf8zgf4ceXv5qnS+0QM6
         xKKA==
X-Forwarded-Encrypted: i=1; AHgh+RrXrTduEY/49IR2Oky3NOi1Irh1IEdhjx1m9e4NjK+O/81sRMhzickfC41m+NtwuVWSmargSza2f9u2a5tQ@vger.kernel.org
X-Gm-Message-State: AOJu0YytfX89kQCjfkvaT0kMLt7zOKMvGaSsK3FWaMLzf/+g4XU8leVp
	4dwqydFQ0+tZrn3LDWfk4WSoWKZwn2iz1YHxfZL9Ii0nruiT3yc50r49uDdAj/9tw8c=
X-Gm-Gg: AfdE7cm3hrNPPkiRWXCTEsDvsVV4984GLqGwaxRbXVf33541YJoH5e2l863SbNzfK3D
	NdB8CzOij2wTNFScRXnELcQf8L+CdLVY52L2r99ebZ9hQtyOEy9+BVZVxlLPiGsXggCa9CNd7Om
	R/049LAPYKIS9eGaRmLhGelUAt+fs5vFKNJMvSFajxqsSGmUJhaT9ibX1TqpCAHYLzJgF9gqtmE
	MJ3KjCkSXaRIRZTuUwFNTWWUgBALlSq+rFPosWZmNNZcR5uHliWhCmj2GBSCDUyRKh12SfOO1yK
	fBEXDc0F+x2koYP4vZ2SMGHp5ztQheS0fsRxfvBOS+Tp+KOAlF2ZVbRfdm9S47nBVYSAjpQ5h4K
	xl9QLmVdQE7boJL7T4s6fZ4DSF3/hN90sqcW506RE6TfgsgJGUcNYjN2lCu/lR9aMNi7R34BbXT
	+OnUm2WLP332D7tmmBNzSzadvI
X-Received: by 2002:a05:6000:4284:b0:477:b22:488d with SMTP id ffacd0b85a97d-47f2dca803amr471641f8f.10.1783719662677;
        Fri, 10 Jul 2026 14:41:02 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.243.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039bcdasm65817946f8f.21.2026.07.10.14.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 14:41:02 -0700 (PDT)
Message-ID: <54d76244-8ba2-472f-8577-b5d445d6ede0@linaro.org>
Date: Fri, 10 Jul 2026 22:41:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] media: uapi: Add CAMSS ISP configuration
 definition
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
 <20260710-camss-isp-ope-v4-5-51207a0319d8@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260710-camss-isp-ope-v4-5-51207a0319d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/07/2026 10:04, Loic Poulain wrote:
> Add the uapi header camss-config.h defining the ISP parameter
> structures used by the CAMSS Offline Processing Engine (OPE) driver.
> This includes structures for white balance, chroma enhancement and
> color correction configuration.
> 
> Signed-off-by: Loic Poulain<loic.poulain@oss.qualcomm.com>
> ---
>   include/uapi/linux/camss-config.h | 161 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 161 insertions(+)
> 
> diff --git a/include/uapi/linux/camss-config.h b/include/uapi/linux/camss-config.h

Why haven't you based this on the HFI stuff I supplied though ? Its the 
same hardware right ?

---
bod
