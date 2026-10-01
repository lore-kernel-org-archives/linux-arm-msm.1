Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98E24ED190
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 11:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852601; cv=none; b=cgCnXTj9nq4HBIr5DotEX/ZzaGXPiYwMcLka9Y2nRDZ30qpnHMay1tSADffX+ChrJlXyTged4ezcjqkwAEmBYrzKSDk1lEkEninXbKqPN0NLzrpjaLduu3lUmiWsp4hIZLP6A961zU07hNAzDPHkESUTHcPfKgSDU7HE44GOE2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852601; c=relaxed/simple;
	bh=Irbg1KRJzwIAxvvjR3DfaB2BoPb6tvFu8FKM+ikBDGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JIcrnErQY3Llf18ZSiVnIz2fAgtEzq5Os8hg/oncqbTmC4duj5JDMANBN+S2fD3EoKitCxXUbiiZzeZmcS+8yurFSBdobuiY9PWd9QD576h7cCbLMXwixHWzT8dM/S6W+PjQ3J+vd1fNW5jX/k6q/0FL6m3xRh5pTZRQ9bNdbcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jVFTJAne; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GzicWhAm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jVFTJAne";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GzicWhAm"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xRWp1289117
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 11:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GzMk85iZS5UHtjkiHXM8suSiraGPQ7MkLyLrHn8dGbY=; b=jVFTJAneaKXLp3gN
	JOTFWBpjlHOvnu6zdtWKEC6sI5re/Nj+fYmoC99Lo4xvRH6Hk/7SPc1rYo+iexkv
	dlGq9UKn2E0rwAWNs/k+5e+qSczDqtqo0R4EjunPrueIR45PUV90n6LXV/5tZYY0
	eoWPie4uIHD7Yhcn734HNVeTgK5v1KEBTXVzn+e6zXBCSEHRCoiw+xnOdFJQKBp6
	I8cK+RLiIcebqQZRvuz/CuCsEgcuLBCz0t2mHv+/Zw267TW4seL0JmtvJOIHDWVY
	rHCBIRhKD5KkaF0qyPcq8N0neyPpa/WkeHWASNP3L7i4AFwXdokmTKCvq1jKzNjU
	dI7aOA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17pjbme8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 11:03:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso5539489a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 04:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790852585; x=1791457385; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GzMk85iZS5UHtjkiHXM8suSiraGPQ7MkLyLrHn8dGbY=;
        b=GzicWhAmAgk6XeorAh4yEqi6GYiFVVTcLQkqqI/yZeSG9b6s18r6AKH/T7BU1ObnIf
         d0JXX8ymEWbZaEdge2nTdgsAO5ux//AvScmR//0Q3v26GG+/GkmkscJ5H/g8/TjUgrGx
         SfBuS+RKLg8ahi8fHNvftdmiSeUhChYsrrMqStL1OW5T/gjSn2azPemcT58Hhq4r5BAQ
         ZGVzjLmX6PHJhrfx7XtLBiYo6mkIhO0kVC5gkRc9CTCmhteDcdzWfrXOYuaz4kPL/SqN
         PzI4FEcUvUsMRXmfY1igR0r3MOlclmiMu0EIR7PJ00u+4TINWb3s0WXAqURD9L5fudJf
         WdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790852585; x=1791457385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GzMk85iZS5UHtjkiHXM8suSiraGPQ7MkLyLrHn8dGbY=;
        b=d3jUom4XYiF7GxH0JtwGTxnFZYsdjAbkHMUCeJJpDuI660M2PElyWwMs7pjzAQpEer
         WUiny+65h9RnnUgzxBT5w3tU7vVrKSBqNhF0ldUNwjNQF0MyQTo6BqZedHyXOyMvPOFx
         FzBxVC1t3QgVGaPG6IBg2LNvOL1TtRBJVBUuz3tr+DnI597QH5PfB5aR4jLTlSrTR2ss
         2qsKNgsDeZdylLXhcrCCMOeN0OV/V0m1QQYYZ0pQvRGvegyn6IQGll6EVLG0oZW42qjQ
         Titol2bNTKEdqUldDGYZcsZpzatb5VqEggL6iL09TfJqkSM71v8yUvg2PA3xKFp0llCm
         lwHw==
X-Forwarded-Encrypted: i=1; AKwUvBwofZm+hY3ea3KRy7SdmeFeLsOlx/fs/HLtlPo+HyVt/lK5JX3BMPhBZApepQfPEh3qbnAZyskp+o/DWF0D@vger.kernel.org
X-Gm-Message-State: AFq9FYI/b/MysBekRZSb1x9D6tZ1rwGXGNOG4cDnUcFz9QiHAqS7i10u
	eC+x7FtO+QaJGkpf9545+WiTdny5muW36qQ+6VZgaRk0hnV3Rbpq0NRnk9hJuKje50DlOg5MzaN
	lT+F3MoIM6SiQWBXi2XzWmpeobIMIuBIcra00EyMcpqxd0aiiOVU4kZIEhdMB2H5QQ9sT7rl3Bv
	bC
X-Gm-Gg: AYBFou21JCGVefwzK0XvJjJmn8QokjXO/NrWBI0417H4Jztx+VZvkBrgi5hUJFz0J0q
	MfHK+Evkn6tu1UlPHZCAuQQa13SiMO+jK55vV7CJLNWl+f6KY/RVnvJWdLWzCKyBhwFH6iKsDYz
	FKWks84lCswaEoyLsUddqT/PrVRmxkkA8ncJw36aUn0jP8LpvTmvYCf9U+9ttQBGLzF7lUIXiH1
	sI9mRuqZzUP+h9tpHmtfkHbbvAzH0Eva5ujDtKejDEkDIYlXkQnZSiNmclbQRS70AdhBceL5hII
	C2jvhrywvxwZkpGm+OxNkZuMxN3LTMUfPsR43dDVxYV9FhgOIp7c9zRMI2k1P+FqmzDly/Af3zd
	2UKWdydh4EGnMSVzp8dWdYvDwKA==
X-Received: by 2002:a17:90b:1cc6:b0:3a2:b04e:8086 with SMTP id 98e67ed59e1d1-3a4d193052fmr2530115a91.44.1790852585246;
        Thu, 01 Oct 2026 04:03:05 -0700 (PDT)
X-Received: by 2002:a17:90b:1cc6:b0:3a2:b04e:8086 with SMTP id 98e67ed59e1d1-3a4d193052fmr2530072a91.44.1790852584461;
        Thu, 01 Oct 2026 04:03:04 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f4371383sm4076810a91.2.2026.10.01.04.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:03:04 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 16:32:33 +0530
Subject: [PATCH v3 1/6] tee: qcomtee: Track the object invocation context
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-qcom_uefisecapp_migrate_qcomtee-v3-1-13df5c20c2e3@oss.qualcomm.com>
References: <20261001-qcom_uefisecapp_migrate_qcomtee-v3-0-13df5c20c2e3@oss.qualcomm.com>
In-Reply-To: <20261001-qcom_uefisecapp_migrate_qcomtee-v3-0-13df5c20c2e3@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790852574; l=5105;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=Irbg1KRJzwIAxvvjR3DfaB2BoPb6tvFu8FKM+ikBDGk=;
 b=39ny8Acn97VfoCc1oMYUGQxcyeUoP5ox7fMARAoQ4xQp8o4kXl9/TLfVA1ikwoIlaasgvufsj
 pI1M3P7V487BN615CT9z4QFt2W0uFLNamL9E5bXLXqyez5HA8sufSlo
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Authority-Analysis: v=2.4 cv=eqpKXYpX c=1 sm=1 tr=0 ts=6abe3ded cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=bFqmgcYAq-yHHMqQ97oA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 87t4q94WblVviamKWnO_t3mE3gEkPSzm
X-Proofpoint-ORIG-GUID: 87t4q94WblVviamKWnO_t3mE3gEkPSzm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0MyBTYWx0ZWRfXy4SqbPk1q7Ew
 94sOu4bJC3wbUjGMRgLV1SLY9cTWRVYBB8E2/Gim1zV9Ur9+4wyZaJlLMxfumxho6yy42wGMAay
 hjfKW2hh1gRJZrvLML2rT7TP1EWIqF4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0MyBTYWx0ZWRfX8i68cNbpp1jF
 TH71wn8QdaqlX7rXAJ/vK0aKs3ZHCyRLzKLavUjg3dIdlLCrWNj3TQ85I8roBwFtDg3KVu4Iruq
 VE55nGIHZSNFkHWN/qWoKryHLv1zfmjNOdBwIKds/AnvsHw7IOVRIi/kxzwykMp4NypzY2hZ9xM
 eI44w7jTgYgrIcxPCFxggmDfsfmKrZ7+piT5iBbhBgr7fZciY80qNX5vtGzlVKNkFvmksaia6Im
 24VgL4myXsOdV2avXY0EsEYLWQe8sdJSBVntmwQjHyrmStCxL4pvPMUk54fgZxYfNsHx1qGLzqd
 11ATkQtZjx4v5dRBWk8FrUGHseuNaztIaJ23mtNyx/LikycGbNAB7iA9rDYvqKiM3EyCn44O5Gb
 ZwU7IwfgyoL71XMWKeYFjkeW+6MqvxV8LZ9MBrs704zTGWRBiHW5g6ENDSlKxEu8PsX9ohe/4SQ
 AM1x4eAf2hUW416Cucw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010043

QCOMTEE needs to distinguish between object invocations arriving from
kernel clients and user-space clients in order to correctly marshal
UBUF parameters and decide whether certain operations should be permitted.

Introduce an enum tee_object_invoke_origin to allow clients to indicate
the context of the TEE object invocation, and add a kernel_ctx flag to the
QCOMTEE context so the TEE back-end can track it.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 drivers/tee/qcomtee/call.c           | 11 ++++++++---
 drivers/tee/qcomtee/qcomtee_object.h |  8 ++++++--
 drivers/tee/tee_core.c               |  3 ++-
 include/linux/tee_core.h             |  8 +++++++-
 4 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
index 4a597eeaf174..a0f2992c0611 100644
--- a/drivers/tee/qcomtee/call.c
+++ b/drivers/tee/qcomtee/call.c
@@ -393,15 +393,20 @@ static int qcomtee_root_object_check(u32 op, struct tee_param *params,
  */
 static int qcomtee_object_invoke(struct tee_context *ctx,
 				 struct tee_ioctl_object_invoke_arg *arg,
-				 struct tee_param *params)
+				 struct tee_param *params,
+				 enum tee_object_invoke_origin origin)
 {
 	struct qcomtee_context_data *ctxdata = ctx->data;
 	struct qcomtee_object *object;
+	bool kernel_ctx = false;
 	int i, ret, result;
 
 	if (qcomtee_params_check(params, arg->num_params))
 		return -EINVAL;
 
+	if (origin == TEE_OBJECT_INVOKE_KERNEL)
+		kernel_ctx = true;
+
 	/* First, handle reserved operations: */
 	if (arg->op == QCOMTEE_MSG_OBJECT_OP_RELEASE) {
 		del_qtee_object(arg->id, ctxdata);
@@ -411,7 +416,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
 
 	/* Otherwise, invoke a QTEE object: */
 	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
-		qcomtee_object_invoke_ctx_alloc(ctx);
+		qcomtee_object_invoke_ctx_alloc(ctx, kernel_ctx);
 	if (!oic)
 		return -ENOMEM;
 
@@ -648,7 +653,7 @@ static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
 	int result;
 
 	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
-		qcomtee_object_invoke_ctx_alloc(ctx);
+		qcomtee_object_invoke_ctx_alloc(ctx, true);
 	if (!oic)
 		return;
 
diff --git a/drivers/tee/qcomtee/qcomtee_object.h b/drivers/tee/qcomtee/qcomtee_object.h
index d5de02dcef3b..5f40617361fc 100644
--- a/drivers/tee/qcomtee/qcomtee_object.h
+++ b/drivers/tee/qcomtee/qcomtee_object.h
@@ -147,6 +147,7 @@ static inline int qcomtee_args_len(struct qcomtee_arg *args)
  * struct qcomtee_object_invoke_ctx - QTEE context for object invocation.
  * @ctx: TEE context for this invocation.
  * @flags: flags for the invocation context.
+ * @kernel_ctx: flag that indicates this context is owned by a kernel client.
  * @errno: error code for the invocation.
  * @object: current object invoked in this callback context.
  * @u: array of arguments for the current invocation (+1 for ending arg).
@@ -159,6 +160,7 @@ static inline int qcomtee_args_len(struct qcomtee_arg *args)
 struct qcomtee_object_invoke_ctx {
 	struct tee_context *ctx;
 	unsigned long flags;
+	bool kernel_ctx;
 	int errno;
 
 	struct qcomtee_object *object;
@@ -173,13 +175,15 @@ struct qcomtee_object_invoke_ctx {
 };
 
 static inline struct qcomtee_object_invoke_ctx *
-qcomtee_object_invoke_ctx_alloc(struct tee_context *ctx)
+qcomtee_object_invoke_ctx_alloc(struct tee_context *ctx, bool kernel_ctx)
 {
 	struct qcomtee_object_invoke_ctx *oic;
 
 	oic = kzalloc_obj(*oic);
-	if (oic)
+	if (oic) {
 		oic->ctx = ctx;
+		oic->kernel_ctx = kernel_ctx;
+	}
 	return oic;
 }
 
diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 1aac50c7c1de..30901390149c 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -701,7 +701,8 @@ static int tee_ioctl_object_invoke(struct tee_context *ctx,
 			goto out;
 	}
 
-	rc = ctx->teedev->desc->ops->object_invoke_func(ctx, &arg, params);
+	rc = ctx->teedev->desc->ops->object_invoke_func(ctx, &arg, params,
+							TEE_OBJECT_INVOKE_USERSPACE);
 	if (rc)
 		goto out;
 
diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
index f993d5118edd..bcb5418d6fdc 100644
--- a/include/linux/tee_core.h
+++ b/include/linux/tee_core.h
@@ -73,6 +73,11 @@ struct tee_device {
 	struct tee_shm_pool *pool;
 };
 
+enum tee_object_invoke_origin {
+	TEE_OBJECT_INVOKE_USERSPACE,
+	TEE_OBJECT_INVOKE_KERNEL,
+};
+
 /**
  * struct tee_driver_ops - driver operations vtable
  * @get_version:	returns version of driver
@@ -117,7 +122,8 @@ struct tee_driver_ops {
 			   struct tee_param *param);
 	int (*object_invoke_func)(struct tee_context *ctx,
 				  struct tee_ioctl_object_invoke_arg *arg,
-				  struct tee_param *param);
+				  struct tee_param *param,
+				  enum tee_object_invoke_origin origin);
 	int (*cancel_req)(struct tee_context *ctx, u32 cancel_id, u32 session);
 	int (*supp_recv)(struct tee_context *ctx, u32 *func, u32 *num_params,
 			 struct tee_param *param);

-- 
2.34.1

