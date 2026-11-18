Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794967658;
	b=WU9XfuP/8uyCWRGR+TW3mDHIvR8g4kXa1Ny1bwz3046GN73fiJOmeVsu4qSQkBvC5DZT
	 pOGVXv1jer6ZuIYS8TOkUEwZpPUdIPWKKwdGxofnkdMn255xCTpxjxGZ/qATjG/c1hilD
	 SUupESDcj0gSZ1S9Z4yqUv9e4QVBWIBtvSU3+e+eLs/iO851QqgyijhuPO0rkmRheAMzX
	 vn/TpcdUo3jBfki7doxJfyE+K/lM4IWLgY6EfLXR97DKsIMdisQ9qu+IYZe/fNC30JQfR
	 czAWB/UZhCklpXKqAQv15Iacy5bzgiznQZk/Bgv4zlhVTj8t6M3sBrGKty38FYLo2hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794967658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I3dICNFdr3DWOw64MCFV6kwJXPRZS9N3sYYYv1odNCg=;
	b=IrfYaWLabIt3gGNkvvFF7AyQcFYZSYs71LKGcTPW0TYOryJPYp9yH2bcm43eXYHMdf75
	 4bTtPu4Bsy2KE4fnI+7oLUhtrM9sLSmBt6KKb39dINgXVHwE64Yz1pt0gj3zndjN1IoOl
	 J5AN9wBHrzpqbqLor69M41Ump10+7R9oVUOEVNYfq2HdOWXKjEEbRypBMdN8HZXQJEQ+C
	 VL8LkxWRM62gBS1HIf5nFyMaxkIu+xOZpnk5/tULd0npgEMvq7sGp7hA8SYXtE9mJ3/Kp
	 oafMVepXHZRXDmTsGdfvB8NmFRbMGj7r2a5SjK2Ji4BhaDju7BPOTPhTjmmsW9RVrOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rW/FqazR";
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A7E606A325
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 02:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48A7E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rW/FqazR
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b50dc340d9so8389c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 18:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794967656; x=1795572456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I3dICNFdr3DWOw64MCFV6kwJXPRZS9N3sYYYv1odNCg=;
        b=rW/FqazRx3zlL3YL6FOpQfwkRN6NoD6Si7NnEARLi9tli8HwtpNXr4iworsjELCS4c
         Tar/QuTVdzq8rGRWsOhcq4FckyfGbsXpBuHPhjxPYUhExMm2EOHzr1Cv0leEbYD2EN/K
         qiRxA+g10crwoTaRLYb8eBXFJDxNrkdUuAk27jnWFurncIXjYjW4B4vblYPFOKiu08QT
         oWmep4qa+aOxWqoqUBd6m0KHQIpY6yidCZZZA5GCUnOPU5fE45IgVEP2vg6onqNRWN51
         Fmll0uc1idWqc6TraC//A/EyNT8FeSsV6aA3XFrQy5alDU6dtMAvV4w92Lsgz/ytMekd
         D5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794967656; x=1795572456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I3dICNFdr3DWOw64MCFV6kwJXPRZS9N3sYYYv1odNCg=;
        b=ZywnsW3X+ZcC/XuWOxWvEwUyT5wkWmOp5kOgeJVr2jhGCSo4n3bgi7h9Gr7YA0gU9q
         z39OlSQwLZvkuqMItemgq2rLJo9smy+uIsi4Vvhjwyes5KMN+m3l5rdzFf+rgItg296t
         Dw9ZsXr3GD7S79lq2ub52Fyb0VRKEngnBL8KvqwTcU8iu/c7zAnEjeN4Uo7FR77cbyhG
         TdnF/ThOY6eFYw12vOFRv8GlDyFn1SbhwP1SmfV4FISvl1Wx4th/gP+Kcx8Woi2gm1cp
         YVXyQSnfPuZdu80vNYh2uVXLubfDc3/mlOpgOjv0S51pABHCLyQI4SXagtLtjGospkaJ
         iSmg==
X-Forwarded-Encrypted: i=1; AL+hErFJkvgljvO5s/xo4btoWnFMa5bajbResxAOgiXYVTVAWO9LcCz2hq59E5vM1XhT2guyLu5r/iLYiSVI6obN@vger.kernel.org
X-Gm-Message-State: APuU4Z/5gfDw2Ndkjdt5aFvoHh7kAKo+KSbSlB8spfFPqmT8AVIatPj2
	cSLXX8OTfY00YiztLactvpiO71EKlFGc5n2G3JW/h+rIkzsGpmyca3F8
X-Gm-Gg: AYBFou2Im0eTWrCZGj7a6hrtR0fu0cOoJi9TSKr9c0qF7ddiKV10+A6Qaxbqyk2gck1
	kTz4xmQc3k0YIZZn/azlbSNRLcDLOOknc2RgVibK5DRt7LNBj8fwHo4fgdi9NcWQEqP+kjtpmeR
	WOY4CyMqZIUFeqwW2lLlF5JB9dSKPs8lrwhlXcRj+5IQ8tSKwKuDkRZHnTCy7613x6GIzQ4m9PN
	hb1LUlGl5WD2URvnVvu7nKkvW3VMBB1685OA5cIKpk/LG4LGCKpW7WSXb7G5fqMcB2D56p1vYuz
	vWmvjGk/IX6mJkCnMyCeyKj6uLZjO+O7YkhpIe9mKEVzVM/1erVzxadBgI/6jFP7SAwCD+M4tzG
	yfBzxglUNAuHYs/eq+7Yyqirot/XScnzzWoZeNhlxlXOJWSNOd/Z3doUegBSteqVdj95EG0AIOI
	IMGHyVsd/t0aGvxzBWCgr8qvB75CEgJDNbYn2uQPRWzbHG+ojwi2D/RDxqYY3ZIcEx9nSkp715y
	pXiHONQ+YEIGYcIQTvRSR+ms+wEEuiTj71sm5uG41XEdQjlt03ZxS63Kp3qepzM0xdTYg7MLb1u
	9pJzvkJucB0R4zIUq/l9OJ5ZgR5IPS+TMTE10J1r+tgXyVL7vO/NPyGTGt+YW8F1HHBZvK8czQp
	uQykbhvA=
X-Received: by 2002:a05:701b:2706:b0:183:d275:cf76 with SMTP id a92af1059eb24-1b543b93021mr2097351c88.2.1794967656267;
        Tue, 17 Nov 2026 18:07:36 -0800 (PST)
Received: from DESKTOP-CJ1L666.dankook.ac.kr ([220.149.255.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b544784008sm2862327c88.5.2026.11.17.18.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:07:35 -0800 (PST)
From: Jiwoo Kim <arpe1618@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Anna Maniscalco <anna.maniscalco2000@gmail.com>,
	Julius Bairaktaris <julius@bairaktaris.de>,
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
Subject: [PATCH v4 2/5] drm/msm: Mark the VM unusable on out-of-order VM_BIND unmaps
Date: Wed, 18 Nov 2026 11:07:13 +0900
Message-ID: <20261118020716.1698-3-arpe1618@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118020716.1698-1-arpe1618@gmail.com>
References: <20261118020716.1698-1-arpe1618@gmail.com>
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

msm_ioctl_vm_bind() updates the VMAs of the VM right away, and queues
the matching pgtable updates on the job, but the VM_BIND jobs of
different queues are not ordered against each other. A job can thus
unmap a VMA before the job of another queue that maps it has run. The
unmap then finds nothing mapped, and drops the reference that its op
holds on the object. When the map runs after it, the pages it maps are
neither tracked by a VMA nor kept alive by a reference once that job is
done.

Userspace is expected to order VM_BIND jobs that touch the same range,
but the kernel must not end up with freed pages mapped when it does
not. Treat an unmap that finds part of its range not mapped like a
failed map: skip the remaining maps of the job and mark the VM
unusable, after which SUBMIT and VM_BIND fail with -EPIPE. VM_BIND
pgtables only use single-page granules, so such an unmap error only
means that part of the range was not mapped.

That alone does not catch an unmap that runs while the range still
holds the pages of an older mapping, whose own unmap is still queued on
a third queue. So also have the VMAs that a job maps, and the unmap ops
that undo them, refer to a small refcounted object that tells whether
the job has applied its updates, and handle an unmap that comes before
the map it undoes the same way. In msm_vma_job_run(), read
vm->unusable, and set it on such an error, under mmu_lock, which also
protects the done state, so that the result does not depend on the
jobs of a VM being run one at a time.

A job that fails in msm_ioctl_vm_bind() after it queued pgtable updates
is freed without applying them, so the VM no longer matches its
pgtables, and a later unmap of one of its VMAs would be taken for an
out-of-order one. Mark the VM unusable in that case too.

The patch and its changelog were drafted with an AI coding assistant.
The issue has not been reproduced, and the change has only been
compile-tested.

Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-214650@kernel.org
Suggested-by: Rob Clark <robin.clark@oss.qualcomm.com>
Link: https://lore.kernel.org/r/CACSVV00ZppfBKwsHJ+NBYBB7a2f3g1O=6J4Gt1m_A74fudZQoQ@mail.gmail.com
Signed-off-by: Jiwoo Kim <arpe1618@gmail.com>
---
VMAs that the shrinker unmapped are no longer marked mapped, so no unmap
is queued for them, and a VMA whose map has been applied is fully
mapped, as VM_BIND pgtables only use single-page granules. So the new
errors should not trigger for userspace that orders its VM_BIND jobs.

Not addressed here: a queued unmap only holds a reference on its
object, which does not keep the shrinker from purging or evicting the
pages before the unmap is applied. Julius Bairaktaris' "drm/msm: Keep
objects of queued VM_BIND unmaps busy" addresses that:
https://lore.kernel.org/r/20261111080619.244138-1-julius@bairaktaris.de

 drivers/gpu/drm/msm/msm_gem.h     |   7 ++
 drivers/gpu/drm/msm/msm_gem_vma.c | 126 ++++++++++++++++++++++++++++--
 2 files changed, 127 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index d8ec696d89d7..3174460def2e 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -164,6 +164,7 @@ void msm_gem_vm_close(struct drm_gpuvm *gpuvm);
 void msm_gem_vm_unusable(struct drm_gpuvm *gpuvm);
 
 struct msm_fence_context;
+struct msm_vm_bind_done;
 
 #define MSM_VMA_DUMP (DRM_GPUVA_USERBITS << 0)
 
@@ -185,6 +186,12 @@ struct msm_gem_vma {
 
 	/** @mapped: Is this VMA mapped? */
 	bool mapped;
+
+	/**
+	 * @map_done: For a VMA created by a VM_BIND job, tells whether that
+	 * job has applied its pgtable updates.
+	 */
+	struct msm_vm_bind_done *map_done;
 };
 #define to_msm_vma(x) container_of(x, struct msm_gem_vma, base)
 
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 2f0698df1a9a..228c16a3d9e4 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -63,6 +63,12 @@ struct msm_vm_unmap_op {
 	 * a submitqueue (ie. process cleanup)
 	 */
 	int queue_id;
+
+	/**
+	 * @map_done: For an unmap queued by a VM_BIND job, tells whether the
+	 * map that it undoes has been applied.
+	 */
+	struct msm_vm_bind_done *map_done;
 };
 
 /**
@@ -97,6 +103,20 @@ struct msm_vm_op {
 	struct drm_gem_object *obj;
 };
 
+/**
+ * struct msm_vm_bind_done - Whether a VM_BIND job has applied its updates
+ *
+ * The VMAs that a VM_BIND job maps, and the unmap ops that undo them later,
+ * hold a reference to it, so that such an unmap can tell whether the map it
+ * undoes has been applied to the pgtables yet.
+ */
+struct msm_vm_bind_done {
+	/** @ref: reference count */
+	struct kref ref;
+	/** @done: the job has applied its updates, protected by vm->mmu_lock */
+	bool done;
+};
+
 /**
  * struct msm_vm_bind_job - Tracking for a VM_BIND ioctl
  *
@@ -119,6 +139,8 @@ struct msm_vm_bind_job {
 	struct msm_mmu_prealloc prealloc;
 	/** @vm_ops: a list of struct msm_vm_op */
 	struct list_head vm_ops;
+	/** @bind_done: whether the job has applied its updates to the pgtables */
+	struct msm_vm_bind_done *bind_done;
 	/** @bos_pinned: are the GEM objects being bound pinned? */
 	bool bos_pinned;
 	/** @nr_ops: the number of userspace requested ops */
@@ -156,6 +178,27 @@ static inline struct msm_vm_bind_job *to_msm_vm_bind_job(struct drm_sched_job *j
 	return container_of(job, struct msm_vm_bind_job, base);
 }
 
+static struct msm_vm_bind_done *
+vm_bind_done_get(struct msm_vm_bind_done *done)
+{
+	if (done)
+		kref_get(&done->ref);
+	return done;
+}
+
+static void
+vm_bind_done_release(struct kref *ref)
+{
+	kfree(container_of(ref, struct msm_vm_bind_done, ref));
+}
+
+static void
+vm_bind_done_put(struct msm_vm_bind_done *done)
+{
+	if (done)
+		kref_put(&done->ref, vm_bind_done_release);
+}
+
 static void
 msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 {
@@ -243,7 +286,7 @@ vm_log(struct msm_gem_vm *vm, const char *op, uint64_t iova, uint64_t range, int
 	vm->log_idx = (vm->log_idx + 1) & ((1 << vm->log_shift) - 1);
 }
 
-static void
+static int
 vm_unmap_op(struct msm_gem_vm *vm, const struct msm_vm_unmap_op *op)
 {
 	const char *reason = op->reason;
@@ -253,7 +296,7 @@ vm_unmap_op(struct msm_gem_vm *vm, const struct msm_vm_unmap_op *op)
 
 	vm_log(vm, reason, op->iova, op->range, op->queue_id);
 
-	vm->mmu->funcs->unmap(vm->mmu, op->iova, op->range);
+	return vm->mmu->funcs->unmap(vm->mmu, op->iova, op->range);
 }
 
 static int
@@ -361,6 +404,7 @@ void msm_gem_vma_close(struct drm_gpuva *vma)
 	drm_gpuva_remove(vma);
 	drm_gpuva_unlink(vma);
 
+	vm_bind_done_put(msm_vma->map_done);
 	kfree(vma);
 }
 
@@ -484,6 +528,9 @@ vm_op_enqueue(struct op_arg *arg, struct msm_vm_op _op)
 	if (op->obj)
 		drm_gem_object_get(op->obj);
 
+	if (op->op == MSM_VM_OP_UNMAP)
+		vm_bind_done_get(op->unmap.map_done);
+
 	return 0;
 }
 
@@ -541,6 +588,7 @@ msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *_arg)
 
 	vma->flags = ((struct op_arg *)arg)->flags;
 	to_msm_vma(vma)->mapped = true;
+	to_msm_vma(vma)->map_done = vm_bind_done_get(job->bind_done);
 
 	return 0;
 }
@@ -554,6 +602,7 @@ msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
 	struct drm_gpuva *prev_vma = NULL, *next_vma = NULL;
 	struct drm_gpuvm_bo *vm_bo = orig_vma->vm_bo;
 	bool mapped = to_msm_vma(orig_vma)->mapped;
+	struct msm_vm_bind_done *map_done;
 	unsigned flags;
 	int ret;
 
@@ -571,6 +620,7 @@ msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
 				.iova = unmap_start,
 				.range = unmap_range,
 				.queue_id = job->queue->id,
+				.map_done = to_msm_vma(orig_vma)->map_done,
 			},
 			.obj = orig_vma->gem.obj,
 		});
@@ -601,25 +651,34 @@ msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
 	 */
 	flags = orig_vma->flags;
 
+	/* The pages of prev_vma and next_vma were mapped with orig_vma: */
+	map_done = vm_bind_done_get(to_msm_vma(orig_vma)->map_done);
+
 	msm_gem_vma_close(orig_vma);
 
 	if (op->remap.prev) {
 		prev_vma = vma_from_op(arg, op->remap.prev);
-		if (WARN_ON(IS_ERR(prev_vma)))
+		if (WARN_ON(IS_ERR(prev_vma))) {
+			vm_bind_done_put(map_done);
 			return PTR_ERR(prev_vma);
+		}
 
 		vm_dbg("prev_vma: %p:%p: %016llx %016llx", vm, prev_vma, prev_vma->va.addr, prev_vma->va.range);
 		to_msm_vma(prev_vma)->mapped = mapped;
+		to_msm_vma(prev_vma)->map_done = vm_bind_done_get(map_done);
 		prev_vma->flags = flags;
 	}
 
 	if (op->remap.next) {
 		next_vma = vma_from_op(arg, op->remap.next);
-		if (WARN_ON(IS_ERR(next_vma)))
+		if (WARN_ON(IS_ERR(next_vma))) {
+			vm_bind_done_put(map_done);
 			return PTR_ERR(next_vma);
+		}
 
 		vm_dbg("next_vma: %p:%p: %016llx %016llx", vm, next_vma, next_vma->va.addr, next_vma->va.range);
 		to_msm_vma(next_vma)->mapped = mapped;
+		to_msm_vma(next_vma)->map_done = vm_bind_done_get(map_done);
 		next_vma->flags = flags;
 	}
 
@@ -628,6 +687,7 @@ msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
 
 	/* Drop the previous ref: */
 	drm_gpuvm_bo_put(vm_bo);
+	vm_bind_done_put(map_done);
 
 	return 0;
 }
@@ -678,6 +738,7 @@ msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *_arg)
 			.iova = vma->va.addr,
 			.range = vma->va.range,
 			.queue_id = job->queue->id,
+			.map_done = msm_vma->map_done,
 		},
 		.obj = vma->gem.obj,
 	});
@@ -701,6 +762,16 @@ static const struct drm_gpuvm_ops msm_gpuvm_ops = {
 	.sm_step_unmap = msm_gem_vm_sm_step_unmap,
 };
 
+/*
+ * Whether the map that an unmap op of @job undoes has been applied.  The ops
+ * of @job itself are applied in order, so its own maps come first.
+ */
+static bool
+vm_bind_map_done(struct msm_vm_bind_job *job, struct msm_vm_bind_done *map_done)
+{
+	return !map_done || map_done == job->bind_done || map_done->done;
+}
+
 static struct dma_fence *
 msm_vma_job_run(struct drm_sched_job *_job)
 {
@@ -708,13 +779,16 @@ msm_vma_job_run(struct drm_sched_job *_job)
 	struct drm_device *dev = job->vm->drm;
 	struct msm_gem_vm *vm = to_msm_vm(job->vm);
 	struct drm_gem_object *obj;
-	int ret = vm->unusable ? -EINVAL : 0;
+	int ret;
 
 	vm_dbg("");
 
 	mutex_lock(&vm->mmu_lock);
 	vm->mmu->prealloc = &job->prealloc;
 
+	/* vm->unusable is checked and set under mmu_lock, see below: */
+	ret = vm->unusable ? -EINVAL : 0;
+
 	while (!list_empty(&job->vm_ops)) {
 		struct msm_vm_op *op =
 			list_first_entry(&job->vm_ops, struct msm_vm_op, node);
@@ -730,7 +804,17 @@ msm_vma_job_run(struct drm_sched_job *_job)
 				ret = vm_map_op(vm, &op->map);
 			break;
 		case MSM_VM_OP_UNMAP:
-			vm_unmap_op(vm, &op->unmap);
+			/*
+			 * An unmap that finds part of its range not mapped, or
+			 * that comes before the map it undoes, means that the
+			 * jobs that touch this range were not ordered.  If the
+			 * map was applied after the unmap, nothing would track
+			 * its pages, so handle this like a failed map.
+			 */
+			if (vm_unmap_op(vm, &op->unmap) ||
+			    !vm_bind_map_done(job, op->unmap.map_done))
+				ret = ret ?: -EINVAL;
+			vm_bind_done_put(op->unmap.map_done);
 			break;
 		}
 		drm_gem_object_put(op->obj);
@@ -738,6 +822,15 @@ msm_vma_job_run(struct drm_sched_job *_job)
 		kfree(op);
 	}
 
+	/*
+	 * Mark the VM unusable before dropping mmu_lock, so that the maps of
+	 * a job that applies its updates after an out of order unmap are
+	 * skipped.
+	 */
+	if (ret)
+		vm->unusable = true;
+	job->bind_done->done = true;
+
 	vm->mmu->prealloc = NULL;
 	mutex_unlock(&vm->mmu_lock);
 
@@ -783,10 +876,14 @@ msm_vma_job_free(struct drm_sched_job *_job)
 	while (!list_empty(&job->vm_ops)) {
 		struct msm_vm_op *op =
 			list_first_entry(&job->vm_ops, struct msm_vm_op, node);
+		if (op->op == MSM_VM_OP_UNMAP)
+			vm_bind_done_put(op->unmap.map_done);
 		list_del(&op->node);
 		kfree(op);
 	}
 
+	vm_bind_done_put(job->bind_done);
+
 	wake_up(&vm->prealloc_throttle.wait);
 
 	kfree(job);
@@ -968,9 +1065,17 @@ vm_bind_job_create(struct drm_device *dev, struct drm_file *file, struct drm_gpu
 	if (!job)
 		return ERR_PTR(-ENOMEM);
 
+	job->bind_done = kzalloc_obj(*job->bind_done);
+	if (!job->bind_done) {
+		kfree(job);
+		return ERR_PTR(-ENOMEM);
+	}
+	kref_init(&job->bind_done->ref);
+
 	ret = drm_sched_job_init(&job->base, queue->entity, 1, queue,
 				 file->client_id);
 	if (ret) {
+		kfree(job->bind_done);
 		kfree(job);
 		return ERR_PTR(ret);
 	}
@@ -1604,6 +1709,15 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
 	if (ret)
 		vm_bind_job_unpin_objects(job);
 
+	/*
+	 * A job that fails after it queued pgtable updates is freed without
+	 * applying them, so the VM no longer matches its pgtables, and a
+	 * later unmap of one of its VMAs would be taken for an out of order
+	 * one.
+	 */
+	if (ret && !list_empty(&job->vm_ops))
+		msm_gem_vm_unusable(job->vm);
+
 	drm_exec_fini(&exec);
 out_unlock:
 	mutex_unlock(&queue->lock);
-- 
2.43.0

