Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E844052B7
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340618; cv=none; b=llp8hKElaxrhdcU1cE26ubN5WHZzBij96lEpIkP2Mg6XNEdnQqQaEFNcyJtG4E8l3f0zhk+U+0D7In/kO1rblft6pbwK7Yovmfm+Hs/gVBOmoJVh8o5jbZczPepmX3Pp5A02atHAMbgSyt5mMtTDi4tCnzW2F6PYh/SUuYdcrPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340618; c=relaxed/simple;
	bh=/3bqSJFB87g3YyDDP7AkU7aDRmxHIev5pH2eJsJSsIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DoB1FiLM9H5KB+aUjReX0wYMiSE8McNkjnYAJizzKA3CTJLAJREG9Dw//3+5P6yscYQqmO/AfKe+NLgPr67qbHT76WsW65thbwto7KhcEpyjXa/ZK+5azFB6sOSwIYEqtTMIJknRL3iRkdKDITD3kXgSoDmfhW3kUZROYNx9BH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BbAzXx1Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WFAYQjGG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BbAzXx1Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WFAYQjGG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF3Kdx2181957
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:56:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CCt/FUCHkSx
	E63Ah7s7mIN0CuS0Ln8VYXya9PKCt1vg=; b=BbAzXx1Yixt4o/EdlUKj+9Ws9FN
	+xbzwmhrIpr04/L4n58yeyn3GQuxF7Rw5dk+cRvJA9dX/btPccWhS4XevqbcP9yY
	rrncA9Uu14eDLyEM0pbaP1FAAy9AqVqs3PEOaGjSb2gqNoth81wdGv4TjHIw0AUb
	7Mp9RDTRJcuL/JvyZRWq2DMdtMQrihLdpazzmLePcuTU5vZrdwK8Urn44wUU927V
	YTfOoICggZ8JYn+Rda8VGRC5h6I/izpjns55w0Oq0blbIJywhOm6RT47+KUDFqb6
	/wji3TFHk5q8V85yOc7jojkRttV7IB1LQEHUyZ/G822d/wurG/9iw5Xbw3g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqhg8s4jn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:56:55 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so1277435a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785340615; x=1785945415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CCt/FUCHkSxE63Ah7s7mIN0CuS0Ln8VYXya9PKCt1vg=;
        b=WFAYQjGGie4Sjr89wXHx0ED8XRFBi+Aji6TBWXryGCIk1DnMLKnlU1zTHDvYGtNsbB
         J7GvaRBgjfJ+q2xpG+FydBEKXHId56OF1wW9B5NfHuCYMj4qJtjCN/hPijHzcyi6esU5
         KLotObvW33b34EgxLBOwNfre5Z5qQkgFvjY0Ky4ybAVakhekagNVgpOAWFGQ7BM59k2K
         rC508ShFB+6yWBC28vZ53P7tAexPLFfo4CfmULxXX8UQdBW1qj1QZwLTCkjbCrNUy2ka
         sSqWMP7M9ZLcp4pbEyIScQgHQxLVl9MAHrQ93CNeGmZH58Ct5AlNhpHDEV4zI6G/ZZXB
         Qj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785340615; x=1785945415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CCt/FUCHkSxE63Ah7s7mIN0CuS0Ln8VYXya9PKCt1vg=;
        b=QEs6y3kX9aQmOdRhuhbfVNqwoLifqGLVimrxT1acuN5KQk+Rxt+L8FAEYzdT5X4fe7
         lrzoJkxKclRs30GZF8EzXAVd5drqkL7uUZEpllbiR66rkg4EfAa0cncqd6o3TkhM/nC+
         OnxvOGsij4jwt4D9s65vKlQXpjQM9dsIoTBfUtIUHvy085rHfnmzuwCdLr4ritF/ptxA
         TrARZN03bJQfPKozgHWarWzne8SLX27ZtY+FrAEN24u8ykb6r/a8IPPWCZfQ5pqFgy+D
         J95v2P4AnVrp3jf/930DhCpg7TKSBP8HpWEqboZCiRBIbLNxUcVdzXHHNNtFpC5hFm8C
         X20g==
X-Gm-Message-State: AOJu0YyP1yANdwsOJZ3I8DRXiQ+qyH2hJ+DHnnH1d61b6uTAYD/zTYeV
	1lSvMWS7fiBPA10mvRbKKBq2rudhV6yGxgoQMKFXP+DisjCLJ86hxiVY6bPAUZsxcVVl3vQPBeS
	rqHf1t271Abtw5CpRD744EsgjJsKXcEhWQwDHG2fuMDThzHw9yYQSB/kglr2C9wgyjopo
X-Gm-Gg: AR+sD10LPyyJSzIW/gl7gf+3KiMB01oSiVJL3RA1GK2NSBZQ0/hiCgJMpEXEh2eKIKw
	hnLrObDEQhjC5YaCY2oOjNeM74LfRN0DuBbTOaQejOwW7Cx2w1SN+haABR0TJgi9/0ZeXhe5g0w
	yfacyfptDPueARWLAXHW0fGizDLhQTI6RUnm9rcrBLRuyo08A4uMcSc4r+bAaKO7cSn4R919nXu
	fompW1w+CoJHlqzw2qoM/trCoGOm5OlNOzqxeip1bxiXszEHKQtjsKh7aTko7Q6TZCAl1AbI2Sg
	h4FaQiUf5dEDEbtP7+c96ZfgvnAiYwGzLPQ64+Tqb6eGDeesKO6rYkue8hwgL6SDjgGVgmyYsnS
	U+XnqtyvUgT2O1Oj87ImzDzIOHgER12TXicVFCNQbEYjn99M=
X-Received: by 2002:a17:90b:258e:b0:387:e0db:bc2c with SMTP id 98e67ed59e1d1-38f6a422e25mr7851758a91.34.1785340614581;
        Wed, 29 Jul 2026 08:56:54 -0700 (PDT)
X-Received: by 2002:a17:90b:258e:b0:387:e0db:bc2c with SMTP id 98e67ed59e1d1-38f6a422e25mr7851733a91.34.1785340614131;
        Wed, 29 Jul 2026 08:56:54 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f7f2b690fsm1637860a91.13.2026.07.29.08.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:56:53 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 02/17] drm/msm: Rework queuelock
Date: Wed, 29 Jul 2026 08:55:39 -0700
Message-ID: <20260729155609.20190-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729155609.20190-1-robin.clark@oss.qualcomm.com>
References: <20260729155609.20190-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfX5MddreGlBoo6
 gIteT61kxXip0aon6SfAcczEe3I1j6E6LXugG0HpP24pq2zsSnw6DUIY8ZdKWmoBtIxGk6mQlkM
 BxhiAciPaoU9eNB+sJjunslxZrw8e48=
X-Proofpoint-GUID: zJPbAJGBPBfg5w85Sd4sLBAAWPKVcdmU
X-Authority-Analysis: v=2.4 cv=LOdWhpW9 c=1 sm=1 tr=0 ts=6a6a22c7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=2F56w5eUDQPWH_qpgLoA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: zJPbAJGBPBfg5w85Sd4sLBAAWPKVcdmU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfX0hsGVLdXtf/C
 5v6bcsGwz7cZiR4KIymnMsNLu+8U3f1XNo2jYS8olM5k9TlOqVB2MwS3UW6gHbLLYDfsF0JjYOZ
 0fNR2D3YPetub+8vDFTncjRkr6FPXHQQD4H724/A2wvQywDrblO2hk5DNMaggW6SyVaqMrJyKzP
 8CrUm9+7OALSral3ikCaihytslE1d2lqODGKg84oxyrfGeZZLUtsJD/ZHVymqBcfCL3ECMoui5S
 O+NF9Z3ZZ2MqsgxACO1naKGHcnvM7b1MNMtNWPHBUgMRTLS8+HgJVk3U2zNwFUclaljB6hUgQMo
 Qbai1PKJrphejXAyI2BFQyuYYrKKvis5A3Ljb0gqG/DkUfid0O39miuhB5J7roDrq52r3pCPW4F
 QHSx+MBJKOuSS8r6f8+IQa7Nm8+wTN6MT33jbpNYhYOeJvit+tq8OK0Wl0X3VUuAO304SKC+iG/
 W5vXYlQJg6QkE2sOOYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290127

Rename to ctxlock, and use cleanup guards to manage releasing the lock.
This will let us re-use it for other per-context read/write serial-
ization, such as VM creation.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c         |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h         |  4 ++--
 drivers/gpu/drm/msm/msm_submitqueue.c | 14 +++-----------
 3 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index ec88155e0ed7..384f32f4d0c2 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -251,7 +251,7 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
 		return -ENOMEM;
 
 	INIT_LIST_HEAD(&ctx->submitqueues);
-	rwlock_init(&ctx->queuelock);
+	init_rwsem(&ctx->ctxlock);
 
 	kref_init(&ctx->ref);
 	msm_submitqueue_init(dev, ctx);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 6c83b8cbbb90..d27d54bdb7a7 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -392,8 +392,8 @@ msm_gpu_sysprof_no_ifpc(struct msm_gpu *gpu)
  * struct msm_context - per-drm_file context
  */
 struct msm_context {
-	/** @queuelock: synchronizes access to submitqueues list */
-	rwlock_t queuelock;
+	/** @ctxlock: synchronizes access to submitqueues list, etc */
+	struct rw_semaphore ctxlock;
 	/** @submitqueues: list of &msm_gpu_submitqueue created by userspace */
 	struct list_head submitqueues;
 	/**
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 1a5a77b28016..8b5980d5a6a7 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -93,18 +93,15 @@ struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_context *ctx,
 	if (!ctx)
 		return NULL;
 
-	read_lock(&ctx->queuelock);
+	guard(rwsem_read)(&ctx->ctxlock);
 
 	list_for_each_entry(entry, &ctx->submitqueues, node) {
 		if (entry->id == id) {
 			kref_get(&entry->ref);
-			read_unlock(&ctx->queuelock);
-
 			return entry;
 		}
 	}
 
-	read_unlock(&ctx->queuelock);
 	return NULL;
 }
 
@@ -237,7 +234,7 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_context *ctx,
 		return ret;
 	}
 
-	write_lock(&ctx->queuelock);
+	guard(rwsem_write)(&ctx->ctxlock);
 
 	queue->ctx = msm_context_get(ctx);
 	queue->id = ctx->queueid++;
@@ -251,8 +248,6 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_context *ctx,
 
 	list_add_tail(&queue->node, &ctx->submitqueues);
 
-	write_unlock(&ctx->queuelock);
-
 	return 0;
 }
 
@@ -335,19 +330,16 @@ int msm_submitqueue_remove(struct msm_context *ctx, u32 id)
 	if (!id)
 		return -ENOENT;
 
-	write_lock(&ctx->queuelock);
+	guard(rwsem_write)(&ctx->ctxlock);
 
 	list_for_each_entry(entry, &ctx->submitqueues, node) {
 		if (entry->id == id) {
 			list_del(&entry->node);
-			write_unlock(&ctx->queuelock);
-
 			msm_submitqueue_put(entry);
 			return 0;
 		}
 	}
 
-	write_unlock(&ctx->queuelock);
 	return -ENOENT;
 }
 
-- 
2.55.0

