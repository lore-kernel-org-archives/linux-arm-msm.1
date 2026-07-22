Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2C73C109C
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784703583; cv=none; b=JRz7NZmALJvNMDCSUQLOvF4nAFVLIuHWZq/zmRAiPNraAOGlhskD02+aiUr78H8YBkOPRjTZWBw8XiITTd5An7bl4eKIOGfrvbWs1ongIs8isFG/LpRmNdZoA5pASb5oUwKBovfmu/n5HOE4CvswZuAV7V3NPa5GBpnyOFuESDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784703583; c=relaxed/simple;
	bh=Uq74hKAscOJpoTlWbeJLC+5TbwItuETl2mqfiOIyB/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y2RDNSDgegHCIQHC3IfT4XqIrhMowklOLKtrEct/kwHIFi0BCiZ0OE4fGemIoVKEnRJB0dzDATD37MQkxpQxRUCwTcPmRmXEpPxkpwqoTXYaEPjyjpaUrsvtlssny2qjwwhtdqLTUGBG7yNOvAMULqFDQ+4fH6xGL3RXC62rBV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K+M0kxUY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WGMbCRn6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K+M0kxUY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WGMbCRn6"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M545OO3663354
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:59:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	saoDSDdEuqFBR3Jg2F/u3iejFckYCh1dzz5cbtTO9NU=; b=K+M0kxUYU0m3W+AF
	bXsV/ySbeQfAVDHn9IzibpPhNyrPlopAQnguasY9QOag13ySP129KQMX0UKv2iF4
	hY+u+mgDsH1b2OxubxfRjtOatCAjfdofM/0ceqQ4ZfmLLjTEaltQc9ayhZwb+hOo
	oI9BwqCLAXXuPC2ul5+v4JrWNkfbJoCnBMOGzzW0RJtlpru7t6Egn1dkRLZl9iAZ
	1Mwfk4qqrWmhy/Xw20u4JU6rGZRveZSbJU3DLcW+xHRlORt+nSDt8Axw5mCh8YBC
	GVSenSiUh93Si/ZroftHKkTGkAWh5N8hRDBD6rIpK8IvSgRZKo+s/Twin2TmN0td
	Ix9cmg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd5e2nh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:59:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so18925328a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784703580; x=1785308380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=saoDSDdEuqFBR3Jg2F/u3iejFckYCh1dzz5cbtTO9NU=;
        b=WGMbCRn6mJ92t83t/NjIy8auHk8URQlLIwoihke8FNmR9p/4p9Oortlli6gYcs3I4k
         uQFNZsenixyVua4HOzgjeOItA9lz0sB1q8rBRoARuz4hvYdLNVmca3iGHRey6dXAfroo
         HPvmD9jwnA5rc73Acl2dnM3/jcO2dB10y6Hq2VeLXU3vQKFiENU6mmZn1p1b0X5Rl3MK
         FG4OT2lHgdFWbTkAosUTJrrDIn9SWBMPYVGJKeHTMhBgCk+eyJCsqnML15+UqDG2ibCm
         thVqeItQoegHVa9BU0Mkv/T46IbvzqbPCtR86A01iKVvr4Q0SeI47/3IrbsTBbi0Y1Bd
         JObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784703580; x=1785308380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=saoDSDdEuqFBR3Jg2F/u3iejFckYCh1dzz5cbtTO9NU=;
        b=bZN6yVt1/w6i4FTZOVa+qf1W8GmIQBGalU78Dp32KjbY6Rzd8B5Q7YmsbKto5NWfXA
         yB83Gjxsgb0LkNQ2WFKS+9jXho6LZAEIDc5ynHy8C7c+eVCv6DF26+QOUXGWWIHx5nPM
         XA1dv4zMdnVG4YKp9ydCtYZNvDC55iwn61cczFWolVUKLXGrN7FXxyn9feSGugz+Loc1
         mW7V1MCvrxxuIk4NRc641HV1AucXdCD0/Nr+msSwIUTeqk47cgC3nwoGcXxnPuQG3n2C
         tJnQViPTr/nM1WxpYIo5UwCe5Ja5vCPCIx4c+5DBNrOlJn3/vTD6yFlhrajFkK02h0az
         0WTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqp4IXTv0/aCdijFSZ7ooQwXX1uGIw6Po1CW+lRPKvGk2qYVuifhEvDewXarrydfKrtfmLW4fnVhXU09MU/@vger.kernel.org
X-Gm-Message-State: AOJu0YxdUOOGRM3LXqWzrWyRSui6SDfAu+Xc8KBFktEur5D7cyzYSLaT
	1K8/omaD6maZKvLnQxAgTMzjLGhzFUM3VngmPvZUQURxFi1N/f1uAXz3QhP7wOrVujLvfP5d3LR
	AgRVvq1X5ib834bDxbWOM7mu6XvNJlRGmI6PqU57Iw7Oqyx6bQsDNoKzdTFyYS7eTaObI
X-Gm-Gg: AR+sD13YDsiNX6beZb1qzWGQZF256yz72Yw5pkpXAW4ip3eHI+lUEdi2CiatTWlM2Xu
	JrvjYv3I4V3I8sftb6LT0j6OHcnflnAkJI6Cmgy8tl4eqYFmr0jbUymBZST46UcUqTkS6Vh/mbt
	sz8E2xmsLjKjI+6YbRyBrAdrUg0c+0dfVsa/A/rPxIz3Ud4i4z5v08zbzqZ3UFIDhRHvkdvYTHV
	0hy+ahgRxvLZBDGlZ9MVhA//cejVMVLZnVApoZ+tEhhJWWGKb5/vsaP1Fb4z586rZyqRdj5EJgL
	H6YYr42c2kF5S9I0SuxiKX0LdACGUbqR2qSOxwsJdDEUgBa04jIsmEZu1y1+7wt6vvOA0sUWTn8
	ztca4xwSrNFJA3xfGg1uZ5JfeFQ==
X-Received: by 2002:a17:903:189:b0:2cf:906c:7d1 with SMTP id d9443c01a7336-2cf906c0d37mr21989995ad.20.1784703580066;
        Tue, 21 Jul 2026 23:59:40 -0700 (PDT)
X-Received: by 2002:a17:903:189:b0:2cf:906c:7d1 with SMTP id d9443c01a7336-2cf906c0d37mr21989805ad.20.1784703579605;
        Tue, 21 Jul 2026 23:59:39 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd88f7sm9428935ad.22.2026.07.21.23.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:59:38 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 12:29:12 +0530
Subject: [PATCH v2 1/6] tee: qcomtee: Track the object invocation context
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom_uefisecapp_migrate_qcomtee-v2-1-b8a8fcbe4211@oss.qualcomm.com>
References: <20260722-qcom_uefisecapp_migrate_qcomtee-v2-0-b8a8fcbe4211@oss.qualcomm.com>
In-Reply-To: <20260722-qcom_uefisecapp_migrate_qcomtee-v2-0-b8a8fcbe4211@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784703569; l=5105;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=Uq74hKAscOJpoTlWbeJLC+5TbwItuETl2mqfiOIyB/o=;
 b=PFbHpdPKr5cwtQn4xbDEDLIt+rmsnl3yHQmhSVoVCCSwjBpvEBP9mTv+rpaNItkG5Hw5+zCoE
 Kp/MK/SYd3OAc8PcuRfoqqf3LBCqe1xO5x+mDvRJUQRIS5Gxw6Kvm8P
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: TMUWtMorJUTmKVP9lkpz5IgXzMabGgEX
X-Authority-Analysis: v=2.4 cv=CbE4Irrl c=1 sm=1 tr=0 ts=6a606a5d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=bFqmgcYAq-yHHMqQ97oA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: TMUWtMorJUTmKVP9lkpz5IgXzMabGgEX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2MyBTYWx0ZWRfX1udoFekffZHH
 B0knm+fFNkfB6i9Sbpv70uOwZdCS82pgXGYqrQy4MW7X+QitcnCdDWwM1lkgblhyu0ZhP845j0A
 Mgv4zjP/Gky/TKZtNliPhV5YrdqpTNfY8RQuwopM6qhNfw/jK6nT5yEtK+8szN7mV0OLLG2kaGC
 bbF2xnARrVuOx4wA3GXNCDpBIai4Q9C9Mub6kdwOaTuOT3vHVUc17wHA3xSkRDoPUaLmF4MUDwf
 d78DDBEVQ7t3OhQ7I+Zvajj8YFKwowSqPcBh5etGq7ZGCakkQjfqVJMlFae6eFdQBx5VShPIZ0X
 UWwuR+IwNWXjpXFRzHZ0VdXNVMvxfZUhvPZEQTJORMG+YJbExqA+8YD3X1yM3Ezk/gVAaKmWwm+
 +1bAkiL2It38WIHym+2qAwte142yhMp3cLAeXkBgME3QUtQVf1VFLZio1dzXbi8xftRmB2xeCf5
 cdUMnRiaVybVZmyDFDg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2MyBTYWx0ZWRfX8DsuU5xRH/ut
 anNSBGN2fo8iFZOKKDIX/7+LF7AWKqUsCfxBR+L0SHiutYV267E347tfo+1osBWA5J2KMwRCdyX
 XeEE00Qn2MFUG3C45Ay0VN9nBR5Yhcg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220063

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
index 0efc5646242a..03d33b118f6d 100644
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
index 8b4401ecad48..2528d07e4576 100644
--- a/drivers/tee/qcomtee/qcomtee_object.h
+++ b/drivers/tee/qcomtee/qcomtee_object.h
@@ -146,6 +146,7 @@ static inline int qcomtee_args_len(struct qcomtee_arg *args)
  * struct qcomtee_object_invoke_ctx - QTEE context for object invocation.
  * @ctx: TEE context for this invocation.
  * @flags: flags for the invocation context.
+ * @kernel_ctx: flag that indicates this context is owned by a kernel client.
  * @errno: error code for the invocation.
  * @object: current object invoked in this callback context.
  * @u: array of arguments for the current invocation (+1 for ending arg).
@@ -158,6 +159,7 @@ static inline int qcomtee_args_len(struct qcomtee_arg *args)
 struct qcomtee_object_invoke_ctx {
 	struct tee_context *ctx;
 	unsigned long flags;
+	bool kernel_ctx;
 	int errno;
 
 	struct qcomtee_object *object;
@@ -172,13 +174,15 @@ struct qcomtee_object_invoke_ctx {
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
index ef9642d72672..dba5d4d2d47e 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -706,7 +706,8 @@ static int tee_ioctl_object_invoke(struct tee_context *ctx,
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

