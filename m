Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793213998;
	b=qjTbwQu383hLqHC+I0aH5joNOnW+9/UqK/mk9M+Zs3yPx3MF7PPmBvW75HYVnYQisbSF
	 Un0ZDOGmJRX6uI2/8pz3RgQK7QSkCrUFOCOhGg2QBKITtjaTwiX/BSIoHW1n62JQin//X
	 RKBtLXDidpjzH+zVIi3aGeWNT770R4C8F2EVW8H3mdLFSQ39jfiZAP8WlV78MWqTp1xNY
	 82j5SKQyAgYgt6x6z1x8x3arhII0pnnQ8JmLmzOihWs7QMQ2Z2SP7+WOg4HroJQemksce
	 XveXIcsrIpbepEuXCSj6o1zuOLamfVBxOWw1lRok0EvxurzBkIgYPRQCjv2qCpNHz2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793213998;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Kz1wdYhqxOhUGYZF5lOTha66reQmCoEbGUOxnWTSoQM=;
	b=tZtO1MfGbMkGg5P0X67ChwGhnYVSdsV/1h6Xkyht1isL3MmtycTIuVj2uYKMdH/gpl3Z
	 FxGwEbgKGtfOKDVrNDBhb0s5u0B4GNfClZEY4ESLrIvmL8lAkIDcpVn8UME/YGOI/eUYZ
	 bu7v/novd0jhb55HiKK/S3BIrPCiIgFsweeS04LmvkOAXi2hIUahMKAHtbK4HYQsVMuxP
	 YLLgfwG4JZ7HkAt9Q9O0D76pVwHf1ruK/l912NwHqyLO8Jo7xv9oj1liPJQ5QcCBMdueK
	 0yAuaeRCBCou1TZ9L0cb/MBD0hlBdnIO4/07E7kT8TBwwFCmrNzRrL3CTZsDOZg+5XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ep/MW92A";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="A/A82y9b";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B2C606A31F
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 18:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06B2C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ep/MW92A;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A/A82y9b
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIPIPv2995031
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 18:59:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Kz1wdYhqxOh
	UGYZF5lOTha66reQmCoEbGUOxnWTSoQM=; b=ep/MW92AMSe70dcCsvjJGLIy8P8
	hERNk/Gp0UUP/A2xMSGQrwIcWj7Qi5eBb5vRgaIMQhAiToPri8NiEBYSfr+POUPn
	A2mj1UfuRSjnDJfn8aDsMD7a7nOezhJP6pZOcxjhmOn78iEWbBYCheNG1QxNO4v1
	0FL3f/sFdKTSwAYeI/t4HZtptRyqdPMjyfJikN9WzOnJoNqs2wwLBGgWLufd8LLW
	AnHxH3QQM4JmR7GLQCC+4bDLD7iRKPh6RIDOtam7ZvRG+COuQn7puNg9b2O4H8tG
	oOQnP+wzwhpgIoZ+8wrtPy+jRUmsacpJU+BObyJeXGspjdsTnBjgIKmIdcA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkneurcss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 18:59:57 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-359b81ad4e8so1641944eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 11:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793213996; x=1793818796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kz1wdYhqxOhUGYZF5lOTha66reQmCoEbGUOxnWTSoQM=;
        b=A/A82y9bamf9FAiiSiQPeluhOlU89xBTAs0e+JNXIjozNluzNO7YX1nNdsRROWEJMN
         W+anD+DXft7e34tQa+4ddc+YN/8wyGryj5T9gtmO8fJ4zQm5+xNOp7Xe6E7YLbYKUUHr
         qDeyxnnsk6I4T1l9qtIyeRdhjGt4w0mwtQLXqI+NMcZ/DoIdVxFgsUYV4GwRTvTBT+Qu
         VNLtQyY4N/AcpR9KgpDecfsfuqxCz3RblAZxuffcKnINO5sgQ3zOLFbQUQHfZABMpsmD
         OLSVsFBjY8+h7wilDyzjRc2aERI7FCwUaW8jIWCpDflHIm/QXZeEKpUydU+C1c9AO5bD
         EdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793213996; x=1793818796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kz1wdYhqxOhUGYZF5lOTha66reQmCoEbGUOxnWTSoQM=;
        b=0+O5n8hqlQWHVB3RwJw9r7SaJHGFkYrC4B8ahJywLq3Je2Sqj200kw8feZOUl9zrhC
         i+vuZSiEvV2EpLJRutcjE6QM17dJhSNfxx5N6TQws8ZoKeYn/gatNsEKi3BSkZwwsfPE
         xlJsDeq6Rzc73Sb04gSJz5zHPgA6+5fFIq7AIJAZVToT1b8hKSG6fZtdXN+p2NC8d71U
         tU+ZXJee10cJj1akvIIF9eb/oE+TKy1eq3y5/v9ILngd/L/DzJWA+CI5Fy3U8dydG0EX
         UrUwH6QJ1mY1b6leJ6zE5rN9siYnD2DiqcxH2upROivrUKxWVNFGbXj1RXOX98pJn7xe
         2Nsg==
X-Forwarded-Encrypted: i=1; AKwUvBzpNNANF6Rh+zhCkEDeN/GnNUh2pVWmd+rT0Lu4oIfvd5ODlKFO+7+RZcz2JYsOTpsWStdIwVAxJQGFHq/N@vger.kernel.org
X-Gm-Message-State: AFq9FYLh19egEqxAi2W51jLSGZRZdOrC5NZrBxK+DP1QWLGE69gH8cEG
	1lhDX7IcEH63Fzx7XLdvYu8yV4p5/KY0tA0btfRjktL/pHhvlHnOYXyYO46qWO0GK8PUZLop2Bz
	gaGRVD4lIJmlsOKiHEr61zsWSo3pM8XV6YymgCViwQiEqdo3/2SdKgEKL+4jTfOCM9jj4
X-Gm-Gg: AYBFou1ZhaQ5lCHruB7Be747lfx8vMZcQrHcBe0uhHjCyD1p2k33IQFNatDKXVyPK1m
	b4+CufHajn5khZAdUozY0E/93A/QrMiF8NKfiVUNXNvQsexmaN1LyiQZSCB06JDH8n/yzk8L4Kv
	h3BvKn9W5MISXdonreilcVv1So2xfXCaGXYEcXCMEQ89i+//8kuzOX8rRSnGfYnlnSrEY4gPxYN
	2kE6a5tRAm7KhtjZy1NGhiCtSgIxSLqx4vqVphz5bmYAjW46W/Xmvr6ws0cq7BiglV7fv9QgWNn
	PPVJ1qYZK3Tiq8wmc3k294lrDfvkWPXmcUVQ37vCQGOnoPyPBlB0q2FeVitFj9J8hGJRML0u0+0
	P9UQCrcED34WREMIVbQ0v59v/rcuNZb4CzvyKNL22jMYACvR480alj+jM3N/KVrYm5cDwz3RLE4
	vGARqoag==
X-Received: by 2002:a05:7300:d088:b0:351:29c8:643 with SMTP id 5a478bee46e88-36a20069caamr3976359eec.18.1793213996148;
        Wed, 28 Oct 2026 11:59:56 -0700 (PDT)
X-Received: by 2002:a05:7300:d088:b0:351:29c8:643 with SMTP id 5a478bee46e88-36a20069caamr3976333eec.18.1793213995448;
        Wed, 28 Oct 2026 11:59:55 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239a56e9sm8639936eec.27.2026.10.28.11.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:59:54 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: linux-usb@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/7] dt-bindings: usb: Add qcom,sa8255p-dwc3 for firmware-managed resources
Date: Thu, 29 Oct 2026 00:29:33 +0530
Message-Id: <3d056785e2168de7fdc238d274d3d993e0f52464.1793212717.git.faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfX9Ls9mzR6WQrC
 6ymn8hcbhrWzos3CoMBbHHUyh5wNRE1qFjnn3tAV7KuYwGps54oL05o8j2Nfr3+iODAJDmyt9hf
 svBNvWdWSqVTVGmUcL6wBkhn1hD3DVWGcubBuCyN9zyF7OhI6MmIdbvEo6RZOb99XER+k5t7BLA
 im4JH5Ck7khrG1OpSm+jR+mpQYiNh16uQFHKl3kHo3xVGRiHIbNHB5QsqVlArliWm7B8ayFE9V6
 iPL4o2FFOYpyywMnEX4p1qSzFXf8ti5JFnHj+UPfWEiucwGDmFNgkdoZ2841nNbII75jTuCqlFm
 5J154qISqzq8NBjYjZIxw3MD3ULBtqqWxWfOKIlXZFvPASBPFz/PMPQQ9M/zFkfaX0nskCVBIkk
 TCD43hAu68f1U0lY8dFm0FMoYQbsuxp0hZDqhPHrg+C3/0klbk3GPOnBKq7QTeVRK6bY4ROgQkR
 XIrUWS5hxBD2xLuSXDA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfXxtcq154APGIE
 dhnjD/lmiKtS5Vwki3O2X+GGY4O8IoeYnHXcG4mswth8eN2dD4WZOgQIuFo7FDIxtm8jKkj1q+Q
 LOLmgZ6kOXvRBsK2VCIsdqEGRYBgRWs=
X-Authority-Analysis: v=2.4 cv=LoAHWXdc c=1 sm=1 tr=0 ts=6ae2462d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=HmkRj0nT5UQon3SBszkA:9 a=scEy_gLbYbu1JhEsrz4S:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: tTjN8hs_NU8PLpQ4FJQO-R1uj2oj8zUN
X-Proofpoint-ORIG-GUID: tTjN8hs_NU8PLpQ4FJQO-R1uj2oj8zUN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280075

On Qualcomm automotive SoC sa8255p, platform resources like clocks,
interconnects, resets, regulators and GDSC are abstracted and managed
collectively by firmware.

Add a new binding file for firmware-managed USB controllers where
access to these resources is exposed as two power domains:
- Power domain: Controls power supply (GDSC) to the USB controller
- Bus domain: Controls clocks and interconnects for data transfer

The binding makes power-domains and power-domain-names properties mandatory
for firmware-managed platforms. Clocks and interconnects are managed by
firmware through these power domains and are therefore not described.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 .../bindings/usb/qcom,sa8255p-dwc3.yaml       | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
new file mode 100644
index 000000000000..50361fe97c7a
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/qcom,sa8255p-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SA8255P USB3 Controller with Firmware-Managed Resources
+
+maintainers:
+  - Wesley Cheng <wesley.cheng@oss.qualcomm.com>
+  - Faisal Hassan <faisal.hassan@oss.qualcomm.com>
+
+description:
+  USB controller on Qualcomm SA8255P automotive SoC where platform resources
+  such as clocks, interconnects, resets, regulators and the GDSC are
+  abstracted and managed collectively by firmware through SCMI (System
+  Control and Management Interface).
+
+  Access to these firmware-managed resources is exposed as two power
+  domains, one gating the power supply (GDSC) to the controller, and one
+  gating the clocks and interconnects used for data transfer.
+  Both are SCMI power domains that are only switched on and off, and
+  neither carries performance levels.
+
+properties:
+  compatible:
+    const: qcom,sa8255p-dwc3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 6
+
+  interrupt-names:
+    items:
+      - const: dwc_usb3
+      - const: pwr_event
+      - const: hs_phy_irq
+      - const: dp_hs_phy_irq
+      - const: dm_hs_phy_irq
+      - const: ss_phy_irq
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: power
+      - const: bus
+
+  resets:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  phys:
+    maxItems: 2
+
+  phy-names:
+    items:
+      - const: usb2-phy
+      - const: usb3-phy
+
+  dma-coherent: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - power-domains
+  - power-domain-names
+  - resets
+  - phys
+  - phy-names
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    usb@a800000 {
+        compatible = "qcom,sa8255p-dwc3";
+        reg = <0x0a800000 0x10000>;
+
+        interrupts-extended = <&intc GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
+                              <&intc GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
+                              <&intc GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
+                              <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
+                              <&pdc 7 IRQ_TYPE_EDGE_BOTH>,
+                              <&pdc 13 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "dwc_usb3",
+                          "pwr_event",
+                          "hs_phy_irq",
+                          "dp_hs_phy_irq",
+                          "dm_hs_phy_irq",
+                          "ss_phy_irq";
+
+        power-domains = <&scmi_pd 1>, <&scmi_pd 2>;
+        power-domain-names = "power", "bus";
+        resets = <&scmi_rst 0>;
+
+        iommus = <&apps_smmu 0x0a0 0x0>;
+        phys = <&usb_1_hsphy>, <&usb_1_qmpphy>;
+        phy-names = "usb2-phy", "usb3-phy";
+    };
+...
-- 
2.34.1

