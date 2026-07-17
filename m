Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FBF3033E3
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 05:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784266341; cv=none; b=qXnfGMTX+Xlh9pxSk5/oYhbcaYaR7aIh5fEha7abJvfrTlLLChjwCm6d3JzRFJL41iRN61rTM2bCrysomzd4WnlO3/Z8d865zx9cjtwib7KNU/6/1Xzhr2scrLlZOFje2GNPkF6GJRdyRxB+kTImhz0mSNLgikKUWZVW3tKSwlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784266341; c=relaxed/simple;
	bh=5BgMmkdVjopC7iz+UFY1Q8cQUXbJ6LxqhIzuTTGByDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vw94SvC0XW/7Zn2zo5Zwahl42OfWqvwzxZbDZKtlsR/vMna7ExrI+8/ZKe6HXK9NukLoxXY4HYLKcXSMwZDJgfwt736MNwUsZtlarN67nVezv0D/9L8qgai39pCNpRZo1I01F5X/UsT/CLKGSfp00cyY0nEc7Cq5Md0tFmPCedM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mTWq9yyk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PD0DCpBT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mTWq9yyk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PD0DCpBT"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H33dAv314095
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 05:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ae5u/dHS2SFjXOLBjsZuju0TPA5cUawbhYuxTtlOwac=; b=mTWq9yyk0tPN8+lA
	1NJ3GbskqZu67pMX4YLb05/HFWLXrS2D9NVnUsO0Hp8PbC7Pobj4fa5QCmtQdneK
	nilUKOPIgCeQPvG8HwFmQ4VSB6wCxNiy16RmxwFXMUMArFbGdoGyarV8D9RpXDLX
	dz7L0r9/UutNJnG4KU7n2GFSPtMSE+0fpbc2Y5OgvRHOZ5MdNhjDTYQUywSH63IT
	DeIMsyXqoy3skFsZPwfmQ7xoMz4xbwN5jOWC7IQBbiiYcoylPn2HuL82rSzhIXfl
	xD8+KcdUKqC4FmcWSDJO/wcnONEqv1BAVJARt5c3XoTEV6GXSppd7ob2RoeNGe6i
	1OSoww==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u8j6wp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 05:32:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cd01a14e81so109145695ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 22:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784266339; x=1784871139; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ae5u/dHS2SFjXOLBjsZuju0TPA5cUawbhYuxTtlOwac=;
        b=PD0DCpBTPtQU/nalx8qDPmj6H90nmiU9hlStWx7ece4sKoGJL96Yq33x+lfu7+YilM
         s5XZIEHiTILPLc/w0/IUrd0msvdGD/V9sUTOhW/TJl++6oqXAR7yszyPqvk2BX3MyP1g
         9SsF4AZcNjmBQyuayg75Evu/szq0xANbOo6c7X+o+2FS9X9d2b6CqZ6ezXf4PFOsEZAX
         Rbu+6vEXdnZipnjx28uqp51+WCq0+DxpDhqOC+8/i5Je8gQYtwgLVIYYCwqCE/1X9xog
         DyDOg42Ng7wUBnfkJnTr4Q4G5/rnsWBfiV3+S21FzFPtgdZq9xXRvErt9FStNUkXeNIH
         CfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784266339; x=1784871139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ae5u/dHS2SFjXOLBjsZuju0TPA5cUawbhYuxTtlOwac=;
        b=YzJRnyMgOzgUcb+imXSfQYSopgnHBYd7ODtd46BLqYNqDaoytjXJS2EmDekekJv6FU
         v4hYeo+4prdQuNbXREMQNM/hZTWTrvNbzfow8XzZ/bXIEvB9GsEcygmDZnspMScQmVmd
         M5xhcJ2iD+5f4srt6NIzMMEBvoMIsO9clxCoC/GpUVFyg8ZvgfejDKbMFisXXiKfo3QV
         Y4PhTz6eovNxJlliZc3CcA7NN7/a1Pp3e3kPeuiAglxvaUqDneCKr2jDGeqsJj24BuRX
         /ZgIGZxRzadZMhMy4OCaKro3KZiqH+ACXSuKYdzVh4Kpv1Sk6yDKJuf6VDuiLUXPIqbH
         P/JA==
X-Gm-Message-State: AOJu0Yx+H/2u/QuJi/gh4Li+dZrOQpx9ncWB2geooYOc5MKuuQG+fWW2
	a2yu0kJ8Ox5Ia5xmP+BiBMQHShW1FD6xm8/CT05wr7n+Io/7W2es6VBdKBBJEdBco5yM6vc2KjJ
	q5YIKyQGbiJeicc+hySMoW0WQfPoQlm38PUKLivuWzyaboPKeoiZvlDxjuFOun6bDPDk=
X-Gm-Gg: AfdE7cl4cPnjeTknnVlZx5AD8+4G9k9robytj7qwDAs+TCW0H8wUDsm+vEVz/0xboSt
	Oe/vOZ6570zNu97RSGLryeav+T/ZAPHOqcK3jvvA3YhXrhT5nFcJtpr3VcWTmEG10zTuUNvrJI1
	uGzso58grIWS4T2+XvUwyIj9ORQewzlXWxfhLvtaYvBWEwE+NmTyT9evpSlzV05mIsDK1mldGWl
	k2b64JUERCWIeUkW934s6h4DCRCE00wgymDGO3z+Hmg9edET4RBiN+NR3TkhCjqQbUgcUk9v03A
	TrqyUZeuay+HGxXCygJpuAOgHUmzy/6WkKgnkgMWJ4ag0ZRsOo3ip3n15dFWftfMzNmH4CME1dU
	lc2xQuwnhMAo4vOb6JqS5SkQnFmwtvA==
X-Received: by 2002:a17:903:4b43:b0:2c0:a555:80d6 with SMTP id d9443c01a7336-2cf3481d1b6mr12935725ad.2.1784266338830;
        Thu, 16 Jul 2026 22:32:18 -0700 (PDT)
X-Received: by 2002:a17:903:4b43:b0:2c0:a555:80d6 with SMTP id d9443c01a7336-2cf3481d1b6mr12935495ad.2.1784266338382;
        Thu, 16 Jul 2026 22:32:18 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ef6asm4189885ad.9.2026.07.16.22.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 22:32:18 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 11:02:01 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: shikra: add vph_pwr and fix supply
 parent mappings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-pm2250-fix-supply-parent-v1-3-a6213a42a3b5@oss.qualcomm.com>
References: <20260717-pm2250-fix-supply-parent-v1-0-a6213a42a3b5@oss.qualcomm.com>
In-Reply-To: <20260717-pm2250-fix-supply-parent-v1-0-a6213a42a3b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784266321; l=2074;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=5BgMmkdVjopC7iz+UFY1Q8cQUXbJ6LxqhIzuTTGByDg=;
 b=R19g5XKXSraC9ySkxGTtzK75HRRkUZhAD2Wa2egasHdVD/2jf2hShXsPsFSVpVTKCd516U/Wn
 7N7f7i62d/dCxfq9Mdlw7frHbrYPlYuKQvBJ+XoZ8qoHA/YCPvPdxbv
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-GUID: BD8qjgd_MSeRmF5Ia0P1ypSAZ0ttYSvF
X-Proofpoint-ORIG-GUID: BD8qjgd_MSeRmF5Ia0P1ypSAZ0ttYSvF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA1MSBTYWx0ZWRfX7bqrxP5XmAvm
 F0XFmSne+TFm9vT+y8N1urSS+efdp+VSD/wuokBOkvXBO1cf2grrc2AtSm6OxkQzqlN8htM8q2K
 v3X5yclT9ZKwf0jt0JmJ63liM5XdpXw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA1MSBTYWx0ZWRfXzFsm5L62nBqs
 PP97qjKdmaUvt1OoEqWQRuy/e8qNHwgHcWqpU77IbhsBtT5TlOvEJLofDvqLvoZ5qNNhs1PgKjJ
 oJxIurBzG3VvrIxbmkBa6ZWfEULkYIGErXAyEb4XMqmslbAazm0oEtExh0py9ZdV3m2vH5a+4Fd
 JjofB8/wbXbHtdO35stnrgAN+nvRCnOjj1OHgEebXm3HhCKbc8zR4OIg5i7X2rzwpIe5nymXIga
 HSaDvSJk07XDTIzuv6aAmV4w+4+iWFDoUt+7rl3bYJ+gPY6aal8EWXtUNSAileCA9RxftV6sNpZ
 ePvyiKkiDoq38zCW7zbSw2pwA51iUbWHKP+u/+zsu1QrcriWeXH+V23PNhEuwe9AiBLXG7cWJL7
 7fIATucX1xbmzhrlJTUrN4IqQC/G529I2X2fXGrs2XgO7VNricMjmGgd/lWFQSPEgBNu7GzZL/Q
 gjdeJNKff6MkkRRe7SQ==
X-Authority-Analysis: v=2.4 cv=TL11jVla c=1 sm=1 tr=0 ts=6a59be63 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=dptGR-0hQdtlKm4J1yIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170051

Add the vph_pwr fixed regulator representing the PM4125 charger output
supplied by VBAT, and add the correct per-group supply properties
matching the actual PM4125 pin connections on Shikra. Also add the
pm4125_s1 and pm4125_s4 regulator nodes.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 31 ++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index dc3861489f64..6e4c23a730fb 100644
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
@@ -52,12 +62,33 @@ &pm8005_regulators {
 &rpm_requests {
 	regulators {
 		compatible = "qcom,rpm-pm2250-regulators";
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
+			regulator-min-microvolt = <1396000>;
+			regulator-max-microvolt = <1396000>;
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

