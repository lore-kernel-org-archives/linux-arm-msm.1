Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234086;
	b=DvXkFmIOg+L5WMUREjnBW0gnbqnrgIVPv/CYAmWgYiNufd/YHL+Jumb0U/6Gj6MDiANJ
	 YYiB0RuQp1DwoSz86S86EaXzkEOqBpC9d/0/bX1O/rZg0MRGiF7Ya7gEvMg36Puib3/Zd
	 C+jDfDUpCqy88JfTTpWLsGXfZtRb/Fjp2HgtbwjapMKIAkxNid295TtGBtP4tlSXFpRfb
	 tImxJZzU3wCw58Ek+PHNhQf5YYX0tg0uH3aiVik7wcC0odcWtJkok7q66aOzYnr738LKS
	 PNkUIrLVH4Jp6lX4NQs2BoyK2DGP6H/esEHaSkgen8J6tb7IUg6Fhyb1Atb+xdZqBEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234086;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VPp9DF6FAAAhRErFGqfT9QbAEpklRskknKR5KtgUiPY=;
	b=yJY8X8VBuJbLpXdAAEAN8sJwBvr+3fj96YN/hHcmvZrGK8inGvu2HxEnbjP5xZwrqEsV
	 m9wdblcwLjW4BnT4G5o4zMfpLdpQy74KzYPRcFTfxxwTiZZU6cu1wd395Or2Z/PXXqVBk
	 B9tcE6LmTwtmJ/i4pj37opbLJINN/U3VHWP0j+NLDlknW/KorxTkl3Otbtt7ZWAVhR6rS
	 hlLYrpgsQF+7Ki3uQE2xU7WYPBq6BcpOouU2v5qAs2s8DuUqL0A5l0sYJt4L1ZS2L765v
	 QGynAi5xmVvoPYUBdj3P/ZFVJVZQQp+b4SbcC3Nv3LcKjM6hoILszK9edmXXSLzGiQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JLs1JHGD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jYsxN3Ls;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26683606D826
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 14:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26683606D826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JLs1JHGD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jYsxN3Ls
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFE5r4025863
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 14:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VPp9DF6FAAA
	hRErFGqfT9QbAEpklRskknKR5KtgUiPY=; b=JLs1JHGDQ9pTOQGrvmwhOYZlsHp
	kZLPMCv818YuahofRNsqGr/PjsDavbzNDsrtQySSvtzCMo2XwBwwy0ZCj7KPnAka
	XWqE89GBPD7QT3GFHc3Hy17bV8j2RsJTJFC4+GRjx4JNt2HpUEjUpG9CuN1OKZ3a
	pknvJ21f7stEN/gfHshN1dpKo+cy6hUiM+z+fq3QYM4Vc0Ex3+wks7zWS/zTj90D
	KmJw29HKktrTfGcfcyelVWlIn9JkkIR6i9MgixskBkawx0bypChGCHLNAe/2axpR
	XPBiiKL/qDJpfFT19CuLFJz/tRm4s2sv0TFt0JsREswyhKLu0eg0MauQVQw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua589aw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 14:21:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so700044a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 06:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794234085; x=1794838885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VPp9DF6FAAAhRErFGqfT9QbAEpklRskknKR5KtgUiPY=;
        b=jYsxN3LsA3XgBYYjml5ElmF606F9QMbtwI2pRGcgDyXw1zUpUVARezXhYxZ99/JOkY
         +5nBXYEL/2h1NvvBaasHFzyAKF1XOWqbj5gTop5xkfhUcEA8NEQgiBkedkPzifXvrLTX
         71YE6b2ZqbUv0RUfmXTxkY0kBDniRoJCMR9s0trL3wrrHO3T+rDprL2LseUAmQhkyUW2
         EuRAi09lhxjgywOTxNd5HDBmYPo1bHem+b+CVhAb5lKBtoXK+g5cGNtl3s3putzhCrwT
         zi0XV8x5cLuNM6BpIrsMb3/sBtdKDaWsTjUjFBOOcXKCezsdI3dal6IRNxq7fQWT1tzO
         jymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234085; x=1794838885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VPp9DF6FAAAhRErFGqfT9QbAEpklRskknKR5KtgUiPY=;
        b=vWqkAIPcYzf0Q5SzHr/NIgqGVRRZfi143BDz7gBOHepBY2AKIlqeKudIktc0RYgvB4
         0BYA+U5J5+cwtaHJHXDQW7Kk7lufVSy/Rp3zLGPJVWgwNqFL1OZ+ro/GrDc7qvOP/eGy
         YnvcedB91bngxLPMvwLnAIxcmR8d1bjEapDgw3kDscC/MVOUkveQbXB88tu14UuhP8II
         CbWxwHQXwtyM8BpjJZh8mY5x4h7MW9pXyL/H0Cyn4SwrBMweB06xwWC4l4QDYqF+WN7t
         KE2dYfQh8GNCiTRA2DNKuYdaB6iG1KKny9b+9GNBCvkwc8/JZu0QO7KUS6Jifk/wxmEb
         pUpg==
X-Gm-Message-State: APuU4Z9fm7d8XoDAex5M57C6ZpWx4Op0YXvd+ZfCpVBIxZGeuM/Co4Cn
	NJ6sYqRo1Fv9uilYN98QwEsdPh388w1zRYwf/GReo4Tela7ebxaFxTUXr5PjOomNleMKNIB0WCq
	aNBy5cerRUueXV/N4sqF//099EFrkdFY0wqapJQj1L98kfYcMcr6EpS6A2ek7ud5dRcj4
X-Gm-Gg: AYBFou19hKE/DzDx9VcmdQeSlZK8dHaIqRPAL4pvn0cfxycXoGp8HwqmR5xCvSV0a2A
	tFYcgBDvhN01J4v9cSmgX6oG3jlMnKQKAyBItxN5c+uyDax59jobS/3QxMKE5RQ7fmQwIBZu/Cc
	ZHAghMnzdsTmTC2iqs5NqJhVm51XASkQEznyIwDnCuK72AhPEyPuoJabxwyk+M5mKzwbTw19yn5
	4Wod+XIltTV8aDNwjZJfZ+qGVh1GRP/hx4BCj4J2IGgTetHzjm5pyzwOUBQZLa4G2sAGaz516wH
	Iro0KpBMzlkb4K5BrNx3uVll3B5Kj+W1WHf4Sf9XbuZb25eh6jIaFyUQ8bZiceDQGXTGG1ZcahO
	OtHnllNLCH4rgucuzLZc/qVLIp6gNhIhAhF9DIJqwvKRF1UvKtXdp+BwI0YysVLa/5/I87f1pZO
	h4xaOIXaYiidlk+3iJPNk57NWx0OoYHcEcQtxnObY7He5GLIwRq0FUh8ePXtZgDA==
X-Received: by 2002:a17:90b:35c2:b0:3b0:a757:e372 with SMTP id 98e67ed59e1d1-3b12d45fa90mr3663800a91.47.1794234084833;
        Mon, 09 Nov 2026 06:21:24 -0800 (PST)
X-Received: by 2002:a17:90b:35c2:b0:3b0:a757:e372 with SMTP id 98e67ed59e1d1-3b12d45fa90mr3663768a91.47.1794234084271;
        Mon, 09 Nov 2026 06:21:24 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105864375sm11494129a91.4.2026.11.09.06.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:21:23 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 04/15] drm/msm/a8xx: Export slice helper
Date: Mon,  9 Nov 2026 06:19:50 -0800
Message-ID: <20261109142111.256630-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109142111.256630-1-robin.clark@oss.qualcomm.com>
References: <20261109142111.256630-1-robin.clark@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX6a1xgZu1/NPy
 dPJx5fB6c+wLgyKa2+Lns6sZKtU0gOdwbbWaj2WnAAkcccSF9q4G9gW7/cP/MX6HwD/Y2WFVfjh
 dONknyj/PAF3fgZYi6Q3/bAzH4IIIqKHqkyuRFQS++YPTCs9yK8v9tXCrJKIR8Q87a+O4dLRbd2
 +q9hMRtLXjslMFRkvi9KPrX3pXwF2QnOaAxgW7t6AP4yuo6TfvCmiOAiER/Q3z4ATjRm2G27Nem
 DoxvpSr4hKygUwLkglPRSYdn30TfxCxAnXUaj8dxCT1qswzGAQ8r3iGgOMHSxwBOYQriiFaDtLl
 aFZjXWg9rMIv4Hh90I8WjsSRWSJWj2IzcLMgwRQTX4cnPb6izK2KUcnlT2nMFF7dGNiQDEevduL
 6y20jQU+lz3FA9epyKRvh9G794Qno7gVKcQ4TE3SYRfO+DCRkMOuC2WYeyH2w8YZtUm/vSQG5Ix
 OO7GuQgyowbrqGUKRgA==
X-Proofpoint-ORIG-GUID: XcwB8I5Vvaa1Q084pExZvpCN33JfD177
X-Proofpoint-GUID: XcwB8I5Vvaa1Q084pExZvpCN33JfD177
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfXz1sI98FdWQkS
 pHhKLKykAXWJgzAn5oF7a8NQEdnkqIhwd+iJ7/ZmcYcmvJX69kii/TsfspjSrGX//m725GStBdP
 nyae2xvTdBnIHxBVTjtRojIlvlfhOEk=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af1d6e5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=eauOX4bcPKZCCnkqRxoA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090057

Something we'll need from the gpu snapshot code.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 1 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index e6ec85b20fb7..4a3898e58aee 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -357,6 +357,7 @@ u64 a8xx_gmu_get_timestamp(struct msm_gpu *gpu);
 u64 a8xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate);
 int a8xx_gpu_feature_probe(struct msm_gpu *gpu);
 void a8xx_gpu_get_slice_info(struct msm_gpu *gpu);
+u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu);
 int a8xx_hw_init(struct msm_gpu *gpu);
 irqreturn_t a8xx_irq(struct msm_gpu *gpu);
 void a8xx_llc_activate(struct a6xx_gpu *a6xx_gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index be81f141300f..a29f8149493c 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -130,7 +130,7 @@ void a8xx_gpu_get_slice_info(struct msm_gpu *gpu)
 	}
 }
 
-static u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu)
+u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu)
 {
 	return ffs(a6xx_gpu->slice_mask) - 1;
 }
-- 
2.56.0

