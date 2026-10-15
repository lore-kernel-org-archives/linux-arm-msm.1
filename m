Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8844CE689
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 11:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792064395; cv=none; b=ldhulk5MwvhlXBA6kRoy2C6Pk+Y4S3YPXLThA2rmg0zx2Ch+7q3NN59xHiNiHcsv51M08mX9DXSXjYeeKNSGfxQRsKmbD3i2qxhxcIpCwVBfLO+e0KLcsrvbb11hh81GequmGM/0v4Fd7kzaMn2YrCCRw5sH14vtvO0izb0RC6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792064395; c=relaxed/simple;
	bh=TH9zxNeWaz65/B2YQ+b8LzdvFPHuxkaeoFfCpFnc9rs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fkjDhmZ0u07jnJHy8kL0Tbp56MPbUFOWNh5AzHrI8BBSqVLHjNK3ul6nBUsZmUg0Je+2Pp2pAb3GM9XNWRFRLCZX6cuw0xWW54PW0S6NjgLbyyzT3Ks0HLyUUzQdKJ42q8Qlf8HEGm5V27bN7IRwG0k33NGtL1HaJmzuR93S/1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U9Q7P2n0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Go60qNQa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U9Q7P2n0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Go60qNQa"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jRSF2114210
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 11:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qS++bIcOkmj5us9fGYAnFO6SHPHvZleD5TMRdoTL7YU=; b=U9Q7P2n0cqcBL42S
	NpvCKxyBXBeVh7rkgFhQr6dA14rYSlh23Q1mmtnyeX6FiH2CuPxqmGSiqXaXmqDR
	d9rmxmBGQGFRhHBcBnEyQerU30PD1BmyCtqDwN/L+GwW80ONzXQc8qcd7xCn1OTo
	vhnzPzx+dpl0BMpOWheq4VAoxOkK1lY9OHrOz63TW3XH9WyDGqiNPboYXk5S+g2I
	fwnMxQEzgJ1dNt0nuWQjnP4pHdmh3ma9lk0+KM08XKlbWI+mlRw00QSZCHChYc3z
	iFwYJuUr/4B9X9K8gGJETIa6/Cfpi3JI2Sey+HkDVreouSojpQIV/P9s+bLSHAg1
	3KLKfQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmyauay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 11:39:51 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3552883bd19so10783114eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 04:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792064391; x=1792669191; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qS++bIcOkmj5us9fGYAnFO6SHPHvZleD5TMRdoTL7YU=;
        b=Go60qNQaSYGik6UKErVUBHAH5EZcUkgtUp02b8YJPMXwOlj2QBvt/pHce2AV5Co5c4
         cBZrwpZdy4r35maeW6upb9B+4FKObt3ZKsO6GjkuPzkbZ5j++JIMUmJQ51NaaVhEoO6e
         B7UhrNKfP2ZGSJ+C/OMDf8xZ+0FSoJimeLW7On4ldm8Q9rp3iykrASA4ByqQP3HWGSV3
         P3zaA3Wxr3FhDSvqMy9V339fWsg/kjJh7539GiEozwHLBIAMRrILcJe6lOXnQghIcJk3
         Cb4IUDGjIfkaytP034KrZ9wVyUXIaJpJ82PFQnoquSwHAtXk0GiK7fzckmMqmvUe+g/+
         Dx5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792064391; x=1792669191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qS++bIcOkmj5us9fGYAnFO6SHPHvZleD5TMRdoTL7YU=;
        b=oN2WvaKGXeUl4PlrvbTHxhBuW1gcJOcEyFQVfzycugyxWuHsBfhJ4bMwKuG7q7vh0j
         vP37bEcHy9VbUzub/0m3GY9tRG6sg1nhkQxOe5gnL5nses6iIay/JX9EZd2RJvsd03Yx
         +ORmkK6RBTKvyBWyYADaffjhXsbhwYuwmQkqHXGzct3r1h+YhNvRFweN2H2CbAZrnFxq
         YjCUFdMEHtsLniyU2mdtJWFgtwiAtwph+VH55BRR1lfg1V3selwVI9Rh5QU8vzxuVS07
         JQJ76of3mIkpyTLjeh70QqPCf+sKG2eyWPY4ppH4XyPVSXt+f5GW06rR1W4ksGQ8jIZL
         tacA==
X-Forwarded-Encrypted: i=1; AKwUvBx2qk8t9e3YfqS9BESN9Nojk/sM5yFLZSh4w0HJ3h9l2HVGyqsNLUVm+05eH6qgIhbpH9++8JVNASxKnQk6@vger.kernel.org
X-Gm-Message-State: AFq9FYK6yib17mUKHWQyL02w9KRcxlLOMOI6b62b53l2h7z2axeT/4w8
	P1oMrsNEMQJ7aGh4bN3OHQijApU8lUZ1UKM/dhKLByUVBSkkRYJuXrbQ/CJty4WKk0xfUq5f3nF
	GDyDGvjdTJmRItYOcskxfxhYPLSBHsu+t23LxQ9BoGPhiCK0A2bDQg3kbzu9cFO6AEadq
X-Gm-Gg: AYBFou33vQz4Ba+4whF4P6utVsR2CxZXN/UHvk1+mQ3daeGNzptxeyfrmSfsk79N3is
	PY4EUx6liEnWK0b/2i7s5jlT7/zhWmJvc4kMbZhSTZwxYAU5fA7RiU2zo4d2wdGy9ksHs3VIrU6
	E8KXYcZzjxX3BxjV05CNdRp5tuTpzZrMzQcNbt57Wy8lvPtUZHIpFaslNTqpBgFL+HhX1UcLHmc
	bldLSh2uuIb4DN45L2vDL6kyZ1utN20gLsPlJXwXpbqe1ks5nyF7i4ilV/xw6SMFszcq+Kg1WL2
	La+W3XwGTISbrZUUCB9tB+FHPJaRI9VpmPpaZLVmsBwmz6oiEYuGb7Cq4PwikPwoIpVbsQxs0Cx
	7Z2/5f6qFVOiSayjXOsJuSgxayw==
X-Received: by 2002:a05:7300:6a93:b0:35a:22a4:12b with SMTP id 5a478bee46e88-35a22a421f0mr17265447eec.38.1792064390332;
        Thu, 15 Oct 2026 04:39:50 -0700 (PDT)
X-Received: by 2002:a05:7300:6a93:b0:35a:22a4:12b with SMTP id 5a478bee46e88-35a22a421f0mr17265411eec.38.1792064389759;
        Thu, 15 Oct 2026 04:39:49 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b29c2f861sm48144891eec.11.2026.10.15.04.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:39:49 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 17:09:35 +0530
Subject: [PATCH v5 1/7] tee: qcomtee: Track the object invocation context
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-1-1460691b35d3@oss.qualcomm.com>
References: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com>
In-Reply-To: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792064379; l=5457;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=TH9zxNeWaz65/B2YQ+b8LzdvFPHuxkaeoFfCpFnc9rs=;
 b=ZG+Mu8yqk+xj7MqylDbXHpUjwystT2y4/wGB0s4aaEq95FUNNhsv5tRpDjfafzd2UHLXMzo+n
 Gv1x0E2PkoDAgS94DbIWfJLfluZBClFfFdGhjlD1xAZA4g9xh9tGra+
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: o_Nax3IrswbVNxYoALbg5_8l9Jmt9Uo_
X-Proofpoint-ORIG-GUID: o_Nax3IrswbVNxYoALbg5_8l9Jmt9Uo_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0NiBTYWx0ZWRfXz119rDf7sJId
 vtuWYIj7kxFFzRUwrm4TEqLeSBY7TZNZCfx+Sdm1XzT4huza8BnTmHV3a2pyOOu0MjPqissWIbk
 ZoTL2HMMYLDil6QBauzgNjl0VhpLyOk=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad0bb87 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Tj57qVV8HpgCqk1lqJgA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0NiBTYWx0ZWRfX/fJyP6/xvEd4
 Rp2rzNiSJzvU9qJ8AabfDTqV9amRP+6DkmGUtobgzy96qxB8g4TcEvrRtf9Uyce6qY3lWPuky51
 jN0xEGsvW1FpX512htmn8eV+36DlowzK5SW4FIiQNFVZCm1415cdvEcn8wCxoSEA1i5PkPDfSi4
 HA9Pzr90fxruiP9xl2YQOjyRcICFRNemJZ+DbR35g1Y/SySxVUHWBD3imLC3DRYFs8rEbFVadtY
 h3/5NRS3XKJKeEtcs6n96i2HzMac9pUQiaOnRT2KJLgShSiS5Dt94l+q5yitu+VOJ24nS2OETXy
 0l0LwAtIVWkFqdM5+pcoERlzmbtAxWb7OaBE7krIyMUD9DPlrMfQM+iOZyZhD4iAd5S+o1NVKxy
 0FiqRuXDRjg1zbuNlWj/YilCiLB5tmrB2yBzYXHZ5eAcxHXrhaHUk7Nj7MGhIfNLDW6iQJ0PXJZ
 TLrWEdL9hJxXOUoksXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150046

QCOMTEE needs to distinguish between object invocations arriving from
kernel clients and user-space clients in order to correctly marshal
UBUF parameters and decide whether certain operations should be permitted.

Introduce an enum tee_object_invoke_origin to allow clients to indicate
the context of the TEE object invocation, and add a kernel_ctx flag to the
QCOMTEE context so the TEE back-end can track it.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 drivers/tee/qcomtee/call.c           | 12 +++++++++---
 drivers/tee/qcomtee/qcomtee_object.h |  8 ++++++--
 drivers/tee/tee_core.c               |  3 ++-
 include/linux/tee_core.h             |  8 +++++++-
 4 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
index 4a597eeaf174..3de54af45719 100644
--- a/drivers/tee/qcomtee/call.c
+++ b/drivers/tee/qcomtee/call.c
@@ -388,20 +388,26 @@ static int qcomtee_root_object_check(u32 op, struct tee_param *params,
  * @ctx: TEE context.
  * @arg: ioctl arguments.
  * @params: parameters for the object.
+ * @origin: origin of the object invocation (kernel or user-space).
  *
  * Return: On success, returns 0; on failure, returns < 0.
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
@@ -411,7 +417,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
 
 	/* Otherwise, invoke a QTEE object: */
 	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
-		qcomtee_object_invoke_ctx_alloc(ctx);
+		qcomtee_object_invoke_ctx_alloc(ctx, kernel_ctx);
 	if (!oic)
 		return -ENOMEM;
 
@@ -648,7 +654,7 @@ static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
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

