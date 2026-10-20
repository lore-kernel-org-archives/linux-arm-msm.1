Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792529272;
	b=kmb153IMR8+/2tCCjYWHtIzGCRJYVVzW2xa+bb7AFtbncjEyKijOlzU5lAyDeJ4Z69za
	 PT1LAl2mntFivbeKjoeQU0XJNGsEqXAEZZBymZRSVqvfAK8glkY7QCLEY7LdQ6vxVn9Tr
	 Ry0uJZ6NEvREZwwRXC9nBTdTbKWrk1f7Bmz9tRbjNqGKqV3I2LstPfm4EPpi3+vtrGLtt
	 6ydi5ID3/PoxpGYK2yJLc5RKsaxs6uio/fw121He/wUjA6Zyx57SYmHHxyOGx21erChSX
	 Ttw++HhiFyf0q+IijWr0u+ewfJvEGvSosXcEFBd7mxS8adwUGtl4yVl774frzS3aPtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529272;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tTj9FU2l6DkQ6RJx5hLFoO5Te3fK+1vgHq98PZkcDoM=;
	b=fmAfFmV7aB0BtaviwvTvDgS0buRXo3ExHJYJRIdRwqWEi8+VoCVYf3MYcOWMJuKiqElm
	 BtKXyzMO+H6utY6v7v0Owwngn8Hq4FF3gYWTgSONQE0aQtYtwP7ea4Y9V7JiMJM2+LS3T
	 N7p3otrSptjt/b5glCr0EOULwCD1tQuMsY74wBXFD7VydhFWs1fhategw4Ypsh/0gLJuL
	 It2UfCLhWCmE5VCBmZSyYaH4vVJj6DAuP8VCRODZvS4tCl5r++LnEnM+IKIZVtx6plUN5
	 gvlspqJrn492pjzHEJXaa9Z3kcJ5LacJZr0VkeQJA4mpONzJY1YSRpxBJ0kFUlQkN2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BCUOI9Zn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=he2XVJyP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64EF606A33E
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 20:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C64EF606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BCUOI9Zn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=he2XVJyP
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KGtcYA1376275
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 20:47:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tTj9FU2l6Dk
	Q6RJx5hLFoO5Te3fK+1vgHq98PZkcDoM=; b=BCUOI9ZnP5ckR1npZRB3XXA7bpY
	5Kkn7cRr9dheeVMmDXZ4E4N4f7u/Ok2EcjFrRaLQwpM7SEvcMRuWEU30C3opqECI
	UNBcFRnY4D1y8wwJ08X+TOtHi2Ta3CvQBsYnMdcuw9AjuEoy4osasfm4i5kYFzGX
	IPzjVv5ulQHrx2iKdWOcVLYPgGVNIfyAfUVYcNjBMBmV/0pXhlKmzAf34w72tgzq
	Yhm3KVGMgl3NO8CMBOGTMtnf4qRzlKECSGSHyZzxsxry2Is2crzvUVEovFCBtDla
	Lcvej1P3CUv88jddrGop1j3v2dxGIL+FzQzhTkDwCzuQkzjU4JP356Q2HDw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd0wfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 20:47:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab27eb38d6so70782a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792529270; x=1793134070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tTj9FU2l6DkQ6RJx5hLFoO5Te3fK+1vgHq98PZkcDoM=;
        b=he2XVJyP2F1WvqlhjTY0WWlXeYIFi4n+xOwNyJkwSdRy8xxAuq9rq2xp3plqwc5X7j
         ii/kQ644Fx1xu/wmJyY1DIRQrSPOq3vrydPCJCZrHhuthh0ltAbenwR4AiJJ9lqF0NIp
         xkHGpEQyxDs+boaPw1KAwmNv7H86EIvSfxaUznYPaaNRxG9SsbgaOEp+kls88vID6W94
         w1RoBuELLgh4rM4GJWi6NwDSsC1EQeLAxGvz11kY3HB0vhzegg+qMl6btC/6dBbRu2nI
         Nw92S/5xEn8LNgpKrCWkVdAvj8jM/A5LrobOas6+QIsO9jEWOC3L0R7XQLzjWS3Fv4i+
         kWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529270; x=1793134070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tTj9FU2l6DkQ6RJx5hLFoO5Te3fK+1vgHq98PZkcDoM=;
        b=xMUIwz2/8JOgzaXNlW5qHaDozjaNET35NuSepVwzCy4G+Xcgw0VPAHtAWxz0ECfDsH
         G8HE32NW05YwrtnHlGkwtDVy8NTFAJES1OGz/4dSkmcXlMtQQV+OdMcSY+sKioF197H0
         GNWvrUfXJs4mvCbDJFvFvX9oNWKP3kQNjSqQKeBGq5fzTQI+COTG3RW5WVwtAl8jrUgp
         gNNRZDZna4Wz5yhs59doZoC3fEtWCJBWatYGJ/1QStc4uirTh11EbBXDA6Q0HBEad3IN
         mGPvhKCEhDtU2rFi+YVIoSShjwnYpo6nTTUiZap0i25Nmav2IRq2at5wOwiNjWPT3PpO
         DwwA==
X-Gm-Message-State: AFq9FYKTR3hV5xmAle1VavN0Mqc90ChWAu+CWbSS7BYCkWHabq91RhOP
	WwQctY0H0TsfGGwK4F0t03umB99RpuV6EFW/VmCvMiJxS23vk5FQ2c4IDHIkPs1McBqdzsf5I4i
	yhuqgxKjPPDuJG8Nxl51MxkZ+Gjvp4z4qguOhNzwK9SVYk54/1TsOdEmAHDrF4f2ca58b
X-Gm-Gg: AYBFou2f7OukyvkOUuvEU44HhxLLpGej0mCquy0AZlKcHrcidsMIf8W9wa7Z6Tf5Qyl
	xxE7NT15zc+bXMppdyVdrMknyB6tjw8I+/Hwy05ozfkm/ZpBRZpTL08L1I6noMrLhmvYWJqHMRI
	wmelutt3hzYxrWOaVRVpmJlvbvxpvr3bov2dPn7Ye7mLd9YlkQzlQ7VJagmn+csgGggRqWBAG5l
	QqjSBTQDphC2E97XW5ZJPkO8Ab1x+vY94lY59bml9s8fR2X6e7qcvnZi0BhsUXuayq3Goh6rTR8
	CBxm0zE4xjKKV8TC2FqSeyibQ2BnQ3iA3nQh35H8lBiPBROBsFnqS5qWDvK4r5wTdnEFuigRVSc
	vIsMlI3AgkSVH7bNhRFKHM/ItFAkSFA1/EYeo1V2R4hW2L+Dnng==
X-Received: by 2002:a17:90b:1d45:b0:3ab:b39f:41c8 with SMTP id 98e67ed59e1d1-3ad86f01861mr74548a91.46.1792529270563;
        Tue, 20 Oct 2026 13:47:50 -0700 (PDT)
X-Received: by 2002:a17:90b:1d45:b0:3ab:b39f:41c8 with SMTP id 98e67ed59e1d1-3ad86f01861mr74519a91.46.1792529270081;
        Tue, 20 Oct 2026 13:47:50 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad80cbe295sm906521a91.5.2026.10.20.13.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:47:49 -0700 (PDT)
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
Subject: [PATCH 03/12] drm/msm/a8xx: Add a8xx_aperture_acquire_slice()
Date: Tue, 20 Oct 2026 13:46:17 -0700
Message-ID: <20261020204728.28844-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020204728.28844-1-robin.clark@oss.qualcomm.com>
References: <20261020204728.28844-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfX/ahTMc32eZFs
 nGOcpCF6SSM/ZKBKvc5Z1CkrRsqgSZgNQfqxHNVSbQHWwfoq7QgzYWYGRdEJSxdNW1J5LYPFIg8
 8ATgZ03AygAD4BHQhYKAHGGPw6jJVcGDFt/ZUif3Fs7ykLOhio9LUK7l254UXWHZvIpfFx6fmMN
 5YnY2S/Kmv1K9bAHX8berF9gtDrzpKmDHMmWpaTB3QbN6zhAjZZiBg+o2s44HGLlqE0OmIbE87b
 KU6mDPdfmhCmupR+wVWrEmXtTd/sXi3SxEF2fy+T9KoQJVpePTatMxo+sJZmsPWPBwZpAru6Yl/
 JlsxuLcMeS/x7rOt6HpvGQbHnRfgIheIXBZnBiH/b9FwFY2LaJgtisXSdYm4x77SzfgZgap1czK
 GVRVOv/GyD3CH0S1lBhXyMp8Qjc/TuTUbfhKobDpeTva1TsCGO9LJLfQgNx5Lv8TGtke5jnDh05
 NanFYAgHbLiCG7+g8bg==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad7d377 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=PjapJS5JrKSUkyaTbiQA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: XchVJNagVIXk9r6NYZtwcFOhRpBHjSJo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfX6Hj9/a99/7Cc
 24BCqhCUNyb5gSL12WEYu6QzvXE+Q9o27ZARBqGxlCzKL+n9WnskahxWzlgipdwALOy8g6bkhSi
 jorfw1s6r4jaa0flgi8tJ7eP7+R14Ek=
X-Proofpoint-GUID: XchVJNagVIXk9r6NYZtwcFOhRpBHjSJo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200082

The gen8 snapshot code will need a bit more control.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  3 +++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 19 +++++++++++++++----
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index fb000b79fe2f..d60cbfaa0d8e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -348,6 +348,9 @@ void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 void a6xx_flush_yield(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 int a6xx_zap_shader_init(struct msm_gpu *gpu);
 
+void a8xx_aperture_acquire_slice(struct msm_gpu *gpu, enum adreno_pipe pipe,
+				 u32 slice, bool use_slice,
+				 unsigned long *flags);
 void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags);
 void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags);
 void a8xx_aperture_clear(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index a14379e26fbe..72c84f73157a 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -16,7 +16,8 @@
 
 #define GPU_PAS_ID 13
 
-static void a8xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe, u32 slice)
+static void a8xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe,
+				    u32 slice, bool use_slice)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
@@ -24,6 +25,9 @@ static void a8xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe,
 
 	val = A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe) | A8XX_CP_APERTURE_CNTL_HOST_SLICEID(slice);
 
+	if (use_slice)
+		val |= A8XX_CP_APERTURE_CNTL_HOST_USESLICEID;
+
 	if (a6xx_gpu->cached_aperture == val)
 		return;
 
@@ -32,14 +36,21 @@ static void a8xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe,
 	a6xx_gpu->cached_aperture = val;
 }
 
-void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)
+void a8xx_aperture_acquire_slice(struct msm_gpu *gpu, enum adreno_pipe pipe,
+				 u32 slice, bool use_slice,
+				 unsigned long *flags)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 
 	spin_lock_irqsave(&a6xx_gpu->aperture_lock, *flags);
 
-	a8xx_aperture_slice_set(gpu, pipe, 0);
+	a8xx_aperture_slice_set(gpu, pipe, slice, use_slice);
+}
+
+void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)
+{
+	a8xx_aperture_acquire_slice(gpu, pipe, 0, false, flags);
 }
 
 void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags)
@@ -75,7 +86,7 @@ static u32 a8xx_read_pipe_slice(struct msm_gpu *gpu, enum adreno_pipe pipe, u32
 	u32 val;
 
 	spin_lock_irqsave(&a6xx_gpu->aperture_lock, flags);
-	a8xx_aperture_slice_set(gpu, pipe, slice);
+	a8xx_aperture_slice_set(gpu, pipe, slice, false);
 	val = gpu_read(gpu, offset);
 	spin_unlock_irqrestore(&a6xx_gpu->aperture_lock, flags);
 
-- 
2.56.0

