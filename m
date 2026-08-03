Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9593845CB
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 10:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785753999; cv=none; b=AGYdtAoRsOJ1nAzpmiohZc31yDssacm15y02Ys40wvfbbTMX/KzNSrOm+DnwC7yPy794mPmgae7OTlWxDM6VpuxABTu7g455r1MQ7Fv02kIq0ZWsJDb3onfXd9Zpy3fHP3gxk2f+czaTgIIBh39XCiqhmP1D8+tTo81vRV5o2e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785753999; c=relaxed/simple;
	bh=J5kLzpcGAggDIeQW+fQPYzewYd1o/kWfbMTjKjCVFA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kgNB6QAs/MBUlIq2U6BuAdZCW8bSr7S/hSJ/GiDxtivVEb8dkTtne8wAmv1VToJcBkZycpMNf0T1BjJNFayrcWu4+Fz3Qiu5LR/VcoR61UcyWVD4AmOE0hQnLJfS+XcDlQE9//REVQfuRq47s/4LfHLdCJtGvRcsfy4VBud02ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JQZGuJAM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JyvypykZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JQZGuJAM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JyvypykZ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6737KTnY3959761
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 10:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AKU/jH/o9BLwulyA0T+6aROAyUKGXiL1SkjBLw77A4w=; b=JQZGuJAMbe/K89YE
	KLeUfdRHfqKqY8FzkGhX+0Mc7UgpkRbdFUWPuKsGhLFa7A/wPj032Me+Ibh1pvID
	O/PY3pbyZD0FY21o+KhSzccz7wimxlDeON3PNo9jTm8hV1B1/OcEtCMGGsdRc3i/
	L4+s7oBdwfPHwB+4IwHk7ue8+LSfv2W6WsTtHpruSXIDxiCM81LkQwDb7MKvJMe1
	nCcIPCz/a2uKx9A2jq5D7xKLjjuB4CxNx9d18FGc2AAPxE0fbLgFlXWsp52ygGXg
	2uk4wkvuytHOGpkwsVmwF+5owAKHhynuv971EQiQOtfaPwAm4sogBrwhyLRlqPCM
	XMepWw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ft9fajse0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 10:46:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfa4e4684bso89108345ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 03:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785753995; x=1786358795; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AKU/jH/o9BLwulyA0T+6aROAyUKGXiL1SkjBLw77A4w=;
        b=JyvypykZ80o5OftCJGRo7BRx8auDjslo06leLEE2MLc/c9bBRU3uDqxvu0juvkfaFl
         +IJwzmG+3hwkrI8rO+vbiMxvfas3+FDZhbYMzGaQHeXBRMR1YjMVoduH6l9OY9SxAEv8
         LACkBNBHld+aDL8F6OmpJebAo5MgILM24C/445DWIJktFsRkIsmLPAvMKNoTpwJbntU0
         j6dFutcXMRP+LmJcv005QlaamtdpVyMJPjXA3BhhHEQDQ0qIMuEnxAMGMBPk0MhmESrj
         tji4XIE8oa0r/F8tzMDHAy1lP9x8Fol1sHyifpHctSL8el8O1idXQrE8BNdBSWALCwFZ
         p9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785753995; x=1786358795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AKU/jH/o9BLwulyA0T+6aROAyUKGXiL1SkjBLw77A4w=;
        b=Zs2E1P1Jm8mDwW/44gXHmxBHYmJmb3ykBZ+dKU+T8WA6K9z2zeE7yJ0ZNksRmcRUBf
         GIs2EK50RCJHu/A21Unv38u5snX0X4vH2ZoasC72YtJUGvLeIg0fQT6uXQAa9rAuIPaE
         asj7BRKFgw/L6qQl9U4oyZPXH8da32ueJ2gosxWPse2p9u97qQxm0yrhpN/Y6Fm310xV
         ela5MfvEsJF9WlVbI/Qg1v6Pbvdjc1bcGRD/ibabkr9nb9/WDTy83Y0HH1Lzwc5nCcj4
         3mw4MuU2w8gzWqtf13iswgXz0zDzH2psz3rg2eAcDv4/k78u/TmnvpIKqySB1kSwzUHH
         RWYA==
X-Gm-Message-State: AOJu0Yx9SfQHc1ISZSh9TfCHvZTMmzgABaKCxwCvWjgiE8Gojh04Kzp4
	KM/s0HSvMNTQ88YQUyijFzAkXQoJC7ygTDbo78g4YMYT4GXi3HQ6ondt6fSh5jj+gPSDdPO66na
	iR6pDhjawnCvci8rHX72rQBUGqbyI0wLylMv7Xxx04DTV5TXZJbApF9xhNMaGsUQirbay
X-Gm-Gg: AR+sD13N32aA1VLhc+MN6UxFQ1PU3RXENdGQayE1EaUbnzr9b8+ahCBDgMp86YU27Vy
	6IIg28SuvQmQXp+fLyPcvoWPQlYiFZB11c6l5XE+AfwJRFtZPQXGWK8Soi938f6rO1Frlq1/64R
	9dkMsZkTW4G1LN5yYW4F0fF2jMqK1fFh+hARnrxsIS18S0YvSKSBWcrnZJxqGqGCYvSEbuFIKA6
	QSkGL2wtsAfi/S5w9FkpJNIQqBOEMzYSNTcbBIc3Ub9kpmvMFDBp1yq064KSgNcXDA61FxuuZav
	qQ6tbWilb67O4GoqDk4Xz2ioc6x+WpJE0J646ukXSkLfNRHtK/6gq9fL54bzh6aGXXtQPZFsuY2
	9RL++SlQqtpaUc4GfEFhOX0m7oOGmt7T3QuuBGSxrKvKYEUCVmoNSTPVMKvlpzScSwcyNwSuWbm
	sz18adRIR4rFmJSo0mhHcCuL2fAG36IQ==
X-Received: by 2002:a05:6a21:3a44:b0:3bf:6c08:2843 with SMTP id adf61e73a8af0-3c92a89c7a3mr9455795637.50.1785753995525;
        Mon, 03 Aug 2026 03:46:35 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a44:b0:3bf:6c08:2843 with SMTP id adf61e73a8af0-3c92a89c7a3mr9455770637.50.1785753995146;
        Mon, 03 Aug 2026 03:46:35 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e506csm29993730c88.13.2026.08.03.03.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:46:34 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:16:08 +0530
Subject: [PATCH v14 2/9] dt-bindings: remoteproc: qcom: document hexagon
 based WCSS secure PIL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-rproc-v14-2-a1f87b0b0ad2@oss.qualcomm.com>
References: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
In-Reply-To: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=PZPPQChd c=1 sm=1 tr=0 ts=6a70718c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=fvnyRN_YwKOm8-nVNuIA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: k3ObB9XtuRLAWY2D0abTKzv2CCY_K124
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfXyT09kbkOCS63
 GLdcaCmB7i69Zmf2UHLIwlKyNeH2tfLHZGK6m+JtcKAfCTNVYWiGZN1YNfzBiPJluEa4QgQ0Q1M
 +/ZYkXzhdDXSN8F3DbLqKnO9/xVggOY=
X-Proofpoint-ORIG-GUID: k3ObB9XtuRLAWY2D0abTKzv2CCY_K124
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfX6E9MxKECvrU2
 RLlpXFmff89HxqeZsQi+c/rNd+WL3m6oCSxA25LK2QC/uOC+4DnixCeZ5/VCW5IRWProIQCUKmd
 p8q94BN76fRV3lCasLtBzzbogMRTGuUAl72TnH6JpWJaZJU7QDnbfqMX8+kTubjDIP+KvgPe3ut
 B6Nkxgv/8gBcq/RdxySXc+/rvElzQIMgT/RodR/SFja5ipgcSSkF3pALwibPXeurbdDdRZ/Fw1B
 NMk5vs2yPZFOOgM7I1y9DbHxRw6A6LbWE8UjvrejJc+NMgRY+7iUh7HXHPlJOlowhCxS6quvcyg
 TYJaRsbAf3mbst6wNBI6SW3C8hH6SgJxwdSMFtOk+cPGfq1LUqbkSAv3VXb1WK2i+gpWJGfRNZk
 dciJen3+DPJIMGEMv+3HaSE5gs+5ZUie2vUYfGY/kir9ARglyMno1wO91mzxDv2s8zfEH0ibJuc
 Pw9ylQKyKH+/Pqso+2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030096

From: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>

Add new binding document for hexagon based WCSS secure PIL remoteproc.
IPQ5018, IPQ5332 and IPQ9574 follow secure PIL remoteproc.

Signed-off-by: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
[ Dropped ipq5424 support ]
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../remoteproc/qcom,ipq5018-wcss-sec-pil.yaml      | 178 +++++++++++++++++++++
 1 file changed, 178 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml
new file mode 100644
index 000000000000..1ec8df60d963
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml
@@ -0,0 +1,178 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm WCSS Secure Peripheral Image Loader
+
+maintainers:
+  - Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
+
+description:
+  Wireless Connectivity Subsystem (WCSS) Secure Peripheral Image Loader loads
+  firmware and power up QDSP6 remoteproc on the Qualcomm IPQ series SoC.
+
+properties:
+  compatible:
+    enum:
+      - qcom,ipq5018-wcss-sec-pil
+      - qcom,ipq5332-wcss-sec-pil
+      - qcom,ipq9574-wcss-sec-pil
+
+  reg:
+    maxItems: 1
+
+  firmware-name:
+    maxItems: 1
+    description: Firmware name for the Hexagon core
+
+  interrupts:
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+
+  interrupt-names:
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+
+  clocks:
+    minItems: 1
+    items:
+      - description: sleep clock
+      - description: AHB interconnect clock
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: sleep
+      - const: interconnect
+
+  mboxes:
+    items:
+      - description: TMECom mailbox
+
+  qcom,smem-states:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: States used by the AP to signal the remote processor
+    items:
+      - minItems: 2
+      - maxItems: 2
+
+  qcom,smem-state-names:
+    description:
+      Names of the states used by the AP to signal the remote processor
+    items:
+      - const: stop
+      - const: shutdown
+
+  memory-region:
+    items:
+      - description: Q6 reserved region
+
+  glink-edge:
+    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
+    description:
+      Qualcomm G-Link subnode which represents communication edge, channels
+      and devices related to the Modem.
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - firmware-name
+  - interrupts
+  - interrupt-names
+  - qcom,smem-states
+  - qcom,smem-state-names
+  - memory-region
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,ipq5018-wcss-sec-pil
+    then:
+      properties:
+        clocks:
+          items:
+            - description: sleep clock
+            - description: AHB interconnect clock
+        clock-names:
+          items:
+            - const: sleep
+            - const: interconnect
+      required:
+        - clocks
+        - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,ipq5332-wcss-sec-pil
+    then:
+      properties:
+        clocks:
+          items:
+            - description: sleep clock
+        clock-names:
+          items:
+            - const: sleep
+      required:
+        - clocks
+        - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq9574-wcss-sec-pil
+    then:
+      properties:
+        clocks: false
+        clock-names: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    q6v5_wcss: remoteproc@cd00000 {
+        compatible = "qcom,ipq9574-wcss-sec-pil";
+        reg = <0x0cd00000 0x10000>;
+        firmware-name = "ath11k/IPQ9574/hw1.0/q6_fw.mbn";
+        interrupts-extended = <&intc GIC_SPI 325 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_wcss_in 0 IRQ_TYPE_NONE>,
+                              <&smp2p_wcss_in 1 IRQ_TYPE_NONE>,
+                              <&smp2p_wcss_in 2 IRQ_TYPE_NONE>,
+                              <&smp2p_wcss_in 3 IRQ_TYPE_NONE>;
+        interrupt-names = "wdog",
+                          "fatal",
+                          "ready",
+                          "handover",
+                          "stop-ack";
+
+        qcom,smem-states = <&smp2p_wcss_out 1>,
+                           <&smp2p_wcss_out 0>;
+        qcom,smem-state-names = "stop",
+                                "shutdown";
+        memory-region = <&q6_region>;
+
+        glink-edge {
+            interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
+            label = "rtr";
+            qcom,remote-pid = <1>;
+            mboxes = <&apcs_glb 8>;
+        };
+    };

-- 
2.34.1

