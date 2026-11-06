Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934138;
	b=xGRyl9W9MMW1k5t6YmNdLiVIc3TZ0rAm20DYZo4+xnGJqK6GflmgvYcGdtZmyIUXJcuJ
	 pwwAoxURzOuTwgV6qn+V4ABntdW8jJNs12H/43lla4MRTvVrQbui6sndEVmsb881uwV3y
	 cVi5bVZ5idPDA9rCEzuHzEegbYhOhrJQZMxyXzrJFIQNm4lwzaA/jiFmTblLdHqGgHtSO
	 H3VSuZVEJHho/GkOH7EsyG5hdqfcHPM/TmMFKZFOHF1VeKCDZzDOVVRSzQ+3E5ND/o1LH
	 ItjY7bDKmR/sd6ILYrlrEre6vYvBQUHieMeNlEA0gKlnzr+2fBWKah9XpTwXgCBYsEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934138;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=B+aZU5rer7hSNVXElTsxzUZLFCGRIQh/JmbY4gqYPCI=;
	b=k2F5IqgUJqR6uO/iPXwaNtzpNuDHlOqg5fdzmS1yhEeh6yn+kxkkwQplrRhjP4vgDPhb
	 pJGex4GUsvqJiKfXuaN0ZOC/6+99u4ypdJCzuOSLYPZPRYKHaZlkWVe5+PuLFpBbtODwA
	 3SEZICUqLkFzQptyTeEWaFAIQ7gcoXyhhf06eOQV2o1xFCI8AjDKlgkbivEja/9qbXTOv
	 u0rJ3XvAW4D0LL761dP+PdhMBhZEjjPNo7Tapii+ulCmwfGSgR4fyIyUPcMdN2443QdkE
	 VjMotKOgH1sO/Q8M6l4w1l1pNsoPMaM6yYfCQ4CBH91kxJKp5fvCrCQzsQPSj2rAx0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=End41XFB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Eh0+kJG6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D003E606D807
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 03:02:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D003E606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=End41XFB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Eh0+kJG6
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5NeUBl2274211
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 03:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=B+aZU5rer7h
	SNVXElTsxzUZLFCGRIQh/JmbY4gqYPCI=; b=End41XFBAz7Du18ldm4B83PCl7W
	CKtzN0kqhAmMFZWbS0jZsh/KDptMS4MiUZwKNLgTZ7N7WPLsoR+OkUiKhXcibt8V
	dejjdhCx2ivyQGSsL431QxNMnfdMlStjT0S0u2+BAL05lpfLkwiybSWBDiyDMZ/z
	L40jbVfmwHAYi+06ONO+KhtqAJboIFLqbz41mXYnic5NqgUTvPhxnq0HCg46q2CN
	DDFWkenTcbH6DsKVI8YDYhU93yShVT/SA0K1glae+auayCD642xgHq4vnrAFOjRN
	ykFzk7UO6/z7RjCj/LcaSQMYdHqmNJEmW5m1XpBLgjGwhsZkJlkU24yiWrA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa0mt6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 03:02:16 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso370095eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 19:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793934136; x=1794538936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B+aZU5rer7hSNVXElTsxzUZLFCGRIQh/JmbY4gqYPCI=;
        b=Eh0+kJG601QIIrmHxdH95/1+C3t3C5mypDAorhRJT4a4RFYxJTKiL3MaPLXptlcjKG
         Ut0/n5adPpFcYNaJEsKseX2DpW4m+57nRC7EaFjNRERs1sQreyq2y3Cio0ISVuOEMJdI
         W2uTepslZEPL83h2yK3cV3cdHiNOCDlmlJkQV6O0DA0CKkueGfp+rGVKgdPj0WO83OhW
         zbLNq3qV4QD/8okh6hnG83gPnawox5iDPrQT8P+Wl40+VA9qu/SuvT7IF+MV9/5Jl+8f
         YO449/to0BlQendH+QlBM3X3xXZ/48hsWCLrNuUBUFZd3Cjc16V5n1FhAWBPMMxysQq6
         nlNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793934136; x=1794538936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B+aZU5rer7hSNVXElTsxzUZLFCGRIQh/JmbY4gqYPCI=;
        b=gEsvNojrQrxN9OfT/i/L1SeT547SdnV7TCnHHngp67xOaqx9DASdL7gYKlDU3gNKPk
         GQK+N6fOS63BYQwSyry3gdUDm3f8JbyWNLuRwf00qsF/q1Fi2BuBAOzH/zyi65tk6Eha
         v/wN1JwPcGXyPxLDSVXH3MtR4/9MPXQF5Zf+Jk6UCbV1AFQKGIs1Lvz85htJlaY0frm2
         ckVhX0I27t8HFPVkFR1zIOYzKmmH+CEAAkSJZ3Fy+b9nIv57Z4gqBC+z3qxE2uanZU9O
         AM4XgmRDWxucIDNnhEBWOj3Gv0EMy8xLehl2cYnygZXf44Np71fwlTZJj/PlyuOfAvTI
         14xQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVpuUXCqQCCgHauOX1aCjEx7aGVt/NadlCg3K3skk4ZquBqVN2S2kGPDbuShsWSkMJHbGWLUj3tZY94HIl@vger.kernel.org
X-Gm-Message-State: APuU4Z9yqyQcBQvjTciIzQ7Ti2+QlfJpIPkjoaj1TW98C7xrNbaCH9LO
	ATsXL/6ItH7RnTmqn9yTN9BW5t3NTBVtizDjoq+LBBox6bCjRcYp6IZ+BD1O9YP5/GrpRDERXEa
	YgSoxNB7YuSAvhWoBQrho6H8bcYwJTQin9Gm7nBScPHvKUnI32UTOz2ceO/JvUBjhfOdk
X-Gm-Gg: AYBFou2hMhemNSyxwTiJ19Zdrr6ddPT6BwIPYL20c8zFa8RJpRXwEK8Qe0mVCTPKKKM
	5jdyuRKmQqkqnkD7NC2khQV30Uopw7CREC3L3Q6xyNfuvUT9IWslgIr6YbPGRa4rUIIYA4qP+uC
	KnJqiAzUL6DFqqLF0YJVBVhUXz3HxThZNvyGKDzXOV3nerBxzhnm9WeqtY+iGZCyIiMFY0WJTOg
	ca6LonilSarAEsN3pfUlMkYfyJwNk8LQyKlo7pX18JYpoyYYkinTUjj5QItPeYCgGYCSellkyG7
	SixW5ujwZ1C3LQzMC98t7B8AAqSJgaaCL1Z9k2s5f3n/sGKzDxcH8cXajNxJSVb4TzueJCih0PY
	ntGu7dHvFuv/vKamA/TyDxc3QdGeHnwlBCBDo+LziGAEs/rjbHq/CSfOf4bd92yqACfbv+RyQTv
	XcIWQ3yETcfXoE+BuE6iVKYZ7Zd0s=
X-Received: by 2002:a05:7301:18ac:b0:36c:a084:30a4 with SMTP id 5a478bee46e88-36f75b1f65dmr1645456eec.21.1793934135659;
        Thu, 05 Nov 2026 19:02:15 -0800 (PST)
X-Received: by 2002:a05:7301:18ac:b0:36c:a084:30a4 with SMTP id 5a478bee46e88-36f75b1f65dmr1645407eec.21.1793934134947;
        Thu, 05 Nov 2026 19:02:14 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm1484905eec.18.2026.11.05.19.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 19:02:14 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] arm64: dts: qcom: lemans: add CSI2 D-PHY  common-phy providers
Date: Thu,  5 Nov 2026 19:02:10 -0800
Message-Id: <20261106030212.2811027-2-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106030212.2811027-1-anusha.nandi@oss.qualcomm.com>
References: <20261106030212.2811027-1-anusha.nandi@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAxMSBTYWx0ZWRfX6z9i7QTw5IDb
 2zGoBbo4feUezeqdncRSaxGPNIjB9+tipJMROsEsldu7fWxnpcIrAQuWXgTDgNlApgakpKTlCPv
 MvAqQ3GiNWxHQp5p4ZRAefzspj7cTe/Syd2TTYvmYyAN7fZhgb4xFOqMXtuKBBMo1TRiEsTFSmK
 KllYIROpX6iA//09aUsCjr4J1i1AO7YG+Cxvbq7lp7B+qELx1ZGSLdpPE+rWP1IFAlcBzVeO2FM
 BPKRK666jpoL5O1H/y6nCKeZUGDkiyRNNDnAXLLu4KORK4WVJ0gtMSM3ZDjcatzU2eAGor6R6/c
 R5QRfx5icq+qMV+ERmR/RpT2fQKR2XbCAyj1ebRmu5JFdynYbwDOjCVGpoAjqxBffyrojH3gtnX
 qe42ZBxY3xNeB4FnnlrG/OuuK+887XSE6M5SITnuookiW6DaDd8VBEpb3IwNgxNuzX8JkoN/LgY
 GMShH57AdxIwd7FU4ow==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAxMSBTYWx0ZWRfX4kJ9j0oaQHVm
 1mi51AqWls2YgHV8BH2wfGlXzhUnF1tmY+lQ7ph+ZaT8e/gOQYobk8T+Ao4z+JXyrP6TqKVaf2I
 AqKn8ZEBg/B0/VN4Bp5BT8b8I+nmpf0=
X-Proofpoint-ORIG-GUID: T5gNMChOhCPtJ5UjCAF9MIrZD44oXc0y
X-Authority-Analysis: v=2.4 cv=GpzXaU1C c=1 sm=1 tr=0 ts=6aed4338 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=jASa4ECRWJhfWmzZHB0A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: T5gNMChOhCPtJ5UjCAF9MIrZD44oXc0y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060011

Expose the four SA8775p CSIPHYs as standalone qcom,sa8775p-csi2-phy
generic-PHY provider nodes (csiphy0..3) at their existing register
addresses, each with its own OF graph (port@0 sensor-facing, port@1
CAMSS-facing) so camss_detect_legacy_phy() picks the non-legacy path
once a board wires a sensor through one of them. The camss node's own
reg-names/clocks/interrupts for the CSIPHYs are unchanged, so boards
that don't use a provider still get the legacy binding.

csiphy0..3 are placed after camss (ac78000 < ac9c000..aca2000), so
soc@0's children stay sorted by ascending unit address. Their shared
OPP table lives at the root node, not inside soc@0 (a simple-bus),
since it has no reg/ranges property of its own; it only lists
400000000 Hz, the one rate SA8775P's camcc clock driver actually
supports for this clock (ftbl_cam_cc_cphy_rx_clk_src has no 300 MHz
entry).

The provider nodes are disabled by default; a board or camera overlay
enables the one(s) it uses.

Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 136 +++++++++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518..6909dfa06d86 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -545,6 +545,14 @@ opp-100000000 {
 		};
 	};
 
+	csiphy_opp_table: opp-table-csiphy {
+		compatible = "operating-points-v2";
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,armv8-pmuv3";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
@@ -5348,6 +5356,134 @@ port@3 {
 			};
 		};
 
+		csiphy0: phy@ac9c000 {
+			compatible = "qcom,sa8775p-csi2-phy";
+			reg = <0x0 0x0ac9c000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
+
+			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy1: phy@ac9e000 {
+			compatible = "qcom,sa8775p-csi2-phy";
+			reg = <0x0 0x0ac9e000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
+
+			interrupts = <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy2: phy@aca0000 {
+			compatible = "qcom,sa8775p-csi2-phy";
+			reg = <0x0 0x0aca0000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
+
+			interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy3: phy@aca2000 {
+			compatible = "qcom,sa8775p-csi2-phy";
+			reg = <0x0 0x0aca2000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY3_CLK>,
+				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
+
+			interrupts = <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,sa8775p-camcc";
 			reg = <0x0 0x0ade0000 0x0 0x20000>;
-- 
2.34.1

