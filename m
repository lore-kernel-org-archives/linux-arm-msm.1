Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793556343;
	b=yMoQm5v9PJYIC+1ztOQrchLTrwN1BjdVW72NllSAPXNlAlYvAq4cVHOebexf4Z/lQgFK
	 dPvHvvCsh2dbS1lzdwmajceXkgtkMIAJPCcbuVUROaIqkEjiIyQd1164JpMka6oKRWKGg
	 Q0/aSeLecOYAHZG9j3k7mwf5+OaPxqhRC5sHuAXT1n5VsFW1NxUPynSjNuH5ua+884TaK
	 tIqaKHo04XeeJmfxzi8UFCWay4VbIAtfs3z0cQCboMNqfdApLELtH72DmnSbTx5o+txK0
	 3q/gq9aEHNtwuOJBr1aRGhCUo9/zziqhpxDSvzaexXcORMoppt7t1drQGIMwt07m66w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793556343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xkS6xbmE+ewGMYaLKZHzgOXG3y/RT/Y6ukuGmQk4oP0=;
	b=Jc2kHFm+I0mQ9aTh2XrwcFblApuBKaPMLNYKh6IKBx5yNQzwokM3qQHztMjm2FIXi5s0
	 UpwcW2RSinqGspC0Meg7JkH0pPIVbyFaChGaWETFNW9J5GQVvysqCPTFcINVq+SSTlVqv
	 ovlcJgExil3taLhNCE+yhV4zRWCggQU0cKbXFA7wCHXXhwTZdp4eGYb2RFAdnFgdTSkk+
	 dh4Q/RXoyE5NKGVPT9Hv17ETNZ8dURLAVijg8HAiiuKATgvbdPYjjuZHv5E1/MyXwbppw
	 T7Rc03oPZYtU1ivKzuOWff8Ei7WQZ4ecVo9gMIM41fXSTYw6EPn0LjllMBpKnB9UHzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bidSSP03;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBEE606A325
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 18:05:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CBEE606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bidSSP03
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so1548118b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 10:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793556343; x=1794161143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xkS6xbmE+ewGMYaLKZHzgOXG3y/RT/Y6ukuGmQk4oP0=;
        b=bidSSP03obNuDoC07GZcasZYOz1qc2TFNIOGi8OCFFs6elFzrTRBTNpDPm3/wlcwq+
         ZjhG83xHea7YSiCuBjODLd0bFgDHwRsmYj1fkQgM9Rkzfn9oKrJFQchAECzLAVZmO3dn
         KCUo1b8GanmcWIQoccM8tD1WYT0iXhJ+MpKeCLlXkgQ6JBs32SahI4R7EHDMvyWTFWZx
         jFWaLW/OMpUFRZxlwl/EnS7p6Xzydd7ps2lXQsdC9X5vIMYXSF1AjyKlmsknBykm/2Cn
         3ieR0TfANAnWHIiHG/2vjKF/r/oKwa0XR4W69fPhi8t9nC0/1NhLc4ZjFlKXh6ZDC0gR
         V7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793556343; x=1794161143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xkS6xbmE+ewGMYaLKZHzgOXG3y/RT/Y6ukuGmQk4oP0=;
        b=CetpsEeOMLVDeFyNs3QEPbLaZAclebYr/4omGwi0nObVaLK9QuNHEilk+PGSKtkY9m
         w42k28sjxqOlQZjXIOHHdR9DW28hVgB/A0I8kWmvCrFQE8fgBGNTDqjCCctneJQStQc7
         tHdmGoblVzuobgqfmzs69sNA2VlCHyvsSSiKSidfsK54Sx1hCaT7wr4oi+MMi6FCj3OZ
         c/HSYKau0rnLE0BM1uJzFP75WRMEhu6xKzxgzxX6deaTEK5nLBq4xRxhbt+AJ7JMM34u
         pTEIZRkPjy3IvTn6F9W80uuWpoPR+7TWeUfHX/kQtOlc7gfdVVjiKzDx1mlKVo65Zp6g
         5EZg==
X-Forwarded-Encrypted: i=1; AKwUvBzVVlJ12J5Puwz805ThtHiRye4BK4KBEe4VsJ+dNHHhVlTxdTWbtLpdMDtQtyZ5/100toVFZGWHFbMIAfOb@vger.kernel.org
X-Gm-Message-State: AFq9FYJgnunIkoheygs0dziF6lVmC/Z7XXTAntHHkVbMF/iG9pG+Kc/T
	vH8QdkjPDLVuLDUMPAHVt3Vqzw39fvEoDxc/N0EVY5UInoNC7H0Xry+A
X-Gm-Gg: AYBFou3QQi2x6R7trQzQ426PWJ8V4PJqb2gJonco9NlFBkwYyfpHRE56+YooCwHqRqV
	GjUmXfNpYuB42y6pGb786p8jjmf0WL1RyYuv44w/Wu99CDAwMkW5TnlI7JXwSGwB0Bm76VPEm2a
	uEgHD1BG50icTWQVHnQdcbEltsOtm69TOWGi4Jx6at8NCUpHj1VyPjLMLY8Yg+QTrGpNZo24Dk2
	nADVWIujmp47D9k31NLx9uSVgH0/o+oZUSQ2klX+5vZHzGF3lf5h5WOR+m5g2/yKvwoAh6RxRDL
	gHc7u4kItCecA28p95n7niBKSYEXVu9W96dInd7sMXeHrSo6vFWeq4s4n40BcHOo4XUUQzjCcQM
	PYL2Wf9sWFfEhjup176P+w0oHUuy7j700U5GFmPDzmX2bKTu5zUUzRoDB0SNPyifU8SvXF8nqiK
	Xv5KOHylCTtuBKWoknDRv360JHW2K1rnshY8eNImeezlCS+MdYWpjLxVfoAxf0MhAZLE6y0COHD
	RAyoK2/vrU6zx+YOuqAtueOaTybzBI2oa/EY8h+GVPhHC1tqNoDGFiIXkOiEYMVIx+Tzl2RQIQS
	z6dAc70Ha5q4R4QZe2gRAm0=
X-Received: by 2002:a05:6a00:181b:b0:89d:eb23:4e83 with SMTP id d2e1a72fcca58-8a9beb67de4mr6450461b3a.30.1793556342787;
        Sun, 01 Nov 2026 10:05:42 -0800 (PST)
Received: from tabby-boi ([2a09:bac5:4fad:e6::17:370])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8ac269b8805sm446544b3a.44.2026.11.01.10.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 10:05:42 -0800 (PST)
From: Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Connor Abbott <cwabbott0@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 4/4] drm/msm: serialize devcoredump reads of the crash state
Date: Mon,  2 Nov 2026 02:05:08 +0800
Message-ID: <20261101180508.66598-2-nicoangelodelacruz@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101175553.53746-1-nicoangelodelacruz@gmail.com>
References: <20261101175553.53746-1-nicoangelodelacruz@gmail.com>
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

adreno_show_object() converts each captured buffer to ascii85 the
first time the crash state is shown, in place: it checks *encoded,
replaces *ptr with the encoded copy and kvfree()s the raw buffer.
msm_gpu_devcoredump_read() only takes gpu->lock around the reference
get, and every read() of the devcoredump renders the whole state
again, so two processes reading the same devcoredump at once can both
see *encoded == false and both free the same buffer, or print a
buffer the other one just freed:

  WARNING: mm/slub.c:6733 at free_large_kmalloc+0xb0/0xf8
   kvfree+0x44/0x60
   adreno_show_object+0x190/0x240
   adreno_show+0x1d0/0x438
   a6xx_show+0x68/0xbd0
   msm_gpu_devcoredump_read+0x144/0x1f8
   devcd_data_read+0x34/0x48
  page dumped because: Not a kmalloc allocation

The dump also changes length between reads, so a reader can get a
short copy that ends at a page boundary.

Seen on an Adreno 830 with IGT's msm_recovery reading the devcoredump
while a udev helper copied it out: 16 such warnings in one boot, none
with this patch.

Add a mutex to struct msm_gpu and hold it while the state is
rendered. Only one crash state exists at a time, so a per-GPU lock is
enough. gpu->lock isn't used because a devcoredump reader would then
hold up recovery and fault capture for as long as it takes to render
the dump. The new lock is taken after msm_gpu_crashstate_get() and
dropped before msm_gpu_crashstate_put(), so it never nests with
gpu->lock, and it is taken interruptibly so a reader waiting behind
a slow render can be killed.

Fixes: 1df4289d5b23 ("drm/msm: Optimize adreno_show_object()")
Cc: stable@vger.kernel.org
Signed-off-by: Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 10 ++++++++++
 drivers/gpu/drm/msm/msm_gpu.h |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index fded78fdb..428dc9666 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -191,11 +191,18 @@ static ssize_t msm_gpu_devcoredump_read(char *buffer, loff_t offset,
 	struct drm_print_iterator iter;
 	struct drm_printer p;
 	struct msm_gpu_state *state;
+	int ret;
 
 	state = msm_gpu_crashstate_get(gpu);
 	if (!state)
 		return 0;
 
+	ret = mutex_lock_interruptible(&gpu->crashstate_show_lock);
+	if (ret) {
+		msm_gpu_crashstate_put(gpu);
+		return ret;
+	}
+
 	iter.data = buffer;
 	iter.offset = 0;
 	iter.start = offset;
@@ -214,6 +221,8 @@ static ssize_t msm_gpu_devcoredump_read(char *buffer, loff_t offset,
 
 	gpu->funcs->show(gpu, state, &p);
 
+	mutex_unlock(&gpu->crashstate_show_lock);
+
 	msm_gpu_crashstate_put(gpu);
 
 	return count - iter.remain;
@@ -914,6 +923,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	gpu->funcs = funcs;
 	gpu->name = name;
 	INIT_WORK(&gpu->crashstate_free_work, msm_gpu_crashstate_free_worker);
+	mutex_init(&gpu->crashstate_show_lock);
 
 	gpu->worker = kthread_run_worker(0, "gpu-worker");
 	if (IS_ERR(gpu->worker)) {
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index db9e11e7f..9b683973b 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -264,6 +264,14 @@ struct msm_gpu {
 	 */
 	struct work_struct crashstate_free_work;
 
+	/**
+	 * @crashstate_show_lock: serializes rendering of @crashstate for the
+	 * devcoredump.  The show functions convert captured buffers to ascii85
+	 * in place on first use (see adreno_show_object()), so concurrent
+	 * readers of the same dump must not render it at the same time.
+	 */
+	struct mutex crashstate_show_lock;
+
 	/**
 	 * @recovery_in_progress: true while recover_worker() holds @lock, so
 	 * that fault capture and GMU waits don't wait on a fault devcoredump
-- 
2.53.0

