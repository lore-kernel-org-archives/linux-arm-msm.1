Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F5A47143C
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784807081; cv=none; b=sFWokhOWNIIVyixatFCMKO3vHsfxuXGGnz/R5ra4qsKotcmV/JbSxvV/CACwDClz09WVD0J/M/+wLZ8th3acvsuF7hBJMwUIE3pl0kXjASoS2T2xvyNaxkvA2JU94eMAi8+hA51QIjxYwm8HFBJ5eMp40B+WgPNlBc5tiE6TYVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784807081; c=relaxed/simple;
	bh=yNk5ayV+sOFk5lN+oWzOgeSWPGYcPRXYNiFi5ZzWQ/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Br9GB8R0P3viV8tWjCOTa0LBy7RqAFJ9eLdt6+j09r2THgKpTKBOC0DeoDIkc+d9eexsmkOhjVKaglhWDeHFse87BvaMCoGlKQjzlXoAz70U53gUbulWqk3Raq97XGG/9UmHHVNZ5hPNSp4koBZVXPzLj6shQXKZ09vSfz9mlco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JeZaRZi6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aUb4hEob; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JeZaRZi6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aUb4hEob"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N9DmKK3567745
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:44:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w0BzviMLtfRALGN+wRIhQVvryB1XDCPgSTyAMutH4w4=; b=JeZaRZi6gegkPELU
	+9dhHDIlhooz/rvluMEpkl+J2S8Mar7sFubdswm0PMngSvnOisI2EPNOCE27ohJ4
	y0sbK8+jBsaD9iMVVW63bXqW6B8IwYmqfqQeKUeNaE5laK8WVzwxkplgEphQLgi9
	ggH3h8GZOkue0A7GfVGVc+R0o09nC7pYeVv3YpxC9Q2Ev1rnWNVEKPevRumNtSsh
	G6Mccb1WaQr7LS1qLTDgJuBUDjBXWnNe2ItwDDL3+FF1SELMG9aZjVThRvbEKgEy
	wjDhIcYVDknPIe6cE4a1XcNu3AtNdCn3Sexf6sHurQihQi5puQxxJPB04OvxJtCq
	LFuq4Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkg520jbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:44:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccafc5e82cso9846785ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 04:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784807074; x=1785411874; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w0BzviMLtfRALGN+wRIhQVvryB1XDCPgSTyAMutH4w4=;
        b=aUb4hEobqfXV+m3O5DrYUEutC1UatM9TpZka2s9Hvh+/kpa+9a3noUJbeyzOqzUnjA
         J4xGGklcwqYbtPgl9wSWTFS90XJMgtmqK5iiGYmJbkXQaUu0CUS0y3JJWVbRbzj+Xbxw
         BVJaHHZvgb/J5z03tKIb30TU2MBlvKU+M4gQJiEgvYg9wreGGmMG3ORmfk4dWZfdWXcI
         rVzKPXRLRryimWSnLtLs/ZRgjHaevwEBWUaU+TOGfGzT0KYIQJoVpdkoexAVpaE0buFQ
         ZH1wprvM3EJHRophjS7oDuJ3h3ygSNKLeP84T5/+Usc1+HSoLF0xzxrE4dvZWCQ5RAwW
         gmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784807074; x=1785411874;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w0BzviMLtfRALGN+wRIhQVvryB1XDCPgSTyAMutH4w4=;
        b=D1/EFfrrCAmYlHEXnQDhFIkGtoskV9bz8yqntvJcn9vPpfYzkj4365k1l0UowR2GRF
         6IIeS9xGnSmXzYLw2N0BkoywBUDKYM6deYd9KO0rhid19maF2fBMrsl5TNDXcJNrxfQu
         gDIFmJm4Bf6/eXQ12zO8wLw3p4zZhE4ciCIAL45bwARxoj3H93ovrOmzmLA3mmFSGPkw
         3OUOW4+K7e3zSefKMfGC/dxefPARdpySw2gQfijDuGw8GIvRU0MJIzv4K2IpAl8MZmrY
         UpCi+xOd8FiMsQUYPV0FEYjvd21zUGOA5BuQdcP2xXU+BHz/SqYlaFzLFhVwrg6N87KZ
         L95w==
X-Forwarded-Encrypted: i=1; AHgh+Rr8ff1Xu7Hp1ErFdNNizNjPV74bVh54m6oOeTUToSuU8azO601kQQrkXSnWooZOrmgZEgyveX7Ur1exeCYf@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9/WXP9oAXN8GAk4G9ka0S6eyztkYTgxHNcPJ/PHrpCWetnpck
	fplBqzkzrZP+s6c58bagQDbWWMYqwOj2NCOHMXjMldNi/DkPjMuN0VVdNnoXqjHy2NA3fuF1Q1Y
	j/sC2xOasywwU6SeQFpC0TjTbEz6tUDtiaDcVOyCRWD/yauNAPDgKmdbmyXX7NXa3qVMb
X-Gm-Gg: AR+sD122lvzjtoQXUYaGEhR1YVQMg80fPiGwexxkWt5gzYRjTn4VRGCd4bvYPqb/yid
	M2YJqAFure4oqYDa1LIQKQYh1d3nMrLYQRXnSzbl2tAskE6Oy8K5BT177yIxI/wddCh75z/sQJq
	DcViAmXZgSJ0f2ALvlBEQyLOz3rXfodJ6gw9SgeoDLIqH4zImjbTihShboEvxk11maHYRXX0Ksf
	zaOepyn8eTm2HNASCp+EJBRDwMp8mhTtgA4JIPwjnpGREXD78IxUiQfO6MIrTwDO6Too1lhjOM2
	d6Ae8WH4ulFm0HZHPE7hiWpGKehGlCOZ2bhNUYac/iJLvj8PH99jD5qtU24Can6a0t8oQ/peXpP
	HMWHAUWeDpagIqFSxAY1qAF4DHFTBdg+wIPg=
X-Received: by 2002:a17:903:22cc:b0:2c1:ee75:56bb with SMTP id d9443c01a7336-2cfa6b9aefdmr34135235ad.20.1784807073961;
        Thu, 23 Jul 2026 04:44:33 -0700 (PDT)
X-Received: by 2002:a17:903:22cc:b0:2c1:ee75:56bb with SMTP id d9443c01a7336-2cfa6b9aefdmr34134805ad.20.1784807073412;
        Thu, 23 Jul 2026 04:44:33 -0700 (PDT)
Received: from [10.217.219.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f350560sm32340755ad.68.2026.07.23.04.44.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 04:44:32 -0700 (PDT)
Message-ID: <86828cb8-0e96-48ce-aff4-0f7e59438ad7@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 17:14:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] i2c: qcom-geni: Handle runtime PM disabled state
 during early resume
To: Praveen Talari <praveen.talari@oss.qualcomm.com>, Frank.Li@kernel.org,
        viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, zhengxingda@iscas.ac.cn,
        kees@kernel.org, quic_jseerapu@quicinc.com,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: bjorn.andersson@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        Aniket Randive <aniketrandive@oss.qualcomm.com>
References: <20260709134623.1724212-1-mukesh.savaliya@oss.qualcomm.com>
 <20260709134623.1724212-2-mukesh.savaliya@oss.qualcomm.com>
 <9cf5b5ab-c418-4b0d-8b2f-b888a64db0f0@oss.qualcomm.com>
 <933d864d-f0c2-4727-a01d-f564eb854d23@oss.qualcomm.com>
 <4133bbcb-22e7-41e0-b9f4-affd63df0e38@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <4133bbcb-22e7-41e0-b9f4-affd63df0e38@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DtZmPm/+ c=1 sm=1 tr=0 ts=6a61fea2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7mBe-9PINDt9wbQolioA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDExNCBTYWx0ZWRfX0BkI6JRUJay8
 NZOTLScexOr75KkTc2iG2xE02yKt3z3eIl0oY1rDsoLDqPH4eVCNrjqpkmtB9Um1ZCGpFlp7I1Z
 +v8gs++5sIS67/kh/v0BJvI+U9rG7N8=
X-Proofpoint-GUID: 2cLfyB_ZYks5WGMQeW-c7-xgmLSCbgIN
X-Proofpoint-ORIG-GUID: 2cLfyB_ZYks5WGMQeW-c7-xgmLSCbgIN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDExNCBTYWx0ZWRfX52WLjA3d8tHx
 jsd+uv3phLltn72V27yUGmgJUk7qERGlD2jGFAHsMJsiWDT2QtoP2sDrcgV1COGRPyPQhMUBdih
 IRGAYNfuIrDqJJTRO4feWyLAsGkQCHnjoxOF4ALX8VvZ5zv0N3/AYDf3f2t0L2ZmhezMKGMXQkU
 CDIo3E/4K2Ys2n2xvWHyM2g4l7OkWDr9QwO2SGQWN40axhxCVRqEofWVJll9bT0dDq1AOJw66sO
 j2kkfPJ2LayPm6kHyr1UO8OaDC0NucKT/j6pqbKky6b4hUMmGHj1y3wt5P3/KC1NNChsFmHqoGD
 0IUPIR7MSDviPEXpOnVx0N7x3Gw8U1sSftOgNceIxgaga4Gi1x1Hy+oUNumXcQj6F60elyY3lPa
 GD+8uO/d4Jh1Gfgi81A5ZoCAoXlraN+KuFxHtFHSGGu8oRfRc5jNQ92BzZHsmJ7We5ogOyAn3p3
 bSKpvheULvFPFX7YhxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230114



On 7/23/2026 4:24 PM, Praveen Talari wrote:
> Hi mukesh
> 
> On 23-07-2026 15:47, Mukesh Savaliya wrote:
>> Hi Praveen,
>>
>> On 7/23/2026 3:32 PM, Praveen Talari wrote:
>>> Hi Mukesh
>>>
>> [...]
>>
>>>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/ 
>>>> busses/i2c-qcom-geni.c
>>>> index 96dbf04138be..4bc00922cd97 100644
>>>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>>>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>>>> @@ -917,6 +917,10 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>>>>       gi2c->err = 0;
>>>>       reinit_completion(&gi2c->done);
>>>>       ret = pm_runtime_get_sync(gi2c->se.dev);
>>>> +    if (ret == -EACCES) {
>>>> +        dev_warn(gi2c->se.dev, "Runtime PM is disabled:%d\n", ret);
>>>> +        ret = 0;
>>>
>>> Here it is clear that pm_runtime_get_sync() is returning -EACCES from 
>>> the runtime PM framework,
>>>
>>> which indicates that the request was rejected before the runtime 
>>> resume path could enable any resources.
>>>
>>>  From the rpm_resume() implementation:
>>>
>>> static int rpm_resume(struct device *dev, int rpmflags) 
>>> __releases(&dev-  >power.lock) __acquires(&dev->power.lock) { [...] 
>>> repeat: if (dev-  >power.runtime_error) { retval = -EINVAL; } else if 
>>> (dev-  >power.disable_depth > 0) { [...] else retval = -EACCES; } if 
>>> (retval) goto out; [...] out: if (parent && !dev->power.irq_safe) 
>>> { spin_unlock_irq(&dev->power.lock); pm_runtime_put(parent); 
>>> spin_lock_irq(&dev->power.lock); } trace_rpm_return_int(dev, 
>>> _THIS_IP_, retval); return retval; }
>>>
>>> The -EACCES error is returned when runtime PM is disabled 
>>> (disable_depth  > 0),
>>>
>>> causing the function to exit without invoking the device's runtime 
>>> resume callback.
>>>
>>> As a result, no resource enablement is performed by the PM framework.
>>>
>>>
>>> In your change, the error is effectively converted to ret = 0 and 
>>> execution continues.
>>>
>>> How can we guarantee that the required resources have been enabled in 
>>> this scenario?
>>>
>>> More importantly, where are those resources expected to be enabled if 
>>> the runtime PM resume path was never executed?
>>>
>>
>> This was answered in V6 already on 7/3 exactly at same place.
>> Pasting below.
>>
>> ==
>> > Why we are checking specific error code here? Why can't we use the 
>> below error check directly?
>> > if get sync itself is failed with pm runtime disabled then why we 
>> are going ahead by making ret = 0 here? How you will make sure 
>> resources are enabled?
>>
>> This reason is also mentioned in the commit log. we surely get - 
>> EACCESS as runtime PM is disabled during no_irq resume phase. We still 
>> need to serve the transfer, hence we need to override it.
> 
> We should not get it and not go further since you are already enabled in 
> system_resume_no_irq().
> 
> I just need to understand why we need to proceed when we get -EACCESS as 
> runtime PM .
> 

ret = 0 was added because during early system resume, -EACCES from 
pm_runtime_get_sync() indicates runtime PM is disabled, not that the 
controller is unusable; treating it as an error would incorrectly reject 
valid I2C transfers occurring during resume.

Other than early PM time, we are not going to get -EACESS. So i don't 
see any case where this will be a problem.
>>
>> Review geni_i2c_resume_noirq() to know what all we do to enable 
>> resources. That's guaranteed and tested with system suspend/resume 
>> test back to back and PCIe could do i2c transfer successfully.
>> ==
>>>
>>> Thanks,
>>>
>>> Praveen Talari
>>>
>> Do not keep this thanks/regards here. only leave the comments.
>>
>>>> +    }
>> [...]

