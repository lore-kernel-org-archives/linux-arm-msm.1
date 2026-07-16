Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460F43246E8
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 20:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784232957; cv=none; b=R5cfs68P3+odfhCP3qcuSVb8rHAmRnTZrnTNTJB4x2oApsuxarV8oHyc7tnbkgwXzHJboVegN55Z5HZMqOS41NHmE8FYSGnscfuf19yIbNbDGJG85CEVrSVXtjZEIBHfEMxAqiSOPzlqQlD35SuLcANYX/ukysIddWXClVAupoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784232957; c=relaxed/simple;
	bh=/3bqSJFB87g3YyDDP7AkU7aDRmxHIev5pH2eJsJSsIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hvKD97Y24DW+3UJXCWNbD18nb2kSFG4Ya3e9i/PS6vWK83Y22ir25SvSLc7onth23doHhTxXuo89abBCF/+wcQWA7V1QQTRPwZdx9KqlsRtxed8sdF1MucOxOGlTdHpU4VNU9u/3YGHYjUR1vJ9aW+5PKpf++uyVpHmD1q1X4is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MSi/7gll; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FAKCKaED; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MSi/7gll";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FAKCKaED"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GJoc4I3791887
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 20:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CCt/FUCHkSx
	E63Ah7s7mIN0CuS0Ln8VYXya9PKCt1vg=; b=MSi/7gllwQIi/Vxt8re6OlFaTcy
	q7m+gYPXopRP901Mgi5XxnsuhUPFqrLlinUDfQR+Bbbp5BHEyA+c4BfDK2cwvduG
	x6hL90CsEIakgL2ciL0aGpP2OR+wx4sK1dTDMzE81zm4I9LeUT9P23PdI6YAuF0f
	bC0aKe6UACPBGbVFl65CSQAXwx0PqJdRYcwK6KMaAl981Fz0FaTNNbzbh1/stAQD
	QIwhQ//Rt8bjoD2GsY6ekmuYOhsWD6dDkk4kzjExXkM1/I4uCYhT9/K9t8d5DuDS
	M8ftW02xfW5LUTktrz/lSlecVId6uAvHJ0/mzIFllX4szykXI7Y71uGmESw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feve1tyqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 20:15:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cee1ec30f2so52302545ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 13:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784232951; x=1784837751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CCt/FUCHkSxE63Ah7s7mIN0CuS0Ln8VYXya9PKCt1vg=;
        b=FAKCKaEDrt0RcKhrpVdV8eUH1PWSZFCH/UIcrFelNCoC0/g85u8AV7DWIAa7Bu7GcL
         Ppy/p2p5fjAHAcqF6dsM6FYb6w4iI4N7smTATzsH3MR0Ydr1LyuplgAfxZQXBQ+8u5di
         3+qebWAMGHXut/eTjClgKCAqaImHCrKSRwy1EmvR2DHL9U8lp6rDWoobn3rGbgdYPGv9
         ctBPkFo3R8VYg9T4Deuyygsda1nQU744klHvSRlYEjA9Hq8CkMLFDuywhMR+OhlUp/ME
         Xdp3+CxEDwtr/cUSUQcwN162fKwRcuN8OB2xwg/kW+0XkeCxnNBgqjdpncJeH/YgLSJ9
         XgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784232951; x=1784837751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CCt/FUCHkSxE63Ah7s7mIN0CuS0Ln8VYXya9PKCt1vg=;
        b=XaOcNpyzFG/kzHvd//dEHAsumGOXyNpzdrdowjMY+7Kq2/9803CejOQ2UGj+X2L1Cr
         B7bRZ4SCZRAuK/tbbx1zpReZmF1td4IRDtEC/HYMAb+qzBKpBy47KGuhjiQ2nYYwSg8D
         RFkJZzPcaomjZZwI5UxKHv7/LnmzEdngKPrGILIFNepy61SCjWp75EQXf1QilJPX4MMC
         +aCx3ndMH/WqgW9onmlgiZ5INx21dAADgZFpVCoNTi37slWBG1E39ch7P4kMcX8MNEAj
         wLtng1K26uQo6E4fJCrEevQNNkNCHTYX0SSZ/5Fp/5YCepWM0XOHauaUNJpEi20SC95I
         q7dw==
X-Gm-Message-State: AOJu0YzHlbm9uX4AaF+9XxpgwKwUd3NNRu8Kus/L1txyEd4oImzxs+4c
	Ap71qqCJYygsb6bi8feFzdIDkIK1OF6Qjrt8p3Jvfx+MgMv6ByzHIuGSHX8qcLoEBKfaOk7ttSe
	C+LuBs+36tkb3knDuqIf959iJrH89GfMqYS2wrSJHdfoMptMwkytVxBHWYKrkWA2XX4j2
X-Gm-Gg: AfdE7cnoTPbudUaOBW8qLPRwMLFOBY9Sa84PDZJx+i9/gPG4TaGf0Ym9uVHigY7ySCJ
	tXL9vbfriZX7QMmZyezIq8Clak4s2lKsJfwIzM9GsXtvYB//fcYLFLDKoygK6gqq6SY6FwEbqS1
	p3D8jd3SuAmsaeOeVk+iSnVGh9VTehp55fSkq8QrXAnmEpsGz7KUJgNbtLc9qH6IljHavAcWFTq
	fwkPzyPCZjFXzHJwcm44D3LRO8BQa7Kt3iNFb4OVUYSQddgV5ctix+9pr1of7WQxrQ5dqEuZg/f
	aIWGq7cy2eB748XQyX2N5JP0qb1kfkWR+mbVD00RNJV57DZVZQ8STGa8AWuvCJ7yHQ79ZsBpDjH
	i3H6YPdNWjhG60cIPkGIHD9Zu5tqzVCa7jf7HYGgfgIzJSBk=
X-Received: by 2002:a17:902:c405:b0:2c9:e5e6:8621 with SMTP id d9443c01a7336-2cf2ec21900mr10315215ad.25.1784232951445;
        Thu, 16 Jul 2026 13:15:51 -0700 (PDT)
X-Received: by 2002:a17:902:c405:b0:2c9:e5e6:8621 with SMTP id d9443c01a7336-2cf2ec21900mr10314815ad.25.1784232950968;
        Thu, 16 Jul 2026 13:15:50 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1015e45bsm25492355ad.33.2026.07.16.13.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 13:15:49 -0700 (PDT)
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
Subject: [PATCH v5 02/10] drm/msm: Rework queuelock
Date: Thu, 16 Jul 2026 13:15:25 -0700
Message-ID: <20260716201538.365824-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260716201538.365824-1-robin.clark@oss.qualcomm.com>
References: <20260716201538.365824-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDIwNiBTYWx0ZWRfX13fFTLqyAxH2
 bI5va8E506EmVv4OjgwvfHRmXxAP+yRRUzdB0Qm6S4ER9vooU/Yk6xMMYmJ4JzKP0w8Yksvn5BV
 zH69ShbJAXuezHBwRqf5z95TaaT7jn+IaHcxnITDGEZvEJsnAdrWEdPJgWsVulfZqxrWIPZ8GNJ
 KWlupPg8qUMICWrJLwzn63cORKD8HJqC84NzNm8pu4OjaUSqF78Vkq9c/pKMQe82hD0Psrc4JPF
 +e4MAiImE++1AsRr1q1cmsv4je4JssXLKZiZWt7TUf4PgkIbA4LLXSjOcU64UVCGq4pokbioX4G
 tb+F09qpFUI7mLe8rQXd8I2ZyLkH2J9ElLMrOoMnaZSXKbNo4JaxbskHwRQTh1Sv5AFDxyBEpo9
 2JLiPusHUNRP1GjatQ1eVoPJjGJYBV8mbI1FTQSiF/1MUimUZ482bjPHPl/dDkOJMklU2XsMWc1
 Brr7kem8KhLYJkliw3g==
X-Authority-Analysis: v=2.4 cv=DvpmPm/+ c=1 sm=1 tr=0 ts=6a593bf8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=2F56w5eUDQPWH_qpgLoA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: B2x3uHwRp6sHIsHgJLqNhUv4uEOF7CsR
X-Proofpoint-ORIG-GUID: B2x3uHwRp6sHIsHgJLqNhUv4uEOF7CsR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDIwNiBTYWx0ZWRfXzHEiqSBXoG8o
 JH4ClRbnUlGS8Kw3rRVjcDBPOP7vvm6iLdEQmuMtBFBEjNYOmPXWWq9QDrODvKEsj1ccRtW2xPC
 RmulOv9E4Lzb0z/+5uEIopRO9xjN0J4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_07,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160206

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

