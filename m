Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4451D382F3A
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784219381; cv=none; b=onAkPtvwCe3ad49FDthY7KAJ4wkxs+M+tti+HeQ+qnNmSpyKiylK5odFvk3Attqo+MEAuDQe+XT7QwExorL3aLkx5i3x+26Kii5jnBYgQC31y8iDgRczSODn7Ssb9d1i8Iz/9jSOW+bC13XRi9PaKvoeY3kCvWlZT0wPVChnvPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784219381; c=relaxed/simple;
	bh=O4ieXzCqLQFPHuFkvy/A9oNVBZ8iHeLxT7KjJawmoMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CgZr0eguDCXem1cX4lXYjql4BIgPTUBWWmJUVwwWJbJ0W+iMLWVDImHxhVCykQLFnymbCVSs7AZosXkXBgmXTKzzEXu44mXzjY/HMxzoanSF4+t9sHTGjTHBwAPo7qnoQMJhlOhW7LJkSsRPUengIWnczo8HjFI4L4yMUB3jI+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gOTCVOJf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FOcm4EPD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gOTCVOJf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FOcm4EPD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGSnVA230482
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DEU+od/n9kezYA4bc9/HXZ9tGN8JXCjIT3J8xUpS65Y=; b=gOTCVOJfp2F3kedK
	llOKKOwexbiu9d9pZWJomZx9m0r99Eu3AQUIZgyveBlEc25r708wohUBiegJWIY5
	lxHdNTiFvvzqxXVEDHbQctnzpmUgwfjtFk8X6W6v34preRGdDF7h1xl3CUwfxvFG
	V4O666E2qYsKvOHyC0oa66IphJG3q8junUqqeDcQtMPXcI33aoCMj1OmNWB0g/jN
	B9PE8QsahbqHNZCkFCaVyes7DkdIEAI9AVc9H5thkg45lQDfD0mbRgabM7PrTykv
	xg5kLCKgQNoG2uF9ZCrXloBywEWiut0y3t3fa+NedHwGmnFzWda3aAqis9qU40RU
	WE+8zw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feq3pk9fv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:29:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c889d1eedcdso10544110a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784219377; x=1784824177; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DEU+od/n9kezYA4bc9/HXZ9tGN8JXCjIT3J8xUpS65Y=;
        b=FOcm4EPDWmpLJES8soLAivcxOMCUalrW9j1kjE4cJGQs8hxTYEPY5BJ/XptRzBfGuy
         5IhdZ/cBgjPgyKgTYUwFXlZAB/maI6m7x6q3YNUEW39dF2QQerkh7o9Yp7AnQENgrm/R
         +G1Wtn35bjBkRZ5dCGPevDiGnU1Emk6EfMWQimozZ/bUesb3OGd2LADf5R6uMXLmGz50
         r1MXKb5Ai6Q7upAe8I4N+VtTPtZaf2SL/GprlKCtyJnWNNJOPS58KZ4MDtmTFqP7jZiu
         RaLKxmGKL18KJMKi5tSViSDe7c2L5G1zvwxzx69o4ALUceOxwZ541+SLZiwFpSPI0E8D
         q/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784219377; x=1784824177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DEU+od/n9kezYA4bc9/HXZ9tGN8JXCjIT3J8xUpS65Y=;
        b=AE7FO9Zko+54M7yQ/oXCaFqaX6i1KmXECens615TZ9A5M2KyE9Rm760GrxgzqW8L09
         W2lTnue7E5O6au55H+RF6R3MN0SCFAa8ANLSgcgPFLm/dZMPqfYB/auPWFNVRzJbof53
         M+wG/TvjX5bWDTX9Zvg5XwsX87vjKj34irsiJucgcGzNmQ3/EZyDi8oi7K+Yt5JzBQiM
         6KKSFOiM2O9Hi7Xfk01AsrFbjQ1/d3uzMQ5HofD5tffxG0n31FzyEtTtdvQ4bnQuBIc5
         VVzxY+u1bspj9SEyVI7sOIojvWIIWR3YjHH4z8IlwRRx9YHxD00ZzByXl8DilF5ecH21
         kOgA==
X-Gm-Message-State: AOJu0Yy9QqPj6qudqWnmQrzpPIhse8deIfZX9jatgBc1lhu0JtFUMDgE
	uAgQQvfLq6oubiMg/gTc35TINR040HeETBiDoLbDfQNuGNb2XdoEiv+6MKb4uzSeskaYhRe8OuZ
	+HrEC0XcPjiIGclS+ZKismwXNhoVZFHYzE9+tty58N6Kz+iLPnUIu7w+Duwsdj8LornBY
X-Gm-Gg: AfdE7cnC26uulpFkbYMYPsjz+MwzydtXNNu//R3eiAuTaTjM4nhBmnO5/URSMEIQdRP
	7VKzeTjDWVzNtmVt7TZsrIR/YTVrl8w6ty5L6itbQQW70tMMdI5PrdiQ+jLEoVUoXUyjjqU/Vy+
	KTwbHswYU3Od4gx6KjGneiBoE8oINE6Ew+jgdt7AMO/nVkfLdgzOs1VR9PJpZrBtpRIesM9fX8q
	lGh4YySTcYdUEx7oRXlctiu7FCuTBH+b2rJICXEjYCxECNO2YRMWXmOxID2KAXvQUBb7EDkQqCJ
	3t8RTLCwpYPeZiN5GIWxY2lyPKdMqSLc4H01qpC1qdCYGf15be4abYZpaDlHIMcdIUSftLQjSUg
	6LQzYv3qNqlvcYo2ho0o3GR7WntBKCoR51Ad+wrd7bW96NX9ektZfXnk3XfGDlqUAhpRznQ==
X-Received: by 2002:a05:6a21:4d92:b0:3c3:a1b4:144d with SMTP id adf61e73a8af0-3c3a1b416camr628364637.35.1784219376988;
        Thu, 16 Jul 2026 09:29:36 -0700 (PDT)
X-Received: by 2002:a05:6a21:4d92:b0:3c3:a1b4:144d with SMTP id adf61e73a8af0-3c3a1b416camr628332637.35.1784219376584;
        Thu, 16 Jul 2026 09:29:36 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd42b2c0bsm11828262c88.8.2026.07.16.09.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:29:35 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 21:59:10 +0530
Subject: [PATCH v3 4/4] arm64: dts: qcom: Enable USB controllers on Shikra
 IQS platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-shikra-usb-dt-v3-v3-4-13f73a0571bb@oss.qualcomm.com>
References: <20260716-shikra-usb-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com>
In-Reply-To: <20260716-shikra-usb-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784219358; l=1148;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=O4ieXzCqLQFPHuFkvy/A9oNVBZ8iHeLxT7KjJawmoMk=;
 b=RLbuJ9bOjtHnM4PxGoWI7q0CDTX0wAXKaDDuNY8TFkhLO8iQhNKBw6DJo8xsHUwV3N+pcukn6
 e6ebI9pJjZVAhSeaCMQjdNjtxn/gn2364g08byo2lfeLt2bBR/6BbKH
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: 0Qe7-UiiUkyHj6ErmwoBuOS3yApvtY8G
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE2OSBTYWx0ZWRfX8HWvWPFdWDzC
 TfdGnaoWJw0isKbHmlJC4PWuB3KBU2yPs0WRvbmcZ42WP7GzzVILxNDM1VArsC06N+sbUPyM9e0
 pcVQC0TaQAfa5iCs30RVBC9WPU0xoec=
X-Proofpoint-GUID: 0Qe7-UiiUkyHj6ErmwoBuOS3yApvtY8G
X-Authority-Analysis: v=2.4 cv=PN8/P/qC c=1 sm=1 tr=0 ts=6a5906f1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=bymAw6jGh9HDV1aGW0AA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE2OSBTYWx0ZWRfXy9m+X71MzGTN
 xA1ZwKVm/9LyOVkNQXAQlamOXmts3M1wsYUNl/Uvtw4f25+HmFZARe9JpHjME/2tV5YZaZ+jgs/
 qOeFZyfAzcSjm9yDTRNrmacuLj4g/Pqk0CbVN3iznEzm2GxVmi2tvemO3QB8VeRHVA+32YJ1ZoP
 Plq3s3st1TaIIxpAuOcx+TsEqmjIKldxyjIqu0yAE04bQ5Zrtosv83JUyxYOLjls5F8Y6fOV2ti
 Wd/uLY2L43jK6917J1a8lwnHL9pvbpaJKm+/Ks6dPT7ci7SZ9WMUebfBBUe2i5aNX326SBE1sxf
 qCIgmP69yYahHwnT8bRIMQF2e3dA+sq0aYh1qryzMORAmlnPDAyj2jwuK+ELM7y4pnvxEEqKttX
 RkQ2PDzliA4NQjQHQrbps/W+2nnWeZ6BT0oY1QIv7qf+WeVf3gH1nK13cXpp1eEq4uq5GPVB+j5
 mYxhmyqAHnxQZRNek/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160169

Enable both usb controllers in device mode on Shikra IQS platform.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 3003a47bd759..2d4e34ec3b82 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
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
+&usb_2 {
+	dr_mode = "peripheral";
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

