Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888E03A5E64
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 16:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871752; cv=none; b=MTilhj3XX8fjJsyC9N8m7rodIjQD64fG9pgQi0pF4/eABv+jO4tTTZTCnysKb3Tk0BKSeDPtvj+1nqgvUYHCDODFdvNsLOfNaAS2+pf84JqxOcv/Z91Owy9knOwmojKXgMlBf/LhOrJ+ugKZSyRuPci2NfffunMeHFpqr9wuASA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871752; c=relaxed/simple;
	bh=7p2/0ufTY76RhZESCVR4gplMNHzihUi+X75tUfbRCz0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aA/D6YwE+v77nRO5256/Va3umiC4ldAhx9FZUHCKTrCexah00ylOFn4RylD6KCCH+ZEjmn6WXEe3uQ4MYvj52O3i4qrR0IaMNZg1bP+5xFANYQLUx2i1a+n392nQc24n3dSBH2G3o+Rv1lpM52H7Qu4F9xO8rgxXzgb7rFvEWd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ko+wrK6F; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ko+wrK6F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790871749; x=1822407749;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7p2/0ufTY76RhZESCVR4gplMNHzihUi+X75tUfbRCz0=;
  b=ko+wrK6F7f5bLebJwS5TVd6DDLh306exVA9lfT7bxa81Zee14umq9NAX
   8xPR1ZDWIiwbkSCftnwwm1igomDqj4q3d24nTUAT83J9hj7CjVv659zqu
   7IzYJ+hsc9scM7dblFUFJ/a6QMgPN0CFl//GdvAaZ9xTC58PTulMfMMsJ
   +Ug7R9i9l2zxgiYlo6QcmqInLsH4KYiQ3JmZQoLSVlD1BvyttsVBMdwgQ
   TJNUG8QzfVIi6HPkrpoj0TTbtXZ/REoxCVR5tJdSuzyFBh0+Mqs0WIHAc
   WyqZlV4Y2bfHC0jPEnz5Z7a7LjE6E+HY/6BrGQt3ECUOwwiescBVn7xB9
   Q==;
X-CSE-ConnectionGUID: JJ6MbE7KSJSH5m/1oQgRhA==
X-CSE-MsgGUID: lDQ0P8p0Q8K+IKM3ifMA8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="102310504"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="102310504"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 09:20:12 -0700
X-CSE-ConnectionGUID: xvmniJQWS9+Evzm9MEMXRQ==
X-CSE-MsgGUID: 8beNYhWNTI6zTY1AYoI2Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="305531781"
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
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 5/5] drm/msm: lock the resident BOs of a VM_BIND submit last
Date: Thu,  1 Oct 2026 09:20:01 -0700
Message-Id: <20261001162001.3123877-6-matthew.brost@intel.com>
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

A VM_BIND submit locks the resv of every BO mapped in the VM, then
validates the evicted ones, which means getting their pages and mapping
them again. That is slow, and external objects can be shared with other
processes, so all of it happens while holding resv locks other processes
may be waiting on, for BOs which needed no work at all.

Use the two pass locking gpuvm now provides. The early pass locks only
the evicted external objects and validates them, along with the evicted
private ones, which the VM resv held from the start covers. The late
pass locks the external objects which were resident, and still validates
in case one of them was evicted meanwhile. When nothing is evicted,
drm_gpuvm_needs_two_pass() says so and the submit keeps using a single
pass.

Both passes run in the same drm_exec transaction, nothing is unlocked in
between, and they take disjoint sets of objects, so reserving one fence
slot in each still reserves it exactly once per object.

This moves validation from after drm_sched_job_arm() and fence
attachment into the locking loop, ahead of everything else, which is
also where a failure is easiest to unwind. The order does not matter to
the shrinker: it skips any BO mapped in a VM whose resv it cannot
trylock, and the submit holds the VM resv throughout, so a BO mapped in
this VM cannot be evicted while it is locked, whether or not a fence is
attached to it yet. The same means the early pass can never evict a BO
the late pass is about to lock, the property Xe gets from
xe_vm_set_validating().

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
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 82 ++++++++++++++++++++++------
 1 file changed, 64 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 5862db05297a..7fcd322db34f 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -266,6 +266,69 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
 	return ret;
 }
 
+/*
+ * Lock and validate every BO mapped in a VM_BIND VM.  Unlike the legacy path,
+ * where submit_pin_objects() only validates the BOs userspace attached to the
+ * submit, userspace does not tell us which BOs a VM_BIND submit uses, so the
+ * entire VM has to be validated.
+ *
+ * When something is evicted, the locks are taken in two passes.  The early
+ * pass locks only the external objects which need validating, i.e. the
+ * evicted ones, and validates them along with the evicted private objects,
+ * which the VM resv held from the start already covers.  The late pass then
+ * locks the external objects which were resident.  Validation means getting
+ * pages and mapping them, which is slow, and an external object can be shared
+ * with another process, so there is no point in stalling that process on the
+ * resv of a resident BO for the duration of it.  The late pass still
+ * validates, in case one of those BOs got evicted meanwhile.
+ *
+ * Both passes run in the same drm_exec transaction, nothing is unlocked in
+ * between, and they take disjoint sets of objects, so reserving one fence
+ * slot in each reserves it exactly once per object.
+ *
+ * The shrinker cannot evict a BO the early pass is about to validate, nor one
+ * it has validated already: it only evicts a BO after trylocking the resv of
+ * every VM the BO is mapped in, and the VM resv is held throughout.
+ */
+static int submit_prepare_vm_objects(struct msm_gem_submit *submit)
+{
+	struct drm_gpuvm *vm = submit->vm;
+	struct drm_exec *exec = &submit->exec;
+	int ret;
+
+	ret = drm_gpuvm_prepare_vm(vm, exec, 1);
+	if (ret)
+		return ret;
+
+	/*
+	 * With nothing evicted there is no validation to keep the resident
+	 * objects unlocked for, so do not pay for the second walk.
+	 */
+	if (!drm_gpuvm_needs_two_pass(vm)) {
+		ret = drm_gpuvm_prepare_objects(vm, exec, 1);
+		if (ret)
+			return ret;
+
+		return drm_gpuvm_validate(vm, exec);
+	}
+
+	ret = drm_gpuvm_prepare_objects_pass(vm, exec, 1,
+					     DRM_GPUVM_EXEC_PASS_EARLY);
+	if (ret)
+		return ret;
+
+	ret = drm_gpuvm_validate_pass(vm, exec, DRM_GPUVM_EXEC_PASS_EARLY);
+	if (ret)
+		return ret;
+
+	ret = drm_gpuvm_prepare_objects_pass(vm, exec, 1,
+					     DRM_GPUVM_EXEC_PASS_LATE);
+	if (ret)
+		return ret;
+
+	return drm_gpuvm_validate_pass(vm, exec, DRM_GPUVM_EXEC_PASS_LATE);
+}
+
 static int submit_lock_objects_vmbind(struct msm_gem_submit *submit)
 {
 	unsigned flags = DRM_EXEC_INTERRUPTIBLE_WAIT | DRM_EXEC_IGNORE_DUPLICATES;
@@ -276,12 +339,7 @@ static int submit_lock_objects_vmbind(struct msm_gem_submit *submit)
 	submit->has_exec = true;
 
 	drm_exec_until_all_locked (&submit->exec) {
-		ret = drm_gpuvm_prepare_vm(submit->vm, exec, 1);
-		drm_exec_retry_on_contention(exec);
-		if (ret)
-			break;
-
-		ret = drm_gpuvm_prepare_objects(submit->vm, exec, 1);
+		ret = submit_prepare_vm_objects(submit);
 		drm_exec_retry_on_contention(exec);
 		if (ret)
 			break;
@@ -784,18 +842,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 	submit_attach_object_fences(submit);
 
-	if (msm_context_is_vmbind(ctx)) {
-		/*
-		 * If we are not using VM_BIND, submit_pin_vmas() will validate
-		 * just the BOs attached to the submit.  In that case we don't
-		 * need to validate the _entire_ vm, because userspace tracked
-		 * what BOs are associated with the submit.
-		 */
-		ret = drm_gpuvm_validate(submit->vm, &submit->exec);
-		if (ret)
-			goto out;
-	}
-
 	/* The scheduler owns a ref now: */
 	msm_gem_submit_get(submit);
 
-- 
2.34.1

