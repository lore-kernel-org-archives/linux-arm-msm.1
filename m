Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793245675;
	b=0J8m2k0PILWwyTE4bv/gUMK111x2P8sqAhgWM1ETRl7c7J5vA+uqBVr5fFjPJNOOqnl6
	 pVYWFim989KhFB6khrqp5154uVt52DY8+SGOYieSQELRYoNIEAkHSR0ki6ePLVyPlOjyM
	 aM4iEUanJrrtN5H3IG7Kb9u4Rqm6E7dHpMtitxLhiT4DTFdSVJfKsbLIHN+kfecqHLVyd
	 g2+MSQ7FtTICHtF0U874fMkaYBJrYsOJwlO2or4luqHIPnode7cVZT/ukAqTazxZXEUEW
	 mYgAvfJaaMdMT+HyWNYTOsc6xDqVUvF76624PjZgYEHbmWQz8ZXos0E/qZhyG2/N1lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793245675;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6hP61S7FMd5GBi62j70cBoRA5yujIbmQxVw7ipJnZtI=;
	b=rv2d/ZIGLgPgEBszKjDMYeOrDtRXzBxA1FTOvGO38xqFpP87fD6ysS6iCAVv3a73X05N
	 Tkm+OK1N40DrqnZK9roRSyXW7Kk2aP+j9dNu26qHhAFkUVHdHd2+ZF7OPsxrIT5fTVxUZ
	 JGc9UJ4ize6f5VcKrqY4JkalNTyz1PxRjj/3v7FTBpuM3IKNyRJpBZlUOfojaD1rsV3yT
	 AtEV4PfLQM4e+Y040iCXqq8y5FpsMzcyFT5DZ1xl/SRolESHtIMdTbsYPuf9y3JCSsN/Y
	 dDVIK4j5bCt2yLnX8GGwDThpqnzvFUhixTFhlGob8OT3IAoyiOHJDdcm5yt53D5IuyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J0tPRhy8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="JusMrOf/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893F2606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 03:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 893F2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J0tPRhy8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JusMrOf/
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1jj9A3439296
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 03:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6hP61S7FMd5
	GBi62j70cBoRA5yujIbmQxVw7ipJnZtI=; b=J0tPRhy8CaAl8ooOBFWVnzurNGt
	BKfn2yiERnUIorCj97MDw4tmgyU8ziX4DajoQeyqkx4q6Ttr8FiNG+xRawF/p0ua
	CTWuYrSd7u79ta9kZM7DG+Of+kHLJaWxvzNIGuotqmVHubzt/6beU3HF2d0Xif0P
	Um5kllTU3rWO67nuTEAKMC4f74Xjpp5MS8DtX9tcy11EhQMbYijuM122805mahom
	mE6ZTBdM2qxICC3q4Iw5rDlaSCWrL4luy85Ci0RUyMnE4it+1c6L5VdDjJiLTAPz
	oksDLopluV73z/ZN4tfkXxsgYQ2llMNcIgCt03ODxc3HeVJD9LF2uXZm/0A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpmc1pvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 03:47:53 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a190c53a3so543871eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 20:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793245672; x=1793850472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6hP61S7FMd5GBi62j70cBoRA5yujIbmQxVw7ipJnZtI=;
        b=JusMrOf/svvFirohhFoIGRAUa7rBR4qeX+p7uE2YQP80EcC01mtneGdSK5ORbY98VA
         yJ5w3IulqMxotnoHb4uW1uyEBCBb3/Du2roZfFVK8+9mD3IEwgwR7CSjyzyWuriNLrTj
         IYhoLEOp33COk4ExHIpjY4Y7bQ87WkUXWdSzeIrA95wcff468ZeLIFd4Rg9YYTScGIU6
         FT79eTtw2SHjTuMeZQOnG9o6t9AcneIQEG+O3dOimbTjp3YtP2GaWxYpz8u/7/zdlu7J
         zPD7cW8ZlUidxR7yUxcD6do4rgbkN4m8ZhxVNqw6uHRbl24YSH0ijSkDlf/rdMx+8j7I
         wYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793245672; x=1793850472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6hP61S7FMd5GBi62j70cBoRA5yujIbmQxVw7ipJnZtI=;
        b=RW4drEt8KLOGnPjf5qh/bw9lvoJZVZrWfTDBBDBBUgB/Q+3xm6zIN50K61RN6p+RVv
         uAc2+fYMNgshzc10QKy5XsQLz41NyyUOUU5SjrOiPpfkZwBWz6X+mOVT8jptJ9ypdhTG
         EKhL7ors8MbI6dBelG088mKKFsYGpXIgRdanDxNs5EvFdvlDS8zwO6yZOies8Pdl1Zl/
         8GXtg8Y/HBfIoxDW1VJwkgp2yd20g0VdVPcjV+Y1cwQN7WVpBOhL5NF+wiuBVj1CzRL1
         Z1R1bcrIqZ5vSd4fuccXmR25feRsvLrdFdtZ7CIo3WIPpjTXNLLsMjHH8UnypbPyHyrt
         AdLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVy6qjYcFh9CG397nHKlV7EWnROe8tGzWA8+GQ59shR/ahZJkrpooZWvMOzdSXAnxCKZaqfc10UoCF0qBC@vger.kernel.org
X-Gm-Message-State: AFq9FYLFYXNVWFPpM2acnunBOGCvFv9S6tUsyPaFwkEoVNl5LAxvLCeO
	RbJbfjd6GqXeg1R5kGfJWDjGLfoct5vWOQfwr4A4Us6v/JnAqKEG81kJ/oZHxUMihomRCbPi7gZ
	dJr1rLOYcrjMc02LrcQGmNOBMESHNyapWn94aTWNNft/BzRzVqQ7XcZWieW57xUfS71kP
X-Gm-Gg: AYBFou1CTEPQJ1KrvyR1H/ZDFohosTocDG/7jvXSTuAzQTODxFrK17hpJ/qEeBq8yls
	gvNXlf2AnfpeeonnTcdm82yRfHdcp+iM5K8NJKPsBwyYVB8e1Ap2evz0TGuvBMT34C+3Saz2Y22
	duYEiiSBna9JBQxuq1tmx7duih7BQFDrPy+wiV5A9kOJcn1kr/xDt0Sc09Kxagcj078D+UZE5Ik
	qD164bYLjZMdQNhVM3Er/AukfwaTyyKQI8SZkM4pV4+Uk9gynbUtBojhybZ1/P5y4hm1fJi31Qs
	uaOfC5rsso2OSNzJFWl31G9ZmOqcgNTJ3Ui9cvGKg7lHwcLl+ehEwOq/7IwMvHmCNBu16o1Zrez
	JX69ftEVtBsoiZhJjtfPmwY9B+/kusx27++A1/8PPDLNUX9hTvIqgSbcjjlCF7hrxpHTheXXp02
	NRw90zVUKVjr1+jz1g2Fg+qT2coZqM+/uN
X-Received: by 2002:a05:7300:6a9d:b0:369:f644:fac0 with SMTP id 5a478bee46e88-36a2fd70ff6mr1788181eec.8.1793245672372;
        Wed, 28 Oct 2026 20:47:52 -0700 (PDT)
X-Received: by 2002:a05:7300:6a9d:b0:369:f644:fac0 with SMTP id 5a478bee46e88-36a2fd70ff6mr1788155eec.8.1793245671804;
        Wed, 28 Oct 2026 20:47:51 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2393cc86sm11064286eec.19.2026.10.28.20.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 20:47:51 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v3 2/3] arm64: dts: qcom: nord-ride-embedded: Enable eDP0-3 display output
Date: Thu, 29 Oct 2026 11:47:27 +0800
Message-ID: <20261029034728.633495-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029034728.633495-1-shengchao.guo@oss.qualcomm.com>
References: <20261029034728.633495-1-shengchao.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=X4nHu2Te c=1 sm=1 tr=0 ts=6ae2c1e9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=F3f4s1Zse-zWnPoJeOMA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: smwipucIMlwxcI2xibPTm-xYJttdhSma
X-Proofpoint-ORIG-GUID: smwipucIMlwxcI2xibPTm-xYJttdhSma
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAxMyBTYWx0ZWRfX3vqcOXCf7Eqc
 EO2dJteazQT4xB1m7A+EiR6WiyRI/pg40eVME5CzEq5cdUNdsH2Ft4qXFnE8gF5hovRkvGxTkDP
 gmOC/De1iSCPNd9vf+oKycwyLXBjPiGZBpC2P4/t+oW+WTCU0x1cLGlobkbh9FQJwzFFCIgSmFL
 RH8DLbwORJwA2nXKgfHj3aYJ6h6Qm/vcAnzNK0yHR+6I66+XSqS4UwjYDm+nRprqFnZNxxwqMHS
 PLbKzexOvP+VgsM7ZaS1P1s3XHCUxj1Q/WuCA8bR9BnL1ygXAyknmdt0LNjeou+KqlnYJDpRkB4
 2J6EVXSHOSXTsUXicWeR2V0nYC8clUK2b6elgyTBST0XIxLEEUNF7g5sQfiMMe+jg1fkl147npD
 Ov0vhV1WyEx6MXayJbuAWejmiipnyzWd13LKpHUsvp67ucXLJV69wo83ov+TMT4H2p8OQ0tutOF
 1QGRUXSCsdwCbwv7qLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAxMyBTYWx0ZWRfX1+19Hu11+zsz
 4pnL1/SKwZh1I6xKP9RdqOn6UXwXllBm41emUVOZHDFUJtYFrj3pCdhlR7FH/3QZu6P9SsL0MDf
 WGk5MnVnIw15W6J8YiyVZBt02Bs8OZM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290013

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Enable both MDSS instances, the four DP controllers and the eDP0-3 PHYs
on the Nord Ride Embedded board and describe the eDP0-3 connectors,
their 4 data lanes and supported link frequencies.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 49635695f832..cb1d436644c1 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -53,6 +53,54 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	dp0_connector: connector-dp0 {
+		compatible = "dp-connector";
+		label = "eDP0";
+		type = "full-size";
+
+		port {
+			dp0_connector_in: endpoint {
+				remote-endpoint = <&mdss0_dp0_out>;
+			};
+		};
+	};
+
+	dp1_connector: connector-dp1 {
+		compatible = "dp-connector";
+		label = "eDP1";
+		type = "full-size";
+
+		port {
+			dp1_connector_in: endpoint {
+				remote-endpoint = <&mdss0_dp1_out>;
+			};
+		};
+	};
+
+	dp2_connector: connector-dp2 {
+		compatible = "dp-connector";
+		label = "eDP2";
+		type = "full-size";
+
+		port {
+			dp2_connector_in: endpoint {
+				remote-endpoint = <&mdss1_dp0_out>;
+			};
+		};
+	};
+
+	dp3_connector: connector-dp3 {
+		compatible = "dp-connector";
+		label = "eDP3";
+		type = "full-size";
+
+		port {
+			dp3_connector_in: endpoint {
+				remote-endpoint = <&mdss1_dp1_out>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -366,6 +414,82 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&mdss0 {
+	status = "okay";
+};
+
+&mdss0_dp0 {
+	status = "okay";
+};
+
+&mdss0_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp0_connector_in>;
+};
+
+&mdss0_dp0_phy {
+	vdda-phy-supply = <&vreg_l2h_1p2>;
+	vdda-pll-supply = <&vreg_l1h_0p9>;
+
+	status = "okay";
+};
+
+&mdss0_dp1 {
+	status = "okay";
+};
+
+&mdss0_dp1_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp1_connector_in>;
+};
+
+&mdss0_dp1_phy {
+	vdda-phy-supply = <&vreg_l2h_1p2>;
+	vdda-pll-supply = <&vreg_l1h_0p9>;
+
+	status = "okay";
+};
+
+&mdss1 {
+	status = "okay";
+};
+
+&mdss1_dp0 {
+	status = "okay";
+};
+
+&mdss1_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp2_connector_in>;
+};
+
+&mdss1_dp0_phy {
+	vdda-phy-supply = <&vreg_l2h_1p2>;
+	vdda-pll-supply = <&vreg_l1h_0p9>;
+
+	status = "okay";
+};
+
+&mdss1_dp1 {
+	status = "okay";
+};
+
+&mdss1_dp1_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp3_connector_in>;
+};
+
+&mdss1_dp1_phy {
+	vdda-phy-supply = <&vreg_l2h_1p2>;
+	vdda-pll-supply = <&vreg_l1h_0p9>;
+
+	status = "okay";
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

