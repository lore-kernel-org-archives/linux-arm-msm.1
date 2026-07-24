Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9505A3385A1
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887761; cv=none; b=X8NLVc+WuNhHAD1Lg3Dz3ENxENvwHa+6X6Br2zwBPEiknAc/ZELtSi6aEQ0GKA/YYytzGA7ALqxd+oj+km1hc4yEQU7l4gOt2e8NrjhsfFRX6eLDk3Mp8WsREa+OKgI4ZSKk+2Pc6bB17GrHWYeVZt5QJ8crqpcigXurCfzxrFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887761; c=relaxed/simple;
	bh=PYUDbi5iKuH980nqgIklV3HZdwCi3yvxZfJ2dlqAx2s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=lcboLclLgDWTrhbYduASYzctt9Ft/AL9bTfPlfvhB43NlQbWfse4QA83kFHB4NnTw9a+7i3EsOBGpzdyDcWVznlRF66AC6v2V6oSo5/W1Ea6SsoiXfaMhBMBrlGbxhacmfEJt2m393YkomUnWBhpd84h69AjtGCn40T04AOoqeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gpi9MLap; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G8wy4MzD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gpi9MLap";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G8wy4MzD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OA3S7o2696903
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BGtm4L/AdYtPrYwJZGfMuaDNk2hgNNxus9W9HDcWv0Q=; b=gpi9MLapSvLu6rP7
	PeYFLLIgJcWrid0/bjdsw3ko6Cq0v0KLWjj8nB2lG1Jx5+0maAHWwoAjFThGz2Pi
	k1Cgd1uWDcJ74zUJCi7WkcNKAJyiE733/eB2Pgk5fQ5DYYetFQwv8RoYpIz1OZVT
	YGVxEYRH2BEmlE2+9/V8iiHgsyG+jc4fUglb0nsVfohhnjcLpdPUKX5gGlT9F5Nx
	VmlaodOL3UbU5p3ll+6XYkKV8qJlnmGU4+Po+gYcYPyYd62UlelCBLj66U8JEsox
	GzHDE91G31BVcVb7N7GhT/N618hmP2LDSS5za6kNra5ugRVi+YxFtP7xoORZt/H5
	XgPk9g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5yag0n7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:09:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so323616a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 03:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784887757; x=1785492557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BGtm4L/AdYtPrYwJZGfMuaDNk2hgNNxus9W9HDcWv0Q=;
        b=G8wy4MzDPu6gL1SREnCqyzQKDD6x8Y/t7c0gprjzLtM7Eo/WRCPlyt6Bo80U5SqEvi
         lGOKhhZ3sFT7WCZPkJzvhpagA2dFfbCSDJcisUWkN2d0Oup2dlkXdozlbUMyNIWoCW+X
         9bH3sS1iATwrtaSKshKuI3tYh7ddKa6uK20tT8hNn3pY6RmXlR3HWheVuhqTRfMjU0R7
         Ya6rykRkDUSxoqKbpTj/qNVz+a/gU/+rQcziyTTsx+DgeafEoELnUZJ68T07Z4Um8FOZ
         FJFrQUHrb/MgpuUGZmDb4QDYDR9fig6ZrxKbhEHgT2AfOb+TaHTUg7cpcj++B8BwvMLT
         nTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784887757; x=1785492557;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BGtm4L/AdYtPrYwJZGfMuaDNk2hgNNxus9W9HDcWv0Q=;
        b=k8+JC8vIb/rIKiYU8nqLtdM9xkin/0C2Rlb80XXQPEwK9vCF4/ILL4s/jcKEBwGLj5
         s5x7hAumrcJ9Xp/zr/4piOQjsfz4CaexzTATkksUC8FGOFP3M96Nrz7mWeiSU5SDaO25
         p8yUEqMys7ef9X25AcES6AEQ3Y2kxjga9FfSsjiuV0HZqVLFDRVGSaRU0R4Ypa+Ni+8x
         iX20h6UmicpLTlgaOpXHi2eFR1XbesO/kt1lIjxJVMYGsaSCWXJDaAGgv0sCQEpT4fyJ
         /Hl3l4gd/oCLidQDhLmToqPqf5/mcHeqbUXeNmj+41swJ5geuGVnchN+heZO5vqZKVCD
         Jnag==
X-Forwarded-Encrypted: i=1; AHgh+RpyqeFJII92xJZflALin69NMuXcSsmucos6TsivPIgev6lmu+j7z9xIqJXcoTI4Ba33BMghbZMGdlSQERAZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyM/7c+3HqUzXcwiACrNMG9PEu/vIo5hI8oYXxmCOC1+9U2+ZXT
	F1s7v2Is16xRa8iTi0YaNmHVzMz5mXvQ20QpeP5fNMdEwX+uDD12pIJjD5eLEdlyj4y6dxOXHko
	1pPX16kXAzi9og8zi7lDqoo1HXjxLTdwiPvU/rApS1AYBpyuVIdQ+sp6MweXWErhpBzzm
X-Gm-Gg: AR+sD10JhoHy2mOnHM35xbpAasfTUDWD9bjJmPRd87sWoFHfxz16oKg+IMQQ7RvnQLA
	4vgq1qkRDiSSJ9t1+DTUB8zRkJW50SGkP4uDziqypp9jcjZ2ilY2fqxZl1/hbtseka8FTz7VZ9f
	AWoNszbbVUh33YwaiDPryRWPrT4wnKwNLWe7t0tKn9WRKXCQwitMStuQd9ILY/r0ddmFn2I4sKf
	dHP7Gywk+SMv2A4+k3InmTuQ+ZtNdchgB9/YXTtvA4TvluY3BUmw/12cOPZz6sYtrNTItPXCMIP
	J9TO2ZmsCICcHKOjxia7LixzISifb2wJR75lbKVwdFZr6iqwUbe0YUfNAGVrgygMfLaAi5vRa7k
	9jbL7328NTqMRtxBZ6lvbjWoTifU=
X-Received: by 2002:a17:90b:2e03:b0:38f:1f8:1fa with SMTP id 98e67ed59e1d1-38f01f802b5mr3694514a91.15.1784887757444;
        Fri, 24 Jul 2026 03:09:17 -0700 (PDT)
X-Received: by 2002:a17:90b:2e03:b0:38f:1f8:1fa with SMTP id 98e67ed59e1d1-38f01f802b5mr3694491a91.15.1784887756996;
        Fri, 24 Jul 2026 03:09:16 -0700 (PDT)
Received: from [10.92.203.75] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03c4580csm1235836a91.15.2026.07.24.03.09.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 03:09:16 -0700 (PDT)
Message-ID: <1049a901-4b1f-4fa9-99f1-a05f6b3af933@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 15:39:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] firmware: qcom: Add support for TEE based EFI-var
 client driver
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260722-qcom_uefisecapp_migrate_qcomtee-v2-0-b8a8fcbe4211@oss.qualcomm.com>
 <20260722-qcom_uefisecapp_migrate_qcomtee-v2-6-b8a8fcbe4211@oss.qualcomm.com>
 <w3oebwhvheb6scbdv2dshhr6t4sx3nwalmlw4akqf4sj3n2nmm@s7e3xtr7cuev>
 <7c7ec8eb-d809-4e1b-9467-4c9105ab00e9@oss.qualcomm.com>
Content-Language: en-US
Organization: Qualcomm
In-Reply-To: <7c7ec8eb-d809-4e1b-9467-4c9105ab00e9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MSBTYWx0ZWRfX8SkIRICvhSRN
 zD7/2vGhm0PWlYoJUyvamGjreDkX1Glw/aBuFxtYBRicoh4JD2H6wponL/vAc2XWwH6+DI3BeH2
 cpSn25nipfe2YZLlovhXmNj03TZKTeg=
X-Authority-Analysis: v=2.4 cv=Rtz16imK c=1 sm=1 tr=0 ts=6a6339ce cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8
 a=w4gilCrdJcNue0UX48gA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: mgnn6gK5rE3XYpOHEFVIsH-mWQwvohG8
X-Proofpoint-ORIG-GUID: mgnn6gK5rE3XYpOHEFVIsH-mWQwvohG8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MSBTYWx0ZWRfXy5nIVI5VjKkV
 P7zlv8bhnUwQ6mUorxom4LUHZcEAFk6pJtVg5Tzo6ucWEoSHV9jTXWoC5x9Rwax7yhBqdztNmhq
 Kd+/VKHdjW98EcduJhY6QwHOGM0kMbUgCsKZ2OBw7Ti9nVggg9yc8dpzmAREgmKPSOw7ChCUO7H
 LUfFo5wZZvO5iW4LJwk95aatQlx4F9g3a5eZJYb4FGIoILILXm1ngOjjV4xL9wYSD0W6F0CN7OQ
 V9a3nRhYC9OupK999t7bjjl4Gd4AvzsjnGOj2E4FMY8u1I3VKdV2yRA6V5P1k4csCB8Qo7/61og
 3nmwDbGlGLTjfZI309u+CF/mmO021coHU07gN0qPXh0v0mJYjj1UQlNPA4g94jtUHvNuOXSEYIM
 BCtzhZx42bcyL16e/3Sn78YlrItYv2hLc7DjaNWTtu2hA5haPYo4jSf/pWJYwd8697OYuRCT7H6
 7l1DfbYKl1VzE+jHQlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240091



On 24-07-2026 02:44 pm, Harshal Dev wrote:
> Hi Dmitry,
> 
> On 22-07-2026 02:07 pm, Dmitry Baryshkov wrote:
>> On Wed, Jul 22, 2026 at 12:29:17PM +0530, Harshal Dev wrote:
>>> On Qualcomm SoC based platforms, UEFI stores EFI variables within the
>>> Replay Protected Memory Block (RPMB) which is only accessible by the
>>> Qualcomm Trusted Execution Environment (QTEE).
>>>
>>> For Qualcomm platforms without emulated RPMB support, specifically
>>> platforms where RPMB is not located within SPI-NOR storage and instead
>>> located on UFS/EMMC storage, non-volatile EFI variables can only be set via
>>> a callback request from the UEFI Trusted Application (TA) to the RPMB
>>> service running in user-space (within the QTEE supplicant).
>>>
>>> Unlike the QCOMTEE driver, the QSEECOM driver (used by the current
>>> uefisecapp client driver) does not support callback requests. And on
>>> certain Qualcomm platforms such as the RB3Gen2, attempts to access the
>>> QSEECOM interface fail due to lack of support within QTEE.
>>> On all such platforms, a TEE based uefisecapp client driver must be used to
>>> access cached/volatile EFI variables within the uefisecapp TA and ensure
>>> persistence of writes to non-volatile EFI variables through the RPMB
>>> service hosted in the QTEE supplicant.
>>>
>>> Add support for a TEE based uefisecapp client driver which installs efivar
>>> operations after obtaining an object reference to the uefisecapp service.
>>> This enables the kernel/user-space to access/modify both volatile EFI vars
>>> stored by the Secure Application (in-memory) and non-volatile ones stored
>>> within RPMB.
>>>
>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>> ---
>>>  MAINTAINERS                                 |   7 +
>>>  drivers/firmware/qcom/Kconfig               |  24 ++
>>>  drivers/firmware/qcom/Makefile              |   1 +
>>>  drivers/firmware/qcom/qcom_tee_uefisecapp.c | 525 ++++++++++++++++++++++++++++
>>>  drivers/firmware/qcom/qcom_tee_uefisecapp.h | 120 +++++++
>>>  5 files changed, 677 insertions(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 10d12b51b1f6..e8316007370f 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -22018,6 +22018,13 @@ L:	linux-arm-msm@vger.kernel.org
>>>  S:	Maintained
>>>  F:	drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
>>>  
>>> +QUALCOMM TEE UEFISECAPP DRIVER
>>> +M:	Harshal Dev <harshal.dev@oss.qualcomm.com>
>>> +L:	linux-arm-msm@vger.kernel.org
>>> +S:	Maintained
>>> +F:	drivers/firmware/qcom/qcom_tee_uefisecapp.c
>>> +F:	drivers/firmware/qcom/qcom_tee_uefisecapp.h
>>> +
>>>  QUALCOMM RMNET DRIVER
>>>  M:	Subash Abhinov Kasiviswanathan <subash.a.kasiviswanathan@oss.qualcomm.com>
>>>  M:	Sean Tranchetti <sean.tranchetti@oss.qualcomm.com>
>>> diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
>>> index b477d54b495a..20ce8b58e490 100644
>>> --- a/drivers/firmware/qcom/Kconfig
>>> +++ b/drivers/firmware/qcom/Kconfig
>>> @@ -74,4 +74,28 @@ config QCOM_QSEECOM_UEFISECAPP
>>>  	  Select Y here to provide access to EFI variables on the aforementioned
>>>  	  platforms.
>>>  
>>> +config QCOM_TEE_UEFISECAPP
>>> +	tristate "Qualcomm TEE UEFI Secure App client driver"
>>> +	depends on QCOMTEE
>>> +	depends on EFI
>>> +	depends on !QCOM_QSEECOM_UEFISECAPP
>>
>> Nope. The kernels can be built for multiple platforms. Implement a
>> runtime selection, which uefisecapp client is to be used.
>>
> 
> I agree. I reflected on this yesterday, and in hindsight it feels we do not
> really need to add a !QCOM_QSEECOM_UEFISECAPP. Both of these drivers can co-exist.
> 
> Both drivers attempt to register to the efivar interface via efivar_register(),
> but only one will ever succeed. Since both QCOM_QSEECOM_UEFISECAPP and QCOM_QSEECOM
> are built into the kernel with 'y' the default path will be QSEECOM based when
> both are supported.
> 
> I can drop this 'depends' in v3, and instead add a commit which enables this by
> default with CONFIG_QCOM_TEE_UEFISECAPP=m. Let me know your thoughts. 
>>> +	help
>>> +	  On Qualcomm SoC based platforms without emulated RPMB support,
>>
>> What is emulated RPMB support? How does a user (or a distro maintainer)
>> understand if this needs to be enabled or not?
> 
> Ack. I will try to use simpler terms here to help distro maintainers. If device has
> UFS/eMMC storage, this driver is the only way to access EFI variables within
> RPMB. So it should be set to 'm'.
> 
> If device is SPI-NOR based, this driver will still work. User can decide
> if they want to use this or continue with the old QSEECOM path.
> 
> Regards,
> Harshal
> 
>>
>>> +	  specifically platforms where RPMB is not present within SPI-NOR storage
>>> +	  and instead located on UFS/EMMC storage, non-volatile EFI variables can
>>> +	  only be set via a callback request from the UEFI Secure Application to
>>> +	  the RPMB service running in user-space (within the QTEE supplicant:
>>> +	  github.com/qualcomm/minkipc). Unlike the QCOMTEE driver, the QSEECOM
>>> +	  driver used by the QSEECOM based uefisecapp does not support callback
>>> +	  requests. And so on these platforms, the TEE based uefisecapp client
>>> +	  driver must be used to ensure persistence of non-volatile EFI variables
>>> +	  via writes through the RPMB service hosted in the QTEE supplicant.
>>> +
>>> +	  This module provides a TEE client driver for uefisecapp, installing efivar
>>> +	  operations to allow the kernel and user-space access to EFI variables.
>>> +
>>> +	  Select m here to provide access to EFI variables on the aforementioned
>>> +	  platforms if your Linux distribution has QTEE supplicant installed and
>>> +	  running.
>>> +
>>>  endmenu
>>> diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qcom/Makefile
>>> index 0be40a1abc13..d780490b2865 100644
>>> --- a/drivers/firmware/qcom/Makefile
>>> +++ b/drivers/firmware/qcom/Makefile
>>> @@ -8,3 +8,4 @@ qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
>>>  obj-$(CONFIG_QCOM_TZMEM)	+= qcom_tzmem.o
>>>  obj-$(CONFIG_QCOM_QSEECOM)	+= qcom_qseecom.o
>>>  obj-$(CONFIG_QCOM_QSEECOM_UEFISECAPP) += qcom_qseecom_uefisecapp.o
>>> +obj-$(CONFIG_QCOM_TEE_UEFISECAPP) += qcom_tee_uefisecapp.o
>>> diff --git a/drivers/firmware/qcom/qcom_tee_uefisecapp.c b/drivers/firmware/qcom/qcom_tee_uefisecapp.c
>>> new file mode 100644
>>> index 000000000000..9a5a6f145a9f
>>> --- /dev/null
>>> +++ b/drivers/firmware/qcom/qcom_tee_uefisecapp.c
>>> @@ -0,0 +1,525 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>> + */
>>> +
>>> +#include <linux/efi.h>
>>> +#include <linux/tee.h>
>>> +#include <linux/tee_drv.h>
>>> +#include <linux/ucs2_string.h>
>>> +#include "qcom_tee_uefisecapp.h"
>>
>> You are the only user, inline the header here.

Ack. I will expand this header and place its contents in this .c file itself.
I hope this is what you meant by 'inline'.

>>
>>> +
>>> +static struct qcomtee_uefisec_app uefisec_app;
>>
>> Do you need global data? Can it be obtained from other context variables
>> using container_of()?

Actually I really did try to do this, but unfortunately the EFI subsystem's efivars_register()
API called by this driver doesn't provide a way to store a private pointer to a struct like this one.
And so none of the callbacks registered by this driver via qcom_efivar_ops{} can provide
access to this pointer by calling container_of() later. The other EFI drivers have a similar
constraint:
https://elixir.bootlin.com/linux/v7.2-rc3/source/drivers/firmware/efi/stmm/tee_stmm_efi.c#L27
https://elixir.bootlin.com/linux/v7.2-rc3/source/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c#L697

Apologies for missing out on these two comments in the previous reply.

Regards,
Harshal

>>
>>
> 

