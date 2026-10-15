Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFD4348C4B
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058147; cv=none; b=CPXwob6eohO790Wz6UXFD5kykPuAwcILWot432/UKpaOY8F1lISYAzLJHVswh5Cr4J5ut9qHwePQVRnl8aCZ48kjwfBz6JdHWJ+fi4e83IJnH9+KZwGv0SDqFj3GcEoEozFrHcu5YDZB1aWd3PbFB86TnYaR+Qcz7SZcWmWR9Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058147; c=relaxed/simple;
	bh=Jy6v2m2vqJXLK8QjgW7m+qBuTZEr3IapndMW3EXkAC4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tFQma/ljjCI+VAjFK76b7ZVDSbA5XVUoFEEmiCi+yrNQDWlPVkei8hTrLO2xwHFEXEsp2sroS3H7ZozR6kKkbQwxjDArX7U6vs6T5LGgCPAqAuOrH9JD0lKMpw8IMyu9fQI5XpUV5k/HxtV3VoydCeamND7Er6zbqq4WUoLWjgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CUr5eOl0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CRQDGoa7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CUr5eOl0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CRQDGoa7"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9kEVo2999156
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:55:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FdpJmur1cLwxlK1AYe1iK0UFkAUb6LqrJNBOhmCKcYA=; b=CUr5eOl0ecNhC1ZV
	fGt0OCv+vNt6FcYNmX2qwHHrZnM6Od+//98F/5hJVSvGLFYl1y6KbHS7peMsVYeA
	OVz0yKdPSMamlHqciNGBV5bf7Za1fGrRhvSq1YBx8dwo4lQH9pH2BddF5ShyZYeb
	IPh1Qsq2Wc/nO7o+lFuzyTRPUyWYXiNSRgwf7DOipHZhCsHM4EYdfxMw5hfs7BKE
	FDpW/RG4Sh9PRMsg9oeOErMHFhX1D8tPfPUIgKCmBCZ11pDf4skWFrrH8QfFLIvK
	/5U6XM+W3OlH/8kAHMUws7s529fGB053Qn99cswDsK3WwXdqf5QPgzqNkyww6Xg9
	HgVKcQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hausm09hf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:55:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e93e2f72bfso24273865ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 02:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058133; x=1792662933; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FdpJmur1cLwxlK1AYe1iK0UFkAUb6LqrJNBOhmCKcYA=;
        b=CRQDGoa7kc8CjVKx48flgAHMJS6FAf5bKAZTZnIWvoGHEB9UHbzLWO95qH3Nhm2yuz
         1S9whlu/J40+W5Mcyf3JN40t3E7XZNGuDic/PYhIX9f1+NBJzWXumasVwHnP6uFsTbiG
         6k8CxCstq0hrBahhM6CvVjp1g2Zi+TLhezxOHS85nyj/GGsEL3MPnqrGEsTDIQ3Y1Evn
         EvRdXrty7sg0PlkzOwdspy7bNh024Fs/srmmFBpdu+pe/KfIjRipBGMP65PTu0MKsUUv
         9dGpaGFTX4nJFZs00bMRFvEloYdhBONzNHApG3OfVWM7oByqXi411wJjGSE6RpHVyuNO
         79Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058133; x=1792662933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FdpJmur1cLwxlK1AYe1iK0UFkAUb6LqrJNBOhmCKcYA=;
        b=WG81E0buJOKksug3OJ43B258NIH5DV6BvIWAagllN6CNA+G+4mz6pEg1lsCPZ+Ug5C
         PP17iI+iaX2oo4nMs9uiRKnbyTD8X7NaO2nBOfFWUTnJ3z5pxFWnzUSgWmuTN53XpWOd
         YDMDfqrNuezUw0b5vQ2VuwWM7WIwgXvkHPSWyr/6D4fy1oxFCZrvHrq+tWjaCyPmJ3IK
         dfp6AujAsUXP3d/ENrCXTpMFUgnW4bAnypoH6bsLI4tvy52nxIGe+yi6EeyYs782HLKi
         lCybgac/Zwcc/A9nizSylXQTOHEBmwMENUGVp4Etunflt6hnbvkJWTriARH+rPdnBR1I
         2mYA==
X-Gm-Message-State: AFq9FYKjppUoez797nQme3+kLddQkoOi7KNcUmXp93U4dq3LlKAJsp9n
	yZ3bJGT01lHvAkiYxEOl5l4r2oweMgmYqZlHlheUvv3EnV7ipcAKulwuV4VFgjuh5huffD9kFyN
	6lFKPxDtKc5y/CVSp/IIhMuSwnJ4KrA0HnxoVkAUn8/RGzY4cPnVgso1LOMn6u46TY7Y0
X-Gm-Gg: AYBFou0OYw6Kl7ML6edmvf7D/4wBzsauFBaWHJ6AsACAHWyoKcWh5ewOMDE2eOWH2N1
	4CgEYdi5vWZpKmOeEjsUW85mPPZJiUFvAlAgun5sDKCPEV3syCQYIu5eXwgn8fiRYDb1R8/4/lB
	SXYzEsGioBdkG9Cljl9jIrQ+cE+Trj3rwiwjDNENyC8Tyo0HMQ5IZqMTQv07E70LswcSbFKqVIj
	Evq97+CqoHbfwwgjt5XhJhAyUIKFLBO9EhM7vFYNvgDcaU+E349ZdD5ke9Q6ct33AdXYB0BFVTi
	Op33RmMvGuTneZjHHddYL7ODrTi2zUHbh4Nl7BPFIBkM06L7Ub1phxPIQdmLjzMgiHLbKCCoN66
	F5X9svjMLUt1jQsVbjmcZdMvTfsG3AJQkWAEH
X-Received: by 2002:a17:90a:d006:b0:39e:53a:c8d4 with SMTP id 98e67ed59e1d1-3ab3a90e57amr14625988a91.12.1792058133092;
        Thu, 15 Oct 2026 02:55:33 -0700 (PDT)
X-Received: by 2002:a17:90a:d006:b0:39e:53a:c8d4 with SMTP id 98e67ed59e1d1-3ab3a90e57amr14625966a91.12.1792058132599;
        Thu, 15 Oct 2026 02:55:32 -0700 (PDT)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac943e1a11sm3612322a91.7.2026.10.15.02.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:55:32 -0700 (PDT)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:24:34 +0530
Subject: [PATCH v2 3/5] arm64: dts: qcom: kaanapali: Add DisplayPort
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-kaanapali_dp-v2-3-c15cb83d9140@oss.qualcomm.com>
References: <20261015-kaanapali_dp-v2-0-c15cb83d9140@oss.qualcomm.com>
In-Reply-To: <20261015-kaanapali_dp-v2-0-c15cb83d9140@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058098; l=3871;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=Jy6v2m2vqJXLK8QjgW7m+qBuTZEr3IapndMW3EXkAC4=;
 b=VDvO9b2BErkTB1pKJBRD5nt0KHjG/0FQmM5brWugmp6QZw2dTF5P0DGGr4ji8e9dCEIZ3LeWl
 PdFGDuZ8q1DDN695Hf2flBAKLPacgUJUd2FJlVMXtWmsom1xU7KUl/3
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Proofpoint-GUID: bKLTT2dgv0NV4TKyTrSB5r7wxVa9WRTc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX0gGaR68q+gMf
 dsvz5qjoOJTeKpM07DiSMDKSEyssrPNAV7vJPkqGrBmUURu6JJXPsDPOzWRYpYWEPIZSFMScH7t
 UnbnvpXv15Pf6rXz7z1QYsl/QYO1wLulVy4MDFlJhGQDVEa55l2j9TLL+YxGxe5elAspVnMYity
 9ou3pxn3lIU8D2uviB4ODbvVRv5ss5BdvXjXgY8fqLL5sf3l/wSEnaFB72LOWuJ3X12db5wB811
 2sIP/SDHbew4pX0UEVJDrraZKxpcxIAHzM0S7p/2qpWWoWa2+ObM8yicCkW6AYy2XwpcCmQvfuR
 +ilEin5bpGQCJUlKJo5R/cMyY1aNgCqDbfzmsbDq0aYU6gn7RO0xB8AOxPzPk4Zx3V+Z5X1+Bhe
 8F/jXtsQpI8roBJp1uejdFDrE88VtMiPVJHnboZzYa4hQMvHuAJuXdWPLoOlqFwISP4EqqwlY1s
 Lv52OqgQeoG0MFWO6Hg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX/nwamFQjzU8P
 k4BAlVJ6hD8Bh9WHms+dxUdQLOYtbMw4PInFOdti0s/KXIxpKD4wTbwPfc1r0Kh6rNDTJzWU/tz
 xFjZpPluMBk0TUixK1qE/6FHccTdQ3w=
X-Authority-Analysis: v=2.4 cv=Eb5d0/mC c=1 sm=1 tr=0 ts=6ad0a315 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=CcA5yJ8BMwMt8-iLN6QA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: bKLTT2dgv0NV4TKyTrSB5r7wxVa9WRTc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150039

Add the DisplayPort controller node, including its OPP table,
controller clocks and power domain.

Connect the controller to the DPU and USB/DP QMP PHY, and enable
mode switching on the PHY for DisplayPort altmode.

Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 91 ++++++++++++++++++++++++++++++++-
 1 file changed, 89 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..de856c595936 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3565,6 +3565,7 @@ usb_dp_qmpphy: phy@88e8000 {
 			#clock-cells = <1>;
 			#phy-cells = <1>;
 
+			mode-switch;
 			orientation-switch;
 
 			status = "disabled";
@@ -3592,6 +3593,7 @@ port@2 {
 					reg = <2>;
 
 					usb_dp_qmpphy_dp_in: endpoint {
+						remote-endpoint = <&mdss_dp0_out>;
 					};
 				};
 			};
@@ -3699,6 +3701,7 @@ port@2 {
 						reg = <2>;
 
 						dpu_intf0_out: endpoint {
+							remote-endpoint = <&mdss_dp0_in>;
 						};
 					};
 				};
@@ -3851,6 +3854,90 @@ mdss_dsi0_phy: phy@9ac1000 {
 
 				status = "disabled";
 			};
+
+			mdss_dp0: displayport-controller@9ad2000 {
+				compatible = "qcom,kaanapali-dp";
+				reg = <0x0 0x09ad2000 0x0 0x10c>,
+				      <0x0 0x09ad2200 0x0 0xc8>,
+				      <0x0 0x09ad3000 0x0 0x78>,
+				      <0x0 0x09ad4000 0x0 0xa0>,
+				      <0x0 0x09ad5000 0x0 0xa0>;
+
+				interrupts-extended = <&mdss 12>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
+
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel",
+					      "stream_1_pixel";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
+				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
+							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+				operating-points-v2 = <&dp_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
+				phy-names = "dp";
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				dp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-270000000 {
+						opp-hz = /bits/ 64 <270000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-540000000 {
+						opp-hz = /bits/ 64 <540000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-810000000 {
+						opp-hz = /bits/ 64 <810000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dp0_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dp0_out: endpoint {
+							data-lanes = <0 1 2 3>;
+							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
+						};
+					};
+				};
+			};
 		};
 
 		dispcc: clock-controller@9ba2000 {
@@ -3860,8 +3947,8 @@ dispcc: clock-controller@9ba2000 {
 				 <&bi_tcxo_ao_div2>,
 				 <&gcc GCC_DISP_AHB_CLK>,
 				 <&sleep_clk>,
-				 <0>,
-				 <0>,
+				 <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+				 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 				 <0>,
 				 <0>,
 				 <0>,

-- 
2.34.1

