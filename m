Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E012C15A5
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 01:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791508780; cv=none; b=JlROh2e6BimDwOX3ql8dXOOZ7qHHYRWqJUbQMvU9BgC2PqHtE6tP95jaLMqiu3XMCBf8ORuWt0auH6Lbnpa785oOz7D9RMdjAwe0Iyl9LMujYul4qFDQPYea8dvyAP7GQgiRKlVWI9mUhAyzgvBDl5ku0usoSlXBd9T+lNAt+Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791508780; c=relaxed/simple;
	bh=D+XTu7gSsoUW4FNdPCJiX/gBSi8Ta1RaUr6dIs1ga74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h2W2QRKoA44Pdku8SKcE6Ka8ax1RfjAJOTIcW/57365EQI34wn1TgZ5dmsXyLhYvG7i1nYt0EwJCoe+7SyTm66mkDh19NrgrXCR1+aoDn4Vy0pu4A9Z9gh7vBa84FoiI/xqfc6wNJy9wAE6lvjHDopuoLC5T+UAGktnlK/hBT0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TP9AN09S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fYpcA/Wo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TP9AN09S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fYpcA/Wo"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6990QM8x202714
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 01:19:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/uryBptgPzgLo2tBwC5kY3OYtRzJjh1DkLquy9UzovA=; b=TP9AN09S7dcwj90k
	TiIqvC4nXeGzhCs2idgxL+rmFfsv4mM4Gma1q3yREX+BtUXkHomIN1OIFiTlF91K
	ZnqwCY31eT82yG9lUgq5B2PespSiVZvcOzAZHQzHlWjzOo4WApUQ66AJZb4h8lgC
	pekopRKoGUu/i5vv0w8KQiDDXXWYBSJou4SnvLH4dbgioRzsJfxVgb99VMlW/FKL
	n/o61OTiD7PaYCw3IkonkHCPMDcU2YESFHPoqH1xYBB5q89DxCsZa9EsYPmZ4Hx9
	JFHtYJF6pvjkLWFkZWoQowCtwIpHtJHHtAiOItT31dgSm2t/zDObuOyFw2vs5ISo
	hBWc6g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxk98nc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 01:19:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-88f2b158139so4437762b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 18:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791508776; x=1792113576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/uryBptgPzgLo2tBwC5kY3OYtRzJjh1DkLquy9UzovA=;
        b=fYpcA/WoOI3aKCrOZ5gQgj+RqR3ovZ810kA5drhH/hkj5IoTA3a53XXCTGaXnfqBIo
         3CvRgx7cU+YnvxvqFul0TSGiSLhwkav/tOeFjbUCOaiSCmwn+/D/EkVmD2gDh2eOqNJW
         FHfgVuGaJIXnMWjr9WPgxlzmSvQtV0Cif2VKRrnxPmZoeNZyfIvmjkORVGF0Luq6g0It
         FBd+ncaOdg8XDQ+NfFTQRjB0FJDH7jrVcFx+Mi39mfBcFdYO89UH/hPQF5a+lDKG7TlP
         H5Kprkmdlc6UCfWKGISeb/gjiOS7vLrNc3rx8Nvin/GFUptdQ6b3BxAwQiXmkjmBIU4n
         cjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791508776; x=1792113576;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/uryBptgPzgLo2tBwC5kY3OYtRzJjh1DkLquy9UzovA=;
        b=I2VMonbWfBuGcsSlljXZE3fDVEZfST4GNhvNjYTFn1NpXEnOGaD6g0PDYsAQSA10qb
         arm5ugyW/PqAtcUlJ6Dg1FJ0R6saqFryjpYd7Iey8VBvpFOj0bq/LpwlsgGCHuWOEONb
         CR5rUQgoxBMWce0xSsQFraLJQH/INyhzLOAGYI+gKwZwyePGN3LcTZYPakOZ+ZxxwLvT
         05OKiN+rpSRsZGENV/5GS1kTH6ZiDX57shW+ye3B+kjSdkB9HWSovSZJLoJ9b3gDc0OX
         B4ImMYQyaMYBRgUue8mIr7i49rrds8moPOXbfwZBpXkxJ/+ll6/UBd6vVk9gqV304y0C
         zFLQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1UOHf/tlzSM3KbdziGvyTe0pM8a0P4gYk24uhnuMjf0WxeGBn4TA73oL2v8tfGoN+JvXG4Wn8GNYD/Duk@vger.kernel.org
X-Gm-Message-State: AFuF++kAat1OS9uj6BRnXjvVEMa9pfGLyyCMWG2E/St6eJd74aSFL3B7
	3kcGBwm+C9q04nVCjc0z4FGOHt8UoT9PXzME37YhcJEpAjln6nXkyjfFQhhYUq0jj6LG7R38/fF
	JpfhW4l0gVIR5QDds8qicpczSrgiay9bWU8yGOw8XA9Fd4KadQvf69R7Hxr5gyhNTvpo=
X-Gm-Gg: AYBFou0uCHKGvSpJHkPFD0KHKifLQVgMK/ozeX59NFGfuhciMLYgt2oX+2VzIlkzcnM
	9BotqBOATehmOWNySjn1UwDsJy0Nxh+Z14TW+2/zI1H/XC14uqm6BmYRlI6Fi0JJKrAdgePlPzc
	jKYAi6XtavKBd/QH0qjc1molOLPk1EY4i1fLVMqlP8HJAZeUFflT4ruIwWv9Q6ELE5YBlvFaTlh
	KTDsRLaIIRyUT6ShdYMLO0vxXEPQgOX3zMDBZ7PcWfVJr0z0MtVYBv33rTB52ZbzMPtAhsiKsv+
	kin4K6sDsFDUgrLZFWmhGuyd3bZQEWFX7FpgfBDVYvFx/UZWWUXxW/9GAIlnnYMXz6K6MIblTuY
	yflOtdMibgcipWZPNPzWQ6ABEl68uXM1i
X-Received: by 2002:a05:6a20:4393:b0:3dd:a009:3188 with SMTP id adf61e73a8af0-3e16bea20cbmr211629637.48.1791508775576;
        Thu, 08 Oct 2026 18:19:35 -0700 (PDT)
X-Received: by 2002:a05:6a20:4393:b0:3dd:a009:3188 with SMTP id adf61e73a8af0-3e16bea20cbmr211612637.48.1791508775038;
        Thu, 08 Oct 2026 18:19:35 -0700 (PDT)
Received: from [192.168.1.86] ([65.181.12.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3106e07sm249503b3a.11.2026.10.08.18.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 18:19:34 -0700 (PDT)
Message-ID: <daa0983a-5fc2-462c-92f0-6ad87dfd71de@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 12:19:27 +1100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] tee: qcomtee: Allow object invokes from kernel
 clients
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
 <20261006-qcom_uefisecapp_migrate_qcomtee-v4-3-bf1c8e2a64ab@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-3-bf1c8e2a64ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WuDsiYvh-DxIKeKSoS-LWvCDgjkyVEld
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAwNCBTYWx0ZWRfX94wN9BA/Wb4t
 87wCVUv3zcAdFTc8SJXOVzJx660ABRY+vxtSskoEN5D/4+yE31JoUbAJbcziFnZQVwfq8Dwap3y
 KZRSWXSUcYjzM2Sy+59GQZB18tUs+y4=
X-Authority-Analysis: v=2.4 cv=Cs0q4X4D c=1 sm=1 tr=0 ts=6ac84128 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=9v5PfQ1E2GNzj2RibJmqVw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=bMymjuXEMpCr_xxdz14A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAwNCBTYWx0ZWRfXwZXuRZS58Wyv
 TDXa+Kde6xehTBtcLs9VB1gg0WiuFD7VCkHgHFjIfSec29vHS/+NPgJELcy76zuj6AvQ0aC10S3
 +J5Jac+hzkuC9bezisHnGoqcHVKYLWhN/o9+mdF6Rev5jMvdIgzWd2mZx3A/SYgtnHUUWjDPR+k
 n/AHJ/pneMhniCKj2h98nBJwlIVMSg/HG0tdeZrZj2CXL7RyUseBcRmCkCHIU1ByuOfr84896Mw
 yu3Vv33JMt6wP4tb+y2lqJlJRghD3M6Ug70BfPFoqQK94pGcGs5c+TFaG8GH/YvSi2oKfWiX4mj
 9XMq9dZUNRK/d1/QrOK0SbzLrOUzEgDMuhM8lqlz/DEi8YJk8Ld7F+ypojgrfgBskOy5eJ886o5
 5vG8jOdqPO1Rho4FAoxO6opZOAz4U5Gs7mIhi4mKK1anqL8esj8xY0OOKtPwWBT5JCEvWZJCe3e
 NY6HzYmqmhCidk33fEA==
X-Proofpoint-ORIG-GUID: WuDsiYvh-DxIKeKSoS-LWvCDgjkyVEld
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_01,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090004



On 10/6/2026 10:33 PM, Harshal Dev wrote:
> From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> 
> QCOMTEE currently treats UBUF parameters as userspace addresses and
> applies userspace restrictions when invoking the root object. This is
> not suitable for object invocation requests issued by kernel clients.
> 
> Use the kernel_ctx flag to distinguish kernel client requests from
> userspace requests. For kernel contexts, do not mark UBUF parameters as
> user addresses, and allow permitted root-object operations to proceed
> without applying the userspace-only checks.
> 
> This allows in-kernel users of tee_client_object_invoke_func() to issue
> object invocation requests through the qcomtee backend.
> 
> Co-developed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  drivers/tee/qcomtee/call.c           | 38 ++++++++++++++++++++++++------------
>  drivers/tee/qcomtee/qcomtee_object.h |  5 +++--
>  include/linux/tee_drv.h              |  5 ++++-
>  3 files changed, 32 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
> index 3de54af45719..c97afaa1b4aa 100644
> --- a/drivers/tee/qcomtee/call.c
> +++ b/drivers/tee/qcomtee/call.c
> @@ -193,7 +193,7 @@ int qcomtee_objref_from_arg(struct tee_param *param, struct qcomtee_arg *arg,
>   * @u: QTEE arguments.
>   * @params: TEE parameters.
>   * @num_params: number of elements in the parameter array.
> - * @ctx: context in which the conversion should happen.
> + * @oic: context to use for the current invocation.
>   *
>   * It assumes @u has at least @num_params + 1 entries and has been initialized
>   * with %QCOMTEE_ARG_TYPE_INV as &struct qcomtee_arg.type.
> @@ -202,7 +202,7 @@ int qcomtee_objref_from_arg(struct tee_param *param, struct qcomtee_arg *arg,
>   */
>  static int qcomtee_params_to_args(struct qcomtee_arg *u,
>  				  struct tee_param *params, int num_params,
> -				  struct tee_context *ctx)
> +				  struct qcomtee_object_invoke_ctx *oic)
>  {
>  	int i;
>  
> @@ -210,8 +210,14 @@ static int qcomtee_params_to_args(struct qcomtee_arg *u,
>  		switch (params[i].attr) {
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> -			u[i].flags = QCOMTEE_ARG_FLAGS_UADDR;
> -			u[i].b.uaddr = params[i].u.ubuf.uaddr;
> +			if (oic->kernel_ctx) {
> +				u[i].flags = 0;
> +				u[i].b.addr = params[i].u.ubuf.addr;
> +			} else {
> +				u[i].flags = QCOMTEE_ARG_FLAGS_UADDR;
> +				u[i].b.uaddr = params[i].u.ubuf.uaddr;
> +			}
> +
>  			u[i].b.size = params[i].u.ubuf.size;
>  
>  			if (params[i].attr ==
> @@ -223,7 +229,7 @@ static int qcomtee_params_to_args(struct qcomtee_arg *u,
>  			break;
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT:
>  			u[i].type = QCOMTEE_ARG_TYPE_IO;
> -			if (qcomtee_objref_to_arg(&u[i], &params[i], ctx))
> +			if (qcomtee_objref_to_arg(&u[i], &params[i], oic->ctx))
>  				goto out_failed;
>  
>  			break;
> @@ -260,7 +266,7 @@ static int qcomtee_params_to_args(struct qcomtee_arg *u,
>   * @params: TEE parameters.
>   * @u: QTEE arguments.
>   * @num_params: number of elements in the parameter array.
> - * @ctx: context in which the conversion should happen.
> + * @oic: context to use for the current invocation.
>   *
>   * @u should have already been initialized by qcomtee_params_to_args().
>   * This also represents the end of a QTEE invocation that started with
> @@ -270,7 +276,7 @@ static int qcomtee_params_to_args(struct qcomtee_arg *u,
>   */
>  static int qcomtee_params_from_args(struct tee_param *params,
>  				    struct qcomtee_arg *u, int num_params,
> -				    struct tee_context *ctx)
> +				    struct qcomtee_object_invoke_ctx *oic)
>  {
>  	int i, np;
>  
> @@ -288,7 +294,8 @@ static int qcomtee_params_from_args(struct tee_param *params,
>  			break;
>  		case QCOMTEE_ARG_TYPE_OO:
>  			/* TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT */
> -			if (qcomtee_objref_from_arg(&params[np], &u[np], ctx))
> +			if (qcomtee_objref_from_arg(&params[np], &u[np],
> +						    oic->ctx))
>  				goto out_failed;
>  
>  			break;
> @@ -304,7 +311,7 @@ static int qcomtee_params_from_args(struct tee_param *params,
>  	/* Undo qcomtee_objref_from_arg(). */
>  	for (i = 0; i < np; i++) {
>  		if (params[i].attr == TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT)
> -			qcomtee_context_del_qtee_object(&params[i], ctx);
> +			qcomtee_context_del_qtee_object(&params[i], oic->ctx);
>  	}
>  
>  	/* Release any IO and OO objects not processed. */
> @@ -357,7 +364,8 @@ static int qcomtee_params_check(struct tee_param *params, int num_params)
>  }
>  
>  /* Check if an operation on ROOT_QCOMTEE_OBJECT from userspace is permitted. */
> -static int qcomtee_root_object_check(u32 op, struct tee_param *params,
> +static int qcomtee_root_object_check(struct qcomtee_object_invoke_ctx *oic,
> +				     u32 op, struct tee_param *params,
>  				     int num_params)
>  {
>  	/* Some privileged operations recognized by QTEE. */
> @@ -366,6 +374,9 @@ static int qcomtee_root_object_check(u32 op, struct tee_param *params,
>  	    op == QCOMTEE_ROOT_OP_ADCI_SHUTDOWN)
>  		return -EINVAL;
>  
> +	if (oic->kernel_ctx)
> +		return 0;
> +
>  	/*
>  	 * QCOMTEE_ROOT_OP_REG_WITH_CREDENTIALS is to register with QTEE
>  	 * by passing a credential object as input OBJREF. TEE_OBJREF_NULL as a
> @@ -430,7 +441,8 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
>  	/* Get an object to invoke. */
>  	if (arg->id == TEE_OBJREF_NULL) {
>  		/* Use ROOT if TEE_OBJREF_NULL is invoked. */
> -		if (qcomtee_root_object_check(arg->op, params, arg->num_params))
> +		if (qcomtee_root_object_check(oic, arg->op, params,
> +					      arg->num_params))
>  			return -EINVAL;
>  
>  		object = ROOT_QCOMTEE_OBJECT;
> @@ -438,7 +450,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
>  		return -EINVAL;
>  	}
>  
> -	ret = qcomtee_params_to_args(u, params, arg->num_params, ctx);
> +	ret = qcomtee_params_to_args(u, params, arg->num_params, oic);
>  	if (ret)
>  		goto out;
>  
> @@ -456,7 +468,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
>  
>  	if (!result) {
>  		/* Assume service is UNAVAIL if unable to process the result. */
> -		if (qcomtee_params_from_args(params, u, arg->num_params, ctx))
> +		if (qcomtee_params_from_args(params, u, arg->num_params, oic))
>  			result = QCOMTEE_MSG_ERROR_UNAVAIL;
>  	} else {
>  		/*
> diff --git a/drivers/tee/qcomtee/qcomtee_object.h b/drivers/tee/qcomtee/qcomtee_object.h
> index 5f40617361fc..d3740099fae0 100644
> --- a/drivers/tee/qcomtee/qcomtee_object.h
> +++ b/drivers/tee/qcomtee/qcomtee_object.h
> @@ -113,8 +113,9 @@ struct qcomtee_buffer {
>   * @b: address and size if the type of argument is a buffer.
>   * @o: object instance if the type of argument is an object.
>   *
> - * &qcomtee_arg.flags only accepts %QCOMTEE_ARG_FLAGS_UADDR for now, which
> - * states that &qcomtee_arg.b contains a userspace address in uaddr.
> ++ * If %QCOMTEE_ARG_FLAGS_UADDR is set in &qcomtee_arg.flags then it implies
> ++ * that &qcomtee_arg.b contains a userspace address in uaddr.
> ++ * Otherwise, &qcomtee_arg.b contains a kernel address in addr.

Fix the doc, remove extra `+`, then

Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

- Amir

>   */
>  struct qcomtee_arg {
>  	enum qcomtee_arg_type type;
> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> index 369c87ad0205..367208210a32 100644
> --- a/include/linux/tee_drv.h
> +++ b/include/linux/tee_drv.h
> @@ -83,7 +83,10 @@ struct tee_param_memref {
>  };
>  
>  struct tee_param_ubuf {
> -	void __user *uaddr;
> +	union {
> +		void *addr;
> +		void __user *uaddr;
> +	};
>  	size_t size;
>  };
>  
> 

