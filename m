Received: from mail-dy2-f36.google.com (mail-dy2-f36.google.com [74.125.229.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E072A1D47AC
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767045; cv=none; b=VHKMiAH18Rhu9CbszIR0YyS09MR1u3ui0+fcpchEvd5FAZDbJFXO3TpOutpA39Si+zYs9rmTdATo1zl268fQfxEH2WKVhyG+UrvoHRd7gaA/uMnXc4JZjlpu0WMGONohbGe/kUXtGrUlxlNEjK4T2bYoVaF8ILhiyFhMvJGYXhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767045; c=relaxed/simple;
	bh=/2BvJeVcxbBFCAcdbXZWm4C6BhbEe7nLxNUVGsTSCMw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qmS2DFvXKaTVI462M0vpKAw7JLuhUvrrVK7mn98UApKfWaSRS6TxNg+TfqCpaXtswiZUdIcUgNgunFeXHemsgkUoZsrfi3oOCKO8SDsCC66vBvFjjfGhr+sO6DlgqO7uVc5Rv+U7lXR8hzuKfdbBWTmrD7J0Mak6pJpNRUDUWYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWKfyqex; arc=none smtp.client-ip=74.125.229.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWKfyqex"
Received: by mail-dy2-f36.google.com with SMTP id 5a478bee46e88-328664c2da6so4440139eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 04:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790767043; x=1791371843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O8c6J6a8XxfczhTmsOGt/U+Fg7+WNxgVu0l55UiDc6U=;
        b=NWKfyqexlAhpyYppH3idiaWHqf/C/Os4HBQsQIzz9lrBQwV9s/AiI7LJyGUUDYU7Wk
         CRAI/dZMUgPVM+awhNGN+OTpuZNpFVgDVDWU2FcwL8GoIvuQRxexAmindSce0BUkCylo
         NUCztJ4i769hhvK8oBNwgZ65jOWqRAvxRpYjLAkycjnVk+1vvY/fsq0ozMCOe9QQ683R
         WMCvj30Gf8V/kxtLpyzMFIeI8RuFavQADt89Soqlr55/d62r3dYXGPe1RlPrwfMmreZD
         wx6j7TzdPeD6bmSfm/SRKFOREQgPMWCNCyDUNgpgz7ohabRW/RjznPzyYVbBZMSGwWt8
         zdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767043; x=1791371843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O8c6J6a8XxfczhTmsOGt/U+Fg7+WNxgVu0l55UiDc6U=;
        b=RVAQCVwBLjwGPe95oOXxFAzftudlLH0Qo7L102OTYJv9RMmXv9IkwijAu0BQlHrlIg
         DmlnAAFN6DY62jQ+7l5DzMOU5V3n9U1u+Wigp2ngy1MZcPaf2RZ5Xb9lujiK5tDrYKEY
         BdVS+FUZLPb4yuu6FW/+wcwKem+II1tDaFV3NeSTmNYel2XFpzR4fCu9T4AXI9vISh2z
         BUGn2jxWGiAv2nDsxCwLDa8SrFyJ5/UVtK75N+i8hK0bNg7dScxaL71596l+UP4jlc2b
         vl/OdUYYoJM4GNTIME+gPZcUQnXy4rQFlCdmmcbZN5k6x0mS65KFlAEeH31fe4AgcM0O
         gYDA==
X-Forwarded-Encrypted: i=1; AKwUvBzJ2lDj/1F5EFihD3kls0EXUo7pBwj/NfHZPeAlWRAvLQ8UjOrsJo2Ybo1gsQ1V00GVP/Wpyl7/QBUkUthy@vger.kernel.org
X-Gm-Message-State: AFuF++kb1xcFrrsbyWvkm944+EVOOO0Ae3Y8+sRqAdkruDro53seQE89
	yO/aIOR8+kyWoDxo23p5K+IkbkCXakwJ+yTOS3ojoq1L3ijw4a5QCH8r
X-Gm-Gg: AYBFou1juzrJOmhO6CdYSDgBtUJF3Z8RNSIOTPnDyrofUicQsuRvl/LuQ9Xtr6DR66D
	Oty94p2U4Nsp2G0C5ww808OXuhtG0j5Zm4uAkT9DK2BReKJHQwsXSmcWRdY/ookrBLUoCv/ACDK
	EKOLTPH8iHxR4uYs0irCtCTrqoXwZOeMhGJgRh1e4y71ePsmPRszbjsTgBRscxMlwBPTPmbL0ZW
	xXCa7RVYNo0OY7fHPrT5EkYsbcuVdhr9mquA/vcQEgDbcjxXUXCB9QHRB+N7GQAUajraTU+qpvb
	ib1UMyvQ7W5RAs4/P118TgNcuPpw4paEtIOc24BXTHB1EuPnKMER9x1/UpJ9R//hMk6LA+4398q
	ASJgDDvr/naCniAkBjkaJjcGs97sgtHo+KFGgFbq2JDhs/4xp3X0hiiK9EVjjBwEtPA+bKsIVwe
	TqHFA+o1Q7csMEYpabXIHJC04amjGbvzNtSAGiNhIbC5bfyRUPXj4ICpTAD0rrEH92qijxs7CBX
	mhiy4Qzg6hUdR1f/NFBnhFYzF6x0SibCYnyAMlaZhgwK0342lozcPNZnRVGTNj0hGbEzbmj5Bvn
	U6DB7BOnRNkKIwdTuMoi4CWkYyVCvvBGHKg=
X-Received: by 2002:a05:7022:49c:b0:143:46a6:b01f with SMTP id a92af1059eb24-14d330b01admr1588765c88.31.1790767042676;
        Wed, 30 Sep 2026 04:17:22 -0700 (PDT)
Received: from rahuls-x2elite ([110.226.112.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14d063006f7sm4736344c88.2.2026.09.30.04.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:17:22 -0700 (PDT)
From: Rahul Pon <theflyingrahul@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH msm-next] drm/msm/a8xx: report the GMEM size of the active slices
Date: Wed, 30 Sep 2026 16:47:10 +0530
Message-ID: <20260930111711.1160-1-theflyingrahul@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A8xx GPUs split GMEM evenly between their slices, and parts can have
slices fused off: a8xx_gpu_get_slice_info() reads the active slice mask
and folds the slice count into the chip ID. The GMEM size reported to
userspace (MSM_PARAM_GMEM_SIZE) is still the catalog value for all
slices.

On an HP OmniBook 5 (Snapdragon X2 Elite, Mahua), the Adreno X2-85 runs
3 of 4 slices (chip ID 0x44070031) and the kernel reports 21 MB of GMEM.
Mesa sizes its tiles and places its CCU caches at the top of that range,
past the end of the GMEM that exists, and GPU-rendered output is visibly
corrupted: noise bands and block garbage, across the whole desktop with
GNOME Shell. Rendering without GMEM (FD_MESA_DEBUG=sysmem) is clean;
disabling UBWC, LRZ or compressed scanout is not.

Qualcomm's downstream driver reports GMEM for the active slices on this
GPU: gen8_get_gmem_size() in KGSL returns
gmem_size / GEN8_1_0_NUM_PHYSICAL_SLICES * active slices, 15.75 MB here.
Do the same when reading the slice mask. The GMEM protection and UCHE
setup still cover the full range, as in KGSL.

Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
Assisted-by: LLM
Signed-off-by: Rahul Pon <theflyingrahul@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c   | 4 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 ++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 ++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index add93c1fa039..9b95d9b3826a 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -112,6 +112,10 @@ void a8xx_gpu_get_slice_info(struct msm_gpu *gpu)
 	/* Chip ID depends on the number of slices available. So update it */
 	adreno_gpu->chip_id |= FIELD_PREP(GENMASK(7, 4), hweight32(slice_mask));
 
+	/* GMEM is split evenly between slices: report the active share */
+	adreno_gpu->gmem = adreno_gpu->info->gmem / info->max_slices *
+			   hweight32(slice_mask);
+
 	/* Update the gpu-name to reflect the slice config: */
 	const char *name = devm_kasprintf(dev, GFP_KERNEL,
 			"%"ADRENO_CHIPID_FMT,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 5832dc25d6bf..dadfe4c69438 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -379,7 +379,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		*value = adreno_gpu->info->revn;
 		return 0;
 	case MSM_PARAM_GMEM_SIZE:
-		*value = adreno_gpu->info->gmem;
+		*value = adreno_gpu->gmem;
 		return 0;
 	case MSM_PARAM_GMEM_BASE:
 		if (adreno_gpu->info->family >= ADRENO_6XX_GEN3)
@@ -1205,6 +1205,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	adreno_gpu->funcs = funcs;
 	adreno_gpu->info = config->info;
 	adreno_gpu->chip_id = config->chip_id;
+	adreno_gpu->gmem = config->info->gmem;
 
 	gpu->allow_relocs = config->info->family < ADRENO_6XX_GEN1;
 	gpu->pdev = pdev;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 114a40f79ef3..8e6a88103610 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -204,6 +204,8 @@ struct adreno_gpu {
 	struct msm_gpu base;
 	const struct adreno_info *info;
 	uint32_t chip_id;
+	/* GMEM size available to userspace, see a8xx_gpu_get_slice_info(): */
+	uint32_t gmem;
 	uint16_t speedbin;
 	const struct adreno_gpu_funcs *funcs;
 

base-commit: d33622598496c8994c35ba0a8a913de064dfc1a4
-- 
2.53.0

