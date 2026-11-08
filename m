Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794143934;
	b=NilDYILn7Ik8XyY9dMIh7MIezcPrxmjVv5HkImTbijbZM/ci2fmoyDF/CIwkqns3njX7
	 kHnDCmgVYkEVuv3wkb0OjWPFeyeLbY4egBP8MhT/6pagMcR3pvoW0pKDKCZEGHYWOsVW3
	 1WB0Yl+/qYkutD8tFXXPt9JUgZyLrD2e5Nwt0qo4zEXak4DCxoPcv9s8j40NwTbMxxtod
	 mi5zjoeViLBSpoqA9UfTdCN8BiEreLN00n1L71ChWGWqotwrFAAMeUjAh/kyVcdftkvRg
	 cEICdPXwyHOloCmcf0hSFBN0BxxHghT8ZLEixbNjxcfEwy3id0NVCJAsmbIERk0D7rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794143934;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Fqo4nrGyAnBaLf6Z27KaPtJVcMK19bg0Ax5ABM4JHOk=;
	b=ysjEDZfeXOk/vKkJEAmf2FZGGuI2/XSwhl2mcr7aLvOhUI4Ay7lR/qR58OoTJcI3trrY
	 OWC5W66UWGDfC5WIijp539NnoYmgYfGrXOjua2ZTRHu1+KKoviToNdNKxl77O5Zj6a/Xl
	 dpYjGDdwPkBxAKqjc0TamKk9QiIsrXAwRMBEWPeAtuv4GnL+Wm6HbB1S3PYYMOp4/Q3xh
	 BE1xk04qf2GTwsjpjjyfhX5r4umwMEMbXd7ZWlks9HrTRzk9gGfePDEyMffKYBiKnhki5
	 OR3cunp+ysX+4ULJKaDsEvQAsIyJUTPUexkbcoIxQd+LrRkv+GfqM8mliNDAUCfuw7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QjpIq5Fq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T20O1Q4X;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D4C606A33C
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Nov 2026 13:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89D4C606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QjpIq5Fq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T20O1Q4X
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8AfpA22282956
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Nov 2026 13:18:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fqo4nrGyAnBaLf6Z27KaPtJVcMK19bg0Ax5ABM4JHOk=; b=QjpIq5Fq09/ZOwsS
	zp4uRdZudwfM1GBDxURkl4ClOx4GfO6VpBH88Lgs8mGpDnD0xJzrFFS/iOrSYu51
	/buocqrqZYo3Ya+tuGswXyiDoFLDGRWzjTn0LCsacqGt6CSSuDKph83HFEa0bLq3
	BHEEkAxrXL0XOKJanxY5AThCHYXxtu9kBiyvOSy0ix3z2ThBSRLgCZj9agY5YEta
	9QHp77zn43W8O47Kq4izQndnNb54WCMVB5h806QoRbimyCgmyPRFluvKWF3hFIxL
	osKUl27//iSt4rzDmleqLu8135Jdvz2NRsDQ3eXxxXaCcj5xjSrOMBXaErj/PYG4
	KGrtJA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hstxsb3w3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 13:18:52 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b238436265so20388c88.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 05:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794143932; x=1794748732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fqo4nrGyAnBaLf6Z27KaPtJVcMK19bg0Ax5ABM4JHOk=;
        b=T20O1Q4Xgv1S/6LUq1uPJSgIAO3a3s0vkM7Ha3yid84FkJWYCsdfRnjWGoyB9vTAac
         cmu96wDRsY6/5F9vK22ee+Oh0uLWxhbfxfbEoHINwvz0WLc3kTSoCeTTmIkCktGlivXa
         kjbCS9II2uEA1230aKS2nv8riVnhnfuHNlJPCOKdmmlDEesjnDoe9RDjiYgZHfo0vJEX
         dFs8TCNm+OGEHczj1esmr+aQ/jyHB/scpyzcpMDL3fo2pTFBGfG45i2UHioddWD7HUIW
         uV2La2yE1mQk2bEa+2YZ5aKx49/eC/zIxTJAVoEx4R3vgzFd2/HPmSf5Y0FJMyhS9pzA
         jXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794143932; x=1794748732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fqo4nrGyAnBaLf6Z27KaPtJVcMK19bg0Ax5ABM4JHOk=;
        b=IEDWvGFEXN24cwDmVLCP2BJF9BlrXlrylWy+bqEt6LyNYEhpHY/Y/tZ7U6+ht5cskf
         XO5Ktb4SrfrrZTfXSu5L4jtw5jOuZK6LoTisWPxNiYjrtgvGMDX9Arx7HCCcf/3g5mij
         PdvNEbRzeLFiGgUDMw/9A491AHvpnFWIYl72QiA8B/QKqNPCGJ3m5cCtOvbh2stl5a+W
         kU9sAUxRFMvz/kmvkoYQ3BdF4sHVZ/+HHj20Ue4vKznKTdYF0Qq5vH/1EQhpcu+9DyaC
         BQmMFMzS1lJY9KpHflx6zuF7ckT7W9gAagNX6lgz/izaNxeOc+JGuvqvb7PtRaqarz8F
         TdGA==
X-Forwarded-Encrypted: i=1; AL+hErEbcO0UkPJoZupShRBHDyCNpx+L6RygxfwQYNsMHZNxG92D3ixUYkEdA5HB2So1r7Z+PiBlG9r5jtYx60zM@vger.kernel.org
X-Gm-Message-State: APuU4Z9Di9Y9YSwA2av7BayBMEmaqAGtVRCB4fTdqWxLSkrie5T/x0u5
	8t+cBNfPEdUlmCA8N7PLHqcvoywwu1uSOAcmkNdBmAcfv6tCxEtIHCj3DEX2i9Q1Tbyl5RWLfXk
	bVFD9z+a77PsL3VWmve7aFyk5+A7tEDKoa0BtJ/JqSumsX/KQASPz5xIXDy1CgytpJ72+
X-Gm-Gg: AYBFou18ox7KoPYmtpTx4y1m25XKDKn7ucISqBVGZoT2CBiZIdsp4kpvRUdaDo4QWJC
	KDXb+f8pvC+T3ZVfyTdjymHMtgdwiwEj40XlVjVWVFWLWn9IcHxfFnjCkDfp3xmX2oHhV2eufec
	bCzXdvn4Pjr6WaaXtMv1QZdNkSVJcSbeiYFckpKkXnBwuf8mndozNcJRJu8C0tvfD4jmlDAZ6/n
	wTjcIdTnqhcbKlQCxoRFzhgIekiPA84CqdnphuI7aPL8lMIpjOvBEz3IiBa8sSt88jedv795hzB
	svdMf0PcpKklxNm+wpec7VqYEq4nygVOp/xh035uDCvbgNZZiGtlosFsuwo/k5mYUjc3YndSEFa
	7wIBp1LEFJAvfffubWTtpNQF/Ps3N97LbCUltyRWIktUHJbAl/N8ykVHdu0lC2MXM61nvy7vJmD
	sXfUE=
X-Received: by 2002:a05:701b:2802:b0:1b2:46ca:242e with SMTP id a92af1059eb24-1b39fecac22mr2104855c88.14.1794143932140;
        Sun, 08 Nov 2026 05:18:52 -0800 (PST)
X-Received: by 2002:a05:701b:2802:b0:1b2:46ca:242e with SMTP id a92af1059eb24-1b39fecac22mr2104817c88.14.1794143931442;
        Sun, 08 Nov 2026 05:18:51 -0800 (PST)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm5336980c88.13.2026.11.08.05.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:18:51 -0800 (PST)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 18:48:24 +0530
Subject: [PATCH v2 03/10] dt-bindings: ptp: Document TSCSS hardware on
 Qualcomm Nord and Shikra SoCs
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
Message-Id: <20261108-tscss-v2-3-d5f575010427@oss.qualcomm.com>
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
In-Reply-To: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: n7qEZHvpSd_qWhORtFeH3xKadKaiqbvM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX8GdxA0/4Ivp1
 ZQhvYH1ok6hG7A2OTOwB0VCWirpkoI+l/GGNFmYBqoerEjH5vWOekf96Dmb5PvbrnTrEuqt62eX
 oTsV9p6rPfH9sBQKg6zKHbOXv/+ldDg=
X-Authority-Analysis: v=2.4 cv=dZMVTnXe c=1 sm=1 tr=0 ts=6af076bc cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=nKCL-24MKaImGustjYoA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX2fG9Mwdxe998
 bxfSDuCv5EPtBfjWQXB+SJ7isZR9rVToCBTKTTKhxgz37rP0Y9JC+sYEBp/qX0HYBxWdTAySwO0
 Rb0zWKS8mRCCO45caSwxKv4YlJbg/1t5wIKOckEQVHSj9lVQMLnT6cyOWzBrrUBYu3a1XmPBpFk
 M4vkiDWIk+vmj+ilIMld8BkSEJ0w0Hk6PeJkVh0okb/ozS1uV+tTFLWnEKrJ9U/QSXEYPnHza0g
 8IZAR4EBQacjA8WkJDOMjfQIuSIb6sUD56/JoArCAbEJiD8I+7j30cUV9xjB1e18owhcoX5Cf9K
 mGkv38F1DPCptmOom9wcBWWFqwT7i0xplEO29pChsjs1IXBreS/nJciIAphKR96ck5BEtAhwAUb
 KeNq+C7hlidGgz8tXefPRyLC3azIJYd4KaSljZ5VSmPCmtGSuPPJ1GYB8Viks2eDoy3K2FIa9J9
 xHcDZpCwPdQdLV1qr9w==
X-Proofpoint-GUID: n7qEZHvpSd_qWhORtFeH3xKadKaiqbvM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080052

Add Devicetree bindings for the Timestamp Counter Subsystem (TSCSS) found
on Qualcomm Nord and Shikra SoCs.

TSCSS is a time synchronization subsystem composed of two main blocks:
Timestamp Counter (TSC) and Event Timestamp Unit (ETU). The TSC block
provides a continuously running counter used for timekeeping, while the
ETU captures timestamps for external hardware event triggers.

Nord additionally has a timer register region used to generate a
periodic pulse in sync with the TSC counter.

Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/ptp/qcom,nord-tscss.yaml   | 186 +++++++++++++++++++++
 1 file changed, 186 insertions(+)

diff --git a/Documentation/devicetree/bindings/ptp/qcom,nord-tscss.yaml b/Documentation/devicetree/bindings/ptp/qcom,nord-tscss.yaml
new file mode 100644
index 000000000000..9d49e66a35c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/ptp/qcom,nord-tscss.yaml
@@ -0,0 +1,186 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ptp/qcom,nord-tscss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Timestamp Counter Subsystem (TSCSS) on Qualcomm Nord and Shikra
+
+maintainers:
+  - Imran Shaik <imran.shaik@oss.qualcomm.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm TSCSS is a time synchronization subsystem composed of two main
+  blocks - the Timestamp Counter (TSC) and the Event Timestamp Unit (ETU).
+
+  The TSC block is a timestamp generator that maintains a running counter used
+  for system timekeeping, and is functional with just the AHB and counter
+  clocks.
+  The ETU block captures TSC timestamps for external hardware events. Each
+  ETU slice binds a slice number to an external event selector, and a
+  single summary interrupt is raised for any ETU slice event.
+
+  Nord additionally has a timer register region used to generate a
+  periodic pulse in sync with the TSC counter.
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,nord-tscss
+      - items:
+          - const: qcom,shikra-tscss
+          - const: qcom,nord-tscss
+
+  reg:
+    minItems: 1
+    maxItems: 3
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: tsc
+      - const: etu
+      - const: timer
+
+  clocks:
+    items:
+      - description: TSC AHB configuration clock.
+      - description: TSC global counter clock.
+      - description: TSC ETU clock.
+
+  clock-names:
+    items:
+      - const: ahb
+      - const: cntr
+      - const: etu
+
+  interrupts:
+    items:
+      - description:
+          Summary interrupt raised based on an external event for any
+          of the ETU slices.
+
+  interrupt-names:
+    items:
+      - const: etu_summary
+
+  pinctrl-names:
+    minItems: 1
+    maxItems: 32
+    items:
+      pattern: "^slice[0-9]+$"
+
+  qcom,etu-slice:
+    description:
+      ETU slice number for each entry in pinctrl-<n>, pinctrl-names and
+      qcom,etu-event-sel.
+    minItems: 1
+    maxItems: 32
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  qcom,etu-event-sel:
+    description:
+      External event selection value for each ETU slice listed in
+      qcom,etu-slice.
+    minItems: 1
+    maxItems: 32
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+
+allOf:
+  - if:
+      properties:
+        reg-names:
+          contains:
+            const: etu
+    then:
+      required:
+        - interrupts
+        - interrupt-names
+        - pinctrl-names
+        - qcom,etu-slice
+        - qcom,etu-event-sel
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-tscss
+    then:
+      properties:
+        reg-names:
+          minItems: 1
+          items:
+            - const: tsc
+            - const: etu
+        pinctrl-names:
+          maxItems: 8
+        qcom,etu-slice:
+          maxItems: 8
+        qcom,etu-event-sel:
+          maxItems: 8
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      ptp@1c80000 {
+        compatible = "qcom,nord-tscss";
+        reg = <0x0 0x01c80000 0x0 0x2000>;
+        reg-names = "tsc";
+
+        clocks = <&gcc_tscss_ahb_clk>,
+                 <&gcc_tscss_cntr_clk>,
+                 <&gcc_tscss_etu_clk>;
+        clock-names = "ahb", "cntr", "etu";
+
+        assigned-clocks = <&gcc_tscss_cntr_clk>;
+        assigned-clock-rates = <250000000>;
+      };
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      ptp@1c80000 {
+        compatible = "qcom,nord-tscss";
+        reg = <0x0 0x01c80000 0x0 0x2000>,
+              <0x0 0x01ca0000 0x0 0x20000>,
+              <0x0 0x01c87000 0x0 0x1000>;
+        reg-names = "tsc", "etu", "timer";
+
+        clocks = <&gcc_tscss_ahb_clk>,
+                 <&gcc_tscss_cntr_clk>,
+                 <&gcc_tscss_etu_clk>;
+        clock-names = "ahb", "cntr", "etu";
+
+        assigned-clocks = <&gcc_tscss_cntr_clk>;
+        assigned-clock-rates = <250000000>;
+
+        interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "etu_summary";
+
+        pinctrl-0 = <&cci_timer0>;
+        pinctrl-1 = <&cci_timer1>;
+        pinctrl-names = "slice1", "slice2";
+
+        qcom,etu-slice = <1 2>;
+        qcom,etu-event-sel = <1 2>;
+      };
+    };
+...

-- 
2.34.1

