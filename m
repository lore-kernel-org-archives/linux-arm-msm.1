Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794967652;
	b=I2FL9YP5Ue06mjg2w+2xMbxfQHtHh8uzDhF+JRh4DaK5QZskYEQckHbCP/sgGG0Y81wT
	 YfiyyTuDismvTy6lPgGBj29in6hlKZSTWaEzWjTwUzMc+os7k02/FN8Ol+s4PHAC4nRMh
	 H2ehscwhG34/8+M3VQnCafHou2pe2l8ekXSNuAR/B47u2MqYeYDt6pyo1TWpn93uzab8E
	 xq7zvpdFclNvVyeuojhOoFYT5xycU0f/3XM4AYLfC3bOPudI7dZvgGZJ72ogArH7gF2jn
	 0GFjx/WWbPJCwh9hBfy2zdwAQgKcObN2QBRm2wGGgtQf86pG7rC5O5lIftddU5NekFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794967652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4XYNeMt6VNMRAiLe5EbRBvBhMDIpn29m4tUHZ+DRyz0=;
	b=v/7/2VE8x8WDa5N3RRsrIvkpMZfchR16TycWm/0zmtr2xuO+2l+CM+khLrEJ76hmiT0j
	 jmUoeKIPNfbWdIUA4B9CtAdwvrQVb6Y4bwRiuvl7i8+q+TFqshqiLdrK+HcW18Nifj8Hm
	 zePL2GP7e6Mrxjc/CqN6rDfu5sQmq8si3/Qyc0/yu8vXMZTB0bGTPXKSsxjU/D4E7gwgs
	 AUzBWBsWxIxYKRyXERJ4Je9AtqKjqyHzsbOVLxKTvheANS9VyYSV8lz/0Rt65IVtVpPC/
	 5iX9TolloaZ3wwVgjCv3JFSjXQcr0UVKisbG0d8I6Hxma7W+fRP2yQcGaImhYOEkvPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tfrItGmZ;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4C3606A32A
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 02:07:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E4C3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tfrItGmZ
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-382d85f4230so5814eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 18:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794967651; x=1795572451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4XYNeMt6VNMRAiLe5EbRBvBhMDIpn29m4tUHZ+DRyz0=;
        b=tfrItGmZyurqbc7AlNCYAocIN4DcMjwq1XHmG9CUCxqlUqqTzPbwPuqUy4p8jbdZxg
         Qg7eLGUPoU0Mq5TAfgxhb70/JJZrt1fUYhuMSEegIZiAoUrRgAZVmgT0Xha2WeAffogU
         oyFGGQL01j7wZBfLQR4eK2E8HlWpRIkZOkoObmeL6nNFFYSIEILCc3whXwdyEoofO2fw
         tH8iNwWoEJXL3T7vUmoJPIjf8dzzVb0nJrqKtuTYQ4ASpxpf3sCUADQB/sMlrTs1p7mx
         X7pVMUx1Iqs3sc0BFZLsZ6EaPauyyYz1Rt2l/EgRSmkYT44Q/Wl/1+xhCd3hHoyTlWB+
         d53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794967651; x=1795572451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4XYNeMt6VNMRAiLe5EbRBvBhMDIpn29m4tUHZ+DRyz0=;
        b=YXPW8xVN3oaYx/tgtTzl+p2bHf4rjUGWEDGVpwy70GiLoLcOGKId1GXIqy1+KwIMvY
         +YmxGlRsYtggaaDb2rECix4FJ5bIiisMhG/xwFs50vBDGjNHH17l95erjBIxt/OmspTG
         Uv11mmjDJpoqKODF0uwuVNDGdcCSGRGjRo9kJL0mo7bofeu9S+bN1qxkfGo4jKpw4WXf
         kXDzWfDbQudeK0k+ibS8BgW89xEyHDxkoVQlAyHS6qbsf4n8BXPsECK9CVIO8ikEirr+
         iWVnFWGjkZMLTuzlXo7RpAXJMkEUDM5Cj0xdBgdQ9FuEcmz9lDzhSaLqpW2NsDr2K8mT
         DMNQ==
X-Forwarded-Encrypted: i=1; AL+hErEYo4Qvc7YYVaEYMfx4ywkzw3S4wrHJbzZrBD0Wra/R03gcI6apR5Wbw4CQPwr1b/mC0LXex7ae48DwTtxo@vger.kernel.org
X-Gm-Message-State: APuU4Z/MUttPF2rbavdMHhmJFRn/stjWtaLbFCr80ko6nLGmC2G7Tppb
	ptmvqgSZojKbiASw43lVpxN15FOrnU/Mlc4zqvp3XvS7o/9ugptRCfjJ
X-Gm-Gg: AYBFou08P2WRzLlF0tQyhFqZMSXGzOvOBfNG7GyAGFUAcoGS4eg7iuKUUVk9m8zyRBj
	YKSu68LzseE7ofVQP2oxTIkULsRR25vkrYuSPsc3daZsWcFblHksWSS4PQ29BfXCjX0TKT5di8S
	+1o96DEViWO7+hfUPLzkKcvQ1YNSqTtY9ZN540hO+IMbaAUeh2dBu3tkolO8xA++E/pP2DiBuqJ
	Qik+gDGHhlSbyI/x5ZOg/xMg4WtNHeXco6SBAurtlvGu4ef8gn/yePjcNpxVRvNlndwpszb0CXL
	6Nr/QkWaZ/zgQqZoRc2PcWafCC/kLLSpCK173p5I6H9njgghkHInhf8CFpBSMFGmj7puYWkBcsw
	d9XC3SXqy5fPhUPcnmgRxId+C1LmvDAdEUYJpg57Jb+Kt4jbdGvLw7j9dpx/+K0+034RlIAcGyH
	V7wBCh5vxYLF5S8j2l7LK8EUSMxG5GQZTE08Po6Ij58K3qDJaA3VZgTNY8M8NrasNgN6VetTQXS
	lrsNK5M1NC9c23dwwzov/iqoDIwnBnVpCU8ZFIKHq4Qaemsl2LD0phRqKcnuoIKUk6Jxn8qMJta
	JET7zCOCGiOpx751W1Hmp9SN2/Ybg+4uyMt6PXWDxM+wl099CFOcr4pGP2rAjFH45GKm04UmnMd
	7H/Uyf20=
X-Received: by 2002:a05:7022:698b:b0:1b2:5884:a039 with SMTP id a92af1059eb24-1b543a1715bmr2662340c88.0.1794967651150;
        Tue, 17 Nov 2026 18:07:31 -0800 (PST)
Received: from DESKTOP-CJ1L666.dankook.ac.kr ([220.149.255.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b544784008sm2862327c88.5.2026.11.17.18.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:07:30 -0800 (PST)
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
Subject: [PATCH v4 1/5] drm/msm: Wait for VM_BIND jobs in msm_gem_vm_close()
Date: Wed, 18 Nov 2026 11:07:12 +0900
Message-ID: <20261118020716.1698-2-arpe1618@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118020716.1698-1-arpe1618@gmail.com>
References: <20261118020716.1698-1-arpe1618@gmail.com>
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

msm_gem_vm_close() waits for vm->last_fence before it tears down the
VM's scheduler and its remaining mappings, but only submits add their
fences to it. msm_submitqueue_close() flushes the VM_BIND entities
first, but drm_sched_entity_flush() gives up after
MAX_WAIT_SCHED_ENTITY_Q_EMPTY when the process is exiting, or on a
fatal signal, and a queue that was closed earlier with
DRM_IOCTL_MSM_SUBMITQUEUE_CLOSE is not flushed at all. A VM_BIND job
that is then still waiting for its dependencies is not waited for, so
its pgtable updates can still be pending, and the job still queued on
its entity, when the scheduler is torn down.

Add the fences of VM_BIND jobs to vm->last_fence as well, as
submit_attach_object_fences() does for submits, but keep the previous
fence if dma_fence_unwrap_merge() fails. As for submits,
msm_gem_vm_close() waits for these fences without a timeout and
uninterruptibly, so closing the file now also waits for the
dependencies of the queued VM_BIND jobs.

This does not cover a job that is killed, e.g. on SIGKILL while the
process exits: the scheduler signals the fence of such a job before it
frees the job, and the free can drop the last reference to the queue.
That is fixed by "drm/msm: Destroy the VM_BIND entity when its queue is
closed".

This was found with an AI coding assistant, which also drafted this
patch and its changelog. It has not been reproduced, and the change
has only been compile-tested.

Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
Cc: stable@vger.kernel.org
Suggested-by: Rob Clark <robin.clark@oss.qualcomm.com>
Link: https://lore.kernel.org/r/CACSVV00ZppfBKwsHJ+NBYBB7a2f3g1O=6J4Gt1m_A74fudZQoQ@mail.gmail.com
Signed-off-by: Jiwoo Kim <arpe1618@gmail.com>
---
As for submits, a VM_BIND job whose in-fence does not signal now keeps
msm_gem_vm_close() waiting, uninterruptibly.

submit_attach_object_fences() drops vm->last_fence when
dma_fence_unwrap_merge() fails. This patch keeps the previous fence for
VM_BIND jobs instead, and leaves the submit path as it is.

 drivers/gpu/drm/msm/msm_gem_vma.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 8b702422030a..2f0698df1a9a 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -6,6 +6,7 @@
 
 #include "drm/drm_file.h"
 #include "drm/msm_drm.h"
+#include "linux/dma-fence-unwrap.h"
 #include "linux/file.h"
 #include "linux/sync_file.h"
 
@@ -1443,7 +1444,7 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
 	struct msm_syncobj_post_dep *post_deps = NULL;
 	struct drm_syncobj **syncobjs_to_reset = NULL;
 	struct sync_file *sync_file = NULL;
-	struct dma_fence *fence;
+	struct dma_fence *fence, *last_fence;
 	int out_fence_fd = -1;
 	int ret, nr_bos = 0;
 	unsigned i;
@@ -1586,6 +1587,17 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
 	msm_syncobj_reset(syncobjs_to_reset, args->nr_in_syncobjs);
 	msm_syncobj_process_post_deps(post_deps, args->nr_out_syncobjs, fence);
 
+	/*
+	 * Let msm_gem_vm_close() wait for the job, as it does for submits.
+	 * The VM's resv, which protects last_fence, is still locked here.
+	 * If the merge fails, keep waiting for the previous fence at least.
+	 */
+	last_fence = dma_fence_unwrap_merge(fence, to_msm_vm(vm)->last_fence);
+	if (last_fence) {
+		dma_fence_put(to_msm_vm(vm)->last_fence);
+		to_msm_vm(vm)->last_fence = last_fence;
+	}
+
 	dma_fence_put(fence);
 
 out:
-- 
2.43.0

