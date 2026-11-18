Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794967648;
	b=gcqjEFE1Z/D7KQyxg5k3KWMrf7G82qBOp7qgH+hSg7Fi7V12B7E4xiWO2gkMx+STWz3n
	 XEoW+NYDnWLHNMp85aC0N5IiwNa3qj3ic3Azlxp5S76tMPLyUqwvGCnWG0Zag2v313IGm
	 hE9xbqcBRsCSl2NX+a+GVhnNXZaBtE2P8nkaQd8c4tsBP1ejUFuQyWRIEzw3FtZScDbGd
	 SzBoGnOUlZkcWuopKSF5kYWiOZrBY9nXJzbqd6Q/q5zUnKtClzgDQ5Q9H2fVx9T/c2KQd
	 ERSbxyqIhnBDTIncmNjGHz4bx50KTJ9hHb39R2cmyBNG8VJuPqNXJMu0/F4L/czX5Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794967648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=i45bHZiP3wEgcVETQzoa65BO2wkAbHlegiGhDqMSTjc=;
	b=FPLoGFQGESPV9LM7nRWFHRzhAF6fFhM+RLxxtB5vKKbeGi9Ljxhjzj4DLNWGwb7fy3CN
	 i4eaScaqSHGuozEFWxoFifOp+T0EYxtvmwLXd5EzucJvUlTjrtkQcKvac5qdIkpD6xSnD
	 M21lLowvvxKhQwjZDX567+GJEF9wJQv/jB4VQdCqkvOkRRIXZ2++Sajd3qH23rs59gbQ3
	 hRd1AJqEErHbcAL89CeF1EdBNRTn5TitmUbiTNlw2fxYh8U3NdjM/MAd4ufDvm7p0fp9r
	 BXqOKFgdkyIc9DWxZBBZRdeh5kjigglX6J+uc0ow7QQTiUQRN8YSItYzgE/LSq39IcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cWzcJU8f;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224DF606A325
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 02:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 224DF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cWzcJU8f
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-380c17707ddso87751eec.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 18:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794967646; x=1795572446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i45bHZiP3wEgcVETQzoa65BO2wkAbHlegiGhDqMSTjc=;
        b=cWzcJU8f71qRXuXGab0DEdPLcwJztkCG7kZJaC6cbL19em4r3br54w30smE8pVof0X
         g/ciOffOuD17gLF1EJYrASn96dvF009LMvgC9J4zeHhlsc7KTbvF/TU5xIkhuHZbRjYq
         U85FO6tj31Q7nVIjpT11nnknwycWNw3VxmPtJSj4ZANiu9OPeZceii6W82s6z/XmO7Px
         4Qn2vRYFJd0uIJ+cCWYjTmvnPhb0yMlNEUhF7m8m41GJ0mUL8xTbqgqcaVA86NfzyzXn
         QpzEljDLoxt/E5UfIthfAXICGkZNQpHIhSCjxbhkl3VkxijZKBH3pdc12qGfX4+xGdiZ
         vNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794967646; x=1795572446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i45bHZiP3wEgcVETQzoa65BO2wkAbHlegiGhDqMSTjc=;
        b=udSdPN0Ku7f1FgxpP/IA8aRhJV18XOGT0bjol9pQjZLEnaJBJiv6vK6+YQQRIeuwrX
         qWCStwJ9/azOHW3cJQnq5ukdBOerWgSEBvZrlR2HuBB1WcbO629YN0JFvMnVFcff4BBt
         9EbdwT+ECQp2cNQL/6rZTLjyKCxX3Ld2pEJk+MNrenah3K75pOn8sM+xEJcIKkkrfoz8
         s4p6kJF+JHlgNh4RvgeUDcw4jnrL77m1faP+Y5oDBllLBSS+dN1JxP6hsv2dfz8bczau
         hgMVM7KYn0DEKOHlZgJCAohsrHvLnbmkULfkKbZ7t7zK5875Tf4byYXki0VvczoiLZzy
         RI/g==
X-Forwarded-Encrypted: i=1; AL+hErG1tLJRyk3s0ShFu6dEqz56HPraTpJ3hyiL5vyxQ1ReccEFfDc6IwTf5KN7g2wPl7IgcGM6iI1mdYzN+txk@vger.kernel.org
X-Gm-Message-State: APuU4Z9Up7IXE3vF4ajqaZO5LrRKKho1IAvhiLlS71ppVg4COPhcoB+t
	8GR3ZfI/4teH1XHeDwq1e3Zj4Eeo7N1creTudjEchedWxVZme3jwE6Pz
X-Gm-Gg: AYBFou1kwdBVj+II9wUC9lttOBBX+mTAx5rvVVjv41BRzxDcIkyqIAgzCT2hawHluJ5
	s6fNpS7oiocEmeS9b3w2rGsvU8TGkKMnOhsZDcjkb1j6zzsYDZNYIj3xu3QXaCnr/PcxP3e48lN
	2E+sPhLlQZxN7C/b90d8zd8QO2ib66iuReiHAGjxAo9brmXrbtDapKiMn/neYaSKUJp3hFfSgk+
	lRLcJxTSP1lTuqAabpE85CGse+sdHASC5q5D+HFGIZkU95pgwPeNdFI+TXX6uxfOIjU6LX2Lz0b
	H49pQt2hV2dxeAL/oCIQcvTqQTcwB6LKCMf0+RH/Dn6GfpA1AByOPmYrwbqsIil2/8+Y88Y/IhH
	PX4WnweFqkmZlpR8Q8EaJfspPfRDyrE5CvrajDR2XtElKUZ07Gs80MIievA6ECF81VipmrPMW40
	NTXv6gMxeiVHtJjkfL4kfbnQ/ASudL5O/1WAK1l9vyWB+PDdajns5qEfykWlA/1Sq1iM3Fn4mi+
	nJIu23n1y2WtEF3EJuT6WJ2v75wDMf/eDEggVntjR/AtP1EI+KM5t6MeTS1UJKbRieEcb9cBd55
	M1WGdQOVLNVOEFll30Lg2jfXUy1N2ncUdoO5Hu2YOc8KEQFFdU5DrCqE7OEl0BNt2QtQ+f5R1oL
	cLP8PIyk=
X-Received: by 2002:a05:701a:cc8f:20b0:1b5:4596:8371 with SMTP id a92af1059eb24-1b54596847cmr617949c88.0.1794967645989;
        Tue, 17 Nov 2026 18:07:25 -0800 (PST)
Received: from DESKTOP-CJ1L666.dankook.ac.kr ([220.149.255.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b544784008sm2862327c88.5.2026.11.17.18.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:07:25 -0800 (PST)
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
Subject: [PATCH v4 0/5] drm/msm: Fix VM_BIND job, queue and entity lifetimes
Date: Wed, 18 Nov 2026 11:07:11 +0900
Message-ID: <20261118020716.1698-1-arpe1618@gmail.com>
X-Mailer: git-send-email 2.43.0
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

These fix what happens to VM_BIND jobs, queues and entities when the
file or a VM_BIND queue is closed while jobs are still pending, and
make the VM unusable when VM_BIND jobs of different queues apply an
unmap before the map that it undoes.

Patch 1 makes msm_gem_vm_close() wait for VM_BIND jobs, as it does for
submits. Patch 2 handles an unmap that finds part of its range not
mapped, or that comes before the map it undoes, like a failed map.
Patch 3 makes a VM_BIND job that the scheduler kills before it runs
apply its queued unmaps before it drops its references to the unmapped
objects, release its BO pins, and mark the VM unusable.
Patch 4 destroys the VM_BIND entity when its queue is closed, instead
of on the final put, which can come after the VM's scheduler has been
torn down. Patch 5 puts the queue last when a job is freed, as the
queue may hold the last reference to the VM.

Changes in v4:
- New patch 1, as Rob suggested: VM_BIND jobs add their fences to
  vm->last_fence, keeping the previous fence if the merge fails. Patch
  4 is still needed for killed jobs, which the scheduler frees only
  after it has signalled their fences.
- New patch 2, for the ordering problem across VM_BIND queues that
  Sashiko found in v3 patch 2, and that v3 patch 1 also made reachable
  through killed jobs. Unmap errors are now handled like map errors, as
  Rob suggested, and so is an unmap that comes before the map it undoes.
  A job that fails in the ioctl after updating the VMAs now marks the
  VM unusable as well.
- Patch 3 (v3 patch 1): uses the checks of patch 2, and describes the
  window that Sashiko pointed out in v3, where a job that waits for a
  killed job applies its updates before the killed job's unmaps.
- Patch 4 (v3 patch 2): changelog updated for patch 1, and a second
  Fixes tag, for the commit that added VM_BIND jobs.

Changes in v3:
- Patch 1: only apply the queued ops of a job that the scheduler frees
  after killing it, once its dependencies and the previous job of its
  entity are done. The error path of msm_ioctl_vm_bind() frees the job
  right away, so v2 could apply its unmaps too early and out of order
  (Sashiko). That path is left as it is in mainline, and the title now
  says which jobs the patch is about.
- Patch 3: rebased on patch 1, title adjusted.

Changes in v2:
- New patch 1, for an issue that Sashiko reported on v1 patch 1, which
  that patch makes easier to hit.
- Patch 2: changelog refers to patch 1.

Review of v2 by Rob:
https://lore.kernel.org/r/CACSVV00ZppfBKwsHJ+NBYBB7a2f3g1O=6J4Gt1m_A74fudZQoQ@mail.gmail.com

v3: https://lore.kernel.org/r/20261114141851.134290-1-arpe1618@gmail.com
v2: https://lore.kernel.org/r/20261114081902.1669-1-arpe1618@gmail.com
v1: https://lore.kernel.org/r/20261114062541.2001-1-arpe1618@gmail.com

Jiwoo Kim (5):
  drm/msm: Wait for VM_BIND jobs in msm_gem_vm_close()
  drm/msm: Mark the VM unusable on out-of-order VM_BIND unmaps
  drm/msm: Release the pins and ops of a killed VM_BIND job
  drm/msm: Destroy the VM_BIND entity when its queue is closed
  drm/msm: Put the VM_BIND queue last when freeing a VM_BIND job

 drivers/gpu/drm/msm/msm_gem.h         |   7 +
 drivers/gpu/drm/msm/msm_gem_vma.c     | 242 ++++++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_gpu.h         |   6 +
 drivers/gpu/drm/msm/msm_submitqueue.c |  50 ++++--
 4 files changed, 272 insertions(+), 33 deletions(-)


base-commit: 1e59855738454b14021b64115f0090eafc7526ae
-- 
2.43.0

