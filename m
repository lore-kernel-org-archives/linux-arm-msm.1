Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624321;
	b=p/kxGajVxgOLMkw72qo4QrZGt9obpVCVOUHqYwp9c4h/s14Y5OiIgZnz4yHgdkyP2x8P
	 14+Zdy2qFp/ZEbFgEcYxETl8ALhm882aanYC+lUnF41QIezAQP4yUZB24Fnm25VWH95XH
	 NgBb/EZ6U5PpyReMO8vL8+1S/hEeyxEpH8df3IAH/gAtSJyc6mxaqnKo5nZHuDkzXvaOk
	 cMw4GcJZ/BlWqhqFiZK1blVfzCM6yb7IZamvPPDEcklOtEz8Mh66B4PvFnZUohIBbGMuG
	 Gd11zcBiZvrDOXHec6xN21coUaB9NO0zMwlO14FArClwSO8lZjOOhVoF1eTd6taETRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=LfM4uAledb3ebU9yvjdbYO/mTumVwk76mc2SnxdRhO0=;
	b=M9fYCa74DTyoy0UL6qfMu9NSPopTT/UkQZ4jl95+dzl5ubSUKOuoEQx3uk8yZJX8GryD
	 TrA0yHPajZJLRiY2wrmQzrB7JgtERCwMIiVm9EwlIg7jhUVgjEdaBSQt59V3tWodOiiyv
	 6NeirbS34GgaYxQhvqFBYq6ILeebLkXkkflAhiqj9e5DLQOQG27fBd9d+ZQ49EwSRKmyV
	 D6IUMcHSwB2VjNdKokoX7BDtIIEOnujrLVrfBXjkiq6PvMWuHvsTRSuZWEdn5gLHC0MMV
	 EgYJBlgAHmXYPs6gt+hrxgAwVE3Zyw0oZSEvbS50VOAAWEPGreLjECQqeCkyGxKKGLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8207606A33A
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 12:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8207606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c315869241fso414636066b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 04:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793624314; x=1794229114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LfM4uAledb3ebU9yvjdbYO/mTumVwk76mc2SnxdRhO0=;
        b=sgANBLTL4YAZDwMklFM2H02NJCcXk/PdaEgxBT2cdhpFkCoMZ6HxQPXwP3Z2b/DFeS
         wBWKIQCNz2vp3MFn2A9bfGLKJ+KfLCGxipZu5An6Be8/ZVkEo19A/rATSys6diqxaHtx
         J07c97i7fSaKZ2780Unuy3tmV4cGWFeFHLzoWzX4v2isazoe57QuT9koARmMIfnAKsIg
         vRgOeAcNKiSUpqC8uifA0GnafMX42orf2CX0h/BEp8yZMiZlT9lmRhupAQC5noRBEu2H
         IjpvebFG0o6EmmhdW3s2jUXkFps/v3WUdE7w11o9r1todRotUMvA0pTU2vV/s7A53Br4
         03sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793624314; x=1794229114;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LfM4uAledb3ebU9yvjdbYO/mTumVwk76mc2SnxdRhO0=;
        b=QfAzBW/Z/vZ1D8OoOyEjG+TbWC2CjIljUOXpfFhugvd5ju/LK6pACFEffIH89X2kC5
         Hk5/+6IhCR+nBcd8C8WiSIsBtGUkZDEGvE51U4LyS5Le8UGKsxdJL8p2OYeI6us7bmvb
         6/ghJEd2DxSJdlWuR2TJ61tbGpUUGR+9X+4f/ZHQTyTGxe2bvuM6e8/J5xcLc7+D+N6Z
         Fna3NJhyyIfmiypgjbjr6MgG4wS5cBiFokgShDADwoM2oH4JCOLpV302XtxlUZ9IX0ac
         TNaX5PfleFKUM9IPtOUD9HZiD4UOXNPZcNR6DjtHciAcxgu1Lc4R/48b+V/FQHsVAS5A
         ECDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwun8jFvEalcmQ5OtTlwjHLycCKnTNLM3QqsGZZfbYv9WiCgCRkFBCOaEeyV5g9Gwe8RHrXFtbGEqWCLAxr@vger.kernel.org
X-Gm-Message-State: APuU4Z/vn3N/inGMsTPrLJsvEh22NN8tCmYxU58JqwKjheNFyqoL3p4v
	zFa/fRT6YiOrEdN+Rmy7tPIpp/+AQOSIQGpuv3kvP16oEDu7cFHE9AlBdVNnCks7+XY=
X-Gm-Gg: AYBFou2+s8p/wnZSqbfc3QXXIMznbKId77G9nmsNlUMFx4GDfn6/bN86o3QhtonGcz2
	YLwkseoXqdqAlrFmB2/KUtVFwusfpSOTpkpXo51ZtQUyIKVds5U6mIOS+trX46mX1TzDL59KLbH
	fkwnZ9HAPxIyvcE8axZuHG96AT7+5yZ2fxjjI1oNehrTs0IEXSTQzgteCu6uo/IWG2HM/j4iVRi
	eVWHBvHsBPoAZBm03GbD/WePcm1wlLz+VJLNZ+x1IeAe8ZBDgWArvbeiXCO5IM8/wftxwCxuxsN
	bj4RI5fH8eD6uv+hjyzY61SXzigjBzGRr9/inzVLGhBmbXG0T1FiekDvwI/QNBHSI0ZI6Z6SHKT
	UyzcodsioLBL0ghq6aIQJuIk3nrnr0SnWd/Wm4B8K8/I293cHKZdC8SG1dSIKsRJTB7/vK+nRa9
	2Kv2Jk4MXV42w2BHeYstXxVsiW93E2TWZU64B1rMmoz8DbSceRWenlgNo5X72H0UuNkcTHqPJXd
	j4Huuf3+EswiiSZozJgQircf3inx9d42AqHPuQVpBiJSLSu9HLEtuHwBZhiFnOb3hFlzs9Fbqu6
	nKnNMPEABqKBniebly1Et1cAW7UjMPbsk2YjYw==
X-Received: by 2002:a17:907:7253:b0:c29:6400:ef8e with SMTP id a640c23a62f3a-c4ca7aa5303mr800564266b.42.1793624314046;
        Mon, 02 Nov 2026 04:58:34 -0800 (PST)
Received: from [192.168.0.167] ([64.43.42.35])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca0f376sm3476980a12.26.2026.11.02.04.58.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:58:33 -0800 (PST)
Message-ID: <fac8cd6d-c3f7-4ed3-b0d4-7cb8a7a6f451@linaro.org>
Date: Mon, 2 Nov 2026 12:58:32 +0000
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
Subject: Re: [PATCH v3 5/5] media: qcom: camss: Add support for Hawi
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
 <fFfGGWaoXA-LdO6s8Xh_kQWQfncXe9YNdpcj2yNkphWHAR_V69LdLOcuhXPsbg8dEUSN4j4yygq4wPre5cz79w==@protonmail.internalid>
 <20261030-hawi-maili-camss-v3-5-9742bca8cef2@oss.qualcomm.com>
 <5817be6b-7180-407b-acb5-8c5fdef4edfb@kernel.org>
 <73b1f591-69cf-471b-9763-a0b719c74501@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <73b1f591-69cf-471b-9763-a0b719c74501@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/10/2026 15:25, Hangxiang Ma wrote:
>> On 30/10/2026 12:43, Nihal Kumar Gupta wrote:
>>> +static const struct camss_subdev_resources csid_res_hawi[] = {
>>> +    /* CSID0 */
>>> +    {
>>> +        .clock = { "csid", "csid_csiphy_rx" },
>>> +        .clock_rate = { { 480000000 },
>>> +                { 480000000 } },
>>> +        .reg = { "csid0" },
>>> +        .interrupt = { "csid0" },
>>> +        .csid = {
>>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>>> +            .hw_ops = &csid_ops_1190,
>>> +            .formats = &csid_formats_gen2
>>> +        }
>>
>> This looks strange, why is there only one clock rate ?
>>
>> ---
>> bod
> Hi Bryan, the current CAMSS CSID code always selects the first frequency 
> listed for each clock in the CAMSS resource table.
> 
> In camss-csid.c:
> 
> [...]
> } else if (clock->nfreqs) {
>          clk_set_rate(clock->clk, clock->freq[0]);
> }
> [...]
> 
> For the CSID and CSID_CSIPHY_RX clocks, the hardware supports three 
> clock rates: 200 MHz, 300 MHz, and 480 MHz. If I remember correctly, 
> 200MHz and 300 MHz is not sufficient for the sensor's output pixel rate, 
> so we need to use the highest rate, 480 MHz, to meet the bandwidth 
> requirement. Thanks a lot.
> 
> ---
> Best Regards,
> Hangxiang

We have a series from Antans to address this though.

We should list the clocks the SoC supports not constrain that list for 
one specific sensor on a test-case.

---
bod
