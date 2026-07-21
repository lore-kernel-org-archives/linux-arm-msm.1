Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E537246F486
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 17:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784655184; cv=none; b=qdqp6lbu9gle2lUlRQVQbVgzSmTn328tW9anjQKBLACGCZ9D5ZgBKn5/YAVpsEE6zsC0X99LIvZwuQhqz12OUgJ4xz3eUPQfSNIhaBlndk0AlKwcvinuP6YfXGTyaxftsfmrqj8dxXuyransglymElifZ9IwLyL0SJDKpUZ6aK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784655184; c=relaxed/simple;
	bh=dRdzRZtDzTUzOIxXxBGHyusYw2nh12RXvgdIDJYpbbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RY282Kl6e9iQKHHLxF5QjZybURCXT1yIbQpqrp5lCVpkRX5uiDs0YyNbEO3hcdzCheDC4D0Q66QwsyOom++ReO8NPPDVXxRz/bywGbxKr9Jz0EeXkYk5F2/UC4/tXCM3ih4YaoExc/Ier/mZ5hbci/WnPAnGz+KU27vGf1yQeV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IkRdE23T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cQ29Q6Wz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IkRdE23T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cQ29Q6Wz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2jOL2449285
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 17:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TZQFkX5FyhxLaY5DKTWnVBymP0x+xEb9jOdyAO3+SJA=; b=IkRdE23TQOcXoG15
	jG0wJeeEmaTQcZR8+i0e8J/GtIhHmMNyTx7vo4seJsTYc2mYzewkiY//SukcwkNc
	LEsEy6CBXmCyTUTEqxh0b/cJAT8qEGlOUN6/mwHmt71UeDlncuNlcpbSBHFTMndQ
	rp7yNmNr5Jt4Ylh0TAA+atxq0J2e56vjYLeAZiSRKfgPhLT7AcP9t24nDg99VGgW
	+s7DGLwFLQo5pE86sefyhkNZ/6r5aOnW3bTjsQ9qIpYASfAy/VMeot5ayLyWgURl
	cqJ5Eyxr6J4lOQ1MDixNqVd8R8SA0VBUmisBkPJzhL5Up4Ns//em3RSzZ+v1cMKc
	BMZHDA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj68628dt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 17:33:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so206251195ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784655180; x=1785259980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TZQFkX5FyhxLaY5DKTWnVBymP0x+xEb9jOdyAO3+SJA=;
        b=cQ29Q6WzMRyPQe67epmKs9aVUEfCHo8KPo3dliOdGObpCcrT78kleIJrqjiTN+BYY6
         zcX1KDXoFWUSu2BzVPv8Eqq0/ip5SLf9c9flfjmmP0wqdMyMyamMWnaAtfrnj5DirVz5
         V68+SFhsmL4AhnaleLAcn4W/k7oqRnUidx/82S20M51iiVfiTdOXKFfVaPT4kVSH6TLX
         uxa06kBzUWSxgvaGaerzkRrHpccaBz1G67CdgHpv9a6djl5+oUtJGOFa8h9ZKW0plUxE
         w7tyT3k1KcB3Umi8j3n0MJLHzfBr8yN7QsYQKNA71troHJA9r1atzZbYy3/koWgMZ1u3
         P7bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784655180; x=1785259980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TZQFkX5FyhxLaY5DKTWnVBymP0x+xEb9jOdyAO3+SJA=;
        b=RDGNsz/r+cnUfb+SX/y+u+IpSUAogQ2xMis30v2HS9B6qwgDpFViIsQHo8lgTnOMIz
         P0Wef/jMOsw+zdBEaVZEZb4/72cNumNQ2K7FZ41xr00mzUPo9w6zZQ/tzlfpgkRE0Zgo
         DPpF5AZ2V9G12mikt6MioZzVUKz+5/7jqHdYGRTjvK5xUVtj/jXhqIs/vCCvic8SrYuT
         SeMU6OXOXz4RLsYRkzG+DkMfHavTreYzPKhTS5EZQMIS4QWifkauXZ4nhIAev/fdCJGr
         8yjUaabgeLB8X++5aHjV3T3TiKyrCoVfCf1KEebqh8JPLKDP6TctTkYjuxVDCHV3ODEg
         7u/g==
X-Gm-Message-State: AOJu0YwjCklrVSI50oYjPMt1Bcqo+CbWxc6evaoD+FYF0Owh/B4aMmaB
	Xp17JcUoAAggxhYxNLP4RWWOPyB/VrL89wv7QC3trS3+AhB/jrvaCIxINxxqvwp5yRK0dG9u3X8
	sNQ4dLEj78mYBaBhWwfraLWrzmtLeAqhg0TTFlBdUmxAsbU7u9RXS2VXt4URyEdnRc3d1
X-Gm-Gg: AR+sD13LtOGbTBQEOQA9w9pwg5S8xSfoC6lpQLd1audjz2lbDAUizei8lX5TTBjpMxV
	CK+2/5JOeQcojJrIwDYfL4fSKJRRFkmKOLuhhe6PHN//PMD1oBQotu1SizCH7cto/eptuhKrg6c
	Ki6paXoyGWkt8hKE9P0SkzWqRe6svQB4x1hfIAT0pCdIKWyVLWGipvUkmdb2orbZsY6PrIb/T26
	TLEdIQw6gP+Zatz/VN68UoadwFXGDWFLT82ONR4Hx8ZgFjp5H2h+RLQq40Qe+FVPmi8I6Z2lM30
	R2up2ICOWsNJRL2pAR7VnAL7wEgChgjKe6cfzt1OIjV7b0/X7U3Kj2XUKRFUv1xMuuGjtkalR43
	4GTTs9C0FjBW4iu54V3m+5PXjMX/Q+7cEv3c=
X-Received: by 2002:a05:6a21:b94:b0:3c3:7fa2:9618 with SMTP id adf61e73a8af0-3c3ad9d1b80mr21855432637.37.1784655180445;
        Tue, 21 Jul 2026 10:33:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:b94:b0:3c3:7fa2:9618 with SMTP id adf61e73a8af0-3c3ad9d1b80mr21855389637.37.1784655179824;
        Tue, 21 Jul 2026 10:32:59 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1bc886sm710881eec.26.2026.07.21.10.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 10:32:59 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 23:02:26 +0530
Subject: [PATCH v4 2/3] arm64: dts: qcom: shikra: Add Iris video codec node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-shikra_vpu-v4-2-6dc5a8999b73@oss.qualcomm.com>
References: <20260721-shikra_vpu-v4-0-6dc5a8999b73@oss.qualcomm.com>
In-Reply-To: <20260721-shikra_vpu-v4-0-6dc5a8999b73@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784655163; l=3402;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=dRdzRZtDzTUzOIxXxBGHyusYw2nh12RXvgdIDJYpbbs=;
 b=bTJIUa31mn8AnljqhwJmgRNvZcC1pokcAnhpq+raPaOA2DVTTBA3FKgift4SNg6px3+eOIay4
 aprNaBvNZ9VCbikVnc7uGyFpGf0k38THlWHpwvKL68LnbbqWwL9O8hN
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE4NSBTYWx0ZWRfX6yMDeDjJ6n/u
 4Iv98NxMOOGcId92IJODw8wWAULzVPfikc/EVIXOxcAwkZB5MB7otKhQ36XvyAbnKZkxpLF1Qwo
 OcfQ69aDq+M774ggphfQByyOKaEtbaE=
X-Proofpoint-ORIG-GUID: tsxSbfxZsk1Ry1NXDJiVarwm_KZTiXsN
X-Proofpoint-GUID: tsxSbfxZsk1Ry1NXDJiVarwm_KZTiXsN
X-Authority-Analysis: v=2.4 cv=X75i7mTe c=1 sm=1 tr=0 ts=6a5fad4d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=qMXWHOQDURcJ0nTM7qwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE4NSBTYWx0ZWRfX9ipThfk2YeNd
 lg5jRAhu8P3iR4/MT33MA/QuUEOq8YWGJ6fy79vuP2VfQ0E3QDSebGX0EAyGNk42azIK8AkE7Ux
 lMvrCR77RWxEyN4z3kN+ltQFb9LvFM493hTErwAWF+Ms3OrnznfwxSGFaNT3p5DsFzbvqMH44/v
 fvJKGv7VzBrx6koexp8x2RhZgMz2CEjJaiFaKDZQBtYRAwv7DmZfhH5Aw1acJif+qO+BEG06+mB
 yDLEroQd/95IBudxdbdHGuz8MEYSLtGnAW6O8RZYBGZVFpuYKgfx2sxou1z1y4KxugVsWxNBW+z
 BOx+JT3Wxx6N7tFD/DtIO18vCYdU27aCbZXAoPe7WIr92RaoptM7FDZGTJW3WjeDUaEtkeasQ9A
 0ALUfriUJOFECIRLnUbIn9zEAstHuRcHFmqyDqYMrXezNEuwa1njb9f/pORnFvuNiZFYWANxGGn
 DiZAe08VfxujFNFNX+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210185

Add the Iris video codec device tree node for the Shikra platform.

Shikra reuses the QCM2290-class video hardware and programming model.
The video node is added to describe the Iris based video decoder
encoder block, allowing the media driver to probe and initialize
the hardware.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 71 ++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 2a131ae601a7040142da16e39dbe2f8563ef43ee..8449af599cfc501bf17904c7533b0796948f8fb3 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -314,6 +314,16 @@ lmcu_dtb_mem: lmcu-dtb@b4702000 {
 			reg = <0x0 0xb4702000 0x0 0x40000>;
 			no-map;
 		};
+
+		/*
+		 * The Iris VPU reserves IOVA below 0x25800000 (600MB),
+		 * DMA into that range triggers unhandled SMMU faults and
+		 * spontaneous reboots, so reserve it to keep IOMMU
+		 * allocation above this boundary.
+		 */
+		iris_iova: iris-iova {
+			iommu-addresses = <&iris 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	soc: soc@0 {
@@ -655,6 +665,67 @@ gpucc: clock-controller@5990000 {
 			#power-domain-cells = <1>;
 		};
 
+		iris: video-codec@5a00000 {
+			compatible = "qcom,shikra-venus", "qcom,qcm2290-venus";
+			reg = <0x0 0x05a00000 0x0 0x200000>;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			power-domains = <&gcc GCC_VENUS_GDSC>,
+					<&gcc GCC_VCODEC0_GDSC>,
+					<&rpmpd QCM2290_VDDCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "cx";
+			operating-points-v2 = <&venus_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
+				 <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
+				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
+				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
+				 <&gcc GCC_VCODEC0_AXI_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "bus",
+				      "throttle",
+				      "vcodec0_core",
+				      "vcodec0_bus";
+
+			memory-region = <&video_mem>, <&iris_iova>;
+			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
+			interconnect-names = "video-mem",
+					     "cpu-cfg";
+
+			iommus = <&apps_smmu 0x780 0x20>;
+
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-133333333 {
+					opp-hz = /bits/ 64 <133333333>;
+					required-opps = <&rpmpd_opp_low_svs>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-384000000 {
+					opp-hz = /bits/ 64 <384000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+			};
+		};
+
 		dispcc: clock-controller@5f00000 {
 			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
 			reg = <0x0 0x05f00000 0x0 0x20000>;

-- 
2.34.1

