Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794644363;
	b=DHh6kA1YiZx5NEerKK4hwhbPh7b7A/nJipXThZr/36nozgbavMasHkx0/LcIgp7j7xbq
	 ipCXpfud8DyABDRiQZ45pjMdWZNiB1wG1Ht3wnKNd692sFMz4CPOBuBh/Wp8lSpf0orN6
	 iMlIib6zjwEoZsPWetrJ8vYtnZ3ZLrwBwEfJED8WBSwW5N8kocXB+0IktcMlDtz5q6g/E
	 NtdqjEYJ6xITm0fex9mmin9Cyv04Ygi7+d5kQbuit5pZw5ZYBZAM0CrlF/LNjU+v7247S
	 tDSj/ebqKGC543gMhccKPI8dPQhcpQz0coLq5ZT1tOVNTlXqHzeYJVRgUwz3EA+OSoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794644363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7YJQ53/PI7dyTOMzH1QiX7EdntRzIzraLTxwuMuktC0=;
	b=KZsijIaF8Tlawt1JW/zSiN6UvcQ76YZEIISO2sol8I/BGdqn8/unE8O5LBtFzLumYPUD
	 pG6MdwYTvtKK4MX15q/UxpLkDMQVnAhRYDSYY2g24ieg0n1Hz7zUkfjOszt5l6svRf9Ui
	 zpBLS6eDl476DztMdCVCYZaMQrmYl6fjbcubPdNguvbGndF0LDleQBRfpDUgVEWx7BmZ8
	 FFF7GvCcmODeMK4Fhk8GN1rTjSqrW5uwXUBrUlZlYXZ/jOcx+IWbwqvGCwrXZK8Kq98Op
	 KmCLi+awkGYUuJoxmKpVnDojR7Ic8MHkjqzqhtMHBdUDcmKYCV/TEmCjKQ0OSEVcekA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Drh1K35j;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74473606A884
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 08:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74473606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Drh1K35j
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36dc4797082so208725eec.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 00:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794644361; x=1795249161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7YJQ53/PI7dyTOMzH1QiX7EdntRzIzraLTxwuMuktC0=;
        b=Drh1K35jNInNwJLX2myGsRUb6ZmHrt5Wx/BHq1gKXfCEipmTEfFfbMIoW7qQPtTaML
         tuc9G+xCpZ/HqcUGfALBJZT/Dgqfp6cFtaVjGBiMlTSzKAzyHTwiP4zU5H8yNIVTya1M
         Z+L/H/J5qvRownsAh22v+3YKhwuDNSSQpy1BYC6ecPiRnFmmQKDxhpI8hu4FxPgJKguW
         xMMeE4jP9b22O09HCUH8iNuATUrI44q01Ul0hIv0z9fqEYFohLiZRv2L8SRE2QqwWpTJ
         PMsuaIw/V1r6UQkUE4O8kCoLFKJID5F0CVFUbTJfwJLDWKJ9KGvLACJlp74rUU2z7XCe
         P0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794644362; x=1795249162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7YJQ53/PI7dyTOMzH1QiX7EdntRzIzraLTxwuMuktC0=;
        b=14jPakNOQ78KY1f3nWuZx5t9LKjl/LMp01/l/uh9clIvQL7uXW80y3hyV3cE7M+uJy
         RnHF2Lcv63OY4MtFh8uHvZ3LXLxTmu5y7R4SSpRw8DqQa5g/ekuiXbHjzunrd9UlHV9C
         9XxyDeN9dRhRPjbLBAJ/+CXmK6TkwlKLiR8uOWCJPtUjis4WYUticyN8D27SNGUXBDYB
         bUFTKKKGxXJNcQeVt/2UYZRSjdnDkYNlNQvF0JXEyigOQ16C7Pp2acG9dgI0MmJJ6vH9
         eNbebl5nmJvcpaulBrZUpNfQ0Y5Q8zY5l5HOPmdF+J0qfT/ky7q+yBdxvOKAd9JrfTYn
         SaJQ==
X-Forwarded-Encrypted: i=1; AL+hErFX8wE/nbdqQYWtaN5C5LAbkrrHBdrO1HNv1afdvdbClkv0vy+cInbKuRwEUOIpbddbk1ngG5CroEaECIjd@vger.kernel.org
X-Gm-Message-State: APuU4Z/120k1yQzgKkdwM4bxDv2X9KV3c8Hcnsf5CxKACjHPoCLyd+jN
	4D0lhi9UUeYh5rO7BJJj+Y8ZcvVU40Yc9cU7PlIZ8Eg4NotPiASsTMhc
X-Gm-Gg: AYBFou1SvYPx8zKp9ivYA7E9utvrXc67R5Rzw+FhWv/bR0wSCdjaHUqJPZP0HA8OoMX
	7Vmt3CqvmkGA19AhrvwphlnhGfLA3nbxB1/WthqGWh1Bc4dADa48cH6qe60e39RWaEHB1MSjLIH
	AQnnRkM/zTAv4t66QdaHbnR9Ou/suUhtcgZobdWQW1/mjXvJeB2BsZtnzW/3rnlgywRxggwSRWd
	y2DrbN2QGtdP3BKgwMHz0Jb/sepXrfHnQjSQn1k3W/l7P0R8YkcOtgR6FmA5Tr1Y4zPfazS7Be4
	86AaWPHZYLpKqh5hrdSShJ+YjgYr4nC0dlbbX5+QxPVfekZhP0SakN1JUnd6C1XXS+pH2eIezxN
	F2XvfQDL0WuVFitfqrxEWUDlfkhL1xiTpoVyA39AfKA0Mk0NaDQMhHSrknrMGZ+ssEwTsZgCPnv
	ojIPreZlgWLIFTGQG1abiPbdEQb8CmMd3sHQX9IR6n0HF4J9eWVcNeXXLWPdKc+NJpffvZPgzmt
	QRJOrkfNM3yfQWH4c8eRCb3BJSnSzkvYW6DMmVpfrvTSvTkyhZarXzrXC1J0kIFz+tngN0d7Vq5
	sPoBXORbyU/PIZGtlYHpKnAV5Ceir7NVK/fsE7/9DYbHD7EUk3NScxuCql+oO9ToMJcKxdr2M+o
	sHtg=
X-Received: by 2002:a05:7300:6da8:b0:36a:e7a:e89 with SMTP id 5a478bee46e88-379659c6815mr9302592eec.2.1794644361453;
        Sat, 14 Nov 2026 00:19:21 -0800 (PST)
Received: from DESKTOP-CJ1L666.localdomain ([211.198.99.62])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm14008333eec.3.2026.11.14.00.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:19:20 -0800 (PST)
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
Subject: [PATCH v2 2/3] drm/msm: Destroy the VM_BIND entity when its queue is closed
Date: Sat, 14 Nov 2026 17:19:01 +0900
Message-ID: <20261114081902.1669-3-arpe1618@gmail.com>
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

The entity of a VM_BIND submitqueue is attached to the per-VM scheduler,
and msm_gem_vm_close() calls drm_sched_fini() on that scheduler when the
file is closed, which frees its run queues. The submitqueue itself is
only destroyed on its final put, though, and every VM_BIND job holds a
reference to it. msm_submitqueue_close() only flushes the entity, and a
queue that was closed earlier with MSM_SUBMITQUEUE_CLOSE is not flushed
at all.

The flush gives up after a timeout when the process exits, or on a
fatal signal, and it only kills the queued jobs when the process exits
because of SIGKILL. In these cases, and after MSM_SUBMITQUEUE_CLOSE,
the entity can still have a callback armed on the in-fence of a
VM_BIND job when drm_sched_fini() runs. When that fence signals,
drm_sched_entity_wakeup() dereferences entity->rq->sched, and so reads
a run queue that drm_sched_fini() has freed. If the jobs were killed,
the final put of the queue then calls drm_sched_entity_destroy(), which
reads the same freed run queue in drm_sched_entity_flush(). If they
were not, they never run, and keep the queue, its context and the VM
alive.

Destroy the VM_BIND entity when userspace closes the queue, on file
close or with MSM_SUBMITQUEUE_CLOSE, instead of on the final put, and
refuse new VM_BIND jobs on a closed queue. In the MSM_SUBMITQUEUE_CLOSE
path, do it after dropping ctxlock, as destroying the entity waits for
the jobs queued on it.

As a result, MSM_SUBMITQUEUE_CLOSE on a VM_BIND queue now waits
(killably) for the jobs already queued on it, and a fatal signal during
that wait cancels the remaining ones, where they used to still run. On
file close, the jobs still queued when the wait gives up are now always
cancelled, as they already were when the process was killed while
exiting, instead of being left on the entity. With the previous patch,
such jobs apply their unmaps and release their pins and references.

This was found with an AI coding assistant, which also drafted this
patch and its changelog. It has not been reproduced, and the change
has only been compile-tested.

Fixes: 92395af63a99 ("drm/msm: Add VM_BIND submitqueue")
Cc: stable@vger.kernel.org
Signed-off-by: Jiwoo Kim <arpe1618@gmail.com>
---
The scoped_guard() in msm_submitqueue_remove() relies on commit
ea69d489d3a6 ("drm/msm: Rework queuelock"), so trees older than v7.3
need a manual backport.

If MSM_SUBMITQUEUE_CLOSE should rather not block, the destroy of closed
VM_BIND queues could instead be deferred to file close, e.g. with a
per-context list of them.

 drivers/gpu/drm/msm/msm_gem_vma.c     |  5 +++
 drivers/gpu/drm/msm/msm_gpu.h         |  6 ++++
 drivers/gpu/drm/msm/msm_submitqueue.c | 50 +++++++++++++++++++--------
 3 files changed, 47 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index a6f106d0cdef..b1fa1d749c2f 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1532,6 +1532,11 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
 	if (ret)
 		goto out_post_unlock;
 
+	if (queue->vm_bind_closed) {
+		ret = -ENOENT;
+		goto out_unlock;
+	}
+
 	if (args->flags & MSM_VM_BIND_FENCE_FD_IN) {
 		struct dma_fence *in_fence;
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index bc5b31eb1eca..561f2d998e99 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -596,6 +596,12 @@ struct msm_gpu_submitqueue {
 	struct kref ref;
 	struct drm_sched_entity *entity;
 
+	/**
+	 * @vm_bind_closed: the queue was closed by userspace, and its VM_BIND
+	 * entity is being or has been destroyed.  Protected by @lock.
+	 */
+	bool vm_bind_closed;
+
 	/** @_vm_bind_entity: used for @entity pointer for VM_BIND queues */
 	struct drm_sched_entity _vm_bind_entity[0];
 };
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 8d550d281704..2dbe42551bd8 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -79,9 +79,6 @@ void msm_submitqueue_destroy(struct kref *kref)
 
 	idr_destroy(&queue->fence_idr);
 
-	if (queue->entity == &queue->_vm_bind_entity[0])
-		drm_sched_entity_destroy(queue->entity);
-
 	msm_context_put(queue->ctx);
 
 	kfree(queue);
@@ -107,6 +104,25 @@ struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_context *ctx,
 	return NULL;
 }
 
+/*
+ * The VM_BIND scheduler is torn down by msm_gem_vm_close() when the file is
+ * closed, but a VM_BIND queue can outlive that, as long as a job still holds
+ * a reference to it.  So destroy the VM_BIND entity here, when userspace
+ * closes the queue, rather than on the final put.  Both ways a queue is taken
+ * off ctx->submitqueues come through here.
+ */
+static void msm_submitqueue_close_vm_bind(struct msm_gpu_submitqueue *queue)
+{
+	if (queue->entity != &queue->_vm_bind_entity[0])
+		return;
+
+	mutex_lock(&queue->lock);
+	queue->vm_bind_closed = true;
+	mutex_unlock(&queue->lock);
+
+	drm_sched_entity_destroy(queue->entity);
+}
+
 void msm_submitqueue_close(struct msm_context *ctx)
 {
 	struct msm_gpu_submitqueue *queue, *tmp;
@@ -119,8 +135,7 @@ void msm_submitqueue_close(struct msm_context *ctx)
 	 * be any more user ioctls coming our way
 	 */
 	list_for_each_entry_safe(queue, tmp, &ctx->submitqueues, node) {
-		if (queue->entity == &queue->_vm_bind_entity[0])
-			drm_sched_entity_flush(queue->entity, MAX_WAIT_SCHED_ENTITY_Q_EMPTY);
+		msm_submitqueue_close_vm_bind(queue);
 		list_del(&queue->node);
 		msm_submitqueue_put(queue);
 	}
@@ -326,7 +341,7 @@ int msm_submitqueue_query(struct drm_device *drm, struct msm_context *ctx,
 
 int msm_submitqueue_remove(struct msm_context *ctx, u32 id)
 {
-	struct msm_gpu_submitqueue *entry;
+	struct msm_gpu_submitqueue *entry, *queue = NULL;
 
 	if (!ctx)
 		return 0;
@@ -338,16 +353,23 @@ int msm_submitqueue_remove(struct msm_context *ctx, u32 id)
 	if (!id)
 		return -ENOENT;
 
-	guard(rwsem_write)(&ctx->ctxlock);
-
-	list_for_each_entry(entry, &ctx->submitqueues, node) {
-		if (entry->id == id) {
-			list_del(&entry->node);
-			msm_submitqueue_put(entry);
-			return 0;
+	scoped_guard(rwsem_write, &ctx->ctxlock) {
+		list_for_each_entry(entry, &ctx->submitqueues, node) {
+			if (entry->id == id) {
+				list_del(&entry->node);
+				queue = entry;
+				break;
+			}
 		}
 	}
 
-	return -ENOENT;
+	if (!queue)
+		return -ENOENT;
+
+	/* Not under ctxlock: destroying the entity can wait for its jobs */
+	msm_submitqueue_close_vm_bind(queue);
+	msm_submitqueue_put(queue);
+
+	return 0;
 }
 
-- 
2.43.0

