Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F276C3C3789
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 10:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785494133; cv=none; b=jEMIp5pNooJ5+Bbpgo2dXC6mEYdWuLa3Vs/NthNj86PYNOwruKY4X6QEKuZ7MBznXHjs9KzpNMhU50zaFyRBA49/+PWEZ0B4Azbf80R7l19TfWhW/BIqcpBxuwn0FblGUHm1SeADsC/GtA9QwvuWqxaTCPrpeVuZx7uRF6TrmA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785494133; c=relaxed/simple;
	bh=Hd9Nn9n09AZNGTV46/QfXFtAJzN5htP275zS75BASFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X3ffYrAH6zJ8Jesc9LmVLyg/EN/0dGo1tCpijfDu8YfkTSXnYwTIbwW5pkja0oMXfSmJNOlR76wTS6JbP6FRYpp9trqIN3het/ADN/W5bin0lmZc0hf1OUaSM+tBeGUYfKaKGmwTJxXjSaFYOxcc3Q8Y7JMcaFFt1zun0s7q+iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bn6YjrBM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NCpmr+ma; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bn6YjrBM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NCpmr+ma"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VAC3b2693321
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 10:34:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NICNV6Yj6xf0uEcuxcYKasRHhguGIhBcucK7mfqbGlY=; b=bn6YjrBMxDUWGq0n
	xun8eaAzs4nixfltJOU2OvkIv2j7y3xA+yDW/iJPPJGxlTJ/vziyHaFu4iSy1tZY
	Nazp1nIRJBJYM5As0pxv9j7twegCnUrLqbrpap746VhUhvHvWyepnMFxwgaVCKTD
	yG7nONOohFtT8uBkivKFoBnM+ClYzFjudjO6QE3tMiNDA2Qfa6bR9XGptydbktZL
	pP1FUMWucMVA9QgXTpR1OrOGpBp5UZSzE9RSk2omOt4qEVTTQJG+v7gLE/moK/7v
	/SFR5rhDI8yJIVYYgXchBrK9DnaPuVGl9xKJei1h7QPKJ3Zhxe7l3by+2dSsVIbb
	oVm8qg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frsn503be-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 10:34:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc86a9ef97so14932875ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 03:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785494078; x=1786098878; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NICNV6Yj6xf0uEcuxcYKasRHhguGIhBcucK7mfqbGlY=;
        b=NCpmr+maTUP6cf8poWrOVopSDrYYeAMa08kTDSW/+iUrrCMP4Z+JOzb5B/EXIzTRdg
         Du6XBGzwFyIKAgErtndSs8de/vnz1UgrfaNSnlv1xYppmLm+kHVwbctm/5o1SlYRTt5T
         V/hamWZqoYK3EuaaIrHWsSpVtT2ziVmj+X9rG5eDs/YQQNlhstnqfcpmiRiTUpZzadl5
         KOLQ9LPCGWQw9rfQzepmOgYUiAJR+DMqQQvF0um/yO7+SC/iyFedLjDdR3WLM0PpoWUU
         0b9fw7lCCfubmQXLjwp+hhNKuxGONPRPnc5E0mZs5gG2NdGBZitPnGt7jjE5cQETvhzt
         1ElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785494078; x=1786098878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NICNV6Yj6xf0uEcuxcYKasRHhguGIhBcucK7mfqbGlY=;
        b=Kqc26BsAn+Codz+0kWAdgqw+8hOMp66P8k4zlyZn8YJ07VuIMKlQ47tF11nxH0k2hx
         cK/6CcJ8U22aezIHF3HrKawOLCKmV7UqjlH7eJLT2N5WlsLNzVzRqXf1pQ/gsYAS2alF
         XBirdyTCVLX9PE0Mn/x08qROa4cPydV3nIKvwN+SvtOMhbkuUZeyFn6qBVnLUBlP7qL+
         ZjFkgbtD/fUHvkrx2iyMGXpJDh0a6h7c+zjwB/MEpvsDUXhuqHX29LTq8jXNNqFAj8wE
         aU5+W6roH419x2Eo98rykKUB1k+ViQ8FrNIuvQxGGT8hYfvuqWM4Pmhycp02AjXwmBV0
         eDZQ==
X-Gm-Message-State: AOJu0Yyrj6jf68vhshMqxOuU3pF8jtjLjnEu7MS1mv3ptlGVvnSn0Of6
	nwLyabvn54TVDdEqBTMlntb0JuVMrJrUrws7WkeVN9IAUA14SqbuWyIvNVATgRVFVP2/9oCO1Wi
	pwARC3/wv76/02OUipvnkjQmmFcJcnChWHAkGVW0f3CwNLdPiD72fygU81Vgje3BiBSgx
X-Gm-Gg: AR+sD12nvm2UusciKPx2eU0dj7FyCrTbyxmGWdmdI3wMnLY+P86fUq7h5Bm3JWN6fIp
	KE7Pv+2tErZEBJPMPiAQHxatzsV3YsiHiDUWhJ9s2Vikm2dOF8diTCEKGPcWV3oD5IOlCMxsXzd
	+uP3IUhGLM9nAC0jCuen2zOcmIuBklFy+l9BJPY6TEAAJ8qFwWszgqT4KLVhKtR3AIv2zaiAo1Q
	2h3WL6+3bdE9qC5zdeCkHav2LS+oICRjwipcGHmltnsXPLQvO+9mkRkfnbZw2I7RSHLgR+//Cjz
	AtvadmrpCInfE8LpaCBpTrFlGhif+8p+s4c1VUnnecCnrQ/qRxrbpc5FrG7bI5++3e8cvcz5F4N
	M8S4IgveoKqnojVVANHlkJNeqn93KMg==
X-Received: by 2002:a05:6a20:d49b:b0:3c3:a024:1360 with SMTP id adf61e73a8af0-3c91b178f9cmr1395952637.28.1785494078300;
        Fri, 31 Jul 2026 03:34:38 -0700 (PDT)
X-Received: by 2002:a05:6a20:d49b:b0:3c3:a024:1360 with SMTP id adf61e73a8af0-3c91b178f9cmr1395911637.28.1785494077777;
        Fri, 31 Jul 2026 03:34:37 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18e114sm8493680eec.28.2026.07.31.03.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 03:34:37 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 16:03:43 +0530
Subject: [PATCH v7 3/9] remoteproc: qcom: pas: add support for TMD thermal
 cooling devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-b4-qmi-tmd-v7-3-3befd44403d5@oss.qualcomm.com>
References: <20260731-b4-qmi-tmd-v7-0-3befd44403d5@oss.qualcomm.com>
In-Reply-To: <20260731-b4-qmi-tmd-v7-0-3befd44403d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785494047; l=5213;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=Hd9Nn9n09AZNGTV46/QfXFtAJzN5htP275zS75BASFg=;
 b=u4LVE8VlbhpIQsKunFC1H5L4T9IJPS59/MxfSnB4jWXl8opvygYQZdvvGGgw77afEXc5sT94v
 XG3JBZ3snhxD7+C92f0OAyCcAEt/VrC0WWcpIa0PU24eawJ4YOeBBr6
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-GUID: LNe9NavdfXbXoOftNYQR-SOxrsKDN2Y0
X-Proofpoint-ORIG-GUID: LNe9NavdfXbXoOftNYQR-SOxrsKDN2Y0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA3OSBTYWx0ZWRfX+sa+QdBk9Heq
 78FrJ82cjqr1vdestQzm6AawEXjJqY3/N9hwvIF4FZ9M9rdeRl64WnLh2mPAkJt/9LMkpDT2mmw
 ZJhsjR3cZUeFewqeDJwpiXuLXKyYjZM=
X-Authority-Analysis: v=2.4 cv=ScbHsPRu c=1 sm=1 tr=0 ts=6a6c7a3f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=p67dmK6jBiiEd9TVeScA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA3OSBTYWx0ZWRfX+HPb+E5ghu+r
 93gTxx5/VpPRZ+cNEbGDUzWU7jqX3R80V3Pj8k38260GaY+LRUpGNMJzf5AM//5ykB9y2PcopVb
 pZK4RfsGty569c/gLWTjsHFDrte1Cm54T3qoePvSnqcKZQE57+U16vGXjL42UkzT3dtpkq395OP
 WuHTBoIQ58Mac5d7yePEP90gwZ5JPoyo7c5gtw2do9cw8eVN1SNKDerfHm3No18dPL369PPGBkr
 NV84ygq7Bq+Fnd2Z69Lqn6oVRnmkq+X7wvceaSjPtxkdQJciEdoH9Ib32mKIm9mIdUC263JLaj1
 8mRVjDfctycL413UAYhFnlu2MLnDw/5CnHCW9XsrdkGuZWsN/yb8Nz/mBn3t+ZcaW1WgrWq3Y5G
 SoY39EngLh+dA4dDx+MOznStXvxsFLS8X8K0O0+4xCUpa2yeRf94DutmcLR/XPqiYWN0SW6tWc5
 tmucLpoFHGxhUcZFbjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310079

Register Thermal Mitigation Devices (TMDs) for PAS-managed remote
processors to enable thermal throttling through QMI.

This allows the thermal framework to request mitigation when remote
subsystems such as modem and CDSP contribute to thermal pressure.

Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 drivers/remoteproc/Kconfig         |  1 +
 drivers/remoteproc/qcom_q6v5_pas.c | 90 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 90 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 65befdbfa5f7..152d7a53aa09 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -229,6 +229,7 @@ config QCOM_Q6V5_PAS
 	select QCOM_PIL_INFO
 	select QCOM_MDT_LOADER
 	select QCOM_Q6V5_COMMON
+	select QCOM_QMI_TMD if NET
 	select QCOM_RPROC_COMMON
 	select QCOM_SCM
 	select QCOM_PAS
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 25599d728208..b9c01ce5024e 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2016 Linaro Ltd
  * Copyright (C) 2014 Sony Mobile Communications AB
  * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/clk.h>
@@ -26,8 +27,10 @@
 #include <linux/regulator/consumer.h>
 #include <linux/remoteproc.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/soc/qcom/qmi_tmd.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
+#include <dt-bindings/thermal/qcom,pas.h>
 
 #include "qcom_common.h"
 #include "qcom_pil_info.h"
@@ -38,6 +41,16 @@
 
 #define MAX_ASSIGN_COUNT 3
 
+/**
+ * struct tmd_name - TMD device name to cooling-device index mapping
+ * @name: TMD device name
+ * @id: Cooling-device index used as #cooling-cells cell 0 in DT
+ */
+struct tmd_name {
+	const char *name;
+	int id;
+};
+
 struct qcom_pas_data {
 	int crash_reason_smem;
 	const char *firmware_name;
@@ -58,6 +71,10 @@ struct qcom_pas_data {
 	int ssctl_id;
 	unsigned int smem_host_id;
 
+	unsigned int tmd_instance_id;
+	const struct tmd_name *tmd_name;
+	int num_tmd;
+
 	int region_assign_idx;
 	int region_assign_count;
 	bool region_assign_shared;
@@ -122,6 +139,8 @@ struct qcom_pas {
 
 	struct qcom_pas_context *pas_ctx;
 	struct qcom_pas_context *dtb_pas_ctx;
+
+	struct qmi_tmd_client *tmd_inst;
 };
 
 static void qcom_pas_segment_dump(struct rproc *rproc,
@@ -798,6 +817,64 @@ static void qcom_pas_unassign_memory_region(struct qcom_pas *pas)
 	}
 }
 
+static int qcom_pas_setup_tmd(struct qcom_pas *pas, const struct qcom_pas_data *desc)
+{
+	struct qmi_tmd_client *tmd_inst;
+	const struct tmd_name *tmd;
+	const char **tmd_names;
+	int i, ret;
+
+	if (!device_property_present(pas->dev, "#cooling-cells"))
+		return 0;
+
+	if (!desc->tmd_name || desc->num_tmd == 0)
+		return 0;
+
+	tmd_names = devm_kcalloc(pas->dev, desc->num_tmd,
+				 sizeof(*tmd_names), GFP_KERNEL);
+	if (!tmd_names)
+		return -ENOMEM;
+
+	for (i = 0; i < desc->num_tmd; i++) {
+		tmd = &desc->tmd_name[i];
+
+		if (tmd->id >= desc->num_tmd) {
+			dev_err(pas->dev, "Invalid TMD id %d for '%s'\n",
+				tmd->id, tmd->name);
+			return -EINVAL;
+		}
+
+		if (tmd_names[tmd->id]) {
+			dev_err(pas->dev, "Duplicate TMD id %d for '%s'\n",
+				tmd->id, tmd->name);
+			return -EINVAL;
+		}
+
+		tmd_names[tmd->id] = tmd->name;
+	}
+
+	for (i = 0; i < desc->num_tmd; i++) {
+		if (!tmd_names[i]) {
+			dev_err(pas->dev, "Missing TMD mapping for id %d\n", i);
+			return -EINVAL;
+		}
+	}
+
+	tmd_inst = qmi_tmd_init(pas->dev, desc->tmd_instance_id, tmd_names,
+				desc->num_tmd);
+	if (IS_ERR(tmd_inst)) {
+		ret = PTR_ERR(tmd_inst);
+		if (ret == -ENODEV)
+			return 0;
+
+		return ret;
+	}
+
+	pas->tmd_inst = tmd_inst;
+
+	return 0;
+}
+
 static int qcom_pas_probe(struct platform_device *pdev)
 {
 	const struct qcom_pas_data *desc;
@@ -925,16 +1002,24 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	if (desc->early_boot)
 		pas->rproc->state = RPROC_DETACHED;
 
-	ret = rproc_add(rproc);
+	ret = qcom_pas_setup_tmd(pas, desc);
 	if (ret)
 		goto remove_ssr_sysmon;
 
+	ret = rproc_add(rproc);
+	if (ret)
+		goto remove_setup_tmd;
+
 	node = of_get_compatible_child(pdev->dev.of_node, "qcom,bam-dmux");
 	pas->bam_dmux = of_platform_device_create(node, NULL, &pdev->dev);
 	of_node_put(node);
 
 	return 0;
 
+remove_setup_tmd:
+	if (pas->tmd_inst)
+		qmi_tmd_exit(pas->tmd_inst);
+
 remove_ssr_sysmon:
 	qcom_remove_ssr_subdev(rproc, &pas->ssr_subdev);
 	qcom_remove_sysmon_subdev(pas->sysmon);
@@ -962,6 +1047,9 @@ static void qcom_pas_remove(struct platform_device *pdev)
 
 	rproc_del(pas->rproc);
 
+	if (pas->tmd_inst)
+		qmi_tmd_exit(pas->tmd_inst);
+
 	qcom_q6v5_deinit(&pas->q6v5);
 	qcom_pas_unassign_memory_region(pas);
 	qcom_remove_glink_subdev(pas->rproc, &pas->glink_subdev);

-- 
2.34.1

