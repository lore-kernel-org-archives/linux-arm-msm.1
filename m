Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305075;
	b=e+ASOUQKJTkKbblFYznlVHSCIhoqm7aaGOANSuPfl4UPeacrXaiqCFSGx/fsXQlhj7yW
	 E9i5ijyFkh2nmbcc/4avoghv20IfZ6X1l35Aqkj7JFHui5OVR6nUKqAZ9UlNmqXIGpWES
	 r2TbtMBg7FlPSWwSLp3Abqr0zzrFxLsAa8cVyiS9B21kNsAoPnJE+FSYbxxxI9Ddwg0Qj
	 zwxUlyL0IdnNTT2KVRmIm+qzRWvbY8wwj4RxJbrPeBOZ694GUB0G+2oR7VLVqk5JBMbiq
	 MbKKwWYUXiRqLnDhfZOsmNh+4Gc128lVCfAyG3dxWzphSOVZBRAaSOSqa7NNWYgXh4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305075;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4iyKi3o3dnwWyP2nsGvDx0M5Mc69Qkq1oajv+rbaqtQ=;
	b=iQuw9d2w+PPqXVfsmdkOmYk2OlygbDOhtwxZBt3WJJX+6mVpe7dWT7V8NXyH77s804g7
	 SK/Wl6XQB7LP+R9GIq0FT5Q9pCrN0FGVqpbf26Ii1LAQdJiLuCBf++g54/rx4QmcWA/Yw
	 Je1pOOGhqNyK/zcVKo6PZAEyEGwzpfUUrakmsbZw14KU0ULrSW5OKMAMwngIdr3ileyOa
	 9VUDFJ4er504AK7Vjim9x7+FGkshFY5asZjsisiJj4fhrBrkaULu5VeaSZMvMCqfQTuQJ
	 X6cjw26/lt8gi0X6QJ898+QijZQgIrdhS/2OCD0tr0pG7t5zT8vQQwbGqX1ZuG2BBnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G8iivUkC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LeFH6+oK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE4360A2604
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:17:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EE4360A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G8iivUkC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LeFH6+oK
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJjYvp2138527
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:17:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4iyKi3o3dnw
	WyP2nsGvDx0M5Mc69Qkq1oajv+rbaqtQ=; b=G8iivUkCx6xckf4Xyk60u1iWitL
	ekjcCtUppagzPwHjVNmGFOB0uIrPGNy0yp4Yho3qhfmtKULr/DS2eE91q7dHR3EY
	554Sx3lQCS8CmjIm7BNEhtiBtnwh/DouP0u8trhbIfHB2qpp2pjPnu8vMTt8GuyN
	DiVGJmBK7PcmRMbGaVPc0BIwyH9euYLpNEySmGZn0hss2UJX4qnmbJXYlDQEgsD7
	oG7tZ4z6dGbfLTJwxY4rB6mu9PP23Khdgc0fVqNdvwAWKrdu1YluxhcPfPl+u8FK
	4ziTvtR8zbUNkhXiVU1JvHAhpey9Qzm+za4wsMak32npKcSUYAyeAmyCOTw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm4a22kwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:17:53 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a08e315b5cso1197229b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793305073; x=1793909873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4iyKi3o3dnwWyP2nsGvDx0M5Mc69Qkq1oajv+rbaqtQ=;
        b=LeFH6+oKmAi8qzq4I+zgo0Zbf0F1WSxv57VNl7NnJzxenB29k7MVyV5e41OgNbzSJG
         bN84z+k3f6vz/O1FHTGNK1uJCBAMX1FhgvSJTWUSosuPo5/7JELPwtUVVpR/hygvrg4p
         fgx8W3lwxIWHJNLglqr4/LAvNzm7tTM7sCR2IStSSdBNwiDTb6R/hoY2B5RpAtsEFii6
         ZN6CDn78dUzHF6yWCHAlVcT6sgaLZ1lS75d9i2/A6ZmbZDMncyGJNriAOURtV7GjdTDW
         yZ0zU4+MXg0KRC4syosQkG7n+AyVrLc3QNh99yaGbeVbJjvQslqeznAL8uvNOtfZHA55
         uWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793305073; x=1793909873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4iyKi3o3dnwWyP2nsGvDx0M5Mc69Qkq1oajv+rbaqtQ=;
        b=jrwc/GJpvBixCaH1u/s3wcy+ja4/pDbRBJlfMWwa/NtstNd5E08aQnpLgUMXGUa3mB
         5lCCFiuIHflshzzx0pHostoTUYVVIwGNrUBkKzeJ4A8xeM3MrQnw2G542SNJNSSy+2TS
         sByMhCWI9RJOJw+q01ycScvQ0AlP92n9MX3eP5qIm5J96fhhPmIwXAAaXp4ACml8C11T
         xqfiqwRLJJwUDbQBufSpFuheQ8nJNHiAmKxrim9bEy2FErozgs0R3Qqae0KU5my/TyAl
         O2zYk5pHEx+g1uRdWoxfJpohBBz3JPxfIEsUFxnxeyuq+zVeRBbav2XIl6NnhmPDqoaQ
         +NBQ==
X-Gm-Message-State: AFq9FYIDmfP96axSZsgUtc59u60tO7jc5Ru9XiwdB0dls2r/uvAkCWqQ
	wrOdCScgj+Bb/f3gVKdsiciVqiHZLg1XORsAxINxlKeTwf9F9tejNWWZzuSp2gvq7keCu89TZMj
	gOOnv4ymDFZvs+QizGw3FqBhvIQ8YPvYjv/Vc2sob71rglTIDYIOJB8e/d5Gf7eNxTVec
X-Gm-Gg: AYBFou0QS8YwBB0hay8pKK9eqbPZnonfNuY768vBBcGP21HVKO5EVfiZQ3oxcohLqGm
	9sS4O5oYsLb6mOOdIb/xm6itBEzs5Ju7LDS1HTHU2VgmrKLaGvpf1lO5wpkPvZF/ODpfsrdcoOI
	xrphxYE9Ej3LqWNaJJCAzeu9xWcWPuWjsESp9f38gSr/5PeWNwthsVhjjC+eJU60VCZSrrw0jnd
	tMb3XE5fn9+B7autSgAvQW3tA/rZ0EhdVVENkGi/FQyUYszJbdrDJ3wS9JmMdPJ7r2gm5FUDJXf
	Yi2Nuk33/mbvSCh0uzjCqDX8z9Kwc/C48Ugt7zOT6PL40yrpmVRBDL54YU2a8AM1X3eJudKjHYG
	T+nWrIHjg+3PmRid4jnYYtcUF+UIPQnJfJENPAoGO+3vLq+CxKWda1bbtxyMKXWvt35NFmuUfRJ
	muRN4ZQC+EGvYHJGeSpHBa0A==
X-Received: by 2002:a05:6a00:988:b0:882:bba:8791 with SMTP id d2e1a72fcca58-8a9bf71bbd3mr188257b3a.34.1793305072751;
        Thu, 29 Oct 2026 13:17:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:988:b0:882:bba:8791 with SMTP id d2e1a72fcca58-8a9bf71bbd3mr188235b3a.34.1793305072335;
        Thu, 29 Oct 2026 13:17:52 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a989cd5250sm257570b3a.49.2026.10.29.13.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:17:51 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 03/16] drm/msm/a8xx: Add a8xx_aperture_acquire_raw()
Date: Thu, 29 Oct 2026 13:16:13 -0700
Message-ID: <20261029201730.151754-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
References: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX+KogCFka5IMN
 GbIGe2Ve7h14xz0mZsIYF0dUCCR50RSm4hcbBIfFmVVsZ5tAChd+cJ5xVUzlkjeE/1payuLYUxl
 cuHlyp6+tdieNjlCyxpBwISQo/4msUpO/3Gs/f57cBWlBGqwxyH8GGXrWKadPljS4XuQEvsARlb
 JtxaPbwJArIjUJ+Vu9j8WcFaVEwQJ7BDPvDAVY4CEtIb3eBCpUhkVaBZGHOCULIYoA3p1+Bihpt
 REBf6PrPmqSBuHuj+IRtkkTPsNJRNs1qMWo2KIgDw86W6jixVlNzWWf+5wr0a7GyEExWUxHQY4v
 IhrCHEFmGEV2jCamgyUjUNFFdQnSFh1iCtKmcqtqSp2iDvfVF+HnnQo/xwh/KpxswqZwC56qxq+
 zvS9cNKTHKq8OVr5VY7v6c1XlrB/5M5Bd1KVVhSn6tWPLaqkXryCuUWhoDTAreFViQhL30KGcS9
 pmbyXAHJtdNOoOz2H7g==
X-Authority-Analysis: v=2.4 cv=E8tYNqdl c=1 sm=1 tr=0 ts=6ae3a9f1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=qGl0e74_xy6xiHm5yPkA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfXzp/Hyp52U/zw
 U9QL2EOsbvSQaV8WelK8Ow7/vzh6AGTbm0YoO/YuPg6q6xYDClKgjcqYVcbClMV7T7g0DBTYuR9
 jfflkjckLWCS/dWERBb6kay3rHAOBuI=
X-Proofpoint-ORIG-GUID: z8NBtL0bfEgAkcR5gf-jEvuP8-wxxeZw
X-Proofpoint-GUID: z8NBtL0bfEgAkcR5gf-jEvuP8-wxxeZw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290079

The snapshot code will need more control, setting additional bitfields.
Rather than add a list of additional args, add a helper to acquire the
aperture which directly takes a reg value.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 21 +++++++++++++--------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index fb000b79fe2f..2a2ddba6761f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -348,6 +348,7 @@ void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 void a6xx_flush_yield(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 int a6xx_zap_shader_init(struct msm_gpu *gpu);
 
+void a8xx_aperture_acquire_raw(struct msm_gpu *gpu, u32 val, unsigned long *flags);
 void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags);
 void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags);
 void a8xx_aperture_clear(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index a14379e26fbe..a0983e2ee641 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -16,13 +16,10 @@
 
 #define GPU_PAS_ID 13
 
-static void a8xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe, u32 slice)
+static void a8xx_aperture_slice_set(struct msm_gpu *gpu, u32 val)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
-	u32 val;
-
-	val = A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe) | A8XX_CP_APERTURE_CNTL_HOST_SLICEID(slice);
 
 	if (a6xx_gpu->cached_aperture == val)
 		return;
@@ -32,14 +29,20 @@ static void a8xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe,
 	a6xx_gpu->cached_aperture = val;
 }
 
-void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)
+void a8xx_aperture_acquire_raw(struct msm_gpu *gpu, u32 val, unsigned long *flags)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 
 	spin_lock_irqsave(&a6xx_gpu->aperture_lock, *flags);
 
-	a8xx_aperture_slice_set(gpu, pipe, 0);
+	a8xx_aperture_slice_set(gpu, val);
+
+}
+
+void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)
+{
+	a8xx_aperture_acquire_raw(gpu, A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe), flags);
 }
 
 void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags)
@@ -74,8 +77,10 @@ static u32 a8xx_read_pipe_slice(struct msm_gpu *gpu, enum adreno_pipe pipe, u32
 	unsigned long flags;
 	u32 val;
 
-	spin_lock_irqsave(&a6xx_gpu->aperture_lock, flags);
-	a8xx_aperture_slice_set(gpu, pipe, slice);
+	a8xx_aperture_acquire_raw(gpu,
+		A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe) |
+		A8XX_CP_APERTURE_CNTL_HOST_SLICEID(slice),
+		&flags);
 	val = gpu_read(gpu, offset);
 	spin_unlock_irqrestore(&a6xx_gpu->aperture_lock, flags);
 
-- 
2.56.0

