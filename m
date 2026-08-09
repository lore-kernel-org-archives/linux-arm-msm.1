Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB93B3AD507
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Aug 2026 07:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786260508; cv=none; b=K5CzNB4ESiZ1GKClG8Ck/UMWVqPf38nV7Zabknn8UtoCD1AludBauvx5V/BO4CAc1lkFf6VIp9NOpd8t8ouA11wSYOzoYEJoKkCj7+icbC4jcVMSg1Zj6sJAl409ppaw+H3Z15HwuIdxjjOz72d6Zo/vjgz+6LoLTk/vI/RkueE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786260508; c=relaxed/simple;
	bh=M3+tCJ2GKEYW3mlHIPKwiHldQ4Hh7V8oaKeisYy8F+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C6PyHcEAfWXROipH8YX4xBUUF98P3I7p7PjhVNdYxl2xl0DU4s9EweHGvydrnIeX1/W+F/oUF+3oL27gWD1NO8NjVuttWkw3E3yqJ/eoTJz+mjXneDK9WCE2tMTVBmt7hNuoF3qoXaEqFhWxYiP4zKOx+wMEMWTZ7jk4fsoD6Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rhw35GTp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cdIs0ria; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rhw35GTp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cdIs0ria"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6795d4Ya1915541
	for <linux-arm-msm@vger.kernel.org>; Sun, 9 Aug 2026 07:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u9A+N3vswNwqlEvI9hN9dHwgwhpH7l2bTh7AROjVHzw=; b=Rhw35GTp1rL0eC+c
	q/x81HUB3bVrseoi9jEAkbF4RROSvbJdcppPdXIGmF4kxYO5jhjqa4VxSMXKb9kf
	WcJyyoWECY8UkqSgGf8y/Blw6AyFoqCXfX+jNYk61fHXbZS28+LcfZoPkuMYTWXN
	Tx/yXRI93JaihvImfD3E/iXv0BKVoL3PYzErb6hgUiJzHaQZZJxl+8br+nNAU6bh
	ZCYVd2uZ4WbxfBIceFMrlVkw2XqHrs6CSHwTFPJrnFPSVb5ujlWEyWNY6WkDDEY0
	jH51jYa8oQA1lUtaekqGDjIIvhcBWj3MRcWQuPthp5jmUJY2IZqkc37nGi+4MnYU
	pGK9Yw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwstp2sbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 07:28:24 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb74d5db64eso1140723a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 00:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786260504; x=1786865304; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u9A+N3vswNwqlEvI9hN9dHwgwhpH7l2bTh7AROjVHzw=;
        b=cdIs0riaylP/DDrC6DsTUr+L6x/stIQ13s8t6zlFPWo95J/k3zWOenZZiMxS8ukOun
         YQbYUWPz0zLaxrR56btCF1OQy1qPRCB/bCpTtYUWkvL2CtwS6gdP1lpEefhxnaEuTuDS
         OGDt5zOauad4W8FLhsDMD52zuv8eGQa2fidpT6esKvzlEzvWVs8IcYeKjc0dSbfkC++o
         hji2X/BZ38RY1o/5LkRroPLVJDFOuNfj/k/ha12xm4zfHbuWJAkkCO4uEuMNVllpPy8r
         Guj5ZZe70ePEkWNfNeZJmkRpuKhy/V763iZzLFwtcv1LVfcZ7W6jXrOLq+FCu9oIpU0A
         ewaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786260504; x=1786865304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u9A+N3vswNwqlEvI9hN9dHwgwhpH7l2bTh7AROjVHzw=;
        b=gHGCt936Iku3IPJnAjPpoCWX1PX14yXMBoNwjJuKYo/BGnRjkFenZ5UAlDTbVOsaFr
         6VgNs2RFnAlzb6IYGy6Imrruy0qkrq+jZdxl5LXNJ69SfIQIWayOGUucODnLW88o1LoA
         cT4n5W8/i2+Aos8V1M1S63VIfZbvsfWNGBojZL6iU0x84pIB/ed/fbwYkfsjCr9z1DF1
         XVox9Gm7GIFKrhy9/pN8/Dl17thkQc6Tv8HmZYYyOrbSJ4afFfoIJs0SX0dGY8GV1aYQ
         jmQvxuJOuwIeftVWwlxY7I7FQ8iDGfJFpXU1ZPvhuDM5YZGvEyhbJqqBskt28aa8BVsd
         BtAA==
X-Gm-Message-State: AOJu0YzGUgpgHhd0VFD4/XTYY/GGdHNhwY8lgcCCYA4Cz50ULqrpX7V0
	U/P6HMJtIQUMu2X3t6Te1EuXfEzjtcDEkxRfGUFwnEK2n+SXKyNjKDSHM3Jq+fzynfhmZgPYIn/
	VEQ/bf91FROm+7mtZMijch3ZHq2D5yqHH/GNDnbs7pd8RzFlCZEYpmTQuXGDUO04PW8Yr
X-Gm-Gg: AR+sD13nDzkrSsUyNhS79z3lcfP3+GErJmLt7N4SByCq3h9aOpxDYNm0OteLW5rwPho
	VVK5YrcHlrwRnzcoXFZ5sjrEzftaDrMHp8NeC5qsbDk52V3RdGotAciHcwoRtFBDo0KKL/JbUze
	oYvrEX4anZ39AYlwzzXIlmgTOu3j0IqTTYqpeUut+6QD3y0+3c5LOrdHD0F2TaXVToQXMwIvMGC
	t3iYt/TeXWXRwaIrmqNaMmQD0Y4rDh48/WNjgXaiXWJwwEp0ryngsojKayyK1nkC6URaMpvtVgI
	94QFXsaePRsVFHY2X0cxmSBVCo+ii63B1EqtEMW7ZtZ8HSM+z+ghP/hfDGm45SXtrYukvqu64cK
	km3++mJ8W+woygv/dI3eXrlPm+mkq9NtXHwIr+5vz4V/jbrV+KhGd0BLXRj8f/fHeadqyhG3rrI
	E49GYUBjfY78jIRr+Ci5N/SZ0=
X-Received: by 2002:a05:6a21:10a:b0:3cb:b5f6:43d4 with SMTP id adf61e73a8af0-3cbce8e53f4mr14830463637.23.1786260503855;
        Sun, 09 Aug 2026 00:28:23 -0700 (PDT)
X-Received: by 2002:a05:6a21:10a:b0:3cb:b5f6:43d4 with SMTP id adf61e73a8af0-3cbce8e53f4mr14830433637.23.1786260503439;
        Sun, 09 Aug 2026 00:28:23 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4eabsm22655630c88.6.2026.08.09.00.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 00:28:22 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 12:57:07 +0530
Subject: [PATCH 08/15] dt-bindings: pinctrl: qcom: Add Kuno TLMM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-kuno-soc-support-v1-8-5e0ede4a0c72@oss.qualcomm.com>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
In-Reply-To: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786260433; l=3887;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=M3+tCJ2GKEYW3mlHIPKwiHldQ4Hh7V8oaKeisYy8F+E=;
 b=ydBrbHA9y6IgBWVtAyTRdFzQMxwslQbFacEbRQhMzgINtpQwqa6rpn/uSYyWdcYPVSNHoMYrs
 U3Ki3cWca+BB01GdQ+eRDKs2PnsoH+viY58tdlFjViSYBYP5mh97HMo
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-GUID: AWF_awMZJziZ1r5HUVtA5qWF8EKI7s0d
X-Proofpoint-ORIG-GUID: AWF_awMZJziZ1r5HUVtA5qWF8EKI7s0d
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6a782c18 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=CaveSyEksWnKhASb3GUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfXy7ueoedf7Bhm
 GDRGNqBM68zIvPy7Tla1FKfd1KCTws672OkDqr01l8X8hYhvFf/QKkrYUXkZOWWzrF7FDtEnJCT
 j71lJxQ7TTNZPjZUwLya/RK3jdU25LdOc9e+cznsRx0lvGB6eZZADDPEue8XiHeWSeEp9zqZ3kD
 WKE89pTcs4HMVFRh/IBcs4X/Jy6jlRC/H35Q9jENOItS/YDhuxDUlAKXoHxIowRSItsisfl2cJP
 iIJqsmSo272Ji5iQv+JUGkAyAu9osmmuwmM21E93Umebh0oAd2UA+mPhA0J4GGntIiI94Oy6bfK
 HTSYV2BahLNW0192+ANwwnYaC4WW5b6nsCbvrKffBHWA3rdVW5DceK7yQPXmJNcNENzJO92qq57
 XlcpNu9x3blCzAY9lkExFPS2SOW/T/CKjsbRoNAVoANPl+VgPDspGptamITZUWQ+fCaYfaM6sis
 yDMvl7TNVPQXsGJpoqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfX919ulwflpnHm
 L6h5WuLnZuRV5efVGPhSAwj9WlBfxer9VirDcXOZw0OHrZQp/vDBzpeB9tYh5jcEY3hXX7MdbzK
 6TSOo9YG8lKWv+F7xzVga6ySePxveCw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608090063

Add device tree bindings for the Top Level Mode Multiplexer (TLMM) pin
controller block found on the Qualcomm Kuno platform.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,kuno-tlmm.yaml           | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,kuno-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,kuno-tlmm.yaml
new file mode 100644
index 000000000000..6db65d2e1c23
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,kuno-tlmm.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,kuno-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Kuno TLMM block
+
+maintainers:
+  - Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm Kuno SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,kuno-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 55
+
+  gpio-line-names:
+    maxItems: 110
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-kuno-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-kuno-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-kuno-tlmm-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          pattern: "^gpio([0-9]|[1-9][0-9]|10[0-9])$"
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ gpio, audio_ref_clk, coex_uart, ebi2_lcd_a,
+                ebi2_lcd_cs, ebi2_lcd_reset, ebi2_lcd_te, emac_mdc, emac_mdio,
+                emac_pps_in, emac_ptp_aux, emac_ptp_pps, gcc_gp1_clk,
+                gcc_gp2_clk, gcc_gp3_clk, mi2s0_data0, mi2s0_data1, mi2s0_sck,
+                mi2s0_ws, mi2s1_data0, mi2s1_data1, mi2s1_sck, mi2s1_ws,
+                mi2s_mclk, nav_gpio, pci_e_rst,
+                pcie_clkreq_n, pll_bist_sync, pll_clk_aux, qdss_cti_trig0,
+                qdss_cti_trig1, qdss_gpio_traceclk, qdss_gpio_tracectl,
+                qup0_se0, qup0_se1, qup0_se2, qup0_se3_mira, qup0_se3_mirb,
+                qup0_se4, sdc4_clk, sdc4_cmd,
+                sdc4_data, sdc4_tb_trig, sgmii_phy_intr, spmi_coex_clk,
+                spmi_coex_data, spmi_vgi_hwevent, uim1_clk, uim1_data,
+                uim1_present, uim1_reset, usb2phy_ac_en ]
+
+    required:
+      - pins
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    tlmm: pinctrl@f000000 {
+        compatible = "qcom,kuno-tlmm";
+        reg = <0x0f000000 0x400000>;
+        interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 110>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        spmi-state {
+            pins = "gpio78", "gpio79";
+            function = "spmi_vgi_hwevent";
+        };
+    };
+...

-- 
2.43.0

