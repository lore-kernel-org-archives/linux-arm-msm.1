Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BA13AA1BC
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 03:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790134131; cv=none; b=ntPcB3DG+9CSLOCqNDwqz7LYeQEr4MLmLEyyIe3u+Rh86zsm3g9cCXTQ/BoWODw7UIGKypaOHCTmFIeHKv8GbdnT/xG51UAmifKpah5brtI2m6Xa6by7XHc6YL3NIHy9Fs6WN2LIf7W6CetDKC8lx07Lb8K13z6sqHY5Xa64U4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790134131; c=relaxed/simple;
	bh=XIbh0A0n8yoCCDWKUVXL1zSwiF9pQIz0PM7OrHTUx0A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nZyAmSCKhXEdhceI2cVIO7KTqVoEuQABR8aitNHq8+Fd9gez1YB0yLePJK0iVcBhtuIb22Uajp8lYor7Ta2URoC2S2fwu8R+hwwD7jUlI6GjI0x0qAJY/og8gX/l0NF/az7hg5lDRe4OTmsulsw8B3SnskDCI4U9bZwHeLifGzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R+wdzf2r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TwQJXVZR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R+wdzf2r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TwQJXVZR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJBhnp3897576
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 03:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M/phS+itLBeRjhg/R8jZ2IfOoTAgnhICtkcRDhfw1qY=; b=R+wdzf2rNsnf4XB5
	JC/b4s1lbtPnQIxjO7WPlaZQ6P1suN+zBpT1PBQeKltgK/UlhYT7yy65ypycmBcI
	WrdtHFN2OXl0DgYP5m3scSw3VoC1a7luetY5XRb170Ob5zWvOO0Laxa6YZ/2j6di
	JhuefL+bZPEAC9h1lvy3QbS/UZioRSqlMbVPSTm+qB/n0sm/nGzEok2nwH5/NwSu
	hjXobM0msmmHcJ3ubjdwtZN40ari248leikyjbmjlqoWKYZu7r3/Iz5+iAcN7aLr
	cMRdwRSugDW+/SDEh7ZeOxeS/PXKFQiyp3dO3pfKqR555aVa9yEXUwrll1ua9AII
	222Seg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma1s5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 03:28:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2db8e9fe9c7so5477325ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 20:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790134128; x=1790738928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M/phS+itLBeRjhg/R8jZ2IfOoTAgnhICtkcRDhfw1qY=;
        b=TwQJXVZRnuhNJJ/6wgSgIalkl3AT/I3BYK4K0tnCfenrUK0YjO4w0tJcHuQzpMneFa
         f+35vaEeoGKiEJQG1/vAp0rizDqIetISNqpFG0d2aCNJlaK6SPrO5Jh70C/Yj903clGt
         aVvw60KRHT+sdpP1utHjzeEuTrPVYdF6tp5F/Qg/C2dKiQ65FIFBs2tUhfL8d2n8cH5h
         oHYuuXKTYyWglORiu6IYLpzVzhM6RcHnpbhnBHRYgbD6zTOrFrRnpFHcgtKUixEHNI+G
         zAJXxnS40Bo0jvkqwHk96fWnxEAg/S5TtzkOwzz5JumKLFNSIEGi4sKI7xxjeydRHW4a
         px3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790134128; x=1790738928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M/phS+itLBeRjhg/R8jZ2IfOoTAgnhICtkcRDhfw1qY=;
        b=HTDh0Oo6A5lPsxoB3oNayRoerZwZTPyUsLWW2UG7h+8Yjo/Y5D3c1HjKlU9pQmlor8
         dnnUOrllIHwu1JumRDrekH3r4LsZDsRn9yJkT62x/Vbv1EShVhI+nl/Ne2+wHroRFqNJ
         ImCRJ7Ubu1vCd1/wVxcYxa2yhMbN4E+yOyvERnnU6Rm2OhO/7S79I0AiUgeVcE3S0vQE
         Vu3zXKpbjF1IRNrobgTvvbGx6/zQcQ+VOe/+OAdKm4QG5Wu3kRbB8XbzjhswjhUEWElI
         IA9DmLYUXMlYru67P8i+UD2+kY0JYOBJAVRUdEXVB+/MQ3pafflNX5q99Npa7QR++Dyf
         xDOw==
X-Gm-Message-State: AFuF++lhigPXrZTz4z4mqzW89hDY6MNBXGWccja0CNXiDarI3Lhh3R84
	/DrwSaBXYtBi2jt5Cc0V0uFVjkxUYeJEV7tkPSPjasZwWgG25Y9rmFX94koItySt8lhw1/U7nMD
	2H8eOA91AROGuUYRhuDGFurKTvXUWtNw3wB81J6TIzTkWZRGN4mT6v4NI74Q0ShATBm80
X-Gm-Gg: AYBFou2kJssf6WYs9z6wMOudGQ8+1Yc7Kk0+NSAhzM9FyENK8PKsmMO8AuF+WLOEoVh
	7ns14ktEZMkRwbxkNGuTo+KbFxxLTiag9mCb49m9NOkNofkknMTmmYi4oJ+evhPHLJw1c+iyvRY
	i4WFkxpa/bzIOrUh0P7tFmBVp98JB5i2Sl6MJPfhyFIkCA86KKnMX9x6HFxOGb6W3EzDbRDQYvm
	NENOPQNeooSN6Cua+WMQw1A6/xOg6OC73+EIr45S6Q5tCUDfZYSO7cYWbMid0nLNvAoQg9eZpCr
	A6Liwy3H8euxcFNEeS+mwx4FstuUFlLfbt51EhAkyK1DZEph+jTa9W0YSjNPU7UZLTjkfryrY+y
	lxwsYjB13J/hrm4icruN7c0b15XuKaecuhTjtvP6UkbP38p2DNBfgtkCK2PhK+2Uu5LOMO4KJ6r
	6VPs+JzO6k
X-Received: by 2002:a17:902:f551:b0:2dd:c100:942d with SMTP id d9443c01a7336-2df69dec1c9mr10852765ad.43.1790134128098;
        Tue, 22 Sep 2026 20:28:48 -0700 (PDT)
X-Received: by 2002:a17:902:f551:b0:2dd:c100:942d with SMTP id d9443c01a7336-2df69dec1c9mr10852615ad.43.1790134127639;
        Tue, 22 Sep 2026 20:28:47 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5c3733sm3603525ad.41.2026.09.22.20.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 20:28:47 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 11:27:56 +0800
Subject: [PATCH v2 6/7] arm64: dts: qcom: hawi: add iris video codec node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-add_iris_for_hawi-v2-6-016ec3d24b79@oss.qualcomm.com>
References: <20260923-add_iris_for_hawi-v2-0-016ec3d24b79@oss.qualcomm.com>
In-Reply-To: <20260923-add_iris_for_hawi-v2-0-016ec3d24b79@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790134092; l=5477;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=XIbh0A0n8yoCCDWKUVXL1zSwiF9pQIz0PM7OrHTUx0A=;
 b=1ZAswR2/0ecJqOaJVAmX2zc3+C7dnskRcqAny8Bklp5Zp2pfC0GWddBXni6wyxmMmmyWVwRMz
 TLl5eDAADs+DMzBBEHSOizyMlO5aqyQcJwwQ23E6sGymCcFitrL37P1
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: yByzySDFlcheOk5NPig0ElnSOfku2eFs
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfXzpwtcKiVzDid
 /nsbJJqRVyLLddOKJUy4N3L9SJd39XcZjnXjvs8s45YEMY5gxEXBAHJr5Jguvfai4rqt/KHvDY9
 HfX4xQX6dvYfQ8PECDXP4w7g0L/Kifk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfX5i0v87Q0bi5b
 Y6EqBa613gIL4L1Rfswh1UaDbNHf4Raddl+snK4TAN+4h/6BiDpx+74OfHakILsTcLrD30T6Hze
 J3rAN9eqdUOkIQoBYlMJkvCawgeuIZMWlz5WntmRJChiU42toLHgArJ3PifvC46NZYg41j1I/14
 4co6WH885d7t4MYU06riNFFfetJNV5gllgt4YetHA3/FGmZBLbr+LK18cTrxGWgfD7qRtdOr1u+
 /5o82uDSv9OCCe8VfX7mEylaqYAIyjd/Vj/bJkVmSmpJi1l9wMIDJAP8VGAYScosZjbXOR05dfV
 tPQPPGE0d1u8VGV3B/JziP7VNKrW+PVgNjZPWCZJinbo9M2k/VBRHMPnWcTqeR0Zlr4+JghzNO1
 Y+fDoJBWwSfq38iQTCTr9urlWpn7+a+/1PnqsY8jtlKdY+aQzAS49mNTRRREWdEimAUdQJ7KNLy
 oLGv7X+duSlZcuRhjGA==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab34770 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=qJL271BKxqclmSQN1U8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: yByzySDFlcheOk5NPig0ElnSOfku2eFs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230013

Add the iris video codec device node for the hawi SoC, describing the
register space, interrupt, nine power domains (including the
VPU5x-specific mm-int and cx-int domains), thirteen clocks, two
interconnect paths for CPU config and video memory bandwidth, IOMMU
mappings, and the operating point table covering 150 MHz through 1000 MHz.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi.dtsi | 155 +++++++++++++++++++++++++++++++++++++
 1 file changed, 155 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index c7ae8133b9cdc88133f6dccdf87bfa8bc88677e1..dbd13c9aa10fb4230c226a207b278e8ca698a92a 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -3421,6 +3421,161 @@ ice: crypto@1d88000 {
 			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
 		};
 
+		iris: video-codec@2000000 {
+			compatible = "qcom,hawi-iris";
+			reg = <0x0 0x02000000 0x0 0xf0000>;
+
+			interrupts = <GIC_ESPI 238 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&videocc VIDEO_CC_MVS0_VPP0_GDSC>,
+					<&videocc VIDEO_CC_MVS0_VPP1_GDSC>,
+					<&videocc VIDEO_CC_MVS0A_GDSC>,
+					<&videocc VIDEO_CC_MM_INT_GDSC>,
+					<&videocc VIDEO_CC_AXI0_CX_INT_GDSC>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx",
+					     "vpp0",
+					     "vpp1",
+					     "apv",
+					     "mm-int",
+					     "cx-int";
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&gcc GCC_VIDEO_AXI0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CTL_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_DEBUG_CLK>,
+				 <&videocc VIDEO_CC_CX_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>,
+				 <&videocc VIDEO_CC_MVS0_VPP0_CLK>,
+				 <&videocc VIDEO_CC_MVS0_VPP1_CLK>,
+				 <&videocc VIDEO_CC_MVS0_VPP0_VPP1_GATING_CLK>,
+				 <&videocc VIDEO_CC_MVS0A_CLK>,
+				 <&videocc VIDEO_CC_MVS0B_CLK>;
+			clock-names = "iface",
+				      "ifacec",
+				      "core",
+				      "core_freerun",
+				      "core_ctl_freerun",
+				      "core_debug",
+				      "cx_iface",
+				      "vcodec0_core",
+				      "vcodec_vpp0",
+				      "vcodec_vpp1",
+				      "vcodec_vpp0_vpp1_gating",
+				      "vcodec_apv",
+				      "vcodec_bse";
+
+			operating-points-v2 = <&iris_opp_table>;
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_IRIS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO_MVP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			memory-region = <&video_mem>;
+
+			resets = <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_CTL_FREERUN_CLK_ARES>;
+			reset-names = "bus0",
+				      "core";
+
+			dma-coherent;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xffc00000>;
+
+			status = "disabled";
+
+			iris_non_pixel: non-pixel {
+				iommus = <&apps_smmu 0x1540 0x0000>,
+					 <&apps_smmu 0x1620 0x0000>,
+					 <&apps_smmu 0x1544 0x0000>;
+				iommu-ranges = <0x32000000 0xcdc00000>;
+			};
+
+			iris_pixel: pixel {
+				iommus = <&apps_smmu 0x1543 0x0000>;
+			};
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000 150000000
+							    150000000 225000000>;
+					required-opps = <&rpmhpd_opp_low_svs_d2>,
+							<&rpmhpd_opp_low_svs_d2>;
+				};
+
+				opp-285000000 {
+					opp-hz = /bits/ 64 <285000000 240000000
+							    240000000 360000000>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs_d0>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000 338000000
+							    338000000 507000000>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-420000000 {
+					opp-hz = /bits/ 64 <420000000 420000000
+							    420000000 630000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000 444000000
+							    444000000 666000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-560000000 {
+					opp-hz = /bits/ 64 <560000000 533000000
+							    533000000 800000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-630000000 {
+					opp-hz = /bits/ 64 <630000000 630000000
+							    630000000 1104000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo>;
+				};
+
+				opp-800000000 {
+					opp-hz = /bits/ 64 <800000000 710000000
+							    710000000 1260000000>;
+					required-opps = <&rpmhpd_opp_turbo>,
+							<&rpmhpd_opp_turbo_l1>;
+				};
+
+				opp-1000000000 {
+					opp-hz = /bits/ 64 <1000000000 710000000
+							    850000000 1260000000>;
+					required-opps = <&rpmhpd_opp_turbo>,
+							<&rpmhpd_opp_turbo_l3>;
+				};
+			};
+		};
+
 		videocc: clock-controller@20f0000 {
 			compatible = "qcom,hawi-videocc";
 			reg = <0x0 0x020f0000 0x0 0x10000>;

-- 
2.43.0

