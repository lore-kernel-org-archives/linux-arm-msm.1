Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA42314A60F
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784700082; cv=none; b=cwg6BKf5023u4VFdWI5fV5pRT4YnWKCR6+A3WLWZ9WSrvI4Q1hxXy6sHKcW/S+irIdC50Xs6ijL/jXQk5OsXra/c+dpo4swIbjsfNRioNHC1P45Uvd218mmSVf5zclUMu3Scqn0xMiWiJ0cJkMjT0NrFZWDNbRhaXDrscuiqV9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784700082; c=relaxed/simple;
	bh=2/N18igO+ZVBlWH9IluRgZMOMVSOPBUmiAGw3pLcLjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qz9cpY7KZHF5fobfyq2x7lF7jpC3H02PUTUMd0MPDZx/z/Hjr8gARXerlkK61JrXFz09btI0URHn3xx+KtgOqFEwhfErc8GJgI9SsBxQ9MmzPU1dxzybR2VkVhqvxoFbmsVdpYgsbvW4AIyaEi4hPKd0DqUCXM+gamgn5K5Y+wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TH9QyNb5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QD2Kwz6/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TH9QyNb5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QD2Kwz6/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53unJ3996056
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LI2mmR3+bvobgNG1BaGUR+SHQvVXcnMS1KDldP9XDic=; b=TH9QyNb5BfdBbS3Z
	X7aCN2fmAh35Tl/NRfKhbH7R2f/FXnZYpfSzDsqqpXEYwUbyn01Vy+8IS3HrEeCm
	SidyWpDztcVy4XFln34aZMA9wFLtX6XkpdaIb3ooYwisd2B1orONLo5IBemwNmOg
	mVN7xpD2mWCg6OUlK+SArIBqD4yVcD5KRjFQVF1tdNVhs8qA8RQKYplv6HV7P62S
	XyTW9/ebssfNwr6Q5Euxoa3HbCJQ0N6vZL2jnvP02QPytqMoKJr/IGRaSVy069MB
	sHDRtQF8ho7k3P+Qp6QXfG6VDOyJItzxhVOHpo9m6z7I5SPrJf7xMmzMiGP5lQjP
	oshlEg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6d2eps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:01:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so15660694a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784700078; x=1785304878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LI2mmR3+bvobgNG1BaGUR+SHQvVXcnMS1KDldP9XDic=;
        b=QD2Kwz6/yK7SgY3v9ATdQ5orrC1Qm2FmbtBeSqhCcSy3IUqEDxnB01I00cKQj8FUro
         dqR234TNTmcrpGpuS3OhxpolLbGaT8wDMLAVm8tiILwoJ4AV2A6UMNs5tpJPGURgVr+L
         N7jc28itj/i6Zh2lFgM+fpZVUqm1RruwXjjXFqOOqNOhOjnIEc2G0NBV8W0cplFjUUWl
         Xj893Nn0ZrtKipFueroy8mDq+d0iHxDL05SHT8Uk6Vc/NFsND+OFfezLSYJanYlQkmFZ
         EHOaYMypxPI19xzSVR9k0HycI4hAhSFH6TrHR0Dc2DEYBLlygf31rHv9N3sGolthRh0o
         omkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784700078; x=1785304878;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LI2mmR3+bvobgNG1BaGUR+SHQvVXcnMS1KDldP9XDic=;
        b=QvOYv2DZ4WpBNwOhi3c7cYohKRSsweJG/wdR6qnMXlLdRNRngxg2KH1+GipPxbSeY4
         fpgk27t9qKYwdnfYebsFguPX+OxnFrOuVLDiVJv+fF9Ty3T5KNJaXGfWOJ5Z5rthmoEd
         AulYRy214WEoTFSB+YoGXFlYA42Y5z6KpjjL7GJBJxuUA/vgzGwL5Jtwpm3VYOwUjHBW
         De31taS6SPnBPvIEdk7C3/00QZi5oc9ZMc3wOIpH9c4OvxnF0NcZ0eJyoZtBYq1O/ZyY
         FWvDVgqHUJ52jfADBah3+Q9/7sS5ZQH2QYb89VwddlUQZ8lsXicA5AyZwbPuPa9Zm2H8
         GktA==
X-Forwarded-Encrypted: i=1; AHgh+Rr/44nHhzWyDmzinlVZLmOlfywICcBUUthbexM58+8Zz8HAg92hlyo7PHbACUQ5/6DbZGZiQ4o7xM04N/yu@vger.kernel.org
X-Gm-Message-State: AOJu0YzmNHbkJXxWkzuVAhkaM3j1hGJ+/uZMOs7U2taWTwYCMUjJTJ3U
	yv3q5iGxNZ0GbEnOUhdEUFNwNKxKtYSEAnHiUaEn/Csi9cPq3+6FHtfD5/DPB7g9Kv5wolD+UWx
	zu9p1LTpEeLZKJMWV5GuEWfNeEku4PgrMQA7A+e75y4cRRLqNNWwrDtwleemJnSEwBulo
X-Gm-Gg: AR+sD130vFIJBu36VhDc98WA4ddU+BsI3OIQWk4NfiB0/kUcV0Vw86VHGUc5QlfucEo
	2LurTnmojQHDruspW3ZSzWQbuwjVjnZpZXQp5x27mcq4pmaCczW1LJQaSTVsMcXBOmYEN5wKew0
	SMRb/Ykpm2UZZ518VIpCPpxBaTtyMXcim26PyphLxCuPbgUkwnqQaQJ2T4B/g3q66XnxMq+iWuz
	QMqewHFiE2HVXYq4fUp928EO2i28lW3uSbhWC1Oh4WZNCbfOKJZrhiHpEZPjgUYAyfM3vUdoMlZ
	vcTDY3gkIumL71E3Zw4LyH8XQDnAm6B+L5q2PfUOmcOH6O2/POHMs3jdyWW0ckBASr0JSUbGmn5
	rhTU3+EIDXN7dfKLnhdzoROKmdKasmlJPHxM=
X-Received: by 2002:a17:90b:3cce:b0:37f:db06:229c with SMTP id 98e67ed59e1d1-38e4b534228mr22727473a91.22.1784700078013;
        Tue, 21 Jul 2026 23:01:18 -0700 (PDT)
X-Received: by 2002:a17:90b:3cce:b0:37f:db06:229c with SMTP id 98e67ed59e1d1-38e4b534228mr22727447a91.22.1784700077432;
        Tue, 21 Jul 2026 23:01:17 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.252.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13014d27sm2965685c88.4.2026.07.21.23.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 23:01:17 -0700 (PDT)
Message-ID: <330f7704-728e-4671-a9bf-fdf0a5c0f7dd@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 11:31:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] media: iris: add support for multi_slice in iris
 encoder
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260721-iris_multi_slice-v3-0-adc61a687e7e@oss.qualcomm.com>
 <20260721-iris_multi_slice-v3-2-adc61a687e7e@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260721-iris_multi_slice-v3-2-adc61a687e7e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: izEeiaHgdn-lE3aAyTKWwZEKlprkw-YZ
X-Proofpoint-ORIG-GUID: izEeiaHgdn-lE3aAyTKWwZEKlprkw-YZ
X-Authority-Analysis: v=2.4 cv=XaG5Co55 c=1 sm=1 tr=0 ts=6a605caf cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=7QKhCc/PCtuziN3cdRcg/A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=YmOin3sAzaufkNdYcaQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA1NCBTYWx0ZWRfXxDPprJc7JNkt
 KuBCw4owRnZb+w2DFmIJlZnifTi1x6LMf8Brz5xBgwqeqI1cD/F5lsE1s9d/vT3B4Nmli7LhDv0
 aeOwOsftWQ97KIe0LrgnmMOlEIhXbKBFfmMYx8sXqj+JySVmRYYRVjlYs0bRymtBv5ypVCJA+5W
 vWGDjLQzT7VOEZpbpy6LZPeyWksDWOcESTd1mPKsyr2SxLWtlP4FgxtYyKNTcyDGnm+P91Zu9Ae
 3jf3AnXEdXrg1igYX786bgESljVz7Gj45xmNf0Ge9mdP4X6OJnFRSGnys2lpPCFtzXhR9+DPq2Z
 m5JDnCX0Le8LDAIzII00lX/vInvLJYA3abp2fLi1dtGxUGIdgGzQ3IcPKqFJ4Kyexo5uHLbcf2G
 4baLS7cHCrC94Wy041RCKOi+m3l56VzBFcpMzuW3wSQvNK0TQhbX48Ki+KqbDAvpCCuxEYo2NUR
 j2cZHIcu8mIpZeR9YGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA1NCBTYWx0ZWRfX1ka0sMY/mLAF
 fIWszQrauiIWNkIQiXYjNkhg2ltWZjks1eVG2H1r8Ecp0t1fpPg1R1DXAJgK483oeyv9wtGYU/3
 wrwGeRNfK5wd1vpJAf90JcrtypEMqeg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220054


On 7/21/2026 3:23 PM, Sachin Kumar Garg wrote:
> Add multi-slice encoding support with MAX_MB and MAX_BYTES modes.
> 
> Clients can enable slice mode using V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE
> control and configure slice size via V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB
> or V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES controls.
> 
> Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c      | 82 ++++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 33 ++++++++-
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 +
>   .../platform/qcom/iris/iris_platform_common.h      | 12 ++++
>   .../platform/qcom/iris/iris_platform_qcs8300.h     |  9 +++
>   .../platform/qcom/iris/iris_platform_sm8550.h      |  9 +++
>   .../media/platform/qcom/iris/iris_platform_vpu2.c  |  9 +++
>   8 files changed, 156 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index d7cbf6c3614a..36ccb9918921 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -154,6 +154,12 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>   		return LAYER4_BITRATE_HEVC;
>   	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR:
>   		return LAYER5_BITRATE_HEVC;
> +	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
> +		return SLICE_MODE;
> +	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES:
> +		return SLICE_MAX_BYTES;
> +	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB:
> +		return SLICE_MAX_MB;
>   	default:
>   		return INST_FW_CAP_MAX;
>   	}
> @@ -297,6 +303,12 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>   		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR;
>   	case LAYER5_BITRATE_HEVC:
>   		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR;
> +	case SLICE_MODE:
> +		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE;
> +	case SLICE_MAX_BYTES:
> +		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES;
> +	case SLICE_MAX_MB:
> +		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB;
>   	default:
>   		return 0;
>   	}
> @@ -1482,6 +1494,76 @@ int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_typ
>   					     &bitrate, sizeof(u32));
>   }
>   
> +int iris_set_slice_count(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
> +	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
> +	u32 slice_mode = inst->fw_caps[SLICE_MODE].value;
> +	u32 bitrate = inst->fw_caps[BITRATE].value;
> +	u32 rc_type = inst->hfi_rc_type;
> +	u32 fps = inst->frame_rate;
> +	u32 output_width = inst->fmt_dst->fmt.pix_mp.width;
> +	u32 output_height = inst->fmt_dst->fmt.pix_mp.height;
> +	u32 mbpf = NUM_MBS_PER_FRAME(output_height, output_width);
> +	u32 max_width, max_height, min_width, min_height;
> +	u32 max_avg_slicesize, hfi_value, hfi_id;
> +
> +	if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE) {
> +		dev_dbg(inst->core->dev, "slice mode is: %u, ignore setting to fw\n", slice_mode);
> +		return 0;
> +	}
> +	if (!fps) {
> +		dev_err(inst->core->dev, "Invalid frame rate %d\n", fps);
> +		return -EINVAL;
> +	}
> +	if (fps > caps->max_slice_frame_rate ||
> +	    (rc_type != HFI_RC_OFF && rc_type != HFI_RC_CBR_CFR &&
> +	    rc_type != HFI_RC_CBR_VFR && rc_type != HFI_RC_VBR_CFR)) {
> +		dev_err(inst->core->dev, "slice unsupported, fps: %u, rc_type: %#x\n",
> +			fps, rc_type);
> +		return -EINVAL;
> +	}
> +
> +	max_width = (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) ?
> +			caps->max_mb_slice_width : caps->max_bytes_slice_width;
> +	max_height = (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) ?
> +			caps->max_mb_slice_height : caps->max_bytes_slice_height;
> +	min_width = (inst->codec == V4L2_PIX_FMT_HEVC) ?
> +			caps->min_hevc_slice_width : caps->min_avc_slice_width;
> +	min_height = caps->min_slice_height;
> +
> +	if (output_width < min_width || output_height < min_height ||
> +	    output_width > max_width || output_height > max_height) {
> +		dev_err(inst->core->dev, "slice unsupported, codec: %#x wxh: [%dx%d]\n",
> +			inst->codec, output_width, output_height);
> +		return -EINVAL;
> +	}
> +
> +	if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) {
> +		hfi_value = inst->fw_caps[SLICE_MAX_MB].value;
> +		hfi_value = max(hfi_value, DIV_ROUND_UP(mbpf, caps->max_slices_per_frame));
> +		if (inst->codec == V4L2_PIX_FMT_HEVC)
> +			hfi_value = (hfi_value + 3) / 4;
> +		hfi_id = inst->fw_caps[SLICE_MAX_MB].hfi_id;
> +	} else if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES) {
> +		hfi_value = inst->fw_caps[SLICE_MAX_BYTES].value;
> +		if (rc_type != HFI_RC_OFF) {
> +			max_avg_slicesize = DIV_ROUND_UP((bitrate / fps) / 8,
> +							 caps->max_slices_per_frame);
> +			hfi_value = max(hfi_value, max_avg_slicesize);
> +		}
> +		hfi_id = inst->fw_caps[SLICE_MAX_BYTES].hfi_id;
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_U32,
> +					     &hfi_value, sizeof(u32));
> +}
> +
>   int iris_set_properties(struct iris_inst *inst, u32 plane)
>   {
>   	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
> index 3c462ec9190b..5a73c7c49d36 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
> @@ -47,6 +47,7 @@ int iris_set_layer_type(struct iris_inst *inst, enum platform_inst_fw_cap_type c
>   int iris_set_layer_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_layer_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_slice_count(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_properties(struct iris_inst *inst, u32 plane);
>   
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> index acc0ed8adda1..fcbebced05c3 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> @@ -12,6 +12,8 @@
>   
>   #define VIDEO_ARCH_LX 1
>   #define BITRATE_MAX				245000000
> +#define MAX_SLICE_MB_SIZE         \
> +	(((4096 + 15) >> 4) * ((2160 + 15) >> 4))
>   
>   static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>   	{
> @@ -937,7 +939,36 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
>   		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
>   			CAP_FLAG_DYNAMIC_ALLOWED,
>   		.set = iris_set_layer_bitrate,
> -	}
> +	},
> +	{
> +		.cap_id = SLICE_MODE,
> +		.min = V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE,
> +		.max = V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE) |
> +					BIT(V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) |
> +					BIT(V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES),
> +		.value = V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_slice_count,
> +	},
> +	{
> +		.cap_id = SLICE_MAX_BYTES,
> +		.min = 512,
> +		.max = BITRATE_MAX >> 3,
> +		.step_or_mask = 1,
> +		.value = 512,
> +		.hfi_id = HFI_PROP_MULTI_SLICE_BYTES_COUNT,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +	},
> +	{
> +		.cap_id = SLICE_MAX_MB,
> +		.min = 1,
> +		.max = MAX_SLICE_MB_SIZE,
> +		.step_or_mask = 1,
> +		.value = 1,
> +		.hfi_id = HFI_PROP_MULTI_SLICE_MB_COUNT,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +	},
>   };
>   
>   static const u32 sm8550_vdec_input_config_params_default[] = {
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index 776b21cd11b2..226894b99dcc 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -71,6 +71,8 @@ enum hfi_rate_control {
>   #define HFI_PROP_MIN_QP_PACKED			0x0300012f
>   #define HFI_PROP_MAX_QP_PACKED			0x03000130
>   #define HFI_PROP_IR_RANDOM_PERIOD		0x03000131
> +#define HFI_PROP_MULTI_SLICE_MB_COUNT		0x03000132
> +#define HFI_PROP_MULTI_SLICE_BYTES_COUNT	0x03000133
>   #define HFI_PROP_LTR_COUNT			0x03000134
>   #define HFI_PROP_LTR_MARK			0x03000135
>   #define HFI_PROP_LTR_USE			0x03000136
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index c9256f2323dc..659d15166365 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -100,6 +100,15 @@ struct platform_inst_caps {
>   	u32 mb_cycles_fw_vpp;
>   	u32 max_frame_rate;
>   	u32 max_operating_rate;
> +	u32 max_slices_per_frame;
> +	u32 max_slice_frame_rate;
> +	u32 max_mb_slice_width;
> +	u32 max_mb_slice_height;
> +	u32 max_bytes_slice_width;
> +	u32 max_bytes_slice_height;
> +	u32 min_hevc_slice_width;
> +	u32 min_avc_slice_width;
> +	u32 min_slice_height;
>   };
>   
>   enum platform_inst_fw_cap_type {
> @@ -183,6 +192,9 @@ enum platform_inst_fw_cap_type {
>   	LAYER3_BITRATE_HEVC,
>   	LAYER4_BITRATE_HEVC,
>   	LAYER5_BITRATE_HEVC,
> +	SLICE_MODE,
> +	SLICE_MAX_BYTES,
> +	SLICE_MAX_MB,
>   	INST_FW_CAP_MAX,
>   };
>   
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> index 3cfecae80d1e..764acf71c72b 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> @@ -17,6 +17,15 @@ static struct platform_inst_caps platform_inst_cap_qcs8300 = {
>   	.mb_cycles_fw_vpp = 44156,
>   	.max_frame_rate = MAXIMUM_FPS,
>   	.max_operating_rate = MAXIMUM_FPS,
> +	.max_slices_per_frame = 128,
> +	.max_slice_frame_rate = 60,
> +	.max_mb_slice_width = 4096,
> +	.max_mb_slice_height = 2160,
> +	.max_bytes_slice_width = 1920,
> +	.max_bytes_slice_height = 1088,
> +	.min_hevc_slice_width = 384,
> +	.min_avc_slice_width = 192,
> +	.min_slice_height = 128,
>   };
>   
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.h b/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
> index 3c9dae995bb2..ef87976c2360 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
> @@ -25,6 +25,15 @@ static struct platform_inst_caps platform_inst_cap_sm8550 = {
>   	.mb_cycles_fw_vpp = 66234,
>   	.max_frame_rate = MAXIMUM_FPS,
>   	.max_operating_rate = MAXIMUM_FPS,
> +	.max_slices_per_frame = 128,
> +	.max_slice_frame_rate = 60,
> +	.max_mb_slice_width = 4096,
> +	.max_mb_slice_height = 2160,
> +	.max_bytes_slice_width = 1920,
> +	.max_bytes_slice_height = 1088,
> +	.min_hevc_slice_width = 384,
> +	.min_avc_slice_width = 192,
> +	.min_slice_height = 128,
>   };
>   
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> index 6e06a32822bb..39720e7af889 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> @@ -44,6 +44,15 @@ static struct platform_inst_caps platform_inst_cap_vpu2 = {
>   	.mb_cycles_vpp = 200,
>   	.max_frame_rate = MAXIMUM_FPS,
>   	.max_operating_rate = MAXIMUM_FPS,
> +	.max_slices_per_frame = 128,
> +	.max_slice_frame_rate = 60,
> +	.max_mb_slice_width = 4096,
> +	.max_mb_slice_height = 2160,
> +	.max_bytes_slice_width = 1920,
> +	.max_bytes_slice_height = 1088,
> +	.min_hevc_slice_width = 384,
> +	.min_avc_slice_width = 192,
> +	.min_slice_height = 128,

I do not see these values are changing for different SOC data here. 
Would prefer to do the macro instead of inflating the platform struct.

Regards,
Vikash

>   };
>   
>   static const struct icc_info iris_icc_info_vpu2[] = {
> 

