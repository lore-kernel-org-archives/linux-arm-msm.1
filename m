Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538239;
	b=3nG4uP5b+XdZ1mwCDCpTVM4bGTk9xLtZwbPDP45q0JCbMICTYZ51Uq4K7WSvD1dZpLV0
	 G0wziCwBPjIqk5/EN3OKiKaZfS3MsxOyv9K3xGaNCf2aWAFULx9t9hvnhNWeevbbKeYGx
	 YH4Fdwzupu7o1aegWjxihFGWV2xZiEldglPSaMZO8lLvtCMYkgAawQMegD/rLu98rBvL/
	 OOfJRC7gk4L6nLIEKSmmqzOhyf+Bia9dYryEXYqkOKiXjOF41GtzYELzpVTOnCR759WAC
	 /akwkZDGO++rP9QXFxXoWKIjYN5+b8rWUVDal7hbin6knMRuE7nmQdhhwZUu6nxjJHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538239;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
	b=mq6CrMctfLr8+M9zEta5QrdVb/gJ2EFEnIBORpl+6fIH+eIgzil7leaRwD2UDq9MxjUV
	 0Q0IEUclNJE8Fz/orICSFlnFbkXEgdjCA4TysCBsCXL6mG5l69gNeimZ0eRk1YnSqnagm
	 kMSe8eYUOjGI5Ksh0LY85bkScsoRGGApVD3S0eM9Ieps1Sx5pewu4wZHfh27HFtHTYxWa
	 ruVUnyZHzsam/nPL3NMQ484QjBXB9aMTLT5SHlgISQgZWXxGxsf4LPhYz+FYQj7lxR1ry
	 /rbIu/Mmwk950Tg76fLnAXtCdJx2ZwW/23pG9qRASQt8bFz3lianliUN2BhRjvuQn3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dMaPPvCh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HMIY8L5r;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2257B606A32D
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 02:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2257B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dMaPPvCh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HMIY8L5r
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2K5Xe3273763
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 02:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g0+lG/T+afF
	4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=; b=dMaPPvChjPIWoGHE0eNbrKwZq4Y
	Rj+KhWx6ukFPAMbnpJ97J97ve250cZF8L17bcLjLyWFvlq1LNrmLXFqdiXr3B4ew
	ustXxhpuy6W01y337tQJRng3EDzf+m/afUxgIiCknQx8MsjY3XqZ2u8yKi1eUrFC
	A8ZR9Or+E629kp1UlSrwAK9sCg4CffflQlxH7xRbisZL9WFA5QwExUCriJmBuHz5
	0c3p9JVUL7lbg8LC7i0WJnEqSJdktT59vUluLU5PPSMK0AeOOaPqaDrhNJs7yQ9N
	5iFtO5cAGQybaOxrS9MYqTSxdN4k9XXeGUllfkQygsAvlzT1lWHrFhI2vjg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufgd6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 02:50:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e94f72fb9fso4433845ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 18:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794538238; x=1795143038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=HMIY8L5rQTkrLfl354ACvCphqeTBTrMppMstoN67WwX9jhOUs8gucPchMbbq1GovXA
         8KBJ2NrLygq9wa+17Gbf9xPXXzYUpwKKFFcz6Bqvc8W4RhzSeInAYualuvGt6GeJMvdu
         xQdaoF27qttC4i4FD2tVuPRRKE/qRBi5UaBgH+77t8pPnsxhQhPxgFNgo8AgMBqzxbyb
         YOJPov4zyndTx4DhM/mFnapB40WOH3s77zGR5YgmZmW4SdXCf3McGd6ljfJWwTtNVt7m
         QCRuuqEn+Z/CgFx3o5AQSvcrkezmWznb5nfUg7c4ZBBOvgJqJ/nT1Bkfm5CSTCzmgQ+G
         fVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538238; x=1795143038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=M6nyRFjcVhsMmiEK0XMjiVq0O2a76VDZJFNQ1gmYN1RbN3d1QuYwMRTAuwIVwMbpLa
         uyyyEgnOpGQgg7AuyEZuDxJNKzNFTQJQKYwhyfSzfWmStk6Q37tZEr7t3eoa442VF22j
         ZRmGOKB6wATgQ+2/w0sScVuIKHYoM2CCgwk+KxFqwfLX+ETD17A4+vd7N+06rIIsNvyX
         MLn8zGXBEiqsXz5dUqGnJJgeutIyPOZELyo6/6udn6r6HdWJN2FqRZrbujZsL8ipDU/L
         U8acZt1EKifgJs93FMXoCQbvzLy3peaeUuVvAcawDGq8a4wRtz+QMGk4Gh/7YOIyRHV+
         A1wQ==
X-Forwarded-Encrypted: i=1; AL+hErFm2nGq9H13q0qrasuRER5IdSZYTghDVtIWn+jzdTavjuqNMiopbZiAmODJE+FRXRfx2/j39LfZFe+I+jDV@vger.kernel.org
X-Gm-Message-State: APuU4Z+JlgFdgAsQyNgsfXFA4l3wqPlAohRLaRJTY0loNDYZsQ6poWBW
	nz69F6V5nuf1v5JVAThyKfv9OL8hvteYHBqN2moTFctCSKjVCWzP1ChWHAsyx7AIXlDsl6vfI8r
	gpfF5NvW5AJJ5Wl43Qxfuh4kW0CvFItrvnBy83TTOhRgRRjl8g+g34asMBPM0sXnU6AdQ
X-Gm-Gg: AYBFou1DdcJpqSCES6VInrPuRO/hGJsLYl8eQTv3QUP6CzCs3hQn3FRZzuTJ6GR8o0l
	QHWAIEN5PUmtKjprvU/y78d9viQ3bngnUaO2F9XA8ViGLuvKMgiIcV+eDGL/m7Dv7J3owHQXZzn
	DBcQ9lV9LF+EUMSH0R+9Zj0H/nDXl+S4oX0q7X92H5osvvIq2+xU9w5kaV+GDjbVlaQlCMxHK1N
	Vgt2vXwL+C+AClua8QDSNokuaK/SqEAPcA70JjsUToy8UVnWsnRyXgsajLyWjEYsK5cl7ziNdui
	k2sxJGDhgE79OIFsfw9+ikluhEx5OD3/jG/BPTWm1qvVsqzP/bBGWjpdsE7BN0hb5kuYABVlVxy
	LuS8+wJMInRPW14LRzK5tMWwoq3fuC99smPNWb23NrSJmmpkVt97otZ4qVsyNt+Q/0dyZZ3O9eQ
	BKlR1iGBk=
X-Received: by 2002:a17:903:3845:b0:2df:4dc5:e12e with SMTP id d9443c01a7336-2ee0decfddbmr10972525ad.27.1794538237618;
        Thu, 12 Nov 2026 18:50:37 -0800 (PST)
X-Received: by 2002:a17:903:3845:b0:2df:4dc5:e12e with SMTP id d9443c01a7336-2ee0decfddbmr10972345ad.27.1794538237107;
        Thu, 12 Nov 2026 18:50:37 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0fa0b3c6sm3044435ad.68.2026.11.12.18.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:50:36 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, songchai@qti.qualcomm.com,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v17 01/10] dt-bindings: arm: Add support for Qualcomm TGU trace
Date: Fri, 13 Nov 2026 10:49:26 +0800
Message-Id: <20261113024935.3173715-2-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ePdW9UQm1CEtidaKp-KM5YRMGdErjSIg
X-Proofpoint-ORIG-GUID: ePdW9UQm1CEtidaKp-KM5YRMGdErjSIg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX+9W3LBBJwExA
 MMQdrlEZdpNrCezwMjCfDrOepfO7C3YlKv4LrLUrP6utiCcz27uBDKHxwKF9tyZZXlt93sg4Wpz
 qaWdVRlxaKOe2s0hv7zqh9FcyKT9tQBGz6fJMAlZzxRdFoaQd3gLviFlwLCBUVNRSkXYepUMd4t
 ypbz6brKDNLRoB9g+PuHeZS5X1jcN2pilTn4a4Qv/5tlOCYLg9YjuDnGixPHmfwD2UUPlfc9+f/
 CAbV1dGQYf4OkvLWry7yRFZrJrFG2i4ggZXYfVarwADHYGXtz2IfyQw4Ke7XwR3nTqEFyJQG0wh
 GRDo8MwkqDeT8ZoPR975EfqoJbQJUj2E7xOnLez2E+GqjKMigI56YcPAH7XBfHovNOaiCh/SblX
 rH57S6cD53ETd3ZoQRwzPdRUNbmheAu0MXgb6Tw+OdczZbFqdNmLM6IP8raloMUilQS6A/mZXPD
 SidlnsnV/ZDAnX+9Apg==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af67afe cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N3VNWiZ0WD7Ir0aJMQYA:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX59ymXSv1E4fx
 QIh02byX4YY2gJHyFSl+BL7rvFrb6Vwzw6ukfph5lg6rQ475xSTm+4VehaglZlK0pyzcIGX3Vxa
 Khe67I2+n1/GqogAAMZpNFYaM6uB9C0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130010

The Trigger Generation Unit (TGU) is designed to detect patterns or
sequences within a specific region of the System on Chip (SoC). Once
configured and activated, it monitors sense inputs and can detect a
pre-programmed state or sequence across clock cycles, subsequently
producing a trigger.

   TGU configuration space
        offset table
 x-------------------------x
 |                         |
 |                         |
 |                         |                           Step configuration
 |                         |                             space layout
 |   coresight management  |                           x-------------x
 |        registers        |                     |---> |             |
 |                         |                     |     |  reserve    |
 |                         |                     |     |             |
 |-------------------------|                     |     |-------------|
 |                         |                     |     | priority[3] |
 |         step[7]         |<--                  |     |-------------|
 |-------------------------|   |                 |     | priority[2] |
 |                         |   |                 |     |-------------|
 |           ...           |   |Steps region     |     | priority[1] |
 |                         |   |                 |     |-------------|
 |-------------------------|   |                 |     | priority[0] |
 |                         |<--                  |     |-------------|
 |         step[0]         |-------------------->      |             |
 |-------------------------|                           |  condition  |
 |                         |                           |             |
 |     control and status  |                           x-------------x
 |           space         |                           |             |
 x-------------------------x                           |Timer/Counter|
                                                       |             |
						       x-------------x
TGU Configuration in Hardware

The TGU provides a step region for user configuration, similar
to a flow chart. Each step region consists of three register clusters:

1.Priority Region: Sets the required signals with priority.
2.Condition Region: Defines specific requirements (e.g., signal A
reaches three times) and the subsequent action once the requirement is
met.
3.Timer/Counter (Optional): Provides timing or counting functionality.

Add a new tgu.yaml file to describe the bindings required to
define the TGU in the device trees.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/qcom,tgu.yaml     | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,tgu.yaml

diff --git a/Documentation/devicetree/bindings/arm/qcom,tgu.yaml b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
new file mode 100644
index 000000000000..76440f2497b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+# Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/qcom,tgu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Trigger Generation Unit - TGU
+
+description: |
+  The Trigger Generation Unit (TGU) is a Data Engine which can be utilized
+  to sense a plurality of signals and create a trigger into the CTI or
+  generate interrupts to processors. The TGU is like the trigger circuit
+  of a Logic Analyzer. The corresponding trigger logic can be realized by
+  configuring the conditions for each step after sensing the signal.
+  Once setup and enabled, it will observe sense inputs and based upon
+  the activity of those inputs, even over clock cycles, may detect a
+  preprogrammed state/sequence and then produce a trigger or interrupt.
+
+  The primary use case of the TGU is to detect patterns or sequences on a
+  given set of signals within some region to identify the issue in time
+  once there is abnormal behavior in the subsystem.
+
+maintainers:
+  - Mao Jinlong <jinlong.mao@oss.qualcomm.com>
+  - Songwei Chai <songwei.chai@oss.qualcomm.com>
+
+# Need a custom select here or 'arm,primecell' will match on lots of nodes
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - qcom,tgu
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: qcom,tgu
+      - const: arm,primecell
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: apb_pclk
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    tgu@10b0e000 {
+        compatible = "qcom,tgu", "arm,primecell";
+        reg = <0x10b0e000 0x1000>;
+
+        clocks = <&aoss_qmp>;
+        clock-names = "apb_pclk";
+    };
+...
-- 
2.34.1

