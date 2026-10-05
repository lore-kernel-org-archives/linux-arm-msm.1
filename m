Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DE43DA5A0
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 12:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203097; cv=none; b=LW2tFr2zOxm9gTpsSiZDz3/RbGxW7cg7ljs0XbOAVfbMnT47uzUw2QmUtfKHCZsAgRUaJ64v/dD3KYPQzu7eNJRWRNB8LBELpnjincGbVw8tIgwxcONLa5ewCGfVrFaiC4LhUqVbramueVRQqvsCWgVIOZefawPCCQAbnkTsrnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203097; c=relaxed/simple;
	bh=QtwkwkBwsfNNVXMJ5dPU7sRgJ2TeiVGKWE1LN95tqNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lBDH9KOExQGcTlH9HPur2Gm/O+Q7UXx4H4hEB/LuRfduH+/bLgTIycAyexZe5Nf62zeCDQ1tvO4d3dMh+UkEJb92Eq0o2rdRF4mLhJ4E6o0OwO0b+nsJTkjBBUIZEJUOMXtPH4rr05CNgxOLR/ll4k7Vzp68NSomonRzkQmdt+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mbnuQEKG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CylnFecD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mbnuQEKG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CylnFecD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFPQC1068554
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 12:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YuGEM2pweJMV+k6YOtJGAYgYjV7cNiBoon0S32aRSo8=; b=mbnuQEKGLNplXagb
	gT4el+Nbx56oJEeeck9fviSbkpBt2THMjvkGXUbSDGB1UJKM8Q8A2ZBwEYaOtrWn
	oY/G4gOqve+u9TzydeekaNRQAueGbwqWPD0ItkHbJZrZ55bUbV5zXlw64e0qGaSC
	SMUEO9RNNNAYnQPN8UR6yhWguffwOge8XD/JBBLoujLo47dKzjY52VBF+M7svb+o
	Gc3MjvkQG22A/IQRbjTlF9S+VJeoeONKu33HbxC0oX33oRvagML48vGygeO50oBN
	jK0PVwN7GvtlN6Fa8qgt1zUceNn34Z5mTb7yaGMyJMYc1S8WiOv3Jz2sSy3hketh
	2HPnBw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2u08np4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 12:24:55 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-8210034ccc0so4129504a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 05:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203094; x=1791807894; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YuGEM2pweJMV+k6YOtJGAYgYjV7cNiBoon0S32aRSo8=;
        b=CylnFecD/PVDStYhaEh48aFEfYeehQIU4yIqoVcRJoH2LX04pa5XYEPKh4Ru92neHW
         yELjXX6MsvOCYNbGxAbUaWmVi+SR810UW40821xPjHLh54y/KWrXEP6yxEdJH70GJA3d
         CmdUVg6z9UKGCF7hWcT4QyXDD1f3ZAYHNlgAArWP5Od34B/TON4C/aK5KzAI3YnAG5Yv
         ssqFaYJZ9i5ryeiyjeYeXDFn9JjnnkzvLMELNKgEEWQM91qFTTt2WFE4Kzox4CxJ8YrC
         F9o5MrOkpAZPDV7OifzKw9ev0OiOFwzT2w38+Id+CzgRSLtz4IKtYtheVIP+iGB+DIQw
         TgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203094; x=1791807894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YuGEM2pweJMV+k6YOtJGAYgYjV7cNiBoon0S32aRSo8=;
        b=JweICXTnqbz3MH1qaLTDLzCKVnj+uUBwqZs5alVq64DxU4xHAjPIqQN/qRpA+Kj8mu
         JFvWv7FQtbyFW4GwM8W6ZZVKdo/AqtKKFLGpInb7wIW36mUeK9OSbESzGHRi8OBQNtcu
         QfSsHSE4cJJJ9Z6/nKQQi7nn8v3gc9srQdPccB7K1jztE9Vpfw5m10gNDd0Tc1c65P94
         ojdOpctkjGFukyCkXHzhdNp4iDOtI+SJhUWw8oK5Z8mVwNNI/kQecLOJT3D14Nvy3zdI
         tej3Ksvmbl8VaE9mJp5NJb1f4cgxUks2wyVvUi7cw3m2K1fGeQdblkt4/1KXGRNuLlMY
         YSug==
X-Forwarded-Encrypted: i=1; AKwUvByRQbUEW4MEA555hBkVMtseDxCiyi6xGLUJK4tsavlRNzLshnKUcNh5bPuNYiGuJjrou+1GlPla6LKW+SjZ@vger.kernel.org
X-Gm-Message-State: AFuF++nXmyQZN81Hy1adJRPmQxWxEsSP87Uf61jbU3B/pL7XqvbLfRPR
	R7OIPqmfxOsFYLPOU/f6ap8bQtXr+Rtv8TsQGTc6vGFSbQ4gvVD+4Y3cqHkPOK3t3WULEC56b4T
	Bh4NU2h/87Jn34Bq+LpFNHyVzwmkxYTZkSf6xhOVIrq9RaoIC8okkCMQ8Va5jvhKJeMRq
X-Gm-Gg: AYBFou2/zpUQWVSF7gjJJGhtoFhyD51aMc8a3qtClQG5r5Oue3+/ycjgoRZFva91UO+
	h83r4fYftOGLdeBawnxDXwe8Z5Fv6stjrBX9LnLVVaCUv557sqziOv4V5NxNh4N90YXfjN+P/EA
	/c/dQ7yTx/pvoWRXaDztBGHBM3SFYWFk4mJ3O9Xhgt+2j38aHDU0tUm+sGUdqhxTfrqkifcRLiU
	cRtSmRItfs5UR/03pUa/pqSvEiuMGKMYIkZHkM+M6bMtksO6RxyBCo6/qC5zJd+LlPKbqEDNz/q
	ivLxJffA8wM/tYzGP5nwgYNB9O8UYGUAX/6YQS1JNDWgkOKKFHs7lzO+CDceQ1GiVtf57yd5nXI
	4Gs8OrqRrQuHAhM8ShACeCb8Ai3yexSGZmA==
X-Received: by 2002:a05:6830:3692:b0:823:e626:2777 with SMTP id 46e09a7af769-823fd10c66bmr6973094a34.16.1791203094364;
        Mon, 05 Oct 2026 05:24:54 -0700 (PDT)
X-Received: by 2002:a05:6830:3692:b0:823:e626:2777 with SMTP id 46e09a7af769-823fd10c66bmr6973071a34.16.1791203093822;
        Mon, 05 Oct 2026 05:24:53 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82273e27adesm10896314a34.0.2026.10.05.05.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:24:53 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:54:02 +0530
Subject: [PATCH v4 01/12] dt-bindings: hwmon: Describe Qualcomm BCL
 hardware
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-qcom-bcl-hwmon-v4-1-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791203081; l=4232;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=QtwkwkBwsfNNVXMJ5dPU7sRgJ2TeiVGKWE1LN95tqNk=;
 b=0yKEsOagPEiCvCIQ+6KDZizFwxL/rALw2El4aEUY9Z8r6Gsnk1LZZmSnFQWmdT+/nASRPIUgW
 qgTDxQK+j5cChTWQYbJvpr6qLbJ2tpK0nqEtutmNBKRMRsJDvSw1xRm
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: 5qlLkovUqHxRytdh8EO--nk5_BQcTGI2
X-Proofpoint-GUID: 5qlLkovUqHxRytdh8EO--nk5_BQcTGI2
X-Authority-Analysis: v=2.4 cv=JqlkP84C c=1 sm=1 tr=0 ts=6ac39717 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=fehuZy28kGTF_x16HkYA:9
 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX2gYU8lBbCF8D
 vE5yPLHwSR1XbondQZhgoooORmm6XWliaDA8NqtdRHkpA8P5Be8lLzn2rkq2NRxtAx6icG5GXuM
 kb9pvmNv9+vfc1jOJn/Mj5wrm1+vKtc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX13JCQul09por
 rv6Ldq4eoqr92/pOJmpP7no/J0rhhmK0kqmFR79XPRsx8hXpeenAUF0Y9L9Xb3+2Dv5yZvTu0iL
 4B/d1auSZbIL88kJw/D8CpRTD1EIz3qNWx6Ld2CMJw9L92c1/19jGt+plPaDuV0M9Cn+B/lBeDm
 MDJjWIlAe6GP0mOYsh9HkV3ZE/y2AgvutvnWkYwoQpfpYNJzxh3+DCU5ZjAfhgKFy/jw63a3cA3
 rfVFe1AlDQNLHHDjPI5YBfO4u07nEG19SXQzZH+hIMIOC30wRge6lyKnpygBylcj9+9RiFUCIqJ
 vectqvu9MRlE2fKlLra/JD/lbEZoxbRN7WPpppupVI7ay2dm7SxWt/sgAYNa+aa07vJvvq1iTSQ
 du18/LbxxHukIDcFlN3l8QxbGNy2GGc4z+zVWUkoNd01nxwAR1TdDDc73vGhOx1fRvq3z9hStPP
 TMAtUDrOpkP5S2H8I7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

Qualcomm SPMI PMIC BCL (Battery Current Limiting) is a safety feature
that monitors battery or system voltage and current to alert system
for overcurrent or undervoltage conditions.

It provides:
- Real-time voltage and current monitoring
- Configurable thresholds per channel
- Hardware interrupts when thresholds are violated

Add a devicetree binding to describe the BCL on Qualcomm's PMICs.

Add sensor type to SPMI device list for BCL device.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 .../bindings/hwmon/qcom,pm7250b-bcl.yaml           | 69 ++++++++++++++++++++++
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  4 ++
 MAINTAINERS                                        |  7 +++
 3 files changed, 80 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml b/Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml
new file mode 100644
index 000000000000..a9e3525cf099
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/qcom,pm7250b-bcl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SPMI PMIC Battery Current Limiting (BCL) Hardware Monitor
+
+maintainers:
+  - Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
+
+description:
+  SPMI PMIC Battery Current Limiting (BCL) hardware provides monitoring and
+  alarm functionality for battery overcurrent and battery or system under
+  voltage conditions. It monitors battery voltage and current, and
+  can trigger interrupts when configurable thresholds are exceeded.
+
+properties:
+  compatible:
+    enum:
+      - qcom,pm7250b-bcl
+      - qcom,pm7550-bcl
+      - qcom,pm7550ba-bcl
+      - qcom,pm8350c-bcl
+      - qcom,pm8550-bcl
+      - qcom,pmh0101-bcl
+      - qcom,pmih0108-bcl
+      - qcom,smb2360-bcl
+      - qcom,smb2370-bcl
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: max-min
+      - const: critical
+      - const: emergency
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
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
+        sensor@1d00 {
+            compatible = "qcom,pm7250b-bcl";
+            reg = <0x1d00>;
+            interrupts = <0x2 0x1d 0x0 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x1d 0x1 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x1d 0x2 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "max-min",
+                              "critical",
+                              "emergency";
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index f6534e9e9912..48dc437b3889 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -195,6 +195,10 @@ patternProperties:
     type: object
     $ref: /schemas/rtc/qcom-pm8xxx-rtc.yaml#
 
+  "^sensor@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/hwmon/qcom,pm7250b-bcl.yaml#
+
   "^temp-alarm@[0-9a-f]+$":
     type: object
     $ref: /schemas/thermal/qcom,spmi-temp-alarm.yaml#
diff --git a/MAINTAINERS b/MAINTAINERS
index 1c02b919d6ae..7cc16f7ccd66 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22657,6 +22657,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
 F:	drivers/net/wwan/qcom_bam_dmux.c
 
+QUALCOMM BCL HARDWARE MONITOR DRIVER
+M:	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
+L:	linux-hwmon@vger.kernel.org
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml
+
 QUALCOMM BLUETOOTH DRIVER
 M:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-arm-msm@vger.kernel.org

-- 
2.43.0

