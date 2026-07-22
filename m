Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B893822A9
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784703593; cv=none; b=U77MpTnf3y3UO5/+S7pKp7ckwlb+9hBflRgAzmNtpl3qEqoDoqZ6N0s3ovXAk7VrE8Jx8UyL4yRol9TOjIBwOb81vWxRtEdy0rkzalSPbTeLwvZTzGxzUO+sQvjT9Mu8y1m3FaHMeDR1DgL771i3isHcDa0ODsL2sgiF+ejsmdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784703593; c=relaxed/simple;
	bh=G6VnwaO1IVScbnDaolrmIYtJTI0uR93I+XZ8UW66RtY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OyqyPNYNj7LQc30JDYUasg4BhmpNkfeEqVlGHnKvq0zC/yD/7h2eLJlipKBheoMItPfOB5uS41+YapuwB50ODR/r4yF2jTVpJPq9iC98I/jXsq947nnXspUhjH+yFD7nByVnx2svGGOwLazc9QRCZMu2jIYOutIzUS6djFpwjQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bUaXQhtc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K5kb5dO4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bUaXQhtc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K5kb5dO4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53fAs3767648
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QcGMG8S4sHvnkwBvz/VTr4JXUXb6aBnJmGIPnGyQ4as=; b=bUaXQhtcPF303SZr
	oy87bIYzvB4UQDcPgMNnp/1BjlNzsc0SgYPOUNkWdvJozIBidArbnlgMJiyf2vx8
	X5z/OFMTIDYx8VmfVleBHh0FmhXmbKqhdAF4YK8Q3ugXluCiKFimfmmFeRe/gmrW
	TYQArpLq4tcYMrtyO6wFz6KeOpBsqA6dXtbBTlzyBk7S106wRoEPI3AeCPm5cg6s
	Tz9576/sQyCcL/sLtT7fsFv38j5RFd+7ThLpsAR8GMstNiasns9mIfFJ3trzYV+5
	J05rRJPNa8QcyjfYi9jEhx6D86iD0FSmoU0lIvxIdxxUzd3wEcCs8ZH0mJ05K8cq
	PQ3kdw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjnu4rr9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:59:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc73f47bdcso224840205ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784703590; x=1785308390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QcGMG8S4sHvnkwBvz/VTr4JXUXb6aBnJmGIPnGyQ4as=;
        b=K5kb5dO4nc42GQmZCQ0r8Q9aDUWM8I9AKiMr8IEWi/Hn3nbtnmG6vuzDX1lDomi8q/
         pV6OEwh7uRB/Nyf4mCSiwuxvJWkEqIL2krR1foScWs0+uFzPZwVIQXf1IXa1vbtJDQ0n
         XgErxwjGwohMHctLXNBeXzEIHSndtJqrSDnBFdqCPuQU4b49GusI1adrn8fBlflUKy0+
         WjrI1OGcUg2hfIFyQiTzZ6slVZLTAvFXvf+VM8UZU/9U/plAY77HeAtolmin8KC/Gt7d
         UdE6zrwDPDdXKW4i4dX4k71k21nLrjcbcP99Wb157G4mge24/l1EvAY6SGQMVqnqjTI/
         A5yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784703590; x=1785308390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QcGMG8S4sHvnkwBvz/VTr4JXUXb6aBnJmGIPnGyQ4as=;
        b=J8aHVKOYOrRSuZ867wygzPxz+CNVucm5db6qxZYJI68CvEjMGM0yYKsJRoHrGwXYc9
         g7aQIBcHD9x7G8L+zecGg6xAK67j++dkVpmMQRfhifnvvGBPTHYXnju27jl1yFQqEmmq
         Sm6paQdGtembXeVSlwShwhMrpUdhnn3evvLPlCzmAjfg6F1xeB0gH8s7SEdphxJL+IOK
         nF8bAmftE+voP6Hlb0pwIXX2LBmtp/smMGUEOR2nBR3orvkoLukoL542EUBDajI1bOvF
         pTdFr7/4fryNop2dQjTQDcqlYP3dQ3s0Ief8HIM6mAxaHF7oPt/iKVfFwg9NN3OD+3Vx
         rYZA==
X-Forwarded-Encrypted: i=1; AHgh+Rqgz0CfKPHgx/SwhbhnlghXMWbJJWsh190HyjVNLhZ/z4Bf4BK3UftUNM+WOx3Pk7uCy7YKxdXVjF7pr4Ao@vger.kernel.org
X-Gm-Message-State: AOJu0YySLaAl8RDm0n+HPwLqMxinh1GNWbxj6pWnQy0xhDiTtONNFJYo
	zHsnAcwBe8dZZluUTtE0/vc70E3R/hjWi6RcUw3HuxyyvyMRCpHRBu+NIfsNrJBUMwvAgsWYNPg
	myA46racJSnBd1sBD3QnHxwpVLD+KDOKEN8/MGIRNtSHo0u8p5acSY7nCvZc1RSjQucDI
X-Gm-Gg: AR+sD10FVF7MRWGciiFBAsIXEgAf6zS/WqTvclUzBlI7OKxdyJEE7GirGKLjQoPCpbc
	RtSAo0qgOHLZ7N3CHVMJWMY+k2W+1/ApF2Xum4MZu8mzsBM61goOA2ey41tiROiEwEiFU0BT0jh
	sT50ZQ0D2zyU3h3sRWpIsl47s+y7h0/rlBUQDRSBPMeQfRQtr3NSijZ0z0DI3WcU0fyihIgpMJ9
	gEzHMgEmWBHq+XO7v4ZesOLRawtY/ZsH1/meeMugWrA0StSzsddcMB3FoXmeLt4512R20aR0tw7
	WZAxPFbxxsNh3Vwcp5QVX4cB4bDQkp+mZiJaI1thNGPqfwu86BHIYTqCGI4wUiN+ijMFLPUdad7
	kJhiBjqVZ+Zh1n9Ru9pjM7R3fog==
X-Received: by 2002:a17:903:1a87:b0:2c8:25c8:85a6 with SMTP id d9443c01a7336-2cf3481b77fmr231364015ad.2.1784703590443;
        Tue, 21 Jul 2026 23:59:50 -0700 (PDT)
X-Received: by 2002:a17:903:1a87:b0:2c8:25c8:85a6 with SMTP id d9443c01a7336-2cf3481b77fmr231363795ad.2.1784703589966;
        Tue, 21 Jul 2026 23:59:49 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd88f7sm9428935ad.22.2026.07.21.23.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:59:49 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 12:29:14 +0530
Subject: [PATCH v2 3/6] tee: qcomtee: Allow object invokes from kernel
 clients
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom_uefisecapp_migrate_qcomtee-v2-3-b8a8fcbe4211@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784703569; l=6532;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=ZmUkuPpOF1W6pfjx6a8SqHj69RiLqeBYMsNl5lK852Q=;
 b=qYiW8DMUyPHo2m/kD+h7brMbuBtdk9j4aOvafDtQ9+Ij8V6+NkUH2Ec4Z1mzHUvDALnv295M5
 p73dmDh1H9hB8ql7hxwfvh+wRBxvlBPPXBhhRev+voj9faF6edqc6jM
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: 2s9DDRT0KI5UVVaf0fL5o6dRnb0qan-n
X-Authority-Analysis: v=2.4 cv=KLhqylFo c=1 sm=1 tr=0 ts=6a606a67 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=XyePUiwmHbEyLJ1dZiEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2MyBTYWx0ZWRfX8rWNvLrcRxUM
 cCjna2Sneotng9sPjJIcS0aiQskYm4H5EsVo1K/IC2HvnqX3sKkp4woN1LTm1iO5FVquI393D+3
 Z0wY5hq/ecU/k+iZTGXrgpFA20i0C5q5ZzaNHulm9lDXrh4F2ut7nXcy+EyeXsuZ4z8K07vy01Q
 5v/oJlvwObxIcJXIojrbeHw2nYOp9xID6zj2ETVXBU6uWwrL4etezUQonw4fblZSiw5pjgCNEpx
 k74WWGeoCmEJ593hdf3z+jA0gv79nXFCSDy/Tt2C4U0NOrnZJB3diBFvd0+B9nSFrON3VzYd3bS
 FzFa6aEkp4Avh9Jt60zBZmb+diuaBYzwNX5oBpoQ+QRy/JMbCJ/fYXD/zOMRnpd5FE7by1fqNOO
 SWBlTujq+X874j2pEFu8jc/mdF9GkN0Eh8XYrohhpEwzNP5sXgdkZWz6ceWxqsG4Y/kIigNpwQ+
 efj1/S6d8welasRMyzA==
X-Proofpoint-ORIG-GUID: 2s9DDRT0KI5UVVaf0fL5o6dRnb0qan-n
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2MyBTYWx0ZWRfX13iz37nhvZBH
 UX/gaPQ/UFNHDSx9dPy6DZMitgWEeq/qgn7z8+FhNVEAkTGwZpvzrUfMVlLiWaLWJGXrJZwe7uW
 3fi+UFsXX1NO4/NXS3D2cn1dJO+qVJY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220063

From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

QCOMTEE currently treats UBUF parameters as userspace addresses and
applies userspace restrictions when invoking the root object. This is
not suitable for object invocation requests issued by kernel clients.

Use the kernel_ctx flag to distinguish kernel client requests from
userspace requests. For kernel contexts, do not mark UBUF parameters as
user addresses, and allow permitted root-object operations to proceed
without applying the userspace-only checks.

This allows in-kernel users of tee_client_object_invoke_func() to issue
object invocation requests through the qcomtee backend.

Co-developed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/qcomtee/call.c           | 34 +++++++++++++++++++++++-----------
 drivers/tee/qcomtee/qcomtee_object.h |  5 +++--
 include/linux/tee_drv.h              |  5 ++++-
 3 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
index 03d33b118f6d..c1bba5fbfa3e 100644
--- a/drivers/tee/qcomtee/call.c
+++ b/drivers/tee/qcomtee/call.c
@@ -202,7 +202,7 @@ int qcomtee_objref_from_arg(struct tee_param *param, struct qcomtee_arg *arg,
  */
 static int qcomtee_params_to_args(struct qcomtee_arg *u,
 				  struct tee_param *params, int num_params,
-				  struct tee_context *ctx)
+				  struct qcomtee_object_invoke_ctx *oic)
 {
 	int i;
 
@@ -210,8 +210,14 @@ static int qcomtee_params_to_args(struct qcomtee_arg *u,
 		switch (params[i].attr) {
 		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
-			u[i].flags = QCOMTEE_ARG_FLAGS_UADDR;
-			u[i].b.uaddr = params[i].u.ubuf.uaddr;
+			u[i].flags = oic->kernel_ctx ? 0 :
+				QCOMTEE_ARG_FLAGS_UADDR;
+
+			if (u[i].flags && QCOMTEE_ARG_FLAGS_UADDR)
+				u[i].b.uaddr = params[i].u.ubuf.uaddr;
+			else
+				u[i].b.addr = params[i].u.ubuf.addr;
+
 			u[i].b.size = params[i].u.ubuf.size;
 
 			if (params[i].attr ==
@@ -223,7 +229,7 @@ static int qcomtee_params_to_args(struct qcomtee_arg *u,
 			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT:
 			u[i].type = QCOMTEE_ARG_TYPE_IO;
-			if (qcomtee_objref_to_arg(&u[i], &params[i], ctx))
+			if (qcomtee_objref_to_arg(&u[i], &params[i], oic->ctx))
 				goto out_failed;
 
 			break;
@@ -270,7 +276,7 @@ static int qcomtee_params_to_args(struct qcomtee_arg *u,
  */
 static int qcomtee_params_from_args(struct tee_param *params,
 				    struct qcomtee_arg *u, int num_params,
-				    struct tee_context *ctx)
+				    struct qcomtee_object_invoke_ctx *oic)
 {
 	int i, np;
 
@@ -288,7 +294,8 @@ static int qcomtee_params_from_args(struct tee_param *params,
 			break;
 		case QCOMTEE_ARG_TYPE_OO:
 			/* TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT */
-			if (qcomtee_objref_from_arg(&params[np], &u[np], ctx))
+			if (qcomtee_objref_from_arg(&params[np], &u[np],
+						    oic->ctx))
 				goto out_failed;
 
 			break;
@@ -304,7 +311,7 @@ static int qcomtee_params_from_args(struct tee_param *params,
 	/* Undo qcomtee_objref_from_arg(). */
 	for (i = 0; i < np; i++) {
 		if (params[i].attr == TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT)
-			qcomtee_context_del_qtee_object(&params[i], ctx);
+			qcomtee_context_del_qtee_object(&params[i], oic->ctx);
 	}
 
 	/* Release any IO and OO objects not processed. */
@@ -357,7 +364,8 @@ static int qcomtee_params_check(struct tee_param *params, int num_params)
 }
 
 /* Check if an operation on ROOT_QCOMTEE_OBJECT from userspace is permitted. */
-static int qcomtee_root_object_check(u32 op, struct tee_param *params,
+static int qcomtee_root_object_check(struct qcomtee_object_invoke_ctx *oic,
+				     u32 op, struct tee_param *params,
 				     int num_params)
 {
 	/* Some privileged operations recognized by QTEE. */
@@ -366,6 +374,9 @@ static int qcomtee_root_object_check(u32 op, struct tee_param *params,
 	    op == QCOMTEE_ROOT_OP_ADCI_SHUTDOWN)
 		return -EINVAL;
 
+	if (oic->kernel_ctx)
+		return 0;
+
 	/*
 	 * QCOMTEE_ROOT_OP_REG_WITH_CREDENTIALS is to register with QTEE
 	 * by passing a credential object as input OBJREF. TEE_OBJREF_NULL as a
@@ -429,7 +440,8 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
 	/* Get an object to invoke. */
 	if (arg->id == TEE_OBJREF_NULL) {
 		/* Use ROOT if TEE_OBJREF_NULL is invoked. */
-		if (qcomtee_root_object_check(arg->op, params, arg->num_params))
+		if (qcomtee_root_object_check(oic, arg->op, params,
+					      arg->num_params))
 			return -EINVAL;
 
 		object = ROOT_QCOMTEE_OBJECT;
@@ -437,7 +449,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
 		return -EINVAL;
 	}
 
-	ret = qcomtee_params_to_args(u, params, arg->num_params, ctx);
+	ret = qcomtee_params_to_args(u, params, arg->num_params, oic);
 	if (ret)
 		goto out;
 
@@ -455,7 +467,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
 
 	if (!result) {
 		/* Assume service is UNAVAIL if unable to process the result. */
-		if (qcomtee_params_from_args(params, u, arg->num_params, ctx))
+		if (qcomtee_params_from_args(params, u, arg->num_params, oic))
 			result = QCOMTEE_MSG_ERROR_UNAVAIL;
 	} else {
 		/*
diff --git a/drivers/tee/qcomtee/qcomtee_object.h b/drivers/tee/qcomtee/qcomtee_object.h
index 2528d07e4576..7bd6e23b038c 100644
--- a/drivers/tee/qcomtee/qcomtee_object.h
+++ b/drivers/tee/qcomtee/qcomtee_object.h
@@ -112,8 +112,9 @@ struct qcomtee_buffer {
  * @b: address and size if the type of argument is a buffer.
  * @o: object instance if the type of argument is an object.
  *
- * &qcomtee_arg.flags only accepts %QCOMTEE_ARG_FLAGS_UADDR for now, which
- * states that &qcomtee_arg.b contains a userspace address in uaddr.
++ * If %QCOMTEE_ARG_FLAGS_UADDR is set in &qcomtee_arg.flags then it implies
++ * that &qcomtee_arg.b contains a userspace address in uaddr.
++ * Otherwise, &qcomtee_arg.b contains a kernel address in addr.
  */
 struct qcomtee_arg {
 	enum qcomtee_arg_type type;
diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
index ca99c6b747a8..71d0536db60e 100644
--- a/include/linux/tee_drv.h
+++ b/include/linux/tee_drv.h
@@ -83,7 +83,10 @@ struct tee_param_memref {
 };
 
 struct tee_param_ubuf {
-	void __user *uaddr;
+	union {
+		void *addr;
+		void __user *uaddr;
+	};
 	size_t size;
 };
 

-- 
2.34.1

