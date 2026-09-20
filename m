Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB97430794
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 12:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789905860; cv=none; b=meWUL7U2jPDRxh1e7QxYL2gPC7srlDXLqXoVz/NhNyuS6Z26IsEUx1D8AV8FS563spbNg2zBiAbeYTSD+aD8ez7nUW+RHiaioKBMPfzPf3t+BnR6HGMzU6TVGrQkUybHxYusa4ra8iXMT2p3/p/2aPaBsnDXQ953q1aPABj+sHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789905860; c=relaxed/simple;
	bh=vuxpQQHSHpogoXgcj1g6nYIyqWnif7Aqe4zqMtU2VSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hPmkxHRJXMNOBAjCjfgI+sxsTYSJX14f452NxSqfb5hYh1FNHzrX+VNh154XW63YaI4b4BnRR6yll5xo+yBoal1QLLYT3MJlDYRTryv86HwSB0GCmnDaKUTgYIH9hpsuNxG2zH0D8MwH7bTuOO3VLYinBgoHAj7ILDcNvFoExQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mIyOgh5I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DJ5V4qwo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mIyOgh5I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DJ5V4qwo"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBogh62570262
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 12:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	312B9C6n0UKKu6NJESvzkUE//S3M9JdnPEV0pkxNzjc=; b=mIyOgh5IA5WtV7T/
	92dSrsoTNguH/YzjbHn8bddUBUnFIfb6GCPXOg5ZsKfATvdemxL9cEfmIG2yp5nI
	79qm/m6LXqFSg4JmwABanhuUVOSqhRGVv4f5neLrfIWgpPHL9XPUg5zj2sdwTAXj
	I2CfadCjsEKKd9d/DxfKbg3Scrr7MoDmK9AW6KUVnPAhv7FEzV47jIDu5EncTDch
	Wq5NNj858uLKI5HsUeOOy9TaXj2kXVzvYOeuYGdMbCyWOaxeBY4Z+r9I8JEG0bTX
	oHNUZzPLGP6fdhi4gUIGfzQQt7Cg2T8v+v5HfNFjY+cGDTObUca7fpS0H2A+UgvI
	6f7ODQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjfujwkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 12:04:17 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca8aee88725so3228046a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 05:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789905857; x=1790510657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=312B9C6n0UKKu6NJESvzkUE//S3M9JdnPEV0pkxNzjc=;
        b=DJ5V4qwoMv/ioTXuvY7HoFEcRorTm74Lr+kP3VN9+6XBTkWJMJWjq9MOBLih3dh44k
         QbSVV1KfPXJ9GhanBcfiyXnOW+U/kJNf+dsMZpwNULUCwVT+BKxRErx+deFHj27iDWjr
         yDFE6mLIln8W2iBfAm940InXwdhtKuYdHN0GeseyNAz7W44a/864f105231/nu1d/ENy
         USBLIkDtUFB933Q1DWOPJDkHAQlZiZ5fDbM7juoUTrveSkV6ntrS3DyHtu3jKlN+NsIV
         TQ2it3zgRfU+x+cVQK96ZXW46kJVb2+MAE9Lmwwv3j/ujXjJ9S1vlWpbUndn1ecqTEEC
         /V1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789905857; x=1790510657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=312B9C6n0UKKu6NJESvzkUE//S3M9JdnPEV0pkxNzjc=;
        b=vm9ESZlX6/t46QxBLPZ89V3U94HD+bn5g0lCBYzdZFTEipgLSnkWCVfMKeA9DGyVNZ
         ao3fMfOS4gWIiVQHde2K0akid6hfZBrfeLjzPeWtE7RgehnOlxbF/OOYpekzQ073dQKy
         e0fyRftVZLd24J/uqc73M33DWItmT8hdUeKlK6VNsdt4dXNJEBWtz0P9Ptl8YvBEOqqj
         /bRTtsSGUNCq2gCEhdmKG/eQsDQB0xFW32VE84u3TYwD0iuqFkzvX1MXLuqDxvApUxAd
         cgoSsi3iotuTUCA/s4Y2ESg8RxeBiOaN3VsLR6ysh5uINebWphnuShuxhaPITnhSwWT8
         PKaw==
X-Gm-Message-State: AFuF++m4kIh1S92/DBGYWPN9zd6iayBwuhmv/NUgkrC55DrGsDbEG9vU
	utoKTScrVD26gjyp1RF5A+3welU6z6ROVvc3EjgkwJ5K2AJvipG4js7YJ3285PkzCG8SL7IKxg+
	3j8iFQm7HEx2EU0779blOZJQj8A39WAopHpMmI3c8SJmcuBsUKbIznxoemKLdwZxNbOoG
X-Gm-Gg: AYBFou0VsL0mRtCAz4Q6I92IDmCRMx185iV4zdnolb0qF0NNPrb84XDy+YnN7MbrhOU
	iaeyreDFBwdSMHuWgPeIpbi4GLoYNm3h4jPHy5jAqla8YYKn39VaglCObdFmpNavSPsWP2e27l5
	kFuidhhYoVEXV3lwQh9D4T/fm9w2s/g4P+oWC1L3ovMtrHtQ6hd/EwaLlW7ODvaiT0C3jJ+imTo
	SJ/KGZ4AN6Mya1uJ/vB+NGp2YFoHPbO85xrQWWZVMRQ38DYlBVzUirQn/ZRvBRG3yKLanh12luk
	TA492BmtiCsT3QmHiVZX7jcwC/KN85zlVeX2+SPrtt/uWxPF+mnnTsCAdwZ6oVxo+X4PTo+zdtk
	UDIVG/iRzm3hMPIUZAqS8/hmgoQdBjemuhwA=
X-Received: by 2002:a05:6a21:b89:b0:3dd:a197:cf30 with SMTP id adf61e73a8af0-3dda197d7f6mr6614204637.84.1789905856579;
        Sun, 20 Sep 2026 05:04:16 -0700 (PDT)
X-Received: by 2002:a05:6a21:b89:b0:3dd:a197:cf30 with SMTP id adf61e73a8af0-3dda197d7f6mr6614165637.84.1789905855983;
        Sun, 20 Sep 2026 05:04:15 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55aaf1csm12109622c88.3.2026.09.20.05.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 05:04:15 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 17:34:01 +0530
Subject: [PATCH v4 1/2] dt-bindings: i2c: Add Qualcomm I2C target
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-i2c-qcom-slave-v4-1-f7e1020f3bb4@oss.qualcomm.com>
References: <20260920-i2c-qcom-slave-v4-0-f7e1020f3bb4@oss.qualcomm.com>
In-Reply-To: <20260920-i2c-qcom-slave-v4-0-f7e1020f3bb4@oss.qualcomm.com>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789905847; l=2790;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=vuxpQQHSHpogoXgcj1g6nYIyqWnif7Aqe4zqMtU2VSg=;
 b=cD/isAtcvTnIdN4rCxFt5vNkUpdNJkaupwoJvyxs8k1coPb97PAwRqJiTWapxKDPtfOgGWB9B
 ZtdV/dhZQi6CPEPQq+AlaJY/KgPuapgecMT7U5YHLlR1J1NLlY/h8xj
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDE3NSBTYWx0ZWRfXwHeoPuk3NlaE
 PioMt3pnEkrHXdU+1ZDzNkWN0tVU+XdXaBhI0agF6m6hQq2rCOFadh+NIXKPZ4BWffsszXw6vOD
 bWngEjJvRAzSqUKOiSEEFl6F3QCB0uE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDE3NSBTYWx0ZWRfX14+x9QxURczS
 lfQ/YiE+F5J/2mJaBm/Lymwi1pMJeK7Y6wEM0ULYN5FI4vhp/gyd6qlKTL+cQG3+JXGKmOQgwRd
 mPoii/4tSsQ8Aa92xalP3ArQ6RHBAPAve4TMF8bHYmj8VkNfHiohN5YmDdAFXY3piqfE9HKyiTm
 wAlJr6A4D0j0TuAA0lcav9t7sXH4Vn80butMc9gQfn2yqDARlJTO9xthNZYO+TlrAEtKeCFCQ6A
 T33+3P4TwRZkJ1QlRLb1lTCr5qg9gEaJd1sVlBvK+gH+3Ri1oVkEAoYwwQzU6nNqWhuuWq9w3VQ
 +Cco2df1yhkwUYaaqerJPNpUVX52uKVg+hLNYkHw1Vybg5jXCWHB/EfvrlNoSBJAEb+5hRHmo6T
 3i8AQZ3Fd+Ibm96T9sgF6KO3fTgL1kDbHYdUlgv72Ri1Kp8N8h1a+lHJ2qL8oCDpKESJVpCDOmK
 qigCgcejTPOYRlkjVAA==
X-Proofpoint-ORIG-GUID: 9Ve4YcWWWKVmylbpaaL8ujKUuWAaWlmB
X-Proofpoint-GUID: 9Ve4YcWWWKVmylbpaaL8ujKUuWAaWlmB
X-Authority-Analysis: v=2.4 cv=QKv91QLL c=1 sm=1 tr=0 ts=6aafcbc1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=64-jBHeFNbSwsrqMnDgA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609200175

QDU1000 and related Qualcomm SoCs include a dedicated I2C target
controller that operates exclusively in target mode. It is a distinct
IP from the Qualcomm I2C master controllers (GENI, QUP) with a
different register interface, so it requires its own binding.

Document the MMIO region, interrupt, XO and AHB clocks, interconnect
path, and optional pinctrl states for the controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 .../bindings/i2c/qcom,qdu1000-i2c-target.yaml      | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,qdu1000-i2c-target.yaml b/Documentation/devicetree/bindings/i2c/qcom,qdu1000-i2c-target.yaml
new file mode 100644
index 000000000000..9a6b08f0ab0e
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/qcom,qdu1000-i2c-target.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/qcom,qdu1000-i2c-target.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm I2C Target Controller
+
+maintainers:
+  - Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
+  - Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
+
+description:
+  Dedicated hardware IP found on Qualcomm SoCs that operates exclusively
+  as an I2C target (slave) device on the bus. Supports FIFO (PIO) mode
+  for data transfer.
+
+properties:
+  compatible:
+    enum:
+      - qcom,qdu1000-i2c-target
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XO reference clock
+      - description: AHB bus clock
+
+  clock-names:
+    items:
+      - const: xo
+      - const: ahb
+
+  interconnects:
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
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - interconnects
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,qdu1000-gcc.h>
+    #include <dt-bindings/interconnect/qcom,qdu1000-rpmh.h>
+
+    i2c@88ca000 {
+        compatible = "qcom,qdu1000-i2c-target";
+        reg = <0x88ca000 0x64>;
+        clocks = <&gcc GCC_SM_BUS_XO_CLK>, <&gcc GCC_SM_BUS_AHB_CLK>;
+        clock-names = "xo", "ahb";
+        interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+        interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SMBUS_CFG 0>;
+    };
+...

-- 
2.34.1

