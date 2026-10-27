Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103868;
	b=YZOG5IopsmSuQt5YA0VtrO3yKpiUhHvQnvd8IUvXIsOhbjANxRkmlqfpRBmjxUW+eR3F
	 RSxub62bDDrpa8tv3/FmY3u59Ppjysb7RXTkcvUIxF6KzglbXNzxAJH2MVY7he1M/uDp3
	 ljLVhqR3PIDTETHm1QGQQXGbSvx0PDTF52nO70QXG9zmlXnPXK3+B+qg/aoqfvNYi/old
	 X7TNTmxrNKeO60vRza10FiCdJNBLed3nQaauCRXaSWzUqouqt+kl20GVn7qpkadsRBOvC
	 TZUZt6zYR60GGlJ/313RSnqst6M8vV/lvuomNhmM6MdneOi82v6Y6h65mGi+MNTWJAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103868;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SBX0/to4wfH3fUA/kO93uKJ2afZ0LuqvANCM4txROkA=;
	b=Y7LiwD6mXVX7oqzACQEWKIGkhdi7E/KbpixOCESKmv6R3MnPIabAOjwnE1wuwtiWb2W7
	 5nGHXhkwrvc8PTFMCTK/2u4PENfAb3p0XVXmUREtBA1TdhUhQV6kFV5wYKx7sL61seCCL
	 kQM+dfwYD07eu8AiG7wlQnUrhwZrHONBlOXHYZYEwnOsQPQ3Q7gxDmDwdgsu7I9/OtvEo
	 +hqBTVTZq1LS4I3IHgJdl7BjCRhoQ/bam0YUvHvv4cH33pY8Py2xv2HTC7lPNXt78tzwD
	 MfHLM6DzyHslXDjW3BPR6uDPhN8hwvxZWkhMMnylfAqxGxtPhIVr5jblP8KuOVuFC5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S+M4v1mo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bq+0XQl+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211E3606A31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 211E3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S+M4v1mo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bq+0XQl+
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe3E82458384
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SBX0/to4wfH
	3fUA/kO93uKJ2afZ0LuqvANCM4txROkA=; b=S+M4v1mo9w40RZh39oLWugextVO
	S/h0LkOQMNhtWU4GULebL14JinktsmxgGsPyNmYL5m/yOQ4dHshaODni2eWKscQZ
	3QcRfIEf7/xKez0wYsbFH4K9fsYDLT7bN4aI2wbz5RBf7WF6FfrDj+inI2ARz2Ab
	02W17lB5EtkMx/hVLPo7qJ1pzaet0TocvO6Td1uyjnur7DQJt/bDkIB9OoEImFJ7
	jDFuRhELaOf3oWhc+up8fUVsICJQafLKeHfjaERpvLMqYzvxVX6kiugau2ecQh4x
	tkmY4dMl9U16WQfBeRa1AvDfDumpMStjUlR2f9qEJUsinur2i4RoXExsQcg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbta7pu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:24:26 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3698bd5392cso807740eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793103866; x=1793708666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SBX0/to4wfH3fUA/kO93uKJ2afZ0LuqvANCM4txROkA=;
        b=bq+0XQl+2jF7CYAyceKCAWFvpzkKuHBdtjT5uzzt1xG2UUhRMFFr0AGY2UJ6mEx/mh
         WQHbmzX1JOdfNiAVMUMmAFr07az2Lvnl1FO0n5ev8YgavauTCWJBhSGrTYyqOmomSW7T
         zuo94yFsfOFIFIj3SLsWuMlKHoQ7eIzO6vImdQ0IZI23ReGVTtN+aj6vFX6eyrUwMIFe
         yB0z1Z3ZD7VMBZ9XDxSx++NyAqi12ZsStVAzX2pZe/OpeTQ9QOuuxI0b4V9czsISJPGm
         GN5H/h0qVmEaRMmyj6b0CvvB+ovlNDLbfp9dXJYZHyBc14XL8x/OavzEk27PrFYd6oh6
         hMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793103866; x=1793708666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SBX0/to4wfH3fUA/kO93uKJ2afZ0LuqvANCM4txROkA=;
        b=Bfb1KR85gQOiu+d6hoDekIMPxw/VD/VUuXxCI9Ex1bRf/OQqFJ4uWe7wfEsktfNt3E
         0lMOw4ZkhiLTqNtNCmLNaABxeC/oHrvg0+0cA/YnRV5p7OnsuPGnZh1SnlX0V5hAG955
         Nr6GAaQZ3prWwp651OZ8W3/PZgkW6XJPRJZU0ccl0NtR5qO8hk15+el1KDou8qXT7/Ik
         ioUa7ivLMpQLTZUG++i5hRYf0cig40/qa9axlca3DkypEMo78oXt678hxFgoHs0ngiZx
         2TZYaCN66EdK0RySxRnfT9x+3x6a3vTB4M2KN5NCSQJcTQ+TrrivLK2qota0hBLLpNZ6
         YpJg==
X-Gm-Message-State: AFq9FYLcpKFqcs5tjtL8IA4pwblUDZ/KesnR71DZzWTk130R1+xrBakQ
	I24RI8v3CVy28f4gTlQW4Tbgrcj6opBXzDt2VrO6t1b3aeIWrsKDkHnkKK5T0B2QsCvjdIcxWIO
	DKz8wieLmAqGFjQcyyvODtrTg6GdSC1z9YUoVhJVgB3/tLQhgs3T+xi0SeeWBXrrXrOGd
X-Gm-Gg: AYBFou3RmTHDs0Ym5fStBx4Rs/ESUWkbRmBqu9BPeYVqBrVS6b36kSf6Kie1826TGMH
	qNnoVOwYseZFESxABhd1ApX7aJv3UCGt650OtadvnmwQK8tuGAHzz9Um58ZhgJaEiTYpi9jIzOt
	X0xN9zufX8fMv7GgtQo0BVWPBhd3uTTXt9j8BbnXHc68E8exqOW/zjMLOffrpOSULvOovfNG/TY
	gdYABpr4aWtB1Tv1XTw8UMBY5iClkx8JA60y16a7lnzJxwDcj0NDU/oYLL2b8hH+llDuOyW6THC
	oxecFoe7dDgY9f/cDXCw+eJ1TSnsLCNYQIby7oTfhEnLGjhyUAkbGRLXt8o8Snw7F11ZMMJ3krY
	jjlG5bg0F2mZJsMZhdEN8F9ud7tdBiXfJz8pUlS6UaCRqFaiN
X-Received: by 2002:a05:7300:bf29:b0:369:fe82:8d3f with SMTP id 5a478bee46e88-36a0f81abc3mr3760940eec.14.1793103865990;
        Tue, 27 Oct 2026 05:24:25 -0700 (PDT)
X-Received: by 2002:a05:7300:bf29:b0:369:fe82:8d3f with SMTP id 5a478bee46e88-36a0f81abc3mr3760886eec.14.1793103864883;
        Tue, 27 Oct 2026 05:24:24 -0700 (PDT)
Received: from QCOM-IvKeorbwK5.na.qualcomm.com ([120.60.66.138])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daf444sm32822215eec.18.2026.10.27.05.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:24:24 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, abel.vesa@oss.qualcomm.com,
        mani@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: qcom: glymur-crd: Move the PCIe slot supplies to the Port nodes
Date: Tue, 27 Oct 2026 13:24:10 +0100
Message-ID: <20261027122410.62219-2-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027122410.62219-1-manivannan.sadhasivam@oss.qualcomm.com>
References: <20261027122410.62219-1-manivannan.sadhasivam@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0OSBTYWx0ZWRfX44rTbBr26/dC
 6JOSnPq8zRp+U/VEloaIa/MRIz8UZfrcDH44GKfj2rjG/+yA2vHjvDtAtiqFfBMAAp+QH6+tc5F
 Hb9HE//5lD+UymFnXGF3+IiMiuSviY0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0OSBTYWx0ZWRfX6qWfneQqeWmA
 GBKg9xgRjl8vRBbb4Q1S9QyEUM2ySngK8WDua8gr9mduIILGiyLUMNJoe+EoskJgGRm3ZN5pAAv
 5g+c8UjIRxxp0S+n0iayUjoXogwmmY7ie20aZG3AfWdU6RWPkAFDhftGnqMk6+dg5o2w4csFrRt
 u4oLJwN7Ld9waEhVUVwUwaKza5Kw8UCncYqXBXjScUe7YxwySjRIDE7uvcBo79p8fnt8umsmzC6
 PTkc3W5ug281b972xsHh/4qENoTDa/rNn/Ype74epWrhTB7YFx2BzFX4pVcoqmBWr/utD6Kj+mB
 s6Ko2enXSuQONkffidx66SxMBrJKfRqcwX1NbijWl/s/CstdNde/Bt2scmVPQF+T+uFLgBsyw+c
 4KBJN19V7YFyYyIAb0K/FNDO0ok1BcorqzSx/mEIs6fUVdi2G2gy6C213INJBYQbgAMdmSDAgUH
 M+pcDp+GLsZkZrrWdQw==
X-Proofpoint-ORIG-GUID: AQJ3AKlcFojufWnLXOY85CWENbDO6Fj9
X-Proofpoint-GUID: AQJ3AKlcFojufWnLXOY85CWENbDO6Fj9
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae097fb cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=+eK/VBehCgFHFEY5YUZdYA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=DO3DuuW5O9QViVOw3M4A:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270049

Since all controller nodes have Root Port nodes, move the slot supplies to
the port nodes where they should belong to.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e27c697e3170..7e16add069b1 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -743,13 +743,13 @@ &mdss_dp3_phy {
 };
 
 &pcie3b {
-	vddpe-3v3-supply = <&vreg_nvmesec>;
-
 	pinctrl-0 = <&pcie3b_default>;
 	pinctrl-names = "default";
 };
 
 &pcie3b_port0 {
+	vpcie3v3-supply = <&vreg_nvmesec>;
+
 	reset-gpios = <&tlmm 155 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 157 GPIO_ACTIVE_LOW>;
 };
@@ -789,8 +789,6 @@ wifi@0 {
 };
 
 &pcie5 {
-	vddpe-3v3-supply = <&vreg_nvme>;
-
 	pinctrl-0 = <&pcie5_default>;
 	pinctrl-names = "default";
 
@@ -805,13 +803,13 @@ &pcie5_phy {
 };
 
 &pcie5_port0 {
+	vpcie3v3-supply = <&vreg_nvme>;
+
 	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
 };
 
 &pcie6 {
-	vddpe-3v3-supply = <&vreg_wwan>;
-
 	pinctrl-0 = <&pcie6_default>;
 	pinctrl-names = "default";
 
@@ -826,6 +824,8 @@ &pcie6_phy {
 };
 
 &pcie6_port0 {
+	vpcie3v3-supply = <&vreg_wwan>;
+
 	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
 };
-- 
2.43.0

