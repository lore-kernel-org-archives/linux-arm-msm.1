Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792615963;
	b=U7cI10Zrr1g/U7AWQdFqHnRHP2iPuXtg58WcrZuPI+jBu16EOVgJIlSfEBDXQgh55FaI
	 3Fb4jqMLrod7oYNpFdSTnd2K2rDUbYHkIQhMeJkmKwL7Jo3Q3N711FijuCikqlOlTQr6w
	 eFYfn9IBA+7j396BJFc+c3Lq0O6bu6UmkWov3Clb6js2xtNg1cF1Gqz8v+QxOSFXWvsCb
	 EpySae7NPik9JIg6qZ4MTyLZKve5Aia3DszNH6R0JAFrLsb+xR+5Tj5Mug1GdNrIP7yXl
	 NrBfSGo9iolXCBvWmB7Av3XJbGCvNMXqW1z/IfY0VO1bYU8Z+7u1Tbx2FstNbGLwZ7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615963;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4iyKi3o3dnwWyP2nsGvDx0M5Mc69Qkq1oajv+rbaqtQ=;
	b=E6wMVSWh9AOn/Sd87qDQgS6xYByJGAzpn7VmAMQK1Qi5B/3/3r77zcfJBpf4G5zc+AHp
	 Vghv6E4bm5icGsAz5BPTBTfjDfsTLRNwC+0hs1Bg1Yn3482k6uDQUn6puBDfooZ6ZGUQK
	 HQUYkor671rFLY80eCXkFQWnMXDSUHLCqa5I87imPw9ZrP87+1g2ht8l4OQsnLt7HXWAg
	 qXdOURYjHxRGL2/8oF+NL5sQwcx8W8Z68J40SOTY+ceRWxESVk+GEwkmaZTJIMltm6g5v
	 L2xTwsFy7UTKjDizOoKo/rpiusAhy6J1KtpvNFcW/q3GCtJNXQDzdjleEZGLJ246oUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ly0FNyEx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dgHe3jj9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED97606A31D
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:52:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ED97606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ly0FNyEx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dgHe3jj9
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LKe6cZ1669622
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:52:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4iyKi3o3dnw
	WyP2nsGvDx0M5Mc69Qkq1oajv+rbaqtQ=; b=ly0FNyExJuhZdTIu082wFsqv+n+
	WqfHM31IhO5V97IzDMFzKjGtNnV3vrRKAVnx1n7inyfSynwK7uNqrSNdo/TpFzha
	A+3jB0IEFtID5ISzIwB7G0LGoiUMTByyJ0Y9nZUm/T+KpP0ijh2L0yVBgTIOCzS/
	jJHB1XhwMgHP9uXuVaSXBrPJstNOL+MtCVDW4ar2+nV+x6In+5iFwskdKT+Y15Q0
	9tqy1BaseywKJbUZDuqRbhKdBasC/OZ52OMCpShWSLXq1XEei0GN+xVirjqAl4QK
	tNabLC9Sbg0peBuC49BygLf8rmQ9sT0SJ/j3XWKj8sV1hMCFkDpCmrIbNNg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf2cq0jb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:52:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad91787a1aso631372a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792615961; x=1793220761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4iyKi3o3dnwWyP2nsGvDx0M5Mc69Qkq1oajv+rbaqtQ=;
        b=dgHe3jj99DSsi4+5Cu30mS9b0jLm/qTXuCrCSgFex2g2M/KM2Pre+UdcrVV+ll0sEz
         CppxS8oX5kVOc7RMxdiMfNUviBV3AJLpb5XHAWh+RzyziK1Iclgh4G+OtPTS/NSu0bvv
         PNvK6gPktC2sLkRYJgJtd2WXisbTx48oWQqFL/JR3JyTry8KBsujSWwia9RbOYH/egMv
         0p/GSjY7Nnsz6YNLe9f5lRpcNIPc7b1v5RHUTOPxaf/YDL6WOoH/FMdnTC5oafbAO8R+
         DjXKhjWzAb6gAU9ctBkzZCPPGYkKkAp57HfTbxPmpKoxYaLfi6VND3tQVAPXyMfVP2ls
         5HHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792615961; x=1793220761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4iyKi3o3dnwWyP2nsGvDx0M5Mc69Qkq1oajv+rbaqtQ=;
        b=Ad+BT93jzeHXB/8rfrm8Jl1yXlkIVEBglm3fIm5UbtP/UDcYn/1c57ug+2UfyxZUdl
         cCEdHCbcuDA3ZtC6U2reSiytrzDF2rhr9OLcpXXnKU66/1Ck0jg4IGmPLYEZEaKTJHVl
         ZsFly8Ab87POvtHYZ9thdLjBoOA2R6zDvrwpu+pobstCNbjsYPT84DPJUqzaHiP2QZD6
         532f9XKNyUzfXx4O7qw1MsjxHyJBBsCkJeO6ffHbux/bfD2aDcf85CbIV9/YuFP+U0nA
         AVBxOaLl+b1w8EBzc71nRLNUX0kmKVUM2DoGxfwbNfqClNcG0nQBjEVQTnlDvi30gLRp
         QtCQ==
X-Gm-Message-State: AFq9FYLaj7ssK3M6Nhnt0PlywGJ63vupgM3Yj8YxurOEfP10b1MG1Zs9
	vJgwYgVn4eb51sbP+7pdqw+UaW8lU6lDbCa7c+UKU0SLmuXosVBa/Wxbozy9gd1CJVGIXRdZd0P
	dHl9aYlrAltQRf5kGRrgg50tEwfeRLxusU1aOuf6y0aObAWxU6wwlCoqzYVGbfIeghVQK
X-Gm-Gg: AYBFou0KT1DE2t3qmpEJ1R4f28trfqU2CIwd8MzUuhrj9OaLpwuTDNMukfx+O7BTG2z
	g6mUDTPn7bkQI1iI6eGg7IGbx9RGGGGBnNwCufZeO3dTaWHFT5LtRCvKrrA8VWVPK078X9MZ42c
	UXhyYIpqIUkvCWqbLae/0pRzGhYyu30eZewXKGnf14elrGvKyDZmDd1gVb8V2+OoacHTOqZRPJ7
	vZY3On9Sm2nr9E0NG5QpR85WgOqenEfwxdt4sjjNLG3CRK7AlJPCmzvk5/fFzf4hG8JC9uuTIXN
	2AIdMdEw2TWXmyyleLgNR32+uTkFbHLwGNlGniOc5ypNe0skMH/29SE7y12wjr0xaIgluWvAyRJ
	FXq/OvLKeXREj99OaVEWk3yXpXTr6Byg2n6LH+c+45749fkmaNg==
X-Received: by 2002:a17:90b:4ecd:b0:3ab:188b:c5bc with SMTP id 98e67ed59e1d1-3ad86cd5f8bmr2490087a91.14.1792615960838;
        Wed, 21 Oct 2026 13:52:40 -0700 (PDT)
X-Received: by 2002:a17:90b:4ecd:b0:3ab:188b:c5bc with SMTP id 98e67ed59e1d1-3ad86cd5f8bmr2490063a91.14.1792615960340;
        Wed, 21 Oct 2026 13:52:40 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4896c71sm1025666a91.6.2026.10.21.13.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 13:52:39 -0700 (PDT)
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
Subject: [PATCH v2 03/14] drm/msm/a8xx: Add a8xx_aperture_acquire_raw()
Date: Wed, 21 Oct 2026 13:41:28 -0700
Message-ID: <20261021204244.67160-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
References: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=HLhWhYtv c=1 sm=1 tr=0 ts=6ad92619 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=qGl0e74_xy6xiHm5yPkA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 0JlLV4ca3j2lsWRRlmCRRPZ4KhQy1Hsz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX59hDIPCsBM8Q
 3n7dz6G7zhB3t/LGPdqfJUlcUUKumbyBPGUE4DTc13dYLTOh33PF1J2qSUnRKdakcUzo0i0V9h2
 00oa0TvJ0CR2erVSDVwRUD1DPWSh8XY=
X-Proofpoint-ORIG-GUID: 0JlLV4ca3j2lsWRRlmCRRPZ4KhQy1Hsz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX16QEVKqAEdGy
 Tf0oTpqHAMCM2F6ULXYNPLgirVBg+rGcQY1hVwZPUCtsEgs7grU+2X38/MFyU76spQBt6KyLMZJ
 1cAGep8cCc5XXFbc8t4odoaE4EhR6nbWV4MTdCUEdDlMLWNfWqk9Y56ujZeKBGEw3hcGDAJ6vWg
 VbdP1b37hjz1jR//UqYQYpwjwgWCowYuDkcXMc5fpqrIk6A2Q/McRWuvK7aOEcPPxBJxlDcGpf0
 Cl/JsFAWtazqpD3WM5d9woGHyP2cClMj1YOltzAnlkQzemTSLEXe9hP/mGJq5/WT5GPfF27wyP0
 a2ActopLH5iUCZL4XUnR2stKF+8Z0Fp0/f5SsvThccjNXqs5ZA2qx/Fcr2oa3/PHblsKOi59oxL
 9X75S88e3LQSVAqVyWolPbn2DU00GEpoR+mTc4mLiDNV4bqJqGbjjh9LfDz1OJ46FhcLZwz+Owf
 MCVx+oBfJtnSHMGl4pA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210083

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

