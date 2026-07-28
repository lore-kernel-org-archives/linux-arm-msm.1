Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A87933AD8C
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 04:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785214624; cv=none; b=thmylpCrpbLO/aEGsdiJlzRSdxrj8kJVfzBGBnCmlp/v9lRufRXU24N6/aq60rKAOWEiUILUiUr3XF3nfa8gLdrT3257gc+VVC45fDgugaW9iM7ShpMYZxao1YDba/CYj2ll2uK7h8FP6vVc8mcmywAtQiTpfzqCegl845NdYdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785214624; c=relaxed/simple;
	bh=hOizCD2I6BSt33P6V69HLMaGu7nCr9thzDudHGWN4es=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iSJurb/KVNTmYdKbfOo34x4gNYhy+0T2mcbtNlPfM+5N2E5OwNwhloZ8cGaST1brTtbQ+4D2+qUcAZR8riPsxmDvf2VblKfyk4XyUyhPKAVvud75RCDguaLQZRTxLD0ra7clX2xSy12Ektc3ZAuo+zRv7JzKBQe6/HBKvf6FNyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mF7IchNz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S+WoihrQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mF7IchNz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S+WoihrQ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S3admD1303585
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 04:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qw7DVRkEEx03oALxXwFUYY32n4E2OOmQdIvTxIEA50s=; b=mF7IchNzUxnpeVVE
	CV3BLuUq58hYR04MpybciSLhDQ7Rm7YdSucWiIRyknCXTNztAHS8Ad8N7VfUZeFN
	cgX4p5sSCp1noY1Qpp2ppcwx6h4HVCxN/YjQ9uid8x2pd+qp3VOv62bfmfLCL5hv
	Pm7YsssKIQ1V9WZ/5iHm2Me0cSYbGBz6WebUnVZuSa/Vj7PcNL97mdPYvbDrd4RE
	GZU++r6DNVZGMr247EGNRwQ4ZQkkQN1PRtkoq5yRFupQO5YO+NgCBPk1/qu2kXen
	ngbtOQ1NbvSt7oXKddCLmp2sZVIkwfQXb9cOSLFkMLuixN2uelV+XCrXWVl57232
	2eojww==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbp8ahfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 04:57:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfc52ddc55so46194275ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 21:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785214621; x=1785819421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qw7DVRkEEx03oALxXwFUYY32n4E2OOmQdIvTxIEA50s=;
        b=S+WoihrQqXLo+zp3fagIJzVgK917VJIK5uRw0v/z21esjQ6Os+njyrdRbIPA1VrfCs
         L7SyRJWFB2aFgNcIaAtoM65vv8SBaQROteQ1gNO0ulyrpK7auZK876yUF3AT7m/3N1TN
         vyKZCJJdXFNi8weq/dTvBIcIzeuQI6I4W0ud+B+CxT181AnqiZ7TizED87U47s9UMWIg
         51c7hJs0b/d+CSLc/iTlkrXiqiRY1ZVmp1Q1hvNpGbEslFwxFDhm5oZVYdTHS2gH/SDE
         9wRZ+mMl4ZDLRrFqYH9ALxnRTINc0Azd69OV5RAxxJoXQQsIM2hfp8x9KrD22lzC2dfL
         olEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785214621; x=1785819421;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qw7DVRkEEx03oALxXwFUYY32n4E2OOmQdIvTxIEA50s=;
        b=FVhKpCUZaOk8mTJ5vUD1jVklzA7KTdPzmemFdJqHWP50s7cYw2osFmJJ2Gmy7TUtwJ
         hY8L2hn5ylvpd5gJzQa9jGDTRffK7HntbcJcrgIjXlircQUbAB4amjEZpn5FaE884C2h
         mA+lwnoGwfbx779XtMh8hty935vlhaAIVnEqbyxdV8oimlCERhZzxCpYLX+WnHyzs301
         J3RP18ToMsxjFHPPAo4IFYVsl8g95JDJsv9x8CW6aNGkAPN2AlE+4WNdiu1yVCsiS2ls
         qhdkUXzq5lMLlZvBNARPNzMqFAldEOSucl2eEU9fgZAQ7AhtlP6hEaOXRPAzYdIS3SpY
         3MCQ==
X-Forwarded-Encrypted: i=1; AHgh+RrY4ifuR5fVc7QRHRpNn3wvUIWo3LnyggpTPU8UnwUFzwsCFbW1SBtU+5EqztedQporzP63CSZlMdPsuILz@vger.kernel.org
X-Gm-Message-State: AOJu0Yww3+3n15WswhLem3lVSuq3ukIdl7V0tVBvZcxEe9g1GEAxfKFO
	j7VncOSljdbVLMPnCSM9pMflBg72HrDxgAMFXfTEtSk+3erUr7Pk/V2EHHSHre2GV89IuOx75e7
	+PYiNX+sNamCO+gi3r2AeEig8pDarR5nYjW7Ag8dJKEEmYnIjdUTTCO0dvnv1bSiX9Rpz
X-Gm-Gg: AR+sD10md7gHQK+esywENVZU+epd370jMd5Z57AWRHCxlTtOmyhExjdpNl3NsDCP76D
	sYxwJcQX5/ze0QHwJt18ytOvqu/8fQl3gzjty8NEMqQW9968szrrdGrQjQ6c5B2aeEQhyUsd1zt
	4En9hX2EtiAPsTyyO5tevdSG+XOuyrtmIJUJbiJYjf7r12QOi2wg8sTzew3/dcrm4Owz2JqvCs5
	rwJTtXWbf+XbSSolbmhzdvgR09z/+/0Cb1GGfkg1CK+f525Od0C5I/+NRoqcXVmoROwiA5ovvDH
	+AyvAZWU5BKrV0pmBC8xiJ17ypAgofWxoFjHDs8hr9M0bLBasF3/7mpP44Gi5JWVdV2ia80K5uc
	MP/HPZG8cjUzwc49PmxiH1i9H93B7FNVjfg==
X-Received: by 2002:a05:6a21:1645:b0:3c3:a20f:f729 with SMTP id adf61e73a8af0-3c8aafb4adbmr1134447637.7.1785214620567;
        Mon, 27 Jul 2026 21:57:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:1645:b0:3c3:a20f:f729 with SMTP id adf61e73a8af0-3c8aafb4adbmr1134423637.7.1785214620119;
        Mon, 27 Jul 2026 21:57:00 -0700 (PDT)
Received: from [10.217.219.72] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66ca388sm4050781a12.28.2026.07.27.21.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 21:56:59 -0700 (PDT)
Message-ID: <cb1e00ea-658a-416b-aef6-46c151d15685@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 10:26:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] i2c: core: Add i2c_update_timeout() helper for
 dynamic transfer timeouts
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
References: <20260720-master-v6-0-671261b05c61@oss.qualcomm.com>
 <20260720-master-v6-1-671261b05c61@oss.qualcomm.com>
 <amZkf3lu7gjWhw04@zenone.zhora.eu>
 <0c0d1406-949b-49ee-b203-3833b9f8433b@oss.qualcomm.com>
 <ame2tX1RwOo4F6Lk@zenone.zhora.eu>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <ame2tX1RwOo4F6Lk@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA0MyBTYWx0ZWRfX0c7wJeC0m3JV
 deQ7vQJ1YCjmImyg29PSKlmK9pDhEph8mWNs4FWPlxQTQjDZug4hm1kP5DdUQvgJXXilojEhfGt
 5CWMcAEK2w7Ow7fDk8+lu53B7XjQJSo=
X-Proofpoint-GUID: k_cmbRjOqnV_PQ1YSBHSy6vQ7wfZSlNO
X-Proofpoint-ORIG-GUID: k_cmbRjOqnV_PQ1YSBHSy6vQ7wfZSlNO
X-Authority-Analysis: v=2.4 cv=KLJqylFo c=1 sm=1 tr=0 ts=6a68369d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VvBNldowPlQVTM_YT94A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA0MyBTYWx0ZWRfXxeHixtKWL4eX
 iDsYo3AvtSZGVdkTM9QOA28fyDaSRsdJkC+NNWGcgEJX6lQUxsRqysgC8qRBAn7nI+TjCHSpI1Y
 EenmbI9pr4Ph2oqGpi2ILZ3w1dgxUBm05XCf8Z7yGip8+nEhaTWiSVJYLbvJAaTah5uBVYuvaUJ
 hqhY47dFl+AoMJnkA0XgLiNmsBjIMB0O8duUOEIO5zw82grAB+QOhEpmmDh6RMR5c/idku0eDLO
 Hfvj8uJ1Q9DZie+1WGlplx3tjLhyOA56+ujGT+5JQPFn+YLA5eGssByqoMubGs2egge7KYu22aw
 M+ShI45r3a13ZvBUEzkq8JT8fPVH/vCwxu283usFcmdbytcNxiyc2LcQK1WzJsfFy2h8caCVmRG
 Uo69Q0y8GtrEgjonBdwjIhn0NYg6KRMq2/laAhjvC12KWSTOeDQpDCJVWBJE4igrTY/dDX6SeY+
 +B1QaZK+RLKGh0N9BWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280043

Thanks Andi !

On 7/28/2026 2:12 AM, Andi Shyti wrote:
> Hi Mukesh,
> 
> thanks for the nice discussion!
> 
> On Mon, Jul 27, 2026 at 09:45:23AM +0530, Mukesh Savaliya wrote:
>> On 7/27/2026 1:41 AM, Andi Shyti wrote:
>>> On Mon, Jul 20, 2026 at 05:11:19PM +0530, Aniket Randive wrote:
>>>> The transfer timeout for an I2C controller should reflect the actual
>>>> message length and bus frequency rather than a static 1-second value.
>>>> A static timeout causes unnecessary delays on error paths for short
>>>> messages, and may be insufficient for very long transfers.
>>>>
>>>> Add i2c_update_timeout() to i2c-core which computes a transfer-specific
>>>> timeout and stores it directly in the standard adap->timeout field.  The
>>>> formula accounts for 9 bits per byte (8 data + 1 ACK) at the configured
>>>> bus frequency.  The caller supplies a safety multiplier and a minimum
>>>> floor so that each driver retains full control over its timing policy
>>>> without those values becoming public API.
>>>>
>>>> Storing the result in adap->timeout makes it visible to all consumers of
>>>> that field, including the arbitration-loss retry loop in __i2c_transfer().
>>>
>>> this patch does not take into account a timeout set by userspace
>>> through the I2C_TIMEOUT ioctl. That value would be silently
>>> overwritten by the driver.
>>>
>>
>> Can we make timeout handling a kernel responsibility and avoid placing this
>> burden on userspace ? Every userspace client already accesses the bus
>> through the adapter/core layer, so the kernel has full visibility into
>> factors such as bus frequency, transfer size, and controller characteristics
>> to compute a sensible default timeout.
>>
>> Also, if both a userspace provided timeout and a kernel-calculated timeout
>> are specified, which one should win? Having two independent timeout
>> mechanisms could easily lead to ambiguity and inconsistent behavior.
> 
> There is no explicit policy for this today, and I am not against
> a driver selecting a timeout according to its own requirements.
> 
> However, once userspace explicitly sets I2C_TIMEOUT, I would
> expect that value to take precedence. Otherwise, the ioctl
> succeeds but the value can later be silently overwritten by
> the driver.
> 
>>>> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
>>>
>>> ...
>>>
>>>> +/**
>>
>> [...]
>>
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(i2c_update_timeout);
>>>
>>> I'm wondering whether changing the adapter timeout from the I2C
>>> core is the right approach.
>>>
>>> Perhaps i2c_update_timeout() could return the calculated value
>>> instead, but then  do not see much value in exposing such a small
>>> calculation through the I2C core.
>>>
>>> I know you were advised to move this into the core, but it does
>>> not seem particularly useful there and, as it stands, it looks
>>> somewhat controversial.
>>>
>>> Unless there is another good reason for keeping it in the core,
>>> I would drop this helper and keep the calculation in the driver.
>>>
>>
>> There may not always be a userspace application available to configure the
>> timeout.
> 

Agree.

> That is fine. I do not expect userspace to configure the timeout
> during normal operation. The ioctl is mostly useful for
> debugging
> 
> The driver can still provide its own default when userspace has
> not selected one.
> 

yes, agree.

>> My suggestion was that the I²C core could derive the timeout based on the
>> bus frequency, transfer length, and a reasonable safety margin. This would
>> provide a generic solution that works across all clients without requiring
>> userspace involvement.
> 
> Is there a standard formula which works for every I2C controller?
> 

My thinking was that we are trying to derive a timeout for transfer 
completion, so the transfer length and bus frequency should already give
us the theoretical on-the-wire transfer time.

For example, the transfer time could be estimated from the number of its 
transferred, including protocol overhead, and then converted into a 
timeout value:

bit_usec = mul_u64_u32_div(len * 9, USEC_PER_SEC, bus_freq_hz);

On top of that, we could add a fixed margin to account for interrupt and
system scheduling latency before converting the result to jiffies.

The exact margin is open for discussion. I was considering something on
the order of a few hundred milliseconds (e.g. 500 ms), but perhaps that
is still too optimistic on some systems?

Alternatively, the core could provide a calculated baseline timeout
(transfer time + fixed margin) and allow userspace to add an optional
extra offset when needed. That way the default behavior remains 
automatic and works for most clients, while systems with unusual latency
requirements can still increase the timeout without every userspace 
client having to determine an appropriate value itself.

Do you see cases where a transfer-time-based timeout with a generous
system-latency margin would still be insufficient?

> The timeout may depend on controller specific behaviour, hardware
> limitations, clock stretching, FIFO handling and whether the
> driver uses interrupts or polling. A calculation based only on
> the transfer length and bus frequency does not seem generic
> enough to cover all of that.
> 
>> To account for variations in system load, we could optionally expose a DT
>> property for an offset or scaling coefficient to tune the computed timeout.
>> Even with such tuning, I believe this approach would be significantly better
>> than the current fixed 1-second (HZ) timeout.
> 
> I do not think a safety margin or scaling coefficient belongs in
> devicetree. Devicetree should describe the hardware, not a
> software timeout policy.
> 
> If a controller has a real hardware timeout parameter, that can
> be described by the DT. Otherwise, I think the timeout policy
> should remain in the driver.
> 

Fully agree, this DT property option is not valid unless its controller 
implemented.

> Thanks,
> Andi
> 
>>> Thanks,
>>> Andi
>>>
>>>> +
>>

