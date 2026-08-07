Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490BD44A3F2
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 06:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786083715; cv=none; b=mIMmTcvQtD6GykFwClz0xTQBIR0/qj3ly6q+vWi+wKxTjU95aAdjnGsWIjb2WE+yoXNc0YwI+AxOayk4XhuNAECZJpGTaRjBVrfML8NKuhCSrC8QVnUAr2O89rDW/9qGe+f0r9JB9Ss/8IU945qrXTZIzQGUA+4v9kJ16l5EcRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786083715; c=relaxed/simple;
	bh=6OpzcuW/vXrBd8EEvVAzR0F/OfZ6uSTpUvNzXmgWi9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tnXpIpisbm5jBasNysx+XuLWBWZUHTOxz+4d5SA8rAK7yDLib2B8v88I4tdPL6Rz2YX+fP69XUJ0oYPiWN8TMHDCdKKlBObYcixgOkrfofRg3uOnllBvq19k4WNaLoenFo2SPOSnCflp/7T2+9f0neVZoPvzfzLjEiMwEq/kjTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JjZVpV8x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eMwkVLos; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JjZVpV8x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eMwkVLos"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770Gk2O493134
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 06:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	68gUZ7LqB0jU7pBbWZu2QhSNvnpL1hcdM6zSdwGD5Nw=; b=JjZVpV8xGPmPfN5t
	xCbzxn4yJyhcaLhhtF1mxIHkNT0zHnqcq2cNgPQJkLY2LNa5GJqzaupZ1AIHtLCd
	jFw9RkAgG5vieGz9ljCZU97+WqOs2Bitxn3iM0yvTF+P5YKsGqhlHxvM5guaOa/I
	iihilP+B0bD4yPiYCMulC6lqcI5x6XQAiR1DzTA+nQ5f1xrplpjpJjyjbR1O5gyn
	hKCn0pq/ZIevCc20pyN8D023WtKoRBjUCWVxTNEg7cdXdRYqNR3SLhg6HDFA9Hsh
	rK3Qy7KyNPUZs0aZ9TfyI+rKgT27GbBEbeH3EfTXSzVZQsZpuWAgzdAJqNBwlXQN
	VHHKDw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6ragd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 06:21:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so3226942a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 23:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786083712; x=1786688512; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=68gUZ7LqB0jU7pBbWZu2QhSNvnpL1hcdM6zSdwGD5Nw=;
        b=eMwkVLos1yVt2mVIBZ2QX2cXEVwABUn8KXEZZzQYFAQUwFfLCJoiOQX2YWmTsYSVp/
         EWGGCGXKF6dKppBUn2nnFv7FDd7jKCQnEb3cTNQcrrlHNLQ199BFW5H6p7KlmDtSG7KT
         GdnYAN1+Eed4zVXYrDa+0JOl8YGBaDpGWm3g2AQ0z7YHYMGphUw5o2c/bk+/PMMEd0m8
         85o5jnt3jwctp/GCXpbjW9x8uMrAGW6S1z+fqpEwMU+ZggiBWIosuohVg3aHY/zFLKJT
         GGMmNbK+O5TdDVDI4pNz1Oel2A9LfZyZ0PRB5sLdQa/lPnQT8mynkzMSmJPKFG608cXz
         yB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786083712; x=1786688512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=68gUZ7LqB0jU7pBbWZu2QhSNvnpL1hcdM6zSdwGD5Nw=;
        b=ZX2722U+16yacad1vt7RNlkTDIkc4VR1QPBbS1Cp6u5rRNSLF24e9QHczbPuaR9oP8
         7P8ve6l9nYqSwlK7co5fqMycN5Bnp+L0ta49spRaXbsIwUJQxqh23EOmVZvK+2N2MSRK
         dqlSwW+7YkGYRHnmgte5ZWYjiTliX3MuW6Dxr1GYybRtFaBDJA+mXrPt+PNiCl0ssRXd
         W3+YJdziXdxju+w3mp3p3ckk9gsxqThHnZElYC1s0nNfIcV/3uThqjbNNgNCwbs7B/f9
         BeqX3s5bLfBn7W2xvpjFkBkDRnlWOMY1ixEBABivTN6J0PfEHKbSaD5ffhTdqK81Tb1b
         UOSw==
X-Gm-Message-State: AOJu0YwaJ00HYamyJae+oV3opXTKv9rN9f/GeRo4W0QgLbvU+KlhVv0H
	6fTfI6kDPM0PW9uFLu/N6bjAz7aR4veqRlj4XzAsvEe4AB7Slhj24Dx8+xDQscArfywqFeesM4z
	o1vd0wj24AqxDQ6lshxVO6Y65M3gNHX5b3YQOxTIfn48LrIT+4+oge+hXq7WeyZ0hKvRX
X-Gm-Gg: AR+sD13Qw6a/1ESXVK17z8wErKVYDP82QRMZIOWtgJl5BU7c/ULUxO1G+d8YFRM+wOH
	2ryOFT0WEtk68hVmku4Rl63Vzyo9280CVITvLl18V2jDv4UQVfIk4pGff7ZCKfSje4ni3djIxcN
	SHMU0kkxmEtJbR8Sg5KfklRVSuthOEDInCJBo8H0RH7lSxOoylMs/yV2QTfzc3udK4fsInjxwHv
	lmbGyGArY3IvwuihUjR2xHuOZNdoeHAjmciFFqdTImGof0Plxl3rEI9GNeOP1W288TMQswAQYkZ
	Cf5LTbK2gPrSgqf+83PaLmOtsY0B1aPjmxczpa/9//+Dmv8EPT/YSdfh4bn1plTpxCLx02XtLg7
	Hn+zzgivW6RGb0CRXeUcgJY9aGcMam0l2WJ05qHcU0camZdp3gr8X
X-Received: by 2002:a17:90b:3889:b0:381:973e:fa08 with SMTP id 98e67ed59e1d1-3903c5cfba2mr17401009a91.18.1786083711771;
        Thu, 06 Aug 2026 23:21:51 -0700 (PDT)
X-Received: by 2002:a17:90b:3889:b0:381:973e:fa08 with SMTP id 98e67ed59e1d1-3903c5cfba2mr17400955a91.18.1786083711183;
        Thu, 06 Aug 2026 23:21:51 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925ff24552sm1047301a91.10.2026.08.06.23.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:21:50 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 23:21:40 -0700
Subject: [PATCH v6 1/2] dt-bindings: input: Add Qualcomm SPMI PMIC haptics
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-qcom-spmi-haptics-v6-1-19fcecd5204f@oss.qualcomm.com>
References: <20260806-qcom-spmi-haptics-v6-0-19fcecd5204f@oss.qualcomm.com>
In-Reply-To: <20260806-qcom-spmi-haptics-v6-0-19fcecd5204f@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786083708; l=6327;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=6OpzcuW/vXrBd8EEvVAzR0F/OfZ6uSTpUvNzXmgWi9w=;
 b=QqRFkP1c/s0o92YVjR82g3PQz/jV3JzfqqMozYIUJUIvgiIGXq1VnwqZnjcJV0NLLP69RI51a
 csCnv3C407JBf5aTSDaTWHIoNQcTBYdArTU7yV31t8IKA+cuaaNV0hz
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA0NSBTYWx0ZWRfXxVt3PZs/vsPR
 q1lObR4qPWF0YhIoVsZgofBdpk283QPjrh3IXsd8wG25fx/f1qsogioLwFimy1hHyVM79Ej9jzP
 VCcQNzpzsJb8SRzXY2ESY2aCFRjNHXMq3MExsOubL/NK+rgZIePabN0WfuOXaN1jBcjoo3sZWn4
 ETlCSuFFfkOcKwC9yUhnCsUV21W9QvwkFHQG4OhNa1J2phfNoY/C4Xfx8uwy7syWZ/gbYj05xtM
 fop2AQzsZKqVCM73mIJzIMcGYcShZcttkU7HirhEkQ9cvczRwofKPwi5k/7XG0xuMPM30Z9uxFK
 EEbsx/HQ2qC2ceFH9pW3WfGtjeatY7n6FxWnOanE5cQk4fTRy3FQBxUe2Ld2Me0SX2x2mVN4tS0
 8EF6jei94qeonIihfuulRsmsxIErnZXVULB4t+IaNHZMjQm2sylFi93EMFtDjqUxZDZvoiF8Tl/
 w3j0wHzzRctuUhv4u5w==
X-Authority-Analysis: v=2.4 cv=HPXz0Itv c=1 sm=1 tr=0 ts=6a757980 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=bI6yuv9Qsz7HNVLwNVgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: b086o_L2PHEwHp9n_JjOomafPKx9IGFM
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA0NSBTYWx0ZWRfX23yGP8Zr5fnf
 GxtcIPo9ZPTbE4kwcyYGya+LezaHZmRFbYD16lMv97pjFwWajK3jU2cUSxnOobtrFc2q0sCX7fy
 zeeMebND60LKzv5OrVawbknqIFcpkHM=
X-Proofpoint-GUID: b086o_L2PHEwHp9n_JjOomafPKx9IGFM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070045

Add binding document for the haptics module inside Qualcomm PMIC
PMIH0108.

Assisted-by: Claude:claude-4-8-opus
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 .../bindings/input/qcom,spmi-haptics.yaml          | 136 +++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml b/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml
new file mode 100644
index 000000000000..b1a69e9886ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml
@@ -0,0 +1,136 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/qcom,spmi-haptics.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Haptics device inside Qualcomm Technologies, Inc. PMIC
+
+maintainers:
+  - Fenglin Wu <fenglin.wu@oss.qualcomm.com>
+
+description: |
+  Certain Qualcomm PMICs integrate a haptics module, such as the HAP530_HV haptics
+  module in the PMIH0108 PMIC, which drives an LRA (Linear Resonant Actuator) with
+  an output voltage up to 10 V. Several play modes are supported in HAP530_HV:
+
+    DIRECT_PLAY: The hardware outputs sinusoidal waveforms whose period is
+      defined by qcom,lra-period-us and whose peak voltage is defined by
+      qcom,vmax-microvolt. The driving amplitude can be scaled in the range
+      [0, 255] via a single register byte.  Hardware-based LRA auto-resonance
+      tracking is enabled by default in this mode, allowing the haptics engine
+      to follow the actual resonant frequency of the LRA and update the driving
+      period accordingly to achieve stronger vibration magnitude.
+
+    FIFO: The hardware can play an arbitrary waveform composed of a sequence
+      of 8-bit samples at a configurable play rate.  Samples are pre-filled
+      into the internal FIFO memory of the haptics module and continuously
+      replenished via the FIFO-empty IRQ until all samples have been played.
+      An 8K-byte FIFO memory bank is available in the HAP530_HV haptics module,
+      shared between the FIFO and PAT_MEM play modes. The memory partition
+      between the two modes is configurable via registers, and FIFO mode always
+      uses the 1st partition starting from offset 0.
+
+    PAT_MEM: This mode is very similar to FIFO streaming mode but without the
+      data refilling capability. It is designed mainly for short, latency-critical
+      vibrations. The memory space for PAT_MEM mode must be reserved for dedicated
+      usage, and the waveform data should be preloaded and remain unchanged
+      thereafter. The haptics module can play the waveform data from the memory
+      region specified by the PAT_MEM play start address and length registers.
+
+    In either FIFO mode or PAT_MEM mode, the following play rates are supported:
+      -- 0(T_LRA): each FIFO byte drives one full sinusoidal cycle with the
+        period defined in qcom,lra-period-us.
+      -- 1/2/3(T_LRA_DIV_2/4/8): each FIFO byte drives a half/quarter/eighth
+        sinusoidal cycle with the period defined in qcom,lra-period-us.
+      -- 4/5/6(T_LRA_X_2/4/8): each FIFO byte drives 2/4/8 sinusoidal cycles
+        with the period defined in qcom,lra-period-us.
+      -- 8/9/10/11/12/13(8KHz/16KHz/24KHz/32KHz/44.1KHz/48KHz): the FIFO
+        data is treated as PCM samples and drives the output with an
+        arbitrarily shaped waveform.  This mode is typically used to define
+        custom driving waveforms for specific vibration effects such as fast
+        attack, crisp brake, etc.
+
+    The drive voltage in FIFO or PAT_MEM mode can exceed the value defined in
+    qcom,vmax-microvolt to achieve a special vibration effect, but the waveform
+    must be short enough to prevent the LRA from being damaged by operating at
+    an overvoltage.
+
+    Also, hardware-based LRA auto-resonance tracking is normally disabled in
+    FIFO or PAT_MEM mode, as these modes are intended to drive arbitrary
+    waveforms that may not follow the resonant frequency; autonomous hardware
+    resonance correction would interfere with the intended output.
+
+properties:
+  compatible:
+    items:
+      - const: qcom,pmih0108-haptics
+      - const: qcom,spmi-haptics
+
+  reg:
+    items:
+      - description: HAP_CFG module base address
+      - description: HAP_PTN module base address
+
+  reg-names:
+    items:
+      - const: cfg
+      - const: ptn
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: fifo-empty
+
+  qcom,vmax-microvolt:
+    description:
+      Maximum allowed output driving voltage in microvolts, must be a multiple
+      of 50,000 uV. This is the peak driving voltage in DIRECT_PLAY mode,
+      which outputs sinusoidal waveforms. The value should be equal to the
+      square root of 2 times the Vrms voltage of the LRA.
+    minimum: 50000
+    maximum: 10000000
+    multipleOf: 50000
+
+  qcom,lra-period-us:
+    description:
+      LRA actuator initial resonance period in microseconds
+      (1,000,000 / resonant_freq_hz).  Used to configure T_LRA-based play
+      rates and the auto-resonance zero-crossing window. It could be also used
+      as the initial period if the LRA wants to be driven off resonance.
+    minimum: 5
+    maximum: 20475
+    multipleOf: 5
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - qcom,vmax-microvolt
+  - qcom,lra-period-us
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        haptics@f000 {
+            compatible = "qcom,pmih0108-haptics", "qcom,spmi-haptics";
+            reg = <0xf000>, <0xf100>;
+            reg-names = "cfg", "ptn";
+            interrupts = <0x7 0xf0 0x1 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "fifo-empty";
+
+            qcom,vmax-microvolt = <1300000>;
+            qcom,lra-period-us = <5880>;
+        };
+    };

-- 
2.43.0

