Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CBB466B79
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627642; cv=none; b=dsXBD85f3PHn0iHS6NmVSCuzpZ9ZwZvajzEY2SWaCXSj060/rz2nlTmhiBeJtjb09sy97n86zCdJzr+WIRxlfOgJHlDE9qU8/eV9oX+h33AtNXnV3cWy5Fwp0bKFTmUgh0NVDS1rGgCxf6BI76v0GZWTpxvKwMGw+I24yrVA4ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627642; c=relaxed/simple;
	bh=/fNttdj/mRaZU5Hi2i1TX0qKbxNI02fle2pe3GbIOCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=raBLcum5vpDAHuW2E7/uRwkwmItXLjLBYP6BKZAD/0jbq7b6QxIGby/+fOZyqr9vAfgb0hRd12h0AxJ87/BDxfb0Dcpm++8qAvXGnbFA4oSBVbJoo/j8PEkvbma3g5VM/n19OkgXk/SAbtUUFBGsqz7B5NzVU1o6webG8Lr4qi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O+PBaKzl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Es92wCKH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+PBaKzl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Es92wCKH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6Ga4J3978349
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:54:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0BjUo2vwktHWXNtRoUZt87ZyDLmcFIEa2d1oiSfq6aA=; b=O+PBaKzlMIui3a7n
	d6lsOAV6O9W+PBAOTQ4dlrWaMZEz2f8r0J10ZQGaAy0+Ad1B4SkGeglIghBblkbI
	U0RSimhi7rK9yuJv/FnWy+gGYvjUjWEDqzcBF5jc4FC0BDofMREAGI8c44207Zcd
	1lCaXGGcouFLWjX+j0OsFWR0UtutNIRtrwLuWl1Lz7OczqJ7pQcJz4NpsJo2KwLS
	OB/tegUMkN6O28Xa0Dl/5+NyhZFJxn7cMWxTlgBLGlcO28TuJJXqtXk0kXiy0JIR
	eGMNvoiWFvbGYnsqWwGlkbZ9S67AhZz3vD7fdy5uRg3ingWHRx1OG65s88UJDUTa
	75U+2A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv43tt1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:53:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cce870a060so193865405ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 02:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784627639; x=1785232439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0BjUo2vwktHWXNtRoUZt87ZyDLmcFIEa2d1oiSfq6aA=;
        b=Es92wCKHzYb/7HJ6NaJ4xzxbEvUBunGERtQGkaZoWjSyFqnjll/vhzzg5eFMW/1T01
         E6w/wVhW3F27ydqD/WiKwbawUhrZdvsFOhopzgEj81qGzm6QzPchB4+RAtwetUQfLv4n
         E72t914HJ22u6UPOLrSYMqtGzghZ/8pkCqtCMJNz+Ga3GWvh9qml3a/iLBSZCpXfYAGP
         ldqYCbrL+FjV2U1i4tgiVYexiLzcJpwY+NHRnN5EQFgxEZZwRR54fkEqD9O2Lc56+WXk
         hlMiBViwWK9mEuo6uVmupk/Gmd8ULH0k4ctASlleTexg4VwBHeb3p6f3jG8BIcBvhG6Z
         1ztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627639; x=1785232439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0BjUo2vwktHWXNtRoUZt87ZyDLmcFIEa2d1oiSfq6aA=;
        b=WljNa7RSViQlC4SrunBM6+4e5XP+cP70W5c6ux8rEnmpVtBvkxo9rD4habpslPIJ/k
         uzibzGG667xbFOzQFJAKLrDHhhHS6j6tHpC4hExSIx4r4elsDszjqKZrvSQGM0ugy2I3
         LHa1tO0eNlGo3M5tNAtobYQweTW5DbDX69oxeEmOogweLziWxaBYPji8IEVF1V6r0iwq
         sQ0IkCdHClnBBIjKztSrSuzgJUlphsd5a7A9aYQdosPKftzWOCg+CHyxRnQbd5Qi15+q
         zM61Auy/aZW3Xfmc5RHGVi345FT2o+R9fFy+68yy4LIcdvkj8jel7122SlzLXkul30a2
         gynA==
X-Gm-Message-State: AOJu0YwYLeujvmpwT/3IaVdIa8fp4R9edRPX4hiSPDq6W3zykbcB2Vkp
	T4+m4N8/LSFh+ztm8f946Aq/cY3qpEXdMeoOLrGKI4gFJKhDt/dPK10o6NEO5UN7CLntXZZKeya
	vWLOL6WKjhsrWbwJk7zVXCnj4IfwUHjRr6yLkTCurmdcpYfkLWH3BB9/xYK1p9b14X5W2
X-Gm-Gg: AR+sD12YORucdm3tEriPKuaCsOpj5do9MT3VJ+Szeaeyq9cZo3sUuAYxNvx/vJ8lWaE
	CPMOv5tiVIOhQJX1YUqTsuopKNN66wmqHymwy2NF+9yriLf34BFWp8bO7wBBaGvDhDmuxq7BVVZ
	Sn+9JsC/3DDui8Iup0MGbUKyVI3N6FnHcGY0Qo1yCAQqnjNC207r4MhM5+eLoHuWTjWpAtMJa4a
	DdG0C6cdWUXZPo8yvrkyHaen5sucJj6ldWXURF0InYxzlcel5ZjE10tQNh8/3OHiinHFE6dc6rF
	e5/FgLoxzt8v1qWarG5Pqd4ogj8Azh05SOm8PDTlVnnf2iRcitBehzTytXeLlNt88noulRHY05H
	2O0alSBj/7qbVi1tQRZ6KvEFz9ywmQB6yiVfRBoFCoaN0sGQCgFt64SacWiChqC/8A/ljyQ==
X-Received: by 2002:a17:902:ef0f:b0:2cf:84bc:6e08 with SMTP id d9443c01a7336-2cf84bc6ebamr15641505ad.33.1784627638868;
        Tue, 21 Jul 2026 02:53:58 -0700 (PDT)
X-Received: by 2002:a17:902:ef0f:b0:2cf:84bc:6e08 with SMTP id d9443c01a7336-2cf84bc6ebamr15641235ad.33.1784627638431;
        Tue, 21 Jul 2026 02:53:58 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346da139sm71950055ad.40.2026.07.21.02.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:53:58 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:23:45 +0530
Subject: [PATCH v4 1/4] arm64: dts: qcom: Add support for usb nodes on
 Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-usb-shikra-dt-v4-v4-1-2e7a092d7f27@oss.qualcomm.com>
References: <20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com>
In-Reply-To: <20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784627631; l=6859;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=/fNttdj/mRaZU5Hi2i1TX0qKbxNI02fle2pe3GbIOCs=;
 b=OB8wM6mlVUoAn3/0tqQZ8eeuHXhr/SflmKvInV2RWA5F0CYT4OJ9S+mNqfihhRSb5f9R2UlZr
 Ls3gnyG04tqD8zgiyYLUgmXRcPUptsVjmQyt7pBIY9KgdI0kteH89Ys
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: aNJMlKqcLcMYxAquzZfBL3Jr2n45POn4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEwNCBTYWx0ZWRfXwQ4DFtOJoaAc
 qMrgyIfjL8y7pVxdQ3aQisHULsZmCIecPrxEP5ocaNb3++Oz8ZkKQJvzel6+4iWibghzL/OTg2Y
 OJE8MR7UqMH3RfFrT/kOFWwICgeTf5cvhYDWbznqoKXtJWUd31ssS1JH3LJ/bK/dyqm62vyi7LU
 D27u8wJw7FwIS2yR85QJKHMxdc4J4KwejzU2izFHwH5lu+om3h3rePiiM/XE35T76+bYubS3vau
 5U3M2Lc4p6Hy+pc+z9cVhXDqOB0hrcDpTmfGjebwupJ0UuHcP+tS+GkBPBH+kYUBsSZoPiTv02/
 NBHzouL9DGsyVc7zJa7OSsyv8sWLpi2p+IRfPY/bDYj0RyoW9NdmUjA/WQnp3/JvAX3/RlIx7Eo
 Kcz0tCjnKvMh50b9bSXBpnmK6Q3cIf+PE677LVJ0JcPjwWCjU4+E6a7MfcI15cLjZ7s2JzWayac
 ZG2BVMrQGTWBxC+EOtA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEwNCBTYWx0ZWRfX9I48biMFoibc
 4WQNJmUvGSNoXpMlNahBMmBeUrAKnCzk29143SNdrBFRCHkVGUW+OO/KqBSKyL7Qb+cgru8v9co
 X23BpIfF6Zs8fMRarUJpib/8PBGPLRE=
X-Authority-Analysis: v=2.4 cv=daawG3Xe c=1 sm=1 tr=0 ts=6a5f41b7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Ta4lsJVmLrVUBxl1HI8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: aNJMlKqcLcMYxAquzZfBL3Jr2n45POn4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210104

Add support for both USB controllers and their respective phys on Shikra.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 221 +++++++++++++++++++++++++++++++++++
 1 file changed, 221 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8e..7f5d584fc17b 100644
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
+				 <&gcc GCC_SYS_NOC_USB2_PRIM_AXI_CLK>,
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

