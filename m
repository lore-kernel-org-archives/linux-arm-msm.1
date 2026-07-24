Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D9D3909A3
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 08:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784881802; cv=none; b=nbOP/pQ5x5oWkXO0C3mSx+ReKutUFpRROyhhh49HTDTg8AzQ4bTTiqvwEkVpTAS0MYSAtnyuf0UjqOHPPCiD5giBC3iRJ1SsDh0TI7CdfZ05NESU9xszBXCMyMSGbzkCoZBiPE+Pc4Zz2yVYJA8ZU/6LtUI7ozQQ0IIId4IskdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784881802; c=relaxed/simple;
	bh=Y0gUFXRlmr7qKhzm6aX4Ehj1rU5kzHdP91EvhU+Z33A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iwpTL8AYjsYY8Q8md32jtBH8XxkewCj5nLQokrWyX5yFX0puQzDsdO5fl5DHofdwuh69fYQC+kufCiCwvxQhmBSdaxzGpTDuJvkeGxozZVxxDXh7SM+bApecg9/BLmOCzmkClD2TzPP9/qiGUhIZ7qqJxxzzWFVzOpCvJ6RzDqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a/ayBkih; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EmxBdKFn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a/ayBkih";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EmxBdKFn"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lXkw2125272
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 08:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pdZVJG0sSU8HI/R/mxVTzICyO0P9v16DXWqFRs5EjE4=; b=a/ayBkihou6SdUOT
	w8q0fk54Po+i8+CFTk0Bm9aUkCRciI0mCP+knmVgPA/IdSYvzCV9mCaHNX0XlDqI
	963KN01K7QHO04LNf2lhLWwkp+B6NMDz6dUavjNRPbPRC/mCU4clou+s1MXkgj4r
	jQjPy7NDuhexFTXXeREADKIzhmvgWwPCnW+KindpVAdKMlAKZ3X8zZgopPJBZ1Z+
	02pwJJ5T4DkbVKF5hxRW+zCsXvD4WSvRvq316GZktLCKzLB5YaVrlvAy5TEiEUAC
	RL3top6+hGYNOS81/FOCNRlKR2jeTknRgYcohzvXKBs3tkrZeS41AQcJKiI/9jTd
	uShjCQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqamttcd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 08:29:55 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84885a4fcabso254718b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 01:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784881794; x=1785486594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pdZVJG0sSU8HI/R/mxVTzICyO0P9v16DXWqFRs5EjE4=;
        b=EmxBdKFnL7qI9hCmnv5I1glwEGwFuXKoDQnJEswddTI2osXQRlIpXxKjCEeCC90G2m
         R8hKHMO1MXPdffazfP7f41RxscKWoH5D0xCZaM72OmtTWKtTqdIKlyh/qTDk75eqbz8M
         yD55TpEacYAwOGRjQsfn5abklsO7H0JYSHHXtnQ3UNErQWEkRUoHEfHmHAyhRYfF51KD
         rH9kXuWDunQKkl86FYCc/tk9qMpCwkiQpAhlUiBv+qLn/UWVa4ODnEQhhs04c9pHSsAX
         vN7oJwSiWbR2ok2G+v3Ky014soYvvtBnBr73NDT9BkaQI7o8s+4U+Nbo9ZgGvd9MvBUT
         WQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784881794; x=1785486594;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pdZVJG0sSU8HI/R/mxVTzICyO0P9v16DXWqFRs5EjE4=;
        b=AN6m6AN9l+Q3NX9J03+reD5XywUN4v/YkYZk8sGBCeZifXD8RCPkafgwOIZv5eWU0N
         JkiJys10P6KGp6v7KC65xVfarYwu/KVMmoM5gyfDcFjwz4n06L6i1QoQrwQr/oJaF8pf
         0SSVNYN3hH1ylZ1TywKuRdIssUGlZDevWrIsMe0Gy8XANNe5Ytw+M6eMlYT3KnOUEtNw
         fAXdxB9+944DZ5bzpSjcBuUktVjdMeQSdVQY8r9n1Du9x8ULIcBQ89Othshw6Er/3TfO
         iGwXUteM2A9Il1crwWlwfjWkvRAvsyRg+nj0CmidbdbcFxnNmXU6zMZilMM35eyN/Z/O
         uLCQ==
X-Forwarded-Encrypted: i=1; AHgh+RoVoyw4HJ5F39jO5SzqAWEdGE9bf4jdPPnBr8zJ6qjj6Y2iR+qv1wMDSY8wYb1UBA76+B58zmG/AjCIMxOs@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4WrfXs7jykTChKnarZIwWCpQ1Mp9qPtjmiwYpGDHPzPjMpvy0
	DJT6XdriBF1lqrYoKII768OJ/PNwlEoTsA+aZqPMzLfjKy+/RNLKMs5owH3MaVgX2Pasrt4TrDR
	KKcrxzcdb3KUZQLBolCc4mwNRKNn21MIQKdidnai0quB3tp4IENdj7InIQKIM+2j8EYqh
X-Gm-Gg: AR+sD12gEW8m8KR3x7TdIg4xwErz9/oJHiDRaPp9gliwUxXE2rnR+o2w5xyDvXP1dJo
	neKW84JfmQ3TiwG2tp0GC9se2rkANSBSyRVdnaqw99rEOsBxXaG3undrOHDdPjugTrlxOZv26DL
	7Mpzpqh2dDUd4OTKa9JPmslmCJI0FBWz/EwqyPENAFvKfFUG6VAa+PV1TFtZ8Qa574SEeMOZHcS
	QCYPHdYv2jGCQIwtUrWo5qx/ee2Ow8hqjabkB1Q947wGi3STtY0+TU7oUv1JTSdRw90ev8pYWFe
	gw+Y4vbpGpvuIi/SBKwAVFc5YWLNG3d8zcP+0YmuZVaksoTUKim5F6ZN4gmlt7n3VKaolrOpR4z
	aSMFbanE1aJ1qY2f+50dTCWJKsPETBaQ=
X-Received: by 2002:a05:6a00:9288:b0:845:3fe5:cddd with SMTP id d2e1a72fcca58-84e2bb1c4eemr7500204b3a.36.1784881794494;
        Fri, 24 Jul 2026 01:29:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:9288:b0:845:3fe5:cddd with SMTP id d2e1a72fcca58-84e2bb1c4eemr7500178b3a.36.1784881793986;
        Fri, 24 Jul 2026 01:29:53 -0700 (PDT)
Received: from [10.218.14.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17237721sm4437218b3a.10.2026.07.24.01.29.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 01:29:53 -0700 (PDT)
Message-ID: <64bed353-9597-42b5-8fd3-a86b35781ccc@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 13:59:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] i2c: qcom-geni: Handle runtime PM disabled state
 during early resume
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>, Frank.Li@kernel.org,
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
 <86828cb8-0e96-48ce-aff4-0f7e59438ad7@oss.qualcomm.com>
 <d8e2519c-4fe8-4db8-94e1-3231000bf51f@oss.qualcomm.com>
 <510c0d23-f2ef-4f1b-aaae-a7f3c90c24c9@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <510c0d23-f2ef-4f1b-aaae-a7f3c90c24c9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA3NiBTYWx0ZWRfXwWyFAdS3arh3
 xKXP90FDAN1kM9drfJ/Vk5+tCdouDFodNdJrN4AwsQBQ6fCsHNJX1gFo/xW+DqAF6WGDKieVLWL
 hboDX53k82FF6F1XCkKM9qqozVWSxjSfNKEtKFK6jssPL/FNLmLyG+KV3Fqsc6SM00eZNLIPekG
 PMjgTJ17IGN0Zzq7MlTfkPkHoXQbugrQalKNfuW2CHuyxIvLkAS0rJ/3ROcmegBPgKxma4MgOBA
 zlri7f1FnUomELXu/0gJ38ytD6IQd8NtVpnd3Hou6oSW5A8yTwLzQgj4QNZXzbWh8YTvbod8gGe
 G8LyY9QFaNtB4vYhlFPYuZbmvHX5GY5umn/fY8QMJZq7S3JcBJ5ubLv2b1c6dbs+kwOegkSi1XC
 I+8LzlId5HmNAhriozp4OoE09CxB9iWpgqZxILwS6LFMdTP7S9YyGwTmnJRREmgT3tGhup1pQ7l
 c6uLU8GyocD8XVdf86w==
X-Proofpoint-GUID: sG7oAmFKcmp5dKXpI6XCGDBgMCxaYfC9
X-Authority-Analysis: v=2.4 cv=DfAnbPtW c=1 sm=1 tr=0 ts=6a632283 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=QiQ5yfMOK301Ztg6guMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA3NiBTYWx0ZWRfX51nLj3oUnI0l
 5WVFyPQAihZveRKgm/+L83B9AqALtdQa7Mc5W1mE9x46bJN/UMYGlpu/ajKx/rFmBTJ7dV55KSB
 qzFZKZVLEqbAsMN0PCI5jVuDUzkuo98=
X-Proofpoint-ORIG-GUID: sG7oAmFKcmp5dKXpI6XCGDBgMCxaYfC9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240076

Hi Mukesh

On 24-07-2026 12:05, Mukesh Savaliya wrote:
>
>
> On 7/24/2026 10:12 AM, Praveen Talari wrote:
>> Hi
>>
>> On 23-07-2026 17:14, Mukesh Savaliya wrote:
>>>
>>>
>>> On 7/23/2026 4:24 PM, Praveen Talari wrote:
>>>> Hi mukesh
>>>>
>>>> On 23-07-2026 15:47, Mukesh Savaliya wrote:
>>>>> Hi Praveen,
>>>>>
>>>>> On 7/23/2026 3:32 PM, Praveen Talari wrote:
>>>>>> Hi Mukesh
>>>>>>
>>>>> [...]
>>>>>
>>>>>>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/ 
>>>>>>> busses/i2c-qcom-geni.c
>>>>>>> index 96dbf04138be..4bc00922cd97 100644
>>>>>>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>>>>>>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>>>>>>> @@ -917,6 +917,10 @@ static int geni_i2c_xfer(struct i2c_adapter 
>>>>>>> *adap,
>>>>>>>       gi2c->err = 0;
>>>>>>>       reinit_completion(&gi2c->done);
>>>>>>>       ret = pm_runtime_get_sync(gi2c->se.dev);
>>>>>>> +    if (ret == -EACCES) {
>>>>>>> +        dev_warn(gi2c->se.dev, "Runtime PM is disabled:%d\n", 
>>>>>>> ret);
>>>>>>> +        ret = 0;
>>>>>>
>>>>>> Here it is clear that pm_runtime_get_sync() is returning -EACCES 
>>>>>> from the runtime PM framework,
>>>>>>
>>>>>> which indicates that the request was rejected before the runtime 
>>>>>> resume path could enable any resources.
>>>>>>
>>>>>>  From the rpm_resume() implementation:
>>>>>>
>>>>>> static int rpm_resume(struct device *dev, int rpmflags) 
>>>>>> __releases(&dev-  >power.lock) __acquires(&dev->power.lock) { 
>>>>>> [...] repeat: if (dev-  >power.runtime_error) { retval = -EINVAL; 
>>>>>> } else if (dev-  >power.disable_depth > 0) { [...] else retval = 
>>>>>> - EACCES; } if (retval) goto out; [...] out: if (parent && !dev- 
>>>>>> >power.irq_safe) { spin_unlock_irq(&dev->power.lock); 
>>>>>> pm_runtime_put(parent); spin_lock_irq(&dev->power.lock); } 
>>>>>> trace_rpm_return_int(dev, _THIS_IP_, retval); return retval; }
>>>>>>
>>>>>> The -EACCES error is returned when runtime PM is disabled 
>>>>>> (disable_depth  > 0),
>>>>>>
>>>>>> causing the function to exit without invoking the device's 
>>>>>> runtime resume callback.
>>>>>>
>>>>>> As a result, no resource enablement is performed by the PM 
>>>>>> framework.
>>>>>>
>>>>>>
>>>>>> In your change, the error is effectively converted to ret = 0 and 
>>>>>> execution continues.
>>>>>>
>>>>>> How can we guarantee that the required resources have been 
>>>>>> enabled in this scenario?
>>>>>>
>>>>>> More importantly, where are those resources expected to be 
>>>>>> enabled if the runtime PM resume path was never executed?
>>>>>>
>>>>>
>>>>> This was answered in V6 already on 7/3 exactly at same place.
>>>>> Pasting below.
>>>>>
>>>>> ==
>>>>> > Why we are checking specific error code here? Why can't we use 
>>>>> the below error check directly?
>>>>> > if get sync itself is failed with pm runtime disabled then why 
>>>>> we are going ahead by making ret = 0 here? How you will make sure 
>>>>> resources are enabled?
>>>>>
>>>>> This reason is also mentioned in the commit log. we surely get - 
>>>>> EACCESS as runtime PM is disabled during no_irq resume phase. We 
>>>>> still need to serve the transfer, hence we need to override it.
>>>>
>>>> We should not get it and not go further since you are already 
>>>> enabled in system_resume_no_irq().
>>>>
>>>> I just need to understand why we need to proceed when we 
>>>> get -EACCESS as runtime PM .
>>>>
>>>
>>> ret = 0 was added because during early system resume, -EACCES from 
>>> pm_runtime_get_sync() indicates runtime PM is disabled, not that the 
>>> controller is unusable; treating it as an error would incorrectly 
>>> reject valid I2C transfers occurring during resume.
>>
>>
>> What is the purpose of enabling runtime PM during system resume? It 
>> is not clear how this helps, given that -EACCES can still be returned.
>>
>
> I think you didn't get noirq_resume() change. if you review code, we 
> do force_resume(), but that doesn't invoke transfer time 
> runtime_resume() via pm_*_get_sync() call because device has runtime 
> PM disabled.
>
> Hence we need to call pm_runtime_enable(). In my testing, have seen 
> that driver returning with -EACCESS if not overridden with ret = 0. 
> That's the whole point. We need force resume and transfer to serve 
> early resume transfer. Usecase demands this transfer without failure.
I have gone through  noirq_resume() change.

force_resume will be executed only if force_suspend executed otherwise 
it won't execute.

IMO, If PM runtime enabled for device, it won't return -EACCESS.

What is the purpose of enabling runtime PM in the system resume 
callback? We still appear to encounter -EACCES despite runtime PM being 
enabled there.

>
>>
>>>
>>> Other than early PM time, we are not going to get -EACESS. So i 
>>> don't see any case where this will be a problem.
>>>>>
>>>>> Review geni_i2c_resume_noirq() to know what all we do to enable 
>>>>> resources. That's guaranteed and tested with system suspend/resume 
>>>>> test back to back and PCIe could do i2c transfer successfully.
>>>>> ==
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>> Praveen Talari
>>>>>>
>>>>> Do not keep this thanks/regards here. only leave the comments.
>>>>>
>>>>>>> +    }
>>>>> [...]
>>>
>
