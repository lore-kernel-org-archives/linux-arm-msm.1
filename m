Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261771;
	b=2kCuzrvRAN3qwSp7jrRMz3JUKcdvTLaxbQG7eGyTdkogTxiNSIlxL4wksPNQ5YHnUhKC
	 QtEx+p8pkWbvNcIgiL0u4rxjnsJUMBQ3pBzqg4kghwAtij9R2C8Os/+/rJIvpXB5FpXy7
	 hUkud44GMH4ddWTKTXDdWUTuKcq9qOG1ysVpqjX/u/WxKzH9+tGSDrlKoiR6+TbV0onGp
	 44VNI1r9wzhHL7fq6ES2GCwmZInhUik52dSA0g5hsakZgack4HzR+QtobxyfynvicWSYo
	 4ku+7o3MlJYvpo/b0ro9OzAwmw5q1vc9aFZDsTUHcGVmMR+62J92d5vqCBlm3Y5iqZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=yKwHsBgWsnYwW2gL1FVzWYClyycwT4ewUl/GuVtdUlo=;
	b=JAMY9m2WJwmDP//CdeumPbDNlyhSTJhQkRGi0G30Q3g8NlBYK5jBgkuu3mlrPxDW6OYO
	 sNcpwvVfskL+AF0LN99SG856ves2DTGeZ3wMqx7OHHylyWSsLTiiGx4t+xHZxFrVfFj8R
	 IDMgRDpzzFfpC5xqLErBFZDPGRQ4aNHqTDXHGh47qJU8WFoh1rNwXnoN8rSYKQdIk5z0x
	 0yOiy6X7jy+Jq2JPUr9j0FOmPgtwXevNhZtJ0IzNxcdojrkDuncjM9k52Ezq3d+tZOUmP
	 G5Lqm8D2uocP6KNbeUFoCh5FUUB10W98y4NkNYX2KA7z34KMwIgsi6b6hsnuuWJh9Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DhVm3V42;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCC4606A330
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:16:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BCC4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DhVm3V42
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so21685615e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 01:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793261769; x=1793866569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yKwHsBgWsnYwW2gL1FVzWYClyycwT4ewUl/GuVtdUlo=;
        b=DhVm3V425hO9R9e8v+hQASAIDN4E8dzPnfNKYpbAAL7Ry3mgMhwOniEIFT/py07BqQ
         m0ZtiB5OLL4rCQR/ufb209Q+iGKxHsBvmZRFAmMnCJ5h6lpT2E89H/76AVFv/bp4350y
         EqXighxV5+Hx9qgc092i46RZDp2oBfhcbgksBYsmdBLOxLCoMKK1rdFeuyUQNSg5kq34
         vnap7Z8XnXGepqbO7ixR+t5k9vJ9+rf5FAcT+TzoIYSobtYBU7fLvkepEouzWVO6WL7m
         UItEvzDA+2I9Ee269dKArN11nkinerJ2Ij/Rkztimsx4mnBO/aH/KyU6UU7LHUb6ZohN
         4Rpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793261769; x=1793866569;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKwHsBgWsnYwW2gL1FVzWYClyycwT4ewUl/GuVtdUlo=;
        b=l0QQW7IossctDbwg4+FjAExEv8Wn9aaRzHWIyn1AOPc03yvAoN4i+KIn+P/8su1QLW
         +Euggjm2Ol0ciCc0zvxRvBmxv1906Lhbq/puycDoRUSdYf8hO1kdwoxfM06Nb2gXvKxI
         3iyl6G3PYB7RtvzS2YjFEMS3uly/dQ/0Zi8qrXWtcyc9i+I/HA2tDSoc7iVotqKQhbLx
         cfBDqVk/rqKzaykjBQX7/Z2obSsTSw6Whc2vNv+zpqZO+kKMm44l27gMR2NBRAQEMgL0
         WZP424MeWZnXyatEZUe7hZEcIRN+Vr+EulWX7xQJYWUxHHB+DbP9p0oO7IIwbe6v3VKl
         fFMA==
X-Gm-Message-State: AFq9FYLsQo0bcOc2+PhtrBwvVt5x22f8c7MSKwryn+vqp6fPPWAUiukW
	PJrZkyu48iD2wG2yvXefI1QJKtFMFg01D8W6PYYMocZGnHzgu3NNYI+YUqBPEw==
X-Gm-Gg: AYBFou08IIdSQm8Dj1fhWoXTupcD1PcYxJH3hPKOq91x8NOE4CIm3iNpdke3JBXvIfD
	hZBIFt6AOX3UmkDj2JQAAilz/O+xLxD+HwlPWx6pNaj8wq5H2V1oc9TmIMe6kdDxSniPSO7cx8Q
	VxwoPLmoTOLNt94gD5YJE7273yCvoCaBF7ikTg33R2f6BOkDPaZLsUH+i1qfHimUwdgjJZ9qXTm
	0UONyYE51Zw0x6hY4CBOsMNvYQLP9CKZtABqnOHrfg3yA+CgYfLRJL7+iFMlLFHN0nrw8JZvlz2
	5nrjmSz0t1rwLRaELp+JpQekJnVctenmxPQOK/Bvt5t6XxKzcf/k9ECw06eV7mUVfMPGdde0Xtn
	eo5SH5IWh1E7dc5mG5keo7tvgP6zuGS+8ZVMz+xlkJ2c5v+a3fTCHyXgFG8QEOVSdqp52lpKgzu
	OSJ5xJlGVxl8ftxxCJumOKQ3ctmyglrOfJx2wvkjJLeZO+oAw2kZCYJU2AYH7wnzNeSF05JkyRC
	TgLZ/dN4uliUbnNRUAMEO9akIBa47NVonvFWB5sVwYZKxb7i1WkNlJ8CaaCk9O2GKtMSapXj6kJ
	6OOTsZXAA/VxtvbHeYbG7b4lNA0QuiZsSCDbm1NehWwZfv/PXBNkIa53W7vfceYxdHrs
X-Received: by 2002:a05:600d:8496:20b0:4a1:a6e0:4ce4 with SMTP id 5b1f17b1804b1-4a9b1434621mr59499955e9.33.1793261768411;
        Thu, 29 Oct 2026 01:16:08 -0700 (PDT)
Received: from [192.168.20.170] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94f05e4e4sm70001885e9.3.2026.10.29.01.16.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 01:16:07 -0700 (PDT)
Message-ID: <974845a6-16bf-41ad-932b-244112b85cae@gmail.com>
Date: Thu, 29 Oct 2026 09:16:05 +0100
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
Subject: Re: [PATCH] clk: qcom: rcg2: validate frequency table entry in
 __clk_rcg2_shared_set_rate()
To: Taniya Das <taniya.das@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261027-rcg2-avoid-null-ptr-deref-v1-1-43c21b54cfeb@gmail.com>
 <d0492d0f-42a5-4400-80d0-987086d7d224@oss.qualcomm.com>
Content-Language: hu
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <d0492d0f-42a5-4400-80d0-987086d7d224@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2026. 10. 27. 19:24 keltezéssel, Taniya Das írta:
> 
> 
> On 10/27/2026 11:35 PM, Gabor Juhos wrote:
>> Commit aec8c0e28ce4 ("clk: qcom: rcg2: add clk_rcg2_shared_floor_ops")
>> removed validating of the frequency table entry pointer returned by the
>> qcom_find_freq() or the qcom_find_freq_floor() functions.
>>
>> Since both functions can return NULL and the pointer is passed directly
>> to the __clk_rcg2_configure() function where it gets dereferenced
>> unconditionally, it could cause a panic.
>>
>> Restore the sanity check removed by the mentioned commit in order to avoid
>> a possible NULL pointer dereference.
>>
>> Compile tested only.
>>
>> Fixes: aec8c0e28ce4 ("clk: qcom: rcg2: add clk_rcg2_shared_floor_ops")
>> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
>> ---
>>  drivers/clk/qcom/clk-rcg2.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
>> index d7914e59129f..260e90f53461 100644
>> --- a/drivers/clk/qcom/clk-rcg2.c
>> +++ b/drivers/clk/qcom/clk-rcg2.c
>> @@ -1385,6 +1385,9 @@ static int __clk_rcg2_shared_set_rate(struct clk_hw *hw, unsigned long rate,
>>  		return -EINVAL;
>>  	}
>>  
>> +	if (!f)
>> +		return -EINVAL;
>> +
> 
> Normally, the CCF calls .determine_rate before .set_rate. The floor
> determination helper already rejects a request below the lowest supported
>  frequency:
> 
>  ```c
>    if (!f)
>       return -EINVAL;
>  ```
> 
> So an ordinary clk_set_rate() request below the table minimum should
> fail during rate determination and typically not reach
>  __clk_rcg2_shared_set_rate().
> 
> 

Thank you for the explanation, it makes sense.
In this case, we don't need the patch.

Regards,
Gabor

