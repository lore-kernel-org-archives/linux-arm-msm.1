Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793238692;
	b=qj7R8azr1Mq/9qNKv8fF+YQ9VcTkuOuLV+4PjpyJVEhUIMZHmSrmLbDrzlWpjjfhPgay
	 XxOWQ5ysQAF4LUJHLKSFBk9Pn9Pa4QG9+jcKXI54OXQlx5LPASeFKD8xCJJK0P8xWWWIV
	 d0SRuUNEZZzLPlptzT5Ir2OXznwfUqYKaReHj2HHlSzylBGsqEtOFK/GGaE19c7o2T4aQ
	 c8BegvjDNeMcc6LBPgIBqGXZ2PWZoo2Y08P/yBCEYTtigm1h9sBUi6KLXNzHghPE9W+Hz
	 gY/eksiMHhaMyknTIwpxLewNbvMJc/Na+cldqh1RM44aozIS2BjrhaM7RaAwhjACywQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793238692;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Rk9+wkvXRNptLffy30oeFYSi+1Wc6/AhSR14JPEURjY=;
	b=Zd/DtUALBR/sNrOUfvgFtjC2/0ySZmJ5oDxHvJky27NgtrtHnj106zYVHHPkGiklj6gc
	 2a4+HgsORe4hr1ikZ4MjQdvf9Ayx/Tqdm9fBzamwamCO9NLQ+QpAjrqEPOdfy2tCpAS5/
	 aGhBMTO5Uk3CbOIB/Mk/32cXHMbM1gD8cB9H2y8yE5GVibN/10d5xNkPOGDji/su6XhpN
	 SoeVhdVXpMP9TtHZQeSJ/kqvVAx1wVcsUrCVm4SPteIVII7l1MmBpI2TR1dVS+V5mi28O
	 9v636M47NdBxhxCnD28n1zCmSWF8JbSnTbvgNkV5Wf1ObH8HHnTLmyWDxrywQAtBHTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IdyJweug;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h8nnCrnW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C66B606A31D
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 01:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C66B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IdyJweug;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h8nnCrnW
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1jPxe3374754
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 01:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Rk9+wkvXRNptLffy30oeFYSi
	+1Wc6/AhSR14JPEURjY=; b=IdyJweugAsW4uikydO6c/JTsfdePltsT3KCRJr0o
	/2xODwtQyCtF7ELQaWuhZqr/JujQRu21pKJmReRe+yl4W6skPiD5tx3bsGFiV6nO
	5nLrq81IzT0NoFvpANvQOlDxqapzsEm/yOhw3aKYUEbijg/xGEBSV9FH3fo0RMSO
	xUgEeZ+aO/2RE/JVvG4t9oFWpUaHVEXEqG1R4mRTBJdQMmvwLHhg+ZZAYgDWJV3I
	qDlOojq6nRnyfGLCRQaJqTvt9cBVxcCBj2TF5BuUjBX/2XZX6ICbPYey6il7IvhG
	cvUW8a49ws6dd0ByQoPW9aH/uHV7cQEvsI2/qL9oB/jfkQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hktmp8dt2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 01:51:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53635e21ddaso21777341cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 18:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793238690; x=1793843490; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rk9+wkvXRNptLffy30oeFYSi+1Wc6/AhSR14JPEURjY=;
        b=h8nnCrnW11CugQ9GQJ6SvREnmykfRPlhVIetfvYFbM5sUdjIbgfDd00lBMEojmS9mM
         JZDUi7ckwRWStf77NgOe1RDzTYbpYBkrRsFIJhmfyi10RuszlOnYr0oyuxPUaD29Fvjq
         Ov+g7dPO0fM3jK9/5I4zU2xow2QvEy6yz5lysmsousl9AHCVhqYZiBIUdMY3Xl6Ow93Q
         bbQ4Xf77iDwusZvhZraYO9vrGd72Z/2SJEHBlNPU3QALv81rSQt3J0xuvQkMaiNGLYDs
         GUIZrlqtSNeg3H7N6xeBm/d+V4fqSnc1GH2Zn1aURLLDpdXnUWD3uXVwvO/6svTx8KFR
         NK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793238690; x=1793843490;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rk9+wkvXRNptLffy30oeFYSi+1Wc6/AhSR14JPEURjY=;
        b=WV7b6uTIL8+GliXeeeDbwBxb8U24nzgrfX6xbB17lYScknwuCjbYYMEr6foXms3u65
         pK4byG7b6hTNQ5mlPOHG7Cf7JmshIhhFojc/9ZpCzVUuuSTV3nYFzPvhEQ3wx0xIjtHC
         xYGRC0kHlofkccf5syQDq7CtBHpsMbW0ewUNWx5VYTo1UGfqbPfs+/bPabK0QTiepdcC
         L5eOk8JlIWF88CAkNYJC199vzcZiZjYpdTJDo2Ce3Q2cIzebJPf24SnbhnR9CFVkP+Nh
         IixKBTBpLMy7cg1Y7NQwf/2n4nhFHda+Xd4mBU6Qie0SbB6xD9/tABM8ULP057p/mbZi
         BMbw==
X-Forwarded-Encrypted: i=1; AKwUvBw/AHW+mHneapyf/Vw0CoVT84070W7bTREhv1uMZtRESpPo10UHTbgsBttatGmKWvIAcVrtJyu7EqayasAd@vger.kernel.org
X-Gm-Message-State: AFq9FYKEMS/rzzb5X2TfbVGQtQYYLE7VpzvkoatRWk43sBVRlNEchHQg
	cD5ZejXUUbeypMcZQpSfIq6lwHyJWsgYHi0Ew0fGfqpM44w2183l0hzLfDM/YWFEaUtokdA1gvI
	SBKEujOQhk+b3CHyOAQmSzxdMoX8Mfapzofh3d60h+ywsLTC1MOVNBOLvDqgmVfuunSCq
X-Gm-Gg: AYBFou0FjA3Tw3j9C8XWmDrDF3t1M9ESmpKnimsmSqQmUcENepzVmAIs9BnFR6GHDr0
	HoyEFfp1sQ6LjSktRUtJiQlsZBvtESd9xHQ2aWnYUdjpyFsJ96LEaOuKEKdJ1vU/+xCijTrJ4UJ
	wNgAh1fJZBlSqfkOrbt6l5JduQJY95/XTCPGqBSWbjskKSGFxGBAn1pyDV50nHPcajmFckSVdqn
	kFIsZ8KfHFICvURRg3lAnxm+ZSUd6r1RkoHKbrSKGxq0TNZVnQWHGLCpsrYCz3LFNqYuWTakC1S
	tliOe85fm5ZH9W028FEtp8AkYxHPN2Jri0NNWhIboNeIZGL3zrw6eEdoOnalN1ZQPuWcuwG80bB
	MJ4Rg+tS5a9fwC2fOJyArVhxzBsVZsR6OwNd9ySEsd1y2phJ5zYK4z5UhXi8OD9bmVLoUxecEfE
	HLG0DSIMknheY5/IXciV8OpJkiJz60fdOmbqWcz9bVFuRinaCK+AbznWeM22LiVA==
X-Received: by 2002:ac8:5987:0:b0:535:958:b9c1 with SMTP id d75a77b69052e-53fc8bc2e33mr71787891cf.11.1793238690210;
        Wed, 28 Oct 2026 18:51:30 -0700 (PDT)
X-Received: by 2002:ac8:5987:0:b0:535:958:b9c1 with SMTP id d75a77b69052e-53fc8bc2e33mr71787621cf.11.1793238689674;
        Wed, 28 Oct 2026 18:51:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709f33b5sm34356161fa.23.2026.10.28.18.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 18:51:27 -0700 (PDT)
Date: Thu, 29 Oct 2026 03:51:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/adreno: Soften no-firmware message
Message-ID: <uoziyz2q5wmgxtlchecfm3bo5mzlmxczldxfq5lsutrst7nrdx@5dk5xtwft5sj>
References: <20261029001601.82269-1-robin.clark@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029001601.82269-1-robin.clark@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAwNyBTYWx0ZWRfXyRjjp7SyYitc
 hxZtgVObCqu1nOwfc66CVfsANv/XuDsPwqxucMWsiuRW+pNRvA+wPgA/IINgvBgNCsvvmkumDf8
 LSogCTPwiiJx69KTHhEJiti856+twUnpvsk0St4WNaV8f/xD5iL7bv2X6aYYWKEmPEAClYVJpHD
 Mgs20ltAueEpJFGJe66prP/l14qzfNZT85CDlPi3tIEFfHrqzRj/u09XqPv1HhMWaxdb7aVIvCm
 GVb1AWniuXFxHv43SMLm62IkIFqDQ3DEtKTp+t/XU4gb7w3r3r1R6GbowK+XdpFglGVYzKrsP3d
 VYGZJH/ffTw5xy8Ev7rQXWikhJ0LehllVcVqxrqkuDVGeUP9kS5vs6ZzCs+R0VIjEkK5s/RVBNz
 qaXgqL1Okr1hnMIkd8C+Qz4LnRDDkJZLv3Xj47i38JxF1LkCQYQRlg3OmOe4nP19mwlrLsaUAb9
 MK0XY5rr1Bk+t/+ly8Q==
X-Authority-Analysis: v=2.4 cv=crYOAF4i c=1 sm=1 tr=0 ts=6ae2a6a2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=jF9eNvnS1b8AvMrK6iMA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAwNyBTYWx0ZWRfXx5CZSwfK92hw
 ZJq4tNzYl0sMt55kx4V3muhNGUPFKQV3BayhHBdcYwKfGJpgObUuWQm/+8b2cuskeHu1f6zN2tp
 RiS8pUQXDSWD3rWz8Jy7nCNkIYrNl/I=
X-Proofpoint-GUID: tvAJjZJ65WwIuE9Se43o2IO010OPl6AL
X-Proofpoint-ORIG-GUID: tvAJjZJ65WwIuE9Se43o2IO010OPl6AL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290007

On Wed, Oct 28, 2026 at 05:16:00PM -0700, Rob Clark wrote:
> It isn't _necessarily_ an error, the driver will try again each time the
> device file is opened.  But if you don't have GPU fw in the initrd, you
> end up seeing this error message at least once.  Which seems to confuse
> users.  So try to re-word it slightly.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
