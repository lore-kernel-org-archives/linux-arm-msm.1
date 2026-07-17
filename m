Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AB03A7591
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784321351; cv=none; b=RuDvU9oiAneANKq1e+a8UhZPpInxiuFZSJD2s1yrLYgBqfnuzjUhZHmFGKWmMi0JisYRb4Ig9PLNXwiJlwLuQJbgdEt/qEh5OEkxNqtfLdqtAYiPreVdWB3bsTJHJth2j2VyfeqQTGrrfIWp9XbjX9srUHJ60ht2uUWtlbJ48ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784321351; c=relaxed/simple;
	bh=LWRi7WoPZMvf9fYiaDHQHho4m9v0RCHCTkDe9SmLXjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uogiirHJ/QmDPBVjLMEd+u9MChH/1NJm3pha2BdFp+eDQaxPB7awOkFDVwX+abfaNZqKwO/VMddv7iJHg/TdBcXImG7yy0XnNrdQ/MH5LXiVgAkUo1998HiVFRc/II3QmNtLI60DcVVJXsEBhkv8WMSbdCdBeRn4Q/gypC/2TjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y4zW4Fae; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g+6Sb1R5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y4zW4Fae";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g+6Sb1R5"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtZuo2598089
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=u+dYORbwSI6
	uiQcDeTCc3vg91gVYcFDs6LJ+8okS1eM=; b=Y4zW4FaeZKeaIQj+XVZ8t/w6n/j
	YrIjsNVh72DLHXagGzNNc4xXLO5hO+uHRysQFBPFFiayL4bsJLOhbByhUXj8moML
	xzgiAZ6+kkDbthDRNJP0T5xYKPXvCGXc2MrKI0l+Jkj+R//iXmu3ipr6DM7Ke3vK
	9UhXD2vy1+wsNojfMUXh3FtV3vIeOPo9AC54Luj8Lk94Y/LGHx6tRYUT9lTBfyYu
	3p8SgvwquN9G1eaEbiYC3ItnfPpW4+fqdxmzSeawFFLBj3K3llx4+R6XsY0p9Lmd
	B5a1DLGovmGV53JSKxAvW2xGLFf9//yQVQV/hmkV7Lm3cF7NakRWuBNZ97Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffrp8rsge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:49:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc88e22f92so169313075ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 13:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784321347; x=1784926147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u+dYORbwSI6uiQcDeTCc3vg91gVYcFDs6LJ+8okS1eM=;
        b=g+6Sb1R50jYuK2S2OIKqdQ67zsNanNfcfSrExg4Ek7DSA3B6DNaaQi+7imwW+igQt1
         bkeUamGWy9LDARfl+a2MN68jy7mnWHcpan04EcGMcMgFTawyJVdGDhyctSzdXkrY1LHr
         eHnaARtjTyHQl+GhHcpE4YogeSb8BBHBZGndA97Pe5Ti/S5CIplCCdrmtrfGhRAcsVQT
         WDSIE6+0AmiY6J/WLxZXwlxzvuiUwJVJNe64ET/Vv3aWws0456dN16GebqCEi0VNcMeG
         dcRlTE6xgTK2Iz/6oRUijWUKjwTLQswuoC1KBrVSjzCWzzJ8oCRTLLkht3fMUtqJw4Y0
         ggTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784321347; x=1784926147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u+dYORbwSI6uiQcDeTCc3vg91gVYcFDs6LJ+8okS1eM=;
        b=RiA/3QiFcarQ7KwRQ6I/2yIq80hFrIzCHKFPTVglrIjh77KQOD6vA//+lp4HEkK60t
         LXHsSJhEFpzqOsDxyppt3ymW4XDjh53Ml/PBj69ltEi/Bc33thwAjZgYENjDuwhtUM9j
         reKpCDIWXziqvlwNyRebDM3FSuOVPIg0FvU51kQeXSFsWGJM+nsSQYxHP3xqhy86PP2x
         SO1umzFoKp+S1AbEL9UuPy7l1M9X8HizRPkfPT2pA81hagE+R6LVBC4ieG40CXxs1+AC
         I6Ae2TGatZbL1JNoraOFkD7b2XHLVbT2ffiNx/NJ2GigQJAdtA8uyU2tPUbTrcf5B08M
         ZSOw==
X-Gm-Message-State: AOJu0YzL1c7ApRY4QPg74TJ7v0SU8S9NdkDddb8LIWVc2sxc0SmoUkE4
	29T6THggnlbHZ6UP0XpeKOxxCpUS+ExC4CKqTCdaCjNIkjlA6H23H40At8pBkdiDw+A6TifbwmJ
	KIRTzuW/zkHLyC5ucfqtP+pJXZ7SQbe/uk8EuMILR0hPYJirS7HH6NfRAA9gT0PAQvrUP
X-Gm-Gg: AfdE7ck6Bi4xJ0kR8cGv9xGdcYMHWzKgZRS4ZQlRMZ86K41XH7zfJz/Png2w9Nh4X7H
	8YgtcPEmPqiHV8NCYJF+7vJOk3K56ZsFlk81BG5MHMKZlC3z9MRDYiiLe0AuuBHPBXddQpQqG/I
	79c98BchnpvKqt8tvOmOovgT916h56kJcAB9fYhBIupzRWs8apIspLENeMVSzVG7JTol67Zy0wn
	0l63xnl0qz1MAOZEHGNmTCoDZ6m/B3cHdwr5HbnSJoFIGT6KuT6gAZ1jxpjY6PIpu50rHhGUop4
	HzUjuMSQhCC4xkYtTCoPEcdSDWfC2CIq7EJ4oEcIkZ+bWpbZXObA4wv+ufUO6jiij/t5lfa1/Cz
	Iw9aTw7NTWflDQDLgR26IlOUMuhjCdR66E5CmkuxS8RGkRLI=
X-Received: by 2002:a17:903:3c4f:b0:2cc:fe03:dc75 with SMTP id d9443c01a7336-2cf3499007bmr48336195ad.27.1784321346991;
        Fri, 17 Jul 2026 13:49:06 -0700 (PDT)
X-Received: by 2002:a17:903:3c4f:b0:2cc:fe03:dc75 with SMTP id d9443c01a7336-2cf3499007bmr48335915ad.27.1784321346560;
        Fri, 17 Jul 2026 13:49:06 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf34729df7sm17189185ad.63.2026.07.17.13.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:49:05 -0700 (PDT)
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
Subject: [PATCH v6 11/16] drm/msm/gem: Set resv before exposing obj
Date: Fri, 17 Jul 2026 13:48:27 -0700
Message-ID: <20260717204841.26120-12-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfXyooFYTjveyC+
 rFrWOZ/GTI1xlKK/S55Noue+hEdUUs6YTSIgI8HLvptZp+5vO2HBp06b8/nyBc1TdJFfatTB7vg
 MpQZjoPjvZVhTgvK8ZT6wnzzpDgHobg=
X-Proofpoint-ORIG-GUID: yqE7Y08UQqH4fXT6EttANWDry5RDxTSt
X-Proofpoint-GUID: yqE7Y08UQqH4fXT6EttANWDry5RDxTSt
X-Authority-Analysis: v=2.4 cv=fMYJG5ae c=1 sm=1 tr=0 ts=6a5a9543 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=EaMrRQiLzwQp3BzynKIA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfX5kTXbFt2NDHc
 RG9JR3E0UHDSdH4BKgPi0k11+aV1+0bAI/AwqQ2NUY17lSiq7zeP9g+MDzaIf2aIZ4I7MfWafpj
 t5MfwP5/1UHlCy5aPPNOk84036besJ7D4w8l/TlBymSnnpRSacvicKIjNJA0ZTt0MT1tp6/VimI
 HlItjKwaSTC1gwViOj8AiSMWa0e85zSWRME23YLS6xU9c8TrpcPA/R3USXWK8Xip3FUT7XUVpIX
 DlV4Yu6wAPzKDcmTiQkmMgMkP/EqMFdq4B1Fhxxi2i2rQ96ib1TLGn6JOxsQlBy6WTIA6BYOZe+
 xBszf7FNe48sleCIP4HFyTMrUDB0MrLN/h8Dd8/kQJ6PcSrqUpp1xkzHsh00CvdZVD/Eiur8cW9
 cxdtWV3lWdcaVHX+/d57uMrdQhjyYSH9f9rts9e5m8ASzNOm4JOwJO+801O5zKqxCTNLauedYWQ
 wQtZ+jNfQnzawyxs1pA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170214

Don't swap the resv object _after_ exposing the newly created obj in LRU
or global objects list, as that creates a race condition where another
thread could lock the object using the original (per-obj) resv, but then
unlock after the resv is replaced.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  2 +-
 drivers/gpu/drm/msm/msm_fb.c          |  4 ++--
 drivers/gpu/drm/msm/msm_gem.c         | 32 ++++++++++++++++-----------
 drivers/gpu/drm/msm/msm_gem.h         |  2 +-
 4 files changed, 23 insertions(+), 17 deletions(-)

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
index 59143be07428..cb00bdf21ef6 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1134,10 +1134,17 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
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
@@ -1145,15 +1152,6 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
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
@@ -1245,7 +1243,9 @@ static int msm_gem_init_bookkeeping(struct drm_gem_object *obj)
 	return drm_gem_create_mmap_offset(obj);
 }
 
-struct drm_gem_object *msm_gem_new(struct drm_device *dev, size_t size, uint32_t flags)
+struct drm_gem_object *
+msm_gem_new(struct drm_device *dev, size_t size, uint32_t flags,
+	    struct drm_gem_object *r_obj)
 {
 	struct drm_gem_object *obj = NULL;
 	int ret;
@@ -1262,6 +1262,11 @@ struct drm_gem_object *msm_gem_new(struct drm_device *dev, size_t size, uint32_t
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
@@ -1298,6 +1303,7 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 	if (ret)
 		return ERR_PTR(ret);
 
+	obj->resv = dmabuf->resv;
 	drm_gem_private_object_init(dev, obj, size);
 
 	npages = size / PAGE_SIZE;
@@ -1331,7 +1337,7 @@ void *msm_gem_kernel_new(struct drm_device *dev, size_t size, uint32_t flags,
 			 uint64_t *iova)
 {
 	void *vaddr;
-	struct drm_gem_object *obj = msm_gem_new(dev, size, flags);
+	struct drm_gem_object *obj = msm_gem_new(dev, size, flags, NULL);
 	int ret;
 
 	if (IS_ERR(obj))
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 762e546d25ef..47ff2bbc1915 100644
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

