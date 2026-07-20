Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D1B1F30BB
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 21:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784582084; cv=none; b=pkqAJ/kBnM9whSRpJYeV9rqkFwuy3nV/o2fUyN+daNceoBXxQU7Pv4mmNsqiSTkW6gmwjtcVNj01r6+1MIYkkObDqYyTy1FX8ILzZtS8Eqcn8YE3t8mkTQM+HmAJ/mbV91Z2afcY70tPdwui3MT4N306CpG/Vsfi7/z5nrK5pEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784582084; c=relaxed/simple;
	bh=VFFt3HQPz4z1ZL+ZlR492dczakUwHhoEourn+AuREIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ebLT6HZPYSHpJQisjIiq6y7m4a1hw8Z2bO3IvylFYEbOwM8elj3VsJDKwA9ATCWR9LtbWT5rbQdYeMSXFK/N1sFGgJfzoTOQVu03b5IH1SPsw5q7QOZEC4URqO0aj26ETEpaKHs9Nr5VZQan0+u3qPIBls8CEhBubF/IWLu9MrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VLA9nq/T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bFF+4uwX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VLA9nq/T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bFF+4uwX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KJTZK83622214
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 21:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6paqjA3lujsVdPkVfvdxl3SS
	kpK7zmopgMYqn4yDCh0=; b=VLA9nq/TObG+XJNTQA/FZYUHKTjXU+r7bjgEubgC
	en0uT0Sc+qgUZ3eaGW296ZWyHeB+/ZL76K/bh9LNg5idpu427m8oY4De+rwQGrPL
	jMABCrP21Cw+NOc9CZbGkYR1+xftk6cU0ZM83kef8tYkpLWOk1+lrdJf61U8SW5Y
	+sUARGCATgpKtvn4FjmS92VbeDvMZbzkU3OC3oXP0N4gsDyRKmR/xUajjnuVq+3g
	eK7Vquz9ym5jW+p8D6LBLK30dLZWXzpQaSfIy9DLZrS0gg6KNODlFjGCp58gIiQq
	bjXGrqKNpUvzMe/VEjr3SfOxQ4cuJb7fW4hL7b3ipYudBQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfvxkctk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 21:14:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8fc6b670b4bso86829126d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784582082; x=1785186882; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6paqjA3lujsVdPkVfvdxl3SSkpK7zmopgMYqn4yDCh0=;
        b=bFF+4uwXjg4lSo5Xv1Yc62LR3eQuZ9aD02OUbqw7y1mRpspQUJ2qdPKuBuKaqclFVp
         bevV+gRGo8CZimCkMcxCE889rFn4PP1RBZVhbjpcBqANIfNvHz9iEnzVy/R7FDo6ILCQ
         y8dWMpmc5ZMlcPjtoXrVXvI7eTbNax4SnVlYKKgKrb9KPwXtGPuJGk9yVqBxKmHYKfZt
         JFOf4Zxw4DDb/8mNvSQrFZGxh62R425m5G2OlJXseLQHRBvI0EY/wcPXhRwq30TvsFC2
         JYOy4nUycXDYPHZbCsx8p20WiFLbMkf4TUYntEGr2gzZkVzplhLhjMZAJ2++w7Sa7H2w
         dhsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784582082; x=1785186882;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6paqjA3lujsVdPkVfvdxl3SSkpK7zmopgMYqn4yDCh0=;
        b=jL3n2LwbQwaRjfxz1s8gCDZiul0OjXAmYsamfX23TI1kDbr2HQO1OBQJg6S5YFA8bo
         GSwOR9p68B+G7DZFCOA9yF+0mIJ0Azj6c4bJdRqrk8VOi+84ZFS/5blBcwtphnLgZWNU
         qQ9csN5mO80r31y6u9DUUK7n1ZGB50lTJB1Qs9SopGIqNnLqy6N1+2+Mhr2CA1X55oik
         6X7LxwjeqSwa5LBDjUwsiXji8hM/RY0RdaoH3dO8yk9u+rqho69+DrNjkvBKmNY7HbxB
         NiyKD3gm7SYzhwZuGg09Ku3wT694EL0+IcdzFvghUs1Zso2EFreL7zs5XWHmNVOsqxOj
         vW5w==
X-Forwarded-Encrypted: i=1; AHgh+RoylbaLvgwjRB0vqCJO6pSGhjMRfGS5tlqKWSD1NuVhuUYjr2izEx0dDGcgfUGGset9x/i//9kP3xHq7u+N@vger.kernel.org
X-Gm-Message-State: AOJu0YxeGgE0VcehuflDFAvAuuG3/KaTTuGLtmvNZ1iKnJ2P1QCsTvWK
	ZJCiOUKqTmvBQT0q9+08YYGtP5rt2Gho4Qfv2ukpqqOQvYLrWiQ5pRpwy9O7XvIMUO9HupW73GU
	G/CO49yfnysO5T1D1dL/ivlL+z5C0GeFPuhb2l+dhNADRiKfVm96lOelMLpR41u0np6otJbxU/k
	5W
X-Gm-Gg: AfdE7ckuYwUevJFnrqUzwF1coiRrOGbVDOo33z2MObuc/6lsZm2u3G1sqCaulYAzBtN
	NETauI3rS5A6HxfewvDhdsSSn5kLqQNRmcd3qFo0gZRy19frnw//K5bqm47iwTZMGEUZSqOCNqX
	0VxK1r0aoYt7txWGlYfRx4/gs4PewcbrPzhMkNiX8PB8cY073tmkh66EIA1AltlGD3gSPGLpnnq
	Gb2nQJRPB3GUycvWZwHDxWj/hT933VQJ2GlVdQj7sJSbKDNSC+3kMiHYfKvhSHQ2VKOZ933JghC
	pCqNiRfxjAEUlv0XjT+Jw5lUpLwyFAsuQz7e8PSPmqiAnOW1W+SHV7ULb9xAYN5iYRRaGVs9mRN
	Bj6CD52qpkR1KCDCIDB8fNV+eHWx/HfCf8r7YEuyiTxXrSnXaUIMG8UAZGF0v7dT/+mf0XLyV5o
	3wFSnagcyv5NfbWg==
X-Received: by 2002:ac8:5fc7:0:b0:51c:207f:6524 with SMTP id d75a77b69052e-5213cdcd357mr148862351cf.37.1784582081574;
        Mon, 20 Jul 2026 14:14:41 -0700 (PDT)
X-Received: by 2002:ac8:5fc7:0:b0:51c:207f:6524 with SMTP id d75a77b69052e-5213cdcd357mr148861941cf.37.1784582081042;
        Mon, 20 Jul 2026 14:14:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e1c888sm2530660e87.67.2026.07.20.14.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 14:14:39 -0700 (PDT)
Date: Tue, 21 Jul 2026 00:14:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: iris: add new rate control type MBR for encoder
Message-ID: <zlvbtffdpmqtwwhknvyz5f3f22gm23qsupg3qp7hagz7j7rhmk@7heecitj3plg>
References: <20260720-b4-add_sc7280_mbr-v2-1-a2a86f630f57@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-b4-add_sc7280_mbr-v2-1-a2a86f630f57@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=HKLz0Itv c=1 sm=1 tr=0 ts=6a5e8fc2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=oY5olKvstY0uGbtyxhMA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIzMCBTYWx0ZWRfX+o/SEgU7E82R
 Al9cIh+w/540UUK8A2dcqTREF7xhER2bkSoAFTpBNh6ulE81+XfurTwsmuOFxaJxur+ebU42Smn
 z0++3bTIFLFWYefFYNYNGlcTXiThSbI=
X-Proofpoint-GUID: p_hGQEpfKWNJEgWA-h-9hxAebpP29dIg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIzMCBTYWx0ZWRfX//1Mc4KbNFx9
 dDZLhOvApnnovoYmbkR1UplIl+cyVKNqhmQVrZUlr4N1S8olW7sqUTz2qY75zXrJB6jamraMRwj
 ZjHi6z+fenbDv+l/24PHjn2aZ+0oicvQJ2qW1nZIcgl6NbZFJXDTCLV6nZkaGstGMuhLzuSy0JQ
 j0Cq+boh+jsrCHi+26/Xsnk2kcp5vj8rodmpulTlbxBIKFuPcF158mK5dej3LbzHibxwhC88vRR
 9MssgJqce5R9Jq7v5IUFjimjQcIZgvpgMeymgWEmT0FjrQ2lziU43S7CO+k5Y7+Hc1f41nfXHPw
 6jmZZogZmtHuagimKtNdpEa2lYidd4sLpqkVRrhqbCzYAwL5GwNqVehU5OZZVGXAxl3ovbGLtyv
 0br/mm9lpv2TwVLNvbvJQnny4tEWt5P0MsKS7R2fKg47+aBiLaOm63BrlkBFrTBuEgmap5lIDEQ
 US6G1DiN+Dyj+abgvGA==
X-Proofpoint-ORIG-GUID: p_hGQEpfKWNJEgWA-h-9hxAebpP29dIg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200230

On Mon, Jul 20, 2026 at 10:44:19PM +0530, Sachin Kumar Garg wrote:
> Add support for the MBR rate-control mode on the encoder.
> MBR has no corresponding V4L2-spec definition, it is exposed as a
> Qualcomm IRIS vendor-specific control rather than a generic
> bitrate-mode value.
> 
> Reserve V4L2_CID_USER_QCOM_IRIS_BASE for Qualcomm IRIS driver
> specific controls and add a new boolean control,
> V4L2_CID_QCOM_MBR_RATE_CONTROL, to enable it. When set, the driver
> programs the firmware with HFI_RATE_CONTROL_MBR, taking priority
> over V4L2_CID_MPEG_VIDEO_BITRATE_MODE when both are client-set.
> 
> MBR is currently supported only on sc7280. Rather than duplicating
> the encoder capability table per platform, add a mbr_rc_supported
> flag to struct iris_platform_data, and merge in a small
> platform-specific capability table containing only the MBR cap for
> platforms that support it.
> 
> Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
> ---
> This patch adds support for the MBR rate-control mode in the Iris driver.
> 
> Changes in v2:
> - Per upstream review feedback, convert MBR enablement from the
>   generic V4L2_MPEG_VIDEO_BITRATE_MODE_MBR menu value to a new
>   Qualcomm IRIS vendor-specific boolean control,
>   V4L2_CID_QCOM_MBR_RATE_CONTROL.
> - Drop the now-unneeded generic V4L2_MPEG_VIDEO_BITRATE_MODE_MBR
>   enum, its "Maximum Bitrate" menu string, and its documentation
>   (previously sent as a separate patch 1/2).
> - Drop the separate inst_fw_cap_sc7280_enc[] table (a near-complete
>   duplicate of inst_fw_cap_sm8250_enc[]); sc7280 now reuses the
>   shared encoder cap table and layers in only the MBR-specific cap
>   entry via the new mbr_rc_supported flag.

No. If we have capabiltiy arrays, please extend them. Does SM8250
firmware support MBR mode? Is it supported by AR50LT firmware?

Another option is to rework other entries in the caps array. Describe
logical platform flags (describing possible modes, profiles, etc.,
etc.), generating V4L2 controls on the fly.

> - Link to v1: https://lore.kernel.org/linux-media/20260213-b4-add_sc7280_mbr-v1-0-e8d95b4e4809@oss.qualcomm.com/
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 101 +++++++++++++++++----
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |   4 +
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   1 +
>  .../platform/qcom/iris/iris_platform_common.h      |   2 +
>  .../media/platform/qcom/iris/iris_platform_vpu2.c  |   1 +
>  include/uapi/linux/v4l2-controls.h                 |   6 ++
>  6 files changed, 98 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 10e33b8a73f6..0a979649663b 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -154,6 +154,8 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>  		return LAYER4_BITRATE_HEVC;
>  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR:
>  		return LAYER5_BITRATE_HEVC;
> +	case V4L2_CID_QCOM_MBR_RATE_CONTROL:
> +		return MBR_RATE_CONTROL;
>  	default:
>  		return INST_FW_CAP_MAX;
>  	}
> @@ -297,6 +299,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>  		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR;
>  	case LAYER5_BITRATE_HEVC:
>  		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR;
> +	case MBR_RATE_CONTROL:
> +		return V4L2_CID_QCOM_MBR_RATE_CONTROL;
>  	default:
>  		return 0;
>  	}
> @@ -335,6 +339,17 @@ static const struct v4l2_ctrl_ops iris_ctrl_ops = {
>  	.s_ctrl = iris_op_s_ctrl,
>  };
>  
> +static const struct v4l2_ctrl_config iris_mbr_rate_control_ctrl_config = {
> +	.ops = &iris_ctrl_ops,
> +	.id = V4L2_CID_QCOM_MBR_RATE_CONTROL,
> +	.name = "MBR Rate Control",
> +	.type = V4L2_CTRL_TYPE_BOOLEAN,
> +	.min = 0,
> +	.max = 1,
> +	.step = 1,
> +	.def = 0,

How does this play with other rate control mechanisms? Will it allow
user to select multiple?

> +};
> +
>  int iris_ctrls_init(struct iris_inst *inst)
>  {
>  	struct platform_inst_fw_cap *cap = &inst->fw_caps[0];

-- 
With best wishes
Dmitry
