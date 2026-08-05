Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62686481FB7
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2026 17:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785949713; cv=none; b=q/CoQwJkSkp4LPXlYiQo1t5XUx2zLo9bUkzV+TAXOScoa5xDnHgd+O9q+DhlqeN2ILPDIaOq0nZ/vfBb2bDjJVD1v4jTecgaAwJxBp5uU2P902tqDJ+lCg2hm9iAQI4BIkgxJL6GH2fdD+8Q2ExLoVw/oh0TLwGRyQd0vkxMWU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785949713; c=relaxed/simple;
	bh=cDyybpxaJw0dN7XiSv5oVDTCSzkuk9r770BM+Foc2mo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RAHUWu1AF/5WQZelsJaFf22c/1Oi0aL7jdIZ326KqMy9a0qOJ/V+TYg7s4l0R1y5Xab+6wyKPXcb09oKZhdp5/GfgHbDmRHzdRMr7TDzavdXwfFTnvQMnbMxY9CReVslkKl8gUhn4VJWeMynW6CuDiKvU1OQGaWpI/zhp5AFy0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hEb2OuOq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EGPACMiU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hEb2OuOq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EGPACMiU"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675FV8b43867596
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Aug 2026 17:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eU7mKjAnDcc2/wcEmoQ8anq7BCf/juwow6LHd13FvQM=; b=hEb2OuOqv4mSzHll
	phvU3ZhD9ujTGe0AobaIoAJYdNSDOQxvQK+M+JC5CfF9YF4q0/mRAg4/9SpjfjQ2
	+KuMHA/DCE056wApblXq/ORUJC+SQu+IAyI7VXeCOsfPh4qXhq8M1Q3eNc06+9OZ
	BluzWWnC1UzJF4Hez2WUioK7pgPDBdO423J0GwIxFB9phtGervYNSNVo28BLnrY7
	+2p+1ICA63DY9XoQlm7i9U4Tx00cGj765VDlzMCWV3H38r7NQjqz5GRGUg5rOYiN
	+JTMc+oUdwvT/o8dEH0KgklxRWE2lg9xSa4Tg1t+ulcf0GF5cuuhEjinsw6w9f4+
	HfugjQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5dk1ahs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 17:08:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cea6a46766so21635445ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 10:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785949710; x=1786554510; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eU7mKjAnDcc2/wcEmoQ8anq7BCf/juwow6LHd13FvQM=;
        b=EGPACMiU623ioqUiM2r6v/HPgR/maGhr0gyXjYD/X+sOtbVcmFM40NhcGfdRwwULWQ
         B0MuRwLN8afTmaAA0jl7fdChdHEJXHmrVGNGUJiH7ne8nYH0sZ9c+5NLhTbwhQyEpTHf
         ge8JkXX/Kb1WAk7xFYZFSyFaqHFGaLmxHCZqazPEbTQ67B5Vn4IWLa/wG/um2ReL6A7o
         7AjlM6YlYItLeRK5G4zh+rUleoTQfkU6T9yaAx+UriqiDaOegtCM9bpcIvRD7l7IszML
         EAz7XNQYqVPcRZMacgn3njYPzmmsve6aTa5Cnm+L3N4v4uQ+MqKWaXnXtMNq3UtZm8yV
         SCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785949710; x=1786554510;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eU7mKjAnDcc2/wcEmoQ8anq7BCf/juwow6LHd13FvQM=;
        b=XudXDc9W/l/1YoWWDhHJSC3ToxSTB4YWBUvtvX7UJDennCsPflED/h98PesQYBEKF7
         RvUiiVhe1423zn4HmnpyxReYrNphmZBvdO7OZW01p7KE0qFKT+6Wl+SFpqgEcM6BBULE
         wD9Rx5P0D3zELhUcHeHrDCQ9/zKTslxJbMvD3oFeBaB/bP+pUUzOB+x60gQPkPaRdPu0
         0aEEGYFH23c/femBMWvLYm+Kg9l2p3T9243HcFEZxG4N/krx3dsQac3bASVNOqp9L3eZ
         F4lIyCmlUwNGvkZXhQu005tusfk9KStU/T57Vvw/MWZXmAbzUXJVcWMyHl3oVX98V453
         Talg==
X-Forwarded-Encrypted: i=1; AHgh+RqP2B+KjBVXz7YwyosTrcxkhMaFmwg8tgz8/JGGRA0ZK6lqQTg3rx1Kc5GjgJVW9PnhTy44k7SfT8YF4JOC@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6XXlyz8gOxpBg7UseN+i1fkY9CuADfsGeKgpqdSo3oWPUdIS0
	fuyL1tCrLhZy2it+ZEXC7vPqlmjDe7JK+1lbqLF5qqJ1rZvSS80FW3j3Bxwyf+rLFGB+KFsvnl9
	NInPjvQPtWSfnWyM6Ux1owzJvXEiPg5+6HOOrpTdBfSqwWR0MAf2CvYf4cutwSbnYhFQh
X-Gm-Gg: AR+sD10aj7AScePE7yk4736v1Ze4+BCGXUVcmAO5TR071a7UIAVkMFldWPOeATrvoFV
	7EIXXgo3eVlOrjjvs5kk6760ZZccZM1FWVrGWqCbUQb6gspCuvIk1CUopUOyssnYeJzwonoCTgv
	Fy0KSwmdO1lgOvhcUUNLvbhayaOHb5xhyrzLlNEJ0lT3lYV+BG0Verv7BGs3QQrf0PMFim14Em/
	UMrjINMSdg+bZihA2f0A6VWNyA2xy7HkI2Ukz0YmlzpADT9wlDMknzjREV5vzTGXIwxrdaPVf2K
	WMi2OqG5tfsGWJtPxibylkWYiFrluldWaZ55voffFwbhcmbVHmVbQ4EOaBalwe0DVqciQixGqMm
	j0FEMAjqQqtnpBqMuo/p/+ch1rRHjSy8=
X-Received: by 2002:a17:902:e948:b0:2ca:d658:d874 with SMTP id d9443c01a7336-2d0ca961e2dmr104775795ad.23.1785949709654;
        Wed, 05 Aug 2026 10:08:29 -0700 (PDT)
X-Received: by 2002:a17:902:e948:b0:2ca:d658:d874 with SMTP id d9443c01a7336-2d0ca961e2dmr104774915ad.23.1785949709070;
        Wed, 05 Aug 2026 10:08:29 -0700 (PDT)
Received: from [192.168.0.6] ([183.83.142.209])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586401627sm21507802eec.10.2026.08.05.10.08.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 10:08:27 -0700 (PDT)
Message-ID: <ee623b8b-056e-5d07-7e69-9aef94ad32e0@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 22:38:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/9] media: iris: split Gen2 firmware data for
 vpu2-generation SoCs
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
 <20260709-iris-vp8-v1-4-6af3ab578a7c@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260709-iris-vp8-v1-4-6af3ab578a7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sDgS-6KMSH1ZCQjQGih_GlV6QPB6CnfK
X-Authority-Analysis: v=2.4 cv=Or9/DS/t c=1 sm=1 tr=0 ts=6a736e0e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=HwWiqg1urrzBETcKeqCncQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=f4rWUTw3jQouaEm55YcA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDE0MCBTYWx0ZWRfX9ewipG5//8zS
 2l58+59Nej+n2NJY3SxBo0A9MvJq21UInn/Cdo+jv7Zq8HmRZ7XI/NYh/x6nruSetZeSJie3XXo
 lPuFKuSxdB17MABM5l0ob/8a7otehAHQtcZkBRF2Wh/sPsPimry102B/V30YLsTYiU6PEF3CvRp
 tZVvuEfcQcPtKr+C67DPDrFuL64p0ovpzSDNIqwC6YjAMTew69U3SqOYcp5UlXfSdNPZaD4a69T
 bTtSZgny+KUryRZ9MP9yC/E81WwmcInUXMtwnKtIakOZVCk3t+O8CUvfUA7sNgmUy4F1r2hpDt5
 VlLpC9A6DlOcnQzavEMSLAfydAHPuQEERO8DAKXj0KQiYFdGmo/fRpsaus2knUdMXywqXRWsUeM
 7zeSeU7X1X0gbyRMOMK+FV8V1EjIz3YO+4TjDEMSd6c5IVAkujsJR2oJK1Am3uc4jfjv0QuP+fH
 g85TK3d19hgV5qsVJfA==
X-Proofpoint-GUID: sDgS-6KMSH1ZCQjQGih_GlV6QPB6CnfK
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDE0MCBTYWx0ZWRfX2OX7IHccnzVb
 GWVdIs4SI9u/0BYnjNWB2c3nIQPQunza+qdmwVaSeHRMa0mSd6JfgQ6nf3oOCNGh8qNM/gJs4S6
 mKEKSezmIXjtD+8W+yzgACbV68i86B4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050140


On 7/10/2026 1:07 AM, Dmitry Baryshkov wrote:
> The single iris_hfi_gen2_data instance is shared by both vpu3x SoCs
> (sm8550/sm8650/sm8750/x1p42100), which support AV1, and the vpu2 SoC
> sc7280, which does not. This is harmless today because the list of
> advertised decode formats is kept separately in the per-SoC platform
> data, but it prevents moving those format lists onto the firmware data
> where they belong: a shared struct cannot describe both an AV1-capable
> and an AV1-incapable generation.
>
> Add a dedicated iris_hfi_gen2_vpu2_data instance for vpu2-generation
> SoCs booting Gen2 firmware, using a decode cap table and config
> parameter lists with all AV1-specific entries dropped, and point
> sc7280's Gen2 firmware descriptor at it. The vpu3x SoCs keep using
> iris_hfi_gen2_data unchanged.
>
> No functional change: sc7280 already did not advertise or accept AV1.
>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 247 +++++++++++++++++++++
>  .../platform/qcom/iris/iris_platform_common.h      |   1 +
>  .../media/platform/qcom/iris/iris_platform_vpu2.c  |   2 +-
>  3 files changed, 249 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> index f89245269e8c..110b5630902f 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> @@ -280,6 +280,189 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>  	},
>  };
>  
> +static const struct platform_inst_fw_cap inst_fw_cap_vpu2_gen2_dec[] = {
> +	{
> +		.cap_id = PROFILE_H264,
> +		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> +		.max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH),
> +		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +		.hfi_id = HFI_PROP_PROFILE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_u32_enum,
> +	},
> +	{
> +		.cap_id = PROFILE_HEVC,
> +		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> +		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10),
> +		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> +		.hfi_id = HFI_PROP_PROFILE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_u32_enum,
> +	},
> +	{
> +		.cap_id = PROFILE_VP9,
> +		.min = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
> +		.max = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_VP9_PROFILE_0) |
> +				BIT(V4L2_MPEG_VIDEO_VP9_PROFILE_2),
> +		.value = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
> +		.hfi_id = HFI_PROP_PROFILE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_u32_enum,
> +	},
> +	{
> +		.cap_id = LEVEL_H264,
> +		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
> +		.max = V4L2_MPEG_VIDEO_H264_LEVEL_6_2,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_2) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_2),
> +		.value = V4L2_MPEG_VIDEO_H264_LEVEL_6_1,
> +		.hfi_id = HFI_PROP_LEVEL,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_u32_enum,
> +	},
> +	{
> +		.cap_id = LEVEL_HEVC,
> +		.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
> +		.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2),
> +		.value = V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1,
> +		.hfi_id = HFI_PROP_LEVEL,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_u32_enum,
> +	},
> +	{
> +		.cap_id = LEVEL_VP9,
> +		.min = V4L2_MPEG_VIDEO_VP9_LEVEL_1_0,
> +		.max = V4L2_MPEG_VIDEO_VP9_LEVEL_6_0,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_1_0) |
> +				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_1_1) |
> +				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_2_0) |
> +				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_2_1) |
> +				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_3_0) |
> +				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_3_1) |
> +				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_4_0) |
> +				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_4_1) |
> +				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_0) |
> +				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_1) |
> +				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_2) |
> +				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_6_0),
> +		.value = V4L2_MPEG_VIDEO_VP9_LEVEL_6_0,
> +		.hfi_id = HFI_PROP_LEVEL,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_u32_enum,
> +	},
> +	{
> +		.cap_id = TIER,
> +		.min = V4L2_MPEG_VIDEO_HEVC_TIER_MAIN,
> +		.max = V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_TIER_MAIN) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_TIER_HIGH),
> +		.value = V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
> +		.hfi_id = HFI_PROP_TIER,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_u32_enum,
> +	},
> +	{
> +		.cap_id = INPUT_BUF_HOST_MAX_COUNT,
> +		.min = DEFAULT_MAX_HOST_BUF_COUNT,
> +		.max = DEFAULT_MAX_HOST_BURST_BUF_COUNT,
> +		.step_or_mask = 1,
> +		.value = DEFAULT_MAX_HOST_BUF_COUNT,
> +		.hfi_id = HFI_PROP_BUFFER_HOST_MAX_COUNT,
> +		.flags = CAP_FLAG_INPUT_PORT,
> +		.set = iris_set_u32,
> +	},
> +	{
> +		.cap_id = STAGE,
> +		.min = STAGE_1,
> +		.max = STAGE_2,
> +		.step_or_mask = 1,
> +		.value = STAGE_2,
> +		.hfi_id = HFI_PROP_STAGE,
> +		.set = iris_set_stage,
> +	},
> +	{
> +		.cap_id = PIPE,
> +		/* .max, .min and .value are set via platform data */
> +		.step_or_mask = 1,
> +		.hfi_id = HFI_PROP_PIPE,
> +		.set = iris_set_pipe,
> +	},
> +	{
> +		.cap_id = POC,
> +		.min = 0,
> +		.max = 2,
> +		.step_or_mask = 1,
> +		.value = 1,
> +		.hfi_id = HFI_PROP_PIC_ORDER_CNT_TYPE,
> +	},
> +	{
> +		.cap_id = CODED_FRAMES,
> +		.min = CODED_FRAMES_PROGRESSIVE,
> +		.max = CODED_FRAMES_PROGRESSIVE,
> +		.step_or_mask = 0,
> +		.value = CODED_FRAMES_PROGRESSIVE,
> +		.hfi_id = HFI_PROP_CODED_FRAMES,
> +	},
> +	{
> +		.cap_id = BIT_DEPTH,
> +		.min = BIT_DEPTH_8,
> +		.max = BIT_DEPTH_10,
> +		.step_or_mask = 1,
> +		.value = BIT_DEPTH_8,
> +		.hfi_id = HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
> +	},
> +	{
> +		.cap_id = RAP_FRAME,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 1,
> +		.hfi_id = HFI_PROP_DEC_START_FROM_RAP_FRAME,
> +		.flags = CAP_FLAG_INPUT_PORT,
> +		.set = iris_set_u32,
> +	},
> +};
> +
>  static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
>  	{
>  		.cap_id = PROFILE_H264,
> @@ -1119,6 +1302,70 @@ const struct iris_firmware_data iris_hfi_gen2_data = {
>  	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>  };
>  
> +/*
> + * Firmware data for vpu2-generation SoCs (e.g. sc7280) booting Gen2 firmware.
> + * These do not support AV1, so the decode cap table and the config parameters
> + * omit all AV1-specific entries.
> + */
> +const struct iris_firmware_data iris_hfi_gen2_vpu2_data = {
> +	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
> +
> +	.core_arch = VIDEO_ARCH_LX,
> +
> +	.inst_fw_caps_dec = inst_fw_cap_vpu2_gen2_dec,
> +	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_vpu2_gen2_dec),
> +	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
> +	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
> +
> +	.dec_input_config_params_default =
> +		sm8550_vdec_input_config_params_default,
> +	.dec_input_config_params_default_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
> +	.dec_input_config_params_hevc =
> +		sm8550_vdec_input_config_param_hevc,
> +	.dec_input_config_params_hevc_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
> +	.dec_input_config_params_vp9 =
> +		sm8550_vdec_input_config_param_vp9,
> +	.dec_input_config_params_vp9_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
> +	.dec_output_config_params =
> +		sm8550_vdec_output_config_params,
> +	.dec_output_config_params_size =
> +		ARRAY_SIZE(sm8550_vdec_output_config_params),
> +
> +	.enc_input_config_params =
> +		sm8550_venc_input_config_params,
> +	.enc_input_config_params_size =
> +		ARRAY_SIZE(sm8550_venc_input_config_params),
> +	.enc_output_config_params =
> +		sm8550_venc_output_config_params,
> +	.enc_output_config_params_size =
> +		ARRAY_SIZE(sm8550_venc_output_config_params),
> +
> +	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
> +	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
> +	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
> +	.dec_output_prop_avc_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
> +	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
> +	.dec_output_prop_hevc_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
> +	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
> +	.dec_output_prop_vp9_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
> +
> +	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
> +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
> +	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
> +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
> +
> +	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
> +	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
> +	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
> +};
> +
>  static const struct platform_inst_fw_cap inst_fw_cap_gen2_ar50lt_dec[] = {
>  	{
>  		.cap_id = PROFILE_H264,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 5afe395cc4a0..9743573ab083 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -57,6 +57,7 @@ enum pipe_type {
>  extern const struct iris_firmware_data iris_hfi_gen1_data;
>  extern const struct iris_firmware_data iris_hfi_gen1_ar50lt_data;
>  extern const struct iris_firmware_data iris_hfi_gen2_data;
> +extern const struct iris_firmware_data iris_hfi_gen2_vpu2_data;
>  extern const struct iris_firmware_data iris_hfi_gen2_ar50lt_data;
>  
>  extern const struct iris_platform_data qcm2290_data;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> index e194f67a6f48..8f01cf7f6d49 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> @@ -25,7 +25,7 @@ static const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
>  };
>  
>  static const struct iris_firmware_desc iris_vpu20_p1_gen2_s6_desc = {
> -	.firmware_data = &iris_hfi_gen2_data,
> +	.firmware_data = &iris_hfi_gen2_vpu2_data,
>  	.get_vpu_buffer_size = iris_vpu33_buf_size,
>  	.fwname = "qcom/vpu/vpu20_p1_gen2_s6.mbn",
>  };

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

