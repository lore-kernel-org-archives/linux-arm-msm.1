Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2CE4DD3DB
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645292; cv=none; b=l+FnQakYKJvJa7pWMZhExf3Sm7Wu7/Nc0cA8q78A37V/dA+CWDP9U/bPwJIF1HYUAWgvEB3OK83tdmSeDyZD1eVXu36H2TMQMT9m+8Rw3kXzcyydWhdKdC7XL/srsQuASuJYBmnLmonGSIwvo+SI2UKIPRcP5yvRzLpIrIlpoUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645292; c=relaxed/simple;
	bh=0clhG3sjpOKi9CnPJRlWEs4VtjCAuoD5Rqe1Oj+QesU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OfxiYubnJAaM0GNjyPt0gpspUCNFaDIAssFefpYdRd/cCvX5DxmoeWDoE1hMAKZVb0lGG0PxAsn2Aty0mmK4fbqR02C1qKHhcB4OolBAv47t7jEN+rWiu6IlXGc/wJtEJMIDdoQ0spcL7Ev7DV5mDlR8n4WtB0SRJ4j7e8yIz30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ARZCI5J/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g1SGkmzP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ARZCI5J/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g1SGkmzP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZwcR613830
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NtpZ1UwOnwR1wfa+XkNK9I5ShlxLooktMu/pyV8I2Bk=; b=ARZCI5J/a+gpzY5l
	CVUpQRr/eJFIOCADPVqyFTyP8roAC0T1nhsPpBNm8Y8/15WnVnypgqvtLVtzpBSn
	LoG+ViR2uuk/uQU0gefp7nAGqdPyq2dCNHXI2eM3BGfqil0DLR2bt3c9cI3kGyLo
	M57Vy5vLz6ir/+k26ZvpeWn2DZ6T0EsXBpL5zk7SkL9HMOluwiJnBQynmL+Aou7v
	9NCs7DlE59T2TyMhnDmft5Fo1VmDfRs0BCIPcZ3NvAVNivq2s8k1/SHQPg1TrN6e
	OPm7qI0C75pxKOKBZxOT5dNBDl5WRjf0Uyh5ZXWDWddTVYrazl1aNgG29r+/akFc
	70y3hg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grca0rvu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:41:28 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8688139460bso952741b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 04:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789645287; x=1790250087; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NtpZ1UwOnwR1wfa+XkNK9I5ShlxLooktMu/pyV8I2Bk=;
        b=g1SGkmzPY6kRRtukhtTMHr02zPKVZc1PTD4xCjFZUlBTOSWVpShqMXsgGO6jnXSxb2
         yQW2/9O8D/CLs8cqdz3ngsLH1uzkvcsHAQkKVexS3eFmmVzXyoxiuvVtEoe3fvsRdxIZ
         Z2iiqfvsTb1x5WLS62aVgcHQ1xAfVb6e9IBuElj6lzi82CBE++7o19cB6ISCUIymSiPu
         HtFP40XyzI2Rnw9Ytj5QsWK+k7pKggOL2r3q6ObA+xZmJjCdVjgI6bgWsvj7j023g/ak
         x72HtUwmJr7z72kKXbM+M3BT2N/Egvgs1M4VtBp9WFpSGsvj0Og0K4HHibBAVX994fur
         dBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789645287; x=1790250087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NtpZ1UwOnwR1wfa+XkNK9I5ShlxLooktMu/pyV8I2Bk=;
        b=LfekT/YL0ckzMaE6ONQDA/eD2JH9DihdB1NxVQ2sEaU6jUiZnMmosgAIIcP+A2pUCI
         8C645n30j4mGOOeIQusJJUI6QmRBM+n0z5gYweo7SPl0msxoIIOa68dvG0FRZUXIZmAa
         gOQ0SomV8V4DUR3XfiqF9OVzRAZtBmlwzRiqTWgXrMSuCxLIoqxUHUMRVke1kM+eAdYV
         IhBvSXNQmgaOADAl94J0WBNnplPNT3pK7vI28+cy5qg3AvfJrESDwlrln4Q9Nn2KKriU
         UOxDHh8b/JCfotdkLLXT/jHKl8KeFcKYEr4GiutCaKdlJ/bObRID9VnetqCESQ9LmgQE
         uwgA==
X-Gm-Message-State: AFuF++m3ETEOonFyGBo7IrU+cr22ho2/6O7sJVomAcKUtBsSDi50uYHa
	JoZqkVBkv3Cy5OqmSTtbC3YVS2BP+Z4VaT2i8WH1jvMc7tqFI6yyfCcD1QYpIa5HJyEWYHyzW9F
	Pjzik0Rihykp2dU32G9ZbAl/tYGhU1LSpRZA5wE6jqMehL2cuxlZzYZGzoz9klDCMynR5oZ2Trg
	bi
X-Gm-Gg: AYBFou1FaNywlghtuACj8E5SqYy/wJfl3XjikvdQbPVRr+267DcRffdT+KJI4DoMhx7
	6HZgUHxv0sctO/+cdakA6tKSsXCccVpKLvwrRwrBfMJCV8A8CX+PsNyJq7X1TZzPOeTTwJEFNiX
	ZUUow3oaBJqDUUabKztmwjtrJnaykaXnFpTFmI8BaiLMHH8fjlGtxyPAlrQincwiT25q2e9AGyu
	FOD3J7TI/+ETEMtTtdJwxpnTY+qlFB8OCLc6I43PYf40/Q/NcZtKL+UIL0m+rq5m/UdfM2enuI/
	enb7pHth6NGUlXx7Rg8Nti/j8mpFJ6K44QWvADS7yBzGkpqbh1NqfgqnXw4QLOFhPobFaqxGLjl
	hHXV4QtSx0sckUABZHj3RJSjG2Q+zXw==
X-Received: by 2002:a05:6a00:6caa:b0:856:30dd:91ba with SMTP id d2e1a72fcca58-87236ae8236mr13475390b3a.2.1789645287211;
        Thu, 17 Sep 2026 04:41:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:6caa:b0:856:30dd:91ba with SMTP id d2e1a72fcca58-87236ae8236mr13475325b3a.2.1789645286774;
        Thu, 17 Sep 2026 04:41:26 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50acc1178sm3066557a12.30.2026.09.17.04.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:41:25 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:11:01 +0530
Subject: [PATCH v8 2/5] arm64: dts: qcom: shikra: Add CCI definitions for
 Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-shikra-camss-review-v8-2-9b9596221cfa@oss.qualcomm.com>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
In-Reply-To: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789645263; l=2744;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=0clhG3sjpOKi9CnPJRlWEs4VtjCAuoD5Rqe1Oj+QesU=;
 b=q9ZHy4b/hYrpmM6KJAM4IBhaNiSsWe8M6eZGolV23XCjbGyp0nz+xSWis0QNMf1UJgu0D8lXM
 MQ8jU2CFlxkC1NckBKAvVifToy0pmJ8JzKI2Hb5OHXBs+1ml6iYZmfi
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: 5p-jNNktoKrd2nss0X_f2qZGSRLGlnkl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfX4kpHfbUXdobA
 UehhJ6EDeseNrSLYrOEFv8j7u3pSSYEoeKcD4/eUhWvD3LtgEywgKiQRQozgISR/e7fAs3NlP65
 1koijumQLz8DJOreFLxPh5Twuqe+g44=
X-Proofpoint-GUID: 5p-jNNktoKrd2nss0X_f2qZGSRLGlnkl
X-Authority-Analysis: v=2.4 cv=dOQzC+Zb c=1 sm=1 tr=0 ts=6aabd1e8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ZbC1Des45MQyGPwI-hwA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfX5cv3EXvmfxP/
 2XEmQ0YeoIL3eCSkbalt860SACjPT5p7JDIW+wId7NQej06ynccUZG/LjXxFAnfe7ci66ZU7jNx
 Zqt3x/U4oRMQpkeWJYixUB2MdpCq6NEEszy4ckts9YbsFQej8yUacNhGlrtYicgTRVQPG3J6HZB
 4z3ZbT40o4Ywlk3GrGY/mGT2MZPmzWMgi99g1Xd4kY+IZOy92QaPShoRSovlhlZI+PHjx7Pp+AB
 ZPIV3O+4urTLUKfTJkouNewydtTKKOxtmyKlxjYPzNI2ARat2bUOu5SVNfxcMXoYARtTGnmLMQz
 wIUv7BZJsoqq9Gz2E23vAbakBv7k0c3h9A02wMoooE4biHw85RFom0pP+HasHEM37+xG9sUCgN2
 1A1Q7w/xBC4VaiK0sOs/rTIeu6E4Cdujcl090u5XQK+x4o3ArWwCtm5wDuytuzagHd0mrbgU5BD
 zEmRSY1k67g2zH0IVMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170162

Qualcomm Shikra SoC has one Camera Control Interface (CCI)
containing two I2C hosts.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 69 ++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index faa1f02c01957b8ed86b5e8fc659c856d574a8ee..5f64b4e50967d61846b7b0c565380a58e4ba3210 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -892,6 +892,38 @@ qup_uart9_default: qup-uart9-default-state {
 				bias-disable;
 			};
 
+			cci_i2c0_default: cci-i2c0-default-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c0_sleep: cci-i2c0-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci_i2c1_default: cci-i2c1-default-state {
+				/* SDA, SCL */
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c1_sleep: cci-i2c1-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";
@@ -2077,6 +2109,43 @@ port@1 {
 			};
 		};
 
+		cci: cci@5c1b000 {
+			compatible = "qcom,shikra-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x05c1b000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 206 IRQ_TYPE_EDGE_RISING 0>;
+
+			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CCI_0_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+			pinctrl-0 = <&cci_i2c0_default &cci_i2c1_default>;
+			pinctrl-1 = <&cci_i2c0_sleep &cci_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		remoteproc_mpss: remoteproc@6080000 {
 			compatible = "qcom,shikra-mpss-pas";
 			reg = <0x0 0x06080000 0x0 0x100>;

-- 
2.34.1

