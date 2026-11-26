Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691173;
	b=bfCIhn9WZOwvTApatdkJ7V+6GtWY2FjrhkTG5fu/unW/KGZMuLpQktIerYHr2IssZLnA
	 Z+cVrI/d1Kg3vFppD14ldiUgbt2aaWqZ4mMcLVwySzF3DqQSodbvlpDI4K7/25nNY5D8r
	 PjWm6pruSqa3nff09Mo5iwEpZ0QYgfIJ0ZsKb76vm5jCuiV+uvFACxKmoLO+Mt/5r52/N
	 U9kxHzYMPIh5+ACMdhnX0ogS3TlCun88RiLROGArjyvU4N9Isa502kBvyaapb5kowXmeR
	 ImKPZGNuh40ggWRx6l1I0z08pmgc/2H9mwnF6fvmYyLW5E9DqiIYabzX4s80sNY4hSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691173;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bAkpBnZvBiH/A2z/IDAE1d3gkLalf0A6Y5L46N6u7zA=;
	b=BXqtaFw6w+uC9qimlf2apn4ObD7todvVJMXrRdy+11CBpesFBj/lhmcGatkw2USCntB4
	 HPyEmO7rY+9OvCVRRbxA5MTb4cWPQl7zWYM3A4l+VRm4isq7siq4VF3jR5IXir5FuiPxd
	 hxIwiBBJx8KblvrlsOZuiaSje0aSheQKLb0wv7zu7lRFmHiVI+0ORddwdsslRm7AU1vmp
	 Id71LAa5GzT/L1LtTq9r/lcJ+SzxoPvsv1tr0GTTCLE1MkaokW//EJAUlFMudmyLPvd59
	 zH+8z9UY/ridGFbq/Fkzekd1IK3yuEAJRts4j2o5XUHq2n+Xa6X7EGHuy+dh46S64dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fwy80TtI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YH2QOEyb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C7A606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69C7A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fwy80TtI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YH2QOEyb
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQAYXNj509394
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:06:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bAkpBnZvBiH/A2z/IDAE1d3gkLalf0A6Y5L46N6u7zA=; b=fwy80TtIGhc4VeSu
	s/5RoI7VGxBPpvJuw6RovybbXd3p3ME60tnoxYEsaIxn/OHJAdLfGe2tw0Tj3XS0
	PlbpSUwi+MXk38SwMQbT+17UXkmRCTsICtEMU5NZzfi9vv3kBGe/yodulrdEog0Z
	m3hI2YCX+kE+7vTA8wPfPE587YfRxJy1u5qQ0zS+39gvqKjolCxE2SvnmScFwIv2
	XKEToN3cFc7dRGVw/HyRhSbEnmlFQBSAiFcAzukFOx/9ezqYzABsAIgxIIXnvMGW
	HvLSN6iEwt4mBn9zpePHYwwLCt5ueE2AC9ck4lqY19xc3rmaIZyugtx7T63HAjGl
	zE1qvw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6gne0rhm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:06:12 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2eba206f4so3613936137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 03:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795691170; x=1796295970; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bAkpBnZvBiH/A2z/IDAE1d3gkLalf0A6Y5L46N6u7zA=;
        b=YH2QOEybxuPuRzUnBj+E209o4Aq0QKnKeG/g2VpQxv8TQaiUrSx9tzLzF4lijRgdXc
         TEEv7HmP4I20PCDCrQlvww97DY/0/iGI+SQO6n8qeenl3C45Y+n0hEusZX+83/9ZrybQ
         qxbfMXugmTIJ9XXlqNSBqW3YRWdtLaoy4vE6+RTLDRKZYPJXqwTHzN1zu2pbaTi9GlJb
         6aB8JYTnTJpQKtNAzBqaNQmlt5Ur+oMnYEJFd5dVbnXHVjAbKTgtTmKKnrpV0pW3LYxz
         mWc9P/XGhuybcuTVxXBThzCnYP4Wr9A5qVl63hccNOE3G99/AHYaVWqfjkmFedq3VHy9
         Z/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795691170; x=1796295970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bAkpBnZvBiH/A2z/IDAE1d3gkLalf0A6Y5L46N6u7zA=;
        b=B3ranGCP1FeDISFmzrr5oaBgEDQqhD20ZHRt07Rq07AA6Si9X12sr9si9quTWqp+RU
         J+w526UqH45avqYy3DhukmeTyRpUr3QSv7BIT7RR3uRoz1ZsAILvpNPvnfdu5n6eXp18
         afQ8U4jCfSueIS1R0V3bxBG06PmLX04e0HD3GlCaTRxD/UmPTvpXoSJMpI2J1RiAga/8
         kQpW/5/P023I0/HZMqFD0XgRnBJXjAiheEUX8HjNJF3drF+PUsgusAK36il0Csq9WMfE
         M5EM9XtDYJR0KFi4jv4NWBbyo+DFHMv7CyVU4MsxQXO0CjDDvleDrgaXv/maCkn0ngrq
         9PyA==
X-Forwarded-Encrypted: i=1; AL+hErHePD8w8EzR9zXZFn3tjcqhGfpd2ZFa4FaquvfTQICkz/hBazgF74ywktvGQ3+o5D9eyda503EBCnhJhCIz@vger.kernel.org
X-Gm-Message-State: APuU4Z93GTTs8+6bily4Y170oq0x+NtJoU8Al2b6gm5K+Jbau3Q4Jbnf
	ptwpNwkuLTEJAlKpSBczeuszPT2UMU9tJoJJo8HDoyRAhvcmGAfkyIAwpV44zOi1qHJbriNkB7/
	Qx4cvjZ6ci/9qPz6dY3fEaqSbS0PwRIF/4uB5TYTdbWXl9ROTswsR1H4CSAhtwfjhkWhI
X-Gm-Gg: AZFdTZc1XxqB/gWo1dxrEEi9aOeTYEgVemb/eyljWjABPYcJPN+oGj/SNgunyrUzNik
	1ofmCWfB4DD4+U+b+xxAto5JVFvwU8boao/CLhRkIruo/lsc/1RO9F1UfCupb8Y8WCl/l7ErGy6
	+T1g3oJEmqKVDe9DoTfR6l5uqucrsQ8uw7pkBjnx8+1GawbDh+a5mw3d4h9xXI1FAPa1w7rPfVO
	AxV1eh9SuJdByclG5h5iGB9uI9654eafG/HFBJFHl5ojYTL4Mt2kK7lRfW6mK774KqZVK+rmr8o
	v9K5anbbbDaWcD/ZTRWbKJzOeDe6+3TkSDtRcmXG6Z7C+WDz+Vj3Vc8r6o8/W7b0Z0FNDfKX0vV
	IR/qkMwCpjVC/1AazvFCQtBEoFj6AO2QvhXtehME/blqgq9IjgCfBDtlWHWPw6P6WSpHgehbZhn
	w=
X-Received: by 2002:a17:903:2c50:b0:2e9:64b9:a330 with SMTP id d9443c01a7336-2f03f17d2ccmr205396055ad.11.1795690834598;
        Thu, 26 Nov 2026 03:00:34 -0800 (PST)
X-Received: by 2002:a17:903:2c50:b0:2e9:64b9:a330 with SMTP id d9443c01a7336-2f03f17d2ccmr205395245ad.11.1795690833868;
        Thu, 26 Nov 2026 03:00:33 -0800 (PST)
Received: from hu-raryan-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c42b1sm101400615ad.17.2026.11.26.03.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:00:33 -0800 (PST)
From: Raj Aryan <raj.aryan@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:30:17 +0530
Subject: [PATCH v2 1/2] dt-bindings: power: supply: Add qcom,pm4125-charger
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261126-smblite-charger-for-pm4125-v2-1-20656509518b@oss.qualcomm.com>
References: <20261126-smblite-charger-for-pm4125-v2-0-20656509518b@oss.qualcomm.com>
In-Reply-To: <20261126-smblite-charger-for-pm4125-v2-0-20656509518b@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mfd@lists.linux.dev, Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raj Aryan <raj.aryan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795690821; l=5273;
 i=raj.aryan@oss.qualcomm.com; s=20260507; h=from:subject:message-id;
 bh=AUHf3tX4cjhQLgpG36hMqGc0GVm+wfhye03EyAkWlc0=;
 b=ENRMrEvMGxV35m3XI8+xe//bvjIErvUP53yqd5vdBF8qQggrPqWUlKqu+8gSsymAdOVlKMjby
 qxQCtBCkqdsBoMKf993R8wYV/QluSmaYt8E1qb3SO/jYCH4gZEr6i/5
X-Developer-Key: i=raj.aryan@oss.qualcomm.com; a=ed25519;
 pk=NMkZ/eGFLSObYX6FfysQiuEElPoUYghk7+2Jtc4VEBQ=
X-Authority-Analysis: v=2.4 cv=XpVvqlF9 c=1 sm=1 tr=0 ts=6b0812a4 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=qXe9l9IMIpBVqIDzQAMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MyBTYWx0ZWRfX5ASk/ZWkNnbD
 MiAvZoLVJVullXwZXIoq2jfRaTcprWKnaR+ur/ewKv/XaJgjxDSIbgcseHJUV0qpxZaJ29SowtJ
 7xUnX/eXslEMz1QdC5IO6yJyf+y2noaJDMxMKMuLXg/wuJcrlA8D2GgIFNDWDupVhrb2tpsU4IX
 CyAA56Llh1x1xbb9ELexk/98eMV3fllTLlQCy+cvOji9+OWvIG6R/JxUc8ltLXmrLnkmPdzJwKj
 rdNC0BLEsT9oiW1pJVfCqX8nbkJWPECRkogbpU/CeWbhwkStRAC5vTADS4Ph0vh8X8mWe9zbgk4
 21cqPkeBlvw5D6RKcEt/Tst2CKzBHpS/JO14x191xLuv2LYmbfuwX+T+TPneh2yXaqwhQpLlgpN
 q9wYAr4+6+qy7mVfsIyRGQx4IOhi+6NYeOfpcmhJg1TAWefLhJtL8ToWqLWJKN78Nha0nWUqlyh
 xeR+8J293rYArd+AvHw==
X-Proofpoint-GUID: ZZnpL73tcm_6OdidhP5yQDGwJNAUbaA8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MyBTYWx0ZWRfX7IQliz4DfyaA
 LnzQGJYcwvXLRngynFoG35A0bh/WVUsq6nwkXhVU/0GVESn4lmY6pvcU1eALk5E+W7T//XyxDQb
 I16oGMnRBn3xRMDFhdM0K4vhPoCugNM=
X-Proofpoint-ORIG-GUID: ZZnpL73tcm_6OdidhP5yQDGwJNAUbaA8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260043

PM4125 integrates the SMBLite switch-mode battery charger IP, which
differs enough from the SMB2 IP already supported on PMI8998/PM660
(separate SPMI peripheral bases per block, a different interrupt
set, raw ADC-based JEITA thresholds) that it has no existing binding
to reuse. Add one to describe it.

Signed-off-by: Raj Aryan <raj.aryan@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |   1 +
 .../bindings/power/supply/qcom,pm4125-charger.yaml | 119 +++++++++++++++++++++
 2 files changed, 120 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 7a889d888383..8c8eec87a765 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -160,6 +160,7 @@ patternProperties:
   "^charger@[0-9a-f]+$":
     type: object
     oneOf:
+      - $ref: /schemas/power/supply/qcom,pm4125-charger.yaml#
       - $ref: /schemas/power/supply/qcom,pm8916-lbc.yaml#
       - $ref: /schemas/power/supply/qcom,pm8941-charger.yaml#
       - $ref: /schemas/power/supply/qcom,pm8941-coincell.yaml#
diff --git a/Documentation/devicetree/bindings/power/supply/qcom,pm4125-charger.yaml b/Documentation/devicetree/bindings/power/supply/qcom,pm4125-charger.yaml
new file mode 100644
index 000000000000..4c88d836355b
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/qcom,pm4125-charger.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/qcom,pm4125-charger.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm PM4125 SMBLite Switch-Mode Battery Charger
+
+maintainers:
+  - Raj Aryan <raj.aryan@oss.qualcomm.com>
+  - Rakesh Kota <rakesh.kota@oss.qualcomm.com>
+
+description: |
+  The Qualcomm SMBLite is a switch-mode battery charger IP found on
+  the entry-level Qualcomm PM4125 PMIC. It exposes five separate
+  SPMI peripheral bases for CHGR, DCDC, USB, MISC and BATIF blocks and
+  supports USB input current limiting, JEITA temperature protection,
+  battery overvoltage detection and a hardware watchdog.
+
+properties:
+  compatible:
+    const: qcom,pm4125-charger
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 4
+
+  interrupt-names:
+    items:
+      - const: usb-plugin
+      - const: bat-ov
+      - const: wdog-bark
+      - const: usbin-icl-change
+
+  io-channels:
+    maxItems: 1
+    description:
+      USB input voltage channel (ADC5_USB_IN_V_16).
+
+  io-channel-names:
+    items:
+      - const: usbin_v
+
+  monitored-battery: true
+
+  qcom,jeita-soft-thresholds:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    items:
+      - description: COOL threshold as a raw ADC comparator value.
+        maximum: 0xffff
+      - description: WARM threshold as a raw ADC comparator value.
+        maximum: 0xffff
+    description: |
+      JEITA soft temperature thresholds (COOL, WARM) as raw 16-bit ADC
+      comparator values written to the BATIF ADC comparator registers.
+      Example: <0x5314 0x25e3> for COOL=15°C, WARM=45°C.
+
+  qcom,jeita-hard-thresholds:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    items:
+      - description: COLD threshold as a raw ADC comparator value.
+        maximum: 0xffff
+      - description: HOT threshold as a raw ADC comparator value.
+        maximum: 0xffff
+    description: |
+      JEITA hard temperature thresholds (COLD, HOT) as raw 16-bit ADC
+      comparator values written to the BATIF ADC comparator registers.
+      Example: <0x58cd 0x20b8> for COLD=0°C, HOT=60°C.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - io-channels
+  - io-channel-names
+
+dependencies:
+  qcom,jeita-soft-thresholds:
+    - qcom,jeita-hard-thresholds
+  qcom,jeita-hard-thresholds:
+    - qcom,jeita-soft-thresholds
+
+allOf:
+  - $ref: power-supply.yaml#
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/iio/qcom,spmi-vadc.h>
+
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        charger@1000 {
+            compatible = "qcom,pm4125-charger";
+            reg = <0x1000>;
+
+            interrupts = <0x0 0x13 0x0 IRQ_TYPE_EDGE_BOTH>,
+                         <0x0 0x12 0x3 IRQ_TYPE_EDGE_BOTH>,
+                         <0x0 0x16 0x1 IRQ_TYPE_EDGE_RISING>,
+                         <0x0 0x13 0x6 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "usb-plugin",
+                              "bat-ov",
+                              "wdog-bark",
+                              "usbin-icl-change";
+
+            io-channels = <&pm4125_vadc ADC5_USB_IN_V_16>;
+            io-channel-names = "usbin_v";
+
+            qcom,jeita-soft-thresholds = <0x5314 0x25e3>; /* COOL, WARM */
+            qcom,jeita-hard-thresholds = <0x58cd 0x20b8>; /* COLD, HOT  */
+        };
+    };

-- 
2.34.1

