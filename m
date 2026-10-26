Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793050630;
	b=y80HgaIo9g9V5vBcnwHYJATtdhV+gqpX93u2CigkJvjqWRLPYu4A6BoMSIFwoMK/1j25
	 dvzUPzbNa3BN9E7Klr23WZ4clmPnj1hLK7LFkf50OOhCIlBTcaRx1SP8QBXIJg84pfgCG
	 j2XbBWBEKYUN2ls4bo9t9VjP9bSxGYh+ADvJTDk0kxH+aIbhMp2jq0SaAn7cdL50WVlpZ
	 ac/XaHAuYBZeH/yWqGP1bryApx/rQvJXzxMjkDmQXizpe82Dsuv6W2JhnBt9jVagM+8He
	 j39o2KWe0rmm3NBicct2kWmMCgdyo2kW3X99M4RjLvryFzJg78mjrMtHQ6LRZSWhpXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793050630;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pIu8GhpwL+jzjKQYXaJ1hRumnv1fMlDksFz956xyz9A=;
	b=hRAAJQWQVn6mWPshmgMTUe9uk5O7/sMFDVVOom6Lo3soCyzY3AOnKFhQkLacRrB3f4j3
	 dx+2Omk5xIJ6920MfWe/kVMMdcQiZ1kW5JMB/l8JJhSGq24KqfkgAS2SToDXQLVTZm8W0
	 FPKMTaWDLGpmyv6aqyustA4icbsrLvqHzHXI/+Knn10G6QvfnrFXAwVN0Im9SPIFRKiwm
	 3kzpyHF98e8punDBoxUHK5y++OgVh9FrlfikAbLkRr0Fo5XqQLbIBQR2cVpKf5Unh1wSw
	 zq9fg9E6AGlCsjqu0cIgKf9gbNe+cZGsBuyLp1lRHbjSNTcAkkVATOqir7zVG64E4Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UTqZWwBq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G8eBnENG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3873606A31B
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 21:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3873606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UTqZWwBq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G8eBnENG
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QIoogO4080882
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 21:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pIu8GhpwL+jzjKQYXaJ1hRumnv1fMlDksFz
	956xyz9A=; b=UTqZWwBqoLxrkOgHwfWznpU6NDTEeGe3CIqNjNOymCvLRjcqmL6
	8Tl3wj4BV3zIiDJV2Y4IhfUmwapY03wyeYdXjJGxTrI+nRXUCDH1i6WgMy9pDhTA
	0yVIXDhdVPZiofW+FNpkSHCTVt42rOUMCCViwhuxVowGky895XSIh+I2BJ9499mk
	614ufjRXJrlNLdG6Jz8kOjUZn5hXeK0lH9QYWnAzscClUmoIAItA2WT5eH1Mc8BW
	mOcBMhhtstH+ekloMdbd+ZO2oi8JhhYUt/LezU8Cj3XrzI7X2teKP3u1k0cMB7c3
	RwBmL+tzU5phB+3jIl1ZqLtMI81wMy6X8Pg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y2emd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 21:37:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3aca98f01c1so3332595a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 14:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793050627; x=1793655427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pIu8GhpwL+jzjKQYXaJ1hRumnv1fMlDksFz956xyz9A=;
        b=G8eBnENGHMz6di9apoUk4sarv3fI1d/LKC1oQbkRL26QZOLi6+4d/Spit5EhXA/4Ep
         RaEUj6+hjsQ6+510JNUTqsUB8GRmDPS1/r0dcLs59wZMM2Vv9VvplyRmhkRL0d9uE88D
         NjtHu0h1xXBnIjiUoHKGucw1tGjY9wVY52/5Q6DigOixI/bbaUSkdpN6Kd4gBv7LxDtk
         k/nsYCPs+6ZPXL+2dt0DHYOjmNpArpqg5MabSyi6DyUnjpsK3OducRK9J4uPcsiAcboL
         q21/Aog0/MzKwI9hfchVdQOghJqJR6vzp87PDjzP0vw86f8xJ6S2hmnCE5s7aNw4y0p8
         xaoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793050627; x=1793655427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pIu8GhpwL+jzjKQYXaJ1hRumnv1fMlDksFz956xyz9A=;
        b=OteJgxgR/acxPqhPBuPhUYhB4hzC7tKIU+JwrrhBNMY4RLGmOFHa0rdVynKpk5vPvf
         IqUjhkDkWtukxNUqA/GD44ShiVYNPY6pfsZsh/Xps8vpMtd2XEcJu2VEcc5+aFzZIgrL
         Rm2b3UWvMDE7he59Esk7bBnmqXE01jGT4XnmNPw1e2I3F+0mfVmt3Pc5PG1Vp6YkwxfS
         KZH7dYRCr+KLPN+nIuwKGcDCpR9u69DEOTTS62/BL2a1dnMP+gKtXgMibY2HpVpEnYVM
         66KBPUMYhW2+IwV1w8tHdfYSsDyNayVEYfsym5JmW79Spcd/s02HKdSOBr6+BGc7P/n6
         LPOQ==
X-Gm-Message-State: AFq9FYLtnztPILImoI7+jd6GTrSLhNbnNERqUhSX2LkwaVmSriUg0+Ez
	xltvjoKvXnTIhf+4PbA429uwCyklKfT6SBuoL7WMwAnZ/hqNbVQ/QvVff9lpaONIt3RYMm7bZlc
	h/pPNM+vEZL/AThAYe4/W4xmTPsEf7IMXBbJwPQjlUaZth/VqfgR4kQ/ID75frqFlss8H
X-Gm-Gg: AYBFou19Hefx3xmkD311IpbKUnDTokvwCq/Q0DNJBHqzaQc6Trw6/+p39DG7TUqgGLM
	CeBFQWPr+LJtCgfqd1QGrrvCdHKL5Cr3zTit5/YC7lPqJKOKyuLN61lvZ4+TUk4PgWZDTwGoXc0
	xXseus+N0dV2cUYizj3OITQhhbyJe3x4OugDAMMrWCrlIbQIyOyPAnMovhIgraaHvVeO3o6K0qM
	wgGlC17OlFt3mWCzXFvDzT0y7/2y8ZLvrvMVdn2ck5veySrNR52v1rmuWvaiiZI3Ebxla2tABio
	Y+BnKiaFS2goUD92k5JhtmI6qq4Sio5N+J/b+HVBQ91X6JmcasnRn17hC66Lc1nYD2ijdPfK8KO
	rmRM9DrXPHGvc8WQxTxp0abAlP/f/GGQyJYNudY6WOgev5RNp
X-Received: by 2002:a17:90b:5823:b0:3ac:8897:7b98 with SMTP id 98e67ed59e1d1-3adeae7644emr7043722a91.32.1793050627438;
        Mon, 26 Oct 2026 14:37:07 -0700 (PDT)
X-Received: by 2002:a17:90b:5823:b0:3ac:8897:7b98 with SMTP id 98e67ed59e1d1-3adeae7644emr7043709a91.32.1793050626968;
        Mon, 26 Oct 2026 14:37:06 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40614daasm886781a91.4.2026.10.26.14.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:37:06 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/gem: Add some cleanup.h
Date: Mon, 26 Oct 2026 14:37:00 -0700
Message-ID: <20261026213701.22126-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA4NiBTYWx0ZWRfX6d31R45NRinl
 g2hHEov0bhiAvKjN6SxI3U0AERs8gNs2WtCRBC7zKG7WoMGW7/Y2M4ymoLsE6+iR3H8N391pXKL
 Ef5rRKeZRPVwBwMFcZsjtOOOnZa4Low=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adfc804 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=N54-gffFAAAA:8
 a=EUspDBNiAAAA:8 a=YqXTWzTma6UHzskxvDAA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA4NiBTYWx0ZWRfXyrc4lQf+HRxe
 /KeLAHhQ2JRzh78enxrVB9LfTciI0YUSdLVIBLibBg13b0/k8antSX6nUDR/StH+Td70+sgVd6h
 T0JIJiVFZEIgfsmghvrNUuXPB0z5k25zMjCy6ZUgr5DDIMSbBoZCtrmdnORUlPH1kPUP4yJ05yj
 90Wn4ElQsMhz60b5OBQw8/2Lxb1rUaVX1g/q9EuBY0/rqc3qdTgdXXNxU8MiIu1cG03o3AyU3gz
 paeqRc5hGj2jQyvDrFtbuf5UqWTaLhUXW2oiC8OVtqqSk7Zfua8IoVJYe85ZCXuk+wbpdCG4ywA
 xe8kWYoIJ0js2+1PKcM0vDzEOp+WNCu38KKFYObu4EKqUpLFl4C/lw+gNdPLOsxQmSRdktLDAOV
 TCs6aF0jTVFSyM/yKqBRrbAEVOwgd0vIRfRSCAvFxPXLGkP7o5XmU5t9b6ubIgB2JKzPcP2OPgx
 oKaSyshykhXJyOh+uBg==
X-Proofpoint-GUID: uhZkQ-6Ew_a8Nj47dTJTeYeEDaNyClSX
X-Proofpoint-ORIG-GUID: uhZkQ-6Ew_a8Nj47dTJTeYeEDaNyClSX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260086

Convert (most of) the msm_gem_lock() and friends over to scope based
cleanup.

Other than fixing a lock leak in msm_ioctl_gem_info_set_metadata() there
should be no functional change.

Reported-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c        | 38 ++++++++------------------
 drivers/gpu/drm/msm/msm_gem.c        | 41 +++++++---------------------
 drivers/gpu/drm/msm/msm_gem.h        |  3 ++
 drivers/gpu/drm/msm/msm_gem_submit.c |  6 ++--
 drivers/gpu/drm/msm/msm_gpu.c        |  3 +-
 5 files changed, 29 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 5e8f3ce26b32..42381db0c468 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -550,7 +550,6 @@ static int msm_ioctl_gem_info_set_metadata(struct drm_gem_object *obj,
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	void *new_metadata;
-	void *buf;
 	int ret;
 
 	/* Impose a moderate upper bound on metadata size: */
@@ -559,31 +558,25 @@ static int msm_ioctl_gem_info_set_metadata(struct drm_gem_object *obj,
 	}
 
 	/* Use a temporary buf to keep copy_from_user() outside of gem obj lock: */
-	buf = memdup_user(metadata, metadata_size);
+	void *buf __free(kfree) = memdup_user(metadata, metadata_size);
 	if (IS_ERR(buf))
 		return PTR_ERR(buf);
 
-	ret = msm_gem_lock_interruptible(obj);
-	if (ret)
-		goto out;
+	ACQUIRE(gem_lock_intr, lock)(obj);
+	if ((ret = ACQUIRE_ERR(gem_lock_intr, &lock)))
+		return ret;
 
 	new_metadata =
 		krealloc(msm_obj->metadata, metadata_size, GFP_KERNEL);
 	if (!new_metadata) {
-		ret = -ENOMEM;
-		goto out;
+		return -ENOMEM;
 	}
 
 	msm_obj->metadata = new_metadata;
 	msm_obj->metadata_size = metadata_size;
 	memcpy(msm_obj->metadata, buf, metadata_size);
 
-	msm_gem_unlock(obj);
-
-out:
-	kfree(buf);
-
-	return ret;
+	return 0;
 }
 
 static int msm_ioctl_gem_info_get_metadata(struct drm_gem_object *obj,
@@ -607,21 +600,14 @@ static int msm_ioctl_gem_info_get_metadata(struct drm_gem_object *obj,
 		return 0;
 	}
 
-	ret = msm_gem_lock_interruptible(obj);
-	if (ret)
-		return ret;
-
-	/* Avoid copy_to_user() under gem obj lock: */
-	len = msm_obj->metadata_size;
-	buf = kmemdup(msm_obj->metadata, len, GFP_KERNEL);
-
-	if (!buf) {
-		msm_gem_unlock(obj);
-		return -ENOMEM;
+	scoped_cond_guard (gem_lock_intr, return -EINTR, obj) {
+		/* Avoid copy_to_user() under gem obj lock by making a copy: */
+		len = msm_obj->metadata_size;
+		buf = kmemdup(msm_obj->metadata, len, GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
 	}
 
-	msm_gem_unlock(obj);
-
 	if (*metadata_size < len) {
 		ret = -ETOOSMALL;
 	} else if (copy_to_user(metadata, buf, len)) {
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 72e3cd8bb1e7..9abcc7beb268 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -376,8 +376,6 @@ static vm_fault_t msm_gem_fault(struct vm_fault *vmf)
 	struct page **pages;
 	unsigned long pfn;
 	pgoff_t pgoff;
-	int err;
-	vm_fault_t ret;
 
 	if (drm_WARN_ON_ONCE(obj->dev, drm_gem_is_imported(obj)))
 		return VM_FAULT_SIGBUS;
@@ -386,22 +384,19 @@ static vm_fault_t msm_gem_fault(struct vm_fault *vmf)
 	 * vm_ops.open/drm_gem_mmap_obj and close get and put
 	 * a reference on obj. So, we dont need to hold one here.
 	 */
-	err = msm_gem_lock_interruptible(obj);
-	if (err) {
-		ret = VM_FAULT_NOPAGE;
-		goto out;
+	ACQUIRE(gem_lock_intr, lock)(obj);
+	if (ACQUIRE_ERR(gem_lock_intr, &lock)) {
+		return VM_FAULT_NOPAGE;
 	}
 
 	if (GEM_WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED)) {
-		msm_gem_unlock(obj);
 		return VM_FAULT_SIGBUS;
 	}
 
 	/* make sure we have pages attached now */
 	pages = get_pages(obj);
 	if (IS_ERR(pages)) {
-		ret = vmf_error(PTR_ERR(pages));
-		goto out_unlock;
+		return vmf_error(PTR_ERR(pages));
 	}
 
 	/* We don't use vmf->pgoff since that has the fake offset: */
@@ -412,12 +407,7 @@ static vm_fault_t msm_gem_fault(struct vm_fault *vmf)
 	VERB("Inserting %p pfn %lx, pa %lx", (void *)vmf->address,
 			pfn, pfn << PAGE_SHIFT);
 
-	ret = vmf_insert_pfn(vma, vmf->address, pfn);
-
-out_unlock:
-	msm_gem_unlock(obj);
-out:
-	return ret;
+	return vmf_insert_pfn(vma, vmf->address, pfn);
 }
 
 
@@ -803,13 +793,8 @@ void *msm_gem_get_vaddr_locked(struct drm_gem_object *obj)
 
 void *msm_gem_get_vaddr(struct drm_gem_object *obj)
 {
-	void *ret;
-
-	msm_gem_lock(obj);
-	ret = msm_gem_get_vaddr_locked(obj);
-	msm_gem_unlock(obj);
-
-	return ret;
+	guard(gem_lock)(obj);
+	return msm_gem_get_vaddr_locked(obj);
 }
 
 /*
@@ -836,9 +821,8 @@ void msm_gem_put_vaddr_locked(struct drm_gem_object *obj)
 
 void msm_gem_put_vaddr(struct drm_gem_object *obj)
 {
-	msm_gem_lock(obj);
+	guard(gem_lock)(obj);
 	msm_gem_put_vaddr_locked(obj);
-	msm_gem_unlock(obj);
 }
 
 /* Update madvise status, returns true if not purged, else
@@ -849,9 +833,8 @@ int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv)
 	struct drm_device *dev = obj->dev;
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
-	msm_gem_lock(obj);
-
-	mutex_lock(&dev->gem_lru_mutex);
+	guard(gem_lock)(obj);
+	guard(mutex)(&dev->gem_lru_mutex);
 
 	if (msm_obj->madv != __MSM_MADV_PURGED)
 		msm_obj->madv = madv;
@@ -863,10 +846,6 @@ int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv)
 	 */
 	update_lru_locked(obj);
 
-	mutex_unlock(&dev->gem_lru_mutex);
-
-	msm_gem_unlock(obj);
-
 	return (madv != __MSM_MADV_PURGED);
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index d8ec696d89d7..bd7968232d73 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -347,6 +347,9 @@ msm_gem_unlock(struct drm_gem_object *obj)
 	dma_resv_unlock(obj->resv);
 }
 
+DEFINE_LOCK_GUARD_1(gem_lock, struct drm_gem_object, msm_gem_lock(_T->lock), msm_gem_unlock(_T->lock));
+DEFINE_LOCK_GUARD_1_COND(gem_lock, _intr, msm_gem_lock_interruptible(_T->lock), _RET == 0);
+
 /**
  * msm_gem_lock_vm_and_obj() - Helper to lock an obj + VM
  * @exec: the exec context helper which will be initalized
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 5862db05297a..ff6cf39587c9 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -536,9 +536,9 @@ void msm_submit_retire(struct msm_gem_submit *submit)
 		struct drm_gem_object *obj = submit->bos[i].obj;
 		struct drm_gpuvm_bo *vm_bo = submit->bos[i].vm_bo;
 
-		msm_gem_lock(obj);
-		drm_gpuvm_bo_put(vm_bo);
-		msm_gem_unlock(obj);
+		scoped_guard (gem_lock, obj)
+			drm_gpuvm_bo_put(vm_bo);
+
 		drm_gem_object_put(obj);
 	}
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 0c2c35636251..fb07803f5aba 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -308,10 +308,9 @@ static void crashstate_get_bos(struct msm_gpu_state *state, struct msm_gem_submi
 			struct drm_gem_object *obj = submit->bos[i].obj;
 			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
 
-			msm_gem_lock(obj);
+			guard(gem_lock)(obj);
 			msm_gpu_crashstate_get_bo(state, obj, submit->bos[i].iova,
 						  dump, 0, obj->size);
-			msm_gem_unlock(obj);
 		}
 	}
 }
-- 
2.56.0

