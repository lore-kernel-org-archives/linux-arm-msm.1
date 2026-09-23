Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D12049A3C0
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161505; cv=none; b=q50dRwS2aXlCcLT3cXnt5cOESkaOwHzec6hEvo/9AWzlUZ2gy3LrZer4rn/fQOFv8ArWQfxy6ygygeeEWAfElJsAf5aT0HGAKroPEZOO8uvtJDk54BviU4F+6SWdeSf30vXDT0Foh4On35m9YF0dNysnk8luHabsHJxBTdbj4lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161505; c=relaxed/simple;
	bh=wCop38QEpIatGe5a2pmcLf25/vgaRpj7+TG1auSbCbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rz4AmvE2Ws/rBJUPePS/iL8DEUrh7tNjn0KGzz2LLXzRatz8n3jn+Z2C5S/iBIQi9lACG/fWrf2cPJ5QWQnKxcfhKrP0EIS62zKOFGrFqZ/D715uT18CbwK2C9fYiPcBFLlwquszvgXeI1snG09S1SKi5BCUOGZVOenLXF8r2Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z5Jq5TGe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TQaNBCrz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z5Jq5TGe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TQaNBCrz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2vdk3409871
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NjW2HyYSm/O0dDab0T4iWGz6ubBj3QCYlXVOFpKcJaY=; b=Z5Jq5TGejkh+vPh1
	ud4yCvPtDET7UCJJcbouDkeFlnK85GiVS3bEEHNQ9jDHZ7IWidh+sFT6xsikV3M/
	YRM4u5EkE5FCHKtpu7Ndn+YDzEfEHeueP23nTprGGO8H9d5WsCKNB294LzMmb7h/
	U2VgZa83xi0bNYlNkzX0w8PfOKT1FjYgTvHQyX7qoHNX/Js/lt4MA24IEEbKg9Wy
	8VWUnfHwWd3lBkdlTiboEAMi1RrDTvUeYj40lB/L25E5buhw3BHBZ5CHSoVRMKaj
	ozruc7NdO8KlfQKyrmy9C2j5dEVv5+o/bAt0eQ0fRqDlXHzQOZ+aUoBVxgRnV7JR
	7oJVRg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux86417d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:04:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33baaba6371so1788699eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 04:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790161494; x=1790766294; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NjW2HyYSm/O0dDab0T4iWGz6ubBj3QCYlXVOFpKcJaY=;
        b=TQaNBCrzv83N8ULBZYv7uPFkTFptSL+RiL/WMEXA4Y/W/ILU8MRe84IF6GtRj3h1nJ
         yMFpKDK6aA9FDYJg5FfrFwngEGUjwgSrubKEaNxSOhdkDMryiryc0CmyCdC9fahpOMxH
         nwUHim2wx2NN4V1XA9IoSrDaQ2+XGCGnxO2gn41TFXSAI5EIacN+ex7r1lByIK0jrGWD
         A0Q9Z12Bn3Bo1znHE1dnVXUG6ZjO+qtcLKLw+cAp8ygGWs87BOqXsJwyF5ymoBKcKQ3M
         gEh41eqVyenuGmzWjWRC7hsL4nbWDR8NWuis9A2iGilkdiL2acM+QdIdE5jMiQLd3c+R
         N0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161494; x=1790766294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NjW2HyYSm/O0dDab0T4iWGz6ubBj3QCYlXVOFpKcJaY=;
        b=A/7tcUpoAx/JSLUQUv4sMBznyt6GTfVhh5lxD3MkFcmFN0QgutQih3gYgT0oc1uQDA
         6r99VXdVYMlmc/edENNqxSTrgKLB1zS9bZS/6oI+rtUrpaLITMjIFn08/LhE0uMuWNH+
         EhQbiGgGmjGpzU9y12nMGAI10e8A67kK9z0zpFuoXyN+VZ/EdID+V1Dk7PoXFGAv7kbG
         mKtWH4CZfhVplp5KZuqTJ+LpxJ1CvDrasYoyw8LvrlB6EbQzTUWm89S8AMLSc9vpdXsA
         QtAAjmjaQnRg4YyPDzRppvgNNipi2jaGXudHtesSYFNHEU7yJh1E2DXWoqfYC8S65wDX
         ChqQ==
X-Gm-Message-State: AFuF++llwErNbyZXtEmfIkvBeWeZEQQ/EfnJxqr6K2BC6lfDVD5VMyiS
	QsIThDTHeu+bFeHJ0MHVlhCktXyRWZ4BkeDthH/dO/TqDsPOQovFpWKHrQpzLo/PY4yA7uEoi2B
	pVztMCMn26iaHsuGApz22Ndzv9f7uF/Se03LA6IdHEbhePkX0RRUZBl+lDSgW6w9N3eXD
X-Gm-Gg: AYBFou2RUAw6IBnF8JvmUDQQneDw9M5+1Sxy/mfYaSklLKn+JuQcnk+o5YBOuyQjOCR
	3JtP/NKKkWH2eak9sKVbw3ldlFgfzYxNQKcH3M67TUDzaf9YAHjqRbzodPsqef664fIrBc5GW3G
	twQA+NUzAwW8RTJyJmqFY7e9jND8Xr4JAB34oesM6hNdzzY4Etw2wi4ghCgZv4jJ9i8k7LMoPGJ
	SKGdtKlAnIVnAO9OYApwIBeCWGGVn5NY6qBpOWjqGY59xpOJmxPt8Qdo3aFznMGyZrVNXD9zBMG
	VG8fNZRDlUvSMQJLAWICsY1aaG+hXpfNNYfF4clbb/fAJWGB4osk5nqCMvTRgmi6S8R1kkMmCOx
	UObqa7669Fe5EnfmXbc6Q9STAYbbAYQ==
X-Received: by 2002:a05:7301:71a8:b0:33b:ea8c:811b with SMTP id 5a478bee46e88-33e8b88d912mr2113229eec.5.1790161494309;
        Wed, 23 Sep 2026 04:04:54 -0700 (PDT)
X-Received: by 2002:a05:7301:71a8:b0:33b:ea8c:811b with SMTP id 5a478bee46e88-33e8b88d912mr2113200eec.5.1790161493659;
        Wed, 23 Sep 2026 04:04:53 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9625825asm5905377eec.13.2026.09.23.04.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:04:53 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:32:43 +0530
Subject: [PATCH RFC 12/15] arm64: dts: qcom: maili: Add CAMSS and CSIPHY
 nodes for Maili
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-maili-camss-v1-12-cbbb42e534ef@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790161355; l=11253;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=wCop38QEpIatGe5a2pmcLf25/vgaRpj7+TG1auSbCbg=;
 b=gGNTa4bJTPvqXp9CnAF7wD/vnIouILL7GxlD0QDcsdBVVcszHLRA9FF1ZlFnt0pDcyilArRqG
 SGyuYLlkWzQBOosnpcJAFQw/hDu2cFOOgAKCLWlp6IKMy8P/cUuZrAp
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: Riy592ycXgL1TD7qMwiANVVV3IhrjLgT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX81XFOM9dROty
 AqmxIU7YlNuS07l+uC6L2TtqLhF/3J0gntbv16cElhGhn7EuHcLL/wr/Aju5CE7/+gbEjYZw1G2
 DY24aVz6ErHf6eMp/+vt2/K3zdEpZiA=
X-Proofpoint-ORIG-GUID: Riy592ycXgL1TD7qMwiANVVV3IhrjLgT
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab3b257 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=id0iHjutPMw6RFBcmdYA:9 a=RTpwFzngvmKHk0oL:21
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX+cek0YIPLn7i
 ca14DOCKLy0I/lF69aCGdGwgSj9nzYjh84pikBp0JFskQSJ8e2LDht+Fu3XC2x4wY9iHA0lRt5d
 +rqLmIyb/0gprHMQPYMVVsHmB95wmRwCpccOLPlbr0sq4g4ehbtkMlZbhf/LZl1YKqDLr7UmD46
 5JHll4eWcz2WWuIV3PUOZdWy6V5m4q0VS0aF0bGZzxKdE6+Qx7UISUP6ssF/0eLHt3W6IqEpz8P
 BCHZY74S7+It/5Qh6N0e+0TKNJT7cSIVr+d8ks19k06nyw9lCIHxsdzrLNt/SbdJDnC27ulVc2o
 YwvmGy4HrZ7ROh4+QGmUl3kbUXztwAiQncIGQoUjyuJTdly2bjH8FLJjf3zB0BNHyhg0HMMN90l
 gC47mugTF8+YD85Al6JkTVIEIgUTReW0+ywABc0IRo/Gmgy23qdyApX99RiAIIzR/bzhth6+ILI
 SchREpYfVGKqm4iNLlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230044

Maili uses the same CAMSS IP as Hawi with five CSIPHY instances
instead of six. Add CAMSS and CSIPHY nodes reusing the Hawi-compatible
driver.

5 x CSIPHY
3 x TPG
3 x CSID
2 x CSID Lite
3 x IFE
2 x IFE Lite

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/maili.dtsi | 412 ++++++++++++++++++++++++++++++++++++
 1 file changed, 412 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/maili.dtsi b/arch/arm64/boot/dts/qcom/maili.dtsi
index fb404d6c3e92ed95ecd01782c389096fae402701..8d5d64a23642cbde51ecb6c7377a5eed355f0d65 100644
--- a/arch/arm64/boot/dts/qcom/maili.dtsi
+++ b/arch/arm64/boot/dts/qcom/maili.dtsi
@@ -537,6 +537,28 @@ smp2p_soccp_in: slave-kernel {
 		};
 	};
 
+	csiphy_mxc_opp_table: opp-table-mxc {
+		compatible = "operating-points-v2";
+
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			required-opps = <&rpmhpd_opp_low_svs_d1_1>,
+					<&rpmhpd_opp_low_svs_d1_1>;
+		};
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			required-opps = <&rpmhpd_opp_low_svs_d1>,
+					<&rpmhpd_opp_low_svs_d0>;
+		};
+
+		opp-480000000 {
+			opp-hz = /bits/ 64 <480000000>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_nom>;
+		};
+	};
+
 	soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -4058,6 +4080,396 @@ lpass_ag_noc: interconnect@8f40000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		camss: isp@9253000 {
+			compatible = "qcom,maili-camss", "qcom,hawi-camss";
+
+			reg = <0x0 0x09253000 0x0 0x5e80>,
+			      <0x0 0x09263000 0x0 0x5e80>,
+			      <0x0 0x09273000 0x0 0x5e80>,
+			      <0x0 0x092d3000 0x0 0x3880>,
+			      <0x0 0x092e7000 0x0 0x3880>,
+			      <0x0 0x093fd000 0x0 0x400>,
+			      <0x0 0x093fe000 0x0 0x400>,
+			      <0x0 0x093ff000 0x0 0x400>,
+			      <0x0 0x09151000 0x0 0x20000>,
+			      <0x0 0x09171000 0x0 0x20000>,
+			      <0x0 0x09191000 0x0 0x20000>,
+			      <0x0 0x092dc000 0x0 0x6800>,
+			      <0x0 0x092f0000 0x0 0x6800>;
+			reg-names = "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid_lite0",
+				    "csid_lite1",
+				    "csitpg0",
+				    "csitpg1",
+				    "csitpg2",
+				    "vfe0",
+				    "vfe1",
+				    "vfe2",
+				    "vfe_lite0",
+				    "vfe_lite1";
+
+			clocks = <&camcc CAM_CC_CAMNOC_NRT_AXI_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
+				 <&camcc CAM_CC_CAMNOC_DCD_XO_CLK>,
+				 <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CAM_TOP_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_TITAN_MNOC_HF_CLK>,
+				 <&camcc CAM_CC_TITAN_MNOC_SF_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_CSID_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_TFE_0_MAIN_CLK>,
+				 <&camcc CAM_CC_TFE_0_MAIN_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_TFE_1_MAIN_CLK>,
+				 <&camcc CAM_CC_TFE_1_MAIN_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_TFE_2_MAIN_CLK>,
+				 <&camcc CAM_CC_TFE_2_MAIN_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+				 <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>;
+			clock-names = "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "camnoc_dcd_xo",
+				      "cpas_ahb",
+				      "cpas_fast_ahb",
+				      "cpas_mnoc_hf",
+				      "cpas_mnoc_sf",
+				      "cpas_vfe0",
+				      "cpas_vfe1",
+				      "cpas_vfe2",
+				      "cpas_vfe_lite",
+				      "csid",
+				      "csid_csiphy_rx",
+				      "gcc_axi_hf",
+				      "gcc_axi_sf",
+				      "vfe0",
+				      "vfe0_fast_ahb",
+				      "vfe1",
+				      "vfe1_fast_ahb",
+				      "vfe2",
+				      "vfe2_fast_ahb",
+				      "vfe_lite",
+				      "vfe_lite_ahb",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid",
+				      "qdss_debug_xo";
+
+			interrupts = <GIC_ESPI 665 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 667 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 495 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 669 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 440 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 497 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 500 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 521 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 670 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 441 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid_lite0",
+					  "csid_lite1",
+					  "vfe0",
+					  "vfe1",
+					  "vfe2",
+					  "vfe_lite0",
+					  "vfe_lite1";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf_mnoc";
+
+			iommus = <&apps_smmu 0x1800 0x00>;
+
+			power-domains = <&camcc CAM_CC_TFE_0_GDSC>,
+					<&camcc CAM_CC_TFE_1_GDSC>,
+					<&camcc CAM_CC_TFE_2_GDSC>,
+					<&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
+					     "ife2",
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
+				port@2 {
+					reg = <2>;
+
+					camss_csiphy2_inep: endpoint {
+						remote-endpoint = <&csiphy2_out_ep>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					camss_csiphy3_inep: endpoint {
+						remote-endpoint = <&csiphy3_out_ep>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					camss_csiphy4_inep: endpoint {
+						remote-endpoint = <&csiphy4_out_ep>;
+					};
+				};
+			};
+		};
+
+		csiphy0: phy@9523000 {
+			compatible = "qcom,maili-csi2-phy", "qcom,kaanapali-csi2-phy";
+			reg = <0x0 0x09523000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_ESPI 541 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			operating-points-v2 = <&csiphy_mxc_opp_table>;
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
+		csiphy1: phy@9525000 {
+			compatible = "qcom,maili-csi2-phy", "qcom,kaanapali-csi2-phy";
+			reg = <0x0 0x09525000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_ESPI 542 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			operating-points-v2 = <&csiphy_mxc_opp_table>;
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
+		csiphy2: phy@9527000 {
+			compatible = "qcom,maili-csi2-phy", "qcom,kaanapali-csi2-phy";
+			reg = <0x0 0x09527000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_ESPI 543 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			operating-points-v2 = <&csiphy_mxc_opp_table>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					csiphy2_in_ep: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					csiphy2_out_ep: endpoint {
+						remote-endpoint = <&camss_csiphy2_inep>;
+					};
+				};
+			};
+		};
+
+		csiphy3: phy@9529000 {
+			compatible = "qcom,maili-csi2-phy", "qcom,kaanapali-csi2-phy";
+			reg = <0x0 0x09529000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY3_CLK>,
+				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_ESPI 512 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			operating-points-v2 = <&csiphy_mxc_opp_table>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					csiphy3_in_ep: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					csiphy3_out_ep: endpoint {
+						remote-endpoint = <&camss_csiphy3_inep>;
+					};
+				};
+			};
+		};
+
+		csiphy4: phy@952b000 {
+			compatible = "qcom,maili-csi2-phy", "qcom,kaanapali-csi2-phy";
+			reg = <0x0 0x0952b000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_ESPI 186 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			operating-points-v2 = <&csiphy_mxc_opp_table>;
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
 		camcc: clock-controller@956d000 {
 			compatible = "qcom,maili-camcc";
 			reg = <0x0 0x0956d000 0x0 0x80000>;

-- 
2.34.1

