Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CED5382F07
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 12:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785846803; cv=none; b=CARCfFNINqWDQIcYc1HSnPInukyEualq1DDzbWfkF/enGzU2qdwU3UnkPuL6tlA4Tn+ni3gqbXnNPbt2CWvvoBBZ5jmm1VN4eG/e7FjenArKFePrYIYrdSyoCJXYB84iEQmRtsPXWe9AK2L7OK9T+5ZX2KgiqgHihllLTsptTi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785846803; c=relaxed/simple;
	bh=7KrZQ/NlGj1MWa2YU5pm4cuN5AXuJsIrNe1OF1KGBEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B0JGUKOzq7YGVpch2JHR5tbzLycmK7wuM/y6/S7dVvqyZqVLe0qh/UyivxsH/CydI87d80liIWT48za53m2UqK6HSpJXHV31ZSGB+c6fTYDcePvBH7sBG0jkD6o/kh6hs+x9FKabnHuwMm44poHNe5Mn2wjUXc+1jg7whP7OH64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XjoG8TKw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HsrQm+i8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XjoG8TKw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HsrQm+i8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674CXKHr185334
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 12:33:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rxCVYVUNQmMUQQMCkSnXOjCofEZwWUb1f5DdnxniEIA=; b=XjoG8TKwOFWx2g77
	Smjh/EdvIJDkL0ajYIAl5oHPAGYMkIGizM7elnS7A7p7iq52jFWEfB+Y/YF6ofwX
	BkVdm6iSt0zDsGHzISCWp0X81spML3U7wibP6NqTVbKq7aU3FowDc9tXf/egHEeJ
	7j8jDqWE/JXFY9WNWUr8P1mfnkPdZXfN5ILTzSBdIaaGmODBCVT6SzNQATZQHUyA
	wuMQrJv2qhRjP2wChlj9bVKoX8Glf9+7d0MMzUysVu9dJ2Wa6CuD2Iaq1zYcx2qj
	u70VczQJ+z8TJoPn0coXluotOzQ4/k8NPONvR0XIRF6R8dlDOrpGnx/V6KQZF6mr
	fD1ygQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu1p4ug0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 12:33:20 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4940e68ef7fso411370b6e.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 05:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785846768; x=1786451568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rxCVYVUNQmMUQQMCkSnXOjCofEZwWUb1f5DdnxniEIA=;
        b=HsrQm+i8Q1ulFU4FUYcU7jT53l+9WuTBzC1QRi62oi2aUFwR4zYbOL1cM7NHDh4OaJ
         Yz6+W3HHMb/cXXHd4TIxFdDvqYdap6ickGQylwRxWqMleDgj0XyNywupifELONVsuUC9
         sXjZj9BwORzrczVjfqV5O0Cp4gzL8Okg9cnKbZFfHEHDH6kc2dYEcO+nXubud4WqN+/J
         58qn1GS9DA00ZxJEeC/6m55ukLwfeOuKZn5GJgoWJjshOhfw6trc1pTiytpCaIvJsDDS
         91O/lXsUBGZ2MC/JWYUsChWZpbAx1KYNZXoPLTAFmS4UCEPpHV1q5fBWV5x7wgMFI/qz
         ga9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785846768; x=1786451568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rxCVYVUNQmMUQQMCkSnXOjCofEZwWUb1f5DdnxniEIA=;
        b=KsOFe/wlv1+frtWFod+irext3Nxvd8i5941HqgRN/tor5kWV2i+QW65tO2qExgMm8Q
         1Ua123s7QUrmsM03bpUI/UsRhXSoE7SYbaHS2QHGSPwflVq2P5OpVNZVa+or0rK4S0Gi
         Nz+FzGTC+tbdjcJ7TDrkl/9SUseCdyg7QtQ9L+go7bVS+Uk2Hj9/hup2TlKTDOCUrQc/
         b3/Yie36EaID6L0kNui1DwT/cccgUY8jUJ5OYt4eu8f3BdX57jBW+x2ZbgI+clidXC7Y
         trLMwmxpAtQfV06IjcxFf2vWk+SgCRRlXMji8fZ8VgS8gZBs75WuoQfsL2rnBFyc4l+s
         u4Sw==
X-Gm-Message-State: AOJu0YxFo1zmvC7MdM4m22AcHzZWUo0pxrKEQ+qFBg1rDejqBEPmh7zG
	0lOekabZn5Hxhpvb13fqDPBSH9f5Be9v/VUBccrxC3pXzQlVCC8Fh1tAhXRNI+eq/AvHmCyl6tp
	Rts462Gcdky9B0wr23dFCNYCX6KV4YtHh9/AjenrkuBgWu4fXXzyDAESLd0iq3m098tls
X-Gm-Gg: AR+sD1261WTyRhNvt5NC/UgArEZ7i4rjdzKVuZ5c+CbPHXFobYXcKPostSnUv01paVv
	AzRdvjE+Me2jrcb5am40XN74O3SMYFEIhu3ZZ2a9McBulQmr+mtroTjF+a/5bUeA6v59C/+4s4Z
	FyCCa8Cm5afshSu7irBpSHCN27iWN1+s7ci1k5APa/yTWSKXy4gtKWZ+rdXfjnQGq0/WFzjqMg+
	ch3SvzHoBKOHluDRK1v7EBKhLZKomFW/oszgArXvBXJVPhBMLn9ALAMEASi7qZn5RO9AXM/GhjA
	ZWjuwgJMyFoBT+hIPcAmwKTcp/xy98kOaRV6S+fP4jyu21MudmAYOKk07PSzgugFLPsokzAj6xM
	XKuZAWycysJCF4VvvkSodKdoPZxQ+aTMLCP0SZ1zSQy+TlUb7oDg=
X-Received: by 2002:a05:6808:2219:b0:4a4:866:c2c0 with SMTP id 5614622812f47-4af5e25c3efmr12317419b6e.4.1785846768378;
        Tue, 04 Aug 2026 05:32:48 -0700 (PDT)
X-Received: by 2002:a05:6808:2219:b0:4a4:866:c2c0 with SMTP id 5614622812f47-4af5e25c3efmr12317396b6e.4.1785846767969;
        Tue, 04 Aug 2026 05:32:47 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458f6064d2esm12227013fac.3.2026.08.04.05.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:32:47 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 18:02:27 +0530
Subject: [PATCH v4 3/4] arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe
 M.2 Key E connector
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-hamoa-m2-dts-v2-v4-3-1b5ceac74538@oss.qualcomm.com>
References: <20260804-hamoa-m2-dts-v2-v4-0-1b5ceac74538@oss.qualcomm.com>
In-Reply-To: <20260804-hamoa-m2-dts-v2-v4-0-1b5ceac74538@oss.qualcomm.com>
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
        mengshi.wu@oss.qualcomm.com, Wei Deng <wei.deng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=auOCzyZV c=1 sm=1 tr=0 ts=6a71dc10 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=sIvI8tPoeWXx_RDIuOMA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: tntiiDpnfxVDz-RtfLgQRy0ZYcT02Jg4
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDEwMCBTYWx0ZWRfX57REiuyWbps/
 CRTLKGUZoQ7CtuXFCk4afGh+E7ush/3KfQgB3W99Tu7oPjBirN85SUA6zBQb45zSXG/0gItNSU5
 qxJ3ksu3ODpxN2GU/Qkl/CoC4PoXgXk=
X-Proofpoint-GUID: tntiiDpnfxVDz-RtfLgQRy0ZYcT02Jg4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDEwMCBTYWx0ZWRfX6nbqDIxwt/pY
 SmOc/fp5h8CMf4ona5cx7dUshA/a+b261eAFGyXwZ3COW4WwC2Iu7eeuzpj0QlkXX+VwDIE8Rov
 RfOLKaHw2yz6LPSJKcswsPr0Tq7TB+YLfx3C/aBCIatcKZm9Hn8V4Gl2cY8WFkxd/2TBbWc+GrW
 3t+JhslW+BdRD+rJ8knMZcDm1ofPXvQ+Rc23ZrPUdZ0HRKnpjb7P5sPzqHxalRAtzgkG2EXOkAW
 TJm2QoY6fmDOmv250mfdu7e0HOggUux3WRGbC6tScJk4RCeMdLNP0kjLuxd6aW57/y+C1iLoVIH
 Y65jOt+JVZN4EPWbZRPbeTmoJOQ/NRAaAIf7vFEuG/GFv0gu6nyOCT/xpHX1f/umsORJGNMt1Ky
 MEHwRETT5ILmYVFppzkqdRFkJj891VBaGoiUNQNgjjTu0BxtbPsGN5sDf9RZpj6siiBVEWiIxJh
 3h+3obX0ijnJ+TuOs2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040100

The Hamoa IoT EVK has a PCIe M.2 Mechanical Key E connector for wireless
connectivity cards exposing Wi-Fi over PCIe and Bluetooth over UART.

Describe the connector node with:
- port@0: PCIe for Wi-Fi, linked to pcie4_port0
- port@3: UART for Bluetooth, linked to uart14

This allows the pwrseq-pcie-m2 driver to manage card power and
dynamically create the UART serdev for UART BT variants of the M.2
card.

Remove the chip-specific wcn7850-pmu node, the static bluetooth
serdev under uart14, and the wifi@0 PCI child node, as the M.2
connector approach replaces WCN7850-specific power sequencing with
a chip-agnostic model.

Also remove the now-unused vreg_wcn_0p95 and vreg_wcn_1p9 dummy
fixed regulators whose only consumers were the wcn7850-pmu node.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 130 +++++++----------------------
 1 file changed, 32 insertions(+), 98 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 9fa86bb6438e..776bded3a312 100644
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
 
@@ -677,64 +651,44 @@ usb_1_ss0_sbu_mux: endpoint {
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
+	wifi-bt-connector {
+		compatible = "pcie-m2-e-connector";
+		vpcie3v3-supply = <&vreg_wcn_3p3>;
 
-		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
-		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
+		w-disable1-gpios = <&tlmm 117 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&tlmm 116 GPIO_ACTIVE_LOW>;
 
-		pinctrl-0 = <&wcn_bt_en>, <&wcn_wlan_en>;
+		pinctrl-0 = <&wcn_wlan_en>, <&wcn_bt_en>;
 		pinctrl-names = "default";
 
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
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
 
-			vreg_pmu_rfa_1p2: ldo6 {
-				regulator-name = "vreg_pmu_rfa_1p2";
-			};
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 
-			vreg_pmu_rfa_1p8: ldo7 {
-				regulator-name = "vreg_pmu_rfa_1p8";
+				m2_e_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcie4_port0_ep>;
+				};
 			};
 
-			vreg_pmu_pcie_0p9: ldo8 {
-				regulator-name = "vreg_pmu_pcie_0p9";
-			};
+			port@3 {
+				reg = <3>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 
-			vreg_pmu_pcie_1p8: ldo9 {
-				regulator-name = "vreg_pmu_pcie_1p8";
+				m2_e_uart_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&uart14_ep>;
+				};
 			};
 		};
 	};
+
 };
 
 &i2c1 {
@@ -1024,21 +978,10 @@ &pcie3_port0 {
 &pcie4_port0 {
 	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+};
 
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
-	};
+&pcie4_port0_ep {
+	remote-endpoint = <&m2_e_pcie_ep>;
 };
 
 &pcie5 {
@@ -1530,19 +1473,10 @@ wcn_usb_sw_n: wcn-usb-sw-n-state {
 
 &uart14 {
 	status = "okay";
+};
 
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
-	};
+&uart14_ep {
+	remote-endpoint = <&m2_e_uart_ep>;
 };
 
 &uart21 {

-- 
2.34.1

