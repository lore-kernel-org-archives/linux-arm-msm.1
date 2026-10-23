Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792739264;
	b=47hAXQQOPsb6tnsLy+/UNLuW5X1A94pfmF5Y/h/zt+hrwZ/9BSJwg+HNMlakz6dtDImu
	 QZuxn1NxCviYA9L0gLiUK87Jcxebjs1RU3sypK++0/Q8B8PeKz4mko/zdwOA6ER0yMXn5
	 P2RfdKPhpuuGl/INQMbDV67FjdpCsYD2vGG4DmC9EkXGnhWUy1sTnFDz1Bd0mX9YRh407
	 SfX7psd4xvyuGqDuROMDMFSWve1He71Ixu3uFsav9SAqCulQ2eHRjoTaelNIbC3Vfq0PL
	 g3UF4SfsYisU2b+G0mz9xi85FmfCefYR4dwAEYOrbRJJHdseNVKVJXVIbWGt6g1JUqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792739264;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 X-Google-Original-From:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W0j3DK1pQyRPHV5eNDN30+zBgsEig8/8mLkHDbB34mQ=;
	b=OUsoTFbCwMJ8tfqJb8+ZYnKLI1RGW8ZnV/9TvTflrxfta8UFo1JqwcyBxmpOplwfO+XF
	 O69t6msLGAlKeGx/BxdFwcNf9JdRUR2lxiAmFnvdEvB9Qa7yMRydaOcg/czAewp8qwquP
	 iNZqYUpJmxYt1KGrE3hBHrzke7DOngYKatXqfw4YCs3JurhKnq7KfyxaFUlrwC5WKzatG
	 tgAoGNApW18tzowR2DZVUFJ/n+tqjzQb1Yb6ojOo+APf2rel4mq1V4hfpcQBPs9r5c1X6
	 nAruot1OL/6yw6tkwUf4KG3H6WuLeMyDEu9D5W7fA7OkPCRLRHsJkR4ZoN1fDMPWqJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BisFdoEF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=buV6q46I;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844E9606A31D
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 844E9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BisFdoEF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=buV6q46I
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1EvSh772906
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W0j3DK1pQyRPHV5eNDN30+zBgsEig8/8mLkHDbB34mQ=; b=BisFdoEFJm80HS13
	1bxTNVVpGPZC3Lr4L0VQhHBXGzygWzq/fSYYUBaKAlHKM3CRuy8AigPGskINW1Ct
	DUT4ZACdoWdQkTSWdRC9oUyZmZPR+Sv/9fd3ZdXdHEcD7NQ2yzASkruOz7yOrOYy
	SGMoPQkcONkc90O9oNCOLJqnCn1Y5bQHonoOlJZQsfZrugxoz5E4vKIDDQTZf6jw
	ozttfF1Qd4BGGQvc9FaNSTSpTHh582G9/Mx/xb++SeNANvP0dSYiEnSk0IRsetfb
	VeH4ZEmVMfOimq46Bnt3NyBM/tkOn7Tpk4WL/RpiFn1/E9ZLvsz1bLCa4q0Mrn8v
	WekSnw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmttcsv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:07:42 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd8b299b0abso385104a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 00:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792739262; x=1793344062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W0j3DK1pQyRPHV5eNDN30+zBgsEig8/8mLkHDbB34mQ=;
        b=buV6q46I7oHpE+/lgG0YKwRyyaQGtifMD1Rcg0BTXDLGCnOUhLVG8AY5DqeBB4KW+q
         sFKnni628E8h8WyvYeJqr74YtTReuNap6pEUKsQaRz733WtXshQ+vTv+Cn7fRhQeYiN3
         yy+pJ8gXx7i0d3ZoN5dy0aVjnoWQZz8oVupHRMT+eQIp3PSDLlKZXqxt8MvbwyZAV3fI
         txJYoDVSDCfkeu9D1bYjvz+pJunT9BsieYNalgNGZ7flnVI++VG1UUjw/rBvSexAKQff
         KmyLC+33uqeYHSVwMxdbhs6+kwZqFTpICv+6SVmtf+yk/g+O2VgRCOXdLnXr0gkpvuDr
         YCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792739262; x=1793344062;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W0j3DK1pQyRPHV5eNDN30+zBgsEig8/8mLkHDbB34mQ=;
        b=ldpeo/6K5FbcodEz4EgYH5vAB3wDzfniuHo/+xxiPjHIcYtMV2hhOouMGrTk4c0+Xu
         1st/2PYjWfPQ+6OwlvBGGarM/e18Lp0QUcdAlpaP8cQb+FPu5FCAUSBqZ8fqXThFRNvB
         djP514da8YrX+eDzueTQjs2PfhOUQgqj9HVdb6S9i9L/LoFNzIEvLE8q8tM7PfHQBnLk
         xPGWg2uIw53Y8Nk+hIRuHNwVFZ3p/OQQyhaAmlIrK1JkLOazFjt/xG1ortGjslFnW5EQ
         +7dfTMkYCOxSOrNqHMLzLbzCvjdbjQkdfdKvUnwSkWRgl+TQARn1Yjs7lu5eOOUsRNRT
         00mg==
X-Forwarded-Encrypted: i=1; AKwUvBzoQQofiB6qok9DxMYCr7X2kt6e4dd6Irv+bJV1Xp8a7VNITOpGkgyNmWghTXWJk9654jbTvQ4R5tdSEfa+@vger.kernel.org
X-Gm-Message-State: AFq9FYKW2PnZ3akZFckUCD1RMogL+/OUYT67nZUt47lnJEa9IuZVm0Yk
	ljg1Cyplobfr35BZWIMh2GhSdc6FYXbb9/sEzV5KWmC/gjuLDiGIABTD3U/K5056iXUi5izwORG
	6ze5xSAEu5W583KFb54RcXTjHtTAUhnJOKEdjqe4Jrh5iLjIXGFVb3T1KK3dpwdgPrrW9
X-Gm-Gg: AYBFou3pKGbbU7G7QQ0c+L8k6cRrpmnEG7f8qjJolxCF1qOVCSttBie0MDSWCC1fgSU
	NlUlbv6DDSdhTpxO9iVqPIrK0IMgN3BoEt/aoaLtwTN7PnyY0sQ2+Rl6vZWx6BsGECCMVhkbtTo
	bCO4YwPPcUCmzgvbPPNLUkHGb17T0fby+b810/cl9E6THpAezlPqGfZRGsoqSwKSx6y8TF+h1wa
	8yGm+7yHDEV0ITh7bn6ymed5eRoSsVPKEfGVguhOoqL8BYeOI4pQ50w7QalcMUpLNpnobpHNxmY
	uiNDoqxy8uA9MQuVm6I3jP7eccar60Z7dssSgAyMq6zYi6Bb7lGOM3LQWaJSZTYWB5+GfTjGP47
	PgIzi0uEfhwdEQdlCF2wz4MH+QpsuZjPR1g==
X-Received: by 2002:a17:90b:510a:b0:3ac:9176:e82b with SMTP id 98e67ed59e1d1-3adce0d645cmr1126022a91.54.1792739261847;
        Fri, 23 Oct 2026 00:07:41 -0700 (PDT)
X-Received: by 2002:a17:90b:510a:b0:3ac:9176:e82b with SMTP id 98e67ed59e1d1-3adce0d645cmr1125984a91.54.1792739261260;
        Fri, 23 Oct 2026 00:07:41 -0700 (PDT)
Received: from [10.204.79.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada49366fdsm7417920a91.14.2026.10.23.00.07.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 00:07:40 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Google-Original-From: Jayant Shekhar <jshekhar.shekhar@oss.qualcomm.com>
Message-ID: <db88a83c-29e6-4fb9-a874-15c0f186e14d@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:37:30 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] drm/msm/dcp: Add IPCC power notification
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
 <20261015-jshekhar-drm-msm-dcp-v1-v1-4-48aad0fe4f72@oss.qualcomm.com>
 <u7pcn75yh435vuuwqezml37bqfzdztvrywggbmkydkilwe5yzp@myijo4wd2bob>
Content-Language: en-US
In-Reply-To: <u7pcn75yh435vuuwqezml37bqfzdztvrywggbmkydkilwe5yzp@myijo4wd2bob>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb07be cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=8T9rNCmtLWH8V0CgYQwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: VRQM8lgH7jqqYBCniQDXHIM4JoZyYX-W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyOCBTYWx0ZWRfX2J8zXurMVL0l
 4ZVYYfmSVmCiXqGITnV2f8MQmtmFkmoWPNrAyLvXpX7kNVYDZ9Mq+0l8/+TAOuBcHNmiT0GhOhA
 oiPPglmV+eAA9HGsLGeL6MfnpaCYx2C/oEDrQT4R0BrJE5wDiGdgn1DPedtceVRt1J86ZMs0Vew
 3RWgmFeATz0vOcuTMreC/aYvp8ecnbZiJ/bkQmveadG35+Z/U0uwohMLvOnkIlynVNaHg3Ip6CT
 FmXqUfMAUeyaQN5kMlgsqCd+puMYWb9ve1mAZCwjye53FEImJYOVtDDSPEzRkOKW/SaqLrxYL6Y
 5ZOUxll7ZsMs2Sei2bOUdoe0n6NaF8j4TdZdrRkdbx9huMObuPMdPmp0CYNIilJS2z0RGlFBpUk
 bGuPMirMg0ErrdALhwwQYcgKiwSF0m+AiPqBOsEYayGFwNNzE3UUaEJTWrj5osNrUj+LCZTsFuK
 VyK3uObnZA8f8q+zlIg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyOCBTYWx0ZWRfX+LZlOhKz8bhj
 WkaQhKNWd1Str0Mh0nic6jPYzYMkut37eRzHrwojpCbApU9TQsZ78/9+1nSfh9tJ3x9fnJq8Qp/
 wZlVhaEuM7MRetk0QZP4BNbBDIkustE=
X-Proofpoint-ORIG-GUID: VRQM8lgH7jqqYBCniQDXHIM4JoZyYX-W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230028


On 15-10-2026 18:12, Dmitry Baryshkov wrote:
> On Thu, Oct 15, 2026 at 01:08:24PM +0530, Jayant Shekhar wrote:
>> DCP may be power-collapsed while the VirtIO transport remains available.
>> The host therefore needs the platform IPCC channel to wake the firmware and
>> to receive notification that it can service HFI queues.
> Is it allowed per the VirtIO spec?
>

As we discussed, its not compatible, will address in v2.


>> Add the IPCC mailbox client and power-notify interrupt handling. Wake DCP
>> before VirtIO queue activity, wait for the firmware acknowledgment, and
>> notify the response queue when the IPCC receive path completes.
> Don't describe patch contents. Describe your design decisions. The
> reasons for the flags, init/deinit functions, etc.
>
>> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
>> Assisted-by: LLM
>> ---
>>   drivers/gpu/drm/msm/Makefile       |   1 +
>>   drivers/gpu/drm/msm/dcp/dcp_drv.h  |   1 +
>>   drivers/gpu/drm/msm/dcp/dcp_ipcc.c | 212 +++++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/dcp/dcp_ipcc.h |  56 ++++++++++
>>   4 files changed, 270 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
>> index bdc34babfc21..4195bc0e1fc9 100644
>> --- a/drivers/gpu/drm/msm/Makefile
>> +++ b/drivers/gpu/drm/msm/Makefile
>> @@ -71,6 +71,7 @@ msm-display-$(CONFIG_DRM_MSM_MDP5) += \
>>   
>>   msm-display-$(CONFIG_DRM_MSM_DCP) += \
>>   	dcp/dcp_hfi_core.o \
>> +	dcp/dcp_ipcc.o \
>>   	dcp/hfi/hfi_packer.o \
>>   	dcp/hfi/hfi_unpacker.o \
>>   	dcp/hfi/hfi_utils.o
>> diff --git a/drivers/gpu/drm/msm/dcp/dcp_drv.h b/drivers/gpu/drm/msm/dcp/dcp_drv.h
>> index bf6c34af43a0..af2db3cf9066 100644
>> --- a/drivers/gpu/drm/msm/dcp/dcp_drv.h
>> +++ b/drivers/gpu/drm/msm/dcp/dcp_drv.h
>> @@ -13,6 +13,7 @@
>>   #include <linux/virtio.h>
>>   
>>   #include "dcp_hfi.h"
>> +#include "dcp_ipcc.h"
>>   
>>   struct dcp_dpu_kms;
>>   
>> diff --git a/drivers/gpu/drm/msm/dcp/dcp_ipcc.c b/drivers/gpu/drm/msm/dcp/dcp_ipcc.c
>> new file mode 100644
>> index 000000000000..e60a3ecbe3d8
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/dcp/dcp_ipcc.c
>> @@ -0,0 +1,212 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + *
>> + * DCP IPCC power-notify mailbox client.
>> + *
>> + * The APSS-to-DCP channel must be signaled before a VirtIO queue kick.
>> + */
>> +
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/jiffies.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/mailbox_client.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of_irq.h>
>> +#include <linux/string.h>
>> +#include <linux/virtio.h>
>> +
>> +#include "dcp_ipcc.h"
>> +
>> +#define DCP_IPCC_POWER_NOTIFY_TIMEOUT_MS	10000
>> +
>> +static void dcp_ipcc_handle_rx(struct dcp_ipcc *ipcc)
>> +{
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&ipcc->state_lock, flags);
>> +	if (ipcc->shutting_down) {
>> +		spin_unlock_irqrestore(&ipcc->state_lock, flags);
>> +		return;
>> +	}
>> +
>> +	if (atomic_xchg(&ipcc->power_notify_pending, 0))
>> +		complete(&ipcc->power_notify_done);
> Can there be more than one power notification pending? Can't we just
> call complete() here?
>
>> +
>> +	if (ipcc->resp_vq && virtqueue_kick_prepare(ipcc->resp_vq))
>> +		virtqueue_notify(ipcc->resp_vq);
>> +	spin_unlock_irqrestore(&ipcc->state_lock, flags);
>> +}
>> +
>> +static irqreturn_t dcp_ipcc_power_notify_irq(int irq, void *data)
>> +{
>> +	struct dcp_ipcc *ipcc = data;
>> +
>> +	dcp_ipcc_handle_rx(ipcc);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static void dcp_ipcc_rx_callback(struct mbox_client *cl, void *data)
>> +{
>> +	struct dcp_ipcc *ipcc = container_of(cl, struct dcp_ipcc, client);
>> +
>> +	dcp_ipcc_handle_rx(ipcc);
>> +}
>> +
>> +int dcp_ipcc_init(struct dcp_ipcc *ipcc, struct device *dev)
>> +{
>> +	int irq, ret;
>> +
>> +	if (!ipcc || !dev)
>> +		return -EINVAL;
>> +
>> +	memset(ipcc, 0, sizeof(*ipcc));
>> +	init_completion(&ipcc->power_notify_done);
>> +	mutex_init(&ipcc->power_notify_lock);
>> +	spin_lock_init(&ipcc->state_lock);
>> +	atomic_set(&ipcc->power_notify_pending, 0);
>> +
>> +	ipcc->client.dev          = dev;
>> +	ipcc->client.tx_block     = false;
>> +	ipcc->client.tx_tout      = 0;
>> +	ipcc->client.knows_txdone = true;
>> +	ipcc->client.rx_callback  = dcp_ipcc_rx_callback;
>> +
>> +	ipcc->power_chan = mbox_request_channel_byname(&ipcc->client,
>> +						       "dcp-power-tx");
>> +	if (IS_ERR(ipcc->power_chan)) {
>> +		ret = PTR_ERR(ipcc->power_chan);
>> +		ipcc->power_chan = NULL;
>> +		if (ret != -EPROBE_DEFER)
>> +			dev_err(dev, "IPCC: failed to get 'dcp-power-tx': %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	irq = of_irq_get_byname(dev->of_node, "dcp_power_notify_irq");
>> +	if (irq <= 0) {
>> +		ret = irq ? irq : -EINVAL;
>> +		ret = dev_err_probe(dev, ret,
>> +				    "failed to get required power notify IRQ\n");
>> +		goto err_free_channel;
>> +	}
>> +
>> +	ret = request_irq(irq, dcp_ipcc_power_notify_irq,
>> +			  0, "dcp-power-notify", ipcc);
>> +	if (ret) {
>> +		ret = dev_err_probe(dev, ret,
>> +				    "failed to request power notify IRQ %d\n", irq);
>> +		goto err_free_channel;
>> +	}
>> +	ipcc->power_notify_irq = irq;
>> +
>> +	ret = enable_irq_wake(irq);
> This is typically called from the suspend callback. Why are you calling
> it in init path?
>
>> +	if (ret) {
>> +		dev_err(dev, "failed to enable power notify IRQ wake: %d\n", ret);
>> +		goto err_free_irq;
>> +	}
>> +	ipcc->power_notify_irq_wake = true;
>> +
>> +	return 0;
>> +
>> +err_free_irq:
>> +	free_irq(irq, ipcc);
>> +	ipcc->power_notify_irq = 0;
>> +err_free_channel:
>> +	mbox_free_channel(ipcc->power_chan);
>> +	ipcc->power_chan = NULL;
>> +	return ret;
>> +}
>> +
>> +void dcp_ipcc_set_resp_vq(struct dcp_ipcc *ipcc, struct virtqueue *resp_vq)
>> +{
>> +	unsigned long flags;
>> +
>> +	if (!ipcc)
>> +		return;
>> +
>> +	spin_lock_irqsave(&ipcc->state_lock, flags);
>> +	if (!ipcc->shutting_down)
>> +		ipcc->resp_vq = resp_vq;
>> +	spin_unlock_irqrestore(&ipcc->state_lock, flags);
>> +}
>> +
>> +void dcp_ipcc_deinit(struct dcp_ipcc *ipcc)
>> +{
>> +	struct mbox_chan *power_chan;
>> +	int irq;
>> +	bool irq_wake;
>> +	unsigned long flags;
>> +
>> +	if (!ipcc)
>> +		return;
> Oh, you again ignored the feedback. Can ipcc be NULL here? What would
> that mean?
>
>> +
>> +	mutex_lock(&ipcc->power_notify_lock);
>> +	spin_lock_irqsave(&ipcc->state_lock, flags);
>> +	ipcc->shutting_down = true;
>> +	ipcc->resp_vq = NULL;
>> +	irq = ipcc->power_notify_irq;
>> +	ipcc->power_notify_irq = 0;
>> +	irq_wake = ipcc->power_notify_irq_wake;
>> +	ipcc->power_notify_irq_wake = false;
>> +	power_chan = ipcc->power_chan;
>> +	ipcc->power_chan = NULL;
>> +	spin_unlock_irqrestore(&ipcc->state_lock, flags);
> Ugh. No.
>
>> +
>> +	if (irq > 0) {
> Can it be 0 here?
>
>> +		disable_irq(irq);
> What for?
>
>> +		if (irq_wake)
>> +			disable_irq_wake(irq);
> It is enabled at this point. Drop the useless flags.
>
>> +		free_irq(irq, ipcc);
> We have devm_foo() functions to simplify the teardown. Can we use them
> here?
>

All of above comments to be addressed in v2.


>> +	}
>> +	if (power_chan)
>> +		mbox_free_channel(power_chan);
>> +	mutex_unlock(&ipcc->power_notify_lock);
>> +}
>> +
>> +int dcp_ipcc_send_power_notify(struct dcp_ipcc *ipcc)
>> +{
>> +	unsigned long flags, timeout;
>> +	int ret;
>> +
>> +	if (!ipcc)
>> +		return -ENODEV;
>> +
>> +	/* Wait for the doorbell acknowledgment before returning to VirtIO. */
>> +	mutex_lock(&ipcc->power_notify_lock);
>> +	spin_lock_irqsave(&ipcc->state_lock, flags);
>> +	if (ipcc->shutting_down || !ipcc->power_chan) {
>> +		spin_unlock_irqrestore(&ipcc->state_lock, flags);
>> +		ret = -ENODEV;
>> +		goto out_unlock;
>> +	}
>> +	spin_unlock_irqrestore(&ipcc->state_lock, flags);
>> +
>> +	reinit_completion(&ipcc->power_notify_done);
>> +	atomic_set(&ipcc->power_notify_pending, 1);
>> +
>> +	ret = mbox_send_message(ipcc->power_chan, NULL);
>> +	mbox_client_txdone(ipcc->power_chan, ret);
>> +	if (ret < 0) {
>> +		atomic_set(&ipcc->power_notify_pending, 0);
>> +		dev_err(ipcc->client.dev,
>> +			"IPCC TX: power notify failed: %d\n", ret);
>> +		goto out_unlock;
>> +	}
>> +
>> +	timeout = wait_for_completion_timeout(&ipcc->power_notify_done,
>> +					      msecs_to_jiffies(DCP_IPCC_POWER_NOTIFY_TIMEOUT_MS));
>> +	atomic_set(&ipcc->power_notify_pending, 0);
>> +	if (!timeout) {
>> +		dev_err(ipcc->client.dev,
>> +			"IPCC power notify acknowledgment timed out\n");
>> +		ret = -ETIMEDOUT;
>> +	} else {
>> +		ret = 0;
>> +	}
>> +
>> +out_unlock:
>> +	mutex_unlock(&ipcc->power_notify_lock);
>> +	return ret;
>> +}
>> diff --git a/drivers/gpu/drm/msm/dcp/dcp_ipcc.h b/drivers/gpu/drm/msm/dcp/dcp_ipcc.h
>> new file mode 100644
>> index 000000000000..a3430e5cbe72
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/dcp/dcp_ipcc.h
>> @@ -0,0 +1,56 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + *
>> + * IPCC power-notify mailbox interface for DCP firmware.
>> + *
>> + * Channel 5 carries APSS-to-DCP wake notifications; responses arrive through
>> + * the mailbox client's RX callback.
>> + */
>> +
>> +#ifndef __DCP_IPCC_H__
>> +#define __DCP_IPCC_H__
>> +
>> +#include <linux/atomic.h>
>> +#include <linux/completion.h>
>> +#include <linux/mailbox_client.h>
>> +#include <linux/mutex.h>
>> +#include <linux/spinlock.h>
>> +
>> +struct device;
>> +struct virtqueue;
>> +
>> +/**
>> + * struct dcp_ipcc - DCP IPCC power-notification state
>> + * @client: Mailbox client used for APSS-to-DCP notifications.
>> + * @power_chan: Mailbox channel carrying power notifications.
>> + * @resp_vq: VirtIO response queue notified by the IPCC receive path.
>> + * @power_notify_done: Completion for the firmware acknowledgment.
>> + * @power_notify_lock: Serializes power notifications and teardown.
>> + * @power_notify_pending: Indicates an outstanding acknowledgment.
>> + * @state_lock: Protects shutdown state and response queue access.
>> + * @shutting_down: Prevents callbacks from accessing teardown state.
> What is going to access it during teardown? Can we shutdown in a logical
> way, so that there are no accessors after starting the teardown?
>

The access can come from dcp_ipcc_handle_rx(), which is invoked by 
either the power-notify IRQ handler or the mailbox RX callback. An RX 
callback may already be running when teardown begins. Without 
protection, it could complete power_notify_done or notify resp_vq after 
the queue has been detached.


>> + * @power_notify_irq_wake: Whether IRQ wake was enabled.
>> + * @power_notify_irq: Power-notify acknowledgment IRQ number.
>> + */
>> +struct dcp_ipcc {
>> +	struct mbox_client client;
>> +	struct mbox_chan *power_chan;
>> +	struct virtqueue *resp_vq;
>> +	struct completion power_notify_done;
>> +	/* Serializes power notifications and teardown. */
>> +	struct mutex power_notify_lock;
>> +	atomic_t power_notify_pending;
>> +	/* Protects shutdown state and response queue access. */
>> +	spinlock_t state_lock;
>> +	bool shutting_down;
>> +	bool power_notify_irq_wake;
>> +	int power_notify_irq;
>> +};
>> +
>> +int dcp_ipcc_init(struct dcp_ipcc *ipcc, struct device *dev);
>> +void dcp_ipcc_set_resp_vq(struct dcp_ipcc *ipcc, struct virtqueue *resp_vq);
>> +void dcp_ipcc_deinit(struct dcp_ipcc *ipcc);
>> +int dcp_ipcc_send_power_notify(struct dcp_ipcc *ipcc);
>> +
>> +#endif /* __DCP_IPCC_H__ */
>>
>> -- 
>> 2.43.0
>>
