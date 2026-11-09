Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234085;
	b=HPzQ7AUcYAsYbhGpZtc6KdG/ryo+OHB7Tan5Knc/4Gg1TbfX3Cvjfgy8yV1z0VkBfjx6
	 riIsZOJfvBgf16ejaAg5U+drgBYvSgRZXjD82+pQOXG/l0aSw592V9K2XtjV+elE9hSJr
	 A3vQRG7/Jtg48mgCyhcdanxwL8W4Aq9ZoTniODa8sSOrNsaSSje2F/Lls6fT/KrnHobB1
	 ypP9f9OBvIXgDaS4aI+f6Y/U1sLOP6pgdXnqsg6Q9t+OKvGhRIDNyk8qXguszb2rQj9hu
	 F9gTwMmjrZUO5nbP/BH0HxKBjt/10wkJMpg5GelAs3evV5mStJiH58sm6bwbvwkgobQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234085;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mInqVCgb/JpcHAFW5diV2Bd7SIXa0C+12G8PqaKwBHE=;
	b=yWmDqO19DD2q7fK+xhy93JLpGLia/zQxgDqS1QJYkrgIzd7jHpd+eSyMlnn8HjstLME9
	 K1+biV4Azhe3Ts4z2wTLMbY+s4DBuzN68zgNBLHxp5ACQYGEty4vcnUXjpf7ZkwDf9AJJ
	 8XAUqQWgGR4zgAONy/w5jWeOUs0oJT5XavP0I6vhbu/lfX3C8/FkxQ28lQ7ubrsdl9Jje
	 6gi64YMK/U/2bhaAkZlriqu59W+hZfoIHq6TNl3x1MRdJ8snoUTW3Fi7I31neGsRc4xCK
	 PzCh2I7ijie2IDIa/4niDDnUUz0qNNqrYvORtzsOEtcX72OcfkoRPtB8AdPE1NLOmmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fgtp3d9l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="kBzm/XPO";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC205606D812
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 14:21:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC205606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fgtp3d9l;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kBzm/XPO
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFJWA3588596
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 14:21:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mInqVCgb/Jp
	cHAFW5diV2Bd7SIXa0C+12G8PqaKwBHE=; b=fgtp3d9lwCGuLASp5DoT/o+Kcu1
	7KYMVdswK/M0LVXz8gW5lY9VoWVHxZziIAAM5EKHOjaephhahcL7mNyRS8NbGnf3
	hDsngt/6ABEmpp+9W5B0xvYagwA9wEJLvzfCNFin3YNpkMKvD/HJA8pjjnZyNF/7
	15yJxhbSv0H0jEdIWB0gCmGjny9OmSzE9dm1udddVo5Y7YUhC0yinIPCX1H3UhC7
	+v7ViUuPI8L4oolR/HIUoJP09/6lJkyso+mCJRsEmbcKuSzwcUOwfRYHVSzfhvqD
	Au41fBplpTZdjmwmlu0LKTmzBTwn/rYimT7/o+jOkxQ13pV2G/AnF5DJfjQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudcj8jb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 14:21:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0c7ab2427so804280a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 06:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794234083; x=1794838883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mInqVCgb/JpcHAFW5diV2Bd7SIXa0C+12G8PqaKwBHE=;
        b=kBzm/XPOYTrDo/+PMFPG/IrH3yfadwv9FxVJVzvnSqJ9VVBSp5Ee3eMLTD7zi4mNs1
         X5o2UOjhQ+T9pWZDPWqaDKQrWBiRimBigLDx+Zd69uQUIQWpI3ynacZPaGGGUs10FxNf
         Z3+Daqk5C9hFisJE7v94z1jIEEvZNPikcF5xBBl1LmsZvRAwUuz3g0NLtiS/4nkl6plk
         ibNlj1Cs6d3DMJ01BDBaOUx8Tyv9Bm7LCBJ1tzoXJBwLkzf9IUzO1FTGWwlotrEobUCb
         +9E/ZRPsjhaVQBr4fY4CvfoacPwKYFmVlt0Y+ABU/ajPEddzoGCdTFcGImA3YEw0BOZX
         nSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234083; x=1794838883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mInqVCgb/JpcHAFW5diV2Bd7SIXa0C+12G8PqaKwBHE=;
        b=y79DhwVgBhAezL5/6E/lhq2XgI/WMFiXMqk7HfWiI+pyHWrTdETFA3l3u98rIgUPBN
         dAhtCOSM/un3b/30uDFjpodaZMxlBDv75XshsdNQxRtXn37pb186DyCgqEgNRZdwd4y/
         5KVkCxK/BfgobqMxFXIDNl66L8c9cKqafx76LIlrY/R71oiYiGjCHH5p0RKa2szpvcaj
         6b76Kuu8GpiU3u5LRq1HRbTHhjYJ1JsCurWITnFtu77Wket/8mk4qCg3pr5ORJrOS7pa
         gfg38YnZ15zqknKweTylnxmOFyNW4rc6o6mc5qAbtosaa8xpoalE5tHmqdiKKYXP5phZ
         4LzA==
X-Gm-Message-State: APuU4Z+UMaUVycIPF356xd2QK8+uZWCyfUcGAoR6+O8a8CWRzjxN/ey+
	MkE4iKO6w3gBdnWrMZLygTelYOQ5WXfsCDV1pdEyoMrNF9tUJUNc7vR1eO14AKViT5ViGa4YDG0
	k11AKmRc4Kml0S1RkchahbUEHBNOZiSOw1RS8We0GHPnBFZkfQGax3F6SnaW8KOLUk9RG
X-Gm-Gg: AYBFou1XMDJe8bhvr+qurAy/CC2dB9LNCj4GFgfAJvP96X8KhOz/c/APUIQh4DeRe1z
	YDW2Z85C0K/3kP2axpKjd0/5vMGHYz+HXfEesoCKYuU6pyhiMeURv36KHbdS6qthqphcg12YUxh
	ltFChKiHJN9fOxsBgXvEHCrb0IVu1G/r1vJ/eDBfQC0dTsA8OJIQ8tiCmyR/6RyhmeRww5CKBAc
	YWjmJwqkSf5uYm7q4zqyS4XeSi/QliY1whvPOajDsO/I2djxun12h0v6ML09EWzHbmRHBF6DoiN
	dqPAcuukiZJy/N0OhRC34uAya4lVzOAJIZR0z5EbJlkAaQdA4A9gqnib/bZP9jnboamOpkp5fXI
	ZQPB8ZYI9tJ+kAM1AiZRY73DSmJyZ6BhLRWBPGV8R6xZ2hiQPgvVtth0FG/ywA2eqi4+lunGc8h
	8qhshSJ3WdeVh3v31BH5XAzs9OjuumgRx61TWxL8OOEALSSIRrr/JzB+20XE/c
X-Received: by 2002:a17:90b:53cf:b0:3b0:a9de:9880 with SMTP id 98e67ed59e1d1-3b12d4fbc05mr3538000a91.33.1794234083379;
        Mon, 09 Nov 2026 06:21:23 -0800 (PST)
X-Received: by 2002:a17:90b:53cf:b0:3b0:a9de:9880 with SMTP id 98e67ed59e1d1-3b12d4fbc05mr3537978a91.33.1794234082926;
        Mon, 09 Nov 2026 06:21:22 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b127712abcsm7260861a91.1.2026.11.09.06.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:21:22 -0800 (PST)
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
Subject: [PATCH v8 03/15] drm/msm/a8xx: Add a8xx_aperture_acquire_raw()
Date: Mon,  9 Nov 2026 06:19:49 -0800
Message-ID: <20261109142111.256630-4-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: 8uksgb4zFMlvzdgCcAyBXbXESg0S0QFP
X-Proofpoint-ORIG-GUID: 8uksgb4zFMlvzdgCcAyBXbXESg0S0QFP
X-Authority-Analysis: v=2.4 cv=au0nmiZV c=1 sm=1 tr=0 ts=6af1d6e4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=qGl0e74_xy6xiHm5yPkA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX5ue/V032Wpbg
 g7ayDEXKnbZOkeGDigjfufCG93ASq9BGgFftJlKWVnDL4fiIxTLFPbFHShJMKtChfUIpCS6Njgu
 X9kNj2AlVrTrc4euuBYOAmOamgTcutM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfXyRzfpYgJTVam
 yg9QCWt8u79FQbxpdBKA7Q4BIbDpkpnW4ScvyvWGAwka+KlJg0Q5ez3ElcPL4pUtW0swgxmYbk+
 vEbnodU84BtyahFUqg+HiwGo5YGNc8eckJdp0hor9sFLDqOw7Z47wwHERejMu7a2p+hyMib0w0I
 KsTSLMRCbh0rQKOqPremXVxOQ3w5oi5Fcc3fk3m6ACS327y8lu8td+rNtZtJgT1KyOxBnk35IIv
 CGG9yTU30dBQsbPS/2S/3ctUSGCvRUPxTayGF5lSY3tj9vY9hiRSVfcDWGn8vzhw5Y/cM72uSKv
 VMUC/bzx4ULHGhzz78qgt8kqKCig0Z7YCfgPhJeRIfHCg/hYLjkQ0RJQA6ktwgYaQ+9eeTPklp7
 BVY08KdNuh2u7196e8Y75pSb2hh+oQa48I3SCh0N6bYzd1boJCnHmWU9/2a1UageRnQh26UNJ2f
 PRBQmkIIp0utj71GCYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090057

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

