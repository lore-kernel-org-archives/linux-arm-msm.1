Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A063C455F
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784884497; cv=none; b=gDgit4taqfut6bN4LeplQA9b9Vwc+GBgqOwnDY1joZejqOlalzuMvmy+Zezlj4eKqNUbxki5HZsGghLHylrVzlXj317R1tJ/WkglQKW2iTjZT5Om8IuUQA/SL1GyDOMBsx02CBwdpazBO57FdcaaBoCRVO5dP1qtyAuWkXKup1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784884497; c=relaxed/simple;
	bh=OLLscgq9M+ScYStpq6skqU/yJamc8Y0S5G+SyNkmjOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TFXOZrqUaJ+o6qDYVvgbW5mfHBQa+2EiLzYDkqcG+nGvzflWViBJE+RDORDcc5a6GzjBJKOcZadHh4XP+MaH5W13F1wAiyiawF9o876I/iiV/azbvsZJixydjqSxdeDYg36WoyLgG7Ucr+MSviSHyDqm9e4wMr9Dv6RDM1mIQ0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jr8nwrSb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iV3Cm6wN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jr8nwrSb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iV3Cm6wN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O5xPL11892358
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:14:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	46OQ9kL92dqpYfcGuAIjuk9va1sgSP/j87qnZbsBqAw=; b=Jr8nwrSbn/glDoWi
	O+BxIpfwBCqp0ht950YqPiMHX/UF1GGeMGmQneCF1Dh+qNeo2BOVtb+7QwGz1uvz
	GDw9xpc/pAiT8PMRoshFVkuHl1WcMg7OAllBrKfh4Q+FYGN6Ddx7wh0fzbOEfNvs
	ViX7ggrMuQeeN/AgeEFhAGPl8HaSHpuFFa01bjokwxn6OD2c7AKRitOvA3vhojEM
	9czF7TzwGVKhdvELrx0/AoUzMzNMvHiKk7mcBfKNSb5WHur7uTFM3BJP8Q2NQwFh
	ml5n1jZXRbMAkB2cbf4qqNAdsKgsmlvmhmnAe1QlGKLRHZZL9K/RmcYm4yQ0qn/b
	JoDRlg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm2cx8qgs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:14:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-385d2703b64so1529740a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 02:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784884494; x=1785489294; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=46OQ9kL92dqpYfcGuAIjuk9va1sgSP/j87qnZbsBqAw=;
        b=iV3Cm6wNemiZvzhaGjLeAnXuGjz3J1M+Mdh2/Ytbtt5LN+joJLucuEHI/67aabjEvs
         q6ArRqpx5YE9F0xdrqJK6vVFvJkypv9Vgkbc81/J1OJLbDL9RcFg8WNlazZlNv/kNqmw
         hU1YTZtzp6a4FXd6k33GdQ9sDP4F89h3+mrrU4nnDDhSM3ZUf+0PVhtN4TDEEG9ypQY/
         A6cs3Y850BvFCQEHTjkhXe7TyG5Hdqpa5cBkfNVuEno0w2P+HAyVRZY+5ubBBCyFfZzo
         C0OoHMpv0IrSgvNjgyd7y56Xk2R4BF8Gi4D+Z2OjeAZ2y/jdqk5lJz8qnuvMtQ4AVsNV
         wHyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784884494; x=1785489294;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=46OQ9kL92dqpYfcGuAIjuk9va1sgSP/j87qnZbsBqAw=;
        b=cLCdwbZtd0cRlM8UOeHZjyTDnhpXDlix9nLtWsyWpwJpLmgGEc3lJ3QBEWiQFoyWZZ
         QHR0BXmROWsQT97ohOoEn91hgV387J+qTZOHovQiVuJaecYtfllogmW5Kv4X0rokyRWD
         sEzZqat7p5HGj9R8utvofGxwXoFCb4XDVvvYfpQstzzdQRRs6MdQk5ChizHMtIY6HYAW
         98K7aU0HAjICZyAnW9ABY992LAR/39ZTBdWpIN3Ib8XwZOWXnabi1I29rG3qKkFCX2t4
         1xJtvDN/NNPqwEagY820IKqeMmEQ0SFFYrNN4Ja+lQIeH1d2eFo429kruTJUSI2h3Yar
         FdSw==
X-Forwarded-Encrypted: i=1; AHgh+Roagbmp3cAalSdbNaQrLImtGaaN2VdF9MyRm+6KwMqLvNQ6no6q8Tf5NK3nwnvw4PZsKsG177hFow4/OqWb@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1G+ZXnzGNZxArlhx4kknuj1m5fUgS/jn+i/EVVZ41QhW737KP
	MPHiTg27FXT2WmEbqKofYx6z45hMrhOmGWJXFdr1FkF386zDcpIQqRsGHu5FL4haE0Sac7/flhn
	LIyt+fs1sK4vpLiZjC0FHH0pM6RCu/+7ss3G4WmK2kFCLdNL7ydLvkAtAvX29Kv4YA+2K
X-Gm-Gg: AR+sD13j090BxhaESRvz8/taB6LHwkBG0RzgV3O6M+LDh/xmbpuZYGuyHDNzCrQ8pDS
	IYJgkVpDcZgBBzAUPN9McBpb4FBJimoSLeU7wY+nwKJRPtr8zunagjbq9lHVVn7uc/nGEBXgIhM
	HTV1ll6+zLt4eCKduLeeAV8WdMvaOp1sn3JE8C8Dxdtfg/gY97dEgFZ6Qc6WRyteHEum/p44Egj
	Y57Ke1x0h6a+D2Y4pesAZmP4182wNKfMZ1Thw+bxCfe/HXGrBN29vV+ZEG6N1EP+2dm0SSsNULA
	/dOUHclRWq2vca7ojo2g68NH0NyY/cY3ZMcDKJdxOx8cRm2t9Z85H1wCcyFvsHvkE7bo22YqIMr
	JQsWoLs9HgtRIg79zokjSMel/NZo=
X-Received: by 2002:a17:90a:5895:b0:38f:a81:15b1 with SMTP id 98e67ed59e1d1-38f0a81287emr1835569a91.19.1784884494203;
        Fri, 24 Jul 2026 02:14:54 -0700 (PDT)
X-Received: by 2002:a17:90a:5895:b0:38f:a81:15b1 with SMTP id 98e67ed59e1d1-38f0a81287emr1835557a91.19.1784884493705;
        Fri, 24 Jul 2026 02:14:53 -0700 (PDT)
Received: from [10.92.203.75] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d2eb01aa0sm3272664c88.3.2026.07.24.02.14.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 02:14:53 -0700 (PDT)
Message-ID: <7c7ec8eb-d809-4e1b-9467-4c9105ab00e9@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 14:44:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] firmware: qcom: Add support for TEE based EFI-var
 client driver
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
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <w3oebwhvheb6scbdv2dshhr6t4sx3nwalmlw4akqf4sj3n2nmm@s7e3xtr7cuev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CY0BkBuo7620eHFLgIu6SIJGeZ3j3gVV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA4MyBTYWx0ZWRfX/PtzcGttFnER
 gm5v9xFbsSTbNY1A4fimFnZLm/LufAjtrjZ2O4PM+733s6TTjYRu2ZEzzEDu08i1nYIB0AdiSCV
 ciBzLa/4PmsHnDOiwn8+dz9sfh3lGh9mV7BReNto1anD/ObfgYdz1+0mK3Tm1/6o3M9BAzryv8R
 toHdmDLSoA7JeOYG4wxbRfQQH3xq0b8kUYac35U661xhZoU7mng0w+q/MTEV6tliyBQa0Esc1G5
 EgrlnPtFdt/zfKA6fNvy4y+KBe1ewnS5i6gWPYcLfS8ntY7LBC/5vY7C1/s3qN93t4AGdgySp43
 k7SJSJ91He0MzIZH/RIzduY/++/sJBzV9UlHukmkOdXaQWcfYk+AJujZkpwr3gQvZYxXQ1zAcwG
 0Rw0OkRiM+yhuQDgDCMlB3U9pu3rZbulSoM0QeIaCFVVVWa5rZ4LNAid4qJORmF7wM7FfL5vB8u
 LhKee3JVbicj92hrzLg==
X-Authority-Analysis: v=2.4 cv=X51i7mTe c=1 sm=1 tr=0 ts=6a632d0e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=iIHXuhr-o-_T8umTYlIA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: CY0BkBuo7620eHFLgIu6SIJGeZ3j3gVV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA4MyBTYWx0ZWRfXyM3DmM+M/ShH
 GvgaKq/MaXii6ooOcuw8GLSB0IBw6fZeQbrnrr3jSnPTQGmohoHY9/ldeVEBR4tGSo1VvCiFkoL
 mHKnwI5n1tA7u+CEvu1LgOSGBu381rg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240083

Hi Dmitry,

On 22-07-2026 02:07 pm, Dmitry Baryshkov wrote:
> On Wed, Jul 22, 2026 at 12:29:17PM +0530, Harshal Dev wrote:
>> On Qualcomm SoC based platforms, UEFI stores EFI variables within the
>> Replay Protected Memory Block (RPMB) which is only accessible by the
>> Qualcomm Trusted Execution Environment (QTEE).
>>
>> For Qualcomm platforms without emulated RPMB support, specifically
>> platforms where RPMB is not located within SPI-NOR storage and instead
>> located on UFS/EMMC storage, non-volatile EFI variables can only be set via
>> a callback request from the UEFI Trusted Application (TA) to the RPMB
>> service running in user-space (within the QTEE supplicant).
>>
>> Unlike the QCOMTEE driver, the QSEECOM driver (used by the current
>> uefisecapp client driver) does not support callback requests. And on
>> certain Qualcomm platforms such as the RB3Gen2, attempts to access the
>> QSEECOM interface fail due to lack of support within QTEE.
>> On all such platforms, a TEE based uefisecapp client driver must be used to
>> access cached/volatile EFI variables within the uefisecapp TA and ensure
>> persistence of writes to non-volatile EFI variables through the RPMB
>> service hosted in the QTEE supplicant.
>>
>> Add support for a TEE based uefisecapp client driver which installs efivar
>> operations after obtaining an object reference to the uefisecapp service.
>> This enables the kernel/user-space to access/modify both volatile EFI vars
>> stored by the Secure Application (in-memory) and non-volatile ones stored
>> within RPMB.
>>
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> ---
>>  MAINTAINERS                                 |   7 +
>>  drivers/firmware/qcom/Kconfig               |  24 ++
>>  drivers/firmware/qcom/Makefile              |   1 +
>>  drivers/firmware/qcom/qcom_tee_uefisecapp.c | 525 ++++++++++++++++++++++++++++
>>  drivers/firmware/qcom/qcom_tee_uefisecapp.h | 120 +++++++
>>  5 files changed, 677 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 10d12b51b1f6..e8316007370f 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -22018,6 +22018,13 @@ L:	linux-arm-msm@vger.kernel.org
>>  S:	Maintained
>>  F:	drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
>>  
>> +QUALCOMM TEE UEFISECAPP DRIVER
>> +M:	Harshal Dev <harshal.dev@oss.qualcomm.com>
>> +L:	linux-arm-msm@vger.kernel.org
>> +S:	Maintained
>> +F:	drivers/firmware/qcom/qcom_tee_uefisecapp.c
>> +F:	drivers/firmware/qcom/qcom_tee_uefisecapp.h
>> +
>>  QUALCOMM RMNET DRIVER
>>  M:	Subash Abhinov Kasiviswanathan <subash.a.kasiviswanathan@oss.qualcomm.com>
>>  M:	Sean Tranchetti <sean.tranchetti@oss.qualcomm.com>
>> diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
>> index b477d54b495a..20ce8b58e490 100644
>> --- a/drivers/firmware/qcom/Kconfig
>> +++ b/drivers/firmware/qcom/Kconfig
>> @@ -74,4 +74,28 @@ config QCOM_QSEECOM_UEFISECAPP
>>  	  Select Y here to provide access to EFI variables on the aforementioned
>>  	  platforms.
>>  
>> +config QCOM_TEE_UEFISECAPP
>> +	tristate "Qualcomm TEE UEFI Secure App client driver"
>> +	depends on QCOMTEE
>> +	depends on EFI
>> +	depends on !QCOM_QSEECOM_UEFISECAPP
> 
> Nope. The kernels can be built for multiple platforms. Implement a
> runtime selection, which uefisecapp client is to be used.
>

I agree. I reflected on this yesterday, and in hindsight it feels we do not
really need to add a !QCOM_QSEECOM_UEFISECAPP. Both of these drivers can co-exist.

Both drivers attempt to register to the efivar interface via efivar_register(),
but only one will ever succeed. Since both QCOM_QSEECOM_UEFISECAPP and QCOM_QSEECOM
are built into the kernel with 'y' the default path will be QSEECOM based when
both are supported.

I can drop this 'depends' in v3, and instead add a commit which enables this by
default with CONFIG_QCOM_TEE_UEFISECAPP=m. Let me know your thoughts. 
>> +	help
>> +	  On Qualcomm SoC based platforms without emulated RPMB support,
> 
> What is emulated RPMB support? How does a user (or a distro maintainer)
> understand if this needs to be enabled or not?

Ack. I will try to use simpler terms here to help distro maintainers. If device has
UFS/eMMC storage, this driver is the only way to access EFI variables within
RPMB. So it should be set to 'm'.

If device is SPI-NOR based, this driver will still work. User can decide
if they want to use this or continue with the old QSEECOM path.

Regards,
Harshal

> 
>> +	  specifically platforms where RPMB is not present within SPI-NOR storage
>> +	  and instead located on UFS/EMMC storage, non-volatile EFI variables can
>> +	  only be set via a callback request from the UEFI Secure Application to
>> +	  the RPMB service running in user-space (within the QTEE supplicant:
>> +	  github.com/qualcomm/minkipc). Unlike the QCOMTEE driver, the QSEECOM
>> +	  driver used by the QSEECOM based uefisecapp does not support callback
>> +	  requests. And so on these platforms, the TEE based uefisecapp client
>> +	  driver must be used to ensure persistence of non-volatile EFI variables
>> +	  via writes through the RPMB service hosted in the QTEE supplicant.
>> +
>> +	  This module provides a TEE client driver for uefisecapp, installing efivar
>> +	  operations to allow the kernel and user-space access to EFI variables.
>> +
>> +	  Select m here to provide access to EFI variables on the aforementioned
>> +	  platforms if your Linux distribution has QTEE supplicant installed and
>> +	  running.
>> +
>>  endmenu
>> diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qcom/Makefile
>> index 0be40a1abc13..d780490b2865 100644
>> --- a/drivers/firmware/qcom/Makefile
>> +++ b/drivers/firmware/qcom/Makefile
>> @@ -8,3 +8,4 @@ qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
>>  obj-$(CONFIG_QCOM_TZMEM)	+= qcom_tzmem.o
>>  obj-$(CONFIG_QCOM_QSEECOM)	+= qcom_qseecom.o
>>  obj-$(CONFIG_QCOM_QSEECOM_UEFISECAPP) += qcom_qseecom_uefisecapp.o
>> +obj-$(CONFIG_QCOM_TEE_UEFISECAPP) += qcom_tee_uefisecapp.o
>> diff --git a/drivers/firmware/qcom/qcom_tee_uefisecapp.c b/drivers/firmware/qcom/qcom_tee_uefisecapp.c
>> new file mode 100644
>> index 000000000000..9a5a6f145a9f
>> --- /dev/null
>> +++ b/drivers/firmware/qcom/qcom_tee_uefisecapp.c
>> @@ -0,0 +1,525 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/efi.h>
>> +#include <linux/tee.h>
>> +#include <linux/tee_drv.h>
>> +#include <linux/ucs2_string.h>
>> +#include "qcom_tee_uefisecapp.h"
> 
> You are the only user, inline the header here.
> 
>> +
>> +static struct qcomtee_uefisec_app uefisec_app;
> 
> Do you need global data? Can it be obtained from other context variables
> using container_of()?
> 
> 

