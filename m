Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D060D566C62
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 18:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002357; cv=none; b=N9cse+LNC2kC239xiiN1ju2j18G7eEhyjWeCektKYjyGcOkbemL3wkGhFNNvcyz6cHsO22P8JO6ZEmz2gqiG0JYZa0Y2OkwrUYwZvM0EvpEnCc/9uZiE6fNf3NMhUcGCIkY/4orqBZNu7aXaA3nB9gZ/7NH40d7IhCi11zOhISY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002357; c=relaxed/simple;
	bh=L/Zt4lyuukdTySPEcs0TqAf0iJdmUmvcwaesmFe3yeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4YGE33Fre7R2X6PMP8URQ1TJ/tYD8iCIZkOHtCRs0GXmKbl6VaNooxs3Iq0N5cXTv5lKugEr0sauO49htgAlwd2+plNp/QggT0EqqJjZAa79HjV3JqgxfymW640Be+wnPrZgY44WYnQu4CG1SQ2aUKor7IzXGsjn9I+4SWZGkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fEXzjDtT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VXnADTCo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fEXzjDtT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VXnADTCo"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbOUW3643051
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 18:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TB1/Jegp7O8Osv6GN5Wh68G0
	kr7B/W4uFPBOAA+1Plo=; b=fEXzjDtTQZUeI6x6Vi3b3Ncqd3XpJlfmG3PqbyxT
	GpglkFOVJPRBnAMm7S/yuvD5+I6FyQEbpx8lXp2Jk9o2hdSTUfrsi8vFov+ds9YT
	S9ewBPAAV6QuzYhuhFkz67PjZva3HIsNSPkAB2VCPSJ6fFrst82VPmtwHHjZEkdV
	mTjFoU21ESRrEzBEXPRoWE49kcuL2tn0AOVeUriGkxmj1UPj4KGRlHSsbpq5UlcS
	XKC1LhUhyWTl+bWwa1ZH6PlsfOXx45N9JFZCCuAblmUoGyxzzBliiR/PQlg/NkNs
	FzMt1AgU5OwfAMuQSSiI29QgEph6GpCD+32H7eskfYON8g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha470ay9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 18:25:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc0b31ecaso149358285a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 11:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792002354; x=1792607154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TB1/Jegp7O8Osv6GN5Wh68G0kr7B/W4uFPBOAA+1Plo=;
        b=VXnADTCooYdFktkVZesLhA6d1hGHEFhsjw5ZZKanI9crXgyqqj86b0+7ETQQXxjdIO
         NHEEU2z//MYYvdX7U0zazljP2t7jOf0B2520FwuJTZm52YfUn36d1Cd2vcdBk8yD3WvC
         E5d6t39Eq/IXI5L2Po3D9pTy46rYc9s7NW5Fup3McwJe9CrQZpILX/S70dkW6dfBChBk
         +TfJYbBvtCIbeWvEBjEHKvKU0EAcPxHPlNg5bDF7D46FOnnD+7dl6+SXc+3JJj99g6RH
         ZT3V4ksm87OVkEtgJw8/mQQWnpwFqb5DrwItYVDrXyzedATbCuk8VFhL3tDGGt7Ebxaz
         Faow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792002354; x=1792607154;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TB1/Jegp7O8Osv6GN5Wh68G0kr7B/W4uFPBOAA+1Plo=;
        b=bhdGny7W2/HMJyDOPitG6XpYwYqrGkJMJ7vP3/UzlCDy0ZJE1y/pYqS7WBpjmCa7vo
         65yywyynuFa2NLMvJXS+q7jHHpIwusc0uEyRNeTerv6+QziJ3dP9uUsdle/k3RMK6/7S
         V+Cg7hakAt5YowPV6qrCvg5y1sPnORsst88NPHsxCzePoL30BjiWilQgBvjbvPFadGgv
         5ZKXSmEwrbxbpMSY82TTxfrPlZLfgJ0ZXizvojWlokanSt3t3tIPivqeDD7VFR++n6Uo
         bfyN9/aigpYXjLL7y37KY7qcCNEmg/WSApowP58pN7f429KsB7lVwhPzBU09xa3Yshm4
         DDUg==
X-Forwarded-Encrypted: i=1; AKwUvByMSWAvFYA9QnHm5svpGEM5KJT2U2mjC6DErNQCuQLWVsefWte/u+x/f1yS3BkUygrxOxZQxhJTGoS0DQgY@vger.kernel.org
X-Gm-Message-State: AFq9FYJEH8mfWm3nndFX4DBwqzX10vBjP7gVNYTi67/nEyMRDx5l7KO5
	RolQN6aS5SHtBWDgLdiBKyz9m+fROqmftcv57fAPyQ0g3nHCRpgeI6IyTOBAi6XQ/ExwB43oVG5
	yDkgD47DeG2dc6fzwRKAMS1UAwLPwHYm9w+3XPYwprWGtb2v4pe2jla1c/dgk9vXOqtZL
X-Gm-Gg: AYBFou1fzomo26ERJB8mJnf4/2ZLd+BHkIB0fFLHIzICGo4Ihjr8fWO8jpkveLXBnxi
	iH0wLuA9NsBdyq02HHYWVi19tpmzOZCCuwgTh+60SdCyeO8SZvUafZgKCThfSMQJlaBSd0MCFbh
	20kMwO5rBGAtB+cqxzOVYGxt0WbrgEH3frduOlMoNIK+rQv5br4VKGq70zwaXGCN/UgmpvShLIu
	HtFH9xKkRA860F6dkx6qrjRhXhYkH7XGNkKn6+QeCrlUZWVDAhFCjyHraJAqXYA4WM305w+89zo
	Aoc6NANeqrjwBB6b/HhIi52CUuyYqLUiVr961gPyOXe2dw7SX2xLkXMHjfTz6fq50k8SSQdrIOt
	ea8PkXuDcZmSqGaxPtuf4ngnyBcU6hitbpG9183GiW3uGOM0tw+ZzaLBdBrgQiqdW+Tx/5cfW7Q
	biVR4WsVGYIV1L
X-Received: by 2002:a05:620a:648c:b0:93a:82a:71e5 with SMTP id af79cd13be357-93ebd22377bmr2680941385a.19.1792002353788;
        Wed, 14 Oct 2026 11:25:53 -0700 (PDT)
X-Received: by 2002:a05:620a:648c:b0:93a:82a:71e5 with SMTP id af79cd13be357-93ebd22377bmr2680938385a.19.1792002353313;
        Wed, 14 Oct 2026 11:25:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33c12bbesm815152e87.11.2026.10.14.11.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 11:25:52 -0700 (PDT)
Date: Wed, 14 Oct 2026 21:25:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 30/75] drm/msm: dpu1: Switch to
 drm_atomic_helper_connector_create_state
Message-ID: <p2apwz6iujoeclp6k7trkwfnwmld2ikg375zdgdvj6m5tojc2p@juhdohkoy2ua>
References: <20261014-drm-no-more-connector-reset-v1-0-586c9c026823@kernel.org>
 <20261014-drm-no-more-connector-reset-v1-30-586c9c026823@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-drm-no-more-connector-reset-v1-30-586c9c026823@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA3MyBTYWx0ZWRfX31F5Lpcdp9Sn
 pRCHaULnzGgcelSYbNUhViq6x0GPcMYg6c5+WIYIUetLoFGF0n6BLcvbgoHug+t0goRZFkjV5hx
 p9Y+PP65sSapsNsZLL/ixPlmgp1xOXTGi8GYAYWsrEiAgsgwEEfg7c41CB7UtW9Lx/eg9rPPZH8
 1Bj5CqYyn4zTPbvP5ZO+AuPxGj6Rt/36mxtot5doBQwOw7ADP5FPhmfLNjCcUdSiQaRFpbjW4Wy
 oEW+joZAdEKeqcvOe9t/6UhmI6lwgwo2Y2EeS7tRe1UiOagH1qFnqaTFnXeNlYH8VcqDf6Gwem9
 hPzt/zKJXJU9hNdg+9cNShTL06YNXAOWLyRHIbYuWSj007rlW/4whPEBJij4P7DRtZd4NNZ3Cs1
 kaBi/XEoa05IhhdcoRmLPfGsSH4wwwLBZafgeToVuPvd34qYopdiUa/AM5zz9PED3NngxcYEhfA
 LcAxOUNkhCfLd94Oysw==
X-Proofpoint-GUID: CmTT3FIU2jJlvDWbdq7NmtmxuYXLRK3z
X-Authority-Analysis: v=2.4 cv=P6avFSAu c=1 sm=1 tr=0 ts=6acfc932 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=tVI0ZWmoAAAA:8 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8
 a=uh-rAEkd9rr4pKaSMd0A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: CmTT3FIU2jJlvDWbdq7NmtmxuYXLRK3z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA3MyBTYWx0ZWRfXwUGDYVGIADNY
 ECQhbfNGjIuJE6G3BqdGVaRCcWCx7KhSjmG1Ohb/430AvqCUzl3wLvc7uHBqKCByCIhkaAeRBOw
 ZO7QKdIq2r4adoB86gf9Z5vgrOl9ngA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140073

On Wed, Oct 14, 2026 at 07:26:53PM +0200, Maxime Ripard wrote:
> The msm: dpu1 connector implementation uses the deprecated
> drm_atomic_helper_connector_reset() as its reset hook.
> 
> Switch to drm_atomic_helper_connector_create_state() instead.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Jessica Zhang <jesszhan0024@gmail.com>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-arm-msm@vger.kernel.org
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
