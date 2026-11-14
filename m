Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637552;
	b=HQlJDl0654HhzJRarC3Rwudht+9glLXO95JrN9xAmd8fuRaxiqz4daecxKw/qnI3Okod
	 KUQT1w0dWBSUtQcfTp8xrJu24nSpIWK5Jcxu1pt7TkhJjp9cgJPvhHvX6DPDcLYDDYt6V
	 itIVSBanzHLqlqLqHuSAvJn23/kC+mSZxNR+QUOoPX29FK9vdeu8V0/8v/pw3974DN6l/
	 B2riEHQJuwouaGLPwy43LkjXHOpSydk1h8499wLtqawbSzFJ/SjeLaCIdDA5FTnDnBMGL
	 xCNztdBqaKURKFNl3nalt456nquMuJd2qH+RxAIq4k9B8tPN+P9OaZ7yUjEr/ngrqHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LDQz09G2XyTTuhJSitLdBUGEVlAlYFjTvvQk/ah90w4=;
	b=w7cXqTc8wcSlbEEDyQmrFqz6WnonBA9R1CaSaFwU0oLVduCeDWMgEJqE++kGamfvBTL6
	 xt2jyjnqo1s+yjkZSpb3RnR0Sfs6D+Spjj3HLMqCavyhgqrTdCbIhNSvA0b5YuG0Zqsvi
	 9/q/Cbj373NfayNq4V3YsIMMv3Jip5brumJKCFVW61wku7GJhCVjc82WyvXFTiqw8U0FO
	 apaYfVC9znSL1rdW0nAaQjl60ZYmBQIqWlBlyICHuDMc636owBzLTVUnvrzC03QrVKoVB
	 ZGY2Xt4bQIRvUTWGfWkD+325n1uZ9fM4v9+ER8gXmOlWCc8W7qbxjtcPhSTTqBMMtZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=irxXCuA8;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7308F606A32E
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 06:25:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7308F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=irxXCuA8
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-37605faade6so207419eec.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 22:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637552; x=1795242352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LDQz09G2XyTTuhJSitLdBUGEVlAlYFjTvvQk/ah90w4=;
        b=irxXCuA8cN9MuV3FWsRqGqXDJRl0YaFFCn9hAlmEwnLPZw098W+YKun+y1KD+AiNRQ
         mW50OW71mlTfB75SEIBLSDRhDfHom4XihDA7erurXuDBYbEBoD2CdAyqf03yLCLjHNkr
         ++GYP+NHhtiAkSTOa0QFl52cOHA0hxDXuv9y3v2dpsPseeQL4L92DGX3WPEAhrlXhi3l
         1x1sFB1pBm6Kkn5/ZfcDSn1KCg5pz8IH5hcbVZjgGIRC49xwwNYONE69hQxtBFjavTDn
         fiu+czYnagQK71V7GSPuL5t2YmeZV+x0sDBXzKV9gJ16YOEX7M60lXgqRt0N62xl+a83
         0bFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637552; x=1795242352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDQz09G2XyTTuhJSitLdBUGEVlAlYFjTvvQk/ah90w4=;
        b=mVdrQwj99LlakBqT+ndzRS2NI5anrV3AqlyxSNlP2dubLdkxLVzGFeT2IeFu80ZcC8
         /vyw077NgcobDkuvFLjp1IoDq/6MkyMIF2FfH9EKT1FkmjFAvCOclIdTqs8YhDlVeoi7
         RP22Ikkqzewid9Kc74qL52qQo9E4LpZcpU2HIcqc5+hOibs+IE138IEE/7pkIEhP1iqi
         X2pZx4/ETGNzXwhxJk86/Gystwgl6sESFJboHIT37rxWvgTxTHCXdOSRDt/pGrnTBakR
         +KJ6200mYEtQazOUbL9zyfVn3OMeWe8Ee5dm2PKACGKrunn5ES8ddnGueLNoa2PGunJW
         tkgQ==
X-Forwarded-Encrypted: i=1; AL+hErHM6XLZV37fnUsQs1j9t+K/p9cIzHeC4Pn0bTeTICY0SU8YcigmdoeGGcfedfB3YSv3BDklb4IY2GPpM2Qs@vger.kernel.org
X-Gm-Message-State: APuU4Z/1K9EW8Ia27KOFCD3fkAP25OE8KD1Y9m1VRfhkTEybNPoZp8eu
	w73WOi6O/elmzvrD+b3HoTaN/V/BzSYoZtDDujS9W/FH25wLa2Mtk1RV
X-Gm-Gg: AYBFou1w0agGRZaIq1RDMayGYJRQaDewvc7HgiGKtdcYck3kJ2XCAsC8GFJ4ovjy3DK
	hV5P5UiQTfaj6s9XQ8Jghtus+I/xO4hamc9QdINtHbMdYKQmPBnywcbNB90Ppy+TM99MIK+zVIw
	Uuk7RD3trWqQ6ULtVTZq26ZmgNrvXku2Wnr1AdWKvkVihFcwtBidNMSJBPM5lizJvcGxlC2efnE
	xgRShtiZNDcYAA8YDAcsPNtww+p2RBEuN69Fsy9N3/tVHxV3XwB/ywhDim0OwdwBfQJFMl5NU5N
	NkHH14cE9VwxiR0P+ZisZ29I3TkiBSybJQMVd0R+uOkX9im3MGepF3DF+KqF9yN8aNU3Gai4Tn/
	UG7YspHVAEhN+BnVXeQ/kjn/2QIwFCf6QKQHg/JMSWcI5ZsRS79UuPVzKt3rYLSjkkgpAL7SyMT
	RxNjkxLKqPhQBQUjF5IzRmjNADHAS6xyMlmEWRxC6zKsIhgbNzlQYD//2l4HS0XR2Ts4YZkT8Q9
	2r4c2DSKVG+6W8P0rnAi/hML+HznFK47hqJJ/uBgyZZvw2XVBUNIH38Gjk/r3Ad0kCi90Yc+zQa
	hdyeRMsbLQRCxtCtv5iVDFmV45MXAgdIj30z/jTRvPRFnouPgXfYBQfGPF5wb8/IYkqOI78Yg74
	tlGE=
X-Received: by 2002:a05:7300:7481:b0:36d:cd5d:d809 with SMTP id 5a478bee46e88-37964ff2d6emr9111552eec.1.1794637551552;
        Fri, 13 Nov 2026 22:25:51 -0800 (PST)
Received: from DESKTOP-CJ1L666.localdomain ([211.198.99.62])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm13537585eec.13.2026.11.13.22.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:25:51 -0800 (PST)
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
Subject: [PATCH 1/2] drm/msm: Destroy the VM_BIND entity when its queue is closed
Date: Sat, 14 Nov 2026 15:25:40 +0900
Message-ID: <20261114062541.2001-1-arpe1618@gmail.com>
X-Mailer: git-send-email 2.43.0
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
exiting, instead of being left on the entity.

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

Not changed here: for a job that never ran, msm_vma_job_free() neither
unpins the BOs that msm_ioctl_vm_bind() pinned nor drops the GEM
references that vm_op_enqueue() took. That already happens to VM_BIND
jobs killed when the process exits, and with this patch also to the
ones cancelled by a fatal signal during MSM_SUBMITQUEUE_CLOSE.

Deferring drm_sched_fini() of the VM scheduler to msm_gem_vm_free() was
considered instead. It does not help: the stranded jobs keep the queue,
its context and the VM alive, so the entities would still have to be
destroyed at close.

 drivers/gpu/drm/msm/msm_gem_vma.c     |  5 +++
 drivers/gpu/drm/msm/msm_gpu.h         |  6 ++++
 drivers/gpu/drm/msm/msm_submitqueue.c | 50 +++++++++++++++++++--------
 3 files changed, 47 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 8b702422030a..0cf518420656 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1499,6 +1499,11 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
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
 

base-commit: 1e59855738454b14021b64115f0090eafc7526ae
-- 
2.43.0

