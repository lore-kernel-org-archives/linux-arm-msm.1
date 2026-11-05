Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911229;
	b=r0wvoUPZRSqaCJQ6FHIiCnFp7mWZS6qGpD8JPQ7QWOskDwcoNvFOWb8RqWxGwo71AeKE
	 Jk0s4pjfQ6M4UCvaOl8k8oFNZTU2u/COmYp/nsYARLMrK9Lmg70FGNIHxkxGb8H5DpetB
	 AyoQl/hHPzgONg1LFWrMjorAgfl7JjVe/VDgdnxfg66U10klOTFCerQFKZNhzRQeUkbEF
	 aOpZmkrlsBPK6xqq0CsQWc1th/dEBTmAhFjc5pb5irGfak8/0hFtvUfAE3Qe03D10cmoQ
	 eGr8Syy8iYPBIBQK/vJFgjSYWPbxF5iBMDy2Hy5zWHtBT4/GZC9cKeMyPQafA8bQBpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911229;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=07HC8CYy/1wn7fl1/mdQptgxfFoHGUlLKkrop/ashJw=;
	b=xVaiec8DOJgFKulxa52IJn9nDSw/DfulguhKs0b6Il3O95Sk2zv5O7w0HaIljbQWXjzG
	 Ti5GtK4uTWR4NU1clUydSCL+TfuctNcnIosUn6UVkSHMhPfBKYiLZlMb6xtIDYBcqf0qq
	 r7RtGhWCagJ+Wc7IPZZdIoWqACIAwxzlhR/OyfBLDrq1a8tqpSzi1Stb1ue37ielAWbar
	 ByKVA+bE38xuAcwChoZ7uLk+6VwdsIOfN6/DOPH+D4Buqz/OfK7GLcrfuFtwmmJXa14Pv
	 zF+FO+e6FwiG00RFdhtm3/qup9OcAJUVvI6fYRmm/rscyoZtCiAU4j7+lKR8H/aDITQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cN0rNudS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="A/qCEDTS";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C90606D823
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 20:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99C90606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cN0rNudS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A/qCEDTS
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeMDs1485106
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 20:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=07HC8CYy/1w
	n7fl1/mdQptgxfFoHGUlLKkrop/ashJw=; b=cN0rNudS7g+BJjauacqKMkodGrH
	90KkFCJQG3wpydN93pRtOZrsNmPperoA0q6Md7smpIa5+EMqsWaKl30SOsof09RZ
	NrTaQkjDyj48ZdAwRc6epB5Y1KDqYlyqEGRG/65ccaX6E+6dFolWTq7qGOZLclYS
	JwbEC0CxdDY+I/eNtdeak7KKZFdsumOgj5wHnhOpPxEb1uKEUVR+VPyIo/F28L2L
	qrAUkWU9eNpLFNTFyGPzUc2HGo+tqGnFg28yBhFkrIHmOlwkE2sELUmezeD1dSlJ
	dex7DRZ80eTUaDgP2BSs/3WRlDkY2ghOn8wuPtu8fAvOuEl/UjzzaXkiChg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrpaak7a8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 20:40:27 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b08aee6b3eso2194256a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 12:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793911226; x=1794516026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=07HC8CYy/1wn7fl1/mdQptgxfFoHGUlLKkrop/ashJw=;
        b=A/qCEDTSmxaw3rTCl02F4mqwKQ7sRAi/JnC8LlUjeNAHLIJpecpT2rwmrU5kA2i+bo
         H/LcTXXTiQIDBFarPh8Do/15Cq37gGLzoGX3L2m/YNoBCP6BIgulHybjzSo/kGBV7/1+
         ooK8LkwEcnMxAJW8nYvlmAcT7MrmIA1+M7a197Y7QbnzjcdLBznQtIASLhYPDs/N/3He
         8exYidNdVHh3DcF3YVRYA75g/TqhDuTh+6rp9r9Shlu8RvGOhjW5PG+hOg0RyQW1/6Te
         15mP72WyOr3fwmsqkxFSma4h6NSzqguneXRvO79TdK4O93R6xIfaADsq4mk7Am+xDz8T
         MmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911226; x=1794516026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=07HC8CYy/1wn7fl1/mdQptgxfFoHGUlLKkrop/ashJw=;
        b=mcWwepkCLI4/59XLzIRS5MrR5lDaagzxpIdMQeDvwThTPbpRVM4ll1OEQ3tqm67rrM
         cQr5Al/LRvPVReL+c/x21mbTkxl44abV1KG+Uoo3/m3JK8iYu/GIsDCWVGXTx3Xr+DCj
         294VDpCHOTtqxNPNm6lbK7jy7h4cN4z3+4wmQ2BAGooXOp+NsN/3dg8oWpU5tz8J70iJ
         PwwfB0ulZFvAhJVXcikQTqH29byYsKyi4ST2NzZfum5ta30vg/ReMWgJO12barppbgOr
         QLcWPi3o8IcykJdouSxmqtMFVZYbJx/t37HvfaqLoa/eXWHVPWvtqFJJbjcHnzImG9xc
         f63w==
X-Gm-Message-State: APuU4Z/0o14AutvmxrcxGNNqUNKmzoEBYIYKE50/xHx+o/GqAcjttJQe
	97DgPsazMEj35gPLUP50QX1j0dUHUe0FaBTQ1dtF1HwyOmFuPWZVvPfGZgG+jxl9L7msaHiwcVa
	6yR9buokh1r2LEGZwh61UoBlqvBgLieK4YDBE54ScmeqTe/CeaBii5J7UJRw0IUYkVXaD
X-Gm-Gg: AYBFou06nyxbf/ZWzAonl/StWK5D0EoO++u/7VNlJWmRfvpK6hjsvu5sAz+c8rdj10J
	yFB1jo9r1z1HZcvXJsuMCsm5vGc1NdUtqn8jnv9kDoY2/lC/E4xPC7CZlJKXFtdZ3yWdRjIR0Rl
	OQmczMPzKLV6eN3HkvLwMBWredX3YnkxZn8DhuWZD3LOdK1k42YBxBcQ/VDgbk4KTTB0SIOgurK
	u4vk2oG39RHcupybuXVNnA/H1713MshrbHYbyS2CHNQY07lpykILEhv+k3dI3KCTDGSfStGvUDc
	3WfdjIgnFmjp8veRRmpr92iWbe3kItuWX71Q13YQ5jYAmIWmX7/0sE7ARShZOmOucsIPhiTsLLa
	Iyc0pVnj+1jt/xgUJUjtOoONfEHqog/zDDqT8T2AgSzA7LgILvSE4HFnp9c9EOGm8SECwb6e5NY
	a467Kpyo9z2/9raep6C4zMW3+i53A5lDx6O5XqnsIJky5FxOVz1bHyJfiBcUeV6g==
X-Received: by 2002:a17:90b:3c8e:b0:3ab:de4:7fa5 with SMTP id 98e67ed59e1d1-3b0db71d9f8mr154347a91.56.1793911226404;
        Thu, 05 Nov 2026 12:40:26 -0800 (PST)
X-Received: by 2002:a17:90b:3c8e:b0:3ab:de4:7fa5 with SMTP id 98e67ed59e1d1-3b0db71d9f8mr154312a91.56.1793911225918;
        Thu, 05 Nov 2026 12:40:25 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c8f2f0sm646750a91.11.2026.11.05.12.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:40:24 -0800 (PST)
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
Subject: [PATCH v6 03/15] drm/msm/a8xx: Add a8xx_aperture_acquire_raw()
Date: Thu,  5 Nov 2026 12:29:29 -0800
Message-ID: <20261105203057.66520-4-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfXyQzCn4HK822l
 rSb0hDHtOrDxsjyVliVBsaCUPmKpKft4bDdNv00VI8TIYfmXP2YgzadhzS1zczH3r93tKo4/2FT
 iyeGrqHkgwed6N1NGwxCQGW8b0KlOssBHTc9jT65aoBmntIKJ+/Y4GwhPQjqloQci5ii3IWzvNo
 2IaCynlGipR5bpFWnaepQMuq46zfmrwczMlS3QpIU9l8U19oMu0he3wHAkjYnidx0OQhpwlxUKT
 fkFr7Wy9Y0PUhQojW1YaEq3fPsioKekWnFbMlam/QvMJhcz6Uq0Rf9MIjapsJapTEs20Wxqz+kK
 Nx+mqyc/SBLDgCxTgU1P4MZSCE7a3aZa2BstjKXk+ZgIRxuZbXEGNi1D7zpKbZL2/Dwjp9TqF2P
 GlPom8K/M1tZFxj563QhHqGCS/SumS5UgCZGyNdVvCGZx9pk8czvfNnymIny24SJmC3L1/uGg2h
 FfB0ynEfREXn6UAp++w==
X-Proofpoint-GUID: uiq1dcW0c-j_TTXS2MCiSMyboJ2JNmhd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX3qFxj/djqwTB
 nOA+HQkUTWr+K9kR30dECGORN+KV4aTtnjrEBSLUFBt+40l409211EeWShC6jBQnw2vHYGmhw02
 Uld54eTeJkxMl86WZt1I/i/qVVqrApk=
X-Proofpoint-ORIG-GUID: uiq1dcW0c-j_TTXS2MCiSMyboJ2JNmhd
X-Authority-Analysis: v=2.4 cv=WOXqzXsR c=1 sm=1 tr=0 ts=6aece9bb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=qGl0e74_xy6xiHm5yPkA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050082

The snapshot code will need more control, setting additional bitfields.
Rather than add a list of additional args, add a helper to acquire the
aperture which directly takes a reg value.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 21 +++++++++++++--------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index c58a2665e9ab..e6ec85b20fb7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -346,6 +346,7 @@ void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 void a6xx_flush_yield(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 int a6xx_zap_shader_init(struct msm_gpu *gpu);
 
+void a8xx_aperture_acquire_raw(struct msm_gpu *gpu, u32 val, unsigned long *flags);
 void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags);
 void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags);
 void a8xx_aperture_clear(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 82cddaa7278f..be81f141300f 100644
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

