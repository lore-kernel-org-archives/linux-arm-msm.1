Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1715218A9
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 07:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063506; cv=none; b=MzASK2dGs7lsx9OcL/3fOfg4XtzzIbI+oRK8n45hi39qX+b8Lf2xkEMgGJ/LeEjYIP0/ftW5anJpEkU/N9/pACqQjuIl28QRMv/CbxvIOE0/5LLxl8bApBlPSQB8M+OdgL1XAGD9M7D+315z80NJxyEcpLxBCkL4ootBo7Udpak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063506; c=relaxed/simple;
	bh=tdYKWjc+NjQwtKiNkI0tCZlBsk6Wmv8Tj/eSc4bfL5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TG1UXhHxzZKrea8gorrURdBEpV8JYBoIB8kbFz5JjSxyD8XSmu4oaYpVM2vE8qEDkt8OH4TlIBR1WoTkjPqNzrWOlgvB7lF6XXnvJ9sBK/XhDch9/LwlSjrOMI2+PXBEm+p2LrMYi7um3jmTn+u0vciczEUlK5eh3R47VCRktsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UqMGuSxX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aDvSALQX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UqMGuSxX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aDvSALQX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M6mrnn2165603
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 07:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	910/59ZjODSQbXkyNHJ28zOmrunXaISfYgIhTPij4ys=; b=UqMGuSxXUoBZTGfL
	T3pcFrYgxMD+g6XNwSEf6hTuGuxSLk5IB8OwYssvx2FVAYWcg86QUPtyg2dg5lsg
	850KlC0kvZlGk094PBqhalUf+M7xj8IFtDQZY6JVzgfqhzXxILu7NBILeReXTQqZ
	9aXs++aVcdL5Y/PMmgfI5gfyBmwb4Rf988gtMZw2KXMY1bzkVaZlhs6cKBuf+LTz
	qkxmIs+kQVADG8uxVAJlSy8s6Z60KcW7wtXxS2wZ3G1EnXaqGDwGBguvTskbNTRW
	7ZRxd/N3bPIa45uJvvdQiUSgPP1+Y7fOpISH0LLL4PyCfyfG9rsA6U/Lo4OyX6yw
	FHvFFQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xetw3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 07:51:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a0312937eso492923585a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 00:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790063494; x=1790668294; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=910/59ZjODSQbXkyNHJ28zOmrunXaISfYgIhTPij4ys=;
        b=aDvSALQXz+VJqOZraf8Sm7Uf9i8BmEwX2JKlTRS1PPr3zsOKt32UBGONOBqlZwNrnP
         iYXrgcnOfadsQU4cLxF+aQxiHZkaYzPQqsru2/D1kIAKTqOrB0FOda1AxfSUPXz/GCsy
         dzAYwJmCH9qaLIXBbScq4dA0zSXXL9SWLk8FlWVtvywpLGedmb4I3mR7zWekGZdmc7BV
         PGmqzx0GJSdy4uaVRIfnbTyFsNk05D4ApEkTYjZzgBjMctbh7NKd+KMVLeJzBp2lrCHO
         5pqhas1L0XoRDPeNl7tdGYD8fqpVBhyxIKfhl0Jg4/xRqnGTv6nLiOnm8ou9b7vnZN8M
         Z62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790063494; x=1790668294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=910/59ZjODSQbXkyNHJ28zOmrunXaISfYgIhTPij4ys=;
        b=0E7gcvFwvWBt3dLfjPldTcWAvUlau1kBorUJ5Bt3fkkCkviLpChJegYXbcWBEh/XtC
         TdwmsRM0sH3H2pLs/M3Jfgln6vA20frqpdmaMYFa9TUEYfMwFKB3wj8Wey1VpcWj8c5k
         KS2q6pASONfzj857geywyoclJ1tvNzs0dscF0gCd8e/M7ugKHw1g5pd/+7DYWAppOpN9
         Vy7bOdMBOLicvQRGZYNbOlg9CAB2IZ8bMO6xB5IKzrl+jdMyJ7U0E64wDEztMyMHelwF
         VSyTQJio++yFksURElDp9vpAqenXKPtLKshw/DWMqBQqH9uZl3LeRbelwg2O5vNarunO
         a1IA==
X-Gm-Message-State: AFuF++mnio4B8ABYa/3NBfH59+TGgsjIFYInOcCGHa5BkriqSIRsyeSk
	udSH9jkBj4mT+ONrGY7vH0IdlvZd+KmEf3w5wVC17M5mXs6gFPgG2cpdn8vTSwfQ/1qwC3hWRx3
	0L5jsG/BNuTIxtR3+3rDoB5GpYM+x1C6e0T71e3QkS+KTcjRy5TDfB24Ck0r8lndt2WcN
X-Gm-Gg: AYBFou1JlHeAoCRDR0TRXfbNiGSxqOwNdyv+wI4uAVa+KX30vNQAua+BerAE45RJIh3
	FzZKUCqrQmdYIj1T+gjjrhjiDMq8kXIkCWxN42hO1KYZQIbAhw3A9qmh9JBZ8Md7hfKyzOtUQje
	JZpShJ4SqIFV1yIy04t2CM1RME9IxM2xcMda5X1qRehHNB0UeesiJMIw8MKzVHHK+7YNrvqiP5n
	2NJ7QYwANshE2crPwwZXXHy2qSn54UVWHpHruSdgoBWunrN7rnQIursj+SOACsqRIf73pr6LHgf
	lWFOJi0atXhayxbM9/ml5ocuP38W+mZp/axc/pLdf3v7A/sFMgpuC8bZ3qquhM/qD+QT1xwCt4m
	iKMaNAAyI
X-Received: by 2002:a05:620a:408d:b0:939:fc18:4233 with SMTP id af79cd13be357-93c15d76208mr482020685a.20.1790063494155;
        Tue, 22 Sep 2026 00:51:34 -0700 (PDT)
X-Received: by 2002:a05:620a:408d:b0:939:fc18:4233 with SMTP id af79cd13be357-93c15d76208mr482016685a.20.1790063493609;
        Tue, 22 Sep 2026 00:51:33 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862789080sm3046925f8f.28.2026.09.22.00.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:51:32 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 10:51:11 +0300
Subject: [PATCH v3 02/13] arm64: dts: qcom: x1e001de-devkit: Mark the EC
 reset gpio as reserved
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-2-fde7f8a53382@oss.qualcomm.com>
References: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
In-Reply-To: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=tdYKWjc+NjQwtKiNkI0tCZlBsk6Wmv8Tj/eSc4bfL5I=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqsjNzmmms7uVbJwTZhxlQ2MCed4v1RIRwdCdk2
 G2FXMXtF0yJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarIzcwAKCRAbX0TJAJUV
 VvwhEACQspOAl5BTbpmB7KcuCGKwZwzz6Cwyq3t80uM8d/JUh8OQyDfPbgeXIUZk3+bPO4L4zpV
 MwZzj9Emf71gACWs10PuxrbdkWjRvAC8XnWKEQjlTSNrzgkpJp5+9FIbsyF02J0V/IhgXPYe7FN
 rIH3ZVZTcLcWSIzsyXrjEByOWY1ZUkhJ8lyyH1GzvHykdUW3Z6dprnOKMoh7wQ5+LXhs7liY1Xw
 +MPZDPJNreKmKWkxfEdjwZ1JRQO8zoNiZeHChlV8rOfSGOQgDqIzSoA8HOkKMap1q60GG86C2Y8
 v8xMXNDcYEpvc40drf+0A7Ph2UlD6pSP6qb6xlq5HHDGP/kXUy7vzTIcme+FovRajltSaalHLyP
 kkQiYZYClB4i2XmItA3mSY17VO0jEghPzQjHhOa+UrLjNhOzJXF9Vrx2D0TVk5kST//CGiGnmxz
 iyuQmye/ciI/YMEKjO8yV5iCCtJccN/5ul/J9k0sxD40QiPvhfJdhkj/V4BbjG3fppulYSiF3el
 ayD4t0aERtSOvNwAXxvWOziiraIePeHptiG53GO99blXvejsMr4LH9u+29uWMa8qi1Euyg+Q+hp
 I7hWh5nfL1KpzCnu6uAyX0dx6/d3emHjryacBoOk0Mx5/EFZf1is5kvMu4bnCSm9QizFlYST9Am
 NQLuYi6cRQe+A6A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: EQRXyoYX10Pgo3tz9leBxr4WVEF32C5E
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab23387 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: EQRXyoYX10Pgo3tz9leBxr4WVEF32C5E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX+tvD2ZEiOqpA
 /+JV0lWHLnw6fhbnZerv/haqfUwQi5YUcUFSCOgO6IjtK1xvYIfByBZlfEE3qW5nfH0WaAWRepE
 TgXeuQWWOS1qH8YkSBQwIdvq3jdkzdwe71dTzLBlfUlPi4OJEG/LAI6kn71F54E73oDFp1cJmY3
 HEXgF+vZzKNi3CzKpfy/1XaIHDsdIl0nVIQqNBoTx85JtWb5EWJGAsR2auny8qHg4XzISFe7S9J
 74L2Luycv8yhtS75iWfvebqugGTpEhQLg99DiZWMtCpLDjq1sdg5I+PrTMHYyE2Cp1XH9K2Of/1
 1khdps5lgmSlrSCVwG8fw5ztcXDYpu39mhQerelLnrp20tn/TAbHs8oR1WXChOuMc6agKdaH/Nb
 xbCjFOsO4Evjz6oMQtwFZMUO55HZeNWVTgOTelz6jCzrKeMfGdVg6VeaOqZjJfoaHtNDJxFRHLo
 HhBgHBIxuiceeD3iUmQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX4DMDhYoUp0aG
 R+UEySUsbN3pqTomtADqwoY/FxxWrWAoFa96uRZShhxqEmrdH/L+vreTZXH8pHAKl1qN1ReTvoq
 ZcgwiMG3roLzrMrFDRIFiyIn+Lj+bFU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220111

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: 7b8a31e82b87 ("arm64: dts: qcom: Add X1E001DE Snapdragon Devkit for Windows")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
index 21303340a530..e105db4cbfb0 100644
--- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
+++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
@@ -1215,7 +1215,8 @@ &tcsr {
 };
 
 &tlmm {
-	gpio-reserved-ranges = <44 4>; /* SPI (TPM) */
+	gpio-reserved-ranges = <44 4>, /* SPI (TPM) */
+			       <65 1>; /* EC reset */
 
 	eusb3_reset_n: eusb3-reset-n-state {
 		pins = "gpio6";

-- 
2.54.0

