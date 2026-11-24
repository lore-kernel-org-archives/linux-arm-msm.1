Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795523760;
	b=o1N1pcGWKWpNEbOWFFNlp2ibt3XNJl9f6EMOAH2gFg1nz0TY+lC3w5d9s8aGIWD36/1G
	 vdzSWVWsELsCM32g51n9KHYDDZK1T3muAzzTsjPMXQOihWsybGzMuMmBLDaKkzyx+7n3c
	 80ZWxDirn87lvnUVBeP1Bsblb4ZSr2SdA2+ft74ZBOun7YWeUY8fQWJmRyd0AjnCsdBSE
	 8XOfAnHNoQIVdDWDoANv2cUuirnly42qRfm1cBHoK1iVUCxPO/TjAWzKCxER020AREaGa
	 YOHTpsTG8BXCWGkWZ5oGm5/8AFUDZHpEszJA57TkUvEy2fw8Cv225X2Srvd6Ty4dFcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=A0JZ8rpuLBAnmoXP2EXMjipyYHstvEtP1ShZXzsUQ1o=;
	b=5gp8WedSehZDBcXEMHd8JiUv9N8QWyEzvFubXB0A3UG7+GOrJvg5J/YypidN0PJQR+cL
	 W4EnfihXrZZ210KhaSblgw0JRbxQPueiG9yfQj2MstMiZry5koFZrhini0BGMhkhxgA4F
	 11SryIUZ5UuL8AShYbbD6xwWQBgZbWIR+afxy0fwyy2NAZrtxZ19svAD71K6W6qWZmGhZ
	 CVkahqNjriH4JdG8r1iRYpeniXjXWYUpqTlKTlD1zyQxTSrMpI2mML7x9HYDGCXnX+SOi
	 g8oUZ7AY2qFD1iN+wHYtkAlEK0bhYqCBoPHsIQpWD3jUcVRkPDSAVrvrCBdLxJ+IAgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oGH5MxDT;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61D2606A321
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 12:35:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E61D2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oGH5MxDT
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c515319dd89so525000666b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 04:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795523758; x=1796128558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A0JZ8rpuLBAnmoXP2EXMjipyYHstvEtP1ShZXzsUQ1o=;
        b=oGH5MxDTn+d8EiD6of2XuA66WykMNo9n4h4Uhdx54Kkx1dFVHhUULXYgtpoF0BnCRm
         TZUkYi/GO+ktBWCOSerzr6XrHk0LVdCMqIe3OdtCnkeq3z9NKCaO4djuexke7K5p0Ed2
         1lhkV+ggicW+lB48KjNL865PrjwbpXuvgbAGdkR8xo5X1z7ZmiR3klPJLknVc/uW9x+T
         +Zc4Y0z/DVdFQPg+aRynpcBYKhu1Bc93iRLPBefei4XLwR2GnBKMkkA5jmGtpyzA5xlJ
         vStQJobCc31gcwxhJp+unl3iwmKyEpMNxL02QreicRUNs+WoQ84k+Tvg++TluZaOvLmZ
         ZiHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795523758; x=1796128558;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A0JZ8rpuLBAnmoXP2EXMjipyYHstvEtP1ShZXzsUQ1o=;
        b=GmmuqK+H6nRYwyJ11f3X7pW/xThbg975CBryHZSMqoT0KzJjgKGuxOdi1doSgyE0lS
         knCJdccYT6Fhb4ImtiRcELkfzBQiuVCfRGJALexTxCda9cAABl2Wq4BUg8w1eA1xhfhB
         qkWKLWxl1bfkS3AidT0wRBS3u++vGgtXmhWLAqDIYiXIP8yPK2LM617nB2PblYkuNopz
         2F+i86VCaZcOQTZHru+ZJuNy/g4iXUkbWTS1BKWwSJtr7G4cwTtc7gSAt0jkj6MLP149
         hiy9AHrD9BBI2kHeB7ZNlsKGRMcLC++v/tymRaJHYs2jNuGGtP37PUC9mmOJ6KxBLjmw
         M5Aw==
X-Forwarded-Encrypted: i=1; AL+hErHKQ5yul1qEZbk46gm9jmnuJQlOxYTWGsg/ASBG06lsSJhpYF/PIePh1D5kjkkFZlVT4yvxGicNuUA1jvKC@vger.kernel.org
X-Gm-Message-State: APuU4Z/p9HQJ1hl8DyXvqisCobJQu33tt2cG0bfELOKH0SLeUUlJFe72
	tb0yur/SRtiXKEsO3Ia7bGQlkKJtlid71CDQKob8MjkZ+S38uooEFnDb8pnszQswcFz10r8+ZRL
	jcpgrrkg=
X-Gm-Gg: AZFdTZei9IB6NNoggM0+QFjfmqx3Ecy2ZTStvW+xcmB5EZrDMtP6NW1bteh7CxDbPuO
	8QMcPN4zfCWToPdi5YHjccj4TqEPNKOZKIpUfk29QB43yYjmtdVIkVirY6GNjhIK5FCs70ywCAb
	p1sYcUzQO/N3nyFVS7OHa/jAAC7YpA5JZqNaDEQzCXgHyWrCb0nQ/Uxuet63s1T8BdBR5hj++Wn
	Inm3EbpLNH9fIyL09gIt/teiaI7sR1gl0n0r8+B9WyE/enp5a/8xIiulnVP5mn70Gc7VmxvBay+
	Iotk9i2Fibq5pPEDsckelihmFt3nJFo/kpR5FuP6QBX/p2U8w9omusseAfN9jA8RECCAs0/HxZ/
	Z1wPVpif8wxLyIHA3oj5essxI2c8iDPE58CdFMVK9rs+gVsmwUxIoE3WWKpIO7cdPN8dye+S3VM
	2iihQjITxsL3f3KJd2Stc4bN00jdTZ5HX7ir86RYeAtw8hpIWe2+rHA/TFybIcyJAX793xt8xk0
	275tSmNM+kcjpEHrk2dp5WTVyojeIUUr5weZsUVry45+3n8gTKRV4lHDLIL80T43LF3EBOzLAvA
	LdZHv1M23dIQ7svmowTQLeU/b3FjcX3gz49ktHz5zbA=
X-Received: by 2002:a17:907:f812:b0:c50:d92b:6f40 with SMTP id a640c23a62f3a-c513a88a6b1mr1121542166b.20.1795523758207;
        Tue, 24 Nov 2026 04:35:58 -0800 (PST)
Received: from [192.168.0.167] ([109.76.241.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc42bbsm503065066b.61.2026.11.24.04.35.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 04:35:57 -0800 (PST)
Message-ID: <57fed113-9f79-41d3-96d8-725be5e58918@linaro.org>
Date: Tue, 24 Nov 2026 12:35:56 +0000
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
Subject: Re: [PATCH 3/6] media: qcom: camss: csid-340: Report the hardware SOF
 timestamp
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
 <20261123-camss-hw-ts-v1-3-7b62dda6d7a9@oss.qualcomm.com>
 <c7fc67a6-e15f-40df-9c0a-7eae54e99d23@linaro.org>
 <CAFEp6-1otVCjNJgWLTiOMQpdy1t4qJUP6_NK0CuifrN+cOTTcA@mail.gmail.com>
 <08b9a714-278b-4e1c-81c8-59a60dba5916@linaro.org>
Content-Language: en-GB
In-Reply-To: <08b9a714-278b-4e1c-81c8-59a60dba5916@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/11/2026 12:28, Bryan O'Donoghue wrote:
> On 24/11/2026 12:20, Loic Poulain wrote:
>>> On 23/11/2026 17:16, Loic Poulain wrote:
>>>> +static u64 __csid_sof_timestamp(struct csid_device *csid, enum 
>>>> csid_iface iface)
>>>> +{
>>>> +     u32 lo, hi;
>>>> +
>>>> +     /*
>>>> +      * The pair is latched on SOF rather than counting, so it can 
>>>> be read
>>>> +      * one word at a time without tearing.
>>>> +      */
>>>> +     lo = readl_relaxed(csid->base + CSID_TIMESTAMP_CURR0_SOF(iface));
>>>> +     hi = readl_relaxed(csid->base + CSID_TIMESTAMP_CURR1_SOF(iface));
>>>> +
>>>> +     return csid_timestamp_to_monotonic(csid, ((u64)hi << 32) | lo);
>>>> +}
>>>> +
>>>>    static irqreturn_t csid_isr(int irq, void *dev)
>>>>    {
>>>>        struct csid_device *csid = dev;
>>>> @@ -207,7 +234,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
>>>>                iface_val |= status;
>>>>
>>>>                if (status & CSID_IFACE_IRQ_INFO_INPUT_SOF)
>>>> -                     csid_sof_event(csid, i, 0);
>>>> +                     csid_sof_event(csid, i, 
>>>> __csid_sof_timestamp(csid, iface));
>>>>        }
>>> I think a callback in csid_sof_event() might be cleaner or some other
>>> way to not have to replicate all of __csid_sof_timestamp() for each CSI
>>> decoder.
>> I added it as a parameter because it is provided in much the same way
>> as the sequence number, given that the timestamp is directly related
>> to and coupled with it. So it is not clearly obvious why the sequence
>> number should be passed as a parameter while the timestamp should not.
> 
> But pretty much every hardware implementation will have to do the above 
> function. I'm asking for more functional decomposition.
> 
> You could pass the hi/lo for example and make the sof_timestamp() 
> function common - called once from inside of csid_sof_event()
> 
> ---
> bod

Anyway yeah csid_sof_event() increments the seq_no itself so you could 
just have a ts = csid->get_sof_ts(csid, ...); and functionally decompose 
without passing hi/lo down the callstack too.

Either option really.

---
bod
