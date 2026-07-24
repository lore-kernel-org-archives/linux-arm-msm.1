Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D404248C9
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889581; cv=none; b=XhSiQFL7dRvmG3V8jc0qvuGucanJX37ZNKyTbIWxU3FD/QAdldB9vUTg1u+uzzjkGweimInGtQpkev2PuykUmvfKwD9nf9pdNc0qOdQLshVHWjma0b824gpC1vdGPZALd0ku3G9sDLYpSYmtE0AYy1+ikNlm/DUGAqBDkDFTwYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889581; c=relaxed/simple;
	bh=uRw0NLx/3wezosgUfSVoNSexWmM73bYctvD65RNOe68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mZ6rwk8ydBHwzFHTNQE94AjzeHzBX59LTA5g89Sp3jXIdKxR18qHcdLRc4wq3qjML647qH5XosX/qbqUt6hsg5wNdBhlA9rqp6s2PkIbt852xPxESjENa/eF8YjplGkbH7btW7DJTJ1jbQDRCRma696X9izdTx/ijDDlGl1i0DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FgrqsL50; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZNUHlwm6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FgrqsL50";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZNUHlwm6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADbbd2875766
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:39:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OWwsmPMu7FJ
	1bMz5RQNbB2ps21fHYV3qv4MlM8o+x/Y=; b=FgrqsL50VEHvQgP1tt1wEX5WsSr
	Qu9hVwRSHVd+WFtSa2TAdtznH0OM4brGlDGidyE703P6up5CiQCKNuRILJrlKs4O
	SDrkoAonx9XdSCnDTkgs2l4lRtvEAjjm6pyjBdagM7CHFoU6sqnf+RE7auP7XO3g
	HHFzot4eJOiFX3VOxFmEQgjPgp8e/HJqmFPZlgcW5Cchg15L/k/c2SLDIbmHZIOX
	mmWlPqHjBuHyylOIrx88gL2f2y5xPxP1y65qDJLQBZlt62emLyCzeDf0Abzo9hjl
	YSfbHl2CsKIsQ7kafZrrTjEl1/qPwE8QAYqxMDp5lc0rL1MI/ZbsnGbCxgw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5byr9j2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:39:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e25e4b41cso309240a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 03:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784889572; x=1785494372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWwsmPMu7FJ1bMz5RQNbB2ps21fHYV3qv4MlM8o+x/Y=;
        b=ZNUHlwm6ChTu5ZwvxP4lVV1KpM209p7lzFqc9JBqzRNo1wVfAJL88aQcy3FS3TOqpE
         5iIG4pcb8Kf+i2a2pZZRaanhITuc+VgVVNzVxhc/he2JNjsS6uqmXwlDv2wsIU2AcOSs
         Kc+PPc/PtoiL4Pg7dx/YdM4AdPinLsnpMUj0pOQwx4HD93PqwEoqGjP8aOE68nE/AX7y
         eXaBztk7OBrnlPH9cdqgmbdXWkpOMQ6NyilLTVLB4IHWDr16V2dAPH1jPV4CJ+R4rgY4
         gWx0CcskUFiX/86O55SPKQF2C+hxchpWayN29ReJCBZLNB7tza0s4sAarlmDKlYbxmd5
         QAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784889572; x=1785494372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OWwsmPMu7FJ1bMz5RQNbB2ps21fHYV3qv4MlM8o+x/Y=;
        b=s9oY7ejgtmwvnmVQRZW+SEME2r35nn+RLvVHB3O0mFlFqo8b2f5lp3yrSGzqs7+t12
         vnhf3j1V31pMrsav9BHOv2gUFVJtepjps4/yeMl37v87W0fPkri2GMYdBh8o6I7OmAC2
         mfyTXyL0eAolh8NHdpV6m8jDLKky8DcCxO3LEO0uH+LkUQMEIhgNMhowNIBa3d66PI0C
         UePXHVx//o70YBEbpumD9kamG0SFyxOJ5usMTG8cAlr9xvurHw4IBznpo7NA8lkU/MR4
         JwIlv3FfHDyGjqhhFvPVE/IBGcimQy+kh7UifScSkCxUeu2WcSg3GkVijJe0zKv1Un7Q
         y/VA==
X-Forwarded-Encrypted: i=1; AHgh+RrOF/NubNS9OXmxB+FDq+RdkWkpr0Zc3xzpOgz4GGrL6Aqw9VT/tc7GCHcrZbp+v8wDRqSO1omQBfG/KtE9@vger.kernel.org
X-Gm-Message-State: AOJu0YwTknb37B443f7csBZX1Q7K2XsAamFy+BfwJyXisz6t0VFPyCzS
	/56NJJWiANVoOWiI5rU9BdXiQRvFJ7Dcp/7pV5zGildYKh0/4KQLl6XlGo94k+lQ7QtALwee6ni
	G8hjiZlUrzGPgN0o0N0d65Cn65tRKbdXrYacRCtawDxHxWVx6RBU9XPsGHHdj1X4GGMLt+3UM9I
	ySt4w=
X-Gm-Gg: AR+sD121cE4urWJGhvobpDo6JhhwQzDFu3qmJ7g2m2xWfuhrg/iaYzki7dGbVY0XXr8
	WNpUj5CsnVDKaRFCykP5IG6jdAtZgtlT+Fx7lhN7mdPKpupkc0GNl1vpdv8b9ebmlcdvH/KBX3D
	fQoyHbc+TE2oqE6wAtoTuFMBjVPeUD97rT06K/DkjbzCGe29nCK3Pbu0otEp15bEQyC59NzHAjj
	hjNetuOwBNO0/wUKr3Nt/04NPe1GgFYI2ItrozStrPI0GTijfBxoqtAQ6pMInw21F6XEu8VEFc0
	znwL0iJn2QqKGVegoN5pkd6s+LcsCL1bNMw/eg7fTMZzsLzZy/yKxtLRjRVNkNbQQM4JzDV0rg6
	2IjvpYevqySZgQIH8cX5zryuTdhb1oohyV0+cViwQAeoUKlH+278HtKs4CYsb
X-Received: by 2002:a17:90a:d64c:b0:38e:11ba:992c with SMTP id 98e67ed59e1d1-38ec6989c62mr6484995a91.12.1784889571533;
        Fri, 24 Jul 2026 03:39:31 -0700 (PDT)
X-Received: by 2002:a17:90a:d64c:b0:38e:11ba:992c with SMTP id 98e67ed59e1d1-38ec6989c62mr6484968a91.12.1784889571087;
        Fri, 24 Jul 2026 03:39:31 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130262d2sm22495290c88.7.2026.07.24.03.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:39:30 -0700 (PDT)
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
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 2/3] dt-bindings: remoteproc: qcom,nord-pas: Document Nord PAS
Date: Fri, 24 Jul 2026 18:38:47 +0800
Message-ID: <20260724103848.233804-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724103848.233804-1-shengchao.guo@oss.qualcomm.com>
References: <20260724103848.233804-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7EsBbWX98syQ0Ukzs5RNhxL_bH85QCEK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NiBTYWx0ZWRfXzxq6VAJ1REBy
 nu3mT96A8norL4hlnz/AytB+3EsA0VNTC+3ViCvXnQNcUPZ/r7PnEWJ/LdHdlRqXfIg1rBuZf+A
 S/xvNX0dafkwl6G7XeKV1W42ZQbhPQ4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NiBTYWx0ZWRfXw7frKiIwLlJj
 WUebqf0VRQFAvuanc6lQhgrDUP28/j3nYaHE5XUDodlq3TWAICDGJaAXFlAJBi1c8QusR/i6GB2
 fYwyKvX/F33GBSoRJuGxgaKf7b2dGLsVEuTkJi7TxZkTYl5A94y/9Im79TTE8mxUr10IbVPaooO
 IFgMcxmK8Zg8cE7dmhOfjS+1n2BlPBawn4BMvb5z06mYQ8LbUfG6VJpzsQtab1yMBAz+f1wUouS
 r3mAVRrpxe7WjzIOeiulpX2++qdrwolIwkifLnt1u3hapqV6W/fqBsfEJXxpkCxjojBQHLNNacp
 a+w0V4nacAnB0D2kRYDrrrLs3vj8Ks/EhsSaSJReE5liesm7gKzDxAttX+xB3YuXuT3URql/qey
 RB/+LKMMJaHEghPNvp9aHk9+AeeKncVXiVKJ7XoOHxVirexJJopmKr8pie0ImBYXxYUVQan+5zN
 RM06gZbF2ZI3SlkrrIg==
X-Proofpoint-GUID: 7EsBbWX98syQ0Ukzs5RNhxL_bH85QCEK
X-Authority-Analysis: v=2.4 cv=GMA41ONK c=1 sm=1 tr=0 ts=6a6340e4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=JGpttq_Osol2W_qdFigA:9 a=iS9zxrgQBfv6-_F4QbHw:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240096

Add a dedicated binding for the Qualcomm Nord SoC PAS devices: ADSP
and CDSPs. Nord ADSP uses CX and MX power domains while the CDSPs
add an NSP domain on top of that.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,nord-pas.yaml    | 167 ++++++++++++++++++
 1 file changed, 167 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
new file mode 100644
index 000000000000..c1d60ca6c63c
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
@@ -0,0 +1,167 @@
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

