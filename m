Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68699411A18
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340635; cv=none; b=nm8dlJLCaNWP+u3jWYY5APXM+3ziZfSSjBFccKBTKcZsmxVv3nzYmo09aq76ZeGuL0bLdV3TfPJubEMZB6Ww1xr+i+3c9bTfrAmijk/H5ol+QNnCt59DgR9JHfAkvj6KppBt28JgwWLFsALrlRX8HbFkrLIbeLhxmikJIwwQIIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340635; c=relaxed/simple;
	bh=zp0M+Vm2VG1Oqc9pTz9Ow+PpcVwW0DLDp2QjSfitMBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sOWUfXRtiktFshAva28GZJ0LoqfTUvPhdZeSHklg6PVgyYgsPpLOWsyNpAH1LQwDdXuVkJyWaC75/jlXV8xLukKqeJhg+mtcBBjinPOkaC4gN/wCQkffJzITxm/TDGdA9OuWXi+sETT63Sv5rFm0svzSFU2cKFi8pZ9PZNIOrZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dof81QTv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JHH11+Hh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dof81QTv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JHH11+Hh"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF39M51962865
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LKg0Jig2RkR
	o1/gnDZZ15WTbhHY0CsisFdaLrgf+he0=; b=Dof81QTvNcwf2CyhVLn0kGRaitj
	oANPKDN7pGI/v8NWBM0gih05ohSuM0f74e3cxglNn+7otP2J4DEvudF1WV6FOJNl
	hLO7E4cwLjpycexyL2J7CJ10a6tucFbZUChfOEYR0wlUgS6zwKM88zbgJ5xpZebO
	IjkRlUukoVGOFI7arO/QRG5Q4fdUOwOfIr8G9PKzf7elxh+KAJFlNYfBnz5FtHw5
	WKMp1l4WPElgCd16yP82IrUFlPJhAfY6OoFZeZnQDC24rDbUOvhLgUDasvNc+41Y
	MoGYc6yghro/R5pnFQhAcKCypql35rsZuRDoyNXX0t4UXExkDqRgvgSkfUw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgy919d8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cce14a21faso203495ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785340631; x=1785945431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LKg0Jig2RkRo1/gnDZZ15WTbhHY0CsisFdaLrgf+he0=;
        b=JHH11+HhngXFBqoydirFiMpwImTrsrsIk1VvcJc5Ta8V0cjQaBnFSHJ23ud7EFLo1f
         tYhl0cej2WvUWHHTaOLGrX/dLL3JMA98GfVE7q/jyuwZ1G7HjLBp7L25NB0wD56qaQbp
         XFtmIYR+K41gJ+wN1dmNKnYTq+P7KKFDAEwRQ0Pz4f0es/O4jXtEFCvIVo0608aeQA58
         2cwA6OpoHTJQq23U5RTygKLbu4L+Zz/h+j31q0SesrZpFDcyfIoBnoqLpuoLQAtCC8EL
         3YDQz6fiYk1lo0M4bE95TExQtO5J7iW0JoigMwETlwVUZaJ3dmE0nqFyfqd7pYGPee+w
         siTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785340631; x=1785945431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LKg0Jig2RkRo1/gnDZZ15WTbhHY0CsisFdaLrgf+he0=;
        b=Nf+Sk3CDpxP3chaZVO5Rlgoyh7iao3BdOrdLvdRAdA1SBqfAUmwdAhTVkh3Rx2uInK
         Tz61gDaRUq/dl/t7DQ2W/R7mkLtllAXzfk6n8Ng37SkC7/PPgc+D9oIxQcLKXd+w93wM
         o0XEbIXcGf2iO661Z/P7PE33oDMUMkjaF164wq+Y4QnnLsHZYKwyf5qL31QN7JnXq6tO
         bTyHze8fS3OUKkOpH6vwOLzT2mHW34b2vaSjrdbCLgsRJoQDepUp/iDPs01Qv2yzM2GL
         2I3zXt5yCJQlXlagb4vQ8mn8PPyAM8wAo5tO1wovKBOQyaXz8JRnSP8TVCE8MF5QTjte
         CXmQ==
X-Gm-Message-State: AOJu0Yw0Du8FKXsnzZ8pueE1pwskpauOscsg2C6qslcyQQWaiIEl4WEo
	H/4A8jt7IWQnR+99y6ihB9ds5XbWhCcHUtriQqZa4CMnR5Bq6Q8MACC44OKjWHzvomWAVzB5DnH
	FRwcSNWiSrOCo2HC3pgLfGo0mXndm/HkthhvY4dAkAt2myzxz57/A7BpQ8v0itmg3XJ5Lgs1y9z
	zp
X-Gm-Gg: AR+sD12ofgPT8aDpcdxwfcPyKLwTzr99rIZ93uL49ERoZNZNxuZPs1ftUd3RMvzbtlu
	J5R9b4ePv9dZfJ8RRiJ2Mac1aZyzwq41P5mSqrcbPAMwNI6Q/SHxswUyRD/hT3bMz+NEJ+/Hze9
	upZaALmOiDG0+s+Uwf1uFBkAyh1tzqxc8oSOSJ8Qop7hYJlvAGtPQo9IBt8PQM3dd0mvgYuyruC
	DTBa1QpRKTZeqXGKUuw2rcO58v9xnG2+QkP0Zd/GrpuxStgaJu4s2FBudjPtmU1KYDgGNAzTh5e
	fakjx5gn5eIKPP6bojwsLc/zihtkHk8+KYecQyUrFSJnxu3XbI0nZzPRSZOyxxKLeO5fgYwTt5h
	M3eLoya66T8aioK6tEGntfaEeffviq4cm9PG9Y83dqWtBsEM=
X-Received: by 2002:a17:903:2282:b0:2ca:53f7:3c69 with SMTP id d9443c01a7336-2d0266945f4mr30364605ad.9.1785340631051;
        Wed, 29 Jul 2026 08:57:11 -0700 (PDT)
X-Received: by 2002:a17:903:2282:b0:2ca:53f7:3c69 with SMTP id d9443c01a7336-2d0266945f4mr30364355ad.9.1785340630566;
        Wed, 29 Jul 2026 08:57:10 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a7fabasm13833005ad.37.2026.07.29.08.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:57:10 -0700 (PDT)
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
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 12/17] drm/msm/gem: Set resv before exposing obj
Date: Wed, 29 Jul 2026 08:55:49 -0700
Message-ID: <20260729155609.20190-13-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729155609.20190-1-robin.clark@oss.qualcomm.com>
References: <20260729155609.20190-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfX++rnU7dJxV2A
 JQu7ungv32rsDSLZtVJJrA8x7Mt1qtHKoFi2aIH5lJbblRF721oJhfaT0i670LcDxEEmqoBn/OH
 MTLGHVQufjr/tlfneimHOlkk49tWtUY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfX/3mjP+B8fgMh
 emIUhd+ChCUQ5q5fWnteXCuOxR51GjY4sYC4y3YKCp4iq9WMVc8LxUsJPHrtXjjLczGapHb0XSK
 wVq4CqZAmSMpqkTiJgWW4qj5xeG9gDNnxjfT/zRF19MXTORitVbndXc98zgGGRM2McDAFgT0h5B
 jxp3Y3Rniti9eAkPOs8d0qzPT+EsiK8fnFy451Ee0qFoIAaOMDipAN/nLilrE22UJJdU+vd7Elu
 Kbj+ilJ4c+wC8/dBNyHy/r/fjkjQaXbWsAu1QtCHyky7ZAU24jGDtsiNBpzyjWvHInimzSi5Frp
 iFrOVCrn6dCN+PKO/w9fsFJSkh5gNgtptW+CH6pHPOMT+UnRwnV8kVPLivZ6/f90OYvSM6gsD9F
 CCqDFoFz7gxSrFzg3vTmtKwwR8cioNK23Yd/ruVBsR46OfT5u0U0NTjJGsDI/vT1elWjzoPDiuo
 emmS38Ye0K/A2NlKK7A==
X-Authority-Analysis: v=2.4 cv=LtKiDHdc c=1 sm=1 tr=0 ts=6a6a22d7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=EaMrRQiLzwQp3BzynKIA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 6Yh2F7s3YB6oWx0I6_3y4wO5jw3HzH_o
X-Proofpoint-ORIG-GUID: 6Yh2F7s3YB6oWx0I6_3y4wO5jw3HzH_o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290127

Don't swap the resv object _after_ exposing the newly created obj in LRU
or global objects list, as that creates a race condition where another
thread could lock the object using the original (per-obj) resv, but then
unlock after the resv is replaced.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c    |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  2 +-
 drivers/gpu/drm/msm/msm_fb.c             |  4 +--
 drivers/gpu/drm/msm/msm_gem.c            | 32 ++++++++++++++----------
 drivers/gpu/drm/msm/msm_gem.h            |  2 +-
 5 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 2e5d7b53a0c3..9aed142faea1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1546,7 +1546,7 @@ static int a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu, struct a6xx_gmu_bo *bo,
 		flags |= MSM_BO_MAP_PRIV;
 	}
 
-	bo->obj = msm_gem_new(dev, size, flags);
+	bo->obj = msm_gem_new(dev, size, flags, NULL);
 	if (IS_ERR(bo->obj))
 		return PTR_ERR(bo->obj);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 7726edb0d4ed..c289dff78cd5 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -463,7 +463,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 		goto fail;
 	}
 
-	mdp4_kms->blank_cursor_bo = msm_gem_new(dev, SZ_16K, MSM_BO_WC | MSM_BO_SCANOUT);
+	mdp4_kms->blank_cursor_bo = msm_gem_new(dev, SZ_16K, MSM_BO_WC | MSM_BO_SCANOUT, NULL);
 	if (IS_ERR(mdp4_kms->blank_cursor_bo)) {
 		ret = PTR_ERR(mdp4_kms->blank_cursor_bo);
 		DRM_DEV_ERROR(dev->dev, "could not allocate blank-cursor bo: %d\n", ret);
diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 9b681e144c07..ee17a47f31c4 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -267,11 +267,11 @@ msm_alloc_stolen_fb(struct drm_device *dev, int w, int h, int p, uint32_t format
 	/* allocate backing bo */
 	size = mode_cmd.pitches[0] * mode_cmd.height;
 	DBG("allocating %d bytes for fb %d", size, dev->primary->index);
-	bo = msm_gem_new(dev, size, MSM_BO_SCANOUT | MSM_BO_WC | MSM_BO_STOLEN);
+	bo = msm_gem_new(dev, size, MSM_BO_SCANOUT | MSM_BO_WC | MSM_BO_STOLEN, NULL);
 	if (IS_ERR(bo)) {
 		dev_warn(dev->dev, "could not allocate stolen bo\n");
 		/* try regular bo: */
-		bo = msm_gem_new(dev, size, MSM_BO_SCANOUT | MSM_BO_WC);
+		bo = msm_gem_new(dev, size, MSM_BO_SCANOUT | MSM_BO_WC, NULL);
 	}
 	if (IS_ERR(bo)) {
 		DRM_DEV_ERROR(dev->dev, "failed to allocate buffer object\n");
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 3c36b1c4a4d5..535c6e1acb3c 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1136,10 +1136,17 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 		size_t size, uint32_t flags, uint32_t *handle,
 		char *name)
 {
-	struct drm_gem_object *obj;
+	struct drm_gem_object *obj, *r_obj = NULL;
 	int ret;
 
-	obj = msm_gem_new(dev, size, flags);
+	if (flags & MSM_BO_NO_SHARE) {
+		struct msm_context *ctx = file->driver_priv;
+		struct drm_gpuvm *vm = msm_context_vm(dev, ctx);
+
+		r_obj = drm_gpuvm_resv_obj(vm);
+	}
+
+	obj = msm_gem_new(dev, size, flags, r_obj);
 
 	if (IS_ERR(obj))
 		return PTR_ERR(obj);
@@ -1147,15 +1154,6 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 	if (name)
 		msm_gem_object_set_name(obj, "%s", name);
 
-	if (flags & MSM_BO_NO_SHARE) {
-		struct msm_context *ctx = file->driver_priv;
-		struct drm_gem_object *r_obj = drm_gpuvm_resv_obj(ctx->vm);
-
-		drm_gem_object_get(r_obj);
-
-		obj->resv = r_obj->resv;
-	}
-
 	ret = drm_gem_handle_create(file, obj, handle);
 
 	/* drop reference from allocate - handle holds it now */
@@ -1251,7 +1249,9 @@ static int msm_gem_init_bookkeeping(struct drm_gem_object *obj)
 	return drm_gem_create_mmap_offset(obj);
 }
 
-struct drm_gem_object *msm_gem_new(struct drm_device *dev, size_t size, uint32_t flags)
+struct drm_gem_object *
+msm_gem_new(struct drm_device *dev, size_t size, uint32_t flags,
+	    struct drm_gem_object *r_obj)
 {
 	struct drm_gem_object *obj = NULL;
 	int ret;
@@ -1268,6 +1268,11 @@ struct drm_gem_object *msm_gem_new(struct drm_device *dev, size_t size, uint32_t
 	if (ret)
 		return ERR_PTR(ret);
 
+	if (flags & MSM_BO_NO_SHARE) {
+		drm_gem_object_get(r_obj);
+		obj->resv = r_obj->resv;
+	}
+
 	ret = drm_gem_object_init(dev, obj, size);
 	if (ret)
 		goto fail;
@@ -1311,6 +1316,7 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 	 * up in drm_gem_object_put() -> msm_gem_free_object()
 	 */
 	obj->import_attach = attach;
+	obj->resv = dmabuf->resv;
 	drm_gem_private_object_init(dev, obj, size);
 
 	npages = size / PAGE_SIZE;
@@ -1346,7 +1352,7 @@ void *msm_gem_kernel_new(struct drm_device *dev, size_t size, uint32_t flags,
 			 uint64_t *iova)
 {
 	void *vaddr;
-	struct drm_gem_object *obj = msm_gem_new(dev, size, flags);
+	struct drm_gem_object *obj = msm_gem_new(dev, size, flags, NULL);
 	int ret;
 
 	if (IS_ERR(obj))
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 86dc93cc1804..dff60cbc9d95 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -296,7 +296,7 @@ int msm_gem_cpu_fini(struct drm_gem_object *obj);
 int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 		size_t size, uint32_t flags, uint32_t *handle, char *name);
 struct drm_gem_object *msm_gem_new(struct drm_device *dev,
-		size_t size, uint32_t flags);
+		size_t size, uint32_t flags, struct drm_gem_object *r_obj);
 void *msm_gem_kernel_new(struct drm_device *dev, size_t size, uint32_t flags,
 			 struct drm_gpuvm *vm, struct drm_gem_object **bo,
 			 uint64_t *iova);
-- 
2.55.0

