Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8C2429CC2
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 13:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787579061; cv=none; b=Uc43DM7TZ/8ZOEa3OJ3yTM+3Ex8bPpMZ0ZrEC+CcxY36ae0jOsCh+upZzu95RZo7RjJP4E64bL92ElAZEzgdwlcSOVGDolOEPeVzu+I54lt0IJfMtOOsibJIm8tYxh5fF5cEns/5BjO639yK1DX6Ui2ImQJIR4Ls0nNsa5hAFNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787579061; c=relaxed/simple;
	bh=drVhuBxQeShpDUOyhOfxcT08VPuo0dfiuRftN0uOQDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m+vLoEgpI0B8F8SYPsuEPk1lqOGvUQie8PQugFJnUQbD8o4qsBw9FTe01kBgG6JJ3RfoMS2oRK8TgdMM2R+yoqMvHBsNBc5E1WlSwMRm6oYjNKZ6KPuPtBWcvcmZ6BTZuBWk0IpTu13zybZyMNf65dr8E1cfm6jMOk8yUZjyndU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nnyFdS6U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fL/4iB0o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nnyFdS6U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fL/4iB0o"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCvCnY3613735
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 13:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lKMa1e5vKvj2ijBkWIx/18zNau1rRjql4sCYPc/YlcM=; b=nnyFdS6UPNZWC0e+
	MgDNvc7nrm7C30gyxlOUfJEHh0CiRoCoqZvYE+3/JqhIFhdSRUHVQxaghq2qCBEP
	S4krOmfrvCErv9LN14pJ7aPFyBSZALKZGVgtdKk/IlmHuaXZ4SOksAl5xfqGPMaw
	fjii4zInmPpeTrunmE3KHboUP4MYffwFobZZx8PmOf7I1aEcNdgymw3QXb4YaT70
	AuVPSeJQL4Bnr3+7Hy0AC3aaIbigPhe1GE3tU3sZ7572JH7EwxCuGef4wCQrAsfA
	T/q04f1nkK+MxdogYC3q4xYATL3XVoH7PWuOedjB5a5jgnri83EexGGvjooUNVwz
	4qrbvw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8jgk1cb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 13:44:16 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8487eb67173so6024000b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787579056; x=1788183856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lKMa1e5vKvj2ijBkWIx/18zNau1rRjql4sCYPc/YlcM=;
        b=fL/4iB0o5inUVpjE23YBnbSDnPc3HWDh/MofgMk0gdd8LFsOl35/G5zArFMseF3ZbI
         +9wx0VFjcH5HR6sZJC2Mz8I6eyROnhJTJo6Pn2qGGL6HtB9gdmQlGqYgPdqy1OeMQFy/
         81HykE8HxBuCQYzgYwh2MdXuNu20bMKiCfX+J3l4g+kqdPCgisJKyAtM0D0T2bFLSbPS
         KCIP7rDkU47i1AZa+2chR0NHJBRMyyCjUR8LU0apabsT8tOT7iJiPtS0s3A+gNuauGjm
         3DJ2qEmt7clscAAUMEBbbI4Zhcyn8cYu6SfXs3TTv8yYVUnGQKcwEIZ4f/eslOCePKlI
         JrVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787579056; x=1788183856;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lKMa1e5vKvj2ijBkWIx/18zNau1rRjql4sCYPc/YlcM=;
        b=Ts0r/uglqYjD5joxjURvVIYsPNykAGqUA+SmEYmWRUDzVoQ7Z8ylmMYzGL0HCdCOYH
         /Py79y57q/6X1TKfgaILv9tiGb/FdijxJlTB4Ca5clQ/lvDLFZZRIfP5qdslUT5DeBec
         yAM4NZuxb1sa2j3IbMvZxS4zlTs9321OQg4Kn84bTKK9QmLqQdHOWkGzifYHd2Wz0hk9
         EHsydsYe1LEHthLmdXKyMCQ9rS0dGdhPR7W4l02R6ertPswMA/cLE9ZP6bS3ZUoHX1/O
         ch2YiFii3MSGvoylvmcndZ9LjL6uOcdaWKJy8M5JNNxl+ZuD4FzA8KV2kR8/4ipf7Zce
         8ONQ==
X-Forwarded-Encrypted: i=1; AHgh+RrDicMWI3XRY6q8at4XPXLrzNS25NEVFWkGqx7z/DljWNOgmbhbNm2ezHMXlGK1kxiKqzdXjSStp+fDZt9s@vger.kernel.org
X-Gm-Message-State: AFuF++lT0angMV5F/DWdFW2KtLXbgTMzMsh7iRdF50uhyXv7U6XvWY7x
	fP/PaKXgrSw5hkREuJMf0Ism3YoLWmmDDBS+N6rllIEW1twFBd4PM1pvfQmy8C7W4hqmo/AXpWH
	HCQmf7VLijrznK9gB1l7jrwcCvJXHJvu4/+dWUMpfTcCNapId5E1gIar3LGdLR+oM21rI
X-Gm-Gg: AR+sD11yvha5yYTO9qiSNFJQhUxVveU65rqfKhdpAWEtcvvCrLlhElpZXmWKHyvJX/s
	1HG8+foWBL7v7Rre9vBfPGcXzB8KkcIIL+qazJj+5jWUENcaKgAEP9A/aj0fG6DkaJRswFOoURC
	Y11HT9fNkAesTDUjmYzJ/8lj0trGV/TR9gFGHOFhPhxFpv+ouYNe+3w2rfBbbFfTSzFzpbfcWnv
	P6W5JuUWxRpBq8DWxWJvjbY5cYdZ+9U+Yvfli2cFNal5nPV/EOH+U4tOnv6iaPwwTCRSK0RM2Qk
	nPhJ4+XIsMEIxP8Ykmc4E5jOJc6hy8pTF6brJ9fvITnNy/hNfUh7BUnfmyaNLWvlqvkbno2nRgZ
	3DstUTeURgBDSAGV+bgZwkBnL4EteKuVEMkY=
X-Received: by 2002:a05:6a00:139c:b0:847:9015:e68c with SMTP id d2e1a72fcca58-851fa081399mr43335476b3a.17.1787579055707;
        Mon, 24 Aug 2026 06:44:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:139c:b0:847:9015:e68c with SMTP id d2e1a72fcca58-851fa081399mr43335140b3a.17.1787579055149;
        Mon, 24 Aug 2026 06:44:15 -0700 (PDT)
Received: from [10.217.218.158] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520eed50d7sm1901620b3a.7.2026.08.24.06.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 06:44:13 -0700 (PDT)
Message-ID: <baa02329-ac3b-4e1f-aa74-72785af78a7f@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 19:14:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] i2c: core: Add i2c_update_timeout() helper for
 dynamic transfer timeouts
To: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260813-master-v7-0-3f9010cf9229@oss.qualcomm.com>
 <20260813-master-v7-1-3f9010cf9229@oss.qualcomm.com>
 <29719c5f-757d-426e-94ca-c221f45c00cf@oss.qualcomm.com>
 <92e89073-69d1-41ff-8545-d872b6b0c147@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <92e89073-69d1-41ff-8545-d872b6b0c147@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mrPU5gCPDrPpjb0bX6FA4d_1Q4nqpL6v
X-Proofpoint-GUID: mrPU5gCPDrPpjb0bX6FA4d_1Q4nqpL6v
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDExNSBTYWx0ZWRfXyuSNwfIb0vMf
 hSLsMblwe3PxvAF/zY01tpM3cnEbjvypGFm4bwGzrQ3UkRKJ6c22jD/N4kK0uL5jzSKH6mbvSTt
 s6qrt5uDq7iILwqtgSRymiQZ2rqbOFs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDExNSBTYWx0ZWRfXzn++JMhLNnL8
 BCiu9LSXuSZb60qHsiV4TXE2uIUeyfMXwSqWUmu6n1qIEGMtYONy+tCe+mxuW6AxmwHZF/L7SQz
 zgWmhJlxmdynTkmf7R2MfYqf0k7SMQvBMlhz8HuhltN2pvQo4rAu0wZtSf69yb0LXYWeg7wbxUC
 61O7JDm2ILV1co2OP1AuyN/M9D5K1yrVXenaZ5A2oo4DDBnqNUkhz8PXOrO7tPNJoeEy2P/Yikn
 cVSR4VH4MXkXIORj3tJo58g0RsMCMSrCf6rM72Tt/qp1ahVid8zuBK1YECBoZvGhFFksw5AasbR
 ZwcnjJVC/Ri5GEa8Cm+rxG/VSEWSjUd8OJ/jUKUA14qxN3hyGRNxA25jTlIx+r7SDG6eEJHYDFS
 xlKYhdbVpDWgkPGJMrmvdaOJCamZQ6SlNRrkhR64IJBsqobEpoN87dUmTzT0ROSW8sMwoAO6wMb
 P+4LNk2axP+lIyZbzZQ==
X-Authority-Analysis: v=2.4 cv=KcvidwYD c=1 sm=1 tr=0 ts=6a8c4ab0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pjdmtgn-RlP7ytGTrpkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240115



On 8/24/2026 3:36 PM, Aniket RANDIVE wrote:
> 
> 
> On 8/24/2026 11:49 AM, Mukesh Savaliya wrote:
>>
>>
>> On 8/13/2026 11:15 AM, Aniket Randive wrote:
>> [...]
>>
>>> +void i2c_update_timeout(struct i2c_adapter *adap, u32 bus_freq_hz,
>>> +            size_t len, unsigned int safety_coeff,
>>> +            unsigned int min_usec)
>>> +{
>>> +    u64 bit_usec = mul_u64_u32_div(len * 9, USEC_PER_SEC, bus_freq_hz);
>> let's validate bus_freq_hz to prevent from 0 value in case of any 
>> abnormal caller.
> 
> This scenario is highly unlikely. Most drivers operate with a default 
> bus frequency, typically 400 kHz, and therefore the condition being 
> checked is not expected to occur in practice. As a result, I do not 
> believe this validation is necessary in this case.
> 

Unlikely but also possible, it's framework change. So can't guarantee 
about all other soc drivers.

> Thanks,
> Aniket

Please remove this sign from in between.

> 
>>
>>> +    u64 total_usec = bit_usec * safety_coeff + min_usec;
>>> +    unsigned long jiffies_val;
>>> +
>>> +    /* Userspace-configured timeout always takes precedence. */
>>> +    if (adap->user_timeout > 0) {
>>> +        adap->timeout = adap->user_timeout;
>>> +        return;
>>> +    }
>>> +
>>> +    jiffies_val = usecs_to_jiffies((unsigned int)min_t(u64, 
>>> total_usec, UINT_MAX));
>>> +    /* adap->timeout is int; guard against signed overflow. */
>>> +    adap->timeout = (int)min_t(unsigned long, jiffies_val, INT_MAX);
>>> +}
>>> +EXPORT_SYMBOL_GPL(i2c_update_timeout);
>>> +#endif /* CONFIG_I2C_DYNAMIC_TIMEOUT */
>>> +
>>
>> [...]
>>
> 

