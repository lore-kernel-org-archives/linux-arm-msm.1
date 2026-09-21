Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203E84C6523
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 15:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005019; cv=none; b=o4IStBGWmYo70qIZL86KRHQ0VsOCFaCAtWoi38N5UdITIOyEM+fwNFDNUNZU/p6602U1NLAuRtARryDgDCdoiqLtsFrUo8bFxo1gn+neGzfdXyrdBvOqWVC+AIqQHjpeLvm2usDwysyUWo14U9dUv3WUMSWG9XgIP91zgGrmYEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005019; c=relaxed/simple;
	bh=KacuOzfLT7ghT0l8x9+HoH6R9vGKNBZqubpcPoF6wZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tLxFrnSd0kMtA4mHwWRVPxwkgHr1Ewp9c50Vun8GjEJDb31t8h9mch5IJFxyoVE9eL8l5zZvEuDImHuwjSHb84vrDI9Qz4AeC6TH/zdMRYSgWxHseR4+s7ZXfxEP0HYmI+MmRz2IEYYR2DrvI847Wu6cph5rlR2eusrwG3DwADI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YzetfMvC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dXdrlove; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YzetfMvC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dXdrlove"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFA41q827677
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 15:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	posbByi2C22vAqDX2ezu/Vx97adQ0JmvEhOqcNgZPY0=; b=YzetfMvCDLkr84aE
	oqP0P6SZo5R+0l94iZbrflbieGX85MAMb7ART385gowz5J9vRLMWM2WUTgLF1TuP
	F+3Tk3Z8Mt7fDT3qNfXXhn+x4218tMCZVGOdaIAx3o/SRmQ17D18LJ2QzubB2bWN
	3EZqKicBnIuCdCNwxiQHnf1n5y6k5LeLnSU2MsU8nSzWgayN5BoJvIksSoJKWRRd
	JYx7vHPzb41MT0BBKdq7e4tyf01vNCGPDOann4mzUEAsVNdjn6etpW2ztpntVZFt
	sRH7JGcyt6zOVB59e9T63o+puGpOpOc5kSXfuRtpsjalufXKTaSILLg2gFi7LCAh
	50a2dA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu17gsqny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 15:36:53 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97e9e1dd7fbso2369026241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 08:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790005013; x=1790609813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=posbByi2C22vAqDX2ezu/Vx97adQ0JmvEhOqcNgZPY0=;
        b=dXdrlovex6wYj7l0W8f0tJjAW8R0gbUHSRoYoPkqC7gOBhVh+kdJeuPfrCePfRRP1P
         ydYgm+JhWUAV1CYZhIlGTLlMLSBdg6LqGaVwDyWgeCi1VSQvMWqaUjO6IaWHyEwAtOWE
         PxZP2hQs1n0RajHq6JjC3NzeNCFWgaK+UsOTwqt5Nt+BtaJYQYkWzQiOrp1CPICAmIIk
         fBSt+wX4I0q8H/d6eXG0nW4d3FQA2IA554oKCRvxD1MPRNRUA6zNAsAR2z+QHfg6OoPO
         2HjhV5PlhmRQPpu9M5vplEvdrlqZfRfRaGwhyQDxG6ZLziS0VBrq0ufK5kWCtdPAEIRm
         X/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790005013; x=1790609813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=posbByi2C22vAqDX2ezu/Vx97adQ0JmvEhOqcNgZPY0=;
        b=sdkhC8pCcmbHaKj+fOxSuQNakshMU60YH4Ipdb800FviGB6wEmVIRLPfy+bMclu2D6
         xGimEusqbqXlTAvRO1FiJqWVCjqfm+o3ZrH+NLRv1Ktm7XF2lgk+dF1+bC1bug9yRaMK
         gGzjtpwxgqa4L7gwkrk3UXDEktBAA7HIYUXXEu/ja6NI/eW0WpQKJ/LV4Rgw1BQm/DRR
         27uDtN5fIP3k/7WXlnivfxGiEnkLGudDsyrQ0+d3wjdM4J2H9PEHp++M9m0GEyRyKAED
         nGKY7Op5mUSIcTqw1DCq9wnkR/lef/k/hazQeGMDA1aRj/I1SaRJNUEtydsAxLwJ7UUw
         Ehyg==
X-Forwarded-Encrypted: i=1; AKwUvBxoni/oaU/sBTE0bD6N1zCARPKUCeevPgI7S+8ZgDIgthdDX85hQIPHrRg+hdfvShTomrNvzip2QsZsfVHb@vger.kernel.org
X-Gm-Message-State: AFuF++nyOgYY87GsgES1It6aGhVa+KoSx3eeBY1F4CLFFMejQDj4OoLC
	m3Pd1OWIE2cw6VmkhCZFOgG5YiNggT/nVzmO4tqiY45gcwlq/10SXRcipPEr7nefU152hWhUqdU
	IiFElUfDvFx8ApdYcnIPSIwXSBv5ZitCYzmcDmq61PDbyltqkWZvJ3WBQXQy3rU2gpTIE
X-Gm-Gg: AYBFou0SDEz8OfHI3dBCjbgFtk5PcUREY2K97jhv7Wm16xkRg1gE687Hq0w/gA1aXU8
	S2exVXgLw5fMfndJSHQOvaOQ75vDWRUXOt2K6tx/L8sqhJU68tms2Qt3imP88n5Z5Z0dRcBGqb6
	Oc9v7v23PcPzLTIaSdOI5Fu+/YrmlbGQ9JMKVOcD1lcKOSgNrETP3glhOqedqUpE1e+mr0Gf0gJ
	epYD1R71TS5rbbLvvR+2uStcQsfJ3B9blE0RVbV8SbFMDprI2FdVM1ayr31sRZsL5y6xcgMrsU7
	AdkfEYVxN5/F1hd/4AhSLO/Rtheb+5IqN5CQozDlUwSoBtBBLMyv1I7SDPnIppimFATUb30PUkh
	u2pkxxNQZ8IrpXHTb4LrpkahCd1hb4iqyGpK+IDr2W88wF1+dzSlZ5FsGF27XAhX/vo+4qlvZ/s
	Ctd4eN2rHSE014HMhe04t1oKFrIYYPS2kVTckvVOjk8GPgdmYRvKo=
X-Received: by 2002:a05:6102:1624:b0:7a2:3feb:9c55 with SMTP id ada2fe7eead31-7a55b74983bmr5853994137.12.1790005012838;
        Mon, 21 Sep 2026 08:36:52 -0700 (PDT)
X-Received: by 2002:a05:6102:1624:b0:7a2:3feb:9c55 with SMTP id ada2fe7eead31-7a55b74983bmr5853945137.12.1790005012400;
        Mon, 21 Sep 2026 08:36:52 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d5b5:76d2:82e3:e5fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd07bba7sm231054065e9.9.2026.09.21.08.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:36:51 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 17:36:28 +0200
Subject: [PATCH v8 8/9] arm64: dts: qcom: shikra: Add OPE node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-camss-isp-ope-v8-8-dd1c86a3c8a0@oss.qualcomm.com>
References: <20260921-camss-isp-ope-v8-0-dd1c86a3c8a0@oss.qualcomm.com>
In-Reply-To: <20260921-camss-isp-ope-v8-0-dd1c86a3c8a0@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 7wzEmCb4sDnDiKr1QyQMQVX8cy3IlK1v
X-Authority-Analysis: v=2.4 cv=IewSymqa c=1 sm=1 tr=0 ts=6ab14f15 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=EzCDy3pf2FPqfMyO2-oA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIyNyBTYWx0ZWRfX8OWjCS6OoXve
 jwwk3Mzfk4zFH8j8gVBW1hH45wL+FPsgt59hif898IDnY3TvfYiv2WoGoFGPdEsTbmEG9vQocvs
 n4XKDggYKHKC8Y3ku5U9V7F3FZ7X4kvACftoqol5ofLtERh1hzUZ1N6ITRv8CA9Rrx/PEyIi4IR
 t/Tdm6onnsTJryN5obTZ0sGk9aIECJJrsnwPL8WmtzqpM3B6WAl6B9EPNVLGTDArKLaff3f2btr
 hJPHaQpA2hzVM01uUCDGqkQM7V3vR1shkHGPKoHco/jpGR6xGcKXEqgmif92bI56oCBM2pcKRnK
 ua0H+CX8NG9Q173GMBugmt5KUlK6Bn1WaxiBnetgsQ6+DQn/dZnlZicqC3cPWPgJ/XUzoIEEmZh
 /9Vg+ZwqVgwcmZc5Zgp9wHUgYC5ibb8mkWGsIP6PKCKgYECFqcSiv5hhijA+oz8rVR8bRvf6PMd
 4AITG1fGu0Rzc19oSyA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIyNyBTYWx0ZWRfX6A3UsuK8WAGj
 QCOU5Vu9tzXIa6b61ZISqIy2n3l7FEIqT6HaPjJ+EKEv82Th64Bw8A/a38d9D27GIAlPez5A/+m
 eCdr8bW4zO7w7bC3RuJ5SQTWGQspQr8=
X-Proofpoint-ORIG-GUID: 7wzEmCb4sDnDiKr1QyQMQVX8cy3IlK1v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210227

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add the Offline Processing Engine (OPE) device tree node for Shikra.
The node describes the six register regions (cdm, top, qos, pipeline,
bus_read, bus_write), clocks, interrupt, interconnects, IOMMU mappings,
and OPP table.

OPE is a memory-to-memory block with no board-level dependencies, so
the node is left enabled for all Shikra boards.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 77 ++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 92d22e3b6931cf49f213d1807f78fc1a261f290d..5adc28e9aa64508366e6c7fdad191a152b8cb6dc 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1828,6 +1828,83 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		isp_ope: isp@5c42000 {
+			compatible = "qcom,shikra-camss-ope", "qcom,qcm2290-camss-ope";
+
+			reg = <0x0 0x5c42000 0x0 0x400>,
+			      <0x0 0x5c42400 0x0 0x200>,
+			      <0x0 0x5c42600 0x0 0x200>,
+			      <0x0 0x5c42800 0x0 0x4400>,
+			      <0x0 0x5c46c00 0x0 0x190>,
+			      <0x0 0x5c46d90 0x0 0xa00>;
+			reg-names = "cdm",
+				    "top",
+				    "qos",
+				    "pipeline",
+				    "bus_read",
+				    "bus_write";
+
+			clocks = <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_OPE_CLK>,
+				 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
+			clock-names = "axi",
+				      "core",
+				      "iface",
+				      "nrt",
+				      "top";
+
+			interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING 0>;
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+			interconnect-names = "config",
+					     "data";
+
+			iommus = <&apps_smmu 0x600 0x0>,
+				 <&apps_smmu 0x620 0x0>,
+				 <&apps_smmu 0x640 0x0>;
+
+			operating-points-v2 = <&ope_opp_table>;
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+					<&rpmpd RPMPD_VDDCX>;
+			power-domain-names = "camss",
+					     "cx";
+
+			ope_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-19200000 {
+					opp-hz = /bits/ 64 <19200000>;
+					required-opps = <&rpmpd_opp_min_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-266600000 {
+					opp-hz = /bits/ 64 <266600000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-465000000 {
+					opp-hz = /bits/ 64 <465000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+
+				opp-580000000 {
+					opp-hz = /bits/ 64 <580000000>;
+					required-opps = <&rpmpd_opp_turbo>;
+					turbo-mode;
+				};
+			};
+		};
+
 		remoteproc_mpss: remoteproc@6080000 {
 			compatible = "qcom,shikra-mpss-pas";
 			reg = <0x0 0x06080000 0x0 0x100>;

-- 
2.34.1

