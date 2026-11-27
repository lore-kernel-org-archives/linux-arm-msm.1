Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779622;
	b=Up02zUa+DIW5htpogCS8mOix06/c1ovz/FOw7dX8JngAq6hlszgoNBjJVv6xarHtyrkY
	 60+Yqx4cBc+KKI5Eets4P7/iKVWzhBBWbGj3CqUpkCypd1rZP2eTq/Wp/EFK5ele2gvfq
	 l89CYdNzTI8MUA34XKwOZYFaY2lZmXtr7Upk9teUPy6XHhBzCkS5BoWHLy98QJMlwGDLU
	 o3FiudcEdritGYHrJIrxW123vCmX+DL3fg51kttYCLmnZoyMzPG3v9sj22KyPPqr53HXZ
	 CoXjp0c1XxdaB2oZXL/KUa7qSY66Ce7SPOO3JgYM7qJZ337oByWEBQsnwOExh/wCDeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Zty8k92Xw8D3zu7C7Tcy3SekI9L2+sn5YpLaa5BKAmA=;
	b=I/M+EiV5ePrg/IfMooQgI67PgSFDyUxA5MLDUT0ZyorbONSKqGPA1JYrlXaXnH28aV3T
	 qmDWfjoi9oKkGVOX+zlw3R7/U0zCNEX9wEDwPZdjl/lt+9iupDf5ihtn0ustzAx+oJlSi
	 +RL0nyvYaI81oxZSCrtU8k+st4RInbZJcVwJnPG4/f1cec/9f6D9S9jDNcYC4l2Wd81w9
	 EDHJdo4TX/0kdxWxx1R+OsikIWDN0UnpJp1XDQJUiez8ReQOwaEcLiKUDllQ+EtS0cdJU
	 hFeyDs06XXDRe2wXFt9KGwFGvatkctulFLrOpP7zr50Pt9/ZwdI2MmBP9j7ZhhcipGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=V4HFTwzC;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF46D606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:40:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF46D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=V4HFTwzC
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e09aa5264so4682054f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 03:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795779620; x=1796384420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zty8k92Xw8D3zu7C7Tcy3SekI9L2+sn5YpLaa5BKAmA=;
        b=V4HFTwzCm3kQS+qyVyn3ZcPjuiuJzOciFrSzzZWbmUiX0V/qW3gB3+kjHgiJ/4S0TY
         E30XodvHDrlX4Fj0LqjacnXxaERpiOfbDD6F19/A8Q4k3EMxugB5RaiEeymT+wqWUy0r
         OT3N7E8WXRqDihwAPl8fFyDpZ/zj9YQK0w1Z++WA5kXxhWP53VZ1+VGZFeMZl9tS4Tbt
         ds/F/xVSFNRcecbpnp0zMubqHaugYVwsKmjbI4jKfrxvJyvfT6+0lCaq2lcWv3QMoMew
         xgV73mGnuBRH7Won4jBcO/WyUwYFnKxZvB9xchwYbwgd8YRqEk8nyg3F4t4hHAOoNP4b
         k5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779620; x=1796384420;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zty8k92Xw8D3zu7C7Tcy3SekI9L2+sn5YpLaa5BKAmA=;
        b=cosoIrHVOf9yUmPNWi5X3UWMAKBZzH+WoRN2i7Ec7dFYWPF38ALYlSwpOtYAXW7ocT
         4Y0/U1WbQ6VYPalwfIPWo7JpjIF50y8mHlnlm+hlyNAFuIVojjamJYyoQ1p4OJFtUn6J
         1hb74uhmdKOatOeBty6PQJtZUBhldIAn4esKSbvjVI7U5T4l3cWJmZmnISU5/StOnxTr
         SD4wMGO7mhHpC5U++nzByFUO42azWGQlzQ9CsPbTmXYsBD1JORAr8tweBHjIAAOiPrEu
         Oh57mZ+Znal+rvuZLzQWtq1ebIF5U6vBTBiLC8hkI8TZCWCPMPK/deWXfGrmmEudoOxm
         1mgQ==
X-Forwarded-Encrypted: i=1; AL+hErH7lBywuMFqaaUIp/Bmp5jfBDa1liIeol42O7J+Zmx0L63lHAs5n/0E96K0gCMhqmoiXw3rCPO4ueD0yJa/@vger.kernel.org
X-Gm-Message-State: APuU4Z8/n/745FhxfIGGask4mlFtifMfo8v8Ng1i7Psi6mXURaAtGpEZ
	ZXeOE3LTxvtloKat7aW/X0VJezIt3Sxa3DEF2hasJxwCsjFG3oi1OBNv1v37tJ+/rfA=
X-Gm-Gg: AZFdTZdbEAIKDb2eA8ZkCgS8ZSp7TBK0EKv5NCMXSfqU1oYLKM9a2uvG9ehA53Jz0kG
	V+1oaSgrTScL2r6LDG82dKm+OxSMWsQLNyPXijMhtTrqIJdSviAA6vcQSj8rXXPKxKEKMo4d+DA
	rvT7mjKM84qQOwDpgkmRCdn1FeeAit/vA276HFvjsvV1NyYV/mAF5kNznFnxBYSk2NYMn7hgFsd
	T4MsOVI9O4tIAVp/nCUOPypocqXxSW+FhCC8dywqfzG+zQ3ZLk8Jo7Ofn8vl1PXkflOI/tJPf2N
	SteCsGvOuvZy1+FDk7w/lGspZYqe4zNG0lOX2xxKdYAO7mcz7bErA+nn8Dj8h///Db0UsI2VHY/
	7Lk2YQx9QZlDjAftKH7Zd1/zlWT+GMzGkUq6OMIDW7jRytc1ZnltUebHLwgtqQVixfFuJN1IFsT
	54dQDJqGi6sZCaRkDPG+e2b2Li6L8tFdSbHvT9uHvhI8iTHrqOS4akDlr310ByJwaH8K9S9fNYe
	bNeSrCCQU43aQ8UN474FTkeIWkp6bKuir45Ka2mKS4ST1xe1myJBT/efi4++uFO70L+EIJD6k1N
	ZR0Pc3xPOkdtzoLpLe5ePOyvA6GY0PnIcnhIL4Cj
X-Received: by 2002:a05:600c:3b9e:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4bb88820687mr559198225e9.29.1795779620276;
        Fri, 27 Nov 2026 03:40:20 -0800 (PST)
Received: from [192.168.0.167] ([109.79.27.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm46119407f8f.40.2026.11.27.03.40.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:40:19 -0800 (PST)
Message-ID: <ccd91b1f-7476-430e-abdb-3e63be5e8c4e@linaro.org>
Date: Fri, 27 Nov 2026 11:40:18 +0000
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
Subject: Re: [PATCH 2/2] clk: qcom: gcc-qdu1000: Add sentinel to GPLL0 even
 post divider table
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>,
 Melody Olvera <melody.olvera@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20261125213433.1438537-1-vladimir.zapolskiy@linaro.org>
 <20261125213433.1438537-3-vladimir.zapolskiy@linaro.org>
 <67b17c55-e87c-464d-8c1d-fb015041be2f@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <67b17c55-e87c-464d-8c1d-fb015041be2f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/11/2026 11:04, Konrad Dybcio wrote:
> On 11/25/26 10:34 PM, Vladimir Zapolskiy wrote:
>> The GPLL0 even output post divider table is not terminated by an empty
>> entry, the table is passed to divider_determine_rate(), and the generic
>> clock divider helpers iterate over a table until they find an entry with
>> a zero divider, thus they may read past the end of the array.
> 
> But there's a .num_post_div?
> 
> Konrad

I think divider_determine_rate() takes the bare table and requires the 
sentinel.

A more salient point is why there is a difference at all. TBH I thought 
the sentinel was stylistic not functional but, it seems that is not so, 
there are two differing interpretations of the same data.

Should be one of those consistently...

Actually include/linux/clk-provider.h:716

/**
  * struct clk_divider - adjustable divider clock
  *
  * @hw:         handle between common and hardware-specific interfaces
  * @reg:        register containing the divider
  * @shift:      shift to the divider bit field
  * @width:      width of the divider bit field
  * @table:      array of value/divider pairs, last entry should have 
div = 0
  * @lock:       register lock

=> every table should have a last dummy entry

---
bod
