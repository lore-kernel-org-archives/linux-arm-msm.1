Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41A24322F1
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 09:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797923; cv=none; b=bZVSogxs45/v54YtsOgImHvTco2Pk7udDL3ZUwRaX2us1/Exu28lKBQZhgnLBoe9MJkyMYYuMnjZRx/Hf2U5rm2GVc2e5TvCN4EIzJXhJBoLcW8smwaVV10qnLpQVeuHWtzkAap1WSodGp0I26ewMF43AoDM75czdS72HEnw6iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797923; c=relaxed/simple;
	bh=aob59RsURu+FUrDkWWq58XPi1H9rODiQexwwefJyNFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SrYuFFeFAyPUABIeFJsEoaukjoUjTjy+SigTCYAM4fn94fW0aYxrRQMx7rxENgIcjbS5Ui6plu6jwag343PBoItSNBBtm5mCSXI0EbOhb5yvIlHcCHxoyskJQm24LS+usa5H03NRerG26kEE+DTCoLRZ2eoxDy3f8Y/bGfnSTDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h8z7xHjA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N30zaQql; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h8z7xHjA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N30zaQql"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8LFbw1754855
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 09:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pitDrUWGMmOcfY8ECPjobsbRe6e431atrR7IeBEqY+Q=; b=h8z7xHjAPN5cFzBB
	4XNeAgc1lIToNWRrQOLGn0crzDvty7dptRljOkuQUcDp4PrU5bLgLCZcLqWHh0ZU
	W2oRc7LGV06Gp3LXQlzbcoubX7I8cwF6c7Ku0r5ZXkG5D9bYPVNTG5hv5H0Pgxd8
	PvUAEdHKERkmHcaU4Z4v1MJfWJZhxnfLKezw5BiRcoHLwTKfgQ35quTHpoDe8/32
	oa6JY0w9lr4g0ZVoK9QH8Kms+W+uoenAhn2jYLMuFVt+GrZMC6eh7K9vJC9BnugX
	9K2LnnQzboaWow5OdirYa9NkvmI8/5y+nk1cChWSmq/pV9S8vuowfRJZwWWrtEbq
	/IvBjw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j7125cj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 09:38:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2df8d1e91c9so35890475ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 02:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791797920; x=1792402720; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pitDrUWGMmOcfY8ECPjobsbRe6e431atrR7IeBEqY+Q=;
        b=N30zaQqltwp9CcdV8M5KWysFaYc3AgVZlkpZoUU2lPGqHLetgTTCuH2J0FRnQfhpdT
         dBSGRINRngCnvFdbEtJPT0VkYnoG0w8nG22pc4XuFMAvVThU3ikIn6fuJoek8BfkhD8K
         raWdxdKgR3fEYUURZfP3zHP+fNw1oYzkJ7VOuhqWQgCGqR7BbR2SIMMWo/9yR7jfbFcE
         LwocOfAGJjMSYEP4nHKHKqhinWaE05fgvee8vO056nB+zcTF0b7FgdyH1nc3EJRB8kxb
         pvw5W4oouGM17X7SOs1Neo03bZgFisLqR6g2n+Y3QzwprGg1K3e5yjhfpja7hW2eRxT0
         OYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797920; x=1792402720;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pitDrUWGMmOcfY8ECPjobsbRe6e431atrR7IeBEqY+Q=;
        b=WvHc4hY8c4eOvs69/PgHlDoG40CkY6MtYVE0YCTWVecHI3F9flilgRWE7xOZKldnYO
         1JJ7dmee7AKWXvWdxhPTMXuDUPSWew6hUmaLCMlNQmbGdVOvuAKsN7HU7NAm67Nzq/wM
         8PfCdqhgBFsL+iTFSGr3hF9OyV5oEVntVzJGkKVDRk5aBxCqqLj+97AntUW8mSqP25lR
         5ZABS5n1SP74dNefivy75ePEC+mqcQykSix04rk+xOca2dfemrrljAILCYHokQ5idGDO
         o34WS07GX3O32gybxsmqARav8VvRlJYaGJMK+lLRnsWDIGcKmvaQRXYyuRmOrh/Ue3Lj
         qwpA==
X-Forwarded-Encrypted: i=1; AKwUvBxMpRPciRCguruRqkwZSX7wqx48r0CzuI+BVDIt+iA4+J5t5vbHFy2Lf6DZahRi6KWaObY3cEKcCKC0tTJG@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4yRL/gsR7wKaSD/8ujt7Ljy8IX5+SEQK1hHsvkiC0i1sAKM1C
	DQevNwobffHgfEiRO1dKOb1nZzHFj+Cj6gDmZlv6ijOAKtTIXTSPoA+GNtGl4bPsgMo3EKif6me
	hRezQfp2j8rlJlJj/ucTt8Dtjcgt4pKknb3fQK8QsiGBHabRFhBpb4PnPXCAmKyMLRXObbAgpls
	yE
X-Gm-Gg: AYBFou1OZAqq2tHP8pR0krTt8LUTMQuRs3UP62/ehjQjJzlQArVjkWA/s7U41KCYXc+
	fItTwhO43icXvYhqeaeg+/TT/L86UaOJTvImVWXWDAMjcomfvGGzPXg4DwHK9qkedbVYtGVUOpi
	kE9XzbI6pvq80EGB17lXRftCM+XAi2HT4dFd2HI6K2+eF7duPtwGVS76b+gBWt7bonUIiYXZez2
	it80nb9BqCSe1zolZBnI+zUEHX08s1UyYd1XOu+6wz7MgpMS6Y9HHxNHDWZUrx3xGgOO0jvVHwW
	2r6RKaHamrgZnATWmuQvcS7Ghzk8ifXM5wVoYaDr+/dHQpdUim//+6r9AY4JtVkxZj1jeT2LKmE
	YxZPiI+N7hWFPJ4P7M/LziGboC6nDwA==
X-Received: by 2002:a17:902:f789:b0:2e8:3534:eeab with SMTP id d9443c01a7336-2e842aa60c0mr76887965ad.14.1791797919645;
        Mon, 12 Oct 2026 02:38:39 -0700 (PDT)
X-Received: by 2002:a17:902:f789:b0:2e8:3534:eeab with SMTP id d9443c01a7336-2e842aa60c0mr76887735ad.14.1791797919091;
        Mon, 12 Oct 2026 02:38:39 -0700 (PDT)
Received: from [192.168.29.10] ([49.37.155.134])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e841a0124csm41234105ad.5.2026.10.12.02.38.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:38:38 -0700 (PDT)
Message-ID: <f7530ce2-ed7c-422e-9b15-cfdbc265c77b@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 15:08:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] tee: qcomtee: Allow object invokes from kernel
 clients
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-0-bf1c8e2a64ab@oss.qualcomm.com>
 <20261006-qcom_uefisecapp_migrate_qcomtee-v4-3-bf1c8e2a64ab@oss.qualcomm.com>
 <daa0983a-5fc2-462c-92f0-6ad87dfd71de@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <daa0983a-5fc2-462c-92f0-6ad87dfd71de@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzOCBTYWx0ZWRfX26kenr7SPEiK
 QJBeRK2+6U60gPLgv053wJEZAFhEDHuCYBmV3nT3QFU6ifaLt+GOK6W+RKdMY6V0TTwyTSO9u3v
 42w9YlBA+dS+5ewGkge/3wFXXrcqO1Q=
X-Proofpoint-GUID: d8j_jDZZDmbz2njtRMDtSLzN_FKfYjA1
X-Proofpoint-ORIG-GUID: d8j_jDZZDmbz2njtRMDtSLzN_FKfYjA1
X-Authority-Analysis: v=2.4 cv=ePGGH3p1 c=1 sm=1 tr=0 ts=6accaaa0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ivpbP8R7Mhpy7qfOLL/Q+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=3dGLg5FSYMxJAeFSFNkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzOCBTYWx0ZWRfX7tOsfgUmrgfK
 Ko+4Xqv3mszCYBaQsMe0OqV+57kGFbGWHK9OaShlaYw246874ecdLtlevFFMlUT1nsMrWx4BCVf
 Kc4zDV0Id3yg7fnocof7xYktHNiq/pQajA3Gc4fi8dNU254u8xRWYERwRSITf63FNoH/qDDZ4WU
 Y8tB6OYxReKDmcCSNgA6QlxWNtgVwDb/mHjIVOeGcqY2Ez/fhiTHWfpJiiKrTW85DRvBMz6icNU
 8/3VlW+lx2MUzaNJTtnrTEjF7R/ru+CgGaRDNw5mJND+RQJFaxE/gmzzEIQtnivcqNqTki6kQcz
 4ey8G3oFw5rc0aoLCleNww2dYh7xs/9Bx2ImADE4awDbGImcbk86M+QIRILmlQHijZhAZLbl1H2
 6Sxo3k0qmI11E1KD54O3M9MU8RE+0a4KcWz6oamgYO9Iu3zqM71fqaA1hYTZRczfU4FbsnZzHZ+
 2wy04w1vGYxFXMyvtnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120038

Hi Amir,

On 09-10-2026 06:49 am, Amirreza Zarrabi wrote:
> 
> 
> On 10/6/2026 10:33 PM, Harshal Dev wrote:
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
>> Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
>>  drivers/tee/qcomtee/call.c           | 38 ++++++++++++++++++++++++------------
>>  drivers/tee/qcomtee/qcomtee_object.h |  5 +++--
>>  include/linux/tee_drv.h              |  5 ++++-
>>  3 files changed, 32 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
>> index 3de54af45719..c97afaa1b4aa 100644
>> --- a/drivers/tee/qcomtee/call.c
>> +++ b/drivers/tee/qcomtee/call.c
>> @@ -193,7 +193,7 @@ int qcomtee_objref_from_arg(struct tee_param *param, struct qcomtee_arg *arg,
>>   * @u: QTEE arguments.
>>   * @params: TEE parameters.
>>   * @num_params: number of elements in the parameter array.
>> - * @ctx: context in which the conversion should happen.
>> + * @oic: context to use for the current invocation.
>>   *
>>   * It assumes @u has at least @num_params + 1 entries and has been initialized
>>   * with %QCOMTEE_ARG_TYPE_INV as &struct qcomtee_arg.type.
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
>> +			if (oic->kernel_ctx) {
>> +				u[i].flags = 0;
>> +				u[i].b.addr = params[i].u.ubuf.addr;
>> +			} else {
>> +				u[i].flags = QCOMTEE_ARG_FLAGS_UADDR;
>> +				u[i].b.uaddr = params[i].u.ubuf.uaddr;
>> +			}
>> +
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
>> @@ -260,7 +266,7 @@ static int qcomtee_params_to_args(struct qcomtee_arg *u,
>>   * @params: TEE parameters.
>>   * @u: QTEE arguments.
>>   * @num_params: number of elements in the parameter array.
>> - * @ctx: context in which the conversion should happen.
>> + * @oic: context to use for the current invocation.
>>   *
>>   * @u should have already been initialized by qcomtee_params_to_args().
>>   * This also represents the end of a QTEE invocation that started with
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
>> @@ -430,7 +441,8 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
>>  	/* Get an object to invoke. */
>>  	if (arg->id == TEE_OBJREF_NULL) {
>>  		/* Use ROOT if TEE_OBJREF_NULL is invoked. */
>> -		if (qcomtee_root_object_check(arg->op, params, arg->num_params))
>> +		if (qcomtee_root_object_check(oic, arg->op, params,
>> +					      arg->num_params))
>>  			return -EINVAL;
>>  
>>  		object = ROOT_QCOMTEE_OBJECT;
>> @@ -438,7 +450,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
>>  		return -EINVAL;
>>  	}
>>  
>> -	ret = qcomtee_params_to_args(u, params, arg->num_params, ctx);
>> +	ret = qcomtee_params_to_args(u, params, arg->num_params, oic);
>>  	if (ret)
>>  		goto out;
>>  
>> @@ -456,7 +468,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
>>  
>>  	if (!result) {
>>  		/* Assume service is UNAVAIL if unable to process the result. */
>> -		if (qcomtee_params_from_args(params, u, arg->num_params, ctx))
>> +		if (qcomtee_params_from_args(params, u, arg->num_params, oic))
>>  			result = QCOMTEE_MSG_ERROR_UNAVAIL;
>>  	} else {
>>  		/*
>> diff --git a/drivers/tee/qcomtee/qcomtee_object.h b/drivers/tee/qcomtee/qcomtee_object.h
>> index 5f40617361fc..d3740099fae0 100644
>> --- a/drivers/tee/qcomtee/qcomtee_object.h
>> +++ b/drivers/tee/qcomtee/qcomtee_object.h
>> @@ -113,8 +113,9 @@ struct qcomtee_buffer {
>>   * @b: address and size if the type of argument is a buffer.
>>   * @o: object instance if the type of argument is an object.
>>   *
>> - * &qcomtee_arg.flags only accepts %QCOMTEE_ARG_FLAGS_UADDR for now, which
>> - * states that &qcomtee_arg.b contains a userspace address in uaddr.
>> ++ * If %QCOMTEE_ARG_FLAGS_UADDR is set in &qcomtee_arg.flags then it implies
>> ++ * that &qcomtee_arg.b contains a userspace address in uaddr.
>> ++ * Otherwise, &qcomtee_arg.b contains a kernel address in addr.
> 
> Fix the doc, remove extra `+`, then
>

Ack, many thanks for your careful review.

Regards,
Harshal 
> Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> 
> - Amir
> 
>>   */
>>  struct qcomtee_arg {
>>  	enum qcomtee_arg_type type;
>> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
>> index 369c87ad0205..367208210a32 100644
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

