Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676F633AD8A
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658629; cv=none; b=pHY968V/hBUmiMKIQwgfBcYJHaDudQgNBrdhLYKq2MWpPK8bLv5iVCDrXOTiKYy3AR12R1E2P2PzIKDSTb9wf85DDbFOonca00Cqh+f+eC0st3052QXh9eQafDQ6F6xl8PZWTbVoVYflk/NGlFllP8CaUe19mMnFmShw7bNC3Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658629; c=relaxed/simple;
	bh=b9a5PaQwulyMEAGyhvU2MKGjOkiNZX2HfYvEScduVOc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SAXSs9MsoaDUNXM8OmFaPXqr9GkLFarof8HqSFt6lmYe1RhY6trXNSmGzHFUU1FxCeEXHz3LGZoyiaEmYdP35gZXfdHUmo1stKMMWTm+sTBDrZIH0CYGoGxw2qvtqTaitz4ecxUEv6JtpLj87NFo5haYe9rKk921iebYsYWT/1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G/S1bGuc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZbKbor4j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G/S1bGuc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZbKbor4j"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2e9l2280244
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZcUSVHAQLB4Oa1L/bcj31gQ2efZME1ZB6SptlHBUYCw=; b=G/S1bGucD1G9eFFd
	tiNX8qpo8d0VxDbmgwy212f5p3jw7+nn2/6Z06gFy7JNgNDvVArvDF2VHmta6LFx
	wHEV0u4TWqf05VdLs2CLwqi5J442E8SGXAmHBtQHCX5pu6CTcLTZvHit7MVOBU6G
	YsJKLmD7wHjM4KCVKzr90jh/oZjxNKkGIIC9VdOK/c3nmZ9Xvhg1Sjvh6Gppf4kp
	ALdaDi9wChncqRNLZNtkS+h30VKlhvOc5TWrdbdQgJMRfoquMYMluL9oavU6mbA9
	GHWblzPlYbNSFC6nTYI6C/858NwyQ75e6Gbx7JybKC6bvPKHn1Bc38Fd92krr0xV
	V84NwQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6paadne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:30:25 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso1613722a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784658625; x=1785263425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZcUSVHAQLB4Oa1L/bcj31gQ2efZME1ZB6SptlHBUYCw=;
        b=ZbKbor4jyEBd39nWJn5rMQ0RiHbH+VHa53il5m2fi+3yw/ALDDNdJSAbeyULvNSf+c
         19dB1IY7hYjFgjGHHGX/hl0o2R5mANBC8Z8Kmc6tKgMSJVYTJkZB3x8qjRWx1YvcKMrz
         4XL6ddGmuAEcG+niJh6g+jo0nVazeRCnq4nR9xdErBHAkDv9vqOtbDksDLkBjQkNJlwj
         zqNyMb831P8g4Fmu6xtl9Deqk+7Gr+/2XeYRnMp+4lOl/hj8aTKgIGVcu0SLDAPYCzPy
         KWwT0sTa4NzRWojueapdCJHwmge8g83LbWkunuNjLqKrFuhJj4LOBhkkcUCpLnwsQjGJ
         JtvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658625; x=1785263425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZcUSVHAQLB4Oa1L/bcj31gQ2efZME1ZB6SptlHBUYCw=;
        b=KSiWVPsBlAKIa1KjxpH6V69HHPMCEkf6SPaE+OnM9nI81OYeFq/Yp45rx6UD7ElusO
         K5xKrfCkqDPdz9V4dzQsLqbdrGiaN0m8xSEJedWE9Cpyj82kjM25W1I9eIzhZH/4+cWc
         i4KH7AFLpqyy//RZ6tc9+s/KDiMqZH0nkPzN3iEepC9MvwuSkXE0Mk8rDqSJmuDiLwTK
         qOBj1jfUlrwkgZK3Si0HH/xprTn/Nsdgus/zOKRY2MFd//+ey+WO1dOT5F/BMXX0HIlq
         JZSHMlAOERQdATPAtSzyWneGO0BZZuZLM/y7KP3lYYj3ChwVKuJce3HoQYLtEz80XxR0
         S4cg==
X-Forwarded-Encrypted: i=1; AHgh+RoZZuRtJ8MNEUhw0xflDE68PUxVwDr1f1OG6ehXinw2c44Qdkv5jMDhT4Gk5u9oLorDs1kABO4N/iOvt1eS@vger.kernel.org
X-Gm-Message-State: AOJu0YydJSnv2gO9BN4fcMzzB+k2w/DNSIni1jDLlK4mba+kUkwq3SOF
	FgKa3mJe4QVBZyxQKPuRDveuxHzFk3WvrTaGvof+LSoQm31686ZDm7GkzqaeQmWzgWAvLV8y+lR
	5Utn9877vQapalIrPZjQ+J8dUqbUqy2GSSULGrwtg34IIQMpO/ZSLPpNZvwNlwOOPVTk8
X-Gm-Gg: AR+sD11+T+EW2h0PBSVqJxkkHGKKrSCFchFms+BHMYzZ62ZS52a41k2Lg+bBqp/066n
	QPgj5dz+qoY1CBQEXSBqSTka7P6Auj3oXimYoLIotdiOExXAO19qngOFzi2sSZ9iiiP8iUkDir4
	GWhRs185NYlqmz2jujGNCXHEWNshoZ8iFxUfWA+8GnJwalP7s9Vn14axPbNYR64W/Le9bDgbQgJ
	krO4q7lOQ0vuTW0ahJ6NG97b2nEkwoZTmsOk6Pk81/GLpngo3QI0KC72gU3sjZ0ZY4dTRDT+V4r
	saFrY9YWdl7B5h/Cj3u5U9qvS9K/2XXWa3PSPoJYeu0KALaFKBVnnntDvOpof+eZxFmA66hTLyN
	ct6RkWx/HyPlq+mRoGYugBLEXEdORbPie0eg=
X-Received: by 2002:a05:6a21:7d06:b0:3c0:b3f7:e5c9 with SMTP id adf61e73a8af0-3c3ad8b2ee6mr21172110637.36.1784658624671;
        Tue, 21 Jul 2026 11:30:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:7d06:b0:3c0:b3f7:e5c9 with SMTP id adf61e73a8af0-3c3ad8b2ee6mr21172078637.36.1784658623979;
        Tue, 21 Jul 2026 11:30:23 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm1185298eec.30.2026.07.21.11.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:30:23 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 00:00:06 +0530
Subject: [PATCH v2 01/10] dt-bindings: hwmon: Describe Qualcomm BCL
 hardware
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom-bcl-hwmon-v2-1-febe2805e17b@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
In-Reply-To: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784658613; l=4042;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=b9a5PaQwulyMEAGyhvU2MKGjOkiNZX2HfYvEScduVOc=;
 b=QiQ0MLK5GUhNM2tIBS1ztLjCQ5D7VflfHlSxdo6Ptyg7kwhU4B/3wF22jwBQWDnV4Xogoe3TF
 EIAlnYKZD4nAI1U+VYOL6mXNnnywMwvKwWyUfuG+nEZeAwfw/eGQwdh
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-GUID: st0zCdU1w14Sutlv3sqo2F3t4b1GKyzk
X-Proofpoint-ORIG-GUID: st0zCdU1w14Sutlv3sqo2F3t4b1GKyzk
X-Authority-Analysis: v=2.4 cv=eYYNubEH c=1 sm=1 tr=0 ts=6a5fbac1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=mxz9luGGJ82e2KvUXckA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfXxSYgY1EKRUJQ
 tTKyMlQLW0fgurajzMCHnoxaXlEe24zNh09PB9hM5bOQiWDfwefU2DfBvRD5ZuObHfIa3230rAX
 0fGNFaOE0EMmSZXbJZLtuzKJ4cFxh1M0+rR5J7p16XtyT1/xNEUmPhArCP6HoyhmaOOIOsqeuwQ
 s0std1mZYKX5NE8i/nXFm5rA4AHPKf1wSGQXeasw1PLPQu1+pnWNZBT+SHj4QOPyxMFRaITYIdG
 5miTGOCIp9qOABUl2GPeW0msWwnFn7+jMkTIJ2JrqAuOdZ408HJ7hFXc2bRtGSENpOuBwP+u+fw
 MO97x87rYt/8j8+aBMVK3+NkVMmqlB2RmXe3HWDW8KMi1D4O8Cd8LNODOyAGfse4Ye18JNQoMjE
 mKDyI/YbecxsGjUGqKlOKSaX+K+EERHD1jhoMkHSyAnPLHO/0FsIqAItuQoqmWTnc/dspN56IqF
 QJOC9rQgkzgyW6jxIhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX8GmQPmL7YsQa
 DefgKT4WIpTJu2vfvvs+2zaO0fZ2ovzxJZRPJ1p/91mgXmslHcL579Lh0INjVyQEN7xnjmc9ELk
 IvsOQHAsS5Gg2QaTZF1+9SjIUidoWgM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210194

Qualcomm SPMI PMIC BCL (Battery Current Limiting) is a safety feature
that monitors battery or system voltage and current to alert system
for overcurrent or undervoltage conditions.

It provides:
- Real-time voltage and current monitoring
- Configurable thresholds per channel
- Hardware interrupts when thresholds are violated

Add a DeviceTree binding to describe the BCL on Qualcomm's PMICs.

Add sensor type to SPMI device list for BCL device.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 .../bindings/hwmon/qcom,pm7250b-bcl.yaml           | 64 ++++++++++++++++++++++
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  4 ++
 MAINTAINERS                                        |  7 +++
 3 files changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml b/Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml
new file mode 100644
index 000000000000..3c069e94a34e
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml
@@ -0,0 +1,64 @@
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
+    maxItems: 2
+
+  interrupt-names:
+    items:
+      - const: max-min
+      - const: critical
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
+                         <0x2 0x1d 0x1 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "max-min",
+                              "critical";
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 809be2756a0c..3caee21a02ad 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -190,6 +190,10 @@ patternProperties:
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
index 16b73f5825d6..1b178d3a91ad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22176,6 +22176,13 @@ S:	Maintained
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

