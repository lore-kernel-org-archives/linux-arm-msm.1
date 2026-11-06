Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793983596;
	b=4ZmabPPZ5zlkToKiaJ4pZQ61uNrmHx/qdRKeLFxz2ETKjKWijgsW/F2lDBUodN3p1mpi
	 Tue+l5PlOJoOwjDgDBm7ysiImb4oHEjLrQjj8xlEN6COOTAzkSr315ksxNFde+VvB+wgU
	 TjlwS4ylyTVXsHUFU9Wxfv7eDRTIp4DN3qpVsrTwtRjYswdRhe7T2aR0tM9Roi1TmLSn8
	 GZfvKl9B1MqN+x5h+OyO18TRp7x+LqINEFzrDM+yGyyHfpSXpsrjNaftqM+A5Q3VMh73v
	 4OeSdDL3FIVd0fF0dbZ79Fpc+a2k7uKtTnNV+oDZD6usBY7A1YEdtVgfGscULOgCbnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793983596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=tR9PIZMp1/B1VZp61PDJflUuOC+d7CAwP94G0NwVvBg=;
	b=nfJluTgxH9H36TVxClbBMTkpE5XMSr1i2QSulBGrOxysL95Cp+KL6c9S/TjeWEAXMI3o
	 Z/T6jfOcSiIyhyrRf5rDwnOJvKlDm644whyEnLj2f1DvQJ2UIH9kamNn7I5CNUvzoUPI3
	 PohZspv4UWwMQ66iY09LzAp3u4JYq2b2UcvZBcsYMkREA++X/OYaFCQW2Xs2+17CQIwoQ
	 AM06beQtDQ0QGDsFT2nXnhvKm3/NY1EZSXlK9PowJz5l4zZgDa0gyoPXiZ6bTmXjiD998
	 WQjIBH9vTCAwrzBt68FQguRFoegBZrZgVDxhgklTxmb6p/PtSkRu/YTLXAVAJm+zruQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l9QEtjkX;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A205606A329
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 16:46:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A205606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l9QEtjkX
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so7968385e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 08:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793983594; x=1794588394; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tR9PIZMp1/B1VZp61PDJflUuOC+d7CAwP94G0NwVvBg=;
        b=l9QEtjkXCCyO4oyUh5sTQakrDl4xkD2tm/zcaI2Ey3bRGPEeCsdeU2W7IpVy3xHmso
         jGNyf6+dAUIvZN+8Y+m2Jsz+cvQiyANu6oMJHxGC5Eru+jQFf/cwvXJf5rOZ0myKxbLZ
         2OQxEWvt9CLVpLmlWpzlJ5e9Ispg+/5lfBVbD0uzklHCsQc+ljwz0ORcx0AdjV9WV4CA
         iYebSKH55Ppn955NlCAJbs7M4pzP0tCRD8If+NzDBVoPrLRtQRaiYmxCmU/XkGnWwGHd
         yDXqU6Aj4wS3yWwaTXNKl7xy5C+eVJX4j96Kbt8+Q0KtfsdK3jxBYPpz+jCKMrjA06CG
         ZvcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793983594; x=1794588394;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tR9PIZMp1/B1VZp61PDJflUuOC+d7CAwP94G0NwVvBg=;
        b=S+JHxFH9X3LFYB6rEAlIZ7UbIgcycX55Xp5Bokk8/27dNWG+u4rQSVDD7i9+6iTPtW
         RmSQS7946YLW+3v6P+61i9yqkmY1WlsLJems9LAQGu8D+8svhqZ9deJywjiIVXMCC0nN
         abskxtWxqB6e01kpi2G2z9abtIPQL2d5JaZsvJ2F+fbXJUxjubW5cTsK9Z6pl245zsXd
         HcT5bXJhm95LZEk0x3RiwgL1A/9TfJT4ynz6uenQIjM9z2apWHnSNKH1Lf2YYxc4ahDU
         Vbq8P9stv1ASfg/k+W3yARSguP8fRB0SJa/zEkWeRK6JR/1A+9utt5vLOD9pP1fwmz8v
         CdIA==
X-Gm-Message-State: APuU4Z971F574WQATUBLudIzX4sT3zROPYIcZWXJb6mxmGw2i3fG2Dh/
	r+RQ4LmsacotrwRt3Z060p5z/pfQof6piDVWC1TX5UfQtcRX5CNzJZQLHhv7
X-Gm-Gg: AYBFou2ySpxExk9i8aQYFl1l9hFnQEJqYD7ZYKe6IBB5DM9/LbbPYw3chsv+herqhfx
	gwH8B8qtZM7zXGD7Kjx+yXz0Ce3I9mAU924dwEd2xRw0GJWSnZOFyMq/Jb26rmHsVwEuZIsdVW+
	SOSt31njwmmViOR4+6UKN83X0NJ781LbA7m73PGazeH7gUEsiAoDPwLoEtevsxXbW7LloHLGRAQ
	xcg3XmMPB0CPdAl9mQOAQH5+IL4rJIWBOE3rFPHJo9xzGaUUFLNgM2uXStQlUzqdqGES/UuLTto
	UotqEzrlDYlZwEqf89o6yyg/Pw86NctVaOxEATZsaY4ZSNrbn3z90xZbZTPiK4vF+bmCwWlIvIj
	wihXI3nOZMlJtDOm73AkHb5WI/+E1m8IW0GOd7sohiJB1HbPFSwv/Oks1qMC+t7Te0GAcIwF/9K
	Hm3fR6K65wmytlM9mqzeIWZf1aKCnKNL40a+KmetocSwkxuSMQtpWyICxeKMPnR7b442cGPxFRk
	aTmmHcKVU8njc6SoqB4P3VxrvyNDGZvYRODs6LcEHjM2HJKgrmWhiepTpINoaGfn8hsBFHJK60W
	sfuPxg27AfexFpvRuUJv3jEi+eUZdkQBBmR7Oe/tyKckIA==
X-Received: by 2002:a05:600c:34ce:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4b6dc400256mr57508205e9.4.1793983594180;
        Fri, 06 Nov 2026 08:46:34 -0800 (PST)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cb75939sm6920425e9.2.2026.11.06.08.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:46:32 -0800 (PST)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Fri, 06 Nov 2026 17:46:28 +0100
Subject: [PATCH v3] drm/msm: preemption aware hangcheck
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-preemption_aware_hangcheck-v3-1-852acf72102c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NTQrCMBAF4KtI1kZmUtsmrryHSEnTaRu0PyQlK
 qV3Ny0IrsTNwHs8vpmZJ2fJs9NuZo6C9XboY0j2O2Za3TfEbRUzEyBSUIh8dETdOMVZoR/aUbG
 uTEvmxmWpyiQHSbUxLAJxWtvnhl+uMbfWT4N7bb8Cru1fbEAOXOVHiUrmWbznptP2fjBDx1Y2i
 A+VIQj1kxIceUkAaUZYg6i+qWVZ3qb+1fAPAQAA
X-Change-ID: 20250911-preemption_aware_hangcheck-8b9b3708efcc
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anna Maniscalco <anna.maniscalco2000@gmail.com>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793983590; l=19376;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=3YuXm70yMdYjYDs5BkuqBGUpJREbdPh3eisb0CkPUZQ=;
 b=tDYnguVvGxA3EqQpfsxq0XhzHSlCi0aXQpyIxh/Mwjd+u0KQHnKReb6/xDulpI0JFhoXKyfiX
 LWTZXBs50bNBvuYND31rrvhd/rmL58/pDrewl47RsmeClpsUrUqmSrB
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Rework hangcheck code to work well toghether with preemption.

Track the time a job has spent in a ring by storing timestamps of the
`CP_ALWAYS_ON_CONTEXT` register at the beginning of a job and when
switching rings as well as reading it back if the ring is currently
active.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
Ever since we added support for preemption hangcheck has been somewhat
broken as it is not aware of multiple rings.

In some cases it might not recognize that one ring is stuck if the gpu
switches in and out of it.

depends on https://lore.kernel.org/linux-arm-msm/20261102190010.720443-1-robin.clark@oss.qualcomm.com
---
Changes in v3:
- Addressed sashiko's feedback
- Rebased on reworked IFPC disable series
- Link to v2: https://patch.msgid.link/20261029-preemption_aware_hangcheck-v2-1-be0056e1f02d@gmail.com

Changes in v2:
- Various fixes
- Fix interaction with IFPC by using OOB vote
- Link to v1: https://lore.kernel.org/r/20250911-preemption_aware_hangcheck-v1-0-974819876819@gmail.com

To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  5 +--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     |  6 +---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 54 +++++++++++++++++++++++------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 32 +++++++++++++-----
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c     | 12 ++-----
 drivers/gpu/drm/msm/adreno/adreno_gpu.c   |  3 +-
 drivers/gpu/drm/msm/msm_gpu.c             | 56 ++++++++++++++++++++++++-------
 drivers/gpu/drm/msm/msm_gpu.h             | 11 ++++++
 drivers/gpu/drm/msm/msm_ringbuffer.h      | 10 ++++++
 10 files changed, 140 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 16c7335c4b1f..8800352455df 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1251,10 +1251,7 @@ static void a5xx_fault_detect_irq(struct msm_gpu *gpu)
 		gpu_read64(gpu, REG_A5XX_CP_IB2_BASE),
 		gpu_read(gpu, REG_A5XX_CP_IB2_BUFSZ));
 
-	/* Turn off the hangcheck timer to keep it from bothering us */
-	timer_delete(&gpu->hangcheck_timer);
-
-	kthread_queue_work(gpu->worker, &gpu->recover_work);
+	msm_trigger_recovery(gpu);
 }
 
 #define RBBM_ERROR_MASK \
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index bba5468db42e..bcbe1b949217 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -28,11 +28,7 @@ static void a6xx_gmu_fault(struct a6xx_gmu *gmu)
 	/* FIXME: add a banner here */
 	gmu->hung = true;
 
-	/* Turn off the hangcheck timer while we are resetting */
-	timer_delete(&gpu->hangcheck_timer);
-
-	/* Queue the GPU handler because we need to treat this as a recovery */
-	kthread_queue_work(gpu->worker, &gpu->recover_work);
+	msm_trigger_recovery(gpu);
 }
 
 static irqreturn_t a6xx_gmu_irq(int irq, void *data)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 773c1727dd31..179e42119307 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -519,6 +519,9 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	get_stats_counter(ring, rbbm_perfctr_cp0, rbmemptr_stats(ring, index, cpcycles_start));
 	get_stats_counter(ring, cp_always_on_context, rbmemptr_stats(ring, index, alwayson_start));
 
+	get_stats_counter(ring, cp_always_on_context,
+		rbmemptr(ring, last_job_start_ctx));
+
 	OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
 	OUT_RING(ring, CP_SET_THREAD_BOTH);
 
@@ -1474,8 +1477,11 @@ static int hw_init(struct msm_gpu *gpu)
 	/* Always come up on rb 0 */
 	a6xx_gpu->cur_ring = gpu->rb[0];
 
-	for (i = 0; i < gpu->nr_rings; i++)
+	for (i = 0; i < gpu->nr_rings; i++) {
 		gpu->rb[i]->cur_ctx_seqno = 0;
+		gpu->rb[i]->memptrs->last_job_start_ctx = 0;
+		gpu->rb[i]->memptrs->last_active_ctxcycles = 0;
+	}
 
 	/* Enable the SQE_to start the CP engine */
 	gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 1);
@@ -1838,13 +1844,10 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
 		gpu_read64(gpu, REG_A6XX_CP_IB2_BASE),
 		gpu_read(gpu, REG_A6XX_CP_IB2_REM_SIZE));
 
-	/* Turn off the hangcheck timer to keep it from bothering us */
-	timer_delete(&gpu->hangcheck_timer);
-
 	/* Turn off interrupts to avoid triggering recovery again */
 	gpu_write(gpu, REG_A6XX_RBBM_INT_0_MASK, 0);
 
-	kthread_queue_work(gpu->worker, &gpu->recover_work);
+	msm_trigger_recovery(gpu);
 }
 
 static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
@@ -1861,11 +1864,8 @@ static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
 	 * to legacy blending.
 	 */
 	if (status & (A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
-		      A7XX_CX_MISC_SW_FUSE_VALUE_LPAC)) {
-		timer_delete(&gpu->hangcheck_timer);
-
-		kthread_queue_work(gpu->worker, &gpu->recover_work);
-	}
+		      A7XX_CX_MISC_SW_FUSE_VALUE_LPAC))
+		msm_trigger_recovery(gpu);
 }
 
 static void a6xx_gpu_keepalive_vote(struct msm_gpu *gpu, bool on)
@@ -2293,6 +2293,39 @@ static u64 a6xx_get_timestamp(struct msm_gpu *gpu)
 	return gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER);
 }
 
+static int a6xx_get_ctx_timestamp(struct msm_ringbuffer *ring, uint64_t *value)
+{
+	struct msm_gpu *gpu = ring->gpu;
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	int ret = 0;
+
+	/* Inhibit IFPC while accessing registers: */
+	guard(ifpc_disable)(gpu);
+
+	/*
+	 * a6xx_gmu_set_oob cannot be called while holding a spinlock.
+	 * Limit the scope.
+	 */
+	if (gpu->nr_rings == 1) {
+		guard(spinlock_irqsave)(&a6xx_gpu->eval_lock);
+
+		/*
+		 * Make sure the GMU keeps the GPU on while we read the register
+		 *
+		 * This should normally not be waking up the gpu since the
+		 * hangcheck timer shouldn't fire when the gpu is idle.
+		 */
+		if (a6xx_in_preempt(a6xx_gpu) || ring != a6xx_gpu->cur_ring)
+			return -EBUSY;
+
+		*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_CONTEXT);
+	} else
+		*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_CONTEXT);
+
+	return ret;
+}
+
 static struct msm_ringbuffer *a6xx_active_ring(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -2892,6 +2925,7 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 		.progress = a6xx_progress,
 		.ifpc_update = a6xx_gmu_ifpc_update,
 		.perfcntr_configure = a6xx_perfcntr_configure,
+		.get_ctx_timestamp = a6xx_get_ctx_timestamp,
 	},
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index c0d7ca0969e1..36cf6d7f3d44 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -105,6 +105,7 @@ struct a6xx_gpu {
 	struct drm_gem_object *preempt_postamble_bo;
 	void *preempt_postamble_ptr;
 	uint64_t preempt_postamble_iova;
+	uint64_t preempt_postamble_cntreset_end;
 	uint64_t preempt_postamble_len;
 	bool postamble_enabled;
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index 1e599d4ddea1..e85a4d0e9257 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -21,14 +21,18 @@ static void a6xx_preempt_timer(struct timer_list *t)
 		return;
 
 	dev_err(dev->dev, "%s: preemption timed out\n", gpu->name);
-	kthread_queue_work(gpu->worker, &gpu->recover_work);
+	msm_trigger_recovery(gpu);
 }
 
-static void preempt_prepare_postamble(struct a6xx_gpu *a6xx_gpu)
+static void preempt_prepare_postamble(struct a6xx_gpu *a6xx_gpu, struct msm_ringbuffer *ring)
 {
 	u32 *postamble = a6xx_gpu->preempt_postamble_ptr;
+	uint64_t last_active_ctxcycles = 0;
 	u32 count = 0;
 
+	if (ring)
+		last_active_ctxcycles = rbmemptr(ring, last_active_ctxcycles);
+
 	postamble[count++] = PKT7(CP_REG_RMW, 3);
 	postamble[count++] = REG_A6XX_RBBM_PERFCTR_SRAM_INIT_CMD;
 	postamble[count++] = 0;
@@ -43,6 +47,17 @@ static void preempt_prepare_postamble(struct a6xx_gpu *a6xx_gpu)
 	postamble[count++] = CP_WAIT_REG_MEM_4_MASK(0x1);
 	postamble[count++] = CP_WAIT_REG_MEM_5_DELAY_LOOP_CYCLES(0);
 
+	a6xx_gpu->preempt_postamble_cntreset_end = count;
+
+	if (last_active_ctxcycles) {
+		postamble[count++] = PKT7(ring ? CP_REG_TO_MEM : CP_NOP, 3);
+		postamble[count++] = CP_REG_TO_MEM_0_REG(REG_A6XX_CP_ALWAYS_ON_CONTEXT) |
+			CP_REG_TO_MEM_0_CNT(2) |
+			CP_REG_TO_MEM_0_IS_64B;
+		postamble[count++] = lower_32_bits(last_active_ctxcycles);
+		postamble[count++] = upper_32_bits(last_active_ctxcycles);
+	}
+
 	a6xx_gpu->preempt_postamble_len = count;
 
 	a6xx_gpu->postamble_enabled = true;
@@ -54,9 +69,9 @@ static void preempt_disable_postamble(struct a6xx_gpu *a6xx_gpu)
 
 	/*
 	 * Disable the postamble by replacing the first packet header with a NOP
-	 * that covers the whole buffer.
+	 * that skips the counters reset part.
 	 */
-	*postamble = PKT7(CP_NOP, (a6xx_gpu->preempt_postamble_len - 1));
+	*postamble = PKT7(CP_NOP, (a6xx_gpu->preempt_postamble_cntreset_end - 1));
 
 	a6xx_gpu->postamble_enabled = false;
 }
@@ -263,10 +278,9 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
 	/* Enable or disable postamble as needed */
 	sysprof = msm_gpu_sysprof_no_perfcntr_zap(gpu);
 
-	if (!sysprof && !a6xx_gpu->postamble_enabled)
-		preempt_prepare_postamble(a6xx_gpu);
-
-	if (sysprof && a6xx_gpu->postamble_enabled)
+	if (!sysprof)
+		preempt_prepare_postamble(a6xx_gpu, ring);
+	else
 		preempt_disable_postamble(a6xx_gpu);
 
 	/* Set the preemption state to triggered */
@@ -382,7 +396,7 @@ void a6xx_preempt_init(struct msm_gpu *gpu)
 	if (IS_ERR(a6xx_gpu->preempt_postamble_ptr))
 		goto fail;
 
-	preempt_prepare_postamble(a6xx_gpu);
+	preempt_prepare_postamble(a6xx_gpu, NULL);
 
 	timer_setup(&a6xx_gpu->preempt_timer, a6xx_preempt_timer, 0);
 
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index b6250a2bd113..f83de4de8b35 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -1184,10 +1184,7 @@ static void a8xx_fault_detect_irq(struct msm_gpu *gpu)
 	a8xx_aperture_release(gpu, flags);
 	a8xx_aperture_clear(gpu);
 
-	/* Turn off the hangcheck timer to keep it from bothering us */
-	timer_delete(&gpu->hangcheck_timer);
-
-	kthread_queue_work(gpu->worker, &gpu->recover_work);
+	msm_trigger_recovery(gpu);
 }
 
 static void a8xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
@@ -1204,11 +1201,8 @@ static void a8xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
 	 * to legacy blending.
 	 */
 	if (status & (A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
-		      A7XX_CX_MISC_SW_FUSE_VALUE_LPAC)) {
-		timer_delete(&gpu->hangcheck_timer);
-
-		kthread_queue_work(gpu->worker, &gpu->recover_work);
-	}
+		      A7XX_CX_MISC_SW_FUSE_VALUE_LPAC))
+		msm_trigger_recovery(gpu);
 }
 
 irqreturn_t a8xx_irq(struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index dadfe4c69438..9218fc567144 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -335,7 +335,8 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 		struct msm_gpu_fault_info fault_info = {};
 
 		/* Turn off the hangcheck timer to keep it from bothering us */
-		timer_delete(&gpu->hangcheck_timer);
+		for (int i = 0; i < gpu->nr_rings; i++)
+			timer_delete(&gpu->rb[i]->hangcheck_timer);
 
 		/* Let any concurrent GMU transactions know that the MMU may be
 		 * blocked for a while and they should wait on us.
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 8ed395cc69f5..5232305de58a 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -467,7 +467,9 @@ static void recover_worker(struct kthread_work *work)
 	struct drm_device *dev = gpu->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gem_submit *submit;
-	struct msm_ringbuffer *cur_ring = gpu->funcs->active_ring(gpu);
+	struct msm_ringbuffer *cur_ring = gpu->hung_ring ?
+		gpu->hung_ring : gpu->funcs->active_ring(gpu);
+	gpu->hung_ring = NULL;
 	char *comm = NULL, *cmd = NULL;
 	unsigned int noreclaim_flag;
 	struct task_struct *task;
@@ -629,11 +631,11 @@ void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gpu_fault_
 	mutex_unlock(&gpu->lock);
 }
 
-static void hangcheck_timer_reset(struct msm_gpu *gpu)
+static void hangcheck_ring_timer_reset(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 {
 	struct msm_drm_private *priv = gpu->dev->dev_private;
-	mod_timer(&gpu->hangcheck_timer,
-			round_jiffies_up(jiffies + msecs_to_jiffies(priv->hangcheck_period)));
+	mod_timer(&ring->hangcheck_timer,
+			  round_jiffies_up(jiffies + msecs_to_jiffies(priv->hangcheck_period)));
 }
 
 static bool made_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
@@ -651,11 +653,31 @@ static bool made_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return true;
 }
 
-static void hangcheck_handler(struct timer_list *t)
+static bool check_ring_timeout(struct msm_ringbuffer *ring, unsigned long timeout)
+{
+	struct msm_gpu *gpu = ring->gpu;
+	u64 start, end;
+
+	if (!gpu->funcs->get_ctx_timestamp)
+		return !made_progress(gpu, ring);
+
+	start = ring->memptrs->last_job_start_ctx;
+
+	if (gpu->funcs->get_ctx_timestamp(ring, &end))
+		end = ring->memptrs->last_active_ctxcycles;
+
+	if (end >= start)
+		return (end - start) > timeout;
+	else
+		return false;
+}
+
+static void hangcheck_worker(struct kthread_work *work)
 {
-	struct msm_gpu *gpu = timer_container_of(gpu, t, hangcheck_timer);
+	struct msm_ringbuffer *ring = container_of(work, struct msm_ringbuffer, hangcheck_work);
+	struct msm_gpu *gpu = ring->gpu;
+	struct msm_drm_private *priv = gpu->dev->dev_private;
 	struct drm_device *dev = gpu->dev;
-	struct msm_ringbuffer *ring = gpu->funcs->active_ring(gpu);
 	uint32_t fence = ring->memptrs->fence;
 
 	if (fence != ring->hangcheck_fence) {
@@ -663,7 +685,7 @@ static void hangcheck_handler(struct timer_list *t)
 		ring->hangcheck_fence = fence;
 		ring->hangcheck_progress_retries = 0;
 	} else if (fence_before(fence, ring->fctx->last_fence) &&
-			!made_progress(gpu, ring)) {
+			check_ring_timeout(ring, priv->hangcheck_period * 19200)) {
 		/* no progress and not done.. hung! */
 		ring->hangcheck_fence = fence;
 		ring->hangcheck_progress_retries = 0;
@@ -674,17 +696,26 @@ static void hangcheck_handler(struct timer_list *t)
 		DRM_DEV_ERROR(dev->dev, "%s:     submitted fence: %u\n",
 				gpu->name, ring->fctx->last_fence);
 
+		gpu->hung_ring = ring;
 		kthread_queue_work(gpu->worker, &gpu->recover_work);
 	}
 
 	/* if still more pending work, reset the hangcheck timer: */
 	if (fence_after(ring->fctx->last_fence, ring->hangcheck_fence))
-		hangcheck_timer_reset(gpu);
+		hangcheck_ring_timer_reset(gpu, ring);
 
 	/* workaround for missing irq: */
 	msm_gpu_retire(gpu);
 }
 
+static void hangcheck_handler(struct timer_list *t)
+{
+	struct msm_ringbuffer *ring = timer_container_of(ring, t, hangcheck_timer);
+	struct msm_gpu *gpu = ring->gpu;
+
+	kthread_queue_work(gpu->worker, &ring->hangcheck_work);
+}
+
 /*
  * Cmdstream submission/retirement:
  */
@@ -826,7 +857,7 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	submit->ring->cur_ctx_seqno = submit->queue->ctx->seqno;
 
 	pm_runtime_put(&gpu->pdev->dev);
-	hangcheck_timer_reset(gpu);
+	hangcheck_ring_timer_reset(gpu, submit->ring);
 }
 
 /*
@@ -923,8 +954,6 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	if (funcs->progress)
 		priv->hangcheck_period /= 2;
 
-	timer_setup(&gpu->hangcheck_timer, hangcheck_handler, 0);
-
 	/* Map registers: */
 	gpu->mmio = msm_ioremap(pdev, config->ioname);
 	if (IS_ERR(gpu->mmio)) {
@@ -1006,6 +1035,9 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 			goto fail;
 		}
 
+		timer_setup(&gpu->rb[i]->hangcheck_timer, hangcheck_handler, 0);
+		kthread_init_work(&gpu->rb[i]->hangcheck_work, hangcheck_worker);
+
 		memptrs += sizeof(struct msm_rbmemptrs);
 		memptrs_iova += sizeof(struct msm_rbmemptrs);
 	}
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index e7912d2180a5..ae83e5059eea 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -101,6 +101,7 @@ struct msm_gpu_funcs {
 
 	/* Flush perfcntrs before reading (optional): */
 	void (*perfcntr_flush)(struct msm_gpu *gpu);
+	int (*get_ctx_timestamp)(struct msm_ringbuffer *ring, uint64_t *value);
 };
 
 /* Additional state for iommu faults: */
@@ -249,6 +250,8 @@ struct msm_gpu {
 	/* work for handling GPU recovery: */
 	struct kthread_work recover_work;
 
+	struct msm_ringbuffer *hung_ring;
+
 	/** retire_event: notified when submits are retired: */
 	wait_queue_head_t retire_event;
 
@@ -816,6 +819,14 @@ static inline void msm_gpu_crashstate_put(struct msm_gpu *gpu)
 	mutex_unlock(&gpu->lock);
 }
 
+static inline void msm_trigger_recovery(struct msm_gpu *gpu)
+{
+	for (int i = 0; i < gpu->nr_rings; i++)
+		timer_delete(&gpu->rb[i]->hangcheck_timer);
+
+	kthread_queue_work(gpu->worker, &gpu->recover_work);
+}
+
 void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gpu_fault_info *fault_info);
 
 /*
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
index 0bfb6b0f42fa..6209c2fd3e67 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.h
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
@@ -39,6 +39,9 @@ struct msm_rbmemptrs {
 	volatile u32 context_idr;
 
 	volatile u32 perfcntr_fence;
+
+	volatile u64 last_job_start_ctx;
+	volatile u64 last_active_ctxcycles;
 };
 
 struct msm_cp_state {
@@ -77,6 +80,13 @@ struct msm_ringbuffer {
 	uint64_t memptrs_iova;
 	struct msm_fence_context *fctx;
 
+	/* Hang and Inactivity Detection:
+	 */
+	struct timer_list hangcheck_timer;
+
+	/* work for handling GPU hangcheck: */
+	struct kthread_work hangcheck_work;
+
 	/**
 	 * hangcheck_progress_retries:
 	 *

---
base-commit: 446a86f7c96426b3f9f7d23d239c95cf9dd95ffe
change-id: 20250911-preemption_aware_hangcheck-8b9b3708efcc

Best regards,
--  
Anna Maniscalco <anna.maniscalco2000@gmail.com>

