Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234084;
	b=F5TqR+2HQkTtQsGm3guQwohYu3gPOdtp6uMZejEbhYxVDAkudQecuGiwIA8trx8xoXG4
	 GH2R1L7fr57wVfFYiqssqmSKucGUZCQkcNT3u+qpiV3gloUim6RgVIdr7rrrjiJklP7+R
	 bUJhsJmlmnT/4Jo9el55T7a8SNWtwieKCfjmClgfM72aW6IJl6wdLLIa84fZ5sEOAU9+X
	 jlpyfHJB7+6Eau4M2xUtJby8YG5lYXRqDsN9G3WiSbNytJKnlQypbicsF2hXSA/Pp06bN
	 C/5Zz9pquIYMXRNoJcogidx3oz86hbPW97aEjrTMqiz05zG6eNEwEM947C0RL7CSovw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234084;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UkojfpaA9ZyAFiSTVcPjf36KuXa9Qn7YPnWuS93EhrM=;
	b=CfqZHG4mR55kk5c4YrTvJ9NEWyVXVTP09yDhwGH5FFfvky6hVZY6EsYgspYNw2fLTQga
	 +BWT7O19Ip9TD06vBspq5x3pPr7ZuL62TxlVbyUCKZ99QwQc5a3hckCmu5oFwUJ6ZSasq
	 7JDrcdYAAkOVNwivpeIhz6ms23lur10Bzv+XcUXgB0cHSw5vk+YCFpRrcDLXzAK3k2NVv
	 OHEdA0Y2B161o9KN8pY56rSLTdifPU7nSCq2xByjqUiFVt2k/mjLDUnxnYUwU7dxp4tdo
	 5TWBaF2yhdUc38JfersxncHUyD1t0KbMGyT50gOjwR9YE0BWnpH39GjovAIyHUWiWug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vu51Ux2+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PAps2IXT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3226C606D80E
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 14:21:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3226C606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vu51Ux2+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PAps2IXT
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFJiQ971483
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 14:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UkojfpaA9Zy
	AFiSTVcPjf36KuXa9Qn7YPnWuS93EhrM=; b=Vu51Ux2+uDtwzBI7/p2hX9bsCg4
	v2zieU8iVdowAYsmoDUbFQQYMIVn67ifdcF/hTUerCCxz0wMuBx1pXGtOo9UaC4O
	0FL+QnuBCCIAAOA839qVRQ7yGWKVMty/VnqB3Kugk+qE7uysfLLUIon8XFQfARY2
	ae75GpWpIKURNhO/etQ8q0Lv8xkvHUx1HcmCrPgcLsQfjB5ja9MDY9W4uxCc2QJy
	m+N7F6jyHtRm+8QMLIr+PD5OJuu7Syvz76vfPdaYZMo6USl66PUPHlKHtNabqqHr
	08M9mXut6IoljmxJcdCaZU6oK2WBJE6PCw1WAvzLsenhjkqIyZirjtQlBTg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm3h3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 14:21:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ea63087d79so8311545ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 06:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794234082; x=1794838882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UkojfpaA9ZyAFiSTVcPjf36KuXa9Qn7YPnWuS93EhrM=;
        b=PAps2IXTMw8wAXFEQYimgAullHXaWbUISTqUPAjCsTKPq2IhNDqvmc45H62574xH4z
         prGfJBK8wbGYUKCy81c5R61XmBsQtjiyHiYe9uiaXFxTS4qlLYRcgaGFnyfQbvlXemWD
         A0Z85RNW/2Vj60N68mAcx9um3jMehgt5KS5hLdBrSBtT2MYbW/e2LVnz0CI8aWJhYfhO
         3G6rtK3SxSYNoQDqobzQpa4u8SSEP84wORLF7+8fy1O2RItGe8v9vuSDxC7JONQRy6hJ
         XH70lHn58XJjqj9becaGOTmnyxICdZy8txll7urPH7BXKuRO8aV9rytcmWh2Pl7D40jx
         L+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234082; x=1794838882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UkojfpaA9ZyAFiSTVcPjf36KuXa9Qn7YPnWuS93EhrM=;
        b=sbM53kZ2W9eskRdokg6lKP+uL7Xch5cZJQGzIrKQxekDXFJxNDi0hXWs9Lm72pr/1U
         fKfA6wxwHDYPjIHmAyagr8StHlj476b9MN9QGBHxEZtUtuYcndEedFSkNRK9HYlK/csl
         RQkLxrIybVDM9P+G3ycfNrGiFJI5RW/vVk33+GXB+k/dhUdhFlPC7q5XLo4lBm8MUQdV
         L85CdsdcJRhiajJdXqE0WMQBBmjy8eCy1ISKO/+i6Lbpg7frE60ErFHPFoNYl7uL4GBB
         3RLyX1qtkgBumAjX8OjKxu36unpa1921GFpMtVLHYzIgSr7sSdxQuqFe21MqjkrE1tSV
         5d+w==
X-Gm-Message-State: APuU4Z+95CICt1uC8Xl3pzGqFX21NTaE3wMH6/j7xgR/Txj91jZ7cvU6
	m/qWx3qamxf7upsEzlB4fEXZMUR3r1zGn3vZsGyNcWU8X4vELjH8WasggAue5xyn2OvAnGpIZeU
	QOWz/gjxIq+3wsPH5BVA0B2CRNchG6A1o7Vrjfz3LZ7H+BFKyZ3XMpgF/PG4RN/mtMUUC
X-Gm-Gg: AYBFou0Db3FdXi2In3SZEOd66oVeqlNoeYkZGXtqRSi/TwAae1Zfijx3rmXamWxXWw9
	6ruDv6R+yt3zWMZt0KVHGxnrE/rH4FD6vxKyu8T0jMMh2SH/sAQICe4JbHCJ0dSVYrWuhZ5G10F
	rN2XeKRNODXwbKYUijM4Vv293khwYrn+YK702BeUdB/onDd1SwhoLYf/OILTqWs4CJ3A4fxPr96
	Uk/3Om9zM8BeqO1kBiFHiq7ieoO+iBkHNm7kcR7yaGuLsZjXxDg/Un95zKsLMkY1K/0uwNbbJv4
	ble6VPNcafG9lEEb+e+9fZI8g12jfSfVmT2TE95XJWlJN34KO+aU3Ge9bpvAeE1NPPUIOUtGmh9
	SX+/n+h5n1Zivz5qI7feK1hUiFEW/hv9ZHtkqrJKgXiZtgQQFnKbGh45uSjM7D2lYWKjoSBT2qg
	bBqPzvgq46Jii/nnxM6IP/p854CW3Q0Z0lzzt4ozg4ISGYy5bAhlDbFsUI1pCyiQ==
X-Received: by 2002:a17:903:1107:b0:2ed:74a:6724 with SMTP id d9443c01a7336-2ed83776ebcmr40062275ad.43.1794234082055;
        Mon, 09 Nov 2026 06:21:22 -0800 (PST)
X-Received: by 2002:a17:903:1107:b0:2ed:74a:6724 with SMTP id d9443c01a7336-2ed83776ebcmr40061805ad.43.1794234081551;
        Mon, 09 Nov 2026 06:21:21 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81711bccsm12019975ad.49.2026.11.09.06.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:21:20 -0800 (PST)
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
Subject: [PATCH v8 02/15] drm/msm/a8xx: Export aperture helpers
Date: Mon,  9 Nov 2026 06:19:48 -0800
Message-ID: <20261109142111.256630-3-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX1nm8ZxuApZaG
 B8Gy6UXsgQ+dbVwtGSUAtUKZ3tRClIF99KxO2hcTjG5OMHo/gsfH3mWEevi6muF5Jg6ZdV+wFNT
 hgAl4XKx4LnimQ6QYgNhzx/vwTqgBI4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfXx0pt7LeNpsIa
 0r9CxuPKHCvnBoi3EppqOo3r9Uzv9vNtuwDYIjBMji3xzeceBWHZMcJjmAilXYtA+lnB11WFH2G
 siaNaiNh8/bZbno5oLp8F7T2UGmQV8sGCjj9k8S2f21DymN8j7XwXbbtEMhLiGmhbmDm7863hoU
 hotYGDEoPeTsqtg+QmQADcsjflS3KAVdVOJUHZcrH4Q8AsytXnQZ3pzp8fvp31cNIdI129At3XN
 1O/wnb83YRWqQQqAfRUVarEUx8YuXj7HBgwdKjaNUMjF8VR742687zsIuAeCZXIPJjioPisjHdF
 /udnoE12lSSHGDERGnU5kZlalRtyUgdSYoWCqv6doR75XUnwHTvTN01WT44TvFrY2vFO2EsTomm
 2FGOdd7/GlN1sSyv980fpgxYyxFoflJdKYsu6Vp0kFsxqM89b4FZz8xePrigIJmJLO3H8z5P93/
 T2x4Gj4D9tbdeNssLxA==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af1d6e3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=58qa3DtRz-ucCGMA3goA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: JyFaS7pdF60om2ud2XY4B4Xd17ehjArw
X-Proofpoint-ORIG-GUID: JyFaS7pdF60om2ud2XY4B4Xd17ehjArw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090057

We'll need these from gen8 gpu state snapshot code as well.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
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

