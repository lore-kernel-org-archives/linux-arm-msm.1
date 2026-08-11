Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6290C3F8EA1
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 10:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786445960; cv=none; b=RlZqpF/Me2d1+idPdQ2pp6OKcpXZxRsbuy2hZxTGnTH1CgHkxVdM7aX8WwZlqQd8UPyTq/xmZguhHWeS7Q/A4LPx+7cHiCNGQPH/QwaqoyiSlN+V59T5Ee2K3XYJUfL4u1bm/4r3c0JMxkx/bJCSbSkSrNTmMcPDUH3KTLX15UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786445960; c=relaxed/simple;
	bh=nquH79gZGqSwf7Cu/GYzheGdeBC81e99cD5ALf+toTE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m/uWddciyQ2RB5JvMZp8hL0v4hkGuRDR/FObuu6w+Uy91o0UzthtEoAJfRu1KPtgPD8X9tzujUsTEAqvWMeBwFnHRfeos+mZt2MkjfzqZ7tEpRfBXmsS6Cy6RoKLg68hQDFkFyjVgxNV0BSniNvLEgjdKP0EAukdAXDW8ELqSis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lpns24cn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OYs4/Rfc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lpns24cn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OYs4/Rfc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BAM52N384679
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 10:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Pq+5ZdLyxK7k8TSd0cMDvaLHW3aL9z7jg6n916yVnc=; b=lpns24cnm6Jw2Hqb
	s567ViiiqfLZh/wMSOWyjBOeic2xdoCrn4qVtS1Aq1w68UApighfmd9e2qanMobo
	ntlkUkkhRw+xwQUfdZ/H/CnSbg/huhPIkTKK5O9x7tqRPp/ab7Ka7a7lTGlzvKix
	lBkTJt5BB2DVlnjTo8L/Yvl7mfTzpinSlH0gDav8r88kvT5ZIi1zqAwT8sm1DzA6
	YbPmkWo27puXNvDEQqkSEjPX04/xXo5u6AkSTV97ClpSodYlNIqVlSUpTOXnsC2D
	tExgsJluYeqeL9rpyhl/vQ8QGnOkRg8U6DAlA8GZa+Hz9/6AVoEMjMs3x32Di5TS
	wb5vhQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjk23tsv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 10:59:18 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84857446424so4942830b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 03:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786445958; x=1787050758; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Pq+5ZdLyxK7k8TSd0cMDvaLHW3aL9z7jg6n916yVnc=;
        b=OYs4/Rfcuc/CqGtKNKUHZE+CQaFiM9Q441R+D4IHYkvuffyARqmRdMf6EIVM5ZrOh1
         w9fMLFjXYxY2Zt9CKCwCiOT3l0FUk71nARf05c8a/HI5CjpoEfubj32XfiQmaCI3B97Y
         6ehrJHrJ4J5+P7UW2ZD5VWXxXqF1m6SGmCLecszpef325mtMfhn02ZZZedyaKbJtIe7W
         6jEnXDkdHyLtY9UBBsZ8k0Hz2dQkqmbfIMJ0cJMxNO6Ny+J/ksMN8VzEZKFEiKIQAiNX
         sodlJqghb7d2QGVbT2G2tJk2BTICwFaqrp4GnkCo7vZBtTRzIRcXqG4Y2/SjbXOw0qCc
         8nNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786445958; x=1787050758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Pq+5ZdLyxK7k8TSd0cMDvaLHW3aL9z7jg6n916yVnc=;
        b=qFFV+a7sv4vU9M79XTt6aTVaJNdcFZ8DMnYxxSlC9oUTdnA/EcCapxxY37qTkUHxro
         +MdgB37QD3fXdZRf6TkxLUauP/VbStKqTtyiUtHFtfTC+NHIzs3vdg91btOhpinNd4L9
         oFqENMFdhmbam2mVUN4xXk0S6oCz6fvckKsbTU8HU2EJBaOWeK+ubRMB6lpiIwZHUBSp
         tuUW50LQtxtSHTiT/ZF8wXIQqGecjdsIAZgcsiacpEyjSkLGmtZlHOQSLZwnP6Plf/aZ
         dncB28YHCB5V/83oxIc6OVSzbpzfP/aLdItGj6uI7OJVpMnm9Y95o5PT1Ca33OxgFnlC
         t8Qg==
X-Gm-Message-State: AOJu0Yy5H/CPp7Lp7nRBW/FJMl/UapCMbX/OkQiUE9IEhlMJM8u4Spzf
	Ot+kkweiX3XbrQcDWRurleTfIEvHvL2cPGwlggv5pbYARMcC6AJHL898YUr+QXJLsLsJkPGYwGH
	l/z5yG16+Qm2xmCTyC18o166SmVaaKoKuLsf8JfrTGTp2E67vA/qXEdF+QZ2z85JMzwFZAfbsFB
	Xs
X-Gm-Gg: AR+sD11ca0F+fPYZ/Mb+M4roHNrnLlZ3Q5xD1loKaDC7ueeORnhu5hB7UUFz4V/PRsp
	ieGYKXTgIdSbY5I2L7QQmXVTx0B1kqeR8qeveHdUmLQRCe7mnazqT8AkTEg1jHSRJfVO46wUxtS
	xH6/V5vK0a+CLAlkVQlQ8sVkkKXKgJqtp3W588EJ0mc7lb9/Rom6Vgliqs/3Xkn/51M6bZsAeZV
	wTDp9nPbJseH1Psq3t7tXu3bFwpYicOy+Ctj6kDDws6dRDs8gHALaIuqpOF2tve5Dzqqcst3QO+
	v+ejuM/Ovkp/UxAsb6RfnXOPiYMZ3rOMRugir82PXGH9zy1Yop51ctgTchZ8aqJCf+BHctGU/re
	fWe4VKAihLRVnZGQCK1vfINEP9GJYDGEQb2W5FzfcGzRgdFHMP/z4Rig+avT/1gSmzDZJ2g==
X-Received: by 2002:a05:6a00:3913:b0:842:706e:ad43 with SMTP id d2e1a72fcca58-84fa884543emr1849337b3a.33.1786445957761;
        Tue, 11 Aug 2026 03:59:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:3913:b0:842:706e:ad43 with SMTP id d2e1a72fcca58-84fa884543emr1849290b3a.33.1786445957289;
        Tue, 11 Aug 2026 03:59:17 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa952841dsm529322b3a.30.2026.08.11.03.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 03:59:16 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 16:29:07 +0530
Subject: [PATCH v7 1/2] arm64: dts: qcom: Add support for usb nodes on
 Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-usb-shikra-v7-v7-1-753e928f37ae@oss.qualcomm.com>
References: <20260811-usb-shikra-v7-v7-0-753e928f37ae@oss.qualcomm.com>
In-Reply-To: <20260811-usb-shikra-v7-v7-0-753e928f37ae@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786445948; l=7556;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=nquH79gZGqSwf7Cu/GYzheGdeBC81e99cD5ALf+toTE=;
 b=rfEiRQ+++O70dWCftH4AAWED6MUXzkCi1gW27egFs5i8ublODs87lqwkwdlV5dbFGU+hi2In/
 gkaY5tdkL9nA3P3wWhBh2VE2AbyEP0SUzTUykTF+2lqB1nilA+R21OW
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA5MSBTYWx0ZWRfX66vhVaihGWOD
 Pp1qPlx7EegHimI8yh4dvJp39KYh1cdN0gdh5dsImae7p0OplHv+eqpVVK1vvRlE/GlEY46YQzJ
 pHAhdpVUE6yz40nL3Lf87uUXh6GJeKE=
X-Proofpoint-GUID: xWx_PMz3hSTf1vxvoiFnF5T7wJ4La7HE
X-Proofpoint-ORIG-GUID: xWx_PMz3hSTf1vxvoiFnF5T7wJ4La7HE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA5MSBTYWx0ZWRfX821Sij6NJVzJ
 EpGO59+2k0jOv+bnK5w23jdIPtBkvt8YkVW8MMopbUb5lIDPD/5qNMAlYxmNlKyEiu38iEgFBNB
 eGMsO+PJuidlWvphuWmDewCWEFZw97qN3LIszjpQM9fz7yTDS/Afn6Vm3QEFeyJiVei9Z87tNlV
 oAajo8Y1IOxbGSeNUgcDRQsy+cUUJndtYSMtPyxeQ7lwLgKN4BOE537LltMQCjTJuIGKkSNF+w7
 NN4pcb/IOPH2fjMPsWNWqhGRnxY7LdKhPKpawMrzeTlKFbksvvjGBRPMRoW+bqBFYKmBW9p+k9P
 a+h5mHJdxeURvKdwOe5FysyP71Z19BjIBGCzFf2dW9zynxSJetgheDpdF6bVoHeTTqsHnPpUQP8
 QkkYBAHF8Uqyu2zjQl9b0U1OeTD9ltXnQhLdoBjYBmKe12vPHFvjlEymYN8TkOFepR2qDp9nyLh
 ae6ekui5esW7OLBIv/Q==
X-Authority-Analysis: v=2.4 cv=eJ4jSnp1 c=1 sm=1 tr=0 ts=6a7b0086 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=wA36ycbUlljGYm-j3gwA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_01,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110091

Add support for both USB controllers and their respective phys on Shikra.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 233 +++++++++++++++++++++++++++++++++++
 1 file changed, 233 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 92d22e3b6931..a57ba13a4ecd 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/interconnect/qcom,rpm-icc.h>
 #include <dt-bindings/interconnect/qcom,shikra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/thermal/thermal.h>
 
@@ -922,6 +923,85 @@ gcc: clock-controller@1400000 {
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
 		system_noc: interconnect@1880000 {
 			compatible = "qcom,shikra-sys-noc";
 			reg = <0x0 0x01880000 0x0 0x6a080>;
@@ -968,6 +1048,11 @@ qfprom: efuse@1b44000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			qusb2_hstx_trim_2: hstx-trim@25a {
+				reg = <0x25a 0x1>;
+				bits = <4 4>;
+			};
+
 			qusb2_hstx_trim_1: hstx-trim@25b {
 				reg = <0x25b 0x1>;
 				bits = <1 4>;
@@ -1958,6 +2043,154 @@ compute-cb@9 {
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
+			interconnects = <&system_noc MASTER_USB2_0 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_USB2 RPM_ACTIVE_TAG>;
+			interconnect-names = "usb-ddr", "apps-usb";
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
+			interconnects = <&system_noc MASTER_USB3 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_USB3 RPM_ACTIVE_TAG>;
+			interconnect-names = "usb-ddr", "apps-usb";
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
 		remoteproc_lpaicp: remoteproc@b800000 {
 			compatible = "qcom,shikra-lpaicp-pas";
 			reg = <0x0 0x0b800000 0x0 0x200000>;

-- 
2.34.1

