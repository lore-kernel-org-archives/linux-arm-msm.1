Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794470589;
	b=iS11TQLGlJdA0MAAR0kO0boCZQQpfMRJtONJDXx3SA7Z50kRVYz5C2UnNYyBw5zysYpE
	 q1ADRd6XkCi5WBK0H7l/0XViX0TYlv9yAp1CPGr21PMnlm4ay8PfKBhnm1to47oK8oXGv
	 M70yCQW4EndxHirDG0Bk5waNIAfLJVlCAMwSPJyWnzURLZq0UGWJnF6A1/GJQ6KyYJGX+
	 1vE4vl7EwCzi6libVRejALLeV9votB0D7M62xIw4aqr3z355vZFjhC8jz1jDzqT0Z0ULZ
	 lXslZs48BWIgY3TtIyxr6nlBh/OSU6sciHoqBHqS9gtXknm7fXYz9VCBoQE1KYtI+3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470589;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rvQVSnjuRvfSMbKrL6njJALbKeTjghQ0+1Vsab/TIsk=;
	b=V2Z+RfwV3otHoCjbKdurU8dVt6rli056/1Q4Y7QUBlN6GbKp1CPkbIWMaxIgWNuwWH2i
	 O+q5tXPgE7KenQjA8Ez2RHI5qNnYklhFf8XgQPwsvX2cTucVar8ra5E7OLEePIBC0dW5r
	 i+ECnpylG6agDtfwEez+rHQa91cQ9FESN44C2PrNWZuQdyQl6DjawysWfEfOzeOPma3FX
	 zAJSnLKxLK5nm2lYu9hUkH7SRj1ISFI+3/GcLl5zT++GZQFFaa0xcaOc2YRs3itRLxZb+
	 YkcP7PySO1bpmhEr4tU+6Bislj/RcJ7DKQNs/P2hSomlqD5P0/Xl+GyA89GDiVc6m/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iEGdmiJL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g7BDamYX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE992606A335
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:03:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE992606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iEGdmiJL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g7BDamYX
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7j8Ox126726
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rvQVSnjuRvfSMbKrL6njJALbKeTjghQ0+1Vsab/TIsk=; b=iEGdmiJLdsk76Nvw
	f5yUcmYzngENXKTM6zBc7+ZysiIOH8nFujDieiVRI5tK8VaGA4hMFs0n6XsMdHGs
	7UF9ugoMGEmKCy75pb8XAOST8HALLcZiQ4nm/W2WkyB9/Mnn+Nk99wZqyp3gzXNS
	tLx9lIPHZ2kJB1FWBq2IbulmyhB3BdIsZkvTJ8eOf0Lg1/KNFNagxOJF+sTcm7FU
	EzNhX+tbXME0VZPnHvFlqqWqMvNyW1HIHzSPUjirVWC3sQjHyrPZIalsg4XLF3Au
	OxYxCOn8RvfZZ2Cbn2HXnsLLAiNdLNICpsLjJkxjymc9Lpa6KKRjaVIr+RZ3cg3/
	O26eig==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9a082h4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:03:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3aed37745bcso519903a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 00:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794470586; x=1795075386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rvQVSnjuRvfSMbKrL6njJALbKeTjghQ0+1Vsab/TIsk=;
        b=g7BDamYXREm1edUXBDN2Fopl+WGkMxDB68ILvCJsfjilWW70yw1M+kq9WvwvXcXmq/
         9MvLwvGzgzluZzAY01f+rE0jHH50hTgyhD8VmuaT4r11fd/tO8quFLD4iPMfyv4Sq4jc
         bk0FJdDm5VRAVMwTAFVmTqjIXnK9gIbces/DBvQ9NV1QOZSdzE3GvodEjxU+9z2m8TeQ
         /fQdHCho+qsty/YKH3P5I5nu3k9rtUHotla34XmI2MH5EWfMAetpTOXCLHiUoKEuVE/j
         9EoirAAmMidH2Ov43OofxmT7hhBXQmPSYt6f+ZitF2CcKEtRtV0RqwX0z7f/2Tlt+Sv+
         Cs3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794470586; x=1795075386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rvQVSnjuRvfSMbKrL6njJALbKeTjghQ0+1Vsab/TIsk=;
        b=FXxDsj56d8IZkJCuYZ9vRM73u0Y+CHkxLLHRh//xuq1mBvYD+8+T2We6hNDNbzDGjN
         b1pRp79mIogvmbhY58HJvRgYHTiemVNfWcQGsj3yxFbcT8RR5NSwE5Zlf3Lz8qgXRpXs
         NDSBkpRRuqGOll0xDQfYF9WOmbvaRcAW7SO0pLSnQsN5c/2ZcoYr6au4sPzupRj1C1xt
         erpKM/sHWgDZKHCIZwi2lJPwb5/0H8lEGPzdzEOi6DBgJUOhdx57DIKxVd9Dc3w9h3oH
         P6fenDmbT19uv8wDJT/9HAgxuL3kLI+kPxH1wQjT4NV2BeOAmZ27sJaQaL6UT2pZrPaG
         Wj/Q==
X-Gm-Message-State: APuU4Z+dPRwqy8n40SuOnNw/WJrdcYMmIq6rOR4aRWnjAM8tDnTyH15p
	xLIJHBGj6leVtg1WG3k6L3UvRX/80B4NsIQKmq099K+tnF7nalOqfBG8Ts9w4Wzd5cIH7GobukE
	fdu/LrA8Y6QSRMZRCMHDOKb3HHtQrX+J20KOrO8G7Dkhi30Tez6elTiJeGhtS6Wj/lZZQ
X-Gm-Gg: AYBFou3atbTxKwYwY/OnJC5SUXihh+NT89kFfPD2fIJTicFz07nlQtNYMcysRxZIV6I
	nwB1Kl9X078rHYRNSXgJo71Yi8G79A36G4JgnILSkVZ50/vqHfe/RzfbcMIoghtlvlb9ykPviKD
	/JuR8iLREQaPC/9sJXi5VVDrdE422o8KINqtshuNT1elWWV4+me0i3kr8+auusaH2uByxudh0dU
	L+Pc6MJVPeDkFOakAvqzEOlKYtebrlq95WX3pLFLfOUTTLTpTpXdUIwcNtpiMxFSjrQC/PpwF5w
	8x8H50Cz+wsmGexwbplYNi05Y2moPshhPDQjtVEKzeupqOwx2BVuTFpps/fDjqkLjD5FaS6dsHl
	xkIjT39KGlWw3FMjhXIBAAAFPScxDzrp0OzCDe0bDKz/39F12TGqKkz/Ul2GoKSRM2rZicnxySS
	Ja5xh+a31V
X-Received: by 2002:a17:90b:1dc7:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3b197c81836mr1185585a91.8.1794470586252;
        Thu, 12 Nov 2026 00:03:06 -0800 (PST)
X-Received: by 2002:a17:90b:1dc7:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3b197c81836mr1185551a91.8.1794470585650;
        Thu, 12 Nov 2026 00:03:05 -0800 (PST)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b182e3a74asm3722251a91.4.2026.11.12.00.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:03:05 -0800 (PST)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 13:32:50 +0530
Subject: [PATCH v4 1/3] arm64: dts: qcom: nord: Add SoCCP remoteproc DT
 support for Nord
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-nord-soccp-dt-v4-1-af6e44e9f397@oss.qualcomm.com>
References: <20261112-nord-soccp-dt-v4-0-af6e44e9f397@oss.qualcomm.com>
In-Reply-To: <20261112-nord-soccp-dt-v4-0-af6e44e9f397@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: GBlNBIyKnueKNerLrEZkauXJ3fDfnM9_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMSBTYWx0ZWRfX0vCVcBsiF8rN
 hV/Z4pSNVCQ9MYNkzNDyJ/Q0e9cTT1xZ4y70A/YnoGR2Vor5tWx54ktPWEMK7dNc2kvyevOu7h9
 i8El8bYo1fdkJKpc3jq17cilScATfWfRlMng2ttHiLwBcHV6YxdQyNb07XGeE3zIQllmWTiQA3H
 sGefpZZUNKkbsCdTwZgdKspP4NBLcEdWNvl5qiaie/Ts1ZMCTHBuDEy8smZGNsWtc8mBqCg0fg3
 Z3+sQtnKBg1ffNaky78aM9IzrAsxQRxQ88Qn5Ze8MRKxi3dAcP8SwG35njnLDmQHjfiV+A0KPSl
 dD0eCVUZK7qlBuGRzwhvrv+G7+qBcffLngsAL60t1Dhp1UrL0uPApGephkWnPLr/Nq945jvmAps
 4OjTLkhTlxb7dZgZ8CkAuU6x4Qi7UFryHncEZDBs1GyMhYSlw/iZvDqsZ2vwRIdxvfGzhg6Elmq
 pUzQ2lC/KgJWGXo1ndg==
X-Proofpoint-ORIG-GUID: GBlNBIyKnueKNerLrEZkauXJ3fDfnM9_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMSBTYWx0ZWRfX7Mf5rsfJWaOq
 NmFySM2R6j1XVCGIz1OE9OYd4P0+oVzVt9iKpJczu5dAg3JowNhgUfTrGiAs1HkjCB7V52BedZe
 inKsNng58Lkx4nBN5qefYUJ4rZcQxS4=
X-Authority-Analysis: v=2.4 cv=COG/zhrD c=1 sm=1 tr=0 ts=6af572bb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=DvZID761xdY0-bu0Qo8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120031

Add the SoCCP (System on Chip Control Processor) remoteproc node and
its SMP2P configuration at the SoC level in nord.dtsi, and wire up
the clock and power-domain dependencies shared by all Nord embedded
variants in nord-embedded.dtsi.

Move the SoCCP compatible to nord-embedded.dtsi to fix binding
errors reported for the Ride board.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 10 ++++++
 arch/arm64/boot/dts/qcom/nord.dtsi          | 56 +++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 5a1520e436c6..2211171b8c4c 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -464,6 +464,16 @@ &remoteproc_cdsp3 {
 			     "nsp";
 };
 
+&remoteproc_soccp {
+	compatible = "qcom,nord-soccp-pas";
+	clocks = <&rpmhcc RPMH_CXO_CLK>;
+	clock-names = "xo";
+	power-domains = <&rpmhpd RPMHPD_CX>,
+			<&rpmhpd RPMHPD_MX>;
+	power-domain-names = "cx",
+			     "mx";
+};
+
 &spi0 {
 	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S0_CLK>;
 	clock-names = "se";
diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 617e5312f4c4..b66db8019555 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1029,6 +1029,28 @@ smp2p_cdsp3_in: slave-kernel {
 		};
 	};
 
+	smp2p-soccp {
+		compatible = "qcom,smp2p";
+		interrupts-extended = <&ipcc0 IPCC_MPROC_SOCCP
+					      IPCC_MPROC_SIGNAL_SMP2P
+					      IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc0 IPCC_MPROC_SOCCP IPCC_MPROC_SIGNAL_SMP2P>;
+		qcom,smem = <617>, <616>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <19>;
+
+		smp2p_soccp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_soccp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -1587,6 +1609,40 @@ uart13: serial@a98000 {
 			};
 		};
 
+		remoteproc_soccp: remoteproc@d00000 {
+			reg = <0x0 0x00d00000 0x0 0x200000>;
+
+			interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_soccp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_soccp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_soccp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_soccp_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_soccp_in 9 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "pong";
+
+			memory-region = <&soccp_mem>;
+
+			qcom,smem-states = <&smp2p_soccp_out 0>,
+					   <&smp2p_soccp_out 8>;
+			qcom,smem-state-names = "stop",
+						"ping";
+
+			glink-edge {
+				interrupts-extended = <&ipcc0 IPCC_MPROC_SOCCP
+							      IPCC_MPROC_SIGNAL_GLINK_QMP
+							      IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc0 IPCC_MPROC_SOCCP
+						 IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				qcom,remote-pid = <19>;
+				label = "soccp";
+			};
+		};
+
 		bwmon_cluster2: pmu@1014400 {
 			reg = <0x0 0x01014400 0x0 0x500>;
 			interrupts = <GIC_SPI 739 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.43.0

