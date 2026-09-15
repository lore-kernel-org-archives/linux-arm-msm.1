Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5801B468C10
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 08:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459883; cv=none; b=YlpHhAw5GVNQwJcKqQRSj4KXqHAqh/2qa7uKmmcgXv1TepFvNoSClRZtJKtcq7HUrSOn9ZEyyLs/CSh8bL+S6UFs7fOdqBF8QBtA12BKcOGNfOouTAf8uXHuuPwfGig9LLZ1ZabuSp1PsM3wtrtyYHxzrfBleTGEuh8iLyyGE+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459883; c=relaxed/simple;
	bh=7pNTV9aax7vqzihimp3MiGg3DmEEDdR6tA0nGA/y/KA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=guEDaPh4tvLaycvqtHjOHA2kL5WCUj4DzT2WAR1zvAqSgKpgGy88uVd6nNcvgb14cwWwEMKRdScHR1BlHJ0uof/a8cd63MhXFpHE9vNKLLG8c77jHo/RGry3RmvTKx3g8G/TQq8R5d0OxFHBiNdYzBy69Nd3hqQ0WUmxAf3675U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gNZuoGfA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JdF1kwXt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gNZuoGfA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JdF1kwXt"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Zljj2792525
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 08:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oh69pNBvSrb7Yc9lkBxmBF10IePuuREI+No4HIGmEos=; b=gNZuoGfAwGyb5+nt
	MavO8VnWD1eQKafNVraT9Sy61YsAUM0tqNITdYZbFpBw5H7+x+fTMrkZeetVFJSB
	YGwSZEweMMVZY+L7zYd4RJeWAd6JBItzbwc9nnpK5+lnQzYa2HJN18hjOElXbnIy
	hqx1VPev6r4WPzNOHmXD9GDECkuVNzR7SamgYXkZHrI4mM1iXjSJH9UkqcIQyCsm
	loD6mWIhFgcU7S/mPWDFmPd3zW+BPuKb4zXrJk7/hAp6fkzc672VesNSG6EIqODE
	dsLNWcJaJky/xfvpgCZDZROUo5N5mdaj26jqw6TpOkeiG8kju6tpkweQy8TrC0ra
	ZqS5zg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpgvtmabe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 08:11:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-912348a0ffbso7897706d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 01:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789459879; x=1790064679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oh69pNBvSrb7Yc9lkBxmBF10IePuuREI+No4HIGmEos=;
        b=JdF1kwXtCZGAlnthNbLAsenwpeER5PoZtxqnZ3kQUF65h1+OqCq63/4F1MuCBFJTh3
         VxC3byWHpLhT0MDDit/B0z8p8SDwxywQb9sBnzdm6TojKOlp27BGcx1zhTYnoSUYYQVr
         /Y24t9IrmOK5ME5znDwRhxrR6SXv1jyfRa2NnvzBZIutZEkldtcUdQj7NgBjR2TeHxWy
         wFTm826mqJWtPC13W0Ud+KMsQdo1N4XFBDfR1q7o9m0yS6oTf53/ESm7EiZCU1iafPaj
         sxTkwXd/8I7Ky58RF+IkYPO1cJoQfsSQarYeI1TuTiOKo/5kA25nUjqqGnJxMIq4QyeT
         qTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459879; x=1790064679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oh69pNBvSrb7Yc9lkBxmBF10IePuuREI+No4HIGmEos=;
        b=xTbTFItgzvZdVCuC4aLfi7Ojf9d1eyXhGctGm6u67R39O8vvTRHFLbPTVcwTumBphr
         yjTkSNNyOpSMVv08opu3d8WZRGq+4Ctp50yOC6gKpU9Fly8UByR91va4zOTv1eghPIwA
         ZtNxxhEEraTdVSobRLCcj6NizAKZQLed4ed/3oO9+a75TtfYxS9DnosqsYOdjB5xK+hi
         X3KiG/bjoZ8jCxXd4pTcZrKmyXBIGJIvhQ7Dx4lZUOPpeGu+FE5qhfziJ8OgaeJ+LANy
         Pj1r5+ldop6K/KN13SRRz9d+f4WR/LNoVr9E+kKvG3cQG0vAhYfgdO3b+QsotRI3ycor
         uGOg==
X-Forwarded-Encrypted: i=1; AKwUvBw7TCsQ4xDrnDqS6J1j5n0Kyt9BcH+QQs61uUFem6hvX9D4iuOMnUNkSBCBQkTBPAq45ZeBl234d03yJYgK@vger.kernel.org
X-Gm-Message-State: AFuF++kMFSog/oY2C2gkVFQI7132XzZSzfFvkT10NkfTTcXt95gzYZmO
	ngc5pRR3UBPPSFBDtUgJeGHPXWmTINNEmtQLdRRPXPVyQaG+fPv0du9T9xCq7v4PCHCzVDUlFc4
	/GPXwuU77x1IN5dvuhEdgWUxPN9gptezM6U4IFO/rCoUQSQ5Wx4P510SERgLdu7bnoDpP
X-Gm-Gg: AYBFou2SOXDnAawCB9O9Mg6Sw23zh6xwCWp3pc8TZuEsZCHbc3lbw2E2l6cKuyamJ12
	wcGZDZnBmZz1QY5Hcvs+wo5bBKNKnG9AvcicLiG/gzoe/cNzMxReIUT/hrEjFeTL4WJ0w1hhJbQ
	pfxlMkk0+3wsYlpP3diEwpf3qMFHZvMe7kSqxIpaRvEOI+45cJBzGrstXTEE70DBDG0dfC980mK
	5LtW1dCRwb6Sv65jQ7XqbvBLdH6OCkv92APjDy/iNf+0oEpmwKIs7r1dLC1lDjt7UoC1fkz88lU
	Uo2mTGtykRR4LngpBoroXalA30OWDbZmQm95Z6BR4sf5oMGMljiL0QyICaNTXOCHrqJqWcINiNO
	zr0Ohhn+H7xqkUSDtrJegYaUhl5cc3DRUTM2geuw8N3Ee4nltFQ/MmTTOGd5IHAN7MTlKn8IR6s
	e6kF1WDgV4WhWdyM4nyCc7sU3ZWg+BgcfiqGnz12YTk+mwJD0e440=
X-Received: by 2002:a05:620a:1a06:b0:937:2d64:57ae with SMTP id af79cd13be357-93a294bbcaamr917634885a.0.1789459879313;
        Tue, 15 Sep 2026 01:11:19 -0700 (PDT)
X-Received: by 2002:a05:620a:1a06:b0:937:2d64:57ae with SMTP id af79cd13be357-93a294bbcaamr917629785a.0.1789459878622;
        Tue, 15 Sep 2026 01:11:18 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:7034:b557:872c:5602])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d292d3csm48847885e9.4.2026.09.15.01.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:11:18 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:11:11 +0200
Subject: [PATCH v7 8/9] arm64: dts: qcom: shikra: Add OPE node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-camss-isp-ope-v7-8-77b13d131d3d@oss.qualcomm.com>
References: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
In-Reply-To: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=c/0+0h9l c=1 sm=1 tr=0 ts=6aa8fda8 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=EzCDy3pf2FPqfMyO2-oA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfXxwIcxnR/z/2e
 FHaxJPYbnZ93GSm3itnpJ+tTxM3915GDgy0vkd2YNSm0SUVrM847BIAxNQbWd4IyElMmfoXwbKI
 Per2l70BZmvnTuuZuvYWcbeQ5amm2K1LbfjjR6F0fG2Tn+feHIMPXMiOhsZ68fpc+DXytuzllEW
 Nbzxu3hEEK1ayp9vZq2MlWZPaeNVscxdkXYN8LZdmfW+9BYoOfpPJamxMdhYdMGBoGV/ec3qAr8
 mUeaqJ9sez6FYuOJk9k01y7uI+gbtB99Qs88tj8zbfue2cfxS+eHDfgwTWXVRT5VXh57S1c7X17
 AjRNuFrTSrBXR2lYywvO0ecoQaupPyeZswzsGanQ7ifv8pO+rNrkDgM/RTTnnRjOcwtaO4LUyos
 h7kJO1PcisKDudQ+hkdDxJ19mNp61kzmvR0FCcij56YXwTXq84D91xkOwVW4aQckPI4Iyiyuj+8
 /1gulawMHFUal+4k7kQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX+UK1aQr1bppw
 s4MQSBf+GluVN8L1hv0hzmQgXYAnzhOSNDEsQzYA2T8LlEBpbbIF7Qgme8BYOmnuFVU6MIu1BWB
 hP3vhxouTxI0AktfDrO+3C61LdJvPEQ=
X-Proofpoint-ORIG-GUID: 0X4UYIpU_yYjbWoXrr42r402RElUYXgL
X-Proofpoint-GUID: 0X4UYIpU_yYjbWoXrr42r402RElUYXgL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150116

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add the Offline Processing Engine (OPE) device tree node for Shikra.
The node describes the six register regions (cdm, top, qos, pipeline,
bus_read, bus_write), clocks, interrupt, interconnects, IOMMU mappings,
and OPP table.

OPE is a memory-to-memory block with no board-level dependencies, so
the node is left enabled for all Shikra boards.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
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

