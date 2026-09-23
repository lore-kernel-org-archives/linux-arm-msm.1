Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD6D49DBA0
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 12:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165568; cv=none; b=DbzC11s/g1ACw0/X4oajWCrSgnQpd3GVNBsD+hk6zLR8aOZsRzRIh/OyVuTvwvy3+MidbWYsbB3tIrildL3LXR3hqfvQZnLAiN7FFzEZjQIMB+eBLQal/Dqq0/ksLVfqoQa1qRInjycMl6Mbo1EGvQl4Y4xR46/bfhiUykk8DhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165568; c=relaxed/simple;
	bh=0VO+6la6VVXKr2WM+/hRiCJTp8YOwR0hvpsSzIUTMys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o99ceOHK/S0rR22n75XPYMw7O/cBM4M9V6VTFuHfKbq1hDstiVoGHoe1GHpCqs6jlCV7BeIIBnU+DoZtk7tjuqJspPIkOejsWqgL4FONiRHk0E1ZlqvaNs0N9Q9zTlxh6ScdHpXWn2Cw/0pzqFuYbrx2hk/PIlU3Cpk8mrVgmU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fkikkWFk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JNokYSgZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fkikkWFk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JNokYSgZ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbbcC3414017
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 12:12:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IWCAXdbt9MLQNW2dNVZ65g2U
	h0XJcuHhkEaIaIxj6KQ=; b=fkikkWFkCfrIuMPYgFh2PBG0gzBE2HOtEcoC+PGJ
	Xz45tVKP/N79jRR1xwzXlaTVy+NjjBRoi6zcCwBya66nbyDkVMwv5SN8+45qUZJN
	1Q+XNHr7fp4qZW1SkUrkLH//xHydwBGioJUfZvfMWi5z+ORSJy8l2o25GfD8rxHJ
	nRFkTwG5NtgqtBEaPiZAleicFL4PcZ6ApOMYnalbs16cQJSTamBJ4pge5iUiSvMd
	ls+Iubb5WH8MjbqIXKLP/XJZSWW2Y7SyhxxDpqYDsFHjQSrDVnr7BVaIaMtUmCW7
	mGNz+gNavws8fXLmW6d68KXgAmsiPT8Ixnzt670lOuU8uw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv78n1vx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 12:12:45 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97e99aaaa6fso141791241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 05:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790165563; x=1790770363; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IWCAXdbt9MLQNW2dNVZ65g2Uh0XJcuHhkEaIaIxj6KQ=;
        b=JNokYSgZCOVYbU6jkpWqZW52OTqSrxRhkhdb2fZZdapMQBTzUHAKH89RlCCvooV6XB
         OND7e7iBiZ+hmrm7poVuWfkl5yyQ/nsG0fAB/XnGazE8vX7pzFWXQCE3aNKlNQmvyVDe
         Fzvh6t6gM6fEVmCcW9Momv3sw7WFsWcZgE4vias8xWpYa+N5ELkMIeHsd0ojZJJy1Qi3
         3CJ/EVGqA23DHdgzmbPF2liqQQtN2WdClgnN5f6d5G4dAYUQLs5JShIGWPQ8wwc0hC2D
         SG9Ke/382IytyDEtGYNnRqypQWY84ZY7NMJ619kWDNF4bIXkZGP5utBHLUyqroF0lEBS
         q+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790165563; x=1790770363;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IWCAXdbt9MLQNW2dNVZ65g2Uh0XJcuHhkEaIaIxj6KQ=;
        b=wr/eYCm9bKOdV+L9wsT+EnpJLF9uEN6FcShX1HU4xpkbtrGSqC8m99pgcjHYmcL/gh
         hkQxmCe1wqziCC2WoJ3cl7GWMYCmva6aJEmB9m04XxQhWJ1RnQxdd1o1yWqj5fa1uUQx
         63wMU1Ki7Jmrqh8rjLcllCQOSa5Js6lcbsbveJzdSRFxqBUP1znycs7afHm0yWPXgWM6
         a3gmDaiHJtT+VrmFc/kwpV03HG99ORHR5x8ZlkMpS9660av7XOmVBVVq/Ptr5R0fvBgu
         uXpi6mcVfxZeTLCBNB2FGII68gZl3Ak2Q5K6lUnCAlnhUTw83ZXcTBfFXzGXelrkTuGK
         2mLg==
X-Forwarded-Encrypted: i=1; AKwUvBxZBd4oUCWz5C39mHgi/Bbw4Ba5F8WlMCD+XHie/ohiRA2Iz6rTiofscu9YLzXASKEkmntcfN8rDgKAfli1@vger.kernel.org
X-Gm-Message-State: AFuF++mn7+xaK2dc8v1zufNmiAvwaa/SOrjgZPiDV47mJZZgAp2raqCd
	2NCRShiPiocCg/6DJ2mMPNDOHQ4QmTPIDxZWNb1jI287GGcrvtX+gv7ZRJq3vnJ4r9tg6M1JJO2
	1Lhk6wczOYG2PwZoOkaypb7JqXrB+/dYrHNNtQ7hmoLiRnQPKJBX5i+9MECwCYRdpf5Kh
X-Gm-Gg: AYBFou2e3BP6bAsH1pL/ZU6D+mYlOGzSTaK04yOoDqOcfAc41zRrX2Ssfr02GBz4+ql
	C35bCn/nzyy5aCEskGQ6XjNH6bKaoo4EfslTs+o7C1uwVOnnf/dh6m62M97eWEUw/6B0X8Ysu5k
	sn7U9yxBUKNomChb4UqNaEq5Q+uKVtJmstKQJFvlDm9JQJrqsuqYOv7a5IShsOJDCGZhCqZAwYY
	Og1vCY+khcS6zoabrXc1vZK25JQJYXDr2DJyGNQMatNfhvl+LEW/tg+rg/w8QUD1nKOVu9eMlP1
	P5tnFifYRcRXMODCxpso+fr5T2Mh3sGf3TGTqeRS0bKCawMcKCGAZR/Ag5z566EgzC56CP/HAIx
	f33QeEpkI9IU4IGvmgA7wRvO+WVenQHtRoK/6OQQ42LhYq/F0HlAOuUG60+egq5i5QK6yO63zTH
	VWWyB2Yx76MaYt
X-Received: by 2002:a05:6102:3711:b0:785:c643:a415 with SMTP id ada2fe7eead31-7ac1bb45468mr2060911137.12.1790165563573;
        Wed, 23 Sep 2026 05:12:43 -0700 (PDT)
X-Received: by 2002:a05:6102:3711:b0:785:c643:a415 with SMTP id ada2fe7eead31-7ac1bb45468mr2060883137.12.1790165563151;
        Wed, 23 Sep 2026 05:12:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d857877fsm547327e87.28.2026.09.23.05.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:12:40 -0700 (PDT)
Date: Wed, 23 Sep 2026 15:12:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 03/15] drm/msm/a6xx: Fix RPMH dependency votes
Message-ID: <tdjlbzqqpjmpdpkwylsxz5z62zaxceaqnmmi5rqishdnefcfed@qqxd4b5e7ift>
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
 <20260923-hawi-gpu-v1-3-0c3c79a1a470@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-hawi-gpu-v1-3-0c3c79a1a470@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfX7SPTVxnGXrog
 niGeBXAeE3LnLFe992foWLMe73P0BwlLYIpcTRYi0z1cz7Zq7jsT5zi45E8H9SP56g/4gOS6m+4
 xbZJPHZhYF6RGCLZNhCqE6UyeePvzJQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfX0iWjup3Isy3J
 m7MC9CJ/PJo8TFb3BTgUQAP0WLDn9eOhpKF3OOuz2cEsLIHcPCqmNl2BgQSHq3FE7v0Oq12taLr
 TN4ySQuftk1fCGWqar009yI94vYelYWuLJRUABatKG/MkuHV+r5uOkGt62nKtq/JodBBZLMy/6Q
 tGj+7K17W47FNFe+syBXwRn8lS8VlelZLp89IXzDBVJZdsCBmdeoiBbG2XXSvnG/+H0hQWlZQbs
 G3P6K9B9zpxagB5VxfWZezrKqfyOaK6YnQ7MDlMd0O59rGuamVPyLGEeslTovuneddVfQF+z0Rm
 PiW7tIVAd+nL2TE1AKTYutI1QxtVU+7ip+DzpmIfj9tT+3weuwnwci0HzhEqEwxfOERCDs4exyx
 x7rwjUrltrrvPuEoQ1WDmlgloXm4k7SqgpujKLHnN5q1LpbRc3/vpQWgiTsP3JR0ondrOPbuyIE
 jfoEhqVWCVTNqbIKTxA==
X-Proofpoint-ORIG-GUID: 3hhWiJK-aT1L5OwSCAbN2iCmRGq379Gp
X-Authority-Analysis: v=2.4 cv=aNFlOr9m c=1 sm=1 tr=0 ts=6ab3c23d cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=6T55iVGf85rzv7ZivO8A:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: 3hhWiJK-aT1L5OwSCAbN2iCmRGq379Gp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230048

On Wed, Sep 23, 2026 at 03:55:43PM +0530, Akhil P Oommen wrote:
> a6xx_gmu_rpmh_dep_votes_init() iterates the GPU frequency list
> (gmu->gpu_freqs) but was passed gmu->dev to resolve each frequency to an
> arc level. This results in generation of incorrect dependency votes
> table. To fix this, pass gpu->pdev->dev, which owns the GPU OPP table.
> 
> Also, reorder the dependency vote init to improve clarity.
> 
> Fixes: 06cfbca0e1c6 ("drm/msm/a6xx: Share dependency vote table with GMU")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
