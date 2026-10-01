Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA4B3D9672
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 16:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871721; cv=none; b=hBFfXmNdcAU/oOQrRZmCRL3EyBStFlw6jHhZHyfnKmWOLqDZEBuv8yUXZWDK5joV416/95omYy4j7ml7+Cgz5y/nhG4u8TTfZCY0cqjuLrmeI55ie2LimcNPA5jj8VKgOuhabhtLXceFwQE6Hpd2kmc5nF/wMr45nLgLkAANrnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871721; c=relaxed/simple;
	bh=e7Yg3tsIXrm50gxHDaBeCUWmNZZ8Isz3nY1XscNzUaY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=PCE4kFjf/SsvLTQtGJ3pYeN+e9Nro+mmHz3SiSZwKkJ387bNrzp4ks1kwe832lSjctmynATb9VPUY0ip9Bcg+P7vbp8KlWUaE5EYeEqwuV8/ClT64hl9YtT85+fYH5Fs1wOcuOrMRi9EPBbchYE/+37sRzDwCh8mJlfwzwACJs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=meI1onwp; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="meI1onwp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790871719; x=1822407719;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=e7Yg3tsIXrm50gxHDaBeCUWmNZZ8Isz3nY1XscNzUaY=;
  b=meI1onwptNUmYXODIyq7MCfDmcvY9m1tgD06z0NRa/IXRaLFlT/s1cap
   5/kE/gdKeYwVQnlDcCVZk5AYDem3ScWKgzwzdGZp/v0C0F+8vJx8qL9nQ
   jSuMLIl/oGL1ifSnqfYSwaebXTd4BWZv+CE1ZoB8AXTiiNr/Iuixwc0mD
   VEOhAGZwOjlR4w94Dy/KYGIADlrn2sQJOLBxgTckfN73uORH7fPtfWw7P
   IIWSvOcFebl02assXnuSJmpLK9/vahaAepatNnOFlKk7oYl1dojWFFzHS
   xAz/j3GooGR/eZeFXnsI1qB/0Xj4xfmkKPU7tpBA7PMDsAW05L5Fl9SmR
   Q==;
X-CSE-ConnectionGUID: zhUovzCBQmuKDt3w8CdLOA==
X-CSE-MsgGUID: H3YHM0amTr+IqMNMjJmvog==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="102310413"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="102310413"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 09:20:11 -0700
X-CSE-ConnectionGUID: ErPrybqwQB2cFaFqrso6Bw==
X-CSE-MsgGUID: 6nLj4i7aRhmdLIftav/KwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="305531763"
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
Subject: [PATCH v2 0/5] drm/gpuvm: two pass locking for exec
Date: Thu,  1 Oct 2026 09:19:56 -0700
Message-Id: <20261001162001.3123877-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Two processes share a set of buffers, and each has buffers of its own
which the other never sees. Say process A has mapped

  S        the shared buffers, also mapped by B
  P        buffers private to A

and B has mapped S plus private buffers of its own. The overlap is
exactly S, and the work each process wants to do on its own buffers is
independent of the other.

A submits. Its exec locks the dma-resv of everything it has mapped, S
and P both, then finds something in P has been evicted and migrates it
back in. B submits, and blocks on S for as long as that migration takes,
even though the migration is of a buffer belonging to A which B has
never seen.

So the stall does not come from the overlapping set. The buffers in S
are resident, and neither exec has anything to do to them beyond
attaching a fence. They are held only because an exec locks everything
it has mapped in one go, and they stay held until the slowest unrelated
thing in that transaction is done.

Which buffers get evicted is a separate matter, and one which already
has answers: eviction heuristics which leave shared buffers alone, or
one process' allocations outranking another's. This is what is left once
those work.

Where this tends to show up is compositors and presentation, which is
also where userspace has worked hardest to avoid it. Wayland explicit
sync exists so that a compositor is not latched onto its clients'
rendering, waiting on fences it never asked for. The locking above
reintroduces that coupling anyway, in the kernel, and does it under
memory pressure, which is where a missed frame is least welcome and the
cause is hardest to see.

The fix is to stop coupling "lock the VM" to "validate it". Instead of
locking everything and then validating, lock the private buffers and the
evicted external ones, validate those, and only then lock the rest, all
within the same drm_exec transaction.

Patch 1 lets a driver split the locking of an exec that way, patches 2
and 3 use it in Xe and Panthor, whose panthor_vm_bo_validate() swaps
pages back in under those same shared locks. It is opt-in, and drivers
which do not ask for it are unaffected.

Patches 4 and 5 do the same for MSM. Its VM_BIND submit path locks every
BO mapped in the VM and then validates the evicted ones, which means
getting their pages and mapping them again, with the shared BOs locked
throughout. Patch 4 switches VM_BIND VMs to DRM_GPUVM_RESV_PROTECTED,
which two pass locking requires, and patch 5 splits the submit's locking
into the two passes. Kernel managed VMs and the legacy submit path are
left alone.

The MSM part should resolve exactly the problem Anna Maniscalco
presented at XDC, render jobs stalling the compositor on shared buffers,
which is currently worked around with a downstream hack in MSM for
SteamOS [1][2] (the talk starts at 5:30).

[1] https://indico.freedesktop.org/event/12/contributions/627/
[2] https://www.youtube.com/watch?v=j5W5ErEMnvM&t=330s

Matt

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
Assisted-by: LLM

Matthew Brost (5):
  drm/gpuvm: allow locking external objects in two passes
  drm/xe: lock the resident BOs of an exec last
  drm/panthor: lock the resident BOs of a submit last
  drm/msm: use DRM_GPUVM_RESV_PROTECTED for VM_BIND VMs
  drm/msm: lock the resident BOs of a VM_BIND submit last

 Documentation/gpu/drm-mm.rst          |   6 +
 drivers/gpu/drm/drm_gpuvm.c           | 480 +++++++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_gem_submit.c  |  82 ++++-
 drivers/gpu/drm/msm/msm_gem_vma.c     |  15 +-
 drivers/gpu/drm/panthor/panthor_mmu.c |  53 ++-
 drivers/gpu/drm/xe/xe_exec.c          |  23 +-
 drivers/gpu/drm/xe/xe_vm.c            |  43 ++-
 drivers/gpu/drm/xe/xe_vm.h            |   3 +-
 include/drm/drm_gpuvm.h               | 133 ++++++-
 9 files changed, 784 insertions(+), 54 deletions(-)

-- 
2.34.1

