Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBEC3B5303
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Aug 2026 13:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785676430; cv=none; b=QlKkrQm0ODgkwVE2TSBuk4UNHhEh8mcV8X2Ezui2xaE/x3ircCoUGbo7Qs2rT4NkuiLddGsYm0i7wev1lkqXsE7l2EHpybxvLTAFo2eFAn4QuPGrdcv8itlntq7std/G1Mba6gE9q6jy5Yd3HKPGY3CPNVU8Q33Y4iRgeEwFPn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785676430; c=relaxed/simple;
	bh=c+YVks3b0NjnPxZoViYuM2n50/y5hiDqyE3XSAVuY7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PwB+WvSa9JBhpEyKSQ1BsPIq+uykf+6m3H4WjJXEl45ZnbS468Fs2ki1j+/fQxLbXrKCDz8q7rapAoq0y4gdoSX+TocLgXt1A8vWFEbblZZ1h2SQoLKrUpPTpHFP+w0AiAouDKdRDcsvn64jFO4by6KB3/YY4XOEjPy2LJDin8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=piH226cc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UPxiwoGy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="piH226cc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UPxiwoGy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672B6brd1666595
	for <linux-arm-msm@vger.kernel.org>; Sun, 2 Aug 2026 13:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WFMrveH/zKDPg6uSCRqHIFF/V3WcuiRR4bYskluiiOk=; b=piH226ccPxhyuSkF
	qrWV0HA4UabSsB9S3VG4rMDPrcgRPtCpkKl23ZpKNlQO7R5qYn1lr0HK/+Ve9K9e
	6n2ijm7ae2IFZSaCj2xi3YHs7tjOWXZFQcZ9yqoNZpSqzGT0EMl1/TxbfWPfiNv3
	T7QXBt0HJ1nLa7n6izV/EaqR3Xi6iY1eOFipTemOuJtmEq+rQz7Ybd0U9ihQts4I
	P9wR2++wjg92ijHGzVwtCPUbD+eBby3bWzF/B4SVjBPaMLLRzVmN/1KAldaz5i2F
	ZbgZkMs6C25Pu2RybhDiLQzlT8RsTaG89ZMGyW3PdlihmLCaKg7llcrfhehS8v2r
	lLNXTA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs911aut5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 02 Aug 2026 13:13:48 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbbb9c9bfc3so1306934a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Aug 2026 06:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785676427; x=1786281227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFMrveH/zKDPg6uSCRqHIFF/V3WcuiRR4bYskluiiOk=;
        b=UPxiwoGypqreNsQyKsKCzrRaGeLjI9dnxsShw3xSa2mRE7nCJcZd4Y13VyjGqRs9cM
         EjeiFTlk14COn8Uo62XAuwXfx6zvcnA7rhAhLDiHBN8ojZM1EOCRGIBPqx2js+1Jl/3F
         gxsPK3otca9kXjZXb7ROzuATZ/gf5LsnIeCmvla72lXSfgO4rSRKLBDP6SSUL6bgLcR+
         x6SLRkEWS1ppnychplOBMHZivft0xAog+FrMXITmmoNCULku0Tn0CSH6JbF+flvDlTlb
         28glomotKExUMX4hIpKly4S1qX14QkrCpqIkoKi8XcADEAWekr1Hko/0XHs5eaB4HvmA
         ARzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785676427; x=1786281227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WFMrveH/zKDPg6uSCRqHIFF/V3WcuiRR4bYskluiiOk=;
        b=HD9fwv+icFWbKHd6qwvLsy1RibPtoaTWUI+tq16rGv9n+JBuCZZm5fELVf2442NRAh
         mM7tR5RqvQIyOww8HE5NI7seOUJktxMYo5W5JJkqA8t7p14FVPJgQRTmKVqaZZo9Fjed
         412sfmdvfpNluKGk7EALjg8f+vjwvZSxSBFZ6qF76aP+fgR5rHjuaQ6nDo5ufOe9nYHw
         seC2CqFsuqs/CyZpaw52EICp1gy/a3uIx2vpxxIziiZRzAcRvxgNtDdei/i+tbOeWHz8
         WyxsDBdje+E99OHHFLhxOuoGaCnBH/OQltoct3fA78C4NiY2EeSTb5S5/XCzwzjQtkU9
         BMdg==
X-Gm-Message-State: AOJu0Yw9hqHnlamnSUF52BY/9N6NrnYCOVHesc7Tu6n4wZqmqxBbthej
	fOmil5Ju/shfIuooPHyFtDKWFWE9RB1Idx6MkWkjcX4WDSjmP/0u88luSFPWfKwVurOGu/x46TR
	l1BkFhMooKHS+yiSBXbnqHh8ziZ0KlUx+X/NiMYNDDCZm8G+J39OIvxNJsxY3AZ4YZmlG
X-Gm-Gg: AR+sD10ORU+RLa7THcuKLjLPfH9CiVxqc6D1oIYniAspcHwGpFtMBH2ZT4vl1AzN3+v
	XnD6+EMSf7Z0HqQJr92vzR1Wi4isQtP7eDwJYflepCiewtLPvc6A5ujuBrJN7j24iqBXJ+ohNl1
	wY4wlsOu77XmlGD+bg6Lq5OJOVI85fpL8QY9NFdqJlkMnmCGOSiHOgqzFWaVddisifBcwEzVxbD
	P9dipZ1tbSAAA4pUogJ6cnfrF9BVNnUMqFESd+Qa+1A0qHF//0YRK+wscgGxt8vNDtT/hDJiFd0
	OqS6pQ55+0aaHuZnkTmeq8yJ8zLyzao+s5/3iVzuSD2W+J8WrhQdrRLyICzuJlTa2xtnP4GMUha
	snGBeNYXO0XzFILmCPXHOx4Y5Eb02fX0/iJ9y
X-Received: by 2002:a05:6a20:430c:b0:3bf:b84c:2984 with SMTP id adf61e73a8af0-3c92a5a1956mr6354266637.11.1785676427384;
        Sun, 02 Aug 2026 06:13:47 -0700 (PDT)
X-Received: by 2002:a05:6a20:430c:b0:3bf:b84c:2984 with SMTP id adf61e73a8af0-3c92a5a1956mr6354244637.11.1785676426894;
        Sun, 02 Aug 2026 06:13:46 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06f8dbsm28303457eec.22.2026.08.02.06.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 06:13:46 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Sun, 02 Aug 2026 18:43:30 +0530
Subject: [PATCH v2 1/2] dt-bindings: i2c: Add Qualcomm I2C target
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-i2c-qcom-slave-v2-1-27653118fa75@oss.qualcomm.com>
References: <20260802-i2c-qcom-slave-v2-0-27653118fa75@oss.qualcomm.com>
In-Reply-To: <20260802-i2c-qcom-slave-v2-0-27653118fa75@oss.qualcomm.com>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785676418; l=2894;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=c+YVks3b0NjnPxZoViYuM2n50/y5hiDqyE3XSAVuY7U=;
 b=Pbj1y8oGh+c4QxvaVEvnyMqzGBQhd0ckHUQCEfsw+wxydShkDhqPFT7fwTB5x7saqp4i1qWVN
 3Nz7Zpv5dyeCafFgms731GZ8k5tPP+g7KdrQvvGTMdCeWfieLvJRB6d
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDExNiBTYWx0ZWRfX8lbD4mK6Vhrd
 invuFIC4lnR+FtL7FguoLB7miL+vjiF5N1WaUHwE4Em7cm8oaxJ8a3ddmAs2JmqLOf8DD6sW2hc
 WdPmd2ZE/ZU9Rk5Bz1HW9AGO1DJ9Gdw=
X-Authority-Analysis: v=2.4 cv=PvGjqQM3 c=1 sm=1 tr=0 ts=6a6f428c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=64-jBHeFNbSwsrqMnDgA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: i3Q-ZGHa7UCy-tyyUzFmU00PGWJw7eTz
X-Proofpoint-ORIG-GUID: i3Q-ZGHa7UCy-tyyUzFmU00PGWJw7eTz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDExNiBTYWx0ZWRfX5GzRpBcoWtx0
 textaCTl/4pdkjDJmTt5LpAz9q1pTCOzfVTkapT/3dUXLt7YVx1/bVw8OzSzT1Y65Y5D5yJ6bzG
 BJvYpEYXFHYt9av8XQ80kbr6MUJvm9f2rSjrreHTROHv1OvS1us2HK+4/pL21//at6Yud5FDoho
 6ArBVzfiG6pZOUSos5/qngSjm6+50SQLYnCqVNuq3eqJ6OP6Bjc9dFheCaVgrCSvuXkkoz/s5lp
 tiKhRZezU2Fc4YMN0irm+A3doFFjnxXtOwBSYrw3LAr7FjnRUp1JPQ/iTBFLaLNavvFMN3nIQhN
 ZnOynO/Q+aHel3j80OVUwx/W3r6OMgCMRGdd1JzirYt6FBdKxsIKBaMc2rqweRAqeqA+d1fT5/s
 4PFl49vm+dec1cYe2FXKLWpXizhA3uVGM5urTcsvXeUBuV3yKFeelhpmIRg4Jnr+t3eV+x+P+bj
 Z7M/6on+nrAlSywmW5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608020116

QDU1000 and related Qualcomm SoCs include a dedicated I2C target
controller that operates exclusively in target mode. It is a distinct
IP from the Qualcomm I2C master controllers (GENI, QUP) with a
different register interface, so it requires its own binding.

Document the MMIO region, interrupt, XO and AHB clocks, interconnect
path, and optional pinctrl states for the controller.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 .../devicetree/bindings/i2c/qcom,i2c-target.yaml   | 84 ++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-target.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-target.yaml
new file mode 100644
index 000000000000..1e34e874cc4c
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-target.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/qcom,i2c-target.yaml#
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
+  interconnect-names:
+    const: i2c
+
+  pinctrl-0: true
+  pinctrl-1: true
+
+  pinctrl-names:
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
+  - interconnect-names
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+unevaluatedProperties: false
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
+        #address-cells = <1>;
+        #size-cells = <0>;
+        interconnect-names = "i2c";
+        interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SMBUS_CFG 0>;
+    };
+...

-- 
2.34.1

