Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED63F1E1024
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 02:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790995161; cv=none; b=Dg08GFjZS1NUXOrqoS58w1yCYWnqnKc0N5ewQjg1C2RegA6oYmFp+kPrz9PYXIBbsPrOuH7u9T40cGGBfHJyHaZZFec6INLpfwLF3orj9GLA7/RPF4zFadnG3bvL1cuwcuy7wAI4g5R+GneFcF9y3WeBR725ivFDn2cO2ewr9wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790995161; c=relaxed/simple;
	bh=6sUzptU1IK1gQqAJpZme13TDsKBYyarGUlEV1hY0yMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZxKScHh/PgoxteyaEq6hYAhyfpOlKJ7cbi7kxNRRQOSmAAF2wzamsQjpA7ME9zguAsskOq2668kUSKaKW3Qo0mASi/jKgMZtv4YwRNCDBI9+nE+Zf9bnwE5SuhWXFXF3U+CAKOwcc5kjRBW4cPB9SfwgqmDgeq9gBanRPgTnyRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QzjCLG7d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NJtQpCTa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QzjCLG7d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NJtQpCTa"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692Nelo13338223
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Oct 2026 02:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Qg9VBoVcFjj
	Up6OM0nt/5vJ12HQTFVqlHbAGmKdxIwQ=; b=QzjCLG7dp+E/z469TJ/6Lo/VzpJ
	or2ALZ0s45GEpAT5yEpsppCR6hnogmiMwYawgejleqZByeOmtr+1AhM776hcuZhQ
	ECekPtQxtyvet0HGSRhOt9hBMaw0sDyuOg9dtYipNQ9TwDw+ikkcjC1LQyWnOKpy
	fJ3YOH2eMdtyhAtghBdOb0ytsQsyTbA7Zpac3hvNsBhwd2nVihW8NI1Wnuhjmo/Z
	eNiBpu1Y85RdfvIPZTmWnpFyTwIkMf6ZbL+erp4ILIdk2HW4GNrbPmh9GZKFMwqk
	/C6EEEkr6StTdyR2OpVZvPCSbBnuxbtT38dpRNzlrFY5tN9lsYBeVuH0yEQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2aj03amc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 02:39:18 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso221178eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 19:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790995158; x=1791599958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qg9VBoVcFjjUp6OM0nt/5vJ12HQTFVqlHbAGmKdxIwQ=;
        b=NJtQpCTaDsIpUpkfKCXZ8eceQlNzRD6vXnsg0h5S5LbCCmvcU47K9e10230m8CkgxV
         c4TnQ14eDM8a3Q+iFCqHjJ/rv2gtjOzQgy65hOaBW3SVhciDwAzVfAipcTSiVpx/5AW7
         TYWgn9ocYBTGrdXKg09G53Sryo1Om6UBEWtaNsUWi461wV7OoIUBUo+sKEEVR7Y1Z4nd
         c8KjwfgmE+PlxN5kjxof2VQGG1mzxFX+d319T45tiCr16ljrkgAdg1ySFtfZai9Bs67J
         Xu1Tbc3guvYW7uLugTbhdRqd+cVPCnK9OHfNf1A2uezGonFZajQc/T/y5z2i289f2wF0
         Z31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790995158; x=1791599958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qg9VBoVcFjjUp6OM0nt/5vJ12HQTFVqlHbAGmKdxIwQ=;
        b=gFGQ+ctNNkh/0ZN0OfxMhe96bNmB+pppL70oAp+EsCMxCvR1ekDCfJeQtdKqwGQz9I
         yzYbSGcW2o3eBhZMVJQnyIRJONI65Ld2t9T+kBP3aYtQBxbq2UlCXyorN0hpj2YJC38T
         rmtfdMfZ1ajTEMIyFI/Q/u4RxgybjgKa1GIoEaZ1qI0z/9vLRUuHpJK58zhyTn2o5w5T
         IFuQqebhPT4nhhkfOhkDabewfYl0nlP6jrPus372At2kb8gJxOYM1iE+CFcV/iXo7Eqi
         xkPphQAGmNnFXLcjIvJazmVbWFkNmpKQ46Fd94AWiwj+EBMqK+1Xn0hqw83PO0mrEheE
         qW1g==
X-Forwarded-Encrypted: i=1; AKwUvBznLK+Gq/3+j01lgRE3Tsjbt/5rdkOQgGKVh9tscZeSZPoBP+9EjvnD+IawOlwRziNWSITg3RBowyZMv5zD@vger.kernel.org
X-Gm-Message-State: AFq9FYI1kEKndMjaDpQAghjc26W/TubDgt87rHe2cczU6fth2K8EHWjB
	oSwEGip9t1kWIDx3EwMXOzXI66lcOHXmNTQT5UdueIneXhkS8m2vPxOcyaZRSaF5eZT+11QJfZq
	rPhDM0VI0CfLJiWjuFFwk/QrHw88crOfHfLlUbfOWoHVxA3n3FTROPfr/kkLYZh6m4hP0
X-Gm-Gg: AYBFou3lemTCIgJS1zgVYJgtSRAMAlvivAc8IjzKx+pNUidhKraT2UdcBYBPbKBaF0H
	3k7Lg+VinJyfRvt9XBm1HumdNV6mZ1I0w9wQ2XYDDIcDUTfmMiCYnTsY27hgI4M1zJF4yx9HlPH
	qmLjajfH0NM+CDHXUe+tdbfMmGiI8ehCOYniDJ6MiqYauLdKCo/X8RfofbojqyhRZZ9bo4lnh5M
	uf6w013jjEwkj3pNX9puALXVz590Vh9BhHcWp0NujoxtXJyjyrYNzqcTwp77l+BW4f/EOYlpMBd
	RloaNmd0yDH2EPiDptQawyNoXIXg2p3hnW1gJ0JM7ITT3oAkiJg7yXg9W0mGKuGLo4U4L9YcHJK
	49js6s+KFuZo57kviyBaOThfHIplhTRn9z8IPNO+Bed6YAW43LXUEUhrS
X-Received: by 2002:a05:7301:259c:b0:34c:1ddd:baee with SMTP id 5a478bee46e88-34f14f15b5bmr5088173eec.2.1790995157517;
        Fri, 02 Oct 2026 19:39:17 -0700 (PDT)
X-Received: by 2002:a05:7301:259c:b0:34c:1ddd:baee with SMTP id 5a478bee46e88-34f14f15b5bmr5088149eec.2.1790995156860;
        Fri, 02 Oct 2026 19:39:16 -0700 (PDT)
Received: from carlv-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3510752b575sm7665736eec.6.2026.10.02.19.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 19:39:16 -0700 (PDT)
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sashiko <sashiko-bot@kernel.org>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Subject: [PATCH 2/6] accel/qaic: Replace transfer completion with dma-fence
Date: Fri,  2 Oct 2026 19:38:14 -0700
Message-ID: <20261003023818.1161666-3-carl.vanderlip@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261003023818.1161666-1-carl.vanderlip@oss.qualcomm.com>
References: <20261003023818.1161666-1-carl.vanderlip@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAxMCBTYWx0ZWRfX9Xw55OHKT90a
 kHBh/91p8KEj+6p0BCiMbAnHVJF2ibyp47hpvvHtb++tSk6YixPh/nZ1YJdezZdwbmhwIAp1xbo
 9uyxHy51xsWmnNZSLZHXpo0JF4JraeE=
X-Proofpoint-GUID: fAvbgCUcteYQH9fPkLhSkBwjNKBR84xL
X-Authority-Analysis: v=2.4 cv=UJZIjyfy c=1 sm=1 tr=0 ts=6ac06ad6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=MHz2CafV60DOkNvWHnUA:9 a=PxkB5W3o20Ba91AHUih5:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAxMCBTYWx0ZWRfX74wTQ15oW5j5
 rW2xgrtG9aURVJtxAYKrABWmz+dHUFDS032eiZ3tSKXu+e9zhQY3vLpHMqOU81HxyyKF11Ng1Ni
 Dy4xYOjymoPnzAhBlntiTJWX/q5ivFmf2s8ipV/I5OySg2Q7mIpExniPqPTN3ap/Hk2IDejSWe/
 wmOwzm6aqSIFCLRmDKxX9P2/BDw1wapxp5ypzkzSi26rlA5hArzkeAVHK0EdmJatXX6Uocunmjj
 d1n7xiLmOVA46rVKdoJsR49KRIIHQx1/KNl5ug59Ttk7ivEf2jFVOpSuKx/wtHkG8mCDQX++vXc
 WJ/3xoyzZzprJJb3OXIUSbK+9yThVbpIAJZpNowUawERI18C8SqPCOHO7qWY/e3WKGOjexO2DDo
 4ILTRcJfO+w0amPMG1db6volKUnIq5WJEpOvX2uXYaHu3WlxYXemL3rAk2DgmDLeHjJfcdNaM20
 HXT+iYHFh3CcuQ5SINQ==
X-Proofpoint-ORIG-GUID: fAvbgCUcteYQH9fPkLhSkBwjNKBR84xL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030010

Currently, finished irq work is signaled by a completion. This is
lightweight but doesn't integrate with other kernel buffer
synchronization.

Using dma-fences instead of completions allows for the fences to be
added to their respective DMA-BUFs which enables polling on the buffer
instead of relying on the ~_WAIT_BO IOCTL for synchronization.

This is also useful in preparation for the addition of drm_sched
support. Fences can be linked together to create more complex
synchronization structures.

Co-developed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Signed-off-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
---
 drivers/accel/qaic/Makefile     |   1 +
 drivers/accel/qaic/qaic.h       |  26 +++++-
 drivers/accel/qaic/qaic_data.c  |  84 +++++++++++--------
 drivers/accel/qaic/qaic_drv.c   |   2 +-
 drivers/accel/qaic/qaic_fence.c | 144 ++++++++++++++++++++++++++++++++
 5 files changed, 220 insertions(+), 37 deletions(-)
 create mode 100644 drivers/accel/qaic/qaic_fence.c

diff --git a/drivers/accel/qaic/Makefile b/drivers/accel/qaic/Makefile
index 71f727b74da3..90582b0693da 100644
--- a/drivers/accel/qaic/Makefile
+++ b/drivers/accel/qaic/Makefile
@@ -10,6 +10,7 @@ qaic-y := \
 	qaic_control.o \
 	qaic_data.o \
 	qaic_drv.o \
+	qaic_fence.o \
 	qaic_ras.o \
 	qaic_ssr.o \
 	qaic_sysfs.o \
diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
index 02ca99000e2a..4cdd6579aa89 100644
--- a/drivers/accel/qaic/qaic.h
+++ b/drivers/accel/qaic/qaic.h
@@ -6,6 +6,7 @@
 #ifndef _QAIC_H_
 #define _QAIC_H_
 
+#include <linux/dma-fence.h>
 #include <linux/interrupt.h>
 #include <linux/kref.h>
 #include <linux/mhi.h>
@@ -18,9 +19,11 @@
 #include <drm/drm_device.h>
 #include <drm/drm_gem.h>
 
+#define QAIC_NAME		"qaic"
 #define QAIC_DBC_BASE		SZ_128K
 #define QAIC_DBC_SIZE		SZ_4K
 #define QAIC_SSR_DBC_SENTINEL	U32_MAX /* No ongoing SSR sentinel */
+#define QAIC_TIMELINE_LEN	32 /* Should fit max sized DBC id/BO handle */
 
 #define QAIC_NO_PARTITION	-1
 
@@ -227,6 +230,16 @@ struct qaic_drm_device {
 	void			*sysfs_attrs;
 };
 
+struct qaic_fence {
+	struct dma_fence	base;
+	/* Spinlock used for initializing this fence */
+	spinlock_t		lock;
+	/* Name of fence context */
+	char			timeline_name[QAIC_TIMELINE_LEN];
+	/* Cached value of dbc_id for use in populating timeline_name */
+	u32			dbc_id;
+};
+
 struct qaic_bo {
 	struct drm_gem_object	base;
 	/* Scatter/gather table for allocate/imported BO */
@@ -253,8 +266,10 @@ struct qaic_bo {
 	bool			sliced;
 	/* Request ID of this BO if it is queued for execution */
 	u16			req_id;
-	/* Wait on this for completion of DMA transfer of this BO */
-	struct completion	xfer_done;
+	/* Wait on this fence for DMA transfer of this BO */
+	struct qaic_fence	*fence;
+	/* Current fence context for this BO */
+	u64			fence_context;
 	/*
 	 * Node in linked list where head is dbc->xfer_list.
 	 * This link list contain BO's that are queued for DMA transfer.
@@ -290,6 +305,8 @@ struct qaic_bo {
 	} perf_stats;
 	/* Synchronizes BO operations */
 	struct mutex		lock;
+	/* Callback to sync BO with CPU */
+	struct dma_fence_cb	cb;
 };
 
 struct bo_slice {
@@ -351,6 +368,11 @@ void qaic_irq_polling_work(struct work_struct *work);
 void qaic_dbc_enter_ssr(struct qaic_device *qdev, u32 dbc_id);
 void qaic_dbc_exit_ssr(struct qaic_device *qdev);
 
+/* qaic_fence.c */
+int qaic_fence_wait(struct dma_fence *fence, signed long timeout);
+void qaic_remove_bo_fence(struct qaic_bo *bo);
+int qaic_acquire_bo_fence(struct qaic_bo *bo);
+
 /* qaic_sysfs.c */
 int qaic_sysfs_init(struct qaic_drm_device *qddev);
 void qaic_sysfs_remove(struct qaic_drm_device *qddev);
diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 64bc3cc50d1f..3326d9da0e1e 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -184,9 +184,12 @@ struct qaic_exec_data_req {
 	int idx;
 };
 
+/* Caller should be holding bo->lock */
 static inline bool bo_queued(struct qaic_bo *bo)
 {
-	return !list_empty(&bo->xfer_list);
+	if (bo->fence)
+		return !dma_fence_is_signaled(&bo->fence->base);
+	return false;
 }
 
 inline int get_dbc_req_elem_size(void)
@@ -745,16 +748,8 @@ static const struct drm_gem_object_funcs qaic_gem_funcs = {
 	.vm_ops = &drm_vm_ops,
 };
 
-static void qaic_init_bo(struct qaic_bo *bo, bool reinit)
+static void qaic_init_bo_lists(struct qaic_bo *bo)
 {
-	if (reinit) {
-		bo->sliced = false;
-		reinit_completion(&bo->xfer_done);
-	} else {
-		mutex_init(&bo->lock);
-		init_completion(&bo->xfer_done);
-	}
-	complete_all(&bo->xfer_done);
 	INIT_LIST_HEAD(&bo->slices);
 	INIT_LIST_HEAD(&bo->xfer_list);
 }
@@ -767,7 +762,9 @@ static struct qaic_bo *qaic_alloc_init_bo(void)
 	if (!bo)
 		return ERR_PTR(-ENOMEM);
 
-	qaic_init_bo(bo, false);
+	mutex_init(&bo->lock);
+	bo->fence_context = dma_fence_context_alloc(1);
+	qaic_init_bo_lists(bo);
 
 	return bo;
 }
@@ -996,6 +993,7 @@ static void qaic_unprepare_bo(struct qaic_device *qdev, struct qaic_bo *bo)
 	bo->dir = 0;
 	bo->dbc = NULL;
 	bo->nr_slice = 0;
+	bo->sliced = false;
 }
 
 static void qaic_free_slices_bo(struct qaic_bo *bo)
@@ -1304,9 +1302,7 @@ static int send_bo_list_to_device(struct qaic_device *qdev, struct drm_file *fil
 			goto unlock_bo;
 		}
 
-		spin_lock_irqsave(&dbc->xfer_lock, flags);
 		if (bo_queued(bo)) {
-			spin_unlock_irqrestore(&dbc->xfer_lock, flags);
 			ret = -EINVAL;
 			goto unlock_bo;
 		}
@@ -1327,12 +1323,15 @@ static int send_bo_list_to_device(struct qaic_device *qdev, struct drm_file *fil
 							     head, tail);
 			else
 				ret = copy_exec_reqs(qdev, slice, dbc->id, head, tail);
-			if (ret) {
-				spin_unlock_irqrestore(&dbc->xfer_lock, flags);
+			if (ret)
 				goto unlock_bo;
-			}
 		}
-		reinit_completion(&bo->xfer_done);
+
+		ret = qaic_acquire_bo_fence(bo);
+		if (ret)
+			goto unlock_bo;
+
+		spin_lock_irqsave(&dbc->xfer_lock, flags);
 		list_add_tail(&bo->xfer_list, &dbc->xfer_list);
 		spin_unlock_irqrestore(&dbc->xfer_lock, flags);
 		dma_sync_sgtable_for_device(&qdev->pdev->dev, bo->sgt, bo->dir);
@@ -1787,11 +1786,13 @@ irqreturn_t dbc_irq_threaded_fn(int irq, void *data)
 			 * At this point we have received all the interrupts for
 			 * BO, which means BO execution is complete.
 			 */
-			dma_sync_sgtable_for_cpu(&qdev->pdev->dev, bo->sgt, bo->dir);
 			bo->nr_slice_xfer_done = 0;
 			list_del_init(&bo->xfer_list);
-			bo->perf_stats.req_processed_ts = ktime_get_ns();
-			complete_all(&bo->xfer_done);
+			/*
+			 * fence is put when it is executed next, during xfer_list
+			 * cleanup, or when slice is detached
+			 */
+			dma_fence_signal(&bo->fence->base);
 			drm_gem_object_put(&bo->base);
 			break;
 		}
@@ -1840,6 +1841,7 @@ int qaic_wait_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file
 	struct dma_bridge_chan *dbc;
 	struct drm_gem_object *obj;
 	struct qaic_device *qdev;
+	struct dma_fence *fence;
 	unsigned long timeout;
 	struct qaic_user *usr;
 	struct qaic_bo *bo;
@@ -1881,6 +1883,9 @@ int qaic_wait_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file
 		goto unlock_ch_srcu;
 	}
 
+	timeout = args->timeout ? args->timeout : wait_exec_default_timeout_ms;
+	timeout = msecs_to_jiffies(timeout);
+
 	obj = drm_gem_object_lookup(file_priv, args->handle);
 	if (!obj) {
 		ret = -ENOENT;
@@ -1888,15 +1893,24 @@ int qaic_wait_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file
 	}
 
 	bo = to_qaic_bo(obj);
-	timeout = args->timeout ? args->timeout : wait_exec_default_timeout_ms;
-	timeout = msecs_to_jiffies(timeout);
-	ret = wait_for_completion_interruptible_timeout(&bo->xfer_done, timeout);
-	if (!ret) {
-		ret = -ETIMEDOUT;
+	ret = mutex_lock_interruptible(&bo->lock);
+	if (ret)
+		goto put_obj;
+
+	if (!bo->fence) {
+		ret = -ENOENT;
+		mutex_unlock(&bo->lock);
 		goto put_obj;
 	}
-	if (ret > 0)
-		ret = 0;
+
+	fence = &bo->fence->base;
+	dma_fence_get(fence);
+	mutex_unlock(&bo->lock);
+
+	ret = qaic_fence_wait(fence, timeout);
+	dma_fence_put(fence);
+	if (ret)
+		goto put_obj;
 
 	if (!dbc->usr)
 		ret = -EPERM;
@@ -2000,9 +2014,10 @@ int qaic_perf_stats_bo_ioctl(struct drm_device *dev, void *data, struct drm_file
 
 static void detach_slice_bo(struct qaic_device *qdev, struct qaic_bo *bo)
 {
+	qaic_remove_bo_fence(bo);
 	qaic_free_slices_bo(bo);
 	qaic_unprepare_bo(qdev, bo);
-	qaic_init_bo(bo, true);
+	qaic_init_bo_lists(bo);
 	list_del(&bo->bo_list);
 	drm_gem_object_put(&bo->base);
 }
@@ -2015,7 +2030,6 @@ int qaic_detach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_fi
 	struct drm_gem_object *obj;
 	struct qaic_device *qdev;
 	struct qaic_user *usr;
-	unsigned long flags;
 	struct qaic_bo *bo;
 	int ret;
 
@@ -2060,13 +2074,10 @@ int qaic_detach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_fi
 	}
 
 	/* Check if BO is committed to H/W for DMA */
-	spin_lock_irqsave(&dbc->xfer_lock, flags);
 	if (bo_queued(bo)) {
-		spin_unlock_irqrestore(&dbc->xfer_lock, flags);
 		ret = -EBUSY;
 		goto unlock_ch_srcu;
 	}
-	spin_unlock_irqrestore(&dbc->xfer_lock, flags);
 
 	detach_slice_bo(qdev, bo);
 
@@ -2093,14 +2104,19 @@ static void empty_xfer_list(struct qaic_device *qdev, struct dma_bridge_chan *db
 		bo = list_first_entry(&dbc->xfer_list, typeof(*bo), xfer_list);
 		list_del_init(&bo->xfer_list);
 		spin_unlock_irqrestore(&dbc->xfer_lock, flags);
+		mutex_lock(&bo->lock);
 		bo->nr_slice_xfer_done = 0;
 		bo->req_id = 0;
 		bo->perf_stats.req_received_ts = 0;
 		bo->perf_stats.req_submit_ts = 0;
 		bo->perf_stats.req_processed_ts = 0;
 		bo->perf_stats.queue_level_before = 0;
-		dma_sync_sgtable_for_cpu(&qdev->pdev->dev, bo->sgt, bo->dir);
-		complete_all(&bo->xfer_done);
+		dma_fence_get(&bo->fence->base);
+		dma_fence_set_error(&bo->fence->base, -ECANCELED);
+		dma_fence_signal(&bo->fence->base);
+		dma_fence_put(&bo->fence->base);
+		qaic_remove_bo_fence(bo);
+		mutex_unlock(&bo->lock);
 		drm_gem_object_put(&bo->base);
 		spin_lock_irqsave(&dbc->xfer_lock, flags);
 	}
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index c1bb6db78d12..219f58fdfde8 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -40,7 +40,7 @@ MODULE_IMPORT_NS("DMA_BUF");
 #define PCI_DEVICE_ID_QCOM_AIC080	0xa080
 #define PCI_DEVICE_ID_QCOM_AIC100	0xa100
 #define PCI_DEVICE_ID_QCOM_AIC200	0xa110
-#define QAIC_NAME			"qaic"
+#define PCI_DEVICE_ID_QCOM_AIC200VF	0xa111
 #define QAIC_DESC			"Qualcomm Cloud AI Accelerators"
 #define CNTL_MAJOR			5
 #define CNTL_MINOR			0
diff --git a/drivers/accel/qaic/qaic_fence.c b/drivers/accel/qaic/qaic_fence.c
new file mode 100644
index 000000000000..ec7e555c454b
--- /dev/null
+++ b/drivers/accel/qaic/qaic_fence.c
@@ -0,0 +1,144 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/* Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved. */
+
+#include <linux/dma-fence.h>
+#include <linux/dma-resv.h>
+#include <linux/ktime.h>
+#include <linux/spinlock.h>
+#include <linux/sprintf.h>
+
+#include "qaic.h"
+
+static const char *qaic_fence_get_driver_name(struct dma_fence *f)
+{
+	return QAIC_NAME;
+}
+
+static const char *qaic_fence_get_timeline_name(struct dma_fence *f)
+{
+	struct qaic_fence *qfence = container_of(f, struct qaic_fence, base);
+
+	if (!qfence->timeline_name[0])
+		scnprintf(qfence->timeline_name, ARRAY_SIZE(qfence->timeline_name), "D%02u",
+			 qfence->dbc_id);
+	return qfence->timeline_name;
+}
+
+static const struct dma_fence_ops qaic_fence_ops = {
+	.get_driver_name = qaic_fence_get_driver_name,
+	.get_timeline_name = qaic_fence_get_timeline_name,
+};
+
+static void qaic_fence_sync_cb_func(struct dma_fence *f, struct dma_fence_cb *cb)
+{
+	struct qaic_bo *bo = container_of(cb, struct qaic_bo, cb);
+	struct qaic_device *qdev;
+
+	if (f->error)
+		return;
+
+	qdev = bo->dbc->qdev;
+	dma_sync_sgtable_for_cpu(&qdev->pdev->dev, bo->sgt, bo->dir);
+	bo->perf_stats.req_processed_ts = ktime_to_ns(f->timestamp);
+}
+
+int qaic_fence_wait(struct dma_fence *fence, signed long timeout)
+{
+	int ret;
+
+	timeout = dma_fence_wait_timeout(fence, true, timeout);
+	if (!timeout) { /* Wait timed out */
+		ret = -ETIMEDOUT;
+	} else if (timeout < 0) { /* Wait interrupted */
+		ret = -EINTR;
+	} else { /* Wait completed */
+		ret = dma_fence_get_status(fence);
+		WARN_ON_ONCE(ret == 0);
+		if (!ret) /* Fence not signaled yet */
+			ret = -EBUSY;
+		else if (ret > 0)  /* Fence is signaled successfully */
+			ret = 0;
+		/* otherwise ret already contains the error code of the fence */
+	}
+	return ret;
+}
+
+static struct qaic_fence *qaic_create_fence(struct qaic_bo *bo)
+{
+	struct qaic_fence *fence;
+
+	fence = kzalloc_obj(*fence);
+	if (!fence)
+		return ERR_PTR(-ENOMEM);
+
+	spin_lock_init(&fence->lock);
+	fence->dbc_id = bo->dbc->id;
+	dma_fence_init(&fence->base, &qaic_fence_ops, &fence->lock, bo->fence_context, 1);
+
+	return fence;
+}
+
+/* Caller should be holding bo->lock */
+static int qaic_set_bo_resv_fence(struct qaic_bo *bo, struct qaic_fence *fence)
+{
+	int ret;
+
+	ret = dma_resv_reserve_fences(bo->base.resv, 1);
+	if (ret)
+		goto err_out_fence;
+
+	/*
+	 * Add a fence in dma-buf reservation object for this BO,
+	 * enables buffer sharing across devices.
+	 */
+	dma_resv_add_fence(bo->base.resv, &fence->base,
+			   dma_resv_usage_rw(bo->dir == DMA_TO_DEVICE));
+
+	ret = dma_fence_add_callback(&fence->base, &bo->cb, qaic_fence_sync_cb_func);
+	if (ret)
+		goto err_out_fence;
+
+	return ret;
+
+err_out_fence:
+	dma_fence_put(&fence->base);
+	bo->fence = NULL;
+	return ret;
+}
+
+/* Caller should be holding bo->lock */
+void qaic_remove_bo_fence(struct qaic_bo *bo)
+{
+	if (bo->fence) {
+		if (!dma_fence_is_signaled(&bo->fence->base)) {
+			dma_fence_set_error(&bo->fence->base, -ECANCELED);
+			dma_fence_signal(&bo->fence->base);
+		}
+		dma_fence_put(&bo->fence->base);
+	}
+	bo->fence = NULL;
+}
+
+/* Caller should be holding bo->lock */
+static void qaic_replace_bo_fence(struct qaic_bo *bo, struct qaic_fence *fence)
+{
+	qaic_remove_bo_fence(bo);
+	bo->fence = fence;
+}
+
+/* Caller should be holding bo->lock */
+int qaic_acquire_bo_fence(struct qaic_bo *bo)
+{
+	struct qaic_fence *fence;
+	int ret = 0;
+
+	fence = qaic_create_fence(bo);
+	if (IS_ERR(fence))
+		return PTR_ERR(fence);
+
+	qaic_replace_bo_fence(bo, fence);
+	ret = qaic_set_bo_resv_fence(bo, fence);
+
+	return ret;
+}
-- 
2.43.0

