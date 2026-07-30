Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706A642BE80
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 12:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785412861; cv=none; b=NSx0BIgnYwmPtsXq8AHQ/KzUzqx6c26Y4gO7UpYucmu3ip09EZHYBmspGUm0HtWc42xhApjA7qO8wdXeHtyaHZb4zet1jfBvItEF3xZu/c46Ze3r6lmE1ZIE2uG0hCSoZAOQLafI63cTzKiRX2/PofY2YENkxiVbVVCJJfubZs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785412861; c=relaxed/simple;
	bh=ySDiR9YPLrb5IFR36TCBslNdsY8sArZgsyYs5F+l2SQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oxNZv1hXXmTWjKk2hPtw8IT4W1nrHZNCbXmNOaGVKythCQSg9VRW6GeoT/5ntKFcH1YFGFVEdGULys1lnQkCrG+Pp3krL9owsWi8a3fCPBOptigMkqHtYXZR6GQQEj7+dGPpKVBwTUTlTtUXJnvsVTMOsqK6m3Sx55CehvW8oI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ek69fdz3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gayedlQ7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ek69fdz3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gayedlQ7"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UB8J4H827239
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 12:01:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6JK9gzvvCPLMwkZwM+DdBcV1dmsHnyUD0kCzj/Lw3mo=; b=ek69fdz3q0ljydi5
	XXbWSeTg7eopKzhhhFEje2gX6ZggnNMInKd4b9l5Lhpaf7woGTd8vJrcousg+OZF
	DdvGX3jzyIGvUO90+oiHsYRaECesfiVXMFQXe42d8Q8Pf/PiudnM8NyBJH3BpYhN
	tjIUyM6kRdv02/Pyr3jQgDf69RyuQeY1bCRXCjVKVJUEUfPOKbR43FQDiOl1uCAu
	l8BMYvq6sUdOY4ZRYRZh7HN24RqhbWZ2iVHdIyb1ECpctNEy7exZ4d1oCWt+NFIZ
	TcuvuJFSuQw1OPxs5LE7PR8dz+1xR3b9tP0UnbdETu7ZmleCQK3px4jbojQm6rqb
	H4HFRA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr5fpr5uq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 12:00:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so3357771a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 05:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785412859; x=1786017659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6JK9gzvvCPLMwkZwM+DdBcV1dmsHnyUD0kCzj/Lw3mo=;
        b=gayedlQ7qR/VGI6FlSqFspwDeLN34EZjWkIZm42pgS5gyDOQQxutrZFJNV9Q1A9ALm
         1kwIgRyzxZbP16zmsC/Im6+NZzEhn5tksWPf5Jangew8Q8bBmZoNmIkFvlxYvvfgmpnQ
         UXElJineH6VZfaJcjnIHxQc6fNVOQitQnJXxrZJXoJS5dsdH2kXREFM+6wm+MiMoUaS2
         kMuwl5ur34ZRSJxQZc65gy7y8zWOG3YupRq4kIIpWK8CxcNetrP0OBACqUNinXkRAW2X
         2frm5P64gDPkIoRplYirrogiFw0MC0L9AJYttvr2/kV0YhrYxxNZlWo7KneDTgq6Vs+E
         UtZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785412859; x=1786017659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6JK9gzvvCPLMwkZwM+DdBcV1dmsHnyUD0kCzj/Lw3mo=;
        b=MtJ5uI22cadoPAWQplXirAVYmrhrQ8MjAeO4CB+CprfCEZlYEnPBAu2G905n1lGK6V
         cs3auhLjJyiyIefWFh+OLsKRmcLYK/RBZWursqft/3tGSUf6WJjmTFq9pz61HVPl7cJl
         Zc+NHeEXxBWjxP+hDpd8NsO3myp6azrqnVPGk7FhXJy92vcc2lKe4pVcBb+m6EPeLia6
         izFIPk1LiyWUyeBkfgZPax2Rkm/sRe5UTt78ZGb9xCvXImBvRalHap7gYrR02bdstDvQ
         mVaJCJ7tC4b97vZPR6OgLTWTDPVZXi3OlxR/fRlL5XSKACV0xSpJTIlfY6uqekdRvwgx
         Kcig==
X-Gm-Message-State: AOJu0YyzhCF14o82Oq+EtuNw5gkOENsSp+DYkXI3DqIFVeHgxpyLL+ww
	iX/eEabqmLzX3Ps26rEJkZHIpVn565rFheS59pSxBpILO+TMfFUmgmrqOoC3L5uW0eURd9HDv3A
	rVmad89ufwDm/FIKfzBuCHjjHRUQFEC0l17oOQy56HGJHHOI8v0ss4juEYWRnEH3ZSbSk
X-Gm-Gg: AR+sD12aJlE7BXNeaI9QPUNOxlT7JX3og7R4lRxxkNhgdbESKVfSIEq8aVc4TEKr8L3
	dpLU0yOdu/bxqI3amGSjrErVg19RsBVZJ60zDbvbLAK1re0sVpBRJZkDPgUJQ0Z5wh7W0rImB12
	Rb9anf/X6p4MNkXCqleJf83i8g9sZXrwgKlGyLxbxjh3aDJaTZfQO/wlSUsC40mr9dcuSFg5YRp
	FL4wpbH83OXKGPqJmLtNqyHlgy8OOZNd0hp+pcYWj++PuvQ6hbFY2qS4VJToKb6TDe81KUBJEEm
	Mp/Ubth03D0OzOq21i4u943Eb8TurgyQZC27L2233cc/x79UDms7n4m48grv6lKmFKqGmSij8wu
	ERcSIC3X2K9QkAAfu/ygdty9m5G19fRBaZC4=
X-Received: by 2002:a05:6a21:9983:b0:3c8:e000:96f8 with SMTP id adf61e73a8af0-3c9006f112bmr2293911637.65.1785412858931;
        Thu, 30 Jul 2026 05:00:58 -0700 (PDT)
X-Received: by 2002:a05:6a21:9983:b0:3c8:e000:96f8 with SMTP id adf61e73a8af0-3c9006f112bmr2293789637.65.1785412857247;
        Thu, 30 Jul 2026 05:00:57 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13f9a041e36sm7822776c88.7.2026.07.30.05.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 05:00:56 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 17:30:18 +0530
Subject: [PATCH v7 3/3] arm64: dts: qcom: eliza-evk: Add PCIe1 with TC9563
 PCIe switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-eliza_evk-v7-3-7ac7b66a3e6d@oss.qualcomm.com>
References: <20260730-eliza_evk-v7-0-7ac7b66a3e6d@oss.qualcomm.com>
In-Reply-To: <20260730-eliza_evk-v7-0-7ac7b66a3e6d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785412836; l=3785;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=ySDiR9YPLrb5IFR36TCBslNdsY8sArZgsyYs5F+l2SQ=;
 b=nqUC1f8G5lYQx8G8Qvk2JfIGkirB8bK6RMI5BvdAbyzIKNX76NMnkHjvfguQiilT6WmDoZn8Q
 yFZeb6X3u+EDY5FQ2kfMamv9eoEUmkaRrAc8mQgq+4yIJfSLg+yt7Ku
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=ErfiaycA c=1 sm=1 tr=0 ts=6a6b3cfb cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qQkGquXN9PvF_GGjQ98A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA5MCBTYWx0ZWRfXz8XEV/ChzEgD
 Poe22RSwLfn2psbqfTLOHXmVcaXfYUQX9a1/mvQi6+E+h1XzwykvfVgoDqYEG8O9xhpAuEWI0II
 7OY0XMG2UIFBQ0WKxOAxdb2r+gs/M+PWjTTuELlGjXhI49SV2h/KqKeZr04fpcj5V/DfsQ2shMT
 ry509623I4l9NsRdaDGvEF73K7vyQ7XrAZTEb38PuiNR50pM4GTDSDZTWnG7IatR4lNP79HwZGQ
 4WXPgfW6kHHBFFUyhDv3GSZpa7yE4mxPIORe/6Tl+Mxag1t//u1wstWzOHMjbuWbiYUb2vtJIVx
 +QIh1jhc6/DFPX2c6J9RaCCG9pKEaRUnY437Rc8QRelIA7ShRScO8N//BF1emP1kD1beFYvbPly
 /nl0m6XgDB0Gc4NUK5EikmdMYvzfxH6l/NFxlcEld53L40Enk7f3dsA1L8BfwAjObpTan54S4kh
 bU4/ZC25pJQzb2wrMRA==
X-Proofpoint-GUID: Ot7g40sTfesZKY_ee8fdzId4yyvpt9Bd
X-Proofpoint-ORIG-GUID: Ot7g40sTfesZKY_ee8fdzId4yyvpt9Bd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA5MCBTYWx0ZWRfX5kWOPaAYh7mx
 XiY3I+vlQpYSACcBT8AyTlkSU4YrJbWaSD03eWRsCDEoYYQ9ivFuEBcYcnTajcr2IeWc5V9Ru5+
 1D9MJcpV8HuRkEjwU8XhhsRDr4o0L8M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300090

The Eliza EVK board connects PCIe1 (8GT/s x2) to a Toshiba TC9563
PCIe switch. Enable PCIe1 and its QMP PHY nodes.

TC9563 uses I2C (at address 0x77 on I2C4) for its management interface.

Override the base iommu-map with the expanded set covering all the
switch's downstream ports (0x1400-0x1408 SID range).

The TC9563 RESX# and PERST# are OR-ed internally to assert reset on the
switch. Use TC9563 RESX# pin via a TLMM GPIO and skip wiring PERST#
from the PCIe controller.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 105 ++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index b35fffb50976..ccd6f0113513 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -12,6 +12,26 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	vreg_0p9: regulator-0v9 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_0P9";
+
+		regulator-min-microvolt = <900000>;
+		regulator-max-microvolt = <900000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_1p8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_1P8";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	vreg_pcie_m_3p3: regulator-3p3 {
 		compatible = "regulator-fixed";
 
@@ -99,6 +119,91 @@ pcieport0_ep: endpoint {
 	};
 };
 
+&pcie1 {
+	iommu-map = <0x0 &apps_smmu 0x1400 0x0 0x1>,
+		    <0x100 &apps_smmu 0x1401 0x0 0x1>,
+		    <0x208 &apps_smmu 0x1402 0x0 0x1>,
+		    <0x210 &apps_smmu 0x1403 0x0 0x1>,
+		    <0x218 &apps_smmu 0x1404 0x0 0x1>,
+		    <0x300 &apps_smmu 0x1405 0x0 0x1>,
+		    <0x400 &apps_smmu 0x1406 0x0 0x1>,
+		    <0x500 &apps_smmu 0x1407 0x0 0x1>,
+		    <0x501 &apps_smmu 0x1408 0x0 0x1>;
+
+	status = "okay";
+};
+
+&pcie1_phy {
+	vdda-phy-supply = <&vreg_l1k>;
+	vdda-pll-supply = <&vreg_l3k>;
+
+	status = "okay";
+};
+
+&pcie1_port0 {
+	wake-gpios = <&tlmm 53 GPIO_ACTIVE_LOW>;
+	/* Same GPIO is used for both PERST# and resx-gpio */
+
+	tc9563: pcie@0,0 {
+		compatible = "pci1179,0623";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+
+		device_type = "pci";
+		ranges;
+		bus-range = <0x2 0xff>;
+
+		vddc-supply = <&vreg_0p9>;
+		vdd18-supply = <&vreg_1p8>;
+		vdd09-supply = <&vreg_0p9>;
+		vddio1-supply = <&vreg_1p8>;
+		vddio2-supply = <&vreg_1p8>;
+		vddio18-supply = <&vreg_1p8>;
+
+		i2c-parent = <&i2c4 0x77>;
+
+		resx-gpios = <&tlmm 54 GPIO_ACTIVE_LOW>;
+
+		pcie@1,0 {
+			reg = <0x20800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x3 0xff>;
+		};
+
+		pcie@2,0 {
+			reg = <0x21000 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x4 0xff>;
+		};
+
+		pcie@3,0 {
+			reg = <0x21800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			ranges;
+			bus-range = <0x5 0xff>;
+
+			ethernet@0,0 {
+				reg = <0x50000 0x0 0x0 0x0 0x0>;
+			};
+
+			ethernet@0,1 {
+				reg = <0x50100 0x0 0x0 0x0 0x0>;
+			};
+		};
+	};
+};
+
 &uart13 {
 	compatible = "qcom,geni-debug-uart";
 

-- 
2.34.1

