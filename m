Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8E12D780C
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 07:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785483547; cv=none; b=eyTDfrwPnmOWlVq2yRBd2lQoyYJwTI6A0kjO+Thf+vMDuONglQNfemv1UUfwqT/0u+Wsnoi7mrXCgT8hFezebhV9Qwd2Sajo6j4BJGaGs0WtAvPNMv7OZrqQ96ImYKDsAS2B96Z8cXQwmX4qrf7/k/aFesXEu+oOv+6svE0sCt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785483547; c=relaxed/simple;
	bh=OTZ19yLxcY8uvvUft7nojYrgOpQqdDEeKhZjM5NNkHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WfstsFaKOrajuHKUYC/tWlUY6vyj2glqcWX8poyJADp9FKSlfSaER8N3kiypdWKIo3JZIORnFJ6P7C2cGRMChAQcJNWOuQDbE6AW5N8xgTKjrRZ/UOgKm50p+5TZWABfT83ZTpSgc1hbhkUS3UlHy9W0/qK3Q3qkk2RPD63G4Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SV61PbbR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fQHsU9yE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SV61PbbR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fQHsU9yE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V6UmdH3470533
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 07:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VEq5ATevycqqov2TOMzsilA5PZHZMekVW67cJb1VJv0=; b=SV61PbbRL639M+wX
	PLNIsUlo/57ZG4F/OJeskiKaI52ZTWl++mVDIcEe8mLM8wXC/7BK+pLwj0DNK01G
	WBuXquQAHw8fjUh0KqPSHnNm5HU8MbtG+VpKBQANJCgdG3i0oPN3UTfcSp/RlfaY
	z1FIbOlxrayTjCh/QfIixe4INQITRvFWBPYgpRJLCkE7YQsqCZkyJC60k/S4BeQg
	pmCqZX4wbG8LADE9DZB2MFEAijsj2iCBmWxM1y7YfbLR5PbL7fhYlW7hVygvsn55
	XvKinkIKfY8Ee2X31XhMu0SnJL3l3E+gA0O9w8YjwGmQwGTCPGY0b2fJpGUThDs+
	FLrGrA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frpgk08h6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 07:39:04 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84a67b16217so1556725b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 00:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785483543; x=1786088343; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VEq5ATevycqqov2TOMzsilA5PZHZMekVW67cJb1VJv0=;
        b=fQHsU9yEqw3EDiZXG7DPbu9035LJr8DkislSAaG8RmWUKxIxbocnQWwRe4GG51MGfU
         Nu6+mKqUodvtNazl4dEbqm8Nyx0URMpXaJOAGIaR0gzHODqu0FhIVmy1kuggpceDdyVB
         GTAgQlouY88BqvVdziJ1RY7zawdSy6Aiob879aGoUxJBoq0HUMQkyYoRnqI7xplSIjJQ
         hMR7Tlv+b6sQ1YLXl83WWB8UDPkZE9wdpsXZiPMcXfudVdZFY1wQFymMkE062hQL/8dU
         FzG+XndZ/5Rf18vrTk6Mmvl1aPDhxB3cSpWnO0JQocGLzsTIL9K/rA7Zu3WvKQHUV3V4
         BF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785483543; x=1786088343;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VEq5ATevycqqov2TOMzsilA5PZHZMekVW67cJb1VJv0=;
        b=kkAF2H1ZThxme2W9dNA/mz6E6DWvRSZtsF7En1jv45agaMCl8i+nn48RhS1j6WwE/p
         AlAkH/VQq/Gw2GK8jGSeAE0LdubIdiFWqKsvSSScDPTEiFA9VyTcar1KdvoL0VAi9n3S
         41OcHigPgvAtI5IhXiTmQRWZWqWILIwoNjqCQ425VujvXDojp06N5GKEvvyA2MlyPEwy
         GqKiP+WHwTwtajq7mVlXygb8nGb3sM6p5Ax1Q4hqAOjO5MPU+jzqvvYMf93/2ATo4YZF
         +ciFsCvguwBtuHEGZTePsl1/fgyJ9Hz2je/y1EG+VGSNTcRAcbJg+X5yKMdTNuI3MQwT
         tW0g==
X-Forwarded-Encrypted: i=1; AHgh+RpWVKpKVc+Tf5y1VvXgD1cRpXj1KFfi5qJI+6ps2MvXBd9ZfWQWg7qt+3svLsJNKkH2UV+xbIZOUDgVxcrS@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyj+BXH2tllIGtFCIdwC8oLkNEw2qSt5EAHAUaoprEJ+34pVD7
	ZgKYOBID60YufNRDE0PTi6W1KXcmVuc30luokTBZq/SuEdJGwBZcPtoK1k1B55Ay7Yaw/arCjZk
	UDLPCvXLN6RuSjfToLE5+hpqmL6a0Zrzd24wZv8e9nH70al7uEWDGiElS8l6o07Yy2i5y
X-Gm-Gg: AR+sD13SzaaC2NOOMXCdIAwIl7MJCiyb1V2HayrBia16khMjzlsepxLP6NOLJYjmQ/H
	W9zh9V1ml/JVCdyZPLTi+6bfl880wsY6s6AK0jVakcZtNytgVt8otixUD5MElJQ3UF0TQRPfhgz
	uoPx/lyk7gL7jZDCjb1m8DspyxeWqlBr0n9THmHi+2iTYiFGNXNNwZH8GhDCAXIalZL+DZM71PS
	uydtl0jxnKJrqc4UhsKQQsH7SO5Rn1JDedPpvgtQ4bP3Jka0S+TZquDI2x/KmyjVyTC2NmIXJhO
	6MR4zg1sD9xNM4s/UtbOgD2TFY098pr5cXkOl7AVI2jTfsPSyvR2pdPqYf09zfUwkugNXHrjWM3
	+oxsjiC8+qOoiXHOmYEOyJlsHJjs=
X-Received: by 2002:a05:6a00:180b:b0:845:e9e8:645c with SMTP id d2e1a72fcca58-84ed6d29c96mr857763b3a.6.1785483543104;
        Fri, 31 Jul 2026 00:39:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:180b:b0:845:e9e8:645c with SMTP id d2e1a72fcca58-84ed6d29c96mr857736b3a.6.1785483542640;
        Fri, 31 Jul 2026 00:39:02 -0700 (PDT)
Received: from [192.168.1.6] ([182.77.67.166])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc29f31dsm83830b3a.36.2026.07.31.00.38.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 00:39:01 -0700 (PDT)
Message-ID: <e21db7e9-7cdf-409b-b6c8-268a8d3b9d04@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 13:08:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] tee: qcomtee: Allow object invokes from kernel
 clients
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260722-qcom_uefisecapp_migrate_qcomtee-v2-0-b8a8fcbe4211@oss.qualcomm.com>
 <20260722-qcom_uefisecapp_migrate_qcomtee-v2-3-b8a8fcbe4211@oss.qualcomm.com>
 <ac5760cc-a4ab-4fe1-9962-6b6890de4f36@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <ac5760cc-a4ab-4fe1-9962-6b6890de4f36@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AwAZLTA2DDhTFGiQ5h2BOECQxqZinWoK
X-Authority-Analysis: v=2.4 cv=P4sKQCAu c=1 sm=1 tr=0 ts=6a6c5118 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=mrmDAJacfjHp5PIfN2e9YA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=We5QyOu1FPZmSiEcj6oA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA1MyBTYWx0ZWRfX72rSOSZqpU91
 2o9Lx4qMgoB9dc0gzYivFYkpuUlbfKqLInCQCehYdsj/EVl7izBrhSQNvOU5YiJ+UG4F1EjGtfA
 OMDZpm4Qnb/Y66412kxPphwPxzZereg=
X-Proofpoint-GUID: AwAZLTA2DDhTFGiQ5h2BOECQxqZinWoK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA1MyBTYWx0ZWRfX1pV6wyEc5jTa
 RQtCEXvOSmJMpI1svOwSibTPuzobc7Prx+yT8JSxGsDrnj4QV16AmHTWAEPt55a5cjGvrRrTosx
 PpahoIHtUpBap11iaBA3pa79vHYVF64H+Yu6a5hCOby+TGN6GZi8cm0+l433Ya5unuzXbiylkS2
 HCandYxRgnIghSLsq5IK5OrUYKDDd4oqpwbamzlmL0k8QG+jbWfPgnvY/gRswephGJBvJ9p9NtW
 KRac4MYIYqtvZV08xCynGSLhnksvgKVQB0Ptd9w6nnHgA+CTtQzq2/vqRtY0swaYB60iC+p9BGr
 jg6BS5hMRRdPNtTzyZ4FEZgRgKGsxJecx64myBQoOGR/IxL4Ggu6NUmrt+vXtByzdhipYSj7Yd5
 Sn9Cb/qoLyVDsuHcK0aE4v0ERLXe25zF7BKOQIjouoYmxSbiHOIf9FzOMD8IL/LqsrYXMZJ08TL
 Wr6WP8CKVmi3JLtyR+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310053

Hi Amir,

On 29-07-2026 12:36 pm, Amirreza Zarrabi wrote:
> Hi Harshal,
> 
> On 7/22/2026 4:59 PM, Harshal Dev wrote:
>> From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>
>> QCOMTEE currently treats UBUF parameters as userspace addresses and
>> applies userspace restrictions when invoking the root object. This is
>> not suitable for object invocation requests issued by kernel clients.
>>
>> Use the kernel_ctx flag to distinguish kernel client requests from
>> userspace requests. For kernel contexts, do not mark UBUF parameters as
>> user addresses, and allow permitted root-object operations to proceed
>> without applying the userspace-only checks.
>>
>> This allows in-kernel users of tee_client_object_invoke_func() to issue
>> object invocation requests through the qcomtee backend.
>>
>> Co-developed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
>>  drivers/tee/qcomtee/call.c           | 34 +++++++++++++++++++++++-----------
>>  drivers/tee/qcomtee/qcomtee_object.h |  5 +++--
>>  include/linux/tee_drv.h              |  5 ++++-
>>  3 files changed, 30 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
>> index 03d33b118f6d..c1bba5fbfa3e 100644
>> --- a/drivers/tee/qcomtee/call.c
>> +++ b/drivers/tee/qcomtee/call.c
>> @@ -202,7 +202,7 @@ int qcomtee_objref_from_arg(struct tee_param *param, struct qcomtee_arg *arg,
>>   */
>>  static int qcomtee_params_to_args(struct qcomtee_arg *u,
>>  				  struct tee_param *params, int num_params,
>> -				  struct tee_context *ctx)
>> +				  struct qcomtee_object_invoke_ctx *oic)
>>  {
>>  	int i;
>>  
>> @@ -210,8 +210,14 @@ static int qcomtee_params_to_args(struct qcomtee_arg *u,
>>  		switch (params[i].attr) {
>>  		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
>>  		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>> -			u[i].flags = QCOMTEE_ARG_FLAGS_UADDR;
>> -			u[i].b.uaddr = params[i].u.ubuf.uaddr;
>> +			u[i].flags = oic->kernel_ctx ? 0 :
>> +				QCOMTEE_ARG_FLAGS_UADDR;
>> +
>> +			if (u[i].flags && QCOMTEE_ARG_FLAGS_UADDR)
>> +				u[i].b.uaddr = params[i].u.ubuf.uaddr;
>> +			else
>> +				u[i].b.addr = params[i].u.ubuf.addr;
>> +
> 
> it is & not &&.
> Rather than ?:, can you have single if and update both flags and addr/uaddr.
>

Whoops, thank you for catching this. Ack, I will make this change.

Regards,
Harshal 
> - Amir
> 
>>  			u[i].b.size = params[i].u.ubuf.size;
>>  
>>  			if (params[i].attr ==
>> @@ -223,7 +229,7 @@ static int qcomtee_params_to_args(struct qcomtee_arg *u,
>>  			break;
>>  		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT:
>>  			u[i].type = QCOMTEE_ARG_TYPE_IO;
>> -			if (qcomtee_objref_to_arg(&u[i], &params[i], ctx))
>> +			if (qcomtee_objref_to_arg(&u[i], &params[i], oic->ctx))
>>  				goto out_failed;
>>  
>>  			break;
>> @@ -270,7 +276,7 @@ static int qcomtee_params_to_args(struct qcomtee_arg *u,
>>   */
>>  static int qcomtee_params_from_args(struct tee_param *params,
>>  				    struct qcomtee_arg *u, int num_params,
>> -				    struct tee_context *ctx)
>> +				    struct qcomtee_object_invoke_ctx *oic)
>>  {
>>  	int i, np;
>>  
>> @@ -288,7 +294,8 @@ static int qcomtee_params_from_args(struct tee_param *params,
>>  			break;
>>  		case QCOMTEE_ARG_TYPE_OO:
>>  			/* TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT */
>> -			if (qcomtee_objref_from_arg(&params[np], &u[np], ctx))
>> +			if (qcomtee_objref_from_arg(&params[np], &u[np],
>> +						    oic->ctx))
>>  				goto out_failed;
>>  
>>  			break;
>> @@ -304,7 +311,7 @@ static int qcomtee_params_from_args(struct tee_param *params,
>>  	/* Undo qcomtee_objref_from_arg(). */
>>  	for (i = 0; i < np; i++) {
>>  		if (params[i].attr == TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT)
>> -			qcomtee_context_del_qtee_object(&params[i], ctx);
>> +			qcomtee_context_del_qtee_object(&params[i], oic->ctx);
>>  	}
>>  
>>  	/* Release any IO and OO objects not processed. */
>> @@ -357,7 +364,8 @@ static int qcomtee_params_check(struct tee_param *params, int num_params)
>>  }
>>  
>>  /* Check if an operation on ROOT_QCOMTEE_OBJECT from userspace is permitted. */
>> -static int qcomtee_root_object_check(u32 op, struct tee_param *params,
>> +static int qcomtee_root_object_check(struct qcomtee_object_invoke_ctx *oic,
>> +				     u32 op, struct tee_param *params,
>>  				     int num_params)
>>  {
>>  	/* Some privileged operations recognized by QTEE. */
>> @@ -366,6 +374,9 @@ static int qcomtee_root_object_check(u32 op, struct tee_param *params,
>>  	    op == QCOMTEE_ROOT_OP_ADCI_SHUTDOWN)
>>  		return -EINVAL;
>>  
>> +	if (oic->kernel_ctx)
>> +		return 0;
>> +
>>  	/*
>>  	 * QCOMTEE_ROOT_OP_REG_WITH_CREDENTIALS is to register with QTEE
>>  	 * by passing a credential object as input OBJREF. TEE_OBJREF_NULL as a
>> @@ -429,7 +440,8 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
>>  	/* Get an object to invoke. */
>>  	if (arg->id == TEE_OBJREF_NULL) {
>>  		/* Use ROOT if TEE_OBJREF_NULL is invoked. */
>> -		if (qcomtee_root_object_check(arg->op, params, arg->num_params))
>> +		if (qcomtee_root_object_check(oic, arg->op, params,
>> +					      arg->num_params))
>>  			return -EINVAL;
>>  
>>  		object = ROOT_QCOMTEE_OBJECT;
>> @@ -437,7 +449,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
>>  		return -EINVAL;
>>  	}
>>  
>> -	ret = qcomtee_params_to_args(u, params, arg->num_params, ctx);
>> +	ret = qcomtee_params_to_args(u, params, arg->num_params, oic);
>>  	if (ret)
>>  		goto out;
>>  
>> @@ -455,7 +467,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
>>  
>>  	if (!result) {
>>  		/* Assume service is UNAVAIL if unable to process the result. */
>> -		if (qcomtee_params_from_args(params, u, arg->num_params, ctx))
>> +		if (qcomtee_params_from_args(params, u, arg->num_params, oic))
>>  			result = QCOMTEE_MSG_ERROR_UNAVAIL;
>>  	} else {
>>  		/*
>> diff --git a/drivers/tee/qcomtee/qcomtee_object.h b/drivers/tee/qcomtee/qcomtee_object.h
>> index 2528d07e4576..7bd6e23b038c 100644
>> --- a/drivers/tee/qcomtee/qcomtee_object.h
>> +++ b/drivers/tee/qcomtee/qcomtee_object.h
>> @@ -112,8 +112,9 @@ struct qcomtee_buffer {
>>   * @b: address and size if the type of argument is a buffer.
>>   * @o: object instance if the type of argument is an object.
>>   *
>> - * &qcomtee_arg.flags only accepts %QCOMTEE_ARG_FLAGS_UADDR for now, which
>> - * states that &qcomtee_arg.b contains a userspace address in uaddr.
>> ++ * If %QCOMTEE_ARG_FLAGS_UADDR is set in &qcomtee_arg.flags then it implies
>> ++ * that &qcomtee_arg.b contains a userspace address in uaddr.
>> ++ * Otherwise, &qcomtee_arg.b contains a kernel address in addr.
>>   */
>>  struct qcomtee_arg {
>>  	enum qcomtee_arg_type type;
>> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
>> index ca99c6b747a8..71d0536db60e 100644
>> --- a/include/linux/tee_drv.h
>> +++ b/include/linux/tee_drv.h
>> @@ -83,7 +83,10 @@ struct tee_param_memref {
>>  };
>>  
>>  struct tee_param_ubuf {
>> -	void __user *uaddr;
>> +	union {
>> +		void *addr;
>> +		void __user *uaddr;
>> +	};
>>  	size_t size;
>>  };
>>  
>>
> 

