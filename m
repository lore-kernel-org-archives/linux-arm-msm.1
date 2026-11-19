Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078919;
	b=qilnpLryp7JTIDTDNdEV0+ML0OHrync8Pvg5oCr1rd24BAbwndbLVPG5GDOlXkeLjQgA
	 UjQpkXjoqXkdV0Bh0+Zt0GBvz4nevbgqwiVVzF8RxWPKz1XAs3svUdFKgNriCxgyVBiwB
	 MwwKwC0EBjWAUPYnW/32ARMPomWOzdUrC/EIfn0dKGoSt33xIRBNpHA4DuzATmmXoofLs
	 75lxeksnpbRhsEXm8dTwmT3i/9oR4bVsRoslm3jRWdgFEuwXZoUzojOxbH5qRMYyOQZEH
	 3NXDlmPDYxKdIlwdGq7mT9CQ87IL29A+GDUnQ7d/gJPQzFW6emCMBKfe/YvTPIkoocw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078919;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=waV53ZLSAR7jtpA8EHopoVYZ6oXl2kJ41A9F8/VOZYg=;
	b=SsKWjsOJ9k2rXzQIi2lcvaNL3A0DgDJT66Zhd/xc2sk8mWPD3ryB6WlGxVFEhRVJyaRq
	 cXvNmp9bDyMfk82yEyrgBRwQrVX8Stbmf9fO3K5Aq4MoYZ2dLVmhKvUv6ccY+XCjOFLUx
	 /ZgDRaMit9v4laE03fshPb76GcTSG9G5T/sRJgH71mj87NhJKaXGdwjRGQlqYVuuNol9m
	 y9vC2MBRdGskGslW7AGPF8scXVdLkk+s0wvYqVx3+yp4+yxmv0URqRT8RlLuA/oYESQql
	 9fG1j5nHIZHogXsmounS6Db17eQseaLMos6V7GIm4VBgYOKivhcyWr0LfuL4CZvFUjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hR4+yEg5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EcLoU0Wl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92823606A326
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 09:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92823606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hR4+yEg5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EcLoU0Wl
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ7ZreV3718214
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 09:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	waV53ZLSAR7jtpA8EHopoVYZ6oXl2kJ41A9F8/VOZYg=; b=hR4+yEg53SHmzaOf
	EG1SQF8KAERzpL15tJczzt4cwkY1x3N8tnipH78YjIGtUI2u+YtyYyHgUymLlv8Y
	6a+xSlDyMMUmfVxbUxt1t3Ev4Rsb8fU1DAbh2Ky2LKOX4nRuTBqco5Zh7U3M10Ah
	3M7pi3cuGqvnyM1GF4AU/cp8gwsUhkF1QUomJfbgVD7Ixu/VXq8BU3PDZ7CJVV/S
	DAiZOkHk2QilVLEgFTgZpjnUpNTOortJPXrajQY4sJ5mbU9n7OTODa13JvN99nDo
	9/fbmqRu5304GdGnVJYuqjE6l3GAcNFpOzmP7GLtLumt0XIVJcuSCoKMXMT6S1GY
	WNsQhA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1vv2rc7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 09:01:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so2516763a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 01:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795078916; x=1795683716; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=waV53ZLSAR7jtpA8EHopoVYZ6oXl2kJ41A9F8/VOZYg=;
        b=EcLoU0Wlmv6WEkxWai7a/Euy+dJ+0CbapHjC/83LxGeNq7YoZUHwjPs805HceDvtjm
         QDkIsKV7PZL5g0muO1WEIHIwdUthjFUey8UiF2QEz1HcUyxs1yc7yKrCh6EKodYce9UY
         fZ4j6CQqmfueUQQ1CadASuRzC1M6zXwkJKtEE8LgH+f1duoGDilGGg36+cgI0M5HvqfT
         EzQ8PvKzpSDXnCAUgGMU8UFt4GI3+B+ZWqvI4CVG7+TUefciBxudSyo+jYygNKNoEFqj
         U8HTkA9UIeM0fbzkxGAYC6wDUU+T39nUnyA5Dsan3zcg0A5//tF+6/vzFKa1uBRKV/qr
         PyCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078916; x=1795683716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=waV53ZLSAR7jtpA8EHopoVYZ6oXl2kJ41A9F8/VOZYg=;
        b=D8WiNlIGRd2OUTApWVKSm23e5QzNU8k3NpRLSsQm988LVUcWIJzA08reaufXWgBSPq
         sySxAgWu3q1shZ5MneHC0cWwqbHTdj2kZhj4C1rR1R1wct9+MzVz/WBzX69NUptS28LR
         1nB0gRvAmHSifwHjbn/020dkKHNAyguridqu+tHsV+H46Rxk2u7IxckvgEihPez0CLL3
         V0MGqARld7F/VXb6x9bFvTcXYFhq5iYI4loKHWjBlmPqAo2k0kDjn3u9N1j68h7in1QI
         cmrz72CkIAv/1z76M+qrmCGnZcdEjaC1jS4YTypDZC45n2TQ3jziU2o232umL8TPbuNl
         hU0Q==
X-Gm-Message-State: APuU4Z/+5qdBUQzViOQtb3BPA+mgqpz88jbCPioMdLHt65XK9Wq5jDrx
	v8X/YNkYX5wLLIjKZBgL7R4+x06GR9CVLiuQHOeIoIk3eUgwA+hv1Oi5Vx3bD160LLnH/snVOz3
	f7a+njWh6oty7NWWALhDVnpVR+3AcuvD7v27T5iRjU5c98PMbAvHwtN02h2Q9LKbbHO8A
X-Gm-Gg: AZFdTZePk8xtmtXs7uUs+BSSQNCOmeAhQHRys3/h/ZjKeJljZVoGLCtvlp6BRvywxhI
	xN26FvIE1wJJD5lDuh8Zf8X7tzEEifgH6FYiUrY1Oc7kvubX3Ic4oEdnBt/GpJ6rkCL51NCygkz
	YBzm1kBEC251sj1TEyG6zaN/73XWZdaZggnJx6waMkzvtQoPYJZI2hHIFbU5Z/hJWTrJGz9JL14
	vx58U3ffwucRYU5TBv6ikaJAqez5HPbSFCbaU6aaOJW112IDEz5KWpNrF6jM/7SD/T9tc7gA1qN
	s0EZvClkLpvKEcmwRHMGpcKVNs8gym+c6RDd6jE5EQ5VUiAp4wBsgvo/g8LI9jOy26/vKk9gf9B
	lI07JM10BNBjaX7WTzmpG41zWFOQMWbyGkWWp8FlHcP3G+XC1ZZuHdhfy22bSYUO992OjCNqhTn
	ShJHZs+9hlBVSy94JYvp5iuA21XQKKC95120en
X-Received: by 2002:a17:90b:3c8a:b0:3b4:a90:7f3a with SMTP id 98e67ed59e1d1-3b40a9080a9mr480390a91.55.1795078916017;
        Thu, 19 Nov 2026 01:01:56 -0800 (PST)
X-Received: by 2002:a17:90b:3c8a:b0:3b4:a90:7f3a with SMTP id 98e67ed59e1d1-3b40a9080a9mr480335a91.55.1795078915451;
        Thu, 19 Nov 2026 01:01:55 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d97356sm1689539a91.13.2026.11.19.01.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:01:54 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 17:01:16 +0800
Subject: [PATCH RFC 3/6] dt-bindings: arm: qcom: add QDCP STM source
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-introduce-qcom-qecp-feature-v1-3-b1a730d2c57a@oss.qualcomm.com>
References: <20261119-introduce-qcom-qecp-feature-v1-0-b1a730d2c57a@oss.qualcomm.com>
In-Reply-To: <20261119-introduce-qcom-qecp-feature-v1-0-b1a730d2c57a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795078891; l=4430;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=wgUmKqHp8cq+mf7GbzW/6vYU3g1oJuZgz4QaZbxBLrA=;
 b=sx68gFAiWywWLZiB/xQWyOxC2rvsyPB++cT5zzwjsvXP1qsEqTKbU7IitSolDWV3oR88pvRAP
 Dtq4n+vxoy4A8Az/USgfm8hLtohH/f3xEZGjO8LreQy7BMuBByD4rdx
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: 9uOT9HonGi2ker0V9QPnbv15Tiboe12J
X-Proofpoint-ORIG-GUID: 9uOT9HonGi2ker0V9QPnbv15Tiboe12J
X-Authority-Analysis: v=2.4 cv=ZZWIpcVA c=1 sm=1 tr=0 ts=6afebb05 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=P3Jn8C2Hv6jw6lTxns8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzNSBTYWx0ZWRfX6pKouKFiqfl1
 eUHdT7chjOfNRF4Wxbd6fMwJlU7NDaBMEjJlt7QneaGsmMumaJu2v4Dsaaa1FoYBfHIcxMTNoTE
 WxTA4V+5rVd3HdrX0tErqJrGa5uZ0VA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzNSBTYWx0ZWRfX7m3hDTcgCr+r
 /lnz/hxatK0zOe5AhmD+joJQdhACxty0c52NuibJWgLCpyKdSl/LH2KZcfEdkTnhu3pPeqqzJKK
 7Qi37hQavwEUle8t4GMXJfBUm6xuB4e+qnYYJ+lj/+rzJEuPtBDOjotms/CTMnw2KLjsJrGHb6u
 h1qj4tnGXEs8ly4cC62/F4S97tcc7j17jCg06P41gq5eQ+XkZCMBao/KaLO48W9f62g7m6CaM6h
 KHf+ojukPobTIy6fP45LLnzfbt5TjMPyqVQkjrBLXrfcnExRPafADh6rFTqeVMnQGAOaT5+JumT
 Bra2qUtN/30jANPc2iKbrxSYXlVACtefvPudcSErEZtGww9zCecd7f3hsX0R0ncNz2lH2svg78D
 lTaTWRWaCsd7/SUQSYAfIa/JMODLN/wXE6z08LCaObt7MHl0eUfjosUB67OtM+bbugkpf3XzuT1
 tEHETKDMT6N+jtUPAZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190035

Document the Qualcomm QDCP-backed CoreSight STM (System Trace Macrocell)
source, for platforms where the STM control registers are owned by
Qualcomm Embedded Co-Processor (QECP) firmware instead of the
application processor (AP).

The node describes only the STM stimulus aperture, the MMIO region the
AP writes trace data to. Firmware controls the STM through the Qualcomm
Debug Control Protocol (QDCP) provider referenced by the qcom,qdcp
phandle. Firmware also controls the block's clocks and power, so the
binding has no clocks or power-domains properties.

The output port must have an endpoint so the source can be connected to
a trace sink.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../bindings/arm/qcom,coresight-stm-qdcp.yaml      | 111 +++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-stm-qdcp.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-stm-qdcp.yaml
new file mode 100644
index 000000000000..f365ce2450ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-stm-qdcp.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/qcom,coresight-stm-qdcp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QDCP-backed CoreSight STM source
+
+maintainers:
+  - Jie Gan <jie.gan@oss.qualcomm.com>
+
+description: |
+  The System Trace Macrocell (STM) is a CoreSight trace source designed for
+  high-bandwidth trace of software instrumentation, made up of memory-mapped
+  writes to the STM stimulus aperture.
+
+  On Qualcomm platforms where the STM control registers are owned by QECP
+  firmware, this binding describes an STM whose stimulus aperture is mapped by
+  the application processor for data writes, while enabling and disabling the
+  trace path is delegated to firmware over the Qualcomm Debug Control Protocol
+  (QDCP). It references a QDCP provider through the "qcom,qdcp" phandle rather
+  than exposing the STM programming registers directly.
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: qcom,coresight-stm-qdcp
+  required:
+    - compatible
+
+properties:
+  $nodename:
+    pattern: "^stm(@[0-9a-f]+)$"
+
+  compatible:
+    const: qcom,coresight-stm-qdcp
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    items:
+      - const: stm-stimulus-base
+
+  qcom,qdcp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the specific "connection-N" child node of the QDCP
+      provider (see qcom,qdcp.yaml) that owns this STM's control registers
+      and services the firmware enable/disable transactions. This must
+      reference the connection child node directly, not the top-level
+      QDCP provider node itself.
+
+  qcom,qdcp-source-id:
+    $ref: /schemas/types.yaml#/definitions/uint64
+    description:
+      QECP firmware source identifier for this STM, used to address it in QDCP
+      transactions.
+
+  qcom,num-stimulus-ports:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Number of stimulus ports (channels) exposed by this STM. If absent, the
+      number of ports is derived from the size of the stimulus aperture.
+    minimum: 1
+
+  out-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    additionalProperties: false
+
+    properties:
+      port:
+        description: Output connection to the CoreSight Trace bus.
+        $ref: /schemas/graph.yaml#/properties/port
+        required:
+          - endpoint
+
+    required:
+      - port
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - qcom,qdcp
+  - qcom,qdcp-source-id
+  - out-ports
+
+additionalProperties: false
+
+examples:
+  - |
+    stm@a06000 {
+        compatible = "qcom,coresight-stm-qdcp";
+        reg = <0x00a06000 0x180000>;
+        reg-names = "stm-stimulus-base";
+
+        qcom,qdcp = <&qdcp_coresight>;
+        qcom,qdcp-source-id = /bits/ 64 <0>;
+        qcom,num-stimulus-ports = <128>;
+
+        out-ports {
+            port {
+                stm_out_funnel_in0: endpoint {
+                    remote-endpoint = <&funnel_in0_in_stm>;
+                };
+            };
+        };
+    };
+...

-- 
2.34.1

