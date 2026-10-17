Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D328C19BB3
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 00:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792195890; cv=none; b=VY6kJCQRj3NacRlx9EQMS9IGmrWyH4ZJOTESXQd9wkVO/Aku49aUx/DS4BlmJTAZF4KOGapgtI9tssVdgeoOOIcqvR1ODgxRm4Kt/b7QSY75GeqppTUtAt5EtYFmNUnlyJ2Ia+oJVF3fUrXK3JimGR8/1EFJKfDxwQVxC/J6q1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792195890; c=relaxed/simple;
	bh=GncZ4YssOZVlGgLiEAYbI+2z4+k/22FvhlxQlnwN20c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UzVo4XR6GhFBZLbOXO8no8qYPYWQPbfO806d3i5+VE191efs9QkitexuCQHuagZh/Pp7D2Dxzl6Uvy0CieMmVCsYs1oOMgQ+8NquJyTM75J1d/M5CrWC96gVHKDWSfrfcUDS3R3MyUDlHHdMUFOAQC7d9TMGcb4RhAelSdZ2+SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dR1UZJHM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ESUfl5TU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dR1UZJHM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ESUfl5TU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GNFJC84173796
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 00:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SiE+QSa0Nvv
	sbAwwK476XtO4f+nn9xs+m6bRdi4G9q8=; b=dR1UZJHMeBDfjW8lc+FeUhx9Fot
	pJvilkRvUBtIMxqi8uuTfFfSWY4V7dgVR/hi0AzYqZwtcnqL/yKR+hact8yMTo7D
	i9FvvbyrartvdgueTJ3JialEaiDLII0O71w4NVqHnnV2+viqkzOpi4DeZiRDTAJ5
	D0bl/ngGMKT2D2/x6Nd+D8tC9pFF0K2g1qz/hce4N7j4lkea516tvdj8lEIVU6l4
	G1s9BYwoLjo3BcY2AXrH/4Nk5WMIPT1rh2OcDJNAyCvdf/Kyg/kN5w7EeiM0fU+P
	719V3HWYRM8FsNGh/rTcktKUvDxF35RbSnhZc8ajFOZc58LKTUuCcL81YEw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbq451h2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 00:11:27 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-17dc865c94cso143801c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 17:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792195887; x=1792800687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SiE+QSa0NvvsbAwwK476XtO4f+nn9xs+m6bRdi4G9q8=;
        b=ESUfl5TUeeWXRCwi9G0ZRVLoqmGGSyWY01qKocxQiS/cTUn7S+l7ahaNhR3XVlpLDN
         md/ANRURiyyOezkCLhxX+SXWC3khOULFnA0OeK78bIbZjkHV8FzytgnOa6c5XaBXMJoL
         0oSp7XAReIWLgvZ6aiU32NP3Wd1T0K9fJJX3+17V4TjiC58MRmQl+HJhKpKeDAia2222
         JpJN6kGzb1EMlNeHx/tKWKfTRz+AncWG8DyKNm3tb1IcwA1Janr7KLhURfMcFtGpHBbU
         6PVUIp1XntBnS2Q7s+5q43vKzQt2DdxoO7NxiuS/2n1XEuRspMdeytKoNhXSJfzLK7yd
         8rCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792195887; x=1792800687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SiE+QSa0NvvsbAwwK476XtO4f+nn9xs+m6bRdi4G9q8=;
        b=JiyvKw8RQFHR8jZ8e/matybs+6SZPdd0q550gOZ4Tvy9/8GLptt9gTqYjcE/URbJx9
         /XTyKNnrEkifPzbvDt4hXmZpDyanxkMiBxbL8cFQpjXI2VuQaIINFJXCyE+fUvKNSRTm
         SvVIc7+vpU5DKS/RZXqxT+EnnwLrCi2D+xNe5oX1XlJT9Owe+4ysVLD3r7YUNloMozuL
         mLpQQWGK/1XIvesjiBLHYTPE4SmYClMyh2q7sv/5uc74DAPIty503/79ndAWMxLx0UZS
         KiD5f6e+sNj20VP5euD2a+JwWypNfFB1hwhaZ0DZnfNZCYeOY186asJtcRphiazQtu34
         XK9g==
X-Gm-Message-State: AFq9FYLAzciXL+MBdpYJYzzXz8H1l6H9Ls4eCBGcIQE6/QiyO6QVxJns
	YpApCCcj/cYpLIqxu8MQ0egura34vAN9gn1EiLcOqo6GHesD3BbDHOtczjy5E4nsr+OTBOnLy/H
	QYMcTFgAi/JtFHlQaq2nDoESyYhjfWxkYdW/aYTxhxEwYwK0eb2IEjCK9hZfVJpCAH5l4
X-Gm-Gg: AYBFou3BYlo/jG8d4ZIF9Xr3fu+qDldzs4U6pKtIVedos4R8x8oBES/HauDYuRznX4j
	XAwlAaezgBpX+qp0BAcxatiwZfTfpvrQrdvmi2ErV2wH7sUuk8S3vBA7ItSQS53Z5C8FzzMUYAZ
	kvGy0ctRdKYZbTeFVT7cb72YcpRi6YZ3YUbjiv5UuaftyFPSXoDnjHrF+KpWjX9hT9FWXmGqrPL
	Qd9i5YTONg1BKnQ6LJbeLmrBgTa7fJPHZC33Cx+Ma5GoxDV4lnB4/0tVSrbfi9h2/NLO9EaeXxp
	xEV49IpHrfFBenkNvpl1P93tX3xjmhHGTIw8KHQx+Dp4J6Y7sGa8jMtRNyOZww93M+FPggoy05F
	0cUCPJEV4TYavXKBDtkH7OIBSQlXj+aMhxVEf5bYH+0TakJjAaUxCiA==
X-Received: by 2002:a05:7022:b050:b0:184:329d:eced with SMTP id a92af1059eb24-1851267070bmr1803695c88.25.1792195886562;
        Fri, 16 Oct 2026 17:11:26 -0700 (PDT)
X-Received: by 2002:a05:7022:b050:b0:184:329d:eced with SMTP id a92af1059eb24-1851267070bmr1803668c88.25.1792195886012;
        Fri, 16 Oct 2026 17:11:26 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm13441361c88.11.2026.10.16.17.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 17:11:25 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bod@kernel.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        linux-media@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
        daniel@quora.org, konrad.dybcio@oss.qualcomm.com,
        christopher.obbard@linaro.org, alex.vinarskis@gmail.com
Subject: [PATCH 3/3] arm64: dts: qcom: kodiak: add CSI2 D-PHY common-phy providers
Date: Fri, 16 Oct 2026 17:11:16 -0700
Message-Id: <20261017001116.2318647-4-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261017001116.2318647-1-anusha.nandi@oss.qualcomm.com>
References: <20261017001116.2318647-1-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: MlgcLwmY72IZtoI9zEVDswH3rGwsHx9f
X-Proofpoint-GUID: MlgcLwmY72IZtoI9zEVDswH3rGwsHx9f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAwMCBTYWx0ZWRfX3WFl5KRooW6s
 UbTK0jfrwTE/1DwUgSUXiKqoOUhQu76eYUYeXpzddL+fvJEBBT0K8oJfEZUPaz7oHcgPptzLwvA
 LX1bWc8iqsjkvERD+8QGlXmsEM8QUGQsptF9rPIo43AzNX0ikPweITA1gbVFrSHkqZGlUW6mRds
 2MNYYTwIM6bwnXdEAcRkDAsIL4P9Aqx+sJ+8sKnq1f9zPea8E0tES1BPiUEav39OhpoBvGtWceT
 Et7B7brg2yvQUuU5wPR3LBQPvbnd50CkARPFU24VoucwW4qhdeL/BR257nZYbhfaGND/pXv4+Ol
 cA7/YwgFx34lbvak3Niny7wVzN8aaq//KP0vJg6vI5bCMKQPxjRs7keKZ0BSkgjsgihzCrXLG3/
 /np4h9G3HiwYag1ifPWaY7LPNOtGFTWzzt1WpK0ChYme+GZ+7/tNXmt9SOfLiWI8Hr4hmvJ+SU/
 TNQ6v4ZCp2ztWvm4fDA==
X-Authority-Analysis: v=2.4 cv=e4GT2qp/ c=1 sm=1 tr=0 ts=6ad2bd2f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=AEMvfOE69tE_Q1r2TxsA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAwMCBTYWx0ZWRfX4LzlT06HNUW6
 hIgeqAEAi4ObzY2ojDsMl9o5gCT7m39uvwXBnlsJyQSUTGP9QZs4GWu+qOD8Ix6JvAPnUTu5mP6
 DsK7bBnqzbaeOFB3LuGiZDZuisELbgk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170000

Expose SC7280's five CSIPHYs as standalone
qcom,sc7280-csi2-phy generic-PHY provider nodes (csiphy0..4) at their
existing register addresses, each with its own OF graph (port@0
sensor-facing, port@1 CAMSS-facing) so camss_detect_legacy_phy() picks
the non-legacy path once a board wires a sensor through one of them.
The camss node's own reg-names/clocks/interrupts for the CSIPHYs are
unchanged, so boards that don't use a provider still get the legacy
binding.

The provider nodes are disabled by default; a board or camera overlay
enables the one(s) it uses.

Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 172 +++++++++++++++++++++++++++
 1 file changed, 172 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 347815e5983e..20b43b7625b6 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -5151,6 +5151,178 @@ cci1_i2c1: i2c-bus@1 {
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
+		csiphy_opp_table: opp-table-csiphy {
+			compatible = "operating-points-v2";
+
+			opp-300000000 {
+				opp-hz = /bits/ 64 <300000000>;
+			};
+
+			opp-400000000 {
+				opp-hz = /bits/ 64 <400000000>;
+			};
+		};
+
 		camss: isp@acb3000 {
 			compatible = "qcom,sc7280-camss";
 
-- 
2.34.1

