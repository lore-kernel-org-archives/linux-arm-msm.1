Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D403EA94C
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 21:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784842791; cv=none; b=q1PpKHuH4ZpP2Hq3Jf2pS2868L0wmAe9ZyJoME3nTwRS1aFAYm9H+d0fBQBOUbpSSPZhG0+z8R6foQQTZ5xZmJjbiLdLrF9g2YYgZBrxO5/biDVxnnLFr0PTSvHntbvmw0cj/widko4IquSKlJiQoZGqMpUgNYr2FLqVu9zDVR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784842791; c=relaxed/simple;
	bh=UlHHjeUs4qtF7+tlF/1bOMeXAjrF3fHbE7UjpwQKG8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=adLgGlTY7APGLZlMs+jXEaX6BYg3MRW3DcugUZesBMYYXLO/2A5vBhvuMtBRWtcvqUSAK0SSQdyhosoeUd7AgIoOR0EsV/R8U3RwmCEFQyXRj9mQOc27m7dEtoKa19uL1ipcab6iIutGlCcL49amJwHUBrzW15N+RMGGg4vNcxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PJzfTAU9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ep3GNN/8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PJzfTAU9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ep3GNN/8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NImGGU575384
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 21:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fDlxtjvdkhwl9Rdwpe34LqXjiMLtoLJH3Z8dev61p+g=; b=PJzfTAU94Z8wP4OU
	/nn/On5ZSxwwdfR6I453unSl7UW4A3+4NQjYoxCjGjkvN4NTBngTzSYERZuc4/Pf
	xYXXFfBfuoPk0s1nrYfeowleC9qDARHtrAbK4tYWj6u0eFCsyZntep8b0nuuQ4TO
	NknTR8DtZk0o9AZ6PIHbTV57uR5a+iCEvB+4Rr+CWDTc8EErwHXROR2tJbrX42YB
	XQLeRC8Jc/Q6d/zNbBnavEaH70Zruu3C8yLkGICuebNxL6wUtilwS4RF5eefnN5D
	HVG1Dr1+IAsdF2sVixcTe5ffssht8tpXb9g+hqvGdhdTywp4mRfh9Jo3z3WmWn0T
	409HlQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fke0kupnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 21:39:41 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c856470fe9fso994925a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 14:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784842781; x=1785447581; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fDlxtjvdkhwl9Rdwpe34LqXjiMLtoLJH3Z8dev61p+g=;
        b=ep3GNN/888bv8OCAFgqDS0gnNW2msaUNU2xsXxxI7yUDKKnem7MVCfhNCbejS631Nm
         X1/q62uPiTn+63MO3Gjzo2kLrk4tTY2mBLYOdbWXdDTeMGkrNG2g3p81iy2/wyS61BNf
         1CGTGSpLYJeZDMqGavS6sSzLlh9Ui9u7n6m5iSY9SoAjm9wy5GXGyyzYG01xJspffj38
         0/X8tJZSOHnKjr0DFPwTa1I2t1QrBXWVEWNC0U5Ov5R1Dnf9tvXDp6y3bcXKiK75UI24
         o3YMOXsXDa6z7v2nLvdXyAf6Jcz/5ICHITc9CSGUpwg44xkZda4biL1PA5sMtxaLPUb2
         Spng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784842781; x=1785447581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fDlxtjvdkhwl9Rdwpe34LqXjiMLtoLJH3Z8dev61p+g=;
        b=gHooCkDvAMWl7zA3s08qQszUnVNOC3Yl6Bal7HnhDtheIw7udX2qYIF5+CkhP3BcsQ
         jbBr/xii62JU/vIAKI7kphfOe5jjsbyF+9kdl/Dh8dzw4ty7vMJJXln63cyEc7bjzs6m
         NYBwpiFQJ7FslZ9aJqC06xvyj4v0wmhAX5TCqhYdwalCKMAywr3eP0DMkGXQHYxa3NyN
         Vf7qGm1XXoQrS3S8muyQUrXgfufEqQgcEGwiW+71bESNhrQRjLKU4R09ZchstTbFxr29
         ExTPPRTLdVJOq+iSSNTpl2A9bpMjCxHhG+G/nnnm+AZyCTpfKHmntFhsZWttMJkMBnZU
         yKYQ==
X-Gm-Message-State: AOJu0YwgKsUtQlNesxLgNKURCYMknb/tKyZfR3Wzv3v8WyTKfLbVTZMs
	Dywph6SCat/jhpFwwrXVvm4Q45BqCH5o1Zf9OexX+s4u89qgtSOFylJsQsIFz3zcT+6xGtTjbpp
	lHBwQKDO6413L7Yj00hPRXf+VJ3fCXVHwQBc8rn8tBNYMi8rDZiuh91FJXpcQ1mBazxpv
X-Gm-Gg: AR+sD13Gn2VklNC43lOzcijlvQENYM/M8PWv7xejgLL9op1phUIhD6O4vdiXAq0Nk9Z
	Jq9YNRGHz3W5xnNvYFz1hmNx1zWpoJdcAH5EYrCua1Nhyy1XkQpltnpvsfZo9uQOzf5+hozCJ00
	IHTbj7TFT4uDK4s734XyB5KCtointE3Y2O7am3IvoqBWNfkpqx7GO4U/oGLQ5+32tSWW6YnJIua
	lKdJ/0vnukYWmPSyWyPOl1ipmFnYcQPW7udFRET15UEUL1T0FhwMHcXi4ZzpUHBpbq6DNi/7hyf
	tk2SdC8YBGVfPqLL1BggJVeC3lOVyb339MvkzgUpvAnqK51FnPBBRN6caZzqALrFZD7uKBsiVMy
	hLCMACnPbQqKUP5rJ70+5XsVF5g+Ec8+YRh/USUFkZvRNXGBjIeWtZcQ=
X-Received: by 2002:a05:6a21:69a:b0:3bf:7498:9cd1 with SMTP id adf61e73a8af0-3c44b159054mr5423724637.45.1784842780615;
        Thu, 23 Jul 2026 14:39:40 -0700 (PDT)
X-Received: by 2002:a05:6a21:69a:b0:3bf:7498:9cd1 with SMTP id adf61e73a8af0-3c44b159054mr5423697637.45.1784842780076;
        Thu, 23 Jul 2026 14:39:40 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e070538sm22904174eec.20.2026.07.23.14.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 14:39:39 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 14:38:57 -0700
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Add Hawi camera clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-camcc-hawi-v1-1-7057658c5c47@oss.qualcomm.com>
References: <20260723-camcc-hawi-v1-0-7057658c5c47@oss.qualcomm.com>
In-Reply-To: <20260723-camcc-hawi-v1-0-7057658c5c47@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784842777; l=8640;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=UlHHjeUs4qtF7+tlF/1bOMeXAjrF3fHbE7UjpwQKG8Q=;
 b=DH2txUeMcn2KgSwzF+P7qKdzAaUtztSWsXdP+9buQ7FxYeOQ1Hcx94LZWn7A1XUhMO70VYaUQ
 JLXn3TcRlRXAD3khwYpiM8xnT44FeXyFW0dkAFm7FISNbyGI5sS185m
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-ORIG-GUID: r0E6tM0kRNlS-1bIZs8a-ZiS6bebT1lf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDIwOSBTYWx0ZWRfX5ElneQ7nmbb8
 r/8ebRY9PefsOLsVzL7VhvYVvalK4rlH6KJsoWlTf+XG+syhy/5mXkgRe/L/XRyI3/7ZXeevE0b
 VplABP5xLFOwQ6NbsaPbKW2W4EsY20M=
X-Authority-Analysis: v=2.4 cv=S7DpBosP c=1 sm=1 tr=0 ts=6a628a1d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=EHHCaTPsYsbjK_O0ER8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: r0E6tM0kRNlS-1bIZs8a-ZiS6bebT1lf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDIwOSBTYWx0ZWRfXxAFM00LhYSxp
 XAjQanus7WHARocGadm9HUPKRclgD+3NL9hd+f/m442lHWq+WyrcBcmjizC4KSQxIHOmPplWcTb
 ydGwOIh6gOBnVkDxViai38/7xUd1Yu33IxHt5co5fjrDSqMZV/lD/Lb066fxaLVoyWlXEz8cbMh
 3SpD+zPMe8lixSPR50zgYCB4d8mFeI0Ydqs8qr72kh5C6obc0eZNOxWsPpT49wkPe4gVlVhIiXw
 X7a/jHXbWvGxpHaaQQOVMiEjYTkYfDpn3ZubCMhy0oePvL5tp9RrIOpetxQMFD+k/Dfs1HoxHS3
 fNpiA3aog0gZSiC9gMQqSJB3Mgvg6fuuHhD5smLxelmtt4OKCR5v9JRSB5EZXvKXJ8e2095mvJK
 qt8zZs4JL/OBtBYNtKo5bHPynZh7vA4KfOj2m/24vGJIi2BjwwJBQ6s1KqZ8FjVMD7X62GTae2n
 oPotW9RkiNm1Bi6IkyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_06,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230209

Update the compatible and bindings for camera clock controller (CAMCC)
support on the Qualcomm Hawi SoC.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-camcc.yaml          |  36 +++--
 include/dt-bindings/clock/qcom,hawi-camcc.h        | 165 +++++++++++++++++++++
 2 files changed, 192 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index b41247b257b1..cdc19418c064 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -16,6 +16,7 @@ description: |
   domains on SM8450.
 
   See also:
+    include/dt-bindings/clock/qcom,hawi-camcc.h
     include/dt-bindings/clock/qcom,kaanapali-camcc.h
     include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
     include/dt-bindings/clock/qcom,sm8450-camcc.h
@@ -26,15 +27,21 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,kaanapali-cambistmclkcc
-      - qcom,kaanapali-camcc
-      - qcom,sm8450-camcc
-      - qcom,sm8475-camcc
-      - qcom,sm8550-camcc
-      - qcom,sm8650-camcc
-      - qcom,sm8750-cambistmclkcc
-      - qcom,sm8750-camcc
+    oneOf:
+      - enum:
+          - qcom,hawi-camcc
+          - qcom,kaanapali-cambistmclkcc
+          - qcom,kaanapali-camcc
+          - qcom,sm8450-camcc
+          - qcom,sm8475-camcc
+          - qcom,sm8550-camcc
+          - qcom,sm8650-camcc
+          - qcom,sm8750-cambistmclkcc
+          - qcom,sm8750-camcc
+      - items:
+          - enum:
+              - qcom,hawi-cambistmclkcc
+          - const: qcom,kaanapali-cambistmclkcc
 
   clocks:
     items:
@@ -67,6 +74,17 @@ required:
 
 allOf:
   - $ref: qcom,gcc.yaml#
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              enum:
+                - qcom,kaanapali-cambistmclkcc
+                - qcom,sm8750-cambistmclkcc
+    then:
+      required:
+        - '#power-domain-cells'
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/qcom,hawi-camcc.h b/include/dt-bindings/clock/qcom,hawi-camcc.h
new file mode 100644
index 000000000000..6ef731738e6e
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,hawi-camcc.h
@@ -0,0 +1,165 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_HAWI_H
+#define _DT_BINDINGS_CLK_QCOM_CAM_CC_HAWI_H
+
+/* CAM_CC clocks */
+#define CAM_CC_CAM_TOP_AHB_CLK					0
+#define CAM_CC_CAM_TOP_FAST_AHB_CLK				1
+#define CAM_CC_CAMNOC_DCD_XO_CLK				2
+#define CAM_CC_CAMNOC_NRT_AXI_CLK				3
+#define CAM_CC_CAMNOC_NRT_CRE_CLK				4
+#define CAM_CC_CAMNOC_NRT_IPE_NPS_CLK				5
+#define CAM_CC_CAMNOC_NRT_IPE_SCALERS_CLK			6
+#define CAM_CC_CAMNOC_NRT_OFE_MAIN_CLK				7
+#define CAM_CC_CAMNOC_NRT_SQPF_CLK				8
+#define CAM_CC_CAMNOC_RT_AXI_CLK				9
+#define CAM_CC_CAMNOC_RT_AXI_CLK_SRC				10
+#define CAM_CC_CAMNOC_RT_IFE_LITE_CLK				11
+#define CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK				12
+#define CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK				13
+#define CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK				14
+#define CAM_CC_CCI_0_CLK					15
+#define CAM_CC_CCI_0_CLK_SRC					16
+#define CAM_CC_CCI_1_CLK					17
+#define CAM_CC_CCI_1_CLK_SRC					18
+#define CAM_CC_CCI_2_CLK					19
+#define CAM_CC_CCI_2_CLK_SRC					20
+#define CAM_CC_CORE_AHB_CLK					21
+#define CAM_CC_CPHY_RX_CLK_SRC					22
+#define CAM_CC_CRE_AHB_CLK					23
+#define CAM_CC_CRE_CLK						24
+#define CAM_CC_CRE_CLK_SRC					25
+#define CAM_CC_CSI0PHYTIMER_CLK					26
+#define CAM_CC_CSI0PHYTIMER_CLK_SRC				27
+#define CAM_CC_CSI1PHYTIMER_CLK					28
+#define CAM_CC_CSI1PHYTIMER_CLK_SRC				29
+#define CAM_CC_CSI2PHYTIMER_CLK					30
+#define CAM_CC_CSI2PHYTIMER_CLK_SRC				31
+#define CAM_CC_CSI3PHYTIMER_CLK					32
+#define CAM_CC_CSI3PHYTIMER_CLK_SRC				33
+#define CAM_CC_CSI4PHYTIMER_CLK					34
+#define CAM_CC_CSI4PHYTIMER_CLK_SRC				35
+#define CAM_CC_CSI5PHYTIMER_CLK					36
+#define CAM_CC_CSI5PHYTIMER_CLK_SRC				37
+#define CAM_CC_CSID_CLK						38
+#define CAM_CC_CSID_CLK_SRC					39
+#define CAM_CC_CSID_CSIPHY_RX_CLK				40
+#define CAM_CC_CSIPHY0_CLK					41
+#define CAM_CC_CSIPHY1_CLK					42
+#define CAM_CC_CSIPHY2_CLK					43
+#define CAM_CC_CSIPHY3_CLK					44
+#define CAM_CC_CSIPHY4_CLK					45
+#define CAM_CC_CSIPHY5_CLK					46
+#define CAM_CC_CX_GDSC_CLK					47
+#define CAM_CC_DRV_AHB_CLK					48
+#define CAM_CC_DRV_XO_CLK					49
+#define CAM_CC_FAST_AHB_CLK_SRC					50
+#define CAM_CC_GDSC_CLK						51
+#define CAM_CC_ICP_0_AHB_CLK					52
+#define CAM_CC_ICP_0_CLK					53
+#define CAM_CC_ICP_0_CLK_SRC					54
+#define CAM_CC_ICP_1_AHB_CLK					55
+#define CAM_CC_ICP_1_CLK					56
+#define CAM_CC_ICP_1_CLK_SRC					57
+#define CAM_CC_IFE_LITE_AHB_CLK					58
+#define CAM_CC_IFE_LITE_CLK					59
+#define CAM_CC_IFE_LITE_CLK_SRC					60
+#define CAM_CC_IFE_LITE_CPHY_RX_CLK				61
+#define CAM_CC_IFE_LITE_CSID_CLK				62
+#define CAM_CC_IFE_LITE_CSID_CLK_SRC				63
+#define CAM_CC_IPE_NPS_AHB_CLK					64
+#define CAM_CC_IPE_NPS_CLK					65
+#define CAM_CC_IPE_NPS_CLK_SRC					66
+#define CAM_CC_IPE_NPS_FAST_AHB_CLK				67
+#define CAM_CC_IPE_PPS_CLK					68
+#define CAM_CC_IPE_PPS_FAST_AHB_CLK				69
+#define CAM_CC_IPE_SCALERS_CLK					70
+#define CAM_CC_IPE_SCALERS_FAST_AHB_CLK				71
+#define CAM_CC_JPEG_CLK						72
+#define CAM_CC_JPEG_CLK_SRC					73
+#define CAM_CC_MMSS_AHB_CLK					74
+#define CAM_CC_OFE_AHB_CLK					75
+#define CAM_CC_OFE_ANCHOR_CLK					76
+#define CAM_CC_OFE_ANCHOR_FAST_AHB_CLK				77
+#define CAM_CC_OFE_CLK_SRC					78
+#define CAM_CC_OFE_HDR_CLK					79
+#define CAM_CC_OFE_HDR_FAST_AHB_CLK				80
+#define CAM_CC_OFE_MAIN_CLK					81
+#define CAM_CC_OFE_MAIN_FAST_AHB_CLK				82
+#define CAM_CC_OFE_MP_CLK					83
+#define CAM_CC_OFE_MP_FAST_AHB_CLK				84
+#define CAM_CC_PLL0						85
+#define CAM_CC_PLL0_OUT_EVEN					86
+#define CAM_CC_PLL0_OUT_ODD					87
+#define CAM_CC_PLL1						88
+#define CAM_CC_PLL1_OUT_EVEN					89
+#define CAM_CC_PLL2						90
+#define CAM_CC_PLL2_OUT_EVEN					91
+#define CAM_CC_PLL3						92
+#define CAM_CC_PLL3_OUT_EVEN					93
+#define CAM_CC_PLL4						94
+#define CAM_CC_PLL4_OUT_EVEN					95
+#define CAM_CC_PLL5						96
+#define CAM_CC_PLL5_OUT_EVEN					97
+#define CAM_CC_PLL6						98
+#define CAM_CC_PLL6_OUT_EVEN					99
+#define CAM_CC_PLL6_OUT_ODD					100
+#define CAM_CC_PLL7						101
+#define CAM_CC_PLL8						102
+#define CAM_CC_PLL8_OUT_EVEN					103
+#define CAM_CC_QDSS_DEBUG_CLK					104
+#define CAM_CC_QDSS_DEBUG_CLK_SRC				105
+#define CAM_CC_QDSS_DEBUG_XO_CLK				106
+#define CAM_CC_SLEEP_CLK					107
+#define CAM_CC_SLOW_AHB_CLK_SRC					108
+#define CAM_CC_SQPF_AHB_CLK					109
+#define CAM_CC_SQPF_CLK						110
+#define CAM_CC_SQPF_CLK_SRC					111
+#define CAM_CC_SQPF_FAST_AHB_CLK				112
+#define CAM_CC_TFE_0_BAYER_CLK					113
+#define CAM_CC_TFE_0_BAYER_FAST_AHB_CLK				114
+#define CAM_CC_TFE_0_CLK_SRC					115
+#define CAM_CC_TFE_0_MAIN_CLK					116
+#define CAM_CC_TFE_0_MAIN_FAST_AHB_CLK				117
+#define CAM_CC_TFE_1_BAYER_CLK					118
+#define CAM_CC_TFE_1_BAYER_FAST_AHB_CLK				119
+#define CAM_CC_TFE_1_CLK_SRC					120
+#define CAM_CC_TFE_1_MAIN_CLK					121
+#define CAM_CC_TFE_1_MAIN_FAST_AHB_CLK				122
+#define CAM_CC_TFE_2_BAYER_CLK					123
+#define CAM_CC_TFE_2_BAYER_FAST_AHB_CLK				124
+#define CAM_CC_TFE_2_CLK_SRC					125
+#define CAM_CC_TFE_2_MAIN_CLK					126
+#define CAM_CC_TFE_2_MAIN_FAST_AHB_CLK				127
+#define CAM_CC_TITAN_CAMNOC_XO_CLK				128
+#define CAM_CC_TITAN_MNOC_HF_CLK				129
+#define CAM_CC_TITAN_MNOC_SF_CLK				130
+#define CAM_CC_TRACENOC_TPDM_1_CMB_CLK				131
+#define CAM_CC_XO_CLK_SRC					132
+
+/* CAM_CC power domains */
+#define CAM_CC_IPE_0_GDSC					0
+#define CAM_CC_OFE_GDSC						1
+#define CAM_CC_SQPF_GDSC					2
+#define CAM_CC_TFE_0_GDSC					3
+#define CAM_CC_TFE_1_GDSC					4
+#define CAM_CC_TFE_2_GDSC					5
+#define CAM_CC_TITAN_TOP_CX_GDSC				6
+#define CAM_CC_TITAN_TOP_GDSC					7
+
+/* CAM_CC resets */
+#define CAM_CC_DRV_BCR						0
+#define CAM_CC_ICP_BCR						1
+#define CAM_CC_IPE_0_BCR					2
+#define CAM_CC_OFE_BCR						3
+#define CAM_CC_QDSS_DEBUG_BCR					4
+#define CAM_CC_SQPF_BCR						5
+#define CAM_CC_TFE_0_BCR					6
+#define CAM_CC_TFE_1_BCR					7
+#define CAM_CC_TFE_2_BCR					8
+
+#endif

-- 
2.34.1

