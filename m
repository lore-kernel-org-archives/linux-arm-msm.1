Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637556;
	b=tAZSmWMzRNUOpFS/IHdTjueKEMPdfKVyqy0EXZiorkVj2+6yjAAOR6HMXxwD/z9dc7t4
	 L2rmNOufrzDhtqNMJjnjho5Vt1JbeimYVztfLI1Xk+bwdxLVDCU+n35g8/BZICMIIMDaB
	 JgrHaqmA7hqDMT7qjS3yMqoYbW14ZG04uJjQvZ7R0ToDwYCgz0b8rFWrL7fQOWjnSM9+7
	 RPMxkXr/Whqanw7a/NQOsPIYq0cUb4IapvBzFI86TmwS4XrXE7jhFGfpuafCKlZO8ua/E
	 18uWJ89Lz/dZVBuFBVbVvBVkgDEFA6hV9k9Y2K9asi6cyG6BcyPevLUVfpyo8QlC5BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2G/wlgst0b3QmNrVuRQ50SldBGJC/pdF4BObZ2EI5Ls=;
	b=KnTwz2LYbldorOMS5260IyK6A+GIyNHOb+1uizgeNPQ4fX2ZYsGpSLCjV46tC7GMKabr
	 ApUF8mY7r0Ev9HMvnYzwWCppkOWftUnf6/71YdkQ3QXpeo5JSIrCrZWi8yVJUO9asdsOf
	 nLA2wqIEo36Q8WJt5oI2VHZqxLc/5F1pD5Lu/Osq9pHO+bwIfEZJg/aIeVpKpPPpRQWu3
	 q5oAtHIsQQe6dzC1VkzL3yN1KAFhgkpZ4F0GhI7eZ6Q3NeqHWcBdv+QmYoXNSwxwVFW7P
	 tyYnkWVCYXlEeAEjv/Um6zcZnmXGJKTNkOXAHXj46SwLxBW5od17vgQeH9P6C+aAiew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PJ6HP7tQ;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38321606A893
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 06:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38321606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PJ6HP7tQ
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-376a4059061so191205eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 22:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637555; x=1795242355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2G/wlgst0b3QmNrVuRQ50SldBGJC/pdF4BObZ2EI5Ls=;
        b=PJ6HP7tQeeuDG4zzlhNDMmZ7tS0LVez9oRI3SvJOvGfzY2SI/mcYzl7mD81NFnCOFs
         L0AZNWqY/+L3PXXnKBewPmcAWRCrXFHvXXi6gJydDne3MwTHhp2hO5F1ygjsbxOgNtey
         ZGYI4TFAx9WjHOmrqEv18kPAXdgodpvqlB3wFVttrPawXvLwSvIUfC8r/oa2G9iue4LM
         3oDqlxy8ixl2rpabpUzi9L3Iw5tNN4EmG8hYkLJt8H1wGA7TvKcpsp9OZxq6g1anlcLV
         4Vrbh1rJEpAi/SGFsZqyRNt87/IAt/3j8ODaqCEnURDSxJq+w2qM0p7CSfCqF3IRhpeI
         fmXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637555; x=1795242355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2G/wlgst0b3QmNrVuRQ50SldBGJC/pdF4BObZ2EI5Ls=;
        b=WeTQzNBmJ62HsFpa3N1bjV7CV0kUmNJgVwRT1cp0Au89HPQk3F9D29CKApH2OQLMd1
         wEiINCX0NgNN3ljsnYx2e8cyFC+fvT+2CxfzMxjvzJYjzT5mFHPVMcxdwO1CtajBoNln
         2iPNL5YIjg+ONl1sZ8XE8II81et4xyuWoip/U2hW5By9oFYoLBgZU0LIV1tfxe5bLsDY
         LYaUZZ/IKHth8C2k9fijAcGnX5SoByZ8OQAqmaXhTQXnfFChOVcgwJZmEf831cRSXr4w
         Jmn7Az+aOoQLP2VgjTvBGP07CUCBtrpGLtkzvuavYl3FYyRt9djpeZrWHBtbH6S/yvjp
         dVFA==
X-Forwarded-Encrypted: i=1; AL+hErGjpZ1M9FkXHHI9K/mwhiAKxz3FUrp5wEX6sgawCY5er0VgWhIl7SDMiCNRkB80ZD/pNmzzrBtU+ZWXA0Kl@vger.kernel.org
X-Gm-Message-State: APuU4Z81YWphGmoqFrks90dsHlgR2j3WuY2hr5ljb+hIimI1QCM9hdjq
	0inL0YMDrJHX70LQSGx91ffvaZ5xn5NybxfxFZkColPAzc9eRNmcRqHt
X-Gm-Gg: AYBFou1wsgsW0GJAVSihWw82htvrCBiXpJvfQfv5RPST8NxQvFwo9sIF7fZkAjcNg4n
	SQeCzCxjGbAcs+pLnSc6ilX20QfaTk8IEusf7ybGK693bBoHR0EdbBXIpZYOXfW+E2EqGYhVLJ/
	D2GAjqEXLsoITvgkdlq0wTdiD6QLE7Pdd4RoE/Jr/c59YXq8h2+kIdbdk7cZFm27/x5TuuX/GaG
	poydqip+2tW/Lnx5SZuOM5NA7hj3vRqeammGUK1tQs5v7AdhNIsnvlu8Whufdy6b7deQ0YVbUTs
	JcPvIjf47/flXSY7VLlBozM5Flh5M8wmxE55OvcPY+WVOXdTmXTJ2/VYfrGT1EFeF3p7V9cAcDy
	U6skhTiHN2qZVhAwPV9lW8ZaoWlxh86i8nUC3gZn/YvHBsU5z++2zjKpatG3Z/UTtpca7FPty9n
	dMuYC1lxUqRrqChVPbIKCEy1htoxQucEh1UN4TCFLQAdYYUAxg+KsZsux5kskahSHIG0xstA+KM
	t4EZpLas5g/SgsRtx6CRD1uyrAgqfNmk7VKWSv9kVmts5VzXORgek/ePQCFkDpiaaPK3kp6cJ6Z
	85B/IJcdWH9KaSDq6o73hJ1LY2JhKWPULQu6+8++zvWQTZ5+DWYcXOhlmon0kFOlzgvVuQYsGha
	qXVE=
X-Received: by 2002:a05:693c:881c:10b0:36d:5fbc:8c8d with SMTP id 5a478bee46e88-379655d503emr6618386eec.2.1794637555183;
        Fri, 13 Nov 2026 22:25:55 -0800 (PST)
Received: from DESKTOP-CJ1L666.localdomain ([211.198.99.62])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm13537585eec.13.2026.11.13.22.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:25:54 -0800 (PST)
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
Subject: [PATCH 2/2] drm/msm: Put the VM_BIND queue last in msm_vma_job_free()
Date: Sat, 14 Nov 2026 15:25:41 +0900
Message-ID: <20261114062541.2001-2-arpe1618@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114062541.2001-1-arpe1618@gmail.com>
References: <20261114062541.2001-1-arpe1618@gmail.com>
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

msm_vma_job_free() puts the job's submitqueue and then wakes up
vm->prealloc_throttle.wait. The job does not hold a reference to the
VM of its own: the VM is kept alive by the context, which the queue
holds a reference to. When the job holds the last reference to the
queue, as it can once the file has been closed, for example when a
cancelled job is freed, the put can drop the last reference to the VM,
and the wakeup then uses a VM that msm_gem_vm_free() has released.

Since commit 01c8d1f385f7 ("drm/msm: RCU-free the scheduler-containing
ring and VM objects"), msm_gem_vm_free() frees the VM with kfree_rcu(),
but msm_vma_job_free() is not in an RCU read-side critical section, so
a grace period can still end before the wakeup, e.g. if the task is
preempted in between. Before that commit, the VM was freed right away.

Put the queue only after the last use of the VM.

This was found with an AI coding assistant, which also drafted this
patch and its changelog. It has not been reproduced, and the change
has only been compile-tested.

Fixes: b74fae5492d1 ("drm/msm: Add VM_BIND throttling")
Cc: stable@vger.kernel.org
Signed-off-by: Jiwoo Kim <arpe1618@gmail.com>
---
Independent of 1/2.

 drivers/gpu/drm/msm/msm_gem_vma.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 0cf518420656..b4b284ca5b38 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -775,7 +775,6 @@ msm_vma_job_free(struct drm_sched_job *_job)
 	job_foreach_bo (obj, job)
 		drm_gem_object_put(obj);
 
-	msm_submitqueue_put(job->queue);
 	dma_fence_put(job->fence);
 
 	/* In error paths, we could have unexecuted ops: */
@@ -788,6 +787,12 @@ msm_vma_job_free(struct drm_sched_job *_job)
 
 	wake_up(&vm->prealloc_throttle.wait);
 
+	/*
+	 * The queue may hold the last reference to the context, and so to the
+	 * VM, so put it only once we are done with the VM.
+	 */
+	msm_submitqueue_put(job->queue);
+
 	kfree(job);
 }
 
-- 
2.43.0

