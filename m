Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C991278161
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 01:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791507708; cv=none; b=WBLK2fw7mExO+NzIPdXN1K+icOod5IZ/NCxrkBk2VL3whH3eMuQwaS5DwsKT6V+wZsXVpYa+Tm/Vb7X2pwA4/GOTRMIc84QHIxYk8aMd/1LYTcsQ7DuPQ8nfb1hFOmgf0TH82OrkAd1xcWKD9xIWbSOSowDQcABaYBm8xzHOTu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791507708; c=relaxed/simple;
	bh=5WJZ4KKEXHlMC+ytIsKCbxXgat5fZyXTr9h3QEBgMRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kbh1KPMNzM9fdSYa5zxonPaHeyWjjMlXMW7uWuCHTYLLov9Ni9UxxPOXFPCTRwD34a8H/mzJ7Yf8PNZPEwGp/SzkvCY5lX3Edlip3uWcFLevdOZXY/XqyjWZNaYjnIQPuzwZBTMa71BdZ2Ykceu0gqw62fQ6rIjO+8dU8Dv6oc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LyX2/V2E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jCLIr+O5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LyX2/V2E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jCLIr+O5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6990QLgA202711
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 01:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TCAeGN8/GBToWIiq6ePflkrxBka2nFgsuGJQKDrUbSk=; b=LyX2/V2EmkQ+n/GY
	qzp+4R2dKyt9I1FB+/QijkcTzC9LeZ6404Zie783Mx898FbFUTmyjwJwl6QIf5JU
	rVHt118NBY8lDwDxumMnso5m/Hl36FBIDze1++NPE3jrN3mGqRNvNhGDNta0+OTI
	NuM5LTTzYQRJWePP2bHztgjdl9hd/WDVYlVjg1Ywn7QwJO5Fe6bh9MlCUzP+anqK
	Vz7IDI+AZWWwM9RckGnFbkjzACGYeFKIO3ugI7eXy8IRubc+LnT5VtBC2hRdP99V
	OyA8b5JU/qee4mI9JrXfdAa/nLh0B1/cpkxZOt89136K0wiXnTLLjeB3F7htdZUq
	liF7pA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxk973y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 01:01:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so6000678a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 18:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791507705; x=1792112505; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TCAeGN8/GBToWIiq6ePflkrxBka2nFgsuGJQKDrUbSk=;
        b=jCLIr+O5OXrRrEZ2ZxOakurVMAxVDFzUuzukSXDVxsyAmDrjcYkVsJ4Y8IQCY2u5fL
         NJgEhcyy7YeYsZdyYtM83MTEtIoMkApbRQAPOPil/sUNSDvgL7KavpNhdhGqhV7ifaaS
         hat9rO17XuImdMHbWOqcUnrEkysnpc2s0mriRRuePzuirCxkmDFvA0P5n5NtaNC1sJWt
         pPZ2CIpw0EnLQyPvnj4kCFMFg628bYAcTG/vXGcTxL5LRwVOWg6ndlDc6Z59sOaT9qic
         jzpEIv7dQ0j/LDL4Nr3pDj2b+ezM6lLvsnlp02MQPhZqNfJIrl4rkeCxRBJc+1SIkoBk
         5BfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791507705; x=1792112505;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TCAeGN8/GBToWIiq6ePflkrxBka2nFgsuGJQKDrUbSk=;
        b=qH160Dnl7PPbwktfC9doS8Mfn2JXXlRYo3DVLgDE/FPYQdP2o73cKlKTXxJx5nQDfq
         pvmrzG/ALE12pA3btO08nzE38TIpHhyARQmFuLcH0nuuuzMpkH6MNkioP+52Q8g0Taqt
         5YCuyP7snJwGDLEv2rosj1DqcM6WkiR4PEXSVEGHudwErZa7PIZIxRKEv3MT5VwCJuOE
         KxT1P/+Omml6t6NYvNlVkMPjKmIiGQXMcJoD4rqZbSuLeQI8BemSedtwukMarRgOpWBp
         aB61WdmkqqGyGDh7AIPqtJMvzdIjSFKZeH/Ll20p7HhHdC7jqpjq6jnUQ39qLDorOOMR
         SiMw==
X-Forwarded-Encrypted: i=1; AKwUvBzGkOEkx5/i0Qij1Qiaa4HG8BA/j1by/kdsfpvhCQ+GwSnCDTcshsSURXZmkkfWADzvYuFsumzSLc49xPq4@vger.kernel.org
X-Gm-Message-State: AFq9FYJjM+bOMWYumUutcDCxRqHXUnk/nnkZAl4djbvqzPtOE2ii8A4p
	3TeTTTKdw17fldB/GFX1j3yws0Zxr6yBKm2XST8RwpDanGV9BRwnbFTQXUOONGDvBISpKZFbMa2
	txEqIQiWz8MOxAhBZEcUR2b6LEuseZIV6Pj/lOrl178eW64SubuuQ2scLxXAxbAmQRd0=
X-Gm-Gg: AYBFou1uVZCPY8DckwX3WxRWPsoeQZ8Pa82HJYwLinmlyByuharQhJLwQR7sXaLGbSx
	9zAwarK/PCZTc7W7RCFy+qEpNk92ifNoqfpcrELowlVLFICuRkNbxyBhFApoeclNsmQSIeXTGyr
	Rm1vMgwvkG6UmD9U1ntG0sGhPD91bQRnDjHxK1K/Tkjgo6+S/R0oBLxtz/QvyKWr8ToxsJHH1EI
	amlDJ0GYwJaol2GsT0fxmAEfPPwhdLLiNVC6cceVM4Mkn2O4JwnHYUneAUKxGlmdVmBkTXjGdsj
	wuoAq27i+seQBTe+eFKpQzuFrM8imKVVdJzUOBw+QVAwMXAfSyeLzCVP6FO7s4QKCT9FtiwXZ2+
	usdRPkkx9h5UE6PrpDWGImR+g0c84Gyqk
X-Received: by 2002:a17:90b:3810:b0:3a8:425:2b3c with SMTP id 98e67ed59e1d1-3ab3a998274mr437496a91.34.1791507704776;
        Thu, 08 Oct 2026 18:01:44 -0700 (PDT)
X-Received: by 2002:a17:90b:3810:b0:3a8:425:2b3c with SMTP id 98e67ed59e1d1-3ab3a998274mr437467a91.34.1791507704158;
        Thu, 08 Oct 2026 18:01:44 -0700 (PDT)
Received: from [192.168.1.86] ([65.181.12.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b9633fsm1196917a91.6.2026.10.08.18.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 18:01:43 -0700 (PDT)
Message-ID: <df02ff36-7768-4ac4-a609-781cf398c076@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 12:01:35 +1100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] tee: qcomtee: Track the object invocation context
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
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
 <20261006-qcom_uefisecapp_migrate_qcomtee-v4-1-bf1c8e2a64ab@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-1-bf1c8e2a64ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wMb_0sORVWZ374vDftNzSkT3cX9WsuNm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAwMyBTYWx0ZWRfX4Ng4DWztf1W7
 igNVlq/Ybimvhh0hON80rFcYS7jtnVOjfc+Dlt/ZzM3Gadx9mQIdTKuNYG7XI9BUpN6Brh3BeR0
 2kfip/cwccin6k6tjpKvTqSJOLF73lM=
X-Authority-Analysis: v=2.4 cv=Cs0q4X4D c=1 sm=1 tr=0 ts=6ac83cf9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=9v5PfQ1E2GNzj2RibJmqVw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_wx7_0KuIBLStxwTOU4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAwMyBTYWx0ZWRfXxln7Oo/hhtLx
 jpblYQ1J0sb6zk+/R5hyy1RSqdDZ3xRFcGfR2BztLVm+R3S/tsT/5oc730P+K8x70BY/W+mv15f
 +NvnE1x8RgfjvM8kMQmafgtb+/HPcCDxDUa/0T6fqZOcIxTdbwt+N//3rAuGyFOJlQDyFCKdKYR
 2iq/Q/i0G93bTXNSlN5lQSNHaBPwwEhuRIKazjMIcgKfIMlLSNL8x6YXXfkR9nhI/3vcmMyA4C7
 ipU97a4jwhxp6qemSVsbKpsgaDE8o0Riutzj4MDbi9u1UgB1pQ11gfItfSNqp1qaQNpCuecM8xe
 xfQQzeGMVV7QoomU4m3k+Ln9z4tBFcwy6mIg0uDSO1YLEiez4hRw0Q0HVvNnUmQyDXvbAPFg4dP
 GBZCZQ8Uaq6vkUNS2eNvjYCQhSxzQvRslq9yKFbUBzvy+yku9dmPq5a7RJVz/aUi3BOzJZPnpIH
 E2e0VJazAOljdVIw25g==
X-Proofpoint-ORIG-GUID: wMb_0sORVWZ374vDftNzSkT3cX9WsuNm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_01,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090003

Looks fine to me.

Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

- Amir

On 10/6/2026 10:33 PM, Harshal Dev wrote:
> QCOMTEE needs to distinguish between object invocations arriving from
> kernel clients and user-space clients in order to correctly marshal
> UBUF parameters and decide whether certain operations should be permitted.
> 
> Introduce an enum tee_object_invoke_origin to allow clients to indicate
> the context of the TEE object invocation, and add a kernel_ctx flag to the
> QCOMTEE context so the TEE back-end can track it.
> 
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---
>  drivers/tee/qcomtee/call.c           | 12 +++++++++---
>  drivers/tee/qcomtee/qcomtee_object.h |  8 ++++++--
>  drivers/tee/tee_core.c               |  3 ++-
>  include/linux/tee_core.h             |  8 +++++++-
>  4 files changed, 24 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
> index 4a597eeaf174..3de54af45719 100644
> --- a/drivers/tee/qcomtee/call.c
> +++ b/drivers/tee/qcomtee/call.c
> @@ -388,20 +388,26 @@ static int qcomtee_root_object_check(u32 op, struct tee_param *params,
>   * @ctx: TEE context.
>   * @arg: ioctl arguments.
>   * @params: parameters for the object.
> + * @origin: origin of the object invocation (kernel or user-space).
>   *
>   * Return: On success, returns 0; on failure, returns < 0.
>   */
>  static int qcomtee_object_invoke(struct tee_context *ctx,
>  				 struct tee_ioctl_object_invoke_arg *arg,
> -				 struct tee_param *params)
> +				 struct tee_param *params,
> +				 enum tee_object_invoke_origin origin)
>  {
>  	struct qcomtee_context_data *ctxdata = ctx->data;
>  	struct qcomtee_object *object;
> +	bool kernel_ctx = false;
>  	int i, ret, result;
>  
>  	if (qcomtee_params_check(params, arg->num_params))
>  		return -EINVAL;
>  
> +	if (origin == TEE_OBJECT_INVOKE_KERNEL)
> +		kernel_ctx = true;
> +
>  	/* First, handle reserved operations: */
>  	if (arg->op == QCOMTEE_MSG_OBJECT_OP_RELEASE) {
>  		del_qtee_object(arg->id, ctxdata);
> @@ -411,7 +417,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
>  
>  	/* Otherwise, invoke a QTEE object: */
>  	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
> -		qcomtee_object_invoke_ctx_alloc(ctx);
> +		qcomtee_object_invoke_ctx_alloc(ctx, kernel_ctx);
>  	if (!oic)
>  		return -ENOMEM;
>  
> @@ -648,7 +654,7 @@ static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
>  	int result;
>  
>  	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
> -		qcomtee_object_invoke_ctx_alloc(ctx);
> +		qcomtee_object_invoke_ctx_alloc(ctx, true);
>  	if (!oic)
>  		return;
>  
> diff --git a/drivers/tee/qcomtee/qcomtee_object.h b/drivers/tee/qcomtee/qcomtee_object.h
> index d5de02dcef3b..5f40617361fc 100644
> --- a/drivers/tee/qcomtee/qcomtee_object.h
> +++ b/drivers/tee/qcomtee/qcomtee_object.h
> @@ -147,6 +147,7 @@ static inline int qcomtee_args_len(struct qcomtee_arg *args)
>   * struct qcomtee_object_invoke_ctx - QTEE context for object invocation.
>   * @ctx: TEE context for this invocation.
>   * @flags: flags for the invocation context.
> + * @kernel_ctx: flag that indicates this context is owned by a kernel client.
>   * @errno: error code for the invocation.
>   * @object: current object invoked in this callback context.
>   * @u: array of arguments for the current invocation (+1 for ending arg).
> @@ -159,6 +160,7 @@ static inline int qcomtee_args_len(struct qcomtee_arg *args)
>  struct qcomtee_object_invoke_ctx {
>  	struct tee_context *ctx;
>  	unsigned long flags;
> +	bool kernel_ctx;
>  	int errno;
>  
>  	struct qcomtee_object *object;
> @@ -173,13 +175,15 @@ struct qcomtee_object_invoke_ctx {
>  };
>  
>  static inline struct qcomtee_object_invoke_ctx *
> -qcomtee_object_invoke_ctx_alloc(struct tee_context *ctx)
> +qcomtee_object_invoke_ctx_alloc(struct tee_context *ctx, bool kernel_ctx)
>  {
>  	struct qcomtee_object_invoke_ctx *oic;
>  
>  	oic = kzalloc_obj(*oic);
> -	if (oic)
> +	if (oic) {
>  		oic->ctx = ctx;
> +		oic->kernel_ctx = kernel_ctx;
> +	}
>  	return oic;
>  }
>  
> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index 1aac50c7c1de..30901390149c 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -701,7 +701,8 @@ static int tee_ioctl_object_invoke(struct tee_context *ctx,
>  			goto out;
>  	}
>  
> -	rc = ctx->teedev->desc->ops->object_invoke_func(ctx, &arg, params);
> +	rc = ctx->teedev->desc->ops->object_invoke_func(ctx, &arg, params,
> +							TEE_OBJECT_INVOKE_USERSPACE);
>  	if (rc)
>  		goto out;
>  
> diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> index f993d5118edd..bcb5418d6fdc 100644
> --- a/include/linux/tee_core.h
> +++ b/include/linux/tee_core.h
> @@ -73,6 +73,11 @@ struct tee_device {
>  	struct tee_shm_pool *pool;
>  };
>  
> +enum tee_object_invoke_origin {
> +	TEE_OBJECT_INVOKE_USERSPACE,
> +	TEE_OBJECT_INVOKE_KERNEL,
> +};
> +
>  /**
>   * struct tee_driver_ops - driver operations vtable
>   * @get_version:	returns version of driver
> @@ -117,7 +122,8 @@ struct tee_driver_ops {
>  			   struct tee_param *param);
>  	int (*object_invoke_func)(struct tee_context *ctx,
>  				  struct tee_ioctl_object_invoke_arg *arg,
> -				  struct tee_param *param);
> +				  struct tee_param *param,
> +				  enum tee_object_invoke_origin origin);
>  	int (*cancel_req)(struct tee_context *ctx, u32 cancel_id, u32 session);
>  	int (*supp_recv)(struct tee_context *ctx, u32 *func, u32 *num_params,
>  			 struct tee_param *param);
> 

