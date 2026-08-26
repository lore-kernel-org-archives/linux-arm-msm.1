Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBD22EC0B0
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 04:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787717920; cv=none; b=K2UuhbPIuL2KlsdGJh6K3lpXm3Pu7W8w7XaQ+VvR3Y6qyK7geSXXY1n+fKFIfbDz31vweaR74hUfprstu34J9cBHO9ZEYu9IYWUQ8GfiXSc1oE0i+EWd4aw8rcCc2NmI3Gs6abR69cEtSM50+XjllfMhfAQrIAbDVmCH5xtluWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787717920; c=relaxed/simple;
	bh=O02IFdfLn0j7O5nSu3I69uvU38ZAD2kU3BWZeHxECJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rynqYDGDteiHy0AVJSo8jmGqFve3aEwN0dQI4lbl/uo85VkMlM4JGcuWBcBp1ET8D1CMCh+q032/9qn/2wsHbG2KdxoJxmBwCedAbMm4xZMRBj8C51FZEp8xzxgaAGyWbKnvv3SWR7wc7e93eUgk5CveX3WZPSM502whzBnNAdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SzEECxop; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Majh0dbO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SzEECxop";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Majh0dbO"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q3HIGb3370044
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 04:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JVdkJTOOtrzsiO/xnf8zlqNNe8LbIZ6+mDsdSkkWs/A=; b=SzEECxopPfG2gTtm
	2sCrWYNWyDgH0Nul5H8Zgzhf8cuH//RbOW8k7fmUdsI+2B+gRZlj5T01zqZM35rE
	nmBjxyCV8WEHjz7PcV5LSwOpW8CDNRD0Qs3sUlWE5ce6Jht+muY1jjEFN9ooI4Ka
	TcwXGK1B4kXibMZB4tujBryRuNOBwJkM/LlyLqxYZUWpWxb4HKogjknIujXWz819
	BPGFk3KCTzHqOyTNJ6EcFI3goiJvWWjfdS72qqhBWZqxSnopMqDfutk4OMG8jDrz
	sUiuirrZaBZItG8lF1jBHo4EfIJJZHX8sFJgjROlDePBRyi3xF/i0dUc/WlgCN5Q
	HOkvlQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9cgu2urr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 04:18:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6fed0652bso8510425ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 21:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787717916; x=1788322716; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JVdkJTOOtrzsiO/xnf8zlqNNe8LbIZ6+mDsdSkkWs/A=;
        b=Majh0dbOb8C32l8OBfAESFdy7Oc+3Pw1ZZOHEEYxm6BTSoEhhS+hfzJa0K/hepfLMV
         FTggoraiZUJV8HiAB8lVmXhSajIx5ad7xNgPYjvi2PtBfuQfYkomGEA1Yi/a7K1wggf3
         r3noF93Jymi6LjCsRJ4FxGcy+dkntW8hrsUUIzK9Y266hpDeMzsOtwsfObTDEjiVjpSn
         7ejnsLLSAQaynZdj3Dxt3sWTJrVaCv3QwsMzypoemPD6ZMDH13FWMAuOkUox6rmGNWhs
         eNUfGu6MHWirLNY2rD+PClyLHY+8PbE+D7VXRguRZh9yX+JCpHGVSwzfwl5vHHaYt1sj
         lwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787717916; x=1788322716;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JVdkJTOOtrzsiO/xnf8zlqNNe8LbIZ6+mDsdSkkWs/A=;
        b=JPIvyHfp5Zp/d5DHpIjtN2lFot43txHAmu/rWh2J5HEjIlJiJK7oGO/QRZ/nPnNp8N
         f2KVs07vIuaFP8P2VeUBGZj9ZRiOHNY6I0FvCAUPe6wb8j9jtdiaYLuqnJF/HPG3cVZX
         C/ctwuJYyObP+5eAPnuAnr1ZF8nNZ7m3XxZjsNCaKr4LVP+sZPfNse6Mt73E//EYpwpa
         RdddkaY91uxnJ8MxqNYe0j22u7zP7vo5pG/yxwzJUCePkHSMzKqjHa2ew1h4GVYGc+iy
         HTmIo9JuWFmcrtMgb3cXfnwRuYAM4XNy/+gQ7t8b1ogCwyMXh2H5swlX2KnnJJhluNPh
         93ew==
X-Forwarded-Encrypted: i=1; AHgh+RqyuZ5iLBe+n4oydRw90plvBZHCemstXws+HiPUBhojMkcbcJuf4MYfMobFKVSyQ17JL2MSoo36/7tEOeSl@vger.kernel.org
X-Gm-Message-State: AFuF++lg3pCw4gTJUbsTCEJK58DSLNc5+4QFOq4j9EU9grjzmZQo1Qok
	g7SYa2bBSHjCkP3wj4KtqU1ThtS2ZMW37dFtI+pH9SX4y3hogfCMb/g+5qc+ON3iJp2xKDk4AGv
	YOT65O7ArL9CtZ674b4H0QEk4NUFipvZnENDMl2LFOXoZ0geK6iRFfakk/5GZUHgvas2lix8AWa
	iA
X-Gm-Gg: AR+sD130Xjh3qdaLgt3bfIaoSaMKNvQS/71o9r4dn4PtfC69Wol9uv8oQd7b5kIU0b9
	GEIumbxKjQDmsuHAApipqRq7LOn1edui7cP6HYBWHG09GCAj3lQ7MB47BE0am2r5ICAYMThpDdn
	3sjpkkgtF/X+tNq56o0ArvAB+Esrs3W6RGewV75yRHCAzOHg4G+HPrXZbyDKcX26OrI8fFu2sUB
	KeEIlGeb081OxvVLWJS5dgxkpjK7narIXYwJ2zfP4sxi+VziJ+C1h5kgF5fLMmexf3SnbS6js2E
	l0Fd4sEu7A+LkiaWKnrcMrARHWeifbljXQmrfjJEXMQnaSCuVqmIZedRNR8vZkYO9I8RkNhL6rl
	U3uPQJcrtv6+gF6/RTn9Cm+wmZXWnsUio
X-Received: by 2002:a17:903:46c5:b0:2c8:f34c:82c0 with SMTP id d9443c01a7336-2d707a5d1b9mr65465995ad.2.1787717916183;
        Tue, 25 Aug 2026 21:18:36 -0700 (PDT)
X-Received: by 2002:a17:903:46c5:b0:2c8:f34c:82c0 with SMTP id d9443c01a7336-2d707a5d1b9mr65465155ad.2.1787717915614;
        Tue, 25 Aug 2026 21:18:35 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32842e07a8fsm2503467eec.20.2026.08.25.21.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 21:18:35 -0700 (PDT)
Message-ID: <c3eaa32a-d55e-c9e8-6047-a37dc82e16ef@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 09:48:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 6/9] media: iris: add VP8 decode support on Gen1 firmware
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260709-iris-vp8-v1-0-6af3ab578a7c@oss.qualcomm.com>
 <20260709-iris-vp8-v1-6-6af3ab578a7c@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260709-iris-vp8-v1-6-6af3ab578a7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDAzMyBTYWx0ZWRfXxwqARFq00j6h
 oSMZ0rzq9sHo/HRq1WQ+JIRye21DNrlgc824gIOAiynetO62SIioQgsxUXT3RrGRzheZEnzMGpH
 jGNvZHWGurAV1n6fxFHPTepem/35v+s=
X-Proofpoint-ORIG-GUID: KgHOqQsqAbeoTWVRcUBdmGgTv6EN341b
X-Proofpoint-GUID: KgHOqQsqAbeoTWVRcUBdmGgTv6EN341b
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a8e691d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=8-U3zjiI2bJlbq0ytkEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDAzMyBTYWx0ZWRfXyT6oKsR8WzgW
 MuzHFwtzGfbF32Xpenvkrkl8zfPO5VPw8wi4lSEbs2m4d+QReXz+iyBu1DabeoLixyZQd3/RFmb
 SzWiKUxWeQaJT5qwUmD0pe0PBRbDvuPNteNulF12dotQ8LuL2DFVxirIusVzPVjSiwigpdYU5AY
 /x7piMUo+mS6UVVKdL2kHyxiOdG9j0MO61VmA8XHoepEnEpyZT2cUZrPkKUDQPYc2SuMAHHkq/d
 jnHoRpb7foA9bM2wNJJt1t0ibWEsl7PBuK0mKbvbhNqsFY8sPMB5a8bdEpWMesCFCGcpskJP4mo
 zfTIyGrbDjPw+AVhi8McIsBBn8LUfu5BwB5LEu27qLwZ+i9LAbs8BDhyw4eAqC9yBQQ+88TVGu2
 +MtT053EwGeKbpcnr5iQrB4OlxVMYtvTaUHZxrjTd9QAQLeFv5gZ5oB4hkDXNYwZ9wUJnpQT2it
 N226b8nhecSNvZJkQCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260033


On 7/10/2026 1:07 AM, Dmitry Baryshkov wrote:
> The Gen1 firmware supports decoding VP8, but the iris driver never
> advertised or wired up the codec.
>
> Add the VP8 HFI codec code, map V4L2_PIX_FMT_VP8 to it in the Gen1
> session open path, and compute the VP8 internal buffer sizes (bin,
> collocated motion vector, line and probability-table persist buffers,
> which reuse the shared VPX helpers). Advertise the codec through the
> Gen1 decode format list and register the VP8 profile menu control.
>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      |  7 +++
>  drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 22 +++++++-
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  3 +
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  1 +
>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 64 ++++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  3 +
>  7 files changed, 99 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index c12fe724dfb8..1bd6460a1b0a 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -28,6 +28,8 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>  		return PROFILE_HEVC;
>  	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:
>  		return PROFILE_VP9;
> +	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:
> +		return PROFILE_VP8;
>  	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
>  		return LEVEL_H264;
>  	case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:
> @@ -171,6 +173,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>  		return V4L2_CID_MPEG_VIDEO_HEVC_PROFILE;
>  	case PROFILE_VP9:
>  		return V4L2_CID_MPEG_VIDEO_VP9_PROFILE;
> +	case PROFILE_VP8:
> +		return V4L2_CID_MPEG_VIDEO_VP8_PROFILE;
>  	case LEVEL_H264:
>  		return V4L2_CID_MPEG_VIDEO_H264_LEVEL;
>  	case LEVEL_HEVC:
> @@ -558,6 +562,9 @@ int iris_set_profile(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_
>  	if (inst->codec == V4L2_PIX_FMT_H264) {
>  		hfi_id = inst->fw_caps[PROFILE_H264].hfi_id;
>  		hfi_value = inst->fw_caps[PROFILE_H264].value;
> +	} else if (inst->codec == V4L2_PIX_FMT_VP8) {
> +		hfi_id = inst->fw_caps[PROFILE_VP8].hfi_id;
> +		hfi_value = inst->fw_caps[PROFILE_VP8].value;
>  	} else {
>  		hfi_id = inst->fw_caps[PROFILE_HEVC].hfi_id;
>  		hfi_value = inst->fw_caps[PROFILE_HEVC].value;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> index 8119c639ec24..4c3aa5a03ddd 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> @@ -30,6 +30,17 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
>  		.hfi_id = HFI_PROPERTY_PARAM_WORK_MODE,
>  		.set = iris_set_stage,
>  	},
> +	{
> +		.cap_id = PROFILE_VP8,
> +		.min = V4L2_MPEG_VIDEO_VP8_PROFILE_0,
> +		.max = V4L2_MPEG_VIDEO_VP8_PROFILE_3,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_VP8_PROFILE_0) |
> +				BIT(V4L2_MPEG_VIDEO_VP8_PROFILE_1) |
> +				BIT(V4L2_MPEG_VIDEO_VP8_PROFILE_2) |
> +				BIT(V4L2_MPEG_VIDEO_VP8_PROFILE_3),
> +		.value = V4L2_MPEG_VIDEO_VP8_PROFILE_0,
> +		.flags = CAP_FLAG_MENU,
> +	},
>  };
>  
>  static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
> @@ -423,6 +434,13 @@ static const u32 iris_hfi_gen1_dec_fmts[] = {
>  	V4L2_PIX_FMT_H264,
>  	V4L2_PIX_FMT_HEVC,
>  	V4L2_PIX_FMT_VP9,
> +	V4L2_PIX_FMT_VP8,
> +};
> +
> +static const u32 iris_hfi_gen1_ar50lt_dec_fmts[] = {
> +	V4L2_PIX_FMT_H264,
> +	V4L2_PIX_FMT_HEVC,
> +	V4L2_PIX_FMT_VP9,
>  };

Similar change is needed for Kodiak Gen2 to avoid exposing AV1 decode support.

>  
>  const struct iris_firmware_data iris_hfi_gen1_data = {
> @@ -677,8 +695,8 @@ const struct iris_firmware_data iris_hfi_gen1_ar50lt_data = {
>  	.inst_fw_caps_enc = inst_fw_cap_gen1_ar50lt_enc,
>  	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_gen1_ar50lt_enc),
>  
> -	.dec_fmts = iris_hfi_gen1_dec_fmts,
> -	.dec_fmts_size = ARRAY_SIZE(iris_hfi_gen1_dec_fmts),
> +	.dec_fmts = iris_hfi_gen1_ar50lt_dec_fmts,
> +	.dec_fmts_size = ARRAY_SIZE(iris_hfi_gen1_ar50lt_dec_fmts),
>  
>  	.dec_input_config_params_default =
>  		sm8250_vdec_input_config_param_default,
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index ed9fef2aec08..90645ed3e0d8 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -105,6 +105,9 @@ static int iris_hfi_gen1_session_open(struct iris_inst *inst)
>  	case V4L2_PIX_FMT_HEVC:
>  		codec = HFI_VIDEO_CODEC_HEVC;
>  		break;
> +	case V4L2_PIX_FMT_VP8:
> +		codec = HFI_VIDEO_CODEC_VP8;
> +		break;
>  	case V4L2_PIX_FMT_VP9:
>  		codec = HFI_VIDEO_CODEC_VP9;
>  		break;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> index 2702f255bc04..13c8ff59d6e4 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> @@ -14,6 +14,7 @@
>  #define HFI_SESSION_TYPE_DEC				2
>  
>  #define HFI_VIDEO_CODEC_H264				0x00000002
> +#define HFI_VIDEO_CODEC_VP8				0x00001000
>  #define HFI_VIDEO_CODEC_HEVC				0x00002000
>  #define HFI_VIDEO_CODEC_VP9				0x00004000
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 317ba48e6305..84017b66e98f 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -115,6 +115,7 @@ enum platform_inst_fw_cap_type {
>  	PROFILE_H264 = 1,
>  	PROFILE_HEVC,
>  	PROFILE_VP9,
> +	PROFILE_VP8,
>  	LEVEL_H264,
>  	LEVEL_HEVC,
>  	LEVEL_VP9,
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index 88f130d09a6e..ca90414e6c19 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -293,6 +293,11 @@ static u32 hfi_buffer_persist_vp9d(void)
>  		HDR10_HIST_EXTRADATA_SIZE;
>  }
>  
> +static u32 hfi_buffer_persist_vp8d(void)
> +{
> +	return ALIGN(VP8_NUM_PROBABILITY_TABLE_BUF * VP8_PROB_TABLE_SIZE, DMA_ALIGNMENT);
> +}
> +
>  static u32 hfi_buffer_persist_vp9d_ar50lt(void)
>  {
>  	return ALIGN(VP9_NUM_PROBABILITY_TABLE_BUF * VP9_PROB_TABLE_SIZE, DMA_ALIGNMENT) +
> @@ -715,6 +720,57 @@ u32 hfi_buffer_line_vp9d(u32 frame_width, u32 frame_height, u32 _yuv_bufcount_mi
>  	return _lb_size + vpss_lb_size + 4096;
>  }
>  
> +static inline
> +u32 size_vp8d_lb_fe_top_data(u32 frame_width, u32 frame_height)
> +{
> +	return (ALIGN(frame_width, 16) + 8) * 10 * 2;
> +}
> +
> +static inline
> +u32 size_vp8d_lb_pe_top_data(u32 frame_width, u32 frame_height)
> +{
> +	return (ALIGN(frame_width, 16) >> 4) * 64;
> +}
> +
> +static inline
> +u32 size_vp8d_lb_vsp_top(u32 frame_width, u32 frame_height)
> +{
> +	return ((ALIGN(frame_width, 16) >> 4) * 64 / 2) + 256;
> +}
> +
> +static inline
> +u32 hfi_iris_vp8d_lb_size(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
> +{
> +	return ALIGN(size_vpxd_lb_fe_left_ctrl(frame_width, frame_height), DMA_ALIGNMENT) * num_vpp_pipes +
> +		ALIGN(size_vpxd_lb_se_left_ctrl(frame_width, frame_height), DMA_ALIGNMENT) * num_vpp_pipes +
> +		ALIGN(size_vp8d_lb_vsp_top(frame_width, frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_vpxd_lb_fe_top_ctrl(frame_width, frame_height), DMA_ALIGNMENT) +
> +		2 * ALIGN(size_vpxd_lb_recon_dma_metadata_wr(frame_width, frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_vpxd_lb_se_top_ctrl(frame_width, frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_vp8d_lb_pe_top_data(frame_width, frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_vp8d_lb_fe_top_data(frame_width, frame_height), DMA_ALIGNMENT);
> +}
> +
> +static inline
> +u32 hfi_buffer_line_vp8d(u32 frame_width, u32 frame_height, bool is_opb, u32 num_vpp_pipes)
> +{
> +	u32 vpss_lb_size = 0;
> +	u32 _lb_size;
> +
> +	_lb_size = hfi_iris_vp8d_lb_size(frame_width, frame_height, num_vpp_pipes);
> +
> +	if (is_opb)
> +		vpss_lb_size = size_vpss_lb(frame_width, frame_height);
> +
> +	return _lb_size + vpss_lb_size;
> +}
> +
> +static inline
> +u32 hfi_iris_vp8d_comv_size(u32 frame_width, u32 frame_height)
> +{
> +	return DIV_ROUND_UP(frame_width, 16) * DIV_ROUND_UP(frame_height, 16) * 8 * 2;
> +}
> +
>  static u32 hfi_buffer_line_h264d(u32 frame_width, u32 frame_height,
>  				 bool is_opb, u32 num_vpp_pipes)
>  {
> @@ -950,6 +1006,8 @@ static u32 iris_vpu_dec_bin_size(struct iris_inst *inst)
>  		return hfi_buffer_bin_h265d(width, height, num_vpp_pipes);
>  	else if (inst->codec == V4L2_PIX_FMT_VP9)
>  		return hfi_buffer_bin_vp9d(width, height, num_vpp_pipes);
> +	else if (inst->codec == V4L2_PIX_FMT_VP8)
> +		return hfi_buffer_bin_vp9d(width, height, num_vpp_pipes);
>  	else if (inst->codec == V4L2_PIX_FMT_AV1)
>  		return hfi_buffer_bin_av1d(width, height, num_vpp_pipes);
>  
> @@ -983,6 +1041,8 @@ static u32 iris_vpu_dec_comv_size(struct iris_inst *inst)
>  		return hfi_buffer_comv_h264d(width, height, num_comv);
>  	else if (inst->codec == V4L2_PIX_FMT_HEVC)
>  		return hfi_buffer_comv_h265d(width, height, num_comv);
> +	else if (inst->codec == V4L2_PIX_FMT_VP8)
> +		return hfi_iris_vp8d_comv_size(width, height);
>  
>  	return 0;
>  }
> @@ -1021,6 +1081,8 @@ static u32 iris_vpu_dec_persist_size(struct iris_inst *inst)
>  		return hfi_buffer_persist_h265d(0);
>  	else if (inst->codec == V4L2_PIX_FMT_VP9)
>  		return hfi_buffer_persist_vp9d();
> +	else if (inst->codec == V4L2_PIX_FMT_VP8)
> +		return hfi_buffer_persist_vp8d();
>  	else if (inst->codec == V4L2_PIX_FMT_AV1) {
>  		caps = inst->core->iris_platform_data->inst_caps;
>  		if (inst->fw_caps[DRAP].value)
> @@ -1101,6 +1163,8 @@ static u32 iris_vpu_dec_line_size(struct iris_inst *inst)
>  	else if (inst->codec == V4L2_PIX_FMT_VP9)
>  		return hfi_buffer_line_vp9d(width, height, out_min_count, is_opb,
>  			num_vpp_pipes);
> +	else if (inst->codec == V4L2_PIX_FMT_VP8)
> +		return hfi_buffer_line_vp8d(width, height, is_opb, num_vpp_pipes);
>  	else if (inst->codec == V4L2_PIX_FMT_AV1)
>  		return hfi_buffer_line_av1d(width, height, is_opb, num_vpp_pipes);
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> index 2085e316a6bd..684b459c0cad 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> @@ -66,6 +66,9 @@ struct iris_inst;
>  #define MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE_AR50LT (32 / 8)
>  #define VP9_UDC_HEADER_BUF_SIZE	(3 * 128)
>  
> +#define VP8_NUM_PROBABILITY_TABLE_BUF (5 + 1)
> +#define VP8_PROB_TABLE_SIZE (3840)
> +
>  #define SIZE_SEI_USERDATA			4096
>  #define SIZE_DOLBY_RPU_METADATA (41 * 1024)
>  #define H264_CABAC_HDR_RATIO_HD_TOT	1
>
