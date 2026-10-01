Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7885417BFE
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 22:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790892408; cv=none; b=eL8u5zO2vrEMdayIUI4zsaMhL1kIAJr8aPRpFHlRjcQUPjxA9hRx/4OzxcaLt3EwEcc1B++X4ZobN8Rk0vKMIio8Crus9c3Z7/68PJKgYJkh7+nOJU0zSCSdCpAZJMKMtY3f4o52EoJSEC2otJzJ62rZC/hGKH18CjRzyN0fdVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790892408; c=relaxed/simple;
	bh=OpH3i+Gjd6BBt1sMh2n0pi0yrFnmvh4x9FZcNUbQIb4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VJSCcoeg8qb980sIjNGSaBN4pDvkZtP1Ev0mu4CFfBpA6IXmXGiKp3kbob8JOHEXqGosTeHaY2siHL4TXYYMtwYoXPfN37jak9okwHa0PqNNLFFVZACMNpYjwlaRJECBR8pHrPY9UWAEBjod2lAkZf1zjSWIylZkYSwaPzdUxBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n9TfAldR; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n9TfAldR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790892406; x=1822428406;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OpH3i+Gjd6BBt1sMh2n0pi0yrFnmvh4x9FZcNUbQIb4=;
  b=n9TfAldRYmd2fhC92JmECGhcdUSrTm7bMMaT2Ek1Gp6u1v1Ugg/bop2x
   V6GnS/E5LuTz5Yk6xDE6TiOVAaG49+Yi9zoa4DUzFi/ALOd5ff7O4N09M
   LsGyJt9aovPyH9NiLzcssotXoISyE4rievYfHkgwESptfPU9fACii/NxT
   RtkZCmQ6wHeroI7hvzaQACzIF70a5DkbxERAPRybARwUqTB4rhqVInE17
   nfx7Fc8hoq3kP69AkYIdSkoHekdRC/zbOnvOIGxstNdF/RDtPHSO4kAQO
   sWJnUWt6Jt0QrDJ9QXi0ayDVVRf0arUcATDLaZN6+hXB21MjGFza42+zE
   A==;
X-CSE-ConnectionGUID: pDMh9wikTfCihsE/CJTmqw==
X-CSE-MsgGUID: fukqFKHVQomrmqhRGjJvcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="91526860"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="91526860"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 15:06:39 -0700
X-CSE-ConnectionGUID: peudnzZvQ36P8ynbm2UP8g==
X-CSE-MsgGUID: Spj6LWbuQtSXtS0UmsQOKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="274190033"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 15:06:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Alice Ryhl <aliceryhl@google.com>,
	Anna Maniscalco <anna.maniscalco2000@gmail.com>,
	Antonino Maniscalco <antomani103@gmail.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lyude Paul <lyude@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maxime Ripard <mripard@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Sean Paul <sean@poorly.run>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Simona Vetter <simona@ffwll.ch>,
	Steven Price <steven.price@arm.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 7/8] drm/nouveau: use DRM_GPUVM_RESV_PROTECTED
Date: Thu,  1 Oct 2026 15:06:31 -0700
Message-Id: <20261001220632.3190896-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261001220632.3190896-1-matthew.brost@intel.com>
References: <20261001220632.3190896-1-matthew.brost@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

nouveau creates its drm_gpuvm without DRM_GPUVM_RESV_PROTECTED, so the
extobj and evicted lists are protected by internal spinlocks. Every
nouveau path but three already touches them with the VM's resv held:
drm_gpuvm_exec_lock() and drm_gpuvm_validate() on exec, and TTM moves of
private BOs, which share the VM's resv. The remaining three are:

 - nouveau_uvmm_bind_job_submit() adds the vm_bo of a MAP op to the
   extobj list holding no resv at all. Move that into
   bind_lock_validate(), which now locks the VM's resv as well.

 - bind_link_gpuvas() unlinks the GPUVAs of UNMAP and REMAP ops, which
   can drop the last reference of their vm_bo. It runs within the bind
   job's drm_exec transaction, which the above makes hold the VM's resv.

 - nouveau_uvmm_bind_job_cleanup() and nouveau_uvmm_fini() can drop the
   last reference of a vm_bo holding only the object's resv. Lock the
   VM's resv along with it, through a new
   nouveau_uvmm_lock_vm_and_obj().

The bind job's fence now always lands in the VM's resv, as BOOKKEEP.
This already happened whenever a bind job mapped a private BO.

With that the internal spinlocks buy nothing, so set
DRM_GPUVM_RESV_PROTECTED. This is also what two-pass locking in
drm_gpuvm requires, which a following patch makes use of.

Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: Alice Ryhl <aliceryhl@google.com>
Cc: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Cc: Antonino Maniscalco <antomani103@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Steven Price <steven.price@arm.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Assisted-by: LLM
---
v3:
 - New patch (Danilo)
---
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 49 ++++++++++++++++++++++----
 1 file changed, 42 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 2026fe6b48c6..dae612e56d91 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1187,6 +1187,27 @@ bind_validate_region(struct nouveau_job *job)
 	return 0;
 }
 
+/*
+ * Lock the VM's common dma-resv together with the one of @obj, as needed to
+ * drop what may be the last reference of a &drm_gpuvm_bo.
+ */
+static void
+nouveau_uvmm_lock_vm_and_obj(struct nouveau_uvmm *uvmm, struct drm_exec *exec,
+			     struct drm_gem_object *obj)
+{
+	int ret;
+
+	drm_exec_init(exec, DRM_EXEC_IGNORE_DUPLICATES, 2);
+	drm_exec_until_all_locked(exec) {
+		ret = drm_exec_lock_obj(exec, drm_gpuvm_resv_obj(&uvmm->base));
+		if (!ret)
+			ret = drm_exec_lock_obj(exec, obj);
+		drm_exec_retry_on_contention(exec);
+		if (drm_WARN_ON(uvmm->base.drm, ret))
+			break;
+	}
+}
+
 static void
 bind_link_gpuvas(struct bind_job_op *bop)
 {
@@ -1224,12 +1245,24 @@ bind_lock_validate(struct nouveau_job *job, struct drm_exec *exec,
 		   unsigned int num_fences)
 {
 	struct nouveau_uvmm_bind_job *bind_job = to_uvmm_bind_job(job);
+	struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(job->cli);
 	struct bind_job_op *op;
 	int ret;
 
+	/* The VM's dma-resv protects its extobj and evicted lists, and must be
+	 * held by bind_link_gpuvas() in case it drops the last reference of a
+	 * &drm_gpuvm_bo.
+	 */
+	ret = drm_gpuvm_prepare_vm(&uvmm->base, exec, num_fences);
+	if (ret)
+		return ret;
+
 	list_for_each_op(op, &bind_job->ops) {
 		struct drm_gpuva_op *va_op;
 
+		if (op->op == OP_MAP)
+			drm_gpuvm_bo_extobj_add(op->vm_bo);
+
 		if (!op->ops)
 			continue;
 
@@ -1288,8 +1321,6 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job,
 			dma_resv_unlock(obj->resv);
 			if (IS_ERR(op->vm_bo))
 				return PTR_ERR(op->vm_bo);
-
-			drm_gpuvm_bo_extobj_add(op->vm_bo);
 		}
 
 		ret = bind_validate_op(job, op);
@@ -1603,9 +1634,11 @@ nouveau_uvmm_bind_job_cleanup(struct nouveau_job *job)
 			drm_gpuva_ops_free(&uvmm->base, op->ops);
 
 		if (!IS_ERR_OR_NULL(op->vm_bo)) {
-			dma_resv_lock(obj->resv, NULL);
+			struct drm_exec exec;
+
+			nouveau_uvmm_lock_vm_and_obj(uvmm, &exec, obj);
 			drm_gpuvm_bo_put(op->vm_bo);
-			dma_resv_unlock(obj->resv);
+			drm_exec_fini(&exec);
 		}
 
 		if (obj)
@@ -1941,7 +1974,8 @@ nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
 	mt_init_flags(&uvmm->region_mt, MT_FLAGS_LOCK_EXTERN);
 	mt_set_external_lock(&uvmm->region_mt, &uvmm->mutex);
 
-	drm_gpuvm_init(&uvmm->base, cli->name, 0, drm, r_obj,
+	drm_gpuvm_init(&uvmm->base, cli->name, DRM_GPUVM_RESV_PROTECTED,
+		       drm, r_obj,
 		       NOUVEAU_VA_SPACE_START,
 		       NOUVEAU_VA_SPACE_END,
 		       init->kernel_managed_addr,
@@ -1978,6 +2012,7 @@ nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
 	struct nouveau_uvma_region *reg;
 	struct nouveau_cli *cli = uvmm->vmm.cli;
 	struct drm_gpuva *va, *next;
+	struct drm_exec exec;
 
 	nouveau_uvmm_lock(uvmm);
 	drm_gpuvm_for_each_va_safe(va, next, &uvmm->base) {
@@ -1989,9 +2024,9 @@ nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
 
 		drm_gpuva_remove(va);
 
-		dma_resv_lock(obj->resv, NULL);
+		nouveau_uvmm_lock_vm_and_obj(uvmm, &exec, obj);
 		drm_gpuva_unlink(va);
-		dma_resv_unlock(obj->resv);
+		drm_exec_fini(&exec);
 
 		nouveau_uvma_unmap(uvma);
 		nouveau_uvma_vmm_put(uvma);
-- 
2.34.1

