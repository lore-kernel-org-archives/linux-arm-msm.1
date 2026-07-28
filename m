Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8186640DB3B
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 08:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228052; cv=none; b=dix9wWJHYniri3naQo4g3rFOf41H9v4oFq2fuAaXqJ1JXYr0+QkUAOgRU0woCi9cU9Pr2OMdWMAPq2qJO5Og4K5MK37JowE7hiu1/5xW/wNqzNCUnuhMLV0t2ihTyZZ8RpHcJk6QqJacGrsWvRpz3QAtsuB4qGjtYf6ZRbMiUnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228052; c=relaxed/simple;
	bh=HsvPBVX9FVNksgzuHsuw5nLhZW8s06EG/VphF3F6oyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hpr5AubXy/gbLW2Rx/p5YV8k8Y1USQllNx8xD1oHgJMf3AiE9zgJ9K9siJ21Orh53Vw2GzoaZ1V+mkAz83QMi7W+HPNLT8RK9JCTaFKJ1aT4pqY1DDjt4T4Si2GDjwjPv/oz5da62erBDWkE/tm5iNzB8u0IU92t9Tef6VJA0qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NpSxoan9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dkEG53Tb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NpSxoan9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dkEG53Tb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S81v3a2071250
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 08:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wjFila/Vnva
	jjrGjT7HBEfP7JaWBYji7/kPJO6j8C88=; b=NpSxoan9gATuxfFaOyNjlumHmFf
	w0icfnWvZa2G24Y2Vo02rwOGhqYdbun31BR7gZhI3P7vo/J3nI7AtqPa3GdEURDO
	bZRcVPRxTmGx09Ss0FUnkcyZrODdlSd9lm79DNDwq1Yms3Ym5FUHCAQUQtHgbwMu
	6p4xRcp6SAOTYTzbw8zsIqQVH2Y0MWlBVKXgVl7pqt3dtPtZooMTHxRCB4WFcjem
	drbDQE8m5oDboYv5wOW1esZu3EgqhyMo5MeN8BLwkKj4XpR5Q2NfEXt5QBux9gAK
	V9hKZtzOIXFhe2cad4gwWdWBxHw8g31Z74KxWUsqmzXjGyOETm+xwH5G+vg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpqxjgabh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 08:40:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so1709189a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 01:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785228048; x=1785832848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wjFila/VnvajjrGjT7HBEfP7JaWBYji7/kPJO6j8C88=;
        b=dkEG53TblbBRE39rFmnaokXTdn614DeCst4DUw1IpmrwQI0C3QskxCe7YG0OO0HSXB
         VOpiSpxIT+sJdxHL86hTeWEr8YwhJCvAzOKY0R+LFcfskoYzvg7slMcRM8dnco3F3MLb
         Wdm5vNMJC5SKNOSR7azme6wybIE/3Aw0a8iJ9Kh8hvtjZuXHuVbTuGmNOhWl17CiEZo+
         eEU2FpdoDjzu4i/BMSfUctAx+7IyfhMrq/Jb6iEJ6v3MQ8S+VeoN0yC0Dug/sOnwkTET
         dROxGiAQ/4hfoViNQIWdWPWMnHGvK3EtszvGDceUk6uPKHYRnTq1vCAFscVyI5ZaAbtH
         vqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785228048; x=1785832848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wjFila/VnvajjrGjT7HBEfP7JaWBYji7/kPJO6j8C88=;
        b=SEL5MFi/aTPQ2eR95LTxpkRfLlKcV463yuP10QpYAPnHQqA124ePSJzuZNnMW2Gcyp
         257SoCK2sTp+SXtQkfwfbfttEsWKVmg3N6Oyww0VzVmVHBdGoCBiVVTXhOlsZHEkgw2J
         xOXImIBCOg0RD2ZzPppNa/ICOhpVZfBhyGJdXe67SGMZOeyy14lkzvFHeUaSsWQtFWrS
         f6jx6zRvCBAjMr7P6ucS8hA5CLSbiId2FtXV/udwTqLIK8MW51PtATbqN50ZRqn9IV3g
         ofrk4AnXpCWmhVC8k3AtEiSdG6MXyy5rJGyPY0TG8FdlPXtv4my3PU7+fk0WnOaSKjtQ
         jz6Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr+Adla6mRzdmpLt5qw9+iGZNZT0/TM/RHLM8riBBFrF/hG+WqF1l5mYV92p16diMj78yCItMkSUGRZmxAg@vger.kernel.org
X-Gm-Message-State: AOJu0YyPmVN3v3wpRwZqR8Mmw3F6mGb8th4nSOo1QGjRooyAFJofWHTX
	OfEFYW7ugdJaNazuREJgzY1gRgNRaL94JKr5R/YlnX9Ywug4DLZMKMMHykxfPMpB6YtFe6sC7Ex
	MMxD7tyS6cjhAdqQL9v8MhRFYBtX/dgtvxENGqjnPABzJxJywFIxb3fmyG6ipOkSlBmuL
X-Gm-Gg: AR+sD10+UjItypIEp0RdumjuV3aWLsYDL3enINxMGdcbKDCjXOKwdaWMEPG9afTyRah
	lfQkSNUlJAxVbWHSpcdDP9mGnIxfNoL6V30r+OP0OhCtnedUN+lBfQz20/T8p3gB+pp6lS7Dluw
	4E7Zz9E6Zuris1mqFhy2qLbBP34hmFUjT0yNM5kacSAABXCIPCSeskpYdhP3JYwjeEtSMEH33n/
	7VfuXwbhpbQioueVN47ZDYejqwbHmEUDxiq3rHF2Ke+H5y/fMGCxoUctvE6Y7pl8eaFx7JnsYy6
	j22SBAmcDaJ2BtEm7KcKM7Em2ro3nqoJhiZ0BjsWxt1eVougvldE8LsEFVDDPc3V30My0IzGB6r
	pGvPZxaZocyVkYf7QpKhWe7nI7isPftZB+D2J/nhJ1QRK6v8AnVAdc/rGD6BV
X-Received: by 2002:a17:90b:164e:b0:381:85c0:1d9d with SMTP id 98e67ed59e1d1-38f6a517f9dmr1641037a91.27.1785228047990;
        Tue, 28 Jul 2026 01:40:47 -0700 (PDT)
X-Received: by 2002:a17:90b:164e:b0:381:85c0:1d9d with SMTP id 98e67ed59e1d1-38f6a517f9dmr1641001a91.27.1785228047485;
        Tue, 28 Jul 2026 01:40:47 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f642bfc66sm916277a91.10.2026.07.28.01.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 01:40:46 -0700 (PDT)
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
Subject: [PATCH v4 2/3] dt-bindings: remoteproc: qcom,nord-pas: Document Nord PAS
Date: Tue, 28 Jul 2026 16:40:11 +0800
Message-ID: <20260728084012.685036-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728084012.685036-1-shengchao.guo@oss.qualcomm.com>
References: <20260728084012.685036-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MPsmbLOR7lZnhSbQtIeYmTxcJye-weUB
X-Authority-Analysis: v=2.4 cv=MORQXsZl c=1 sm=1 tr=0 ts=6a686b10 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=ubVXmmWBUKpdC42ABFkA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA3NCBTYWx0ZWRfX8vRZEKbj3EUq
 KFXN2yukw+q7y9HS2ARgE4gPUsi1OAWcjmlQimw6gHdkmFZqwWYOM+tbiNtc9k9IGMlV8zim3qn
 7Hn3FzL38hgP0bdMBpBczGZiZHSgFTg=
X-Proofpoint-ORIG-GUID: MPsmbLOR7lZnhSbQtIeYmTxcJye-weUB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA3NCBTYWx0ZWRfXwvvYfX8XXzVA
 CRD6Tao0uzGSbMSgpx/nbcfWbVBbNXwfefxn2YHP0BfFnPAg7K707bN05OmTlKG1lLL3I/SenOo
 Q87rKbiUXLY9ZfMlvIXVKA2m40haXNzY+IynU8YYnEy++Nug6DhX0PRxq+/NPkq8s2gTgIGSG2E
 s0yUbkMGMLiwkYxZk5F4YJaNq3skWIBgq2KBdWxx3LBGOVEHYooM7ol89xYpinoSAgG9V0gvaXw
 jZsZd09KXtMs+e8POEasBNEiFde6q7VaHDRsc3ZLkpxR3W1Nk0c4A6+Cs1Ac5Q7NeJRd8AgBwQQ
 8Nm735PafPcZaFJcNzioq9IGPjr70blhzEE/LNOeFxoCeFlD2d0Icx4Ca44Tsy9zUIDWZ4IkTrs
 zhO+uo78yM+KzLl00BKSBoz+M10yb78Sz+IsP7Txkt1yLkzg3RfdoadLdMGarCUcWm28TaD7BRR
 RPxbHnykZADfqYIlCfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280074

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

