Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794007368;
	b=y2RV1/9s8Bcddb8NdbI4LZGIohCGZl1gH1qNdKAZ21DtYIylz6uy6iPj0kJ8NUnVA6Ka
	 AU9EDaSG98xXveCVTMqEbLgXWdVVwuxcFO/hSV9MSs7DWER0rOGgGHoV9DvTFu2s7N9Ed
	 S/+5Sxlq7PGCQXFWqWeRD+NfeAUvwu4wOvWKgmCQ1ehS81gPu1KauWNnOcloTIvQQWQOI
	 FGcefyZTcoUKSBc2IoUj+a1D92N7M6StpU5WwWT0LbsDIjpJzCgRBFzUbplZ7J79a6Tvi
	 jHIexN+OnY9WG7zSbCNNWRT6D5HNQQ5HG4+KFjrpsONegzDo6Hfa4heYTgX1kZEg+rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794007368;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mInqVCgb/JpcHAFW5diV2Bd7SIXa0C+12G8PqaKwBHE=;
	b=RToJoJOkwcjkjNUCxcTjD64PJuK2DhefRGKR4hv8fYeUE71FGN2hLKczB+QuLNaexmOK
	 x5LKEBw4g/7xkRhytAy6efny71gAxksq8XOJQ003VShNoEYLsC9EPW+JvRfKT5ggrLtv9
	 zQwTOzQPvbMdGXRsad2BnVqrFDm1L+ZZrriRwyCoA9yh5jX3P8OiaBf96WvdyAVkpksRg
	 zuuaG5zTOXVnOGdoSrcFaO8QO6evqcf1I2P9vFJyb2f4nsNq+6uT98rGbzRvP8kmOy6D2
	 myxnUdze2lM5ZK1zCByPplCzb6JnkLn73q1jCO1e30crv/uhK/81z5+z638VlWWi6AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Syf280aM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jLhZ4Vfl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A1F606D805
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 23:22:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9A1F606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Syf280aM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jLhZ4Vfl
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6MoHXn2084921
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 23:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mInqVCgb/Jp
	cHAFW5diV2Bd7SIXa0C+12G8PqaKwBHE=; b=Syf280aMoO/xUrS4R7GcM0BxjJr
	J9yQtRcUX9vwJpHzLQQZm4b33yAxZ6mV5qaJfq60hFLkV5JqOzjves698X4pm74x
	V0VKg7dPpmD3JGIR2GXA1AWJB+rlqGjPCLTJ67xvZSRa8Vb8RKgaTEMCITSyV1ze
	1FADgBuhHA8+LI1+gavkNgVIjQeGPja2h1GBtoOtWjDq6QAOSzps09EsGI7sQwFb
	p6ha0vgRcd1W3etGV7ehbd5l9yYSNE+xTWWuToAdw8nMTkYE3GtA6fS4Qa5CM3pr
	94S05QCBLoVZ0duR5rquttwuGq7knNryMLlhNB7pwo+p6BKu3OOlV7VWOjw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsm6m8ykv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 23:22:42 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdaf2a74482so588516a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 15:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794007361; x=1794612161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mInqVCgb/JpcHAFW5diV2Bd7SIXa0C+12G8PqaKwBHE=;
        b=jLhZ4Vfl7crAc2vw62wogDGnCHAG7TRgq6rQOtMtY3TOnKpDVWcWIoQS9sVbjt6TQ3
         imj09OVrgZJ28pq+4VPORaRnfHetcBx8jsoGeQSpX7BYBxz7gB4PO3RzT3RNS+nh71Lv
         hzFG2sm+G1S29kTEmAXWggVCEIfmXv9Z7SaJuDg9aqgKjmUNfmCTuDh9/8owLZzIfDk7
         Fs3EqJbxXcMRo6KUaQvaLpqqyfzWKp+vujIMpAUi/W31PYh79A5Y8d2QOgCpX/iF8Fte
         Gvtgi2UYSZXfO9iqbZ9EqxmjIfNI6CZAcDqiXP+Z8Pd3r8+9uGGP2Wg4m2diCrHOu+82
         NB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794007361; x=1794612161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mInqVCgb/JpcHAFW5diV2Bd7SIXa0C+12G8PqaKwBHE=;
        b=QOA1QFYKXoj8H8soaS21aGi9HDildjAC/7/3l8Qb1JA3a4dMnVaB2kln0NX8+k967F
         wOLyrJNXWusA2Grla9VoWx9kXuvBRL2uMIlqklzxwdPnA7qLJGe8JwPHayvBX4SZpWen
         kLTjDnRPh0rUZ5v/pI2xJLtraYaOI74Qru8QEtNaiHFoEzWaMkiwcuB11npKptSLljVf
         Q9RbhSGffPqAq+SrNLcq3h87Gjplr3OU3LYgnTt0fCng0XHxKrWCS7TmQsHBASpLrMp1
         SVq6Mm/6iOm2kwEyWp20qyKlr3dT5SZNgvfMFocYjHDc49extez82qvB5graeiX0omC7
         g+qA==
X-Gm-Message-State: APuU4Z/wL9TKDzlfZIdnqXHRXnZI25SDTPhJ3cP0szaJFX5rQD6hFSC4
	KYqjrKCDzyL5uU1P4B1hIY6L3AbmMjMDk3GAhlNnEcwzhs/73R1+gL+UN/tbJ8nX8sZTPYSy+3R
	KibAM06WXi8GUmOZksFcr131kTwfRmY1wsY5NS2Sxzybs4KvPP6DX9mZZLHSDljx10oOb
X-Gm-Gg: AYBFou2nhUthexe4/7pmjt8RzkhNPbKzHhPHsQoGqdBSGRP1OBHt4mhe/QIgPOIiiUD
	x/HhExqiIQ0D9uFrzFQHISYN6TMvC+4A844F7tq4FDsnI7PtaFBxCete5hzqm4anRS5AZR2zzqd
	ez2GvZ3LmHWPJnWaNQ+KlEwh8nx1krMJKP+MLFUOO4MM0PnWoa+vWNWsINEZQJjI/BqVvXFkP4l
	2IqEuJ7wUvZ2dJms9+L8FLJHuiWH3bnIHVd436pV5ccfXidEdZbVuRNSRtU9jnTXGazRs8TBJzp
	t7ypv9SA7QNjHAiuGREZ1YOP3yuqDCn9Zwg5BPl6QRsX2uQQiPI152C0DIWN5C+hspzcaWjvpHT
	4vGGxKmtOWc/+bljVmQFVJS/qaNzL7VPTiQ/RoxH5xe8nN3M03Dbzp347DXvOcrTp2TwURO5NSN
	+h6RqRnem9k5qEgYxrXqA7hy3F2rPPABCNb0wcC8Oh4EeJHH/Rcnv/+XFLKmT51w==
X-Received: by 2002:a17:90b:268a:b0:3ac:403d:6239 with SMTP id 98e67ed59e1d1-3b0db7107cfmr3369792a91.43.1794007361448;
        Fri, 06 Nov 2026 15:22:41 -0800 (PST)
X-Received: by 2002:a17:90b:268a:b0:3ac:403d:6239 with SMTP id 98e67ed59e1d1-3b0db7107cfmr3369767a91.43.1794007360977;
        Fri, 06 Nov 2026 15:22:40 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105831cf6sm653999a91.11.2026.11.06.15.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:22:40 -0800 (PST)
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
Subject: [PATCH v7 03/15] drm/msm/a8xx: Add a8xx_aperture_acquire_raw()
Date: Fri,  6 Nov 2026 15:20:55 -0800
Message-ID: <20261106232220.47602-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106232220.47602-1-robin.clark@oss.qualcomm.com>
References: <20261106232220.47602-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfXxRkitdg2yGFb
 g4RxwBdT5g/6O2M5MSRhpCd2ZUtr0Qkp2NxvrT1eRfy2XgA624Tn5XyjpiDFquldYZJ/0/xLPI2
 DOUB2vlHYAT3u5CAYE4DI8aAbuV7hu0=
X-Proofpoint-GUID: h8aUELVYYYoldKnQDXFxtPAFrAjCL3lU
X-Authority-Analysis: v=2.4 cv=S7NMU4sP c=1 sm=1 tr=0 ts=6aee6142 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=qGl0e74_xy6xiHm5yPkA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX+VD29x2gjabi
 imMk/3ustk6qywEr/vGgVkAjVf5tfPufDpm8+H5ZJGVCUddqWGwpWJ9LDn4zluLWFwaabZ4W3sf
 Smkq3YY2BmjHm/K1/cpr6s7vHpGU4EnZv20iJCxXVziXZVdw/ScDmXkBl9f5J51tfvZSS9V7Ojr
 nOD7w5q81jfbadlcHVYgVTO8ISN90LysL9PtXGe2VK0Ipm4ly5ncYDRBmHbyuUegzm60YoXZD7k
 9UApPZvt4z/bfCbiFjYUjgJJwfK0rqttW3sM9OLUzpsPgCD1L8/LMnySUeXWKzZe2JfUe7VmlqM
 7i0Qs7C1Xw+HP/1hNodBWS4n+NpZkzLU4AoixiwrdN5yXHU6ARbkvgk5ds5eq79MvhxgVskllpH
 14uU8UFSfxmudQc28X/3PblDUW4bd6924pxhuwvX1d0XpwGk8mx0iNbOGPuZbTCDi3Rdd7aKaQ5
 KXnZF9ce0pDS8xM1zXQ==
X-Proofpoint-ORIG-GUID: h8aUELVYYYoldKnQDXFxtPAFrAjCL3lU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060093

The snapshot code will need more control, setting additional bitfields.
Rather than add a list of additional args, add a helper to acquire the
aperture which directly takes a reg value.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
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

