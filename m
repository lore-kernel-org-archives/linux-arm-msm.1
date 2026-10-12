Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE1D3C9EE0
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806956; cv=none; b=fZTQWVOJdJi5gVKFHfsUY5PuWEd+MvYeuriEFtOS33LyGqS2Xl/fmuCLM+pG4RX1PiFPCxr/a+22cjm2r7MK11vpJ8JChMnRUpv2H8+cSSWOpWlLRz/BQX5aXK+J7P2yuKsIKnyM70ZLwGiQzLCu67LSM/EVjT8XXnqzJtxdf+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806956; c=relaxed/simple;
	bh=7gDGeRMtHjE8XIaoNvoEv+Yb06Mc7LJbe9EfpStF7KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rm/IYKTqia4SWJ3y13YXsdbumq/OaIe+8nuazzww3UWe/+wHlZ8S2F4qBnzsqQoySaCQF/g5FfBhHwyf3eh5jqBInjCOtLGkRqAOKXtpd/FZCsll3jsbkmEbiQv6idWVKNQJ50oR8DOiQDu3EqHAE8M+mbh88q3oE/WuNwodF9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UWi2RKW2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hAC+k40I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UWi2RKW2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hAC+k40I"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC03WV801966
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y9ZrP8rOv+ZZPiV33sAcp+pu
	UevN4wv31y+rDLa7hTw=; b=UWi2RKW2sZm6BnjUxRR2CvQBnKnxgU9HZhDsLrvi
	LzLSc6d4E0oVS9yGxgs/zaE2FTKaLwzs21iMLwwSr6/4I2WXr3Gokte81URTNt3x
	PTPSPVB/x1HppSgyVmHeQcQQRIsk7UPBheJEVEm+39QqlMgg7iCzxhjB9bJCOKSx
	sHjGOFbMCofnBqG2M3js0yJK9vwzlA7BjFnCrSDg/nLpIKyMZoDh+DVpRB5WEns1
	Gb+lSDI9qlThzyMNCZlR847MAjdUmatY0ejSIlBAaH3lsH4zVIVyuaQ9DHoQIcEr
	eqBpYSPmW1+2UKj2Ll2MKIiMUTsKzs721U6mqki7RuLFUw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfcrk4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:09:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb93c874bso767193885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 05:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791806953; x=1792411753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y9ZrP8rOv+ZZPiV33sAcp+puUevN4wv31y+rDLa7hTw=;
        b=hAC+k40IBn7K5VunIfRkuowOMSts/ogyFAvHTkKMNz2k9lUc3gD2xiFPj55r5hgt2H
         U4RPuGOKhhwGZvwaZ1yQJ+4HySkpvxYC91e1thu53ZDWPVA2GCTtLAO4YvD/0N7qQh7b
         tBGegtEk07v96Bbyoh2MSdT+Jtaw/ZolC0D9EDD6wDRe3lGHioQL2BGsjrxBf7bcCjw/
         1RSDZ9gc/b3343TQcKo3Lpoi6UiOqqVHSP3U+Dkd9TbQ5VfFuc/oMK0nYC9T6i7So2dN
         RYSq+b/PNuB5NSh4yFU6jcs+uM1wC9/tGBj8wF60usVZj8qwOaMl4DWwX4ZaVEs6cQ7f
         oPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806953; x=1792411753;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y9ZrP8rOv+ZZPiV33sAcp+puUevN4wv31y+rDLa7hTw=;
        b=atA/URyrEY1PuDwFYqI+R46R2J8vmmc/yqviEUYB3oTgBb+Nfmz/KSxa69Oi7yLaLM
         1pDspSvsOlezv1fIMWooNlezHK+dPU40CJWsLJ0bTUDVLhVNeHbdb1cRVGOqj4npKPOl
         mnnfXZJh6/D/W5ZeCY06DfRbxJenVp/lduTGJOiOt5AAgQYkn4EbOgml27N8iBy82nsE
         baV0c32ztdWBoYdCRwrcwcCd7V/EopzQ8jVftCShSzbaMo8JWUSeqrepXcJu7bLVTbXo
         h1VBIT/+k5Wwty1UPbWJUT4e3xiwN8ynQp7PT7SKoZNEZqw7KXZESAGS3p6hH7sW2B8A
         gN9Q==
X-Forwarded-Encrypted: i=1; AKwUvByHfzBYl0dgpA7grz+1TRcA8C8XjkAG4IADQK3uq4EA7nqrAs5ya25epLgvb8oOTHP6UlDgWtuZhh/67tPP@vger.kernel.org
X-Gm-Message-State: AFq9FYITo3gNn9M55leyDGLrAKUkUYYW5OKW1g/MQgbWxcrQka4vwN4U
	ixD5U1T6JlqG4ksTDhG7CqB81awXzmoYAc286E0Ocy8IDq655tGthcMKf7ARWzYOxu21U4uVOoY
	aeca6kKnLUkdjKAr/d2hLMijEleMUwkHU8J582L0UnOd9N6JV8gOKTxFXHMZylc0oWXhe
X-Gm-Gg: AYBFou0mPp4Tgzvw7RuM680mtMXXQN/KCp6hG+VNnxxlCD0jMEQlt3zmj3hSW3PaoPU
	QtgFZvzw/lUM6fm+00zjA4hkZfkMebk8tNV/rBYfeTCfe4l5zw//XlWrlfvnSy4rFbb4hcwtvTw
	/1wDewSiCtYQDh7aHM1XAIRaBty7I0zappRcdfxNWgTnIlr8YVSCkl0yFHcHecTVdHaLhNf6r7a
	4jx6o7cEEbE/zlVIEmCk0KySU/9WpuwtoKNJ/ojDpPRi+wW7GgjzIIOk4DslwMSralhfNvLhd7J
	1wo/9y2twm0uDStaffQEkzyyj9Xr9fSo7VZ/cqESAszMKDCHyw1ktsAIpfgX02B3jX++MTqAsT+
	Aq2jBH4yRvc4cSxf7arOcsy6pR9EVFsjCmswgcDbHiUgUchWibxePs5vZHJdHFaEM2nKaXsby1W
	r0qsXX84n+BrTn
X-Received: by 2002:a05:620a:2841:b0:93e:618f:8127 with SMTP id af79cd13be357-93eb95e2a8dmr1542314185a.8.1791806953108;
        Mon, 12 Oct 2026 05:09:13 -0700 (PDT)
X-Received: by 2002:a05:620a:2841:b0:93e:618f:8127 with SMTP id af79cd13be357-93eb95e2a8dmr1542310685a.8.1791806952605;
        Mon, 12 Oct 2026 05:09:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3caaafbsm31078121fa.19.2026.10.12.05.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:09:09 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:09:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/6] drm/msm/dpu: do not assume a merged datapath when
 validating mode clock
Message-ID: <iqkzz4wnfeeul4nkkemhcvjluucot5ia7pfin5ghu3tkwkjfso@raqzz43t7lxz>
References: <20261008-lm_fixes_final-v4-0-fa986071c3c1@oss.qualcomm.com>
 <20261008-lm_fixes_final-v4-2-fa986071c3c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-lm_fixes_final-v4-2-fa986071c3c1@oss.qualcomm.com>
X-Proofpoint-GUID: dbizdRfklvevFOk8femXW31Zql7sZ-nD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0NyBTYWx0ZWRfX6+r05YG2/0Cf
 Uf0tGoVC7w5nT9ickz+KlShMKzpthzg5zSkJRl4TBqVWa7ippNOSh1PHHSLE47nNsXV8jloV3Pr
 Kh3Ryz+sS8byJIeZ6CXjoj3jH8vhxME=
X-Proofpoint-ORIG-GUID: dbizdRfklvevFOk8femXW31Zql7sZ-nD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0NyBTYWx0ZWRfX0pnzISNg365y
 CGoRlodM/zVEFRvgKTv9tWZKTIB9Wv8S75/BBYBugygv2ixLe9L9B65UaaKtuuxobSZpsUDEPnI
 H+QQn2qbZzZZrCJk2kfvHG4+USxYUn8yqeUDJWW4/nmcDeMCHMeEjCtuMK2yMlvjhnYEmoxSs3D
 Cl2aVCegExsi4VZ99/Bl4gUqS/n5XCeIpDQeKoxGSmzQ1t7wu4ROSpZy3ppub0xbrVeLXkaE/VW
 Z+HNWJhTHVXbdg46CKlWc2jv/yUpk2XOj8G68IXOb3c+HZ4MGlb/EcSgK/rggO1Xdxk+FNRGKnf
 l4pIg0CE+3Io51ZcFzveFFXJLCw121kPXe1EpX/mboqukdsdq7EyvHdE901JuapEDRJXyHMTtHI
 5RUM2n0dFRTqX3cu7r0Sy8DhZVpmbm3a3Kgq6cvLVK1lD5zs9qXmrAVjvcWCN5m8pwqMjE7icQh
 fTreVjtndpxTlFXkxxw==
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6acccdea cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=7qsbTKUd7HEg1-mJ9OQA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120047

On Thu, Oct 08, 2026 at 10:53:48PM +0530, Mahadevan P wrote:
> dpu_crtc_mode_valid() halves the adjusted mode clock whenever the
> hardware has a 3d_mux block, assuming the mode will be driven by two
> layer mixers. Modes no wider than MAX_HDISPLAY_SPLIT are driven by a
> single mixer, so for those the check permits twice the pixel rate the
> datapath can sustain.
> 
> Divide by the mixer count the mode will really be driven by, as reported
> by dpu_crtc_num_lm_for_mode(). Split modes still get the halved rate,
> single mixer modes are held to what one mixer sustains, and parts
> without a 3d_mux divide by one.
> 
> Assisted-by: LLM
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 0b51a4c5db57..209b25dbeb6c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1631,8 +1631,7 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
>  	adjusted_mode_clk = dpu_core_perf_adjusted_mode_clk(mode->clock,
>  							    dpu_kms->perf.perf_cfg);
>  
> -	if (dpu_kms->catalog->caps->has_3d_merge)
> -		adjusted_mode_clk /= 2;
> +	adjusted_mode_clk /= dpu_crtc_num_lm_for_mode(dpu_kms, mode);

With the 64-bit division fixed, LGTM. When submitting patches to these
drivers please make sure to build for armhf as well as for the arm64.

>  
>  	/*
>  	 * The given mode, adjusted for the perf clock factor, should not exceed
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
