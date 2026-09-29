Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F043A51A14F
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687395; cv=none; b=PV00aug6ZnKqL8wMEZsjVE9ZaLFHKx7+2CyutKi8/9WDvSVSiGrpSiHcRkXLmm6EwCfie6NzYOJO+65nsR2weHp170uHrqpsLAwVflpQd81VvGRGp4VDeXgOTny/78eh/meUcH8CV3eEX7Zp9jcdspheE2O/Xz8RMUqhviHdUbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687395; c=relaxed/simple;
	bh=QtwkwkBwsfNNVXMJ5dPU7sRgJ2TeiVGKWE1LN95tqNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lfTJOIjQK2kJv9Tty143P7Zx0cRRs5xUvM2KBBJGRYvzi2fhnSlyIvspHCr6cpVwIJl5l6E7/xozREjzSSYOEjtMThkFTrZRka/32zCnCoPKql3YOyrOMUsT1aWCKU7BRT8icPmLpaiIb/ipyWc4eYzPFOYy0/yU3US1qZKkjqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BEw85bs+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ivxy9/YE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BEw85bs+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ivxy9/YE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqlQ11577625
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YuGEM2pweJMV+k6YOtJGAYgYjV7cNiBoon0S32aRSo8=; b=BEw85bs+KG1Isalh
	t1d1/n4SD8gCQy8hnkey3OEa1vYD+IfG2QYsWFwgumwmPhirXRDztPLxrApn1wn0
	3i4Ns+TPxOa7uWELw77QMKbg0KsXU1xlZoF54YPLm/mvTi5PVDsrvNWEzTu5hrgI
	rrPOWJdH0Wq8bOxYBwdnlk8QX1YeOIWV36Rmus4lWV8YCcAbfzPv736o6hkmvXAZ
	Kd1uF7WLUGCPWw+PirbL8qPv3TQ9OBVwmrIATDjuqsLVKdcN4R16u1wsLzkTeVOT
	TXW7cFDoEiKgIHMRtzhAbuYbQklTjYkTZJivVZ/hnInJba6F1S6n7qjr9jHduonv
	G52Eww==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h09x4s4f1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:09:53 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-914551bae8eso28502566d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 06:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687392; x=1791292192; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YuGEM2pweJMV+k6YOtJGAYgYjV7cNiBoon0S32aRSo8=;
        b=Ivxy9/YEWT/J5bkdzrvh0uL4UoUViFhsrf7/klsAqTdGzTXnnMQ6f8fSroxOhEcpgQ
         RP04zmqgwFSSg1qW/adFuZqwm70mvf7Z5Sjj2MPRbiUlHHk6/EIrR56lPXNNAIHPoU04
         /KILjLDDxuTfY6/qZ5wqCdfBkD9cnYOBFwycSOERkS4CHmspAOXWsiufMy9cElw6OwwU
         4zEEZHobWNLs8WMw4WoPeWJsd71+IoHgmI1XhQCX3Gb+PijJiUQ6bosN8YpPB8z9l9QD
         Sij+32HAlru8JDtvJpkuGQDmiBZQCHqk5W4FKrXP81GaU3f3t8+BaQriVIwrwmVXmwfH
         Wlng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687392; x=1791292192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YuGEM2pweJMV+k6YOtJGAYgYjV7cNiBoon0S32aRSo8=;
        b=k3wr7xfYTrn7Yuk3tgoSVDK/krSMSosGXh9DmLlcEwHF28yE7p2zHw73oxNgcO/CYW
         qQ8owOMXHOzYZcGVG69va3PsgQWbpzIXf9YvHCEDGC8bWv/3t7n0lab2/K886f+Hr40l
         GsUQNTCFz55WBwfJhmws6qJAUu4hH2eW153RrUGF6wSxp1MNYatjG4ZOqADV1eVJSbXt
         ZOSbeHrBZakqo3kBAJrOjtzh5lfa8Agd6zF8NoXLsoipxFm5BmSZGuj3d7+fNeoN6nRE
         xKdbtSW2UKRGmOQvOo9zesuZrE7Xz1oMEAnTRh3a6u4/tcrutd/eZ7vAiayliGr9sDZN
         0/4Q==
X-Forwarded-Encrypted: i=1; AKwUvByn+hVXMS16Mre9Ylc/S9Vn1quXnOIQtVuihoRfYAQBytuNjCEMOvHrQ2d7sWofn0Hy3f/2KC2tlfisYKi8@vger.kernel.org
X-Gm-Message-State: AFuF++nHB2Etsmpt8QWFBlRHEI/H73bmV+IhjjgOGvBtCywbxDs/e4B2
	KL+YYiB6b75QgNG2hxQTbWETBsRN1gpaV5RvG72Xd+RpH002rWQuMiHUVfMD/Tyix0dr3AdaAt9
	QLwB3a3cGMX8KxokDFhHsD+CkWy7X75zmQkhcMRkqbG9CIxXC5w81ODIf6ZKl8Lxf0B1t
X-Gm-Gg: AYBFou1YybUe7mZhLajr5L2zawxruYFbxD0LhoAN0EMLT7Dd9MRynzZnrRtP+PFd4SA
	28SCgdlExIndgHyOv43KYGR005rRDfdFfc1ICPfH6HF8oHz8SaKJ+71vnHNqJN779Q/i/a6mGKk
	eweVzU7bvlqOxLL7tHQA7TcCj4/mcIN5kprObBdDtpGG8Isoz4VvsMy+2pnTkfcBmaodQVv42Zi
	wpoe2phr8Mosn/M7hbDwbT9BaY1oQR3WLgquPKIUs/2cs2k+sT5VepcpR+GFD6qWp2v6Qg7jPUl
	l31DcPr0H8Fqu7I0tJU8IpT19Zu7eICwLdGjbqEP57HYIcLglkYcYPO1ZRhm3Wc5b6eHQQHpmLu
	26YhVWPItOa/0khtKO6qdiqVf93Tgo8KJWaw=
X-Received: by 2002:ad4:5f8e:0:b0:914:43b1:d4e8 with SMTP id 6a1803df08f44-914482574ffmr188849286d6.10.1790687391930;
        Tue, 29 Sep 2026 06:09:51 -0700 (PDT)
X-Received: by 2002:ad4:5f8e:0:b0:914:43b1:d4e8 with SMTP id 6a1803df08f44-914482574ffmr188848326d6.10.1790687391047;
        Tue, 29 Sep 2026 06:09:51 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:09:50 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:33 +0530
Subject: [PATCH v3 01/12] dt-bindings: hwmon: Describe Qualcomm BCL
 hardware
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-1-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=4232;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=QtwkwkBwsfNNVXMJ5dPU7sRgJ2TeiVGKWE1LN95tqNk=;
 b=brzRaFooGdY1AEfjdIk4VK0wyoloSQQm8UmTUeWJ2N69TZZj0UtvAZagT3QB0Cn7SpHEVTffW
 //bQd+CYFXbBAmm8+3wmJCaRDDWk959jeJ0FBJyRFTte8/ftVC0wJ4C
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfXwwjQKZ2IVqA5
 zFegQCaT1Gy2yVu4j6C89V/NyYnssk7SoNBl5xF2DQ34+T7TFthyjhK+TLJS8Ljtxngq8Y1+7M2
 YAqTOgchHzoA3jQMtTc1ChMOrGUM67Y=
X-Proofpoint-GUID: 5dfxYBL7VucABhxxY2OatG3K-Xy0tCQz
X-Authority-Analysis: v=2.4 cv=I5Hw19gg c=1 sm=1 tr=0 ts=6abbb8a1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=fehuZy28kGTF_x16HkYA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 5dfxYBL7VucABhxxY2OatG3K-Xy0tCQz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX8LEKUVXqfqlY
 LaW0H+oF83QLGL3OWBy/dB/2p2NcoLsFaEB0kJzXcrzY2KRYB85Z8kPihEidUk8f/qZ3ZoRW+9I
 0Pux5SflSpStoe79jJcQUJzKTvH+tbpndrEBlIa3rUuDE/2KF0WsfRYOYtNURpacyuxniythsAf
 +Knh7A5PmORzVPC9dyiDUNz2V6k8lEefRlTEMgQCsMRlConTg/Jhz0Y6xI7LltndOQ2/YWoO1Sg
 GF6IPkJ8SGT/24gvgdD5+oiB1LD3JxJuzWbYxm5I2CDddysrNsUHYG5jueKyI9SsPVnt4DKkdA6
 3eOtqerTPsAD7StjelMXgbFEkdD22GKHiCQChM8ahUot1Q0vugtlvFS3Koo5sR1i//HgGxdu4IO
 z/n8M4gdlaKYmYmF66/dbWb5K+sH6/YmLq3baanUEKr0spHbIQWIDZL8OaAlviByBE8fI1ZQQSH
 dEVlTpHGKPaLPSNiMlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

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

