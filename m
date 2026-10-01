Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081A0412264
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 16:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871725; cv=none; b=Saf6cVR8nQPyU2xkhGJQgn5ap1r2vNJEABnKROjhQ/ac0nmYri+Id299rvL9hwChicDfOrh2uupzedK5Jl43ktcye9gxfddWhbDlaCi8abpDKdamUly8m5+v0LSym95RBET1rkL1ktjIBSjveAbwMYXpss2UMtRxoaddl1I4QI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871725; c=relaxed/simple;
	bh=RYpnXhSwvJCHce2LSG4lKsIOYJ15Bt1Em/4u3Ug/82g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VgSMAp1Ne8FN5HqE6R2z/mwmI5jlBV/9jYBndefPn4iYGzkjLOb04dQiEkoS7JuCX6sesHzTItcqDvD/Q5chWSrjPeeKBqiq9tpD9lQ/zQOUFvcw4bjLCek3WFmcEecXx2TsKxteB5+ggjQDuouAU0i591ILe6lG7WWvfJVL3Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZhHHmg/r; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZhHHmg/r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790871723; x=1822407723;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RYpnXhSwvJCHce2LSG4lKsIOYJ15Bt1Em/4u3Ug/82g=;
  b=ZhHHmg/rBprutvHGQWG/vzVxJY0Gc030Md4bZ37xIoSkxtoDwYmEuUnL
   ssqbBkfmH4+Ngyxax8yugWsJC2mX2/6mZ5/pupnzDbUZkYojVI+fsYMTB
   bXVtHE3fC+doB4uKYpxqX+AIPnmBJDMT+6b31Rdos5DDyqdtXnadYxr67
   KuiXgi3r1maRH8up5YnHhwWWphnHZDIp1ZWIkV1YK9HbbrAsnEY5ok4Vo
   MHNt/ZIk7DoAdwNHsZuFdMikbjaw5ZUj2rk9Y4ip11Cc7/Ybo9bqstver
   WU8ZVWViN1cOCEhPHyZS+Nxc8rILs/Q2+0WaRGspHPzgwl/U/o0t73jE2
   Q==;
X-CSE-ConnectionGUID: RYXSGqhaSMSGcQznRIa+og==
X-CSE-MsgGUID: i2EfttsAQ7mpInkdjq8etA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="102310467"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="102310467"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 09:20:12 -0700
X-CSE-ConnectionGUID: RYOn4PXbQCiDdxerYtDPIg==
X-CSE-MsgGUID: g96/4xAkR8O+HemckCgpfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="305531770"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 09:20:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Alice Ryhl <aliceryhl@google.com>,
	Anna Maniscalco <anna.maniscalco2000@gmail.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Liviu Dudau <liviu.dudau@arm.com>,
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
	Thomas Zimmermann <tzimmermann@suse.de>,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v2 2/5] drm/xe: lock the resident BOs of an exec last
Date: Thu,  1 Oct 2026 09:19:58 -0700
Message-Id: <20261001162001.3123877-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261001162001.3123877-1-matthew.brost@intel.com>
References: <20261001162001.3123877-1-matthew.brost@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xe_exec_ioctl() locks the dma-resv of every BO mapped in the VM in one
drm_exec transaction, then validates, rebinds and submits. Any migration
or fault-in a client needs therefore happens while it holds the dma-resv
of every object it has mapped, including the ones shared with other
processes. A client faulting in a large buffer of its own stalls whoever
else has those shared objects mapped, so the compositor it is presenting
to can miss a deadline over a set of BOs it has nothing to do with.

Most of those objects are not ones the exec has to validate. Make the
exec transaction two pass, so that it locks the evicted BOs first,
validates them, and only then locks the resident ones. It ends up
holding exactly the locks it holds today, it just takes the ones it does
not have to validate last, once the expensive work is already done.

Only the external BOs are actually split between the passes. The VM's
dma-resv is held from the start, as before, so the evicted private BOs
are validated in the early pass too, without anything extra being
locked for them.

Nothing is unlocked in between the passes, so this needs no recheck and
no fallback. The late pass can still find something to validate, since a
BO it had not locked yet may have been evicted meanwhile; that is handled
the way it is today, with every lock held.

Two details are worth pointing out. xe_vm_rebind() rebinds the whole
rebind list in one go and attaches a fence to the dma-resv of every BO
on it, so it needs all of them locked; the early pass deliberately does
not hold the resident ones, so it leaves the rebind to the late pass
entirely. That is also the better order, since rebinding allocates page
tables and can therefore evict the very BOs the early pass is trying to
leave alone. And the sched job's fence slot is reserved in the late pass
only, that being the one which holds every lock the transaction is going
to hold, so it is still reserved exactly once per object.

A concern with splitting the passes is that validating in the early pass
could evict the very BOs the late pass is about to lock, moving the work
back under the full set of locks. Xe is immune to this by construction:
__xe_bo_validate() brackets its ttm_bo_validate() call with
xe_vm_set_validating(), and xe_bo_eviction_valuable() walks the
drm_gpuvm_bos of any eviction candidate and refuses the ones bound to a VM
the current task is validating. The early pass therefore cannot evict a BO
mapped in the VM it is validating, whether or not the late pass was going
to lock it. That guard predates this patch; self-eviction is pointless
work in a single pass too.

While at it, xe_gpuvm_validate() is changed to clear the evicted state
with drm_gpuvm_bo_evict() rather than by assigning drm_gpuvm_bo::evicted
behind GPUVM's back, so that the bookkeeping GPUVM now does there is not
bypassed.

Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: Alice Ryhl <aliceryhl@google.com>
Cc: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Liviu Dudau <liviu.dudau@arm.com>
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
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 23 ++++++++++++++++---
 drivers/gpu/drm/xe/xe_vm.c   | 43 ++++++++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_vm.h   |  3 ++-
 3 files changed, 58 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index d5293bc33a67..abe522c19ec9 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -79,8 +79,10 @@
  *	<----------------------------------------------------------------------|
  *	Lock global VM lock in read mode                                       |
  *	Pin userptrs (also finds userptr invalidated since last exec)          |
- *	Lock exec (VM dma-resv lock, external BOs dma-resv locks)              |
+ *	Lock exec early pass (VM and evicted external BOs dma-resv locks)      |
  *	Validate BOs that have been evicted                                    |
+ *	Lock exec late pass (the external BOs left out above)                  |
+ *	Validate any BO evicted since the early pass looked at it              |
  *	Create job                                                             |
  *	Rebind invalidated userptrs + evicted BOs (non-compute-mode)           |
  *	Add rebind fence dependency to job                                     |
@@ -95,15 +97,22 @@
 /*
  * Add validation and rebinding to the drm_exec locking loop, since both can
  * trigger eviction which may require sleeping dma_resv locks.
+ *
+ * Called once per pass, see xe_exec_ioctl(). The fence slot is intended for
+ * the exec sched job and is only reserved in the pass which holds every lock
+ * the transaction is going to hold, so that it is reserved exactly once.
  */
 static int xe_exec_fn(struct drm_gpuvm_exec *vm_exec)
 {
 	struct xe_vm *vm = container_of(vm_exec->vm, struct xe_vm, gpuvm);
+	unsigned int num_fences;
 	int ret;
 
-	/* The fence slot added here is intended for the exec sched job. */
+	num_fences = vm_exec->pass == DRM_GPUVM_EXEC_PASS_EARLY ? 0 : 1;
+
 	xe_vm_set_validation_exec(vm, &vm_exec->exec);
-	ret = xe_vm_validate_rebind(vm, &vm_exec->exec, 1);
+	ret = xe_vm_validate_rebind(vm, &vm_exec->exec, num_fences,
+				    vm_exec->pass);
 	xe_vm_set_validation_exec(vm, NULL);
 	return ret;
 }
@@ -268,6 +277,14 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (!xe_vm_in_lr_mode(vm)) {
 		vm_exec.vm = &vm->gpuvm;
 		vm_exec.flags = DRM_EXEC_INTERRUPTIBLE_WAIT;
+		/*
+		 * Only the evicted BOs need validating, so lock those first,
+		 * validate them, and only then lock the resident ones. A
+		 * client faulting in a huge buffer of its own then no longer
+		 * holds, for the duration of that, the dma-resv of a BO it
+		 * shares with the compositor it presents to.
+		 */
+		vm_exec.two_pass = true;
 		err = xe_validation_exec_lock(&ctx, &vm_exec, &xe->val);
 		if (err)
 			goto err_unlock_list;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2422bfde9177..a39e009892e7 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -357,7 +357,7 @@ static int xe_gpuvm_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
 
 	/* Skip re-populating purged BOs, rebind maps scratch pages. */
 	if (xe_bo_is_purged(bo)) {
-		vm_bo->evicted = false;
+		drm_gpuvm_bo_evict(vm_bo, false);
 		return 0;
 	}
 
@@ -368,7 +368,7 @@ static int xe_gpuvm_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
 	if (ret)
 		return ret;
 
-	vm_bo->evicted = false;
+	drm_gpuvm_bo_evict(vm_bo, false);
 	return 0;
 }
 
@@ -377,31 +377,59 @@ static int xe_gpuvm_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
  * @vm: The vm for which we are rebinding.
  * @exec: The struct drm_exec with the locked GEM objects.
  * @num_fences: The number of fences to reserve for the operation, not
- * including rebinds and validations.
+ * including rebinds and validations. Zero reserves none, which is what the
+ * %DRM_GPUVM_EXEC_PASS_EARLY pass wants.
+ * @pass: The &enum drm_gpuvm_exec_pass @exec was locked for.
  *
  * Validates all evicted gem objects and rebinds their vmas. Note that
  * rebindings may cause evictions and hence the validation-rebind
  * sequence is rerun until there are no more objects to validate.
  *
+ * In the %DRM_GPUVM_EXEC_PASS_EARLY pass only the validation is done, and
+ * only for the objects whose dma-resv @exec holds. The rest, along with the
+ * rebind and the fence reservation, is left to the
+ * %DRM_GPUVM_EXEC_PASS_LATE pass of the same transaction, which locks
+ * everything.
+ *
  * Return: 0 on success, negative error code on error. In particular,
  * may return -EINTR or -ERESTARTSYS if interrupted, and -EDEADLK if
  * the drm_exec transaction needs to be restarted.
  */
 int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
-			  unsigned int num_fences)
+			  unsigned int num_fences,
+			  enum drm_gpuvm_exec_pass pass)
 {
 	struct drm_gem_object *obj;
 	int ret;
 
 	do {
-		ret = drm_gpuvm_validate(&vm->gpuvm, exec);
+		ret = drm_gpuvm_validate_pass(&vm->gpuvm, exec, pass);
 		if (ret)
 			return ret;
 
+		/*
+		 * xe_vm_rebind() rebinds the whole rebind list in one go and
+		 * attaches a fence to the dma-resv of every BO on it, so it
+		 * needs all of them locked. The early pass deliberately does
+		 * not lock the resident ones, so leave the rebind to the late
+		 * pass, which holds everything.
+		 */
+		if (pass == DRM_GPUVM_EXEC_PASS_EARLY)
+			continue;
+
 		ret = xe_vm_rebind(vm, false);
 		if (ret)
 			return ret;
-	} while (!list_empty(&vm->gpuvm.evict.list));
+	} while (drm_gpuvm_has_evicted(&vm->gpuvm, pass));
+
+	/*
+	 * The early pass reserves nothing. It attaches no fence itself, and
+	 * the objects it locks are still locked in the late pass, whose own
+	 * reservation below walks every object the transaction has
+	 * accumulated and so covers them too.
+	 */
+	if (!num_fences)
+		return 0;
 
 	drm_exec_for_each_locked_object(exec, obj) {
 		ret = dma_resv_reserve_fences(obj->resv, num_fences);
@@ -446,7 +474,8 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
 	 * The fence reservation here is intended for the new preempt fences
 	 * we attach at the end of the rebind work.
 	 */
-	return xe_vm_validate_rebind(vm, exec, vm->preempt.num_exec_queues);
+	return xe_vm_validate_rebind(vm, exec, vm->preempt.num_exec_queues,
+				     DRM_GPUVM_EXEC_PASS_ALL);
 }
 
 static bool vm_suspend_rebind_worker(struct xe_vm *vm)
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 89c4f95984a2..e4f184752840 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -282,7 +282,8 @@ static inline void xe_vm_reactivate_rebind(struct xe_vm *vm)
 int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
 
 int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
-			  unsigned int num_fences);
+			  unsigned int num_fences,
+			  enum drm_gpuvm_exec_pass pass);
 
 struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
 				       struct xe_exec_queue *q, u64 addr,
-- 
2.34.1

