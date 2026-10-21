Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792549889;
	b=E34g5yTBT8uDXyKDpUx0fu7u1zJE6N7z761/hrLvRMdxDH2sGDNGFZ/YkIdyQYCKPK/9
	 TfCi0ZYSBN8xjlCOn2/kJn9dA4u0cNqOE75o2Eq1w8vWmvQ8EGTCaclrpIJaqjCLkBnf4
	 Y2e8hrFxgMyJGS/9LQWuuMTbfXgOjCmioZlMmZvHheukR9a5QIKtyKiMrC5r6FTdAjBT8
	 4bgxr4gJpicf9NJEe6RWqr3i4LMvPWsJ+YbVfC+SG1YVMToyXly1+QaboFaVo63J/hLl8
	 uEM9M+SdaLkC7n/Iz0BvGcTFmSNSva4+9AUGggJtXGjdBRgnKoNHfNHG+cK4zBOO4uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792549889;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lj0kmomju7m5w1CpEmOSa5jPN5H54nN/hxyFjisk2rg=;
	b=vgiVio14yHKeHHXA7CtzyIcSEdn3MIQQnKg8hA2Oqc2567qfFiudpXAtHjemBbfw9IMW
	 qAvfc9DSMsLR0hVD8pa3T6vkBF3YqYaooUr+LVMC8tX1iCry85XsRxG4TvjuxoxMEWVAv
	 iecUqYTDZwTquDGSBkVwtgKW5wE27jU42DWcswR85ZTAUjZQ8roOx6xoE5FZ7ysrtiKlM
	 eccSbCz2JBc8wQSJg6vNFO4sjvnh/eHd/4dORMaxU71JvwoTm0L1MpRHoLPEu0Jj0AU+O
	 CIC4Wl6DfmGS5gegpSU8KWTJkCiD4Rvtfz8N9BeZuqWafv+8JQEtF7cds9tIdc2EPQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FMt1JD5J;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="jA5fBx/9";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3D4606A327
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 02:31:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB3D4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FMt1JD5J;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jA5fBx/9
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2FEjf3116885
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 02:31:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lj0kmomju7m
	5w1CpEmOSa5jPN5H54nN/hxyFjisk2rg=; b=FMt1JD5JCDGlx4wCpYWoAnHdRHf
	YVxX6KBCwsnZcZaaBrgok/Cgb2z/OgZl9JJbfYSvMcN1o0qDiR748fLX+neH4WST
	oScfI6DyiPUZjv0e125VN4MEM+ozQn4vSdqsIL6mMpEfv94ybwj1T2lf6p1T8iUB
	JCy0rJuDoTvlVSCaBSGM0EJt8mOpzwLmHBdTk7EkxfkfS5NZiVG9kGm4ZcnsC5NX
	1cuANzOjT1iK1gT5s2SIjXBbh+QpNUPoeq3vJPsHMdkjuJq5YidYxqJXBiWvloHs
	ZsbbisDFp4RIvz+DOfp5H5MtTTTkd7zVEtNW9QYSN06e10cKpokwfpYgBsA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9hsjku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 02:31:27 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so544971eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 19:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792549886; x=1793154686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lj0kmomju7m5w1CpEmOSa5jPN5H54nN/hxyFjisk2rg=;
        b=jA5fBx/9SodvW5dYbJ1b6xj9nOIepLWRfEJEXFnoXGhSjF3z1LUsjzkkihdjCgdjqb
         JoKqRp1PYCxfRz/RQEs1buK5tA0E99l/lpi1uEZ/iM9K6Qbi2ICtwUG7ki0H9fSARV8y
         1Q8EgDuaMJClDF+YLMIWdKjwnOBGAxJElwXNVrJzLTjadOIwgIKaBFetJ3ZDDHlbHL7W
         WaG3oE9CO3lxyEDF+fOPJaCnFbb0+9/5LhYdWQKFyyV0qlf5MMWI8onKO3kIXrCAZh0S
         HDDnbkGWcZk0gEl4IAvRaxvEkyPMbLaRO0UbS2WxW+ivF0nd2SCTkysYm5CqfoaMz0oH
         JgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792549886; x=1793154686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lj0kmomju7m5w1CpEmOSa5jPN5H54nN/hxyFjisk2rg=;
        b=Ir6fUL/PTxqClxZUXT6kf1yRrSKSGhxA94IYjc7iZu4DvBrAFSXWeZRqYqCU/5JWV9
         iomUCcOiqYJRg/4/EVdBo0LCrNB4Lqv1fTVRR01OJylAwEix6hsR22E8P5orSC6S0bZS
         oIAsa2tPJ7aaI/HBWyfC8Eaa3ZbAwWeClQqiPqQVBYPLz0tUCJ6Dqn3DS5l3QGDPF056
         y0r86cmDS9q+X/ojkqZUgpWqyyL9TJoR+LzrUAFzfP3o/Y5ypseHOEdBuQW6n2m32njF
         Bqg0Wew+k9IHqkE9l6USX5PO1ynIDYWa+gGmXpmvkbIduXkJ9aOoBvWuHld4hvwp/wk3
         SbMA==
X-Forwarded-Encrypted: i=1; AKwUvBw2HXMlo3294uBDKNZqYZrLrZYSd86NOr5rXH1veJNd3jUc+lQpe7rNK25ENWYyC1XEWG0S9EZQdzNNAiIb@vger.kernel.org
X-Gm-Message-State: AFq9FYJPQNOY1Zmhc6jpdImD9c+FXY0Pn3jIC+iJ83HulKb2eJe5shf4
	t8wS2oMVkvNTZC+KQN/1yTzYG0KpmEW1VB+7RmblvTAl8DkYsz3bujKgt4WewqGpqs0ViF8C4YJ
	0iihPA97l/0AyHV66x8eJHTOlpzw6/kEAnyGmY0k3WQnOZBOnT8OJGwCWuSQD62+tMLs3
X-Gm-Gg: AYBFou04+kzY6Lyjkg68vyGsegdeBtpy+yLBG1kjo/i8I818Cew4RmoMBsWJ2TjGFAv
	xYQ0NlUAK5qmkCTfwCG2xN59QvuZjtZ+aAeWSVsIwxEqkkViXQrXVfj8j86qVGtsVI5oVGx8k3w
	NaVRGm2ZnEeRpK4NCfKFLyavTc2KXm9ic1/C5CDz0Xln+tNXnEEj55qz/A2UEuHjwwp4JzTD7TE
	PvdMiZKzaw3+At8ThfGsiglugjEJkjqFpragv1S5XtnCJcc1/qeCjhqkhAKjiuQGMH4etslYTXe
	wSaSl3BTQFVGwbjCtVjyMKpfN90So4OBQJDrEZ53XWOu83DahtA93P0smDUQZNvz5cp9OFbjmyK
	4Eo/VuH2cO96rzLdIVlWvRy2D0MhGAHRcOA+LMM509+Vhuqd2L8IJQAGJjP4=
X-Received: by 2002:a05:7022:7e86:b0:144:e38d:8e52 with SMTP id a92af1059eb24-190a784c70emr996423c88.37.1792549886363;
        Tue, 20 Oct 2026 19:31:26 -0700 (PDT)
X-Received: by 2002:a05:7022:7e86:b0:144:e38d:8e52 with SMTP id a92af1059eb24-190a784c70emr996377c88.37.1792549885477;
        Tue, 20 Oct 2026 19:31:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm2395108c88.22.2026.10.20.19.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:31:24 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v3 3/5] arm64: dts: qcom: nord-ride-embedded: Enable PCIe controllers and PHY
Date: Wed, 21 Oct 2026 10:29:18 +0800
Message-ID: <20261021022921.2053957-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021022921.2053957-1-shengchao.guo@oss.qualcomm.com>
References: <20261021022921.2053957-1-shengchao.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad823ff cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ccc3-NsNM3ZFeKEqOdcA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAwOSBTYWx0ZWRfXzH7XUoBm5z6n
 O6e0muJzQVvqzIXedFvy1sYhk0f0g2DcIPasHUU0f0+VjG6Ee7okzbC/lgaqb7vHZP8kSoK3aY7
 4jbvz39zohrQd4ZCW/v4NjHusBM2Qmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAwOSBTYWx0ZWRfX1CNlkgdr2xAG
 o0q8XFVwkHFHu3PO/Wbp68Y2+ezaAR5aK63G1B4EdJESvsthHW3Kww99jVEOkEgn7rscNKrlOkM
 W6hLQzMWzEWNWigco5g7rAWFlmPBt4MmY0ktCnP9xsz5TUfKlNhwr2+/+MMBn8KoRAU/yPUQ3pv
 re1UL7M8G4ihSc1QHj2Tee3euRbzrXV7m1HmgWqaJV4vKMn6U9BL3L5JGM2QMHp1QDVgculIR1Q
 8VZ0bF4aam0TvdBjDHNbpOCqAYhjtS9VMkBBOHzOB2n/ooqrsEDyFGFmy7Pin61h5TX5l+aLz8+
 wJCfpH0CpoporWxUQYgzPIGp4WT3uHcpne7+pxELK407oKgSdhTbIFiVtAg4XigJmJHDZWpqUCG
 NLPZNXC3tic1te7blnfdWGgqUVWb+RdZChy34da8Bi1i9u1pkjTsKo+ok7qgV1lWrenOIRjYHXc
 2IZKHcB8v0u3FlBUAnQ==
X-Proofpoint-GUID: pwr_NX_hLYtv2q2_q-O3MuG-0g6pvm4t
X-Proofpoint-ORIG-GUID: pwr_NX_hLYtv2q2_q-O3MuG-0g6pvm4t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210009

From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

The Nord Ride Embedded board routes all four PCIe links, so enable
pcie0-pcie3 and the QMP PHY, supply the per-port PHY and PLL rails, and
describe the PERST# and WAKE# lines of each root port.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 49635695f832..fcc07226db8b 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -366,6 +366,55 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&pcie_phy {
+	vdda-phy-a-supply = <&vreg_l6a_1p2>;
+	vdda-phy-b-supply = <&vreg_l4a_1p2>;
+	vdda-phy-c-supply = <&vreg_l4a_1p2>;
+	vdda-phy-d-supply = <&vreg_l4a_1p2>;
+	vdda-pll-a-supply = <&vreg_l1e_0p9>;
+	vdda-pll-b-supply = <&vreg_l1e_0p9>;
+	vdda-pll-c-supply = <&vreg_l1e_0p9>;
+	vdda-pll-d-supply = <&vreg_l1e_0p9>;
+
+	status = "okay";
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&pcie1_port0 {
+	reset-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+};
+
+&pcie2 {
+	status = "okay";
+};
+
+&pcie2_port0 {
+	reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+};
+
+&pcie3 {
+	status = "okay";
+};
+
+&pcie3_port0 {
+	reset-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

