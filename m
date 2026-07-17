Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D7A3A1A55
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784321339; cv=none; b=LI0DkaYT+0SiAkr6MzQcVqEfYaGUaTdDCIiUbFoSvCWH4h6UQKD9DyiCAFquaRbw9HJ96nGSGXKhbAbD9r4UDkeRm6rg8jsv/aGXEBwmR+HNNJUah92B63MZvpy6bY3PofFPe0zKfOC7NOqaTmP1u+Wy0rJ/m9J62V8OqYdQO00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784321339; c=relaxed/simple;
	bh=/3bqSJFB87g3YyDDP7AkU7aDRmxHIev5pH2eJsJSsIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BwQ2vn9NrhdzLrdNEAgUMUql1RimwfUpWilpi3NLxhCLXJ5Dpp3v52l9dvUVtGoBcFFLIWk0XgFUjF9eUYkI9Vt+8lzmXg8Kd3Ajqu8VBmt2kLBH23RI8sZNYvNAzGhCBRDr7X1c1f/P9x8GDLHsVgu5VwdRLX/M1zctGZVpySk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E22jaByj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SzS7ACmw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E22jaByj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SzS7ACmw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtZjF2780289
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:48:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CCt/FUCHkSx
	E63Ah7s7mIN0CuS0Ln8VYXya9PKCt1vg=; b=E22jaByjasWkOCk0HKNaWi8ncn8
	1DRpNa25wDeziZu9H9KRtnJ1///s2FpxAXj3JfXjJDgxRYQWlJrKORdbU3LEGTwc
	qiGvO6YS2F3MjMYvaHhTqR1B0nZ2lCYwXSwnKt/EKOYhUQTE0aH7SYcfXq3lUoph
	qGqMlx64rXDCsulGTHwkcGpyxtIZjaBXHZscUHYCStGCexh22jwMqmY2/LhNtik0
	+bQRSf53ffUzUAVEKfNtc4j+9sXIxtU14tK3GfhMNr2FrYXUWBAKM/AOSO9wNNzq
	VA3Z2tYkAXv6ySiQeO4h29WZckGhCn1Qe+oU0soOa/NnjVbtJqrtptYZeXg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9gua4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:48:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cf27789c79so23977975ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 13:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784321332; x=1784926132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CCt/FUCHkSxE63Ah7s7mIN0CuS0Ln8VYXya9PKCt1vg=;
        b=SzS7ACmwjTqTywWrgDiTFQJhphdMc6sIMWW/k47EZDFe6V1UY6bGh0ppMVfScvtJ6O
         QzCcR3kN2ZBDg9ZCJUWUSYzpSDMxZLn4snIYavrNpi+/ikjcUNMG+9zz/VqeQTj09FoX
         fv8Iu/1BCMQh82SMDzSHStoMcp45KHYFJ5jSDNZonKyVWTbsgHLA2itfojxKlc/alMHu
         U/qYBdvgE+5ltiqbvygraPwFRnIluZO1hdO9Wl7eIQRlev1Hlo+7rqChY+ZWk4NOuEJG
         Hw3cJ9p8PoMVaoKJT49uUFMHowlOjryiL9Ovk7EQ107vKqe0fl7ytxQXXHJgwUFA6FiD
         MAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784321332; x=1784926132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CCt/FUCHkSxE63Ah7s7mIN0CuS0Ln8VYXya9PKCt1vg=;
        b=gLtkYKOgK2kni2oYii1hJKY9JbZwb7hfRtixb7jSdee6DabKPqSZn4j1EFakoxJ4Cg
         Kn3D1fVy7M4O3hKp+kLLa77CosJ4QcnrZlsvSxOVERfhtZsRCl3fjS72dwMLMo4LRhcR
         /pGwe72Uec2+raGnfhvvxIZvFFDF0NC2o22ysyTIARc1iq94I6rVcaZ5Zm8luV25V1NY
         x8vwhT26frqkMm62ATdMgYtYz67IqWPhUflsP8fepZ3qlkkJ1atNbsnOixqj6kHLXNxt
         +e5TWZ99HBdjkuOmB2hHp5yig8apa1rubUQkY6ZRfrWP1vMu+0lCdca8UoS3KknP7vR0
         V9oA==
X-Gm-Message-State: AOJu0Yx7AvKGqfrHWhu3kYL3T5/3MDi63J1LYLFI8oSCNsCYSgVHku1D
	zZAQk9fcF+n75WmBb9A1aGDwZZEA7M1phum2HHo7PWjEfWG+gIOTz5tW8ydbfZgIqfp2tcaKUIn
	ObVBPStvNj4tED1hOOE9yRmHOBYLoac3OGBOSgCsc28OiePDEccOxU/9aWnk8ZdCEB/js
X-Gm-Gg: AfdE7clowqb1YgyAGTrTo6e5dvhRO+8XG+hMMptEtT8UsBt2/Ar+JrE6ekc5/2R0/bW
	8Yg7Gi2RRSBkBDDFagwJt43zjS3pKs8x3fIkqXCm2314Z8w2nEmFIx2JSMyb+2IajXKCrRYct2Y
	XMIewEno1/Kd0hSpULDoKRGdqj7QgHg9r3/OIIBK3rkB9WKRc2pgeeeFEl++Sg/zSETvWDpPhb7
	JrJPu1yCGmqrbJ+CN6K0qgkX7Z5VK977eAXVTRoUQ1QvFN1xCR4Xjzk9AXGwfAwtrTizIBYZ5iY
	LeedBxoJl3IwDkqcVBcI3gvgtEo+H2Lyz6cKkGrtV9nvAD+294SvucQd6L142TTXFU7iGhxO9Jg
	36lTDDTCaSnCG+DkmU8X73b8PkBGfWtJJslr8D5MYYlHQMMQ=
X-Received: by 2002:a17:903:324e:b0:2ca:6514:9201 with SMTP id d9443c01a7336-2cf3486f1ffmr48129505ad.15.1784321332361;
        Fri, 17 Jul 2026 13:48:52 -0700 (PDT)
X-Received: by 2002:a17:903:324e:b0:2ca:6514:9201 with SMTP id d9443c01a7336-2cf3486f1ffmr48129295ad.15.1784321331921;
        Fri, 17 Jul 2026 13:48:51 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf34713fe1sm16812945ad.55.2026.07.17.13.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:48:51 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 02/16] drm/msm: Rework queuelock
Date: Fri, 17 Jul 2026 13:48:18 -0700
Message-ID: <20260717204841.26120-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717204841.26120-1-robin.clark@oss.qualcomm.com>
References: <20260717204841.26120-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfX6iUBXS+Yf4b6
 rTeQagS2eQVroFVOBoa0DQ/5CGQkc69hjfqfLkwuNFhZ2AAEtJdRMEE6npEvlI1lRnTdXjD4KHZ
 UtllqFVprOl1zSXPsyIhHVDLTY0WMJk=
X-Proofpoint-ORIG-GUID: M0hp6MvxF1JxNxU_L9gNBBX2F_kChvqp
X-Proofpoint-GUID: M0hp6MvxF1JxNxU_L9gNBBX2F_kChvqp
X-Authority-Analysis: v=2.4 cv=TaumcxQh c=1 sm=1 tr=0 ts=6a5a9535 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=2F56w5eUDQPWH_qpgLoA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfXxj6e/y0pmR/w
 WwgcO7U3YipOajSmbnHkVNPsaX2yzG8kbCPSVOMycpwoX4GHk09vGzF9owBvfxLy6jIZQQ74tA7
 lEAeZIkAw7EbY/JG7wik3wSGoEEuGoop34KnKlrZjy9M6yI7RuX8j7vqOExIEX1o3hj/cMp8MsY
 sy46ssuLGKj/JIrP/I0UVXEonPQVjpbkFXI2ovDr/zBrRBupiBVU6Ml8znn8UdyS1sRDS5sPBzM
 Dk1Dz5WJlGkoMwj8gh2vqcM24JL2QcP0ykhPS18M7ThQ0twnSrR6b2upD1t1uX3yGPhqpumGz25
 PI8aawrnXNM1Kf9+VJwUWP+QZfDaF2bx3N+SYvxIol2a0ZT92HytG97MNvXNivl+e2wBQE8nJ8t
 oCDo2GlZUAkFTPp6iSY1L4t/5kgj+4TGSwrLXURxcwAgI39jZ9YWLA2ttmRqyc2nMRHeg9TnHgk
 r6b8RKBHVmDyywvncYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170214

Rename to ctxlock, and use cleanup guards to manage releasing the lock.
This will let us re-use it for other per-context read/write serial-
ization, such as VM creation.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c         |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h         |  4 ++--
 drivers/gpu/drm/msm/msm_submitqueue.c | 14 +++-----------
 3 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index ec88155e0ed7..384f32f4d0c2 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -251,7 +251,7 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
 		return -ENOMEM;
 
 	INIT_LIST_HEAD(&ctx->submitqueues);
-	rwlock_init(&ctx->queuelock);
+	init_rwsem(&ctx->ctxlock);
 
 	kref_init(&ctx->ref);
 	msm_submitqueue_init(dev, ctx);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 6c83b8cbbb90..d27d54bdb7a7 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -392,8 +392,8 @@ msm_gpu_sysprof_no_ifpc(struct msm_gpu *gpu)
  * struct msm_context - per-drm_file context
  */
 struct msm_context {
-	/** @queuelock: synchronizes access to submitqueues list */
-	rwlock_t queuelock;
+	/** @ctxlock: synchronizes access to submitqueues list, etc */
+	struct rw_semaphore ctxlock;
 	/** @submitqueues: list of &msm_gpu_submitqueue created by userspace */
 	struct list_head submitqueues;
 	/**
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 1a5a77b28016..8b5980d5a6a7 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -93,18 +93,15 @@ struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_context *ctx,
 	if (!ctx)
 		return NULL;
 
-	read_lock(&ctx->queuelock);
+	guard(rwsem_read)(&ctx->ctxlock);
 
 	list_for_each_entry(entry, &ctx->submitqueues, node) {
 		if (entry->id == id) {
 			kref_get(&entry->ref);
-			read_unlock(&ctx->queuelock);
-
 			return entry;
 		}
 	}
 
-	read_unlock(&ctx->queuelock);
 	return NULL;
 }
 
@@ -237,7 +234,7 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_context *ctx,
 		return ret;
 	}
 
-	write_lock(&ctx->queuelock);
+	guard(rwsem_write)(&ctx->ctxlock);
 
 	queue->ctx = msm_context_get(ctx);
 	queue->id = ctx->queueid++;
@@ -251,8 +248,6 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_context *ctx,
 
 	list_add_tail(&queue->node, &ctx->submitqueues);
 
-	write_unlock(&ctx->queuelock);
-
 	return 0;
 }
 
@@ -335,19 +330,16 @@ int msm_submitqueue_remove(struct msm_context *ctx, u32 id)
 	if (!id)
 		return -ENOENT;
 
-	write_lock(&ctx->queuelock);
+	guard(rwsem_write)(&ctx->ctxlock);
 
 	list_for_each_entry(entry, &ctx->submitqueues, node) {
 		if (entry->id == id) {
 			list_del(&entry->node);
-			write_unlock(&ctx->queuelock);
-
 			msm_submitqueue_put(entry);
 			return 0;
 		}
 	}
 
-	write_unlock(&ctx->queuelock);
 	return -ENOENT;
 }
 
-- 
2.55.0

