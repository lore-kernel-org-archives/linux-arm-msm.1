Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D075426D22
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784802851; cv=none; b=DoImFk7DOxUyj2tg8fSa7c3c5dVdavXGOXrpRrl3cFFsFVLTMCuJSlQ7vUH1j6BZRiglELW1vCWZFURf4n7ZX9Fjm0+J7UbNbovLGVtualoc3je4owAf11H8TDVwuifk1JiW4CW3ND2qOvNFXu4Tvx1QcIpTof7SA4/jDCI4qDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784802851; c=relaxed/simple;
	bh=1Ri/ye33zak73kJL8wNaCv4lkrKYNlp4IjpBnQblexQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TjPsF9hK5qFyeKzMGTez7r7Z1mSpInNCQDy9sVQIBKfKw3q6PRHALbTHyUkj/oYUBoQoWXkqIt/yHnxjO57g/g+29CsbSFAcexTZzlD8N+PyomIFHZvWzjkUatTnJTIJ0tFTmwaXTenDqw926AAPuXyBAzFRrwYhd9d1r3ekWX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SfRLsKB9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y+Udtket; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SfRLsKB9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y+Udtket"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qXIa3648564
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EYQZ19YP/MzjTpCWPQusQkTA8YmEpj5b8ho6jvLNnmM=; b=SfRLsKB9u8job1LN
	ghzQamlpzP9LLVUjtsGT91FMTyd3yCsA0yREoKMalIDMDcWkZmBq4ov5Rhth80VX
	ITDnD0RnIV/OWcFiguvzkrt94MWLZZBY1Uo1BACzM2QfDAzvsz+C2lfxb4J+ju3P
	s43wIwihSiiYfqizFQeKiESyPAkzPZOD2Ax3UQHA/oZQ+RhYshVrrq/CNTfarwyb
	rmifN8eHmjrtJoZkpzRZil3VdNcEb5vUiQ5104ytlqbvNxXPoLezRQtPfm2h2VF0
	APdRkKpejvTg2T03wj00LLeiVNXGNRzbd4SqaykL8XT39HY9hf9AGrG3eGd2u1JZ
	+woyMw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7jj4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:34:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dbf293831so1337523a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 03:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784802849; x=1785407649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EYQZ19YP/MzjTpCWPQusQkTA8YmEpj5b8ho6jvLNnmM=;
        b=Y+Udtket+C5KZM2OmqOYY2mpB1vTNT04Kg4dNcnA62Ompi7McLFuQyLEOa6o30NKls
         RuuhwI5jVhzgyrvMyciAVUHGVR8iuhljJhCMuMdBwAEKNDqPF3GS9L97ZQyHeg4wsBeQ
         UQLwQqLzjt/0Z2t0SQ+BIingBvKIrwXElEM3LzcJ0lsSQsG/df5BcZ0QUBa5rEWyyP5R
         Pdet24epx5aWD9ob31SgiseU3z0A3aJCBkN867lSNBxaUZri9tSsrTfdlykwRvLlpm+m
         vwtO0S0Pxuh0SHYtCYtg1rPok/PHpXOKrC7LYYW/mJMNgBDJ/WJgE32/0ZSqkHXoxgTD
         KLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784802849; x=1785407649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EYQZ19YP/MzjTpCWPQusQkTA8YmEpj5b8ho6jvLNnmM=;
        b=I6k8vonpD7bPoRCL32Lh1A5P3ch5LU0qaRDR/qWncCGT0PFmSTZNBJQ3nenuvSqKSe
         j8tFcGXD33YIu2Za/OS5eDbcUPZwGT4FnH+c1MTU8TS9lu+0Safc9vmF2ylScpp5Xto4
         XRWmVVKc87kdDxUgpm4rFtwXua8gKCC+b2hS2rSrn6+fiXekmOew51scKA6qb/SBLR7j
         SvFLaSzBgeVmsspLW9yjL74lyw8exMRY1GE0Go/aO9G/y7LWYesNT51yELi56ds23cVm
         RX45mJHKRXPgpgnXH+D0sti8ODSbo7N/dP6PcBCqdjITeWzZiyTOOUoHB8cURQP9vJAP
         s2gg==
X-Gm-Message-State: AOJu0YwcRobQf93N68/DfAa6AI5E4nqoEQ0PudFYJaiORaB7hHgYduSd
	0j1MDcf9+A1yUROyjKBbiQvqDgW5FSUFLTyaATeKmlVUUYX8jwLtH/bKGj+lrBwH3DRySVvDowQ
	coXwFwQJOtUvS2HKMfYMlT6YZIkNaIhB0hK0qRRRlI8BJTQcqK9+eS0HycxZq/hHhKrI0
X-Gm-Gg: AR+sD11WBKHs7yYSoc2d2bc70CnvqWg4A8XBRsq3k6HvVl2Oh5lWtaLdGNbAlGaa4ZQ
	Wsmd2EYUiSUC7N3HRhBROfQZWPK/a8+gMp6Cgy3Fp1rgljobxN1lSbMpjds3aAPTBJempIiHRwx
	LiZQ5y/Oe6Wv7VnC/EWgVX//NLGKz3pz2sdOopYKBPqp38oA3j26KJW8h4iR8Mw+5mkZXyxsEG/
	azwy1DUAkWCgxB9h6DCyhEZ8XoQPnWnpCqljZj12o4w7/55TodebIy45PTazqm3QnvXBCRzgbQL
	LO2XdE8xxBW8cOk0miqZu0sk5oT/5iVvgzyD9rGIzQumAGHXkulDEfxUhuxSS9v/KFG0bMWwNrz
	wJyhAB8q9XLe7ThiZPywAehd30wCAh7+xmZgV6pv7F21Cxqv/0Hq3QmuafsIg/tunP3vQ1A==
X-Received: by 2002:a17:903:2444:b0:2ce:fa3a:45f7 with SMTP id d9443c01a7336-2cfa71d945bmr29501495ad.16.1784802848731;
        Thu, 23 Jul 2026 03:34:08 -0700 (PDT)
X-Received: by 2002:a17:903:2444:b0:2ce:fa3a:45f7 with SMTP id d9443c01a7336-2cfa71d945bmr29501115ad.16.1784802848179;
        Thu, 23 Jul 2026 03:34:08 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f2e6203sm32416155ad.44.2026.07.23.03.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:34:07 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 16:03:52 +0530
Subject: [PATCH v5 2/4] arm64: dts: qcom: Enable USB controllers on Shikra
 CQS platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-usb-shikra-dt-v4-v5-2-5b69d9eb0888@oss.qualcomm.com>
References: <20260723-usb-shikra-dt-v4-v5-0-5b69d9eb0888@oss.qualcomm.com>
In-Reply-To: <20260723-usb-shikra-dt-v4-v5-0-5b69d9eb0888@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784802836; l=1317;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=1Ri/ye33zak73kJL8wNaCv4lkrKYNlp4IjpBnQblexQ=;
 b=fG+TH6h2mvB4HukJlFicx+4eEe7aGhF6qzc5NIHVqnYgb92xfAKya3m1KxXpMU1RXmzimppA3
 g5oE0h72nYoB4if2FJf44WbH2IdckAV4b8TPIl43B/GvqqDVxqoXL/z
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-GUID: zDwEXFKSVvyfDD55IhdQepbg5kaFt3MA
X-Proofpoint-ORIG-GUID: zDwEXFKSVvyfDD55IhdQepbg5kaFt3MA
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a61ee21 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Nf4tAF-kVs3HMKYhumAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwMyBTYWx0ZWRfX789D+39qPvUr
 u8O80Uhdy/dwIbIlv6iugk/V3WM5TovyCrAnLXGOkVtnXxbHd9YDjYpQ+wa817ghZQT4Ab1c/B7
 NqhD6lgTWiOc3ZcjngDTA3pm6ZY0JHw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwMyBTYWx0ZWRfX69oaR9hEdvWd
 Xm3AfsebJ+D5hpzXwS8uRAo16AnJ1dQsVyfyW3qNFL4TFDVECjGsgYItCmwW59EHqyf+XgPe6Nt
 8Ar2Drvz2JtbViTXlt15VTu0cVgW8m9pgbinIXsuZbyagnvLlfaVtmy3XMHzh/zHtVI6eg70qOG
 VzplCD2ea8jptThqX1g307pkJ/ZiVIfYZNufTDAdLhVV0uxiLTv1zUD3VD5j2x3H/jPLL4Not5g
 Zd2d7YPkpfL32YDidntJbxcNoan5LjvOEPwUIjZqhYQgPjtxIyUTEnuKWU9L6NVis2b6gE6/tWm
 32PA2XAeBbDAnvrWfmyR0ok+JHX+XjqJ6fQT9TbwJxmoMoWRr/vmAGwHydLAD31wYhAd7jYipJv
 lBz9vpqylKsBjHpHDF7uea74x34m/8EsMWULQUTmDfAwP78vVThN/WcKc+vEnf4yfI4XKJO/pWR
 80Bs4iFZ851+/2QoG5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230103

On Shikra CQS platform, usb-role-switch is handled by PM4125 on primary
Type-C port and Cypress PD controller CYPD6129 on second Type-C port.

Since those changes are not yet present, enabling both USB controllers
in device mode.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index b3f19a64d7ae..006e24a62f5c 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -38,3 +38,38 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
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
+&usb_2 {
+	dr_mode = "peripheral";
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

-- 
2.34.1

