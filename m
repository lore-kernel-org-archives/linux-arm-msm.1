Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EDB43803A
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800604; cv=none; b=YpjRF8051NhJfEUnJ5QAxhfQ7gycpePpA1Ix7i0kkRYRCdUv9Mz8mPXdZgTIjLEyDo7898iN9RarV3/I5GO/wyjaVOT2GvZF/of83Vo1kqw9/eONzXxAkve6MC9q+XwOOtkO6G/TGa/Aa3gZGAhSSo7GodMAFE/JVkjVO9KtgsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800604; c=relaxed/simple;
	bh=Dtc5t/6tjOrrYD0NTw90IlMbafbEfYvVnCwzQ6lSxso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SuDfutoCTGbOgnrLwwhV9SRCvJgfoJt5bk0aAuuoag06qvQBkH5IeNPJ2keZ+VgA+m1wagNcon88XHUQqHsBSwEwqXuolNAW8SAlVlTt28tHPTU7aQr0cIFeZwLeM8fazcXKATfnjPJiTTGoI13Q/qqMwnp0Sjy88Bb/WXMpffg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZtAW6RYJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AppIIBkv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZtAW6RYJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AppIIBkv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8r4Pa3790809
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4sMkENOEl9Ptto8C54hlUtlhSetLaUeQ+tRceYQcgag=; b=ZtAW6RYJs9iksNaY
	mwChr19gnkElNplnGzmJaMAZ5t95hS0r4e3I/EVl4jcSW2GBJPyzQWgWozRpUDmM
	t5kNGd4znV/aPVsZlMXRWIK8t1xwdyGzMxFfDia/KZVK2yGU50/4DgAoKSBCLfy2
	ZEMVY8cBfX6l6l4G2JdW0NhWg1e1C/4q1SEak9iAyxekT+rQPNsfzvv0rIj9COgz
	FjgO8BVXRJZas8D4nyMGMgv+MY+fwQu7hGZQUOEzsLQgEWVHZrwp53xvmIGIsHU4
	6EuuEw+ApflnX3CvpC7rDHK2g95Jfg19wjsSU5wuW1hkK9xo0G6wKHMzpo54sdWu
	FlSjgQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk7b5273q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:56:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cf44f2c49bso2214295ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784800601; x=1785405401; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4sMkENOEl9Ptto8C54hlUtlhSetLaUeQ+tRceYQcgag=;
        b=AppIIBkvD/mvzzOWL00p8kzewk4riig/vPAiI5Km8nHBHTjbXMNv2dmctFMvonPlYD
         U66Yobrv86ws8B17D9Z/vD19tIwMizJLYBsVgQswFxf7tYWoKTcUxaljwZcFRFpiLGE+
         FY1M2Dp0ZnMOxoX7pn0RI0xd+djxbme3gmTFqwd/bb1APHcofqdMqj/cM+tdwuJZem4e
         tPj/x6COkGDP9EAGgAz6XMz8NP7uVg/faJJbbcNvsf4tN3xjg71+0E/tr4RRFRsGGk/r
         QSwOyQODqOdW9DdGChObSWgLupjwsfXnI0fenDzwBSPyisIH+rb/azgNScZ4h0/0muJf
         dBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784800601; x=1785405401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4sMkENOEl9Ptto8C54hlUtlhSetLaUeQ+tRceYQcgag=;
        b=AqcIfMchvfbNBKg/++8P6DekAqkYc7tnFV8Pof2GL63dwrk+GcKPrjInwJkuCKq2HF
         duJiwAnTHKf7F7pgkrdkwrzJBm2NuXuBjox9XFXljPkzdIIev/DEgvEmh9N5VAEbz684
         wuqFlgxis3h2cuTJexfGSuUPcO0d3fdJmrrBBm3cH4DsTHaqxi0wk/q6EXEE75Fizz6J
         KS5KjIiZoPdDU61Gc5cTj1uYiNY5b1/Tcy7LkC+LM6JKPSKcbx5rUPNCJ63U3JbG02Ge
         jR2NTY5jlYjOvzL56NScuNwftYu3QxXXIEHmnZV72fqYdp062rqpBKVIMefATz3VasT0
         mrZg==
X-Gm-Message-State: AOJu0Yx2d9yFHykUmYoEfTpH8zNhpNaX/ahdyHCb/M6Z3sZx7nSWe9Zu
	9se2MetxTlnPh3aGnye29YhztTopps42uCXO8snQJYd/GylgF7Sa6Kub6ACvP2Q+nnnwbDzloJb
	efojk11mVGK6J3xlSxK6cwSLe7hxsAqREse1P5kLZo5O9Fv845WYYiWpzpMvePl0hDZjQ
X-Gm-Gg: AR+sD10sDvu7uYVYOfKU1G2YXF73S99IIkuRQc7A8B+F8muiRUlZAfIT1ok+7WR3CPo
	uzB32cLTI3eyHzZNDYDcJVqMF9/GfrGCQfp6IQ2VXv66ntfoH2A5rqNdwDaY/PAMzwN9kpqfDVS
	wRXV2MPyxUWjNWjnQGOXB9S+hetBLh6zddkxm8XuyY19+8EBVxPqbQD9stagtI9GaXvkcvhfWFH
	PgFFG6GFparXy+6o24taZuox9IzirRkSKP6C7+Bu9lp9vNWDuzAGjPUvN27z/Nc4rflEA+lgIAb
	vZlADpgz/m89JuyJP3z8vqNCYLqBDl5WMbZ5icQx03S1+Bw4h+AHJwqQ3OLHzO36dMJCNLpPuPS
	OMcYPueAH1KYhx7J6l9AftbobcOFNszjeqT/oZezJevGwE5FlYT4=
X-Received: by 2002:a17:903:38c8:b0:2c9:b96a:2855 with SMTP id d9443c01a7336-2cfa6703bf0mr21853045ad.0.1784800601296;
        Thu, 23 Jul 2026 02:56:41 -0700 (PDT)
X-Received: by 2002:a17:903:38c8:b0:2c9:b96a:2855 with SMTP id d9443c01a7336-2cfa6703bf0mr21852775ad.0.1784800600797;
        Thu, 23 Jul 2026 02:56:40 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efa2cd0sm30392755ad.4.2026.07.23.02.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:56:40 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 15:26:21 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe
 M.2 Key E connector
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-hamoa-m2-dts-v2-v2-3-82254ac101fb@oss.qualcomm.com>
References: <20260723-hamoa-m2-dts-v2-v2-0-82254ac101fb@oss.qualcomm.com>
In-Reply-To: <20260723-hamoa-m2-dts-v2-v2-0-82254ac101fb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5NyBTYWx0ZWRfX9EeKxVeEvPyG
 jkYwJHSt2+q5FDf8S4XJ/z9Hbef+kiQPGWVS+Iw1EAnIvgAM5wZF77+a7TdLCO9gLPTawJMw2ld
 mt1alZMSyXQF8hkTQRaem1l9aOj5Q48TykeYbAT0Ni5Ug7sephXmafZ4Do7TFZvdhsiRlVwmHG6
 NAp2s73bWAzN+dn1srFUuMP20KV6scmpietGqC5FGRIEj2sIrsr8bvP55+67STenmjW6jPZ2niW
 bLWNHt0zAlNHlhCY0B80jfQAyYurQnM5CmXFBFHIvU42o350/rvMc2oVGLfIVjLZUipmZuc7qET
 eLzz4o65pzT4S8pGLhxr2FpzTx/0AO8X4N1S0qRcnvjYmijNH/lr0VQe1GyuRKy8UQPDO40ntic
 ELGfVA/yRKfdfFnQ696yFOXYYCTDAi0/aCTH28gjqiJW6roBCg9OeDAUUKzZN1KiVnDo05LlXWk
 Wth7A4nv306XeBWnDZQ==
X-Proofpoint-GUID: iip9vOFPv4bLvM0nKX6KrSIRLDU_-U0z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5NyBTYWx0ZWRfX5CGBH1raxHKf
 vCmFuFlg7RKeAjsInxB4nB/MdbUHGj+OhXyzT2BKgvXb0NT85/ebryRo8PpAspmbTeJiZetSfLO
 snT4w5OKyTpbp+vucJmqauR1mgufqx0=
X-Authority-Analysis: v=2.4 cv=btx8wkai c=1 sm=1 tr=0 ts=6a61e559 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=maK4k0u04xuWkcZLn_MA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: iip9vOFPv4bLvM0nKX6KrSIRLDU_-U0z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230097

The Hamoa IoT EVK has a PCIe M.2 Mechanical Key E connector for wireless
connectivity cards exposing Wi-Fi over PCIe and Bluetooth over either
UART or USB, depending on the card variant.

Describe the connector node with:
- port@0: PCIe for Wi-Fi, linked to pcie4_port0
- port@2: USB for Bluetooth (USB variants), linked to usb_2 port@1
- port@3: UART for Bluetooth (UART variants), linked to uart14

This allows the pwrseq-pcie-m2 driver to manage card power and
dynamically create the UART serdev for UART BT variants, while USB
BT variants are enumerated via the USB hub pwrseq path.

Remove the chip-specific wcn7850-pmu node, the static bluetooth
serdev under uart14, and the wifi@0 PCI child node, as the M.2
connector approach replaces WCN7850-specific power sequencing with
a chip-agnostic model.

Also remove the now-unused vreg_wcn_0p95 and vreg_wcn_1p9 dummy
fixed regulators whose only consumers were the wcn7850-pmu node.

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 183 ++++++++++++-----------------
 1 file changed, 75 insertions(+), 108 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 9fa86bb6438e..cc0c03b97f4f 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -479,32 +479,6 @@ vph_pwr: regulator-vph-pwr {
 		regulator-boot-on;
 	};
 
-	/*
-	 * TODO: These two regulators are actually part of the removable M.2
-	 * card and not the EVK mainboard. Need to describe this differently.
-	 * Functionally it works correctly, because all we need to do is to
-	 * turn on the actual 3.3V supply above.
-	 */
-	vreg_wcn_0p95: regulator-wcn-0p95 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_WCN_0P95";
-		regulator-min-microvolt = <950000>;
-		regulator-max-microvolt = <950000>;
-
-		vin-supply = <&vreg_wcn_3p3>;
-	};
-
-	vreg_wcn_1p9: regulator-wcn-1p9 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_WCN_1P9";
-		regulator-min-microvolt = <1900000>;
-		regulator-max-microvolt = <1900000>;
-
-		vin-supply = <&vreg_wcn_3p3>;
-	};
-
 	vreg_wcn_3p3: regulator-wcn-3p3 {
 		compatible = "regulator-fixed";
 
@@ -538,6 +512,58 @@ vreg_wwan: regulator-wwan {
 		regulator-boot-on;
 	};
 
+	wifi-bt-connector {
+		compatible = "pcie-m2-e-connector";
+		vpcie3v3-supply = <&vreg_wcn_3p3>;
+
+		w-disable1-gpios = <&tlmm 117 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&tlmm 116 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&wcn_wlan_en>, <&wcn_bt_en>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* PCIe for Wi-Fi */
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcie4_port0_ep>;
+				};
+			};
+
+			/* USB for Bluetooth */
+			port@2 {
+				reg = <2>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_usb_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&usb_2_m2_ep>;
+				};
+			};
+
+			/* UART for Bluetooth */
+			port@3 {
+				reg = <3>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_uart_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&uart14_ep>;
+				};
+			};
+		};
+	};
+
 	sound {
 		compatible = "qcom,x1e80100-sndcard";
 		model = "X1E80100-EVK";
@@ -677,64 +703,6 @@ usb_1_ss0_sbu_mux: endpoint {
 		};
 	};
 
-	wcn7850-pmu {
-		compatible = "qcom,wcn7850-pmu";
-
-		vdd-supply = <&vreg_wcn_0p95>;
-		vddio-supply = <&vreg_l15b_1p8>;
-		vddaon-supply = <&vreg_wcn_0p95>;
-		vdddig-supply = <&vreg_wcn_0p95>;
-		vddrfa1p2-supply = <&vreg_wcn_1p9>;
-		vddrfa1p8-supply = <&vreg_wcn_1p9>;
-
-		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
-		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
-
-		pinctrl-0 = <&wcn_bt_en>, <&wcn_wlan_en>;
-		pinctrl-names = "default";
-
-		regulators {
-			vreg_pmu_rfa_cmn: ldo0 {
-				regulator-name = "vreg_pmu_rfa_cmn";
-			};
-
-			vreg_pmu_aon_0p59: ldo1 {
-				regulator-name = "vreg_pmu_aon_0p59";
-			};
-
-			vreg_pmu_wlcx_0p8: ldo2 {
-				regulator-name = "vreg_pmu_wlcx_0p8";
-			};
-
-			vreg_pmu_wlmx_0p85: ldo3 {
-				regulator-name = "vreg_pmu_wlmx_0p85";
-			};
-
-			vreg_pmu_btcmx_0p85: ldo4 {
-				regulator-name = "vreg_pmu_btcmx_0p85";
-			};
-
-			vreg_pmu_rfa_0p8: ldo5 {
-				regulator-name = "vreg_pmu_rfa_0p8";
-			};
-
-			vreg_pmu_rfa_1p2: ldo6 {
-				regulator-name = "vreg_pmu_rfa_1p2";
-			};
-
-			vreg_pmu_rfa_1p8: ldo7 {
-				regulator-name = "vreg_pmu_rfa_1p8";
-			};
-
-			vreg_pmu_pcie_0p9: ldo8 {
-				regulator-name = "vreg_pmu_pcie_0p9";
-			};
-
-			vreg_pmu_pcie_1p8: ldo9 {
-				regulator-name = "vreg_pmu_pcie_1p8";
-			};
-		};
-	};
 };
 
 &i2c1 {
@@ -1025,19 +993,10 @@ &pcie4_port0 {
 	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
 
-	wifi@0 {
-		compatible = "pci17cb,1107";
-		reg = <0x10000 0x0 0x0 0x0 0x0>;
-
-		vddaon-supply = <&vreg_pmu_aon_0p59>;
-		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
-		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
-		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
-		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
-		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
-		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
-		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	port {
+		pcie4_port0_ep: endpoint {
+			remote-endpoint = <&m2_e_pcie_ep>;
+		};
 	};
 };
 
@@ -1531,17 +1490,10 @@ wcn_usb_sw_n: wcn-usb-sw-n-state {
 &uart14 {
 	status = "okay";
 
-	bluetooth {
-		compatible = "qcom,wcn7850-bt";
-		max-speed = <3200000>;
-
-		vddaon-supply = <&vreg_pmu_aon_0p59>;
-		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
-		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
-		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
-		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
-		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+	port {
+		uart14_ep: endpoint {
+			remote-endpoint = <&m2_e_uart_ep>;
+		};
 	};
 };
 
@@ -1612,6 +1564,21 @@ &usb_2_hsphy {
 	pinctrl-names = "default";
 };
 
+&usb_2 {
+	ports {
+		port@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			usb_2_m2_ep: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&m2_e_usb_ep>;
+			};
+		};
+	};
+};
+
 &usb_mp_hsphy0 {
 	phys = <&eusb3_repeater>;
 };

-- 
2.34.1

