Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760353F44C1
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 09:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787910585; cv=none; b=BrmqF2R2nkFgm+QqZ4RWmATKboQGpOjXDk4xlMEF0Qd1ojgoBGIBNIQBimySGCLQTCgfNYGctQkuHgVSfDjwpp6hBLA7YzUNvKNjxm9qdN9aqQWlOzQRze5tfISb+RBhO0QValuBBIMSDdticpMjwclV+GuzJDosCjWZfSUAkQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787910585; c=relaxed/simple;
	bh=YcJzWuwZ1RPM60Xmk1Fr6v59EnVXQyCH0dMpsNpXZwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kw4grQcmTVnRLyiyrKHgDlL2sTX0KlwM8cQFZlISXhWRbfxAiDopp8zVw86a2cERrmzuSc/LIcllh0tzWyhsVeYo3a3GOBYGOGGX8K8qrxEEnENU2Xu47PkXz1wDG1G8mAyWtWAM4kGM+mBNN+I2k/oYKxkyTmX0fh5ZeQ2hBcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AtIQ/bsW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ecc9mkSm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AtIQ/bsW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ecc9mkSm"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S85PEK1894908
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 09:49:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hYYmAr/X6jkEKVI/rUiLckvRRdWrzEQRkaCP6T8C01U=; b=AtIQ/bsWp4n3wEmX
	1y+L3yXaOGP/lQ+xPwRu/e1Zed2KvnRK249wWj0M1s9GmVJ5HeJcSCkkhMpB4/79
	owJVeRS9vwkWbKuCRtyG4VAmuGhodlL5A0iJ039bXbwutvb6K/bOgqPmBMPzj3gf
	dYAoK6C5I/agpX74vm/OQKdgip4lKVxrpMDXroQOB8HXL51h0P7oasl+yV7I8goY
	x2+q2u38jXdNr/iqAmTSgyMJ2cKXparjO6LeS0mObNeFkwnLKb1I+Gfu0ZfwTxRA
	aDbsmV/J22Lm+6C6zGITlhLcrF0meh4+R7l1S0coOrrd7/icBTyyhzTBF9PZZVFC
	UJfJ3Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb6h00cvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 09:49:37 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1b6f65dacso911158a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 02:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787910577; x=1788515377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hYYmAr/X6jkEKVI/rUiLckvRRdWrzEQRkaCP6T8C01U=;
        b=Ecc9mkSm5+pr0UC/mYybbmN5qm2sDKLivLbOQqktkAOeZTqe/F0y1acQrI/LjlOFCJ
         wEpMbxc7h2kl6lDQFzF26E7OklY3OAPGzwR1X3wrd//c7d8tPLiTdsP2uiMn2TsYt+ma
         F5BSC14SxFvPY9xQcknsgyHO5Dnd5jyQ7QkexliO+OJh6gFzgeCXrE8lLEkMo31mcLAv
         9oXzURH40LIltjcB2xLUQZQSzXyFrq6AGKwjjWwenWTIKy8MS9n42ftS/aFM6UVSFVEF
         Defzy1N3D5lNk51/YlCRe4yiRGksqESxe062e16kB9+djXg8n+Ca4r+cp9B7tn4Lp3NU
         FzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787910577; x=1788515377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hYYmAr/X6jkEKVI/rUiLckvRRdWrzEQRkaCP6T8C01U=;
        b=PFHE8hbtAMLgwI8uPpX9visVH7bfz4GFtB8jIEwL3PIR/CnwpzW5orUYMmbfKocWZ3
         dmP0s3wT9LEGumZ+iSG5k9pWiWg3UFFaAFPBfJ++2YQvZ+5Oc4A9oj3Sqwn7LvYVVQjX
         5icJ+LptGEJMPwiRWG3ohciZGyxMvdUhUsVtcQ87AZCKVaXthMbEEOx2BT0HBXtHE0c9
         ViCPZAaOQqdfyQj57608FxMpL/sA1yJSl5oRVqpuneU0UwqiYMR830Mc2lwujLsYpR2K
         ZObfAi8D6X2Bzkb/Rzpt8gLbgCNlNHu9EaNJgLcJ/itSZuEA2HObCEpmnnR3CNMMyjMH
         Z89g==
X-Gm-Message-State: AFuF++mQiztdCDDwmKeenKB07OkuK2aP8VS7/ht5lL24WoKE38tUpEPh
	RIpH2VFjTuCpC/16bLcQXxsigA4i6aZjzc4tLKqnEG92Znt18MoW0WuRCKGXZuEm4JU98gy46cd
	JWxZw7Q25DOglB4UuDhSKTSB5IfACfXvkNNTZpg3P+4yPq3XSD3XhJcdJZpmPU3xkpmm6
X-Gm-Gg: AR+sD12E2vKkd3vBqY5/Y9aKY74VIT8YGKY77ao0zFjw8lorKeo1v6VSUZmiIxeoeMI
	GCNSQA+RCzdRd69TgchRdbZuhUG0zO6mS/dXHz3OgrQ6zZKx20b03z996MU7KiEq18t+G6Apb7G
	LADZD2V9+qY26FXfihhEuM/hr7P/VY06bj4J7s6hUYd1FHyOsHInIAxHKFxAvABgQ5gEYpJVhOU
	lkU3EgqVnx/UDKlsgp7LUstTj+KZMg3bwPCX3RDlosBvLdSu269fhzEMq3hW1rBLLFN2N20q0ht
	lJUI8IYhrOzdwvy0jf/XaCzx6IE7/zymtzP+ayoheIPp8Gtsm6RhK4AVerVeH9vq0ot81620lB2
	pGvWlzAdqrUgf+dD6+m8jQjTZw7ynbDr57jqiIA49x9d1tz3OFzFx
X-Received: by 2002:a05:6a20:db0a:b0:3d0:ba81:79b7 with SMTP id adf61e73a8af0-3d26784f3a8mr12211053637.12.1787910576800;
        Fri, 28 Aug 2026 02:49:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:db0a:b0:3d0:ba81:79b7 with SMTP id adf61e73a8af0-3d26784f3a8mr12210707637.12.1787910574941;
        Fri, 28 Aug 2026 02:49:34 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f783c57sm4851549eec.4.2026.08.28.02.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:49:34 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 02:49:19 -0700
Subject: [PATCH v7 1/2] dt-bindings: input: Add Qualcomm SPMI PMIC haptics
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-qcom-spmi-haptics-v7-1-0367b3ac2e1e@oss.qualcomm.com>
References: <20260828-qcom-spmi-haptics-v7-0-0367b3ac2e1e@oss.qualcomm.com>
In-Reply-To: <20260828-qcom-spmi-haptics-v7-0-0367b3ac2e1e@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787910573; l=6461;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=YcJzWuwZ1RPM60Xmk1Fr6v59EnVXQyCH0dMpsNpXZwI=;
 b=K90zooDTYZ589cAtVeKL9aS4swwJGlljOoatZpGEue6YcxFrgVCTUelwbtQ/p7C9g7QCr1hmw
 dOwWvkfzbXpC/vmYQrnY5kv6zRrbZN6IzuY+Rxq0Pz4wprBWHueR4FS
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: JRsC91GSbAHWtm-ENu6U3F-QPghZsP9q
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA4MyBTYWx0ZWRfXyX4YO/MZcWTD
 Yo32hjeEHT/tkj2GSAUWFfAbftTEXD4D3kb0tqg/FY98f2CvrqEVSyB/9pfdaRPc8YR5WzSfstI
 YsuKgEtIhAawgPD321yQ5+EQvgchZL4=
X-Authority-Analysis: v=2.4 cv=KPpqylFo c=1 sm=1 tr=0 ts=6a9159b1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=bI6yuv9Qsz7HNVLwNVgA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: JRsC91GSbAHWtm-ENu6U3F-QPghZsP9q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA4MyBTYWx0ZWRfX3YBYlTdGGw7X
 FIdiQXK9rWbpcL2qFSaVjbJTsiBzOxZbwJ383ol/7ESlSr1TrAGe+Zs6XY4YFdl0bX5YMqDjVn3
 Ji+Tn1FGPkpeAjfyFQVxdds9pTEWi3qtDwyAifLYMwHiDJG4zbSveRXP58/AxrSCoq/PRDtWarq
 fAV4NRIdPPF0Rg+nWuxFLHq1BvwphtEQP6vA31f6tEeWhg4i14+MFr8UXCTdZE1a7Zm7+VV6vPT
 ra2DUJ/D1xTIETuwE8hcjXNApN//4IE3kG/UZEuldwom9NGerqMoJa59mTLN/D7n/8SdFWbB2Lu
 8Yk9J5xg317KztTv8kHvvqw6eAvV8S0UFDinSe66dZwLix6f+GCkkXeTJMJx80Wg1h7GFT5GXq2
 XrOpP3EVrB5GkwSFkw1PHcSGg41iGOYEscxAp4n4fOh7dWFSOPaTX7yUYRyK+799fKgoLM7RMb3
 7fWusvPmyCXU1eh0Rcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280083

Add binding document for the haptics module inside Qualcomm PMIC
PMIH0108.

Assisted-by: Claude:claude-4-8-opus
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 .../bindings/input/qcom,spmi-haptics.yaml          | 139 +++++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml b/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml
new file mode 100644
index 000000000000..ce2c9e893a0d
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml
@@ -0,0 +1,139 @@
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
+    #include <dt-bindings/spmi/spmi.h>
+
+    pmic@7 {
+        compatible = "qcom,pmih0108", "qcom,spmi-pmic";
+        reg = <0x7 SPMI_USID>;
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

