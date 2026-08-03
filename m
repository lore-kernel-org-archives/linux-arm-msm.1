Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30BC439322
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 19:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785785343; cv=none; b=lXd/BRr0PTN69fUv4g78vh8VXo31t+pwZseSakSwsz5ocimVMSbpGl0mcg/zUZ6h+SkMhDBGqh7K+bmggzFZ6qt0OpgPZFkxPMOxZNNcZy3rGOOiSTTBoO1cn4BRAuHjqqNCwdk8RKNLMccbk/7qtUunSf082CTbh/BIvRAFzXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785785343; c=relaxed/simple;
	bh=izZAAQiMKpd846XRQoInaW0CONJQZ+YANSqul+Shiak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k2OhkZWUKT9V+O3jT38nu3dYN3A4LSgIQXjQ+wzlqovb2hWhkw9BvUd9S1wijGSbQai1wamHHG1a+beYmfMx4yz15q1Wn06mT52W05mfFQKUyJ4IcDxcyNG3rT0Bf9eUurk0A4Ze/wMEt0JZ9C+jdJapEtlnw9HjRBkY0YkcjMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hwFyo+zB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bop6DPXO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hwFyo+zB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bop6DPXO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673GvpoJ617109
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 19:29:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BVntk5RjiFkpJwCbB7NEt9eqle6RMXf6vY2O6thyA4s=; b=hwFyo+zB1FarSUVz
	dDM49IK/eFbGCn6REkqRUB7L0KwEEMnGnPRjWMRJsuL8rnB9WGzfqSByplPIgL1S
	qFHZTDRPYGXHda7jnrOybrdTtg1qrOzPkXEzmy90WufB27HvFMs3cNjAo9r4dEJg
	QqYcNjE2K4d2ULFcxcH6QSwPHgyLbRPmL9EtN62/a+MVyl+sI2RNbtZnNB9vNjmp
	4Jy4uVbNJPwxjLa0f5uJ3HwUdhndOfFdAN+fxczl8YIdygc64RZGMW6IZxU+gwLx
	c4KABauu03pPy4AwbgVk1raziiQYSgiDIZX00gMOt30IlPSqOHT6LuJBN3PSs07T
	d4Emjg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftx7m0xfy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 19:29:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cd01a14e81so47539955ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 12:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785785340; x=1786390140; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BVntk5RjiFkpJwCbB7NEt9eqle6RMXf6vY2O6thyA4s=;
        b=bop6DPXO0sPJpN2Ig47SmMoy8bCtgnHkrHo6U1PIfTW4bfDEn8ES1c8x42YO4HN/Ta
         U/OwKpNe/h7busGAJmsAxlGdL+K63wI4qW2XQZ+h+WReZ5rllIQD8ijjm99GJWLO6LPn
         yeFR76yFgHbxD7s1IjlsgaHwMhxlUkjKxXLZ+5RsStTV/klK9kx8xrwTLQaLY4ilzWDS
         4xPgGmZbjk760kiRnzPSBd/CXBvMIDXiJlPuOvMhfOjLDoa/1BbFH3H7DlFprS45koHV
         8mMFiLinOmWSr4SYXADeQplJLDAP6MnscyqKmLU1ys91KJYKT871OyQ8tWZTeSd8lorJ
         Jc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785785340; x=1786390140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BVntk5RjiFkpJwCbB7NEt9eqle6RMXf6vY2O6thyA4s=;
        b=LbrmZar1a9WVde+ATDDNRpK9CF3/LEq9NZ+IGyVBJ8PVkqw8qle9x4FQjf2ziSbmkv
         GW47ubc83mArYczo9G5KK2DdykEBk7tyRaRYbyGoa+Obuc1GgRnYjvweVp9OdxbHtLhc
         UzMb5P02kh9pEE6HUKunwhlT7bSMbPna4bGFa0oJOCyLvnna8ZNDIYZP+e2wvmCqbClF
         MgeCKiPqKrIM08QT56PDeXOuykyd0MXznxdWVinrsjY9E9jpZkYn26XWW3z5tgs2AkFx
         wLsSDJwk6HsaPuX1+HCPTBqa3UJro+AZodHgDX39n0gE3TsIZqPgVzMOgovKa0UeNicE
         vWsg==
X-Forwarded-Encrypted: i=1; AHgh+Rp6IjSWHlT+ssdxZoHRX6q9QCvPxkhbtk8V339EWxPDreBgPJIPBttrHWIrkoU6P9eoUs00Y6VzSYe5lt9J@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3WWP0fWxI62LlAR5mHiFgnSFpCXI+fOvniuNlmLe8oCs69hF9
	pDNS6k/kUGsAQAK0eAbey+76OirB05xnGfIm4OehKFNO8O8l/SGnNjndK6JoQQQyi3qL8Tc8ytd
	MYG37ooMEgvMjin3zAqe0mcdS4FwzMq8HWIv6RUlGuRw5oK4rszDHUqyFKk7BOuLmPD1h
X-Gm-Gg: AR+sD101R8ppWcsYqzpOYf1ZlNmsfCxh+8cyoWsO6huf/9hjRBZTUxCLJ6HGBvfmOt7
	mFuxdvYSHBIC+nQtF9CJRULWUirgWNsLWmWM9gFii9Rs5JZmoR7R4+TKtWqHGRwSWZPuE6oSXQn
	qJT4M0/klQtno5a//cAcGGX+49Sra6qL4DVG1gkTDy2RLEztC3MPk4y7sfTZnc+Z3qO5LeOKkUR
	wCD+qyiErg30kZ4m7TvvK5hWyH4t3TM5+lpuQBdx3PUk1xYNL0Z0J73u9ukmlVKyHNayD2x5wRa
	9L3ofAAMweldHeKYx1OIpy0g9Jt3be384Jfk27h3w1zcqix5vSiDQfiHZnRwyY1O9+VHz8dcjM7
	xYn8Z4ABrZSOj9xoKg+lc8OpfO205Wg==
X-Received: by 2002:a17:903:22c3:b0:2c0:a555:80d6 with SMTP id d9443c01a7336-2d0521bcb54mr105343115ad.2.1785785340216;
        Mon, 03 Aug 2026 12:29:00 -0700 (PDT)
X-Received: by 2002:a17:903:22c3:b0:2c0:a555:80d6 with SMTP id d9443c01a7336-2d0521bcb54mr105342855ad.2.1785785339788;
        Mon, 03 Aug 2026 12:28:59 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm38622738eec.1.2026.08.03.12.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:28:59 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 00:58:02 +0530
Subject: [PATCH v2 6/6] arm64: dts: qcom: qcs8300-ride: fix SerDes PHY
 regulator supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-b4-sgmiieth_serdes_regulator-v2-6-c4bc688177dd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785785297; l=1012;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=izZAAQiMKpd846XRQoInaW0CONJQZ+YANSqul+Shiak=;
 b=VCkjc2WPARIqmhG/jr9G7FTASS5HS6MDritc3MjarDa/wUU5RqFTIfpyfMlxgGHF9oaXnmsNB
 Yx5FbgUTEXQArj/I08GWToQ7v52Tdnr1b+fB4tXftgiiTk/d6Er/aGC
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE3MiBTYWx0ZWRfXz8Otihx4b52H
 TEVId3y4KZgKJ/NO6ARgBC2Zo/GLZln3M3v3ph9E6ziw5yT7RNig2Xlq6zDibTLtV47SQhTZKVF
 EQp32z0jLbmvWJ9AzZlN1QdysIarGWohwW5gwr3VVz2S16ocl+YoCe5MSlvZzfu0G9CR03XWP4K
 FaYfujvTHG2yQRNfjP5/Bcm1lcvwg107tIy0Xkhzu1NqSd8tGgvUaXnrmW1R7562aFc2i00CGWR
 AqGp4wss/8HPIe/XzTk+Ld9sPlyjbdDXTwgdxftwaZ1CKxXoTlJPJfUCGTMX4GJDfjESMS13mEO
 ptMtEWA3nlnYdG4s9w0nD1lHwYHtpQ13Ctk3VGaSLOSxFh6XeqzigMhryek5ZcutBcQny+0xhRM
 Y5sWb5aca0F8tTsOV0n7wq7mp3E6qXZNRXGDVMt8b+jzXSq8CBVb3CI5pczU/JKBsL1efruTELk
 tW7d6F4gx4TQX/B0HXw==
X-Authority-Analysis: v=2.4 cv=TIt1jVla c=1 sm=1 tr=0 ts=6a70ebfc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=n698lQYe1Xln1FfB2wUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: f9sPAsev-79Crc0GuEVyqXx2f81SET9m
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE3MiBTYWx0ZWRfX7H/LwgWxBKwL
 VsUDzW2ENRZu0868JKagontmly6rjPRxgmwYMopRX5QypYfBFpk7qjX0L+iZ9MUnI1BSuoOtSWO
 D2lne3uhVfpT2gLuqV8++WvttKvwdO4=
X-Proofpoint-GUID: f9sPAsev-79Crc0GuEVyqXx2f81SET9m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030172

The SerDes PHY node was configured with 'phy-supply = <&vreg_l5a>',
which only covered the 1.2V rail. The 0.9V rail (vreg_l4a) was missing
entirely.

Replace phy-supply with the two named properties vdda-0p9-supply
(vreg_l4a) and vdda-1p2-supply (vreg_l5a).

Fixes: 787cb3b4c434 ("arm64: dts: qcom: qcs8300-ride: enable ethernet0")
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 1ff39530ea3deebe454416d70a289e44c2d89e3f..76c34215dbdf07e520fe96d350f52da8c4485c97 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -702,7 +702,9 @@ &remoteproc_gpdsp {
 };
 
 &serdes0 {
-	phy-supply = <&vreg_l5a>;
+	vdda-0p9-supply = <&vreg_l4a>;
+	vdda-1p2-supply = <&vreg_l5a>;
+
 	status = "okay";
 };
 

-- 
2.34.1

