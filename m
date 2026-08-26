Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3787B37AA79
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787741528; cv=none; b=QDelLR+xQW1k9IuqQ7DKifBgVkmhEIwohQHxGNJ0axfJLUWxIbhPftVvGMUaFiMKxWGF5Pn8/o13+c2T5psbQNC8TFVscAZtxpjodnIPIcOK3gb+a6ifLlM+HQBwul5qhI5rXw2RehFjEhIUWD2m/cx+uPD4ACC+gN3kogVXTVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787741528; c=relaxed/simple;
	bh=kwTNrGRg5ARL/HG/paaqB4/ggQic9TbvOvkpIos1B+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hLvu9B3Tx7aG7vY2oBQs4MwoSPLDrKnum+A1LGgizTniWztxIm0s1Y0zhI/PSPc+0E77z0eTL2tk9kSp7LOR8r4VpdOz+WNBIGOBPkI3aNUg24KW0sz+Of4lveOO1YSa4u47FFh1cPYbqtnxyctrXbW5z2LJgO+a+b/bOfWZFBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jOHTTUmN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XdlrvMOc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jOHTTUmN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XdlrvMOc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGRDb017267
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KPvoAKERNDW97gH/3Yh3ivbUuQB15b1Uk4xuEhWUvBA=; b=jOHTTUmNHaD8lR9e
	2RfEbvuL1df+9JZgCfFUnEb+1eO2YDoiTq4rXlZnSIj7U65ZHROwyHybuag344ju
	opHmr9xUwhi2i/YmTRnFP7nXuMcPN3lC2zfif9j2qFimZaBgn7VSbl2cNbxKPVeZ
	7hwvur0ua5lQXmmNfKhyyakYpMqhj7r2TK1A9aNe4pnBOUUpBRcOYeVgjNUKrghn
	oRV5cMMa6SpSPVS83U6w1kbPFLOk0nnsdbL9wWFuq2/gQHmmQiBDVJzWNL9AVu9Y
	+dRnB5BMWwshRlY2IXMvjrzXiOwVCSu29oshz/xtYJY2WmdTcSQZmlxWaJZMe2rj
	UIiS9Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fjn3gg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:51:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccb6823efcso9987615ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 03:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787741502; x=1788346302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KPvoAKERNDW97gH/3Yh3ivbUuQB15b1Uk4xuEhWUvBA=;
        b=XdlrvMOcTwvcHnFdUQV4XGgj5WrrJqTXiuyfGsXgi37Tgu/eFCwEjcgHqVvsjo/cXO
         ObcVlquJ2m7p9SdD6xZEaTtdyidW+qBI7v4obh5IS/KcuoGB4qZmVJPNFQVpm/801+DY
         snerHelwckdscCE0FiRZMwqRiogjp2po5Ip/faOsrN2HGmER+d0bo2CXT7KEKmf9XUdk
         oLn5IV7GzlceRSOUXMAIKGmfJWQoQ0RXfH5/BQPs0C/KwhhQi9KQgDKKr8+wMOsdHDYV
         kCReRHzP/XHKCjt5PnSnR2bmB3OHwaJ7v6kWakxi2HuztcoWQ6kpJe/nEIQtOzJrBrOJ
         fbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787741502; x=1788346302;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KPvoAKERNDW97gH/3Yh3ivbUuQB15b1Uk4xuEhWUvBA=;
        b=iDFzcDkeN5oYTsjXLWLpKsCG6maJlkkS6LX5kM26F5VzHRGg6DaDa1N8sA8CmXxjM5
         AKucoaABua80hK/d06JNWKfGCVaViY6pWDOpwDCEPIY1cnqezqjb9xDMSQJFiqOxpoax
         8KnKmbaJRshNqPmXhM/6goAqflqBTy6hddrUKTgjABCU3CNjPvt0Y8p1UMo+NnYBZQya
         vVWLIZ6g3y3SsIVvVwczKIqhVO5p4h2/njxtad1nFEJVf0NOAB1zipOdcwqwAXLp6UvN
         lf8HfdWxuYSMk0/BW5THrqr77AqghCeY+M3BX0eOb2fiB+ABG2yRUPnLSe3/hto1B+Qy
         sKzA==
X-Forwarded-Encrypted: i=1; AHgh+RpNyEEz4RwhmmfpNva9MjzIumUSeYTj94v0/yJlaFIroyGuInzmbeDEfNGar3xHkhGE+IXe4i9421Lp2wls@vger.kernel.org
X-Gm-Message-State: AFuF++n96rIt+sJLQf3xnevaGT1/DQB98VVlHPqIQSKs2FbkMjBJJkem
	kIEFhQ2gbHBOJqNKqfli63h60wlWS0u4OfZAZv8oZkv0NQz6rrBUcOCIoXro7H//8aVqu/BJ7fj
	QlKWe2fuKJMePR44i+XUfJ4SB4/ryo0ZsbFIo4Jt96hQ6gV6enruM7ZPOshta2c63MPzE
X-Gm-Gg: AR+sD11Iqd206ELUnR4pTSlvSRn1XGg5vSa1CHuSEUBlD+Lj3ll+je45pDzFKo6LFwu
	5kHq4S7tthYF7hzf/n5J5uTtHoX2QU/4lUM+1jNCzQqXcllTNlweEWIkVpHFwb7tr4n2DDfzXWh
	IYsmmZ4/fhuxAEgpmOLUFNfRskLhyFAkfab3xqrQhg3JlB9WpOh3bEJxi2+g2bQ1hlS/kAYvIr+
	EQrIIyatqQwSP6ChZmgp0ivy/EJFYRJrpeB9Ag8Ap9vmqhDqs5qubj6eKlGpiZCjbloK+Ie/L7R
	XYPGxbt4sMbpv4K3OWYmhj4pMJzXMrCcuVIWZjLXvWbE4G9KE4KU5Wq6964+qZErzp+M+hcYtWQ
	uCITNZ/H2OSvOn27FyHobCL4GBGz29qv5Uw==
X-Received: by 2002:a17:903:1b08:b0:2d0:cc92:f7af with SMTP id d9443c01a7336-2d707b7f5bemr106786365ad.9.1787741502146;
        Wed, 26 Aug 2026 03:51:42 -0700 (PDT)
X-Received: by 2002:a17:903:1b08:b0:2d0:cc92:f7af with SMTP id d9443c01a7336-2d707b7f5bemr106785255ad.9.1787741501609;
        Wed, 26 Aug 2026 03:51:41 -0700 (PDT)
Received: from [10.217.218.252] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60c2b4sm12054504eec.5.2026.08.26.03.51.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 03:51:41 -0700 (PDT)
Message-ID: <6c4c2350-5af8-444d-8ca9-838ab4220d35@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 16:21:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] i2c: core: Add i2c_update_timeout() helper for
 dynamic transfer timeouts
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
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
 <baa02329-ac3b-4e1f-aa74-72785af78a7f@oss.qualcomm.com>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <baa02329-ac3b-4e1f-aa74-72785af78a7f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2X46DQSjKuMMFoABPrzQsQVZ_Dws8PqR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5MCBTYWx0ZWRfXwGyNUrtMQqD3
 MRfYRPwT9P32/QRoVKgtoWKT6aCBtflJGZN0McHY/LBd0aJxvlmYHsThKA1ybqIbRq60yhX0RrB
 /mVnpc/EtjbIWUPZvp6f2/Xx8yqv2Q8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5MCBTYWx0ZWRfXyaM92zXM6sVJ
 9og0eXdepyiN/1EojWO7hL0BdWEz/gj7NwGipRw8RybPMNYshHTEk6/cXDnxFW11ClA/Jd50t85
 NP2XIqavHUQKv1LGZUZa76xHPkWVz89BT96xtua27fDiqpOcmoXZZTTrUajxhaHS8r/3u+1SBWt
 9DZjuPmigjPJ1x0HfezwtIRstb2wc6rScm2XdREfqg4MJPBiFUex8cYdRZ/TglWB6VK76p/Nu4J
 1/Su3kjrqrgPk5y6dG5nEmCUggOyoIwV1bfHtZ+n+LoulAzQZi4fthk7DTsA9wtQhjs3FJ8Yh1v
 iw5JU5Oq3v8QPAK0eZ+Y75jlyQ2cROrXO5BOrJMy3qLCxtyfMRlTaW4D+C/UrT7MHzS4rZtbSlr
 9kiAHzwtLMFKmTwwizkX7aGz8jGCrZhNnXshpGI7E5hf5EQgUTgibnKqJf9UvNwGQzSg5SKSbum
 O9WBzEn2dQhrWHoO7bQ==
X-Authority-Analysis: v=2.4 cv=ccziaHDM c=1 sm=1 tr=0 ts=6a8ec53e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=rSDCmGRdB9MByfBwi4kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 2X46DQSjKuMMFoABPrzQsQVZ_Dws8PqR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260090



On 8/24/2026 7:14 PM, Mukesh Savaliya wrote:
> 
> 
> On 8/24/2026 3:36 PM, Aniket RANDIVE wrote:
>>
>>
>> On 8/24/2026 11:49 AM, Mukesh Savaliya wrote:
>>>
>>>
>>> On 8/13/2026 11:15 AM, Aniket Randive wrote:
>>> [...]
>>>
>>>> +void i2c_update_timeout(struct i2c_adapter *adap, u32 bus_freq_hz,
>>>> +            size_t len, unsigned int safety_coeff,
>>>> +            unsigned int min_usec)
>>>> +{
>>>> +    u64 bit_usec = mul_u64_u32_div(len * 9, USEC_PER_SEC, 
>>>> bus_freq_hz);
>>> let's validate bus_freq_hz to prevent from 0 value in case of any 
>>> abnormal caller.
>>
>> This scenario is highly unlikely. Most drivers operate with a default 
>> bus frequency, typically 400 kHz, and therefore the condition being 
>> checked is not expected to occur in practice. As a result, I do not 
>> believe this validation is necessary in this case.
>>
> 
> Unlikely but also possible, it's framework change. So can't guarantee 
> about all other soc drivers.

Sure. I will provide a warning and return early if frequency is 0.

> 
>> Thanks,
>> Aniket
> 
> Please remove this sign from in between.
> 
>>
>>>
>>>> +    u64 total_usec = bit_usec * safety_coeff + min_usec;
>>>> +    unsigned long jiffies_val;
>>>> +
>>>> +    /* Userspace-configured timeout always takes precedence. */
>>>> +    if (adap->user_timeout > 0) {
>>>> +        adap->timeout = adap->user_timeout;
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    jiffies_val = usecs_to_jiffies((unsigned int)min_t(u64, 
>>>> total_usec, UINT_MAX));
>>>> +    /* adap->timeout is int; guard against signed overflow. */
>>>> +    adap->timeout = (int)min_t(unsigned long, jiffies_val, INT_MAX);
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(i2c_update_timeout);
>>>> +#endif /* CONFIG_I2C_DYNAMIC_TIMEOUT */
>>>> +
>>>
>>> [...]
>>>
>>
> 

