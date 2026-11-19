Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795065235;
	b=rflNB7D2tAwsczYR5uui5xYmrsyT2uIUmrc7lEJ37PPJoxRsj4RtzdFjLbm61cBhtcbu
	 Z0B3YDDMAP86GtoIUSlgc3xH/LGRfYwvCwQbpLSOyIZMS2bdoiy6EUGFYDE/K4+ZA5+nN
	 1UOsZgkGKGZD4vP00856+Qy8SGCXYWGOdGtMy2IQ7LnhT2f3bAurs1dvD0nPIrcUXeYeC
	 AoYa49sCeWKQfMbwl5NqO3qq+mRDSrGfK0V/ucd/Yb6u3ZZs39+PNh+MFgSigNmcDrew1
	 vxNZgfZAmFVE5omQbLy1465zWaK8hejpguehHl5+YrG+i6tu09rF6CH5xAnqQyBIGqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795065235;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=o7b3ZqIWyIBUvoaUcGUiUhdQeDWojerQ55/pCvga/6U=;
	b=J4T2Nw9b5CSKVIZeDgpuw8Qp14FFlH4E1ZnA/PRA+Pv8XiNCL6B0fsb3+0FFjnE5/dQh
	 tz8GAsfCvwh82r5ZQ5dhqdXGYnJicZLhIru+P8BFYb1/TgfDk5p6mNIHc1cqJajoa2tUe
	 7/hJ0e17rwmArH7ekROomaQvaGz5lqgJ1FKZEPDhY+m9k6M1FCGQwpVOTOHRu/aWAsqnj
	 MrWb3JLThWwlAnSaFokloKiYbQN5amwEfTsfSMOBSoxGM+3jdfjbHPj9L5bPCnifTLARr
	 qkYWqABfzWJvIBQvUdrh7iG8/IgUeJOi3glxFc9T8R0b+9M7i0LpuxzUOlVwB4eNySQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WcicLFNZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zjalk7fr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FED3606A33F
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 05:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FED3606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WcicLFNZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zjalk7fr
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1B71g786419
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 05:13:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o7b3ZqIWyIBUvoaUcGUiUhdQeDWojerQ55/pCvga/6U=; b=WcicLFNZzc3tKHly
	g8AtOzeC2LZsmUrsC/Z4gWE0mH0GsLEOxFwxMgcaNXiHtXOE6qaqt/z983csEixg
	xY3Nsbn5QpA+RcGrjU0p2MizoiHB6+AZ0pANKsPJFxjrdY0gnCvIXcNldYZSj9QU
	tY0fhDLbTuqCuclFY1MPH1FZ4icWZJKTk/K8774qALYMmM7zT54gphIO7hILMchz
	3EKBUYtXMmtrCUy2k9gX7i9Qd8WdRcbrUmoP2U45TIP7pdy1J7+z0u/EY3OJmOfG
	CPMCIaW0YJXk2wnumcbv1zByv4Uw3UYXxgE2qRVz36dptdK6QVBQEKuKE2+HeWmS
	spn5xg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dpcbcxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 05:13:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2efad644688so16446335ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 21:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795065233; x=1795670033; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o7b3ZqIWyIBUvoaUcGUiUhdQeDWojerQ55/pCvga/6U=;
        b=Zjalk7fr7v0NQSD65cbwbWclDp9AzKx94rEay2vYkkLhVY+ns65Vncp4WOqIeQAVJk
         z5Ubx0qW6QERNdsEkffX97WoNHEEI7SAnaUEd08yvLXsrhNJtFF8r2JQ5Q3pojPdSXiF
         yjpV68Qp2tf9iHzjphi3FV+5Tk3U30sIegO/79D9+I8varKyF3SvmS7AHtuPyNmbeUMX
         M2F0wDRIATLWdu2MrvpMXgoyigB740BgI96T6UZmR1KgSAFS+DP3WS6mS/HnllLtaZfI
         CUsZu3aSmJ54pCro8ol7cDuD+DDklKmtbEA3rgNYs3qe7mYvX5kasi61OsiN1NHh828b
         lkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795065233; x=1795670033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o7b3ZqIWyIBUvoaUcGUiUhdQeDWojerQ55/pCvga/6U=;
        b=lo+5UleQVSKX74RbHhurDm/ITDqZSjKf8Gi9OufWpSu7ceT9XoRPlhDXIQjjIHm7HD
         bDRE+XFgdO6ua59hldhBgad5vX2KS2hVJWo66AgTtIQJRV/RIbc7T2vouHcgJ46BD6xI
         TueJQdj1C1cqb2a7PHLXsctuhSObm1HFbE8Qj4qzZ5sCEH0UfNvhQVMDlex4ASRI35B+
         a74WjN2vYOgFxSSBv2IuQLnYK6j8Q8dyAw6wAlgfNyErr+lmZYQdr9a5BcujexQ/d5ew
         nuibZ5uRHopQFNbXwq34DTE4/+USHaeRtJ4k3ON7ooi+a6UpYNZSeLfhq7qoAb87l2ma
         cbCA==
X-Forwarded-Encrypted: i=1; AL+hErFqPKKD63NS3hBqFj0ALssFboCtiUssaCz3l47fqMjeUCYnaFgUjm/KmsbpxQYYxmP2iWksTP5b6AX0PvSx@vger.kernel.org
X-Gm-Message-State: APuU4Z9CW0EUvr8fjg0hTL4ABr2TRlRWkZsbjB7DItnGnLRfyBADTv63
	FWuguYGK5o3jNzKt7d5l8ZoXF5GSiGIxWNeXLDHXjVLyEuCf7q6+WztjCdHm+8g5VCBmlMkO72Q
	1QPXk60AIqCuwLRPjoTeQedKtzQEHho4AYZqJyuHm/YLes17BncmPtcN4MFAPkAIwRSBW
X-Gm-Gg: AZFdTZcgMF9gNrxnFC50bnbfFMxbM50w/dz2TDjEMTn0z0xfIP2JEq4Lkg+ofZgq4RL
	sDy5b7Vma/Q0HDv6mfY6j+eRG6buqrH1UEpWKz8lmbwtc3hxsHnBl05g3e2gmVT6yh0EkyqkhUP
	7acfAafOs3bPqKFnWPdHL2N/TAzSac20+8olJjrItd/XekYR4y4eGA1o18tHIcIUaezZQ4D9vOT
	Ik6932aVxyGfNh9RwBPKcKLC7CjoswmIEVqpxpHnzSBhZpwKA3ZcVhEzUpUX0JHZBxxvi+j+GK9
	OBtEGx2ziWxdRGxBIzQO3VwUNQpvOH7Gn09XYR2l2fa0UYJyB3zlEgt1Ln0pafl8xSpxa0uwGFP
	Po6yya4AT4Jp0LhqbQ7lC5jlpa8rEH1fhP2AVFwFxgoX2U87AhmfDVFCU7c+LJLTuzhBRbbgOk7
	3v1HGVgc+bneR8H48fdybd7FOZ2rVGByYBWbHW6sBZ2GuLT4s=
X-Received: by 2002:a17:902:e790:b0:2e2:dfb8:818a with SMTP id d9443c01a7336-2eff7574cbamr50789145ad.62.1795065232881;
        Wed, 18 Nov 2026 21:13:52 -0800 (PST)
X-Received: by 2002:a17:902:e790:b0:2e2:dfb8:818a with SMTP id d9443c01a7336-2eff7574cbamr50788815ad.62.1795065232284;
        Wed, 18 Nov 2026 21:13:52 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622c0a5sm24067185ad.50.2026.11.18.21.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 21:13:51 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 13:13:27 +0800
Subject: [PATCH v3 4/5] arm64: dts: qcom: maili: add iris video codec node
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
Message-Id: <20261119-add_iris_for_maili-v3-4-d47d047a3f7c@oss.qualcomm.com>
References: <20261119-add_iris_for_maili-v3-0-d47d047a3f7c@oss.qualcomm.com>
In-Reply-To: <20261119-add_iris_for_maili-v3-0-d47d047a3f7c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795065207; l=4558;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=3Vzy3adLFjNFEAYjDxg4QGwGHqNR5vbFLJ5s3PhkjLw=;
 b=7RYALyIuxnsQGdfGmqY3rhG4NJWTpdaGAGcYAc7nRQN/Ec4CJqU3EZX7pXKVRYcAHZipszSKd
 pHGXiJ+szJZBopghlCfRjlZNpe4aAXRNNP8y7BrGLzqwQr/gjPOx/Qh
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=YJ0KWhGx c=1 sm=1 tr=0 ts=6afe8591 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=4Uxp26bCVegRMv0i2ZEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyMCBTYWx0ZWRfX/5wo3W2KOoRs
 Y2zIBEYLp0A+DSET99otMo62+Kd6TzRl9U9u7IQAOAztLWdg/+JGiPEG94HaLHC31xx0Ly34t7i
 JD8gkLfr/6WZvQ3E/VtG9Wwvt3J6qOvYY9xNlOIRKwuJT2SAbePGUYTQE9eqIQyNvpmpGg4eFFU
 e6KSc9ZzQyYzvTwm1sIcdU0GJPkQrxOmTNdSaK0l4DE3ATAf3Pdb4o4pt+sM88C6q1MBMofhdNY
 wusqojEj82+oUCCrMX5lTpSPKxTPOmVrzRzi7ErF2U21g7JQYlmeForZDnlFxEgwQpJkRRU+FPL
 xR8DK6qviAHJJnp/SoKcyIJyEbn9Bmzc4aXkTXZqdLITnAwfpblK+Y+mKqY5g1cqKf6+UUcKtBz
 hEoFrPU+1mnG4ACDKXYFcJCVEjL1A4Czw4W4A21EpTkunmQpImPsxg0ke/uiiygN0jN43aB4ge0
 GRRdpXmnqirrCAHJTJw==
X-Proofpoint-ORIG-GUID: y5t83UJ7W1H0iTj0K8N4B_r37DHD-G9e
X-Proofpoint-GUID: y5t83UJ7W1H0iTj0K8N4B_r37DHD-G9e
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyMCBTYWx0ZWRfXxohOdP3tkpRU
 DXPV64azr6sV5ztvJ/+nkovMXPs1OHbBtBhGIRGzPOakeeKGmj8wxhXF3BFK/esD++LXS+vDDXs
 LBGLGrGxXNV2z/9WQss9AZwTdP7I0Is=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190020

Add the iris video codec device node for the maili SoC, describing the
register space, interrupt, five power domains, eight clocks, two
interconnect paths for CPU config and video memory bandwidth, IOMMU
Mappings, and the operating point table covering 240 MHz to 1000 MHz.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/maili.dtsi | 126 ++++++++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/maili.dtsi b/arch/arm64/boot/dts/qcom/maili.dtsi
index 0aa5bd4ea21c3aad928fb89d5d7c454e4e120f93..1783fa90b12fd8b041c19b54a87870f80edea45e 100644
--- a/arch/arm64/boot/dts/qcom/maili.dtsi
+++ b/arch/arm64/boot/dts/qcom/maili.dtsi
@@ -3559,6 +3559,132 @@ ice: crypto@1d88000 {
 			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
 		};
 
+		iris: video-codec@2000000 {
+			compatible = "qcom,maili-iris";
+			reg = <0x0 0x02000000 0x0 0xf0000>;
+
+			interrupts = <GIC_ESPI 238 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&videocc VIDEO_CC_MVS0_VPP0_GDSC>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx",
+					     "vpp0";
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>,
+				 <&gcc GCC_VIDEO_AXI0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0B_CLK>,
+				 <&videocc VIDEO_CC_MVS0_VPP0_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core",
+				      "iface1",
+				      "core_freerun",
+				      "vcodec0_core_freerun",
+				      "vcodec_bse",
+				      "vcodec_vpp0";
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
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>;
+			reset-names = "bus0",
+				      "bus1",
+				      "core",
+				      "vcodec0_core";
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
+				iommu-ranges = <0x25800000 0xda400000>;
+			};
+
+			iris_pixel: pixel {
+				iommus = <&apps_smmu 0x1543 0x0000>;
+			};
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000 240000000 360000000>;
+					required-opps = <&rpmhpd_opp_low_svs_d2>,
+							<&rpmhpd_opp_low_svs_d1>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000 338000000 507000000>;
+					required-opps = <&rpmhpd_opp_low_svs_d1>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-420000000 {
+					opp-hz = /bits/ 64 <420000000 420000000 630000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000 444000000 666000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-600000000 {
+					opp-hz = /bits/ 64 <600000000 533000000 800000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-630000000 {
+					opp-hz = /bits/ 64 <630000000 630000000 1104000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_turbo>;
+				};
+
+				opp-800000000 {
+					opp-hz = /bits/ 64 <800000000 630000000 1260000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_turbo_l1>;
+				};
+
+				opp-1000000000 {
+					opp-hz = /bits/ 64 <1000000000 800000000 1260000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo_l3>;
+				};
+			};
+		};
+
 		videocc: clock-controller@20f0000 {
 			compatible = "qcom,maili-videocc";
 			reg = <0x0 0x020f0000 0x0 0x10000>;

-- 
2.43.0

