Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62AB48B38A
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 15:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786636375; cv=none; b=sg0ZpedaU4MkVKuDq+MzoaH0Us4xpKv9a/1RQzY3bvy09fYUnA+TKGl+tRJMJM1nwgYrxN2KHia4PutBB8UP3iM5iLeOTSXge0ts5kJTmmyqKDy0qfh2WpX6cm7euHjZkgWJ3SfI66ieuLzz8/IC/BgpiOjrgEAg003w/aXtCJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786636375; c=relaxed/simple;
	bh=hkHxholCTGl9sucmyJ3W/YgVCz0/mwmGUzJXzmGXAUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TOMC1oneBJB4F+5ECH62+dPV0E/O3yl+l3uGxmTi3b5y/Azov1k9KqQhI4izsmv5c46IAOfK7iHUNP+oHeCcVyoC5HX7ZB6NLTGkseDfmeVsJazVRvnSh4hYSTLIFfZhLUaMzpSBfB0YsEHaD89Ooko1iibX3t+B1r7px6rSdbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lKG5QdlE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gsdyv4CU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lKG5QdlE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gsdyv4CU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFUADJ2838528
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 15:52:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+vJkWved/i+bvy5D1hWgjj8/NbROnWS4fXHGrV1BFc4=; b=lKG5QdlEYsA+I0iH
	pc1Gslni6YxrHJak4wEKmiTV0N9w1QImxsQZ+R00HRA2Ummn5FtWM6VqMHAUORqg
	GSe/Wz1bfQ4oiJFGdPNTm3Vte8VedlQbodBDs6UFtMbcQQThGm818JZLk3BJPmZo
	HsobIEqZopCI+TjujXiP7AV8oZODziG5F06g+IGmO2yLzjUJLRniWurQVAyMsD+a
	LrfPO/Rk+icQE0x5L0MzREVz3csRL7XdDuGoG4f6xUCop4zvdEPrJFB7Yh2A0rLc
	dWsdhY9BfEvQxGouSzRZsMy3RTb6hzTTsjl7GrIJaVnjgrYp/LZGcTgPRLQZRF7a
	47s0kA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g143hucfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 15:52:50 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8488ac68185so1792432b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 08:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786636370; x=1787241170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+vJkWved/i+bvy5D1hWgjj8/NbROnWS4fXHGrV1BFc4=;
        b=Gsdyv4CUYHcBHvKgwfOBQ9AXG0v9uEz9EUZz+rEdBsZMbOwk4+ocvyNCEhdZwTdtmv
         squPe+65rWJbZZxWvMKxLYU8Jf+ww9wh7k/ovM8KuO4WsPks0Ikhn9OnApZfxE5p1MMk
         WhApb+qezqq81zzP8Ep3YvyM0BqHmVVBLM2TJg3fLbL5YZI4OaQMCKdEjcrTW5/ZhX+d
         P8RkYfaNCAuMqCDmhp0ONrzLQO588SPB+h+MGssaXKmkSdVXY6H8i0ceFbNa7KiirVLw
         oJaQUhhZsrv9OPE12nDRif2bBo9X2kVVNxFnIauUgECe8SiRZvb6w+aU8bfxC3jDC5cP
         kELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786636370; x=1787241170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+vJkWved/i+bvy5D1hWgjj8/NbROnWS4fXHGrV1BFc4=;
        b=rBOnsb18xzv5RPcjkbOwxFzgtRI0YlwI+oivW3N1ZHinnBlaYenTTK6d5bTCDLPCPH
         nzf2NVbikPafMSpIbiEaRmDlVs5vYCtTV6SJ2r349ObvWfC/HuB4ag8urEtE8RCssxEh
         UdxWRGiFWFjOekHkl6WgFgLrQ/1qxvN960Y8Z4Zok4uB7DtN6MHHNz7gcLM3w7U3TTwK
         xgzOwxmTTYtf29e0H017x6fEDvwFdcmgFhgCSoGEIDr6ebQwa+PAITJ9z1UBZ07bfzII
         qH5zq+CQ40JlHtGcpy7aSkvK4KmfOkfeLY5eL48SysLcjVXlCJA8ECNJL3L3xdvkwiH9
         I6ZA==
X-Gm-Message-State: AOJu0YwHkoGynVV/LKcslJ1CIVQzzIPBvxXd8ENLBedHOTQaNrxMiNL5
	QsjPFLmPAWNSjuoTN9iqrVl09MXAQNSogx0+GhAb0dV6M89bZurSxVRDwUYhhz2O8AiuOVAiVy8
	Dq2JbxljfvQ+nzS9l2CqQeC2nCraSUwIInW/8YIPk+aEOVYedEWsfYp/Lq7Hu20TCuias
X-Gm-Gg: AR+sD10p7Q87bzljHfUNw4NEU51f7W2bUT04TX6bFaITg1ch+CH9aD1T93eP45i7YTx
	q8hjVzQbqAAJHO6nMyVWHbZ+tXvyqdeksJjo4qJYkr1NRY0qHibIdvtmPicQncWYBh0AiPHFsXU
	XdYPtevLPE/OUNQ4POfjfjV7u3qncI9qyTJRKsP+8cR8YvfiXQxqTOJIMmVgVf30Gh3d+FFJWRy
	y1FghtqdSnF0pyerTkm1rN38Zb9TEVrwtLHTeLgGKMTRxOIrNzt+yP7txkuP3F9XHgxQpFV7lkv
	nNeAF2U1zseUeVTGC0nDbSNwaUbIdHb974CXyC2wSACFmLKsAtoaLuaWlDSsfxsqy9aIF1J0Fdd
	zz9y1y+RXdV7ht1/lrgdGDWXpc1ZTFG0QuzvU
X-Received: by 2002:a05:6a00:1898:b0:84f:b01d:3693 with SMTP id d2e1a72fcca58-84fc74f90fcmr7388264b3a.15.1786636370031;
        Thu, 13 Aug 2026 08:52:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:1898:b0:84f:b01d:3693 with SMTP id d2e1a72fcca58-84fc74f90fcmr7388208b3a.15.1786636369581;
        Thu, 13 Aug 2026 08:52:49 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fc45627cdsm1156401b3a.5.2026.08.13.08.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:52:48 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 21:22:32 +0530
Subject: [PATCH v3 1/2] dt-bindings: i2c: Add Qualcomm I2C target
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-i2c-qcom-slave-v3-1-1d3742e2ad47@oss.qualcomm.com>
References: <20260813-i2c-qcom-slave-v3-0-1d3742e2ad47@oss.qualcomm.com>
In-Reply-To: <20260813-i2c-qcom-slave-v3-0-1d3742e2ad47@oss.qualcomm.com>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786636361; l=2717;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=hkHxholCTGl9sucmyJ3W/YgVCz0/mwmGUzJXzmGXAUk=;
 b=7J8TpCGVBEn1xghbLE8yFdwGzF28xG8QE8uM0hsanpVu62MZ3ofwPvChv8PeS6PpkgBX4dk0n
 Y7nn2mySW+XAdumRmxSkhSZjgYzajgrVQ4vlnsA6rAG1zLvNWvhyZLr
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Authority-Analysis: v=2.4 cv=R5oz39RX c=1 sm=1 tr=0 ts=6a7de852 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=64-jBHeFNbSwsrqMnDgA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDExNCBTYWx0ZWRfX/skKC8PB70Tk
 NwD5KYWu9jd5spJyt3aeGipuU+U1kUYcO51Fn7ehEQkZASicAIXnz/+T/n7EfIa+0qvMCpJp7n/
 HZG7N7j6wcJ8zAzN9nMMVTB4os7GJ4mvdl62smgkd9fKVjQ6pGrmDrxJsLP6WKrQrus77g5uocH
 X6bSXlil+YP3PGxt00UlIwTxjPr6pKhoT4SvV97YaD6NxFlpDalpLAcaN+G54XRF/wuOYjh3XYM
 DYwwxzloqKNHszal7iG+BkxhPjJnl8+nO8AeM1kqwfmSV3bFIQ49xYrCslThfXsmF+/ccN6IDKK
 57S33EuWZIPmBWro/Ls1lHVew6dYxZyWEVTrL7jWiG+GIJOpTW86bqPdwPJ8qo/zZbHgL6jVZCi
 8Tq9XhIefkEsQNAfraRmTWNfjz8lDNPh50hmDyNqb++Xu2EpginUcrcSeBX167ds4fFlmf4+XOu
 gyIg/JSnV9LArHOWXxg==
X-Proofpoint-GUID: RN5CZUaOfcMnb059pvCiOe5s3x-MSrk8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDExNCBTYWx0ZWRfX/5zx/W1XQ7bT
 NBnhWMBWBDCVemjlDPjNc4fx+rhwZ8FjS6vO6h9scqsWOBtTqnUeq8g5U44RYCPK1lLVPzgSfWM
 oQeGwbLJASHeghISe9G0Mg+sDaBNfBY=
X-Proofpoint-ORIG-GUID: RN5CZUaOfcMnb059pvCiOe5s3x-MSrk8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130114

QDU1000 and related Qualcomm SoCs include a dedicated I2C target
controller that operates exclusively in target mode. It is a distinct
IP from the Qualcomm I2C master controllers (GENI, QUP) with a
different register interface, so it requires its own binding.

Document the MMIO region, interrupt, XO and AHB clocks, interconnect
path, and optional pinctrl states for the controller.

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

