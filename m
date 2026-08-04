Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1174398EB
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 11:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785842368; cv=none; b=u0w/V9Bcvbq+fLl9UlrKD9GJ2rmkP9e7CjfhEv4iSVDjEMKEXhz7fG+KDemkoMG2wJyYIOsguty2B4nahNRgVerrlJpU+YQKuS3j98qtblukiBiVfxr793bOUjXD1RXeX0c8w0pNQT+x7JyOJvFUKGVuVPMHFNP0GwNruUnJyBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785842368; c=relaxed/simple;
	bh=4po1al0mZT37bH2Nh35vDIJf2Uf46NkUcysFb8b2y20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S5A4LOPs3OKbzLf+nplZac7rMfeyMQ7c9ceD7P/sUaF6Atj42JCHIykd33O5cINbJXDS3nSWbF25SM6yl6v05TViMcX3B74inwb9/kkz56YmhcSCyblOJPY6Sk2zCyaLhkRyP/cPF5K4up0euDeCpFi7h4TXDHfiBLH1EZmmxEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NBo38plj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aBp+HRaP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NBo38plj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aBp+HRaP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748vYug325612
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 11:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C6TtrHinqHZfvkw7qOv/wAGxZVN7KJ246fFw4yNRBHc=; b=NBo38pljtt6C0fT/
	V1kfIoVb4fM6TRnnpQ3XyHPQegoYG7epHZWiGNrA/o/iXtaNUel33yuy2j9MM6wp
	PLkPmm7EwaLGO5gp60mTfiEHWO1V3p6Wcx8qAzg1McMXdPcIdrGVAZwXtRU0YSiQ
	0OYOz8FhStDQyLYC1hQ4MGlMr3HN7tUFIq46WMQV1zfAFSOCCBKxBfK0htQ+tbGQ
	ZaeujykRXcWWGQgrlcGxz7tyeCEv9BJhNbECQLxoTy5Z3TWWCJtvo7QpvmNqe4YJ
	CvL6OYTZB6SeXcj7MflxET9/xkd03voB8vxBv+Ps4jH2ptdZTgn/YdybjILajeve
	YheKfQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fud1dghpg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 11:19:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfa4e4684bso121983215ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 04:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785842365; x=1786447165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C6TtrHinqHZfvkw7qOv/wAGxZVN7KJ246fFw4yNRBHc=;
        b=aBp+HRaPfJ7MICdrv+7iLIwa9XulPNpNqr2JK4hHC6EAaPDjIVAOa+WzubzoCvUdk4
         Jrdmnrb6bfeK+An7+VtsenPur8uiyqrEcybw1kM9HlpzSseUrm68HtqXZig9/Tibvlqd
         W0QUizdm+3MmhKr1eOVx7YaPqWle/rAKFD1YUFRRrVCuur5JeGiqnWnoaffNe0ilGo1U
         08MXFIG6qoxHNRfC+GlpU/h7wPJ3uc6fnh0CY4uqN6fosbSBCHYjrwGYh7v8BWP9xGgf
         YnHPvI0Fu7qAYWHBbTrMVwgpxzwDpJby2qRS3uQDoJhStg4qFnqvanNbOVFYiU1Qfmfk
         4Zpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785842365; x=1786447165;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C6TtrHinqHZfvkw7qOv/wAGxZVN7KJ246fFw4yNRBHc=;
        b=IhCCmaPrUmkZ8A49dKV9cuNhDBB9gBUFH/1pEzWFUDAqB9Cmee1VnO2UOLdYMF02zq
         FVl+cAIAic8ziFrnlcEGYBR3mKQNwlfvDC7QlD1fdu2EzLxZXfMZKh1uJDphNNGiMPOm
         tym94eu2b5fy3rFX4ki86SV9W8ucksqNJSVCZOLL2iKWULEGhMsm4VAALX1e2HtgIslG
         k4tO0TspG/Up0vINSImK8QdxVVrlOgQGwE2lAvEqap96bf5tffVaweGZCyVGjhXtFPbm
         RGjRIOeY6bjo2zQjuA0hD5gq8BV3JmZZFhZVb0bMqBuV09XvEhP9mfPEnUPDXJHvF351
         ESdg==
X-Forwarded-Encrypted: i=1; AHgh+RrDcRfj/fCeRDGdmbqDJxOpu+O0w2k2hobHXkaEeI5muiCXuFyAC4X1s1SIH5tZY0Xpp08uLeV8ZrLMN9tl@vger.kernel.org
X-Gm-Message-State: AOJu0Yw07iGC9wv+M70UIG1K/WZa1EHnlB/khPILtilcal5Nv3RqtfMm
	2Pvp0dnxoKWaMZ94nGP/v5g7AOnSygUOhPE36tNQTTPxfQc2HsF1hNJf5bNnl89DCUaZtj5Xtrz
	yLbgtqL0RboCf5ziA15zjoZC/3Q9ixkhkEQO3Qbm5U+AzjfWQtsybYLf8c9+qxHKOQLLp
X-Gm-Gg: AR+sD13rWb0R1TyX37TKRpQ57SaTWiriuOVbf29IaR+H0i8TbJwR+nXXYZtDJtGoZka
	62ZjBERWE3klKdgM8K0czZeHgwovU8UbXps/jrgvuMBZi9dktVkNwriRnJcpFyBv2cYTiEAqXld
	7TXPlWVA6aiAaqrGM/VqGarGrK1CjkBXl5L9+XeIGg1tpc8X8HGeHY7/r5iLIYj80WuGz/2B3Ti
	UO414XQfJWa9UtYSXXJz61iCaSQwcUyc1xBLauAXAb36IweCMzueSBCny7S6ToDT1uVDGA5GPnr
	EUlKxs5GiAyImldM6hwQUFnhdouh8/zEjSU8mVWAn6nXixIzv0XzZLm88GVxRy2mLdfemOK/06y
	GoymT/Wazydcvy0T/ayw7eqX8CWPAilKprsArUQ==
X-Received: by 2002:a17:903:3d05:b0:2cc:aa36:c046 with SMTP id d9443c01a7336-2d0521d44damr133780665ad.14.1785842364809;
        Tue, 04 Aug 2026 04:19:24 -0700 (PDT)
X-Received: by 2002:a17:903:3d05:b0:2cc:aa36:c046 with SMTP id d9443c01a7336-2d0521d44damr133780195ad.14.1785842364225;
        Tue, 04 Aug 2026 04:19:24 -0700 (PDT)
Received: from [10.151.36.45] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0a9f9078csm5384765ad.14.2026.08.04.04.19.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 04:19:23 -0700 (PDT)
Message-ID: <de961a11-71ab-4642-9ced-5b97f47d7110@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 16:49:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 3/9] remoteproc: qcom: add hexagon based WCSS secure
 PIL driver
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
 <20260803-rproc-v14-3-a1f87b0b0ad2@oss.qualcomm.com>
 <20260803124442.krqtw6si4ujsnuul@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <20260803124442.krqtw6si4ujsnuul@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aPxqH5thVgUQMdiFUVhkHkdNFzD8e8SI
X-Authority-Analysis: v=2.4 cv=SJRykuvH c=1 sm=1 tr=0 ts=6a71cabd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=-UeJRP6P44Y6NUiPy_UA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: aPxqH5thVgUQMdiFUVhkHkdNFzD8e8SI
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA5MCBTYWx0ZWRfX0hdWVRoBQTyk
 P3CNFezpXytu26y6qHHNGCspe3idGXj6okgKb6jSKaCIZjklcRBEm/w4BAFNgzAXU9VHBI/UC1K
 aO3bj090Qvmqys3PV26aq1EjyLpLRkA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA5MCBTYWx0ZWRfX6bF8OSyEtXhh
 VqTdW1oL5++lKSsB8G3MuERDfWJkH6MAo+NpT5E+mphkysorsvR0N21IKk7pfZKmassI6Obm/+t
 eMEmhTBSvCE07MTmexdugjdkqxnjATQiY6KEjtgy2+ixj9j0fKexu2vxgGeHU2ZIa3w9VmFOyc1
 gDE9VnWYuR9Sri+Xh2dbLuWSdWcrm6HnKbiGIWbWdTCKYFxgQoDQggmq7vTBGjp4ugIBYzMnpjs
 2mD3gZl3O3SMPqduvX6S06g2541iTrTRaUcacCQOs1B2niZpZKN4hQacs114LiCmtwNfM99YYpG
 W19WLJousggvd+tfEmCTz8FP4i3BTJL9Cq6IlhLzuARRG9Qslro0/WAlS5DAUtwMxF5Rfb7M6Xn
 Qt40T3BiWId+o+5/VDVDVQjsIFvvH9VGtTguddU0YdMEfQHcHAte62r70wSNd7Nw84UJvvg6P77
 rYoDAiJytD0v3gh33eQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040090



On 8/3/2026 6:14 PM, Mukesh Ojha wrote:
> On Mon, Aug 03, 2026 at 04:16:09PM +0530, Varadarajan Narayanan wrote:
>> From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
>>
>> Add support to bring up hexagon based WCSS using secure PIL. All IPQxxxx
>> SoCs support secure Peripheral Image Loading (PIL).
>>
>> Secure PIL image is signed firmware image which only trusted software such
>> as TrustZone (TZ) can authenticate and load. Linux kernel will send a
>> Peripheral Authentication Service (PAS) request to TZ to authenticate and
>> load the PIL images.
>>
>> In order to avoid overloading the existing WCSS driver or PAS driver, we
>> came up with this new PAS based IPQ WCSS driver.
> 
> Can you tell why you need another driver if you are using the same PAS
> method and it is using more of everything what PAS already
> supports ?
> 

Hi Mukesh,

We just use pas_auth_and_reset and pas_shutdown APIs and do not need
the entire framework provided by the PAS driver for IPQ WCSS.

Also, feedback from Bjorn in [1] was to have separate driver
instead of overloading existing WCSS driver.

[1] https://lore.kernel.org/all/YFK1VpP74rQH2Z72@builder.lan/

>>
>> Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
>> Signed-off-by: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
>> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> [ Dropped ipq5424 support ]
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> 
> 
> Author and tested looks weird..here..

Will drop Tested-by here.

Thanks,
Vignesh
> 
> 
>> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
>> ---
>>  drivers/remoteproc/Kconfig              |  20 ++
>>  drivers/remoteproc/Makefile             |   1 +
>>  drivers/remoteproc/qcom_q6v5_wcss_sec.c | 337 ++++++++++++++++++++++++++++++++
>>  include/linux/remoteproc.h              |   2 +
>>  4 files changed, 360 insertions(+)
>>
>> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
>> index 5b56b2dcc725..3feea5bda129 100644
>> --- a/drivers/remoteproc/Kconfig
>> +++ b/drivers/remoteproc/Kconfig
>> @@ -267,6 +267,26 @@ config QCOM_Q6V5_WCSS
>>  	  Hexagon V5 based WCSS remote processors on e.g. IPQ8074.  This is
>>  	  a non-TrustZone wireless subsystem.
>>  
>> +config QCOM_Q6V5_WCSS_SEC
>> +	tristate "Qualcomm Hexagon based WCSS Secure Peripheral Image Loader"
>> +	depends on OF && ARCH_QCOM
>> +	depends on QCOM_SMEM
>> +	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
>> +	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
>> +	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
>> +	select QCOM_MDT_LOADER
>> +	select QCOM_PIL_INFO
>> +	select QCOM_Q6V5_COMMON
>> +	select QCOM_RPROC_COMMON
>> +	select QCOM_SCM
>> +	help
>> +	  Say y here to support the Qualcomm Secure Peripheral Image Loader
>> +	  for the Hexagon based remote processors on e.g. IPQ5332.
>> +
>> +	  This is TrustZone wireless subsystem. The firmware is
>> +	  verified and booted with the help of the Peripheral Authentication
>> +	  System (PAS) in TrustZone.
>> +
>>  config QCOM_SYSMON
>>  	tristate "Qualcomm sysmon driver"
>>  	depends on RPMSG
>> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
>> index 689686de0d41..f74519ea6502 100644
>> --- a/drivers/remoteproc/Makefile
>> +++ b/drivers/remoteproc/Makefile
>> @@ -29,6 +29,7 @@ obj-$(CONFIG_QCOM_Q6V5_ADSP)		+= qcom_q6v5_adsp.o
>>  obj-$(CONFIG_QCOM_Q6V5_MSS)		+= qcom_q6v5_mss.o
>>  obj-$(CONFIG_QCOM_Q6V5_PAS)		+= qcom_q6v5_pas.o
>>  obj-$(CONFIG_QCOM_Q6V5_WCSS)		+= qcom_q6v5_wcss.o
>> +obj-$(CONFIG_QCOM_Q6V5_WCSS_SEC)	+= qcom_q6v5_wcss_sec.o
>>  obj-$(CONFIG_QCOM_SYSMON)		+= qcom_sysmon.o
>>  obj-$(CONFIG_QCOM_WCNSS_PIL)		+= qcom_wcnss_pil.o
>>  qcom_wcnss_pil-y			+= qcom_wcnss.o
>> diff --git a/drivers/remoteproc/qcom_q6v5_wcss_sec.c b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
>> new file mode 100644
>> index 000000000000..4837825d1717
>> --- /dev/null
>> +++ b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
>> @@ -0,0 +1,337 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +#include <linux/clk.h>
>> +#include <linux/firmware/qcom/qcom_pas.h>
>> +#include <linux/io.h>
>> +#include <linux/mailbox_client.h>
>> +#include <linux/of_reserved_mem.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/soc/qcom/mdt_loader.h>
>> +
>> +#include "qcom_common.h"
>> +#include "qcom_q6v5.h"
>> +#include "qcom_pil_info.h"
>> +
>> +#define WCSS_CRASH_REASON		421
>> +
>> +#define WCSS_PAS_ID			0x6
>> +#define MPD_WCSS_PAS_ID			0xd
>> +
>> +#define Q6_WAIT_TIMEOUT			(5 * HZ)
>> +
>> +struct wcss_sec {
>> +	struct device *dev;
>> +	struct qcom_rproc_glink glink_subdev;
>> +	struct qcom_rproc_ssr ssr_subdev;
>> +	struct qcom_q6v5 q6;
>> +	phys_addr_t mem_phys;
>> +	phys_addr_t mem_reloc;
>> +	void *mem_region;
>> +	size_t mem_size;
>> +	const struct wcss_data *desc;
>> +};
>> +
>> +struct wcss_data {
>> +	u32 pasid;
>> +	const char *ss_name;
>> +	bool auto_boot;
>> +};
>> +
>> +static int wcss_sec_start(struct rproc *rproc)
>> +{
>> +	struct wcss_sec *wcss = rproc->priv;
>> +	struct device *dev = wcss->dev;
>> +	int ret;
>> +
>> +	ret = qcom_q6v5_prepare(&wcss->q6);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = qcom_pas_auth_and_reset(wcss->desc->pasid);
>> +	if (ret) {
>> +		dev_err(dev, "wcss_reset failed\n");
>> +		goto unprepare;
>> +	}
>> +
>> +	ret = qcom_q6v5_wait_for_start(&wcss->q6, msecs_to_jiffies(Q6_WAIT_TIMEOUT));
>> +
>> +	if (ret == -ETIMEDOUT) {
>> +		dev_err(dev, "start timed out\n");
>> +		qcom_pas_shutdown(wcss->desc->pasid);
>> +		goto unprepare;
>> +	}
>> +
>> +	return 0;
>> +
>> +unprepare:
>> +	qcom_q6v5_unprepare(&wcss->q6);
>> +
>> +	return ret;
>> +}
>> +
>> +static int wcss_sec_stop(struct rproc *rproc)
>> +{
>> +	struct wcss_sec *wcss = rproc->priv;
>> +	struct device *dev = wcss->dev;
>> +	int ret;
>> +
>> +	ret = qcom_q6v5_request_stop(&wcss->q6, NULL);
>> +	if (ret == -ETIMEDOUT)
>> +		dev_err(dev, "timed out on wait\n");
>> +
>> +	ret = qcom_pas_shutdown(wcss->desc->pasid);
>> +	if (ret)
>> +		dev_err(dev, "Failed to shutdown %d\n", ret);
>> +
>> +	qcom_q6v5_unprepare(&wcss->q6);
>> +
>> +	return ret;
>> +}
>> +
>> +static void *wcss_sec_da_to_va(struct rproc *rproc, u64 da, size_t len,
>> +			       bool *is_iomem)
>> +{
>> +	struct wcss_sec *wcss = rproc->priv;
>> +	int offset;
>> +
>> +	offset = da - wcss->mem_reloc;
>> +	if (offset < 0 || offset + len > wcss->mem_size)
>> +		return NULL;
>> +
>> +	if (is_iomem)
>> +		*is_iomem = true;
>> +
>> +	return wcss->mem_region + offset;
>> +}
>> +
>> +static int wcss_sec_load(struct rproc *rproc, const struct firmware *fw)
>> +{
>> +	struct wcss_sec *wcss = rproc->priv;
>> +	struct device *dev = wcss->dev;
>> +	int ret;
>> +
>> +	ret = qcom_mdt_load(dev, fw, rproc->firmware, wcss->desc->pasid, wcss->mem_region,
>> +			    wcss->mem_phys, wcss->mem_size, &wcss->mem_reloc);
>> +	if (ret)
>> +		return ret;
>> +
>> +	qcom_pil_info_store("wcss", wcss->mem_phys, wcss->mem_size);
>> +
>> +	return 0;
>> +}
>> +
>> +static unsigned long wcss_sec_panic(struct rproc *rproc)
>> +{
>> +	struct wcss_sec *wcss = rproc->priv;
>> +
>> +	return qcom_q6v5_panic(&wcss->q6);
>> +}
>> +
>> +static void wcss_sec_copy_segment(struct rproc *rproc,
>> +				  struct rproc_dump_segment *segment,
>> +				  void *dest, size_t offset, size_t size)
>> +{
>> +	struct wcss_sec *wcss = rproc->priv;
>> +	struct device *dev = wcss->dev;
>> +
>> +	if (!segment->io_ptr)
>> +		segment->io_ptr = ioremap_wc(segment->da, segment->size);
>> +
>> +	if (!segment->io_ptr) {
>> +		dev_err(dev, "Failed to ioremap segment %pad size 0x%zx\n",
>> +			&segment->da, segment->size);
>> +		return;
>> +	}
>> +
>> +	if (offset + size <= segment->size) {
>> +		memcpy_fromio(dest, segment->io_ptr + offset, size);
>> +	} else {
>> +		iounmap(segment->io_ptr);
>> +		segment->io_ptr = NULL;
>> +	}
>> +}
>> +
>> +static int wcss_sec_dump_segments(struct rproc *rproc,
>> +				  const struct firmware *fw)
>> +{
>> +	struct device *dev = rproc->dev.parent;
>> +	struct reserved_mem *rmem = NULL;
>> +	struct device_node *node;
>> +	int num_segs, index;
>> +	int ret;
>> +
>> +	/*
>> +	 * Parse through additional reserved memory regions for the rproc
>> +	 * and add them to the coredump segments
>> +	 */
>> +	num_segs = of_count_phandle_with_args(dev->of_node,
>> +					      "memory-region", NULL);
>> +	for (index = 0; index < num_segs; index++) {
>> +		node = of_parse_phandle(dev->of_node,
>> +					"memory-region", index);
>> +		if (!node)
>> +			return -EINVAL;
>> +
>> +		rmem = of_reserved_mem_lookup(node);
>> +		of_node_put(node);
>> +		if (!rmem) {
>> +			dev_err(dev, "unable to acquire memory-region index %d num_segs %d\n",
>> +				index, num_segs);
>> +			return -EINVAL;
>> +		}
>> +
>> +		dev_dbg(dev, "Adding segment 0x%pa size 0x%pa",
>> +			&rmem->base, &rmem->size);
>> +		ret = rproc_coredump_add_custom_segment(rproc,
>> +							rmem->base,
>> +							rmem->size,
>> +							wcss_sec_copy_segment,
>> +							NULL);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct rproc_ops wcss_sec_ops = {
>> +	.start = wcss_sec_start,
>> +	.stop = wcss_sec_stop,
>> +	.da_to_va = wcss_sec_da_to_va,
>> +	.load = wcss_sec_load,
>> +	.get_boot_addr = rproc_elf_get_boot_addr,
>> +	.panic = wcss_sec_panic,
>> +	.parse_fw = wcss_sec_dump_segments,
>> +};
>> +
>> +static int wcss_sec_alloc_memory_region(struct wcss_sec *wcss)
>> +{
>> +	struct device *dev = wcss->dev;
>> +	struct resource res;
>> +	int ret;
>> +
>> +	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
>> +	if (ret) {
>> +		dev_err(dev, "unable to acquire memory-region resource\n");
>> +		return ret;
>> +	}
>> +
>> +	wcss->mem_phys = res.start;
>> +	wcss->mem_reloc = res.start;
>> +	wcss->mem_size = resource_size(&res);
>> +	wcss->mem_region = devm_ioremap_resource_wc(dev, &res);
>> +	if (IS_ERR(wcss->mem_region)) {
>> +		dev_err(dev, "unable to map memory region: %pR\n", &res);
>> +		return PTR_ERR(wcss->mem_region);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int wcss_sec_probe(struct platform_device *pdev)
>> +{
>> +	const struct wcss_data *desc = of_device_get_match_data(&pdev->dev);
>> +	const char *fw_name = NULL;
>> +	struct wcss_sec *wcss;
>> +	struct clk *sleep_clk;
>> +	struct clk *int_clk;
>> +	struct rproc *rproc;
>> +	int ret;
>> +
>> +	ret = of_property_read_string(pdev->dev.of_node, "firmware-name",
>> +				      &fw_name);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	rproc = devm_rproc_alloc(&pdev->dev, desc->ss_name, &wcss_sec_ops,
>> +				 fw_name, sizeof(*wcss));
>> +	if (!rproc) {
>> +		dev_err(&pdev->dev, "failed to allocate rproc\n");
>> +		return -ENOMEM;
>> +	}
>> +
>> +	wcss = rproc->priv;
>> +	wcss->dev = &pdev->dev;
>> +	wcss->desc = desc;
>> +
>> +	ret = wcss_sec_alloc_memory_region(wcss);
>> +	if (ret)
>> +		return ret;
>> +
>> +	sleep_clk = devm_clk_get_optional_enabled(&pdev->dev, "sleep");
>> +	if (IS_ERR(sleep_clk))
>> +		return dev_err_probe(&pdev->dev, PTR_ERR(sleep_clk),
>> +				     "Failed to get sleep clock\n");
>> +
>> +	int_clk = devm_clk_get_optional_enabled(&pdev->dev, "interconnect");
>> +	if (IS_ERR(int_clk))
>> +		return dev_err_probe(&pdev->dev, PTR_ERR(int_clk),
>> +				     "Failed to get interconnect clock\n");
>> +
>> +	ret = qcom_q6v5_init(&wcss->q6, pdev, rproc,
>> +			     WCSS_CRASH_REASON, NULL, NULL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	qcom_add_glink_subdev(rproc, &wcss->glink_subdev, desc->ss_name);
>> +	qcom_add_ssr_subdev(rproc, &wcss->ssr_subdev, desc->ss_name);
>> +
>> +	rproc->auto_boot = desc->auto_boot;
>> +	rproc->dump_conf = RPROC_COREDUMP_INLINE;
>> +	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
>> +
>> +	ret = devm_rproc_add(&pdev->dev, rproc);
>> +	if (ret) {
>> +		qcom_remove_ssr_subdev(rproc, &wcss->ssr_subdev);
>> +		qcom_remove_glink_subdev(rproc, &wcss->glink_subdev);
>> +		qcom_q6v5_deinit(&wcss->q6);
>> +		return ret;
>> +	}
>> +
>> +	platform_set_drvdata(pdev, rproc);
>> +
>> +	return 0;
>> +}
>> +
>> +static void wcss_sec_remove(struct platform_device *pdev)
>> +{
>> +	struct rproc *rproc = platform_get_drvdata(pdev);
>> +	struct wcss_sec *wcss = rproc->priv;
>> +
>> +	qcom_remove_ssr_subdev(rproc, &wcss->ssr_subdev);
>> +	qcom_remove_glink_subdev(rproc, &wcss->glink_subdev);
>> +	qcom_q6v5_deinit(&wcss->q6);
>> +}
>> +
>> +static const struct wcss_data wcss_sec_ipq5332_res_init = {
>> +	.pasid = MPD_WCSS_PAS_ID,
>> +	.ss_name = "q6wcss",
>> +};
>> +
>> +static const struct wcss_data wcss_sec_ipq9574_res_init = {
>> +	.pasid = WCSS_PAS_ID,
>> +	.ss_name = "q6wcss",
>> +};
>> +
>> +static const struct of_device_id wcss_sec_of_match[] = {
>> +	{ .compatible = "qcom,ipq5018-wcss-sec-pil", .data = &wcss_sec_ipq5332_res_init },
>> +	{ .compatible = "qcom,ipq5332-wcss-sec-pil", .data = &wcss_sec_ipq5332_res_init },
>> +	{ .compatible = "qcom,ipq9574-wcss-sec-pil", .data = &wcss_sec_ipq9574_res_init },
>> +	{ },
>> +};
>> +MODULE_DEVICE_TABLE(of, wcss_sec_of_match);
>> +
>> +static struct platform_driver wcss_sec_driver = {
>> +	.probe = wcss_sec_probe,
>> +	.remove = wcss_sec_remove,
>> +	.driver = {
>> +		.name = "qcom-wcss-secure-pil",
>> +		.of_match_table = wcss_sec_of_match,
>> +	},
>> +};
>> +module_platform_driver(wcss_sec_driver);
>> +
>> +MODULE_DESCRIPTION("Hexagon WCSS Secure Peripheral Image Loader");
>> +MODULE_LICENSE("GPL");
>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>> index ef711a5b1a7f..cf06b9846309 100644
>> --- a/include/linux/remoteproc.h
>> +++ b/include/linux/remoteproc.h
>> @@ -204,6 +204,7 @@ enum rproc_dump_mechanism {
>>   * @node:	list node related to the rproc segment list
>>   * @da:		device address of the segment
>>   * @size:	size of the segment
>> + * @io_ptr:	ptr to store the ioremapped dump segment
>>   * @priv:	private data associated with the dump_segment
>>   * @dump:	custom dump function to fill device memory segment associated
>>   *		with coredump
>> @@ -215,6 +216,7 @@ struct rproc_dump_segment {
>>  	dma_addr_t da;
>>  	size_t size;
>>  
>> +	void __iomem *io_ptr;
>>  	void *priv;
>>  	void (*dump)(struct rproc *rproc, struct rproc_dump_segment *segment,
>>  		     void *dest, size_t offset, size_t size);
>>
>> -- 
>> 2.34.1
>>
> 

