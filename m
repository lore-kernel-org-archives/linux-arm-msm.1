Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8AA3812C8
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784219372; cv=none; b=qtjvqNwMA3uhXnGG3e65dTKJq/ZApAplo5vrJ6Qd52X2hXJ8kJRZDRHr5RM9EAXDk/XPsnReZoEtJfIx0NSRP9RacteQLE4tuTZa7uhTVfVyuyOBAFMHblKevt2aYL/pD/yHIXMXY/aXvGhlNoMKcOYXuX5fjLluRZXYeNiYM6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784219372; c=relaxed/simple;
	bh=RiIunCof7qxDCCa2KLUOKvDMzS6DAZ+kl5SLXmkIh9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lLg/XEr/8R0E8KB1PLWiMFnJ4HamqhGY62VdPvBPqMXvAqGS+niaZjfuDEkrrnAOlozI8LouzaHS3tua3HfYEAzsIA7vAVM9FSEvMY4KgBU7Ek8TPMjCBnRaXAaowyzGrnkYcvfDWKpYA5BHjX7qU9AmarU0FGRUikjEA/M62No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ogBTnrdu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L2pIkQ8D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ogBTnrdu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L2pIkQ8D"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGSkHk3481505
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ymEDHH3yD9InhXBpGw9YyvwKrOvNc/XZ1tYpQ9EQIZ0=; b=ogBTnrduOn73cG+h
	GEHKXcoNYObuD4t45x3xMmbtzQ2+QDvFS6o8gohTVfiUhdEXj1uWvS4d9tML0R7t
	BeUC7GWO5pnX+2rBj1vptdX+mnTmxLuQvtK4k5OvY/szpjpD/Fi1WYT+OqiDzaGW
	5JfpbWuyrJ01DgypWcgW6jqC90Wf2RBe+LJB2Gxc6+/9iUQ0Q+c12IlPFpEfobBi
	ekqoe5F8NVksnSPeC9gKLKozvAT/Fpww85EVnEoTrFfQC3SLAETwOPelUzab3mcs
	ZtelsF2evS7EIYDDsR57nfgNj1Ag2wYTzvXZnqFbozI45XlIb6z20usDtE3Qf1lB
	bXG0wA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetcf2ea7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:29:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cae455cf6dso94660085ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784219370; x=1784824170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ymEDHH3yD9InhXBpGw9YyvwKrOvNc/XZ1tYpQ9EQIZ0=;
        b=L2pIkQ8Dd2+5xh8nx7Kexl9qrNRNxknGsHXND+aeo8elEFGLCXf7vdh81pFuV9Y1V2
         hm+3J+So7TuzQ+qivj7INoM9eh2IYU9Iv8976PnsmFYpAIZcnFsapXX0c9yeQ15Z0nu0
         hkYU9pp1fm2kHmLGpmqgBVLwKykebxe2McEG0hjHP6lFmhPoj5H7syd/W89HynhiH2hB
         O85+eyDv4HGHHL7sokTuQjoYOLD0fTC3cQa5tmdxisZIaroIc4pVyhX4owUhPWR8L/1D
         6lca+rp5GejcXUL3OWENqHVSXebIg5WyRRgj2HSONn2EVK1m2MTqM7oJgOscBlshZjf8
         PBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784219370; x=1784824170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ymEDHH3yD9InhXBpGw9YyvwKrOvNc/XZ1tYpQ9EQIZ0=;
        b=LryQhkIeR6RMhTowtJPfvJ3+bHKnAC/vm6G0bLHOLnt7lBlalWRA0H/9eoE/R+pt2s
         LwWMVL/7gXj8QGRvJoDodUD9PPCXCU2f7X+Lifc2q7/AG8OhrFiS9GcDhDdgkg8eGnN5
         Gpsch+67QjgsyycTeIhcV+m8k2g6tfpQUSnQC8d3F+Wsx9bTWdoKkCPorQDZXOSMYy2t
         C8WUmviVcB0kqqoae+qf04Rp1zCcGvkBH+LJb4n3YOrBy2cFba9bqoxAq//y+oNjkrG2
         shbGtrMXajhryYl4SbavXXrhA2y0Qy6Y4uvgC2fwCl24DkCi8VJ/exbRzfDkL7alAmyU
         Nv1Q==
X-Gm-Message-State: AOJu0YyqUWZtfRhclP37VlhKAAiwKfBs0k/ESFO1jCosYhAZ4xM22iMV
	2QNykmTnE7xBUWflSxw0fCtchLF4a+UzIBHJK5DPDr7TtRbhjBDhlbD4ue4bsbBI8lJAfUTF320
	J37VZoau8Bcpy/d/EU9uwEZ/JaaOyIS6yFZXmH1rcgJRsZVcz5pnA3VMBsF38BiFC+14g
X-Gm-Gg: AfdE7ck2pTDkZEV5IOGkxHYAuaCjviD4+tCEqIOIR85g0pQ5jcbDcc6r0bIpPMhnDn3
	TsPIi4QZ3aolzn1xLz89R6oWiOwY1x66n/VFmg+mcZw0jIj+xveFYHi6I3lUjpU49R4p+NXSmml
	NqlUkxKaDwEgk353f9Yuto8aH0+Z6a5IBTep6oHOole5+DCfkhwJjHMdPFluqEe1g+m0TW+g+Ar
	QRKufXNYk7QW7evho3g27Dmjtzrf1sPUlgxlS0sqTYidLQTNGhjtoI4a9AGF6esfXiwdHOFnXfm
	H9y1C7tNF0ctzJvIdq2I5aYHn4XDB/wGiZNmTmyzB7wH+bNrsUHI/f7wnjMUbtJokg9Lu7t/w3W
	3Qj85k/9GySL0JYfo91rlB/4Bnqg9bkloj5uQnXT182x6ZI95UqhXdN0kcEHxrrk/kzVOgw==
X-Received: by 2002:a17:903:8c8:b0:2c9:cf5d:d9bc with SMTP id d9443c01a7336-2cf03dc8dd7mr74482635ad.35.1784219369633;
        Thu, 16 Jul 2026 09:29:29 -0700 (PDT)
X-Received: by 2002:a17:903:8c8:b0:2c9:cf5d:d9bc with SMTP id d9443c01a7336-2cf03dc8dd7mr74482355ad.35.1784219369207;
        Thu, 16 Jul 2026 09:29:29 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd42b2c0bsm11828262c88.8.2026.07.16.09.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:29:28 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 21:59:08 +0530
Subject: [PATCH v3 2/4] arm64: dts: qcom: Enable Primary USB controller on
 Shikra CQS platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-shikra-usb-dt-v3-v3-2-13f73a0571bb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784219358; l=887;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=RiIunCof7qxDCCa2KLUOKvDMzS6DAZ+kl5SLXmkIh9o=;
 b=GiDNy7cbLuwW5ctj8xaQz7KiYErvNTfOiEsqoPbpvRBQhmtscpILt/kHzELQEBnfZPc8FAkIH
 TMvDt5hEWsTC7Jcqfyq8MuYLeX0Ucfz2a1bwIhttHD/fcvQIbzzISjD
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: 9k4u_4yaofUTFWemm2gykcr85kx1sEw2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE2OSBTYWx0ZWRfXxZ2tLGJ3lFap
 R15xE5eADv+C9VYWGsQVHllt9Co/VN/FCzpn2IVf6R9xvlRkCRjc+NiGLBFAUTZwQo11OjhOpel
 knX6JF8j35fhGtgTebSzrUOuTWLxWrh333Q3Mx0F6DQG5Xh/KTEhsRNaUoJeYEEHv+lnO4okjUN
 HxU034eHZeVTt1CKzC5+gHCyzut4DFfm1YyZ9cqHSdLCRMkjixPBxvW4mLk92pCISq+D4tLngSJ
 AaqjcDXjnlwwSCntyw+9kZoq/S58FMqOyWr+B5ejqGGzC0aMc5b0rMnTByDzqmHYje5WLivJS9x
 gUNRJn42aJwPWtbcuWQmOFtDHjxBN9C5XScAk+2jslKKsyu9xTBYMK+QVDwRDLeA78Zf5GZdEyk
 5gxuivHiJH7vAqf+F65Dkkxdkc/xOBYjnS0CQgHtOh1dn5im+eEs65ZpzFUwONd6OIVzaiN+z4R
 f7tYE3Zmq8/c8Ep6wqA==
X-Authority-Analysis: v=2.4 cv=f8R4wuyM c=1 sm=1 tr=0 ts=6a5906ea cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=QSxMXEsE6y_H_vlI6RcA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 9k4u_4yaofUTFWemm2gykcr85kx1sEw2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE2OSBTYWx0ZWRfX9PoILVg9vEnW
 X6xudG+C3QcHkLFUtc0e+LfUr1HPp8QWAok8+Dt3x0H7ovEz8T4S++lM3xg7tZVKcK/iU7yYOxs
 75AwMSKiljnrhD1/hBv1r2GnHLd4WXw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160169

Enable primary USB controller in device mode on Shikra CQS platform.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index b3f19a64d7ae..2e96dadd650a 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -38,3 +38,22 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&usb_1 {
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

-- 
2.34.1

