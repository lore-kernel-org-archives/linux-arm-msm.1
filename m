Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8614430DEDC
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 17:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791480286; cv=none; b=qYM1MWNk0Pf2UATEmITGBRisd9qKwlp+ZgzkGdvn2SIGhjOvZYIDGrMaPuRjnTYwd/g8p+/oNE6GCtRD1Hd4tOHwq3aJIUIZts9EqxOQg0/fFObqc2g/1CXgCI1l4yeJVcwEzY84vCbb54U+iRCbE9IRI0QGoGjUxkStLPfn2PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791480286; c=relaxed/simple;
	bh=03Qsd7H9Qrl4a6noH/Ob136cyG4EmM8Jk7oPF9YK5xo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dFDfapRzBTgifLvfXmJivJfsQ95ptG/RsoHjxcX8nzalYBZq89V6Ecl6UnRX5cA6stXNZv9lgzRv8CUR18u30rD62cmww5ewXBUeWqxlrVmX/2d72hUevrTRQjnYYpFyIIuRU8ssxUKZO9tM3kNdGfQ8LKwNiJokJdEJz7NW+vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R+5y+P50; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XLB23PBQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R+5y+P50";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XLB23PBQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVD0o3145540
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 17:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iA5FleGUHg81RNseKGpcUNgOqMEwQEwXlZUQrEZSf5I=; b=R+5y+P50Q1RoswkB
	dFzT2BeLl7C6IUQ9cjnlZ443ajthYcKNo+d7EvG0bd6QpKjURV5S6NGItALi7nqg
	wxanuiHg7mT/RrGT92uYegpCMP9/GYPsNpIQNTVFO6O9cd+93bTHiy68Tm9Y2ur/
	0RYUi8CRvMqwLaQhSgXcEzDyQvM/RKm7690+GerTzsiF8NQ920iFV+EwEbzXXah2
	QPB1aOM8Wa/iS+jbql7Y/UqZKcSrfY0IDbeGDRHyaazgqTwHNPICW47WnwkOahKz
	iHDrpxiu+Uiz8sJrKVhCr27yGuxvCYsymRQYRzPFSrk2An96jKtibURIvAQQ9Te+
	WHgZMQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6baj138p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 17:24:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a7fa5e0442so6562439a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 10:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791480283; x=1792085083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iA5FleGUHg81RNseKGpcUNgOqMEwQEwXlZUQrEZSf5I=;
        b=XLB23PBQcC4IbSOu1fCjLFRZQCkHE5BLzJG4G4hUOlRoP1gy6If2ItsyFpbGy60JCY
         cL5jHzttLQoKBPZ4sNDFfzfsgr1bSdAZN0zwZ2HE4PSPTVPl05NjJ8aG424KRnZpowCu
         nTD0jaSwB3VcLlbIRAShAh7MF1lcgdc9iAJNAaxHFhbGAbsjTzI4WgRvkyBDio/gkFRm
         h9am2TWODWEoxKzp7Z0ToSRUfsTVAebOeZp8FD5yld6QXrWoHbkHgeZOn+DBZThrM84X
         rPJ8v8O6u9te7onDSTu3eEWgZg5wVcdNw4oYJOvCyLgbydl8Tlt9OXvSiyfPnY0MMESz
         qxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791480283; x=1792085083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iA5FleGUHg81RNseKGpcUNgOqMEwQEwXlZUQrEZSf5I=;
        b=OHK9lmG6Ju5DQYc7/JQZ0ndOfL/X43Yt/D+JtwPb8gezUOWpKtKoo+RTqgYPI4Oto0
         kl3Je/hBNb206wBtLjHNa0EuxRYVTcrL3ixaNd3BGQgKFAoFA4KMTiPJtONXRQ5ddMhS
         i+/vDB4HxLsYn/RhhIcifvfHNxlvCvIozQYabriocfie9guUoWU6M/A7FkTQqdObGAfZ
         9v573mrus63+fKT8I19BS/E+peC26DofkkPXiiNHdqFkoqbhB68GRgWZasIhdsn/XG65
         haSDyFMAn73b+2kRoxYXCYOSTrc3II47EpDhruSBSN+yyG+rjiOdSr8QfGenfn6wBHAg
         6FDA==
X-Gm-Message-State: AFq9FYJ0F0MGqacbCMckF3wvAUHROmIPvqBZnLMHK55FpEj/sba4cKNt
	g6NQCWRxpwNWOwsys+4Q333mwvscvs924hsUUJmEBWfpqMwXy3lTzSvxkKfBf/kXKwMIuMQClzT
	fx/q81lolIzuoLDuBoHXSKRa1bzAe0wjFbtnl8Al5PFUNDm91P1ERuN9tIdpSI4XSIU6m
X-Gm-Gg: AYBFou3Y2OrXpY8SCsfJjx3cKepzpisD21mTBUhdhJ/X1tvS/c4LBij/l3c4peG9Igy
	wSXhdYPXagCaGijprXYiIpoAE7BqjrP0nT0d5RqnFbSovBohBNouwcJIVK0MSbZjeigKmfVGr5J
	X6jBYHzDAS9rC0veULMvrYUbvMt3QHqUDu4IhWdSosnzOTW2h/5l1YkLAWc4tCw6ILckOmiBXTY
	ZAPkaCi1Xf7BsKD4EIW636Zuf3gVMwMNHyjTZJghm/uWKdEbmkP3VkUeG7CQSFmdm/LUp61pnTi
	x5K7gg6NOGSarwuyn4hLPQ8D0OL8xOvTszDwSv5Rzg7sAA7YGJPWtlYlzHPvY0sixyNaRD+DeMx
	XcTG/P+2TTWUn/jZ1zjz+zl7eGA==
X-Received: by 2002:a17:90b:1c0d:b0:3a8:5f61:1bc1 with SMTP id 98e67ed59e1d1-3a8a13d82e5mr5837966a91.52.1791480282695;
        Thu, 08 Oct 2026 10:24:42 -0700 (PDT)
X-Received: by 2002:a17:90b:1c0d:b0:3a8:5f61:1bc1 with SMTP id 98e67ed59e1d1-3a8a13d82e5mr5837939a91.52.1791480281947;
        Thu, 08 Oct 2026 10:24:41 -0700 (PDT)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3277c459sm47228a91.16.2026.10.08.10.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 10:24:41 -0700 (PDT)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 22:53:51 +0530
Subject: [PATCH v4 5/6] drm/msm/dpu: remove max_mixer_width from catalog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-lm_fixes_final-v4-5-fa986071c3c1@oss.qualcomm.com>
References: <20261008-lm_fixes_final-v4-0-fa986071c3c1@oss.qualcomm.com>
In-Reply-To: <20261008-lm_fixes_final-v4-0-fa986071c3c1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Xilin Wu <sophon@radxa.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791480250; l=21248;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=ngT4WiuobM1D/uNTLVMUv3iOzs1ZLuOaRIdNonoqASg=;
 b=aaR2+QHUOiWeyCSg1IsqbJDfJ3Q1BKmKhAhO1LeqG+JkNNG9OUAgS0rJX977ydA0x3z64pIuY
 HHlr/zRsSpuAudiAucWDgu54zdYCpNMsF1Yr+kolW/oDUKd4Vwfr/24
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA2OSBTYWx0ZWRfX6giqmXH9L69X
 DlDeLvCQZ17gSNsZLmtLJzn22/szehY2zShQNDPOdHHkkjWqG/gZwVbajyKDxRaGOwDLwLO7Qsx
 ag0K1BiFcM2qovrc4Yqcy/9LYK16bLDIDsXAY+cA3irzkBZXLIWcEU/Hl+cWKTXiKBjjS6iP0Yc
 CNzaJIJprHeKL1Vr9ZGs1+u2m7XQlrrUWSm0vEaJI0Ilxuraw/GQMEWgixv39aBx5sKhdV6Re/0
 auPIJAqk4wZ5j7NnlmOLZv9HQrjT0rwFcw0vIBSknW//vFv6OXd76FmZTtA7bpbej8qIP4UcsKx
 pf6SqlJstWjTuNl87msTRc5987o6ALk8bA15hjeu8qB9MGAHnKMjSqKwlKpvjK52lteFvDsA9ym
 kEZdSkxEUB+pDP0vcVwMOcfxLoNsIwFLVjDATfIMc6KNn6HacsPp2xeHohZfawpwUs41rdOHjFc
 iRLhPnRILfvj0JajILQ==
X-Proofpoint-GUID: KdSzHMw1dkgKgxXisXUVafo_i0QdaKIV
X-Authority-Analysis: v=2.4 cv=H/dOUOYi c=1 sm=1 tr=0 ts=6ac7d1db cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=atD4uAC2bipen3QAL2YA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: KdSzHMw1dkgKgxXisXUVafo_i0QdaKIV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA2OSBTYWx0ZWRfX1VCDWsW6neV7
 kV0YDmNaxr6UHTtvqhKkz6O0b66a1WdEWzSTPOXR3j9MRZDLMSPVU+eTLDZk15egTryiH8kr2yr
 W0kMu49RQzWj1cHbDvj1+MC/viRD4FA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080069

From: Jessica Zhang <jesszhan0024@gmail.com>

Remove the now-unused max_mixer_width field from the HW catalog. It
doesn't represent an actual hardware constraint.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
[MP: rebased on msm-next; also drop the field from the milos,
 eliza and kaanapali catalogs added since v3]
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_2_milos.h     | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h    | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h    | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h     | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h     | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h     | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h     | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h     | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h     | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h     | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h     | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h     | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h     | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h     | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h     | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h     | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h     | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h     | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h     | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h     | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h             | 2 --
 34 files changed, 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 2eef5f69832f..b7ec821c8f52 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -8,7 +8,6 @@
 #define _DPU_10_0_SM8650_H
 
 static const struct dpu_caps sm8650_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_2_milos.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_2_milos.h
index 1aa8aea4e352..760936b71c71 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_2_milos.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_2_milos.h
@@ -9,7 +9,6 @@
 #define _DPU_10_2_MILOS_H
 
 static const struct dpu_caps milos_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h
index 3889eb8a5428..c01caa1e1889 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h
@@ -9,7 +9,6 @@
 #define _DPU_12_0_SM8750_H
 
 static const struct dpu_caps sm8750_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h
index 4eb4a0e9803e..0e76320c5286 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h
@@ -7,7 +7,6 @@
 #define _DPU_12_2_GLYMUR_H
 
 static const struct dpu_caps glymur_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h
index b93d32888972..46f534ada638 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h
@@ -4,7 +4,6 @@
 #define _DPU_12_4_ELIZA_H
 
 static const struct dpu_caps eliza_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
index 85f455a9f29c..1fb53cd9ac15 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
@@ -7,7 +7,6 @@
 #define _DPU_13_0_KAANAPALI_H
 
 static const struct dpu_caps kaanapali_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
index 4ff7b397f808..c9ec48b135c1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
@@ -7,7 +7,6 @@
 #define _DPU_1_14_MSM8937_H
 
 static const struct dpu_caps msm8937_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.max_linewidth = DEFAULT_DPU_LINE_WIDTH,
 	.pixel_ram_size = 40 * 1024,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
index 1518c3d39ce8..af664c7accb5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
@@ -7,7 +7,6 @@
 #define _DPU_1_14_MSM8917_H
 
 static const struct dpu_caps msm8917_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.max_linewidth = DEFAULT_DPU_LINE_WIDTH,
 	.pixel_ram_size = 16 * 1024,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
index 859a97e8c07e..bc8a108e5674 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
@@ -7,7 +7,6 @@
 #define _DPU_1_16_MSM8953_H
 
 static const struct dpu_caps msm8953_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.max_linewidth = DEFAULT_DPU_LINE_WIDTH,
 	.pixel_ram_size = 40 * 1024,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index 67910a2f6880..e9770a3a453f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -9,7 +9,6 @@
 #define _DPU_1_7_MSM8996_H
 
 static const struct dpu_caps msm8996_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
 	.has_src_split = true,
 	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 67c1463d3bd6..6fd2f202f7b3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -8,7 +8,6 @@
 #define _DPU_3_0_MSM8998_H
 
 static const struct dpu_caps msm8998_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index 84344029819f..80de77b6cbc7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -7,7 +7,6 @@
 #define _DPU_3_2_SDM660_H
 
 static const struct dpu_caps sdm660_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index ef5777aee587..bb889d56ea25 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -7,7 +7,6 @@
 #define _DPU_3_3_SDM630_H
 
 static const struct dpu_caps sdm630_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index b608d2bb6d48..0e47fc3e9779 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -8,7 +8,6 @@
 #define _DPU_4_0_SDM845_H
 
 static const struct dpu_caps sdm845_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 9729a65d3e3a..f0a7d6174002 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -8,7 +8,6 @@
 #define _DPU_5_0_SM8150_H
 
 static const struct dpu_caps sm8150_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index fb18de029e80..2d70802c7c3c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -8,7 +8,6 @@
 #define _DPU_5_1_SC8180X_H
 
 static const struct dpu_caps sc8180x_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index 92a614686cb6..7d8a83282f80 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -8,7 +8,6 @@
 #define _DPU_5_2_SM7150_H
 
 static const struct dpu_caps sm7150_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index 87488d3ed95f..6dac4b8019b7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -7,7 +7,6 @@
 #define _DPU_5_3_SM6150_H
 
 static const struct dpu_caps sm6150_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x9,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index 64be51e30159..5280a496277a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -9,7 +9,6 @@
 #define _DPU_5_4_SM6125_H
 
 static const struct dpu_caps sm6125_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x6,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 0e311d54ef18..87c88190e6d3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -8,7 +8,6 @@
 #define _DPU_6_0_SM8250_H
 
 static const struct dpu_caps sm8250_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index d6f7ee24ca93..4109875e1cc2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -8,7 +8,6 @@
 #define _DPU_6_2_SC7180_H
 
 static const struct dpu_caps sc7180_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x9,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 20a2e9ff5cc9..7da39cb0866e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -8,7 +8,6 @@
 #define _DPU_6_3_SM6115_H
 
 static const struct dpu_caps sm6115_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index dd891703e35f..5bad15f4242b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -9,7 +9,6 @@
 #define _DPU_6_4_SM6350_H
 
 static const struct dpu_caps sm6350_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 7ae7530aa3b0..dae242521f99 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -8,7 +8,6 @@
 #define _DPU_6_5_QCM2290_H
 
 static const struct dpu_caps qcm2290_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index fc7ceac859be..8a0315028f88 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -9,7 +9,6 @@
 #define _DPU_6_9_SM6375_H
 
 static const struct dpu_caps sm6375_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index d06c14f05faf..1fd795b5dae4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -8,7 +8,6 @@
 #define _DPU_7_0_SM8350_H
 
 static const struct dpu_caps sm8350_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 99b8a890fddc..bdad3fea65e2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -8,7 +8,6 @@
 #define _DPU_7_2_SC7280_H
 
 static const struct dpu_caps sc7280_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 0ba907711d36..96f8f1763a17 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -8,7 +8,6 @@
 #define _DPU_8_0_SC8280XP_H
 
 static const struct dpu_caps sc8280xp_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 11,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 170a709f987c..f62d5bb5be48 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -8,7 +8,6 @@
 #define _DPU_8_1_SM8450_H
 
 static const struct dpu_caps sm8450_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 9cc5e22e1228..dcb27b6fe475 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -7,7 +7,6 @@
 #define _DPU_8_4_SA8775P_H
 
 static const struct dpu_caps sa8775p_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index b3d0f221807b..d37f64866d8e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -8,7 +8,6 @@
 #define _DPU_9_0_SM8550_H
 
 static const struct dpu_caps sm8550_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
index 7effe7120a56..e041cab8505c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
@@ -8,7 +8,6 @@
 #define _DPU_9_1_SAR2130P_H
 
 static const struct dpu_caps sar2130p_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 7b3febf8742d..a6eae4ebc55b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -7,7 +7,6 @@
 #define _DPU_9_2_X1E80100_H
 
 static const struct dpu_caps x1e80100_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 71e1a404e25f..ea36360c05d8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -273,7 +273,6 @@ struct dpu_rotation_cfg {
 
 /**
  * struct dpu_caps - define DPU capabilities
- * @max_mixer_width    max layer mixer line width support.
  * @max_mixer_blendstages max layer mixer blend stages or
  *                       supported z order
  * @has_src_split      source split feature status
@@ -286,7 +285,6 @@ struct dpu_rotation_cfg {
  * @max_vdeci_exp      max vertical decimation supported (max is 2^value)
  */
 struct dpu_caps {
-	u32 max_mixer_width;
 	u32 max_mixer_blendstages;
 	bool has_src_split;
 	bool has_dim_layer;

-- 
2.34.1

