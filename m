Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ED4369224
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 02:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785292535; cv=none; b=Zv0kt06XztRftcyN7G1aVP5JmdRB7WNmQKGtXvc8v6vCDoI4lm/DdRLbOksAfoUNbE0yynvhqzd+qxhziYjl2cr/YnmIlIxKOUY9Fu93C03w2u+rMYJPWc+/WCnccFCFlHvyQLGdmqQ0EFsn0s1IH/g3sXOiM/LxizSMhmKZ8pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785292535; c=relaxed/simple;
	bh=HsvPBVX9FVNksgzuHsuw5nLhZW8s06EG/VphF3F6oyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=egSgWWhiE7NcPulO5taSmaLirbVMf+VCBUJ3jIeAuN10oOoNMtC7SikVAajYCavn//Eub8bYPxPFQTBs4v0UNeM2JA6ynhtiYkMIOVa8PnNcX29vjVZWDYZ8OuuXrbpqpRqGzztiZm+htPCYv//pryWSCFB/9VXyYhu4R/kNBAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hUDXgb2a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fhPDJ2b8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hUDXgb2a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fhPDJ2b8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T1H07f481950
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 02:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wjFila/Vnva
	jjrGjT7HBEfP7JaWBYji7/kPJO6j8C88=; b=hUDXgb2app8s9i3/IA1pSG/CWXz
	gyIbarON2GHbw0zJuPFT6ghWCUswKWE1tg0zi51xaNf2XA/u0tgzPLzbFkmdP4L1
	h2xTZAbrDjFVC/+HL3pZ0APmP/49bFoRzrUf6ovcS5yEdY7st+DioPEZfOId3iaN
	8v7zlgAQxBT5RTmcF8ZDQi8EJ0jWxrTWVLFgWxxdT8uazfphLcIry/kBO2e3ev0A
	AIM42tjqy+nZQSxF83Tfj3QZP1AVwRNWkQnvI1nhDZXg49pgKprjdypJzxvWV6Lh
	eCgmKjI4qgVWa37tlJmNCGHAltokWZEI40o0sBlBhLADJTNBueglKGXvIAQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq0q6stgr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 02:35:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cf6acd760cso6243195ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 19:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785292532; x=1785897332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wjFila/VnvajjrGjT7HBEfP7JaWBYji7/kPJO6j8C88=;
        b=fhPDJ2b8IXRNz0wYquXr0uIbxGlZLCZvPfYP7gNSv9TdKRg2jmjj3yQBIj+6kwNPTz
         7qO/NOuHReuTE2RiMy9Jety65xWCIpwhcf9HMIRvfYFfTxGYn9SrK/WU5gOVrib8IZhF
         jYtO25w8HLD1+7yr0BfmcTpDMO7jZICYHassTgl2YhhTumbWclnuuTJej+R/WzZyjodE
         NEMxc3BWMczG3xHiV86rl1FwSy9E7Mz3IqSGkUCW6NbOvGjEmikgMm3nYgFVvHNrGt9B
         Ybyl6yZr9We57gZv+jfJ/OpNSkyd+VnHwwWU6DBgkr0C0EFhKEuNWlr7zk8Teqwq1d0e
         QtJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785292532; x=1785897332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wjFila/VnvajjrGjT7HBEfP7JaWBYji7/kPJO6j8C88=;
        b=B7Qh0mv8W0tYU/htApWF8p04l7P19MVz0fm6CcJ2VWFt6o2coQ0DErv4z5ywx5tBV6
         uL1x+YFuTI/ZV4rDZiy+HUdJCvIkndyAc0EbI6+rDzCKTQH4QMw9n1FP7SnUYr9FRip+
         LDUStmj3xndiA/2+4Zy/T9QnrC69wd1k8SjluqX71W6DZtPLvMIz2vfCoQdyRYynb0ni
         VjZDn5zMxQHJzxZTmWc3Okk5pAERYzbzBV83LIgpEXWybsJa8xNNJQoxe5ftBh6r48l8
         egO/RVt2AGhmA0Dco4iWcs+Sn7NBkK9cbeKFTJ2dbbQ68EFuNnzP+K0yX4cndBuOJrO6
         HzIQ==
X-Forwarded-Encrypted: i=1; AHgh+RoqJnrT5zNCm840tOSc6AENNNLABQ7D0+ogXjza3I2XomISeUec+f105EH1WVUFblp32C+u8vxoWY2w/FxK@vger.kernel.org
X-Gm-Message-State: AOJu0YzoFhkfhcsZnZr1STB0P9xVCY0cRlDY0Ux+6Yq5YenetoygS9l1
	0SkdLtRfEKkAYRE52bgs0h/fyaQlaVi8zT15Njlp7PQJjfjR6n39wzYyTz9CyHsd9wmQLAB+Jda
	AAOUCI/GEVuE0d82A5ElNpKqQ4ST1JmMmkDifToJh2WFTG9U+UYr0+mooKcpjbZy5yej3
X-Gm-Gg: AR+sD12o6zOTCize5hWJN50n+ToDWqcxFgcJ2DXCvNigVlB98q4HradlZgNfGyGyuxw
	Q10IexD4RFKc1ncXVadg/tccowpagr2+DmbHXmyS1+u6wyLhRsLMy5qiu0yP0gUHwsiOoLR0xhu
	LsVj+dbe/xq7xRWRK5gR7PSf4Md4X4vAY45CGFV6LSN6QCYK/DfpsZw3Pr0O5sYwcG/f4we5jJn
	Y6I8CpommYDlvVJL8i7CVdNAYnuy0OLRqZSn/IdNLUm3X8KKqBCQt8T+4fe6AdmTK+EdWoHTzgv
	RbXW2sogw3vR3ATpNllq+SZlxPkNPD3RdM/40rW2fwaTxjTYHryIfDfVkz8cJ0Goc5q0bh9D58V
	avXN4T6mhqzPsHYA4sYTFeiACOURjy+5J1Epll4xHFxJVFum/x9yQ0vDEePax
X-Received: by 2002:a05:6a20:94cd:b0:3c3:7cfe:b337 with SMTP id adf61e73a8af0-3c8b71c6e85mr5681341637.30.1785292532226;
        Tue, 28 Jul 2026 19:35:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:94cd:b0:3c3:7cfe:b337 with SMTP id adf61e73a8af0-3c8b71c6e85mr5681313637.30.1785292531676;
        Tue, 28 Jul 2026 19:35:31 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7265be48sm3899837c88.8.2026.07.28.19.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:35:31 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 2/3] dt-bindings: remoteproc: qcom,nord-pas: Document Nord PAS
Date: Wed, 29 Jul 2026 10:35:07 +0800
Message-ID: <20260729023508.879752-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729023508.879752-1-shengchao.guo@oss.qualcomm.com>
References: <20260729023508.879752-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UF9hBU2kUFJIgODB9MB4rmJWK2N1XOTj
X-Authority-Analysis: v=2.4 cv=DqpmPm/+ c=1 sm=1 tr=0 ts=6a6966f4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=ubVXmmWBUKpdC42ABFkA:9 a=1OuFwYUASf3TG4hYMiVC:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: UF9hBU2kUFJIgODB9MB4rmJWK2N1XOTj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAxOCBTYWx0ZWRfXxQdIadERQBMr
 UOWLnD6wjp/gorwe94QOtVGym4gu5Zay/gkRNfVzna86+/jwfGGD+V7Pe8a68XAXlOgcQjIRLbb
 K+EpZaLDzTb9+Qi+87bSAcL0c1Ax7K8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAxOCBTYWx0ZWRfX+ONy/Q+81Of1
 2qrdH1xYl2c6rKiBlnaO+kZ5DHdJ5SmmmdWI4GEqssBsJoLum2xRoyyKrMEiiJjOBZh8DRzr5x6
 RxAPHEZwIgFdfOSTogplquvXpPX4zD3AGdd8Taizblkg6oIYDVreMGZ+GT6r2Z1X345KuBsHnEm
 mz9KJYL/1cssH188AQqaqhRhX38zCvjlxF1SfhI1M4ED7FLWFFpwJ4rBTkZHbIcHDHmvBo36p8D
 /dR+BjFB+JBDc1L/8VBJswjYfSLU8J9JGklrVN+qCV9Ew5JK4p/7CbWqIcf8CKcrszoB8jE4LTx
 PI10FX8lGG9S/3c9AJ7u8v+E0E3FYsKcpWuqX0dd9v2DPb9w8yHIJ4ac7HKZTsgasLkmp4z5A1h
 yCRItADpl+1XF1C7t6h0qYzaD6/MQACbQkyTX1thWFt+zG3jv+Xxa37CCdws6kqmjmn0SUjGKFa
 D2bwW2pkeLqC2XLVmhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_01,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290018

Add a dedicated binding for the Qualcomm Nord SoC PAS devices: ADSP
and CDSPs. Nord ADSP uses CX and MX power domains while the CDSPs
add an NSP domain on top of that.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,nord-pas.yaml    | 173 ++++++++++++++++++
 1 file changed, 173 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
new file mode 100644
index 000000000000..e90d2953ba69
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
@@ -0,0 +1,173 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,nord-pas.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Nord SoC Peripheral Authentication Service
+
+maintainers:
+  - Shawn Guo <shengchao.guo@oss.qualcomm.com>
+
+description:
+  Qualcomm Nord SoC Peripheral Authentication Service loads and boots firmware
+  on the Qualcomm DSP Hexagon cores.
+
+properties:
+  compatible:
+    enum:
+      - qcom,nord-adsp-pas
+      - qcom,nord-cdsp0-pas
+      - qcom,nord-cdsp1-pas
+      - qcom,nord-cdsp2-pas
+      - qcom,nord-cdsp3-pas
+
+  power-domains:
+    minItems: 2
+    items:
+      - description: CX power domain
+      - description: MX power domain
+      - description: NSP power domain
+
+  power-domain-names:
+    minItems: 2
+    items:
+      - const: cx
+      - const: mx
+      - const: nsp
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XO clock
+
+  clock-names:
+    items:
+      - const: xo
+
+  qcom,qmp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Reference to the AOSS side-channel message RAM.
+
+  smd-edge: false
+
+  firmware-name:
+    items:
+      - description: Firmware name of the Hexagon core
+      - description: Firmware name of the Hexagon Devicetree
+
+  memory-region:
+    items:
+      - description: Memory region for main Firmware authentication
+      - description: Memory region for Devicetree Firmware authentication
+
+  interrupts:
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
+
+  interrupt-names:
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
+
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
+required:
+  - compatible
+  - reg
+  - memory-region
+
+allOf:
+  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,nord-adsp-pas
+    then:
+      properties:
+        power-domains:
+          maxItems: 2
+        power-domain-names:
+          maxItems: 2
+    else:
+      properties:
+        power-domains:
+          minItems: 3
+        power-domain-names:
+          minItems: 3
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/mailbox/qcom-ipcc.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    #define IPCC_MPROC_ADSP0
+
+    remoteproc@4c00000 {
+        compatible = "qcom,nord-adsp-pas";
+        reg = <0x04c00000 0x10000>;
+
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        clock-names = "xo";
+
+        interrupts-extended = <&intc GIC_SPI 159 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 7 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "wdog",
+                          "fatal",
+                          "ready",
+                          "handover",
+                          "stop-ack",
+                          "shutdown-ack";
+
+        memory-region = <&hpass_dsp0_mem>, <&hpass_dsp0_dtb_mem>;
+
+        firmware-name = "qcom/nord/adsp.mbn",
+                        "qcom/nord/adsp_dtb.mbn";
+
+        power-domains = <&rpmhpd RPMHPD_CX>,
+                        <&rpmhpd RPMHPD_MX>;
+        power-domain-names = "cx",
+                             "mx";
+
+        qcom,qmp = <&aoss_qmp>;
+        qcom,smem-states = <&smp2p_adsp_out 0>;
+        qcom,smem-state-names = "stop";
+
+        glink-edge {
+            interrupts-extended = <&ipcc IPCC_MPROC_ADSP0
+                                         IPCC_MPROC_SIGNAL_GLINK_QMP
+                                         IRQ_TYPE_EDGE_RISING>;
+            mboxes = <&ipcc IPCC_MPROC_ADSP0 IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+            label = "adsp";
+            qcom,remote-pid = <2>;
+
+            /* ... */
+        };
+    };
-- 
2.43.0

