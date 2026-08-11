Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAC63F8EA1
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 10:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786445964; cv=none; b=VYntyvqE14z0Acnpr+IGqUFgUjiUUL4lYXBbEztDeLlbAskJjvh6IclkG5Jo4c8OWxXksxT3JXlQUICll1PhigvEZdYVCk0qJvWLs6Lw/eB2O60HPfNhwAhpSSkTTkIqDiHtpmerTHhMABjMAyf0hvUq7MDPDaNghG1xavIAz7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786445964; c=relaxed/simple;
	bh=V5Ss4ZXm9MXFjoDYFImLDCTgyhW59nD5qjgPYogx/xU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WchBj7LCIPio7l9B+WHHD2wqwZ970Cn26lE/nOLpyLP5afmoCG6IAC6jWyGsDoSx2fq8xDR41eFgMdhpgToHVzssAzqWx7wx40nSod8dSNzZkocgY4PTIsLnQ35XmyCzdFe0f9q9iSUbaBMX/824zYax3LBTim5aX6d33ATOa9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QNF46aMD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ggUECvPI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QNF46aMD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ggUECvPI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BAMmNc3781313
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 10:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a6YjjHD0GWmbFHh7DIFjdLWdcNY7r2aLEwUsM6cuKEI=; b=QNF46aMDo5ff7HDZ
	srR/VfeXrFpdj+8h+TGznfybWWCr9/S4zYBzpRB1h8oIeg5beOWa+6gapQuwqmPX
	LcLtUvYM/0iXybX+DL2NDPE71QRiYh2yPfzHEXYaNdfFtIEFuaRUR9BDrvtT9o4Y
	awCN/OYmuTpKHjP1t0cdWyy7TRyBwa1pDZ5W8wwPlomywggL7+wDPPvZ9sQwrchB
	cb4QDyDDH6HwPszdf39DxTysS/Zl2liIgBWDCfmqhHGmvKsyLycE7MWnDOSwJJ4M
	SMhAwCF8j/8L/GU/IPPZ34g+JcjtP/aTrNB0Ej0jMNT4v5M9CDnYZIWX6l9JErJZ
	1olkgA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjk7bsex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 10:59:22 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84e01a62d99so699416b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 03:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786445962; x=1787050762; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a6YjjHD0GWmbFHh7DIFjdLWdcNY7r2aLEwUsM6cuKEI=;
        b=ggUECvPIMeI5fxq0Jul9BOufcs7E2fxjJ5/fcFBfjRsPsavjswMoM8191z6/lMJF4F
         rzjmyrd3yJbfT5e0rovIvZK0z3iUA8hRfEoxJyvJvAe46DqMWJLCZUG57UG2IDZ6IlLW
         1mNSSKIQyb/QTOCwXYTa6Cx2XzFa2qM2aZLTPNxK4aVQXMDMdjVNwI6vTmqP8wei+IRw
         jubXE56st1B1V/LdTk9p1HFKST8bSGNfUqQ/xrXyYoebfPjO9a3ufub5EyshmMQcdqx6
         ZHZkIRTcJH74Etp5JxgPmu8cQDQvghp1ktJLytUfYr/fWJiuwNgR9GCWWxB20UoFc1Zx
         MCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786445962; x=1787050762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a6YjjHD0GWmbFHh7DIFjdLWdcNY7r2aLEwUsM6cuKEI=;
        b=b18BvDpYB3936TRf0NGOC1l6zuMfrofoJoeRh3KqW1WfZ5VukOd5Oe+iys7Bp0A6op
         k0rz1mxyu3593DWz7lt++m/eXMX8vFEgmMdAfw1XVKn3gwOgUEKqls7T/6lLoPQFPJ+M
         0mH0UKf/CXySdlc56IMOGAmAGz/SB+6D9zWGf5qlkaX8QHWrqUpGOxQJoG49SpBO31if
         rCSLPom1ofnGDYJUVRAA9CnACtggiWXmWKKbP2xGmYv4ctlX2QZUbiaJprxKjoTs2nif
         DkN9+1/i5FxQq3lb1+H6pATviauVradan3FJ6674nnLnAy9Zc2Xmqae5IhwCrGYxEQYN
         ihFg==
X-Gm-Message-State: AOJu0Yw4qX1Vr+8Z6SAkrcMQ6siWM4XCmvGPsH0DU19Ui1l7wiwx+j+u
	a4c0Ki7oQMk5C1eq0VTSl7RvvT6IUXMSv2u8IGk2utkmX3TGX/7yZEI19y7a1dTjhy9W8owmMcP
	Ke/z/DEaMDYPRY9yusMezyZU3WRSEHUGRcKrH48v2hs4uq+dMs3lXTd6zZFeHjmgIdBIv
X-Gm-Gg: AR+sD11+XoFFjwUlzaS6SDFuY1YQc/mbT9WSS6eX/RFVVbGGaVQtueDHPrVc5F9BOw6
	pKMTYDQtdVlye2XyYEAkDFYXXp4k0DfprJ7qaiPbkK73mcrgH27byTDYX+p1WyGM2O+Y+yLxulK
	zQ5bkCzFrmWi8Ju++2xuDWAaDaDPe/BwkrvlfmuH41Qz8I7V/TxK7nDKBCmCtttiTBrMq4fBhn3
	+JaUXAsvF4S+aYGyc1fTHpUNEVdD5cf8XfX7R5UAsfLAYvaktpIF5p8nfPwhha1xubN8S5mH5yi
	10isdsygnp/+9Rgi5GMIziY0naOHEVodlZIFQY3LKSIUub9GBSEMn9OO3tlbqVfLLmA1KLSXhvd
	bOjbI2AkEk4pPiT6F5jEi/lHVISzW9xpyzt8kRiE58gu/puiToIh1lnHgZlWoBs5TWc499g==
X-Received: by 2002:a05:6a00:6ca5:b0:843:468d:7804 with SMTP id d2e1a72fcca58-84fa8a3faa5mr2310748b3a.34.1786445961781;
        Tue, 11 Aug 2026 03:59:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:6ca5:b0:843:468d:7804 with SMTP id d2e1a72fcca58-84fa8a3faa5mr2310684b3a.34.1786445961175;
        Tue, 11 Aug 2026 03:59:21 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa952841dsm529322b3a.30.2026.08.11.03.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 03:59:20 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 16:29:08 +0530
Subject: [PATCH v7 2/2] arm64: dts: qcom: Enable USB controllers on Shikra
 platforms
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-usb-shikra-v7-v7-2-753e928f37ae@oss.qualcomm.com>
References: <20260811-usb-shikra-v7-v7-0-753e928f37ae@oss.qualcomm.com>
In-Reply-To: <20260811-usb-shikra-v7-v7-0-753e928f37ae@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786445948; l=3488;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=V5Ss4ZXm9MXFjoDYFImLDCTgyhW59nD5qjgPYogx/xU=;
 b=wDOfVCDPfSrlbVXGgGJEj8xEBcmjXFKjdNJW6ABGEucWTUqKbdJ7v+bgqxBVft7vhdBtfYsJs
 LAczIhI8g6VBxlAsGEfuJ75+LgOAExWJVZmxLeqSvGbWXLXOUTG6p54
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Authority-Analysis: v=2.4 cv=Yus/gYYX c=1 sm=1 tr=0 ts=6a7b008a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=aobenoHkLCnGjtixFrMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: LyeUwr-ywlerI0iLQJQ7aEaXOG09hwi5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA5MSBTYWx0ZWRfX8K1HzynRp1/9
 WLDUC/5U92/VLO0DfSmJ50yG2iA+mqlW9+qA18Fe8EElRgt9fWdUrHhqNtjSI+pcXz0kVli7SN7
 eAx4jZSgb2GyXzqEHvt8NoCI6CZWw91smt8IzO/VZJDPRZax43doK9Jp/U4ruJlOvKW/DDp9UBF
 eQ9B2unf9h2onNuRz8+nFP4WEMlL/Kd87ERPWuCy2kbeX9cTjwhuorRM546UCexOcFjJRpM0nrJ
 jjgC/G10Lc4BETdHFT2ZgCXG49qD4/BqWvwTMKy+yZHHKQMv7g/oJqGGH1CeNKcAKd7w+krGNz5
 4JjpVINwHyE+3bcakp8FS+1+TbZJivbMvPDlYtHKV0lXAt7FxlGu9xYg9x7dJ5UgViIS/wlTJ2Z
 3bc2qRSeDOPhMpRQVCf2qP85QfkgLvwztAMVCsRkXfhdaRq/ULW+9sNVq2DdX2N3h7wtVfrpHVM
 LoYnXwMWey12F/K8AKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA5MSBTYWx0ZWRfXySlBXzvZz+Ca
 4ICt2cSYchj4raY7TRumKEz0r4wf26D0z9vKFH+HELeQlhzUi6LZWpyT6wQH/P5rYjplF1jzI4v
 FQKMdODBKd60TWSnPdgN5JdCE57VDL4=
X-Proofpoint-GUID: LyeUwr-ywlerI0iLQJQ7aEaXOG09hwi5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_01,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110091

On Shikra CQS/CQM  platforms, usb-role-switch is handled by PM4125 on
primary Type-C port and Cypress PD controller CYPD6129 on second Type-C
port. On Shikra IQS platform, usb-role-switch is handled by Cypress PD
controller CYPD6129 on both Type-C ports.

Since those changes are not yet present, enabling both USB controllers
in device mode.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 23 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 23 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 23 +++++++++++++++++++++++
 4 files changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index b112b21b1d79..3866ab8b0faa 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -57,3 +57,26 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&usb_1_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
+	vdda-pll-supply = <&pm4125_l13>;
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index e62ba5aef71f..34568f1c7b63 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -57,3 +57,26 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&usb_1_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
+	vdda-pll-supply = <&pm4125_l13>;
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index 6eb4184f7642..8ad0819c9520 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -12,3 +12,15 @@ &qupv3_0 {
 &uart0 {
 	status = "okay";
 };
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_2 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 727809430fd1..543d769125ef 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -57,3 +57,26 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&usb_1_hsphy {
+	vdd-supply = <&pm8150_l4>;
+	vdda-pll-supply = <&pm8150_l12>;
+	vdda-phy-dpdm-supply = <&pm8150_l13>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm8150_l6>;
+	vdda-pll-supply = <&pm8150_l12>;
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&pm8150_l4>;
+	vdda-pll-supply = <&pm8150_l12>;
+	vdda-phy-dpdm-supply = <&pm8150_l13>;
+
+	status = "okay";
+};

-- 
2.34.1

