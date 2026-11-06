Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934150;
	b=yM2d9DHf0gwNiBDgYCo8zV5jvXkAnplkEYMTRL0PZr8p85a0y98gSi7HCBpQuTkkQKn4
	 4xusMlQQJ+2fuN8UWNXtQVVQFQDqgjjI0Cd2ac/EseVjYegCXu0Y2tcFWHxnNumUW7KNP
	 LFkVHa8mMAQ+A6UaWDsYPvgWsyXrXE0U4Lf9dTOcK8meaTV4K7eUYS3Vyee3jnI2Pbl6o
	 hFM2kI9kzLtA775wWSY4ntbsg57iw244SUl7yB+Z/uZk6mct1YBmqfgQF+W3pKurkTchC
	 9Fr3xLplJ2+cywc02daH7g9E2ULvJZL18+9uJW45I2FRuOgucQtS0MAUIL4QBqam4cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934150;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5UfA3BOUgK1alGio0S87cKIth7FxeOkstkWYSgowzaU=;
	b=uor1+SKMItc6uhLpI1Ysv8WcbpijUvHAd5yJI5zbYZ151l+WYWJO4vG97JRXT2HqOsFI
	 DrV8kd0LKmjuwSbO4pAY+huEN693tDzE43Lz0qm/tLObAcJFr1bGSdgvqnNP8B7DVrptW
	 7Omy2jiwGmz0gU2mNLCLOSzzdtmmnn80UTulusXYQV2Vw7r8nJMfyoGXeJbEQA6gontMN
	 30qkuXhPuCcTPdZ+bk5MdQhTttv6OBv207UWha+wRTgHDyPqdMDgWqk9ta9OTnxZuGEVR
	 AgXT3I/t1EtlcNQGMEQwVujeja2AzoNgaJjkBlWiP2YZSFDmWT4npe6l0FqkxRF6uMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lQnhAmDZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S0Izb9G3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E050A606D814
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 03:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E050A606D814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lQnhAmDZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S0Izb9G3
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5Net0e1911701
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 03:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5UfA3BOUgK1
	alGio0S87cKIth7FxeOkstkWYSgowzaU=; b=lQnhAmDZPR2roZQI0nbHuXYtDHI
	xQ1THM1bvUCvie+0+B2k3ml0HVSIzB3GHmI0YunAzicoLiru/hmf4hPmZUMH6q4w
	pZIRNBNOKYzKodlk0yZXkOM/FkYtfc/IEfexSoqGyfIB3HlSvZT4LyFVvqiSSKXy
	AurN9odzGg8zZhqejoMxk6ntO+KoguEsd4P5K8mjHE4Qinp8lTAyhsgTKKiHx/6X
	JxR4LK8PeU54nlob2b5q/YICNZt9VNACNn5vLHg1lO5Sg3dKKl+vEf+hJwsuV3a+
	cZUxuRtrCYh+9GWcHf05EXtoc36jw+QzWmv1Vr/Q33v0k0+POIQz8DywwXQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa0m18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 03:02:17 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36d2d353a5aso237091eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 19:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793934137; x=1794538937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5UfA3BOUgK1alGio0S87cKIth7FxeOkstkWYSgowzaU=;
        b=S0Izb9G3O9Hs3YnAlYJp1rXEWxSwBKoXmC4ZR17EPMb6HxEO79KKuOalZTps+Ect5n
         TJoZeofgew/XAtjudCpNS2sbYMvkqtECqPOalwYYDEe7KiT/17iATmMhdlIQll3C47eI
         zvdEmUIYKbHamlJguYaTxFD0jIKgA/Aoq0gZ9qvTxVuoKcK1MJMP+9ZHf7NLntR/k97N
         DpoH72vIKw++3sl/VxrT/vf/vb9MzYsZE3ZnWUwqMBhi9sWQzLn3vBbsEo2YmwXMXuSL
         WMINQ4Mow6EkIpPRxzSFj6eJbrR28zNxB2WAc/SiUqfCXYbLLmza/8511+bsLi7GvaBo
         vvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793934137; x=1794538937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5UfA3BOUgK1alGio0S87cKIth7FxeOkstkWYSgowzaU=;
        b=LjAc5BhE+0/tYjDIyPJL2ctJlv61Vf/A4z8EPMLPrP9H5cqAPu7jMxDyS49uLkKKrL
         E5N1bWPGhHBqkcQ22Ig5I7AHISRpsLfGHcRvDlkGSbYX5b5aq4eQSXOIUbJ0iiaZRS1u
         50DPEtMqM+LaGUdE9D1+zLoMXB3zrZHrUodC92+AIR9h5CbZVe1QI/IIGsLhTHYWl6GT
         e2rfoJBgIbV6Uw27NyblQK37Zl3EoqUyG1Xy9n3L+MrLCqh6CSImCqQUXu1viMfYtmRr
         TZZyJO3w9wlO594p42S8Z+kVtGFpcxiPKXU6OcovbG1FFKeklntMUMUzu2VAUjSbZdHX
         1uNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwanyjw1wCUg7VtGAinsWRYlejtWGNUV3Y76f+3Xe9xZTpiw0jqw4H9JaCU7bgejfxwTXFYvDZgOk8uDiSZ@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZtS6uGuqSbkD0BOEELQXfm22D2G4lpqIpFwUFWWVnGqjlRLJM
	BsjcIJXTovDy7YRsC/jkHsCf3FlYYnXTbzgaSLL89xoY9ZbL3rV5x7zHDdak3+2e61AjLkMRK3U
	gbkWuI/mMJoBBrtelveAzBeO1lBg+4RDLtcEhEhWlk8gFyTI3qq0MgArL/4WHcl3d21iT
X-Gm-Gg: AYBFou2LTlLZMcpnIKiGX/Pb1ceYSwBFbFnOVczBRU48mkIVGLglFqB+nbdwnL27cGA
	pSbVFJi8+l5LmPGdAGTG89J6Sjmge4L21XE4FC79nEKugmr3/qJnrVTD/sfrkzlYD9few0sbZMp
	PU1nGUBzJ6+NAOyPYwkp5jDKKE+yjCnzDk5HsmaALYKQDj72mehhuBcRUQwnioH9bZAvZH4z55a
	+mxkRGE1bGpTCWjZ7i2vGjGbNw88xsoH/2hHA/fiwoLIthnO0Dimgpk0y9MjwIXyOBvau/SLnhr
	aOFtWTiBRpaX9rDdpTdEnFxXXBO+6oaEyBGtzNXj2NnxTYr4gsE76hD9RIJbGjln7DTn3bQDwsi
	JrzuZunUCcxNd1dECg7/SkpBrqUCIx97mA025hmtBlLEL/ncOqAzazP1jThNuondNw0K87TpYNA
	SOglqsnfioOKO/2c4JXqbzCQn7wA4=
X-Received: by 2002:a05:693c:6205:b0:36a:79cd:12df with SMTP id 5a478bee46e88-36f77bee0c6mr1721575eec.9.1793934136516;
        Thu, 05 Nov 2026 19:02:16 -0800 (PST)
X-Received: by 2002:a05:693c:6205:b0:36a:79cd:12df with SMTP id 5a478bee46e88-36f77bee0c6mr1721532eec.9.1793934135921;
        Thu, 05 Nov 2026 19:02:15 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm1484905eec.18.2026.11.05.19.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 19:02:15 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] arm64: dts: qcom: monaco: add CSI2 PHY common-phy providers
Date: Thu,  5 Nov 2026 19:02:11 -0800
Message-Id: <20261106030212.2811027-3-anusha.nandi@oss.qualcomm.com>
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
X-Proofpoint-GUID: 7MLtTnUGsMmNWbGloh7u9MzBbzEm97S3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAxMSBTYWx0ZWRfX2WCy/Cca3wyP
 9+fr3bXItUpsc9msoTdVlDFKZX9g5k98Lhbo38JoJHj6jkh1lGFdJkiGEXzjv0TNvbobeFZLcUd
 +Y+anRhPKDs8ReqSIzGK0whwgZaXCgavzKOw8fs0OWcCRk0u3rMxTE3TZVde1NoVTpqIPlBwcdl
 aNNFxLO//Xro5Mbbl/5ECzm6ObhHhcNN66n1Le9O9IwSReiCjO3lIbuLumr7loK8VLo1gMbav3m
 TGWpbmIjhi9UTVG3KjR5Lrn6nBVLKfHaPN5dnnAoYIWDid8b6C52XjwZPED835ruZcEk4bXWcTj
 o/ZG8rZFJsPJ5PQnuxmRBI1eJd+SNOUjyn5a/beAqjpVTkjrbnXcQ64y3DvT5FVUgmEXr54rxH7
 9wiqmphySjac0Un/d8wYJe04AM6Ih09vtMOrNHJWlT/6ONnSRvWWMOfuWw7C9UONbzRjQrcptFj
 NGMZNN6++SxYmnWZ30A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAxMSBTYWx0ZWRfX4VcEd4fvqq9x
 QL77MVeCnzqV91yyJLm5Ze0tO4dWuW7E+K0tIkFM/I/YDMPRRIhGYdPzC0Nh05pueMf0FRXAQcn
 +WTMp1TdIWbCoV7e/FJYPa6/bhcQqSM=
X-Proofpoint-ORIG-GUID: 7MLtTnUGsMmNWbGloh7u9MzBbzEm97S3
X-Authority-Analysis: v=2.4 cv=CaKdd7rl c=1 sm=1 tr=0 ts=6aed4339 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=n2D47ajo8674fvOcmZAA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060011

Expose the three QCS8300 CSIPHYs as standalone
qcom,qcs8300-csi2-phy generic-PHY provider nodes (csiphy0..2) at their
existing register addresses, each with its own OF graph (port@0
sensor-facing, port@1 CAMSS-facing) so camss_detect_legacy_phy() picks
the non-legacy path once a board wires a sensor through one of them.
The camss node's own reg-names/clocks/interrupts for the CSIPHYs are
unchanged, so boards that don't use a provider still get the legacy
binding.

csiphy0..2 drop the extra "csiphy_rx" clock: QCS8300 binds through the
sa8775p soc_cfg (no dedicated QCS8300 camcc driver exists), which only
declares two clocks ("core", "timer") for this PHY, not three.

csiphy_opp_table moves to the root node, not inside soc@0 (a
simple-bus), since it has no reg/ranges property of its own; its
opp-300000000 entry is dropped too, since QCS8300 shares SA8775P's
camcc, whose cam_cc_cphy_rx_clk_src only defines a 400 MHz rate.

The provider nodes are disabled by default; a board or camera overlay
enables the one(s) it uses.

Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 104 +++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 35fbee63d4c6..a66c04a1d306 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -644,6 +644,14 @@ opp-120000000 {
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
 	pmu-a55 {
 		compatible = "arm,cortex-a55-pmu";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
@@ -5577,6 +5585,102 @@ cci2_i2c1: i2c-bus@1 {
 			};
 		};
 
+		csiphy0: phy@ac9c000 {
+			compatible = "qcom,qcs8300-csi2-phy";
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
+			compatible = "qcom,qcs8300-csi2-phy";
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
+			compatible = "qcom,qcs8300-csi2-phy";
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
 		camss: isp@ac78000 {
 			compatible = "qcom,qcs8300-camss";
 
-- 
2.34.1

