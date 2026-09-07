Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC28F30EF86
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 10:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775686; cv=none; b=VccVynJYbhUVpRdToX6PwCC29cSdVDtPu/6fVPGytna2uI1wyN8b17Vn7ssO45sjsp6CG+a6wQBwPcIismWivlZE6f+SDeJZx0hh+fRtbX74ZnTCxJzPb3x4R5ErgOL6Y8FX1gS2z/5rlJYoCHzDGaosEuFqNiOanfO+H6tLpFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775686; c=relaxed/simple;
	bh=uEZWjDTsQ+8roH8t5sOSrVp9ky6e0MLV/HPN49I//p8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rhGtLodqCDiUgJ9KChATTv8qat1+80Cqb21OQnqaKxB3WR4AA3hxsr5AjaKEWNNi4elyjFWqST+gyqxbbbldxQfnnMvPyT99yQYi3NyFeRugaRrHF77YMVf2/JAOWrkwZ/SPSBuxWet9BpWdX0RzxW1jDC9VK+3gtQRlb77cZdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tt0EcTZz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=klWaryDe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tt0EcTZz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="klWaryDe"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bStg3713158
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 10:08:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ku8TWsvVummAR1vyzmplfVablUDZN+ru/3S0kmxoUj8=; b=Tt0EcTZzDSyAQheR
	Mr8G2poosZwfqX+5+7JSVmA1l/gxL2GdhEp2MhFNd7vx0Es83WY+C6i0o9jF9ic1
	0dxxNkDk1oF21zkRD2kDtzlP4zUQoBN8+ThNlJKqXLeTmKZUljGHUk4eyLWbr/Xn
	S0w3AAPjiq+8YJ5cKzQX0iUA6i9L5CDnz9Q7XapSgaoy4jPZuDFVEsP4itlEM7Uh
	FuGOMGz+RNiKWd70EzylfOwp2Iuasn1cgJMtAyfpNqS7DhW1+6QPFyR07Lsv0eNE
	W/J2FAp2+7D/0P9PDBykghh2ib3y2aRy7//c6GvpB/ONGuTtfk/C3LXQct30/MEQ
	qhGqdQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj1g81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 10:08:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso4100685a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 03:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788775681; x=1789380481; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ku8TWsvVummAR1vyzmplfVablUDZN+ru/3S0kmxoUj8=;
        b=klWaryDelaM6HJMPlGbrG4I/sYh8N3KdJBe+86JKkNPzEX1YjbY6uOoGCQmAnrIxGB
         6TzN3Rte3AgIUzhoAF1Mg1z5IfAqmYutgeljR06w2dMmy7P8djql136MW73MNqNPFZO2
         TpoLZEXL+wJzxeEnrqQaGbspiyQgfJ/c/JRlmp4eAirCTdf17+OSLF5sgB67bHU1LJbR
         pKfVQ9pKf/fgzXE3WRD6GOxKQjy/vavVzFiDfSbOaow49aWR/Xbzqa8ImxPJSmnerbke
         N58IEsK41+xwRsBJGySSQ7SUYgFhMWznL4Gcm6HeIThbLEXC3uIrAn8OFjsR6lzEgAOK
         K/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788775681; x=1789380481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ku8TWsvVummAR1vyzmplfVablUDZN+ru/3S0kmxoUj8=;
        b=GdjU0khy7M1D5qhTmKdsQoymGr7s9gFkFqmZA/hcfbsn4MErfeJQO4BNo0VztTnnig
         KoMRFHzzA++vIXzbc/p+xis5hf0B0N9pkZSx7cvkHXHZL0+euWIbqtIC21F3mVoUExEq
         /UCk3dwRoogPL4vkTLyKD0dm1TXU/acgJ9b5hAMC8YQAxcFaixmtpuBiVuvwfEz0072a
         v5SZsEbbnOF9wYDutpm5jN0RPr3PNucIwd0P8Z5UwRIg1q2LDCQUXrurvgaOi68Xvi0U
         XDbFYld4w1SpF/dAol+qi9kdEQ/r+yJ8Czx6GjJZ1qUd60LUj5+hYjqwc4VjY5YmWt73
         S7vg==
X-Gm-Message-State: AFuF++nY1AteXbATFF/sf9b/8TKEVOdfKJbuNn2p7h4Q3GLommC2TXqj
	62MQ4WYW/R8W41/HVgc3t+KTQuGXFY9GbPymsnG591/NClLmLkOQxCx8NWs1SDbgjl5K0Nb98VF
	2Jq7jcBga6dlHQOL1HU/uKwuPzCqREdwxpiHaL0aMhpdi8/tCH4Qc+ysJ7/qNOjhne4uH
X-Gm-Gg: AYBFou1qeF/Bf5qGDnGlBOnz5e0fsdusZb1sY7/Af/v/VSHYWTuOWRuNyJxtc8hTH6J
	ncpq3UQnkya/KR18dMFWgh2q/m+b6vbzvxcwiissgjqWVecSKwyXNbyE61dEpz4nlMLF9qjEUOw
	eYHd/ZLqOeeOm5iEm67oXHSuqrczNEyzrWxcddisW9OBL7g/TtJNvrz7xdfaNQH/oyPm6IcwhJF
	i54Uky8ofaiGpTo4w7VfcWFrjYXrCw9E7BBTQ2+Z8yuBhIopcte9svAbdlimJXi1TYhDG9XjifF
	+rNXuze7OU/ZuqrWD/2yxHfAFche8NpMjoSqo2EEFKHUSJd1OufVPkbHK34/olB0+NhHZSxnC9Z
	9ctCgwNmE44BuQc2dbNptUcI5b+K0p/U=
X-Received: by 2002:a17:90b:3a81:b0:398:c292:ac80 with SMTP id 98e67ed59e1d1-39b2612eaa4mr30668794a91.10.1788775681159;
        Mon, 07 Sep 2026 03:08:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3a81:b0:398:c292:ac80 with SMTP id 98e67ed59e1d1-39b2612eaa4mr30668731a91.10.1788775680587;
        Mon, 07 Sep 2026 03:08:00 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa37dbdsm22891332eec.11.2026.09.07.03.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:08:00 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 15:37:44 +0530
Subject: [PATCH 1/6] arm64: dts: qcom: glymur: Add CAMSS and CSIPHY nodes
 for Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-glymur_camss_dts-v1-1-6c2ced5ea5f9@oss.qualcomm.com>
References: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
In-Reply-To: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788775671; l=9136;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=uEZWjDTsQ+8roH8t5sOSrVp9ky6e0MLV/HPN49I//p8=;
 b=zioPRw7RYGV9qSk5QCvaqwFlyCKrUuZgn1ZRvKIKlOJF/FSMNKuyjM9iClV45oNfo/c9YPELT
 RAYGfkWZfSIBXA1yD/tr/9N5FVYFS3UmXLwZHlrDGCjT3IS4dhiNaZG
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExMCBTYWx0ZWRfX9m15Hgk/gE7s
 bzwHOPygHpyWSQG9OlGnjI9ezMkky2iJp00ktwY2dg/O4kDMCly7ZHjjTy1kX3eQMmZ8b0HyvKM
 0TSpf4LwGzRf3XLR5u/MdNdZAUNceVxzPWAtC3OzGCM+hUJRTDdaecOuWzKDHjU4SYY2iQsRM/+
 4ieh3zNK7NXCPM56zXbMxLX1gVil2+4ZyNtc8vuGYAtnPVjZ476eceUzth2zf5IU+mFffEecSt2
 ZaLzXVCig81guL8bxzswcR4WWGz44C8dsz+TL4rPP4uK/tJHQTOp05c+2OPqvWf3mvDaqChZp1S
 o1C6bA6d90TwQOPM8cb+Yb5PfEUSYUx7AWqDM/9zsk16D9m6bxpRCPGfYVjOHHaxa6IY/nRgeWS
 +lbgLvvSqIKEbJiFR96WhJvmX0ohGAvviLJMwm7NIpw9yWs4WeYEaNm9/4LwM7kxIep3oZ8HUIH
 m2lSgwT4HFUYUMDlGCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExMCBTYWx0ZWRfX9zL2ZwInK7uG
 KsJ9QXrusbro2/hiN7jVf8uC1yV4u1rP10ru1PDzpgk6hb9psxm/2hXc3SK6WOqH/kJF5KEoHwf
 RoyBSz8AAJ+p/mqOE8SvjyinmcBvdvM=
X-Proofpoint-ORIG-GUID: EDRd8HWVW7OfOsoYEnaZtl_JrW-7fk5N
X-Proofpoint-GUID: EDRd8HWVW7OfOsoYEnaZtl_JrW-7fk5N
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9e8d02 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=JsC1sACRm8Jh_5Dfn6AA:9 a=CFd1BxUzzdwHJPb6:21
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070110

Glymur shares the same IP as X1E80100, with three CSIPHYs that use
the new standalone PHY API. Compared to X1E80100, csiphy2 is absent
on Glymur.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 323 +++++++++++++++++++++++++++++++++++
 1 file changed, 323 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 624a9edd602cf2556ef2489c04b0f0203b312de1..c463cde46cc41acd7b8091616657bf49b38b7f9f 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -773,6 +773,50 @@ soccp_smp2p_in: slave-kernel {
 		};
 	};
 
+	csiphy_mxc_opp_table: opp-table-mxc {
+		compatible = "operating-points-v2";
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			required-opps = <&rpmhpd_opp_low_svs_d1>,
+					<&rpmhpd_opp_low_svs_d1>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+		};
+
+		opp-480000000 {
+			opp-hz = /bits/ 64 <480000000>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+		};
+	};
+
+	csiphy_mxa_opp_table: opp-table-mxa {
+		compatible = "operating-points-v2";
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			required-opps = <&rpmhpd_opp_low_svs_d1>,
+					<&rpmhpd_opp_low_svs_d1>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs_d1>;
+		};
+
+		opp-480000000 {
+			opp-hz = /bits/ 64 <480000000>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs_d1>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -1842,6 +1886,285 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
 			};
 		};
 
+		camss: isp@acb6000 {
+			compatible = "qcom,glymur-camss";
+
+			reg = <0x0 0x0acb6000 0x0 0x1000>,
+			      <0x0 0x0acb7000 0x0 0x2000>,
+			      <0x0 0x0acb9000 0x0 0x2000>,
+			      <0x0 0x0acbb000 0x0 0x2000>,
+			      <0x0 0x0acc6000 0x0 0x1000>,
+			      <0x0 0x0acca000 0x0 0x1000>,
+			      <0x0 0x0acf6000 0x0 0x1000>,
+			      <0x0 0x0acf7000 0x0 0x1000>,
+			      <0x0 0x0acf8000 0x0 0x1000>,
+			      <0x0 0x0ac62000 0x0 0xf000>,
+			      <0x0 0x0ac71000 0x0 0xf000>,
+			      <0x0 0x0acc7000 0x0 0x2000>,
+			      <0x0 0x0accb000 0x0 0x2000>;
+			reg-names = "csid_wrapper",
+				    "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid_lite0",
+				    "csid_lite1",
+				    "csitpg0",
+				    "csitpg1",
+				    "csitpg2",
+				    "vfe0",
+				    "vfe1",
+				    "vfe_lite0",
+				    "vfe_lite1";
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_CSID_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+			clock-names = "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "core_ahb",
+				      "cpas_ahb",
+				      "cpas_fast_ahb",
+				      "cpas_vfe0",
+				      "cpas_vfe1",
+				      "cpas_vfe_lite",
+				      "csid",
+				      "csid_csiphy_rx",
+				      "gcc_axi_hf",
+				      "gcc_axi_sf",
+				      "vfe0",
+				      "vfe0_fast_ahb",
+				      "vfe1",
+				      "vfe1_fast_ahb",
+				      "vfe_lite",
+				      "vfe_lite_ahb",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid";
+
+			interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 458 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 860 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid_lite0",
+					  "csid_lite1",
+					  "vfe0",
+					  "vfe1",
+					  "vfe_lite0",
+					  "vfe_lite1";
+
+			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc",
+					     "sf_icp_mnoc";
+
+			iommus = <&apps_smmu 0x800 0x20>;
+
+			power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+					<&camcc CAM_CC_IFE_1_GDSC>,
+					<&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
+					     "top";
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
+					camss_csiphy0_inep: endpoint {
+						remote-endpoint = <&csiphy0_out_ep>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					camss_csiphy1_inep: endpoint {
+						remote-endpoint = <&csiphy1_out_ep>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					camss_csiphy4_inep: endpoint {
+						remote-endpoint = <&csiphy4_out_ep>;
+					};
+				};
+			};
+		};
+
+		csiphy0: phy@ace4000 {
+			compatible = "qcom,glymur-csi2-phy", "qcom,x1e80100-csi2-phy";
+			reg = <0x0 0x0ace4000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
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
+					csiphy0_in_ep: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					csiphy0_out_ep: endpoint {
+						remote-endpoint = <&camss_csiphy0_inep>;
+					};
+				};
+			};
+		};
+
+		csiphy1: phy@ace6000 {
+			compatible = "qcom,glymur-csi2-phy", "qcom,x1e80100-csi2-phy";
+			reg = <0x0 0x0ace6000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+			interrupts = <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
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
+					csiphy1_in_ep: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					csiphy1_out_ep: endpoint {
+						remote-endpoint = <&camss_csiphy1_inep>;
+					};
+				};
+			};
+		};
+
+		csiphy4: phy@acec000 {
+			compatible = "qcom,glymur-csi2-phy", "qcom,x1e80100-csi2-phy";
+			reg = <0x0 0x0acec000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			operating-points-v2 = <&csiphy_mxa_opp_table>;
+
+			interrupts = <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MX>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
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
+					csiphy4_in_ep: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					csiphy4_out_ep: endpoint {
+						remote-endpoint = <&camss_csiphy4_inep>;
+					};
+				};
+			};
+		};
+
 		gpi_dma0: dma-controller@b00000 {
 			compatible = "qcom,glymur-gpi-dma", "qcom,sm6350-gpi-dma";
 			reg = <0x0 0x00b00000 0x0 0x60000>;

-- 
2.34.1

