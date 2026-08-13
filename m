Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9A238E8B9
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 17:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786642423; cv=none; b=Y7Pi5NjXQwRnrv09cBZt/p2A0us8M4oMKOHd1zuTuFaWZtZ2QJJRD1z5FBM9acw4xtvQTQ5QmzuybSUHuWt72ec+yo+lZUTuPGZGVCTP3W3fTchbrCrcYVa8G0diRtMWFm2a3su7thyfm+dwPM6Q1RiveI0N5zT9Pc0JQuvQNmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786642423; c=relaxed/simple;
	bh=ozr6jJHNW4AQjukXGrFSF3vNo012BbJj6dwNTaMFLo4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PKebwp6BFPC18G4OXHTlZByOfw2Y5OniSIblskSQDuotc54jbnKNCjcxdyiU2+UlsEcfNLiHkSXLQuoX+vK36xJ+V4OkvANcEQVB8rTC1hN+H+Jc/+IiTRzReoXWhTK1zZ/OV6jL3b3pht/WwkhdTrvcWk5nsCHe8ga7uuEBUVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oG6IRTIM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HMAUgoJg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oG6IRTIM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HMAUgoJg"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFU1It2374722
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 17:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JU1YA3HJfX2gEXKNr2es23LDHUOXmyQnl5DasTgwhmM=; b=oG6IRTIMvDHb29lN
	qkVo+tnFGqsDSV5iKPOFn1c6ZQ9OHJuSIqBD7PZ6em0Gw9jVPSrIFxAqSHTWfSAD
	1rg2fOy4atnd7dDtpJNIDGn9EdIS340+ZphrgDuKYvFC/jqpeCO21G4arjguHI0D
	mlD8+HWcb0GXkm2zCntxhaqQRzef+8PblgkAB8e9bYnvPQQy3abWrcFUl6st4Inx
	MG3xaajC6xOXNdYBIPLdbSWHIRLKDYovahTpNI8cxesTXl1nnHwrRlGBIe7c3EvB
	+o9mqbicXxKslFpx6FuCmYJcwWnQxZqddbUCXi7HtBFGqrQe4fOIcEi3d11pNREo
	/6yUxg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g14sykrj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 17:33:40 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c888c687c21so7199a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 10:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786642420; x=1787247220; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JU1YA3HJfX2gEXKNr2es23LDHUOXmyQnl5DasTgwhmM=;
        b=HMAUgoJgukhYgS/zDtyVlx6IS2rbCaabHdIqCn1tI6uPpEU5PQW701zuEHCUGgaS3K
         5fm+uzmI6tW4SYruKidaab/a0N5Rk/57iEd5oHHdeWEQcdpFAkWd8xBuE7SSRsLbbXd1
         /GMRq0IMc6hYrR9gMRA+ILJct/m1UJEpjeZSlCzdh5vQIXq6+C6Ue/1W99mTRwi5dGKg
         +CnJEMyPwhX5hKvdI0bF4WQObnWzwI/ghWlrpBE6WvW6sLlw9gh7FHBq49YU2aqwOJl7
         6wsI+nTiXCq3CExDcaoyT9vhnqoIktFGq/io3g0qEt7FVfIy6gK0aOz0dojAm5iWwqRm
         Qshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786642420; x=1787247220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JU1YA3HJfX2gEXKNr2es23LDHUOXmyQnl5DasTgwhmM=;
        b=Le5wmr8PriUltDeNB3sw2HpjMcL13WUUBiPPSRoISCxRBRipIugwec80JBsnlgC3Kn
         iEvCg+hWRvV5iRzS7PJylSZMSKR19cvYj1Ys/iFv0xa2L6Ak/Ria3r98WwGYW3+NpIrg
         cvmGHvVF0jn58d97IYmmWI3lDMF6yBSNNdjLLGiQUrgPuK+wfwCV8oUpdET+gFs348/y
         6AtbLuorIJ1Vgb+zzD57mJsCjBIioRy929tGIRiks1KZX2AzHkHN2dNAhZqvyX4oQqfz
         dc/L3ReOG3ZWhuiOW2ih6+oQ9CkLyZBxcm+uRkoPa/C2rpqIV2XWgI1y0R+y8YtTTABM
         iRIg==
X-Gm-Message-State: AOJu0YzJdPVT5+fmrlf//TmHa2nK2Zr15L7+pFwqQQ6PMqiTKzu4aWZM
	JHVRpnjCQa2Nk0a4tSOgC/5/OrOHRH+9beAUTuaQi5YkNqzga3lH6psc85gMr3a8NAaELBLXiTZ
	mJYLlaHjzOhRP7r8s/hHRVdevSfXcnWaoG5RsgpAzdmEsKlSMf4k0Ww6gsTCkyR2ohd8z
X-Gm-Gg: AR+sD13lP80j/d4M2hzXTuigSwdOg1tLAaCyww0+VfKKchtu13mcyuRjwPBO11Rx2u+
	zT4jLyAUqfBhYlknd4MRmCCCayLwfzeS8KUGkdA5yU/VuPV6fEAmYer0MSBSwJIU2JCeynq952y
	6kHc8z4B8wy3mO5tJporDeJt+yRr+p4l5B/q4JOXKpci7m0sJcGAe3a9RGKB9GutoY3OxR6y6nx
	UDvt3udfdhfn66O5IuQK1dbShJ20wYA+Kq+UPlAyu7prC5quERcQnbZzFA/kRXWfmr5Yxfx/DYG
	FYg9An19QWfInuCOwX7adrQ/d1/RS+q2i3vTOyHQha7ZcgCS3Wx0YTacllspATjSzqTAOR1w0Km
	AugMwlZxEGKUCRnlI0q5UYCVpa3pgmKhE313lKJqI2MBqbIM3G2T/Yta1sm3DoYaMoDMZAVt5T1
	/3HJH3tyyi2GP3dHpG4E0A
X-Received: by 2002:a17:90b:582d:b0:38f:57f0:1f51 with SMTP id 98e67ed59e1d1-393230b1d93mr4972767a91.0.1786642420079;
        Thu, 13 Aug 2026 10:33:40 -0700 (PDT)
X-Received: by 2002:a17:90b:582d:b0:38f:57f0:1f51 with SMTP id 98e67ed59e1d1-393230b1d93mr4972697a91.0.1786642419155;
        Thu, 13 Aug 2026 10:33:39 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931cd46309sm4300696a91.5.2026.08.13.10.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 10:33:38 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 23:03:22 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: qcs6490-rb3gen2: Add LVDS display
 overlay
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-lvds-support-v2-3-6b11035e8ab0@oss.qualcomm.com>
References: <20260813-lvds-support-v2-0-6b11035e8ab0@oss.qualcomm.com>
In-Reply-To: <20260813-lvds-support-v2-0-6b11035e8ab0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786642403; l=4397;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=ozr6jJHNW4AQjukXGrFSF3vNo012BbJj6dwNTaMFLo4=;
 b=aIKL02GPeoRi4mjHZAdRbyTslIxfR8VgK0skfcnLy37LNCONZXv95QC24bFIVxIP/POAr/WT2
 UJbCOHp6mUIB//PbX8r9QmfzU0e6fXO8T1sJcAKtsq8OoT/EUTqxWfH
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=ZcQt8MVA c=1 sm=1 tr=0 ts=6a7dfff4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=iyE8_RcjCA9vqETsuM8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEyNiBTYWx0ZWRfX0Ou4y80PmhOY
 mVByo+v+wXkZFx+WRSlU7bcvCArnLGRzNckQTNzIyoW/jDfEADL5w/gREpQPKgopI/JkqRlb4GQ
 +6sNMVPpSShQXDkVFnchItsBjGgWeDIRM3QXewnp6K/OFvHkxGgSEhJd6xdXghQfoA8G4IwJ9gG
 8v7Ddc80CD4A3Tcpy4vkV8Tns5/HnyoYT5u4atXiTZuV7ViTwmRdbYcyqgY4xDD0sH/N240Vzgz
 3v02VyPlfDgCB5NJwAdg78shd5sAoU6q3i8Q4FuN37bIUhD4bxOEnPxGHzzvnlkT0yZ1LcN16MP
 S65PdgmsQFfT8SRlaaFllYfJfu4nR58i6CIEV0sP/dDbw8CHDYdYJqLg+dN7A9zb2Q+A4MYxJIx
 /42c7761XZ17qHQ8cb1TxtoOJ3IKBw5gvvcuhnJ9ZpAPnWN7M8CQVd2TGaO/jfIYPmdphhgLubp
 GrsFPw2Rwy0VabKYIOQ==
X-Proofpoint-ORIG-GUID: s8zygQ2up9Y1-JiNn80ouJMc3ZAd6j0I
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEyNiBTYWx0ZWRfXwqMc3LILTPT8
 64lwYyW9aSrnJqYGNuFKAMuTfzBxpO/LZ0cNDQZmx/8bo48k4/Dke2yj3lXIqSGXeXeAKra8PpT
 8/mV6RjGx5q/f+j929YcoabahERQq4U=
X-Proofpoint-GUID: s8zygQ2up9Y1-JiNn80ouJMc3ZAd6j0I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130126

The QCS6490 RB3 Gen2 industrial mezzanine supports LVDS display output
using the Lontium LT9211C DSI-to-LVDS bridge as an alternative to the
default HDMI output via the LT9611UXC bridge.

Add a DTBO overlay,
qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso, that
disables HDMI (hdmi-connector and lt9611_codec) and wires up the LT9211C
bridge on I2C1 (address 0x29) with reset on GPIO117. The overlay adds a
dual-channel panel-lvds node for the boe,dv215fhm-r01 panel, matched
against the panel-simple-lvds-dual-ports binding which supplies the
panel's size and timing internally.

The overlay is built as a composite DTB combining the base
qcs6490-rb3gen2.dtb, the industrial mezzanine overlay, and this LVDS
overlay.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   6 ++
 ...industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso | 105 +++++++++++++++++++++
 2 files changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 85ee28d8f109..8b147cbc0e1e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -189,6 +189,12 @@ qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vis
 qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
+
+qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01-dtbs := \
+	qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo \
+	qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-minipc-g1iot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-rubikpi3.dtb
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso
new file mode 100644
index 000000000000..8e60b8631169
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	model = "Qualcomm Technologies, Inc. Industrial RB3gen2 LVDS";
+
+	hdmi-connector {
+		status = "disabled";
+	};
+
+	panel_lvds: panel-lvds {
+		compatible = "boe,dv215fhm-r01";
+		power-supply = <&lcd_disp_bias>;
+
+		status = "okay";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+				panel_in_lvds_odd: endpoint {
+					remote-endpoint = <&lt9211c_out_odd>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+				panel_in_lvds_even: endpoint {
+					remote-endpoint = <&lt9211c_out_even>;
+				};
+			};
+		};
+	};
+
+	lcd_disp_bias: regulator-lcd-disp-bias {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd_disp_bias";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		vin-supply = <&vreg_l18b_1p8>;
+        };
+};
+
+&i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	lvds_bridge: lvds-bridge@29 {
+		compatible = "lontium,lt9211c";
+		reg = <0x29>;
+		reset-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
+		vccio-supply = <&vreg_l18b_1p8>;
+
+		status = "okay";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				lt9211c_in: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				lt9211c_out_odd: endpoint {
+					remote-endpoint = <&panel_in_lvds_odd>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				lt9211c_out_even: endpoint {
+					remote-endpoint = <&panel_in_lvds_even>;
+				};
+			};
+		};
+	};
+};
+
+&lt9611_codec {
+	status = "disabled";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&lt9211c_in>;
+};
+

-- 
2.34.1

