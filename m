Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579639;
	b=5E4P8U9iwYm0HbonFbqsXA75wbeiIsfyG8dAAjqct/QqicDNJMgpKkHnKcnI1f6TIkTD
	 HUSFKbv8T2pGjis1t2GoTxxAFTcOY08zCyT8yPBPy0jltCRHF1GdZ7cfNKDOJLEzR66sR
	 9iyfU+5aeW6mYQ1Fk4jl3cYz+c77GPz9cJjPqL4wN2KZiWS+NvQY/kclpMysW3j5ACTvm
	 V93swsH8bvXrKjNpby+VJCqNJRWbp5EwKkpwonq8uPkNeDPr8wrgRMM2qnynaGM9hbneK
	 5EYceeu/1Ifoc3UsRuQqqd9ME3QtgEGpfVfABGs3ZFt8SklAGhrYt1tmXuH8ujlykrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579639;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gWvlJD9jqoJDzMW6TsnVK/PUEbWsSXVaCGhDNvYutCY=;
	b=tesRjZsq0wSSsVBTi7y+zuh5b2Cqltuul8fXhDHkPWsfuCOpmfulnxkt7u6ovZ9EKa+F
	 wofWgOPlzo/Llw8CVOYhlJJymgZR6OP/esq+wl9qOGyY+gzUz9qxJQBGjuougU16C/qgM
	 vL2iHKRnq8dh2KK6Xt/NYMN3XEKw7nNZ/+1jLkRs5a4JYaSMRdbEe+Mw1tSqJ3FVWz4x4
	 pcu2PHYLHcWbwwnwz4e/ml5VxYY/s7FqnhdEfu9h50SCfNByVffCh1KgiLWrZiGg/lBkj
	 bF9C3Ms/1VFJpTiAKJSgO9WL9o1QUyx3UbXCP/wmHD8c1EZmpXBPqQQ+vNtEP5PMKgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g1WfvW0A;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KfaoW3bu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386BA606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 386BA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g1WfvW0A;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KfaoW3bu
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA6dOP4171532
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gWvlJD9jqoJDzMW6TsnVK/PUEbWsSXVaCGh
	DNvYutCY=; b=g1WfvW0AaESZyUeMTMvdTSfTxSVfmFRWxZ3a25yZ0QSUwGVtnm/
	o08gqqEqM0GBDrBBESbaQ1iewaOTTvC+1lxcBB3NZvFyZ57QVJxSMUO/UMgvIs/U
	lNrzVpTH0JhF7EEgs44kIiDDT2KDhPg1n1fALdFOTwiR6YjPiPBwj3oe3VRoA/sk
	Imw+QyV3kNEO+8X3Zcmdsf90VcQQLfugnhXSGpwKDgoYeRA4ba0sb15GIaGlPAMg
	/2LLvhocCaVoBxoUQx1ew/vD/NvCpeKBOn8sGJumejPeX9nOj2jhNao71obc4OIY
	lVoZ/AISLtFYyVbi1e1O2dXSIHzUEwEmocg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9hugy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:47:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac8116f6ffso186192a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 03:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792579636; x=1793184436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gWvlJD9jqoJDzMW6TsnVK/PUEbWsSXVaCGhDNvYutCY=;
        b=KfaoW3buMWcx/84GRsAvQrQGtmNyIyxJgzU8o4RDO/B8oNYft9tchHiv16M05ZslU4
         WJ0wvC62ev0dcaPHFcI+xEEGanwJYkgVKhrE0d4XmHcufOBqHJ1kyo+vwmduiU4x8fqr
         DyQ+hK3bK+K/pI9J39IHOpBItru/dQJgiVTDjWNVRDGno5tYy/79nbk5w59qpjufBAO/
         3cNTDqcscdlnv7YE8Nl0+sKA2vBgZy0iwudmC9ZvAKdrUrTjOBbdlOwBmJLEXcbdQRxC
         rddbXXbwLz5slZfh85Ye25NjFEJf3upoZOMRVzPEA3oFdtE7tk/IjQgUJ4J/aeaMvGS6
         scgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579636; x=1793184436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gWvlJD9jqoJDzMW6TsnVK/PUEbWsSXVaCGhDNvYutCY=;
        b=1iF/c9eRHB5234K6DqkM2Z6rVCuIdhtecc5CXd3wG6bbBjIMp48G2Q+J4BfUApoOY/
         1K6YbswjOEfRkvdO+VDWF/OA8Sg1r7B6EzmaRlTP7jjkLWBLXEJeEH6WSJAgcxRs7uUz
         zX1tkSf5sz5T5Pwo7Ie6/pOw2IJ+WXDEnO2vV1vdka4Djc0N4lV7v5xmp7FehT00MVon
         Vvglj+SsOvI514bd1/J8y8BGQ++6Mkn/TWyRHecaSMWFADI44NDxkWC0+zhkxCbuJ846
         7pq1wQDyQTHWEOo4bZisPuuydlfXKLKNuCOyWSNVyhJiORP4NsAbCiJZAZnSFo5Czy80
         41qg==
X-Forwarded-Encrypted: i=1; AKwUvBytQ83pFUawBKxu5uoyuvoUG0NROw5ZMPqd5yFAVKXNQGvKvM9TlqFUYW8q8c2oejRH129W/S6pp7IV1mSO@vger.kernel.org
X-Gm-Message-State: AFq9FYLVRJ6Z47AZQ9t9jCx3Vowl6vpmRzrEa5bCs9NdVt7b/FX0GhF7
	UT3JeFAvfTcW+6yR9f4s3Xfx4SQnL5wFT7kgtLoPWBDjzKaJCwPKV7YX+L6JdZW0rlcTaCpjkr4
	2cH83Bgkcy298dNTwB6V1QEh67WmFYyyv/YgTkTv1v339pR5oOaslXzKibsC8faYXTH6o
X-Gm-Gg: AYBFou0WZh902BbwdrqK7WwgGWaY1ZuFTx8wVmGO3mBhQWL5C3+1lPQZ2h0OOsrYIJH
	vq+p/I0XRamNgZtxmeotjoVOlzdoKQM85Roq0vsv2Jst5hNFVLqFs67+mVrhqT/n0DwG8qock0B
	UWs8eNUgQ3Jon0ssLtOqULqeSJtAwhMyXciP5y4kfJFhnSLrJe8K0h7I06/LsX8srPqqQAs3bdW
	4DoOOa1dKtmTNZ4ZaK/I81/G6TPlv+zKaHwlOGlcaWQGRtrgr1CpOCD080rmLdg8IXvGkDVsOkE
	48k8tyY6y866r0JV36dgBYSY33n8J2ZGJw0/uZyGznsRK8enYGwSiGbXz1z0jeBwECojACbKL0X
	5lSIfRpcNd9Awfc8ktI+3sdw=
X-Received: by 2002:a17:90b:4c0f:b0:3ad:818f:3db4 with SMTP id 98e67ed59e1d1-3ad86dabbcfmr2842880a91.6.1792579635944;
        Wed, 21 Oct 2026 03:47:15 -0700 (PDT)
X-Received: by 2002:a17:90b:4c0f:b0:3ad:818f:3db4 with SMTP id 98e67ed59e1d1-3ad86dabbcfmr2842844a91.6.1792579635532;
        Wed, 21 Oct 2026 03:47:15 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad85f6ff0dsm1619244a91.4.2026.10.21.03.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:47:15 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
Subject: [PATCH] arm64: dts: qcom: monaco-ac-evk: Describe the PCIe M.2 Key E connector
Date: Wed, 21 Oct 2026 16:17:09 +0530
Message-Id: <20261021104709.1428234-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad89834 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=9xWqd1REYw3mqEFhcE4A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfXyv0XtRobcbPZ
 x9FpXbVtGTCrguD9TUF1g3jvtlHsmKS4IPPMvty7O06csdi7ntiiT12JbaR/STmz85DhQentfjn
 9SbhwosJs/FpBMSMnstrP0wAb391Xvs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX0XzRLPSt68ce
 ikSI+Fgsl/fVuOP+x0L1jBuKMdrdXgo0hnlYP+v3drD/8Vkw6KsaliD4YhA0l84iJ40BHsJOfZd
 ZI5Q5M+tFG6qs7RytUTJVSu+aOuyp6zVbV1SLUM1fCzO5nZAzm46KRxcZnFPD695RGOSOL5jFQz
 SR+DILSrd0hlO2qalLfR6fLI42g7InW6iSUqYRxkEHgQLLXJTQD1XtHFT8N5YWX/t33bUzh7/sE
 BZaq5V28HdVfylGuiKPl2qxi285MswW+X3XKob9l6KdN7H97VdwjdKR4LGhv3YhQs3NzN2+AJaw
 GvaBDS2NYkYubz5od3xa04j3PZ5tWO8e1eQ/VlkhjkGQfduCFtMep2WUe83lmPgnZz6cmwRGh+n
 fd/cJIh2qsA5BKzQM0VjqvGagB5ScQ9Sp8b7evmib0G13rU8v5LkKBUgjOr62MtICjkqCkjGW7Q
 AEL8XpthaVGZLVL4taA==
X-Proofpoint-GUID: YHu7eM9El7gPDouszDg49SaRtf5lli91
X-Proofpoint-ORIG-GUID: YHu7eM9El7gPDouszDg49SaRtf5lli91
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210042

The Monaco AC EVK has a PCIe M.2 Mechanical Key E connector to
connect wireless connectivity cards over PCIe and UART interfaces. Hence,
describe the connector node and link it with the PCIe 0 Root Port and
UART2 nodes through graph port/endpoint.

The port/endpoint nodes are defined inline in the board file rather
than as empty anchor nodes in the SoC DTSI, so that
of_graph_is_present() only returns true for boards that have an M.2
Key E connector present, preventing unintended pwrseq probe on boards
with soldered wireless chips (e.g. qcs8300-ride).

The connector's 3.3V supply is described as a fixed always-on regulator
(vreg_wcn_3p3), which is required by the pcie-m2-e-connector binding.

Also add the serial1 = &uart2 alias, which is required for the
Bluetooth serdev device to be enumerated on the UART2 interface.

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-ac-evk.dts | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts b/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
index 6f3c3ffefe34..3780642fe483 100644
--- a/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
@@ -21,6 +21,7 @@ aliases {
 		ethernet0 = &ethernet0;
 		i2c1 = &i2c1;
 		serial0 = &uart7;
+		serial1 = &uart2;
 		serial2 = &uart6;
 	};
 
@@ -47,6 +48,38 @@ usb2_con_hs_ep: endpoint {
 		};
 	};
 
+	connector-3 {
+		compatible = "pcie-m2-e-connector";
+		vpcie3v3-supply = <&vreg_wcn_3p3>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcieport0_ep>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_uart_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&uart2_ep>;
+				};
+			};
+		};
+	};
+
 	dmic: audio-codec-0 {
 		compatible = "dmic-codec";
 		#sound-dai-cells = <0>;
@@ -91,6 +124,17 @@ usb2_vbus: regulator-usb2-vbus {
 		enable-active-high;
 	};
 
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	sound {
 		compatible = "qcom,qcs8275-sndcard";
 		model = "MONACO-EVK";
@@ -657,6 +701,12 @@ &pcie1_phy {
 &pcieport0 {
 	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+
+	port {
+		pcieport0_ep: endpoint {
+			remote-endpoint = <&m2_e_pcie_ep>;
+		};
+	};
 };
 
 &pcieport1 {
@@ -875,6 +925,16 @@ expander4_int: expander4-int-state {
 	};
 };
 
+&uart2 {
+	status = "okay";
+
+	port {
+		uart2_ep: endpoint {
+			remote-endpoint = <&m2_e_uart_ep>;
+		};
+	};
+};
+
 &uart6 {
 	status = "okay";
 };
-- 
2.34.1

