Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3643D3D19
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 17:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785087742; cv=none; b=C2uOChqRas6UVy1DHr6gov8FFhmSscVP2K8fFM3Ht/LsIQrIzMsCc4/LPhYsVnF4bLzH7keAcxvN8sVizZWccgql4bU9BIMDukkJfP/VVCfIi7V2dbzNDO6ROsLcYciW9tS0dmawloMcQaaXMVnFE5UPC0xw25zcQSn8hkTqHaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785087742; c=relaxed/simple;
	bh=h1J16PX63cY5pUBRousNLZRn+xYBPiSHTzAYNx87hxs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JM3L+6a7YldFZKdBuisKk2lYRV4R+J+2NQ75szApELUTmlBcKsLTzBH8Xo/imigrAtQJ7iM4wXKOXligGSQTARuPprfX37G9Ey7CURSB0KI5Mw/Bwjfg3/UMY/H1H0W9kT1QuA7R7FJKtwkInmrKMIFVsiIfQN6EJuDpKrhyFqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CHqZkwqX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BLjptd6y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CHqZkwqX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BLjptd6y"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH70w11365895
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 17:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=32ndNKoIIBfpE9rKN4fEjl6l42verNKmtqE
	RKmiEtak=; b=CHqZkwqXtv8aRUbcLlw/rtKXB6QWcNTHGfRK8Nwon5awbbZfH/D
	YxLSc9yp1298T3XJUDRXWI75QltiHq3YBW2bWwzQOvTSHvyxfe60ayiEJwLrGDMx
	/x9IjapOGMLqVaWpL+eWK6WSVZJs9GpgxdaV6vsDFkh0ZsRwBkSlXCEsGc3BWBL3
	fuavPLajed2zLYV0fdtjt5D8lC6X/DHGSGiqMTR1zhZbInz9yPFtZimnVjjUw0bO
	zYjkeIfuqXueteY2wLez5EesG0Nfl4NZyP1vrDfwJl2i2y+xcp39b1mlAoGGiPr9
	QcXAqiAx2moyn8nyYn7lTa1jlUUjqamMfjg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmmqybg8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 17:42:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cce870a060so37368125ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 10:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785087738; x=1785692538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=32ndNKoIIBfpE9rKN4fEjl6l42verNKmtqERKmiEtak=;
        b=BLjptd6yBVy/h9tc+agSWbkhK+RV9KgzQYrxTBsPoEQdYQkC+20cPytqspPoNCOrUp
         g9qPWdHuBYvxKQFoGiSazeOCfL2mrMh4JGPU5rs8/i37H9UfO6hSfPd7OtWwxO2w9n2Q
         x5LMmTW0pklPiULQ3kAWc8j08kFjvF4iboNZ2hH/KmAJoLiioHaP4RQXqT5DYF1eO/Bw
         c8+kvJpxzhrhLZJejOPNIew4bttUNaS2Du7kbu9/ABUzjRkOBpoeprhVf/BS9mDMf/0Y
         koULqM6eDN14oBOtoeDFs9BD9E1e+zuH8WBZ6eBWR++1gog7KjqypR34tyO7wTcO9PGl
         rTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785087738; x=1785692538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=32ndNKoIIBfpE9rKN4fEjl6l42verNKmtqERKmiEtak=;
        b=JM+m4GglRdAgdJ37Mp8PeFJfFLOdMuou6qE56WoRexZGICo1xRiv8fwYghLCslcIDD
         SkrWNHxWMjm9i1sr3gNYdbHgnts7jgkUkovMK8sI4mDbmJBS9JTDB9MRqKErx8tSDoWm
         BpYDCTsj/EOBoHU5ePHp+ELPGbP+1uOM/cHs7dm+TgaH91BLWVR20RLZaHRQSHRxNnwb
         wN08p7ZjJShk7Iz/OA4u5Kkj9dYwSXwC3S+BRuyIImNNZeBiThVq0IcBmb/M2CazAO5y
         oCBIioHOINN98lPJooVeRLK4G7tkgXpLUmXjfsbY2c0CI7yyE4iv3Y325fiktrD5Ji+E
         /STg==
X-Gm-Message-State: AOJu0YxsKX4df9iLoaUjExDZ5h8fLzcILdi4MvTaeCrAYGof05SIZ02o
	EmPGOip8+0BQgYqNwygw0SnHgQgmoCgF2sx3ubtCXeMPesGfyxmilVmH3gk//z9V3h7NGxeyJVj
	Um1Y5IJt/Eegmc44HmBhqOUBGs1qRMHK3RdaLLDHxEkytlLpAZIDpjPTjJMMTVxeRP5NJ
X-Gm-Gg: AR+sD112gJwSFg2GJkn/sVl3QPlMMPFWYmukVhGnSU9Iu8K1Q5X9/3q+YsBURDu+jjY
	+/iqJjH5eyCuz6PXoFTMaWopp980xRd67aAfJp3J+ZqSVtfUa2L2aW1RB9i89tkRwScwJD/Pzl/
	8o34rWvBh8YkAAGes3+IrMSgxN8s6coVD3IkNMsKMlABDXH8RCjFEjEu45T/4Mvwyf7PqIhChFq
	qWvyqSq/kn9o4TO35w02dbPQLTpqU/30ZMx8RRT0Vg4d0MsUmrO1i/cgELJ5S8HcjKRtzxqhMTn
	FVi1GRN9wCaO0PXLkp5WW3jLyJKa4Z2Y3Xfz8CXUpqFB0m8SITALklb1NLVVUjFJ2zBG3M5DCMe
	1vPdnBI1j+f3aR8X6SS9YDaAqAoyt0iQSFURo4QVZEEY5bec=
X-Received: by 2002:a17:903:1b04:b0:2c9:e9db:8167 with SMTP id d9443c01a7336-2cfde687960mr58654925ad.7.1785087738379;
        Sun, 26 Jul 2026 10:42:18 -0700 (PDT)
X-Received: by 2002:a17:903:1b04:b0:2c9:e9db:8167 with SMTP id d9443c01a7336-2cfde687960mr58654755ad.7.1785087737950;
        Sun, 26 Jul 2026 10:42:17 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59bb35sm22132575ad.12.2026.07.26.10.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 10:42:17 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Preemption timeout should be greater than hangcheck
Date: Sun, 26 Jul 2026 10:42:14 -0700
Message-ID: <20260726174215.30010-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7MEoJQG7cVDwY3o3C6FKdYhA-Gjn3qXv
X-Authority-Analysis: v=2.4 cv=drbrzVg4 c=1 sm=1 tr=0 ts=6a6646fb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=kY0UhyPtxVYDNi2XS4QA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 7MEoJQG7cVDwY3o3C6FKdYhA-Gjn3qXv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfX+HMNBugipdje
 HXV0nSfxVVY6dm5sKSTEJfLgqii9yia7RDOr8h9Lkv0gu3JHT7E463Zh38WpmitA7Fp6yNNbjGP
 HEy+eM+srwq8CPyS6AE72RDyo3PZGkL3y49iTs+bcwvL/nzCYmn4/Yt2hpTf9HKlKobpR+BEpoG
 jvaYywZdLVkxkU8vc1NxHumc4GSWVPz5XQ7quRd+Q16mrWkoSVI3cHh019rzHFjwYDBkqGvBk/J
 f5kABAphCK+bGgsdai0PWjgr/4inktw/LIq35IwpPTCw1by4vO6fDqKkJl4N4flHVF7Qp+O+xCI
 Z5ysLW2hshiemimBHgLE/xqMxbg7vaZu9wHadvh5czRJGgk1Gs5oVuP9rdZfOH8r2nQIQO4sLzh
 TpgfD71i2zj4IzRAWHcSCTOmEhZWVN06QIZL6rvbJooHIxC4oCxTNbheCYMipgQ1UPlEaVzNofk
 iIug8oOdrHOliG+s0Kg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfX8gJSyh7MpL5Z
 K1/Yl2oTJRn3WnHIZCBFybMmkDVYp/A4IsMsf+kibBBBzcEE3OPprE5jyQ577DfLqb2ZnGn7/vw
 MEGl2Gk8iUWnv0ReC3Rr44eGpPsT/dg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607260179

Long running jobs may not necessarily be able to preempt at a fine
enough granularity.  The hard-coded preempt timeout would otherwise
kick in and kill the job even if we haven't reached the hangcheck
timeout otherwise.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 2 +-
 drivers/gpu/drm/msm/adreno/a6xx_preempt.h | 8 ++++++++
 drivers/gpu/drm/msm/adreno/a8xx_preempt.c | 2 +-
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index 1e599d4ddea1..00c239451c7b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -258,7 +258,7 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
 	a6xx_gpu->next_ring = ring;
 
 	/* Start a timer to catch a stuck preemption */
-	mod_timer(&a6xx_gpu->preempt_timer, jiffies + msecs_to_jiffies(10000));
+	set_preempt_timer(a6xx_gpu);
 
 	/* Enable or disable postamble as needed */
 	sysprof = msm_gpu_sysprof_no_perfcntr_zap(gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.h b/drivers/gpu/drm/msm/adreno/a6xx_preempt.h
index df36c945b836..178017aad26e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.h
@@ -35,6 +35,14 @@ static inline void set_preempt_state(struct a6xx_gpu *gpu,
 	smp_mb__after_atomic();
 }
 
+static inline void set_preempt_timer(struct a6xx_gpu *gpu)
+{
+	struct msm_drm_private *priv = gpu->base.base.dev->dev_private;
+	unsigned t = max(10000, priv->hangcheck_period);
+
+	mod_timer(&gpu->preempt_timer, jiffies + msecs_to_jiffies(t));
+}
+
 /* Write the most recent wptr for the given ring into the hardware */
 static inline void update_wptr(struct a6xx_gpu *a6xx_gpu, struct msm_ringbuffer *ring)
 {
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_preempt.c b/drivers/gpu/drm/msm/adreno/a8xx_preempt.c
index 6cb53a071801..c94f99625ea8 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_preempt.c
@@ -239,7 +239,7 @@ void a8xx_preempt_trigger(struct msm_gpu *gpu)
 	a6xx_gpu->next_ring = ring;
 
 	/* Start a timer to catch a stuck preemption */
-	mod_timer(&a6xx_gpu->preempt_timer, jiffies + msecs_to_jiffies(10000));
+	set_preempt_timer(a6xx_gpu);
 
 	/* Enable or disable postamble as needed */
 	sysprof = msm_gpu_sysprof_no_perfcntr_zap(gpu);
-- 
2.55.0

