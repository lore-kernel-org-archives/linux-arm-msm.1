Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA413E9C1A
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 08:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789894197; cv=none; b=VRdRoYCF+q1yukbWXO0Ll5NA3lzrwtNWVQEFmHxIbQDzFX4jJVowhI5AT4kV9SYnNGmAkLJ1xVZduZT9FtR4IcYZBtUdoa37dpUE3PZWDnd4FEczsEkJ/f3ZVJdA+SNjzZy55t/YMsMfIP2/hSkUakL53RmjUuZidxfIfsFIkJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789894197; c=relaxed/simple;
	bh=UNWrCYUmKF8a9BTxU+3YVNEjxJrki4rae5vIBK1PtQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t0xGt/kcKXFMo12S2Z2O7k5AE5WqytZsfVr8jdKXKNmFAju5IDLFBaGPxMDCVK04y3x0AnV8F2dQguouTOkw1XY/eYYkpAWoQOQROuJKCb6y857FSHWMFQNCKRpXZJk/Mnry4vEBPm+Xtbi5W4wpDQd25KF8OFsou22rx2kPTyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hOnP5VkN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jESgOlwf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hOnP5VkN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jESgOlwf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K8WG852363521
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 08:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=15/F0omI6ey
	VaWtg+k9gQhvDCbpTtZA0dSnC/zlpdTg=; b=hOnP5VkNIrwnuyyvAfniYEBUdA9
	uplzykEBuk0dTdBh10imS8VQKjEKtg0+2KwkE8Xtvn+In8EXqV4WSZpFs45YAGyd
	j/BCTlEjJI/PrgO9B6yWaJTBxAYyii8SbzUq6ow/4wEJG9YYzsP37XzKfq+OPxu2
	PCXtYFXVwdherDMnxh7T7BmSB2Cm0N387k5aBEa0Nf0DHMgDuIXMXAKfwKnp4iie
	f8ZjAQ2uQlWr3usJYhphltqwUav9vcZ2qzT0HuOqJLjIk+on+sIDBUlkbOiEOLO4
	ieU4X5f2VmUtkGwGZnFGuVAWiauI2Al5fJ0WPKA4wHNEA4ka+kgK7/dSzog==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshd62r1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 08:49:52 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so791856a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 01:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789894192; x=1790498992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=15/F0omI6eyVaWtg+k9gQhvDCbpTtZA0dSnC/zlpdTg=;
        b=jESgOlwfbzb+E/8faZOtMqCpbBbvN3OkZA4Af7vB0HbbGCnbaBNQTnKwzHNXyonsRh
         cdVRxI3Wct+dAVL26oW1250cob/i8Ew6kIutCJhcw7brJljYViks9Tjn272GLtgP/4NQ
         154G/NSB7jCN0cnVh9f+yRSWliqiXcdytJiqVccdptgIMWjfHdk6mjKoh2HgKZJqQGV1
         uCRdELvXlmi6BbAD1tsk4XwKXdEf/1SAJD+QzQiVX4N/lP6sKrF+TvHHXxmIq70d0D3t
         ZMgGrZDBpyjDVzZ/cCech/npkqbO5mn8Z+MpQK3ZPdRzT1LLaw7eyHfL2LRW663+j8Y+
         vIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789894192; x=1790498992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=15/F0omI6eyVaWtg+k9gQhvDCbpTtZA0dSnC/zlpdTg=;
        b=JASKNSSS6y96sJOf2AJLG3WYQQHNeWpUz45/wPqm4w9yn9ojGGCBDCcLW+YNm6SKpd
         fduR3EZBkED0L/hq0A9YGVauPLGSgJ1tHyE6jGu/3NAwcuYatGlZL78ttUg2CrnHY/el
         JdA/3LhQeIh8NKhardssrpI7sVHFhXjroW+vsAFjlFpJBoEUJL6hvFPDbbpsB949sxyu
         gZloRWPNGxchlht/7sXP8PVSTcowl1tAGNNSEdjqLPwrFdIDEY23Osi2kLt1/3s/k1CK
         Vm5Ji6fQaeqZiwMQCCT9XzPYm4zkOaTRYBGWePn8xR9SajOO3kMqA9pRifhiDTb1GmnH
         EkVw==
X-Forwarded-Encrypted: i=1; AKwUvBy7OZdlO6xsoOreo+xT09pL2BoABa7U0qE6tnmk4Nt1tCNwqT/idNO/dUWuQ7kxkQxrsgJSqRsHUd9b/43k@vger.kernel.org
X-Gm-Message-State: AFuF++lf58LSdBDs/uBDtkyh2BoOtS961SEW6ZhtPSC70/b0uStgtTDf
	DXiOm3QkdXrFgpW3AT/yswKWPdkI+h1n5wMyGIunB/uzWmuB/CksZro4N0h78QGGzIgJwX38zUE
	591RBwCcYWmAv5E/f3iuXIQEkj9aPRzj8hj+NXAAta6OKxeiItZEdm+/KokEq0yTrFk8P
X-Gm-Gg: AYBFou2j6/xyBa17fuZ+Zd+t4HRfn+u6kJzJ0IaNfIJIMPx0eEWYS4IumuMMJYjZNem
	9JZt9zqVoIxxB8LqoHvP1hdWpX4dwvQyuzJ16MNfb1dEMo6Nw+hGchCisPo1rQq4/xt+S3p9prb
	yZGfb7o8Jd2N8wPQD67uEqt6GjqrP+Q+h4Ivowq7ahu5rrcSV2FnjQXmEvSX/VnzcLzo7RoIk3W
	PqbbpFlWoVAWe4FKNNjs31ftXoYSehhFLB4Vr7RLUOUSWk+kIHjGuGUhyxtdpJEcc9GF6ob3qfU
	u9f1zE9TilLuO8UTWh6gGCAwY8qwLrx4yesZi08vz99kusDDLaLh1BJq84TNAO3wl42Hh1lc94v
	OslViPzCBifm4QLqw2Q7AlTS3m42NWxeE2VlNuj5k6q/VCN6SPGfYCT98NWas
X-Received: by 2002:a17:90b:1845:b0:3a0:42a9:9c7c with SMTP id 98e67ed59e1d1-3a042a9a00fmr363007a91.39.1789894191847;
        Sun, 20 Sep 2026 01:49:51 -0700 (PDT)
X-Received: by 2002:a17:90b:1845:b0:3a0:42a9:9c7c with SMTP id 98e67ed59e1d1-3a042a9a00fmr362980a91.39.1789894191451;
        Sun, 20 Sep 2026 01:49:51 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3314313esm11180808eec.14.2026.09.20.01.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 01:49:51 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 3/6] arm64: dts: qcom: nord: Add the SPMI PMIC arbiter
Date: Sun, 20 Sep 2026 16:49:17 +0800
Message-ID: <20260920084920.2201418-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>
References: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEyNiBTYWx0ZWRfX3bKQwneJ8L7/
 NyXxvEeT5LqVBMhHRxUgb1dvOzUu/mmx/FV91vHE5d2XhiSl3l1z9pEQZGInEGH4303l6TDtWD+
 Ed+fhZm5YXAOQCNGuwmDMWTSGWv5LOhQVwz/pitO4vZngDxHcXcrQpI/bT0b4JIoo5NE426mqvy
 2IxB/2IEbccTibUCBOWQ5/bNk0qp+d2Q/38Nwio3Fkr4Q/W13QjU1ckszr3PTTO+lE/ESKB5AnB
 B/CYK4k5tsXN5LqiZaOS3h7GLqmoALDx7f3rzIgIbTWae8N6Oojx0bg56BqLISVzxXy+gL17Pcr
 EHq6t1vAW6SHR5LGBsGuYYs3OuUnse74A3KJKPmr6E9j4cY8ReAlcNDBWGCSh+O4gXCOjcMir++
 EOTEp+7NzzIGCGYgFWzry1HtGWFcRIQYuBgVR6P5GgeyAfCVEUfMPVs5lHyMec44ykrFlPBF2c8
 erQTgi1ijyp/5sBxitA==
X-Authority-Analysis: v=2.4 cv=RMQmjIi+ c=1 sm=1 tr=0 ts=6aaf9e30 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=pTKKwl7rlpcWqDfdxRsA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: iPkKocafwaigdM2YB3WWGPWwBCRrhFNG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEyNiBTYWx0ZWRfX0NqIAAZjfSDe
 giLdLIldAdHwSJj/cT8k5jqY9LdZN5zpvOHAlUv1n78Q4leq5qrt9Aupij1EwTPOXTuS8sd+gVA
 p4U7uB1bGd+8meX/3DLDAMcCmWSe0bo=
X-Proofpoint-GUID: iPkKocafwaigdM2YB3WWGPWwBCRrhFNG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200126

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Add the SPMI PMIC Arbiter node for the Nord platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index d413341eac41..926ccf3bbe4e 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1866,6 +1866,28 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			#clock-cells = <0>;
 		};
 
+		spmi_bus: spmi@c400000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0 0x0c400000 0x0 0x3000>,
+			      <0x0 0x0c500000 0x0 0x400000>,
+			      <0x0 0x0c440000 0x0 0x80000>,
+			      <0x0 0x0c4c0000 0x0 0x10000>,
+			      <0x0 0x0c42d000 0x0 0x4000>;
+			reg-names = "core",
+				    "chnls",
+				    "obsrvr",
+				    "intr",
+				    "cnfg";
+			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "periph_irq";
+			interrupt-controller;
+			#interrupt-cells = <4>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			qcom,channel = <0>;
+			qcom,ee = <0>;
+		};
+
 		tlmm: pinctrl@f100000 {
 			compatible = "qcom,nord-tlmm";
 			reg = <0x0 0x0f100000 0x0 0xc0000>;
-- 
2.43.0

