Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A12E4BB292
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 15:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005005; cv=none; b=HxAYX81KcwkPqwY5OqIc8GVQe0e5fyQArO73D2uJSyE6c0dtbRJHvnEtrpgYM55mpSrkw2YrxZE4MOpuDeOUMR2JM4MMlFI7Gb64Ic4y5PBZQhdiSscfb32k6YTVpvSbA0LOQs3GlC4C/22yur718yY5WMmNAvmgOSvw0ZjN+bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005005; c=relaxed/simple;
	bh=Z6cS8aJK/HbBm0d7OT7Xq+/FQXVHHZKwWRt5CJiiGpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ncnT+Qvig5+WV8Y5jP+z0kXy+xjx5Qb9csAT97mO1svCY6/7N0ep1bAsYX5A3mohDKMjXEGOVyE5zVx84eTUsmo2vEZQR2W65HfmfeAC+QcSgvnuhnjCF4Adj9uaHUAEAHCtklSJMQIDdoJ4Nx/9SZJg/Kz8VAUcIs66yQcGvb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n6FyLu8b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PKeMEYQQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n6FyLu8b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PKeMEYQQ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFA8h4827749
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 15:36:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=; b=n6FyLu8blSR0foVq
	M6sxjbQJRCDeuqQRZLMgjpIbW3TLMF+hkkRo7ZlobsCcehIlHx4BaQ72jWyzpw3Q
	EYIIk2/u2r4dyy3C8LzqhVzdD1eFceotWayOUWHpR9lwQNjg21a+Tw/+1HKeFywP
	tF0GAV1ohHZ1V58JkNvaFte8U2TwYeHowhi3Lfsb0+ViywgWn0KsnqkyqOz34ZX+
	HSr3k6OZDQR+tdVeXsQX1O4PcTIjiiNXDmjT5rntD+fRp7zKmK1wsaDaviTej+ad
	byyPRUuIYy0dHlBGCff/+D/1O8yHaJOiAVgu6gTY9tTA8EnFjNLLyyxF7Xmrliy5
	mmJgtw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu17gsqmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 15:36:42 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78580a6b2fbso873332137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 08:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790005001; x=1790609801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=PKeMEYQQBHrAYPoobmsHPRtT0HRTn5GIEdjSGF2OrQtXPswPzy7YmG+KFHMhw/RO6C
         HuIzt7BU5CvRSCLp56/gG2RGr9t+QOYUbM+RGQEotTw9SOUFsNTAlpt1+2mG853pjCCH
         VCMtyNlArY4s9IDP/kWRury2tzxY+MVS+xUEDQvq5tIaAhAkPThUjfd4JVraxyGZW4Oz
         vHpWOzgjs3jEOhI6dLqSTGQNQtvpLDHWLS/5ew0T39dsgPYFS26wBaYCiKfscfPfBoba
         oSVU5VlerX2v7ZZk2yWrvcARu+oQgtqdWj1X1fao6+MSWbLWVS0e5eVOqxGaRudlLLda
         mtIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790005001; x=1790609801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=ClvODA3EZvWMTcxWTR82uHWvvAbFR5Tdlk021ujj/3V99lEph8dURXyrbjpNcm/OKz
         /TE95UC0/+vKYi2JXGx7xywkZfqveaojaaiqlDgb3xfoEMMld5gPOitIcYP2SpvxFqIA
         Zx665w6s3qB3nBrSPF1L8/zTfRIeNYfexLmd1oFPaHNYaNDYqxwdqL2VxCNuPOw+Y9hl
         wgnW1Kcve0UwHpK3l7IqxwSKYAIiOcKLSxMwK7Awah2JHYpBzQjRFBY3IXziOilZVzVp
         +oJbdImYYTgXrOHsEwcNUuhp7FP4tczLcsbo95T7aY8VkAckhTsA/T4qusDzRuDgvphk
         15xg==
X-Forwarded-Encrypted: i=1; AKwUvBzbFLCnjMehWPBZLeCk9ePjC9fpVnN/5RxDrZeTre6O5EUads2Cl3w6+ayJQu0GYbSs/ioqYiCMGauK1Vv7@vger.kernel.org
X-Gm-Message-State: AFuF++k1h2NXto8cDtyVsA+P/m2y8K2kkIhMNDRP0cbHeEYzyEY19y7+
	Fqh8j8aeVirENXO8F7EUveVyhjn0RQ5BjNgX4XcIsvbaerpLcqV45Wl7H7HYs4guiuD2acwi4Gi
	JbZkq6Te4DB8WbVTnZu8GikNEJ+6ESv11WxHWRRZJDICfitc25Rkd/EgAJCSXOrnIcpOo
X-Gm-Gg: AYBFou1wtAjCrh472w26QaukIJ0HKhMyZibFY3vs5m1KvUpLXDOqsAdmuPWXlOvsgMC
	ypDeHk4d0hBYMzZHaJrDeRmLg3gvEnyIw/eE2okJFHCZM+g+Ob1UCa9j+hVRRXMdPl/Euvb1oue
	GGZL+sIXsDTDz0lll2NXIw9i2tdecklbFP6YJqEBmQUs7UbcLa6d6cqDxv7kOyFRTc2bcltzn/z
	D+/V5XhDrp9Y1wK5+XiI5Ej7iqL3F1ogg0WN8ihtVldaEVbLnw8kAo6GNKA36pn15jeeH9W3TgM
	plyrG6zoPZX0C6Na0Ot49SEmIvtPdTPvLB6xm0rL+a3GLZiMCM+Bsy7m9rVoCtIHwL4Yill8YS7
	qglsFfJTeTi04UvrIX7fkIpJi7+nhm21w+YU+waHbPPUOg/EzKjWHWNDz5rGXeUqjrfpLD6Nsic
	TKuIhhP3Y8nv2v57yINoUPXU/7BX1E32W64L0IrTbnt6KwD+p7KBo=
X-Received: by 2002:a05:6102:a46:b0:7a2:4b76:6b65 with SMTP id ada2fe7eead31-7a55d69a2c4mr5106492137.25.1790005001088;
        Mon, 21 Sep 2026 08:36:41 -0700 (PDT)
X-Received: by 2002:a05:6102:a46:b0:7a2:4b76:6b65 with SMTP id ada2fe7eead31-7a55d69a2c4mr5106428137.25.1790005000601;
        Mon, 21 Sep 2026 08:36:40 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d5b5:76d2:82e3:e5fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd07bba7sm231054065e9.9.2026.09.21.08.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:36:39 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 17:36:22 +0200
Subject: [PATCH v8 2/9] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-camss-isp-ope-v8-2-dd1c86a3c8a0@oss.qualcomm.com>
References: <20260921-camss-isp-ope-v8-0-dd1c86a3c8a0@oss.qualcomm.com>
In-Reply-To: <20260921-camss-isp-ope-v8-0-dd1c86a3c8a0@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: XZ5fYgO0d_rpeUATezlmaOg7o7OoppYd
X-Authority-Analysis: v=2.4 cv=IewSymqa c=1 sm=1 tr=0 ts=6ab14f0a cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=l64rWm3OqFMOLA4dSg0A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIyNyBTYWx0ZWRfXwII2ortRZJky
 T/yqw8s6l/jYoP6cJEYexPGsVD/688gof5N6+bJJCACQ43nIkJ18CYY6OOPCLt62ICs1W/usCwj
 RccpkNB3PTPYfnOBA1zp3XeNqweG9XUZXDWypEQcKdGTcRqpWnBwdcBiH559zZn74cJ8spbcpNe
 iPERmIeRpU2rldHtjBlVOd55MpWa4q+/SuvCpY1JttjpxkGkMFDnHO3QixMVEMacg9e9wrJ1XDI
 W6n1fcflJDAqWW721oxMhdQ0lrLLAiWq31Lg8YD+YBGvAP2esrPBuXyUcf53c52Hmb+3PR9bzrm
 i4dwubPeP/rc0aG0ogHuLc63a2Llw2IgFUj4yiJDMU3DhBhMNYU2ZHefjU01YOh16cXtqHuPz/v
 MYJlaIe6KNCuRUnq2IBrftlS1RtoG6whKRph8JN5m61CIaAJJctZK1JWtx0Z+Cyg3jUdeoa+0Ku
 +ubpq0QuHq1WFfMo6mQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIyNyBTYWx0ZWRfX8dVGMasxGeXn
 2MOWKsUzeLuxB344hgTXHJDLtUrKiQZJKNBVaKr83kJS8AZil5E+ejpgEiNgBCVHFkMYHKYqWCD
 0AIaCDxszTvKoqy/781zmyuvZfOcYdc=
X-Proofpoint-ORIG-GUID: XZ5fYgO0d_rpeUATezlmaOg7o7OoppYd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210227

Add Devicetree binding documentation for the Qualcomm Camera Subsystem
Offline Processing Engine (OPE) found on platforms such as Agatti.
The OPE is a memory-to-memory image processing block which operates
on frames read from and written back to system memory.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-camss-ope.yaml     | 151 +++++++++++++++++++++
 1 file changed, 151 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f9c31bc88e94b028c241060bbd8e56e0bdc49af5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -0,0 +1,151 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,qcm2290-camss-ope.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Subsystem Offline Processing Engine
+
+maintainers:
+  - Loic Poulain <loic.poulain@oss.qualcomm.com>
+
+description:
+  The Qualcomm Camera Subsystem (CAMSS) Offline Processing Engine (OPE)
+  is a memory-to-memory image processing block. It supports a range of
+  pixel-processing operations such as scaling, cropping, gain adjustments,
+  white-balancing, and various format conversions. The OPE does not
+  interface directly with image sensors, instead, it processes frames
+  sourced from and written back to system memory.
+
+properties:
+  compatible:
+    const: qcom,qcm2290-camss-ope
+
+  reg:
+    maxItems: 6
+
+  reg-names:
+    items:
+      - const: cdm
+      - const: top
+      - const: qos
+      - const: pipeline
+      - const: bus_read
+      - const: bus_write
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: axi
+      - const: core
+      - const: iface
+      - const: nrt
+      - const: top
+
+  interrupts:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: config
+      - const: data
+
+  iommus:
+    items:
+      - description: OPE CDM (Configuration DMA) port.
+      - description: OPE read (fetch engine) port.
+      - description: OPE write (write engine) port.
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+  power-domains:
+    items:
+      - description: GDSC CAMSS Block, Global Distributed Switch Controller.
+      - description: CX power domain.
+
+  power-domain-names:
+    items:
+      - const: camss
+      - const: cx
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    camss_ope: isp@5c42000 {
+        compatible = "qcom,qcm2290-camss-ope";
+
+        reg = <0x5c42000 0x400>,
+              <0x5c42400 0x200>,
+              <0x5c42600 0x200>,
+              <0x5c42800 0x4400>,
+              <0x5c46c00 0x190>,
+              <0x5c46d90 0xa00>;
+        reg-names = "cdm", "top", "qos", "pipeline",
+                    "bus_read", "bus_write";
+
+        clocks = <&gcc GCC_CAMSS_AXI_CLK>,
+                 <&gcc GCC_CAMSS_OPE_CLK>,
+                 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+                 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+                 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
+        clock-names = "axi", "core", "iface", "nrt", "top";
+
+        interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+        interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+                         &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+                        <&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+                         &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+        interconnect-names = "config", "data";
+
+        iommus = <&apps_smmu 0x800 0x0>,
+                 <&apps_smmu 0x820 0x0>,
+                 <&apps_smmu 0x840 0x0>;
+
+        operating-points-v2 = <&ope_opp_table>;
+        power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+                         <&rpmpd QCM2290_VDDCX>;
+        power-domain-names = "camss", "cx";
+
+        ope_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                required-opps = <&rpmpd_opp_svs>;
+            };
+
+            opp-465000000 {
+                opp-hz = /bits/ 64 <465000000>;
+                required-opps = <&rpmpd_opp_nom>;
+            };
+        };
+    };

-- 
2.34.1

