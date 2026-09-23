Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2169E49DB80
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161496; cv=none; b=BCVbBRx3s8ComoGSHwiJJdVYAeAZ72GH36B8GYzjMNYL1RCNUzIAnwpVihdl2McKMlpNUgvxT3w51Iq2Sw6doimDseX+1cd8ETkMZVVRXBNZzFPhYCWx79JAFAbB62VO1GU3+NXdflIFbW8eTmE/PUvZoS1Y+b0cGsNNgqtRvhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161496; c=relaxed/simple;
	bh=7ftcPBQWyLmUt1kT/HukNXT4XOt6rrxs7ZPra+cV2CM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jujxbECs+VhKNIer7LqZjmBgCSh0ZYi0q+HikE7WAkE2Sp0230xVeMGjrrJxx+lG2JVYa/at0y49ZSkRkTghqJrfsBDt+KncTo7Gl/AelN9KJKU+bSGxaTFnYPM9q+QpM2sAnjdvgyxoL9IS8gI49ix9mFywI3YW//4iNY6/QRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dg2tp11H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cYiiyEMY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dg2tp11H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cYiiyEMY"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2eRN2821202
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rJ7jnSCiFkEbyzhyYpnR7+yTgEA1+m6lBLnQ1VjiBpo=; b=Dg2tp11HyBWApp+8
	lSyXpZ0GimsSLwLJuxFnzECjp0nGgEzdgCZAY++f1kOgAbjxsbY9LJHIFlShuRBn
	iBusDVzFHnMbobM9Ti8PxLSiyt/Nd0psSAYJnMhyUcMwOHX9K1zBEdohak6yDdO7
	BoCRC3k+MsaREBTsIa6M9qndquRxyxxbGY/XvIyfPSCeSoWCZSdi9GtXkpVfmLId
	iTkdGq1H/fbUw63UgDs3Bsf3epTLnDyHg0zfDfgMiumC0kcgyR3e18U75kggr5pv
	u7OI/Jf45bP7AAAuyXD9Wca5Of9P8KX7N6rfwwBMy/+mrHCvaAITbptX+OEMS/Tp
	ZoCH2g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwarf6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:04:48 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33310847fcaso1360105eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 04:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790161487; x=1790766287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rJ7jnSCiFkEbyzhyYpnR7+yTgEA1+m6lBLnQ1VjiBpo=;
        b=cYiiyEMYCvCx99R0vxpHrA4URhz3gN81ogx0fuQfeEhIrmwCuNBud4gcqAHC1PYTEE
         ME4kUsgulZXVfB5k48HCm3fi95zCtoqRVEZjht7QPGuxMOrKTQKZl3j0AoCZaijitq8Z
         dJ8tzR77yaKu+/GBMwVjXq76BDrpcEdag6tf+beTKLiPCOH60+CgPxBBCzh3Y56iCJj/
         tYJ8g7BH7cloiEAuU1m0OjE6aUSzws6Kep8hTVuWnqgRu6W9RcEYBpkBUuM+a6V/oZOp
         EbeMeEsM+kfp+9NSttZt10+5J6rVg1Yl/Yr4z3xOBSjOQlRhBY2Zg4cgJObsg+EDYUdF
         nVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161487; x=1790766287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rJ7jnSCiFkEbyzhyYpnR7+yTgEA1+m6lBLnQ1VjiBpo=;
        b=YU8UUBJAgzgzOS3BtyBAiBCPrjIkq0u9hHH2eBLMZQvlj2YKSlj5mxK+yeyWRv/BA9
         MMuRKELXx6d3LnHp8FqAig7f5ueHo09NctM1XC+955R5mrMKGVGL7yyDfdJIDfw//4JG
         xTYDPOnRWUCNnFZIQx+KVUbxNFFrtphySHnz7Dcz6eQj0JnzZQhXf3WpB1oQOGjmf3vV
         E7GqfNEY2Q28BwF1tY5PH0+K4ctm9SUEqGsp/I0dk8J7nl2P/suda8R1NVQ/nXIEUaAW
         UlF8+N2SE6fQgr3SRkn6HzDG8zS5h67COM8y1CYQGfHVQNNXSVrkyo+2BNHua94Hw3Yz
         UNAQ==
X-Gm-Message-State: AFuF++lbJDsr7OEuaenO/HH+ox5dsSz0uy2LIwE0o+s/3fLFs9uWReLG
	Eu8Q57TzyZ3g64FAlNLq2mFG9FUX9up7OwCHZV2Uw4dXkbkiaXjg0W/m80DeIX5BTBI7H1wvSxG
	MObTLaqw2aZBRrQFPWOhlTgIXomC+dLUeYN/RpHPYBgRjvlyKFII8gU7J4MvsPwzvGl4t
X-Gm-Gg: AYBFou0K1gmWwxw3i8nuKlb02j9JOV6sQaO1TK2PN1iwm27kDndkCnQB2i6Hxux39y8
	DYIf2kguCYqPHTgWxzhfuffR8GZ/ihS1KwZf+C5ab6Z09kftINE8rRV5fIhHu0QKEZoglcO63Nr
	Ag6wZbdE7rr5bQVVW7+PTaKHFmZCjnjKob0CUwNbYMsNgiyHyPM1nHzgap+BGpC3FNRwXxn1u5n
	1TtJOyBlE9PNRQAWhOQPNDKvOFh2p8eSEaB0w9S1wtitdjXHI2/uw3NVoEzSpgU1h/GbFvGTGSV
	Ie1RuT8gIrYH5HCYK1acyKq+byIeJpmLasbIwrJUOPJ8E+zx1DVpF/b/N56pk1SiE/0HK4Lxtqy
	OpID9J6otTEQPbsM68a109dfDrvIIpA==
X-Received: by 2002:a05:7300:2698:b0:33c:719:f1aa with SMTP id 5a478bee46e88-33e8bb7bc1amr2146648eec.8.1790161487429;
        Wed, 23 Sep 2026 04:04:47 -0700 (PDT)
X-Received: by 2002:a05:7300:2698:b0:33c:719:f1aa with SMTP id 5a478bee46e88-33e8bb7bc1amr2146613eec.8.1790161486888;
        Wed, 23 Sep 2026 04:04:46 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9625825asm5905377eec.13.2026.09.23.04.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:04:46 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:32:42 +0530
Subject: [PATCH RFC 11/15] arm64: dts: qcom: maili: Add support for
 cambistmclkcc and camcc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-maili-camss-v1-11-cbbb42e534ef@oss.qualcomm.com>
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
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790161355; l=2702;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=RlaqkEE9fcNYhWmmYkzYFwHq+R7xYPPdglgLf2Owlko=;
 b=2CHIlULgI+BL0JS0hZLckJT9xt/I1HWI0Lqb5JYlQS+z0WbDVHE37trWq61FY58tvmx5ZElSM
 Bc9Jz1zK0G2B832VbRpnYp8SocmfTBEMGLGcBhJJjS8FBj2jo7/EXsR
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX66DPOzWpWLtT
 Fl58wlR4hoMiY+5hK9d3HHUY7XyTWMax2km9PhMP3dHtAttm+8JQ8tqesrzIm78gQuP3U1e24II
 +Tj4Dp9VfR1DUIiT4LFIZqOd35QJkEzJtwl5nyddhKykqhuSIW+i5bM3EJmqfF/7h29lWSe7Ow/
 jCI0BjV5Z4CzMa1WdQwOECu9p+S/DB6GLGSh+AWL+vVwvIsV14+K9yJh+83ajlmcEu7z4rWHoPG
 KVDZc3tc5wXq3uhJp6kLNdiJzWhYn4zCVjve7LeN0FIbVZx1sugS1wJE1EczgZ1DIlfF++NQqhf
 8JguUWjTL43XzCFTl9BLvcUjuEZRsM7Hkz0MXsjxEMQQLhgW+lYkSKwTrqxt43E9pAew7xX/pX9
 S29tu9bh4bcWlCO+tu1Zq6MzxliEzi7kNDs29kOBsvhqqmxbypYghDLnkXGT+3disf5ZlxjxWOy
 QqAnqYBl0f/v9wC9hjg==
X-Authority-Analysis: v=2.4 cv=HfuB3SE8 c=1 sm=1 tr=0 ts=6ab3b250 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=jTegW29I4pkgtfKLuLsA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 8T9UStLjXVE40soWDbhpiPQtmzppabIL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX869rpmqYbTLG
 EWGqJo22xRXTd9QvT19ZZwhJZO/zAF4oeqBL/1BtBj4s6pcYhU2r4KZaeRA1ZlKFzkQZavxbl4K
 xFbNT8kJJw9G33IE3q51Wr/MzFnHYHE=
X-Proofpoint-ORIG-GUID: 8T9UStLjXVE40soWDbhpiPQtmzppabIL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230044

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add the device nodes for the cambistmclkcc and camcc on Qualcomm
Maili SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/maili.dtsi | 43 +++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/maili.dtsi b/arch/arm64/boot/dts/qcom/maili.dtsi
index 886d307e536be6152906e344289d5b3fb290f0a4..fb404d6c3e92ed95ecd01782c389096fae402701 100644
--- a/arch/arm64/boot/dts/qcom/maili.dtsi
+++ b/arch/arm64/boot/dts/qcom/maili.dtsi
@@ -3,9 +3,11 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/clock/qcom,hawi-camcc.h>
 #include <dt-bindings/clock/qcom,hawi-gcc.h>
 #include <dt-bindings/clock/qcom,hawi-gpucc.h>
 #include <dt-bindings/clock/qcom,hawi-tcsrcc.h>
+#include <dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h>
 #include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
 #include <dt-bindings/clock/qcom,maili-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
@@ -2038,6 +2040,25 @@ pcie_anoc: interconnect@16c0000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		cambistmclkcc: clock-controller@1760000 {
+			compatible = "qcom,maili-cambistmclkcc",
+				     "qcom,kaanapali-cambistmclkcc";
+			reg = <0x0 0x01760000 0x0 0x6000>;
+
+			clocks = <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,maili-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x5f800>;
@@ -4037,6 +4058,28 @@ lpass_ag_noc: interconnect@8f40000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		camcc: clock-controller@956d000 {
+			compatible = "qcom,maili-camcc";
+			reg = <0x0 0x0956d000 0x0 0x80000>;
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			interconnects = <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mmss_noc SLAVE_MNOC_HF_MEM_NOC QCOM_ICC_TAG_ALWAYS>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		usb: usb@a600000 {
 			compatible = "qcom,maili-dwc3", "qcom,snps-dwc3";
 			reg = <0x0 0x0a600000 0x0 0xfc100>;

-- 
2.34.1

