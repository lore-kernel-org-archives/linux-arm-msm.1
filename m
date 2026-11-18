Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794967674;
	b=AN7Ux1DZYdKogj5DlpUVvZqZBxrh5O67ogj5ibraLKk8bF+tyMxPVS+iFfLHAXPHjPJX
	 9ZYqln2+GdFK2kdP1i/D03PS9qFbpUxDkQtnA6xchkdhSPf9JLzHBYZ4kOau9NSCtIxHx
	 9AUuq//VMsfBiEw3PmKni28KrKnm0BXHT7RwGoDZmNi/9M/9aLidqhDC93i1yT5a7wbKu
	 MX9BLk3xbPF3tMfTPJ2yaA+uNOk9iLn5MJUJT37H/wvHzIuJ2+CTb2bE9hbIx9Ajd5hGp
	 TjlxpSJ36KFd6gO6rhw46LyBdhRFy0M38lpRlh+U41Yv0VZHVm7NT6e9mBsIkasectQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794967674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ecuacG42mOJlCKP+Xm2vtenahXDM0oGaAEC/qmvo8Ow=;
	b=3O+c72j3x3PEnd923FZ4geQh9hexE2ALH9LA+mvOUBpygXm52tOVjZiZ6s28rtyQKCF6
	 wiIXcTnUXoxRyqMqqb6f72G+gcdKGrm0bgN7nYddAk1Yjel7S2BKgHS4/B8NVl6LW0UQ/
	 LFMUXoO++CR3KXGh3RElMxeZJPV7rSZQRNokwLDq2e3kYBm0H23tI99UPvdYukS+bvNP8
	 6keoPSpcVIC+o6DZ02wILws7mk11AHHiqsZ1LdZbS0AAESDDhYpndb3P+i/r8IWpgVz83
	 o8dgrq+iBPuokjvUHRfIKPNK/FY2KclnMfzVCvmjBs8OAjgj4UHdtMVpxCbyXS/IsZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o7ik5JLV;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD54606A332
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 02:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFD54606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o7ik5JLV
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-378915168c7so4761eec.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 18:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794967673; x=1795572473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ecuacG42mOJlCKP+Xm2vtenahXDM0oGaAEC/qmvo8Ow=;
        b=o7ik5JLVSbK5jaXU70vsqzLCjPaJRtT6RTbnLyn6TrHFa4gaSUzlLeTqy8sKLwm4KM
         Qj75NgS3SRsg9NHJdBOh2cUupSjEROItqNNOL4vcS2x+StuV2WI0wF8qXiQ5jCLcItkk
         FCg5kl+jlHBaYVC3WyXCorciDqOqcB1ZvNdsm4vMj6kxQ8r2taVyZRWNBoaE3aqN99Ti
         UvK/xRe0mnf0E54iK+YJaEOd3K7SZ2/GQcGsbmurPUC2NgzEu1lD/0sIo2mwReqPXzw2
         /hsj29APHi+OYo0LLFFbOdf7DbgbelGmSnI60F48W7epQS2RBVuW+QoT60CcmiiJ5vjS
         4dfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794967673; x=1795572473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ecuacG42mOJlCKP+Xm2vtenahXDM0oGaAEC/qmvo8Ow=;
        b=GDM5vEEPBNLgEJvF3D4MTL1M0Pu5y9ykDrLvSSEx9h6mqXh9uazAC0me4PB//NNl16
         H2Njo+vBP6P6Pl7sjAW3DWB/lQZKgU2EJjuCeQGu2fio4g/gI7I8oJePjlbS93NVIqcI
         k1BHjDOukp4sL1QcVQnY9+B+qWj22q+xMlMYphXkG4c+IvrTd7zW0LnGCf0h0Q2xJ9MO
         GuyVtaBHf0euYKniVPuguXXA4dICq89Tr/aKD3nI63rziYGIamyP254ZuVQdjEMu4eRD
         5MZ58+oRSageQ8ZC2FgRJi/fn5jHY9eOln1NI6G7XyMpP0qBr8oSUVr4Vla5AY/I/29t
         kzMA==
X-Forwarded-Encrypted: i=1; AL+hErEh8dMqZvqbVlH5z6Zuq5L9HC6KfG8Wdrzjnlghj++0segVwKdtkHJ/sSCoALs3s8pOV+4A4JYnsMQeZPhI@vger.kernel.org
X-Gm-Message-State: APuU4Z/m7oe80xStXdMACY0nu/JkVRG1IRDRypUpPdmFroFC/Hm5SqTg
	FxZnfD0cjWga7C1SaEfJEUYNv2Aq25VATQ3OTSIdXJ2GsFmSKyrA3t/D
X-Gm-Gg: AYBFou2nzy5MYnqUAPAvSrLiW66l2khmfw4XkjIVNqqB60qwkyzTAL80hamSh1uMHXH
	QSR+0HZNuRk/lWKYEQjEFNwbR+xKND6Aw/cc2SQ+l3bMQlGrbxXG8GAe9JjONiqmZ2z+q/iIVu8
	CZsdMIW8rHW/uZTkFQe1X/fL+z2DAiczldTg8/cQ27B7X/JN2ldeOJvbAPyxTF4bgj9GOj4V7iI
	OTW+Tr/Nqf5MVP0YGi2F042MpRn/6X3CXYi2SOwQlZwRvI50H/lfiUtLILMVTlZquB1mAJHuj4H
	tEbEy9FyD0hBW8pzEmnnA7QQGznk7Kd+ArJD8aNujfiIeJCymiUxVLbebiB6B2wU496ZX7yJRg8
	4PC1mHKDzG3uNPRqAfTNdCC/OjveXG9rpL5MLjr1kdcrdo7vnTgwfwinzioVH1FtmcR/+Ke6OJm
	wzrKkkhYbvIjX3DFdu2THhE9j9MDB19DFE4Haa+85eLE6B60nCwj/IeSM3tE/gQsIfK4FJVUBGJ
	sLqeydah921RxX1boPmFeoKYCYKv11WuSlHJlnjOY6fWKF6/Hjqj4POH2l6SpNluV2Lr3tqOjpA
	d/ZiBK3H+peEdShcrwjonDZrtlhtQmPFcRTWxGANyZ5zZRWPKRHnL0kLLdnaMoBmjyo30i/dEap
	OUgnOZl6cN9Eta14y4rKGDu3FUQO8
X-Received: by 2002:a05:7022:e801:b0:146:ffa9:2117 with SMTP id a92af1059eb24-1b543b829c9mr1993620c88.1.1794967672916;
        Tue, 17 Nov 2026 18:07:52 -0800 (PST)
Received: from DESKTOP-CJ1L666.dankook.ac.kr ([220.149.255.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b544784008sm2862327c88.5.2026.11.17.18.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:07:52 -0800 (PST)
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
Subject: [PATCH v4 5/5] drm/msm: Put the VM_BIND queue last when freeing a VM_BIND job
Date: Wed, 18 Nov 2026 11:07:16 +0900
Message-ID: <20261118020716.1698-6-arpe1618@gmail.com>
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
index c526409f451d..3e9657982291 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -904,7 +904,6 @@ vm_bind_job_free(struct msm_vm_bind_job *job)
 	job_foreach_bo (obj, job)
 		drm_gem_object_put(obj);
 
-	msm_submitqueue_put(job->queue);
 	dma_fence_put(job->fence);
 
 	/* In error paths, we could have unexecuted ops: */
@@ -921,6 +920,12 @@ vm_bind_job_free(struct msm_vm_bind_job *job)
 
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

