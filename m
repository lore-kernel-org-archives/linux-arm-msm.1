Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E013BB124
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 07:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785308753; cv=none; b=HiU2KVxw5DevObJewpGBw7Gf+YvuaV+frEoaUq3pYWiTAYOKNHNwQVQBCp4M4JTtRzLul8rJhmrczowovDZ/tXIv4SJvr5hzm2K03XIkyBIaqv5DgxN2XdwhEcT8uOlDx8PoRudsDb3m73bsQcZ+ONsHmMF5bn2PSg7iP0HNqJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785308753; c=relaxed/simple;
	bh=LaUwlQ0pih/C9P6PsaoCmPY4eWOetzY9qEQD7G+NwXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IUy39iVT4NynxQYHDP/a622XWVsPN9Sz49K9s/XnQroan/3Fjsom7doU8qVwfFH9yH4eL8ZCDyD3FLIZ3vbjOiUJsRUhuTNO2rNIsCnF4jDXQe3ub8kuRvbTVGrCHGzZBzfOaWwQBGQDLgms2v0XZM2bFEYi96MOsxG2sdYTUWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M+D3M5ne; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fverLs2q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M+D3M5ne";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fverLs2q"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T4cJjE1153569
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 07:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hPd1z/hiGeNUquxIW1lIFG9lE3k/jZoE7Z6Nq9oWubA=; b=M+D3M5neEfdS89jc
	00fCUb3yivgrJVOQb5NgE/rpPQXa6cdK3ie6bylmM8ljExHkvYmqDsp64k8bIM09
	VSbPio4osvh3240e6mE05dnWySnfUhpAgbA5LHAoaVPDCSviRM447mMWALeNXLjB
	hz5SnFfNGCmoERKGpYhJrKfrFmzoEVsPBwALWfCtmw4lCzTI/xCU+dGrL2W3TmE4
	mLbWFq48SQXVrphNQtH1p0JYA2pvzDDIknujdYt0OfJtBbb8zAmp55ea4poyJ+so
	dKcwDgrrNH1cr22v/+I1xrB2zPJmfqj0aD6E99ae1Nu20gY9pfctgrU+xLlRpEq2
	vykAlQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq108tmtk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 07:05:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-848662cd2a1so781364b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 00:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785308750; x=1785913550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hPd1z/hiGeNUquxIW1lIFG9lE3k/jZoE7Z6Nq9oWubA=;
        b=fverLs2qJHVVjVsW7sGMmWgj74PN4LlkMSF5hJ/JIc70FKlUpsQnotMdy6BJi+v4No
         CFRM3Csi4tEvYR+T81U9vg7VjPCxFNx9njbF6AS/iBWrVE9JmuXb7gT3ES+Hd4pTeZOI
         ruzO963lTf+/L2IivxPT5sd/7NOj6IMLpS3k3DcK/rAlx46vSaL0MZkh0g/BmotDefVu
         ziCx0TIirQLNZb+VrS4BF27InzNtU8HP9HCutNJ3v52rwPGbN9Nyv7/sUXcjSAXIfI6+
         ynmcHO6AM119TJs7LxXCjwei5TPj1Q8O+B+v2mpmgjOFbAz/Cx0HohciboJops5ux82s
         Y2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785308750; x=1785913550;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hPd1z/hiGeNUquxIW1lIFG9lE3k/jZoE7Z6Nq9oWubA=;
        b=brZMj1fH8Y8voym45B51ESP92GGCAc3lMbELj8vJhcYxADfzpPvVjs5JqnY6MRK8sM
         2VgZugbYumReYFqCuiz3B6fCm1NUySz1cCMia3JeUKWl26KJ+/Yrh8HN/xMg0JR4TXTi
         B43MIjoS/RpFn4rQrh5b37SUr4lIapHU5gWTeKO0rBRqHII8ukevl6nj06NNtC+9rPuY
         2kxKQnU5itRzRq+o14cHk3I5qC3P8x0PH8nkbIO/dXkgPDC0BtmZGFPNW34oswWZrigg
         FUpBjybv8wv0S2LcYzzJnq0AUZMEXnSRfBuzOcKFJOYo0D8zN2skKmJnCBuuJ7LxBLg2
         t1LA==
X-Forwarded-Encrypted: i=1; AHgh+Rocd7c3sieTEG5vr5pXwsxFZnAn4ItloI8nwYJ2QgzzCvYy9ibytaXxb/7F/RuycpYbeYkW1rS+jbk2Go5w@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9YI2eQ2m3J9x0FGuEOXO6AcaphLVVAbsWq7Qk7XSz+GqoY7nW
	kOx6Z9dqZsK/sD5HcH5hu7oRtdQHHl9FoQC4ufI8eHQ4x0limPVbADu1apNz5igoaATLkvdENs1
	7fowIURj6NG+Ur0alxleOjkejt4CddRVJs3bBfSRQiyLx2MjF/KN+zqiaTeFOIMCxHMU=
X-Gm-Gg: AR+sD10W4Zc81X8ClH/Xxav7jGgvIipYy6u6DUCui2bKFBINzbiQ1H64mpM42Gk20Rp
	XqrlD0Dn3QgwrpxKrEj/NxHUFi2hH2EzmTrVCymOhecFiiKv+3phQrnvymB2tyiv4cliXNls5zq
	C7KyDqLN/b7A12w2O6THi/WPpdZ32KfNG1SLNc8C3q0jcscdTfwAIp3k2kNYGwW4C/hzlP0/noQ
	iJXxjdnSgdwf+az7SVubAiLuwGJ1lSbHUUMTKEJ64uRimmR5Is4aOPtPqa+T+oDaTO6pTfpe38i
	YTBXLS7ChM019aWX8z0nthqmz0Ueobf6ro9hX3AkDTlJNrtybOrqMBvKBuL6st8liZdYaH1+fCo
	GH5JrK6j32k4vhtIwGuWGSXAyYoBSSxD6pg==
X-Received: by 2002:a05:6a00:14cc:b0:846:f517:ba5a with SMTP id d2e1a72fcca58-84e93315ef0mr6578036b3a.28.1785308749975;
        Wed, 29 Jul 2026 00:05:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:14cc:b0:846:f517:ba5a with SMTP id d2e1a72fcca58-84e93315ef0mr6577998b3a.28.1785308749446;
        Wed, 29 Jul 2026 00:05:49 -0700 (PDT)
Received: from [192.168.1.86] ([65.181.12.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea037565csm896471b3a.46.2026.07.29.00.05.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 00:05:48 -0700 (PDT)
Message-ID: <886466f0-0df2-4ee0-90f7-bd7e7bd731d9@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 17:05:42 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] tee: qcomtee: Add support for registering QTEE
 services on TEE bus
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260722-qcom_uefisecapp_migrate_qcomtee-v2-0-b8a8fcbe4211@oss.qualcomm.com>
 <20260722-qcom_uefisecapp_migrate_qcomtee-v2-5-b8a8fcbe4211@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <20260722-qcom_uefisecapp_migrate_qcomtee-v2-5-b8a8fcbe4211@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: a2DTY0zIJlqTwmZx0yY_S44QNbVc80zC
X-Authority-Analysis: v=2.4 cv=fufsol4f c=1 sm=1 tr=0 ts=6a69a64e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=1tOsOel+q48EdXbnVOFv2g==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=DMr0T2b9NGca9ooh4xUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: a2DTY0zIJlqTwmZx0yY_S44QNbVc80zC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA1NSBTYWx0ZWRfX6xANaIUziQIa
 5cIs6BkAz3uEccGlOiEfPKeWvZUDxwLu2bXVpoNz42bAKLJuGLgqHVNHDPZmeN3baWiB5zS9HKL
 CCHsVwbBgBcs7CKyLMYj3gC9k49Q4HE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA1NSBTYWx0ZWRfX1UemTe+RSVKs
 JpPzwDeo6PsHwnjKSyxlLfzljcqYKnyrPM4q0PrWyFPa2mGAz3gt6KNN2ffVfHvQiQl2h0oGCPF
 MQDXojexqP0g6ceOoCGjev9SRXF+N52lmfDyTDd9PV9Yh+EImCcHuhZgr5ihOO19Jqc6MeShxMa
 LHyki4wa9b7d7cW1VDY3/X63iAqLg0OnY7nLu/qC6717IFfNiDinmX4fw5pTns2AiHLDF7P84z8
 /C8xsLervjP1gsHZfIjh1WC61rYDp141vTxy5bT0BCSYC3BkCpzQwZbYDV//xDjI+lSOsRk3PTJ
 ccxFgmsIAsINU6/6PweTtP/FFH3QOrDaDR1AuTHPGeHswbd/8j4ecBS/60v1+RvV4em37HJFiYJ
 +JbbKsIjFbLW/5JCgEG5an2nfbanoy6xFyrvVsOVcwqbxRKW2OPkvTwaNBqMTu8DYAZupnISVub
 Z0VPy78r44y0iFo3LvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_02,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290055

Hi Harshal,

On 7/22/2026 4:59 PM, Harshal Dev wrote:
> QTEE exposes certain secure services implemented either within the QTEE
> kernel or via pre-loaded Trusted Applications (TAs). Such always-available
> services can be readily accessed by TEE client drivers via QTEE's
> object-IPC protocol if the service is registered as a device on the TEE
> bus.
> 
> One such service is the EFI-variables service, implemented by the
> uefisecapp TA which enables kernel clients to access EFI variables at
> runtime.
> 
> Maintain a static list of such always-available secure services and add
> support for the QCOMTEE driver to register these services as devices on
> the TEE bus during probe.
> 
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---
>  drivers/tee/qcomtee/call.c           | 160 ++++++++++++++++++++++++++++++++++-
>  drivers/tee/qcomtee/core.c           |   9 +-
>  drivers/tee/qcomtee/qcomtee.h        |  12 +++
>  drivers/tee/qcomtee/qcomtee_msg.h    |   1 +
>  drivers/tee/qcomtee/qcomtee_object.h |   3 +-
>  5 files changed, 177 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
> index c1bba5fbfa3e..e909955e6b21 100644
> --- a/drivers/tee/qcomtee/call.c
> +++ b/drivers/tee/qcomtee/call.c
> @@ -662,7 +662,7 @@ static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
>  {
>  	struct qcomtee_object *client_env, *service;
>  	struct qcomtee_arg u[3] = { 0 };
> -	int result;
> +	int result, error = 0;
>  
>  	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
>  		qcomtee_object_invoke_ctx_alloc(ctx, true);
> @@ -675,9 +675,13 @@ static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
>  
>  	/* Get ''FeatureVersions Service'' object. */
>  	service = qcomtee_object_get_service(oic, client_env,
> -					     QCOMTEE_FEATURE_VER_UID);
> -	if (service == NULL_QCOMTEE_OBJECT)
> +					     QCOMTEE_FEATURE_VER_UID,
> +					     &error);
> +	if (service == NULL_QCOMTEE_OBJECT) {
> +		if (error)
> +			pr_err("Failed to get service! error: %d\n", error);
>  		goto out_failed;
> +	}

no need to check for !error (why new variable reuse result),
just print "FeatureVersions Service unavailable (%d)", result
The message "Failed to get service! error: %d\n" is not helpful.

>  
>  	/* IB: Feature to query. */
>  	u[0].b.addr = &id;
> @@ -697,6 +701,153 @@ static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
>  	qcomtee_object_put(client_env);
>  }
>  
> +/**
> + * is_qcomtee_service_available() - Check if the QTEE service identified by the UID
> + * is available
> + * @ctx: TEE context.
> + * @uid: 32-bit UID of the service.
> + *
> + * Returns true if the service exists and is available.
> + * Returns false if a service is not exposed by QTEE.
> + */
> +static bool is_qcomtee_service_available(struct tee_context *ctx, u32 uid)
> +{
> +	struct qcomtee_object *client_env;
> +	struct qcomtee_object *service;
> +	int error = 0;
> +	bool ret = false;
> +
> +	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
> +		qcomtee_object_invoke_ctx_alloc(ctx, true);
> +	if (!oic)
> +		return ret;
> +
> +	client_env = qcomtee_object_get_client_env(oic);
> +	if (client_env == NULL_QCOMTEE_OBJECT)
> +		return ret;
> +
> +	/* Get service object corresponding to the uid. */
> +	service = qcomtee_object_get_service(oic, client_env, uid, &error);
> +	if (service != NULL_QCOMTEE_OBJECT) {
> +		qcomtee_object_put(service);
> +		ret = true;
> +	}
> +
> +	/* When we fail to get the service, QTEE provides the reason. */
> +	if (error)
> +		pr_err("Failed to get service! error: %d\n", error);
> +

This is not a useful message. We need to know which static service is missing:
e.g. print "%s is unavailable (%d)", qcom.tz.uefisecapp, error.
Also it is possible to re-org to avoid qcomtee_object_invoke_ctx_alloc() and
qcomtee_object_get_client_env() on each iteration? oic is reusable.

> +	qcomtee_object_put(client_env);
> +	return ret;
> +}
> +
> +/*
> + * QTEE Service UUID name space identifier
> + *
> + * A random UUID that is allocated as a name space identifier for forming UUID's
> + * representing secure services exposed by QTEE.
> + */
> +static const uuid_t qtee_service_uuid_ns = UUID_INIT(0xe1b48857, 0x6154, 0x49f9,
> +						     0x93, 0x4e, 0xa2, 0xf2,
> +						     0x0a, 0xba, 0x98, 0x42);
> +
> +static const struct qtee_service qtee_services[] = {
> +	{ "qcom.tz.uefisecapp",
> +	   QCOMTEE_UEFI_SEC_UID }
> +};
> +
> +static void qtee_release_service(struct device *dev)
> +{
> +	struct tee_client_device *qtee_service = to_tee_client_device(dev);
> +
> +	kfree(qtee_service);
> +}
> +
> +/**
> + * qtee_enumerate_service() - Enumerate a given QTEE service and register
> + * it on the TEE bus as a TEE client device
> + * @ctx: TEE context.
> + * @service_uuid: UUID of the service to be registered on the TEE bus.
> + * @uid: 32-bit UID used by QTEE to identify the service.
> + *
> + * Returns 0 on success and < 0 on failure.
> + */
> +static int qtee_enumerate_service(struct tee_context *ctx, const char *service_name,
> +				  const u32 uid)
> +{
> +	struct tee_client_device *qtee_service;
> +	uuid_t service_uuid;
> +	int rc;
> +
> +	if (!is_qcomtee_service_available(ctx, uid))
> +		return -ENXIO;

-EOPNOTSUPP?

> +
> +	tee_generate_uuid_v5(&service_uuid, &qtee_service_uuid_ns, service_name,
> +			     strlen(service_name));
> +
> +	qtee_service = kzalloc_obj(*qtee_service);
> +	if (!qtee_service)
> +		return -ENOMEM;
> +
> +	qtee_service->dev.bus = &tee_bus_type;
> +	qtee_service->dev.release = qtee_release_service;
> +	if (dev_set_name(&qtee_service->dev, "qtee-svc-%pUb", &service_uuid)) {
> +		kfree(qtee_service);
> +		return -ENOMEM;
> +	}
> +	uuid_copy(&qtee_service->id.uuid, &service_uuid);
> +
> +	rc = device_register(&qtee_service->dev);
> +	if (rc) {
> +		pr_err("QTEE service registration failed, err: %d\n", rc);
> +		put_device(&qtee_service->dev);
> +		kfree(qtee_service);

It is double free!? is not put_device enough?

> +		return rc;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * qtee_enumerate_services() - Enumerate all the secure services exposed by QTEE
> + * from the static 'qtee_services' list and register them on the TEE bus as
> + * TEE client devices.
> + *
> + * Not all versions of QTEE support a given service. Hence, we try to
> + * enumerate as many services from the 'qtee_services' list as possible.
> + * Not being able to enumerate a service shouldn't cause the driver probe
> + * to fail since none of the services in the list are mandatory for
> + * establishing communication with QTEE.
> + * @ctx: TEE context.
> + */
> +static void qtee_enumerate_services(struct tee_context *ctx)
> +{
> +	int rc;
> +	u32 idx;
> +
> +	for (idx = 0; idx < ARRAY_SIZE(qtee_services); idx++) {
> +		rc = qtee_enumerate_service(ctx, qtee_services[idx].name,
> +					    qtee_services[idx].uid);
> +		if (rc == -ENXIO)
> +			pr_err("QTEE does not implement service %d.\n",
> +			       qtee_services[idx].uid);

If you print in is_qcomtee_service_available(), why here again?

- Amir

> +	}
> +}
> +
> +static int qtee_unregister_service(struct device *dev, void *data)
> +{
> +	if (!strncmp(dev_name(dev), "qtee-svc", strlen("qtee-svc")))
> +		device_unregister(dev);
> +
> +	return 0;
> +}
> +
> +static void qtee_unregister_services(void)
> +{
> +	bus_for_each_dev(&tee_bus_type, NULL, NULL,
> +			 qtee_unregister_service);
> +}
> +
>  static const struct tee_driver_ops qcomtee_ops = {
>  	.get_version = qcomtee_get_version,
>  	.open = qcomtee_open,
> @@ -778,6 +929,8 @@ static int qcomtee_probe(struct platform_device *pdev)
>  		QTEE_VERSION_GET_MINOR(qcomtee->qtee_version),
>  		QTEE_VERSION_GET_PATCH(qcomtee->qtee_version));
>  
> +	qtee_enumerate_services(qcomtee->ctx);
> +
>  	return 0;
>  
>  err_dest_wq:
> @@ -807,6 +960,7 @@ static void qcomtee_remove(struct platform_device *pdev)
>  {
>  	struct qcomtee *qcomtee = platform_get_drvdata(pdev);
>  
> +	qtee_unregister_services();
>  	teedev_close_context(qcomtee->ctx);
>  	/* Wait for RELEASE operations to be processed for QTEE objects. */
>  	tee_device_unregister(qcomtee->teedev);
> diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
> index b1cb50e434f0..4e39e867c3e9 100644
> --- a/drivers/tee/qcomtee/core.c
> +++ b/drivers/tee/qcomtee/core.c
> @@ -896,19 +896,20 @@ qcomtee_object_get_client_env(struct qcomtee_object_invoke_ctx *oic)
>  
>  struct qcomtee_object *
>  qcomtee_object_get_service(struct qcomtee_object_invoke_ctx *oic,
> -			   struct qcomtee_object *client_env, u32 uid)
> +			   struct qcomtee_object *client_env, u32 uid,
> +			   int *result)
>  {
>  	struct qcomtee_arg u[3] = { 0 };
> -	int ret, result;
> +	int ret;
>  
>  	u[0].b.addr = &uid;
>  	u[0].b.size = sizeof(uid);
>  	u[0].type = QCOMTEE_ARG_TYPE_IB;
>  	u[1].type = QCOMTEE_ARG_TYPE_OO;
>  	ret = qcomtee_object_do_invoke(oic, client_env, QCOMTEE_CLIENT_ENV_OPEN,
> -				       u, &result);
> +				       u, result);
>  
> -	if (ret || result)
> +	if (ret || *result)
>  		return NULL_QCOMTEE_OBJECT;
>  
>  	return u[1].o;
> diff --git a/drivers/tee/qcomtee/qcomtee.h b/drivers/tee/qcomtee/qcomtee.h
> index f39bf63fd1c2..66d305a46c0a 100644
> --- a/drivers/tee/qcomtee/qcomtee.h
> +++ b/drivers/tee/qcomtee/qcomtee.h
> @@ -17,6 +17,8 @@
>  #define QCOMTEE_OBJREF_FLAG_USER	BIT(1)
>  #define QCOMTEE_OBJREF_FLAG_MEM		BIT(2)
>  
> +#define QTEE_UUID_NS_NAME_SIZE	        128
> +
>  /**
>   * struct qcomtee - Main service struct.
>   * @teedev: client device.
> @@ -39,6 +41,16 @@ struct qcomtee {
>  	u32 qtee_version;
>  };
>  
> +/**
> + * struct qtee_service - A secure service exposed by QTEE identified by a 32-bit UID.
> + * @name: Name of the QTEE service.
> + * @uid: 32-bit UID used by QTEE to identify the service.
> + */
> +struct qtee_service {
> +	const char *name;
> +	const u32 uid;
> +};
> +
>  void qcomtee_fetch_async_reqs(struct qcomtee_object_invoke_ctx *oic);
>  struct qcomtee_object *qcomtee_idx_erase(struct qcomtee_object_invoke_ctx *oic,
>  					 u32 idx);
> diff --git a/drivers/tee/qcomtee/qcomtee_msg.h b/drivers/tee/qcomtee/qcomtee_msg.h
> index 878f70178a5b..ecaf8db67d45 100644
> --- a/drivers/tee/qcomtee/qcomtee_msg.h
> +++ b/drivers/tee/qcomtee/qcomtee_msg.h
> @@ -105,6 +105,7 @@ union qcomtee_msg_arg {
>  #define QTEE_VERSION_GET_MINOR(x) (((x) >> 12) & 0xffU)
>  #define QTEE_VERSION_GET_PATCH(x) ((x) >> 0 & 0xfffU)
>  
> +#define QCOMTEE_UEFI_SEC_UID            413
>  /* Response types as returned from qcomtee_object_invoke_ctx_invoke(). */
>  
>  /* The message contains a callback request. */
> diff --git a/drivers/tee/qcomtee/qcomtee_object.h b/drivers/tee/qcomtee/qcomtee_object.h
> index 7bd6e23b038c..f4cb9b8fcbd4 100644
> --- a/drivers/tee/qcomtee/qcomtee_object.h
> +++ b/drivers/tee/qcomtee/qcomtee_object.h
> @@ -316,6 +316,7 @@ qcomtee_object_get_client_env(struct qcomtee_object_invoke_ctx *oic);
>  
>  struct qcomtee_object *
>  qcomtee_object_get_service(struct qcomtee_object_invoke_ctx *oic,
> -			   struct qcomtee_object *client_env, u32 uid);
> +			   struct qcomtee_object *client_env, u32 uid,
> +			   int *result);
>  
>  #endif /* QCOMTEE_OBJECT_H */
> 

