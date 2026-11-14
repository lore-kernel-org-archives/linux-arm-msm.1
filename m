Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794665954;
	b=vXJldoicaBaHEf3h2voEKkfSZTEUkd5vugCkKx9EadUq5XxyavIyeuHJ1jC3Z5it6vca
	 fpHUOOpJWCxAJqv/OW/Ery9bbe9hmJ7aqQwfYcF3LHrmb+X5BTAJICvJiWX076iRQQDLb
	 +FFyxEqwuoc8zvqj/zuvIBpQx4p0IjKeYoH6NqcD1sgMS3o94CfG43AqNBJQpl0RUUtxH
	 il0wO7HaNFjdIDzcI2ul9/X7KhWiNBhnvo4yiPhkMbrSOrfMXUv6cqOtSC/tDma36ZkOP
	 NQLbXSb+ux2Qju805rd/yN9OCS/YvLhLED6ciQdehP/+0XEbYfy/9VJL0DlSmzN1Zuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794665954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AdmBh3xC9KRN8uEPKMGQW7/JjymKHmtkhbvdkKIOQCs=;
	b=DTDJAhO4Dx3C5QyrpjeteOkl5emFKe7r4fOrr3GP3SNDos/T2Bf17qi49h6GCD8eEJOm
	 DzcSvSjPbkzOyM7bPnbHkZxfCY1UcskKe3rtmGYr2D/SuvW3aSu5bMb+PXhF8ZX1UaBGT
	 dM3bcD4k6ZL2mtBRCTOg2HxJAPjRDCgR7cw2pI8ezyOWxAbFVBJShl0xavxbFxDlgFics
	 r9k39j1AG5CIhiCvmNptikx470r2F774A0iiX+HRWL2zcIbm3VwQGHhb91E1y9cLhBbfV
	 Zx5rTncnQEl8JPvyRcxIcackEMgh5UW0vVTpNRp0rpdErnMpK+V9idqdBiaXM1x1g5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p6kMdBel;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF66606A33D
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 14:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EF66606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p6kMdBel
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36d1b3b9974so161910eec.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 06:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794665952; x=1795270752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AdmBh3xC9KRN8uEPKMGQW7/JjymKHmtkhbvdkKIOQCs=;
        b=p6kMdBeltiYaeGuBoulkvnkV8Zx8StjYzuHAWm0mCRTD0Gjf/2ppOvcLTKcnDqH60K
         sNp++6tso/BiGGsyauXQDk2INGl/TTi6x4ijHloXXPiQzp9AYgE9gfg0RAnF/JnVL5J3
         nyYw5LQxiBi0QclPQiPLdqYqi0ZzG5JSfrazzW2KA2x7R5ez+WLRvTOBV1fEDU6pb5Px
         PHMgRCDKhQ87EAt1mMz7cTI1EZw19KpLyoyAd2D/g/Akieh9/6Wvw+qruWvc29owFyll
         F+9Dq4nttToiAqOs4YEcOqDN4ZKmZY6Zu9a+VUqw7DZn05duSp2NU6sCK7NfyX32ZKw/
         hvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794665952; x=1795270752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AdmBh3xC9KRN8uEPKMGQW7/JjymKHmtkhbvdkKIOQCs=;
        b=m8uszOjKkBkogW/R0C7KQc7ks0VT2VeDgFrQRGwvVNACMBff4JbzHNeWzBt3gLyvJb
         3muUaOPsXixL0daYe6FWmWkon/9Kayq5Z2ZHGvFa2ZjmKtjWln7F+x28SqdwudYyAOkK
         wm/FW+HcYDKwS8DEqcguUvfGREh4WCaBcg5ktBbOCO2fbuN5z5H7zN0H7WI1jOv3CQVe
         3eXI+MGinj9rpwxGiYQelEpzuKiKBPkbLkUm4/v+BfpA7qD7mg0lVZ0wMAXPvbKRIAxl
         W/mzNjJ+UOK4K/f5yZlMjvdedHrfFPqnwHf9eHNBBnfpFRXs4G0y5e68Kq54002P9hId
         +VIg==
X-Forwarded-Encrypted: i=1; AL+hErGziAnbvPTud77aw6xxEqGUwH3rWwKlZN8j3Fo0bS1oGBBkYsH4h/ZBBRkPtry1bw4kllkHOpv+T5hcwgjo@vger.kernel.org
X-Gm-Message-State: APuU4Z9kQDDbia2KNLYom3HWkMkaunksgc5tQ8xshYGL0lszTbZ9WE1U
	jOzTzy9Oc/4+d5ZrVQAhCKnWHZ9Cwdz3UCkOQ+w+w5+StkNVC1nKGlep
X-Gm-Gg: AYBFou0LNjYCwqkY/npGGEFIFk3fZMD/oCwBtagLfoMc7NQN7gxA8Bkgq12Kxp5IDIG
	kreGehPMRvxI2VMAs7Zqa1YbQM2IK+FwG5HzRYZKpfzKzKlrjlqAU2TAaFsU7luNz4jBsP4zSba
	uiWXR09N/sCjgHm0X4WVDRVnhKKysC5p3vVn7khvjE1sGfBoIZ8sT34QrcJCksFPbCHzBTNBkeW
	xQBp+tls7hKH2g4vnnCs9GSl/q0IcmpyT8aGb2G1m5Q7Y2LyWKyMP7txkWWar9Q7oy8WuZkZFEH
	NHxyGhaM4rQF25DoIPbhY0jHIU6Eha3IAWPgLMazNRg9k/WvXr0besHMpKj04vLmJgD2R2+6a4N
	8BCzkl1D2dPdYZnKdmdM3ckqBphAh+g2SOzplLxO3qSsDLMk5CNMUjXJ9teytj3Ix+ojPCeuuWC
	oIMkaqyoEJCzUX7BwMMkpiHB4KVw/awTiu4utjDhtqeoeY6l2lDXh+uH9x5CEEnewOJvI/LQ2e8
	f++9PXmNehNSErHWaHZbrdzVcOpdUBAYkTV5UYBV4dyiTdy5RR5xJS0mjl+2kC+apBX1Psd5ViQ
	sqWc/dnd0UskvNHt5t+bELwfAAwchRefnHOJ2FAGV/1vci6GmWT5fBeNQfVkxH3DLsgahlujkg2
	lGe8=
X-Received: by 2002:a05:701b:4508:10b0:1b3:a881:a67b with SMTP id a92af1059eb24-1b5030b6337mr8411764c88.1.1794665952002;
        Sat, 14 Nov 2026 06:19:12 -0800 (PST)
Received: from DESKTOP-CJ1L666.localdomain ([211.198.99.62])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b2519sm14745032c88.13.2026.11.14.06.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:19:11 -0800 (PST)
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
Subject: [PATCH v3 2/3] drm/msm: Destroy the VM_BIND entity when its queue is closed
Date: Sat, 14 Nov 2026 23:18:50 +0900
Message-ID: <20261114141851.134290-3-arpe1618@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114141851.134290-1-arpe1618@gmail.com>
References: <20261114141851.134290-1-arpe1618@gmail.com>
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
per-context list of them. That would also keep the ioctl out of a
killable wait for the queued jobs, which the freezer cannot interrupt.

 drivers/gpu/drm/msm/msm_gem_vma.c     |  5 +++
 drivers/gpu/drm/msm/msm_gpu.h         |  6 ++++
 drivers/gpu/drm/msm/msm_submitqueue.c | 50 +++++++++++++++++++--------
 3 files changed, 47 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 0b9f2e8916b7..ce9d97582df5 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1557,6 +1557,11 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
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

