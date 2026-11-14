Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794665957;
	b=dmqXVQpjyTK/Whqybx0E2Ek0kOK1VPmo55N7CWUWxERGrKuPPwBolBopgKqyZRzDYHyE
	 LRrMusGM95lxDPNT+dyMwacfHZv3TZPk8IGps+5+N/9SeJWn2VFbF+eC6O4GlXg4oh77r
	 EW4usLANtLf6Y5RlKuMDWjoCk9IDW7+YeBkcZSJQKNVTOjVKPTmXBUDTrRf1D2U2NZoEP
	 Nm0H/k0u9hM0hSNJen82kSTEo3KmLxVuQsm6/kJY+an5M5vREJVoVBbe3Zh9q3IxMGZJl
	 wRV0gmwsQ+M8OGU/AerDVh6iejk2oyYfxBMVjQIwEzWxH7OvnCi4Bhn4U/qp5MOpnWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794665957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QjbH7+OnTujQtkedXacpeWPzVbsofxl7bIa9QcXu1+I=;
	b=L4Je9k64foeIvk2oE/qr0l18U0fzuz/Yt3I2YfPuY+cA4AsYP/gONR/h8TYhw5HgjYVX
	 fo5MygAB0vIqRgpaVRCo9FVhrtAo2GyEfo6FP/bhgwDF1qEf0vUiTVmEWRbfT4HOkc2oV
	 hVYtt0IHIytwsrF4cPhYoS698d39kFDGb2+OGfrl56t9r97Hacoh6Pz68L6ch14bQktbX
	 8ozMfwobigUz8Mft6dHiUvfoGg487IbaEfdanH/4f+EnH9qBRZHXoim9fmtLO3PQ3Tg4P
	 6i4Pc9loqpUg36SM8x5lQiYLx/NNnkQCFVmrFOR2k06v0PriEhqQwSC6o8IfbIcZgMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JGaonD2E;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1C2606A33D
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 14:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F1C2606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JGaonD2E
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1397a4855beso61157c88.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 06:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794665956; x=1795270756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QjbH7+OnTujQtkedXacpeWPzVbsofxl7bIa9QcXu1+I=;
        b=JGaonD2EVegvZ7RR/LnBg7cajt/DQt3tdYO0cSZhVgHTcYXCYg1RTKKhS9J8P0VIaF
         U+3mUILGSgAnXIz78m35cLzKZ9Tg4LxxGfLyUGdxPfRiWEsC+9I3wvM3PKCJwMJD2qbR
         3FNtjGAvupblQLi4qpyTN5HzEmruo4LJrYiaAPIq37cdrXaooQXpoi1MLeoYip5yH+BO
         1Ok87M7m2t1WJJf7lgha94zYcuRG4CjImCEnCuYPKlo0Q2msrKkn57h7hj2eFAbtY8P0
         v/fgsL0r/6h/A9rTFIRKY8tNg2f98hFF7fpZvIQkdgU7RhtxdXckcCAqnr1UhGeAqVjv
         ITfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794665956; x=1795270756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QjbH7+OnTujQtkedXacpeWPzVbsofxl7bIa9QcXu1+I=;
        b=wN8EJ3uI0hQqR6/FbRv4xP9suOJZfxTQ04Z/HUT4sd0ODw/13y4Xo7zLFCr+8ZqEuW
         velFoOccSqcktlSsnLebuEzU5f72gECUij/VzpaPn8aHda5hMW+oZBKNRmZZhLBVeJx1
         4sbYoyyIbOBrsCXSoGJQARHQRhX4ez8YhmOceu3XvBxdBVjs+nZD7wBu0GNOI0mHGIGs
         W3lqoYlUlSoaJ7Dl6Vq9L+yM8w1K5bMpBeDW/cR3lPGSZaxNwNRn2KrvT1HiZxl3TFYk
         k325aSEEWm5Lm+N5i4+IapoxseIhF9yq1j37WsC52iOan3kMrIc1yeIj5mq0qq9IBTlS
         CUCA==
X-Forwarded-Encrypted: i=1; AL+hErG3HtZbQTOyyjfX3pTKMJZuVv4ytJSbDMVW8fRBPxqsLAtFWqGeCoqWfw2vijGe84f19Hcgn/DrExts/gsA@vger.kernel.org
X-Gm-Message-State: APuU4Z9xtQtVX9COsRpcfX4XmqoJMZa6faFdo80GzA9s1FP4irS3O7Fb
	dICHfIP2bOnj6ORmwwWCX/wDXyIbwka0qfd8lEN+cylaV87OhH+ghJGX
X-Gm-Gg: AYBFou1bplZQggkgr/QN2mG5s5OKrS8J7vhpAo4IxGpioMLfRWwXcf1VJ2a7wzILhP0
	CirI1MLAGjH3S28NU2HFGDia8wIHJgQZRc6g9ChcUTXV3DYtl15E6HjJ+ho3eamyn5vbN9T/RnZ
	M18n70zr0er2kTOsS21IpTR+ksPMuWZECHoHxcpvEHYBvevtjQoV/AhAn8InzoCbPzv2mBt06Iz
	yYpWMmpB6lMPtneNMGWZEnJAK7gtTMtqMrNALJ7HVSkW43qEcnkw3g2pd84V5JmP9OsiB6bcyMX
	WI7CjqwjhlS/9i7yaS6g6ju1iYK92JpvalVEdp71+5hF0zboe8MdqJyFFUfADL29pwBEYjbRGb/
	MwWse7kvqOTItqOfluhuaZM/5g6XpFtFMc16RmyWo4vGo624RwfHDsyEJja6gIUw8sHYacK7/UC
	m8OTfO1omiNBt07u6m63AFrNdwciW6mnSgKSZRDasPpSZRICgldtb0V9zl7GvuvWVwCReukaWVK
	Cyf0npIzbQN660vWmqjBD61uX/4pt4ugvtPcH241d//UUjfYRNDDHcsSbpTFkS6oUEOE4x2PVt+
	9eJ2m5MkoosnFTG1FT1kW7AxC7d+bxm3QjS4257KUqQTEFwIkK4/5hUH9ovxTtDiTP1xGeb41Ii
	w+YE=
X-Received: by 2002:a05:701b:4508:20b0:147:d430:7322 with SMTP id a92af1059eb24-1b5030d2df3mr8446285c88.1.1794665956061;
        Sat, 14 Nov 2026 06:19:16 -0800 (PST)
Received: from DESKTOP-CJ1L666.localdomain ([211.198.99.62])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b2519sm14745032c88.13.2026.11.14.06.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:19:15 -0800 (PST)
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
Subject: [PATCH v3 3/3] drm/msm: Put the VM_BIND queue last when freeing a VM_BIND job
Date: Sat, 14 Nov 2026 23:18:51 +0900
Message-ID: <20261114141851.134290-4-arpe1618@gmail.com>
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

vm_bind_job_free() puts the job's submitqueue and then wakes up
vm->prealloc_throttle.wait. The job does not hold a reference to the
VM of its own: the VM is kept alive by the context, which the queue
holds a reference to. When the job holds the last reference to the
queue, as it can once the file has been closed, for example when a
killed job is freed, the put can drop the last reference to the VM,
and the wakeup then uses a VM that msm_gem_vm_free() has released.

Since commit 01c8d1f385f7 ("drm/msm: RCU-free the scheduler-containing
ring and VM objects"), msm_gem_vm_free() frees the VM with kfree_rcu(),
but vm_bind_job_free() is not in an RCU read-side critical section, so
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
index ce9d97582df5..07f427c4afad 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -810,7 +810,6 @@ vm_bind_job_free(struct msm_vm_bind_job *job)
 	job_foreach_bo (obj, job)
 		drm_gem_object_put(obj);
 
-	msm_submitqueue_put(job->queue);
 	dma_fence_put(job->fence);
 
 	/* In error paths, we could have unexecuted ops: */
@@ -823,6 +822,12 @@ vm_bind_job_free(struct msm_vm_bind_job *job)
 
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

