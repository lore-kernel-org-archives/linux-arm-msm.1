Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C15D49553A
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 22:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790892409; cv=none; b=GlnJT0ZWbOD+BKiJjQKzkkwbJvDG0/Hls6ricHKlUIfYVONtiAGxAhHDCoT1sxzqaRyVQPcWFf7V+YkxLQIr1Up3gRZ8WwHgn+pCQ8HOSuIg2nbX0HvkQe0rY3YzwEcP5v9Rx69grG5339lP3KZ6JRkOoX9U01hM2WJrVsjeoOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790892409; c=relaxed/simple;
	bh=nShlwXN3ugnLH6PEjrBBAK63VVeVaCaBg/2DmPXujvY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cuqwzs08Q7wOhB5o451gz7S9JXxCmR5WlTHvBcWpOkK/9Pb1AEeknD9zNsZJ0UdSxjMpKBbJJpCk0tLDLpDyKQESt93p0g2hAeIPqjY3jq9+pF+F+3Cl2ITG8a8dinUW9NvOSoRjsRAFqfSQpDwPmS9rArma8kY2Dnoq42uft0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ipwF/o48; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ipwF/o48"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790892406; x=1822428406;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nShlwXN3ugnLH6PEjrBBAK63VVeVaCaBg/2DmPXujvY=;
  b=ipwF/o48kJ9gjwsqsaQzMp7gdgV0r1PAuWFvAHRWktE0wOF2Kn16Yzq9
   7Vu5VY7yXN22uaojYYjIbpfUOG/k0dd48WUhn6+c6YoJx8dfDhLAAhSGn
   yijvzDVwVQ94c6SWJpUQQTDbKW4XHsHCVgeFA5taZMNxz/vgxu4XEMu6/
   KkKTqzJLNylEr6MdrIe25sfajiHIrFRKrgV8CiulIeEwXFQ5dIM++hlxC
   PkH1N2zO5sYQ5eWEXJkoXTCzoA5t/kMaSnfSkawP782lJBiWyntyF5FC7
   UbBIDW1aGKMTvWR/Z4nQ57IMMTT+nxsQegBiiqjZQlAeo6dUTSQbmerwj
   A==;
X-CSE-ConnectionGUID: lHB9Kcq8RdCrXEH73FtIJQ==
X-CSE-MsgGUID: 3yxi41m4TuSbKdpT2V5dPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="91526880"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="91526880"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 15:06:39 -0700
X-CSE-ConnectionGUID: EVoH8hZLQmOkrzcczCffOQ==
X-CSE-MsgGUID: CZ7be2fDROOrygK9oWL/zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="274190036"
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
Subject: [PATCH v3 8/8] drm/nouveau: lock the resident BOs of an exec last
Date: Thu,  1 Oct 2026 15:06:32 -0700
Message-Id: <20261001220632.3190896-9-matthew.brost@intel.com>
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

nouveau_exec_job_submit() locks every BO mapped in the VM, then
validates the evicted ones while holding all of those locks. A client
paging a large working set back in therefore keeps the dma-resv of every
BO it shares, e.g. with the compositor it presents to, locked for as
long as that takes, stalling the other side for no reason.

Use the two-pass locking drm_gpuvm now provides. Validation moves from
after drm_gpuvm_exec_lock() into its per-pass extra.fn callback, so the
early pass validates the evicted BOs while the resident external ones
are still unlocked, and the late pass locks those and validates
anything that was evicted in the meantime. drm_gpuvm_exec_lock() falls
back to a single pass when nothing is evicted.

Validation now runs under the uvmm mutex, like it already does for bind
jobs in bind_lock_validate().

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
 drivers/gpu/drm/nouveau/nouveau_exec.c | 27 +++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
index eea6619cffaa..b9ab7da125b1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_exec.c
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
@@ -85,6 +85,18 @@
  * the corresponding VM_BIND jobs they depend on - attached to them.
  */
 
+/*
+ * Called once per pass of drm_gpuvm_exec_lock(), validating whatever that pass
+ * locked. The early pass validates the evicted BOs before the resident ones
+ * are locked, so that a BO shared with another client, e.g. a compositor, is
+ * not held locked while this job's evicted BOs are moved back in.
+ */
+static int
+nouveau_exec_job_validate(struct drm_gpuvm_exec *vme)
+{
+	return drm_gpuvm_exec_validate(vme);
+}
+
 static int
 nouveau_exec_job_submit(struct nouveau_job *job,
 			struct drm_gpuvm_exec *vme)
@@ -99,21 +111,14 @@ nouveau_exec_job_submit(struct nouveau_job *job,
 	if (ret)
 		return ret;
 
+	vme->two_pass = true;
+	vme->extra.fn = nouveau_exec_job_validate;
+
 	nouveau_uvmm_lock(uvmm);
 	ret = drm_gpuvm_exec_lock(vme);
-	if (ret) {
-		nouveau_uvmm_unlock(uvmm);
-		return ret;
-	}
 	nouveau_uvmm_unlock(uvmm);
 
-	ret = drm_gpuvm_exec_validate(vme);
-	if (ret) {
-		drm_gpuvm_exec_unlock(vme);
-		return ret;
-	}
-
-	return 0;
+	return ret;
 }
 
 static void
-- 
2.34.1

