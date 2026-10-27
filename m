Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101820;
	b=OU960RixdQZzAjcAgpA36R3Nf5lCP+Vadm2qlH2Vz4Cx6DH1bIRQ+QZ1nQmWjZL2zS0Y
	 FQjKa+1M6/CUpsxrq1//7VBJ1yegeqvIwV17CeaovO0CZxh33dphQiweXbyEqEYvYyEeq
	 mjee+oAELKSgmLOc2AJDzve2CM2R0w0/2Uhc9E5U/G2vdV2fhZO1XYMbKj4lXlzpTUQiy
	 3RGWfp5JRbMAbpPpCs2FzrSSCZQP7BFJ1XcRF9XMGvnh0GCfpdTTsoaRSm9hlhQg6YS6H
	 bll0N7zOmA4+89vAIeeMje6Z/RvKpGEA649vT9EObD51Lp8FapSthwz71m254u1reUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101820;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NsQBKEzQfnNWopziL09iuqk2cDryGGdJPtk/EU3SsSU=;
	b=z1qH3kMUEgb4rYbXNe738pHqkRc0tIhSIrzNpQOWUhyNGy+G30wNoF0BRMy93wXxEKe2
	 jVgOsdzz45ZJ4qfVNhI3V5ybpR61vTwQ0CgjM7sfIqet/eRItCLr/3hgVuMVpTGskgTWt
	 OwQ7pmQ7O82hU/lTeXKghtCzM13QvxsLXUCC83i2DV/uzFf8tpIkMi6hA1zKhjPPhEHGY
	 p6aeEIAr7EJwqQjiq9oHpmpKXK6upiqm5Fqf7z6dvhFp+oL++MlkYzs6QAATz4Xix+g84
	 PsUyhlNDNzDfzZMegv12xbF/hpfRluHT1Uwpc7uIrFuyY3r2Qspz2hSwunFCL12RV2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IgUl4X0W;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RVrkiWyv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF409606A33E
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF409606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IgUl4X0W;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RVrkiWyv
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdvBJ1614507
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NsQBKEzQfnN
	WopziL09iuqk2cDryGGdJPtk/EU3SsSU=; b=IgUl4X0W9svvbgINhlux/cvxvqI
	G8TRyokGLN/Uy2ObsPZtdf+MUp0QwMlqWdzU7GKuPSG9nkQonoWqt+wSqTSS+6yx
	B1Pw9jjXxYzlsCRDnvnGv5JAM+mWOHr8DY6P3tKyUGCa3y/jkf4wQP9wUqiVo0dK
	lLB07vr7FfKOSlh7QZzsMhYqnjjpML+gPf6nJQvBVPlltGmZOax5ojej/ZUisGQt
	ofnGKmRYi3dsCIpWEd09p4Z03rh8TQX5h9r+xWtH4dfOJCShNsYBKTQ+eYaS0EhB
	76/65mDkpZowtsaIL2137Bp0XYowfzv7rnkT6uE5EHAWftRdgUOLfZz7eJA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5s0q8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:50:18 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-359b81ad4e8so5873104eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793101818; x=1793706618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NsQBKEzQfnNWopziL09iuqk2cDryGGdJPtk/EU3SsSU=;
        b=RVrkiWyvyFRvXo6J0DwIuPmWqplhDiuh32PiW1FX6Vlhw5hh1xSjTYlVM7rihvvW5B
         feqTiWvu54Rwi9sgtVRLMLR0YCjfgND3stGYQ7xtPjU7n3CkBrZWDoN8lt2RsxCLsYfD
         +hF49vOi8DtxhSr4JmB9pNzwYNHsgksdaeskJ1T5u0Y3rhlF/D8DxDYqWoykCFSYl9Cs
         q3O/yeEuldQBssTV2jJSv5447GQ+ojz4c+m9f13wDRegxG9HoRzrJOIlll9vYpc+appT
         JmZkCzBPMvXwRRbOoJStPyOCCM13NeoRNtANL3+7LTCzD6lMwrHCTf2Dnl5+iv4s34ie
         p5Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101818; x=1793706618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NsQBKEzQfnNWopziL09iuqk2cDryGGdJPtk/EU3SsSU=;
        b=P9L6f4F5O/Pn2OLOrQ475N1ilcxpul7dE2RxdnA3Mwd9s7z2tKA6+BY7t7htIjNCOz
         ARApkcfvMpP1aMPI0FEtTZ+wZIKzS77iVmwMJD+OL20cT2cPvLjMvzNJdQnNR5SVcaw0
         2R8KJbDlcQ2WT9oW7qxvui/nARiqHS5O3MENM8+tbuSXx0973jJh/eCXHH9GsSPET48s
         X0dvxkUYAVqM+Q424Efug5XUjPLw0ApNs/TjI71NRj7tJ/aIBFK6siRdPU0hd480yjQw
         7MAdkAU0fEuqeqmf/jYd5wwyTp8POUeNIB8zqf3uGF1rzrhCRItYGZd02o9HuyHEH9h4
         1g+g==
X-Gm-Message-State: AFq9FYJLcDjI44JPabQzNVX6Xl8vLcXZru0i8Qe8Sk8OgSV/JP0KW7vl
	K4hcIeFsadtDz51SNuAI/mo39B/+O4DZxnQHTQqzYg1EC7+1wmfZmBFWij/hgp+HsOgmweZqSVf
	2Fh9bzQUntFxWJCMSia1mM+yNg/48DMtDOZfJgRZEziDTk1ggZrcOCNJzkFIqRPU6rNrY68XoCh
	E2
X-Gm-Gg: AYBFou2eM2CUgmmi8R7/ubwpo1YC2mev7jlMQXxmhafoTkMf1zhsQaxNJmiD8BpmL0G
	nJrSKhOnES6CmIQzbVSHyYOwmguuS+kBq+PEkKbwxQomKr1JT9WToyaZC7rRtNppOIkx8KUoDfQ
	45obg0Zxx+QVBTTYWFDuJsTLaewXoFpozo2ioP0D/fn5XT8+zevG17xxzd8nYVHh5LmJTlDhigB
	xDz6hf/X6rktA76eIo4qo+L6jsnAv3qRjgpI5CVsPW6ft5vTGBjulOW/SxWxSpMYau00w2oycnQ
	7uHRIitLZ/BBWwfTJsliprCU9uYXU4Z391fC6qpha9tmjSZdgfQ2EjjpsQUfqcasKL/XjZRXpxI
	0TwwBMobO90owwn9Z4zY/eAun2FxAjJkYdKVekmIFpYRrLhyDqLIDyX1qyy7EbjSmMOWrupJWSk
	ilK79Ip1JCWcdhgzKE2HdE6A==
X-Received: by 2002:a05:7301:2730:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-369e845b09fmr14599513eec.10.1793101817149;
        Tue, 27 Oct 2026 04:50:17 -0700 (PDT)
X-Received: by 2002:a05:7301:2730:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-369e845b09fmr14599465eec.10.1793101816256;
        Tue, 27 Oct 2026 04:50:16 -0700 (PDT)
Received: from hu-sivagupt-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm61918825eec.23.2026.10.27.04.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:50:15 -0700 (PDT)
From: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Subject: [PATCH 3/4] arm64: dts: qcom: Commonize glymur-qcb.dts to glymur-qcb.dtsi
Date: Tue, 27 Oct 2026 17:19:54 +0530
Message-ID: <20261027114955.1266499-4-sivansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
References: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX0NhVOYk+UXfY
 6GoW/i9iHhShAaWr4ArAf/xPVWgnBnsXmRBCFKayaAV96bhtBcthEXIZAmWoORtwgAh5iBOTsne
 I8pFNeuQsaoHR5eeC9NHsTDtuTxbAAk=
X-Proofpoint-ORIG-GUID: Y2Z08KJfRqGIgslilhWVikwWbC1X9S1e
X-Proofpoint-GUID: Y2Z08KJfRqGIgslilhWVikwWbC1X9S1e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfXy277JODpKhmx
 aajzy0T+HF4FUWisZvtFhJ2jsJs73hDsBdkXrgFKskxpH4RClwLhxEHwhYaXbpMOaXEOc8nkfzX
 53IY7YVgRSl5LYaRitnYkE8RDUziJ4MnYUU1Ks/y4Htb1lMMzgAqZ6lxL7cvNvJ0C6L7h1oaSXS
 8fcHXR5mQ4gsqW3ns38TXKVohhBzyth9XdSEkmvZPgz0vS0sCJjAsLqfbd9zoCv81jC726ZJXbW
 nsxHH65dMxEV1aXzIjeGs5+BzwA+WC8Lbde2GGQgnKLUselxMvQQJmb50q3K/da1kzTtA7NRkao
 7qa3gG5NLMVVWmaUrV5knyn3sTemDS+EmNGPvVRrdpTw7CXN38v/Tcr3Ndmw7SjhJsFuJprYLmW
 CiY5LXiA1VlxL/p04ZxZ7JX7hGmSabLWEQrwyNVWHHtZNYbC2X2d8bpmyHn8HHtYQp5k7OBqVpe
 24G/ND2EaejF+ZuirYw==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae08ffa cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=nCfjrMGL1hgxCQ821bEA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270047

Glymur QCB and Mahua QCB both share common nodes as they use the same
underlying board.
Move all common nodes to glymur-qcb.dtsi file to allow for reuse.

Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-qcb.dts       | 667 +-----------------
 .../qcom/{glymur-qcb.dts => glymur-qcb.dtsi}  |  28 -
 2 files changed, 1 insertion(+), 694 deletions(-)
 copy arch/arm64/boot/dts/qcom/{glymur-qcb.dts => glymur-qcb.dtsi} (94%)

diff --git a/arch/arm64/boot/dts/qcom/glymur-qcb.dts b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
index 17d8ff3aed23..f0ed47adfc2f 100644
--- a/arch/arm64/boot/dts/qcom/glymur-qcb.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
@@ -6,557 +6,11 @@
 /dts-v1/;
 
 #include "glymur.dtsi"
-
-#include "pmcx0102.dtsi"        /* SPMI0: SID-2/3 SPMI1: SID-2/3 */
-#include "pmh0101.dtsi"         /* SPMI0: SID-1                  */
-#include "pmh0110-glymur.dtsi"  /* SPMI0: SID-5/7 SPMI1: SID-5   */
-#include "pmh0104-glymur.dtsi"  /* SPMI0: SID-8/9 SPMI1: SID-11  */
-#include "pmk8850.dtsi"         /* SPMI0: SID-0                  */
-#include "smb2370.dtsi"         /* SPMI2: SID-9/10/11            */
+#include "glymur-qcb.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. Glymur QCB";
 	compatible = "qcom,glymur-qcb", "qcom,glymur";
-
-	aliases {
-		serial0 = &uart21;
-		serial1 = &uart14;
-		i2c0 = &i2c0;
-		i2c1 = &i2c4;
-		i2c2 = &i2c5;
-		i2c3 = &i2c9;
-		spi0 = &spi18;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
-	clocks {
-		xo_board: xo-board {
-			compatible = "fixed-clock";
-			clock-frequency = <38400000>;
-			#clock-cells = <0>;
-		};
-
-		sleep_clk: sleep-clk {
-			compatible = "fixed-clock";
-			clock-frequency = <32000>;
-			#clock-cells = <0>;
-		};
-	};
-
-	gpio-keys {
-		compatible = "gpio-keys";
-
-		pinctrl-0 = <&key_vol_up_default>;
-		pinctrl-names = "default";
-
-		key-volume-up {
-			label = "Volume Up";
-			linux,code = <KEY_VOLUMEUP>;
-			gpios = <&pmh0101_gpios 6 GPIO_ACTIVE_LOW>;
-			debounce-interval = <15>;
-			linux,can-disable;
-			wakeup-source;
-		};
-	};
-
-	vreg_nvme: regulator-nvme {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_NVME_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&pmh0101_gpios 14 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&nvme_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_wcn_0p95: regulator-wcn-0p95 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_WCN_0P95";
-		regulator-min-microvolt = <950000>;
-		regulator-max-microvolt = <950000>;
-
-		vin-supply = <&vreg_wcn_3p3>;
-	};
-
-	vreg_wcn_3p3: regulator-wcn-3p3 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_WCN_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&tlmm 94 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&wcn_sw_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_wwan: regulator-wwan {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_WWAN_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&tlmm 246 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&wwan_reg_en>;
-		pinctrl-names = "default";
-	};
-
-	wcn7850-pmu {
-		compatible = "qcom,wcn7850-pmu";
-
-		vdd-supply = <&vreg_wcn_0p95>;
-		vddio-supply = <&vreg_l15b_e0_1p8>;
-		vddaon-supply = <&vreg_l15b_e0_1p8>;
-		vdddig-supply = <&vreg_l15b_e0_1p8>;
-		vddrfa1p2-supply = <&vreg_l15b_e0_1p8>;
-		vddrfa1p8-supply = <&vreg_l15b_e0_1p8>;
-
-		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
-		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
-
-		pinctrl-0 = <&wcn_wlan_bt_en>;
-		pinctrl-names = "default";
-
-		regulators {
-			vreg_pmu_rfa_cmn: ldo0 {
-				regulator-name = "vreg_pmu_rfa_cmn";
-			};
-
-			vreg_pmu_aon_0p59: ldo1 {
-				regulator-name = "vreg_pmu_aon_0p59";
-			};
-
-			vreg_pmu_wlcx_0p8: ldo2 {
-				regulator-name = "vreg_pmu_wlcx_0p8";
-			};
-
-			vreg_pmu_wlmx_0p85: ldo3 {
-				regulator-name = "vreg_pmu_wlmx_0p85";
-			};
-
-			vreg_pmu_btcmx_0p85: ldo4 {
-				regulator-name = "vreg_pmu_btcmx_0p85";
-			};
-
-			vreg_pmu_rfa_0p8: ldo5 {
-				regulator-name = "vreg_pmu_rfa_0p8";
-			};
-
-			vreg_pmu_rfa_1p2: ldo6 {
-				regulator-name = "vreg_pmu_rfa_1p2";
-			};
-
-			vreg_pmu_rfa_1p8: ldo7 {
-				regulator-name = "vreg_pmu_rfa_1p8";
-			};
-
-			vreg_pmu_pcie_0p9: ldo8 {
-				regulator-name = "vreg_pmu_pcie_0p9";
-			};
-
-			vreg_pmu_pcie_1p8: ldo9 {
-				regulator-name = "vreg_pmu_pcie_1p8";
-			};
-		};
-	};
-};
-
-&apps_rsc {
-	regulators-0 {
-		compatible = "qcom,pmh0101-rpmh-regulators";
-		qcom,pmic-id = "B_E0";
-
-		vreg_bob1_e0: bob1 {
-			regulator-name = "vreg_bob1_e0";
-			regulator-min-microvolt = <2200000>;
-			regulator-max-microvolt = <4224000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
-		};
-
-		vreg_bob2_e0: bob2 {
-			regulator-name = "vreg_bob2_e0";
-			regulator-min-microvolt = <2540000>;
-			regulator-max-microvolt = <3600000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
-		};
-
-		vreg_l1b_e0_1p8: ldo1 {
-			regulator-name = "vreg_l1b_e0_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2b_e0_2p9: ldo2 {
-			regulator-name = "vreg_l2b_e0_2p9";
-			regulator-min-microvolt = <2904000>;
-			regulator-max-microvolt = <2904000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l7b_e0_2p79: ldo7 {
-			regulator-name = "vreg_l7b_e0_2p79";
-			regulator-min-microvolt = <2790000>;
-			regulator-max-microvolt = <2792000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l8b_e0_1p50: ldo8 {
-			regulator-name = "vreg_l8b_e0_1p50";
-			regulator-min-microvolt = <1504000>;
-			regulator-max-microvolt = <1504000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l9b_e0_2p7: ldo9 {
-			regulator-name = "vreg_l9b_e0_2p7";
-			regulator-min-microvolt = <2704000>;
-			regulator-max-microvolt = <2704000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l10b_e0_1p8: ldo10 {
-			regulator-name = "vreg_l10b_e0_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l11b_e0_1p2: ldo11 {
-			regulator-name = "vreg_l11b_e0_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l12b_e0_1p14: ldo12 {
-			regulator-name = "vreg_l12b_e0_1p14";
-			regulator-min-microvolt = <1144000>;
-			regulator-max-microvolt = <1144000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l15b_e0_1p8: ldo15 {
-			regulator-name = "vreg_l15b_e0_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l17b_e0_2p4: ldo17 {
-			regulator-name = "vreg_l17b_e0_2p4";
-			regulator-min-microvolt = <2400000>;
-			regulator-max-microvolt = <2700000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l18b_e0_1p2: ldo18 {
-			regulator-name = "vreg_l18b_e0_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-1 {
-		compatible = "qcom,pmcx0102-rpmh-regulators";
-		qcom,pmic-id = "C_E1";
-
-		vreg_l1c_e1_0p82: ldo1 {
-			regulator-name = "vreg_l1c_e1_0p82";
-			regulator-min-microvolt = <832000>;
-			regulator-max-microvolt = <832000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2c_e1_1p14: ldo2 {
-			regulator-name = "vreg_l2c_e1_1p14";
-			regulator-min-microvolt = <1144000>;
-			regulator-max-microvolt = <1144000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3c_e1_0p89: ldo3 {
-			regulator-name = "vreg_l3c_e1_0p89";
-			regulator-min-microvolt = <890000>;
-			regulator-max-microvolt = <980000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4c_e1_0p72: ldo4 {
-			regulator-name = "vreg_l4c_e1_0p72";
-			regulator-min-microvolt = <720000>;
-			regulator-max-microvolt = <720000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-2 {
-		compatible = "qcom,pmh0110-rpmh-regulators";
-		qcom,pmic-id = "F_E0";
-
-		vreg_s7f_e0_1p32: smps7 {
-			regulator-name = "vreg_s7f_e0_1p32";
-			regulator-min-microvolt = <1320000>;
-			regulator-max-microvolt = <1352000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_s8f_e0_0p95: smps8 {
-			regulator-name = "vreg_s8f_e0_0p95";
-			regulator-min-microvolt = <952000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_s9f_e0_1p9: smps9 {
-			regulator-name = "vreg_s9f_e0_1p9";
-			regulator-min-microvolt = <1900000>;
-			regulator-max-microvolt = <2000000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2f_e0_0p82: ldo2 {
-			regulator-name = "vreg_l2f_e0_0p82";
-			regulator-min-microvolt = <832000>;
-			regulator-max-microvolt = <832000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3f_e0_0p72: ldo3 {
-			regulator-name = "vreg_l3f_e0_0p72";
-			regulator-min-microvolt = <720000>;
-			regulator-max-microvolt = <720000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4f_e0_1p08: ldo4 {
-			regulator-name = "vreg_l4f_e0_1p08";
-			regulator-min-microvolt = <1080000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-3 {
-		compatible = "qcom,pmh0110-rpmh-regulators";
-		qcom,pmic-id = "F_E1";
-
-		vreg_s7f_e1_0p3: smps7 {
-			regulator-name = "vreg_s7f_e1_0p3";
-			regulator-min-microvolt = <300000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l1f_e1_0p82: ldo1 {
-			regulator-name = "vreg_l1f_e1_0p82";
-			regulator-min-microvolt = <832000>;
-			regulator-max-microvolt = <832000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2f_e1_0p83: ldo2 {
-			regulator-name = "vreg_l2f_e1_0p83";
-			regulator-min-microvolt = <832000>;
-			regulator-max-microvolt = <832000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4f_e1_1p08: ldo4 {
-			regulator-name = "vreg_l4f_e1_1p08";
-			regulator-min-microvolt = <1080000>;
-			regulator-max-microvolt = <1320000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-4 {
-		compatible = "qcom,pmh0110-rpmh-regulators";
-		qcom,pmic-id = "H_E0";
-
-		vreg_l1h_e0_0p89: ldo1 {
-			regulator-name = "vreg_l1h_e0_0p89";
-			regulator-min-microvolt = <832000>;
-			regulator-max-microvolt = <832000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2h_e0_0p72: ldo2 {
-			regulator-name = "vreg_l2h_e0_0p72";
-			regulator-min-microvolt = <832000>;
-			regulator-max-microvolt = <832000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3h_e0_0p32: ldo3 {
-			regulator-name = "vreg_l3h_e0_0p32";
-			regulator-min-microvolt = <320000>;
-			regulator-max-microvolt = <2000000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4h_e0_1p2: ldo4 {
-			regulator-name = "vreg_l4h_e0_1p2";
-			regulator-min-microvolt = <1080000>;
-			regulator-max-microvolt = <1320000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-};
-
-&i2c9 {
-	clock-frequency = <400000>;
-
-	status = "okay";
-
-	embedded-controller@76 {
-		compatible = "qcom,glymur-qcb-ec", "qcom,hamoa-crd-ec";
-		reg = <0x76>;
-
-		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
-
-		pinctrl-0 = <&ec_int_n_default>;
-		pinctrl-names = "default";
-	};
-};
-
-&pcie4 {
-	pinctrl-0 = <&pcie4_default>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pcie4_phy {
-	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
-	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
-
-	status = "okay";
-};
-
-&pcie4_port0 {
-	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
-
-	wifi@0 {
-		compatible = "pci17cb,1107";
-		reg = <0x10000 0x0 0x0 0x0 0x0>;
-
-		vddaon-supply = <&vreg_pmu_aon_0p59>;
-		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
-		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
-		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
-		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
-		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
-		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
-		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
-	};
-};
-
-&pcie5 {
-	vddpe-3v3-supply = <&vreg_nvme>;
-
-	pinctrl-0 = <&pcie5_default>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pcie5_phy {
-	vdda-phy-supply = <&vreg_l2f_e0_0p82>;
-	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
-
-	status = "okay";
-};
-
-&pcie5_port0 {
-	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
-};
-
-&pcie6 {
-	vddpe-3v3-supply = <&vreg_wwan>;
-
-	pinctrl-0 = <&pcie6_default>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pcie6_phy {
-	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
-	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
-
-	status = "okay";
-};
-
-&pcie6_port0 {
-	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
-};
-
-&pmh0101_gpios {
-	key_vol_up_default: key-vol-up-default-state {
-		pins = "gpio6";
-		function = "normal";
-		output-disable;
-		bias-pull-up;
-	};
-
-	nvme_reg_en: nvme-reg-en-state {
-		pins = "gpio14";
-		function = "normal";
-		bias-disable;
-	};
-};
-
-&pmk8850_rtc {
-	qcom,no-alarm;
-	qcom,uefi-rtc-info;
-};
-
-&pon_resin {
-	linux,code = <KEY_VOLUMEDOWN>;
-
-	status = "okay";
-};
-
-&remoteproc_adsp {
-	firmware-name = "qcom/glymur/adsp.mbn",
-			"qcom/glymur/adsp_dtb.mbn";
-
-	status = "okay";
-};
-
-&remoteproc_cdsp {
-	firmware-name = "qcom/glymur/cdsp.mbn",
-			"qcom/glymur/cdsp_dtb.mbn";
-
-	status = "okay";
-};
-
-&remoteproc_soccp {
-	firmware-name = "qcom/glymur/soccp.mbn",
-			"qcom/glymur/soccp_dtb.mbn";
 };
 
 &tcsr {
@@ -578,122 +32,3 @@ &tcsr {
 	vdda-refgen4-0p9-supply = <&vreg_l1f_e1_0p82>;
 	vdda-refgen4-1p2-supply = <&vreg_l4f_e1_1p08>;
 };
-
-&tlmm {
-	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
-			       <10 2>, /* OOB UART */
-			       <44 4>; /* Security SPI (TPM) */
-
-	ec_int_n_default: ec-int-n-state {
-		pins = "gpio66";
-		function = "gpio";
-		bias-disable;
-	};
-
-	pcie4_default: pcie4-default-state {
-		clkreq-n-pins {
-			pins = "gpio147";
-			function = "pcie4_clk_req_n";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-
-		perst-n-pins {
-			pins = "gpio146";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		wake-n-pins {
-			pins = "gpio148";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-	};
-
-	pcie5_default: pcie5-default-state {
-		clkreq-n-pins {
-			pins = "gpio153";
-			function = "pcie5_clk_req_n";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-
-		perst-n-pins {
-			pins = "gpio152";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		wake-n-pins {
-			pins = "gpio154";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-	};
-
-	pcie6_default: pcie6-default-state {
-		clkreq-n-pins {
-			pins = "gpio150";
-			function = "pcie6_clk_req_n";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-
-		perst-n-pins {
-			pins = "gpio149";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		wake-n-pins {
-			pins = "gpio151";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-	};
-
-	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
-		pins = "gpio116", "gpio117";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	wcn_sw_en: wcn-sw-en-state {
-		pins = "gpio94";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	wwan_reg_en: wwan-reg-en-state {
-		pins = "gpio246";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-};
-
-&uart14 {
-	status = "okay";
-
-	bluetooth {
-		compatible = "qcom,wcn7850-bt";
-		max-speed = <3200000>;
-
-		vddaon-supply = <&vreg_pmu_aon_0p59>;
-		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
-		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
-		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
-		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
-		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
-	};
-};
diff --git a/arch/arm64/boot/dts/qcom/glymur-qcb.dts b/arch/arm64/boot/dts/qcom/glymur-qcb.dtsi
similarity index 94%
copy from arch/arm64/boot/dts/qcom/glymur-qcb.dts
copy to arch/arm64/boot/dts/qcom/glymur-qcb.dtsi
index 17d8ff3aed23..9751fbcc5f82 100644
--- a/arch/arm64/boot/dts/qcom/glymur-qcb.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-qcb.dtsi
@@ -3,10 +3,6 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
-/dts-v1/;
-
-#include "glymur.dtsi"
-
 #include "pmcx0102.dtsi"        /* SPMI0: SID-2/3 SPMI1: SID-2/3 */
 #include "pmh0101.dtsi"         /* SPMI0: SID-1                  */
 #include "pmh0110-glymur.dtsi"  /* SPMI0: SID-5/7 SPMI1: SID-5   */
@@ -15,9 +11,6 @@
 #include "smb2370.dtsi"         /* SPMI2: SID-9/10/11            */
 
 / {
-	model = "Qualcomm Technologies, Inc. Glymur QCB";
-	compatible = "qcom,glymur-qcb", "qcom,glymur";
-
 	aliases {
 		serial0 = &uart21;
 		serial1 = &uart14;
@@ -424,7 +417,6 @@ vreg_l4h_e0_1p2: ldo4 {
 
 &i2c9 {
 	clock-frequency = <400000>;
-
 	status = "okay";
 
 	embedded-controller@76 {
@@ -559,26 +551,6 @@ &remoteproc_soccp {
 			"qcom/glymur/soccp_dtb.mbn";
 };
 
-&tcsr {
-	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;
-	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
-	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p72>;
-	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p72>;
-	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p72>;
-	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;
-	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
-	vdda-refgen3-0p9-supply = <&vreg_l2f_e0_0p82>;
-	vdda-refgen3-1p2-supply = <&vreg_l4h_e0_1p2>;
-	vdda-refgen4-0p9-supply = <&vreg_l1f_e1_0p82>;
-	vdda-refgen4-1p2-supply = <&vreg_l4f_e1_1p08>;
-};
-
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
 			       <10 2>, /* OOB UART */
-- 
2.43.0

