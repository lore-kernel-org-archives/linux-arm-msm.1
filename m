Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2763ED5A3
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 05:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784613292; cv=none; b=ORPjw9Xzue+GQh5DRKu00qleB26MSftQBWFRQoXxicyj1DU6CRI+yDNkFCcfjwstVRz50ppfNEwXO8TdkbgkTtAeswWlI/mwm2Q5CTihx3LJXE2Z89XF9xcGs08FLVxveX9QE5EFJjMjE3mTELG/PVKLoJhJsVFXCjV4F3++kE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784613292; c=relaxed/simple;
	bh=yVUjtTt9cbrsXlx8u7NoGOr1mxD9xMl2Pn6JCW2XcMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CV5wqPI3n4UmJCwAYgEQjIr0RrGPAGmHUWhWTpseli2SABi2UGE3SvBgdEZXZTg9qb3XelwoegU/thEdpYsZYH9I3qLG+u1Ljz5p1I5+AiR+F4wLzvHTyRrNjWCuovEqEfwtbcndG1ihbFd7g7HCNTC3Qu5tNSi0knpSSvpPYdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bbdnXOvx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C4w4TsWi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bbdnXOvx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C4w4TsWi"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L4Si7D527007
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 05:54:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EU53g70e8HcdHFnGBbn9xd7eIdQGkGdlIBgV5E9LrEw=; b=bbdnXOvx5rh2rK4U
	QXApLbIJTkUGDtJlzEDCnFW4/UgfeWyxsXSKtYMtmTSmey7EkIhpKbDNmjfRXcWn
	m7RwKDwhGY88MPOshLZSm5t134fFmMoty2++SUG1lXTmZ6c9Plq7RHqlwmdJh+i9
	Yol0ARtYMebH4W/eodA/8lkyW90YBUfTW8HejRVCR5CMEmf6Lz+ykVWBVvjSH4Xd
	3I9aH3WrC+4jOUOxs2wwY/ubLiC8v7l3uqSsVN6PZvEnWePK60+6htwsoJxQurBo
	IzIuwPSZQRgZWlsYWTM/nl3hZnusxIGWIfpX7BZFtXCrHgHa8TsfsKIDkcSp5i9V
	tykIKg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1se09bs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 05:54:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cec4226c70so173856365ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 22:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784613289; x=1785218089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EU53g70e8HcdHFnGBbn9xd7eIdQGkGdlIBgV5E9LrEw=;
        b=C4w4TsWi6N6GFboyOZBnz7pLeWKbAM4khVxW0XwCRHT45RyNkQn8nO2idd/wXw5ocs
         /KWM5kINWxvYdiT2DrWa8hsXbbGt6vDTHapw6j5ZM4nY3bQQetcuZ6S8y4TDa0vtuTZ2
         uTp0A1O5PZ2SUR2m0B/Dt6gyQnA72RpATeBtXVUOtBsqT8374QphYKvEf7MaD+f0WBUC
         JwVtlvSJxuaMuWC4UWt/B5hHME8Uu0Cf7htFLVdmJhP+wSAC7VaSZa6MSF9KJdfedxGS
         ay3riFeUICKpmP4QGpTbiJxbw6caIK8KeQ97nxIWWebhimQ/OUD0yc506Y4oOs95xpUy
         WI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784613289; x=1785218089;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EU53g70e8HcdHFnGBbn9xd7eIdQGkGdlIBgV5E9LrEw=;
        b=snQ1blj6yrK294yc0edd+9xE5CXPIAyqRMmNEH7QtwuxQdpN9xBNhlvhkrlxpJxlfT
         bs36KBqcg050xEnxDqKPKdQWAGjj8rmK247Vh1QhOTC7wgGUkIZyc+AyhiVLq3+anFJJ
         bdjU6oM8ui+YyAkEmuBKRrgSpaiFcYp+grmz9CH6v5Ee/qGQgO9+n/x7NwWmDV4GR4Ca
         VxdeN8+HocQNmttULHaO3ZgF8rnnlM0AA9tVHBDrbx2qofu18NUfFQLW8yobWk+UxTej
         5xKQCS2v0smPWjjXnMQ5KSBh/upBt3wd1m//zWu4UKZV0PMFKhXoJh/XVyIlfkQcwrXV
         Nuvw==
X-Forwarded-Encrypted: i=1; AHgh+RqD+fguGwnfIA2q2o4eY974BYoDPRljhgz9GAxeOc7/q9lFThkCFePzTD77sFh5BvV49VrpZtRV3AIuBVYF@vger.kernel.org
X-Gm-Message-State: AOJu0YxJzmLO+XU5jBZmKZnfmpO6HzEDdZp1Kx1ceaRw6wTspBYcGac6
	Aw/7FNmPF/4K0o5Sg8Cx8EMrosnwfdtbH5T1vt0f1TapCPYN/V5+1XiyNY/aaAQFy7IsAz8HiEC
	amqJLnvrFgXnR6+66tZ0mHuuyMwbKdJXBsLcuk6bvOV+yXr2JqOio3Zm7whHyFlIkaI8s
X-Gm-Gg: AR+sD10O/xg4xQ4cl5iSIdXbLn/5+gyqaD02VZ0e1HQsBLGahDppWuAsCzFnD79mjgO
	um3MbkTHEv96DHKW0iJXCaCM3s3P/oVZY1mnziEiKJ7U0XeKU6Wn9cArG8d7HFr/TXjCTJqNHwM
	WqEvtglMClrsqy6xfffrUIqS3SWoFhdSHqxHYbLJHEfUxZrqd5Buz6XXAWBSQXwnt0VsrGPkiH4
	33pdgT1P50Rg+90YHxwJxgJKm57Sikg/S8kfFAQ0KCH9i/FO8XMGXhdlUirDDC7/ZtejnpPFgNF
	bsOdNLQHDNTyWqJb193QNQdCNyzeQByERk8UEI2Jm9VfXfCzgR3Mch5ksidg6LgeG2P6S++7TjU
	n90mjGP5JBBUq0ZLScQ6Wlc6ryVI=
X-Received: by 2002:a17:903:3c4e:b0:2cc:9179:335 with SMTP id d9443c01a7336-2cf3481b661mr178010725ad.8.1784613288632;
        Mon, 20 Jul 2026 22:54:48 -0700 (PDT)
X-Received: by 2002:a17:903:3c4e:b0:2cc:9179:335 with SMTP id d9443c01a7336-2cf3481b661mr178010495ad.8.1784613288165;
        Mon, 20 Jul 2026 22:54:48 -0700 (PDT)
Received: from [10.92.203.75] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448d9b0sm68905915ad.13.2026.07.20.22.54.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 22:54:47 -0700 (PDT)
Message-ID: <48619593-777a-48eb-8c7b-cfee1492376c@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 11:24:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: qcom: scm: fold tzmem into the qcom-scm module
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-kernel@vger.kernel.org, bartosz.golaszewski@oss.qualcomm.com,
        kernel test robot <lkp@intel.com>
References: <20260713045811.484554-1-sumit.garg@kernel.org>
 <b967394f-b1ee-4718-8629-b5814b4e129d@oss.qualcomm.com>
 <CAGptzHOvBZP4sC5+Tp0rCzCuJFU5szBPeCETbxrsQKkY=pNwkA@mail.gmail.com>
 <c588861c-bbbe-4f30-a503-c9c04d9361ae@oss.qualcomm.com>
 <98d6d638-bc5c-4a4f-b587-44b61df63d34@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <98d6d638-bc5c-4a4f-b587-44b61df63d34@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GmoGQebMscVFYH89RfVe5fM4GMTmJMRN
X-Authority-Analysis: v=2.4 cv=TIZ1jVla c=1 sm=1 tr=0 ts=6a5f09a9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=K32GAW0FJRguidWeVBYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA1OSBTYWx0ZWRfX3ok7Bb/Yjs2u
 /8CoGWKB7obx3YO5cmQ8YvF/MZeyQur8uTgloDqIC/cds5quyLviL1T4gzS9/spG2FF5npigwaL
 7MjbeDJ19crqWt8Sij124nPyZYYGWx4=
X-Proofpoint-GUID: GmoGQebMscVFYH89RfVe5fM4GMTmJMRN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA1OSBTYWx0ZWRfXzdPGUPatSLcb
 1Ej6Tp1MZNQNu+ZMXQd7dtfMCE70zUlBgW0Ay5V1ZvZh98PVPWH/B1nsO7DUobu6qQFuOabIJRf
 xjZ86uQscyDWoF1TIFYIcMweyaHR9fOtMcv/4979sZS3xzlzxtpk8XF7Jw18deucg76ttesMtEn
 raYqQ4DofRAjtgKmEkZkybRQTl90RJBOor6xWz/+EmjzSufPrjnxSIEJw+JJCDFI8ib3yUWix+F
 /mP7hvsdhnp2fgrLz+JS2fNRL5+ZbbfkbyQ80rOpTsn3qkgwNSALkZjYNC6rz4/cTplfHxV/jko
 CK3yXdowyA2MMWEzuEDk5B+L/mq2lvmevnxCZK6Ej0+qYLHNdpbecmE/idtxTq+pgNJtg4eGTP+
 ny4vcxEAIq21VTVPYzl/TDTE2cCeg2uY1VxC4rWbF5Bhk4gNZ4+VCFaEJYIqGx8bs0OCZQG1HkW
 pJy/CMzUxUVeg0xrgMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210059

Hi Sumit,

On 14-07-2026 09:08 pm, Konrad Dybcio wrote:
> On 7/14/26 8:25 AM, Harshal Dev wrote:
>> Hi,
>>
>> On 7/13/2026 5:05 PM, Sumit Garg wrote:
>>> On Mon, Jul 13, 2026 at 4:07 PM Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 7/13/26 6:58 AM, Sumit Garg wrote:
>>>>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> [...]
> 
>>>>> --- a/drivers/firmware/qcom/Makefile
>>>>> +++ b/drivers/firmware/qcom/Makefile
>>>>> @@ -5,7 +5,7 @@
>>>>>
>>>>>  obj-$(CONFIG_QCOM_SCM)               += qcom-scm.o
>>>>>  qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
>>>>> -obj-$(CONFIG_QCOM_TZMEM)     += qcom_tzmem.o
>>>>> +qcom-scm-$(CONFIG_QCOM_TZMEM)        += qcom_tzmem.o
>>>>
>>>> Does it make sense to squash the kconfig entries too now?
>>>>
>>>
>>> Sounds reasonable to me, I can do that for v2.
>>
>> What kind of squash are we thinking about here? Moving the TZMEM_MODE* choice to
>> QCOM_SCM and removing QCOM_TZMEM? I think we should keep the QCOM_TZMEM Kconfig
>> around for when we boot with OPTEE and want to disable TZMEM since SHMBridge is
>> QTEE specific.
> 
> Hmm, fair.

If you are aligned with not performing any Kconfig squashes for now feel free to
add my tag:

Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Regards,
Harshal
> 
> Konrad

