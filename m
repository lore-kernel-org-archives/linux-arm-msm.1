Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00807349CF0
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 07:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791876641; cv=none; b=cjBsuXXvKNIj+28O2N+H1XZqpAoR2u2sfFBe44xgeoj8aV0IRSsh4zyZwX/sadY5KxFp7MkWgmDsgXelUzSwaRNc8JIMcQ8FseeRZsdr04b/n6rr2mUZ6Q11uPr2/eVR7g61V3n84E9/lkPawKDVxdHth1aeeGMpgJFZz5kD+Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791876641; c=relaxed/simple;
	bh=jxJNYrI22RlLexodQlZcE5ZvGLVCwiFJ8RVwNBj6iLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hoqMKhLZm85UNS5SHWNMt9utHHHMwlGspfdde5An6gHKRW0SMzPqMEbzZzVV0o4DbWtAOp+5BwivQAfCwmMD6e/gyVih8BIP6RfYwrtxSZJFY/936W38Vex2PIGAQHcfS8kQWlDc85CFmsCdvqmHtedyzSBLwE5rxoxr8WHWHrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E0DOOchF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R1EiZCc7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E0DOOchF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R1EiZCc7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D212wX4071819
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 07:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kHGYKtLSEbyUQdlpz97zgPVlOvItbLPmnAOXZGaC+co=; b=E0DOOchFG4ce55HI
	0D0VDPA7pS2T5EwmXVziwVJk/UVFfKFBaXLK2sY6/rP+3Y+XSZyqCDtFhCqpF0ir
	QoU5xzEZ2BaOyA0KzmCAE3x/Wjjv9wVEFxcFHXk54bR/u8eoNRszXTeA9Me74KAH
	nFKDwXk5ESQMlsrktvzWAu7pWDNeB/04H4K/ko1jn8Q7X22zPSXGKHSwLlFPXrH1
	E7BfytgTeIRyRBTijXfQ3nXBY3O39txVSi1eRVc3FK/A9OzRSwrhxrC9iTIKO5al
	OxDXwnZ74V07+pX3VgCjosdehDZfrFgQyAZukjafgRyJHt18C8xa0KVrUv+CAMzT
	LvVyAg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h92jjuaav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 07:30:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab7f1efe67so2095257a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 00:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791876637; x=1792481437; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kHGYKtLSEbyUQdlpz97zgPVlOvItbLPmnAOXZGaC+co=;
        b=R1EiZCc7eyXQZAqimcQUyBtj8AgVu2rASdY+HnAPiUhmSmqqiVg/3gpwTx1/5McDGQ
         cjyiVXnC/xV5Fr+QJWHkGD+IHP+a+OPQhE+R90WcmIMTY85Wdm5mibBtASNFAEfRU0ew
         +phx6Ru4oOXUCqR5prqIZHsKNqeuO8/H5QqBukFDDQiwSzrUy5btSebMi+a+ii4w4+j/
         PL9B6OeS3BRF8W6Jy9M6Ypes3amZci/S9vRmui3SSWvxXIkyisnqS8a/aeBnmL3Io1G4
         f3dVUBYmHFO9rT4dOOEMaN8BIGxb6aXhFAhO7QpAmx3exgXQJBsuoK5p6pwO054ZdRGf
         sZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791876637; x=1792481437;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kHGYKtLSEbyUQdlpz97zgPVlOvItbLPmnAOXZGaC+co=;
        b=zxKNtduagQgEw4OgQ3Kzrax95QWVU0N842ZGPrjrAUxDbfEOjVAzrXlq7ApvLqoQmm
         egchd3PvEb4vRDvMSN3MzIiqdfbH4m9/oBUyK6I+yvjP7TIi2Fh9pG3ievqLDfYK5nAf
         HfxJmdNzoYUBPcIexRjolEGTzRt5WAgQ2ndqm9May03OunY5Tpq4xlq0YNxNj9V+qgVZ
         DHIido4Z767YAsyyHCSQSKhpWLyDSjEJ5hbKVzYEpbjd+ZwIdRDXVsePkyrhigIWUQcV
         /vJUya89jyOj5wH74060GA9AIQ9x4ja+ggnseGK+NskU6k2sKIRUMt2sj5YTAAu0hVTR
         A80g==
X-Forwarded-Encrypted: i=1; AKwUvBzn0rvUZoX6DaV4Z0sDiG6e7AtAfRzHSGndTx8X7egERYceqK/eLnXJWUMqmRGFC+ualEF4bWIQTnBpH2kL@vger.kernel.org
X-Gm-Message-State: AFq9FYJVg8mrfWZyA5ssxdYGFmcPjMtJB7mLk5bH3qw84GJ+0lixHj1P
	sCDbvlyEX/1x+SbGSKT2e30suaycpny6HpU+GMgcQ4J37yuEi+tYj9U0m/vSsmfkXNT9fnS21ZV
	4mrnlkOl4ip4af3Em9cuNJ9zTbAPSM5p5cd2o/J15vaKV0tu2C660ZqS4vJ7DYChOAaiz
X-Gm-Gg: AYBFou2aYCQCEm5pAkj0leRY2OUUFtF3qFlh6rkJWzCV89KmXBd2ZVLLq6A3SSIwdkq
	ziU4uYSgqKT8t8aCCAb1/7vmOEhe+3YfCD0zcZoDxzuXrzsZ3hqjyAsgKpqxZ8qRs4J0Qw0FkTc
	A0uC0TraGhcRQiUxBK22mL5CaVHfAjwcQjOnz8ydN2TtuX3UY8JpGwOmz/VTkYxiH6NPf1j2j0H
	yirh8zBgJeVdr2/Fo9uBJZI3PyYQL41+FThzua9hzvRo5vfqv+XUWSLiRZBO2INoWtS6CWSqHYU
	jK7F8iTVCiZhBuPn0RlA/YUZakBOim3+DUag6lZCJE1FcVT82Yh84ASZw5buubNjX1BLUNix+XI
	Lzq0yE5wgC0o4pM7QKHY7PaoGD2+hXKUV
X-Received: by 2002:a17:90a:c88b:b0:3a5:1b:34a5 with SMTP id 98e67ed59e1d1-3ab3af73a91mr9462450a91.49.1791876636583;
        Tue, 13 Oct 2026 00:30:36 -0700 (PDT)
X-Received: by 2002:a17:90a:c88b:b0:3a5:1b:34a5 with SMTP id 98e67ed59e1d1-3ab3af73a91mr9462411a91.49.1791876635809;
        Tue, 13 Oct 2026 00:30:35 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab39234b62sm20398370a91.16.2026.10.13.00.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 00:30:35 -0700 (PDT)
Message-ID: <a3a83688-0b85-4555-a9ec-4ac51b692f49@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 13:00:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/7] bus: mhi: Move Sahara protocol driver under MHI
 host client drivers
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20261012-sahara_protocol_new_v2-v8-0-e12939d229a1@oss.qualcomm.com>
 <20261012-sahara_protocol_new_v2-v8-2-e12939d229a1@oss.qualcomm.com>
 <2bf0a2e0-7466-4e90-b53d-f3fc0d26378c@oss.qualcomm.com>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <2bf0a2e0-7466-4e90-b53d-f3fc0d26378c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GdcUzfVD-v0EuJxPrIn7IwtgXekC8aRG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyOSBTYWx0ZWRfX6q5aNyR7GOhK
 QiLzw1eltD5vg0Xpt+kcDZYwgBAssoFdC/jr5J1QKr3JVrJNgpWHdw7F5khxUSY7o/hzV/5V6k0
 vJF+05HpQY/4WIfISvKzTCQ2tTGUO5w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyOSBTYWx0ZWRfX7jGFfBG4n1Sd
 Tc48xAOcX790St1ZiWOrKR9S5Hc5VkKMPk02DphNDrgSE+r4G8FP8UIrEEvcBhRxjEyuTg+HBQl
 dSnxps/08d2nV710qz9HhE7QmVcqiBV/yAveWO/ROFaIYPyhyJNCJvQl0xJ5ZbW1w7JZo79Jyws
 ZLOBCdymEP0EwnPPa1zfmWP1dV4rbTMRO6+2dSCBJ896XIvlcdkvDNElDUIa+gw6SLJyomYirdw
 FwlEaKZj/qDD9wwIrUpDPmkoq9xaH4ym+zAGAw4vbwWHJNhaiYMET0smn9ngTBeO9X6iFZ/AwVg
 A371lWX8mjt/wOCaAAhNriOr9Ik+02nXUGHQ6fM15lfaaMFeS2ojQ/IRbH+i2E44bGPclROm9DQ
 tRCEiqcCDBRhI6mYiJe2JNa9/30nacPH2YMPX6D9WoJ0nhrg3BpARX9ekBPfKt0zDsVumZ25Axa
 sS6Nn7JYB3l7xtHfGUQ==
X-Authority-Analysis: v=2.4 cv=GfKCDgXL c=1 sm=1 tr=0 ts=6acdde1d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=YsTF_x4DAHpo6Sg_WHoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: GdcUzfVD-v0EuJxPrIn7IwtgXekC8aRG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130029


On 10/13/2026 3:05 AM, Trilok Soni wrote:
> On 10/12/2026 11:18 AM, Kishore Batta wrote:
>> The Sahara protocol driver currently lives under the QAIC accelerator
>> subsystem even though the protocol is transported over MHI and is used by
>> multiple Qualcomm flashless devices. This makes Sahara appear QAIC specific
>> and complicates reuse by other MHI based devices.
>>
>> Move the Sahara protocol driver under drivers/bus/mhi as a host client
>> driver and build it as an independent MHI protocol driver. This keeps the
>> QAIC driver focused on the accelerator device while allowing other MHI
>> users to enable Sahara without depending on QAIC.
>>
>> As part of the move, add a dedicated Kconfig/Makefile hierarchy under the
>> MHI host client drivers and convert the driver to use module_mhi_driver()
>> instead of register/unregister hooks.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/accel/qaic/Kconfig                          |  1 +
>>   drivers/accel/qaic/Makefile                         |  3 +--
>>   drivers/accel/qaic/qaic_drv.c                       |  9 ---------
>>   drivers/accel/qaic/sahara.h                         | 10 ----------
>>   drivers/bus/mhi/host/Makefile                       |  2 +-
>>   drivers/bus/mhi/host/clients/Kconfig                |  6 ++++++
>>   drivers/bus/mhi/host/clients/Makefile               |  1 +
>>   drivers/bus/mhi/host/clients/sahara/Kconfig         | 15 +++++++++++++++
>>   drivers/bus/mhi/host/clients/sahara/Makefile        |  2 ++
>>   .../qaic => bus/mhi/host/clients/sahara}/sahara.c   | 21 ++++++++-------------
>>   10 files changed, 35 insertions(+), 35 deletions(-)
>>
>> diff --git a/drivers/accel/qaic/Kconfig b/drivers/accel/qaic/Kconfig
>> index 116e42d152ca885b8c59e33c7a87519a0abc6bb3..af90fdfcf77eeb6dd5ad309b33d793d4fdc91b1e 100644
>> --- a/drivers/accel/qaic/Kconfig
>> +++ b/drivers/accel/qaic/Kconfig
>> @@ -8,6 +8,7 @@ config DRM_ACCEL_QAIC
>>   	depends on DRM_ACCEL
>>   	depends on PCI && HAS_IOMEM
>>   	depends on MHI_BUS
>> +	depends on MHI_SAHARA
>>   	select CRC32
>>   	select WANT_DEV_COREDUMP
>>   	help
>> diff --git a/drivers/accel/qaic/Makefile b/drivers/accel/qaic/Makefile
>> index 71f727b74da3bb4478324689f02a7cea24a05c2d..e7b8458800072aa627f7f36c3257883aa56f4ce4 100644
>> --- a/drivers/accel/qaic/Makefile
>> +++ b/drivers/accel/qaic/Makefile
>> @@ -13,7 +13,6 @@ qaic-y := \
>>   	qaic_ras.o \
>>   	qaic_ssr.o \
>>   	qaic_sysfs.o \
>> -	qaic_timesync.o \
>> -	sahara.o
>> +	qaic_timesync.o
>>   
>>   qaic-$(CONFIG_DEBUG_FS) += qaic_debugfs.o
>> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
>> index 0acf6cdd44f81430ec52c7120b8b50c60721a615..64e87dfaa560376ecdf1e6f8bf7abf6153160926 100644
>> --- a/drivers/accel/qaic/qaic_drv.c
>> +++ b/drivers/accel/qaic/qaic_drv.c
>> @@ -32,7 +32,6 @@
>>   #include "qaic_ras.h"
>>   #include "qaic_ssr.h"
>>   #include "qaic_timesync.h"
>> -#include "sahara.h"
>>   
>>   MODULE_IMPORT_NS("DMA_BUF");
>>   
>> @@ -789,12 +788,6 @@ static int __init qaic_init(void)
>>   		goto free_pci;
>>   	}
>>   
>> -	ret = sahara_register();
>> -	if (ret) {
>> -		pr_debug("qaic: sahara_register failed %d\n", ret);
>> -		goto free_mhi;
>> -	}
>> -
>>   	ret = qaic_timesync_init();
>>   	if (ret)
>>   		pr_debug("qaic: qaic_timesync_init failed %d\n", ret);
>> @@ -816,7 +809,6 @@ static int __init qaic_init(void)
>>   
>>   free_bootlog:
>>   	qaic_bootlog_unregister();
>> -free_mhi:
>>   	mhi_driver_unregister(&qaic_mhi_driver);
>>   free_pci:
>>   	pci_unregister_driver(&qaic_pci_driver);
>> @@ -845,7 +837,6 @@ static void __exit qaic_exit(void)
>>   	qaic_ras_unregister();
>>   	qaic_bootlog_unregister();
>>   	qaic_timesync_deinit();
>> -	sahara_unregister();
>>   	mhi_driver_unregister(&qaic_mhi_driver);
>>   	pci_unregister_driver(&qaic_pci_driver);
>>   }
>> diff --git a/drivers/accel/qaic/sahara.h b/drivers/accel/qaic/sahara.h
>> deleted file mode 100644
>> index 08037281c80e28f6c85b924c45ce2c2f9dc60c39..0000000000000000000000000000000000000000
>> --- a/drivers/accel/qaic/sahara.h
>> +++ /dev/null
>> @@ -1,10 +0,0 @@
>> -/* SPDX-License-Identifier: GPL-2.0-only */
>> -
>> -/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
>> -
>> -#ifndef __SAHARA_H__
>> -#define __SAHARA_H__
>> -
>> -int sahara_register(void);
>> -void sahara_unregister(void);
>> -#endif /* __SAHARA_H__ */
>> diff --git a/drivers/bus/mhi/host/Makefile b/drivers/bus/mhi/host/Makefile
>> index 2a16008aeb38127494782bbff4e1656428d2b776..2e8949f1a2fe6f3f3b2e1dc541f97d2c393d6a0f 100644
>> --- a/drivers/bus/mhi/host/Makefile
>> +++ b/drivers/bus/mhi/host/Makefile
>> @@ -4,4 +4,4 @@ mhi-$(CONFIG_MHI_BUS_DEBUG) += debugfs.o
>>   
>>   obj-$(CONFIG_MHI_BUS_PCI_GENERIC) += mhi_pci_generic.o
>>   mhi_pci_generic-y += pci_generic.o
>> -obj-y += clients/
>> +obj-$(CONFIG_MHI_BUS) += clients/
>> diff --git a/drivers/bus/mhi/host/clients/Kconfig b/drivers/bus/mhi/host/clients/Kconfig
>> index 8bb5715e61d0d6e64a51012b4e1594ba46e5bfc1..1932344157a5b1dc25c8d63f6d4ac38f896d08a7 100644
>> --- a/drivers/bus/mhi/host/clients/Kconfig
>> +++ b/drivers/bus/mhi/host/clients/Kconfig
>> @@ -15,3 +15,9 @@ config MHI_BUS_LOOPBACK
>>   
>>   	  To compile this driver as a module, choose M here. The module
>>   	  will be called mhi_loopback.
>> +
>> +menu "MHI host client drivers"
>> +
>> +source "drivers/bus/mhi/host/clients/sahara/Kconfig"
>> +
>> +endmenu
>> diff --git a/drivers/bus/mhi/host/clients/Makefile b/drivers/bus/mhi/host/clients/Makefile
>> index 3811b6928f42b38f94b1167941cf3b0fe512d32b..67e70de280369870164b4808f39d9b3340f2589b 100644
>> --- a/drivers/bus/mhi/host/clients/Makefile
>> +++ b/drivers/bus/mhi/host/clients/Makefile
>> @@ -1,2 +1,3 @@
>>   obj-$(CONFIG_MHI_BUS_LOOPBACK) += mhi_loopback.o
>>   mhi_loopback-y += loopback.o
>> +obj-$(CONFIG_MHI_SAHARA) += sahara/
>> diff --git a/drivers/bus/mhi/host/clients/sahara/Kconfig b/drivers/bus/mhi/host/clients/sahara/Kconfig
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..f1fc7013a2dee0be645c50f32305659e591de7e7
>> --- /dev/null
>> +++ b/drivers/bus/mhi/host/clients/sahara/Kconfig
>> @@ -0,0 +1,15 @@
>> +config MHI_SAHARA
>> +	tristate "Sahara protocol driver"
>> +	depends on MHI_BUS
>> +	help
>> +	  Enable support for the Sahara protocol transported over the MHI bus.
>> +
>> +	  The Sahara protocol is used to transfer firmware images, retrieve
>> +	  memory dumps and exchange command mode DDR calibration data between
>> +	  host and device. This driver is not tied to a specific SoC and may be
>> +	  used by multiple MHI based devices.
>> +
>> +	  If unsure, say N.
>> +
>> +	  To compile this driver as a module, choose M here: the module will be
>> +	  called mhi_sahara.
>> diff --git a/drivers/bus/mhi/host/clients/sahara/Makefile b/drivers/bus/mhi/host/clients/sahara/Makefile
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..fc02a25935011cbd7138ea8f24b88cf5b032a4ce
>> --- /dev/null
>> +++ b/drivers/bus/mhi/host/clients/sahara/Makefile
>> @@ -0,0 +1,2 @@
>> +obj-$(CONFIG_MHI_SAHARA) += mhi_sahara.o
>> +mhi_sahara-y := sahara.o
>> diff --git a/drivers/accel/qaic/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
>> similarity index 99%
>> rename from drivers/accel/qaic/sahara.c
>> rename to drivers/bus/mhi/host/clients/sahara/sahara.c
>> index c7c0b3eb4b65fb7776a6c724cb3105046cf6f7eb..dc64beae06ada6915a506ed8f4ae4d71c03158bb 100644
>> --- a/drivers/accel/qaic/sahara.c
>> +++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
>> @@ -1,19 +1,20 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>> -
>> -/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + *
>> + */
> Never delete the copyright lines please.  Is there any previous discussion on why we are doing it?
>
> ---Trilok Soni


Hi Trilok, In Patch 1 series, I was asked to match the style of comment 
matches the subsystem where this driver is moved to. Same has been 
incorporated. This driver was not developed before 2024 and hence kept 
same copyright.


