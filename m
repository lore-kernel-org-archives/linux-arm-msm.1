Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F7E27A91D
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787556697; cv=none; b=oWX/DYjrDCRst8OpLWIVg9C0d9Ecriur6N1mArT8IET3IwbA4e1GJMuC6rNvol+DavmqN8cOzllhFSuAH6hwq9xM85QQnmmadiT1MAp5gZYOg7dxOQVtp/ub/bCycQ1aUeXijy+TZJyoCa+Q8vdoskZygtLCFbibxO9lSf4oYKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787556697; c=relaxed/simple;
	bh=FYyWjZdZhey4H4yztr+dh50ZItJaR+WTAiHGMz5cEco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=izypE+UFnqShb+6sLKThDHF6/5h4/TNGPgkIIW1vsl3mcVJ++54ESaO3jtaRWH0pwbYyMPOWloZdGj9yPwg30u83jde+MlVHDKIHWLlsltdlAqJ/aZJ24uc95t8J9k5lTS7GIKr0LIP/ncCYG8+8yRzkOWRhXzu6D4Atek9VYg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f9i87oxO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eAIkUQpY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f9i87oxO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eAIkUQpY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O7Bflu1815864
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GGW/2o11ZVLZJS92GyTOiHn4rgI8UzeMrVaPCXBo8Ng=; b=f9i87oxOAOwb1iso
	E6OrkENYef5T6l01cPTtRQ0nXkcn1Hm4S8CajoKsOt0iWII+bFTlD4dvVaRqvmkb
	QvPbSCHQjcLPPeDEpfuUFU1VwaZlvt9Rz/LFlwHUSqMBo+rn6/EaCKoPeIPzmyhP
	wFpSo1sTtod2YdHgHjqlshmoIsT224dyECJLMUCZEDKfVCo0n5MmY/l4XR3LTz0t
	6lrG2HqQ3HyoiNIRJ19K14oMKvEQYfpuCFvWpKVMRGAmrKztm3vi4aVymuLHpt6T
	hAa3hJn5wUK7V+voSLLBNJ4JOYsKQDqgAezNRh9l4xAgftLHiuNQ7S+pgUMgjxLK
	82hWpA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hbtg28a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:31:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso3629715a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 00:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787556692; x=1788161492; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GGW/2o11ZVLZJS92GyTOiHn4rgI8UzeMrVaPCXBo8Ng=;
        b=eAIkUQpYJqhiIndoCPNXt0ONFD5P9tIypOibq2Pv6WD/LmZAVQAhOO21PfOH4DfU+S
         SGv836YsqzrJzOVxoWSd/veIWflY903ZInTyLK4/SdtmcvoAbNaZ3heQ/QR13rBYoBNb
         lZbXyrN2WfY7UCSKp/YCgt34ZAbRqeKbm0vv1nJYTNpILRVct/BdV3pR/0D4+5bAFZZS
         QZe6vT2FEgibMImaLLK3vOw5rOf1WoKt3dGS5tUc7N2ckDdoY9J4JP7RsyrE/0D3bCoj
         uREPD8mpEgRo1nagyvGX5PzugjTHEPdP0QJEtEgynOhXUYyEfqSMatnRsM78Fih+PYbC
         MGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787556692; x=1788161492;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GGW/2o11ZVLZJS92GyTOiHn4rgI8UzeMrVaPCXBo8Ng=;
        b=gB8CgB6/lZgCc8gpsmFttPEdtyx7zJEV3D9/VZ5I+J4pwmJtLOrnBJnGZ8CxKLvG19
         FgcHFrdd03vEtdenaL8O8ZuKx7zbXzl4sztXukexdesdcGp8W8OoOsC3NXgfa9hb6KcJ
         BvKwZpHsUfTM7H01nek9ZHSRjaS0XJvQzmKXGjnkDizx0Jcw4Y079ACMr1y331tbxyDX
         9mDZgFA+3Ed/l5yjrW0rFfizKajOeTwMTUt0VLH2EfejLe1jzB/xvu1gJRiRlbuizmMC
         VSh4qcqIs2OJGAILhD2KAjxRdGhjJScRZZNa/HzELX2U4/JTIjC0kb8RE7zDQsCdRI60
         GdVw==
X-Gm-Message-State: AFuF++l/P/JYYw98ksELE/DKDBNNkFuBcy8UZz1dKlDH44uzWGv5OJaB
	1EPY3nsjB1xIQln6JFlXLxFjHXb2wbZh2fvA6WRwiJOv0QbsHrsTxjLv/9gIEqgB4I1Q+Gw+m8t
	uL0d5CEd3JMk/NImGlVyfq2U6IfJNoui6o/AgliyW6GjCIlwRYciOWN189xXjA+HLPZ5B
X-Gm-Gg: AR+sD12T9F4Z4JL1xhZCaAD/rOFKKoQL5O16H1IVqSI4HQpknvh0t1VMHf91NsMlKaO
	5+TugEL1x6HA0Kv9FXSdkzRH9W+Gx7RF3I+o5lrZ0EuNJMoeBIXBNGnMDps7Av3hkb6+vi4bzsg
	pOCQ0wWM+WHSr7Jxch4Att7/PyamjPWo6UZUkrpxIOvC/RYcOP7g11WoCFDJ6QTx/5G69QCBomt
	FMF1AnLPH+lMTWEbRkx0C1C+fl2KTx8Z2uwZ1h8lt/rwLCyAnk1U9HmcK9i5WytiKUiSphnw13D
	44kxqrS9N9mMXFAhb7dLu02wZrRV5H28k3HtmaAKIjfmcehJvJsDzcB+rKouIG2saUuCa9eEYIg
	9BVnumo/vjGGrBgogN7JdPY0N9zCW
X-Received: by 2002:a17:90b:5112:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-395df3cf1c8mr30844165a91.10.1787556692372;
        Mon, 24 Aug 2026 00:31:32 -0700 (PDT)
X-Received: by 2002:a17:90b:5112:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-395df3cf1c8mr30844077a91.10.1787556691821;
        Mon, 24 Aug 2026 00:31:31 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e49b406bsm8987302a91.8.2026.08.24.00.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 00:31:31 -0700 (PDT)
Message-ID: <672f91dd-749a-4448-ab32-50ac064a4b98@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 13:01:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: advertise linear-only modifiers on platforms
 without UBWC
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260819-remove_ubwc-v1-1-5357d5cc517f@oss.qualcomm.com>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <20260819-remove_ubwc-v1-1-5357d5cc517f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2NSBTYWx0ZWRfX5wZX+T8Gbyk9
 iFBCV6xYPfBWZzKPsYtvbGpESOWEP0R3o1JyH/SNwdWdIx8YfzmjbZN9ehxKzOI0APjILPIaZpf
 lZlJePO90/bQiGLDwZZksjR51NHdBPy8Hxkx6jE4FgCMt1VRIytgJpHbMRs+vZ7nMT7iFUPCS4t
 oKkYoEwO0zCtEL+cd1hzPde1wsGAdav/njAiitBDvWFoQ9g8hOA3y5Da56XXGdhN8caYGxjW/df
 2mP3X3UYtfFTpD91mh8sHuuYspGJqJrDkcyIrPJhC0HiHa9qp8E6ukRTbPdZRSGwqdP90bAVU4i
 5hKA4F58F1RCUbWI1B9eM1NjWhg3gLuqdRdVIP2Is3q3HityDmMEi6BuXVNWtLnfcHkfPGTya26
 tuytTXibNDKxH6WJXL8X0McjtuAnh1SWJe4IpfMlypwdgHuIE5Ssz8y1lS4+wAu8LF/+f3W4W4P
 P8/SG7Cfl5wvQ7yBELA==
X-Authority-Analysis: v=2.4 cv=JL0LdcKb c=1 sm=1 tr=0 ts=6a8bf355 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=6mis40y7Vwa8aKjL8IcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2NSBTYWx0ZWRfX/MmCuHKfvL7X
 FHqxSz4ktcGcO//PfLQfIjafZA+8Zy+byDtfXVY9Fw/T+f2GtQEFZwqVmGm19UqLhNlzByQZuEI
 XTV8dMgsgikilY5T8UoSKtMOh3NgxBA=
X-Proofpoint-GUID: BDKMNhWdimPiDU4tPw3D4s0MRKrRCyV_
X-Proofpoint-ORIG-GUID: BDKMNhWdimPiDU4tPw3D4s0MRKrRCyV_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240065


On 8/19/2026 4:53 PM, Mahadevan P wrote:
> Certain Qualcomm targets like QCM2290 and Shikra do not have UBWC
> support. On such targets, advertising DRM_FORMAT_MOD_QCOM_COMPRESSED
> in the supported modifier list causes userspace to attempt UBWC
> allocations that the kernel rejects:
>
>    msm_dpu: [drm] *ERROR* unsupported format modifier 500000000000003
>    msm_dpu: [drm] *ERROR* unsupported pixel format: AR24 little-endian
>
> On platforms without UBWC, only advertise DRM_FORMAT_MOD_LINEAR to
> avoid exposing formats that the hardware cannot handle.
>
> Fixes: 71c5c23be874 ("drm/msm/dpu: check ubwc support before adding compressed formats")
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 7b92082d35a6..c8bd034690cb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -94,6 +94,11 @@ static const uint64_t supported_format_modifiers[] = {
>   	DRM_FORMAT_MOD_INVALID
>   };
>   
> +static const uint64_t supported_format_modifiers_no_ubwc[] = {
> +	DRM_FORMAT_MOD_LINEAR,
> +	DRM_FORMAT_MOD_INVALID
> +};
> +
>   #define to_dpu_plane(x) container_of(x, struct dpu_plane, base)
>   
>   static struct dpu_kms *_dpu_plane_get_kms(struct drm_plane *plane)
> @@ -1836,7 +1841,10 @@ static struct drm_plane *dpu_plane_init_common(struct drm_device *dev,
>   	pdpu = drmm_universal_plane_alloc(dev, struct dpu_plane, base,
>   				0xff, &dpu_plane_funcs,
>   				format_list, num_formats,
> -				supported_format_modifiers, type, NULL);
> +				(kms->mdss->ubwc_enc_version == 0) ?
> +					supported_format_modifiers_no_ubwc :
> +					supported_format_modifiers,

Can we just pass the NULL here in case no ubwc modifer are supported 
instead of "supported_format_modifier_no_ubwc"?

would not it automatically handled in this function 
__drm_universal_plane_init as default_modifier?

Thanks,

Nabige

> +				type, NULL);
>   	if (IS_ERR(pdpu))
>   		return ERR_CAST(pdpu);
>   
>
> ---
> base-commit: e6664f2b33db9b6811eb4cec109f06cb2b4f458d
> change-id: 20260819-remove_ubwc-0180dfb2908c
>
> Best regards,
