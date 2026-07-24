Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310E6248886
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784884449; cv=none; b=uKzSAzoJYVbZRqRr/hi/gMwuoTknkEPHHeGBM3I206sEuol707zsEfkuD0hz7xjzvSIidDtc5MFjNwVlYf8ay68lZNCcpQ5EI/1r03CbjEMj+lXQ7yF6CKTC8tFN3amtE24Fxz4KNJtQ6BoeXsRTxgWizJp7JT0TlkPJtUYaPQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784884449; c=relaxed/simple;
	bh=zqEsShgAXBqN0aH+k3GZyo4o8q9MsmA9jZbpx9vwHmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S9n5/OsMbLe5XE7Z8ReJ2jQCtSICsZJfjbpMP0IA2VzFl+kEPNuijEHPqIYsxax+FEsRqWmFZpEvXhKrv+pPkH6tJvtwJqWQYKctlcKF32spAxp1ZStVI716b1Chy93dKczGJojgf+4j/EocqBJ0KOh7AAq1/tQstDnUSCAad34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l4hFSTH5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hGStT/W+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l4hFSTH5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hGStT/W+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lN0f2162957
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k2dV0KsKWBGfkN52BkUxCSjB5VTckVJV0QF6l/hmvjc=; b=l4hFSTH5cPEQqGtT
	WHVT6YbsAjhV9PO3FYS0hKNp+mK8PWd0yZhhBEgfFA/k90IQK7W3AhWrlnaQknfZ
	CupvxRk15Dii/k3qbErVqefsmo0QWhA894QiNouUvUU71XFp0+HlQkqsqgoXPRdt
	nYiJWY2cYbuB+iDDo4iNBwAAvD8/2Z0L5wAbGKSiJ7hYNqfcP8aPsogy6Jh8IS5M
	fmz05QefB5DkmSqfq7ffmaSqLYP0ui29z3rOE8ItgZvTAUmD/Tntbl2pjbTnjVAI
	q3b99aNhZMGdimimdxiTGrK0qM3fQGD+KxCGO+ogPfQcRRr6wyZfiXc/Ca2uHnyd
	WWDiUg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkp5vkekv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:14:06 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848474825ffso348636b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 02:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784884446; x=1785489246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k2dV0KsKWBGfkN52BkUxCSjB5VTckVJV0QF6l/hmvjc=;
        b=hGStT/W+4Nnk0JQU9bD+Dge4J1czxEb0azZwxcVmwh8FTf09riNTShSAPsEvTeS6vX
         BwyFSC1ROnyFA8N4FAKpYVfDO4ZgqPXIskoUBQY/L/CZtq+IDlOGoQmgSzWx76xgy5lv
         vm3xM0Vd/7e0S0+5tGXn0JhM5eboSo4ubWyhfwKIa0GcSSnj/I2a5Geg4HFLwhwV1dL7
         32ldMxR8RLhqckFVlPHBwZzwx37q3sU2WnZh7bFrTfynBbhjGjSJEoZoVIaFvLX09va3
         lxgtJRW+qL+bMczh3IGSu2rAF0NzuawYQx5GiQ5tY4LXc8a7FVPC8NY8KU4+F4re0K0M
         74IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784884446; x=1785489246;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k2dV0KsKWBGfkN52BkUxCSjB5VTckVJV0QF6l/hmvjc=;
        b=dr0N3XHTzyaVaKLD2wycxsdMtT8lOl2hZhVy2RwQr8GUKjDGdvR1GKVRWrh4rd0jvt
         fsDpXNieoY2dIDz2bpqEzMzWYy2XlFQg6//pUA/+wmv1iPvUOcndoCwoKxc35qMPH3xC
         8x5VhHR9/t7fQJwn+G+33lT2RqIDh5IDNIwI6F421+v6TshFm7jV9zTVsBHV4+WUu9xv
         TOfDGTF/oPm44SlevvteEET0W+uAIjTKN4TP2M0BivOCTglIs0atqHprgxNpd0LT3wUg
         haGaUZojg1AIGNawfrevbZZUEyzWR3kHP+37g1GDzf1+1U+KK5lHJmOpSU9aTWmmMYHZ
         ERfw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+Hou+QmNhhpPkVLhqCghPoLEnDfc5yqVO+/MZW8ArIV/zKxRjSwyMVJuy8aMQ/ziCr0TrFU90Hc6cq+L1@vger.kernel.org
X-Gm-Message-State: AOJu0YxkugjkGcQja7b3JITos7hsSo/iS9ZyCEKCqczbIleDF/vbGFfm
	vMcyJNTkeUOkwPne4OD3Ne5spkw5csNob9LPe+zAASvDUEda7bVjkIpY1ubwbn+sCnHXPxSehvv
	Us3Y1Q4Or/bRxBZ8IjjSc6wDtEC4RqL/8Q++nn4nl7QlY7D7uz2mpLP6Bw6e3Rs4ORMyV
X-Gm-Gg: AR+sD134AboaZ8EPBq5Y6MQ2xrNWBWzMJhA3jg4Gms4rzNw/cYCwXtStMPCipQ2XRSJ
	UnN8jhcRTy1aieECFaPAIfPV+exAb0HOtvgrIorgXPnqGhvj66kJJO9DEgoIIXp05Yzvj/L5Kjp
	PcbwcxoUBXaSiEX5gpRCPBgEeTqMd+W8jIdNZj5OB3BoVgWAvhF+ErB31k+ywBuBE2sfCL0yRDe
	38mXFIOw+uBOAF5gPINjyfQJq/twoSvvZTQ0rIzi10LUvuyUHNzlSDX+lV5AVRAqqWeZkeWT1b3
	v+M9ygs7AnJnL7XHsTK7/bkrZEKAg57yKRGEbvPLMx5lC+scKq/X0p75TVAzdDhV+tzw2k9+zwK
	jnde8/bfcEf5TncuL2p+759dvoE4=
X-Received: by 2002:a05:6a00:35c6:b0:847:9570:d408 with SMTP id d2e1a72fcca58-84e2e7f6e71mr6461437b3a.2.1784884445864;
        Fri, 24 Jul 2026 02:14:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:35c6:b0:847:9570:d408 with SMTP id d2e1a72fcca58-84e2e7f6e71mr6461420b3a.2.1784884445464;
        Fri, 24 Jul 2026 02:14:05 -0700 (PDT)
Received: from [10.92.203.75] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17237c3fsm4409302b3a.9.2026.07.24.02.14.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 02:14:05 -0700 (PDT)
Message-ID: <9d638808-3a51-432e-a31b-0d68d4dd95f8@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 14:43:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] tee: qcomtee: Add support for registering QTEE
 services on TEE bus
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
 <20260722-qcom_uefisecapp_migrate_qcomtee-v2-5-b8a8fcbe4211@oss.qualcomm.com>
 <xyfoylxowewyyivw4qkwjhtmukbejusmcucfrs6jnmrihpx2ep@koluyh6bgbre>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <xyfoylxowewyyivw4qkwjhtmukbejusmcucfrs6jnmrihpx2ep@koluyh6bgbre>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA4MyBTYWx0ZWRfX98q7MO4lYPqA
 Bw12flqNH/D2nWBce0lrFQn14SskDV28bDYTaAAUx6sbtVbieeoml4oiaOpDk+FgHuxVqDiYqF+
 5NL3wuUStr3QToivdu6IHPh3HcwQzmI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA4MyBTYWx0ZWRfX3gRFB1+Mxrrp
 p3JfR0IvGfjcANDsYAKjkcm1MEgKn7WQu0heNViMtk4rgjpuxF77jNlPm7eQb9UQPYPs2OXGHuc
 XxbaSEITuudp+YkZLIdyVUdm+eL7e02njLC0L0T718lxkfZkK8AvyPYK/zm6Oee6YyrYgDckT45
 uIhMQVcZRLZNmiEohKLaWpfCzYRnqr7lAJukILy7TDdBYh+SYKMeWW3H01IK8hUMBIM4QR9KGHG
 jEUR9+cpE/JGkCMbp4/hZTry1cKAxBjEdhlgMBvw449tyhBix31tvP0ipCWv2L6nwfHQrg/EcaD
 sLujYFtPDqSLhWEupvFMp9tQ8cXRK8zh6v7wzWNT5EoNqgenuFrGJVgX9UaNDDoEyzlaW4b+fDW
 8k0Wnj8Aq21koCWUR7jMYtajQuVy3Ife/yJbtIoRG4hQlB1sLYczwgBEYvm14xMjxamCM4aU/g5
 K4VL78ZPtvY+CQswJeg==
X-Authority-Analysis: v=2.4 cv=Z9Dc2nRA c=1 sm=1 tr=0 ts=6a632cde cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=gsbhc2nskAa0CSx_u8cA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: odCk4du-9I0ecguRhEEcW-EbFXrWlrGn
X-Proofpoint-ORIG-GUID: odCk4du-9I0ecguRhEEcW-EbFXrWlrGn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240083

Hi Dmitry,

On 22-07-2026 01:59 pm, Dmitry Baryshkov wrote:
> On Wed, Jul 22, 2026 at 12:29:16PM +0530, Harshal Dev wrote:
>> QTEE exposes certain secure services implemented either within the QTEE
>> kernel or via pre-loaded Trusted Applications (TAs). Such always-available
>> services can be readily accessed by TEE client drivers via QTEE's
>> object-IPC protocol if the service is registered as a device on the TEE
>> bus.
>>
>> One such service is the EFI-variables service, implemented by the
>> uefisecapp TA which enables kernel clients to access EFI variables at
>> runtime.
>>
>> Maintain a static list of such always-available secure services and add
>> support for the QCOMTEE driver to register these services as devices on
>> the TEE bus during probe.
> 
> Is it always available on all platforms supporting QTEE?

The uefisecapp service is very old. I know that it has existed since the oldest
SM8x50 chipset. Every upstream supported target currently has support for it, since
they all have UEFI somewhere in the boot chain to load the uefisecapp TA from
the storage partition.

But as we expand this list, it's possible that certain services might not be available
on older QTEE versions, in that case the service will never be registered on the
TEE bus and so the TEE client driver will not probe.

Regards,
Harshal

> 
>>
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> ---
>>  drivers/tee/qcomtee/call.c           | 160 ++++++++++++++++++++++++++++++++++-
>>  drivers/tee/qcomtee/core.c           |   9 +-
>>  drivers/tee/qcomtee/qcomtee.h        |  12 +++
>>  drivers/tee/qcomtee/qcomtee_msg.h    |   1 +
>>  drivers/tee/qcomtee/qcomtee_object.h |   3 +-
>>  5 files changed, 177 insertions(+), 8 deletions(-)
>>
> 

