Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D7A4611CC
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 11:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852613; cv=none; b=LXOU1glAchYn/D9/eRT5J/dlagYw0iMvxXbYQgRNc82wO/t2jSUZw3JY5wANlqkZAS2u2S3WNSuA3UTu8Ze3BaNvGX3yQERasxzueN5t66R0SyXi6x1sWlZWXLUNi5oUVHZ1sqOrnbnR5A+7OUGxFh9/u0gvEUhHxb0nJf5Lvyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852613; c=relaxed/simple;
	bh=YleWlT3ROAcsufkj5jwx8dZNzgxODLK9ynuTOpezKzo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fQ9HpUfy4kalBuk/3Il2puo3wv/DqqkH/txV+itm62kGSVqsIGZMyhKMKTbRgGgQlHephV2tUNaXfuLI3vOjd2sHT70DHeBbSmKMmSkgXiX1bsOdLO25RV1ZbLtQEOxdHM61jgaqD6So81Iv09WSGluqSAeVKIUH2FoCibRKsZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VTsFVvUm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDOlTDZt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VTsFVvUm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDOlTDZt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xNDi1062190
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 11:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IAFXgz81UD4dpBgvdASbjrG+v3hm1DJN3tlWm2fofmE=; b=VTsFVvUmJpgC5fCA
	Yjk/q5bvdKjIjg43RKJQRb26teXQxh3MysSPXy7oSGtF3K+axMBvEq8QxoJC2cec
	UMRLirv6TtdfzvsJdL8WmSUqwx0fBYQ6XlYG3REqHbRdamu7a0SgMf93iTX2aiI1
	fpleJ6/Dk2O1N/pqbpd55Ucb3hos1II5GME/s4CwcPWMcCpPZhZl6dRaXVwtwUx/
	NN71vod0Ncq3o89ZDTR5y7/Xsesh4hIZoofixMp1GhbmV+ObAZpuhsq4tI9t5Ewt
	tIda74AZzzJg8xqXzFfz7aHD+h4WPnnTAAoHfcndzLd9DyaLf/nf7CPqzVVaLcFn
	YAEdxw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17mvuhe1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 11:03:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39533bb224cso8991549a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 04:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790852606; x=1791457406; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IAFXgz81UD4dpBgvdASbjrG+v3hm1DJN3tlWm2fofmE=;
        b=dDOlTDZtQ5ET3PghFJHGr5nmqvA1TP1VMZDp3dWbBn1NoqHcm+VM34jWMGb3jE+NUE
         92MIAnh8VJvjFTRO0YQVbEOYGdmanvQKEzmrXExQd+iTHD6viCzal+dvxzBmQl8TkF7v
         V3Dcb7wfX37vRbh1OJluyxtW5OeR+Wo7LyKOqp0jWax415Ixdxtc0cNJFIrpZPGLKLvo
         q6vbXNF/eaF372zv+SBGsuuwwUFNlOHJd4kavLlO3JMO5Qd7b9ITlj5/q6WkM/TN2tzR
         hvX03feijG2to58EHnDxC0ct2QY4l50kgspm7Guhm1O7UJkixBHQssHg/UsULCz2A044
         c4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790852606; x=1791457406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IAFXgz81UD4dpBgvdASbjrG+v3hm1DJN3tlWm2fofmE=;
        b=YQXt75k9umhO/+Rm9cmMOITO2D4sqKwneyXbjRO40sVBPqY+DmqmFGNnsGkmIAqJ4/
         zQqN5tEXht7wXC5bBFUqP2meRssy+0Wz78p4yrubCTIZb3bNfsT3xFh/N/T6Frr+h/E6
         /aXgfno6Zb4co/yzvNFkhhiSDFnqTn6Xi9GWFRyNP0umID+m7GXtZMEQUp/y3LEXu3KP
         M95WhjuIntqb19DTCStB8iGPTcxnUDglwSa5N/GlVIwyq0uN1OspVIsZ094Hv0i28Sc3
         zpmgmWgcxr56cpHOR4f95Rx8E7WiPF43/JTrcGd+VC7J6R1zBKkBRZYqlQ5hybrUaSf2
         LrkA==
X-Forwarded-Encrypted: i=1; AKwUvBza2noN89Cp0GBdqXXgniHSNekTqYLuQ+POIdA2obQWbx0YJ4N4OY7LK1maS8wUaOZT5LA5jXvUEYM8yywF@vger.kernel.org
X-Gm-Message-State: AFq9FYLQtVqGiusTR+DWokiIdDHYpr5060cIaVtyq2UqoOVBG2n5bVvB
	yXP7jLheK6zKt/aHt+wnFpfrE06G87A9LnGXNbSe+mgNatSGPAXLLURUkpDkz7jpHmeBwROnbIp
	LQCfn+KaOGByeCgcUPqWMIOdiD7eXyngdRq3vxiIGlr+8/97lOdXiBbUKZGShvBEKC4lQ
X-Gm-Gg: AYBFou2Tqe4h/AX97zDlDgX5/0UV1V8x4z+cTZGB+jvfw6JsJe5w/s/QEpo/0/yyeIs
	RBHL4wInzon0tuOqDrkus+YYfTHtMCBJrRcRV2KmBVxMXP24q+E+z1LnNxSY6yytE2WAygR3DmP
	BBsqjdqzJbTCQQosIqbH70y6fIKTgA+/pNC1U33YO8nBiWkqqZPMBnbwtib74i4qLeGi7b/9OTK
	CWQao3y5IyE67YjvXMj+cXhiH4YewYQEQNS1WLU9maIVSGYY9t874g1TvYeWXGoFSA1u6F8vqx2
	gvH1dYt2gbLUi7fso7+nlrMnvLqkhJ1IuV5JZWD2a7RPhGsVd6DFAq2mLQpflfujDpbXEeqfQ7w
	n03zCp6pUJ1XSS0onGpCRe5BLcQ==
X-Received: by 2002:a17:90b:4b11:b0:3a0:c0f0:9a97 with SMTP id 98e67ed59e1d1-3a4d11dcd2cmr3137244a91.9.1790852605791;
        Thu, 01 Oct 2026 04:03:25 -0700 (PDT)
X-Received: by 2002:a17:90b:4b11:b0:3a0:c0f0:9a97 with SMTP id 98e67ed59e1d1-3a4d11dcd2cmr3137186a91.9.1790852605054;
        Thu, 01 Oct 2026 04:03:25 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f4371383sm4076810a91.2.2026.10.01.04.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:03:24 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 16:32:37 +0530
Subject: [PATCH v3 5/6] tee: qcomtee: Add support for registering QTEE
 services on TEE bus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-qcom_uefisecapp_migrate_qcomtee-v3-5-13df5c20c2e3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790852574; l=10174;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=YleWlT3ROAcsufkj5jwx8dZNzgxODLK9ynuTOpezKzo=;
 b=iN9DNF3Bg+qOME1VnjZAOP+tVCa9F4AFjT/7hTSLPF0rxTUeiB6sey1HMK+wP2JaRv92msNz7
 R+RhVxWWdUhCvqmOdMy8LaUrBTmKFaYF2JX0FssdNxROaEa8gpHrGvr
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: bF8yAmgPHySyhLddlQefhuAcdqe9-3qt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0MyBTYWx0ZWRfX7boy9TorfUYY
 4DNUxhTIbRqMg+JS6N77gLBd+MlZ1cS6EIFNOL8Tb237WtSI04yw3xlbg1NBd4i+nhchDZuljQG
 Zl2oy1HmG1YUQYX26Az02kKU5hM4b171y5XbHfBkDTMdKC6dubINBGzjeihriza5Jw/NUuGReOP
 APc+/ZUOPbhz0ZFG0OlBS/avjrVmGKOpIm+vfTY1AveLeELQ+Ta+CAgQda31acs0uEcDuDnASmQ
 fJb9HCSVygiidL7F85YIsNEGc1a6NcX1SrTmPCn3DL82DaxczsGUz7hjN5p3ne68kfpVZE8umvj
 kRtyMApRCJCIcWVREIw6N5z7pYkcTLANsB2axwrQipFdpwfsC06pRm3uIGD5aNFZTL3OqHUZ8k+
 iRs8q27Q/boD0cW/wJidUj2I3sVEP5SggXoUxKmZGgGZ49e3CkRJFGMvE3A/8MKuedP5tr4ysfa
 LjyZukIyW8CBgy2b0+Q==
X-Proofpoint-GUID: bF8yAmgPHySyhLddlQefhuAcdqe9-3qt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0MyBTYWx0ZWRfX0ZGJB0FK93X8
 uXrQQ8kSIfEAQSffO39ZJpCcAGoySpsdVflyCJjU3qecb7na2ciOnOFzY7FlcNFME1mbgHiCfZt
 3Fd5/t7kKuXtKIhG80snuGcaWXd1GuM=
X-Authority-Analysis: v=2.4 cv=KuvYSmWN c=1 sm=1 tr=0 ts=6abe3dfe cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=nsqFTM80TsG4aMfu2G4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010043

QTEE exposes certain secure services implemented either within the QTEE
kernel or via pre-loaded Trusted Applications (TAs). Such always-available
services can be readily accessed by TEE client drivers via QTEE's
object-IPC protocol if the service is registered as a device on the TEE
bus.

One such service is the EFI-variables service, implemented by the
uefisecapp TA which enables kernel clients to access EFI variables at
runtime.

Maintain a static list of such always-available secure services and add
support for the QCOMTEE driver to register these services as devices on
the TEE bus during probe.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 drivers/tee/qcomtee/call.c           | 161 ++++++++++++++++++++++++++++++++++-
 drivers/tee/qcomtee/core.c           |   9 +-
 drivers/tee/qcomtee/qcomtee.h        |  12 +++
 drivers/tee/qcomtee/qcomtee_msg.h    |   1 +
 drivers/tee/qcomtee/qcomtee_object.h |   3 +-
 5 files changed, 179 insertions(+), 7 deletions(-)

diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
index b361d9c04de0..8fadb7b13e61 100644
--- a/drivers/tee/qcomtee/call.c
+++ b/drivers/tee/qcomtee/call.c
@@ -675,9 +675,13 @@ static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
 
 	/* Get ''FeatureVersions Service'' object. */
 	service = qcomtee_object_get_service(oic, client_env,
-					     QCOMTEE_FEATURE_VER_UID);
-	if (service == NULL_QCOMTEE_OBJECT)
+					     QCOMTEE_FEATURE_VER_UID,
+					     &result);
+	if (service == NULL_QCOMTEE_OBJECT) {
+		if (result)
+			pr_err("FeatureVersions Service unavailable (%d)\n", result);
 		goto out_failed;
+	}
 
 	/* IB: Feature to query. */
 	u[0].b.addr = &id;
@@ -697,6 +701,156 @@ static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
 	qcomtee_object_put(client_env);
 }
 
+/**
+ * is_qcomtee_service_available() - Check if the QTEE service identified by the UID
+ * is available
+ * @oic: context to use for the current invocation.
+ * @client_env: Client environment object.
+ * @service_name: Name of the QTEE service.
+ * @uid: 32-bit UID of the service.
+ *
+ * Returns true if the service exists and is available.
+ * Returns false if a service is not exposed by QTEE.
+ */
+static bool is_qcomtee_service_available(struct qcomtee_object_invoke_ctx *oic,
+					 struct qcomtee_object *client_env,
+					 const char *service_name, u32 uid)
+{
+	struct qcomtee_object *service;
+	int error = 0;
+	bool ret = false;
+
+	/* Get service object corresponding to the uid. */
+	service = qcomtee_object_get_service(oic, client_env, uid, &error);
+	if (service != NULL_QCOMTEE_OBJECT) {
+		qcomtee_object_put(service);
+		ret = true;
+	}
+
+	/* When we fail to get the service, QTEE provides the reason. */
+	if (error)
+		pr_err("%s is unavailable (%d)\n", service_name, error);
+
+	return ret;
+}
+
+/*
+ * QTEE Service UUID name space identifier
+ *
+ * A random UUID that is allocated as a name space identifier for forming UUID's
+ * representing secure services exposed by QTEE.
+ */
+static const uuid_t qtee_service_uuid_ns = UUID_INIT(0xe1b48857, 0x6154, 0x49f9,
+						     0x93, 0x4e, 0xa2, 0xf2,
+						     0x0a, 0xba, 0x98, 0x42);
+
+static const struct qtee_service qtee_services[] = {
+	{ "qcom.tz.uefisecapp",
+	   QCOMTEE_UEFI_SEC_UID }
+};
+
+static void qtee_release_service(struct device *dev)
+{
+	struct tee_client_device *qtee_service = to_tee_client_device(dev);
+
+	kfree(qtee_service);
+}
+
+/**
+ * qtee_enumerate_service() - Enumerate a given QTEE service and register
+ * it on the TEE bus as a TEE client device
+ * @oic: context to use for the current invocation.
+ * @client_env: Client environment object.
+ * @service_name: Name of the QTEE service to be enumerated.
+ * @uid: 32-bit UID used by QTEE to identify the service.
+ *
+ * Returns 0 on success and < 0 on failure.
+ */
+static int qtee_enumerate_service(struct qcomtee_object_invoke_ctx *oic,
+				  struct qcomtee_object *client_env,
+				  const char *service_name,
+				  const u32 uid)
+{
+	struct tee_client_device *qtee_service;
+	uuid_t service_uuid;
+	int rc;
+
+	if (!is_qcomtee_service_available(oic, client_env, service_name, uid))
+		return -EOPNOTSUPP;
+
+	tee_generate_uuid_v5(&service_uuid, &qtee_service_uuid_ns, service_name,
+			     strlen(service_name));
+
+	qtee_service = kzalloc_obj(*qtee_service);
+	if (!qtee_service)
+		return -ENOMEM;
+
+	qtee_service->dev.bus = &tee_bus_type;
+	qtee_service->dev.release = qtee_release_service;
+	if (dev_set_name(&qtee_service->dev, "qtee-svc-%pUb", &service_uuid)) {
+		kfree(qtee_service);
+		return -ENOMEM;
+	}
+	uuid_copy(&qtee_service->id.uuid, &service_uuid);
+
+	rc = device_register(&qtee_service->dev);
+	if (rc) {
+		pr_err("QTEE service registration failed, err: %d\n", rc);
+		put_device(&qtee_service->dev);
+		return rc;
+	}
+
+	return 0;
+}
+
+/**
+ * qtee_enumerate_services() - Enumerate all the secure services exposed by QTEE
+ * from the static 'qtee_services' list and register them on the TEE bus as
+ * TEE client devices.
+ *
+ * Not all versions of QTEE support a given service. Hence, we try to
+ * enumerate as many services from the 'qtee_services' list as possible.
+ * Not being able to enumerate a service shouldn't cause the driver probe
+ * to fail since none of the services in the list are mandatory for
+ * establishing communication with QTEE.
+ * @ctx: TEE context.
+ */
+static void qtee_enumerate_services(struct tee_context *ctx)
+{
+	u32 idx;
+	struct qcomtee_object *client_env;
+
+	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
+		qcomtee_object_invoke_ctx_alloc(ctx, true);
+	if (!oic)
+		return;
+
+	client_env = qcomtee_object_get_client_env(oic);
+	if (client_env == NULL_QCOMTEE_OBJECT)
+		return;
+
+	for (idx = 0; idx < ARRAY_SIZE(qtee_services); idx++)
+		qtee_enumerate_service(oic, client_env,
+				       qtee_services[idx].name,
+				       qtee_services[idx].uid);
+
+	qcomtee_object_put(client_env);
+}
+
+static int qtee_unregister_service(struct device *dev, void *data)
+{
+	if (!strncmp(dev_name(dev), "qtee-svc", strlen("qtee-svc")))
+		device_unregister(dev);
+
+	return 0;
+}
+
+static void qtee_unregister_services(void)
+{
+	bus_for_each_dev(&tee_bus_type, NULL, NULL,
+			 qtee_unregister_service);
+}
+
 static const struct tee_driver_ops qcomtee_ops = {
 	.get_version = qcomtee_get_version,
 	.open = qcomtee_open,
@@ -778,6 +932,8 @@ static int qcomtee_probe(struct platform_device *pdev)
 		QTEE_VERSION_GET_MINOR(qcomtee->qtee_version),
 		QTEE_VERSION_GET_PATCH(qcomtee->qtee_version));
 
+	qtee_enumerate_services(qcomtee->ctx);
+
 	return 0;
 
 err_dest_wq:
@@ -807,6 +963,7 @@ static void qcomtee_remove(struct platform_device *pdev)
 {
 	struct qcomtee *qcomtee = platform_get_drvdata(pdev);
 
+	qtee_unregister_services();
 	teedev_close_context(qcomtee->ctx);
 	/* Wait for RELEASE operations to be processed for QTEE objects. */
 	tee_device_unregister(qcomtee->teedev);
diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
index 60fe3b5776e3..4a523a95bf0e 100644
--- a/drivers/tee/qcomtee/core.c
+++ b/drivers/tee/qcomtee/core.c
@@ -898,19 +898,20 @@ qcomtee_object_get_client_env(struct qcomtee_object_invoke_ctx *oic)
 
 struct qcomtee_object *
 qcomtee_object_get_service(struct qcomtee_object_invoke_ctx *oic,
-			   struct qcomtee_object *client_env, u32 uid)
+			   struct qcomtee_object *client_env, u32 uid,
+			   int *result)
 {
 	struct qcomtee_arg u[3] = { 0 };
-	int ret, result;
+	int ret;
 
 	u[0].b.addr = &uid;
 	u[0].b.size = sizeof(uid);
 	u[0].type = QCOMTEE_ARG_TYPE_IB;
 	u[1].type = QCOMTEE_ARG_TYPE_OO;
 	ret = qcomtee_object_do_invoke(oic, client_env, QCOMTEE_CLIENT_ENV_OPEN,
-				       u, &result);
+				       u, result);
 
-	if (ret || result)
+	if (ret || *result)
 		return NULL_QCOMTEE_OBJECT;
 
 	return u[1].o;
diff --git a/drivers/tee/qcomtee/qcomtee.h b/drivers/tee/qcomtee/qcomtee.h
index f39bf63fd1c2..66d305a46c0a 100644
--- a/drivers/tee/qcomtee/qcomtee.h
+++ b/drivers/tee/qcomtee/qcomtee.h
@@ -17,6 +17,8 @@
 #define QCOMTEE_OBJREF_FLAG_USER	BIT(1)
 #define QCOMTEE_OBJREF_FLAG_MEM		BIT(2)
 
+#define QTEE_UUID_NS_NAME_SIZE	        128
+
 /**
  * struct qcomtee - Main service struct.
  * @teedev: client device.
@@ -39,6 +41,16 @@ struct qcomtee {
 	u32 qtee_version;
 };
 
+/**
+ * struct qtee_service - A secure service exposed by QTEE identified by a 32-bit UID.
+ * @name: Name of the QTEE service.
+ * @uid: 32-bit UID used by QTEE to identify the service.
+ */
+struct qtee_service {
+	const char *name;
+	const u32 uid;
+};
+
 void qcomtee_fetch_async_reqs(struct qcomtee_object_invoke_ctx *oic);
 struct qcomtee_object *qcomtee_idx_erase(struct qcomtee_object_invoke_ctx *oic,
 					 u32 idx);
diff --git a/drivers/tee/qcomtee/qcomtee_msg.h b/drivers/tee/qcomtee/qcomtee_msg.h
index 5d7b21fdd368..9278a361dc70 100644
--- a/drivers/tee/qcomtee/qcomtee_msg.h
+++ b/drivers/tee/qcomtee/qcomtee_msg.h
@@ -105,6 +105,7 @@ union qcomtee_msg_arg {
 #define QTEE_VERSION_GET_MINOR(x) (((x) >> 12) & 0xffU)
 #define QTEE_VERSION_GET_PATCH(x) ((x) >> 0 & 0xfffU)
 
+#define QCOMTEE_UEFI_SEC_UID            413
 /* Response types as returned from qcomtee_object_invoke_ctx_invoke(). */
 
 /* The message contains a callback request. */
diff --git a/drivers/tee/qcomtee/qcomtee_object.h b/drivers/tee/qcomtee/qcomtee_object.h
index d3740099fae0..901ba3565a73 100644
--- a/drivers/tee/qcomtee/qcomtee_object.h
+++ b/drivers/tee/qcomtee/qcomtee_object.h
@@ -317,6 +317,7 @@ qcomtee_object_get_client_env(struct qcomtee_object_invoke_ctx *oic);
 
 struct qcomtee_object *
 qcomtee_object_get_service(struct qcomtee_object_invoke_ctx *oic,
-			   struct qcomtee_object *client_env, u32 uid);
+			   struct qcomtee_object *client_env, u32 uid,
+			   int *result);
 
 #endif /* QCOMTEE_OBJECT_H */

-- 
2.34.1

