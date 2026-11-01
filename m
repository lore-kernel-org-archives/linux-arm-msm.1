Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793556054;
	b=Y6IGGuChrvxAuffiQvNJp/FIGpSmGk5YXPnHdXse3F1Xoi31JtQcy2jFdt3WmVpOn0WD
	 qbzRiz8M+NcpSEqzAiedx4cNRQVJesk25ZANK3YOiyTJRUkTKbtX8VWkccnDnKF6DBPyC
	 xQeJZLPNmEp6GV1TXOQEimkTtLl5UoPhD4RL9eZHCjHB1gNxH8v4ZF8xxzVBSuV2Ym+LU
	 BFlGVpchlUz0+1e3fL76C9KL6Is9tsqxCLc7fSiBissJsDFccXoXnOjq1JfWrMpJd2fcO
	 uucwWDTYFxd0qivfgxHr70DaEqxqxeKv3faXozSO2ioyYtrK7NYnYpqyZtNyXhHnofA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793556054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I/g7B1/2uK+SOUUXwB/iWNiLNLGu8eYWyxjyco9QARM=;
	b=bh48xsRaNcPHhHkre6egO+qESc25NBax9fDJvaHzdJPn+MxjlaCXIqq8hCa38EX7uXvF
	 eDaiGVF7PbTeJ0KmfZe2YR6tZVjp+7UND47qYQvzWyHW/GdMoxmeUbo8ovgFkRVy4yPEW
	 DC/NQGukDV8ouKMVuSs+KYmkjox7QO6vJR7dQsYJtP3jUksWra42IOnb22HFEHamBz+1n
	 9BgNYnOhsqYem+N6zYYbwDgxsouYJaS6dxbLlCg3Donub8WxlZFfOIG1aj8ACZr5N6kM4
	 sjPOtc82T+3xYkYVvbe4g+DQ3Q99rlZXPVcj07oYQIrPoycDgjAd6LpuGIdFL/hsveA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f+X3GMRa;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FB0606A329
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 18:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7FB0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f+X3GMRa
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc147d86bebso1527138a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 10:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793556053; x=1794160853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I/g7B1/2uK+SOUUXwB/iWNiLNLGu8eYWyxjyco9QARM=;
        b=f+X3GMRa8dHuSvPGNmbg698/siJqTGuU0Ry6L0u62GzIWUarciz5VcReeKaa3yv5XN
         FwK6VsAbEt0/GlEWrMXghRRNqoXKUQR60eCv5AEm6/eSljrqZaxejkmiHvz77NP8Ud7f
         9lDc15JA6e8wPtlciw0bjBVBdvv6qSohd5u6JpEJqDe0ED/2rCDj0TltQvqZh8mFbSAs
         H/Uxanlwf9E1imbwZJmjo5Mqtl9OHnEaUBGZRLqLJT6p8kzU+W+ceanE1HSdFt71vd/Y
         g5lxmCc/pcq9EGbgPa7dut0PCM0M4JfbmXtu9ZiCuC71zcNRLBRCqpiJqqC8OXfQmtdW
         nNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793556053; x=1794160853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I/g7B1/2uK+SOUUXwB/iWNiLNLGu8eYWyxjyco9QARM=;
        b=p3i1Qvh76YbctsKhu3NJ5SyPAgVJCNNhIm8vZcP+dTQrTlm0ySdfYeDkn9G9Bfox3t
         GjIyc7IjXyezj5QThfme695UBrtzhL7KLBAJ95lwTkj1LmP1LQIOSS0/qoR2OpFEkBus
         aMFhi+talgT6sdvlU63JRlSKv0E8akH1dgqBQPlMAK8dFZgANXaWi4urPgSH6zN2X1VF
         3CPIDW1u1zcOVejPnxhVW5Pu9Aj+maxNYmZblbPXSq6/Gh9evsFOHGcCnlOfbzUSfpqG
         giLlhLFh3kvnqbC/zT7QZb4nFvzjicuwBviJhTXDRu0sqrAO6DXO89o1L5YI6QXwwuRS
         +kgA==
X-Forwarded-Encrypted: i=1; AKwUvBz0C1AZzGubgUPeslkmEmyqKb6a3ScRFoMFjcxPHlFJ4Ndc1fOBNaPpLaYhGAKaLyQcgcMPzLjeD3Pg71UX@vger.kernel.org
X-Gm-Message-State: APuU4Z8KusX/gz0Lege22X0AMgvkC6C8tcazNTMzHbdnQR4BveP2UuPF
	EvPpktb3lVPhNcNNIcJRHtd8Gzy23/TcJRkVC5gqOEuPX7DERgAd5OuI
X-Gm-Gg: AYBFou1zW5TyiAek7BdD3v0IgD3vbL+RlMd5glwTQfkfzoHAaa4hpFMBjEwronTo4UN
	CqSOEib886EUTN6dyhtBZF1+J4iGqDAmG+t3hfFRN3NB2nzFuFA7CId9jup7Cqjj0E69Aen295l
	Tp4K8B/V9UVDJneLs15gfr53fGam5gM3LyvWH3zpmuPUAefSKxUI3oB3xySRHH1zfKcr4Gny3cL
	V4cEb90VqP3WVuEYMoeywfjRd+QjXd3h7zbbp/zQ2nd3jSWTijfUNX8P+Zc4KmdbpNJPJQn22+i
	eHAIPeIcN8REnCCG5+a5tI/jFvHSQeVckq6dVYaIvHq98v1nmoifHQJCmreKoWWzM0jZpdkOVvX
	rLNMALHCojKjid7INJdNLCWqjxAnL168ThB+cJJfcQ/n6jkHXEejFxrYi6vGErJzLO4uMHObuDl
	gbb29Hi437OVTZS7pRCXGFdONhnP0q9mIPztlKVIgDuCTxoqOe+IxhAGqg6+tU5tePM/WTLyyuF
	LMBDtWeEdfVai+njXsEtx4SndwnHQlHr4lxGkHIrZl4Aej2AIeX7r+q1Dhh7xdEb5dZl0tCoIjk
	txCm6wu0FOO47P6M7h5r/Q==
X-Received: by 2002:a17:90b:1b0d:b0:3ac:36c7:c144 with SMTP id 98e67ed59e1d1-3ae89776936mr4446077a91.28.1793556052975;
        Sun, 01 Nov 2026 10:00:52 -0800 (PST)
Received: from tabby-boi ([2a09:bac5:4fad:e6::17:370])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e949077sm15194159a91.9.2026.11.01.10.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 10:00:52 -0800 (PST)
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
Subject: [PATCH 2/4] drm/msm: free the crash state asynchronously
Date: Mon,  2 Nov 2026 01:55:51 +0800
Message-ID: <20261101175553.53746-3-nicoangelodelacruz@gmail.com>
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

msm_gpu_crashstate_capture() sets gpu->crashstate and calls
dev_coredumpm() while the caller (recover_worker() or
msm_gpu_fault_crashstate_capture()) holds gpu->lock. When devcoredump
is disabled (/sys/class/devcoredump/disabled, a write-once knob) or
its allocation fails, dev_coredumpm_timeout() calls the free callback
synchronously.

msm_gpu_devcoredump_free() then calls msm_gpu_crashstate_put(), which
does mutex_lock(&gpu->lock) and so recursively takes a mutex the
caller already holds. On systems with devcoredump disabled, every GPU
recovery that captures a crash state deadlocks.

Defer the put to a work item on system_dfl_wq instead. This is safe
because msm_gpu_devcoredump_read() takes and drops its own crash
state reference, and the work takes gpu->lock normally once the
holder has released it. gpu->crashstate stays set until the work
runs, which only means a capture in that window is skipped.
msm_gpu_cleanup() flushes an already queued free before teardown.

Tested on an Adreno 830 with /sys/class/devcoredump/disabled set to 1:
IGT msm_recovery gpu-fault recovers and the GPU resumes.

Fixes: c0fec7f562ec ("drm/msm/gpu: Capture the GPU state on a GPU hang")
Cc: stable@vger.kernel.org
Signed-off-by: Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 21 ++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_gpu.h |  6 ++++++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index caa86279f..fded78fdb 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -175,6 +175,14 @@ int msm_gpu_hw_init(struct msm_gpu *gpu)
 	return ret;
 }
 
+static void msm_gpu_crashstate_free_worker(struct work_struct *work)
+{
+	struct msm_gpu *gpu = container_of(work, struct msm_gpu,
+					   crashstate_free_work);
+
+	msm_gpu_crashstate_put(gpu);
+}
+
 #ifdef CONFIG_DEV_COREDUMP
 static ssize_t msm_gpu_devcoredump_read(char *buffer, loff_t offset,
 		size_t count, void *data, size_t datalen)
@@ -215,7 +223,13 @@ static void msm_gpu_devcoredump_free(void *data)
 {
 	struct msm_gpu *gpu = data;
 
-	msm_gpu_crashstate_put(gpu);
+	/*
+	 * dev_coredumpm() calls this synchronously when it can't keep the
+	 * dump (devcoredump disabled, or out of memory), while
+	 * msm_gpu_crashstate_capture() holds gpu->lock, which
+	 * msm_gpu_crashstate_put() also takes.  Defer the put to a worker.
+	 */
+	queue_work(system_dfl_wq, &gpu->crashstate_free_work);
 }
 
 static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
@@ -899,6 +913,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	gpu->dev = drm;
 	gpu->funcs = funcs;
 	gpu->name = name;
+	INIT_WORK(&gpu->crashstate_free_work, msm_gpu_crashstate_free_worker);
 
 	gpu->worker = kthread_run_worker(0, "gpu-worker");
 	if (IS_ERR(gpu->worker)) {
@@ -1047,6 +1062,10 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
 
 	DBG("%s", gpu->name);
 
+	/* May be unset if probe failed before msm_gpu_init() */
+	if (gpu->crashstate_free_work.func)
+		flush_work(&gpu->crashstate_free_work);
+
 	for (i = 0; i < ARRAY_SIZE(gpu->rb); i++) {
 		msm_ringbuffer_destroy(gpu->rb[i]);
 		gpu->rb[i] = NULL;
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 5cf220f75..db9e11e7f 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -258,6 +258,12 @@ struct msm_gpu {
 
 	struct msm_gpu_state *crashstate;
 
+	/**
+	 * @crashstate_free_work: drops the devcoredump's crashstate reference
+	 * outside of @lock, see msm_gpu_devcoredump_free().
+	 */
+	struct work_struct crashstate_free_work;
+
 	/**
 	 * @recovery_in_progress: true while recover_worker() holds @lock, so
 	 * that fault capture and GMU waits don't wait on a fault devcoredump
-- 
2.53.0

