Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5963C3E6DC8
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 22:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790892405; cv=none; b=i6QXlHT1aq7CDl3gA6MkFL0lRL6ggjrCvfZyouyIF685SuxzH+IWP4MmOFh8EP9XxhBJzYz4e79VIFKv6Evu7J9+C68w6CdB0QRljlEuoPtK6rAL2hVLMMqcKEYec11mWcgvinOhOBGicUCUFWsVVfn5klTkjd+6i1Biq14HRZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790892405; c=relaxed/simple;
	bh=Gkxa/ZU0HTT7FVxnBWmRJa+T4WwiFvy6mY2mMlw4J7k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iWYbcWbjf53njprUx0IDtf7Carp7Oc19/rj+2lIiviUBbxg/Cb4lQHcrd9gx+Nn9dmuz2sp3NXNPtJdTIEUKD2LfCQQjX8szWYIueCQMsXImnMm4gTGx6bZn+yeqd/G8Qw3S7DkzQGatAuRXjowpAi/KNXztJ2nc2Vp+UCzQ1UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CGKZaSs4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CGKZaSs4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790892401; x=1822428401;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Gkxa/ZU0HTT7FVxnBWmRJa+T4WwiFvy6mY2mMlw4J7k=;
  b=CGKZaSs4k4tn/Rbqcn/wkmMELP8UNYLvYa/oV1CYI9/GB3ItJhDOt+nZ
   eui1Of10dnNq8F7oTO/njw3T1Z1UuHijvh2cuQxpQrr7bY5fXSSrClRdd
   QVABieGx0sm2843UfKMmXpyHWrtFL8mrY4A8fzu9+ulPkWTHVnGiVcRgQ
   qMRpS6XThtX90yXvOzzhy4BgbdD8rks4bMQsO1XFjMXGLVqg7xgCgZNtf
   hynyEdCpAFxXJsw+KVspemmKpjgTgDNmVh0WrU4aJRTKiAD2xYk5x4sVP
   aGH+6feN35JPYY6n9t3BN/lSEwK82wMf2Bbyq1uUpcIOV2BMH45xb83qY
   w==;
X-CSE-ConnectionGUID: c+2vMVcpR52Gkz20lCyp7A==
X-CSE-MsgGUID: 0oAoS3VQTqO17WI4Y3hTjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="91526799"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="91526799"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 15:06:38 -0700
X-CSE-ConnectionGUID: HeBkCAX0RXuhHHOsVR8zNw==
X-CSE-MsgGUID: Dt+EZiP9Tqa46xOAbC72bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="274190019"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 15:06:38 -0700
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
Subject: [PATCH v3 3/8] drm/panthor: lock the resident BOs of a submit last
Date: Thu,  1 Oct 2026 15:06:27 -0700
Message-Id: <20261001220632.3190896-4-matthew.brost@intel.com>
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

panthor_vm_prepare_mapped_bos_resvs() locks every external object mapped
in the VM and then validates the evicted ones. Validation here means
panthor_vm_bo_validate(), which swaps the BO's pages back in and restores
its VMAs. That is slow, and an external object is one which can be shared
with another process, so the whole of it happens while holding dma-resv
locks other processes may be waiting on.

Nothing is gained by holding those. A resident object needs no swapping
in; only the evicted ones do. Split the locking into the two passes
gpuvm now understands: the early pass takes just the evicted external
objects and swaps them in, and the late pass takes the ones which were
resident and are therefore normally ready to use as they are. Private
objects are covered by the VM resv, which is held from the start, so
evicted ones are still validated in the early pass.

The split is only worth it when there is something to validate, so
drm_gpuvm_exec_pass_needs_split() decides, and a submit with nothing
evicted keeps doing exactly what it does today in a single pass.

Both passes run in the same drm_exec transaction, so nothing is unlocked
in between and the late pass only ever adds locks. They take disjoint
sets of objects, so passing slot_count to both still reserves it exactly
once per object.

The early pass reads the evicted state without the object's dma-resv,
that being the lock it is trying not to take. The race is benign: an
object evicted right after the early pass skipped it is picked up by the
late pass instead, which is why that pass still validates.

Validation here allocates pages, which can recurse into panthor's own
shrinker, so it is worth being explicit about what the early pass can
evict. There is no deadlock: drm_gem_lru_scan() acquires the resv with
ww_mutex_trylock() and skips what it cannot get. VM-exclusive BOs share
the VM resv, which is held across both passes, so those are always
skipped. External objects are not held by the early pass, though, so
reclaim can evict one while the early pass validates something else.

That is handled, and is why the late pass validates rather than only
locking: it picks up anything evicted after the early pass looked at it.
The cost is that the swapin for such a BO happens under the full set of
locks, i.e. it degrades to the current behaviour for that one object.

Xe avoids this by refusing to evict BOs bound to a VM the current task is
validating (xe_bo_eviction_valuable() and xe_vm_is_validating()). Panthor
has no equivalent guard. Adding one would make the split more effective
under memory pressure, but it is not needed for correctness, so it is left
as a follow up.

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
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
---
v3:
 - Follow the drm_gpuvm_exec_pass_ function renames (Danilo)
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 55 ++++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index d75d575473da..d4b968ab094e 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -3258,6 +3258,26 @@ int panthor_vm_unmap_range(struct panthor_vm *vm, u64 va, u64 size)
  * need to reserve a slot on all BOs mapped to a VM and update this slot with
  * the job fence after its submission.
  *
+ * When something is evicted the locks are taken in two passes; when nothing
+ * is, a single pass is used, as before. The early pass only takes the external
+ * objects which actually need validating, i.e. the evicted ones, and swaps
+ * them back in. Private objects are covered by the VM resv, which is held
+ * from the start, so they are validated here too. The late pass then takes
+ * the external objects the early pass left out, which were resident and so
+ * normally need no swapping in; it still validates, since one of them may
+ * have been evicted in the meantime.
+ *
+ * The point is that panthor_vm_bo_validate() swaps pages back in, which is
+ * slow, and an external object is one which can be shared with another
+ * process. Doing that while holding the resv of a resident shared BO would
+ * stall whoever else needs it, for no benefit, since a resident object is
+ * ready to use as it is.
+ *
+ * Both passes run in the same drm_exec transaction: nothing is unlocked in
+ * between and the late pass only ever adds locks. The passes take disjoint
+ * sets of objects, so reserving @slot_count in each still reserves it
+ * exactly once per object.
+ *
  * Return: 0 on success, a negative error code otherwise.
  */
 int panthor_vm_prepare_mapped_bos_resvs(struct drm_exec *exec, struct panthor_vm *vm,
@@ -3270,11 +3290,42 @@ int panthor_vm_prepare_mapped_bos_resvs(struct drm_exec *exec, struct panthor_vm
 	if (ret)
 		return ret;
 
-	ret = drm_gpuvm_prepare_objects(&vm->base, exec, slot_count);
+	/*
+	 * With nothing evicted there is no validation to keep the resident
+	 * objects unlocked for, so do not pay for the second walk.
+	 */
+	if (!drm_gpuvm_exec_pass_needs_split(&vm->base)) {
+		ret = drm_gpuvm_prepare_objects(&vm->base, exec, slot_count);
+		if (ret)
+			return ret;
+
+		return drm_gpuvm_validate(&vm->base, exec);
+	}
+
+	ret = drm_gpuvm_exec_pass_prepare_objects(&vm->base, exec,
+						  slot_count,
+						  DRM_GPUVM_EXEC_PASS_EARLY);
+	if (ret)
+		return ret;
+
+	ret = drm_gpuvm_exec_pass_validate(&vm->base, exec,
+					   DRM_GPUVM_EXEC_PASS_EARLY);
 	if (ret)
 		return ret;
 
-	return drm_gpuvm_validate(&vm->base, exec);
+	ret = drm_gpuvm_exec_pass_prepare_objects(&vm->base, exec,
+						  slot_count,
+						  DRM_GPUVM_EXEC_PASS_LATE);
+	if (ret)
+		return ret;
+
+	/*
+	 * Objects the early pass skipped were resident then, but another
+	 * process may have evicted one since. Now that everything is locked,
+	 * pick up whatever is left.
+	 */
+	return drm_gpuvm_exec_pass_validate(&vm->base, exec,
+					    DRM_GPUVM_EXEC_PASS_LATE);
 }
 
 unsigned long
-- 
2.34.1

