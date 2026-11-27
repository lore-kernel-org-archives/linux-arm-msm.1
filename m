Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782976;
	b=Z4sZxV+RSj3bvLurn2KnWekRRtnYTJpIaSOtoSHh/9003xnp2q02NCYULPprzukJQwRb
	 FNo0iLxn94TmRnEj45L7KuCz0zyfIkmWxJTXbgVYtY4Hw8f0FB9Ged3flAHzxnauF3zvg
	 uaePnEVIqnjfgG2jXz9Oy4nEtV/Nt91tKwHi66X77jbabu4H18AbH5LYxPFMC9/AtQW7N
	 8z0DtujbLcjusgjyAq62mIST+nFZlGnN/zDVk1K3xFxRUD2o8IxtHCwxvAW2fJly208eq
	 eBCJ1gj/rqFl1AY275TlP189dqx6U2wYzDnkEfKN/WFxAj2+XVJeMfjiughc1joppjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782976;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1N1CcmdcT3FVeB/E3+Ym0rYVGWZlRxMCPE1GM0GIUcE=;
	b=1qh4pkQ+RRQtQyaBBbz6RmYbJtaaBU2gKwv/ZdHo8oOYlzkORtkMYmP5U9Osf/0BYXRB
	 CMJFEeYa4z8pmMNU660RLvdHh9rz7AHLNv9dcpTTjek2foG2/u5lz95wqMqM/i6A4Jrc+
	 qU2thGfupWPEGGIK9CWK7sC1crKmDoBW267ecQABH26DluQmThvRfX/bL7ZooBi2MlN1w
	 R4lMlwK2QEE6r7kMaA/bQkSkl86oFHPARDIp9O9cko359A1xjQ4pyebrdJzSFI2PDoDeK
	 7WXm2y8T1gF0qj2eMgCoe7jAzXEfYlB3jp+OgdBnt332C7ra9w1wCzsipV4PtqogaJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yltmxzro;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AVGy2adv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADDA606A321
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ADDA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yltmxzro;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AVGy2adv
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApZuN2058138
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:36:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1N1CcmdcT3FVeB/E3+Ym0rYVGWZlRxMCPE1GM0GIUcE=; b=Yltmxzro9F0fz3IC
	sKBbAb5Uxce5VqZBvNq/Fgje0i5NCOWL+pIhyfEFZHA+IquEWiWO6pgdB/EHJMXX
	ew9DTVjvABGD2Mg+KGOl58n2qS9i4yywuf3cIZUXu1iABC/UNuNl11kOZ7xmoF0B
	qYjGR6rHsLpbdnyOvHIpetUS+Pk9QcvQ4TmezyYn5BKwRvVhB4e/ORzKiD4c5/gd
	xycTyDq/DJbXc3nVo0+yeNCbtohZb6yu2ROEDfU0KVkJ2R23nS1TU7B9hyyak5uN
	BMtqHeV0dYFyy8aP4gNKd0PGk3P/rInX4bx/E/5AVdRDZ2vodxGXiHQWlyn4kH9x
	+E0tCQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gasew0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:36:13 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso9757272eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 04:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795782972; x=1796387772; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1N1CcmdcT3FVeB/E3+Ym0rYVGWZlRxMCPE1GM0GIUcE=;
        b=AVGy2advgIFido5xKYcSx40QuS3xc1FPHk+87j4iFDLX+NmqvmaeWOXDQL0ZbV2omP
         FQ14KruW7z+3onecsDUrb1ipzdbg1rmNWYBeVKIFHDW5dbLxj6Rv4J/rd98AH2KwhlV8
         UV8nMFeRLs617dTTuHn0I1DvssJJthNdcSwD7k1S5m5j3DAeqBwP/G1SAau/rWiJQK/6
         fRgD7wPX351I1vOsItTRNgEmKoxfgrXcCREsP8foCkv2UkC5BJtbR2kv8MvVo1tpioN5
         etOkEKOBH9Hz3fka9jGujLkbA9VJi/wAtQllhZ0+gBkh3VrhI0mrf6sCbg/1gvcehjyJ
         NKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782972; x=1796387772;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1N1CcmdcT3FVeB/E3+Ym0rYVGWZlRxMCPE1GM0GIUcE=;
        b=bhfcgvzTmIF/27HEYx5f0c+dHcWedaGudM3GPUFR0IaNo/FZpl1p094/61UhHdfTay
         KM49RRv9mcWYS14w0lPSfvcvMbcYgNFL429kW8+4EvNjcSO6sQ1Puxl0GBUz/XAnV8xt
         CxOv+neyu5RmgoTiBGn5aELxuTaoFX8S3JyF8MsPjjsWZuJlGUPF1hwtUo4u6PY5L+Ez
         VdY929uHSTtjl2AMXhdkCNnWWyx22haEpyzLygIF3y+xIrIDXJYTV1+o/U4CFi3GUJ1p
         L5qRE7ZMEP/fKcscSFmEilKZPy3oP+SaEitLfeuSToJmmgZSia0L7xbbf7TKswikxGi0
         zD4g==
X-Forwarded-Encrypted: i=1; AL+hErHTSwLSMeeLPftbNdSzsLlXaAM5o+A5/SuifDYQFoNuZZHmclx+FXh4hJEJF8Lylxj4T3MeeeVuLjlPjyJu@vger.kernel.org
X-Gm-Message-State: APuU4Z9xzmqm7sYPGvssv/KLgXiMtvo1vMFiUs+JWGTHjaAM1GnDuQiY
	v30RH+/K4GpiFaQw5yebdTutkkrpi/YqdH2yBfGutwiSmG6QTmK0FG99vwICuDFZaVO/kK+82jQ
	R9dk/f9ZWKr6SJ23NfL8uliqmaXGjRlShb977Lg9a3tzPqwt6rO2ZJybvPZ8Lj9TC5qmk
X-Gm-Gg: AZFdTZfi+P/CofN+9C4CWOtbMefQvl1VKA6rUrMp2cuxKgtIhvXvVnBKDCbpmYaFJkz
	dsW/i6dzKiw3gv6mvHN8CIhRJLl3nDsfyTOnke2FWe8PEja68/kCS79yjl4oSeQarsi5ccxc7IO
	H1tKxNhCVtqxeJcvBbp7xo2kxvy0pgW3awltOl4QH5ln7NRaT068YzWlo9U+6D8LRC9R8jYDcOq
	3amrOmQIsZcybcvMB2wCByZ7UP/aLRaT1FsDdj+dAMa6O4+o+W34/sDPYPRg8bhmb1l9nd++BjX
	lOH0fP/+QuKnyF+m7ISZRFFCh8jds7mieGW5FU4dK12jctNP8emopPqqG/+AOTRuX56FIdo92u2
	dEprwOQsDll2rIjYCOp8o4dsFfGpYlJXkN4zlEeG3R8s0rCWp4GxBwdkYzLYBQPluGiATxkwqP/
	x2cx60IA==
X-Received: by 2002:a05:7301:6188:10b0:386:9ba8:2864 with SMTP id 5a478bee46e88-3869ba82acfmr18635558eec.0.1795782972167;
        Fri, 27 Nov 2026 04:36:12 -0800 (PST)
X-Received: by 2002:a05:7301:6188:10b0:386:9ba8:2864 with SMTP id 5a478bee46e88-3869ba82acfmr18635541eec.0.1795782971622;
        Fri, 27 Nov 2026 04:36:11 -0800 (PST)
Received: from [10.206.111.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm80984881eec.21.2026.11.27.04.36.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:36:10 -0800 (PST)
Message-ID: <a795dc11-2827-4897-9c55-bd4a999e72f9@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 18:06:05 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: iris: Fix VSP clock calculation for high
 bitrate streams
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20261125-fix-vsp-freq-calc-v2-1-9825a64d2a88@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261125-fix-vsp-freq-calc-v2-1-9825a64d2a88@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DuxdtPURIS_C_TY6W7m5tWZDJ6yL3PSP
X-Proofpoint-GUID: DuxdtPURIS_C_TY6W7m5tWZDJ6yL3PSP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1MCBTYWx0ZWRfXyPRX9Rvqkvs8
 Is7qYvyZK92cGAl1a6XgcXjOi7DaB8gId6eNGV3Yrpd596XKRj6OHWBVWiRdpD3VGJhd4mv9//L
 6ncdcfpMbGIWut0eAFWth2KkYB4ZV2K7AolKc4wkRrhLZp6bo7pV+ZDClMPjV0adNMGHW0GltCx
 UdGb+OBbvBWN5ergP6itJRVGCEYZT/AFikMkOw8KNcvpUUcXKeSvjc2GfPfXJ+PIv5EBXRz1Rht
 WmGbwr/V+k1NDCKUUl0LB32dvWSl50Vbab64MRLPRzSj3Ub6LDSNY15PuW35WtIgWFD3v0jUrXE
 OOjVCkdhjI6/NFHwZYTkxYHKKah+pL4kCv3Ei8MbJ02qiu3NWU2bWZsKUQlDMp2aQwgYlgZxZfN
 RF/wfylqkLQFGVc3Sma+7ZiC8G2jDsjjpEYx4SrxmdvyIghuzrlwqPWWdKFLCUQcJqebZzP6uQt
 vowgHfvIQSPoeGkOpSg==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b09793d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=LyeWGEF7gOwipDuC1LkA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1MCBTYWx0ZWRfX0to9E2U5bcYw
 W88+wu0J/iw04ejoqKXJsUxIkMfwRtrgEA8PA1pKuqiuKvBClye6AvqgxoxPHE1Yv72w7CAJeVI
 so01m9EYMH4/rCmn+UqfaDdTW23/jFo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270050



On 11/25/2026 9:18 PM, Vishnu Reddy wrote:
> Frame drops were observed during high-resolution streams decoded at high
> bitrates, as well as concurrent decode sessions. Analysis showed that the
> Video Signal Processor (VSP) clock requirement was underestimated for
> these workloads, resulting in insufficient clock scaling and reduced
> processing throughput.
> 
> Update the VSP frequency calculation to more accurately reflect the
> processing requirements of different codecs and bitrates, ensuring that
> the requested clock frequency is sufficient to sustain the workload and
> prevent frame drops.
> 
> Fixes: 82b96a8d8d6e ("media: iris: Move vpu35 specific api to common to use for vpu4")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
> Changes in v2:
> - Used the configured bitrate for the encoder VSP clock calculation (Vikash)
> - Link to v1: https://patch.msgid.link/20261006-fix-vsp-freq-calc-v1-1-53532d893852@oss.qualcomm.com
> ---
>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 32 ++++++++++++++++++++--
>   1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 243bd845349f..376ea758c5dd 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -454,9 +454,24 @@ u64 iris_vpu2_calculate_frequency(struct iris_inst *inst, size_t data_size)
>   	return max(vpp_freq, vsp_freq);
>   }
>   
> +static u64 iris_get_vsp_ref_bitrate(struct iris_inst *inst)
> +{
> +	switch (inst->codec) {
> +	case V4L2_PIX_FMT_VP9:
> +		return 70;

could you replace the magic numbers with meaningful macro names here and 
other places in this patch ?

> +	case V4L2_PIX_FMT_AV1:
> +		return 100;
> +	case V4L2_PIX_FMT_H264:
> +	case V4L2_PIX_FMT_HEVC:
> +	default:
> +		return 150;
> +	}
> +}
> +
>   u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size)
>   {
>   	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
> +	u64 vsp_bitrate, vsp_ref_bitrate, vsp_ref_freq;
>   	struct v4l2_format *inp_f = inst->fmt_src;
>   	u32 height, width, mbs_per_second, mbpf;
>   	u64 fw_cycles, fw_vpp_cycles;
> @@ -484,8 +499,21 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_siz
>   	if (inst->fw_caps[STAGE].value == STAGE_2)
>   		vpp_cycles += div_u64(vpp_cycles * 5, 100);
>   
> -	vsp_cycles = fps * data_size * 8;
> -	vsp_cycles = div_u64(vsp_cycles, 2);
> +	if (inst->domain == DECODER) {
> +		vsp_bitrate = fps * data_size * 8;
> +	} else {
> +		vsp_bitrate = inst->fw_caps[BITRATE].value;
> +		if (inst->operating_rate > fps)
> +			vsp_bitrate = div_u64(vsp_bitrate * inst->operating_rate, fps);
> +	}
> +
> +	vsp_ref_bitrate = iris_get_vsp_ref_bitrate(inst);
> +	vsp_ref_freq = inst->codec == V4L2_PIX_FMT_AV1 ? 533 : 480;
> +	vsp_cycles = div_u64(vsp_ref_freq * vsp_bitrate, vsp_ref_bitrate);
> +
> +	/* VSP FW SW offset */
> +	vsp_cycles = div_u64(vsp_cycles * 1000, 1055);
> +
>   	/* VSP FW overhead 1.05 */
>   	vsp_cycles = div_u64(vsp_cycles * 21, 20);
>   
> 
> ---
> base-commit: 3dd8c790a7b7027abdd568e36db5e82ffaea7c77
> change-id: 20261005-fix-vsp-freq-calc-19b967b79e62
> 
> Best regards,
> --
> Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

