Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4928B4457C2
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 09:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796636; cv=none; b=KhPpCcN6wl3B3l7dzKprzTAWL7scQu0e2W6HaIQpxclFwfFu0V6WuAxWrcJtsTrWw8AblundABIr+wIKc54EV/DlBuQtSU4S1XeUIdD4z4BhQrHzfE2H1OvoHTdF7iZ7dv5cCs7sk50VjAzZPRPEHGmiSXT86GV4EqOlgdBmo9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796636; c=relaxed/simple;
	bh=ERdYVZaMlLhw3GO0KL2/q91sDPj4O9nP4Arhh2pwFYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MJb2ZBAra1FnXAQTI2MoA9UhY5I5Xu6BgR83QE7iTr2FraE3dPeNmLRpv+FsTjis8Ji7qvYq7gtMs3yOQ5J2Xgvr8rrx7fWeEPEfpNHl/zKsjOZRB/i8HlUKrcuIQxMGeDpnBdrDR2maaRy8SGMYn48syBOIAG7+0bBmSjwkcQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kUFrmwix; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EoV8XALp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kUFrmwix";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EoV8XALp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KvDM312853
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 09:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0JuEQDaDLEo
	WHQDIjRKLQvacsm/SmjN77wxLJvd2r0w=; b=kUFrmwixoEP350q3wZoXTlH4yN6
	CsXx6gKPvQ77dGgPE7RCkZlflqdCclv5HK5B+vouGMIHBYNs47/XYDN4uWzAK8h2
	6Tib8wVsVKzc4gpcbWhpWXsHzmZPIkY736lM2kc38bhk4RbRAyZLezuYlWN8idWu
	ScmBNYVk/VyfwrVRQI1fnmh6JF3ah8TdD8zzO9RwfKLUi98LKsiiGmXjbGtB9EUC
	Jo9JnvfBFsIpFPEn3vFxJAItRkNMlkBtCe7th/RtytBQnJ0wE5csIPoGeUDLq+eM
	yG/nR2bcenuSsTAWJ65fmyErZeyXvUPNSxUfYB1QgdJvGjgU9jPA3WEm6qQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7ehjntj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 09:17:12 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14fed306427so7600341c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 02:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791796632; x=1792401432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0JuEQDaDLEoWHQDIjRKLQvacsm/SmjN77wxLJvd2r0w=;
        b=EoV8XALprc89qwxA8qDBe3/k1a161DyO/nrnovCopwd6pfjxD8+KQ77qQXrUHy6Xcl
         KRb23CNYXhTIcJqDxjo5YxEQxuyx2dZfm44N+g5RyfEK78b7MMZE2ZA9j6z1c1o7Hw4Q
         /EPsi+rVNjBGo1OEksrIvhOdQPZwg4Wm4OE2mezlgjC5H5Nd6/GSPv5lcHpyvI05bv7a
         Bt5gQS0zmSiF0CDMDj8dzzxyn4Q2HLjA+GDwkDAcuyrgdhyEXPk4/BIZKRSlErVxyD7M
         7+/gO/zjpFMl4nrTY1le0yNWrgmlbNBsnRKH9R1kyPUOt2z0t0/bEM2ydVJyNU05Hzsi
         OB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796632; x=1792401432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0JuEQDaDLEoWHQDIjRKLQvacsm/SmjN77wxLJvd2r0w=;
        b=JO40mAUcnfnjukPqZztgq0utUmEPV16Ghc5u+PteY/FYTe5ojLNXQH+aKNGai1AXSY
         zbDLHvmCP0nrAtcYMPMCEsiOOy+MHpjOiHhRBnhrhNUq1odVTnnkbFqlPPQWA6vcFb+G
         lYjvdkazu5FKa1VUXlPvW2/pHBYlmgwaJkjV6EkAStPZ+H028uBna1XzutYKaGNrN/4a
         c3O0YiM6O+Bs4f+brpkGqHzLBsdOQcISWFGmCia4dyOJqEjz0nF+wJQDUGUdyxV7pSMp
         EYVX7R7Thx/RWY5owEsPU411SdkKNGwmHDltdJvWFAVYP8AU+7u9qlfobQ5GG4NhwZaZ
         4e1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxsj9m+SwoUyUeWSgIVyDFJKcN3CbWcNDkGRFo7Dwek1b8Q8VTFpDTfVd6Rr9ViRLQNC3kpvkdhwZQ6yBFS@vger.kernel.org
X-Gm-Message-State: AFq9FYJgjNRaMu7ERQxWlNTZJfuEeox8Ckc7JPH9UsxMrP7mm1OCp1wY
	rMmUQXSgvVBDf9pjTn/a8ls5axvSZTDeepxyEWJNuFwEVKaXNY2Y0q4/msl42p9kF/wlVnFrWDf
	BeLLx5xnyiAy0SV1Lf6j9k7t/NvkvNBVWY/Jt9mDSCW3XtA+vyMqxPBwmFLJ+uVdVFoaJ
X-Gm-Gg: AYBFou0UYQUSUjOHnxMq4btApNYe6wsLolZy4ce5N+R7tRwGvPS7aZKd7E9qQAnsE9c
	J2uXB6QT9y9cVrigbZrQn6swjUw5TBuZdPqChjGq8hsfZq+lQeJ7kajAXEaQ54jMccGdHsZjFxf
	SuAgnRwfaDLGe9YOb/kkowPGolSmO7cB7y+jhePV9H3bYOoTBMP6Uoe4AwCmX7e8hiSAyNjjvQZ
	ErWxuFVv/2+Ww7dnhdtrrkgHGzdIpyunf/kM8W5VSk7qC1E00w8OTN6PJ821Psnb0ThXmsecQwj
	/oJwj1tD9jLLY1mc83of4CZSq+egv1rJ/ExCfDzx/biySFHM6rO1tU6TVMN2dL+B2WAfhG3+9eI
	bwbYwalhANw8poREmoclYPgp5LLGp
X-Received: by 2002:a05:7022:b054:20b0:144:f47b:58b0 with SMTP id a92af1059eb24-16a62228bc3mr14448265c88.47.1791796631175;
        Mon, 12 Oct 2026 02:17:11 -0700 (PDT)
X-Received: by 2002:a05:7022:b054:20b0:144:f47b:58b0 with SMTP id a92af1059eb24-16a62228bc3mr14448242c88.47.1791796630577;
        Mon, 12 Oct 2026 02:17:10 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442956asm34502575c88.16.2026.10.12.02.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:17:09 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: usb: cypress,cypd4226: Add cypd6129/cypd6229 support
Date: Mon, 12 Oct 2026 14:46:57 +0530
Message-ID: <20261012091658.635441-2-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012091658.635441-1-akash.kumar@oss.qualcomm.com>
References: <20261012091658.635441-1-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzNiBTYWx0ZWRfX6SoT4knq/fxk
 uqJnqn/YTJtJqTKp0aewBO5qTMIk2ho5/HWwAfowoKj9J1FWCac7Xuur7w9WpXt2Ihn0cCMIHzv
 IzFIh/UAUBpoOnUnBupsCXX3dr7g2p6gyEhIQrwjFpY2tLyLMUKwiMe/q3UUv9U+cW8tVgLQOvN
 WEMV7tyR3Az1KPyVzLJENiub5cGMvVwPXPYBlb8y6ihkWDuw/tBx/Agw4c/lYkjdUZqzExzPaFN
 jw1c1oORlB5e715M2ucWQi/ylEbKO1/+W3mIGg56WH7Iy6vrvOPWd2DLYA44q41n+syzKEwyRkM
 EmZcowdYUT2kThoqYbGtGU6u68uS3+uNPSl5e/vlb5eSSVw6rjaOlb+PnSFZYmJJpfvmXCHWK5I
 cBO+71Ul2eYok7IYBhYY+IZ5DARvF5z6uuED5hmHp7Di9oYtoN6YzSnIGv80MhKXrtPG6PuFgtE
 fg67FGdnZEIBYbWUPBQ==
X-Proofpoint-ORIG-GUID: weKjihZmokjm2Twwwzki92QeWsnCPIA5
X-Authority-Analysis: v=2.4 cv=MpTHeGae c=1 sm=1 tr=0 ts=6acca598 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=Ikd4Dj_1AAAA:8 a=mE-VGU7V_AwKJsAmMTEA:9
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: weKjihZmokjm2Twwwzki92QeWsnCPIA5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzNiBTYWx0ZWRfX25xCEHmSe8Zx
 Abx/cSRFakZk25DSMteKNmhmTsljzNiVoiiL39QbzUgqpqyE07YXMIXRS41aC67Gu86bNG9Taen
 RXlENZtyDp66rGtRgLptfBsVVFgLN3U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120036

From: Akash Kumar <akakum@qti.qualcomm.com>

Extend the binding to cover the Cypress cypd6129 and cypd6229 dual
Type-C PD controllers, which share the same I2C-controlled interface
as the cypd4226. Also add pinctrl and wakeup-source properties, and
relax reg/interrupts constraints that only applied to cypd4226.

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 .../bindings/usb/cypress,cypd4226.yaml        | 90 +++++++++++++++++--
 1 file changed, 83 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
index 0620d82508c1..d923ef82ecfa 100644
--- a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
+++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
@@ -4,18 +4,25 @@
 $id: http://devicetree.org/schemas/usb/cypress,cypd4226.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Cypress cypd4226 Type-C Controller
+title: Cypress cypd4226/cypd6129/cypd6229 Type-C Controller
 
 maintainers:
   - Wayne Chang <waynec@nvidia.com>
+  - Akash Kumar <akash.kumar@oss.qualcomm.com>
 
 description:
-  The Cypress cypd4226 is a dual Type-C controller that is controlled
-  via an I2C interface.
+  The Cypress cypd4226 is a dual Type-C controller, and the cypd6129 and
+  cypd6229 are dual Type-C PD controllers. All are controlled via an I2C
+  interface.
 
 properties:
   compatible:
-    const: cypress,cypd4226
+    oneOf:
+      - const: cypress,cypd4226
+      - const: cypress,cypd6129
+      - items:
+          - const: cypress,cypd6229
+          - const: cypress,cypd6129
 
   '#address-cells':
     const: 1
@@ -24,11 +31,10 @@ properties:
     const: 0
 
   reg:
-    const: 0x08
+    maxItems: 1
 
   interrupts:
-    items:
-      - description: cypd4226 host interrupt
+    maxItems: 1
 
   firmware-name:
     enum:
@@ -40,6 +46,19 @@ properties:
       - "nvidia,gpu" for the NVIDIA RTX product series
       - "nvidia,jetson-agx-xavier" for the NVIDIA Jetson product series
 
+  pinctrl-0: true
+  pinctrl-1: true
+
+  pinctrl-names:
+    minItems: 1
+    items:
+      - const: default
+      - const: sleep
+
+  wakeup-source:
+    description: enable IRQ remote wakeup, see power/wakeup-source.txt
+    type: boolean
+
 patternProperties:
   '^connector@[01]$':
     $ref: /schemas/connector/usb-connector.yaml#
@@ -57,6 +76,24 @@ anyOf:
   - required:
       - connector@1
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: cypress,cypd4226
+    then:
+      properties:
+        reg:
+          const: 0x08
+        pinctrl-0: false
+        pinctrl-1: false
+        pinctrl-names: false
+        wakeup-source: false
+    else:
+      properties:
+        firmware-name: false
+
 additionalProperties: false
 
 examples:
@@ -91,3 +128,42 @@ examples:
         };
       };
     };
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        typec@40 {
+            compatible = "cypress,cypd6129";
+            reg = <0x40>;
+            interrupts-extended = <&tlmm 136 IRQ_TYPE_LEVEL_LOW>;
+            pinctrl-0 = <&usb0_intr_state>;
+            pinctrl-names = "default";
+            wakeup-source;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            connector@0 {
+                compatible = "usb-c-connector";
+                reg = <0>;
+                label = "USB-C";
+                data-role = "dual";
+                power-role = "dual";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_role_switch0>;
+                        };
+                    };
+                };
+            };
+        };
+    };
-- 
2.43.0

