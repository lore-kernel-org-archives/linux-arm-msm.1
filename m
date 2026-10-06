Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A780841DEE7
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 13:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791294534; cv=none; b=rc7L5BeuWWYRKeC9F46L/1rWPeNyrbOJcSKpZuIJrVK5OG/DBPWmHVepDBtsIixzYrNfoavSJeiNdHbxtboWkJnM5Dp7mT2QQCmjfi0NLzanAjOag2Ftui74JisvwmZEHCB3fMyeoDDcQswn5nZv34Sm7ZM6QoMYNHybkYym/24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791294534; c=relaxed/simple;
	bh=/euIR1cA+vBSmeEG+EUCqPkBFFlpJ6Pj+42dkemZzGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GImxDzYP3Mz+/Wuz6CPT7hELuxtoXp6cVmwSmWZCTfhu5d/Ikbr3EgTUv3uGagRFhQvZUYlfrnx+0mjjiQUltNPwKY771Bc1PJDyICwnPfe0Zp7gymxjmDcFcmnz6lRF8TZFpkR2DEcLIRcSsv6VLqOFB1d1tbLDJAeH+5OLDF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AdVqPmzj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c/5KOGH1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AdVqPmzj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c/5KOGH1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696DUfTU1978184
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 13:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZsxHYpIVIY0DGWejGQhctU73
	xidBjR73UUkk+4RV14w=; b=AdVqPmzjL0Ap05ch/R1lSXawO/Ve1ilvZS9reygR
	2u3hrmHhxElQTFx72msr8OAgB4CTy4NcnZ3NOWpiGTW5bGZjgEMbqO1N6fkWlGmR
	Z/X1xCwJT05/kEoX7dlMG2kdgs9oH7XYV5kAwQigTqoI+rpSXegprod/bJQtx1sk
	JfUtyIVtEKP2iX1OKZZ7iSi08ndsuRGPbvvAwjVQP/U60xD0zf9mshpsYZbMbKX9
	beke3b99E0O+m6w8FZb8hbl+QK8gymYhL3chYv++4ZwhKcvG+TXb6rNo9rhxuzHo
	JYVp1KPquHdo19U70/AAzAY/1ySE8M7fzjNjSXPCcUXj0w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xc50vf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 13:48:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936aa34873bso565826185a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 06:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791294527; x=1791899327; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZsxHYpIVIY0DGWejGQhctU73xidBjR73UUkk+4RV14w=;
        b=c/5KOGH1Nt+oiHzb4lcgNdI5KZaJ5rmhbBxXgFDrOjjzYjxuUSW6nP+duk7KZGtYnZ
         c/FiOGEO47wRWFltjKOLL+PoOpkTCcncO3+SVoLwmAtPKooW/Mzs7zUsMv0R3r//7zOB
         oJ6YauZ0V+ordlvq7ZJpQMMX0przs2XoD71r8wODNhznKVYTEwIg9poacXkwuoaYjSRw
         dTwoflQiB0dxh4hA6RBxv7oUXYsD6VIsZkeovM+QhzpixIVzperLFb4MNkIzf6JCXKx7
         /IhZNeXrgz7VNa11ZwvSiA8CW5+EI64m71fNUAv0MMv34UAvPpvwyKPYHf4cyeN1aI8P
         mjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791294527; x=1791899327;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZsxHYpIVIY0DGWejGQhctU73xidBjR73UUkk+4RV14w=;
        b=SyNPiyZdU/29HEbWNFEAxpBmg3hh8F3VfF3D5ZoAIj0TWggMdmNW7m7cvokh0KfVVd
         gIClO2z0enJ/sDKDYXoyAz6mAvXxCumftUChFxsHKYcNLARUCsbIlMlvbdg+H6axK+8Y
         YBE9OXumeI08GgEzbHyZcodG8f/yMIlMyjZeZx4vR4Rf3te1d6H5eUD/2mCgw9zsBGrK
         Ta4llP8ESbGBqT/lRL7w4eVNVOAw8fX8sxCuAlaMe7JNionP2+AMHydeH4wSwbbASRMQ
         /Av9ZmgQsIM1PQc2HBJnstF5HqyP3hyJrKlGwiP9cme0hcmJzOEvpNGNcn6rSTwbXPlZ
         cGjw==
X-Forwarded-Encrypted: i=1; AKwUvBwZHqwLDnbT3WUE9xA6Qc53TnY9baw/H1sRbITVr0lDnUMSwPcjzE7i1AMP6kQ7IsgtXdekyWHi79/EZ6ci@vger.kernel.org
X-Gm-Message-State: AFuF++khBVLrdEwRjxUx300+X06bGG1rrINwMbbQyOBJPBbL41dTEZf+
	56iL37S7zU+1l7LRDOALUvNUOpdU+HXXc25thknpwddOn4TQIGrvCHr/imu2YOP6k2WJLHGztng
	ONJgpOTbaFAEnFxKUOWr6eT3e03dKrsGnSd9s4L+Y5ltx6uDeZEWDBhfGPF74OY6GmXHQcAlrXU
	Uq8tQ=
X-Gm-Gg: AYBFou1KzyiChBcX5uXwWGwuLgydtIQuRfKyfZG3GoyETIcjpb7EiDZGexMQebUS2X0
	vVfKcHlgM8hgBauBNEK3XjtBjnJnuU8ixfb26kgvTNG0zSr975q3zp4W4WutqqU3+V3nslmalc7
	f8lovpOUhvNTa3e2k9Cslp9hoebnaEeTV/gV92e3JVp9GAUMlZIaghNEejesIJf5h8idvf3GiG0
	YtFJb53fGt2OLTwDEi/Q4y9c+t/J7QrxR20lEcoS5CmwjU/vgJ2HNF7rEqrx4GEpnWMEUs8arhS
	GfCj6h5h8Oy1Xvj4F40BsFU050JsLXFarlOE7yqbmsV4lSQ64gWRLmonoLHLPBVTARjJwFswlQi
	8sgcQpVR14InhQx84Qky4b19UgcGBXbrXcrbm+iACU2gQSlMBbTPOkdVu30EDn4sB0cxSaeBBPV
	rq/Vj859e5S+wL
X-Received: by 2002:a05:620a:459e:b0:937:11c9:37f1 with SMTP id af79cd13be357-93e50f80d64mr1812408785a.16.1791294526453;
        Tue, 06 Oct 2026 06:48:46 -0700 (PDT)
X-Received: by 2002:a05:620a:459e:b0:937:11c9:37f1 with SMTP id af79cd13be357-93e50f80d64mr1812402585a.16.1791294525870;
        Tue, 06 Oct 2026 06:48:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c79dc77sm4084021e87.51.2026.10.06.06.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 06:48:44 -0700 (PDT)
Date: Tue, 6 Oct 2026 16:48:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 6/7] firmware: qcom: Add support for TEE based EFI-var
 client driver
Message-ID: <r7gtspju4cp5iwelv4zs4xoh4d7ambeceptmjtqaf5hcjzmc5n@4msc3ap4yfhz>
References: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-0-bf1c8e2a64ab@oss.qualcomm.com>
 <20261006-qcom_uefisecapp_migrate_qcomtee-v4-6-bf1c8e2a64ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-6-bf1c8e2a64ab@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=X5THu2Te c=1 sm=1 tr=0 ts=6ac4fc43 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=UKPZmZIt5rrgs1V1fpcA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA1NCBTYWx0ZWRfX/hVgkYrhZtlD
 guHUxrYf5q5HF1mxJJnzdQ7LYJH5sc2lQ/duwWgGTAO4/mXl1tr46k7Ws1mrpXfB+OVXkectnU1
 YyNOxpHM24+HjnCR6ypa9Wt/D3i0LIw=
X-Proofpoint-GUID: fhsFzKPQahuSX-pz66aJ3iso0PTPF2ZB
X-Proofpoint-ORIG-GUID: fhsFzKPQahuSX-pz66aJ3iso0PTPF2ZB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA1NCBTYWx0ZWRfX5W4rz/5+jWol
 BCuDoULdpMzkdrB5P+wnuVWwG3W2gpFOTbXzd1JMEHZonukG6jk+Zqz2nA1wnOZlO7JitzCY2iV
 JpzUHaYhA+72auQui7/p8lq3RGfwvnxKjNx90w6cUJt0LqZfUki739AX7g/4ZcdnXshHHQnm+sI
 AP0YaoBhdTMug9H+NBizYV/I81hNLu7aJ0fTMle7PuRhw3GUqIqKudpDgZia9+1VTWmzPFN3AZv
 Hqs2Gefo09Q8Rl7TAj29pCjFCbFOGHtvdU+tIRDn+ymslN5i+/ddeAWTR5A5QFD2r5/xf0QuFe2
 QYD1cK4vwwvmLnAq+ljIQFPdLXf3Kw40xGEtKiL1kGws8afaKww5sLtcASCKrvBZLR2NmnL0NNi
 uFi7WqQ627CrfnTdh4RvwMca7XA6sH5kGfMsg5mIkruWX8p8oVMGgDAfwHdOwyH6faMvlyBEzTx
 PdB7T3eNZaTTxNpVTPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_04,2026-10-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060054

On Tue, Oct 06, 2026 at 05:03:27PM +0530, Harshal Dev wrote:
> On Qualcomm SoC based platforms, UEFI stores EFI variables within the
> Replay Protected Memory Block (RPMB) located within either the UFS,
> eMMC or SPI-NOR storage. The RPMB key which is one-time programmed into
> the storage controller to allow authentication of the RPMB frames is
> generated by and only available to the Qualcomm Trusted Execution
> Environment (QTEE).
> 
> The legacy QSEECOM protocol used for communicating with the QTEE is
> deprecated and replaced with the use-case agnostic SMCInvoke protocol
> starting with the Qualcomm SM8x50 series. On platforms where the QSEECOM
> driver still probes, it does not support a listener interface with QTEE
> to enable writing of non-volatile EFI variables to the RPMB for UFS and
> eMMC storage.
> Therefore on such platforms, a TEE client driver which communicates with
> QTEE via the SMCInvoke protocol implemented by the QCOMTEE driver (and
> registered with the TEE subsystem) must be used to update such EFI
> variables.
> 
> Add support for a TEE based uefisecapp client driver which installs efivar
> operations after obtaining an object reference to the uefisecapp service.
> This enables the kernel/user-space to access or modify both volatile EFI
> variables stored by the Secure Application (in-memory) and non-volatile
> ones stored within RPMB.
> 
> +
> +static efi_status_t qcomtee_uefi_query_variable_info(u32 attr, u64 *storage_space,
> +						     u64 *remaining_space,
> +						     u64 *max_variable_size)
> +{
> +	int ret;
> +	u32 out_errno;
> +	u64 maximum_variable_storage_size;
> +	u64 remaining_variable_storage_size;
> +	u64 maximum_variable_size;
> +
> +	if (!storage_space || !remaining_space || !max_variable_size)
> +		return EFI_INVALID_PARAMETER;
> +
> +	ret = qcuefi_query_variable_info(attr,
> +					 &maximum_variable_storage_size,
> +					 &remaining_variable_storage_size,
> +					 &maximum_variable_size,
> +					 &out_errno);
> +
> +	if (ret)
> +		return EFI_DEVICE_ERROR;
> +
> +	if (!out_errno) {
> +		*storage_space = maximum_variable_storage_size;
> +		*remaining_space = remaining_variable_storage_size;
> +		*max_variable_size = maximum_variable_size;

Why do we need to copy data? Can we pass pointers directly to the
qcuefi_foo calls?

> +	}
> +
> +	return uefisecapp_err_to_efi_status(out_errno);
> +}
> +
> +/**
> + * qcomtee_release_object() - Release an object returned by QTEE.
> + *
> + * Each object returned by QTEE repesents a secure service exposed to the
> + * client. Whenever an secure service is opened, QTEE may allocate resources
> + * on the client's behalf. Therefore, once the client is done accessing the
> + * secure service, the object representing it should be explicitly released
> + * so that QTEE can release the associated resources as well.
> + *
> + * @ctx: TEE context.
> + * @object: The object to release.
> + */
> +static void qcomtee_release_object(struct tee_context *ctx,
> +				   struct tee_param_objref object)
> +{
> +	struct tee_ioctl_object_invoke_arg inv_arg;
> +
> +	memset(&inv_arg, 0, sizeof(inv_arg));
> +	SET_INVOKE_ARG(inv_arg, object.id, QCOMTEE_MSG_OBJECT_OP_RELEASE, 0);
> +	tee_client_object_invoke_func(ctx, &inv_arg, NULL);
> +}
> +
> +/**
> + * qcomtee_get_uefisec_svc_obj() - Get a UEFI Secure App service object to
> + * begin communication with the service.
> + * @ctx: TEE context.
> + * @client_env_obj: The client environment object returned earlier by QTEE.
> + * @uefisec_svc_obj: The UEFI Secure App service object.
> + *
> + * Returns 0 on success.
> + * Returns < 0 if client environment object invocation failed.
> + * Returns > 0 if client environment invocation was success but UEFI Secure App
> + * service object could not be returned for some other reason (represented by the
> + * returned value)
> + */
> +static int qcomtee_get_uefisec_svc_obj(struct tee_context *ctx,
> +				       struct tee_param_objref client_env_obj,
> +				       struct tee_param_objref *uefisec_svc_obj)
> +{
> +	int ret;
> +	struct tee_ioctl_object_invoke_arg inv_arg;
> +	u64 obj_id = client_env_obj.id;
> +	struct tee_param param[QCOMTEE_GET_UEFI_SVC_NPARAMS];
> +	u32 uefisec_uid = QCOMTEE_UEFI_SEC_UID;
> +
> +	memset(&inv_arg, 0, sizeof(inv_arg));
> +	memset(&param, 0, sizeof(param));
> +
> +	SET_INVOKE_ARG(inv_arg, obj_id,
> +		       QCOMTEE_OP_CLIENT_ENV_OPEN,
> +		       QCOMTEE_GET_UEFI_SVC_NPARAMS);
> +	SET_TEE_PARAM_UBUF(param[0], UBUF_INPUT, TEE_PARAM_UBUF(uefisec_uid));
> +	SET_TEE_PARAM_OBJREF(param[1], OBJREF_OUTPUT, 0, 0);
> +
> +	ret = tee_client_object_invoke_func(ctx, &inv_arg, param);
> +	if (ret < 0 || inv_arg.ret != 0) {
> +		dev_err(uefisec_app.dev, "QCOMTEE_CLIENT_ENV_OPEN invoke ret: %d, err: 0x%x\n",
> +			ret, inv_arg.ret);
> +		return ret ?: inv_arg.ret;
> +	}
> +
> +	*uefisec_svc_obj = param[1].u.objref;
> +	return ret;
> +}
> +
> +/**
> + * qcomtee_get_client_env_obj() - Get a client environment object to begin
> + * object exchange with QTEE.
> + * @ctx: TEE context.
> + * @client_env_obj: The client environment object returned by QTEE.
> + *
> + * Returns 0 on success.
> + * Returns < 0 if root object invocation failed.
> + * Returns > 0 if root object invocation was success but client environment
> + * object could not be returned for some other reason (represented by the
> + * returned value)
> + */
> +static int qcomtee_get_client_env_obj(struct tee_context *ctx,
> +				      struct tee_param_objref *client_env_obj)
> +{
> +	int ret;
> +	struct tee_ioctl_object_invoke_arg inv_arg;
> +	struct tee_param param[QCOMTEE_GET_CLIENT_ENV_NPARAMS];
> +
> +	memset(&inv_arg, 0, sizeof(inv_arg));
> +	memset(&param, 0, sizeof(param));
> +
> +	SET_INVOKE_ARG(inv_arg, TEE_OBJREF_NULL,
> +		       QCOMTEE_ROOT_OP_REG_WITH_CREDENTIALS,
> +		       QCOMTEE_GET_CLIENT_ENV_NPARAMS);
> +	SET_TEE_PARAM_OBJREF(param[0], OBJREF_INPUT, TEE_OBJREF_NULL, 0);
> +	SET_TEE_PARAM_OBJREF(param[1], OBJREF_OUTPUT, 0, 0);
> +
> +	ret = tee_client_object_invoke_func(ctx, &inv_arg, param);
> +	if (ret < 0 || inv_arg.ret != 0) {
> +		dev_err(uefisec_app.dev, "QCOMTEE_ROOT_OP_REG_WITH_CREDENTIALS invoke ret: %d, err: 0x%x\n",
> +			ret, inv_arg.ret);
> +		return ret ?: inv_arg.ret;
> +	}
> +
> +	*client_env_obj = param[1].u.objref;
> +	return ret;
> +}
> +
> +static const struct efivar_operations qcom_efivar_ops = {
> +	.get_variable = qcomtee_uefi_get_variable,
> +	.set_variable = qcomtee_uefi_set_variable,
> +	.get_next_variable = qcomtee_uefi_get_next_variable,
> +	.query_variable_info = qcomtee_uefi_query_variable_info,
> +};
> +
> +static int qcomtee_ctx_match(struct tee_ioctl_version_data *ver,
> +			     const void *data)
> +{
> +	return (ver->impl_id == TEE_IMPL_ID_QTEE);
> +}
> +
> +static int qcomtee_uefisecapp_probe(struct tee_client_device *tee_dev)
> +{
> +	int ret, err;
> +	struct tee_param_objref client_env_obj;
> +	struct tee_param_objref uefisec_svc_obj;
> +
> +	uefisec_app.dev = &tee_dev->dev;
> +	/* Open context with QCOMTEE driver */
> +	uefisec_app.ctx = tee_client_open_context(NULL, qcomtee_ctx_match, NULL,
> +						  NULL);
> +	if (IS_ERR(uefisec_app.ctx))
> +		return -ENODEV;
> +
> +	/* Obtain a reference to client_env object to begin object exchange
> +	 * with QTEE

Nit: check out the preferred block comment format. also, I think these
comments echo the code which pretty obvious here.

> +	 */
> +	ret = qcomtee_get_client_env_obj(uefisec_app.ctx, &client_env_obj);
> +	if (ret) {
> +		err = -EINVAL;
> +		goto err_get_client_env;
> +	}
> +
> +	/* Obtain a reference to the uefisec_svc object which provides access to
> +	 * the EFI var storage.
> +	 */
> +	ret = qcomtee_get_uefisec_svc_obj(uefisec_app.ctx, client_env_obj,
> +					  &uefisec_svc_obj);
> +	if (ret) {
> +		err = -EINVAL;
> +		goto err_get_uefisec_svc;
> +	}
> +	uefisec_app.uefisec_svc_obj = uefisec_svc_obj;
> +
> +	ret = efivars_register(&uefisec_app.efivars, &qcom_efivar_ops);
> +	if (ret) {

If we have both QSEECOM and QTEE drivers enabled (which we hopefully
will in distro kernels) and if QSEECOM has already provided UEFI vars
implementation, this call will print a warning and a probe error in
kernel logs. Similarly, if this driver registers UEFI vars
implementation first, the QSEECOM one will print out the error.

We know that there is this kind of a clash. I think it makes sense to
handle it. Earlier you wrote that QTEE would be a better option if the
platform supports both. Would it be possible to implement this kind of
selection?

> +		err = ret;
> +		goto err_efi_vars_reg;
> +	}
> +

-- 
With best wishes
Dmitry
