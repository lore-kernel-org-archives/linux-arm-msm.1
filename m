Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593B63BE641
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 21:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784670451; cv=none; b=YuZBsukImApPoJdVDR8aldVRhQf9HosjDper72Ci9ZCEOnpRIeA/RLpb9q8bOnogE5f6+2i/aS055VR3iNqNAon0dZ09BjIa5Zkz9dX0ALSfsP401SA2+7l69cyUeAQn/yE0hn8RbgkwKhBrlbUIyQbrWjO+bGI7ezXjtESetHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784670451; c=relaxed/simple;
	bh=kQcUKdIUZjY38xPsXnIld4bJRucnVP/gcWyVBnzFHl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YhnKtrVhIIPDDbeH/tllYRmAL6FQu/7aHlRcmoyMfRDOAwkdICpLVo41r+gr1XH55B5xRe6/jJ43jI0IsEtswv0vyRY7Ej62LuQMm4mCskCAh3WdhUaoVZKDf5nbgY5QMgLk1WDgDTbjR0hTyh/0FDYR9enog5aUdyzuILesURw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m6ogQsl6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VK9hE9Nx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m6ogQsl6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VK9hE9Nx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LKlmTp2795147
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 21:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cFheiD632hpjnHsk2298+Npu
	EqfvcRUpsqZEPBN/eIY=; b=m6ogQsl66F6SJEZwyYDXPuaeG8nYKld168UTx05a
	KQ7pCtMTHWksNy9dEEKRIueNk3yW7nGJHiYv1bepNAZ+csN3JfNbwV4Lu6gPC9L6
	PX51W7Dx2/QdoQ1WUHiuilT8Xzpq5C7pFCXrqs0ZHw3dqIh6ntenMtpeb3MwSKkB
	GXh1MQ/gzqfDNYw7NMMxtn1QoyW5Aeu6BYErJ0JgSo5woAEyav1ZRMpBmL/milp9
	302zrPqsGmtPFsT6got+LKoKcsNGahGQ67v+RuiNIFSZHSA1+qua00uq5VNi682A
	ugfeb8RZ7bzLnNghpfmfJf/DlTaqB8Ia4DHcC1gooCHhhg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6pab3k0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 21:47:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bf321d786so106784911cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784670448; x=1785275248; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cFheiD632hpjnHsk2298+NpuEqfvcRUpsqZEPBN/eIY=;
        b=VK9hE9NxsxsctGKpC6Iq3wce4fjs2YvHhx7xTYYLK+pce/ShC8V48qvzpvwOdnFIW5
         8H9GK46CJo+iZImRdcGO/z+33M1fQhR+sW3/dLBNRss4WoDfjr+D3zfKfV/UIerXJ4Sd
         WYp+rzajwrP+XK+oCubQFLTfzW0IX844TCXLt0m/sbk2lXllMh8c+VnuFSxceo3kHw3j
         4Su73FPFGUsVJoQC0rZefC6QbRycrKxCQwMOGqK/UDO52UmyVd12z9oTEgno/13oeF8D
         DYzXaFR7fZq0oYDH1UA9njpoWVhUEggLNKsFNzs0iDdG55Qr5iCCt1VEO2TfvUNhkx1a
         PcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784670448; x=1785275248;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cFheiD632hpjnHsk2298+NpuEqfvcRUpsqZEPBN/eIY=;
        b=CuQWGW1ZGVT8V8/Wwc1TshDRlrG95jbp2KHtNmN1HWTGQuIrz5RF4ELbOAZx826MOf
         CvWkJxxHwU8WbI5lSW6yMvbvo/EVzx9x6ajSP7RMqrSsx2+YgNce7RZgutIhRVXlMQZT
         cM4CzaWhlXkTOPR/yzT1TZdOaozHomWzOkLLzBSi0eTOCGY9hMxcJ1WUx2Hg7WE30OM0
         1Vm2sC4IV+Cadf8p1MEqHSu0vC9Xd70KGZjAItF+urSFXCH7GPtjJur10aRNY40qRkC5
         7Fyycn/8z7RWTyriS0kEWykw1yamaKL0DZNiiCvRaTV/tuBzWRweB2EvkUFk0IMIxztW
         BVIA==
X-Forwarded-Encrypted: i=1; AHgh+RoGZxI+asK7DTxVi/qSfWpHi8r13aZKgUWE+fl69y1oaSG6GkE8XdXgKSk/veCqECW+2ZQBba7cdcvCwAxT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/0FALbdfzCOXheyM+4b+OolQXKesJqL3bJII9JnwWtTqrV27f
	5rv6X/hHFgRTTvFbShWk9qJgLBytqI//OpDNyFS2r2K6HXprR6C9LGn/jhNbngMUzj9k4aOVT/c
	lXzZouIas1wjxkIsMTf52AYsOJZmtX3yWIHuxGdN4xcvlSs2oa0jxL7LWAXUQiVcSd5/V
X-Gm-Gg: AfdE7cmdHJZuBwGctmrYH/ngBZRkEpjfP1wKLOpuAtnLcSTX0QDSEnpg+cZrbG8noQ0
	2wqydalgF6xvcDPzZUNq4OczIY2n4hjOBz69tvDLscshzTo1ReDhigxuvYVu429OAg/8L5lP7U2
	EF1Yzij3DGXeZ9lQ4dIfSisvCBnSlHc5Fhm6g8Zmey1skJUt8keEke4w7FhCsQqiByj6z3oPgFF
	Ekot+pm7YJQlE3FeC0AMoMGxDWU0c0QY7xaDRwi6HSs60XcGtssDG8soLTNNWrKOFIA8/kZY7wx
	tN+V2pmoNulsV191xs2vlI4UHFJBQsiuDR3Qh2jUWPmImf3+Nwm7GZq6gHBNMqsHc3I3Ra1KdhP
	wE1Ok4TYUszJgAmcuSK04tZkcsQEdJ8cqWl9ieVVgW8bRGG8V9BMzE5FG3voDJuc/XDNOEfKKHD
	OPMvHJVH9VYzasYw==
X-Received: by 2002:ac8:7c51:0:b0:517:c38c:74b2 with SMTP id d75a77b69052e-5213e48ba17mr198822341cf.54.1784670448313;
        Tue, 21 Jul 2026 14:47:28 -0700 (PDT)
X-Received: by 2002:ac8:7c51:0:b0:517:c38c:74b2 with SMTP id d75a77b69052e-5213e48ba17mr198822021cf.54.1784670447874;
        Tue, 21 Jul 2026 14:47:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef68b68ebsm1385931fa.10.2026.07.21.14.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:47:25 -0700 (PDT)
Date: Wed, 22 Jul 2026 00:47:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] media: iris: force stage 1 work mode for CBR RC
 on encoder
Message-ID: <2pksblzjw3juu4dvi2vzvyeyawbka77f5lpc3e4t5cjghowujp@rdqzk5vwnobe>
References: <20260721-iris_multi_slice-v3-0-adc61a687e7e@oss.qualcomm.com>
 <20260721-iris_multi_slice-v3-1-adc61a687e7e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-iris_multi_slice-v3-1-adc61a687e7e@oss.qualcomm.com>
X-Proofpoint-GUID: FBlWkj1yZJJZ6S-3z7GMHR2-c0sHbP2x
X-Proofpoint-ORIG-GUID: FBlWkj1yZJJZ6S-3z7GMHR2-c0sHbP2x
X-Authority-Analysis: v=2.4 cv=eYYNubEH c=1 sm=1 tr=0 ts=6a5fe8f1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=hhjTFUP8Xi2ExFBNaNkA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIyNiBTYWx0ZWRfXyC6cBmR6V+Y8
 6EXn/hylf0Lrmak59f5utpvvM2086+YX2ZJciqYuHCnGZG8qoTFaXCztwQpLh2XxHaMzG4XD8jA
 LnVbVASVQrKTrcztoktiFes9K5Dj47KGcjoLudUcCJSHVZNOfTpfTnE54sXFifKx7rhtaBNE8gS
 95XCUbTzI67xIDxytY/AzJCoJFuvFSNR3NfqqAKezTJdj+uPe55L5HNvBUpOs6Q/yV6oBSZoq3r
 Hjf3NSAijaHLVSy3bvGxIJIgINlbsxytHqRWlSuaAo0g+ffGPElLai/lr+5Ubcs3i/clFZi1TCn
 arCNoZ41XihroD3eip8TTYhrPuunKoi2bdxCCClwLk33oJgBKMoXz4BBuuMl2beq8pvKZHGsu25
 MzPvPyWW9R1nC1KKGd1jZRICoQgNNYhcP/5uxap25lsN/sJRkXJZry+dO+wBy/6CA/Sbvrab4Vh
 ztoBnrU0vhCExuOMYNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIyNiBTYWx0ZWRfX2Cv//lr0Zsbb
 reFbzbE1oqNJ3hiJuu6AA/KKGDSsMppuIGR+60fTJoPKPwiHDFwEJs5+KiREgbww+rmcvKLvSWu
 p1IFtHUg59ENSJSA7dl96VGkD7B+XKc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210226

On Tue, Jul 21, 2026 at 03:23:32PM +0530, Sachin Kumar Garg wrote:
> iris_set_stage() currently always picks STAGE_2 for encoder sessions.
> CBR rate control requires stage 1 operation, so force STAGE_1 when
> BITRATE_MODE is set to CBR.
> 
> The BITRATE_MODE fw_cap value is used instead of inst->hfi_rc_type
> since STAGE precedes BITRATE_MODE in enum platform_inst_fw_cap_type,
> so iris_set_properties() would still see the previous hfi_rc_type
> when iris_set_stage() runs during initial config
> 
> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 10e33b8a73f6..d7cbf6c3614a 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -519,8 +519,13 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
>  	if (inst->domain == DECODER) {
>  		if (iris_res_is_less_than(width, height, 1280, 720))
>  			work_mode = STAGE_1;
> +	} else if (inst->domain == ENCODER) {
> +		if (inst->fw_caps[BITRATE_MODE].value == V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)
> +			work_mode = STAGE_1;
>  	}
>  
> +	inst->fw_caps[cap_id].value = work_mode;

Separate commit, Fixes tag.

> +
>  	return hfi_ops->session_set_property(inst, hfi_id,
>  					     HFI_HOST_FLAGS_NONE,
>  					     iris_get_port_info(inst, cap_id),
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
