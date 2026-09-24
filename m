Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5399743F8D7
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 09:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790243117; cv=none; b=NM/Cpgv3SUT8rbMogTRE/7liJZ4rcwW+ERwmVy65xpyuA7u98cOG0AdXblDZ/58l1FlOoFDx54I4ylNoCWs2O2uLIUgve8UlQs4n2hpbHnvOZZvKyqw4nvbm4kpfJzEk7mOglhjCMwHOvvA1n6pdR+zgKQ7PZsIKxtuh3H+wMNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790243117; c=relaxed/simple;
	bh=B8adGb62mFEykDEZtmq1HeqsuhcAcPwEsLw9I4djGzc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ulfoqHzB5E7/gpEV5dGg4nhia7Foc+vNKEIrhQYqYKOV7xkK1hXvnnysQfbDoF49fRqstdnwDcnxuT3DE1EmI72Q8HLAkE1w6WZenMG1uFlOWdrosllaFPeFEuMTwc9CRRbw8BqCGMsF9o+Th0YTSqgIscSVoDyrdmum5wrwz98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=goks4mov; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kV8os9pH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="goks4mov";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kV8os9pH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9Q9sT1773988
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 09:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=J/79Kk4C5UbIDKqD7ckWE4dOuSTVQY56ZWq
	Q41O7b04=; b=goks4mov8gaST1pXM1/a3X80PcYPdCdy+bdsfg+J8oXLsli4qIY
	66jFWnFnUalZt51tLpW0RxTGc43G6vpMPntU9HS/ymiUUsfpq4BN+kZLxQJZWfW1
	i/X0XiwCoemHmJ0DfPxB4u68mKQhm4iXtaYuAO/ypMyS9mKiWo3kAY6ld40AuPc9
	ha95YhPYKd0VLjzOY9i10/esu4Y/gw/76tLUVTVklUM6Pw6wKab97oMs+ir+1Hml
	6gltB95l7O7qibmUeiy8st2lhKLWcuSuX9c5Lwo6FctmqUdp16B2EMVRxdN/pGrC
	O7CMHpVBolchRhzWxKCZrDjM2fVZ1h9dYQQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvhsb3r2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 09:45:00 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2782036eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 02:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790243099; x=1790847899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J/79Kk4C5UbIDKqD7ckWE4dOuSTVQY56ZWqQ41O7b04=;
        b=kV8os9pHwB4XO5K5or6dmd2ISxzVB0eHLj0VyKd6t4ttwXwseuoheOYVh9qCOYQhLr
         LW1T3HvkW1boY7HDnDEf0Locnv/BT0pKTspM9SZlS+sS2aHewB3AWtvtX6vGZGnyn8Xx
         PM4k0uFjIIoedhGJIieznSfdtyCEA/JDALAGvN4QTbnxgPk5eTMFfqmVoCBrEj3akqR+
         g2FjtdpN17TgdA02YXBaQop3YLBwcswFRfuHScnOp5Dp91hLyMETWghomS+P0rBnZQoZ
         m83UwABugvPy1oHpEKKJsa8AkrQ4UuLAMr+7FPwE7mCBW/OBc1vsnGvcR0aJDWW12tzB
         ElaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790243099; x=1790847899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J/79Kk4C5UbIDKqD7ckWE4dOuSTVQY56ZWqQ41O7b04=;
        b=GL7hO+4ZyTLanc6Or8Na32icIWcMZl06fZBGWvrIu9ytoRqawJFV6PxCv/xHZvnN1a
         s2OUtaI2kCpSMBHUOm4pD19U5QXvLOync9cS9qS/wOgy9fwIFmSkVNHqbM12+tLtsuBA
         hBwfWi/DT8RSpQrBDd1uBWbg3ldpkzk87Ba/IBks15HD71MqJ05Mcbdyw5GUE3GlSwsk
         Q3d/9ONEsY4EP3VtrFvsekj5V/K4FF+saUsyZ4XaWkHyuGjpPsS5AEZFgFc+l4eMMrKP
         PpZbRQAAMyPY/wrmQ+71TAmImrA34/5lcqoEwDeaQtv92GKPfB2/o60IzTuTcCTFxFGk
         MAEA==
X-Forwarded-Encrypted: i=1; AKwUvBwA+xW9y9TRYXrgp/t5zexhnKETzEQDAQstlY36kYn0Q9SnsiYO8cRxlomUhd3fwg8skNKWVBonN2ZYnYIm@vger.kernel.org
X-Gm-Message-State: AFuF++mmJ3S0361yWwNWw1EjSHSb6pBJMLsSv5hlAAoxRwskGdR/hm/h
	PigZXKCDQ2ZJS1YxAL14V3qvUnPbtS84Tq6rAXX/Xngc5/3sctGB+jr+KvnZdDq3ztYVJaQCj9j
	7V1uEWGw31oUG2anbatILONlinOC0jW0nha9HKRv+v9emnbhZwyggz7jFhWglBq7fWyghCTsHH6
	RTCEI=
X-Gm-Gg: AYBFou3Qqgi/1MjaYfpYKwUue3usmcFzF36LLYX7bcTP05+l1ftU7f219ptY0Uu1qZA
	WyJASOCLhTzQPCoqe6jtOemDWajvdSPvcwYqqZj3HPDUpay6BNjXd684ZCtBKATDe5v23A4pUDc
	KCH6R2mvVnYUeLOA+9HNxPG82oQWaqOKXNduFpyngas/cLkB2IiNZBmqZfQLoIEBjrs6R0QR7ST
	A5JzTWaEokT71qjAk5BVHtlNeYmJtQgPeLjo6rq9JLuj2oshGkLELpZdxcGsc0l2thP/yyV2mt/
	jhFC6TpC+MT2lnv6a3WkAXY3eIt1X0e+X4FfABKJMYz3ExccZqFYypHjsdbM7FX+oxiKEN9oVtO
	4qoe/55xfj6FN1uSgkzENyCIZz1xPz821vZU7HBe79z4wO8/D2lZSu/d3CN8=
X-Received: by 2002:a05:693c:240a:b0:315:afc1:72db with SMTP id 5a478bee46e88-33ffe955a25mr1406534eec.9.1790243099073;
        Thu, 24 Sep 2026 02:44:59 -0700 (PDT)
X-Received: by 2002:a05:693c:240a:b0:315:afc1:72db with SMTP id 5a478bee46e88-33ffe955a25mr1406513eec.9.1790243098521;
        Thu, 24 Sep 2026 02:44:58 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96946d0csm13654309eec.21.2026.09.24.02.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:44:58 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: qcom: nord: Add more clock controller nodes
Date: Thu, 24 Sep 2026 17:44:48 +0800
Message-ID: <20260924094448.1030807-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZJ2qVudFlFSFzKpby9y2Ixx7QBnzJzgf
X-Proofpoint-ORIG-GUID: ZJ2qVudFlFSFzKpby9y2Ixx7QBnzJzgf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0MCBTYWx0ZWRfXzc/FL/wuA+Ko
 Ra4yAFQUBIH8fRHJuhr37SYGpP8p4LziD4mU9I5eNGFSNgoGu1WXoa3dBX7MTk92g7HvMkywNx0
 ldYEXm5/rPWEALQKnwSpQlnUCI6bP+Yu5nRmgpL/sqLXczFxWh5xDfbzffgV/XtWKdnveLzL9Ps
 iN0bMH/Z/2YNExxYvuFTbk9fcp3uVugavFvP5ctmBP+NGYxQAfPm7/aiRER0IHmUySTUwtUYAO9
 /kx7MWTfc5PXVmY9Cul6PgTcKRVJnNBaArFAoRFMFD7sPoG6iQO7sFLotV8/7Ts/9TjnnmcN5dj
 w+limPTX/iIGqnkSsta1qky5b2JKjiasaiYO+Anl37xMsKuHCBckMBAZCBMUXZ1n0SyThJVSsLf
 LmFOgJD+QcBV7/rU1XPnRD7W14BJIgkEB8VgNYhpPymI0o7AhFzOfiUqSNkNS4s6nZZC2d7juzi
 9y4xoNGdwSKYrC6AVJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0MCBTYWx0ZWRfX2BfJ4dkVs4D1
 o/O+IDsVOjm0YkqY8Q84RdlHSkFeYWqB1hNCnsS+hgxxhxNo+tJmJ3GE2XlgKW260APQ2zxoyPb
 tPYX7o+dNUMimRk60y2adaTgrLfrl58=
X-Authority-Analysis: v=2.4 cv=f7vdl+yM c=1 sm=1 tr=0 ts=6ab4f11c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lLTCYSv0VJgAjLIAHVUA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240040

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add the GPU, camera, video, and display clock controller nodes for
the Qualcomm Nord SoC, along with their required dt-bindings includes.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes for v2:
- Drop dependency declaration as it's cleared
- Add Revewed-by tag from Bartosz
- Link to v1: https://lore.kernel.org/all/20260920081049.2183845-1-shengchao.guo@oss.qualcomm.com/

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 108 ++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 568fe68cd185..1ab7d9bc3cfe 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -3,7 +3,11 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/clock/qcom,glymur-videocc.h>
+#include <dt-bindings/clock/qcom,nord-camcc.h>
+#include <dt-bindings/clock/qcom,nord-dispcc.h>
 #include <dt-bindings/clock/qcom,nord-gcc.h>
+#include <dt-bindings/clock/qcom,nord-gpucc.h>
 #include <dt-bindings/clock/qcom,nord-negcc.h>
 #include <dt-bindings/clock/qcom,nord-nwgcc.h>
 #include <dt-bindings/clock/qcom,nord-segcc.h>
@@ -772,6 +776,17 @@ hscnoc: interconnect@2000000 {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	gpucc: clock-controller@3d90000 {
+		compatible = "qcom,nord-gpucc";
+		reg = <0x0 0x03d90000 0x0 0x9800>;
+		clocks = <&rpmhcc RPMH_CXO_CLK>,
+			 <&nwgcc NW_GCC_GPU_GPLL0_CLK_SRC>,
+			 <&nwgcc NW_GCC_GPU_GPLL0_DIV_CLK_SRC>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
 	hpass_ag_noc: interconnect@5fc0000 {
 		compatible = "qcom,nord-hpass-ag-noc";
 		reg = <0x0  0x05fc0000 0x0 0x37080>;
@@ -814,6 +829,99 @@ nwgcc: clock-controller@8b00000 {
 		#power-domain-cells = <1>;
 	};
 
+	dispcc1: clock-controller@8d00000 {
+		compatible = "qcom,nord-dispcc1";
+		reg = <0x0 0x08d00000 0x0 0x20000>;
+		clocks = <&bi_tcxo_div2>,
+			 <&bi_tcxo_ao_div2>,
+			 <&nwgcc NW_GCC_DISP_1_AHB_CLK>,
+			 <&sleep_clk>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>;
+		power-domains = <&rpmhpd RPMHPD_MMCX>;
+		required-opps = <&rpmhpd_opp_min_svs>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	gpu2cc: clock-controller@9890000 {
+		compatible = "qcom,nord-gpu2cc";
+		reg = <0x0 0x09890000 0x0 0xa000>;
+		clocks = <&bi_tcxo_div2>,
+			 <&negcc NE_GCC_GPU_2_GPLL0_CLK_SRC>,
+			 <&negcc NE_GCC_GPU_2_GPLL0_DIV_CLK_SRC>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	camcc: clock-controller@9ce0000 {
+		compatible = "qcom,nord-camcc";
+		reg = <0x0 0x09ce0000 0x0 0x20000>;
+		power-domains = <&rpmhpd RPMHPD_MMCX>,
+				<&rpmhpd RPMHPD_MXC>;
+		required-opps = <&rpmhpd_opp_low_svs>,
+				<&rpmhpd_opp_low_svs>;
+		clocks = <&nwgcc NW_GCC_CAMERA_AHB_CLK>,
+			 <&bi_tcxo_div2>,
+			 <&bi_tcxo_ao_div2>,
+			 <&sleep_clk>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	videocc: clock-controller@aaf0000 {
+		compatible = "qcom,nord-videocc";
+		reg = <0x0 0x0aaf0000 0x0 0x10000>;
+		clocks = <&bi_tcxo_div2>,
+			 <&nwgcc NW_GCC_VIDEO_AHB_CLK>;
+		power-domains = <&rpmhpd RPMHPD_MMCX>,
+				<&rpmhpd RPMHPD_MXC>;
+		required-opps = <&rpmhpd_opp_low_svs>,
+				<&rpmhpd_opp_low_svs>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	dispcc0: clock-controller@af00000 {
+		compatible = "qcom,nord-dispcc0";
+		reg = <0x0 0x0af00000 0x0 0x20000>;
+		clocks = <&bi_tcxo_div2>,
+			 <&bi_tcxo_ao_div2>,
+			 <&nwgcc NW_GCC_DISP_0_AHB_CLK>,
+			 <&sleep_clk>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>;
+		power-domains = <&rpmhpd RPMHPD_MMCX>;
+		required-opps = <&rpmhpd_opp_min_svs>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
 	tcsrcc: clock-controller@f1d9000 {
 		compatible = "qcom,nord-tcsrcc",
 			     "syscon";
-- 
2.43.0

