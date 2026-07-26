Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29703546FD
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 05:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785045126; cv=none; b=T7drVl1fcHm5XfqbwTesN/quIMOp4syZXhAmItPmpYkLktls0Z86QQHQb4q0kIsLqTWoguCK5EIS2e+EQ6el6fnfLAE/PsSaegYI5uIrM2DfDtSaJbc53MXMWjxo2530PKUfPes4e1r6WNSxwzWb4wEFQHh9nHazKNIfnay70GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785045126; c=relaxed/simple;
	bh=ON8srqd3aUgowhj67UGEbvHl9QpdnL4HJawBK/SEEvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M2UWdUee88iyxVfZEsCBSBHXoL+zTr1MT8hTdFxFy0SiGJAlHbbJ1adUbTbY4SjmhZIm2iil1UK9SioGJ6EnOyxh3Gn6bnrUvYCG5Zwef6x+51ZrApQbsV/SbfWG+9fvJie7JNl7zDHWePgk7RK9U2svmbzrQtX+Ua5AZzTOztk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lMMtALhG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B/9xHyMt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lMMtALhG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B/9xHyMt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66Q5Rnst3959534
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 05:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KSqOAwb4/u/nEQFyuPvcZ0hNY/Ka6J87mP3j2Yv50Eg=; b=lMMtALhG/S5RiQcN
	rT5IJgZRLI9W2VtMn5IWhKoiPRr7bdVMwQ2aqjhkn5z6woxYmr5gi7u11X7v64Em
	GJdDV9UPy9h7esLBUqyy2c7NDJ6mfZZhTfsjmWeql8Aiaq0P5GpYBWKDRW6p34wx
	0yIdfVu9adQvge+bwfWYoZhhzn2Z8N9WKHxGgfDfb/2rwzbZTHuwhkX+h5N3twhd
	p77/yvQj3ufJgPkkyJKPqH/9OsF8cFrXwTYKMDED+q5ez7EYaPOtEUeS3RKZpmaS
	gLP+u3xGxR7TSqHcZs+EdkPGnFXBkB0wTFg3f5HYP5yTDqjJESM1wLA8QmKJXYXv
	tokdkQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmjgn2q12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 05:52:03 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb4cdf95b5aso3195567a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jul 2026 22:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785045123; x=1785649923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KSqOAwb4/u/nEQFyuPvcZ0hNY/Ka6J87mP3j2Yv50Eg=;
        b=B/9xHyMtWlmCjRIr6IEJsYa96bWjHvCpjim+NOI15WpgJHgVxMwQeinGigfR3nPA8Q
         F7FvvfPDk4E4+5FgZANSrNh1Enuhg/UoYyQdenBWlylYV2jaEwhmFxji0vQxpp03/FqE
         46roJsHsu6xc+DFGfQ7Ozvnh+ITa2qrJqDuPEfa6zAwPhCdjy1f1vFfcvoFguZ/unqvK
         +EHcm0oFgW5ubV0AbEQHdUMrfGxFIgZb+ZhYFAAU4k9TjZdO7uub3k+DBxijCr2na6+8
         QJJ+IpoV9oE3ccvym2Jo2JTTcZ2Zm+dEbK8nhlkEEkcz7jLUA1aC4cqp+cgVLSghqom5
         i2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785045123; x=1785649923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KSqOAwb4/u/nEQFyuPvcZ0hNY/Ka6J87mP3j2Yv50Eg=;
        b=bYSTkphlCVxlnZwE5f1vwQy1+qvqta2JGvoVb4JhxSFTvV/TLgLLtjtx7yXbpr26+b
         aU/Tmw+T2wBqNjoWvv2iQI6L1M6P+nsT99bbNYaN+F7W5l3WlX/86gEpSO+Efbh7yySf
         KliJQinN5UDVbaOF8yA1Y3fCuIsx39jGt84LyhGnOHLFlaw6C5rXwM562bH9+6oTCmJu
         2ZK0hJapkj5ydk77KG0i5rqEdQ4djUZAmMciuWed5TLtwx8L+riOkdp6UR4TlLH04WaR
         X1rtq06OG3Oi49CzHGp3QTmJRUQmO8xd34UmaQhGeg+I7r4jRwR3FVj/w7od5ZqJEfae
         ZBkw==
X-Forwarded-Encrypted: i=1; AHgh+Rph1Yb5KeITszPWw4gBIerIEdj1qwlklOSkZtveZhbmolBC0Yb/jlP+Htavbd/9KWizMtwpZ88sqQ7kTo9E@vger.kernel.org
X-Gm-Message-State: AOJu0YzIAx3QLk/7BCcvHBjYFMugYCjDMOtvhlKaIt+ibfiicylHDJ2R
	a6fzqSeu7nlL3CXmIe6LIC6S64+U03LdaqoVlPV7OHx0FTL6XZZpXv5zHT6Er7UbLFVR7UEd67Y
	Gff2yAmHWBDJbcNndvvdO48aTuwGQj0qj9tDvYwoybRX6j/A2Fdt+oqjujk9ulfxzIxQZ
X-Gm-Gg: AR+sD10uzk+YGW4ZYP4PpJ/D9gjmimvmd7+lOV54mxDj47DdYbmL7peQy/RbYlYjp5L
	Ft/iOu8SbttqDk6zFw7PsH+mwg0EXHmOTDRL/PFiGUUJI7LnCFnzvnrmfVo0IXUl+8WcuiFOvRg
	f9WH6a+ze1IHaTnrsnolp7b5+q8TSbhJ96AT2+FZtMXPFJecNvzZqt1R6SldhJ4s18W0xJ67NXs
	DrRc2IBhodE8q04PZ1NFZ5uKCe1XRrBkeChITEgyYTnrl3ACqxw+VtJ4xNWm/fAtmZ7s7Ubxgdz
	4KyECI7P55q6EqrzSEzKot73J4EyZN4ytQPa8979xwpWeJNYJqNCMETTtlb5Z00tAYR8oGkmT8p
	9KT3vTvpux5SkEH5hjZNyJE3WI9G8oC+0cw==
X-Received: by 2002:a05:6a20:1605:b0:3c0:9c1b:d0b5 with SMTP id adf61e73a8af0-3c67e02704cmr4106578637.64.1785045122676;
        Sat, 25 Jul 2026 22:52:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:1605:b0:3c0:9c1b:d0b5 with SMTP id adf61e73a8af0-3c67e02704cmr4106550637.64.1785045122205;
        Sat, 25 Jul 2026 22:52:02 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm67106334c88.15.2026.07.25.22.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 22:52:01 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 11:19:43 +0530
Subject: [PATCH v10 13/14] arm64: dts: qcom: glymur: Add iris video node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-glymur-v10-13-de451559e88b@oss.qualcomm.com>
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
In-Reply-To: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785045024; l=4683;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=ON8srqd3aUgowhj67UGEbvHl9QpdnL4HJawBK/SEEvE=;
 b=6Rqw3lz4PWJFC9yYr4KT8o59dlDL482bmFfYG/TgIWXXX/w0DmRLnn229Akstw47/jpW6SlZZ
 MoSULRG3RV7D5nGNI5nlfMtq7PjFrpNoUSEvcTglOqDheQ2CwdSLvp0
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: QyKRzIytyIb8jlDsooPlGaFXetF0Pe4M
X-Authority-Analysis: v=2.4 cv=HMHz0Itv c=1 sm=1 tr=0 ts=6a65a083 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=cZ5fV4nVeeMGK4x61nkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDA1NSBTYWx0ZWRfX0/pxoboyvqUC
 xyfPJQ4QSxFH0ThdqvcpZcmO8t4uWsZr/H7LZ68kBG5wXH2GYS22b8VWEP3oyEuDHEBtTbIUbA8
 VxHfxxAPRceIlts5WOorpuCzQaIoerDOiVZsu95YEM5T/ND3veAaualoDCpQbC1XUUuofuQ4ZaW
 VRkrKoWnMaCC1lgB//g4XI+dH3QF8kyLbPsR8uHoytSav4KDo8yG1xuIXSOHtmfmGl/Ge9sSeWk
 1hzilNZeqMmzPsTKxoZ8G/1LDwbS25/4F5Zway9eBLPobw6zOJoR4xXtRrJZGdab5HdqOsSpRUa
 Qp6pxBzanElEcE/SadslvwCYYGAgiFu06fvUk0pE1T4/3ckct/5yoh+mM9BWtuxmMfFw1nbJiTG
 Kkl+lCOD8jJOYrwCwYPstggmc1hvstFGM49t2t8yNHoyVCSD3dIY3YvmdCoU3rdA7vQfE64n2zz
 eT/5JHl7Ftc4XON41yg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDA1NSBTYWx0ZWRfX8eC95OxPBZ7e
 mtwuJzLKRXAU4scbXvJu9hvdf9yETauePiXib4jOtLoCKBZ09BCtfXZv5Ksb80Roeccp1wMwk1H
 uFlo02TeABT7k5bGAA1cIuo6dvHAJ/4=
X-Proofpoint-ORIG-GUID: QyKRzIytyIb8jlDsooPlGaFXetF0Pe4M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260055

Add iris video codec to glymur SoC, which comes with significantly
different powering up sequence than previous platforms, thus different
clocks and resets.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 123 +++++++++++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f32af66a3f1c..f3a01a2a1f22 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -695,6 +695,10 @@ adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
 			alignment = <0x0 0x400000>;
 			size = <0x0 0x800000>;
 		};
+
+		iris_resv: reservation-iris {
+			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -5314,6 +5318,125 @@ mdss_dp3_out: endpoint {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,glymur-iris";
+			reg = <0x0 0x0aa00000 0x0 0xf0000>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>,
+				 <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
+				 <&gcc GCC_VIDEO_AXI1_CLK>,
+				 <&videocc VIDEO_CC_MVS1_CLK>,
+				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
+			clock-names = "core_iface",
+				      "core",
+				      "vcodec0_core",
+				      "vcodec0_iface",
+				      "core_freerun",
+				      "vcodec0_core_freerun",
+				      "vcodec1_iface",
+				      "vcodec1_core",
+				      "vcodec1_core_freerun";
+
+			dma-coherent;
+
+			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			memory-region = <&video_mem>;
+
+			operating-points-v2 = <&iris_opp_table>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&videocc VIDEO_CC_MVS1_GDSC>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx",
+					     "vcodec1";
+
+			resets = <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK_ARES>;
+			reset-names = "core_bus",
+				      "vcodec0_bus",
+				      "core",
+				      "vcodec0_core",
+				      "vcodec1_bus",
+				      "vcodec1_core";
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+
+			status = "disabled";
+
+			iris_non_pixel: non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>,
+					 <&apps_smmu 0x1944 0x0>,
+					 <&apps_smmu 0x19e0 0x0>;
+				memory-region = <&iris_resv>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x1943 0x0>;
+			};
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000 240000000 360000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000 338000000 507000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000 366000000 549000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000 444000000 666000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-533333334 {
+					opp-hz = /bits/ 64 <533333334 533333334 800000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_turbo>;
+				};
+
+				opp-655000000 {
+					opp-hz = /bits/ 64 <655000000 655000000 982000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo_l1>;
+				};
+			};
+		};
+
 		videocc: clock-controller@aaf0000 {
 			compatible = "qcom,glymur-videocc";
 			reg = <0x0 0x0aaf0000 0x0 0x10000>;

-- 
2.34.1

