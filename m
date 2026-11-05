Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911227;
	b=YMrEYBryOZuY9xdI2Sk0Vk2/YQpzQxrw9/e8NAISsM7p142iKpObTBiTwOgEvxPSqND+
	 NPexY7LfIDXVtJDzRSmsSAyJEqlYQOjzjKmpMNtQ0JTf0tWvSuXwBywpFTVEFpMlFSari
	 9lVDRiGZUssee9FM747fYiDF3EOyqknje0g7QqiMuAM0252GwdphhR9Rj5AGyT/5dMelw
	 P0nRD1i8T1+XqDXgLab1vDXrQhd6THPOeK71HxSiszRpRqwiiVN9sRpAKKzrAgI4Px6Tj
	 Ey3dSFUae/MUjZVs8AhI8t2H4shsfCICTjGbkjEtNEZwTQQ71mmB9OL0aA9nFGDFq0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911227;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SInwIZPjnz2EQrGq1a3K4NBPEM71JGzMblrmJNAiG0w=;
	b=d4qRrvUOjUBP5d2rdsLbTFBA3R/PMGVGoDKIaTOmKS8Cbj+JsYjEts6MM4/xYwcSMb6r
	 5WzDUQtENYRvVdJOFbnNfdyCayL0+pRxtLHO5FF8eYW9HY9+DgszRUDwgdH+n2akXMpQo
	 z5UzAgkuAouoKESzYwniQZas/xUBsQz4qXoBjXYi1hxZkHLe3J1fak90MLbGPt+3v9irY
	 8HljzwxDuMzVNIUdiQS8IFp6nzNFfKDGlnD5lqe7L5DLJCNOULMJU+Rkf5ZjkrW0wTMQm
	 +nEGnJi9t0dROspGI7/XO9aBXZ9Ma6MtrdLCgAznveFqoUoe125EaEE10Vpm1SaVLGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZjKrIxMh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gg1PcH7a;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A119606D823
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 20:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A119606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZjKrIxMh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gg1PcH7a
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5JLjVe2293969
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 20:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SInwIZPjnz2
	EQrGq1a3K4NBPEM71JGzMblrmJNAiG0w=; b=ZjKrIxMh8NmIgAVRrdPwBfpV7+T
	cljSi4TeukyrqlLkcN6TZM9fFizYIbBPvIiuezs9jIUNnsUksA3g4N9SD0KlGhAa
	xifIUscSFakMjlEPkFRBN9v+7x5FzQZ5lQaJkDxRQhgjNL8/BTsNmdsMXL2mPSgY
	ChWaJLSSNoErO+GuAuGjWsTP9MWYi2Ax+1iFgQpAAb7RRCWU1ZjJA1k547irPsPI
	Uk3wMcGlsHOJ7GDUUDsdT6qj51UKY6+/Wp/HoZSs+R4W4wn2zAu8ebMZ+rXM/RQK
	YRC7g0ShvdbHCkvkfp1ytmgr6NylrgQeKmZf6Z+VtTttOCvfTydpVd3CHdQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hryw18atg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 20:40:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad53f538d2so1945174a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 12:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793911224; x=1794516024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SInwIZPjnz2EQrGq1a3K4NBPEM71JGzMblrmJNAiG0w=;
        b=Gg1PcH7aGxQBLHE5rDCihsyzpN8krkexi6MzkvrDuMf2R9hT9SHhHZh98Iu5W1Aahw
         thyHAOty4cViUcd0IBl621BRGVa0d7BNLbzA82fhzzmxQPIjN3ssXct3HIIDcCyxCOpC
         O1gIXBF+WP+wc5WS5YovdtyEyAMC4a5XKgBa2fia2Vh4WzgUAkkZxeqiD6FVbpVkyyT9
         WL/Yn2syuhWBhLR236gZqzospsnwNWrMSoZeDO13rnvlQKEskQlGwdz1pJG9pzIFUi3R
         HAVecSKpOgQbhomTfk+FxDbIS1v9iHe7KjLD8rPPLkTnvymclDawHWSfmhJj9CcyY7tB
         GbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911224; x=1794516024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SInwIZPjnz2EQrGq1a3K4NBPEM71JGzMblrmJNAiG0w=;
        b=sY+a74bAkGkMSQ72VyVg6adWXdH1dwOGsfOvy8VroLMjF0oC6JfVBU4ZU6axEt9j86
         Kimoy2r2yg69wC+ynnpgdlRHD7wDsyucFvNsBSf/joh6dYrJMCmq4ikQMxisjSTuEXIO
         eV3O5/AISYgEorC9EALKb9iKo6+KFO4vybZGKToZr0ymnWHNM36XRpJAX6W0zsWme/IN
         E97QF6baPk3+JJR4yVdc8z1KK1t9REAf3W48w/Z0u4s4WgS0Gu5LEolRJ9ZnoFJsCpMv
         emAO4aYj4cJtmQQPDobmmAK/GwtkD//vCx6EedyYznFkzC5rpWtMABQvvzbN7wbm+1YS
         2QGg==
X-Gm-Message-State: APuU4Z/hiqLfHxGdiew9fhKddMHxkrddCBAvx8OloPYiNcvFN1oUvSGS
	vVrKWdXjoj1KVAqlg1IdICFbLg4VSDSoxBE8yIW9kZq4W9UsHuoq3tsTC1JEiL9p1ZeGNsFpojg
	QVrB3D1jyrTSSV/wh1/x/liDvvRB/r+P2/3Bl7e1ibZKjZhQNDqtpQeDW//O6dHA0AsXh
X-Gm-Gg: AYBFou2zSXGoSLHNHFWUkOmCPKSd51SAj7BpJ7aZBiXdY+rvdBA8+WIU7UQRduZA5cT
	hwzj21PE93mhjMKbfuLoJwp2clbQGyG3YC2O5IUnRXDjTPIlsiRrZc+ryeUroT18kPvqk8CyVDG
	dkdLYoCC0VR3IfN6WyG9lekBdSc50omk+/FzXHWCpqRgK3vuuF/QMPGELW10MfAGypt/4lNcBKS
	87HannBm7bk/QFv6fIzWlP77w5FBQ4OE56IQG30SxgA4AwGBM8t1k1aaLbiElDIUt88Drf78fXn
	kPBlsg4YUC+YNNw1XHAlXam0EdhToUPKvKaaMiXtIFJapAtpvEhk1knJYvVnTKh0BJn6zR9OnCO
	ijFVYquuYCWexH2ZVAUbe5M4O09x5melE44+60x/f9sY6DNqkXyXbn0JNcJbocJjPfp8Tf3dByb
	INKz15625Ysr6AsRMufcEgHBwpKi8mG0801ET5q9B0Ms3iSBc9VegGJ7hbmXMO
X-Received: by 2002:a17:90b:4cd0:b0:3ac:b2e6:3181 with SMTP id 98e67ed59e1d1-3b0db6cd200mr176244a91.37.1793911224056;
        Thu, 05 Nov 2026 12:40:24 -0800 (PST)
X-Received: by 2002:a17:90b:4cd0:b0:3ac:b2e6:3181 with SMTP id 98e67ed59e1d1-3b0db6cd200mr176224a91.37.1793911223576;
        Thu, 05 Nov 2026 12:40:23 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c8ff96sm598625a91.13.2026.11.05.12.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:40:22 -0800 (PST)
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
Subject: [PATCH v6 02/15] drm/msm/a8xx: Export aperture helpers
Date: Thu,  5 Nov 2026 12:29:28 -0800
Message-ID: <20261105203057.66520-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
References: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: HmzBz_KI__oQ9YRpa3j0l0ck4LhpVdCB
X-Proofpoint-GUID: HmzBz_KI__oQ9YRpa3j0l0ck4LhpVdCB
X-Authority-Analysis: v=2.4 cv=RdYFmFtv c=1 sm=1 tr=0 ts=6aece9b9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=58qa3DtRz-ucCGMA3goA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX82Koi8nGj28K
 zikDREx11xjQ0ZZgRnjaO4KtClmpeGsZk24Uwiieh64rYgPUKE0SAKhLH7QTSa3WfZp8kbtSEUt
 JsQs0mvmyq5v//oIjDxyT0fxCM0/B7V87x6KcAN9dP45dyocKX11ikpv3tB5nXja4IF7qCH+lRF
 YCsvd8xtA1iaKmSTndwJRB2myfjHVgWVMPD1F4CjAelHnuP9OFZYSV1u1r5hSnl49yd1r1rOMHI
 8Ed3SykepzhUMAA1sYNKsC4KqmYUp9PUrAhhBmNupotYBRG2KgbL9jBY/5eB/Vcv9KqSg7Cs7+m
 z1bGDDm+a96rDyKjznHik3kUd0waMPlHEYg17ndxncSGdssxO2zCrr8WvAg/65rFVnIZ3+6kP5k
 p7x4XUmEz/yIZRj1Z+kzH4uL6Qd2hBWIT8+KfBP6YDnJyOWRxGaJKc8uj7uF4Dl3C5S0nkm/4iT
 siBA2SuMYOmLD95UvYQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfXyJ4ZjusZIfGd
 Z4z6XzwMVCxOQEA3DAJKvnG7sfhicjMtCe/0qs16ZFW5cUg0UGNOcEtLz6F8ZzcVlbYOiCGt8WM
 zoE3IfklWikcZtLWJrUUNxeKqFSLZN4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050082

We'll need these from gen8 gpu state snapshot code as well.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 3 +++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index ab4cb43e4a54..c58a2665e9ab 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -346,6 +346,9 @@ void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 void a6xx_flush_yield(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 int a6xx_zap_shader_init(struct msm_gpu *gpu);
 
+void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags);
+void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags);
+void a8xx_aperture_clear(struct msm_gpu *gpu);
 void a8xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off);
 int a8xx_fault_handler(void *arg, unsigned long iova, int flags, void *data);
 void a8xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 25ee3ac16ed6..82cddaa7278f 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -32,7 +32,7 @@ static void a8xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe,
 	a6xx_gpu->cached_aperture = val;
 }
 
-static void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)
+void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
@@ -42,7 +42,7 @@ static void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, un
 	a8xx_aperture_slice_set(gpu, pipe, 0);
 }
 
-static void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags)
+void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
@@ -50,7 +50,7 @@ static void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags)
 	spin_unlock_irqrestore(&a6xx_gpu->aperture_lock, flags);
 }
 
-static void a8xx_aperture_clear(struct msm_gpu *gpu)
+void a8xx_aperture_clear(struct msm_gpu *gpu)
 {
 	unsigned long flags;
 
-- 
2.56.0

