Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395682;
	b=notE+7ZXlmFAc1k5Lq4jBCea7QqZQHlwXxbWAIE7VWvAMPAHadxCWoKLA/cvqWfw1zJf
	 j4kd7cGR/GCFmnWGnUYmE4dOLc5uik2U4yPwmDMBCfggOMThL0w1CHDX0/JaPi5cXwhMz
	 hDePCcMymiafTNlAQB1GPqG3lPEvc1W8JLhS8XR05rzhgW/yNbZY5qlUAxVCTGQJjl1Al
	 GDJrXLfLsiW2r2DAYoj7OI5NFKzCLN6WYaln8+sX+NYCEH1rKKa9zuOX7aovmlUs76rjz
	 LxRDjU8JpNRQzhqK3YuJhvgnYkdjsp4xiul6Lg5pN0haq5n4VxbYEomNlsGcIpG4vwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395682;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NKRuHrdlCG2AC+LOZdX3rskzlgUqfcbnjlFbUOLAYSc=;
	b=Sjgg6XgPWSpXDpU3Zr21xTr+dSKp9G1aYTFzpDaRujj8hiC+C2/WMknkMcz1sZLJgDWe
	 dQn/1TyLXkt7cQQdx61r7VwTz4JveJqwWTirMxlSrXIil0yPblfUkJOyRoG5LNi8mhjd0
	 QW6mZh23TPf1B4AWKWCn0Wfo34KmApfNML9gXyVEZrtxxkdaZVb7PfkfIny90NYBd7Zxk
	 9av3pWXueQUNkUMSk9NlCqpc6fxcfb3L61gIM0VpCgKp6Jt0dkmXvj6Ot6z3guDqqczET
	 ESmtpXndaN/qi52ALohaLP0Rq7KrfK+Gjvqa7ni6xHb03mrBEH9UEIEAp7d5xHSiMig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TSSnZqPG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Mwoe7R/i";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB991606A323
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:28:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB991606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TSSnZqPG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mwoe7R/i
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULAoVE4086604
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:28:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NKRuHrdlCG2AC+LOZdX3rskzlgUqfcbnjlF
	bUOLAYSc=; b=TSSnZqPGqftosQMLqubn+JIQqcsjt3dhQMRu+zw7fqc8F+WuPox
	y7zZZNmAC7g7RR1ljTFH3ZQzYoROdFi3o90g0zg6v17y/41WVqOFX/8qJPDJMqsk
	bofxpli6mIj+jKNCOzN01ETlvvDu4KUYrpa9eBxNSX//DQ0a+yuzKsuBjucAfOlk
	PwxnYof1FE8JDb+KeIycCJ60I1GDMnZ2IPjQiL3zbrG8HMWRP3uDW/7xRJvAcKCd
	3RZ/SaMkVv1BZlPtQswWu7qfEi1ZT7J4ssxxFHqjHS8A80vvmaHMTLocFll2xqwD
	9nz84r+BrOaJjsqEDM5qJ8q9ZRsaV0m6cug==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x103a4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:28:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so917087a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 14:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395680; x=1794000480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NKRuHrdlCG2AC+LOZdX3rskzlgUqfcbnjlFbUOLAYSc=;
        b=Mwoe7R/iPGbELMmRLrY0OW15YzwUuopq2sksnhG0VivJrAq6EsOXvqHZFlZVCDkEZV
         HymZBD8UQ6QNYVJ/O75ikob87jOL9xclcCVLAqt7BirsPJjhA9AxwARBYKM+q3EIPF+r
         tVErdnr0y8P/IjzdF9HfQeg4Hvapkqov+P4fKuqMNJi23jhHCeMIc6RYFQgLFJOyO0Vw
         DfJhGc0itJYkTqlr30pCkcJjqMc3JGeXwDqSgn2TLhjJhoE6T0yJs1MgFJGct229FC9t
         Cf0+1r+sanVdCDfy9/YpQRYOF/uUW+Zsdhy4BMwIkfSvHziREuZw2MMDpCG11TZkshRZ
         0ZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395680; x=1794000480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NKRuHrdlCG2AC+LOZdX3rskzlgUqfcbnjlFbUOLAYSc=;
        b=0nb+fqWQjGpY/tSj2dQi/wntsh2nrXWJdjIHFxgpD13aRMSD1G/TDtyfLWFz9SiLQj
         77RvVXWx+NxC/WnowKOV4vu+iWANPlOK6+AhiCSJj1yzn+KpX+9ZIC1ebuLGglT/B+nF
         WjJxWqr0fYPv9ULAMsy+iDqcy6QRQyOhseI3AO/OC/KphZnDUUih+/k64SHOyNf/kZhN
         IToC7px2J6hJeQRBhKg2q0XXbcD/IbQwwADynL2jzsovRT+qoZLzDpZYTeqILEtkjcZI
         MW5nDyjx45tntFwaCX/YJAN/Rs5Xo6qjMx2Hq4My/3XZ5U5JQoFntthG2KVncjRYInWb
         oVDw==
X-Gm-Message-State: AFq9FYLu3MGDPJE46u7bM2fWhoMGc7TlSN+21m/YMr2FmQQOnxm8WNIS
	JLgVGYDwSOlgurT6dR6/3WpwbIOg9qp4bA1Yp3cFjsvPQe7SPqYnEv0H1yuwD6zuyY4wNzV9iLh
	L3Z5VSB3UYc0bU8BrhDNPi2EYhhiJSET1DQw07wtgrrFNhlxKWKvK6oViZOxkfYMaB2zA
X-Gm-Gg: AYBFou3gYCFxpi1v6qmC3VCUcPUievjhY50gdDxuv9ynhr91mwzFH4nEUyR1vlWvQhA
	6bIpwZRKdtNM7pIg0QAoDiptTlz9lCLh3FI8kyLUuwzQOe+rHpiM0nAVLttfh/I5N33Pt5JuQmP
	xK/JpcbA6PXnjp0CUWUe1CI1NGwxq4gklsnyG/KLsqeaSlP0jU/EtLheadBtJvALyfoDHPvCZNG
	50ErM4U3RoGKej9jkWgTXdCP17VChj6NbBSwV9IH5D5UsuGYkxYE6p/xmNUZj59RX651AhBnxQm
	qkBlU3M4sKfOwYWbR5vzMlS1LvMIT9i/p6N9FAF/2vektTg/JT/iKPis+HVbgThDjgoZpjR8aYY
	MWDni6r0IMgWpavb4Up0w3AVFyU6qTfIvj2YVGA3In6fImldqONSs3kWdpRfkDoPOxelIsiqn8a
	2+nDfpBbUNFBYLTBzTfxvBAmQ=
X-Received: by 2002:a17:90a:e70c:b0:3ad:a232:4044 with SMTP id 98e67ed59e1d1-3ae8979969fmr2618544a91.38.1793395679665;
        Fri, 30 Oct 2026 14:27:59 -0700 (PDT)
X-Received: by 2002:a17:90a:e70c:b0:3ad:a232:4044 with SMTP id 98e67ed59e1d1-3ae8979969fmr2618537a91.38.1793395679177;
        Fri, 30 Oct 2026 14:27:59 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae87ee7765sm2711053a91.2.2026.10.30.14.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:27:58 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3] drm/msm/gem: Add some cleanup.h
Date: Fri, 30 Oct 2026 14:27:51 -0700
Message-ID: <20261030212752.51494-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: mt6kMkuWIGRetXYfDrhEcs6-j6KmZKdk
X-Proofpoint-ORIG-GUID: mt6kMkuWIGRetXYfDrhEcs6-j6KmZKdk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX9P8j35y4aDuN
 eHFFLiF/Q7z64UrABDogbUTXpVjWHddGidyxKlNNP2DjwWxUXp1XbkGqyLEGcLZ1ZqjeZ2f9TSy
 xZ1rZ+IUB45gfGaW2dvS1TvPbcQFxGk=
X-Authority-Analysis: v=2.4 cv=abD0Dhot c=1 sm=1 tr=0 ts=6ae50be0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=IPQtAqkb2_EUGazGSrUA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX2NUAYnUWqCEV
 LoDVlrzgjHW54uLvMZU9lH/N3+5uo1+qtJhiDjPCgMa3xf/p6EPCHNHartaVUjcxO52X61iX6pa
 q/2v4XXDWlGakxnoMdi5mMSXHnM/25xbz+76rBpU5COW3UAWkJddkXv661iR1+DdVpYEkxuWYg2
 8ZbUf8obQNddNzn2Tt+81rsj3+lb6w/1Dy82Fs1jpuEFJ84IENIEwUlOww8DQ4x0AAMHhoBZ7Az
 51JxicRtohqpLz8TFkW0sE4Gzk91jIm7B3lK5UoA3WlrUnIVhhEldRaNRUxkZkzEop/zD7s0JAK
 dKSJrAJh69JtGR2lPqRKwP03AfStuT5tBv2PLvq1Ku8Z4SAgAvz6DhDAPe2ORtE6vPn6cJZkVow
 egoX0glVDeXRWpMk0Xpsz6GmJLoh8cc5dax52Kag7JJ1iI5c3QVxpHXIdD1EgjJ8GWvnHa1yA7G
 /USI8VFZNiAVgsWuN3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2610300085

Convert (most of) the msm_gem_lock() and friends over to scope based
cleanup.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Makefile         |  2 ++
 drivers/gpu/drm/msm/msm_drv.c        | 40 +++++++++------------------
 drivers/gpu/drm/msm/msm_gem.c        | 41 +++++++---------------------
 drivers/gpu/drm/msm/msm_gem.h        |  3 ++
 drivers/gpu/drm/msm/msm_gem_submit.c |  6 ++--
 drivers/gpu/drm/msm/msm_gpu.c        |  3 +-
 6 files changed, 32 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 1e246616f83f..6196a325b6f1 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -252,3 +252,5 @@ $(addprefix $(obj)/,$(msm-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
 $(addprefix $(obj)/,$(msm-display-y)): $(addprefix $(obj)/,$(DISPLAY_HEADERS))
 
 targets += $(ADRENO_HEADERS) $(DISPLAY_HEADERS) $(ADRENO_PERFCNTRS)
+
+CONTEXT_ANALYSIS_msm.o := y
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 7ab808322be6..3e921d24d22c 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -550,7 +550,6 @@ static int msm_ioctl_gem_info_set_metadata(struct drm_gem_object *obj,
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	void *new_metadata;
-	void *buf;
 	int ret;
 
 	/* Impose a moderate upper bound on metadata size: */
@@ -559,32 +558,25 @@ static int msm_ioctl_gem_info_set_metadata(struct drm_gem_object *obj,
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
-		goto unlock;
+		return -ENOMEM;
 	}
 
 	msm_obj->metadata = new_metadata;
 	msm_obj->metadata_size = metadata_size;
 	memcpy(msm_obj->metadata, buf, metadata_size);
 
-unlock:
-	msm_gem_unlock(obj);
-
-out:
-	kfree(buf);
-
-	return ret;
+	return 0;
 }
 
 static int msm_ioctl_gem_info_get_metadata(struct drm_gem_object *obj,
@@ -608,26 +600,20 @@ static int msm_ioctl_gem_info_get_metadata(struct drm_gem_object *obj,
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
+	scoped_cond_guard (gem_lock_intr, return PTR_ERR(scope.lock), obj) {
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
 		ret = -EFAULT;
 	} else {
+		ret = 0;
 		*metadata_size = len;
 	}
 
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index bcdb57866cf6..000dfcec7809 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -351,8 +351,6 @@ static vm_fault_t msm_gem_fault(struct vm_fault *vmf)
 	struct page **pages;
 	unsigned long pfn;
 	pgoff_t pgoff;
-	int err;
-	vm_fault_t ret;
 
 	if (drm_WARN_ON_ONCE(obj->dev, drm_gem_is_imported(obj)))
 		return VM_FAULT_SIGBUS;
@@ -361,22 +359,19 @@ static vm_fault_t msm_gem_fault(struct vm_fault *vmf)
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
@@ -387,12 +382,7 @@ static vm_fault_t msm_gem_fault(struct vm_fault *vmf)
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
 
 
@@ -778,13 +768,8 @@ void *msm_gem_get_vaddr_locked(struct drm_gem_object *obj)
 
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
@@ -811,9 +796,8 @@ void msm_gem_put_vaddr_locked(struct drm_gem_object *obj)
 
 void msm_gem_put_vaddr(struct drm_gem_object *obj)
 {
-	msm_gem_lock(obj);
+	guard(gem_lock)(obj);
 	msm_gem_put_vaddr_locked(obj);
-	msm_gem_unlock(obj);
 }
 
 /* Update madvise status, returns true if not purged, else
@@ -824,9 +808,8 @@ int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv)
 	struct drm_device *dev = obj->dev;
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
-	msm_gem_lock(obj);
-
-	mutex_lock(&dev->gem_lru_mutex);
+	guard(gem_lock)(obj);
+	guard(mutex)(&dev->gem_lru_mutex);
 
 	if (msm_obj->madv != __MSM_MADV_PURGED)
 		msm_obj->madv = madv;
@@ -838,10 +821,6 @@ int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv)
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

