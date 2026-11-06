Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934140;
	b=Ab2OIQxrcM3ymph5up/fKWAC7zj8bKRC/vvU9JPjFnyBqdVyXE5TXB+KbYrQg7ByvHtM
	 XE+yDxOeDUD45loozoMXLjOeczBzY/DAIahXiSsekiE6q2U9axjedHHnxYX3vSSQjbCOs
	 /yPR0wfSmXqf38YXGWT8BMdV3uNyFRPzt/CEbBtFD+6vJ7FKcWX/9Kuzl2/t+gHLNOcxM
	 Tpq1JJNwM++UK8LDWY/PuSMQ8kDe7Ghn3EdvyG3Xsi+N0ritynAqHPvNtUbXbeAqU/AqX
	 1UTGkdotb5ad2C/S+1/2zkvCzvM0+GF9AWRgu4xNMCPQQHD3hanb4gSlCj0KTZ2vOkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934140;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=o2l5lE2agnBc46p6ZVGz7RTUuNthTwntTbR2yxLylwk=;
	b=v+g5S8+1jjgExfoIrhGZkpNZYVWieNq3oV5FcaiD8iQbqiu/M40rhkk1g9XSpWfyfOq/
	 6U+zmMYEqiRq2d2ghgPPr1tH95nE4qI375RfNqYXsOfEA5X9E4x8WuMGBlcRR955KlUCD
	 /4GNMBbbJjlmgvqFRndK9NodMiSOqYO3tY09DXO3ItzHzWzsB1074+Y0C3Ko3lQ9vBP3Y
	 yKcHWwmP1p9GU+PBinR0xXLOhBb7hVdJA+7sl22aWN5xhDXitlU+5FiY/4J+o18H176h+
	 cYMQfNxYJe+ogvWW8kqjJ9m6bMJHFctfkYTZrGnSKg9zNTf04Qc7Bf17gOl2LRP9cZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CisKZ4zZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O9ROR+oe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD72606A331
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 03:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFD72606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CisKZ4zZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O9ROR+oe
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5NeqW91170834
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 03:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=o2l5lE2agnB
	c46p6ZVGz7RTUuNthTwntTbR2yxLylwk=; b=CisKZ4zZGcSIrdbLlgAHQGSZfLf
	rTCkfPeWlEXm+SkeAuyS/xP08wsfZ4eyVjeTH6aKBAjPBPGQ+5Lh4Ybt1yv2Dt2o
	fmXEdhVrkuO5YzQd9S9k/yREHk6/xDS9nHumLRU8/8HiRCdaajRZ9R94eOU7pZjI
	MI/WjTpR6CJ/ozqRTudEgLjBiim2VoEMVyp7NIhapqGz+o1laKF444G1UEkfjdiw
	P76+NKSFpmWjsSytDXHICRWAeZ4vbxF1M3YqBv5VkKwQ5OkwP+QPS+ivSmPHUbig
	HAgzQO5LRBPY5320qFuF5NSTNR2E3N/3rtVbRkbCCd3VYiAXKi155o2WB7A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa8kn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 03:02:18 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36ecd5db581so644178eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 19:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793934138; x=1794538938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o2l5lE2agnBc46p6ZVGz7RTUuNthTwntTbR2yxLylwk=;
        b=O9ROR+oej2NAIAwl5o879Pzl1tC60oR04fbyUR/IkZuMdWbSNKJAGmkgCJBTaRrmcl
         uLeEkqsMPWORPqzkYBxkyLkGiYzU8YJ8/2gLTyYqPIWtoXY+b2SCqLEc9ePJRkKXFPjf
         79wd3KU08jyT/NhTI2z45CtHuQ9SL0IutINh/6qIcAjbEBIpP2nCJJvi27tE3ZjgopEE
         5sQKX0LtcLYgAOWQ6mGyus0g2DjcDcKMWtWKKUmMeeWd5BbjQFQHzr6am7bsaXq2UYmq
         DvHmt+tzPYa42WjWFw2Xulo90gLD8gleVw4m3pZDVCN/awTPsXc6dLqgEp5Ia2cS5ftl
         505w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793934138; x=1794538938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o2l5lE2agnBc46p6ZVGz7RTUuNthTwntTbR2yxLylwk=;
        b=NMxugo04MRHzaA0AwqU5Xppbf426c2KK1fdJ1mQh4HRWXSrXkhnc8RwxJG6uUwgrta
         Mt6LcnOLHh2bpFW9hR5fgYEVpvJgmYLFE9Xqr5Q4NSGQYB9nu7Ggemb0G06TKOmUM+UZ
         9eYnPZuyBEvu/18Eg6DKp6vjTD85uTy7G1AtVrxTtPoUfOzrg4duKpcT/kmcTwLO/0sa
         r8z434la3PmM2q5hV2LU1h0QM8nuWFvhS3FlDNPujtqor4rkDISRSt/KbCJrjZZfOIls
         2qm8rzTAGTZDJUiiC3XB3/mF4DG2GtB+5GvGXe1OYsdrGIO9vYMPETv7j+PcE8TqxA0E
         Y7gw==
X-Forwarded-Encrypted: i=1; AKwUvBwpmnbi9wqP1oi7u1B39pDchJ1PunfdkYK/MQhpgP9mmaa33rm+7zqKN8qLBZfr6BXHN0WRlsC+wFE/CHeC@vger.kernel.org
X-Gm-Message-State: APuU4Z/bk5lWcEchsbqbiDzo480E+mRgsyIAbLJ1PNeIagdqfr76Eekn
	HEzirCc0iQ6BckSQoLq76/Kohn+pNToOsm9PXEzhJa3p5qoPHli8548WjTNoY0neRxCof6iNPEY
	CE0z2lh/hn/1V94BOrnRW1gdLqxzltsxqTE6s/LBW2Fby/xpJFVIWhCjmMsL8N0cG1qWS
X-Gm-Gg: AYBFou0/NUmrm9YNJWpaJy0Qy8o4Esm0RzFRgIdoFHJeTiXvwAsnoirrIBCMTwOTPiX
	5kIv/Gw545xLURb5RM25tS1I0R0P/tYQKIO53ViJJxkWW4pOU8Q9htWXCnGw+ggTiRGkT975tVk
	1cTTWld8C3BTgWhcyI7xskI6L4a8Dsiz9jIBr5BEOKSApznzcs+SGI4HnAaYk8BUqhnDLIOxbA2
	pUCyXeW+tzwu50krpX76Adv2zrB6GvNASQy3q+SpzMu3eSmgYvyzFakXhWX3MByx0k78B+GDwxY
	KS/frDKCDvKYZoc8a7q9bZp54ZpE/CDwySGab8lBzC9D6f/dG73B/G2wzNY1KvEXPxGSEyHLi4o
	WIqsM+gYEAfikrHHofJ2alFNXz8YHHltXPch8TRrfXbYszw+GoIwkByQk4S26rrHNcFze2XT7z3
	tq74Z61kn3oH9GfToKEmBZxj7EZSE=
X-Received: by 2002:a05:7300:c8c8:b0:366:c497:610c with SMTP id 5a478bee46e88-36f770080f3mr1595217eec.33.1793934137466;
        Thu, 05 Nov 2026 19:02:17 -0800 (PST)
X-Received: by 2002:a05:7300:c8c8:b0:366:c497:610c with SMTP id 5a478bee46e88-36f770080f3mr1595163eec.33.1793934136867;
        Thu, 05 Nov 2026 19:02:16 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm1484905eec.18.2026.11.05.19.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 19:02:16 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: dts: qcom: kodiak: add CSI2 D-PHY common-phy providers
Date: Thu,  5 Nov 2026 19:02:12 -0800
Message-Id: <20261106030212.2811027-4-anusha.nandi@oss.qualcomm.com>
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
X-Proofpoint-GUID: BuhDMitViSBZBtGH2IrCUqFpOLEVLfaf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAxMSBTYWx0ZWRfX8nQ06j0PJfBD
 VyRFb3bBgooGokv0n+awGqdpYvueOReZ1a695zETKqPlc4L34rg4+ZyVuNUnViIpuYjqeQYrNDB
 sA/llCIy99x9dQUTC/23og2K6DuIWDF8yIEmNRJpjeifczepgwYwb6ICcaTmTZ0tmlrgwSmci/Q
 qLwG2Ho5I0fDqhte58B/mFdLfKYaM4+1H9szI9oV+S4sWE2brWzxpEfXagx80C/478oD99lmRYI
 vuEIT5md1Q1lMNz0G/bZebRIz2MN9zz6EXvCsgL1bKa+YQ4x4vNlY6UO7p7xD4POqGYloVNgxVy
 VSkef/wUYwuAL0wmWegBOt2oGZVPoAgbYl5szi5UzvxM4AiiOKWUpZrB7LShJ4fYd68emA9P0IE
 nVcOwYimVpSYqFePWUQ+JVqUMH4W/sGYvmqtw8SJCRFkEpxzMXMGzxMAbY6f/73C7iAdNfZLJkf
 8o5SMtENWLqCUZDVrnQ==
X-Proofpoint-ORIG-GUID: BuhDMitViSBZBtGH2IrCUqFpOLEVLfaf
X-Authority-Analysis: v=2.4 cv=X7rHu2Te c=1 sm=1 tr=0 ts=6aed433a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=AEMvfOE69tE_Q1r2TxsA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAxMSBTYWx0ZWRfXwOaMGhEd+drM
 nAUGQguhRfpQ6/b6ABBXqNCiG9Od6PwSRi+6AsHCyyabf1NvFFWLmPIWZyE0KmkHCuShvqQib6J
 6omGA4jbvnvEY3dASMsewojqwsmNkVg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060011

Expose SC7280's five CSIPHYs as standalone
qcom,sc7280-csi2-phy generic-PHY provider nodes (csiphy0..4) at their
existing register addresses, each with its own OF graph (port@0
sensor-facing, port@1 CAMSS-facing) so camss_detect_legacy_phy() picks
the non-legacy path once a board wires a sensor through one of them.
The camss node's own reg-names/clocks/interrupts for the CSIPHYs are
unchanged, so boards that don't use a provider still get the legacy
binding.

csiphy_opp_table moves to the root node, not inside soc@0 (a
simple-bus), since it has no reg/ranges property of its own. Its
opp-300000000 and opp-400000000 entries are both kept unchanged: unlike
SA8775P/QCS8300, SC7280's cam_cc_cphy_rx_clk_src defines both rates.

The provider nodes are disabled by default; a board or camera overlay
enables the one(s) it uses.

Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 172 +++++++++++++++++++++++++++
 1 file changed, 172 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 8c7523602d27..e0e1fef7882e 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -968,6 +968,18 @@ opp-128000000 {
 		};
 	};
 
+	csiphy_opp_table: opp-table-csiphy {
+		compatible = "operating-points-v2";
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+		};
+	};
+
 	soc: soc@0 {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -5164,6 +5176,166 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		csiphy0: phy@ace0000 {
+			compatible = "qcom,sc7280-csi2-phy";
+			reg = <0x0 0x0ace0000 0x0 0x2000>;
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
+		csiphy1: phy@ace2000 {
+			compatible = "qcom,sc7280-csi2-phy";
+			reg = <0x0 0x0ace2000 0x0 0x2000>;
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
+		csiphy2: phy@ace4000 {
+			compatible = "qcom,sc7280-csi2-phy";
+			reg = <0x0 0x0ace4000 0x0 0x2000>;
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
+		csiphy3: phy@ace6000 {
+			compatible = "qcom,sc7280-csi2-phy";
+			reg = <0x0 0x0ace6000 0x0 0x2000>;
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
+		csiphy4: phy@ace8000 {
+			compatible = "qcom,sc7280-csi2-phy";
+			reg = <0x0 0x0ace8000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
+
+			interrupts = <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>;
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
 		camss: isp@acb3000 {
 			compatible = "qcom,sc7280-camss";
 
-- 
2.34.1

