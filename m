Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142315;
	b=EUfI3MqCkzqkw7ujwxLFe1sc+hDvVZRz6T0YRjYc5f6i1VoPxWhy5nZ/Hmw0z2ZsZ6aJ
	 MpFH3dLB9xmlOEuwhRVCQrNRR+2wEI5sLatd/x1lZhBcU0HYB/0be1DP5RNa+YM5g4fcg
	 kY/5F/FerX595oyWm1n+4MRIrFzQhGpvzxGPJq7QEZuveqmXme9+lpH4nlVtzzJlx4mdq
	 XvIlPdVoEwD9qgrOSlE5zw7mxUxiDgyAaZaYutj6WGuKWhJKEYc9G8feJEG6S9vVJcpG+
	 5SmRNZzgJp7VRiWNpn/EEmvhARGkcjs6zFOBg65aqJEvH2/L/IDcZOEHJrRX+kEu3yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142315;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gKkjkgB2AruFPzmA+c9ZwhBgEoivlZ/rVWs+sgjcVJs=;
	b=RJ+dpJ79zfim9Nta8GKAqgUv4AGtMnAwrOKgbexFJdstd+Sy16gW4KWZa0aFTKU/Otfx
	 ueS/MRlMy6fSWCjiQJsQgMMWYHjYz7BbB0tY9EtErgtwRzaSp037Bb+IGcZaDboIdXvye
	 C5ysfA0BACi8opkt+3iIyGtI8vv23Z+uUonFVekSYA7/9Bv+EnVqo5CdtbgLO1JBU1fCp
	 jc4FSyiOadFTnqXxwH/UOaD0PMe6vbR0HIfPtu9NeNmq6YbeBSEE3QZwP7G80+CaeJ4XZ
	 WeHMMDt6dSgfDzlxJTrdcVCVL91VRB+5q3SV+zWQNRAt6hd7geJtmReu8WUM1pjgUIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AnRznZxN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hc0OdZuQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA56606A321
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 23:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CA56606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AnRznZxN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hc0OdZuQ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RKtC2c3285034
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 23:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gKkjkgB2Aru
	FPzmA+c9ZwhBgEoivlZ/rVWs+sgjcVJs=; b=AnRznZxNycvJ4dxw8dFlVWa8Y1/
	wppsIPRcRt38SUH92I1ZMuNlzFga75v37N94iFKuewD4YHqr66fafeHtIp/XSDoj
	sSNmZkpSOK52WL13C8riAfNQhMv0PHg/LqL2uXg80ZY7lexfL7nmzuV1S36htNVL
	wOSxpk7ym3XHdJQ3N1D1yFDGTEq5FQmieBvy7/+qRKi4Jv6Y9ghht86zRrR4BqYl
	DcfrUNUiwBjuhv1gKRujDXqI7vXlPFc96PFhMurrV1PPav2/HYnQtG9QsoUQbHHe
	NjH5GavirKe55+KhdKOuBKDmkdTzEdo6ENJBbrJ5Gj/8+jlSKWVBfJ5dZlw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq6bbeu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 23:05:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab7f1efe5dso544819a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 16:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793142313; x=1793747113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gKkjkgB2AruFPzmA+c9ZwhBgEoivlZ/rVWs+sgjcVJs=;
        b=Hc0OdZuQF1dhGYUxIGhTIrYBgwnDcqlxjVzYfB2X5nQiSTF4seQ7mN5yk2vs6t4vGH
         27NnuLjiL1hRWufZ0Hn0pebCz3wx57/KXhir1CDvUzPz6X9mttIOXCcmJkOjuF0FPRkg
         KEo8XlB3Zwe6UYxOiXA1HK7GD895GTfjJj7ElB9xQq7kJBgNX9xhTGnnZBHbifVC/TLc
         HZ5YHNKHD+ZmWYwhcmcmJ4No5VPyRSyIGkHIPyoULkaXxteDut39J8PdGNSB3zZ/EJAJ
         ZzsbkjhlnnqOpA9i95TzcMDKvHOCDLNcK2CFfk/bo0l9+U9Cki7wu71xR4kRzg9zX6MH
         93cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142313; x=1793747113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gKkjkgB2AruFPzmA+c9ZwhBgEoivlZ/rVWs+sgjcVJs=;
        b=NAeGa0QQOnUASkWNrtRQPf5sIay0cVgNJ/clI4MHTjhwPaB2zbP6mXjTn1JKGuquPH
         nlWDS2ISZaM2M+hOopwLvtATOvPejCkfBm5M80BZ20aWWRBgmfeAwMi/28Y2adL0n81E
         vQIelu6qosa0v/AMQPTp/XtnEvQkecaoBjKelQxtFa1H+Jpmri4Rs4L729jHYnDc5Iyn
         idQa1jW6vfl6/IwjqDummALttrqhxNWEKaJRA/kdYBBP+O5E6nrMYXZDvY3b1DBGjJla
         jgQqquLJJijTs4yVI2UrqlU9ahrUbq1f/3XFMo+4jUBtNuo5UiV7eQlAaQrdbyKMgcGE
         OyjA==
X-Gm-Message-State: AFq9FYLQgmxiV0TNuaCayadoeWJgJyNKR044aI9crveV6U05+jr/olEG
	26t0d4UbuHfc5u5BRlsseCTBdWzJWuSI3Ryx/PSbxpL8z8KVq6uplc/Xe6A4xN9PndiUKTe1AV5
	CvzgGJrl02V2OeQEvRrjAsMNIctX43VQtpP+lKf7ufni/Cq3nbtcKtkG0c1QjctucXGNn
X-Gm-Gg: AYBFou3Tj9x0OX8xCVT43he7WOR8YWtZFbfOgSozzzm2e5jA9Q9RKEP5tuirzdIQuzu
	8wguiKVZURzdI/dE3HlarG7ZBOsVxiN7dIS33ygsQl+qww2ZPieoq8hVjwxQrUktxMctNdWkdqn
	ZvwSbYTN3E36URXiTKVcMLhynbrUfd85QVnRlSkx1k1PBWQ8eAlh+79vWipbOSRDJTPJ959L7eT
	5U9HJBh10wp8t6bYLRPxK+xdwVoeLzaPgX8JsOucKyaV3Lzuiy0szkqMHAbDPn3AuyooMxGF9Pg
	JrawHTyffsgmSAEMzXB/ey1l3q0atwLTznPE6P1eCakDRbfBPfAykFlCX/kBa+6nnuIG43Qd4WP
	Ch/XucmlhAoO8h3bzTwhpCLzzxbw+U9HbZySRuLRuYVDL7q+c+A==
X-Received: by 2002:a17:90a:ec84:b0:39e:6a80:b799 with SMTP id 98e67ed59e1d1-3ae5829a339mr404927a91.41.1793142313035;
        Tue, 27 Oct 2026 16:05:13 -0700 (PDT)
X-Received: by 2002:a17:90a:ec84:b0:39e:6a80:b799 with SMTP id 98e67ed59e1d1-3ae5829a339mr404892a91.41.1793142312536;
        Tue, 27 Oct 2026 16:05:12 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a9a5e81sm220719a91.12.2026.10.27.16.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:05:12 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 2/6] drm/msm/gem: dma_map/unmap_sgtable()
Date: Tue, 27 Oct 2026 16:04:45 -0700
Message-ID: <20261027230452.130031-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027230452.130031-1-robin.clark@oss.qualcomm.com>
References: <20261027230452.130031-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae12e2a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=urFl2zf4nAXEHr-h338A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: YA20q4b9CwS3wvAjDpU_1iiZ-tB5HKX2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA5MyBTYWx0ZWRfX0c+lvt0EfC4W
 FxeJm+DyAXsEdvHFWdvazTxH3hHJ1yPARFnycBInGc1h42lv8LtODlXbLMoaWL1r4mPFbtLDcj2
 rMFubFvoLGu1lZrPIVHBlA61HK0gYRo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA5MyBTYWx0ZWRfX2Y/1BhC+SUOH
 uK4XidsThTBdhLHtXXm7haAdFWsMtcQeN7Jo5Wtoqjf4iFCYbDr046Txpi3zBqamea6JW8Nzmrp
 iIqc8Bm2Owaii4LeoHrCHO2OkHwwVsaGyJv1DvKB/4oQdZtkYKObfjI3Rzuh2vtI2en22M8DqYp
 OB+WYtQOCFLMdZrf+JpLjt70oz/OsaZG8r84dCvHZp2htFmbJ0QxZBUgMvvczFqhsaZKaDt6NPm
 BeM4fQgEKeC9zDHDdxfXxxCyGcNZ+sGAaoqbsmR//IMxaQCNxalgYi6ofVmzYTuGEBxyZjESd5p
 wGnA9FZcLc4HVYI1C68bUWrBspg3MLf/sTvbEyd19PGXYOyHZQ1elyLTMKX24HrrcE5sv8HbNd7
 5kXdmG2WFRBegeIaajEqsUT3S+l2crMiJAM8ELS1kZAokuEf/2nvx8fMIF97XwEaHf7S3ukOyYj
 NDKgwpqlyPgGBLTHokA==
X-Proofpoint-ORIG-GUID: YA20q4b9CwS3wvAjDpU_1iiZ-tB5HKX2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270093

This should functionally be a no-op for us, since we are managing our
SMMU directly (dma_map_ops is NULL), but it populates the dma_len/
dma_address's so that we can use them for setting up pgtable mappings.

This inlines sync_for_device() and sync_for_cpu() into their only
callers to avoid doubling up on the dma-mapping calls.

Tested-by: Jianfeng Liu <liujianfeng1994@gmail.com> # x1e78100 (Acer SFA14-11), v7.3-rc5 + this series, CONFIG_DMABUF_DEBUG=y
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 62 ++++++++++++++---------------------
 1 file changed, 25 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 181b9ad32672..c97395e4ea2b 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -116,34 +116,6 @@ void msm_gem_vma_put(struct drm_gem_object *obj)
 #endif
 }
 
-/*
- * Cache sync.. this is a bit over-complicated, to fit dma-mapping
- * API.  Really GPU cache is out of scope here (handled on cmdstream)
- * and all we need to do is invalidate newly allocated pages before
- * mapping to CPU as uncached/writecombine.
- *
- * On top of this, we have the added headache, that depending on
- * display generation, the display's iommu may be wired up to either
- * the toplevel drm device (mdss), or to the mdp sub-node, meaning
- * that here we either have dma-direct or iommu ops.
- *
- * Let this be a cautionary tail of abstraction gone wrong.
- */
-
-static void sync_for_device(struct msm_gem_object *msm_obj)
-{
-	struct device *dev = msm_obj->base.dev->dev;
-
-	dma_map_sgtable(dev, msm_obj->sgt, DMA_BIDIRECTIONAL, 0);
-}
-
-static void sync_for_cpu(struct msm_gem_object *msm_obj)
-{
-	struct device *dev = msm_obj->base.dev->dev;
-
-	dma_unmap_sgtable(dev, msm_obj->sgt, DMA_BIDIRECTIONAL, 0);
-}
-
 static void update_lru_active(struct drm_gem_object *obj)
 {
 	struct msm_drm_private *priv = obj->dev->dev_private;
@@ -201,6 +173,7 @@ static struct page **get_pages(struct drm_gem_object *obj)
 		struct drm_device *dev = obj->dev;
 		struct page **p;
 		size_t npages = obj->size >> PAGE_SHIFT;
+		unsigned map_attrs = DMA_ATTR_SKIP_CPU_SYNC;
 
 		p = drm_gem_get_pages(obj);
 
@@ -219,13 +192,20 @@ static struct page **get_pages(struct drm_gem_object *obj)
 			goto error;
 		}
 
-		update_device_mem(dev->dev_private, obj->size);
-
-		/* For non-cached buffers, ensure the new pages are clean
-		 * because display controller, GPU, etc. are not coherent:
-		 */
+		/* For non-cached buffers, ensure the new pages are clean. */
 		if (msm_obj->flags & MSM_BO_WC)
-			sync_for_device(msm_obj);
+			map_attrs = 0;
+
+		ret = dma_map_sgtable(drm_dev_dma_dev(obj->dev),
+				      msm_obj->sgt,
+				      DMA_BIDIRECTIONAL,
+				      map_attrs);
+		if (ret) {
+			DRM_DEV_ERROR(dev->dev, "could not map sgtable: %d\n", ret);
+			goto error;
+		}
+
+		update_device_mem(dev->dev_private, obj->size);
 
 		update_lru(obj);
 	}
@@ -233,6 +213,8 @@ static struct page **get_pages(struct drm_gem_object *obj)
 	return msm_obj->pages;
 
 error:
+	if (!IS_ERR(msm_obj->sgt))
+		drm_prime_gem_destroy(obj, msm_obj->sgt);
 	msm_obj->sgt = NULL;
 
 	drm_gem_put_pages(obj, msm_obj->pages, false, false);
@@ -253,12 +235,18 @@ static void put_pages(struct drm_gem_object *obj)
 		drm_gpuvm_bo_gem_evict(obj, true);
 
 	if (msm_obj->pages) {
+		unsigned unmap_attrs = DMA_ATTR_SKIP_CPU_SYNC;
+
 		/* For non-cached buffers, ensure the new
-		 * pages are clean because display controller,
-		 * GPU, etc. are not coherent:
+		 * pages are clean:
 		 */
 		if (msm_obj->flags & MSM_BO_WC)
-			sync_for_cpu(msm_obj);
+			unmap_attrs = 0;
+
+		dma_unmap_sgtable(drm_dev_dma_dev(obj->dev),
+				  msm_obj->sgt,
+				  DMA_BIDIRECTIONAL,
+				  unmap_attrs);
 
 		sg_free_table(msm_obj->sgt);
 		kfree(msm_obj->sgt);
-- 
2.56.0

