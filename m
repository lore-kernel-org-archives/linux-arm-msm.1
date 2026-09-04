Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3964779B2
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 12:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523583; cv=none; b=utcR3s3tYjNT25B/AugSwvy2qFPgrxIe7E6JDUnrOhk8pOuXcQvTy/el6KZ5FqPVfheRKJ62cFxh4shrhmscQzUIVfYbopbU1FHmf9WP3kqdZjOY7JBFF+IXccrl3sVnajVK0RAddzJnDC2V+BFzjB6LvvLweb/fGcDVFfSZ/30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523583; c=relaxed/simple;
	bh=sPN9S2SipzeCvUtPxw8RMcHggMANadY+KjgyyNcHFCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E4qOENzfxbFNmuk4BtDVX2JRuX0dGrhoxfz7mM1/9Qk2GfRTxsQihKa+47V7QgL3xG9qcsb39Tcy+T+/nY0fcK79m4Qdshkzylu8DVQVLYdwAbYsko/PNVvbCt5CGTQvsePo4E2uciqgE9G9YafvZXYVBPUGKIUxek0TmMDx6jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pOasWwII; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pOasWwII"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6b1b9c3af5cso745369eaf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 05:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788523580; x=1789128380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpjAUK45k2PJKSjdfeljwO5d42gX8uNwxDJAnF1e9RY=;
        b=pOasWwIIt9BWLLuuZudzx+UGJbRieNF7J8i2WiRkGX4FoAzr4GhhsuYut5iK67QYv4
         LB0l5Tz+evzfTwkGHRQwQ1cSSFdUD6dMH1R5upg7WYBEdc7MoeEVq/nJ4sAiQRiAJopw
         /pHnaWp9OUQkV4diQ4zBct1poQRc30Eu9AVD0WKnftiY+ZvKUl8gFIe5QmEStM+4rz4t
         iW2kgpubuMAlDR6OBFsEs4/+YF/itI6NhoZ2KtAGlEQSoDOpUnFFGZ8zji/vfxfP78rw
         vjkfZTWym/IEMLrBMU/scCc3cU8T62srYnbwpbk0l+une4hZfCSgxQZpYVU4pvWG5WXT
         wr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788523580; x=1789128380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LpjAUK45k2PJKSjdfeljwO5d42gX8uNwxDJAnF1e9RY=;
        b=DaPmaDjvZytgaDa7t5TDwSCirh7KF3FOLFSLp6Zsc/d/C2NV5IymWK39rPf0vAGy9L
         3FBAUwHc4vz/rNRa1R5oXyCvf4LRpgA+7LJttwm0a+h7Hiq3YBJvYqJ2mUI8KFdPpeZA
         vw4psjjgLsOSjNHVokDRX+iNxLyGUVrqw5iHIEgZ21Yo29c8JELNzR+P9fi/6Gl7+doB
         a7PEi6cfHpY4fyGbVDLG0MNdUCftdddKHRcb6SRgkrziGqRgT4da5+MJgC0JLOqclk/K
         ConCob9gBABfb6/ivn/2lxddc4ncmXGNcnFr+UiklK25n64pIlBcfjjzBzYbKsRmzSlJ
         2MXg==
X-Forwarded-Encrypted: i=1; AKwUvBz6y6QS7SvSpIHvRXfc+lxM7elsPDEAfQiXcOx1PR77GzdSaQAmF0ecJ8cr1dFjN6Txt9QOhbjhZaaxc5JO@vger.kernel.org
X-Gm-Message-State: AFuF++mA+k/m2eIZ9zkSCF19TMSddeygzUgjER8SUdwdbBFmHBWcnsz9
	2tWKg2M/SgQ9xhdvzz7x6NEn2iGFOv1DZfNQH1L5KZNKJUqVfrNVuHMx
X-Gm-Gg: AYBFou3oT0078df0GLVjFRpJ14vIhu85Bch+Gh0dIaE0PYOXojpJVzfCVobvLo5zNO6
	TcOqrcSQhJshrH8aj9msiEiAokqWoUAcj4pL2z5YAXTuaAGq4L5gIg21tBgEVwHO/57DNRVkGDY
	y8lsAxwZEo/xGkLtiWE74J5s4aUx/NARsr9LfIYu1CSVMQkwTpQOvoUiPMs8mlmoaYdb1iTTMN1
	c2tF5CohGewjKBP1jBjO8idnldtxmmo+XW5mnsmb9DkiCGjdJJU35hYvN/2plxZdNjSi8xqDffG
	lCj+W3j38mOsOzOBpdLlNdrRcKtitKaJFD0F6AsXDkB9ijymn9/S/8NCwIuhmBAu9Qcq0/xS6a1
	SpDrnGQS/HUJHveoQne3GitrtZ2G1LhldQHwV/41Ke5ppiJiRBTnSLh72+1PH3iFBkU8r8cYZ6J
	XhYHHk9GMdUVhtuQK8+eC14nt3702XfL1S96XDIX4LIdDavFSTWVXoLlbun0ecbNfgzhH6hG3Nj
	cqsHVRjviL2SGxm4GVe1j3h6w==
X-Received: by 2002:a4a:e914:0:b0:6b2:69bf:c8d7 with SMTP id 006d021491bc7-6b6fb3df17emr3896155eaf.10.1788523579864;
        Fri, 04 Sep 2026 05:06:19 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm6321674eec.22.2026.09.04.05.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:06:19 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 2/2] drm: fix repeated words in comments
Date: Fri,  4 Sep 2026 17:35:57 +0530
Message-ID: <20260904120601.18363-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904120601.18363-1-hemanth.selam@gmail.com>
References: <20260904120601.18363-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop words accidentally written twice, reported by checkpatch.pl as a
possible repeated word.  Only touches comments, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c  | 4 ++--
 drivers/gpu/drm/msm/msm_gem.c          | 4 ++--
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 2 +-
 include/uapi/drm/msm_drm.h             | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 27cac853975f..16fed0066f00 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1759,7 +1759,7 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
 		}
 
 		/*
-		 * Look for a level in in the secondary list that matches. If
+		 * Look for a level in the secondary list that matches. If
 		 * nothing fits, use the maximum non zero vote
 		 */
 
@@ -2378,7 +2378,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	if (ret)
 		goto err_memory;
 
-	/* Allocate memory for for the HFI queues */
+	/* Allocate memory for the HFI queues */
 	ret = a6xx_gmu_memory_alloc(gmu, &gmu->hfi, SZ_16K, 0, "hfi");
 	if (ret)
 		goto err_memory;
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index c4cff3d53d81..7ad450b574bf 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -502,8 +502,8 @@ void msm_gem_unpin_locked(struct drm_gem_object *obj)
 
 /* Special unpin path for use in fence-signaling path, avoiding the need
  * to hold the obj lock by only depending on things that a protected by
- * the LRU lock.  In particular we know that that we already have backing
- * and and that the object's dma_resv has the fence for the current
+ * the LRU lock.  In particular we know that we already have backing
+ * and that the object's dma_resv has the fence for the current
  * submit/job which will prevent us racing against page eviction.
  */
 void msm_gem_unpin_active(struct drm_gem_object *obj)
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 9d2788f79ace..d84cbb64bc56 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -47,7 +47,7 @@ with_vm_locks(void (*fn)(struct drm_gem_object *obj),
 	      struct drm_gem_object *obj)
 {
 	/*
-	 * Track last locked entry for for unwinding locks in error and
+	 * Track last locked entry for unwinding locks in error and
 	 * success paths
 	 */
 	struct drm_gpuvm_bo *vm_bo, *last_locked = NULL;
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 3d363f12f66a..9b6b30189230 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -102,7 +102,7 @@ struct drm_msm_timespec {
  *
  * With VM_BIND enabled, userspace does not include a submit_bo table in the
  * SUBMIT ioctl (this will be rejected), the resident set is determined by
- * the the VM_BIND ops.
+ * the VM_BIND ops.
  *
  * Enabling VM_BIND will fail on devices which do not have per-process pgtables.
  * And it is not allowed to disable VM_BIND once it has been enabled.
@@ -366,7 +366,7 @@ struct drm_msm_vm_bind_op {
 	__u64 obj_offset;
 	/** @iova: Address to operate on */
 	__u64 iova;
-	/** @range: Number of bites to to map/unmap */
+	/** @range: Number of bites to map/unmap */
 	__u64 range;
 	/** @flags: Bitmask of MSM_VM_BIND_OP_FLAG_x */
 	__u32 flags;
-- 
2.48.1

