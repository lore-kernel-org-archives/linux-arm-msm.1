Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB2E3E2ACA
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 09:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789896011; cv=none; b=WRf1tbyaF28jFKHKYPhmNNtkhJG6ILxu1sDdouJj22ulNYl8TQWLORlDXlj3JJyvdmSXaBfCWaAVs0bl/6m23+807xYxU7Iq3t+5DxUmx5xD/BRaxIL/T66ei0e/bpw1PZNc3t6H5LueNdgrUUfNo0k8SJjQ624e30PwNKRFHQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789896011; c=relaxed/simple;
	bh=XHC1A/ICWTR5oEOarJjhavlMLC8e9byXTw6RyZLgQns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jiqMUG1TdIo76HNSj8loYJa3dkzGu1Li6ZECnwt8ftPF8pX92ALK6TKcGWZlZYhYPEkVtFfTkl18nRr6x6r4AmxfINGmKvL9InzVh3pkePcTvbn+tBOxCFa5ZPRJEZk6+mPKNfD3s6R0tVmBYK8WE8dqwpfRE9PJ8btE/W6pPrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bVR7KCAT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wen5NLPe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bVR7KCAT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wen5NLPe"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K8VZdI2873122
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 09:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kmmGB4TqJ81
	4S1cq0rJCeG32bkqXjOIn487e3d0wBCo=; b=bVR7KCATBugbeCZKTs3W7GL6oJv
	5iLrLYvTZwS3gfJS8qAPHVIg3eF7tm67eOijub8KtUUJx9I4YIQ0THULboeKY/b9
	2ms0Y2cJUMjqAb7SPsCbVVHApKyHhpDBQVfn2OGuVndY+uuY4fP1sCnTAQ68r9Yq
	+OQe0bjOUdTZU/Yhu0wbtWdJVTNnAt/fGoACAEpBRU+v58mcBmmria2M8Y5G/glv
	yC5aJ1pTHvUQbzYS1u9j1rLDR2r1Z/mdu/bn4hh8Ii/LLVE7ulrE6pIDJoWQth/V
	b3tTcvYbSw5/PsezwvIBwYEpxHmh+eoY84wpIrh0zgnCwVyAQYfgIKqi6/w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshbsatfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 09:20:06 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1eb205d31so2887221a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 02:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789896006; x=1790500806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kmmGB4TqJ814S1cq0rJCeG32bkqXjOIn487e3d0wBCo=;
        b=Wen5NLPeYKdLT5lwZ98va/IMffx3w0ljpCzLenxoYAewnBgOAG0ftXUkjcSZV2cu9W
         iiCV1WQKmS7QQvXWOGK5Ss3MkqkG5/d30FC6fnjzAde6YFtlIH0EcHOFUHWSI9OZ7Mvt
         ueusJZAT9i1MJWg2gVaFwepV3BH4EO43MDY7298ZAaNpKF5yr2u69lY3iJ68AdqKIG8v
         30PERinkX4Pd0xg6iT8k+IuWjMRviqWia++Q2E7F9k1By5q3IC3ZABQyiKc/bNSF5AWs
         o/xV+MnUHfgygxGZ8WPD1S0tLFDTguZ9XcdJKzGcyR9MJE6EhhdukbH+NupwNlr9lM9z
         Y7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789896006; x=1790500806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kmmGB4TqJ814S1cq0rJCeG32bkqXjOIn487e3d0wBCo=;
        b=CnzStsm9YfJVPyfL2gEPOZp6oCv5+ta+iFfLyRrOoVrGm8xGs11LVz7qcuuUTGtVQf
         64H6NLeaFJNF4Jb5Y8rjfqNl1iR6xkElA1T5TjITZp3siEoLhmJWqXV19inSP4rczLy/
         sV0LLbAHSwo8mayH3nrT2xQAsHC0xcw9LSfS4nLj9Ak9Yo/44tsqKa7+T6eKc/UFbuzc
         27IeAiopBha9ndM90iyvRxd1gepZWNSKIsFv8jqKd0KG7LLie5EuD9VrBxP4XfzSMrxW
         4Elu284drUVpy4Dk9t15J+xWGAV+X94n+waz72stuYeUXZWX1Exxb3ndEGCyT+/222xS
         LWHw==
X-Forwarded-Encrypted: i=1; AKwUvBwl3lL0tG28KAaQ+NcyKmENHC7e6WkY4vO42FQJHOM9rUfBjsNsY7cioRdHhDyY2MCSeGv+ITBpVj4AaK57@vger.kernel.org
X-Gm-Message-State: AFuF++meJ7pvWCB/B1TXAzdPinM/fii/M2QkB4hOnramq5zKi+ujOzvH
	TJkdGnmLlwEFTtfn9LsdmX9iha0F9zqL2bKEajINmjMGrOXyM1+kcWifzSLJBQYQi26s1IF3ewi
	Fg2RG5A82zXk+7w03MvhA3/Vh+p76gj7c3+y4G9z5kRNJeNnQmna4qMM/8eBFKfRvr2kU
X-Gm-Gg: AYBFou2FphEBPycFPfrrNlXpQwamSbMwVYEX9cxp42V/GKADEKI18d+DHWJLn1JuoQp
	ZvgiFK95T0dqGa16tWR7yUgJMwrpGzpbyKizAsyWoirx8Elefr7O++2FIw7AFNCXVr7219k4HJB
	uaBn94PBsDpK+3NpK1Efo/PuA/B1cPtbKmL9aV9TnCT8kBuKT+A9Zj9vGEIBCVziAmQIx/hBwNW
	3mp3PyRa3ADXBDKed6i9/SwK3+rh5qG6CPRfuaOlyL0lsHwIYSvtT+0jKNh6RceDktPIAchj9Vf
	nc48f9V5OBaBul+IY0ME898cNOQ524CnowqXtOZwIQSTznOohMiAiR7KYUfwvFm5+aKepndGLw2
	hUVpzNGIEEHibpXu/RtSZudp9Y6dN1wHy7nqLC0JeEuEUEzBgRkabITNKeNPC
X-Received: by 2002:a05:6300:618d:b0:3dd:a196:69e4 with SMTP id adf61e73a8af0-3dda196784emr6500730637.63.1789896005386;
        Sun, 20 Sep 2026 02:20:05 -0700 (PDT)
X-Received: by 2002:a05:6300:618d:b0:3dd:a196:69e4 with SMTP id adf61e73a8af0-3dda196784emr6500698637.63.1789896004878;
        Sun, 20 Sep 2026 02:20:04 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d3f2csm9353630eec.28.2026.09.20.02.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 02:20:04 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 1/3] arm64: dts: qcom: nord: Add display subsystem nodes
Date: Sun, 20 Sep 2026 17:19:28 +0800
Message-ID: <20260920091930.2215803-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920091930.2215803-1-shengchao.guo@oss.qualcomm.com>
References: <20260920091930.2215803-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Ok3LKUedIAGB1O5e2cz8rjgmlb9ZJkxS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEzNCBTYWx0ZWRfX9uGnNM0N5QK9
 3CAH4NiUI0vDTod6FZx00E1pdNS4X8R4Yr8XBaw/72eFlJOYtcLs28ra+GcUszpShtUwsY/xQz6
 Ir5hEz9RDhOKv2ZI2hFk5j/lByfcBG6Z2qbvOgAhKF40kmkaVEdWu70GFuSNh5ycymMBERvWHmc
 3/EHIfiCv59sksf63o1pWiBZ1r9LxgTUyiov5rZm/sl3PV9DLKa4dNjzB8qNh9Ng2gzNR/iY7yN
 wRSMVS8+AiSNjPMr87G0btmiuSICqRPHz6HJMFIs7As6wWS6s/I4cGvSkITtuTTkoFLsTUYR5JQ
 SVSeeZXDvEUxOGzJCulpm2odBpiCaekqkP1gIQ/Llth0tdNZFf/J1qh1BTz1K6S1PYGxSE28q1c
 pnwBwOe8MOL94WMKQOvG6OQ81FMpH6mlDReIuCubsefxSiKzhaEg31b4Jj5RG/byQkHfLUYS8xE
 Papf6fx3HabafQyUyWQ==
X-Proofpoint-ORIG-GUID: Ok3LKUedIAGB1O5e2cz8rjgmlb9ZJkxS
X-Authority-Analysis: v=2.4 cv=bPqDs/+Z c=1 sm=1 tr=0 ts=6aafa546 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Mj7saqew1W64Bd7qtw8A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEzNCBTYWx0ZWRfX4x2oKlGC+VFz
 0vszIDe2epDZVhnPQx473+qaTOCdTCzCYR2sOFk+BBpWReKl37+5IP3gQ5x5j5OqXuBimwi0Mey
 wT35fFrhvKz7cy3SG9V70Ayy9/ekxZ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200134

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Add the MDSS, DPU, DP controller and eDP PHY nodes for the Qualcomm Nord
SoC. Nord has two independent display subsystems, MDSS0 at 0xae00000 and
MDSS1 at 0x8c00000, each with two DP controllers and two eDP PHYs. Nord
is DP-only, so no DSI nodes are added. Wire the DP PHY outputs into the
dispcc0 and dispcc1 clock inputs, which were previously stubbed with
zeroes, and add the eDP0-3 hot-plug-detect pinctrl states.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 523 +++++++++++++++++++-
 arch/arm64/boot/dts/qcom/nord.dtsi          | 266 ++++++++++
 2 files changed, 781 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 6dc4c871f41e..f994c66c5696 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -346,6 +346,489 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
 	pinctrl-names = "default";
 };
 
+&mdss0 {
+	power-domains = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_GDSC>;
+
+	clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+		 <&nwgcc NW_GCC_DISP_0_HF_AXI_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>;
+
+	resets = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_BCR>;
+
+	interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+	interconnect-names = "mdp0-mem",
+			     "cpu-cfg";
+
+	dp0_phy: phy@fc3a00 {
+		compatible = "qcom,nord-dp-phy";
+		reg = <0x0 0x0fc3a00 0x0 0x1d0>,
+		      <0x0 0x0fc3200 0x0 0x128>,
+		      <0x0 0x0fc3600 0x0 0x128>,
+		      <0x0 0x0fc3000 0x0 0x200>;
+
+		clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+			 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+			 <&tcsrcc TCSR_DP_TX_0_CLKREF_EN>;
+		clock-names = "aux",
+			      "cfg_ahb",
+			      "ref";
+
+		#clock-cells = <1>;
+		#phy-cells = <0>;
+
+		power-domains = <&rpmhpd RPMHPD_MX>;
+
+		status = "disabled";
+	};
+
+	dp1_phy: phy@fc6a00 {
+		compatible = "qcom,nord-dp-phy";
+		reg = <0x0 0x0fc6a00 0x0 0x200>,
+		      <0x0 0x0fc6200 0x0 0xd0>,
+		      <0x0 0x0fc6600 0x0 0xd0>,
+		      <0x0 0x0fc6000 0x0 0x1c8>;
+
+		clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
+			 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+			 <&tcsrcc TCSR_DP_TX_1_CLKREF_EN>;
+		clock-names = "aux",
+			      "cfg_ahb",
+			      "ref";
+
+		#clock-cells = <1>;
+		#phy-cells = <0>;
+
+		power-domains = <&rpmhpd RPMHPD_MX>;
+
+		status = "disabled";
+	};
+};
+
+&mdss0_mdp {
+	clocks = <&nwgcc NW_GCC_DISP_0_HF_AXI_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+	clock-names = "nrt_bus",
+		      "iface",
+		      "lut",
+		      "core",
+		      "vsync";
+
+	assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+	assigned-clock-rates = <19200000>;
+
+	operating-points-v2 = <&mdp_opp_table>;
+
+	power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+	mdp_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+		};
+
+		opp-417000000 {
+			opp-hz = /bits/ 64 <417000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-532000000 {
+			opp-hz = /bits/ 64 <532000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+		};
+
+		opp-650000000 {
+			opp-hz = /bits/ 64 <650000000>;
+			required-opps = <&rpmhpd_opp_turbo>;
+		};
+		opp-710000000 {
+			opp-hz = /bits/ 64 <710000000>;
+			required-opps = <&rpmhpd_opp_turbo_l1>;
+		};
+	};
+};
+
+&mdss0_dp0 {
+	clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK>;
+	clock-names = "core_iface",
+		      "core_aux",
+		      "ctrl_link",
+		      "ctrl_link_iface",
+		      "stream_pixel",
+		      "stream_1_pixel",
+		      "stream_2_pixel",
+		      "stream_3_pixel";
+
+	assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+			  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+			  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>,
+			  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC>,
+			  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC>;
+	assigned-clock-parents = <&dp0_phy 0>,
+				 <&dp0_phy 1>,
+				 <&dp0_phy 1>,
+				 <&dp0_phy 1>,
+				 <&dp0_phy 1>;
+
+	phys = <&dp0_phy>;
+	phy-names = "dp";
+
+	operating-points-v2 = <&dp_opp_table>;
+
+	power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+	pinctrl-0 = <&dp0_hot_plug_det>;
+	pinctrl-names = "default";
+
+	dp_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-162000000 {
+			opp-hz = /bits/ 64 <162000000>;
+
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-270000000 {
+			opp-hz = /bits/ 64 <270000000>;
+
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-540000000 {
+			opp-hz = /bits/ 64 <540000000>;
+
+			required-opps = <&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-810000000 {
+			opp-hz = /bits/ 64 <810000000>;
+
+			required-opps = <&rpmhpd_opp_nom>;
+		};
+	};
+};
+
+&mdss0_dp1 {
+	clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL2_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL3_CLK>;
+	clock-names = "core_iface",
+		      "core_aux",
+		      "ctrl_link",
+		      "ctrl_link_iface",
+		      "stream_pixel",
+		      "stream_1_pixel",
+		      "stream_2_pixel",
+		      "stream_3_pixel";
+
+	assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
+			  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
+			  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
+	assigned-clock-parents = <&dp1_phy 0>,
+				 <&dp1_phy 1>,
+				 <&dp1_phy 1>;
+
+	phys = <&dp1_phy>;
+	phy-names = "dp";
+
+	operating-points-v2 = <&dp1_opp_table>;
+
+	power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+	pinctrl-0 = <&dp1_hot_plug_det>;
+	pinctrl-names = "default";
+
+	dp1_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-162000000 {
+			opp-hz = /bits/ 64 <162000000>;
+
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-270000000 {
+			opp-hz = /bits/ 64 <270000000>;
+
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-540000000 {
+			opp-hz = /bits/ 64 <540000000>;
+
+			required-opps = <&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-810000000 {
+			opp-hz = /bits/ 64 <810000000>;
+
+			required-opps = <&rpmhpd_opp_nom>;
+		};
+	};
+};
+
+&mdss1 {
+	power-domains = <&dispcc1 MDSS_DISP_CC_MDSS_CORE_GDSC>;
+
+	clocks = <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+		 <&nwgcc NW_GCC_DISP_1_HF_AXI_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_CLK>;
+
+	resets = <&dispcc1 MDSS_DISP_CC_MDSS_CORE_BCR>;
+
+	interconnects = <&mmss_noc MASTER_MDP1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &config_noc SLAVE_DISPLAY_1_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+	interconnect-names = "mdp0-mem",
+			     "cpu-cfg";
+
+	dp2_phy: phy@fc9a00 {
+		compatible = "qcom,nord-dp-phy";
+		reg = <0x0 0x0fc9a00 0x0 0x1d0>,
+		      <0x0 0x0fc9200 0x0 0x128>,
+		      <0x0 0x0fc9600 0x0 0x128>,
+		      <0x0 0x0fc9000 0x0 0x200>;
+
+		clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+			 <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+			 <&tcsrcc TCSR_DP_TX_2_CLKREF_EN>;
+		clock-names = "aux",
+			      "cfg_ahb",
+			      "ref";
+
+		#clock-cells = <1>;
+		#phy-cells = <0>;
+
+		power-domains = <&rpmhpd RPMHPD_MX>;
+
+		status = "disabled";
+	};
+
+	dp3_phy: phy@fcca00 {
+		compatible = "qcom,nord-dp-phy";
+		reg = <0x0 0x0fcca00 0x0 0x200>,
+		      <0x0 0x0fcc200 0x0 0xd0>,
+		      <0x0 0x0fcc600 0x0 0xd0>,
+		      <0x0 0x0fcc000 0x0 0x1c8>;
+
+		clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
+			 <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+			 <&tcsrcc TCSR_DP_TX_3_CLKREF_EN>;
+		clock-names = "aux",
+			      "cfg_ahb",
+			      "ref";
+
+		#clock-cells = <1>;
+		#phy-cells = <0>;
+
+		power-domains = <&rpmhpd RPMHPD_MX>;
+
+		status = "disabled";
+	};
+};
+
+&mdss1_mdp {
+	clocks = <&nwgcc NW_GCC_DISP_1_HF_AXI_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+	clock-names = "nrt_bus",
+		      "iface",
+		      "lut",
+		      "core",
+		      "vsync";
+
+	assigned-clocks = <&dispcc1 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+	assigned-clock-rates = <19200000>;
+
+	operating-points-v2 = <&mdp1_opp_table>;
+
+	power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+	mdp1_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+		};
+
+		opp-417000000 {
+			opp-hz = /bits/ 64 <417000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-532000000 {
+			opp-hz = /bits/ 64 <532000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+		};
+
+		opp-650000000 {
+			opp-hz = /bits/ 64 <650000000>;
+			required-opps = <&rpmhpd_opp_turbo>;
+		};
+
+		opp-710000000 {
+			opp-hz = /bits/ 64 <710000000>;
+			required-opps = <&rpmhpd_opp_turbo_l1>;
+		};
+	};
+};
+
+&mdss1_dp0 {
+	clocks = <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK>;
+	clock-names = "core_iface",
+		      "core_aux",
+		      "ctrl_link",
+		      "ctrl_link_iface",
+		      "stream_pixel",
+		      "stream_1_pixel",
+		      "stream_2_pixel",
+		      "stream_3_pixel";
+
+	assigned-clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+			  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+			  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>,
+			  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC>,
+			  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC>;
+	assigned-clock-parents = <&dp2_phy 0>,
+				 <&dp2_phy 1>,
+				 <&dp2_phy 1>,
+				 <&dp2_phy 1>,
+				 <&dp2_phy 1>;
+
+	phys = <&dp2_phy>;
+	phy-names = "dp";
+
+	operating-points-v2 = <&dp2_opp_table>;
+
+	power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+	pinctrl-0 = <&dp2_hot_plug_det>;
+	pinctrl-names = "default";
+
+	dp2_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-162000000 {
+			opp-hz = /bits/ 64 <162000000>;
+
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-270000000 {
+			opp-hz = /bits/ 64 <270000000>;
+
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-540000000 {
+			opp-hz = /bits/ 64 <540000000>;
+
+			required-opps = <&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-810000000 {
+			opp-hz = /bits/ 64 <810000000>;
+
+			required-opps = <&rpmhpd_opp_nom>;
+		};
+	};
+};
+
+&mdss1_dp1 {
+	clocks = <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL2_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL3_CLK>;
+	clock-names = "core_iface",
+		      "core_aux",
+		      "ctrl_link",
+		      "ctrl_link_iface",
+		      "stream_pixel",
+		      "stream_1_pixel",
+		      "stream_2_pixel",
+		      "stream_3_pixel";
+
+	assigned-clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
+			  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
+			  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
+	assigned-clock-parents = <&dp3_phy 0>,
+				 <&dp3_phy 1>,
+				 <&dp3_phy 1>;
+
+	phys = <&dp3_phy>;
+	phy-names = "dp";
+
+	operating-points-v2 = <&dp3_opp_table>;
+
+	power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+	pinctrl-0 = <&dp3_hot_plug_det>;
+	pinctrl-names = "default";
+
+	dp3_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-162000000 {
+			opp-hz = /bits/ 64 <162000000>;
+
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-270000000 {
+			opp-hz = /bits/ 64 <270000000>;
+
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-540000000 {
+			opp-hz = /bits/ 64 <540000000>;
+
+			required-opps = <&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-810000000 {
+			opp-hz = /bits/ 64 <810000000>;
+
+			required-opps = <&rpmhpd_opp_nom>;
+		};
+	};
+};
+
 &qupv3_0 {
 	clocks = <&segcc SE_GCC_QUPV3_WRAP0_M_AHB_CLK>,
 		 <&segcc SE_GCC_QUPV3_WRAP0_S_AHB_CLK>;
@@ -903,10 +1386,10 @@ dispcc1: clock-controller@8d00000 {
 			 <0>,
 			 <0>,
 			 <0>,
-			 <0>,
-			 <0>,
-			 <0>,
-			 <0>,
+			 <&dp2_phy 0>,
+			 <&dp2_phy 1>,
+			 <&dp3_phy 0>,
+			 <&dp3_phy 1>,
 			 <0>,
 			 <0>,
 			 <0>,
@@ -970,10 +1453,10 @@ dispcc0: clock-controller@af00000 {
 			 <0>,
 			 <0>,
 			 <0>,
-			 <0>,
-			 <0>,
-			 <0>,
-			 <0>,
+			 <&dp0_phy 0>,
+			 <&dp0_phy 1>,
+			 <&dp1_phy 0>,
+			 <&dp1_phy 1>,
 			 <0>,
 			 <0>,
 			 <0>,
@@ -1106,6 +1589,30 @@ nsp_data_noc_3: interconnect@1fe00000 {
 };
 
 &tlmm {
+	dp0_hot_plug_det: dp0-hot-plug-det-state {
+		pins = "gpio51";
+		function = "edp0_hot";
+		bias-disable;
+	};
+
+	dp1_hot_plug_det: dp1-hot-plug-det-state {
+		pins = "gpio52";
+		function = "edp1_hot";
+		bias-disable;
+	};
+
+	dp2_hot_plug_det: dp2-hot-plug-det-state {
+		pins = "gpio53";
+		function = "edp2_hot";
+		bias-disable;
+	};
+
+	dp3_hot_plug_det: dp3-hot-plug-det-state {
+		pins = "gpio54";
+		function = "edp3_hot";
+		bias-disable;
+	};
+
 	qup_i2c0_default: qup-i2c0-default-state {
 		pins = "gpio111", "gpio112";
 		function = "qup0_se0";
diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 926ccf3bbe4e..10e678add222 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1727,6 +1727,139 @@ compute-cb@6 {
 			};
 		};
 
+		/* Display subsystem nodes - MDSS1, DP-only (no DSI) */
+		mdss1: display-subsystem@8c00000 {
+			compatible = "qcom,nord-mdss";
+			reg = <0x0 0x08c00000 0x0 0x1000>;
+			reg-names = "mdss";
+
+			interrupts = <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			iommus = <&apps_smmu_1 0x400 0x2>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			mdss1_mdp: display-controller@8c01000 {
+				compatible = "qcom,nord-dpu";
+				reg = <0x0 0x08c01000 0x0 0x8f000>,
+				      <0x0 0x08cb0000 0x0 0x3000>;
+				reg-names = "mdp",
+					    "vbif";
+
+				interrupt-parent = <&mdss1>;
+				interrupts = <0>;
+
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dpu1_intf0_out: endpoint {
+							remote-endpoint = <&mdss1_dp0_in>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						dpu1_intf4_out: endpoint {
+							remote-endpoint = <&mdss1_dp1_in>;
+						};
+					};
+				};
+			};
+
+			mdss1_dp0: displayport-controller@8d54000 {
+				compatible = "qcom,nord-dp";
+				reg = <0x0 0x08d54000 0x0 0x200>,
+				      <0x0 0x08d54200 0x0 0x200>,
+				      <0x0 0x08d55000 0x0 0xc00>,
+				      <0x0 0x08d56000 0x0 0x400>,
+				      <0x0 0x08d57000 0x0 0x400>,
+				      <0x0 0x08d58000 0x0 0x400>,
+				      <0x0 0x08d59000 0x0 0x400>,
+				      <0x0 0x08d5a000 0x0 0x600>,
+				      <0x0 0x08d5b000 0x0 0x600>;
+
+				interrupts-extended = <&mdss1 12>;
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss1_dp0_in: endpoint {
+							remote-endpoint = <&dpu1_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss1_dp0_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss1_dp1: displayport-controller@8d5c000 {
+				compatible = "qcom,nord-dp";
+				reg = <0x0 0x08d5c000 0x0 0x200>,
+				      <0x0 0x08d5c200 0x0 0x200>,
+				      <0x0 0x08d5d000 0x0 0xc00>,
+				      <0x0 0x08d5e000 0x0 0x400>,
+				      <0x0 0x08d5f000 0x0 0x400>,
+				      <0x0 0x08d60000 0x0 0x400>,
+				      <0x0 0x08d61000 0x0 0x400>,
+				      <0x0 0x08d62000 0x0 0x600>,
+				      <0x0 0x08d63000 0x0 0x600>;
+
+				interrupts-extended = <&mdss1 13>;
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss1_dp1_in: endpoint {
+							remote-endpoint = <&dpu1_intf4_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss1_dp1_out: endpoint {
+						};
+					};
+				};
+			};
+		};
+
 		ipcc0: mailbox@9007000 {
 			compatible = "qcom,nord-ipcc",
 				     "qcom,ipcc";
@@ -1737,6 +1870,139 @@ ipcc0: mailbox@9007000 {
 			#mbox-cells = <2>;
 		};
 
+		/* Display subsystem nodes - MDSS 12.1, DP-only (no DSI) */
+		mdss0: display-subsystem@ae00000 {
+			compatible = "qcom,nord-mdss";
+			reg = <0x0 0x0ae00000 0x0 0x1000>;
+			reg-names = "mdss";
+
+			interrupts = <GIC_SPI 930 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			iommus = <&apps_smmu_1 0x3e0 0x2>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			mdss0_mdp: display-controller@ae01000 {
+				compatible = "qcom,nord-dpu";
+				reg = <0x0 0x0ae01000 0x0 0x8f000>,
+				      <0x0 0x0aeb0000 0x0 0x3000>;
+				reg-names = "mdp",
+					    "vbif";
+
+				interrupt-parent = <&mdss0>;
+				interrupts = <0>;
+
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dpu_intf0_out: endpoint {
+							remote-endpoint = <&mdss0_dp0_in>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						dpu_intf4_out: endpoint {
+							remote-endpoint = <&mdss0_dp1_in>;
+						};
+					};
+				};
+			};
+
+			mdss0_dp0: displayport-controller@af54000 {
+				compatible = "qcom,nord-dp";
+				reg = <0x0 0x0af54000 0x0 0x200>,
+				      <0x0 0x0af54200 0x0 0x200>,
+				      <0x0 0x0af55000 0x0 0xc00>,
+				      <0x0 0x0af56000 0x0 0x400>,
+				      <0x0 0x0af57000 0x0 0x400>,
+				      <0x0 0x0af58000 0x0 0x400>,
+				      <0x0 0x0af59000 0x0 0x400>,
+				      <0x0 0x0af5a000 0x0 0x600>,
+				      <0x0 0x0af5b000 0x0 0x600>;
+
+				interrupts-extended = <&mdss0 12>;
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss0_dp0_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss0_dp0_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss0_dp1: displayport-controller@af5c000 {
+				compatible = "qcom,nord-dp";
+				reg = <0x0 0x0af5c000 0x0 0x200>,
+				      <0x0 0x0af5c200 0x0 0x200>,
+				      <0x0 0x0af5d000 0x0 0xc00>,
+				      <0x0 0x0af5e000 0x0 0x400>,
+				      <0x0 0x0af5f000 0x0 0x400>,
+				      <0x0 0x0af60000 0x0 0x400>,
+				      <0x0 0x0af61000 0x0 0x400>,
+				      <0x0 0x0af62000 0x0 0x600>,
+				      <0x0 0x0af63000 0x0 0x600>;
+
+				interrupts-extended = <&mdss0 13>;
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss0_dp1_in: endpoint {
+							remote-endpoint = <&dpu_intf4_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss0_dp1_out: endpoint {
+						};
+					};
+				};
+			};
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,nord-pdc",
 				     "qcom,pdc";
-- 
2.43.0

