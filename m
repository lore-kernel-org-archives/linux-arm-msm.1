Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634814;
	b=miqev8zsyYLvDLOnXe7Iwop7WtMHE369B3Yrobq7DZN+SazDGtY5/2OCF1EZdji9CIUD
	 l0mLCFzKpcOUqZ4Yz66kJ4K3jSouOn2AWslPJYqQlQS0YEaXxoHgOFTSFwIeEOrDjraXf
	 wd1DTRyrNzOheUlq2X2fpDvYeYktdx0I/3B5Z7LOTZLfR22NfSMRT2sNVPHJpad8jtbIL
	 Jz/FhfCSCxb1vtx+ItCEcklv3Dy80LlA0mSMNWNaO6oK8PsCCvJLUKq2uRSasB4+gQfuh
	 xh8oRZ0d9htqAjoKGxJFG49W0TYhHuGF8DKY/dETat0QqycX6+c6gPuWMYAFXXMNF9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634814;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=;
	b=NNn24/+pVyGfwPoJoAxHkeqwh8Rti/M/1aX3jA1QlJQcdmZ5q1Uhh31rcQyzLR2zaGip
	 CROaOJtVriK9aHKo2rQZdeG70XrzZussJU5wY8WEzPLqp9lbKUc8Xuj+oM6iQN/how9Jk
	 df/8XytS3wLg3EAW+WWezjeWebKHg0PM/3/38QnCfhTPGzbhpBiN3I5vWaqHni47/x+1T
	 N1sXc5uVTX+3LijNXQ2aY61iyh242tGdsJ5J1x2jNLFQ0XFLdsFyb9B1Jbkp7XblqCNIq
	 I3kBbdc1XFkSOR5e4FhPh3Ez6tSEcrgo9wjT4FxI7zwVnM/Al5bjE2XoO1q2XK0R3vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G+CObwbX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wcy6Ufrk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B235D60B4245
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 15:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B235D60B4245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G+CObwbX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wcy6Ufrk
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpNKZ2991933
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 15:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=; b=G+CObwbX/Gmg+pZ4
	fognyXMh0IC2dT0SEtBOqA3W5rLWfbUixeNS9VHb+YeFE6zdOuzltBj9CJT3qljG
	Mbxn69/NvckEtVEAEUO2kkgzYKZpEU0Kn7almUd8SSgVKMVICe/7IEhwCGSWe/8m
	mj62r7hQfvurb89H6G27Qg42J2ABelwBTrtz0wmPAyJZqOl+QE/Y4nefcTbtrS94
	DdRyPHFlUnDSvwScaNjfDRvrHCnH1DbJORSFHqBK3pT5hDnYfCfR48BT92VfvEpl
	j4AZu5yP7YBs0DIuX7N+1TfVlgzLzCrR5YguDrSMjIn4/8kcbUaHYoArTNyzttJC
	zOyeVg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsavh6mj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 15:53:32 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc450e6dc2so2455531137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 07:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793634812; x=1794239612; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=;
        b=Wcy6Ufrkq+Y8ltAuJRUPYHqbcZlRyib+cZCa9vquHjVuSTGSbjie5a8kkJVezRbM3d
         xA/65zZT03Z/Bdq8WnDne9w3POonpbzgq2v8GgAR1v2V3y0N4ztQh2Hys7DQfh1rNaby
         n4gHT9HEtBrodrCgYRVgYyCQdlamAQqudS7syI3LP6H2BVM05BIkFvR7LIk7kE3khfuQ
         LoI92P42bgVMplpVvO6MdKUmQ5hAJft2qQ4K1woV8sbq4v2xflBHGVv+XGQPMlm5x88a
         IKC8JJNo4cSwTeVz9s8YhqINGc2wIeWnOxPS7k7FpE/q5HkjpDPKxIFmjR63p0hDs4v+
         KnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634812; x=1794239612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=;
        b=k/uNgyJxNDw8otfhfI13SPSVGZ/2CO9OJkAMreEA4gdL+IwDIV3QCztFGZacBo4oB3
         4NbQUqP6q/9xPB34VUSD+lzQQQdiJApAZnpyz8QCioNwQgGqWO49LXIcOn6GqUhvxLiF
         5YPQnX/h7AYONhZKOxoLzXuW6pKuopyt736/jDZsmpR2O5GDrOIL/NGxe3ssDS5MtiRr
         YtuI5UWxe1iqH/4166xOWSGCimydPbKWlf/U2ckRyC6EhwwWocI1p1SkXQOWVMhDdjDb
         dtjORn41/HyoOSuapOF58HlD88wBnuXPw1nshd7mkjhh8u1rbSkc72cgM5asQhnRUFFS
         o/Ng==
X-Forwarded-Encrypted: i=1; AKwUvBwk5jEX6teGuDpCkBYfUqqvmOgAwuRyCNxUcxclUTxBq4UOVbKjz34+uUBOeuZlLWka8Lrbx2aPM0tzkvWV@vger.kernel.org
X-Gm-Message-State: APuU4Z/e8p5BaET/lbGxtwEyLyNG/0UJ4YdzpNTkE2xAAhmoL+Doi7bl
	R22eCY3Bbx7ND+n4UkRav5ieJSyhYl7bj+hzjhFfJxOrv+pI5aMnWL2nQJytOr9LKsNpqaM4/05
	KV7VkKfq5w1YaL6cOxHT2/FOQpisFfd4EqS6fj+CAc3ZmlgdxrpQGf2sAJ7N9AGE9bC+L
X-Gm-Gg: AYBFou01zAElGEevHqa5Acib4BAALw43k/cJqFbq9jnjTFz0wUQ5n7UNzXh0eMQV3BE
	xYoiZQg2tLobs42LnFFXeavdeRgwM8oC2PUCLoEjLfFNiHh0y3Smt4Ohjv5FMiZIxBHGNsCurH2
	KZ7aifiTpPpYsUmRIgai1oc419PwCNWYIRlCevfueXMhaAycWCLrcGcxPYshpuVkWKFS4efyAlU
	04sBAlPy6bT+pKenkHfKw2KCjNxWuaUElMH41FFFWUEsjBBG+6Hl3xfNBvFtsHIU6QXKZhfPQJ3
	31y8XnTQkhYMthExrnsBiy1Zy43MCSDK/jYgeJL96JhAcK9Iot85xoDcrdFci59p2hzDAeihJnz
	SCN7abcYTuTtUhkjaiAnwZkArbzxgGpVesxW9RE3IY5bTmDCDLQewA9ukzzvqqaORjOS0e6m3Ip
	YUIc7Fcc04lMvRHKwQNyrdSFFaFBPskYyU4NkbsE+ODKVnNBo+ilxd9o9RjnAUM0+7ocn05rVPX
	TOQZNOE5+mlc+AUsK1RMzlw8UBe
X-Received: by 2002:a05:6102:3ec5:b0:7ce:6289:314 with SMTP id ada2fe7eead31-7d07269900fmr4433987137.14.1793634812038;
        Mon, 02 Nov 2026 07:53:32 -0800 (PST)
X-Received: by 2002:a05:6102:3ec5:b0:7ce:6289:314 with SMTP id ada2fe7eead31-7d07269900fmr4433972137.14.1793634811366;
        Mon, 02 Nov 2026 07:53:31 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a7d1sm20700323f8f.38.2026.11.02.07.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:53:30 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 16:47:38 +0100
Subject: [PATCH v12 7/9] arm64: dts: qcom: agatti: Add OPE node
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
Message-Id: <20261102-camss-isp-ope-v12-7-702254689feb@oss.qualcomm.com>
References: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
In-Reply-To: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
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
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX/n/IoW43jQ+A
 G7LVc5blCCUzF5o9tS5S7wylorQCNw2tLlLmC2XycSjrKnfIjf3KuAS1vJJsoEBrM5YfGYM/W7w
 BhL/W2T1CSunqopU4MdPvafsOsc4+hsjyc+XZzqyETn41qn6AeIfEViMDrGKKfIMHGJkcvOe6PZ
 VVAQQR95gqzX/iudKCcD/+/wbCh+E1UY4kDQCk12Um8LS1PeNb/EDjogfeOek6U18ix/5r/dcZb
 0W8yt+DwDRwu32jX2NNL8ygL10F/xnCqyrjpv2MI7Tth3flt3B3vwytPEipphct48TB2mTRvzP7
 HYgeXQ/ScIeOdO5NpJT7UZmNQN2bvvpj3N4zCP39GtNu1C0DAtHE8+EgK91Ko4LdzIJq0DAUz/c
 46GOv4osVpJSIL/16WNHTwxfSCpA/Iuag//CUcbhjKvLU8iKRkTCeWTq1Ib7VsvNGEzGOz3O5u9
 +LIDObanVbpZQDbMcDA==
X-Proofpoint-GUID: peKbixBlflIanJiSqPkXm0oyIOgVmrix
X-Authority-Analysis: v=2.4 cv=FZmiV5+6 c=1 sm=1 tr=0 ts=6ae8b1fc cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX3WCgpJcYU2Hb
 oATiyeI92ibyOMDYUwPk1wdLTmKDscChGmtKiuDmNeXG4geZP4PSU3bRxCdTWqmCVI/W8E28uk5
 TZWOt4d7V2tU3n1xpm89cSVxwVbvgdo=
X-Proofpoint-ORIG-GUID: peKbixBlflIanJiSqPkXm0oyIOgVmrix
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020063

Add the Offline Processing Engine (OPE) device tree node for the
Agatti platform (QCM2290). The node describes the six register
regions (cdm, top, qos, pipeline, bus_read, bus_write), clocks,
interrupt, interconnects, IOMMU mappings, and OPP table.

OPE is a memory-to-memory block with no board-level dependencies, so
the node is left enabled for all Agatti boards.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 77 ++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 32d185d0526ffe109d83fe92d9c54f21bedbbcfd..dacb551fef530b73ca5265eb6aca39b807e82382 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -2026,6 +2026,83 @@ port@1 {
 			};
 		};
 
+		isp_ope: isp@5c42000 {
+			compatible = "qcom,qcm2290-camss-ope";
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
+			interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+			interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+			interconnect-names = "config",
+					     "data";
+
+			iommus = <&apps_smmu 0x800 0x0>,
+				 <&apps_smmu 0x820 0x0>,
+				 <&apps_smmu 0x840 0x0>;
+
+			operating-points-v2 = <&ope_opp_table>;
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+					<&rpmpd QCM2290_VDDCX>;
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
 		mdss: display-subsystem@5e00000 {
 			compatible = "qcom,qcm2290-mdss";
 			reg = <0x0 0x05e00000 0x0 0x1000>;

-- 
2.34.1

