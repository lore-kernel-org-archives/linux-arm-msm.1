Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795077111;
	b=4M3jnzhMY/tcnUr7OLIPUhxISfpxCHou5q5Sb7WPMr72X7bmgjSvnfBMlvOOyvHMS2iM
	 X34/PlhMOiS/+TWV3L2ONWPceXYcNlpLliwMLlHIKRWFFbk0GiI/tZwNX/qEEf/DJx/tg
	 pyXJ8dSEqEDHItWP0ADEeFCVQxBLwiRJWw2lVBXE27LjB/oVQsk2VtTfNu6Nrq0YjFhWU
	 A34RragxVxwys/TvrjOHJ2cIbW0CqZM9Lthhdn07PQUUJJRd161myP+YMargOpt1MhePw
	 TcEC5rviKzSl5O+Y3nxPboLIG7EFByMFSlE+ZrAh44uN1S9a1KJHZ7lzg9FhbwJEhjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795077111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QE7ZF+eIOkDqPsqdXYso0HkQT1OPcmclWJ4l96GctkY=;
	b=NH0nxJmlzHmufu/O8O3XDZ1klQu59moJeomIR7L6MWUe5Z0fGIjBSvYY41qj1rBZWXWs
	 US7S62diHt1inaJS9Jmrd+PNYh2OVEYbT5c4H9zqRJCHt1N47ETLDr36CnkmGN6hOqyoQ
	 /xflg5/W9HbiRZJ/M4yLF558wf8EcFF9m0+DYFjmQMcA149yMCCwNP6OhU2i2FkJVXxeC
	 ySpZk8OKHNgBnj3b20JNJCv8NDGskSe2NNx1md5Cl5K4bZPDMO01MytpQe1pu0sfrEbo7
	 8UHgbjVGaT3TPTTo67jviIhDlAn97HmrUF3sGkDNKDArhqT19eTAWwIzsujrnducHBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p7zhndNj;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564E860A2608
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:31:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 564E860A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p7zhndNj
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-382ecd5cf2cso733956eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 00:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795077110; x=1795681910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QE7ZF+eIOkDqPsqdXYso0HkQT1OPcmclWJ4l96GctkY=;
        b=p7zhndNj+ByJ0t/ZowpKyXkDT0n/M5KpRKPY2QUfZjrSP4g7/a53NCFDUBT+txcfhP
         6QH2k1Nj5inKUmUcCpVXFLazgjwx6bp+iFubnrhGH5Hd93kibYP6dIYhvdDr+ljbIdgB
         nBrCYWeeZWBoXboSPQ8RjhcEv7Nk78WRTU5WLzISGR5OFRqYV/RCVLhEyO2mow6NAdog
         20X8QXV/raRsmNyRhuBPR3bnQn5MAOYhHQ3PsA5202Lvuo4BK78Godm+ik10mwLXqPeC
         8bXkHQ2kf5Oc3HjGczhROI2lj2IDer18jNftrh8cLmw//ETSskZE5h5SzJMxPy9q3TCw
         Jgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795077110; x=1795681910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QE7ZF+eIOkDqPsqdXYso0HkQT1OPcmclWJ4l96GctkY=;
        b=S3LWZVlBW8lk0YeeEP5as4El0MpsZ+NzIDZXU2DVbn8UzEArQWzmWvqeKFVwNBnoEx
         rTBALZM05DrpzIGIOP0Im/lHzmJZPh0t8Ooge9rwwdAmQmoB37Bmcy7sXLrTKiP1KrF2
         PaAAeBYY4nCq8lv7hBllQ0Xii9M7Hs2lDCbdQc2cpJEZ/4BFXUHHk+e+cPRyyJkYzlQZ
         ocrjZHricBVCvUO4jZlIySXT4/mBBDSYB58uI/JCurCKaZL/PJihH8zFF1YVIGl3UNnJ
         /OMcjQSQAtxXak3B7/AypOQ2TQG5/vH5HMkcT3iXQcIzeiyDsw2BgLbjVGPI5VKyfjbW
         z5iA==
X-Forwarded-Encrypted: i=1; AL+hErHLhRRFyfoXEQdiLmRNgyVGJ+Qv4vxYlrdiCV7mX5NKrhuhiId4/zCWPwkAgkZ+5hLfwwmW+4seqwdBa/oa@vger.kernel.org
X-Gm-Message-State: APuU4Z+KWQu9X+WCgB1i/ZBQp0msMYDGdxqNEDhBep/As86crvp1G4Cx
	UKzunL5SKWvPmALl9wzBbzjgvwPhQWYUhSM7ZBmjQWkkeeLsnETLd5i6
X-Gm-Gg: AZFdTZcZEXYUfJFffCYURGoiWk0s8MNzMz+DK7xtbDO8jbwB7DyNQWxg5MhTTTVQ9Aw
	CQ2Hv9Y5g2CQTIn7jPE7rnTOcsOysAHVc620lbivnTFPX8dJX1LcE/b/cJYXlDJv2v1PKx0RzTq
	FfKJvhafJQDIVl5QoYc9m6AtrbQKJ86po1LgG71iW9ni7iWAqslD8ItrvcGvmfohgBI1yYz3Egy
	1F//CEfhV54+PZzFZ1UuDxpqKhB21ADSSOmRwkK8NW0jn3mMwSsXkzUUGf1PbvDZ/GRRUBuXIKi
	rXJomW7x05b3raCHznJwK47IqeVmd7INpzsZeDkbdlTKS0C2CR15YzTJyq3FygZTfL32bxnFVbO
	eYHBxl0ZkcYdIEc0NmxCjqEvd3zz5mPD6ZTLWiJd6CZ54bTXraRRmtDMu6mmduzF10wS6Rrx2WC
	LFoczgc5dGNIFAQ1aOAWveQDVok4edGHBwu82SC14MRQj1D5lVL2xFC+H4sx2uSXWZS90vzLpZe
	Frt282FknWDU2iQg/Q6xUpowQ30ZfCEcEfV2sinKbRJ8oZyrqlDTD61NHuJM2MKbTbFP5wqFlAu
	Hid97yEPgaNxcs0E5/6XHXcoPlQ6wClYvwQFsAd53MnQ3Lgd22KRuzGIQXtAe3ka3/RVGwdCzQR
	ZUG0Fo1vhG8UjiNplCApy1U9nOfNrO2GCrUR0QbQsxeu335hH
X-Received: by 2002:a05:7301:188e:b0:381:685a:e1ee with SMTP id 5a478bee46e88-384b3e78a26mr413843eec.12.1795077110279;
        Thu, 19 Nov 2026 00:31:50 -0800 (PST)
Received: from lwq-server.tail118c18.ts.net ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63054ddsm16553792eec.4.2026.11.19.00.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:31:49 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 2/2] drm/flip: drain the flip work on cleanup
Date: Thu, 19 Nov 2026 16:31:33 +0800
Message-Id: <20261119083133.3437277-2-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119083133.3437277-1-shunsheng1218@gmail.com>
References: <20261119023604.1495603-1-shunsheng1218@gmail.com>
 <20261119083133.3437277-1-shunsheng1218@gmail.com>
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

drm_flip_work_cleanup() only warns when the queued or the committed list
is not empty.  Nothing cancels the worker and nothing runs the tasks
that are still queued, so the caller silently leaks whatever the tasks
hold (framebuffer references, vblank references, ...) and, if the
worker is still pending, it can run after the structure embedding the
flip work has been freed.

Cancel the worker and run the remaining tasks from
drm_flip_work_cleanup().  The work item is the only producer of the
committed list, so after cancel_work_sync() the two lists can be
spliced out and iterated without holding the lock.

The helper only drains the work items that exist when it is called, so
the callers have to make sure that no new item can be queued and that
the objects the tasks still use are alive:

 - Rockchip VOP: vop_unbind() unregisters the shared interrupt with
   devm_free_irq() before the runtime PM is disabled and before the CRTC
   and its flip work are cleaned up.  Disabling runtime PM is not a
   barrier: vop_isr() bails out when pm_runtime_get_if_in_use() fails, but
   that helper returns -EINVAL once runtime PM is disabled rather than a
   "not in use" value, and the line is shared, so another user can still
   get the handler invoked.  Removing it from the descriptor waits for the
   invocation that is running and keeps new ones from starting, which is
   what makes the drain that follows safe.  The bind error path that fails
   after the interrupt was requested frees it the same way, so every
   request is released exactly once.

 - MSM mdp4/mdp5: mdp4_destroy() and mdp5_kms_destroy() release the flip
   work from the KMS destroy path, after the interrupt and the KMS
   workqueue have been stopped and before drm_gpuvm_put() releases the
   VM the worker needs.  The DRM-managed action is removed there, so it
   cannot run later against a KMS that no longer exists.

Rockchip VOP called drm_flip_work_cleanup() after drm_crtc_cleanup(),
which memsets the CRTC.  Its worker calls drm_crtc_vblank_put() on that
CRTC, so the drain has to happen before the CRTC is cleaned up.

Fixes: cabaafc78935 ("drm: add flip-work helper")
Fixes: 47a7eb459777 ("drm/rockchip: Unreference framebuffers from flip work")
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>

---
Changes in v2:
  - Split the MSM preparation out into patch 1; the generic helper keeps
    draining the queued tasks here.
  - Add the Fixes: tags for the flip-work helper and for the Rockchip
    ordering.
  - Describe the MSM callers by the new KMS-destroy call site instead of
    the managed action, which now runs earlier.
  - Rockchip: drop the pm_runtime_get_if_in_use() change.  Unregister the
    shared interrupt before the runtime PM is disabled and before the CRTC
    is destroyed, and release it on the probe path that fails after the
    handler was registered.
  - Checked as a series: both patches apply in order on msm-next
    (d024361c631b) and on drm-misc-next (fac7a5f16230).
Prepared against v7.4-rc1-1969-g666539eecdf4.

Compile tested only: arm64 with aarch64-linux-gnu-gcc 11.4
and CONFIG_DRM_ROCKCHIP=m, CONFIG_DRM_MSM=m.  The affected hardware was not
available, so the teardown path was not exercised and no fault or
race injection was run.

Checked as a series against the target trees: both patches apply in order on
msm-next (d024361c631b) and on drm-misc-next (fac7a5f16230).

AI assistance: the analysis, the change and its review notes were
prepared with Claude (Anthropic) as a coding assistant.  The author
reviewed the reasoning and takes responsibility for the content.
---
 drivers/gpu/drm/drm_flip_work.c             | 23 +++++++++++++++++++--
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 21 +++++++++++++++++--
 2 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_flip_work.c b/drivers/gpu/drm/drm_flip_work.c
index 52c437746d483..b8ce3966fa9ab 100644
--- a/drivers/gpu/drm/drm_flip_work.c
+++ b/drivers/gpu/drm/drm_flip_work.c
@@ -149,10 +149,29 @@ EXPORT_SYMBOL(drm_flip_work_init);
  * drm_flip_work_cleanup - cleans up flip-work
  * @work: the flip-work to cleanup
  *
- * Destroy resources allocated for the flip-work
+ * Cancel the worker and run the tasks that are still queued, so that the
+ * resources they hold are released even if the work never made it to the
+ * workqueue.  Must be called before the object embedding @work is freed and
+ * after the driver has stopped the code that calls drm_flip_work_queue()
+ * and drm_flip_work_commit(): only the work items that exist when this
+ * function is called are drained.
  */
 void drm_flip_work_cleanup(struct drm_flip_work *work)
 {
-	WARN_ON(!list_empty(&work->queued) || !list_empty(&work->commited));
+	struct drm_flip_task *task, *tmp;
+	LIST_HEAD(tasks);
+	unsigned long flags;
+
+	cancel_work_sync(&work->worker);
+
+	spin_lock_irqsave(&work->lock, flags);
+	list_splice_tail_init(&work->queued, &tasks);
+	list_splice_tail_init(&work->commited, &tasks);
+	spin_unlock_irqrestore(&work->lock, flags);
+
+	list_for_each_entry_safe(task, tmp, &tasks, node) {
+		work->func(work, task->data);
+		kfree(task);
+	}
 }
 EXPORT_SYMBOL(drm_flip_work_cleanup);
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index 69e72727da24f..c10ad16147a54 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1990,12 +1990,19 @@ static void vop_destroy_crtc(struct vop *vop)
 				 head)
 		drm_plane_cleanup(plane);
 
+	/*
+	 * The flip work drops the vblank reference taken when the framebuffer
+	 * was queued, so it has to be drained while the CRTC is still valid.
+	 * The CRTC has been shut down and runtime PM disabled by the time this
+	 * runs, so no new work item can be queued anymore.
+	 */
+	drm_flip_work_cleanup(&vop->fb_unref_work);
+
 	/*
 	 * Destroy CRTC after vop_plane_destroy() since vop_disable_plane()
 	 * references the CRTC.
 	 */
 	drm_crtc_cleanup(crtc);
-	drm_flip_work_cleanup(&vop->fb_unref_work);
 }
 
 static int vop_initial(struct vop *vop)
@@ -2259,7 +2266,7 @@ static int vop_bind(struct device *dev, struct device *master, void *data)
 		vop->rgb = rockchip_rgb_init(dev, &vop->crtc, vop->drm_dev, 0);
 		if (IS_ERR(vop->rgb)) {
 			ret = PTR_ERR(vop->rgb);
-			goto err_disable_pm_runtime;
+			goto err_free_irq;
 		}
 	}
 
@@ -2267,6 +2274,8 @@ static int vop_bind(struct device *dev, struct device *master, void *data)
 
 	return 0;
 
+err_free_irq:
+	devm_free_irq(dev, vop->irq, vop);
 err_disable_pm_runtime:
 	pm_runtime_disable(&pdev->dev);
 	vop_destroy_crtc(vop);
@@ -2280,6 +2289,14 @@ static void vop_unbind(struct device *dev, struct device *master, void *data)
 	if (vop->rgb)
 		rockchip_rgb_fini(vop->rgb);
 
+	/*
+	 * Unregister the shared handler before the runtime PM is disabled and
+	 * before the CRTC and its flip work are cleaned up: disabling runtime
+	 * PM does not keep vop_isr() from running, and the flip work the
+	 * handler commits has to be drained afterwards.
+	 */
+	devm_free_irq(dev, vop->irq, vop);
+
 	pm_runtime_disable(dev);
 	vop_destroy_crtc(vop);
 
-- 
2.34.1

