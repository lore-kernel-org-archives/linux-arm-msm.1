Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD8838BF8D
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 07:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419962; cv=none; b=pMBuABadjnyfpPzGhTX11Rikp4YEqKn56kQjy75on9wMt1+Fou7Tmd5bE5uKkae5ZCEqreiT7Ql7NF3m+YDSw998fo4KqW3OP91R/5Vtu+YYTiQ21BuvDADdos88mJJCBxZTfGa4P4LPITJfp5795UYlPzXgCU9YFR+9rmAZp1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419962; c=relaxed/simple;
	bh=uy/MlAsOdDVHNsYX2VAuailb4BNg3bdERgcHE0uw7wA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t7XcvchHRaGvMBTjb4coG64UKbIHs/21mjNcFZIPXo6gkXTjPoXrM9YFtYmpZ4Q7JjUPyKcvgGwz9rABIppUy7Bv0buDoZYPTFCXDExGGYgXJ5sZY+uUUdXTUcZR1QKL1WIfLytyLmE3ExHMqWRDoYg0ebL8MfWfSSSKFhzaRkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=maJjRB+P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iOPaOghp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="maJjRB+P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iOPaOghp"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lehP3642020
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 07:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5wlDI0AGjdSJ191LxhP8RH9JdiqlpsDYcL9VKd3ae5A=; b=maJjRB+PDnz/6jkK
	uya742wfoB3cReWtNvYbzNOilAnq5OYKJRIxw5JK4eapAsdAk6K501yy4EhYIY0A
	PJSzP5hFsiCFD5nPrAub/D3FmodmbV/5w1AMjypIxrlXJd8LBNoSj1sB+HqNiBhL
	CwGhJkLpWdRPuD0CPTKFJ7VjMkWRacl8jC8uY6mgPTbc9GJ2UYqmMZPN2mjLLyOE
	A9sMvtP+5hjTwxfWZgP4/vZ8yIs7ygvdkyEUvzUNlahC3XyK85n8mvMLtWPiHjoD
	pwiybGDrzimVvQ2Kb1d9j/4ICMxEc0CVT0lG7kCiWS72fT5T/QT8hO1XpU958zBC
	W6C5OQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdup05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 07:19:19 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b80835d5so2740778a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 00:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788419958; x=1789024758; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5wlDI0AGjdSJ191LxhP8RH9JdiqlpsDYcL9VKd3ae5A=;
        b=iOPaOghpYs55oIaqKdnHnZZHeO2DyJAlROmZ3L6VkSCvVFKM1p/XDTHVPNs0La4I5q
         NDOLfftpULVs68v3y7P6Zcg+0LyBZBUJWG1we766SW+g2reLlZLhUWpLobxD5UoSNIGZ
         LtBDReS36PchavPEyXc4+SQJwLEiKAWWaknB7Xm6gDuAU++9/ERD/wqv5M4nzSYOAaKp
         /Z5Jtb8WZFIq5468480OjULh6+5/GhbwDQ594ZJlx09TJbtEpefIdMSJzYJozGBy9n7k
         1V5LzRT0ww4QhFg861akLsJV1CG/4nrAaJ6L+BBa6ve/mkQ5vBFFD10nEQ2MXX1pO2nR
         qUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788419958; x=1789024758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5wlDI0AGjdSJ191LxhP8RH9JdiqlpsDYcL9VKd3ae5A=;
        b=ZwokXImprMrdo5ycWaaWTA9RCdAqr61R/K3NiSKvGo6wYSG254gwCH4jmmRghKjiEq
         v8D7rq+rbz86zZvNohBu0VmVmiNLVXjIc83LpLb0760UT1J9Nyu1XNTG1OpQfrO43tki
         OSoudshgMn68RJeg2sGYvGykKWGrFg2lT+RdqF8D3BdzLwHfkI1qezH/Hya59mXITu6v
         AoKgEYbwJQL7GdiM0Hu/tRIrpfXPIfih2dNVHOkXswmzz7acUX0LXg75kXBxCBjAEF4f
         FqRJ3u1T5zVdFIVcAGiz8wBgr/3QdxuI/B4Y30itrhj2KnAZovFw/+HWZ/ri3Epdh2kX
         DaEQ==
X-Gm-Message-State: AFuF++l/ijrt5XDVYOpa2tiQw6VQukX6fHOhce5a4gK3AQWuoDips+hP
	He7/+68YqHk379jCQtiA3/2pcNbCKyrxpHzKgIRP1jE3KgZwc11CMW5/pIX4130s98nho0obG9Z
	9IqO2R1rExtFRAEeMqrChmC/z1pugCQC2sfn5AV0/xpB1vQU5HwXMR3xiutgbdoI9bhza
X-Gm-Gg: AYBFou21kLYCCQ6yhD4qE5XyWNij74a88WPf6fmGvLfEcQnsXpdjI1TZxWjQvJN5W2m
	/l8Vt/mKdaq8r3wipCGlpbS+LJjJzgnmRB+CAWhKjJziXqu0mYE6A8ChFyN2NQsrco+ZASJro4+
	7f3xRZtxjcxX8ockRQiQJc6IQ1g9dFqgi6hccdm3mv7ACFiN8rUI8I1lpNkEhJaKhEI33Hong3Q
	Ug/hk+q2fkxQYuNJrRjogcwxIFKnmNI6ce7tk4KK6Ec3G4GTkVjUmhWNFzlJW141yUJx0ZrYFmX
	OtI+8MrAxqxA8l8Fs2d+76tNh3nBV7VwS8bdGXV6W0HgeRrnHCa3sjsp485she+l40z/8f+F6p1
	44SgS6DP/qGHWx3SVR3XA1RIt6uohftzk
X-Received: by 2002:a05:6a21:d89:b0:3d3:adad:f176 with SMTP id adf61e73a8af0-3d9af5f9bedmr16722322637.24.1788419958328;
        Thu, 03 Sep 2026 00:19:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:d89:b0:3d3:adad:f176 with SMTP id adf61e73a8af0-3d9af5f9bedmr16722268637.24.1788419957886;
        Thu, 03 Sep 2026 00:19:17 -0700 (PDT)
Received: from hu-afaisal-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14319983842sm3992468c88.15.2026.09.03.00.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:19:17 -0700 (PDT)
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 12:48:53 +0530
Subject: [PATCH v5 1/2] arm64: dts: qcom: shikra: unreserve GPIOs 14-17
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-shikra-dtpm-v5-1-e8ea3ac8a135@oss.qualcomm.com>
References: <20260903-shikra-dtpm-v5-0-e8ea3ac8a135@oss.qualcomm.com>
In-Reply-To: <20260903-shikra-dtpm-v5-0-e8ea3ac8a135@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788419950; l=1538;
 i=khalid.ansari@oss.qualcomm.com; s=20251105; h=from:subject:message-id;
 bh=uy/MlAsOdDVHNsYX2VAuailb4BNg3bdERgcHE0uw7wA=;
 b=YdSaaZP0aB2SKEG9yFJ1nkG7/Cuxtc0l6V5QUHcIogWt41GQ+EojV8U28QKDtESqt2/xYsy+1
 +CxRreAqujyD6T3XiU6h0ztdLRiNghtgwddnzVJ4SsAuO6BEIrKHklH
X-Developer-Key: i=khalid.ansari@oss.qualcomm.com; a=ed25519;
 pk=eBXrIUgTWV0cgG+GsNeZPPgvj1Tm6g9L2sfcoxMGrKo=
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a991f77 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ikZB-fCjBoBaDskMKxkA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: XjZFl7i36Esdqoi7EImVxo7gQ8Xtlpd5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2MyBTYWx0ZWRfXwxNha2J7EPip
 FNSrAf9NsROXN1UiQSm35j3F/4GYfL5/Jt54X082vDqzMMs5y0lc4hkx3Mxk/3X8CjQQ41PXQD4
 bAigYNFjDTMR91pYUALzVIda5kk6wkNKhW6B9Oi8t8wsjKgY/idlzKh6wVGl96VKqy0+pWrfBIY
 PwBnhQq+NR9ce9fWppajgAVmD3uBFVVut3XGdnnm4zoptN/aw10/EtEO1vCFooiF0miuW49gnXS
 dCTEPkusURl1WcKQ6UfjoHcgfDiqiNzwT2+uyXBK1vsZNA9HYsglQKKYzTze0h7CJ/K/GLjvpzy
 nd/sdMfLXacmcur0q233W+7CfgfhfIjSKTehELgH4ahuzx34+UMPXJWSa7CtFBnDszYCHkUAwVI
 dRbL7wqyWursRKh7RhbedNNsL+9WFz0GxSHIaFSivtcq2oHYF2/vClEchZFrMHIF3C9SKzNMPPH
 c+HiE71AGVlkEigBv+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2MyBTYWx0ZWRfX3Iy9r06Tzls0
 LmVilU3byXjXsBlpUuW0M4Uf2Xq1McvE3PJ9dnLYIjfpE16NpjsrKQgHRAap4ku+TzPM5m9LPwl
 unrKO+8U+2tifga+mzkoK/10qPtFzOs=
X-Proofpoint-ORIG-GUID: XjZFl7i36Esdqoi7EImVxo7gQ8Xtlpd5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030063

GPIOs 14-17 were previously reserved in the tlmm gpio-reserved-ranges,
preventing Linux from accessing SPI5. Removing them from the reserved
list across all three Shikra EVK variants (CQM, CQS, IQS) enables it
for dTPM usecase.

Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 1 -
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index 8ac42ff625a0..fde7fc035bf5 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -197,7 +197,6 @@ pm4125_l22: l22 {
 
 &tlmm {
 	gpio-reserved-ranges = <6 4>, /* Fingerprint SPI */
-			       <14 4>, /* eSE SPI */
 			       <30 2>, /* NFC SPI */
 			       <138 1>, /* NFC Secure IO */
 			       <155 11>; /* eMMC Boot */
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index 4ff97945274d..e119ace54e58 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -219,7 +219,6 @@ pm8150_l18: l18 {
 
 &tlmm {
 	 gpio-reserved-ranges = <6 4>, /* Fingerprint SPI */
-			       <14 4>, /* eSE SPI */
 			       <30 2>, /* NFC SPI */
 			       <138 1>, /* NFC Secure IO */
 			       <155 11>; /* eMMC Boot */

-- 
2.34.1

