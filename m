Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395981;
	b=fh88DYS49kmGFvdzwrZcKjKVaoNgQ+Xl6eiQf+/8zST2tusJrrJ9JVchkwXYdIT5ahpR
	 IymTTpMvX/es39yiXIdLucA/QZcKck1ktUZtXhzN6ApL0crVDD/NQ3x+0SLr1CbuPAGFC
	 PMO+DM8ywNAVWj0X+AC0i2ttq4P7nX6FC/P/1b74CbSB9s4oStwD+vNRmgE3W1Lr5H1uB
	 nLnrClw+HYz1l+31zbJ+2LLufw5d0gI2t9CY1AeKaEHMnrl7gyA6Jzw9/fMig7NjhqFa9
	 AG7q3HOvqehYd+WUELy9paE/jg1Wdk4jvpaawKEsYt9Hr0E2dsRxtTF+O6kyIMjy1yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395981;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lKfSr9ShDgz6eFnCZ0r6QMxMYlKS96GB2Cpk0qX7FGs=;
	b=sN2N8Ada/x4I9WifJsgoNXhtZERB0JNF4HWbCFnbzdIGpL1e85ZlXVSqCap4d7rVQgZU
	 EBFpnPOlqI46GOzOfDK+kVra6x3D3/y1vPA5Zg1bVClypG2bJ+5pIKNQwxXtXgyuupgMO
	 cFXk4kvfvJwzEOBMwA3iJyb+3JYWZz0y+VxL/D2+9UYjmf0YGF+Nb+tbZuv2pKT12pGvV
	 Lp7sdbnClNovE31AQlwks99FOivGH4JShahvQJHOHXFVgoW0uYmQFXl8p34Es7J99NKXZ
	 CPgh2HlgsV4YdKuVZ2ooUSi/aHJBkqxnF4KhzZYayzuuFjN2Xr/RrUxvPtrnAyVANlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hwPoeJUM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gxxgaaSD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37E2606A32A
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D37E2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hwPoeJUM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gxxgaaSD
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULBh4X203767
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:33:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lKfSr9ShDgz
	6eFnCZ0r6QMxMYlKS96GB2Cpk0qX7FGs=; b=hwPoeJUMib669wrGmDMfFDP3il2
	TJNBWSmJoBvUDsSADtQ7IQBCgoP/FrBpWbLgj4cWqNwGRS7yn+H+AGdp28T+2qGb
	ZYFogluIZ0h/bxcbXXj1e+dXSc766HwOncLQVAX2aXi2wrcKJs36VC5A4zrqEzat
	Si+m6Oh+zXg74xb/2rs+sw5Ul0nuvA0dhfhyKpXGmooy6lEi8GNOG14/iAKXLGAE
	rTKmd8Ss6HYx5eKY8ncqtFYNl3yabGhvw2qIN79LgNSxUFZ5oO3BHtaqJeu55MNo
	4AmUVzz1R+vEMl90Fr6oeUINJEnOvp2LWfN9GOrtsuO9zGTwzfRpuZFzdYw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x0g39q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:33:00 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cca35cf9f77so692721a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 14:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395979; x=1794000779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lKfSr9ShDgz6eFnCZ0r6QMxMYlKS96GB2Cpk0qX7FGs=;
        b=gxxgaaSDNi09RmAjBz5wQctKIDuuwBW88E3gBdmgbhSu+EfFbXlnS/Ja+GKlClfqrw
         K7uNM7/XJlW84aNL0t0ndDNiVMbkRFPf6KCVvLfI5EpaqATj7KjkSBMrnNz+76wGrYIQ
         glsGiqZilUlCHaWjSyByudmeVJNq/wuUckVzGROZqG22E9Dti1IQmfSPJ6VhCami67k8
         woVkVxlmEyr6FoboCkU69stTX8a3PjFfM0Xg5mOprGUmE9WcHonHsdZjUq3LdSZPrjJ5
         B44+TC4Xz1lZldj++Ocv5UfqEkjxTF+BWWTcl9sOfjZd6crZxfBZMkzxiOsdVOnGF/kx
         NcJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395979; x=1794000779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lKfSr9ShDgz6eFnCZ0r6QMxMYlKS96GB2Cpk0qX7FGs=;
        b=0+vUPon+EhgXaKd7LiagIKquyCEafROW6dQxSyV6bJK1f3/6sV8OYxtT57MZIs7c3s
         YldXkz+81shH6/6fHVZuVuKRcIh2o2WLnD+uqr2CnF9MCRjBi302cSL4hc/o1Tj9r9xw
         wbrqWIy3Y70kWyEAlFyJ6bIGHucD9tRqAy2BXEy06ShCvsn2cKS+LV//WAQ4XH0y1wyQ
         OIoFqTu5uCVUu72oGPX0ULrLJMEvzthF8cglPO1gLaFII6mLHh9Gl9MqAu0dV56jYDmt
         GofGRm/cdPXMohUlxsQOdQ5hH9ks2YWxY+pP35JNM2BTz8am9ZH3On0EYSx9JGDzvYDO
         C1eQ==
X-Gm-Message-State: AFq9FYLy9/zzak11a4eBG/eJjg792WFREwZ/GXRXjq5SokBaZlzNTlh2
	IwtNXmrseIJF2lATe1tYXW/UorZjISsQ/pQJgd0lumYuodKGvxXuSPxfrCVig/2lx1OoskAy7hR
	Nhw46Kd7yTv3Hz7iX4ZQ32tT+maFiFWJCdotKtrXHEEtlWVZ2qqXFeXLLa655GYIv50Jd
X-Gm-Gg: AYBFou2HsaoKledFhZATrjDBJljwvWMhIoX8ytIkINLxrqpmLl8eIwxVrhokmBDfcbg
	PWQYao4iSaa2yKpAsYk0e0Vid3BoM9GNP3IUUExMFhXZbODqDnw6uzGOfDx2KAez4f6pW8jg37X
	lFR2+nbnjbWvry1nz8S62JeVLxbqj251PwHUnRg3pKT82sXkvDOkQ6oUcqC669H1esgrqjqQjtC
	0rPqzoQ2mtKwCUhpPaEMVI7tNpqUrNTYnwkzT1VHXQGWBkyNbcaZgeCYeJrdFFEEW24fEVSwf9l
	QB1nOFOBQjANpJ4vjoCT9TRlqijhT2JbdNgzCfca+2o6VDoXGRoqkV3VQGBWbFQaQIWrSvWF/po
	FlB5UGzhMsEo1yeOYBOlLfL+nnd0pI8lrPQuaM0TuKuXi4pl02IpoGtRe3x7zRR6YsSbmwQS08y
	EbcXbRh2t6ALxJEJza7MLtsA==
X-Received: by 2002:a17:90b:3c08:b0:3ab:17b6:9a93 with SMTP id 98e67ed59e1d1-3ae897a64b7mr3002399a91.52.1793395979330;
        Fri, 30 Oct 2026 14:32:59 -0700 (PDT)
X-Received: by 2002:a17:90b:3c08:b0:3ab:17b6:9a93 with SMTP id 98e67ed59e1d1-3ae897a64b7mr3002384a91.52.1793395978870;
        Fri, 30 Oct 2026 14:32:58 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8454327esm5313204a91.4.2026.10.30.14.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:32:58 -0700 (PDT)
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
Subject: [PATCH v4 2/6] drm/msm/gem: dma_map/unmap_sgtable()
Date: Fri, 30 Oct 2026 14:32:44 -0700
Message-ID: <20261030213251.55365-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030213251.55365-1-robin.clark@oss.qualcomm.com>
References: <20261030213251.55365-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 7CVbdtoMBRVOFuc6l41ZCDupelhzXOL3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX6JBO3HRTsmcq
 eg65LvqArtUWtgpVUTVfbZYoo38pgQ9BisClc3sr6FLZVOmuwdF4SbcOnXe/KtcwJYAXeqCcD1W
 x5TI92d/fJ4SezYiRTCN+BzeVnS3iuc=
X-Authority-Analysis: v=2.4 cv=IpyL47/g c=1 sm=1 tr=0 ts=6ae50d0c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=urFl2zf4nAXEHr-h338A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 7CVbdtoMBRVOFuc6l41ZCDupelhzXOL3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX2cOchPVxPoqh
 TaqmP+D8azAHz6csunVwR3BaV322hDJ3LJVfLRuL6Fx0DBO+K4tWzH18e+K+ISTc/53jEOzjdVe
 5S+0e7mFCN7dE5avS4tKL5zg1JdUy60Gb5i9TZLOjx9gfVmyOM+10Gx9LTlYVYe7a698GdWcLTm
 dDcXYCLypozUKlxBf7/rSxcPgSlGqJpPqP25WOMD9m9ejZmQ8lyJ76/+dVfcRmaIkf2dhRWXlOl
 YnQ+SzILbxOrc2adLxG36wKcx0XDt8G5P2vnVIA4ChzhLMyZl9wpkNTDWSiSOePw/MTf/V2a26a
 CVf1wPFm1fjLuIo4LAuBkihY80B3EvCoaG4ZzXc5OG37BHMsnB/KdKhXpFYzhaQptmWcjhz0gu+
 v6tpK6kIlaCcni00MffplG7/5y5lCam21teFUQQ2P7FXOP64+zS17/1SRIay17XdK/F0eWiA/W4
 /Q5+d2QiwlP3Hf9Bgpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300085

This should functionally be a no-op for us, since we are managing our
SMMU directly (dma_map_ops is NULL), but it populates the dma_len/
dma_address's so that we can use them for setting up pgtable mappings.

This inlines sync_for_device() and sync_for_cpu() into their only
callers to avoid doubling up on the dma-mapping calls.

Tested-by: Jianfeng Liu <liujianfeng1994@gmail.com> # x1e78100 (Acer SFA14-11), v7.3-rc5 + this series, CONFIG_DMABUF_DEBUG=y
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 65 +++++++++++++++--------------------
 1 file changed, 28 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 181b9ad32672..bcdb57866cf6 100644
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
@@ -233,6 +213,11 @@ static struct page **get_pages(struct drm_gem_object *obj)
 	return msm_obj->pages;
 
 error:
+	if (!IS_ERR(msm_obj->sgt)) {
+		sg_free_table(msm_obj->sgt);
+		kfree(msm_obj->sgt);
+		msm_obj->sgt = NULL;
+	}
 	msm_obj->sgt = NULL;
 
 	drm_gem_put_pages(obj, msm_obj->pages, false, false);
@@ -253,12 +238,18 @@ static void put_pages(struct drm_gem_object *obj)
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

