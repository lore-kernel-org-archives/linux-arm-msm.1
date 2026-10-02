Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66654EA39A
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 15:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955003; cv=none; b=JxGGcWoy0EtK6IARydp3KzTZsQX/48cxwx/QeiznLTO5lnOQ2+8vmeM/Al3Ho1aYekRtNmJzqCoUbD/aLnCLNMb0X7Kw5z/F+cM4v/3eLPDx/I9WAPTiVVGZ8bQ3eaEzPBfkcVufiZ1GXApHm8wm5qz+8+3QsHVjjjuifI5NfD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955003; c=relaxed/simple;
	bh=Ne/oH4viOImWVtT82Pw0n8SI1E/7ica0ue/WZsT0THM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pOYsC2sU7EgpzitRxC/kV3yyBu2fNCfnbWHgQRkxrP7dV0D9g+0uVafp0GSASPXnF5+DAxvp6McFWcfdaFqLIBxwGDlnQurcDsGZiXashShNl5Msh2dkEgFeMK/Rs+I4AiiJN7fi9N/ncrys3ZsYh34JrqlVSVLpoJJjaG7zDR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PfHYpj5x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JVZVofu9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PfHYpj5x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JVZVofu9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FGtNJ1865566
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 15:30:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sxS6ymcMwZy2UdPPmtMKkF3MthxRKVgfdvqIkGpimqc=; b=PfHYpj5xtGXQeRNg
	GvBf0nFZD3cbJySKkPmMctNw2PXXMBNyZDKxuvzxxWM2ruzgidSsMd7Vn6PcFzIs
	GU2OU1s6D/a0YV809fUkQpGCUULf4K7+gmIj0Jz1/UHyg0+eJyLacMQYgtcxAcAg
	TNsvh5sELPcq8uk9ayYCHG06B3YcVjGRM0q3qnvHniqzdezgkkhiMXZoewFhiKeW
	TojB3jgTfmIOh9Ihj3A7OYnck3AvXclkWhd7mYU1k7jilLKQ7HIqXY3V+O4ZhOIo
	Kn4v0S7F9r+EBKcBm3Cic7QceiPLm0da0hDEbHcrjoZbZkxi1MhvwfNWrY9kfWfV
	Q1oaBg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h20nftwcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 15:30:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1cade6b71so1621225a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 08:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790955000; x=1791559800; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sxS6ymcMwZy2UdPPmtMKkF3MthxRKVgfdvqIkGpimqc=;
        b=JVZVofu9Q5RpuY5qgLadimBpLvoMdTwPBb7QG1EIkMiKnw22Z7ZOPqHPhTWNxiglmp
         2cRFmpw264oo0h0cWb3aHD5o0AXE4X32G3R84xPMqRN8jlQkNMzSEqDN+uDtsDcz/kHB
         wv+brDBDzXF76zpT+X3KALZUehHglnWPTKS3d5sXAY7vopuQ1lwPMqtN/hq/j0r4V4L/
         28PSgrXgsHT5ypq+3yoW+j0V1/NcgEQKISMoscD5c0F/c3+2e4I+SO8snvubFn/sqnRg
         ys603l7X5+KhBFUzIHblOszIxA0QMvqGIebREIoDr15g3B/TQ8fcibrtdJgw75Fcb3dW
         b1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955000; x=1791559800;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sxS6ymcMwZy2UdPPmtMKkF3MthxRKVgfdvqIkGpimqc=;
        b=daamn/unx1jGCkZyvSpQIrVrxZN+GJJgEvlPX/HYaqQfGXXtTAuWvpvDWFyHmXjtl2
         UIO1tkrgVU1QGzSchguLRR8KzzpED0izzXWGmD7NV2qsg5BVYTruL78i9kvRes1szjxt
         A9XKBZ+mwk9Ntn6cttQmzPic0H/ndHy5KD8vt/0pnpdeoHmmRi2mOY4Ytb18gK+m5G/D
         W5RgA5vdsd+tIC18M/dD8JPZ0Gh33bJnFKQtAIH+lIsl3xz75L1fD9DI9FEOBI7Qa+Ni
         UzabnVYI20BTI53+zsd43Ono4oAHSkGvpRdk0ckar4v/i8mCY8i6xwySrCcpVeloNP1w
         hJiw==
X-Gm-Message-State: AFuF++m+u7z3Ijfn8PDCbCC1MlfB6eU3/zjktMXPzJ8c091HbMWSbdU0
	SP+ZZ+sVLmaVk142aZAZbaLKrTP49oRJMHubNhkie9tPDLBjAcHKdbKTdpxSAIrEsHc7o+pejl1
	4KhP7bLuR2M4RiYQEGNTMBkKrHS9svE7ZQg4Xxk4+07bPUzLPvzqC5gS5TDfY6NK71QEV
X-Gm-Gg: AYBFou1Rpsx9DwcWnIJ+ucUbyj8edpGFeNxFIolU2usOjInyFQo4Xuh6bTFt4R8fceD
	DY3rZ8056vD7Ce34d55DCEvTCaRG6uuRer/Xbt0+7Bh9wWudjjZcSMC3ry84fQHj16V/2TndSH0
	5kCL70eg0EE6gen8ZY/Cpqpn5/0YFnWqA3sLGY8KeMQXIYgC/H+WJvQmwWaefKHeF8BltPxrdjk
	yQDfhLqklN/Z1wwQ8QWXTKT4BrXTKLaCfoItuoS2Tfq+6kcGSqpuM2bD2lRSfXfjL74GnpJI2k3
	X1IVnyVgPjumEm8KKNYQl0z+q6sILSb1zIBlf91mZGTqeNQS/HqcYuzWi8uf3ktqaA8Xe1weOnS
	3llmj5LtEE1pn/u+T0P3I/6O4pJsV+0BRRDqqPnMXiUtBJw==
X-Received: by 2002:a05:6a21:e10a:b0:3d3:ad6e:9ce1 with SMTP id adf61e73a8af0-3e0bcfe91camr2445763637.15.1790954999445;
        Fri, 02 Oct 2026 08:29:59 -0700 (PDT)
X-Received: by 2002:a05:6a21:e10a:b0:3d3:ad6e:9ce1 with SMTP id adf61e73a8af0-3e0bcfe91camr2445744637.15.1790954999001;
        Fri, 02 Oct 2026 08:29:59 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc9f737a231sm1186860a12.18.2026.10.02.08.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:29:58 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 4/6] drm/msm/gem: Stop exposing a page array
Date: Fri,  2 Oct 2026 08:29:41 -0700
Message-ID: <20261002152948.85308-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002152948.85308-1-robin.clark@oss.qualcomm.com>
References: <20261002152948.85308-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CojcUR8tcm3eI_6gWXtaebMoKVH6jEnp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2MSBTYWx0ZWRfX5qV2jWd2Jgue
 xZ0xFZzgk036i4eKoW/RWYkFT8zscxlM9DubidECJjnZ8WJ5pgyOb9l4+p/1fCTnKgkja03GhlQ
 a59XcIIC507DbTn7aESmAzI7jQR93G0=
X-Proofpoint-ORIG-GUID: CojcUR8tcm3eI_6gWXtaebMoKVH6jEnp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2MSBTYWx0ZWRfX0qAW3XaAPkp6
 PNSV7JiCYIDoWZ3gIAFk+tN7ouChLQxzzoM4DiiYcxJ2sn9irkreG0ibh63rmo3bOfVwKjtZK9+
 TK8ny6IHoIjaSgHAZRrLGdtRCmVb9zYWlyllNKDLN+7PvAxBGnQFH5/gTuxBway4SLZLEGm66EV
 z5CVkotc8RM0jsIz4u1k/4XELKMEZpTR4QaSb9cRZJqwfC+dD4jW6jUt6h8KMLZNxTFKRYvJdl2
 v+MPHhG/q3ne77LFaFVnqLBMJO4PGKRhk/rxwiGE8bBIma3rVqZQrMt88tAv4nmtYkpW3grlqcM
 4opRwLLytpm7g0TsaA4K1x0uVOQ9YFVoI7sEr3mRE/FM1hPkRrWy1tWhA1Tarl+Yf/Wre+IJOud
 UQdw8yXI7yCnZTeEdmEx4SUEZKzI082Vuy3nMvFkOQ9gYN/ABPnIgb2+O5z0tGtqq0o/lFe/lO6
 anzwb5txEkCFcXQkFdA==
X-Authority-Analysis: v=2.4 cv=f+jdl+yM c=1 sm=1 tr=0 ts=6abfcdf8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zd2uoN0lAAAA:8 a=qy49VNyTqSxgYBYDrycA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020061

The remaining callers of msm_gem_pin_pages_locked() and
msm_gem_get_pages_locked() don't actually care about pages, other
than as a conduit for returning an error.  So convert them to
just directly return an int instead.

And rename _get_pages_locked() to _make_resident_locked() to
better reflect it's purpose.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_gem.c       | 28 ++++++++++++++++------------
 drivers/gpu/drm/msm/msm_gem.h       |  4 ++--
 drivers/gpu/drm/msm/msm_gem_prime.c |  9 +--------
 drivers/gpu/drm/msm/msm_gem_vma.c   |  8 ++++----
 4 files changed, 23 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index bf6a8939af7c..2341f209adf5 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -280,12 +280,16 @@ static int check_madv_locked(struct drm_gem_object *obj, unsigned madv)
 	return 0;
 }
 
-struct page **msm_gem_get_pages_locked(struct drm_gem_object *obj, unsigned madv)
+int msm_gem_make_resident_locked(struct drm_gem_object *obj, unsigned madv)
 {
 	int err = check_madv_locked(obj, madv);
 	if (err)
-		return ERR_PTR(err);
-	return get_pages(obj);
+		return err;
+
+	struct page **pages = get_pages(obj);
+	if (IS_ERR(pages))
+		return PTR_ERR(pages);
+	return 0;
 }
 
 /*
@@ -310,17 +314,17 @@ static void pin_obj_locked(struct drm_gem_object *obj)
 	mutex_unlock(&dev->gem_lru_mutex);
 }
 
-struct page **msm_gem_pin_pages_locked(struct drm_gem_object *obj)
+int msm_gem_pin_pages_locked(struct drm_gem_object *obj)
 {
-	struct page **p;
+	int ret;
 
 	msm_gem_assert_locked(obj);
 
-	p = msm_gem_get_pages_locked(obj, MSM_MADV_WILLNEED);
-	if (!IS_ERR(p))
+	ret = msm_gem_make_resident_locked(obj, MSM_MADV_WILLNEED);
+	if (!ret)
 		pin_obj_locked(obj);
 
-	return p;
+	return ret;
 }
 
 void msm_gem_unpin_pages_locked(struct drm_gem_object *obj)
@@ -487,14 +491,14 @@ int msm_gem_prot(struct drm_gem_object *obj)
 int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct page **pages;
 	int prot = msm_gem_prot(obj);
+	int ret;
 
 	msm_gem_assert_locked(obj);
 
-	pages = msm_gem_get_pages_locked(obj, MSM_MADV_WILLNEED);
-	if (IS_ERR(pages))
-		return PTR_ERR(pages);
+	ret = msm_gem_make_resident_locked(obj, MSM_MADV_WILLNEED);
+	if (ret)
+		return ret;
 
 	return msm_gem_vma_map(vma, prot, msm_obj->sgt);
 }
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 73dafe080bfd..4f681100ecb0 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -279,8 +279,8 @@ int msm_gem_get_and_pin_iova(struct drm_gem_object *obj, struct drm_gpuvm *vm,
 			     uint64_t *iova);
 void msm_gem_unpin_iova(struct drm_gem_object *obj, struct drm_gpuvm *vm);
 void msm_gem_pin_obj_locked(struct drm_gem_object *obj);
-struct page **msm_gem_get_pages_locked(struct drm_gem_object *obj, unsigned madv);
-struct page **msm_gem_pin_pages_locked(struct drm_gem_object *obj);
+int msm_gem_make_resident_locked(struct drm_gem_object *obj, unsigned madv);
+int msm_gem_pin_pages_locked(struct drm_gem_object *obj);
 void msm_gem_unpin_pages_locked(struct drm_gem_object *obj);
 int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 		struct drm_mode_create_dumb *args);
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index beb7f22fd694..e1e74e9b7e6a 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -109,20 +109,13 @@ struct dma_buf *msm_gem_prime_export(struct drm_gem_object *obj, int flags)
 
 int msm_gem_prime_pin(struct drm_gem_object *obj)
 {
-	struct page **pages;
-	int ret = 0;
-
 	if (drm_gem_is_imported(obj))
 		return 0;
 
 	if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
 		return -EINVAL;
 
-	pages = msm_gem_pin_pages_locked(obj);
-	if (IS_ERR(pages))
-		ret = PTR_ERR(pages);
-
-	return ret;
+	return msm_gem_pin_pages_locked(obj);
 }
 
 void msm_gem_prime_unpin(struct drm_gem_object *obj)
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index c11d021581e0..311205c7f1ba 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1300,11 +1300,11 @@ vm_bind_job_pin_objects(struct msm_vm_bind_job *job)
 	 * trigger get_pages())
 	 */
 	job_foreach_bo (obj, job) {
-		struct page **pages;
+		int ret;
 
-		pages = msm_gem_get_pages_locked(obj, MSM_MADV_WILLNEED);
-		if (IS_ERR(pages))
-			return PTR_ERR(pages);
+		ret = msm_gem_make_resident_locked(obj, MSM_MADV_WILLNEED);
+		if (ret)
+			return ret;
 	}
 
 	struct drm_device *dev = job->vm->drm;
-- 
2.55.0

