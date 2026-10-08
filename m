Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A5D48EC7C
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 09:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450927; cv=none; b=dMw7xW6XaJzz2M+jctQujjqyDttp6IHDeRjZWMrdZnebu/tHzyscIJhLJFJxQr/yGNbeqQJLSRj/057/1SmlG/eOZfRTTC7TK1gNXcMwu/u8BnRRZ/PbLUp/87ftcnMX4oTBrlg21FQ42QrKidzKt0j5At9cBHBjy3xhvdIWlOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450927; c=relaxed/simple;
	bh=IQF4cz+Rpi/wpP0+xNYcy4785qN3FcQI0Q4cCr8mSNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PkN+3N+L2sMgIRr9175csfNP/dG8dAp3DNV/7mzZPqAtpdfl+SJl2L9f5/0cgD7gsMpg4OgqqcWSCpEa86muz0/u8k4hMRi8jdLWoq+2SddRd/87uWgwiU/E0G5Vgoq+/dIXXxqF7B/o/BBUbFoj5ZHDUdqLmPM+hb3Wu77OVJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cOpPyMga; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aPAuCphA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cOpPyMga";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aPAuCphA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KMJ41845663
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 09:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wwaAuuKQkcqcSjfeKVy94YdxpndXpc1raivuSHngRT4=; b=cOpPyMgamQXj0Ifu
	u6TKLMIjJipuP1Wxsi2Ja7l2RhJrk+MRh+AQSmnqxkDZLkA8nsTHe6uMNJj2U014
	O0s6uEFku1lTT9PVjRt2VvdLE77aGvEZTzoa0vcBufQWSg9JYVQSB01GoyeBTSvI
	rnIV7WC/LAoQvtK34Da1Hwp1zIP/OCMzOH4M6YDCIjzbMXBjxlEtHYFMFNUvtF0Y
	pN7UFaoFT2MLdcPxm7fir7PUkSENsePh+PTezu/kmVEHANqNky62KjVLAtv4ZbMk
	WJ6pQUyZoIEHoQUnSNWvV7raG0f5m2qzzU19m22a1XY4XYixn46X45FPi7BKIFYk
	SPXTgQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3j6w8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 09:15:14 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-155a75f91e1so3787773c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 02:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791450913; x=1792055713; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwaAuuKQkcqcSjfeKVy94YdxpndXpc1raivuSHngRT4=;
        b=aPAuCphAifyp1KMGVmO7YC2Dt1jnTzf/Z6PRGEQHTXT1SWe2dem71rbIDSDq2cNYM4
         c9bDUYFWdpur6Kh9BVCVd8pxumJKDMRYWzHVplJvoEv6mW4ql5Sj2DEiCnOm4PtjQ/iw
         D4zwWN5Yg3EgFXb/maqqp6HmHWGQtOAyUe3fXpQJ+bNS8CI5ESzDrFhEq3JRQafXQekm
         brwzJXwyhxM3tFxApxa+nv+7T7CdwNSlysliFm8UrRUgsFFocLsVm1RktJRhdjT4pEQU
         nGvAJEmLSyzJwyHlB5O0Fnd7Bktwn+Sh5vckvYyix9guJmkQ0yL4i7hlbUpNCrq91Ptk
         9F6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450913; x=1792055713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wwaAuuKQkcqcSjfeKVy94YdxpndXpc1raivuSHngRT4=;
        b=SBYNL9pnOAOqmah5Dhaj0LuXXkk+4e7YXJrB3u3SIIdB4EG4vpSlu1+teK89gyd3Rq
         kpl/DHMG4mbG0Q+W0D6yppAktrWUGBe/jDQNOIlEadle5xERQKJxcREqrxn5VwIVjcSV
         EnTOA4aVIwyuTSmAjQ3ifVrQb2K3IC974GP0HUw5nq6o7XWu0A4Hu9WGpQr3GFyMGT56
         hLWnO+OIGcRYdkKCYmAJiCKYIRS8FiZcNlFVTVUcUZ9nrNri9EjL81AwVXRIs0cKzgSc
         WiCH4/xIRBQIZLFaNx8JXiaQmhCOIv7ow+rgkWU6Y8wEDMtdO2A/Vo7ab2wSPKRtjVFe
         TozA==
X-Gm-Message-State: AFuF++lN0YoHFDDIR5DiOVOWaPNJINCyJUIewmRjfeyixQEUU/9Hvemp
	5vp1+WOAdK3VGTfbbmfFxVM9vAJgrvcEJn4CrqVf4MtlPx5iS14Tzc8bhcnNLm//uttVREOTAOA
	eREUm1Dlr29SRhPr+iM6rRHW0Y4IGFcLeAjlEJx3omGWHUSvFMYSgCSjnNB3KnwCQ5O27
X-Gm-Gg: AYBFou1WkD6539KO+lnXCT+44PSz8BT6TJQMF/+4tUKHLfi1NOcTUAp5LnMPmvFFHpl
	xCUFWDjBOS54Boset15iMHaLcXRnkfy5jEchNy3EguBnI+kOZgxpbTYI3ftSVCIyZyoU2N2WIOs
	r/yarTfP+TD+khu3zHAhAnIwQNYa/vS/6FQWWaz+MckmJkAJv0ctaYOrAtS3flV5E3OHPXa9L78
	CawvpNK6y68i7R1xCCit3846JXh+6YYv/fagtAJGoCy4+YS8PRRbujo556o0cPRBBKWLxPuNRym
	fWNrr0Z0+hprp1O4xemDCczf7TQAEZgk/z4vUoTIJQ3dR4/hfl5T9vQzqhS9AIaXl3LzTyqOZKe
	zTdBlAe89cgxHPJWDzeM/R4WTFu3PVVHx4hSSRh1mgd780L9CKNE3oH57hkjDypiOQSZSxJIuL/
	HlwJrT0HACMc8qq6ALhOHfdYqygjC3
X-Received: by 2002:a05:701b:454b:20b0:14b:355e:2888 with SMTP id a92af1059eb24-165a9abbbaamr2148701c88.27.1791450912914;
        Thu, 08 Oct 2026 02:15:12 -0700 (PDT)
X-Received: by 2002:a05:701b:454b:20b0:14b:355e:2888 with SMTP id a92af1059eb24-165a9abbbaamr2148656c88.27.1791450912256;
        Thu, 08 Oct 2026 02:15:12 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm24456045c88.2.2026.10.08.02.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:15:11 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:44:30 +0530
Subject: [PATCH v6 10/11] arm64: dts: qcom: ipq5210: Add SPI node
 definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-08-dts-v6-10-f9c4ec8664d8@oss.qualcomm.com>
References: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
In-Reply-To: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX2HYDTkPuEdsn
 AhBlnohHTmzybitwm36tBuf6ewWqg8uz+MB3ZscnDbidDFOUH5NfarCDFymc1w+7XqBQql6Ya9l
 7PvC7kR6IwwLBBSkpi9YTdhOBclp1mI=
X-Proofpoint-ORIG-GUID: xFCfxGQR_y3Z7J0S9NBDseZV0hR5DN7V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfXz9n+YFVVdZgo
 eg2RUHcQD8n0amUKXI7UjYnkw1VqrA5dtft9A4sgHuK1uvIQ1md0YEcX7+oh6IDtO+7hvCRIil4
 7nBdZZHYKiwAHjEyTF8jr3x3d/q2ciIbLwnqNaW0YSHu+0SlnmAEarp59yYEZT0odZ4dtsblhzj
 gB+m2+78mfO5CZnP2aCsJTJZ/6jbmQaYiKrKint9hjl+ESEBDm728I4d0cQf6oqSz3+AfmfHdVD
 Zkj9lMkWJ7HLjnCFtCapH0tibt3TqDrKTfHd1RLVZ4vJeP1BQzW78uRCD6GKFjhxwPALa/ZGKVP
 un9DOvVPzHaB3VzpNqiD18W45Z9qb6SzIA07i5jOESg+TfD/MjI4QvbBFifVriPKvlhZdx6ECbW
 eKY0Rqk+1VYswCTQHvLy9g6JekB8sX9HneXWYWdq2UmDwzO4D6HBWseprTmHI5cNavsQK89vS0d
 kb/ONq9hUGgs6VjkNCQ==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac75f22 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=lq6IrNssKMGk0eY42nwA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: xFCfxGQR_y3Z7J0S9NBDseZV0hR5DN7V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080036

Add SPI node definition for the QUP SPI blocks present in IPQ5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 50ce79219fe2..23a2e27b70fa 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -418,6 +418,17 @@ qupv3: geniqup@1ac0000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 
+			spi0: spi@1a80000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x1a80000 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE0_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE0_CLK>;
+				assigned-clock-rates = <50000000>;
+				status = "disabled";
+			};
+
 			uart1: serial@1a84000 {
 				compatible = "qcom,geni-debug-uart";
 				reg = <0x0 0x01a84000 0x0 0x4000>;
@@ -456,6 +467,17 @@ i2c1: i2c@1a8c000 {
 				status = "disabled";
 			};
 
+			spi1: spi@1a90000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x01a90000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE4_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
+				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE4_CLK>;
+				assigned-clock-rates = <50000000>;
+				status = "disabled";
+			};
+
 			i2c2: i2c@1a94000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x01a94000 0x0 0x4000>;

-- 
2.34.1

