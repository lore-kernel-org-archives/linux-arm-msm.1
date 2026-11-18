Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794967664;
	b=ef02ASCYOzie68iAWLythFNZsVCmLb9MIk0PKEL/wvyXve0rH14Eqq8zpvWcsp75RCOb
	 6bEzjs6Sz5jw8VHDeW9zjjwaLR0HHut5TARAohNgnu6dknednB2ZZYB8Sj+VM51nqZyUW
	 Ig1/W1MU2JKe1Ywr9/8yJEDv/4tmn2isk3chgAmu7jyH8rZYqMOpVpcgLY+bSk0q9sP7z
	 qx4SCAPIP2y4NNwdXDldCHDLu1SGIx0LqzaeVlVLCzWmgJPr564z0tDGkLyfOilhKstNv
	 1ycQoguCjJzBvbQjdAIMDa7f7PMOTZ5ckNPcIgWabRmiBxN2KvAvnFGHijwewHDnfCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794967664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AxCt8GnaHtqxgsFDXGoL7W7lMGQFJ7unysPHQI6JZI8=;
	b=33uNCD4iN17pvuh4zj1SDJxne1lz3JZ2/DaLq2+wUTJp31R3FBF7nshbFKjGCAa3aGTE
	 9RwWYOmxBe7Nt6zSe4FqA8B6mB4wqidZR2iNzTFfW2Ziq7i8cVuMnGT4UO4kFqOszxfcM
	 NmfnyOUOz3j7GSeo7Z/N0Bsae0jDAOUWsT8bC5BZbgQWFlbjD2ja4YGhWOYWJlPIS7D7B
	 2xKJ6c4o0cZraTHQPgmCrYBUZ+oZbiboEB9Q68iIiutn0kLvIJfkIgk9rxQNjIt2ROLNy
	 7DGRnZ3FcqG0QxeSGWgIWc5b5+qxDz7UeyW5vY5k2OymCOVo9xpLqOaKo0yltbp0SZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v2N2vc0h;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C572606A32A
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 02:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C572606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v2N2vc0h
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-382b463a972so27413eec.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 18:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794967663; x=1795572463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AxCt8GnaHtqxgsFDXGoL7W7lMGQFJ7unysPHQI6JZI8=;
        b=v2N2vc0h5CBs+WaEWeWBAh7e7gEF1gDQKcF7JdgtcP24NGt7AY5GB44mJj3Vo0Fj5S
         yYgqPjgko3Io+gUcV9IDcrR+yvyyfUd5bA3CtaVdiQa2ADuiRoq9TzpUiefVWq6m/RJU
         vQkTHJNbV7/MiJM5BC/0OyRBdXao6bYP9MxcNEpIZ2cEzNIWweoT6Qivez2gsAJQioAC
         pqDRhyYuZQV4fIZuzeX4NI3I1TqT5xswYEVC3MAQw34bAL5GbKBum4RYcxDEm5blJBZA
         xKJ+T4hBFr4I7WwPqgvbMF6Ungk74qahELZKjLfuHQRDbGZB8wJVK7NPxEDARKzHaJ3V
         GrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794967663; x=1795572463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AxCt8GnaHtqxgsFDXGoL7W7lMGQFJ7unysPHQI6JZI8=;
        b=1cW+OIPfSavhhSXPShxLS/L//pbL3WwBAydJD+Dc3QSTBn3a3L07SrG5hbd05QOInr
         hSmLo5YcR8eWom3tdBYOhc+yH0ONznBeCXqPzhzJjdbc/lsTORgYlb39tKpuYtaCEUmB
         WYzGf3Z58kZcxArs4wQrICZxYP0ttoDQdNjsqJ4eJkZQbseYRv72De2cG7m+eMczvcmd
         TFcwyZ4VF9zJq84APFvTacklWtv326T6cjLUs1db7FUoGrvHlxH8y3VNbAu+SPTXK431
         Vz6InhKeYq4FRqbYciMLjEUNNixeyPOS+WMLfyaomrxOWHe2Nm31nGpPboGECW/Je9l8
         Adsw==
X-Forwarded-Encrypted: i=1; AL+hErFkRFvBjoaGF5xgTBj+683zyLZbASugzYPD2LZEshBmEFWPFu2lA1ol6+BrJLu9Ge6eewZJ9vEUPF5Kpr8X@vger.kernel.org
X-Gm-Message-State: APuU4Z8/sDhf+MNFtBqOF5N7PBmnxtSFhs89vofVKT1LdL2G9O0s9uh2
	K9qi7B2ItJ/D4et3Mu+6ABhaGq1MW8NJt2zH1Uxs7xJ5412B1waPhHQZ
X-Gm-Gg: AYBFou33CsPcz/ucANK6Ew51QWdWpcz2CueaHtZQg1iKy8p53Lo49M1I/0B2/vw38MS
	etoTnN/swAih99PJnh/qH1B5l7BT7sOv9BXS/jXoUC7UKq5SoW5kxI5+K4KxlR2JBQ9TZmZmFRx
	Jlq/kKK0yXpcB//LAWrQMyeprUS/W9Rje0S1fCnCmL1C5tYrmwSww4sNl1pgdCTgK2ElAYGFrpv
	aiITsCD/rNKL1Zc+oXGhohO/hDQud0mIRyMz55G/bv0fhOuPerO1d6NKqB9VIsc+orE216yMKo5
	KL3q5YxAV+loCmFD+RwcROsNKK6OmwfdWhYjKe6JP7OiF59lF6HAJubHicteDC9h9z1Dg+BQ4e+
	ALD878Seau+XW5nEfzJ9LQ6bR3b1Qto9dmlsdnAdAsJ9fwZEZyUnd0DNA2um6m+EulyNAqzvtIK
	FWB2eTIEj2ygk4BmMse9sQ8HkJvMGZY/wNTf9B0bNeIoJIwsDRAFYwKAzpacNuAo/WJ4qFg3r41
	hhZiu9I76RjKjJiB3zGvrCVY4A6yRQi9+5rd/KErQSnIgrE/SU2Xw6myRqmnTcZY291b6DsDPkT
	q2G+qsi9eahiyMIFPIXN4W+24rQvNnkCEupZlki/2KYwmteXYD6vePgiN4TQNz1PUu7ai64lbdN
	FAWsbwWH5LF8PaGvL7iPzKhZM1IBE
X-Received: by 2002:a05:7022:f202:b0:16b:4f52:a08 with SMTP id a92af1059eb24-1b543a14345mr2489506c88.0.1794967662450;
        Tue, 17 Nov 2026 18:07:42 -0800 (PST)
Received: from DESKTOP-CJ1L666.dankook.ac.kr ([220.149.255.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b544784008sm2862327c88.5.2026.11.17.18.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:07:42 -0800 (PST)
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
Subject: [PATCH v4 3/5] drm/msm: Release the pins and ops of a killed VM_BIND job
Date: Wed, 18 Nov 2026 11:07:14 +0900
Message-ID: <20261118020716.1698-4-arpe1618@gmail.com>
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

msm_vma_job_run() applies the pgtable updates that vm_bind_job_prepare()
queued for a VM_BIND job, drops the GEM object references that
vm_op_enqueue() took for them, and unpins the BOs of the job. When the
entity of a job is killed, e.g. on SIGKILL while the process exits, the
scheduler frees the job without running it. msm_vma_job_free() then
frees the queued ops without applying them and without dropping their
references, and leaves the BOs pinned. Besides the leaks, the VM no
longer matches its pgtables: for example, the pages of a VMA that was
unmapped from the VM are still mapped.

The scheduler only frees a killed job once its dependencies have
signalled and the job queued before it on the same entity has run or
been killed, so the jobs that it depends on, and those queued before it
on its entity, have run and applied their updates by then, unless they
were killed themselves. In msm_vma_job_free(), apply the queued updates
the way msm_vma_job_run() does on error: skip the maps, but apply the
unmaps, so that the references that the ops hold are only dropped once
their pages are unmapped, and mark the VM unusable. Killed jobs can be
freed concurrently, but as they only unmap, their order does not
matter. If one of the unmaps comes before the map it undoes, which a
job of another queue has not applied yet, that map is skipped, as the
killed job marks the VM unusable under mmu_lock before it drops the
lock. Move that part of msm_vma_job_run() into a helper for this. Also
clear bos_pinned once msm_vma_job_run() has unpinned the BOs, as
msm_job_run() does for submits, and unpin the BOs of a job that still
has them pinned, taking the object lock, as the job's fence does not
keep them busy anymore.

The scheduler signals the fence of a killed job before it frees the
job, so a job that waits for it can apply its updates first. A map into
a range that the killed job still has to unmap then fails, as the pages
are still mapped, and marks the VM unusable.

msm_ioctl_vm_bind() frees the job when the ioctl fails, without waiting
for its dependencies or the previous jobs of its queue, so the queued
updates of such a job must not be applied. Move the freeing itself
into vm_bind_job_free(), and call that directly from there.

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

Julius Bairaktaris' "drm/msm: Keep objects of queued VM_BIND unmaps
busy" keeps the objects of queued unmaps busy with the job's fence:
https://lore.kernel.org/r/20261111080619.244138-1-julius@bairaktaris.de
For a killed job, the scheduler signals that fence before it calls
free_job(), so with both patches, these objects are no longer busy for
the short time until this patch applies the unmaps. Without this patch,
the unmaps of a killed job are never applied. Closing that window would
need the objects to stay pinned until their unmaps are applied. The two
patches apply in either order.

Not addressed here, as before this patch:
- The error path of msm_ioctl_vm_bind() still frees the queued ops of a
  failed job without applying them or dropping their references, but
  patch 2 now marks the VM unusable then. Their unmaps could only be
  applied after the job's dependencies and the previous jobs of its
  queue, i.e. by queuing the job anyway.
- The issues in the error handling of vm_bind_job_prepare() that
  Sashiko listed for v2: a VMA left in the VM when vm_op_enqueue()
  fails, which a later remap of a MAP_NULL area turns into a NULL
  dereference, and the vm_bo reference in msm_gem_vm_sm_step_remap().

 drivers/gpu/drm/msm/msm_gem_vma.c | 94 ++++++++++++++++++++++++++-----
 1 file changed, 81 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 228c16a3d9e4..fd104e2cee35 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -772,22 +772,23 @@ vm_bind_map_done(struct msm_vm_bind_job *job, struct msm_vm_bind_done *map_done)
 	return !map_done || map_done == job->bind_done || map_done->done;
 }
 
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
-	int ret;
-
-	vm_dbg("");
 
 	mutex_lock(&vm->mmu_lock);
 	vm->mmu->prealloc = &job->prealloc;
 
 	/* vm->unusable is checked and set under mmu_lock, see below: */
-	ret = vm->unusable ? -EINVAL : 0;
+	if (vm->unusable)
+		ret = ret ?: -EINVAL;
 
 	while (!list_empty(&job->vm_ops)) {
 		struct msm_vm_op *op =
@@ -834,6 +835,21 @@ msm_vma_job_run(struct drm_sched_job *_job)
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
+	struct drm_gem_object *obj;
+	int ret;
+
+	vm_dbg("");
+
+	ret = vm_bind_job_apply_ops(job, 0);
+
 	/*
 	 * We failed to perform at least _some_ of the pgtable updates, so
 	 * now the VM is in an undefined state.  Game over!
@@ -847,16 +863,22 @@ msm_vma_job_run(struct drm_sched_job *_job)
 		msm_gem_unpin_active(obj);
 	}
 
+	job->bos_pinned = false;
+
 	mutex_unlock(&dev->gem_lru_mutex);
 
 	/* VM_BIND ops are synchronous, so no fence to wait on: */
 	return NULL;
 }
 
+/*
+ * Free a job, whether it ran or not.  Ops that are still queued are freed
+ * without being applied, and without dropping their object references, as
+ * the pages of their unmaps may still be mapped.
+ */
 static void
-msm_vma_job_free(struct drm_sched_job *_job)
+vm_bind_job_free(struct msm_vm_bind_job *job)
 {
-	struct msm_vm_bind_job *job = to_msm_vm_bind_job(_job);
 	struct msm_gem_vm *vm = to_msm_vm(job->vm);
 	struct drm_gem_object *obj;
 
@@ -864,7 +886,20 @@ msm_vma_job_free(struct drm_sched_job *_job)
 
 	atomic_sub(job->prealloc.count, &vm->prealloc_throttle.in_flight);
 
-	drm_sched_job_cleanup(_job);
+	drm_sched_job_cleanup(&job->base);
+
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
 
 	job_foreach_bo (obj, job)
 		drm_gem_object_put(obj);
@@ -889,6 +924,34 @@ msm_vma_job_free(struct drm_sched_job *_job)
 	kfree(job);
 }
 
+static void
+msm_vma_job_free(struct drm_sched_job *_job)
+{
+	struct msm_vm_bind_job *job = to_msm_vm_bind_job(_job);
+
+	/*
+	 * A job that the scheduler frees without having run it was killed,
+	 * e.g. because its entity was destroyed.  Its queued updates were
+	 * already applied to the VM's address space, but not to its pgtables.
+	 * The scheduler has waited for the job's dependencies, and for the job
+	 * before it on the entity to run or be killed, so apply its unmaps now,
+	 * before the references to the unmapped objects are dropped, and give
+	 * up on the VM, as its maps are skipped.  Killed jobs only unmap, so
+	 * the order in which they are freed does not matter.
+	 *
+	 * The scheduler signals the fence of a killed job before it frees the
+	 * job, so a job that waits for it can apply its updates first.  A map
+	 * into a range that this job still has to unmap then fails, and marks
+	 * the VM unusable.
+	 */
+	if (!list_empty(&job->vm_ops)) {
+		vm_bind_job_apply_ops(job, -ECANCELED);
+		msm_gem_vm_unusable(job->vm);
+	}
+
+	vm_bind_job_free(job);
+}
+
 static const struct drm_sched_backend_ops msm_vm_bind_ops = {
 	.run_job = msm_vma_job_run,
 	.free_job = msm_vma_job_free
@@ -1733,8 +1796,13 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
 	}
 
 	if (!IS_ERR_OR_NULL(job)) {
+		/*
+		 * Not msm_vma_job_free(): the job's dependencies and the
+		 * previous jobs of the queue may not have completed, so its
+		 * queued updates must not be applied here.
+		 */
 		if (ret)
-			msm_vma_job_free(&job->base);
+			vm_bind_job_free(job);
 	} else {
 		/*
 		 * If the submit hasn't yet taken ownership of the queue
-- 
2.43.0

