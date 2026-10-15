Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62BE3EB0F4
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 05:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792043798; cv=none; b=qyjJQslni0N4bJvSf8KXtbEcPf5IZUz2Kznga1ETunLIErdsmJU58wWTiEUlJ2reAbMGTtqLEQ/ZeCmgzY1C78IhWBkAj9ZKAtGtd61hWIt75RN5+vEaw6E2K2EtmFI0NJIBUnVeTps79P8ZoNRgtDdDH6oXjapmFkmr+fDKi14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792043798; c=relaxed/simple;
	bh=dsSNGk/yj15Z4Dv8HFRDtI7ZdJ7nrk/2NTq9ZirqCq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sz/LBdB4RCf0O8qexNaX4xf0WW8Q0AKttY74coBXGsZpRZo1Wtb8MbthN065VQh+QaDSfYz8kJBTJEPEyOPxE74BJd3/UqnXgNjs+QuiIyw1WvebByJZYmSfzS6K0DpmRBhiARgDBCojGSEhdvsxiQmV7H+bjSLS/TClROXwytw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IAZpxvhn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cqzDEJJ6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IAZpxvhn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cqzDEJJ6"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F00S7a2121439
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 05:56:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jFEZswRP1U8cleQbH9pnxyqJRmZmmckJo+PoUqj1wrc=; b=IAZpxvhnJmjaGeBK
	TuEU16WgL1a3FDuZF3QP3T/Tpm1XVeTs7r4xlJ6dX3N101e1Nfd5tnrPsLMLaDYk
	FSTksd5WS2gyKoo2V50ib9e/4qaOvpze6oRgpwF3LEwnEExe6PdRR6+O59cmTVMy
	dLl4PtZpStBpK5O/lkqE0YSXPK1MXL67zDBGMJvLeB09bUkyYBqPppVE+QYWkdJB
	xYuMYl1lngUPMgHmIyK7NNWJH1H5nMghdxSwkhAkL/ZgNoPVzfRkXPAfT5Ofn7/q
	yKr5YmYqrJc0jXqrXkgI8dmPrm2tzM1yCKAIKzXT/cZq3y4J+/9Opt7NxfBLluJZ
	L1ZxDg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn12ym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 05:56:35 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso8916184eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 22:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792043795; x=1792648595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jFEZswRP1U8cleQbH9pnxyqJRmZmmckJo+PoUqj1wrc=;
        b=cqzDEJJ6JKulcYAUc0DgkSS+tY+uoUw2K6SWokBEos+I53eNRodrZkDGQzEfT25TQK
         sjEpw0jzmjyX+OgBfX7AYqpyl+xVYu6qqVkOr9CJwmgTlsYra+CckEwSkn+rm5fjrggI
         NN3uttYSnV32EUQbck0ioASKx65w5BuYB7fE3Vf2aCrFZMa1mXMx6mD8wzZHVBf4rAjg
         eL0GLLGlPBTGqaKklKk3FNFLdgAWSs89eMbDO4ub/TRqk5Z6GZHxmaplRaNAqtJmU3xs
         jA+RPE2zWp6uwqJHGoUAOK6N4jsMKciN5/zG5BcyhYkUUF0+JSwC77KQ1LNGCgDH60eE
         +s+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043795; x=1792648595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jFEZswRP1U8cleQbH9pnxyqJRmZmmckJo+PoUqj1wrc=;
        b=VoESgJWw2zsj5yI/fnYfRDiJxDG+fuDYEpSekXpdwUJsCXPUXJvwWtbSIEc9hNsCJg
         NQ63xVrZuEYNkeTKd8VThQ8HrKqbk7tIgIbb9Fs8eU+TiM70BVC0A6g25eMm6hS0nTTN
         mqBPj4QOk7pm5vd39T+r6h7YgelHdfUXGTNyBpMBpjq9lGVhGaj6wOmQ2GTxwl975NGV
         1lUzJiLoRGHbVwqV7PEnvTu4gdFWPIBmoNN8K1/vuLSbmAs18qZHCcTNv0pqAtfmJzbh
         Eudbmm+GkMRyOdwiRMJd1n7tKBwq+cjQNqQqISGAArYbdfnQgQXC52JNH8ZhG0uI9ygF
         BmvQ==
X-Gm-Message-State: AFq9FYJv2/xZ+bCztF+MBaFgXCL9ay8LPPR6oVQeRJNqmHOgBFLw2iUC
	msLQRQ8LE/XTuQaaIlzV78xVdESnjELHSFf0/waaw+jSfk92Kl9x6PLfZbANoVt0bFJl0i0DfJj
	xSJzdwxDyfb2IoBc+vwihcvX2f80XmTjASHbZsjHu++yqnvZhI/yXuaFE8ftKs7TlSNpj
X-Gm-Gg: AYBFou31gQuun+tgxVtDfEa921TZYL9kFAWAm2qohqIWwwO6Hb64QpXL8COkEIARN2T
	ThJo3uiOUlq7++fVHNs9WwxRKEMwga2BGIVuvUJ32ApMsueOaaagCgwUIlQStcQtaynMeJJW5Ly
	JYe1CEKYBeWrYgU+e1EdqrF9j4fJhVfGzBWq6eGlsvtvwP0jl4IqxCetUzLT39BevMjbilvPN9O
	x6x4gg5MIH7tXjgphzj0WomFfcJm60DMWPj9Q9UstGBDlvSqQpkTAeNJ5oWYjfOCCdj0DtAtKv6
	Ly1JYGiow/DRbF7Yw5GBZ5AD05LsgYMRNlZlWWCHfIsewkKz/FcxUq1sfKoiBkigpeix2eN8+XZ
	UNhdnQxVRXHm3qNRV27fzjED2oLDta+aYYepuH1Oat5r87rhlPqjveSHeOcNU8cCRs3qp88Iv5O
	wtoWOifPtBwaI=
X-Received: by 2002:a05:693c:66ca:b0:35c:f667:8b9a with SMTP id 5a478bee46e88-35cf6678c8fmr8438025eec.6.1792043794319;
        Wed, 14 Oct 2026 22:56:34 -0700 (PDT)
X-Received: by 2002:a05:693c:66ca:b0:35c:f667:8b9a with SMTP id 5a478bee46e88-35cf6678c8fmr8437991eec.6.1792043793752;
        Wed, 14 Oct 2026 22:56:33 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c61eaa0sm64791975eec.0.2026.10.14.22.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:56:33 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:25:49 +0530
Subject: [PATCH v2 1/4] dt-bindings: remoteproc: qcom: Add Glymur OOBMSS
 PAS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-oob-support-glymur-v2-1-715435f52dd7@oss.qualcomm.com>
References: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
In-Reply-To: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792043784; l=5875;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=dsSNGk/yj15Z4Dv8HFRDtI7ZdJ7nrk/2NTq9ZirqCq4=;
 b=YgvWl6mmR6mAiSi2XBlfOkOecg7UBimiY9NtQpEnCtiVpOVvZ69xFJHuX2lyY8myQweqm/8z7
 cEUpE+UN06eBi60EDFOpldxCVIv2DSdoEm3rXMJox5HdPpGLu+7gnpS
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfX3hQphS5JOmvn
 GIjxNW5rdNxTChPrcY0dzKAbsW3gSrGPqUjb9xnmd4lnq8zc0c6/wVzWDvaYf6l5bGfe9hsPEOr
 wmDgQiY2PeoX6C5hZG490HfjyHHX9vqBXCQO6DHpKOSSkzcKSMQ0OXdOvO3guA7M9wPAqYomxkt
 cYfKqXVYKkP7rqyhkndvN5UXHddNRdonpyjydR653aq8O3IG+kWpSenA2orzKDFcuQwU81VJTgK
 9xddXMlELlf9lisuaNQxjvB5koqI2Xp1mNLlxcPunrYLbruP/OdnihQneuwXuBXPPVsHZkiyNO6
 Yq+cAz3ia0Ex2QVVND5ykNJrfzWvfxbQISeU2tOy0yGzRijhzftjLi753nCNPkdyY/TRVrOd8JY
 5SQ/v856sUnGgA+GsXHnFEDUQvwv0m53/te6VsPADAJjQ3Aon3S7SmKoAxIkKYK7W5IoI305pFv
 jrK2SPvKfpPkhX+Dghw==
X-Proofpoint-GUID: PgMQogRs0PEvCSSfczOmrMuDBTX7topF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfXz5KPU9v3tqvZ
 VfApaeOR1KK244fLN2Kj9tiL7GcZrWQX9iERYVlNqYyxeD6rFb3CV2AhMLm4/IYwKZmVaj2xLRg
 s1/95xO9VQRGsVLI6gbUBAlt9KmOrHI=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad06b13 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=PECRw3tLk34I9mwI6-AA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: PgMQogRs0PEvCSSfczOmrMuDBTX7topF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150023

Document the Glymur OOBMSS PAS node with its secure GLink edge,
shared-memory signaling, firmware carveouts, and power resources.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 .../remoteproc/qcom,glymur-oobmss-pas.yaml         | 154 +++++++++++++++++++++
 1 file changed, 154 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oobmss-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oobmss-pas.yaml
new file mode 100644
index 000000000000..3aa96d2262f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oobmss-pas.yaml
@@ -0,0 +1,154 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,glymur-oobmss-pas.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Glymur Out-of-Band Management Subsystem (OOBMSS) PAS
+
+maintainers:
+  - Anvesh Jain P <anvesh.p@oss.qualcomm.com>
+
+description: |
+  Qualcomm Glymur Out-of-Band Management Subsystem (OOBMSS) contains two
+  processors running Zephyr, managed together as one remoteproc instance.
+  The Out-of-Band Trusted Execution Environment (OOB-TEE) is the primary
+  processor. The OOB-Non-Secure processor is an auxiliary processor that
+  depends on the primary processor and cannot function independently.
+
+  The primary processor runs the primary image, while the auxiliary
+  processor runs the secondary image. Each processor has its own DTB.
+  The two images and their DTBs have separate PAS identifiers for
+  authentication and dedicated reserved-memory carveouts.
+
+  OOBMSS is booted by earlier-stage firmware and uses an XO clock and the
+  CX and MX power domains. Shared Memory Point-to-Point (SMP2P) provides
+  boot, shutdown, handover and ping/pong signaling, as well as fatal error
+  notifications. The subsystem exposes a secure GLink edge to the host,
+  with doorbell interrupts provided by the Inter-Processor Communication
+  Controller (IPCC).
+
+properties:
+  compatible:
+    enum:
+      - qcom,glymur-oobmss-pas
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Pong interrupt
+
+  interrupt-names:
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: pong
+
+  clocks:
+    items:
+      - description: XO clock
+
+  clock-names:
+    items:
+      - const: xo
+
+  power-domains:
+    items:
+      - description: CX power domain
+      - description: MX power domain
+
+  power-domain-names:
+    items:
+      - const: cx
+      - const: mx
+
+  memory-region:
+    items:
+      - description: Secure firmware carveout
+      - description: Secure device tree carveout
+      - description: Non-secure firmware carveout
+      - description: Non-secure device tree carveout
+
+  firmware-name:
+    items:
+      - description: Secure firmware
+      - description: Secure device tree firmware
+      - description: Non-secure firmware
+      - description: Non-secure device tree firmware
+
+  qcom,smem-states:
+    minItems: 2
+    description: States used by the AP to signal OOBMSS
+
+  qcom,smem-state-names:
+    minItems: 2
+    description: The names of the state bits used for SMP2P output
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - power-domain-names
+  - memory-region
+
+allOf:
+  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
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
+
+    remoteproc@1f000000 {
+        compatible = "qcom,glymur-oobmss-pas";
+        reg = <0x1f000000 0x30000>;
+
+        interrupts-extended = <&intc GIC_SPI 86 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_oobmss_in 0 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_oobmss_in 1 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_oobmss_in 2 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_oobmss_in 3 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_oobmss_in 9 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack", "pong";
+
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        clock-names = "xo";
+        power-domains = <&rpmhpd RPMHPD_CX>,
+                        <&rpmhpd RPMHPD_MX>;
+        power-domain-names = "cx", "mx";
+
+        memory-region = <&oob_secure_mem>, <&oobdtbqc_mem>,
+                        <&oob_nonsecure_mem>, <&oobdtboem_mem>;
+        firmware-name = "qcom/glymur/oobmss_tee.mbn",
+                        "qcom/glymur/oobmss_qc_dtb.mbn",
+                        "qcom/glymur/oobmss_ns.mbn",
+                        "qcom/glymur/oobmss_oem_dtb.mbn";
+        qcom,smem-states = <&smp2p_oobmss_out 1>,
+                           <&smp2p_oobmss_out 8>;
+        qcom,smem-state-names = "stop", "ping";
+
+        glink-edge {
+            interrupts-extended = <&ipcc 56
+                                         IPCC_MPROC_SIGNAL_GLINK_QMP
+                                         IRQ_TYPE_EDGE_RISING>;
+            mboxes = <&ipcc 56 IPCC_MPROC_SIGNAL_GLINK_QMP>;
+            label = "oobmss";
+            qcom,remote-pid = <20>;
+        };
+
+    };

-- 
2.34.1

