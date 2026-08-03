Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9571435EEC
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 19:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785785331; cv=none; b=rYn6+FOBHhfeqnNm01ozWPyFBqCAoyperFkG+wTSItjXgfxXGYEO0W4JBIrz/KdlVPhGJ74ZN+sjlLPahgnu9BT2munZXrti/GB+PabEH/rWuujt6gzHfqy4NfcouROXEdPbWxCMNhC1xrsSNDvhiDaucMva7V3Jzhtlezo89QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785785331; c=relaxed/simple;
	bh=wN7EnvVz79rBaErrpDbknCUjIlKRTgAhcfR9ZiqhdnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QZhro7RU1q4OgnI9zrU6cEd8GDbTfSGqBaH4Wyti6+Ph80/RcMIub35agkwyisMrXz6Pibq3TG5T7Hh/Id5gKku0lwzdZZbiLJf7nOZOU7FIdblLm6BbM7PkgwhTkPsXWCDNsxsEWB3RFpb7f5+OpOGOu/ejC2h2f2NrRktw1Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jKl2cRAQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SXts/1/Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jKl2cRAQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SXts/1/Q"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673H7Hw51535999
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 19:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6b56O3hExLavSIUEO+Tuv4eo6B8V4NFYJh9QW0T3V4k=; b=jKl2cRAQOSWSEX8H
	604Dk8bpE6Wi0Dvubie4QeKka79EEP+H38tiBcn+0QfvdSHaKC3houQFUDG/LXda
	aNDRaPp/4C7aNI/2fKajiy0dBoBBj4vbI3NNmmQS3R3iK7d5xvdqjbaJPjWyHBYJ
	XKf1sCz9ZRG8NPDsgLWAtSfZBfxmqtMmUz9vLwhaKw9kxBJ+tiyYOu03uW0I92++
	mtehm5icfKHnyWrHNpHHlnxjwWuNMm4A6j+KGxQex0yohflSO3YVQ3Z32UiMI35H
	S3HQUYI7zYck9XI5joaugJstlP4i8wqZubwVcrfoTn1a+ch7nOhizqxVSG4p3eMw
	tjCkzA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty3sgkyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 19:28:48 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so4777350a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 12:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785785328; x=1786390128; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6b56O3hExLavSIUEO+Tuv4eo6B8V4NFYJh9QW0T3V4k=;
        b=SXts/1/QRA/rfh08KpE6ur33B+p2kVhVGn+mM/4P9lVGd4hn7PVyh2V1a2x7QT0Tfx
         7i5hz5CfINXwwK8+H+e2HwqNbu/Vvt0hzjgsl+ptyvf4oV9HD+LCdkTBQTV19+ujQnav
         eHKaXnBYqf4uP1P7dlSm641CImkaxsfcRk7cmsrl3WkpkQDvyIDhXiCtJWyDUdpG5wNb
         +3Nj0NVNPlcMS91FSu/9B+3NDP4FxM76xR2a+3nhMTvzRedlBsBd/QZNdTxq+o+t/Hbh
         56vRTgXyYeRZYGZO3ca8sOm4vRrvXT0tEkmfnZPzgWK3HJuyGrdC9N4W46nvVuNbrtfI
         F8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785785328; x=1786390128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6b56O3hExLavSIUEO+Tuv4eo6B8V4NFYJh9QW0T3V4k=;
        b=NuuM7672r4zUDrsRrJjRv6TtysNx9xBiphJayxLFBcRPj0BBi60xB0QgHDzzorBEIv
         FJG2n5bk5O1x2HCUvufQjbrUTtX5+73om5he4vEVmypLsRZbLXExrLPZmBXZPbhZpDvb
         wclNY0/1nmY6YUCjkciz1Eao28j3f5B3TQiBJ7Rd40Erv9Ut1p3RucJI+tF5p8P7tgWL
         fBmtMXUJCoGSIbZ7wW2yH4Y80UMCAeWAzkTxp7gdCVBKPUKsPtOSmDCUtVdT5S17pni8
         aFFNILYavU0EDzInU+pNX8YVwcOymY0tjk3sKZ5g9/TJV8qRW+0vE78QH+SglwHQXkIp
         RWYw==
X-Forwarded-Encrypted: i=1; AHgh+RrUu2MEucrINJb9qLO4wSfT1oIhG7XVX142uzjljR0Ppa4MieEDGzT5Tg33/itcolp5FW5PcEGcQ11hRK51@vger.kernel.org
X-Gm-Message-State: AOJu0YztMieJjiFhgJuVnf7PJ/TqgDbUeWhy5WGQOn4ZV+npPFaOZa6V
	+sOYPAvtQ4RPaMC4ei3BFv7w1rKHmzC2abXm3oQzNRPUFWuq8PrewxJVY6nJuPnJK1TJ4qGRFSJ
	klgfa1Ups16y8+4ttsj2/AodV9ErMs5n3wWyG5wIlttWg0EBcK8TXciIeVK98Pj8X2Zar
X-Gm-Gg: AR+sD13p5MwwryPj4ZRjAgTHBqcuU+zDlgVw19+67rQ1YA55Xxa24iNHI76W0vDsYfi
	TYQE3lMof10rgmRPX9+dbczS+VGWpkkn+1UQ+uLKRAWKxANQL4u2BUwWvkmQ44yci2pX1YSe6MU
	QoZgALkxQ1kJb/mJ8xcOZAnw2qBpdZJXVmXUDu0LB3G22pEfdryWLh1pAf9txUEpvR3n8oUlAi+
	0SSalnObeOHpMan/oQE26S8nwGLuDQKZklb1S+VcXnb8Mlu8q3Ew5vND2R3pHeSsh17erWwyGCk
	euu1j/Ldijc+EpJiwSms5vju5jSMi4iP8EjtSiT6RVJVdjQsKRgQfFiOprUNDfx+lZlE4xYc6cS
	8y1+TLq2y47FgTD4RuC/QOCcVBMIWdw==
X-Received: by 2002:a05:6a20:d80f:b0:3ba:cd5b:3dc8 with SMTP id adf61e73a8af0-3c92a5f1c89mr10958857637.31.1785785328077;
        Mon, 03 Aug 2026 12:28:48 -0700 (PDT)
X-Received: by 2002:a05:6a20:d80f:b0:3ba:cd5b:3dc8 with SMTP id adf61e73a8af0-3c92a5f1c89mr10958829637.31.1785785327611;
        Mon, 03 Aug 2026 12:28:47 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm38622738eec.1.2026.08.03.12.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:28:47 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 00:58:00 +0530
Subject: [PATCH v2 4/6] arm64: dts: qcom: lemans-ride-common: fix SerDes
 PHY regulator supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-b4-sgmiieth_serdes_regulator-v2-4-c4bc688177dd@oss.qualcomm.com>
References: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
In-Reply-To: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785785297; l=1293;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=wN7EnvVz79rBaErrpDbknCUjIlKRTgAhcfR9ZiqhdnM=;
 b=mc4Qxcim7cpfZcq/vHaJ6rhRe2m50OR1wGF7K/e5Kh6fBL7VRKbtQc64BR2nETvTO/AHAXifF
 lCXbrv5JUSnD6Woig6Yu2Tdl6BEQJyMJ3mL/4FGIjpUWf2sRHOd1V/u
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE3MiBTYWx0ZWRfX4JK0xPmDtNzw
 vXTdVA4NqYpGkbbhKHCECaxGAdVQB282hZiCvR6R0q+8bl6LV4HfFd4Kd/rN4VkMvYSdp3y2K7U
 om66GyVNuX9ZKt32jnwUyX66uP650hw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE3MiBTYWx0ZWRfX1ccRmAV9j7Hl
 id/YLq40xOuiSVZJhKFcfxvMhjg95mQXOU/+6DbdVdYQPvN+3LmSTFiIpMazcFoOiFS3T8a8pUF
 7RiZO7GDtEScoggSMadrcvdUuT8UeS8MSL2BLdyOaciRTBq1oyCvLTCMNApL926nBH/SDv6bKX2
 HxBq/Q/M40P5+wE4cVftopiDCnPEtH2btZLqth1ppONBxq804cvblHhLI3wJgB5Xp/a41H7DjoP
 UyaLD3LHTXyUqBXavB49qzhUHMK6fuuxlzXQNYAyAMXuova9ILyj09Eq/w0zGw0bOwaAxogI5zu
 ia3iANDyBmg6lOWxwZ2Fdgwb4oxyM1D4IltsdXFlmeyFdhDq+KF8ClWf95QZO5YVuGzTOjNF/MS
 fv1CBHQM/zNLyNj9pUQ1ye6FlyrAZsk3RP7PXRQZEvj69r82U3URsmYHOoRZD+sp2YKoFs++gES
 8leb4ssytQBeneA/ANQ==
X-Authority-Analysis: v=2.4 cv=Nu3htcdJ c=1 sm=1 tr=0 ts=6a70ebf0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=0PZ1-FZOml_IEO0701oA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: nsOZxH0wmDr2kkIPpxblTPhpTrwzIlq7
X-Proofpoint-GUID: nsOZxH0wmDr2kkIPpxblTPhpTrwzIlq7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030172

Both SerDes PHY nodes were configured with 'phy-supply = <&vreg_l5a>',
which was incorrect on two counts: vreg_l5a is not a supply the PHY
requires, and only one rail was described where the hardware needs two.

The PHY requires vdda-0p9 (vreg_l4a) and vdda-1p2 (vreg_l1c). Replace
the incorrect phy-supply with these two named properties on both nodes.

Fixes: 5ef26fb8b3ed ("arm64: dts: qcom: sa8775p-ride: enable the SerDes PHY")
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index cefb8ff0080631e25e9dd3a05cd810c6955bf1fe..923fd8736f31df2eb5198b27ddf52c171f7b2943 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -856,12 +856,16 @@ &qup_uart17_rx {
 };
 
 &serdes0 {
-	phy-supply = <&vreg_l5a>;
+	vdda-0p9-supply = <&vreg_l4a>;
+	vdda-1p2-supply = <&vreg_l1c>;
+
 	status = "okay";
 };
 
 &serdes1 {
-	phy-supply = <&vreg_l5a>;
+	vdda-0p9-supply = <&vreg_l4a>;
+	vdda-1p2-supply = <&vreg_l1c>;
+
 	status = "okay";
 };
 

-- 
2.34.1

