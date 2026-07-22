Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804F635C6B0
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 07:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784703614; cv=none; b=AQK6hYqlwhfh9JN2N6A7prEwgnCKuTVsAhW7SAr/IPCqRfIlxWIXAO5MPACnTE0PNTINiv6lWxCikgDhtyMw4CH9kzU2SgFpGhXXXqpo7+NSUvyjZE/H2bq0fnZKXtbFQXROuj5nusZIoARkDoR9fHVdLjqYPORhAFtISxp2+HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784703614; c=relaxed/simple;
	bh=ltTUr4ZNz1WK8n1xoNtPuphhExPvrUNLbuEMZg8+YzA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Te1dUDuUZGaOY75HFVpJp1EvgFk25brWjpadL2eSUzUFFSVjjmMRJEgbFWdSSI733jx26T7+thP7eYKUstxTqdzBHAY0YNMt/VvHIKuttHxb4MLCm5tccWU82a97kUrfMHn9uEaOjpzF3/DX8xvp+sBB7BLYqWr6WCEfhcZMk7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k6Cwq5Pf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f2uz4/JC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k6Cwq5Pf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f2uz4/JC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53uEP3996125
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 07:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z7g91lbv5RV9lZPR9a6UTHIBqV9Y4ZqcpArgNql62cA=; b=k6Cwq5PfeE6QB+Hx
	EYJhzHCY3i0gmOedVUIhpY3D0eyGv2i1svyuPpqqJiwBF7TPq87wLlLcWhFk+1B8
	0aTfRaItVY9Qki/npFrecIViW5EcgK8tDQBrUW1D+olpOEU7AN5bD932DLNwuUMb
	iLQpkCnEQ8XoiTwQ+zwU3D594sQwaDyggCFJS6BJPbp6au9n1UOtklA3zaJeu9gh
	yp9cghMG1rGHAqAmcHJgEkdo2BuzMtCcl+x5ysqq1ygFwfGHnwJnYzjhaHqhsvQH
	YfoTHylGCK1n/5Vknw0yCeoVufYp+WuhDawxqRqZV5uklOlxhYSDANfJcBalOY20
	HuUURA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6d2p26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 07:00:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc640dfde3so103915415ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 00:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784703601; x=1785308401; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z7g91lbv5RV9lZPR9a6UTHIBqV9Y4ZqcpArgNql62cA=;
        b=f2uz4/JCl/bnfPxAMs+Gf1GVbrqo8ayfsRCqh8HBZYgl70m+xWWQfNP6CXEz4H3o2C
         e7g/aSRxC5lg+n43vLceLNPHrDRla0Kq0Qr5/NCYnHTGdiCjsyReZkLnorvpHiItCUQd
         EZ4SxDoLzS4wwiclPOGU50dSUHOn5FNzaW3NrMG1aNihO/8Zi7hcduDSi1thD/nVjYUf
         FolShHGJ2fOIL0oMGFJkin7FtdA+uFa+bOJpaHBGvSjaCZ1Q9V2R40FXaaXTt4E199a4
         vl1N+bbbF4RhAAgDurCrKbQMhmunngiOLr/7pHxBdR+mBKHfuzDHWbgnLDjftQJKi/Cv
         Hs4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784703601; x=1785308401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z7g91lbv5RV9lZPR9a6UTHIBqV9Y4ZqcpArgNql62cA=;
        b=HflRDtH42yVwZuXlGk6Ulhw72RLqqPqMqOaEuQLx/1VmJO/Dt9aiH/lLMGc44coujq
         532aBRQCZTk8YoXjPf+YWzKeM1eir5sl6mCUe7mjoFrVa7lfHXkniyPl1JHLCjrZBhly
         nQV/GnQ1rPgPfL1XCnJN9mGtxLQqJ/nB0fpaDZ3aX/Aj37C8xlo/bA1MuNZ4a5HdJkJw
         XxjGdL+GDzR2+05lIKPx/69n02JyNcUoVWD9V/7zvncG0tlHFQku9WidviFE/QcCBiH+
         bq6+2gctDsx5cEBU2OLl6wEqavrINPf+nPPNEMrsUEYTKdqR5P/PP/4J6kFjMTx6PtF1
         q6GQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr3mqYM6GUSMVJq+ijxFqCiCy4z4cd3+PhWz6eBZqy2rJZ9NEtQCNlzy7T2t0petjDIKIg0UOucgiddsQ/X@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+4bnMvx7S5RKiieiLA9M4uZeLV0ZMfFgV40HiSdj1Wsa1eC0x
	vh3S5AXIl5buo0riqS5G4FFj9yDq5f4D/flJfDMbqiBwBuYvHXguvI1FmHmQzucpXjLrIq6ULz4
	c0Q/h4HeBjc7ycYz2AgoLCs36QaQsZCpGd4zTjuRozlkQhArXZ+z9ASQTAuUlQ6h2XSEK
X-Gm-Gg: AR+sD100zGcjzDisXbcdoC77asMcZsqcrxWLxsjsFvvrbYS4HV897pHLiY4brrEcmpH
	mcLArOw20a/xXi1P8DY3QEZ+0hInsdq5WHwzgWPpUfMMy6UKXeu4gzr4pWhs6HLjgzWH1vrhXkH
	Lb0io3ONFbL8aPxzlhR7toOyvMAvyvCLL6Jjf1PbJZbdSkaIiDcRuy0H4B1nzIep1GPDiMeEbep
	77uZsTN0mrYqOfjtkwrkdbQHhE+iLqt7ZYgB9g3Z8RjysoTWSeOqcEIk/EysNj8HGPnyiLKimuK
	yBKi+q/Jzg+ERSoY5ppFENNcqeOf5AKGhIInJPt0+ew5D+Vlrz5UzM9L2A9M9jOQu4zp+q+yCJ1
	RCJMxyUD8rM4W29aLoJeFOcXgrQ==
X-Received: by 2002:a17:903:40cf:b0:2ca:2079:91cc with SMTP id d9443c01a7336-2cf34836a55mr231116845ad.5.1784703600907;
        Wed, 22 Jul 2026 00:00:00 -0700 (PDT)
X-Received: by 2002:a17:903:40cf:b0:2ca:2079:91cc with SMTP id d9443c01a7336-2cf34836a55mr231116565ad.5.1784703600419;
        Wed, 22 Jul 2026 00:00:00 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd88f7sm9428935ad.22.2026.07.21.23.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:59:59 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 12:29:16 +0530
Subject: [PATCH v2 5/6] tee: qcomtee: Add support for registering QTEE
 services on TEE bus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom_uefisecapp_migrate_qcomtee-v2-5-b8a8fcbe4211@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784703569; l=10257;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=ltTUr4ZNz1WK8n1xoNtPuphhExPvrUNLbuEMZg8+YzA=;
 b=ZecvUzCUTBtloCfVPCAS/ldUdsIlbuSrcJ/nDKElROmdw8SbaiDBPwu9WIYAg+BLvCKma1y8d
 Bz159LXYGYpCDrQc28w96S/YciUdkMeLcrxQbzRBkY+tO/zwb+nYBOu
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: lntPi8VNX-k99YyFK1iCN2VtaqJukyHA
X-Proofpoint-ORIG-GUID: lntPi8VNX-k99YyFK1iCN2VtaqJukyHA
X-Authority-Analysis: v=2.4 cv=XaG5Co55 c=1 sm=1 tr=0 ts=6a606a72 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=nsqFTM80TsG4aMfu2G4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2MyBTYWx0ZWRfX4dkU1OJw/drE
 3g6EMIxGiOolnIHVsaxyrNTKY1iVo5DtsmQ8B4Mxb39aR6BBbVUWCw11s+cU4OTWAlSFqdKaOSD
 jIBiLiPfaeoi8RhUtyJVbn+4mt7q7QQBR1cAfGWBx4h+RjW1O3DIGrCRTRWEVdPwrTAiQs3h9QC
 T8k3sXzHvViZDB/Pnfo+xg1ZfUdEDwsAgVMLQvQOFEWj1ZJls1SU/dBdNWmAJy4iZBIUlqLQu1Q
 qpb7WFRBZiBK10sGt5KGOfQKdQEqNTsWCXltGZrNaD/XHU7N0B4muJ0X0pWqN4q0toaL+sGe0QG
 VRMPCzweWX5gDU4fGxLi1qQma4gCOVCFzKuwhqydOWz/r17glUAXtwwcl59rMLQTuoEdBHkMP6V
 Mo+i1JG4NOmaJpSQwuAsn2B0H4QPsjq2G9J1W1rPhHAS1ZGW+3zJLB6Ph4Qitaeer6eDT6jBeib
 RSBs5zI6ScLyXKpFSDw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2MyBTYWx0ZWRfX9YB2Ticn2UFJ
 TZ2GcB/GvwRH9dU8C5YvOTdhikoxm+tIUaBHZIXKup9KShXoCbsPcG6dBlqM7AsdWE4rjGIbnHm
 Xb0Is6ZRVH1KrfpESkBiC0AkQ/dvQFY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220063

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
 drivers/tee/qcomtee/call.c           | 160 ++++++++++++++++++++++++++++++++++-
 drivers/tee/qcomtee/core.c           |   9 +-
 drivers/tee/qcomtee/qcomtee.h        |  12 +++
 drivers/tee/qcomtee/qcomtee_msg.h    |   1 +
 drivers/tee/qcomtee/qcomtee_object.h |   3 +-
 5 files changed, 177 insertions(+), 8 deletions(-)

diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
index c1bba5fbfa3e..e909955e6b21 100644
--- a/drivers/tee/qcomtee/call.c
+++ b/drivers/tee/qcomtee/call.c
@@ -662,7 +662,7 @@ static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
 {
 	struct qcomtee_object *client_env, *service;
 	struct qcomtee_arg u[3] = { 0 };
-	int result;
+	int result, error = 0;
 
 	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
 		qcomtee_object_invoke_ctx_alloc(ctx, true);
@@ -675,9 +675,13 @@ static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
 
 	/* Get ''FeatureVersions Service'' object. */
 	service = qcomtee_object_get_service(oic, client_env,
-					     QCOMTEE_FEATURE_VER_UID);
-	if (service == NULL_QCOMTEE_OBJECT)
+					     QCOMTEE_FEATURE_VER_UID,
+					     &error);
+	if (service == NULL_QCOMTEE_OBJECT) {
+		if (error)
+			pr_err("Failed to get service! error: %d\n", error);
 		goto out_failed;
+	}
 
 	/* IB: Feature to query. */
 	u[0].b.addr = &id;
@@ -697,6 +701,153 @@ static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
 	qcomtee_object_put(client_env);
 }
 
+/**
+ * is_qcomtee_service_available() - Check if the QTEE service identified by the UID
+ * is available
+ * @ctx: TEE context.
+ * @uid: 32-bit UID of the service.
+ *
+ * Returns true if the service exists and is available.
+ * Returns false if a service is not exposed by QTEE.
+ */
+static bool is_qcomtee_service_available(struct tee_context *ctx, u32 uid)
+{
+	struct qcomtee_object *client_env;
+	struct qcomtee_object *service;
+	int error = 0;
+	bool ret = false;
+
+	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
+		qcomtee_object_invoke_ctx_alloc(ctx, true);
+	if (!oic)
+		return ret;
+
+	client_env = qcomtee_object_get_client_env(oic);
+	if (client_env == NULL_QCOMTEE_OBJECT)
+		return ret;
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
+		pr_err("Failed to get service! error: %d\n", error);
+
+	qcomtee_object_put(client_env);
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
+ * @ctx: TEE context.
+ * @service_uuid: UUID of the service to be registered on the TEE bus.
+ * @uid: 32-bit UID used by QTEE to identify the service.
+ *
+ * Returns 0 on success and < 0 on failure.
+ */
+static int qtee_enumerate_service(struct tee_context *ctx, const char *service_name,
+				  const u32 uid)
+{
+	struct tee_client_device *qtee_service;
+	uuid_t service_uuid;
+	int rc;
+
+	if (!is_qcomtee_service_available(ctx, uid))
+		return -ENXIO;
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
+		kfree(qtee_service);
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
+	int rc;
+	u32 idx;
+
+	for (idx = 0; idx < ARRAY_SIZE(qtee_services); idx++) {
+		rc = qtee_enumerate_service(ctx, qtee_services[idx].name,
+					    qtee_services[idx].uid);
+		if (rc == -ENXIO)
+			pr_err("QTEE does not implement service %d.\n",
+			       qtee_services[idx].uid);
+	}
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
@@ -778,6 +929,8 @@ static int qcomtee_probe(struct platform_device *pdev)
 		QTEE_VERSION_GET_MINOR(qcomtee->qtee_version),
 		QTEE_VERSION_GET_PATCH(qcomtee->qtee_version));
 
+	qtee_enumerate_services(qcomtee->ctx);
+
 	return 0;
 
 err_dest_wq:
@@ -807,6 +960,7 @@ static void qcomtee_remove(struct platform_device *pdev)
 {
 	struct qcomtee *qcomtee = platform_get_drvdata(pdev);
 
+	qtee_unregister_services();
 	teedev_close_context(qcomtee->ctx);
 	/* Wait for RELEASE operations to be processed for QTEE objects. */
 	tee_device_unregister(qcomtee->teedev);
diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
index b1cb50e434f0..4e39e867c3e9 100644
--- a/drivers/tee/qcomtee/core.c
+++ b/drivers/tee/qcomtee/core.c
@@ -896,19 +896,20 @@ qcomtee_object_get_client_env(struct qcomtee_object_invoke_ctx *oic)
 
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
index 878f70178a5b..ecaf8db67d45 100644
--- a/drivers/tee/qcomtee/qcomtee_msg.h
+++ b/drivers/tee/qcomtee/qcomtee_msg.h
@@ -105,6 +105,7 @@ union qcomtee_msg_arg {
 #define QTEE_VERSION_GET_MINOR(x) (((x) >> 12) & 0xffU)
 #define QTEE_VERSION_GET_PATCH(x) ((x) >> 0 & 0xfffU)
 
+#define QCOMTEE_UEFI_SEC_UID            413
 /* Response types as returned from qcomtee_object_invoke_ctx_invoke(). */
 
 /* The message contains a callback request. */
diff --git a/drivers/tee/qcomtee/qcomtee_object.h b/drivers/tee/qcomtee/qcomtee_object.h
index 7bd6e23b038c..f4cb9b8fcbd4 100644
--- a/drivers/tee/qcomtee/qcomtee_object.h
+++ b/drivers/tee/qcomtee/qcomtee_object.h
@@ -316,6 +316,7 @@ qcomtee_object_get_client_env(struct qcomtee_object_invoke_ctx *oic);
 
 struct qcomtee_object *
 qcomtee_object_get_service(struct qcomtee_object_invoke_ctx *oic,
-			   struct qcomtee_object *client_env, u32 uid);
+			   struct qcomtee_object *client_env, u32 uid,
+			   int *result);
 
 #endif /* QCOMTEE_OBJECT_H */

-- 
2.34.1

