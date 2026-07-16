Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684B037F728
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784219369; cv=none; b=KIiNh70GTqHmKDeHHDpypR3EDBLuLpj7GJU/wxrNN8wfjLfmrKrX7BCcr/IFegQ0bU1Ci3cphLd6tpgbsbqTgdhHZrI0Noc8G05Wj3x2zx4x2AeeqgiJZZK5V8TWEbO7Zw9aOsDsIl67EiKFwUk1evy2r94pefbgql9y/AaVwyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784219369; c=relaxed/simple;
	bh=DhEm+1JWepm2P+dN4sZDmJseyaBg9adswfAEmTRMLUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FmPGbxpdCKLFnGgIZWGuzkt+jjTkw/m154xNwhuNwjNYGy6QFK9/hg9nJ+aOcWIwOXphmUI8oFZP7Tu/2/xZLOHUVYmLIEwhOT8IoNiCFQlCN4A+5TGO3SxiYMWaZuJ4DORs5vdf07B+V1eA1Z7Jn7PlIDNeaREzAJNK4JnuIZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=axnEBJOv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jwn9DfTt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="axnEBJOv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jwn9DfTt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGSl6W3171758
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2imiRgpQB7OQgK4Ohs1pH8krBYFWXTY9Zu8UGNU2E9w=; b=axnEBJOvtOkRL+Q3
	rrpY9lm1lBkJomex19tLRF1+dX4kVdcC09g/jSkKSLoiyKBFrXycorFCEuxkxwLE
	dyqAnXV26xuw6DaFcgfSRL3JpcMoLIr6lDOdWmQynni+UOyxQQKrtbfmTlaA80EN
	f25Dk1pr8iSNQjO8KW5mlR+p8BAiP9i+hNPf1h4TKSggzbUewpZhu0oGyMQW8uGb
	ulJUCtOBA5epidVK9VbB3Q+OSnm4LD+YIGIGtBAwJb/HzhEoEM5fyMkJUlzJjJ5a
	KFAZo5iwhd01NcYLdGHqNfKMa8r0SUIEgyi/pzMd3XoCEIeJSTDr67Bx+tQJklWd
	tHwn6w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fevkv1w0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:29:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cec4226c70so89916025ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784219366; x=1784824166; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2imiRgpQB7OQgK4Ohs1pH8krBYFWXTY9Zu8UGNU2E9w=;
        b=Jwn9DfTtoBNDoJIRk8mNqcNywPtm5QTvdRAYt98YxB69IEo0ibH/+fmVvWajYYSU5R
         9qRZ6eDjfrYHOOCinaD6e8wIcsnCa0kAX6S9MPGeXmkxPsosSf90PdQ84CE5ABzlUK/B
         UihzchabeMrVqy7EHrOV4yQsImaIp6M+lxEelAGHOTRbrOvfl8eGW0qU1gGAnO+i8bdr
         ur5BEyKHZXVMTcEF9V1tlDUU3rAcyNxXN/tWDfFY2f8v2OgAyfJDekmhO+tXp2tPnznC
         ZkH+wLR/T2pNKgUMBjsF94K/Nor26O/hS4QnIZmljGFfCEkN99UVNBjT+0It8mKMXrD8
         uc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784219366; x=1784824166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2imiRgpQB7OQgK4Ohs1pH8krBYFWXTY9Zu8UGNU2E9w=;
        b=FNRx3CKHoEftA2efxXgqJuaeYmuY46g/SNiZaJ/dgeh3j12X9tgWxviIW43m2aJUD9
         1T+LuayrN7RtSBjhoDFplxCqxZEsOt2Ul2zDuwf/snPJwJfDcFzsmEr7TGSZpfBw+kPs
         Two+AVo3YjsyvNkwr1RcnK28VvOVDi0ueiDwcxctN5SzbBYoPttGa211352CWsvjWJSN
         m02YwcfkljOPFHQ6Nqgeza4dEoeCyP7xfQh/tyVFDolNkGi2tMk2snfte9Q6niMxdXrO
         L/1efUotVsbLw3a5+GiCFgQXQs+Zt6zSEmk7jITKCDIUXFGmbs7tAN0q7WnsS0wL8dbf
         WTmw==
X-Gm-Message-State: AOJu0YxXBzzX5xakRlbCzgoR1jlNr2oFVH90P4GRAXKT03c3PDd4Sl+k
	sugP165V/HPxJc2NmYeY6PgRswIzBK2OW95GQr0DfFzr0LaMdqgWwIFq/6jThgdMmG+1jCMJlKx
	b+WCxYyTR1WvTsA88QFa3vEoJegN5lauuorf+M82z6vaKTrYwumRJPDRPR+65qUR/FeH7
X-Gm-Gg: AfdE7cm8Im6bTHfSgoY07jcb0oltOJND3VuvhTRXRGuSmMqI2BCN7ZOME737I/6ai90
	QTUjtcxJ3ZTrvlNDD1x/1WVPfnsIYdGmK2C7wvFfWjGW+84DdOdNivpOwM3b1/5tGZ7BW0YNd15
	R1OPj6RJASJhVHOgTzBYPyn2iTPWwQ64mPpX7u+G/3FqpnXvpZCGtvvCWdWhwJfja3f8XdzEDvI
	lTcCmfcKZ9lRncqjx2323mUNbLq9ejL2t8+EHKCezC9Ame3ZaPL7W4YwIU6u6w7B4Rsrix4w1Qg
	tJPyYimDPmS71E7877eyGaItzfXk0LLe1aakZCQkt24qX2fbSja8VUl3r4+qWKRvd143w7L8QNL
	1HBBnaY246ASxtjIllNMc6iDlLnSzu4myZy+q0CwjC4p5OWcQu6J6s5HpS2ZEIy6K0hdq5w==
X-Received: by 2002:a17:903:b86:b0:2c9:e86e:a9f5 with SMTP id d9443c01a7336-2cef1363a32mr128826255ad.18.1784219366266;
        Thu, 16 Jul 2026 09:29:26 -0700 (PDT)
X-Received: by 2002:a17:903:b86:b0:2c9:e86e:a9f5 with SMTP id d9443c01a7336-2cef1363a32mr128825625ad.18.1784219365582;
        Thu, 16 Jul 2026 09:29:25 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd42b2c0bsm11828262c88.8.2026.07.16.09.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:29:25 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 21:59:07 +0530
Subject: [PATCH v3 1/4] arm64: dts: qcom: Add support for usb nodes on
 Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-shikra-usb-dt-v3-v3-1-13f73a0571bb@oss.qualcomm.com>
References: <20260716-shikra-usb-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com>
In-Reply-To: <20260716-shikra-usb-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784219358; l=6859;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=DhEm+1JWepm2P+dN4sZDmJseyaBg9adswfAEmTRMLUc=;
 b=CsXkObfisxA3ZECMyTOlnZ/KeT4DzfFFEhYKe0WuNwJPoOurttrpjjKjjPNfaS+zj+2/h1I76
 JEGMD9SHpRIAXRHEMTT0a8xJOgwyNqkx0rKRZBaLhEt5Ih6/GFlEaoA
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE2OSBTYWx0ZWRfX9sE7n404Adam
 RJVASp26OK9HNcF8xoX3/H5NEFSmQgKjBbrGKMVa5FBg3slqPu4+j6lmQOE+6BEnU3L1Ppt6ZBX
 PLtZ1izF+M5M83HQd9yYhwPL9MhynB1e9fQi23fipSKFbLQktLIXoGDFJesOuvV4v2TxL/UqW3F
 /AruYGV2kZB/pq/FcSswYrHcxRm/VX21Ab3i/bwJ035XRzgRs2pFAT27FXXuHfUYL5RyS3YIZgX
 A5PecyZEEsm9DGdFpjo2GyepBzuxadOXBrOpUSImns+DQ8PTzC+aVj/wwsi77NrXOgyJvcTCi/N
 udEVsFBchwtjTYQsyJTniJtm7nKUHT4P6rP/QP661Ig7PZWkEyHGEReS0ttSX4Z7si7WgDHgpZp
 uT7WqAzIW0VjK1YxGlHOLTj0xwtCXfqPMMdz6oizKZSHLdOvrM6eZfeqQ1dLj5EUvuqY5FeKuWF
 QHdPSYvW/WWjoGPTzdQ==
X-Authority-Analysis: v=2.4 cv=WrEb99fv c=1 sm=1 tr=0 ts=6a5906e7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Ta4lsJVmLrVUBxl1HI8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: hI0PmdRCKEXoXUFISAin2bXqwJ0Yd4M0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE2OSBTYWx0ZWRfX0NrZZPqBH7JW
 qIjpFtnxmkFo9DtYoFw4qO5TxEKA1eGqKAiyLIGVZuA9EbT85NeZfxspLz8lOQkJn2CqCZNO639
 r0NJjL0wYR8e3CRQbTkvM4NjFgC6mfg=
X-Proofpoint-ORIG-GUID: hI0PmdRCKEXoXUFISAin2bXqwJ0Yd4M0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160169

Add support for both USB controllers and their respective phys on Shikra.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 221 +++++++++++++++++++++++++++++++++++
 1 file changed, 221 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8e..493c5d999d87 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/interconnect/qcom,rpm-icc.h>
 #include <dt-bindings/interconnect/qcom,shikra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 
 / {
@@ -442,6 +443,85 @@ gcc: clock-controller@1400000 {
 			#power-domain-cells = <1>;
 		};
 
+		usb_1_hsphy: phy@1613000 {
+			compatible = "qcom,shikra-qusb2-phy";
+			reg = <0x0 0x01613000 0x0 0x180>;
+
+			clocks = <&gcc GCC_AHB2PHY_USB_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "cfg_ahb", "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+			nvmem-cells = <&qusb2_hstx_trim_1>;
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_2_hsphy: phy@1617000 {
+			compatible = "qcom,shikra-qusb2-phy";
+			reg = <0x0 0x01617000 0x0 0x180>;
+
+			clocks = <&gcc GCC_AHB2PHY_USB_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "cfg_ahb", "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
+			nvmem-cells = <&qusb2_hstx_trim_2>;
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_qmpphy: phy@1615000 {
+			compatible = "qcom,shikra-qmp-usb3-dp-phy";
+			reg = <0x0 0x01615000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_CLKREF_EN>,
+				 <&gcc GCC_AHB2PHY_USB_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "cfg_ahb",
+				      "pipe";
+
+			resets = <&gcc GCC_USB3PHY_PHY_PRIM_SP0_BCR>,
+				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
+				 <&gcc GCC_USB3_PHY_PRIM_SP0_BCR>;
+			reset-names = "phy_phy",
+				      "dp_phy",
+				      "phy";
+
+			#clock-cells = <1>;
+			#phy-cells = <1>;
+			orientation-switch;
+
+			qcom,tcsr-reg = <&tcsr_regs 0xb244 0xb248>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_ss>;
+					};
+				};
+			};
+		};
+
 		system_noc: interconnect@1880000 {
 			compatible = "qcom,shikra-sys-noc";
 			reg = <0x0 0x01880000 0x0 0x6a080>;
@@ -493,6 +573,11 @@ qusb2_hstx_trim_1: hstx-trim@25b {
 				bits = <1 4>;
 			};
 
+			qusb2_hstx_trim_2: hstx-trim@25a {
+				reg = <0x25a 0x1>;
+				bits = <4 4>;
+			};
+
 			gpu_speed_bin: gpu-speed-bin@2006 {
 				reg = <0x2006 0x2>;
 				bits = <5 8>;
@@ -640,6 +725,142 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		usb_2: usb@4c00000 {
+			compatible = "qcom,shikra-dwc3", "qcom,snps-dwc3";
+			reg = <0x0 0x04c00000 0x0 0xfc100>;
+
+			clocks = <&gcc GCC_CFG_NOC_USB2_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB20_MASTER_CLK>,
+				 <&gcc GCC_CFG_NOC_USB2_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB20_SLEEP_CLK>,
+				 <&gcc GCC_USB20_MOCK_UTMI_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi";
+
+			assigned-clocks = <&gcc GCC_USB20_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB20_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <133333333>;
+
+			interrupts-extended = <&intc GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&mpm 59 IRQ_TYPE_LEVEL_HIGH>,
+					      <&mpm 58 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq";
+
+			iommus = <&apps_smmu 0x140 0x0>;
+
+			maximum-speed = "high-speed";
+
+			phys = <&usb_2_hsphy>;
+			phy-names = "usb2-phy";
+
+			power-domains = <&gcc GCC_USB20_GDSC>;
+
+			qcom,select-utmi-as-pipe-clk;
+			resets = <&gcc GCC_USB20_BCR>;
+
+			snps,dis_u2_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,has-lpm-erratum;
+			snps,hird-threshold = /bits/ 8 <0x10>;
+
+			usb-role-switch;
+			wakeup-source;
+
+			status = "disabled";
+
+			port {
+				usb_2_dwc3_hs: endpoint {
+				};
+			};
+		};
+
+		usb_1: usb@4e00000 {
+			compatible = "qcom,shikra-dwc3", "qcom,snps-dwc3";
+			reg = <0x0 0x04e00000 0x0 0xfc100>;
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
+				 <&gcc GCC_SYS_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
+				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi";
+
+			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <133333333>;
+
+			interrupts-extended = <&intc GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&mpm 91 IRQ_TYPE_LEVEL_HIGH>,
+					      <&mpm 90 IRQ_TYPE_LEVEL_HIGH>,
+					      <&mpm 12 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+
+			iommus = <&apps_smmu 0x120 0x0>;
+
+			phys = <&usb_1_hsphy>, <&usb_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy", "usb3-phy";
+
+			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
+
+			resets = <&gcc GCC_USB30_PRIM_BCR>;
+
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,has-lpm-erratum;
+			snps,hird-threshold = /bits/ 8 <0x10>;
+			snps,usb3_lpm_capable;
+			snps,parkmode-disable-ss-quirk;
+
+			usb-role-switch;
+
+			wakeup-source;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_dwc3_hs: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_1_dwc3_ss: endpoint {
+						remote-endpoint = <&usb_qmpphy_usb_ss_in>;
+					};
+				};
+			};
+		};
+
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;

-- 
2.34.1

