Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395196;
	b=MzzAGSzW7e9/7FW/9ZQAUQjHn2UQDceKdA93omevIwGHfvQERtHL12GIV/SXerVHBpqX
	 4r5Io1TJV27917yCaQbxZVUOUkHfdeNOF9Swd6HbSFzDtoheCSjG0W7tS5m21R5isT9QU
	 YcMHPTxWhrxay//nHm+BZg0zZLcW54kaLidq6Gw4Zx5zHY2V30F6OP0ZBhgRRjIjbBI3E
	 raddhkRh2W9MEPLvZaV67vYmWaxR1B7nTVGpTXtfufG7KgAWMhZrNMcBzXkCmbP4Z31oF
	 Fh3Cwgh8Xx8oZOlmxrT4WVSmoNkTzxA5rWo5NHthYGK8AWxxeNeg3VWNsH5q+dyhiLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395196;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qxjIA7KASQhGhn46iliBMgwf2sYMP5ZuywBwiiD60Wc=;
	b=2XV+XHOC+XNkUgxKCyp/GrS3qnFwB2jzDaEdxZvm6ub39L2W2bGZm8rw4ZIgUlW1Znj/
	 rLwcUGkCvuJZw72F2KhNDNoL2DlGbEFfyl8XOu5ggWksJItpqGJNSAns1we5en0axWv+E
	 gHq/BWF2CDb6M0GfxUuxsUDSVSvKEnTAZHFnud9xb3banfVjU4yI+SwnhYT2wOELRbKLk
	 v73ERIUJZiknVHW0zHzkKx+b1SYSrn7BM+vsrM6t81xkub8YJvtC3Q9xsTq7RmD9gGOPZ
	 it82gtJGgAIiAudmXI3JIW6ZQZrDTbcUmgzsjS717GINJXut0VpH0tdW/1Ndd61bIaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GcWSIzdl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FCmqv5OO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F76A60A5BDC
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F76A60A5BDC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GcWSIzdl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FCmqv5OO
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULJ9Eq254815
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qxjIA7KASQh
	Ghn46iliBMgwf2sYMP5ZuywBwiiD60Wc=; b=GcWSIzdlPZ3On+CQgsWhHT4B8Qp
	RCegYtt7nTlBGo4L2ZgKWuHEwyQ9Ii3VroLy9hOaJFdpUL94slVibfGE2FsEqsL0
	rjC7VIj0y0rHJR3gdhdKzLXyz6/4SD8o+UcERsMLDcOk+SprAnpt3vXzL7il63SD
	ZcJcttP1XNPXWfiDYN1uBdHJTsQsfJFajvoXoNXX9Wvk1gRpIa5PvkE+9u/VLrEm
	FwBzLS9fSlg00wyIfZjSG4Ylovn5haaSx5+QScSYKsogs99DwMcItaviUwckejio
	c67Joyy05q8itkFUBXNGotqDPEbu3NF0C6yunxDu1PhlRlzc+oqWSdPaxNw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x001bk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:54 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd5ca3840c5so1206652a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 14:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395193; x=1793999993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qxjIA7KASQhGhn46iliBMgwf2sYMP5ZuywBwiiD60Wc=;
        b=FCmqv5OOn92YMnKFuWbewj7n4VX4hXTc0bPDfvnhiBcn9Hwn0HtBGFrihmtXuR9cPh
         K6WrAGHgp4HLZc4UZrfRHo+Bo4YFsql/n3FoKEKmm99vzbA6BKvEIUIbY87TGz5Jzp6W
         ODiF6EJjGiEZ1qqE1xMCjPO/fysyNwAJTizeRBvNAFa25wbry4ZMw3rr/qaF5kWKj2bD
         WttTwUOqzH8DAh2PaXYBpuhz/GFj+yJGMX9xjG+ElF+mRgKVGxznZYZHD89/5NxYness
         s3ubtOMZEa86duL8nPeV+I1TnTvqfSXO9eOPNX1LETR1j/UBBJeUqt1kDb0B/cFlGl4w
         tp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395193; x=1793999993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qxjIA7KASQhGhn46iliBMgwf2sYMP5ZuywBwiiD60Wc=;
        b=wMHScKyvzlasHVyPGTh1dHYsVVT29H6gmJYDfiIs4KqjBeJTQxOBM8djGCvA/EgFQ2
         y7hs7JiefiDqA0GaR1aBowlrdQkXy22mx3c/XJWQqaIGesM7EVwly1BJ6tAzFGKf5OSq
         SFFfuV1+jhyB9+1ccl92akoJm1gYLaEL0wiFuPilq5mP8tfRz0/TUMEPwSPo8ENjktS6
         +D271tHvkm5XTxkThYrVtJa2rF0lqYJ3BiCuCJuA2AWCaNB9+LQRWqhE0M6xvPuov2CU
         ipRFHZ4MyetslaJutyysD5nDsa3iUqnqkrAelnqFqmtvG+gCkt5CHRpp545UxSt5r6Kx
         QCsQ==
X-Gm-Message-State: AFq9FYJ6jo3Fhex6ZIhYBV+ZCpifjTmL+PjrgAxGAGQq+q8G63LyQmoA
	qgId7jMJWYIiYY5gQH1SihaeGGCG18dcduCOKe4PtXPtaks/SrQT2Df2gnL4SNd5NjpmXPejSaC
	fQwEV21zwlfSFo7yy4wILnSO0Rq1ohj+/UZCDmBVjXM2f3/1d7dIbqAi8VEoGGuDy9MkA
X-Gm-Gg: AYBFou1swRWC9oJJcO8y+R/x/92Pq0S3sUWSgYARuAcGd6wYuuZv5lkocpxOd1drQlk
	aeMFPDyWGpSpK8oglSXoeSp+mca+ovNK3z1wvbXsFwtMteP3qbbzOhC19qQ4/gUmHtr0QCvjHjh
	uFPocL5W0sIVdp+phQSlPUiwdqk4jRG9OtyzHzvzshgJx5R9MxvU91VERbFwoaxNSCXMmes5fcm
	AZWP5qba2nvXzfQZJZqrm/4IxsHCOIt5TEY05SXDuusDjm+zkqC+EFZhcHw/xntv8WbFFeB1WIA
	7IEZwCmUhPZZPWsjFYGBQja0T6Sz7adQNuxq3i0Z6BGpWxAcpmw+1RPR5XEEuRJlMrNt94Fboed
	uTvGFt5Z+RDiMaShtgE46Ajhn5RZWK/NXkb2g7kqXc7EVy/lEVNlDGoSSsgBxYnE3FdwuCXzIAS
	ClNOVSLJMvj6ps7yKqxbSm1Wc=
X-Received: by 2002:a17:90b:17cd:b0:3ac:b7b9:6471 with SMTP id 98e67ed59e1d1-3ae8987a7bfmr2897301a91.65.1793395193367;
        Fri, 30 Oct 2026 14:19:53 -0700 (PDT)
X-Received: by 2002:a17:90b:17cd:b0:3ac:b7b9:6471 with SMTP id 98e67ed59e1d1-3ae8987a7bfmr2897278a91.65.1793395192916;
        Fri, 30 Oct 2026 14:19:52 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845429e6sm5310288a91.6.2026.10.30.14.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:19:52 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 10/19] drm/msm: Add cleanup help for disabling IFPC
Date: Fri, 30 Oct 2026 14:18:12 -0700
Message-ID: <20261030211928.45761-11-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
References: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfXx4DL4oEI95JC
 elvj46GXtJFkwP1R5ovrOdjXyt7IiQNh+rDeyakTOSxGMhby4/IfZoaKIKIK7sefcESxcenKneL
 ODZ03ILcPum3bmcamjHLMuCLhlLCxXg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX8DcU8xkbtGV5
 VC/kgucfHc4svdxSwce5/OxCl/MSdVQFxIoaPPbjWHxTjQPK5xxLsttluZNVLByV6+Xhl49271K
 TGMInxzKt5ut51aVtlmzBXQQk0nPmoVKvXxhUxTcp82fJuru+rVVoFvuPrxBoqGHRHQ1ZBb/AT0
 ehKj8J3hZ6c5t9HBvBjQXmZ9fEPVNxoIpYRAOwiLyRTquruVfERF65C3Vm7F5TgbQcw0il6pYMc
 RRyNX//mPTn2gn3207pIwxdVQ9rEF4ORlWAB2EidDyPWWJWvcFf4D5iKdoqbAHINr7QAjHpodIR
 VPZd695aNx4AyaZ9cW3zkCcAnGEIhdbx883JRD/9VRxwYtCPl9hXTpDtMVIOvOOfYk3IkuMB3NO
 7ra6hpmoaTG1drjNmpRS+tiz6WWzlw==
X-Proofpoint-GUID: xNOirk8bT6SYb0zqkLZeNhf3EiNnO3-n
X-Authority-Analysis: v=2.4 cv=FcSiV5+6 c=1 sm=1 tr=0 ts=6ae509fa cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=vTD2gfctXtM-Q-VHBdUA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: xNOirk8bT6SYb0zqkLZeNhf3EiNnO3-n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2610300085

Simplify error path cleanup for IFPC-disable critical sections.

Note that this moves where we re-enable IFPC until after the
wake_up_all(), but that is harmless.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu.h      | 4 ++++
 drivers/gpu/drm/msm/msm_perfcntr.c | 7 +------
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 2e1b1bea37ce..4e18c2427c69 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -381,6 +381,10 @@ msm_gpu_sysprof_no_ifpc(struct msm_gpu *gpu)
 	return refcount_read(&gpu->sysprof_active) > 1;
 }
 
+DEFINE_GUARD(ifpc_disable, struct msm_gpu *,
+	     if (_T->funcs->ifpc_update) _T->funcs->ifpc_update(_T, true),
+	     if (_T->funcs->ifpc_update) _T->funcs->ifpc_update(_T, false));
+
 /*
  * The number of priority levels provided by drm gpu scheduler.  The
  * DRM_SCHED_PRIORITY_KERNEL priority level is treated specially in some
diff --git a/drivers/gpu/drm/msm/msm_perfcntr.c b/drivers/gpu/drm/msm/msm_perfcntr.c
index 7b4a6e49d3a7..995857273aca 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.c
+++ b/drivers/gpu/drm/msm/msm_perfcntr.c
@@ -259,8 +259,7 @@ sample_worker(struct kthread_work *work)
 	}
 
 	/* Inhibit IFPC while accessing registers: */
-	if (gpu->funcs->ifpc_update)
-		gpu->funcs->ifpc_update(gpu, true);
+	guard(ifpc_disable)(gpu);
 
 	if (gpu->funcs->perfcntr_flush)
 		gpu->funcs->perfcntr_flush(gpu);
@@ -296,10 +295,6 @@ sample_worker(struct kthread_work *work)
 		}
 	}
 
-	/* Re-enable IFPC: */
-	if (gpu->funcs->ifpc_update)
-		gpu->funcs->ifpc_update(gpu, false);
-
 	smp_store_release(&stream->fifo.head, head);
 	wake_up_all(&stream->poll_wq);
 }
-- 
2.56.0

