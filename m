Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794644367;
	b=zQaiPWgMasSxe6FtzCuh96fHNJd9sYlWiiX+14tEeWXgWHRT+SAOkeoeF35KAW+VQl2Z
	 /xm8GZeCK+W4QR8RHWIkO4gxrqfVke9PCckT3BeJPn4iwDyL3KQd4eNXK/SVebD0RU01l
	 uw0lG8PuQyecJuIsmhnP3l2YrpRs1p0rQUVzH8SfdCfOQXBVZPGL5ZPLuEvcA0Aawt6u0
	 QkkJ1biIa+PjBLcNtg0n6Vl8ernCPDxS6IWibDKYXcsf7BTEncga4aOpKEX7SxwdFpvaG
	 /7l9dnq3DL80usB+lDoiin0tr69gaM5eZoxEkqytBMTrdhUjthor32b22tUXduj0dpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794644367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C58R8Pgzd1hKqtVMoaWOgYvgQVTOllRn5nwLnk9mw7k=;
	b=29/SNbGEyXQZXde5OKx7D7y3CYC99c66UrQBTv2R+36b0n2GkxCD2y2PhJWd34PrJ1IO
	 Krc6Fa67XY29VzH53ddIvHsrXBjthRs0o6Kkbrzi+2fXlmD9U+LVW/bZA2qS2mvx9Y0Qx
	 bidO5quWiW3DuXjJcVS6iFoFPYbFDJpjv5ybpMF1Y3FW/60t+64NL0JUJYTE5OKoXWZ2d
	 O8ypw3tenmCaGWJ7gNayBsSvbsjX3mqmYXQT0I5mj+mmUKBAHII4Sul34cGtyFWIIIvGS
	 QCUI/Txw7cAPR++ViOx2cO5QhGkeasGwjs1FJ2aOGS3aQJNuODlAqqhMaWWBWjybBPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EXb5T5gB;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3617606A33D
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 08:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3617606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EXb5T5gB
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-370f4e5cfc9so218706eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 00:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794644366; x=1795249166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C58R8Pgzd1hKqtVMoaWOgYvgQVTOllRn5nwLnk9mw7k=;
        b=EXb5T5gB5jjsfWt7HDzjvl+XqaWGVUS/bSslZmlUqzZyaggFpVpgJscso1Oqqn79Ps
         bwz+OV1KpZiN6nFUhZsB9fe0drNScYB3Ct5lR1azIJsovPl/tLFRo7eSJUw0k1D+dPeK
         FnhwIkm0vN6qd4U2BFLu8W0siU4GWLKsix7UIlUYf+J5GXKxhS5XfHXMjB+ETofnBIaX
         0mdxDtqq5peMFIDeMqNKhOBgItgcX9aTXyOhieIkIK1IPWrUY0ySje0h2R+meEJIWWlq
         pmwrtsBLanmQ3S1qFyARuhDlFcvWq9REY5mvfwWBQPt4YOkSqVh1s2dp8MZekKjezYg5
         RjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794644366; x=1795249166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C58R8Pgzd1hKqtVMoaWOgYvgQVTOllRn5nwLnk9mw7k=;
        b=lpYegYnxkDoj/FRji5+G5lT2Q4crqnQilUGf2LRSEeIaMLqLWINEWH6sIJpTTDWm5a
         u8ax7h5nNC5Zplmi3ID0ZFJdI57wQkCRAHFT+wN+ctEH5iw3sdOIt4ywjnnQMVCzVF6x
         CPUiQfWVAs0geNzsIPutDt60Dvlb7JKhWaA3GYdYlzotgvQA7PSpH/IRVKo+rAHYac/6
         8ENMBI9evu0BRXDEzOIa2GsoqyDaxJqgyyrIXwB0aTz5bchOQH2X7lC6eTdwnJEXG3ML
         BRjv8XAeuLx9qrBKmZoI34vUZ+4XfaHty73yxxCnzdM5uTk5FNe/bQxObU7Je/+w1D4U
         h/vg==
X-Forwarded-Encrypted: i=1; AL+hErGGLA78keJ/mFSPRYxcPyRmKV4USLMxtSaLStITy2a9mES8Au90g6SYtVyXPUC4rPSq4fKk7p8F2LZ9dqDT@vger.kernel.org
X-Gm-Message-State: APuU4Z9Z3UYT08eSMTnkQ1cLHpOo/LABosSeyJ3mwzHkdntEu1TPNsXX
	OgMZprhHLdA331nLmpQb08uU02yJVDSvmNpaOQfz4yi2A1v00vwtMZh0
X-Gm-Gg: AYBFou0LTfZJu2+izP+oKHWdhjopbuwg6oAZSNT/p2pa+rNwtwt3p1LhlZK8ONbD3iZ
	VEG2S39gKF49nyzwubn67PDujoVJ9P6/Kz4JQWDHLTxCIRW66VUk8vUUOZzpCaTCP9huJyjdsSp
	2T2j+H887Fa1m0NetXGJuBQ5BdLt8EyXfbqywkIfzYbrKCQI2rU5gZwzwnnd2C9xlQ58K2kTLUy
	OvdN8xwjc/jYILgvklF0fT3tRo5E0h+cPYvjsgo+QWLIxuOA4oKehSe51KjIWps2lg0CmuXmjDu
	HiY2QHUYx6/GTklZbPvBAihKwWsWkpOjKYUYbJp7H3Z+cba6V6OCRyti06OGgoPKBQa1Y4kS/yh
	Yoi7bjWcjIPV0XBp7TJLQ4taqRg5qZGTvxjSdW6JUGB3SyE/miBgsmK6QnyB5a9QAa38bxQFIhw
	wPMpeKvBQJ0DA0hUdQI9pIgVM/e6xVeQPQdcPn1hiKXqvKmYc/HoqsLxuDUzIz3dA1vvhv/lFW3
	YINu3M4XRvN3KaRRCChMEmWV4QlWaBNelGYfokrNd9oMPzyFvJN1efU7hjXygG9m4V9Ltj8hQwN
	U10zhD/7fuizjJsgKmQGIcAVISO/xvH+qQTbDWwtayaYo7BlM/U05+Czfxv9PXnOO77lA24UEx8
	QJ7OhZ1eNBkze03rZfVp6EuAY
X-Received: by 2002:a05:693c:881a:20b0:36e:66d8:1424 with SMTP id 5a478bee46e88-3796047ff23mr7029007eec.0.1794644366120;
        Sat, 14 Nov 2026 00:19:26 -0800 (PST)
Received: from DESKTOP-CJ1L666.localdomain ([211.198.99.62])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm14008333eec.3.2026.11.14.00.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:19:25 -0800 (PST)
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
Subject: [PATCH v2 3/3] drm/msm: Put the VM_BIND queue last in msm_vma_job_free()
Date: Sat, 14 Nov 2026 17:19:02 +0900
Message-ID: <20261114081902.1669-4-arpe1618@gmail.com>
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
 drivers/gpu/drm/msm/msm_gem_vma.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index b1fa1d749c2f..1bffade78623 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -816,11 +816,16 @@ msm_vma_job_free(struct drm_sched_job *_job)
 	job_foreach_bo (obj, job)
 		drm_gem_object_put(obj);
 
-	msm_submitqueue_put(job->queue);
 	dma_fence_put(job->fence);
 
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

