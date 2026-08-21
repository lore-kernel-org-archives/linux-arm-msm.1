Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D26E4749D6
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 10:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787308034; cv=none; b=N6py3izGhBZRT6Jc+kchDsNHVK6pw3rm50d5K/Mkivl7KxLO6qptfDw6ULQJU7oYE2e//zn1WkLTwvxJBLLO5FfMRMgGTkNW2jCY0eJRtU1sBe3St/KDInT+PZB+9w2JgLNIxEUKAR7/MDLGxbtdC6nrGMuz8F6dvGYM5mukbOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787308034; c=relaxed/simple;
	bh=9sOfcg28QkOFOvCTYpXJ733Ga75K89IqVNNSN8MNEFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NUOKc4dhP0YJLZakift5taCww3uWtU7LAXWlvW+vVkY6MkM/Z5HGMflcTstqSiClZUtphauAS4TqrENLUxug0CuoH27NgMaLe+gYUASLp4bhz5EhdR8wewmFjAc02QNiN8gJG6jWAUQw7dFjiXt5z/O39tIUIlfKuu4R/6+HxB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ygpnmgn7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YtedzdYK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ygpnmgn7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YtedzdYK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9LrPk1025286
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 10:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uP4c33QNsfPEt0lMrWrRe3zqDPCg1mMScbrZjF/2NlA=; b=Ygpnmgn7jdVy7IDL
	1vMHLQtZSeqHQgPmyV9qxKRHgI2Le0hMYowdfO2bnrf5Pyo+qGu7ZDXs/5ZDVEvN
	1ERsSgUZCJR4BTBxcUg6jqg3blbhH4Ywnme4H4sB+pCHEpyrXtyIvUQsBBOBYcjn
	ZCuMLCRr7QI9LQkM6S/2pPefF5jqKlwAK0wzs0gYBcQq1V8qHBh4fnBEKA1/qVfR
	ptj80UL2DbHD8UBorEPSDcVRW3hYU1Jr/QIUKNfns2KP9MYGXcq0YOGGJWdPF7Jf
	4Zre3ADBQDPz7w14YfaosimNgBrdY/03OQO82xps6oPtLDv821UHlrNBUZFg+6fc
	neW0vA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gde9299-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 10:27:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so12691245ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 03:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787308024; x=1787912824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uP4c33QNsfPEt0lMrWrRe3zqDPCg1mMScbrZjF/2NlA=;
        b=YtedzdYK2GjVi0DntG/uXgzWh+P5SzWp5zSZ/6Tx/CTP0zOvAnJL45Lur6WHXyoJvn
         wrEZTUfmrQhRRxpUbRF03HKBUQkwbZNDn604OyTRGeGF4k0TcQjG0nJBA3CvMagrHyBW
         Lw7itLibKO84cyOmRT1Uj0h9k+7DcypQ0m3JFRL8Yy2yRzf/o2lV9mwcRjEN5YB3bEV/
         J7quc9O52Ha+hSNsBGwlPL2hoP6ZFw6qwg6j1wz59KtS6sQnlQ0289kPKXRyPA6KH+9s
         9u+/Y39+/PszJ7vjexodMZBMeatlQ3xsGUqhJ7ZTH/YAAh/tynKvrG8ayOGuAQ1bpot+
         tkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787308024; x=1787912824;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uP4c33QNsfPEt0lMrWrRe3zqDPCg1mMScbrZjF/2NlA=;
        b=RrMvGE2fH/4Aff4umHi+PcHWSadWYncE+KoyUgxnU+NmDJoZGAnQMTP/ec+N7du5c4
         PMO5fIYSvNUPs/YgiCkBU9HRL73YgW6k0BHQSVVguUCr5qydYIOyy/9cMi/GvHQgSs8a
         iXXQGDspRZTezmTUn9prThqm/u43lj5MFreZqxotfz8/5F0jcN647psrveP54kP1NYWe
         ZjVHXDAl3RDCISu+4ezMwGpuHDG5gGEdgymZp24EIJooBHutf4biVz2DqXfAqWGuZILC
         jDhrjDIfBwDg71NRolfTLb42F8AIBu/OyJDh0LOOnVpsJI4K2WV8s9GWxEabtUNqIR+l
         Hj6Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr/TajwZ08bjk2zSJlTNAz3YU2khrWTmWTunWTP1bYzvaBdv7n6y7pOQ5yJuQkBz1iqdIz9TUEdLPprvJ7X@vger.kernel.org
X-Gm-Message-State: AFuF++lgst1FCgLju0kmD3HmhNivHthwktjKu6Hci4ovf8Ff/v3XcahM
	aJrSoUkcpMP4MT6t3wFEIDM91KPTNzgEIz7uQF3EdNJT4qLk0vOMkn8VzymcMAW9krsl6iTwQ9I
	sjp8IMrAZSfUK59JXOP7A88BxuRHvTfeDgq23oFjGgR8G0X7kWqURt1s21ewETGjfJsL6
X-Gm-Gg: AR+sD12S9GYAUqCJ1PBxapPsDIJllmyRiGuqetvT6HgDdvIdbZx90Z13emSD4C/uePS
	NbNXR4jwI9xlpnTlRr90UT7n3UrbK+mt6lupglSocvahpRyO0zZ88cBnUWnNDuH+KmoSmic1Qxl
	OP5mRrVRZLvg+5oqYtJtUWRs+bfLeL/bbF1gIKjKf0C50XQ+PRqACkl6SSavbMR5/sax8dZg3PI
	DfPSS9Vra1PWr6sBgCjtZRAFQyvx6tLZhLefQ0yGO7HqxuliMQ3IKebJx9iFsfArxwklRvUJptk
	cBtDiCEdUnhIQiGuM72nEaxM4goqEPUJM0ZpfEo+LsRxRAZXjchH6jAl5NyQk3OhecsBZ0quuhK
	66USan5ubNsVns9mDdOqKZaJz90FA
X-Received: by 2002:a17:903:1aac:b0:2cf:af20:4254 with SMTP id d9443c01a7336-2d61a15e594mr172265225ad.10.1787308023903;
        Fri, 21 Aug 2026 03:27:03 -0700 (PDT)
X-Received: by 2002:a17:903:1aac:b0:2cf:af20:4254 with SMTP id d9443c01a7336-2d61a15e594mr172264415ad.10.1787308023447;
        Fri, 21 Aug 2026 03:27:03 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf15ff5dsm25859682eec.25.2026.08.21.03.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 03:27:02 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: usb: Add Cypress cypd6129/cypd6229 Type-C controller
Date: Fri, 21 Aug 2026 15:56:50 +0530
Message-ID: <20260821-shikra-usb-dt-v7-apply-v2-1-030647f06285@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821-shikra-usb-dt-v7-apply-v2-0-030647f06285@oss.qualcomm.com>
References: <20260820145036.2035641-1-akash.kumar@oss.qualcomm.com>
 <20260821-shikra-usb-dt-v7-apply-v2-0-030647f06285@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BcroFLt2 c=1 sm=1 tr=0 ts=6a8827f8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=PyXS-OjWu00qIW_W-2gA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: huT5dEKOs7uBxTNuAaGbOBn-4m2wdGQP
X-Proofpoint-ORIG-GUID: huT5dEKOs7uBxTNuAaGbOBn-4m2wdGQP
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA3OCBTYWx0ZWRfX8qMv6uBgTh3V
 yejIfM0RvdNXGuE7XXSAY7AxE04LTX+aR2ggrVzjv3Odo+grK/R3JqlbIxsx45og4A6t6GlSU8U
 agmvMuj57Ijhc3qiObBBlwMZYbJcD2A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA3OCBTYWx0ZWRfX+W6nycxa2Iz5
 rIy8YR9hn8HbbqNwsbfNuXM6ymSQdJGzBuxgLvy8XLvyime6XtP7M6ILNohWzPT5Uq6XkR0R8eY
 qb80f2KUH+7L2ZK/xZmJEkXrMJBXREYJAKR0nG6K7ze7zHqSOlixbBTD62r5LpiUNq8Z8m4j0qZ
 ioTkWyUjhO1R9Ho5KtzI8ITYaoPA3t9oeaJMGjktUcXOPvKbXv5B2WCvD7nYDqaKOGf9hIBU+YZ
 J3/b5LiVw/y4zGSZUUlWAivxSNYUyu5NbDGb+PR9ST+rUVwWhT2MWsHUmDyso0z4265eOuMGQKC
 RpwlyQajDux7IdwUCG50ZIh0KR3eI23ZQQZ6UDx/0TR8MGfQ+tiqGqAdLcuMHRYlJlkMeO+aLRi
 I1AbCPoTalGMpU0XRuxsLkGoC2viAzQZ2cYBVriL3+WoqeGDl+oQOVMHtQd1Yc7+ztzsnk4wV6V
 J4xB+0gI0WJO+zZ0+tw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210078

Add the device-tree binding documentation for the Cypress cypd6129
and cypd6229 dual Type-C PD controllers. These are used on Shikra
CQM/CQS/IQS platforms to handle usb-role-switch for the USB Type-C
ports over an I2C interface, similarly to the existing cypd4226
binding.

cypd6229 is a variant of cypd6129 and is described with a
"cypress,cypd6129" fallback compatible string.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 .../devicetree/bindings/usb/cypress,cypd6129.yaml  | 107 +++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd6129.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd6129.yaml
new file mode 100644
index 000000000000..43e2c1902fd1
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/cypress,cypd6129.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/cypress,cypd6129.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cypress cypd6129/cypd6229 Type-C Controller
+
+maintainers:
+  - Akash Kumar <akash.kumar@oss.qualcomm.com>
+
+description:
+  The Cypress cypd6129 and cypd6229 are dual Type-C PD controllers that are
+  controlled via an I2C interface.
+
+properties:
+  compatible:
+    oneOf:
+      - const: cypress,cypd6129
+      - items:
+          - const: cypress,cypd6229
+          - const: cypress,cypd6129
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
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
+patternProperties:
+  '^connector@[01]$':
+    $ref: /schemas/connector/usb-connector.yaml#
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+anyOf:
+  - required:
+      - connector@0
+  - required:
+      - connector@1
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      typec@40 {
+        compatible = "cypress,cypd6129";
+        reg = <0x40>;
+        interrupts-extended = <&tlmm 136 IRQ_TYPE_LEVEL_LOW>;
+        pinctrl-0 = <&usb0_intr_state>;
+        pinctrl-names = "default";
+        wakeup-source;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        connector@0 {
+          compatible = "usb-c-connector";
+          reg = <0>;
+          label = "USB-C";
+          data-role = "dual";
+          power-role = "dual";
+
+          ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+              reg = <0>;
+
+              endpoint {
+                remote-endpoint = <&usb_role_switch0>;
+              };
+            };
+          };
+        };
+      };
+    };

-- 
2.43.0
