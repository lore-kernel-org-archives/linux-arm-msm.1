Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654B24399D7
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784802847; cv=none; b=PjwxL0mRwX/xIgfywdUQI7xFrctYKDRMfECZxDyrquDKeYMKd3t67OcuqkvYLzaTejC6TJ0Bejy9i1RDir4CvP5FE3XAHn7nWyy0uZG0a292jlSG2JTFOf6eJabeMxyGsBpJ9t3an7ciCf7wGRgKszbpyx8YLTq5Q4HnMV7fAK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784802847; c=relaxed/simple;
	bh=zDNjHLbz4fAir6ZoumvHrLn/9svCp5ruHffo5hKQ9sA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R3JtEtoREe5U7GPvkZHNyCdgrnRSga086X9G08n1+AEotCrgSdbflolMyzqtzF7xRjknP3PD3ezPELiEcrW+xFf3qyv6USJMyYnfXrzQNw2rYcBxERYZpkHUp+uLPCEzQPdmO8q7gEfGEXJymgh7qxXaWpBFsILnm/T38pH4OjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q2Tm9H/f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aJ/Ow+CS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q2Tm9H/f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aJ/Ow+CS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qZcl3045016
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i8qmROaaIltH1Kc+hD4cQbC4K7YQMrAQpU22BKyka0A=; b=Q2Tm9H/fBsw/2efB
	Je8zR20sJI+FTnJhGGSgYOZFJehDb/RV9NCR6b9U142xz2z0rHZDtxvn9tVdUCOZ
	9rmUjgk3Ooid+iYEBsQCAs1EStzX7aVwEI41UUGfsUJ60mOIG8D7fm3kyknEwShE
	9Tf6NxOYTICh4zxWxY4//0tPzeXwtjLNlVefMqdAcDhduq5eatNSWAZmGBBBQAYs
	tN4CswasZ9K723hOmjnWBLhNuxlPEhCE2gn/iFK4rJS3UO+HJvxim8aLe7ZxnQvs
	jgRlCCbzCZHrDGfdY7V72xHlHtdBRY4B9hMfTSSx3HIMZHNJGaJhh6o88VatJR/N
	HcM5QA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkeuq8n1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:34:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc88e22f92so13266905ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 03:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784802845; x=1785407645; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i8qmROaaIltH1Kc+hD4cQbC4K7YQMrAQpU22BKyka0A=;
        b=aJ/Ow+CSDs6UwGqa0Pf5jb78A5TNeQoHFPf7ZnE8LcQ4dMB8VrhgHzX9iRHntIGrZJ
         r+ZFjmTL3lGjLwTjuzkSscuCP7xfEIKQUJz2To1hKyM9Vv8hg9a1oIHuOt/JJH6vd+Gd
         tlH8bqWS2S0quoLpbDw0LivWaInKajcaCzNcp0yzpdYe/U2Fm/FpAH+BOhTRp9lvSvsi
         0PgHGG47KU1T6E/Y06MYb2Tn6EDcDqv8zk5ETeo19zIdYv7fxraPXPEM4R2mjD/8PCHW
         FRbxYM1MBwIj89HGE6E0UtTiyPyWguw74EtoCG14CIt9ec18qDo9n9oPG+36ULF23nNR
         5EOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784802845; x=1785407645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i8qmROaaIltH1Kc+hD4cQbC4K7YQMrAQpU22BKyka0A=;
        b=GwDtqRWHgIot90awXhGpvKatPZ/DvfgzBkPfaBRGVhwTjh6B+Hc/sZ0BcIId9MVlvI
         FfdIJRL6y6UR8xMr3tSnq1payx7liEEZhPB/F/mRHZnOXbg5EccgDEcCsgL8rE6tzANi
         LZwokfMmGkVpckH0JpqHXi1Gi/S6viFBRdMosLg14Z0VwZkU7GgxskHAbnndevB2ZRM9
         2LPZHcLCzvvlM1/N9SDPZV+h2UmzVBJo28YmfwQckuApd/wdosAWqrHu+icRhHx7H0Py
         1GiMdHcLxnmeF8EvMhGgCaQSZ4oIptKqpXOy592BBq2kxf9wQgIa8+L4C6uivBPF/4Er
         yozA==
X-Gm-Message-State: AOJu0Yy9IDb2fP1IvZBU3D+y0XbXPJkB3FvqqvUPBL3sTbSMrxvwYlqF
	ur4+NUUjzrWr7Zgk1b3dNjqY2T6Iaq2UuKph+0YSpWDzQhPG9WaUtrn3wW4WITNklVbz4b/OQ6m
	jcnCBzLgEbJifbOdukaEtLeoRgB9ZmK3GviAamY9xaJjcu7DN2RlCWBv0Cqrmu0HK1zC3
X-Gm-Gg: AR+sD13wgxQFhwdEQS3Hx73Z/1xQ9GTprMIwZ3z8CsmiXM9xiZeeAEEi13M9bNLo2c4
	8NCDAt7WSWSpCYiKIDBiv+aYf/d+5Au4mm+m2AAP7exNBdHjEXxcgRrCoe8Zaq/QNbOSvejG0WI
	KWOgCLQ3WY/BTPIXZP4wqD2NjPWaSj8twXM3lCi0S6ybkZywGaxPcw4yeGk+qV4ruDe0Q7wDk0E
	9sEk86vOSytLlz8iMPJ708u6IhruDz+RBAalp0CZnqvXzSASfk4rICLSaZvbsJ5srJGI7AFTZZ9
	wroCB/uXkdGgB/quPVOgWa3KEKAhbR6Bg7ja9cUlpq20nHqpU7BHlbe77db2XlNhNcOFiRUph28
	USlgg+nOLpLA0inVlixGeaZct4S12KjcJV4OsV0/UaajdtSCRtKYWf2iqtElJDokR0Ew/KA==
X-Received: by 2002:a17:902:db0e:b0:2ca:c84b:c4a4 with SMTP id d9443c01a7336-2cfa748cdebmr30278875ad.28.1784802844809;
        Thu, 23 Jul 2026 03:34:04 -0700 (PDT)
X-Received: by 2002:a17:902:db0e:b0:2ca:c84b:c4a4 with SMTP id d9443c01a7336-2cfa748cdebmr30278525ad.28.1784802844272;
        Thu, 23 Jul 2026 03:34:04 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f2e6203sm32416155ad.44.2026.07.23.03.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:34:03 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 16:03:51 +0530
Subject: [PATCH v5 1/4] arm64: dts: qcom: Add support for usb nodes on
 Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-usb-shikra-dt-v4-v5-1-5b69d9eb0888@oss.qualcomm.com>
References: <20260723-usb-shikra-dt-v4-v5-0-5b69d9eb0888@oss.qualcomm.com>
In-Reply-To: <20260723-usb-shikra-dt-v4-v5-0-5b69d9eb0888@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784802836; l=7385;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=zDNjHLbz4fAir6ZoumvHrLn/9svCp5ruHffo5hKQ9sA=;
 b=UJXh8il8VR0OaImvabXp2FdizVtCp3LTgDAQ6lmaW7MoKzIKXKKwnEQuZlfivnwxXvaec5Bkf
 ZIB4//EFZXUBIyJh1FgJhPhBI9zESsjUDnnKvRfSsfdtmhEaBPuY/rV
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwMyBTYWx0ZWRfX9ngV56Ogdtpm
 GG5TJAP2BgpETzsxK8weHuf2BwvmX+y7gf5Z8MXGwDDH4efCO1Qs884uRYBJH8eZ6hShCH5qchP
 U8KEn4HZukr5oXujdRFXSJohZVxpfuc=
X-Proofpoint-ORIG-GUID: KeRwmUc58YxeXz4DcQReq5Ht30nO96SB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwMyBTYWx0ZWRfX5GrfuFGoSzNw
 ahFaLH0YgixHppGy2z1EGgFqNjXwwIvnuhGdJpc+7WIoMdqzmL8dfsCaYjyRqL5fL8PwBwu/7/8
 dClqTS0IQ5MwhlQPHqNa/8U+ae6avHwx80SdEL5XjtIzF9+/KUhtbC4c0BvYh+XR3Ajb5pLfw63
 Rse1cZv36lF3m1GuYckVESBb4lwtQS/VySRUlz875rp0xxcb1GaowmuOYIoXaFVAeSfM/c8B/U4
 aQlKjpfgBVdJMqI/jpGG4DFLHU9M9dL5Tza9jMv3rACw9C5lgdTXSpArY9tPtoP7LnGksGumwtW
 OWwOov44w2PU6wC7K4pcCz409IOCdPCsGBFTgqdcVz+ClFuCjYDTetabwV3g+MIXdzoj1EOti4E
 dQqNc/zQ8h0GGwAwmJEW9AbWhHBz+12Y7AVmEOw4zKNhyQHY+G10rMRvLDH3yGaswyrJJaCXmA5
 18bKKXxIu2BttMWUc0A==
X-Authority-Analysis: v=2.4 cv=cPDQdFeN c=1 sm=1 tr=0 ts=6a61ee1d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=wA36ycbUlljGYm-j3gwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: KeRwmUc58YxeXz4DcQReq5Ht30nO96SB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230103

Add support for both USB controllers and their respective phys on Shikra.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 233 +++++++++++++++++++++++++++++++++++
 1 file changed, 233 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8e..b5cc159e5dcd 100644
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
@@ -488,6 +568,11 @@ qfprom: efuse@1b44000 {
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
@@ -640,6 +725,154 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
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
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;

-- 
2.34.1

