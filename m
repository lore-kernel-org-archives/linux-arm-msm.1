Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797954;
	b=KP3kdqt6snVWW5TN85upM1HXTqZLyx2dPqauO65tMn+ieueT9+wYLPjPOMjQ7/PjaNNU
	 bpK6kEHG24HSSWlFUyPXNuXTRY4gSE7l54qozhdI+BjcCaoTmn3qtyGbUYcnjdK0Ytof1
	 fvOffJ5p5fkxEx3Qrm3gPL3T1b5wTm2i6f3HawS2LreUGue+7pxrSLyKXR3rVUFXnEoCe
	 mSsz7t8nqGVQElPdHTFEyAzcSNGg/w3uyr7NDzD6wTC10MXZBmvkcTiieqxqbyUD/2oRl
	 BrD7iO2SsLf5I7MnJbwx/Gc2M+2skn2qEnXDmCpkIPxFzzNeJaFisKSprFa8keatk3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797954;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=In1IJDjKvKLncIh6SA1OcK638AZD04er/Z2SLZZrgPU=;
	b=O2SI6OHGUW/CdaCb5xKhnoCglaz89LNiSwD2ZQiLBz6tMfZ8Eu0G4pPaN/yrGGyCXQ3A
	 3UDsiisUGFUcbiXW2KmxaSrmRrbL+RFgmFZTSz8KHorMIQXCoUkt7YZ3SbfBBP3oyZS6w
	 MKdfFOMTSCmh2r+7IEK29R/6yuajGSeYNjbpIi59pj7+7CLMU5DH8cgYaBunoRbytAn2/
	 /PNQUPva0j2hN3XQ/vJs0C0AFq8w7vUgTA3LpEruOHkjndWod5IFpABec+OYzUI5NU6yr
	 pk5qPLKdw6siEVI/wlSTwjQMyYP1opRW7whpcc8ajrNGIuSkVEL2MD9Dw81iJRHx3+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SD8QxFZb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DWdkhjuX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7750606A332
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7750606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SD8QxFZb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DWdkhjuX
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLv2Tr4026492
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	In1IJDjKvKLncIh6SA1OcK638AZD04er/Z2SLZZrgPU=; b=SD8QxFZbI7BBohKo
	M5rFrARfWHIClZmIvVfqynSCHQeeT0RlEgmuKcX4OA+5E/0o957vUxeLrFkvM3fF
	ElniuVdD97Th6YQDHk7YLOzxdVNK5fq2RgY4I2m18hcqRuUpoMceDH58ogcySv20
	v346Flya/ZzdYdF1q5PhkOePp31NQQFjumGh9k4TTSfB85HPrlIrNdFTIAfIBdNd
	Ko7FgVhzc0bERukLHj2rM5L4jvKUFwpGfuVpUj6G7Vne16GiFUz2+RtX9w4BwqCH
	U3tnX/c33yxSpRzTjvf2ZA7ZMzsbC8Lt4gQbkgIHvLeXQvgSVAaD0HloP87XW1aL
	f1T8Lw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcs7gw12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:25:52 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917a7c17166so31016626d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 16:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797952; x=1793402752; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=In1IJDjKvKLncIh6SA1OcK638AZD04er/Z2SLZZrgPU=;
        b=DWdkhjuXD/KcI7P03nwNfZUdy6uUwULMGuViSy9rDflwNchiCGtk/Tw8hyZAKyEd+A
         eyOcf0ZXaxyG6/yaTyLpdXHKbkseHWqh1q/jqq7x4bSA5hLAdqK/kCoEb/70XvIWxuA7
         6CP3I8xt+STOUAN+SM3WbEmIP2c1ypiOJPNHP5/zOhyn/OzVtW68BKDrNS3dHNCKTI6N
         8/4VSVV5r/Pw+sAmuYOR62JE9jr9xLlFKydA7FmZ76GLVTISfie3Ep3F41/C3CYr+rdl
         WPAC31aLJX+5ConeH0aeToJWbBXnIotoqOghU05C4fMer8W5PMrfgsnme7wYAEAsmTmT
         tiDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797952; x=1793402752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=In1IJDjKvKLncIh6SA1OcK638AZD04er/Z2SLZZrgPU=;
        b=hlOB9aENILurL2cJy0FFf0i72mlLt5NeNicPBuFoCA9HxKieH7iRcBRvYIeZm/AI+5
         yVa88MeEJfI5nB88XuO6213BCwT+1nEpeWRgfuz4S0IfUtSQWaMzZJGuT1GYji5M1uru
         XhqCeHfliSXZ9HRj1/jrzVXSxJvt/jre7DlZqjHlCQDmNNptl1cOc2p2n6LVkwlXMq56
         sE6bXpVpttvD9ERbzKj+0++Ehsg4fb5qYht2qOKsX9LpuIPAGPhqYBIX6g4GisQIzK3U
         S/awRaKSFZBIOV2W9nl7f58C/odnf3Xdkz3QoIKecqHIZdfLMwojFoteaoDMgzWlUPto
         dSGg==
X-Gm-Message-State: AFq9FYLiQQXQ4KALMO9ejJiDNm/YHeXX40vQ1CnGbk5w1p0vVnW7yNdt
	PbGCKgK7CQ4MHuG1EQiSimDbYult6F9zVqP0M5JkfRigtQcRPC0bUfTc6gDMoFn3H2DC3bzy0A6
	HSxi17Mf8TrqEhduZHfMJ/nPIEJylocCtb1r+XsNKYRWUz6k/fs/EdPw10NVUD35x4k2N
X-Gm-Gg: AYBFou34gYFsabP7UMWBhMc1tFeoAudgdxWlnONOS9Fy/gPYQiWuc1Ut/QTvEK0Hl3H
	RA6Y1SMscgIa7Et1lLyoYDLN5QepFmiHsCX4Ol3/ysY5nQ6cBwzdFU4LgjkOJGmKX4v/N43RRcc
	f/rK69CDFeUsZ0fORwvDqpM4ISMwiFslW3A1jTS7F/ALvNNAwvOwfj0uRQYud8meaEM1vjyuqLp
	hMpB7RrnLEmbPSitb5L9uIC8Z1jgcLTbc7Vj2TJl704MrjfEW/VrgQ5EIC3sBo8aBOCDQAuzet2
	bL2w+mgSpOyPrHa3CxHGpGvkWcUYLjJP5bE/ebDxwtLg0bhkdoxHpyj6vUA63FLIdpOCgTpAr5/
	Arz8ZHOAzV9ZByxqslo0gzTRyq2fPHVB2ffVRwAjrxN6qHbTY2PCaQuVqbdrnpr5/rxc7dC8pnf
	LYyHnSXyT0h+zj
X-Received: by 2002:a05:620a:280d:b0:93c:7f48:8f46 with SMTP id af79cd13be357-940ef7cc968mr88719985a.4.1792797951906;
        Fri, 23 Oct 2026 16:25:51 -0700 (PDT)
X-Received: by 2002:a05:620a:280d:b0:93c:7f48:8f46 with SMTP id af79cd13be357-940ef7cc968mr88716385a.4.1792797951395;
        Fri, 23 Oct 2026 16:25:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a9ea71sm60217e87.81.2026.10.23.16.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:25:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:25:27 +0300
Subject: [PATCH v5 06/10] drm/msm/dpu: clear the CDM block left by a
 previous reservation
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-fd-kms-fix-smmu-v5-6-a5b0b284aead@oss.qualcomm.com>
References: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
In-Reply-To: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2087;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=td4pH6mKFwySyF+P0cdOuWY9YqmqMRtTvJGeIm7xLVQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+zpabaLK6RAXYgWPGaIvXugxOiOr2TU8umJk
 3PC0bG8426JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvs6QAKCRCLPIo+Aiko
 1Qp4B/sGWUAq+a3bP+1MbYAIjv/RYEUh1NRtMdlTj1TMI1K0XPzYCtUy35yys0yXWPHIehEYFw0
 Q5bTrWj6d0zfJ8WfHNI72At6m32XH2BnbuK7Lwlf1dz9HrMhYZKjSzyAdzNAWi0QjJ46Cjh0GRo
 A8r+p6sSu7fjt5z8t5T85xQR4guEPvC7S9pnfMLxs7aslbgzLbyovIk1nec4g2G0KRNyFsuyNKO
 UB9R6neO1XMEmxcVnh8OsBO2+OZElGvArmrYMh0KOZylfSM+X/S2ggnC/nc11CaEICgF1pPgkJt
 E5uKvtF/mArPU194baroCxZdC87QkOKwkeR4ESnN70uKL3Wp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX7xgTlGECng6u
 Co6KPNwz6r+aMOxq01i6FFX8lDOeQBkrmVk6wd1NjPYJXtGH64m6vNPgfddNGCDqTTexmvhJBmK
 NbyM/Nyo32Jnx3C+SNY0E3o5t4B7NR4=
X-Authority-Analysis: v=2.4 cv=XJCl2ghE c=1 sm=1 tr=0 ts=6adbed00 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=lW-OXhpROnvg2TLzoksA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfXzTdc4TLUmJJk
 qXSorxH4XmVQd1QHLvj32tI3FAcQcde+7iRVbFF1NEPMeYBaBXXvDzLYEyxfoHWd9Q3Od6dbvEf
 WnuSB3et45xZgV76sdG2mw8zpaqyaTwt3g6tvyhlbGUJPmgm6cgZbK0TZOfW+tNKnmzCjULXUX5
 34KNvKj9VDD4ePsm4zmgwtRv3lxxi7xo4xL4d1ius56Q+wpfgf6nj0ESmnVyAG+ZXIUgVl2G4Zx
 NZ+FpMC4b0KrzeIAz1cIgJTRpBPZyuGlu0nGPI3BW8/BqciowpvSFEdIwGUHcZVPxdxHmvEDQ1+
 sfYXSFkOWyYPs75RCpXK0duwKfbhkt1SB4eakABL5bVrY/+AR27zHlasUPFbis0Q7a4kYgiZr2y
 tKCWnke8yfrJ1u8GPBlOlFx2p3Mpz+v27Zh2CiFvzDjKT6O6BIvjvWBofqfEconyEzdYfnd9m3t
 Ifb5Qbgr433BHsld6KA==
X-Proofpoint-GUID: ZObH5ZenPdcUYwJvCdbdl2dLf9PZm7sX
X-Proofpoint-ORIG-GUID: ZObH5ZenPdcUYwJvCdbdl2dLf9PZm7sX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230092

dpu_encoder_virt_atomic_mode_set() only updates cur_master->hw_cdm for a
writeback with a job or for DP, so a modeset of a writeback without a job
keeps the CDM of the previous reservation, which the crtc may no longer
own.  dpu_encoder_helper_phys_cleanup() later unbinds that CDM from its
pingpong and flushes it, changing a block which may by then belong to
another display.

Store NULL when no CDM is assigned.

Fixes: 8b45a26f2ba9 ("drm/msm/dpu: reserve cdm blocks for writeback in case of YUV output")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 8fcd0b4e266c..b337f197d3f5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1160,6 +1160,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_cwb[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_blk *hw_cdm = NULL;
 	int num_ctl, num_pp, num_dsc, num_pp_per_intf;
 	int num_cwb = 0;
 	bool is_cwb_encoder;
@@ -1231,14 +1232,12 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	dpu_enc->dsc_mask = dsc_mask;
 
 	if ((dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) ||
-	    dpu_enc->disp_info.intf_type == INTF_DP) {
-		struct dpu_hw_blk *hw_cdm = NULL;
-
+	    dpu_enc->disp_info.intf_type == INTF_DP)
 		dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 					      drm_enc->crtc, DPU_HW_BLK_CDM,
 					      &hw_cdm, 1);
-		dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
-	}
+
+	dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
 
 	/*
 	 * There may be 4 PP and 2 INTF for quad pipe case, so INTF is not

-- 
2.47.3

