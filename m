Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C488472066
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 07:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530302; cv=none; b=oBr5eIn7hyNCL42ZWfLZ8xSgSXrBgc8rTA9xhmIoNFsdtYbEzX/xhix5fp7vWRA9Biq6eR9gr8fc7BM7Zp1oZyuYM2B0IFZiYW/8KGfowA20jmW71GXhEqLFpNF0JQ0t5/Wm99uBChFVDczOmKyKXaYnYi5yYBwzbjJVsb2l+u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530302; c=relaxed/simple;
	bh=2I0TgLGTRUZ3RPGEsp7nurlffiIv1mKimIVCvGo7SiA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gGIh8iKsP8OSOcZuEVQC7hJo0uosQzxSBSkt0WaWNppzfR666sSkhosASWZ+k1i81mq3lPwP+jHm9eNEb5HgHG2v5MHZN01sxJH9mQHRayKv1iftu0LaBhWAj3jzhAjMUtqBh8vu206OS5XEHkaXcpL97GdZE2G8Q4UhDL+qAbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P3rxt+YE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WeQDuPQi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P3rxt+YE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WeQDuPQi"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HHOV451378
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 07:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PNBiUAh4iADHGkL8y8Bp+SPxIEi1/Ic5entnoZHLiuc=; b=P3rxt+YENe/XArr+
	8d+biPs8O0mSpJjBYHYgLWijLGulC9wAy37ZOLRfNOQAieJjMP4Hlpz2FHDTUhbe
	srg4benD4t9DHDPNY4E57rQLLKBkELEdNof+XvPUNxuaxBkGdL84ikEHED3DsG3J
	Cz2ypOcT5YZyrZ5JNQpKb+IA9aAImJ+WxLy1q0HgMnlzyMtIeU0Tyz5Pqm8AJo/G
	E6iFLGY8j1Gq2inpl2yKZwGWGqTCa+2bkREP3Fb5fCWqgJPxXJYYiqABS3/HR0dk
	lsIhDGVVNBoUfAT4PS7NqkA5W6j87lmvF+oDwVkaIA+phZGPBbkcFnFo9Q24glNo
	R+7FOA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6b9kkk0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 07:18:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd5ca3840c5so14667a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 00:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791530298; x=1792135098; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PNBiUAh4iADHGkL8y8Bp+SPxIEi1/Ic5entnoZHLiuc=;
        b=WeQDuPQiOWRdihaOCpZyTopu59LaEQkKyHZuKLU2KexML+2om+2E4aaB5h3RxLb7SY
         +iYw3yKpxMNBHiNBxQA4j2lDahb8oofIjbcwW0ruxZw1sJTKa6Mk1Ja51jKVXxBpUMK+
         53MZN7C+zjmEfgviY2RO7p+8fT35Q8xhbB6tkwsBn2Mxkc8mg5eb2EZ+EreAJfr1yGS9
         qNwZfwFf0woaK5xoJ9gC0uwtozgStEwf3y7cpx+1iRkrhGHW/kv2q444nGFBk1SlSrQy
         k6nTnyOqBuxJuWgmapcQ6AK4HtLxLeYK31xTcKsDwPXE6ddkPmL9NMmJvar8agavoOWl
         vDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791530298; x=1792135098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PNBiUAh4iADHGkL8y8Bp+SPxIEi1/Ic5entnoZHLiuc=;
        b=VZrwSBVlxIrv6fh/0kAvZU4FZhcI8Ze2AehzljiEcMnGEihjUpNWrPpI4srZjya6K2
         RlDtgsUNb+lIIrW8Ud+fGPfW969fQredsZtqjbEM+Nt478usktmzVANFqPfA69ASW//3
         5rjG6BKPeDzMumb/rXr8k+9BgcSXbsig9OM9f8/GPZPni9+mlrYAZzuCsAk9Gb9EUIld
         Kqfompp0e5vEAWifK4YymvxQ8g9MohYZuHwR3GqNDWkrUHqDsEDYsb4imWkGXIDis5ao
         RmucJ9l3PKP4nlaxiyLelqE03JV7d7+QS0L1MNePOMVj9dPXLD+pvQcle/7cJATSR5cv
         FHBQ==
X-Gm-Message-State: AFuF++lsx2hh19xCyJPA59xa3JOrVlUaPI0ycFu6pIbfa3cokX6pK+FR
	Wywjw3Bey4uWuUJsCwYBOCLw+XmQUV0LX9RCOUdOfQc56UWjEnOglBDTj7hm+POMLFIaZvWZTzT
	XmMPmwsNxad7v3b4tSOTk0hZJfoiprlUVrsUjwvHpt2ZeYaV1lNV9agm1+ym7pTUZ6ChT
X-Gm-Gg: AYBFou0OEKhGQOFTdBGrONh+fI1kPD/8sTUUVD5T/Z5VRiqkAH6aTsHryhPmWAMQgXQ
	RK2FysJFz98RrB6GCouttdV0UWuSBb5h39KV4RNJ1eSUV+5thKMZDvIXvCKqiOnlq25BdbuzzZ1
	ezh0mSeY6ItNlTAfK/K5GUmDe4+u6wiC2VN7gKEBvmh1f1vio99kFMcpTg6JLdB5dMRz5dLKnW5
	VemHsYXB1tH8CpOTsR6sq+PNiucyo4u8zH+TGMcrYIuCxlkBFdAF8T0hi5+YfBIg7AWO+4hQt+o
	ioeUEfxy2UNLRi/Y5BpNARXThYRtewl7MRSfnyBYzVLJPFVIgFPiXxDcq/3f/BHl/HBy/tKWGQC
	C9k1ieTzzyBAtSmuKO+zMG75kUL4co5i5szdajQ5WFOtenwwgaHDGzuG69jTVUILmiUxkHd5kUk
	s2O13FFJZNH9Cr
X-Received: by 2002:a05:6a21:7a8b:b0:3dd:a196:53a4 with SMTP id adf61e73a8af0-3e16bf071d9mr799017637.70.1791530298238;
        Fri, 09 Oct 2026 00:18:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a8b:b0:3dd:a196:53a4 with SMTP id adf61e73a8af0-3e16bf071d9mr798997637.70.1791530297786;
        Fri, 09 Oct 2026 00:18:17 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e1d287sm494387a12.13.2026.10.09.00.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:18:17 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 12:47:39 +0530
Subject: [PATCH 1/4] dt-bindings: remoteproc: qcom: Add Glymur OOBMSS PAS
 binding
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-oob-support-glymur-v1-1-96cc8ffcced3@oss.qualcomm.com>
References: <20261009-oob-support-glymur-v1-0-96cc8ffcced3@oss.qualcomm.com>
In-Reply-To: <20261009-oob-support-glymur-v1-0-96cc8ffcced3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791530288; l=5959;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=2I0TgLGTRUZ3RPGEsp7nurlffiIv1mKimIVCvGo7SiA=;
 b=zqLJnNFoppsKjDsALNRYCT/gZTN4uUgF1TAPyddMSDGYOaFRmea8DWyyePLk70PcGIbZlI4n9
 7RHVM9pFdLDD55+cKufDNTK5pNB0UiI9MguXCzeL8ZbxPKRdW3gsPhw
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-ORIG-GUID: KGI31LlsfP0luMEPqRCjHpypM6K0fJF-
X-Authority-Analysis: v=2.4 cv=U98Hnuru c=1 sm=1 tr=0 ts=6ac8953b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=vENXqeAD1IxtdBWlekwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyOCBTYWx0ZWRfXybXaSp9GuIre
 fdiBvVI1UY4LwdFFA7xmeuqp1eI6qmjzC95A6xm403H7QU6rgHDdFGyE15pJBG/nzEm3xMQHDRI
 kZtjwRGfNF1SjZ0uEazg9eKP732PiBI=
X-Proofpoint-GUID: KGI31LlsfP0luMEPqRCjHpypM6K0fJF-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyOCBTYWx0ZWRfX+CorOyuYPYjp
 fpyuKdJVuJhEQ+lBMoldecDhUMgv+9xcyd2bnlTXjZL76B3wOpnQRYLNiZYFgSpeT/Mghubylia
 PQv+/Ca8rMp01/zLn0z3OU/4wMzmlvArGM+O31TAXm7YZc4NhhdvSpDmhgeIgmi0ttSBOpbb2ll
 UITtuliMcm+2+2r5CMMr9Hm3SUktWvgkzs8F5Rx+fu2jP8ZV/+EckT1Z3OG3qysQU9XaCblAcJJ
 RswSeYdudkcdzgqPzWeMYF3jDV9wnn1Cl07ZopQj5dkdqDfl2cb3jTiv85ESbLEUOBl4RxS2qce
 w5LBIpxMYJuNQmDEreKOSl6wSaTZ4RYw3RRVmgXcSU9C8IK+TZB9dLarfj33W8rNu48rcOEs5SQ
 hL2ZnbTfALktjHY5Aa7edHjmTNhFMOlR+nbV3VwNvBVNgII8s3OcK01a0bzRJsopR47/ZwFTJEj
 7uOahyF+1DClyoHeLIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090028

Document the Glymur OOBMSS PAS node with its secure GLink edge,
shared-memory signaling, firmware carveouts, and power resources.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,glymur-oob-pas.yaml   | 156 +++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oob-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oob-pas.yaml
new file mode 100644
index 000000000000..bd4f397da40f
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oob-pas.yaml
@@ -0,0 +1,156 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,glymur-oob-pas.yaml#
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
+    #define IPCC_MPROC_OOB_S 56
+    #define IPCC_MPROC_OOB   55
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
+            interrupts-extended = <&ipcc IPCC_MPROC_OOB_S
+                                         IPCC_MPROC_SIGNAL_GLINK_QMP
+                                         IRQ_TYPE_EDGE_RISING>;
+            mboxes = <&ipcc IPCC_MPROC_OOB_S IPCC_MPROC_SIGNAL_GLINK_QMP>;
+            label = "oobmss";
+            qcom,remote-pid = <20>;
+        };
+
+    };

-- 
2.34.1

