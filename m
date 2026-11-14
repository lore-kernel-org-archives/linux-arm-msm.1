Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794644359;
	b=h9iVVOe3Osrf1Ey560Z/9zl9kGsXEbYFdxBQ/L3W+sOG1w8hfJLeJZT6+cga26ziYx0C
	 EQVjxkgz+ciS8PfoG7cMNzDXNcSA98qZptrafoFDTyOlaRo+8Tmgv5Hf9memvcfAzYBkA
	 iPHkEaTD64+6TerN9Tt34ywvNuSd1bNVKuFKQn0Ouid/9zx818zKiy1rP1q48WDfZjzLA
	 CGhuTkE7yOOqaRELO3IRRzfmMDJCCVwlqnRdPdtavExohMBd1poKcMYrKdwRlwa4aO8c8
	 UO0Y3TiGlH8Ag+fAbcvoolEYpmM8pwagBFdkWE0krvkXgy7WsBSKaxvv1VGScaJS27Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794644359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=F88s34t6HgwaWc7KrjRKtNSJ/J1MLEeihPOI9axIS0Y=;
	b=0tvV6BDCtxUOeon2cXP3WlTuOW8MYgFmxSj58HL4vmscubM9vb0wA/BJlyKqH9ac6HQI
	 6IR8MgnPlLckksNzZj8x+SPji/iQGdu2SCmEHWmbJfZh9hjYQx7/Zo361z0xxmLR2E5TY
	 bfqEAX/3Q9y6Oo/G/PNFFLKnfBGdZQDLF1uOtmab/j+yRntZwG0lfvWen66ZPA5lA3unV
	 81XCIphG7IKySExRC9JY5jLD3xmTyaNVJDgpfvxhY/ZVw/UGyopzFhkbvkr/BfqXEiQRB
	 +9kMf517aArq+yLYy82P+uETzhOnnySajRPamSAvADYsXpRlCBkx6aPtdgxEO/+kdiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SFNz83mT;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D9F606A334
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 08:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8D9F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SFNz83mT
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36ca32a0faeso191982eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 00:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794644358; x=1795249158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F88s34t6HgwaWc7KrjRKtNSJ/J1MLEeihPOI9axIS0Y=;
        b=SFNz83mTcOPA3L7JSEyJ8LE8yDR/LmyRE4ocGf+ufqZMrtJYjCOsx7Eiq6jc1sq11P
         BtM4cpYHk3vO1Nrs3lziT0EVlW+N59TOsGut+vCLDEFCyYmekQsJD9xGI/c+pVbuX14M
         GIDoB6wGo1SoPXoYgNG2jvSxfL4l83t34FE7t7CLlQ5OpSQ8Sg6hYdMc+yQsf5AL9sir
         FkaA9K66OUMpCzXIjcPmb/ns751UeJukzieZ5gZjo1l3nv4uEFclv1U/iceveItZhhuh
         kbkl91Rb7uU9tbT6y/U2weZwvb6CpTdbuNfgAjpizMYppqHMYY8PDYd81sRXLBPTCXLf
         V6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794644358; x=1795249158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F88s34t6HgwaWc7KrjRKtNSJ/J1MLEeihPOI9axIS0Y=;
        b=yqFVcB8JG6bF6djtgIqpx6DpT8GzsKKwc/T7ejeVA1sYH04YM0KyHVE1q1SCNCr3Hu
         mZE8hnCHCNsR7CZv9FTYdSdWWEaYX5KRaC2ZAuCX8ph/vlxyrw3ZwKV+hhMonCObuDKH
         fvH/BMtwNgICuo25blgfMrLpzuoExVwBr7omarKzsqi1TI5T/z1uw35YeWqI5z5uomtq
         aAp4ENwMBe1PYEvVOamprF14pJjMzQq8DYpMs4DKxOB0sdMq7DG4TuhZPV1x/LqN7PdA
         XkqHdy1m5OZFRkrEaRtk8uXBmCzX1gFDak03vUVeyj3iMAOPqoJRfHV15iK4jWp/qLGK
         eAGA==
X-Forwarded-Encrypted: i=1; AL+hErGLJ/TeXsUMO6s1T2ITrUJ8T9Vi+F0K0l0DXVXkQ2g4lxFYBs+fbCr0bNnjKrhxxKJawtoKxN7nB2ug+Aqx@vger.kernel.org
X-Gm-Message-State: APuU4Z9MhuL/1jgBuvWlODjUcXRgwp/Ky5tWOMmvdgWz4yqJKvMirIdC
	n1Sl/MNlFdrliAKCfg3ARmCmAl547VMgE7RHamByVgePXN0U2/fwtgDF
X-Gm-Gg: AYBFou05QDPnH6sa4R3tKeNNL8mybRF7YrMWVqpxq+Fk+fy4wtM8A6ld1WjEfZUSrTK
	owCwVmCUW0TmXwVBne+J7S7ABWgqsOaD00WFk1NVQJryKCNek61Z8ePq9QqxmJwRSML5RvmX1K/
	KgcPxlwkfIWuV/suk9KgYyHxamPm2c3gjhRMCP4AsjsuXjltpIgYjZOWrF0xoL53hK9rR8AlHZN
	2TiPm/j2a5hEgRFWjHpE27NDPuYJxPW8s035I2nwfbDdskGJLISHfJsu5rGd92BKm3to1zm6iGB
	kwm50I2GReEgww1UTdRfiV5ZZX52Btk0z/D9XP49L4P76IbJeDk41z6jSfEbRDa1YXDNW8RTjhT
	ftyc1p4NqZ79E6YTEtmENoEV6fEswmbvtGELKr4iq9wwmW2K3JzR230c5Y83z/SUT0q+C0kT5n1
	h/XzfHDqllMBGiP3M/0DvbnLw4OXpIt9G0N0gd+VeO13wQbZ5K9FetLo5+VoulkcrZR40/mcpjC
	1H//RuAhaQ8wJdsNGL7xbHi8GqGZAKzTr+uis2CH3z8Itgbig962lS707lzwwdbNeK3EOG9CA9M
	jl4BjWW3bG7BrTTX9TBzYPia+tDxg109R72knACZniqKnUAH2C6N+7Qh2Ho5upB+oPscQcRG+lS
	uazg=
X-Received: by 2002:a05:7301:a0a:b0:36c:a1bc:6114 with SMTP id 5a478bee46e88-3796038259fmr6915918eec.0.1794644357643;
        Sat, 14 Nov 2026 00:19:17 -0800 (PST)
Received: from DESKTOP-CJ1L666.localdomain ([211.198.99.62])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm14008333eec.3.2026.11.14.00.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:19:17 -0800 (PST)
From: Jiwoo Kim <arpe1618@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Antonino Maniscalco <antomani103@gmail.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/3] drm/msm: Release the pins and ops of a VM_BIND job that never ran
Date: Sat, 14 Nov 2026 17:19:00 +0900
Message-ID: <20261114081902.1669-2-arpe1618@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114081902.1669-1-arpe1618@gmail.com>
References: <20261114081902.1669-1-arpe1618@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

msm_vma_job_run() applies the pgtable updates that vm_bind_job_prepare()
queued for a VM_BIND job, drops the GEM object references that
vm_op_enqueue() took for them, and unpins the BOs of the job. A job can
also be freed without having run: when its entity is killed, e.g. on
SIGKILL while the process exits, and when msm_ioctl_vm_bind() fails
part-way through vm_bind_job_prepare() or after it. msm_vma_job_free()
then frees the queued ops without applying them and without dropping
their references, and a killed job also keeps its BOs pinned. Besides
the leaks, the VM no longer matches its pgtables: for example, the
pages of a VMA that was unmapped from the VM are still mapped.

In msm_vma_job_free(), apply the queued updates the way
msm_vma_job_run() does on error: skip the maps, but apply the unmaps,
so that their references can be dropped without freeing pages that are
still mapped, and mark the VM unusable. Move that part of
msm_vma_job_run() into a helper for this. Also clear bos_pinned once
msm_vma_job_run() has unpinned the BOs, as msm_job_run() does for
submits, and unpin the BOs of a job that still has them pinned. The
job's fence does not keep them busy anymore at that point, so take the
object lock to unpin them.

This also marks the VM unusable when msm_ioctl_vm_bind() fails after
vm_bind_job_prepare() has queued updates, i.e. when the first op fails
part-way or when sync_file_create() fails. The VM is then left
partially updated, as when a later op fails.

The patch and its changelog were drafted with an AI coding assistant.
The issue has not been reproduced, and the change has only been
compile-tested.

Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-214234@kernel.org
Signed-off-by: Jiwoo Kim <arpe1618@gmail.com>
---
At commit 2e6a8a1fe2b2, msm_vma_job_run() still unpinned the BOs under
the object lock, and msm_gem_vm_unusable() did not exist yet, so older
stable trees need an adapted backport.

 drivers/gpu/drm/msm/msm_gem_vma.c | 65 +++++++++++++++++++++++--------
 1 file changed, 49 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 8b702422030a..a6f106d0cdef 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -700,16 +700,16 @@ static const struct drm_gpuvm_ops msm_gpuvm_ops = {
 	.sm_step_unmap = msm_gem_vm_sm_step_unmap,
 };
 
-static struct dma_fence *
-msm_vma_job_run(struct drm_sched_job *_job)
+/*
+ * Apply the pgtable updates queued for a job, and drop the references that
+ * the ops hold.  If ret is an error, or one occurs, the remaining maps are
+ * skipped, but the unmaps are still applied, as the pages they unmap must
+ * not be freed while they are still mapped.
+ */
+static int
+vm_bind_job_apply_ops(struct msm_vm_bind_job *job, int ret)
 {
-	struct msm_vm_bind_job *job = to_msm_vm_bind_job(_job);
-	struct drm_device *dev = job->vm->drm;
 	struct msm_gem_vm *vm = to_msm_vm(job->vm);
-	struct drm_gem_object *obj;
-	int ret = vm->unusable ? -EINVAL : 0;
-
-	vm_dbg("");
 
 	mutex_lock(&vm->mmu_lock);
 	vm->mmu->prealloc = &job->prealloc;
@@ -740,6 +740,22 @@ msm_vma_job_run(struct drm_sched_job *_job)
 	vm->mmu->prealloc = NULL;
 	mutex_unlock(&vm->mmu_lock);
 
+	return ret;
+}
+
+static struct dma_fence *
+msm_vma_job_run(struct drm_sched_job *_job)
+{
+	struct msm_vm_bind_job *job = to_msm_vm_bind_job(_job);
+	struct drm_device *dev = job->vm->drm;
+	struct msm_gem_vm *vm = to_msm_vm(job->vm);
+	struct drm_gem_object *obj;
+	int ret;
+
+	vm_dbg("");
+
+	ret = vm_bind_job_apply_ops(job, vm->unusable ? -EINVAL : 0);
+
 	/*
 	 * We failed to perform at least _some_ of the pgtable updates, so
 	 * now the VM is in an undefined state.  Game over!
@@ -753,6 +769,8 @@ msm_vma_job_run(struct drm_sched_job *_job)
 		msm_gem_unpin_active(obj);
 	}
 
+	job->bos_pinned = false;
+
 	mutex_unlock(&dev->gem_lru_mutex);
 
 	/* VM_BIND ops are synchronous, so no fence to wait on: */
@@ -766,26 +784,41 @@ msm_vma_job_free(struct drm_sched_job *_job)
 	struct msm_gem_vm *vm = to_msm_vm(job->vm);
 	struct drm_gem_object *obj;
 
+	/*
+	 * In error paths, and if the job was killed before it ran, we could
+	 * have unexecuted ops.  Their changes were already made to the VM, so
+	 * apply the unmaps, and give up on the VM.
+	 */
+	if (!list_empty(&job->vm_ops)) {
+		vm_bind_job_apply_ops(job, -ECANCELED);
+		msm_gem_vm_unusable(job->vm);
+	}
+
 	vm->mmu->funcs->prealloc_cleanup(vm->mmu, &job->prealloc);
 
 	atomic_sub(job->prealloc.count, &vm->prealloc_throttle.in_flight);
 
 	drm_sched_job_cleanup(_job);
 
+	/*
+	 * A job that was killed before it ran still has its BOs pinned.  The
+	 * job's fence does not keep them busy anymore, so take the object lock
+	 * to unpin them.
+	 */
+	if (job->bos_pinned) {
+		job_foreach_bo(obj, job) {
+			msm_gem_lock(obj);
+			msm_gem_unpin_locked(obj);
+			msm_gem_unlock(obj);
+		}
+	}
+
 	job_foreach_bo (obj, job)
 		drm_gem_object_put(obj);
 
 	msm_submitqueue_put(job->queue);
 	dma_fence_put(job->fence);
 
-	/* In error paths, we could have unexecuted ops: */
-	while (!list_empty(&job->vm_ops)) {
-		struct msm_vm_op *op =
-			list_first_entry(&job->vm_ops, struct msm_vm_op, node);
-		list_del(&op->node);
-		kfree(op);
-	}
-
 	wake_up(&vm->prealloc_throttle.wait);
 
 	kfree(job);
-- 
2.43.0

