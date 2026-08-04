Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E278B352030
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 12:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785846086; cv=none; b=jR7W7HGHZCwwrobjkusEoZvixDrFfqhW3WZy4zysHDq9Qa+M/3+6Y3diDXTVgJh/NlOBMrpTIbrIRotd/yn5AaSRaZ9JqBFlpFZJmg6wSVLt4ZvZlBooxBtfwwVARgidF/GEVjPlae2hFvHFYSRf9GQ0/HrFtg+Q88LU9Tf06AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785846086; c=relaxed/simple;
	bh=zLCG41qkPrvXrhrZHWUQu9gA4ncqsgjw6424GKDt7dE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FHtME71ZtogQUcBb+99K5u+TqSnAq++M6gYXfr2ccqvM6UjhxkDGa/xkVY4HJWH1blB4vSzI7KvOqqx9O4t6yqVcQB0+75v1dbSxzFXvuUumULUOyvg+FYOAqUJBjel1EbiVNr7m4nw59pegy212YQFvnkrF1IbSDFVefxxeD+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OKZSPj4p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KCXadowV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OKZSPj4p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KCXadowV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748C1Im3016238
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 12:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KdKj898WkIL
	sZS9tdgYY/c/+Yvj59qA1oLwiS7hsA0s=; b=OKZSPj4pQ3y/QUHtdNNP04qQD+b
	yvl8lhDfV7yzGElWD9L34p1Qnzgm7P9zBVzM8lWbnHKsCdTrJmEFA3kAB8zc2dPj
	lA9ptYfM6RDXot8wn7wspYFH/xxcs4KBZajlehF6sE+GzeUyg/kzdm7D8uw+9GS4
	2HI6DG+Zop5SGDUNtHFuXFEDiAexpCUzdPaNgqq7J83sj+1NC0vzrq182bmHu5WV
	mRqSRUz+t9KooEJJh7pEz/7Zt4JSKZM/B+m1VSzP1yRU2bQaxyHWIvICFVhuUynl
	p/AduFXST7onIC9RXrTnCkaNRJPXMYw/4HTJSSzY0iKYqwV5Ji1eOMbnEpA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu7272a3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 12:21:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-388cfc4848dso6146119a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 05:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785846082; x=1786450882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KdKj898WkILsZS9tdgYY/c/+Yvj59qA1oLwiS7hsA0s=;
        b=KCXadowVwlwKLYP5BTAWC7AOamsVbEty9ruXPwkH9lMhOh4eM6JQKA/JDzCBtHg6Ci
         7iIXpIm5yilwPvbkan3h34tq0FIFtDqL1PfYFaZjF9XCm8P2NY9EizWkpcesMHWdy6SA
         iViZJRjDhtnryALkacgopdcoA6DvF/a0I7hGOi7Wm977UCiYrP6cFlKcnySgIS6fE/ot
         3p6Luj3ibGiV48RsGMAfyWoQ7aNSyDuJYHgfUtEHzQxONovZXKwszYdPBxv+htEsTays
         xz/0Vi0NzFXf3qNUmyQy9BlulMCG9qwdACQDLXsUZTxkIR9ElWlyZWNtKbowR6XhMoxY
         Ve8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785846082; x=1786450882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KdKj898WkILsZS9tdgYY/c/+Yvj59qA1oLwiS7hsA0s=;
        b=XeIR+/MQd8BPhivTnSZ5VO//FvZDGgfBOkg1UT9UdkxNO5yqXSWU5ThaejB1E8nw/b
         aUsDlErY+nazcr9LD+fppriXeUPwaY+fzymLr3slnknWFISxkijD9OFkGCqb8l5/fMYG
         /SSxEF6clt3U4gZNy+ClZQsfcS0kXGfyoJJAzayLSYw5BpF5dErGgb8NLuxbPjEfuqYt
         gsW9iwyyvTR9tAXxG/itsrs3/Xg5DVCJ0Lof6/54wlIpTfQR5UvTQTNv2EoxtSYMvrkm
         7zWRopNSbvBAIWCfSNk6Pc1iQyGqbORpil8MET0maVMikV1tiZyp6j3tPqw0CrsfBL3u
         3tbw==
X-Gm-Message-State: AOJu0YzAQhhLcRVfOptBCUg6MEfBlW57GfYWOLSYlSfUjy+7f2Vty6MN
	T+wq4tYWs1rlnrLJVuMFO5OCDcgx9jOZUXP0WViWQiWKxinU9BYnAkysEdYB0rOnLjr9xUKw/mq
	tdEjWrxfo5o852CKLyThR5Y/fvp4FcprrN5rDuRQLSfpjWiinDlhO+uo/0Ze7Mhwu3LhZ
X-Gm-Gg: AR+sD13QK5uLBLPkAOsJr2JasRxomRhBAnfJds6+n/RknATBEJYaHc0OqQdrsnp2aIX
	3JQI5B7ewv2CzVhgfl6U/mf3E0xA8Uf2KOpK6c2cbqnpWgs36JdJw3jTsLLN92NO+rQKZ3zy/GD
	iMFgHX/fl80bY9M3ZPG1OMlAKfhKNTJ2QsUMNF1rPBJenbhfW3qZ2TezBJ9CuS/sIH1CUejs0x6
	p8WG5cHwwiwXvkp4LZsNHfj1qAuPY3EgJSV7hpednXs5//p0RlmWZxXHMF2l7QiW4z2mrM+R+4Y
	yPZqayWVndxw7nLJQM1TTmrxOvWABeGm24ErF5K4UUh5VxeE1VguciCQ2Gn9c/1TAeZAvVCokGS
	XIFAuDtk49f36daD4P7jU7wmMXPzS8BRA+f4=
X-Received: by 2002:a17:90a:d004:b0:380:873:49cb with SMTP id 98e67ed59e1d1-38fbc4d615emr13286651a91.21.1785846081784;
        Tue, 04 Aug 2026 05:21:21 -0700 (PDT)
X-Received: by 2002:a17:90a:d004:b0:380:873:49cb with SMTP id 98e67ed59e1d1-38fbc4d615emr13286167a91.21.1785846071748;
        Tue, 04 Aug 2026 05:21:11 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fedc650a0sm1237832a91.14.2026.08.04.05.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:21:11 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V4 1/2] arm64: dts: qcom: Add SD Card support for Shikra SoC
Date: Tue,  4 Aug 2026 17:50:53 +0530
Message-Id: <20260804122054.3462145-2-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260804122054.3462145-1-monish.chunara@oss.qualcomm.com>
References: <20260804122054.3462145-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA5OCBTYWx0ZWRfXyYE7udiM1ei/
 BC67oJJ1Fym40OnQuf6fNS/g7M9Ocn+GQJanoyb7uVhU7E4CFLOxcfU/ogyQNTvz8RW9PFA/pSR
 5lxF1k9K4xJ5M++j+jHH3wBkoFKMzWc=
X-Authority-Analysis: v=2.4 cv=Z6Lc2nRA c=1 sm=1 tr=0 ts=6a71d942 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=8A8miFJkZQRJ8vCztksA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: e5l4Etn77RhqyKSl8olrH3Zfvvv4j9aX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA5OCBTYWx0ZWRfX2j9Vc1y8V1T+
 FSToScSOX9QNxJQHOg+XNwTM6PulZaaq2iJZv5lZDNMcpeS8uY24QoM+jDTlD+UmlGgf3jNTvRV
 I4ojqcUnZCrWX6dvgyKA5bVG6GDQa0K1ac2YYcXWPTIwPoPaHjRiwIG9diobcy9/VBB1Dho5aPi
 3IH1df6LL4DsFeVhcE8NCb0MKn/qaGJTxUvR6ngUUr6Sj9aF3fBHnkzQNjmDGzDI7GZaKRDFSGI
 h2zguKv75qvXkqyCPj6AxbK8V9hXngzRBVlWHuECH1uxFSzC0djDB84XcK8TlIMbKFWSUsilNp4
 NNP8GYuf+qWxpmw00GXOtL2yFpxBv9A31JRNbj7kYGRCojmRwhuwbEhm0GT/2ViHoqiAdsiDuV5
 Xaedqvft5AhPvyxKtC2Bm1cCVy5Sa9DaEvp/So/byFCGvb3fmwdpX/L+POt728ZFx92dp9sDk4E
 OQl/hmjhvnfVt/YjYyg==
X-Proofpoint-ORIG-GUID: e5l4Etn77RhqyKSl8olrH3Zfvvv4j9aX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040098

Add support for SD card on Shikra SoC and enable the required pinctrl
configurations.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 97 ++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 80e8045282d8..1c56b43887e4 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -404,6 +404,53 @@ rclk-pins {
 					bias-bus-hold;
 				};
 			};
+
+			sdc2_default: sdc2-default-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					drive-strength = <14>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					drive-strength = <14>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					drive-strength = <14>;
+					bias-pull-up;
+				};
+			};
+
+			sdc2_sleep: sdc2-sleep-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			sdc2_card_det_n: sd-card-det-n-state {
+				pins = "gpio89";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
 		};
 
 		mem_noc: interconnect@d00000 {
@@ -604,6 +651,56 @@ opp-384000000 {
 			};
 		};
 
+		sdhc_2: mmc@4784000 {
+			compatible = "qcom,shikra-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0x0 0x04784000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq",
+					  "pwr_irq";
+
+			bus-width = <4>;
+
+			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
+				 <&gcc GCC_SDCC2_APPS_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "iface",
+				      "core",
+				      "xo";
+
+			qcom,dll-config = <0x0007442c>;
+			qcom,ddr-config = <0x80040868>;
+
+			iommus = <&apps_smmu 0x0a0 0x0>;
+
+			interconnects = <&system_noc MASTER_SDCC_2 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_SDCC_2 RPM_ACTIVE_TAG>;
+			interconnect-names = "sdhc-ddr",
+					     "cpu-sdhc";
+
+			power-domains = <&rpmpd RPMPD_VDDCX>;
+			operating-points-v2 = <&sdhc2_opp_table>;
+
+			status = "disabled";
+
+			sdhc2_opp_table: opp-table-2 {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmpd_opp_low_svs>;
+				};
+
+				opp-202000000 {
+					opp-hz = /bits/ 64 <202000000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+			};
+		};
+
 		qupv3_0: geniqup@4ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x04ac0000 0x0 0x2000>;
-- 
2.34.1

