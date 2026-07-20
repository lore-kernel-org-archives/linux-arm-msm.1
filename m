Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA39D3F0743
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 10:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784544929; cv=none; b=J/JbY+UoVXzsHFBY7+e9i4RERd0u5vSZkMp/5Dv0+yw9UbdI0KrMU5MW3a0ucddrI4qxHZIQRL+4cuSPQSfzlSOC4Wtce7ja2HIztx4Dj7W1BUCNhgeD4mzbK8JHOn1OH/kuzzLah3KBsc/pQJLXEIa8rNTWP+F0E1eYaZbjbaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784544929; c=relaxed/simple;
	bh=B9tIi1Yq9N4iptXiIJiXGVe4A5m4Ls+9BzoDaXTp67Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qdJXwrApGAsE2SQhmkwMH+JLs2XUErN6ccSRivuCodpZr4TDsl2+Ekhjn6aRs+lfpvfIC25OsqECsKZLdtwpmb4/OUnQpsuBLblw8686tspUWNZy3pKGgz+/p+3ASTUgL/tz7S51H6dulgcW1fPQy+xKg6qtgCnO8ch7TeIewwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dhpzw5Zy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kVcqrW6Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dhpzw5Zy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kVcqrW6Z"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K9wWvS2296486
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 10:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YhI53JeH6R0sjejUhJ2kayhfCOho2JDi930X3nOJgc4=; b=dhpzw5ZyIlOaS0f9
	VGSb6sRZhbiCgdGn46GYPggmzE5C8rgyGxJq6UhZJt/3GUp91N/gPzxIfK1kx060
	nm7fzekbV2BEVBgJD3Xnh55KpO5XuXaFWjKOEDcu7WD+dMNPvVSkTGW77Xa5dFgP
	YHT8n9hgf+chnmuDCf3BKbzgwLldJWgfslmh28NI19lacd4NbSZd6A8Px4PQ5axn
	Zpq1gGQGgLUPkS/ssm0WZfpFfcxlfAVWuCm1Gy6pnxE/dJauE3MYWJ1S+DwDuKVS
	dyq7JxSzbir4odVD246e/qOUjoY2eIvETXelVE4u3Au0xkNzmzCJbsFffZlQI/j3
	k4zQcw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhhgyr64q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 10:55:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-384419c6c74so12765295a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 03:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784544925; x=1785149725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YhI53JeH6R0sjejUhJ2kayhfCOho2JDi930X3nOJgc4=;
        b=kVcqrW6Z/rc7VtitmBDF+EWBFqUNMt8RwXYqGvFg+Z0F6Kt6v5xfVH0Er3NQSYbP9G
         /iSiaKupSYFu+5U//0M1k5H6pembw2h0kadRa4cgu8F5FdKtSmYgQwTj+OF43BXwIWhB
         MWpYSmT2FXZoWCFCrI0n/SI5rMteUswCyrJQOX2FuC00UxtCKAFaD7kmfs0rXDAZPTxj
         c5M3x0h42paCxKceSo1j2v87aV5AFziDm0Ip7J/uTb4+jSt2LtNvACY/KVkxe4xNb0HH
         zFzBNPS1OvwLcBsJ+JeYc6z5x62ihL2mDbWp+gTPuG2rDg5+meTi6kjUWEySIFStKJOf
         dyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784544925; x=1785149725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YhI53JeH6R0sjejUhJ2kayhfCOho2JDi930X3nOJgc4=;
        b=aKxj669JprhSU4NfgyA89PrPHnAqpIbMXCC9gDHYTlEvnWHpONdocEkkwjwkpoiAeW
         IBZBUAFvRTu41AQUV9XV/YrzlCcuQ2TuGwaHomJPtx0SNzZTvLqSeLQ5j8/HBktU/5gO
         axa61i+RHUxXirvobpy/zCKZG1waFQ6+H3NNXdAmgvluWh7bsAvjJOdxSYwOhdP7GViQ
         zUtBwTg0lMwH4aBZHij+fU3Qp6eFglZ8NyglBDl3HwvJuKcvOghci0pG3g/BLov661F1
         XWhR/x8XbHURujxYdUAT9y3eP/2gegUugD7Fo6GY1y93MsJwYQG3bRQsTRsJJJCAc4z7
         Y6jA==
X-Gm-Message-State: AOJu0YzHaTz0sXTNDF/QBwxdQDJHBcSO5bR5G5J1GIM6u7vmyivOUPkV
	JPtyTT5eiE2XhoUtJ5hfod1YlLvlHBzPi4uGQNxZTKc1/YkHA1MF051iCuMD8A4g3vrEPFcKmHx
	zEBY6oRImt3sBIlhwWKbcUf0FZu4gSXgO1mhPdAqFOj+cRX419IzKZ0rilIO1tCxb8MEfuAdCxI
	8=
X-Gm-Gg: AR+sD13bN2f5LfL90ZRF+BdGmd8fv8W1jRfxMsCFG66SHvczpGBrWZOgrDO7K4krCqA
	5PKTNRp0x12EtzYw1M0zgVUJffItAquIZPZJcvKEWscD+yapWy+ZQX8JfK+J5sHg1Qy24BaFbKL
	z77nN2BClVHO56CBea7xsPQRkGaN5QmIIADdEiL/58GjgGNdVW1ZHUN4iLpHabiw/RoRAif5/zw
	QgKHFJioUx8cN4gyM88DtwPFJu/94lBaGBJnUxbvw5rsmT/0xTGkITTqtJP7NtGkWzdIDK6PJr9
	BUISDE79i5Lu5DsMqSOcZ9HY+BxAm8/OuFcK4x2F+smzGjG5AXRV0TV1Fi7eKjInhHBpG3K0jbh
	tDDn13YCUHhAXz3XfM0zSUtZoEOK6lw==
X-Received: by 2002:a17:90b:5606:b0:36a:a16b:5f6d with SMTP id 98e67ed59e1d1-38e4b41f4ffmr13975161a91.7.1784544925427;
        Mon, 20 Jul 2026 03:55:25 -0700 (PDT)
X-Received: by 2002:a17:90b:5606:b0:36a:a16b:5f6d with SMTP id 98e67ed59e1d1-38e4b41f4ffmr13975120a91.7.1784544924916;
        Mon, 20 Jul 2026 03:55:24 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4b20df7esm5661431a91.13.2026.07.20.03.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:55:24 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:25:06 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: shikra: add vph_pwr and fix
 supply parent mappings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-pm2250-fix-supply-parent-v2-3-60ca47031b50@oss.qualcomm.com>
References: <20260720-pm2250-fix-supply-parent-v2-0-60ca47031b50@oss.qualcomm.com>
In-Reply-To: <20260720-pm2250-fix-supply-parent-v2-0-60ca47031b50@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        jishnu.prakash@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784544905; l=2138;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=B9tIi1Yq9N4iptXiIJiXGVe4A5m4Ls+9BzoDaXTp67Q=;
 b=Cj2oA8Qwy1q76SUfdGkK3wNgCZSfSs8wFYvZrN3Bz43orBKRiO0+1BhneWkIRXpxiVpf7FGIh
 jk0VHigHlrYD1qyKAUBSdd/lh3/2efU6oWlCSvpQk7TY/bZQKDpowGJ
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEyMSBTYWx0ZWRfX07CToOk/0yrK
 MySjILrtTJnXSOWC/8DWNsuurmWfvo3mOMmwDtwbmR09fdPkE5+fz4U8r6YHsHCf+qUvvnCxUok
 YNE82MAkdf/pltor2a+e0RN0+3naeVc=
X-Authority-Analysis: v=2.4 cv=LK9WhpW9 c=1 sm=1 tr=0 ts=6a5dfe9e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=zH_9qI9Ef9irUORpi8EA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: hP2fmUwpe2lSZdof5lKChPUksP2na_m_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEyMSBTYWx0ZWRfX2niFWCt2B/Ki
 AR4OnJysg8bDsRN5GR5yN5tG1NZhnGT/EfnGtVEwtZp5JBC0ZNuAxA3Nr4GhPd2cSRzVzd3fyTL
 1NFPep6d1GcOc+VAcgcG54Dw3TPY//nTkeVdbvu09oG375fAeFLpxXXvJzAXskhY5UXwSpTyPry
 uJJNjcb5ExPztC51/syBaJ/SfD03IPTLVEKFbbHhtgsjasMdctzSpH3PUNkFJjdjVlan5oy4/aq
 gcprtp5cy1BQtSEOZlSabu7rReIgwP9zXcR9cJm4PYFV0WF9F/pSU7jQaLAYDvfuMJCKu1JaI2X
 LKSFnkFG5YuEf3HrtAp7/ppBAoyssGFKMaFPieAOMIsXhUbtDVPGkb5ENvHLuH/qw3Pq5okd3j+
 oEXY2iHSNv4o0bJvgj1K+zPT1rffM7kiOHCFS35SXGITdHn/FkrOoJT93n08Ztf6MJtytuXtt4i
 Obg37fX6vDUX7ky1gjg==
X-Proofpoint-GUID: hP2fmUwpe2lSZdof5lKChPUksP2na_m_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200121

Add the vph_pwr fixed regulator representing the PM4125 charger output
supplied by VBAT, and add the correct per-group supply properties
matching the actual PM4125 pin connections on Shikra. Also add the
pm4125_s1 and pm4125_s4 regulator nodes.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 33 ++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index dc3861489f64..c7f63ff07283 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -27,6 +27,16 @@ key-volume-up {
 			linux,can-disable;
 		};
 	};
+
+	/* PM4125 charger out, supplied by VBAT */
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
 };
 
 &pm4125_gpios {
@@ -52,12 +62,35 @@ &pm8005_regulators {
 &rpm_requests {
 	regulators {
 		compatible = "qcom,rpm-pm2250-regulators";
+		vdd_s1-supply = <&vph_pwr>;
+		vdd_s2-supply = <&vph_pwr>;
+		vdd_s4-supply = <&vph_pwr>;
+		vdd_l1-supply =  <&pm4125_s4>;
+		vdd_l2_l3-supply =  <&pm4125_s4>;
+		vdd_l5_l6_l7_l11_l12-supply =  <&pm4125_s4>;
+		vdd_l8_l9-supply =  <&pm4125_s4>;
+		vdd_l10-supply =  <&pm4125_s4>;
+		vdd_l13_l14-supply =  <&pm4125_s1>;
+		vdd_l15_l16-supply =  <&pm4125_s1>;
+		vdd_l17_l22-supply = <&vph_pwr>;
+		vdd_l18_l19-supply = <&vph_pwr>;
+		vdd_l4_l20_l21-supply = <&vph_pwr>;
+
+		pm4125_s1: s1 {
+			regulator-min-microvolt = <2040000>;
+			regulator-max-microvolt = <2040000>;
+		};
 
 		pm4125_s2: s2 {
 			regulator-min-microvolt = <1000000>;
 			regulator-max-microvolt = <1200000>;
 		};
 
+		pm4125_s4: s4 {
+			regulator-min-microvolt = <640000>;
+			regulator-max-microvolt = <1408000>;
+		};
+
 		pm4125_l3: l3 {
 			regulator-min-microvolt = <624000>;
 			regulator-max-microvolt = <650000>;

-- 
2.34.1

