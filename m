Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768189;
	b=ygoSvsM531wDJNjY2QunggCkTn1O46VEt4v7jNOzuxfrGaAnu6gve1NAu3Ifswc4EWtA
	 36h/cMsezHqQGoc+jsuhZ/EOcRecKdRzK1rVk3H8769d3TSWPGkHDVL6Mq3OX4++WDDWm
	 ZQDoBM63nzSykWlo0Xxd+OROdHz4dODGY9+yWVT7RVqu9yx1n6nBg78NzSbTGBJgw2dcs
	 YK427CtM1dQX8kqTIsCYMlYlj0wLX6oa1jvPedqq5yven6mD7acY5hNJwTi3g03g4NXsW
	 plvlKblF/F/B0oR1LqEyPWjnboTdkCh0KTVrZTqfSShNHMNTQ6WZKmHQIinzKCkR4TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768189;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vjzv0biNUKG1BiKaowTeTkIFJcvCjq/9OvYidNdvtc8=;
	b=WidiYiTxd/XUWtBfjVdO7wUxTDQeMQwcR0t9dReY0LqNIbiXdobbi5G56dgB/VH31Y6o
	 IDTBBlvCQGZYDuhUSra5ZqMjM03KxP70EXG5O4UOIWb1S+Oha5zQcESGyjND+/4FFQqSx
	 +oPFZSxVpiCfBqElNIMZOalxpShqRBepnWz32reKPvN3CGx1QIEDLTsfp2CQ5/eYAgGnt
	 y3QK+AJs2Za+8aeLpFyFDB5iae9CA63WYbI1cJuXmK70jzGdi0ETqlm+BZQMdSx3fQz0h
	 mI0BDhJJIpPUTvaZLOIZ8FG+RRDgewuudAmib5uCrIa88D8Nv9txvbe5ATW3K8R/ZAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gJW3TE2b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jA992zSR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376FA606A31A
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 376FA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gJW3TE2b;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jA992zSR
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6Awv2999836
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:09:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vjzv0biNUKG1BiKaowTeTkIFJcvCjq/9OvYidNdvtc8=; b=gJW3TE2bIskO3wua
	/3CBzsmht76Yuz7pYUp+wSeoplyYb8Pg2ILfWDGyud3mrglqoDcPm/j3KramEURf
	D711hGci5sZyJsQQ25QWjgY8hiNT6YvtRzFuD5GnveCrS1Cb0Ts7ydhP6zHyy6VR
	EEKonPCKU9hlwPwncNFpd0qvpauhuOczcZvuuwCGnjnkIdDCSL2SEOM/BMEEPZ6/
	KPjw0BmI+ssVfbKeE+CyKvEZFSkhG3A+PiIZHt12RumFIHSP8UWUluH8maGQIpD6
	LUhA4SqYwPTf2Ts+FJU+lZt/bNo32x3XOMX78ACvLYzL3QmkUql082SNfzD1cw0o
	JmUhgw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7cn0mq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:09:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53395d51187so15487581cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792768188; x=1793372988; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjzv0biNUKG1BiKaowTeTkIFJcvCjq/9OvYidNdvtc8=;
        b=jA992zSRmjtComup/Fjm7SSk7nfKKnbF+9AN2ffLQ7qT9H1YOHcpvCTGeszAkmyb6V
         pjPRTQ3UYl5dodeRC0jp/o74nxfqbU/hu4A5v9sbl0Vbfv/U35Dly9GSG5wc3KN6if0T
         NkSCY/l/Sj1y0rekcV4nozqFrIX1BSlIwX+VkjsXHsIT3iFyxXmOwnVNIoI5C2Q7Jalf
         P8TC6sU32t8sWxQJkO/+zBPcVJwfCspBhN0o+rjpSqxXg17PnN1sAkBYG0f+jhYmBMc4
         w3HW3XLapxRRwVSa6fjrjbmvRw0Q+4IILHDw11vzYlAqSYtT6N6L6l26ehvRCFuuv4m2
         IhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768188; x=1793372988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vjzv0biNUKG1BiKaowTeTkIFJcvCjq/9OvYidNdvtc8=;
        b=AydcdS0lhjfTS8t69NIcLmRzlO8ngfl5f9MscP4q77XGAzVRu5dcNWINmCLGe4zqZe
         CM3RoXWNtBK9lFBgfTZAzatCGGhyy+6Qf4aayDxvt4PrTUzMJdabNEJ9aahcDeUpnl2x
         WAGf7NEkAoew4H3iiGtGYobEG7ZxV4/MhUxXMkJs4bASc4HniP2k22sOu1jOhWEUXP2w
         YEnXya5DM+L4M81QlqVBbCvrbEqrUAnhBHuIVnZO/OSeDWGsnjXw6UCJGYbmL4wFDx9n
         sp0zAme9iL4T60UcKw4wK5FIVPjuQIcLeAIXWPOwetmVDS0BHbTcp6s9E+RrYUwflCMp
         uX3g==
X-Forwarded-Encrypted: i=1; AKwUvBzQo7rH3eUk+UlJyqNf4WNNImbu1RZGbTKYAXZKuWH8YNC2xjbUssc9NImZCpQQe38qhGikDdRyP+VCxqMB@vger.kernel.org
X-Gm-Message-State: AFq9FYKJuDr03+AKFOygfJoG0oRVAHiJpAtNC3Sv6jlSYXLlXgg1Bn+z
	WVdJkW/7HwJGeiBO4thopwHHAsbkOYwkf4yHxfZDXJcMvun5irtBtXBr1EeRz1PhegCafrH0SV0
	VD0RUT86TCkXBrwPr94OlE0DikFLAklpVPiFwryJhbTlaghCffSCePiu3VANcPv3lxZiu
X-Gm-Gg: AYBFou1/Ao2NSlt0/YWZFFog2AY26ChEcVjgQLYxuD/86NBp/YftFMRXZcQSBQW7OEM
	o5mYARYijFiGVWmBbSBtr/oVJe0Jw+p7zpv4lYgKfkBIth2h9LHQKPzAbTK9B4y2K6sxvlLKrvk
	Jtkj374T8jdw73/rwjlbVPLlGOAw0RcdtEWl7dfGCirc83MZSEuXjgG+5RNevvYRkq8JEAuenaY
	59nlZ/t798Fm3blzcLsUfpH+oumJyU1mKFyBFXjkWiIliC0S5mnVQKfH8qgy8/5U5Q6uRvwj+WC
	+CRfLI9lcycfQbReVFrwqrWCMVdGIVjjPHV7NiuPHY0y8Py/8y1feX+RYzv6LeYwaLGTm8jvsgH
	xEGKjLllNT2bT68w+D21fqNDXQS/iL84cjEUv9DDikhno4/f/zxMwm+v5E9+T1BTs1Jq73O4JTG
	cchHF+ymL3S10NFPtVErZh5ythtlnWYaKiCAsu3Wi9l2yGRwMb2J0=
X-Received: by 2002:a05:620a:3193:b0:93e:48fc:aa85 with SMTP id af79cd13be357-93f6f964439mr447298185a.43.1792768187549;
        Fri, 23 Oct 2026 08:09:47 -0700 (PDT)
X-Received: by 2002:a05:620a:3193:b0:93e:48fc:aa85 with SMTP id af79cd13be357-93f6f964439mr447292385a.43.1792768187049;
        Fri, 23 Oct 2026 08:09:47 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d0fb:daf1:3106:3697])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4040d3sm323962f8f.27.2026.10.23.08.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:09:46 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:09:18 +0200
Subject: [PATCH v11 7/9] arm64: dts: qcom: agatti: Add OPE node
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
Message-Id: <20261023-camss-isp-ope-v11-7-0c2937195298@oss.qualcomm.com>
References: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
In-Reply-To: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX1SjNxjohwllb
 RGi/++SScP7cSoTw7TOF0XcFj5R4kNpIrvTvv6ou9nsIDJDPwdfcdlqWsOqhpzE/eviu5ie50+a
 LMb2K7CbhWJa6NRdAFWNYpU86FSf+OHUvJC/VzTmDlA0cJHEvjA6wN0AYq635twR2Zp6HuZTkRn
 I4SkQoXNFKfhAIkY+pgAqp1awxSBEWpquAxSkebRNCVwrAn5Sihq0IxutS88EZoJisULHCLjHMN
 gGDTQ2WPj3i+m3Ww5jW/Guf9IX8NGq57cRFSEkb41X8HZh8VafOujdPR/jeaH3aNQg1LW4N26gP
 fwBRmVyiZSz+7m6fgUxzerVtmg9HztyymyTooXgKZVWISjc2SKRW3Vd0n72TAmIGcBjZsJZQPsN
 oToqDIqRzE/qX1Vb5gve7OGiuH2VvVRQe7Pf1SCloZIO3+Fo91wTfObf4tIa2dULhmHjKDe3wmN
 yYbuy1rzy7taT/0r50g==
X-Proofpoint-GUID: cqgMCEkGc7InNMBU9F4SRuVZ39uCDjHI
X-Authority-Analysis: v=2.4 cv=a9mlZkSF c=1 sm=1 tr=0 ts=6adb78bc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: cqgMCEkGc7InNMBU9F4SRuVZ39uCDjHI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfXzBXp+OnCimkj
 2mfKjriYMfTx/pVyzTlOALV0pmx2f1uXLK7A4U+YVRaYVVnnG8InvhyIap+d/bLZaa5KGdcP1TO
 gMFpkZtBkA2qT2Yvx1AxequcCH1FK6U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230059

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
index 397d61a8a27c2505833466bd349acc27ef4ffe0c..7746c58b5b1cb25206e72b888b7559cfe27553b9 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -2020,6 +2020,83 @@ port@1 {
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

