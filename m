Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7F93E1225
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 10:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785494075; cv=none; b=e2860UB7ZaIsFnyqYjtL2+WHxXWlYivW7QgxXGlGx9l8q0cRUY2TYtSQPgr95s3tHTqnWYkdbQ8NfI7FdJiKpyEBBYax81zbhUDDVPAiBOuPllxGDH5wwvNp1DaTgG9fnbdXLC2THNWNGsO6Js3OLG8jaW2A2L3sUrZmnZ5s2mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785494075; c=relaxed/simple;
	bh=LjX2uu5uRns9aB9+huzFuwyv8G8eDp/UqYn/3VCYmRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tng6D0FS8/QXars4UuFUlVAHCw1BEW5spes3HNGFc/LK7LKD6oHkWZ/9OqikpmWmSQE7v5QnZzW0m5IG2x51BRbey/E0KWIbsC9S1e0VWtHs0bN/mesO85hvdIoW92bdvDAlStQKQJZgwEDrsH4r5hNudSVe15zFNVuO7Uum3QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VpAZ9TyE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UycNZF4n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VpAZ9TyE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UycNZF4n"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VAC4hX3891578
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 10:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pYF9h6alUVBD7tym5vNqQYIx2ehof1mwtVNRI9CjH2w=; b=VpAZ9TyEoc15/jBZ
	BcEWFlksd+tNz2xLa5zhh8EJLwlzJlClxyh22KrknxFZ2NGmervUkceyJQSlYXYl
	jwdhzgkZN+vPQ7smfn/hRKxtAfaj2qAN5dR1PFFe5B0YBsL/IQBE0VXAh0UBaFXe
	6e4iAAKnaRAngoPauGatFB5fzAOhF2e9727ns9t5MCRIKVFURNrGvPCovI5/zrgr
	OzJzUZ5xAc02HLTvHuPCPjmKUAH1SGcyyJkrFg1JyrOjqQPFI5ERy2nQDySffj0I
	FBQe4ZrHXP6pRrfWwTtHSI6oDJFM7qXhha2G9cYdA0TJfu0CrSK4CduOhtyCq4Yb
	6ys3gw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frsm383pn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 10:34:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccb687f82eso12027695ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 03:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785494063; x=1786098863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pYF9h6alUVBD7tym5vNqQYIx2ehof1mwtVNRI9CjH2w=;
        b=UycNZF4nGPTuyW9c8AYwlH7MUX6qqsT/Is04HTtItzqo10LhEAELxtTgV96SRR3NxB
         Le5Z5yntQvszxFJoDbzKlwkcTMt3yXWXGHJMyUW2m+HSJwjjq2hYbM7RZ9nEjcB3ZZbS
         rmunmWCdTBaOaajXtVcwgw0r+4f6ELGYbOufWr1VdmgbNRDhTmO9PbKn3glwM+n+uCUk
         HaT5EvB5a7FWIneU4Ev2xP/43HR5tsN0g5Be+h/NEPgIZ7jcFI185BWudA7ytKc17oo+
         918EMpKPNK+PRXY6lbZzC4BXRHWDLnNQI0SOaabGDW+y4+Jx7v2SrQgvHTa1WCj3DQuE
         CwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785494063; x=1786098863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pYF9h6alUVBD7tym5vNqQYIx2ehof1mwtVNRI9CjH2w=;
        b=MoTjcl7UcEOFlB1YjTOCGCedTdbBUmD2LlenEKw+240gD1TR6WU/3X7GyZdTDGXlTx
         kNGKPcuIRWlzcw/PZHvkppT9da9nUfrATFY5CBWUq+f1Qd62XIWSwzOvqhhmshr8GD5j
         5iW9NvbEHSFYbkn/QELdWnrc2hHgBxFxtsQ2P/105SrSFiCrKrXMp70E5j1D9Tl45c7W
         K2wEqQh0KYdrJwPtsbGFCoSD0yVaEs4woPV6ypzLyxq7gczle1SpMM+RQ5q+FM3BGKw7
         7fEUyYc4CyTkiRhdNezdsALCpJ9Vsm3mTWLjzLjgS5x8pudfA+qUxot3jsUhy8Tcn19Q
         GSBQ==
X-Gm-Message-State: AOJu0Yxoe9pXk3QGd9ylGh4oIjbCinUqdp0JrZOjzhEQT0VchnedlmPy
	NbKr8jit4qGzN68o1Lb525JOp9O3qeun6F8mWPHgYT4zeDZ2tRatyoO5k7KSN9B32oOfbTyH1t5
	/7XbUoYG+ZosLm9w3nXwKfnbnLl0q9s4bmo6O+efnzQxmN8UZVR+k+TVBvmFlwFUiS93T
X-Gm-Gg: AR+sD102oxpoEG+FvXxyyPLK2PljglUPhLwcnBnnfhpDgj79OLCjJXWwlIAF0FLR4ge
	wcwnuiUJoFmzNE6/OxQ3Ybymox3c+SywpPoRYGH1UdAdUnoOFexO7WoMnN6xjj5gSzp4ZNkj08O
	t3qFLyFY6xb6YtjeJ+oJWbXGN8bbSQ2L40X9Ro9eJI5rJNRq3lEf6MVYR5AqSeyM0nhkwcWPO0Q
	pk20kDdQYtlMZ0ImboTfxAQqniX55OHnHllt+OAn56RCYDS/32p+FLovCPFTkXsUijQjxPO2nOc
	DZKQ46xQ4mjuiMTBJQLwiH5q3Jqvu/czYEsPlNxA5y3wg+JQUitGjgpFTmF+gr8ur1pwJC4PLWW
	Yt8c5Fw0EkauOTke4A7qoVtvcusbAyA==
X-Received: by 2002:a05:6a21:790:b0:3bf:49c8:f7b with SMTP id adf61e73a8af0-3c91b08f204mr1566993637.13.1785494063366;
        Fri, 31 Jul 2026 03:34:23 -0700 (PDT)
X-Received: by 2002:a05:6a21:790:b0:3bf:49c8:f7b with SMTP id adf61e73a8af0-3c91b08f204mr1566958637.13.1785494062924;
        Fri, 31 Jul 2026 03:34:22 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18e114sm8493680eec.28.2026.07.31.03.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 03:34:22 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 16:03:41 +0530
Subject: [PATCH v7 1/9] dt-bindings: remoteproc: qcom,pas: add
 #cooling-cells property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-b4-qmi-tmd-v7-1-3befd44403d5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785494047; l=3338;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=LjX2uu5uRns9aB9+huzFuwyv8G8eDp/UqYn/3VCYmRY=;
 b=+Ty/Bcvly1jI+WWQz/dApbymnZLZER2rXS661XRs7pe3SHqPe/N0DFN3Z0fT9/uJVNWsaPp1W
 JJRfLpyXyJSDyCoaqmH+yLurQ5VxvNfbF8+46zkOH9FFdOLqDqrKLNM
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA3OSBTYWx0ZWRfX+DGs56hx4F8s
 m/TnbMafyUinT+P6NDofDmEdzMP8VMpIN/a33pO8ifBfiFUFh7LM2/ApqczupPCHFeExSEJJ9ZF
 BQ7R/dIPZ2R1AnzvDqVCKUGLrLzIv5M=
X-Authority-Analysis: v=2.4 cv=cpCrVV4i c=1 sm=1 tr=0 ts=6a6c7a30 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=T6nhelsJTOTiISQcNXMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: aTKPuT4EemBxDGih-6OVXIPYDjGag8wI
X-Proofpoint-GUID: aTKPuT4EemBxDGih-6OVXIPYDjGag8wI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA3OSBTYWx0ZWRfX0tgiQsc9XJpB
 PiP2tB/rFhSYx9axm7+G1LzNkVrWek9lyDHZLRLfAM76Wg4dv5PyFVpvwcrBsl1qALrD6kEnhSC
 NeMP+YsLHUNTFNE3CvlwA2H7EXKZtsSXlwrc5+kDTnAWO8me6C6P6OBOP44IM/I9F35uAoI6MlW
 3a/XZ0kZEi0gP9e6cSl2rs9vFmfmmuqc0H50o0dUNvdyeXBElIenmk3kOAJ3pFHVQ7PiIvdC3i6
 tZZ98oi/qfyDpTMxh+nJrJQZGqbiSft6J8oXbk+h0SoSpwvBdJMjtMZT1EmBfeh2zQ3YA2LfeH3
 s3PWXaWQLTCHPd3iA8CKdF8/0w+wSjcIBMx2zdiaIzchouZVJsrOfpKy3RluaK3RVTChSzjHvtm
 FE4j5Llhvlov3p2+XACh4FswisF5IcB07gwPw/4zxGpQXNXrezzzck/RzPJq6RuG7urmtPwoLfA
 ii5hiNwGe6HQ/SdVJBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310079

Document the optional #cooling-cells property for Qualcomm PAS
remoteproc nodes so they can be used as thermal cooling devices via
the QMI Thermal Mitigation Device (TMD) interface.

Qualcomm remote processors expose TMD endpoints that support thermal
throttling through firmware. The cooling-device specifier uses 3 cells:

  <&phandle device_id min_state max_state>

where device_id selects the TMD endpoint (for example PA, modem, or
CDSP software mitigation), with constants defined in:
include/dt-bindings/thermal/qcom,pas.h

Example usage in a thermal zone:

  cooling-maps {
      map0 {
          trip = <&cpu_alert>;
          cooling-device = <&remoteproc_cdsp
                           QCOM_TMD_CDSP_SW
                           0 THERMAL_NO_LIMIT>;
      };
  };

Acked-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,pas-common.yaml         |  9 +++++++++
 MAINTAINERS                                          |  1 +
 include/dt-bindings/thermal/qcom,pas.h               | 20 ++++++++++++++++++++
 3 files changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index 11faf655f530..f75cab6b4ed9 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -77,6 +77,15 @@ properties:
       channels and devices related to the ADSP.
     unevaluatedProperties: false
 
+  '#cooling-cells':
+    description: |
+      Cooling device with three cells:
+        Cell 0: Cooling device id as defined in
+                include/dt-bindings/thermal/qcom,pas.h
+        Cell 1: Minimum cooling state
+        Cell 2: Maximum cooling state
+    const: 3
+
   glink-edge:
     $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
     description:
diff --git a/MAINTAINERS b/MAINTAINERS
index dcffe9fc54f6..3f1e2bbf7099 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3423,6 +3423,7 @@ F:	drivers/watchdog/gunyah_wdt.c
 F:	include/dt-bindings/arm/qcom,ids.h
 F:	include/dt-bindings/firmware/qcom,scm.h
 F:	include/dt-bindings/soc/qcom*
+F:	include/dt-bindings/thermal/qcom,pas.h
 F:	include/linux/firmware/qcom
 F:	include/linux/soc/qcom/
 F:	include/soc/qcom/
diff --git a/include/dt-bindings/thermal/qcom,pas.h b/include/dt-bindings/thermal/qcom,pas.h
new file mode 100644
index 000000000000..f603bddef9a8
--- /dev/null
+++ b/include/dt-bindings/thermal/qcom,pas.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Qualcomm PAS remoteproc cooling device indices
+ *
+ * These indices are used in device tree cooling-maps to reference
+ * specific TMD devices provided by PAS-managed remote processors via QMI.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#ifndef _DT_BINDINGS_THERMAL_QCOM_PAS_H
+#define _DT_BINDINGS_THERMAL_QCOM_PAS_H
+
+/* CDSP thermal mitigation device id */
+#define QCOM_TMD_CDSP_SW	0
+
+/* Modem thermal mitigation device id */
+#define QCOM_TMD_PA	0
+#define QCOM_TMD_MODEM	1
+
+#endif /* _DT_BINDINGS_THERMAL_QCOM_PAS_H */

-- 
2.34.1

