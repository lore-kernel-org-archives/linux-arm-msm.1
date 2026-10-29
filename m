Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305074;
	b=zEnYtuayHJ+aJNUkxQ+9gHwZ56Bf1o8NCZFEjOF6YLlnop55NQzQTlQa5gtRYUIMEh20
	 +mL089ArKjdi0LPsTu6sU8urhLcfkllY1W++K3CzexaeVBjQRtgDr0SZlk9pZdS6KCdHs
	 8/BDdkq2B1T+CRYUp9hwoJZfu7cHP3IEyZI57hgDwFERvlgJwwfGGkInV9st2InV9wsCb
	 k/dizPWtRupTgsEZ0jJLbW/gG+27/E9kkbibqEq3+T6L4h8IWbB4vn5H/Wq+JcGsy2nxk
	 YAbVaIWlsQ1ptQffin0e5AztduSyqUb57gZ2gXtnWXkh2sgUfpnMikqyfeZuXYUlbxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305074;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bFtglml+hC8hn1WGCAIjH4C7EGvJhD/mYi/y0qfEDH0=;
	b=elJuKPhVhPQ5cqOjGywYM9wlRVP07k0Ji6gJv/+A6/7YqsWMo32KGGA9wiuTLjglLm4n
	 pT6l/6v0kTeWKLskTbntRs1TKB6fXbs8KY2CeyLboyaZUdIKv3h3F+rFXiKMhcSAvxvuc
	 RnziVk1nf8c+fpMeJYkfwAc3Xo/P7Czvzc5bzhYLbkSLl4wizSgkdqeVgXH2DNPZ4lvvx
	 S4I8aQKgQRUV/IBWF9O7YsswXoaQzU0vYJgrS+cdacOdBVxsVmgDxazuSzXoPHtsSnmLc
	 AMfjCvpTqzUJX6S86eywRYNnBtDKHXPB5SG7tZcm2hscyt6iEk+vwNCZ++T4S3cv8AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Br0V/KZx";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DYHmfuht;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE7E606A320
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AE7E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Br0V/KZx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DYHmfuht
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJjjcb1122773
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bFtglml+hC8
	hn1WGCAIjH4C7EGvJhD/mYi/y0qfEDH0=; b=Br0V/KZxbEONAsZDMOiWmikSrXC
	yOqLDitz0U60eSP45JuAnmwzEBTGSYuyoDkF4WGnZyIoL+XNO0RMA/RSCQ2Y6Xuo
	zaAPFS1laavSZjLn8UJVpkEorNkPZ8L82oAaLNkW7sC9DP/IchhNUYpGGM1go+lv
	bEiuE0/2u+T1Wptp/Cd87vud3SL4JBcs7uiLf0Kq+nlyGM3aUs88FLDOxKzFMruf
	tt5WZZ3o1jviDGtOg8bRXo+TLjlp9JewOE/Aj32+WyVDmPnBu10cR43mdp7F90oW
	JcOnlo6F7NxSD0/88nYTae/nkhjbiINIKjjZiX6wpHPjXSbE7lanbdlOqUw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm8k4k0mq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:17:52 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a05bfa6af5so2057957b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793305071; x=1793909871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bFtglml+hC8hn1WGCAIjH4C7EGvJhD/mYi/y0qfEDH0=;
        b=DYHmfuhtcezaWTZHSKf/X6DHLaTXZx/88rYaYN3cs69FLUQfYAeguINVLTGOGywdPc
         mXa7TmagwNKgo0npGB/Mb6lkmHbu2yuUVGLPKU+yzYCg0hG8rb5sq4rRIWgQ8Jy40cgb
         /5fWcU4fBCfpEVHC6FClwxgsj+kGvTWI5dJyzkjBS8JSFW8t4ewTv/ljcGEAizu6287x
         8nkPcWAeAHQd82pmm8MIRV7lwsWvSH5LWihqXSFr68QSp4NFih4fTTdIKdadULOfOWJD
         fpAEkg+qGCYZR8JnecHuVelMdoWHoCQhDtxZ6KGWDkoyAFK0DITJ/AlOLmgB5QniwI1R
         kNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793305071; x=1793909871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bFtglml+hC8hn1WGCAIjH4C7EGvJhD/mYi/y0qfEDH0=;
        b=SnhOs3RMCCTLiVxAgqb/U5X/GVDO/u0OA8UJN9hAKLIKZZquEjj8bhM8xGNIqMS6C2
         h9AIW05Bw1qB/etkuNtCTvGeg1n34BuXNycTSGPcycEoAQ8skf1NXXScsx8IjWmPpAJ0
         UNHhJLP9/UEJtt+eYn39qQxTcy/6yz7fvZru3q3i4niGvGYRaNW9i+70He9Y7ezlQX4E
         /i5zFOl/1rwCri7reUt/C58jxDCpRASjHZCSAuv9XXanHJ2Ug/1+sqGYzLEeXvjwJDop
         rbruuavxj5Cbq0arR92pfcobOtjuFeyVjUL68jN5iZyT8hv3IzRH24tq9Ui0GiHbUsRU
         NsWg==
X-Gm-Message-State: AFq9FYKGkTO8WngCENx31hDhazB5ExTNqnJs4+Zp5yDt+CF5F527TjKH
	cRid9WyYU5zNNwneXXEOhtWmtkB091ZwUEy1lvfQA5fxyeivAwAX/hyIyvU6U20qj+aGci7XT1a
	AVFYRoIzQa5UMNkeTIP+4mrR4WCViQQg076bLt6LiFV6x9fLqHZ65s2+6Xe54Y3rhYVPa
X-Gm-Gg: AYBFou3oNo3SaFuZcotrDp3LUUpGrr7t2W5M/KIZwm0orvbwuvxnYO19zibGP8dDPqk
	WiX5J1aB2Iilfc6FKQgsQNggeEkWfz7xclFewz0P0XXOlIvenQeFAvyIcQMhbwv1dH1phzZVz5H
	8JqTPb1dMZJLN5dt/kIh9ZjtYvAqXNeAYawhCNMoWzOJYBN26Ciw0YCBwcSWPHCtTemH/vXmC1G
	A161aq60LJ/Xa1UUYQUyh1PfGIS2EAFyrB6kckNKPhm5VrlC6Awq5poSEoGrLs/jY73CoMOMbkB
	HZ6INuuPjRPQeKikBjAGbz8yaWEvdougSkDfSqWVx7w33VKHnWKUy7weHkjkvzeoa2VXIpYBz7Q
	KOaJ6xddi35dH+ZqDCKnyvCoee6ZDJzt+Fzv716UDv/TREJV54BMBOEL3qaQoINGChUo8D8JPA0
	oTW1qVbXVwnCi2C8bTyeTxEB0=
X-Received: by 2002:a05:6a00:6c83:b0:888:4f06:903f with SMTP id d2e1a72fcca58-8a9bf524c81mr153636b3a.38.1793305071484;
        Thu, 29 Oct 2026 13:17:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c83:b0:888:4f06:903f with SMTP id d2e1a72fcca58-8a9bf524c81mr153608b3a.38.1793305071001;
        Thu, 29 Oct 2026 13:17:51 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a98893c464sm252559b3a.19.2026.10.29.13.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:17:50 -0700 (PDT)
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
Subject: [PATCH v3 02/16] drm/msm/a8xx: Export aperture helpers
Date: Thu, 29 Oct 2026 13:16:12 -0700
Message-ID: <20261029201730.151754-3-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfXxJKXN5q0VBSB
 0X1zJgCbED1jfAYk2taymMrwZUehWVfno5TTkdMB2JHZrfX1d4kEko2jsOwcNNGIMMN96s5ZwtY
 0D1DmnuljMMcxWZewugZhjfWlfFVIbh4RzBKII73iE2YOljuXP2vQoUtuxoi/ZIOcdsNKVBh8Rh
 wt8ILmcrDjyaSUe0n+so/L48U1v+CC2trZu1qOz1wv2sh45xRCZITLGFUGw1wHabirFnwmwibQZ
 3kyiB6isW1A4s+f1Mc5x/KxrgPOEBuO/qIBR54bWLk7wPYafLgjxewTm/ZzL5b603TbtJ8GU0Ju
 LWT8547Sh1up2ic5TTLfLs1mE99xdNPqnWoB2BG2zeij9+UUol2bih4qKhrMIGl39yhS1whEHoo
 zUDuf5+odpSx3uMfiIoeOfne0UWfGdQWUYyC4NOQPAhilNmLdrM5RJv1qCjxt48rFDuqxzmcrUk
 wx98MIwNg8GDUBHc7Bw==
X-Authority-Analysis: v=2.4 cv=LuAHWXdc c=1 sm=1 tr=0 ts=6ae3a9f0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=58qa3DtRz-ucCGMA3goA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: lvgl1yWpngMnJ2Y4De8ByIoGmy8XtewB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX5Q9/ymsP273Z
 QiXNelH+ry2R4RbHi/qEph9cBKpgoGkyxp8XC/TiqOUoWmni2CnYiczI72oaUn7Sro40Y6gs+wY
 1edMlJqeE+iwOimXvHtTQk153lBOf1Y=
X-Proofpoint-ORIG-GUID: lvgl1yWpngMnJ2Y4De8ByIoGmy8XtewB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290079

We'll need these from gen8 gpu state snapshot code as well.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 3 +++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 81d21acccea1..fb000b79fe2f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -348,6 +348,9 @@ void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 void a6xx_flush_yield(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 int a6xx_zap_shader_init(struct msm_gpu *gpu);
 
+void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags);
+void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags);
+void a8xx_aperture_clear(struct msm_gpu *gpu);
 void a8xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off);
 int a8xx_fault_handler(void *arg, unsigned long iova, int flags, void *data);
 void a8xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index e7d04c865968..a14379e26fbe 100644
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

