Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9B038BF96
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 15:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784043488; cv=none; b=opzR+JLVPENmPzYCt73SyMkTYG7I6oDEi1Zeg9AwNCXjFiqe00z/2Sdq4qkNIACyxFzW43g48Z3sx8kAQIo7BBRYpMtD3IxnOdAgMS8i6Yqri1VF4PsRRQviVtVSsoRCxSjZxQvUNnYAOc5GxO3LBuwHSiTd1SsROkNKW+07dt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784043488; c=relaxed/simple;
	bh=6sbok6h1N9G7+JLMYzctNSGea2HzfwQ0WyavSWNvIyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qFLOQF8Hh+gT4lPg53dqN+FnV3/ajeex5NgCpEJ9TlxHg/IInd5kGC9s4k3jXTvVJsnL6/ZfSoIfr7PVu0lpioOs+FdurnkQC4tTi2t4UlWsVEtC4q7G6Ta63MWhU4b0DSe6AIe+170YvZKmuyYsrlVqVw4kEfUOc7ZsI/LpFoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PgnR7xH+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WItUkUyO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PgnR7xH+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WItUkUyO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EEcJbJ938491
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 15:38:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SNiX17I+YKQm971m2yTIUomyDUMmNvGmPAjk2oge9Zc=; b=PgnR7xH+4o2a/S+S
	32M75WOBztVOfzr5Esfvod76OO1ENtfdbw59nRpIkuJrQkH7xVuJSzcR+nYCvnsu
	jyV3QjfYE265Jj1UHoTYjjI1lEGBssbe688mwo21IjqMTOwl4UW+llzbnxH8X3J0
	Wz/RzE152hXSlIImJ3jbXTmzhdDmDDoiP2YWhNh7sCNDvdQ7RFPpvQY8KYEAqCge
	ELkpjkVPjpd8SOxZ2Y1zz40Q87cltWXx3O0dw8ymqVlMkHmXlqyS1Z13bsq6iYbZ
	F93qfas5LSe8xUnL+kmSfrZYO6FI+WYPxFFvGtMfs8eWmIst9ObEfmV6HUbQyIXG
	9rImVg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnurnh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 15:38:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ebcbb818bso78105685a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 08:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784043485; x=1784648285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SNiX17I+YKQm971m2yTIUomyDUMmNvGmPAjk2oge9Zc=;
        b=WItUkUyOKCrrPnbouV/uim+70I35Xiw+JMWbXuV80kxXPSps6MKB7zjXXONdccUvbN
         huMNB5LEyWdxr2HeASDkRcLE1X2NL+ADSxFgj+fstwjLqCnhQbAbR3+jJNgmEt43kuiK
         02TCduON6Zx26ePSJgck4X51VYFDWvgvxq2/TFEXW4f9NnIXfZ6pqj7cfW5yS7QVwCaB
         uOdwsW4bh6qyynvtymgKyfyh7ZqAEf9Qty8AzFOC+fdFxeXdMvEbTT9QZpq/P/pwwiUs
         gSppCjSP9An2MiZQT0dH81oKkc3UY29d8XUmG52WE92kqwGJh/3zx99uTqYSeqTAT8DS
         +vxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784043485; x=1784648285;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SNiX17I+YKQm971m2yTIUomyDUMmNvGmPAjk2oge9Zc=;
        b=W790XpFV+Z4gxdEqZ4Gj/0tt1TLjKBFDSH5v+i/rAk9foO0ERwLRKrRnb/qcackLty
         9G48JrH/n8HEjzbFK4F0wqpOsaH6QEFJRVoCJ1ob/8pX+M64wdn4CEetfCVTrX45hyEL
         QHjk/maXgH/7N8kV8tL2Ss2CrcEMcDL2g8jL3Ua/yE4UiGcKYAun/lB0IKLrSt8ry3ef
         GnUIcpsDJUUBQMzvyIXX4sph/bC4HMG9j+eVrTj7aRjvLsJaVUpprr2dnp2UPSNs2QSz
         WylfZ0wutdFu+2dufQXRGNbSbnbj7/0iHwVx8P/ko4opjC46orGgkEKO4hWdmLZ9jpan
         PCSQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro0SgfJqNvJ12FhRDGfZj2bEMGbmNuWn3nl2medSTtiCt3JWpc0SxJi3PpC/D2wjlxa3Kr7oR4h3/8vjUhq@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8YW94HnHrW5B+amDs7OaKn2lY/h6h5Fw+KmG4GwJLWU1IIjeS
	SSExmusy+zT/iU4QOGmGxymb3Geo0ZGHBaC80uOS/fbwYPb36PeQl/KYKqLLpRW5Vn4IeVtqNvy
	zakW9hxv0wae586d4V4uxQaZX7HhIiL5IR5a1+NHqKXxzTbxqJ28AUnc9aGPa+cqie3l/
X-Gm-Gg: AfdE7cn5FBKeQytYau3MiZkNQo3AQMG5GpMXmr2YgsuoPKS3mNQBVr+P2AR1ktSksKp
	XI66UVCW/Si18gl1colzfXmnW8GFI58v7aV/ZJAj4ad825/ClwYPr0a3tqrYI61dzEow8xrm2hB
	ePA9Ftp+EyqdjDQU2W3ZApQQgXkXzj7KWOuMYx9M9AopxWa97TlJnUxuZpNkwp5sgaIV5hsAQpV
	8OKN/zljPxtHopyQ/EK1093y4kRQFsaNa0R/dL+0y1dCSZy1GDzVtL4dIICoWckr25LYLMWRqVD
	E0PjviqVCblhoNqfhpqyaIqMXRkF4ojYBnWWJna0oVgsu1j9Het9EOs3/Psp0LywCKWAcYJ3t3f
	oNuMX+Z2aufILHwoHGUYK+zHZjS1FLo0tlkU=
X-Received: by 2002:ac8:5a87:0:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-51cbf171aeemr113271431cf.4.1784043485111;
        Tue, 14 Jul 2026 08:38:05 -0700 (PDT)
X-Received: by 2002:ac8:5a87:0:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-51cbf171aeemr113271161cf.4.1784043484596;
        Tue, 14 Jul 2026 08:38:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ada057dasm1216245466b.50.2026.07.14.08.38.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 08:38:03 -0700 (PDT)
Message-ID: <98d6d638-bc5c-4a4f-b587-44b61df63d34@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 17:38:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: qcom: scm: fold tzmem into the qcom-scm module
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-kernel@vger.kernel.org, bartosz.golaszewski@oss.qualcomm.com,
        kernel test robot <lkp@intel.com>
References: <20260713045811.484554-1-sumit.garg@kernel.org>
 <b967394f-b1ee-4718-8629-b5814b4e129d@oss.qualcomm.com>
 <CAGptzHOvBZP4sC5+Tp0rCzCuJFU5szBPeCETbxrsQKkY=pNwkA@mail.gmail.com>
 <c588861c-bbbe-4f30-a503-c9c04d9361ae@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c588861c-bbbe-4f30-a503-c9c04d9361ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 23llllcI5EANVEjef0XbrnaOQDmSzT21
X-Authority-Analysis: v=2.4 cv=E+v9Y6dl c=1 sm=1 tr=0 ts=6a5657de cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_domvqDZwZYnMqpnLDkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE2MyBTYWx0ZWRfX32+aeTlCqf8f
 HQ8LwbvtVKRcIiYir9wdVD1xFyYuQ6Xr3vloDJUq3izT3sU0TrZ7xlygBpFr8tWDc9YZ4BrR6b1
 Pu8sF72hYmDWXHJ6gHXA0EqikEOvDn0x5hLEYw4DflyRVEr5fW9McYYwL5cggblIfKACh1xcIja
 403WAuu9x1swp/2mIv6lGrCUjC8E8R0lcekHy04BESL3LtnMehAX7IsB/0NGsR1m8ndoiAjW5By
 8lyy9ShXHBLMxrTDKL80BWpGn4RvrZcE78QkibATag0fD4xosdkIh/h0zEb5/WHaOCQupb62bku
 1T5JAqDMfI/XNkzv3CIRWooS5/XdAfyK4Uru+vIUWXMF0tvwCRiEdEbo9Zm1/Gs9hKk9Xc152nv
 0wG5hsMqV6L9I6VCCyklkfWeyflR31vigNXgXPfmpgw7pUfaV3J8hWFojKP1H4VSuB7RBfXSYZ1
 WW6gxQDSogNx19mBi9g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE2MyBTYWx0ZWRfX5r7TpOlCdIzS
 xeWjJG1ZFtQ7P6rmexnvknZQqirpnaWJ3HDJA7fQ/BTaI4sbo9R1dPitd+oObeucFM1csLNDxuU
 d3MJhBKlvXUVMJwB/v40rXCfhRGukk8=
X-Proofpoint-GUID: 23llllcI5EANVEjef0XbrnaOQDmSzT21
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140163

On 7/14/26 8:25 AM, Harshal Dev wrote:
> Hi,
> 
> On 7/13/2026 5:05 PM, Sumit Garg wrote:
>> On Mon, Jul 13, 2026 at 4:07 PM Konrad Dybcio
>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>
>>> On 7/13/26 6:58 AM, Sumit Garg wrote:
>>>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>

[...]

>>>> --- a/drivers/firmware/qcom/Makefile
>>>> +++ b/drivers/firmware/qcom/Makefile
>>>> @@ -5,7 +5,7 @@
>>>>
>>>>  obj-$(CONFIG_QCOM_SCM)               += qcom-scm.o
>>>>  qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
>>>> -obj-$(CONFIG_QCOM_TZMEM)     += qcom_tzmem.o
>>>> +qcom-scm-$(CONFIG_QCOM_TZMEM)        += qcom_tzmem.o
>>>
>>> Does it make sense to squash the kconfig entries too now?
>>>
>>
>> Sounds reasonable to me, I can do that for v2.
> 
> What kind of squash are we thinking about here? Moving the TZMEM_MODE* choice to
> QCOM_SCM and removing QCOM_TZMEM? I think we should keep the QCOM_TZMEM Kconfig
> around for when we boot with OPTEE and want to disable TZMEM since SHMBridge is
> QTEE specific.

Hmm, fair. 

Konrad
