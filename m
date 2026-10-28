Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793223973;
	b=ewGevvHo5CE639N3fOwRfxCjThiSBf/NOWEsxKee5wMw2mHWtDXXAxG4E7I2vE5zHwqu
	 y0yyr0h/+bXYMn1EXRlVuipul78+GIPNhxGcS+rLIlvdTWB1B05I0QB2ULDocIKGlaXT1
	 NPvtRfJk/zOvVB6vcg4sU4kvlWhQhTqH74+gupPPXiMfchsuyuiVSvTNBhUnwJQHj9GSY
	 7IWTtA9/ZGn2Qf3NSyOzz6oil/JDuq9W1VkcuIOXRLbjixEuGUDd4/N8cfDEvYSWqXLfH
	 c1p9aH4E8R8PeneIxMUzni+VmYJIp6an8yDRhhoSBXIJqZCY12cuA/sreGpcr3kSdGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793223973;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2qTSPs3WOjSMbvYUNgRZIsLOaLBSwX10KkzzPzLpRFE=;
	b=b1v5AmPEfjNInWgey+BTBvm+pphviEqtGHy2z8LSCVGEReB7xTdr24o5n4JUDDzUkdDq
	 GOhdnBvSew4lb7E27Qrr122h68E+L25kaCxoXZ/0lUsY5OvW2CMPW3IrQKnhTi/9uJK3C
	 bf56jwApLSj4M+jgUDcnx21eYyiqyLa/qWK7iRLnc1krtU+9laj2aTSNRl81uAA2ZLGr/
	 iUpknBTAyogGMekLPNG0jX13altPBMsPWrnjPk1TsJpUxKEEUm4sgz5yTycKKIB1pBcpm
	 r5QaYaEtSi48z6VnyNUOubJdDYZxwWx8jJD6oXytwLUtgK/aLlctzORDIvPGgQunnqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lsxYDtvw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qn7p2JWb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C275C60A2614
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 21:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C275C60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lsxYDtvw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qn7p2JWb
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIcL521918603
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 21:46:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2qTSPs3WOjS
	MbvYUNgRZIsLOaLBSwX10KkzzPzLpRFE=; b=lsxYDtvwYLs9XrfKSB9NiPvMgl3
	2JMB8CvvW7TH7pK55uq1HkefWFDh+OydkQEEWGnMTmZlWkHcS/KXdGC2RBdPjOLO
	rPyy6qz55XQSEp5B3n9sAGlyPXvslyImKFTc0HK7dA06igjgHIwkQ1hvsNlL6wm8
	JfXKBQj1Kc9LfTgB2vtHh/88nlTtVZ1BOXDx0NcyGY5FlVPGCMajD9hVqq73UWwc
	a0SDd79TACTTZf6V4blZ6u8K9DU4ytbwE+joOv7adxqamQzVFV7dL6jlc6HaXZQu
	fTwcpQG6aPPQZ63Qvg04Bnzpccf55zGHqgU56UBu4aUv2Xthx1F9iIhXRBw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpgprkjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 21:46:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e49a1d3b1so84316685a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793223970; x=1793828770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2qTSPs3WOjSMbvYUNgRZIsLOaLBSwX10KkzzPzLpRFE=;
        b=Qn7p2JWbxU0y5SFU9I6cmDNxasfwLJmgXAEIR++nIJWooUqwG7Rj57+LXB/Ja2JhET
         OBNkfXcPDac39N6KAnnivt7/8cxkeRDEnkDhpIn2z08WBit2myHnCbo/4flsnt03sCFL
         SRbxVIHFM7YM0eJoRzfRcHL2V8NPjZzB0l8KkryfJRajnRazKu0U6xmidZMxVdym4ZhI
         IdB8LOaO4TyxTermOsLxmaM8IORQMteYb7xx0iUTCfWym4OWF8EDMkcNdoZSwW4kG9t/
         ey4vrxGJB7Y4qKxO73rVlTdrPQ64umrY7A8uM/5xJfu0b/To7B5rU4v42XXVB+4OkgNG
         czwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793223970; x=1793828770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2qTSPs3WOjSMbvYUNgRZIsLOaLBSwX10KkzzPzLpRFE=;
        b=lYrdL92if9afGdiYZVvHnKtaDQ28WXIgG7ZQKfm+6jtT939qROLsXsBlmM2dgESGfM
         6FyTlYPcFMeNEKA0YXsQ46ldHxiiuPTRJi/QV9uJB6Ye7OsVRBLFPfI/9q9zTHrxL1cC
         SVhh4PA5LQI12R0jkVMlg9Q1CI2oWZUnlu5CAVzfM/Q1sqMWQBh8gYkPfL7L38mlqa7Z
         XOrIuL/p8f4eOWbrZKvqw9GjSBgXnj8HdNH9T1FCprwy9r+sjYaCaFtl0TOJ3k8BaHxu
         p0/yNm4dAhiCPomje8BmM+xrsvkjMjIFeizMlfL+EFjIe0zirA5Y/93w+GSUmys4F0VS
         +ctg==
X-Forwarded-Encrypted: i=1; AKwUvByqqX8KWn8bWaoZaHYhyRZJSEzWcUWP4a4Fh4bSjMzcXTZVQ1Jz5dUeaWyomt8+FY5mWP2chgHm6roGAF6E@vger.kernel.org
X-Gm-Message-State: AFq9FYLCHutuYHPZx5cVlnCOHuM4meAw138twKrObw1tO1af1M0Ruk/M
	3iMeSdL+IG+VNQsH4dbkXo6jJwcxTXgipd7RLdyPjl17bDZycIUmsZzZY9rkK8qYRfIL3QeW+qu
	TAnJI7gQV5/cYhai5gKzTHy5n9wF2bmL3/fWeecblphKcmII0QLQD3DGKOTCOICEdDijm
X-Gm-Gg: AYBFou2X10TI6oRLR2NOewIeOTJt7DNum4qzOA7q3hex/cz3BiU5nlltbFG0ES7EkCv
	H7HausYITroMTnAv+nvHN3K15IOGh7dLLwKCRszkNdWzp+IsTSJPhXZOx7NBoBgyDDuJX4ol6Ku
	ogwSUBq0ymjuHgsxRL3vqtcJ+d0qkc3wgiwKe3PjBVp2MkEUnXZjWOJ2ZRBzacffkC0TTOmFEIl
	fwPwxOcis9Qmnw8kdzUr2QkwDXX1jKskbEH2vZiF4tTlNkwdavIy71+ZUW99/dVqROIqPyzDGQ6
	iAsgy8Eisqw1yZWpoGq7Tv7JbwkDB5RY1JYVZhBozUkSrly2/Uws8AiCeuuoQnstOACeQrXL6Ps
	T/pbvVdJEiOe5T8s4my0iZlqFBfNE99KkcBPL6dCzX1HwviJN577wdiGXuM3nNA==
X-Received: by 2002:a05:620a:2b9b:b0:93f:6f8:9d74 with SMTP id af79cd13be357-94408e06e70mr520729485a.77.1793223970167;
        Wed, 28 Oct 2026 14:46:10 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9b:b0:93f:6f8:9d74 with SMTP id af79cd13be357-94408e06e70mr520726285a.77.1793223969751;
        Wed, 28 Oct 2026 14:46:09 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fead817sm18642395e9.12.2026.10.28.14.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:46:08 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 1/2] arm64: dts: qcom: monaco-arduino-monza: Enable I2C0 and SPI3 for 40-pin JHAT connector
Date: Wed, 28 Oct 2026 21:45:50 +0000
Message-ID: <20261028214551.108424-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028214551.108424-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261028214551.108424-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4NiBTYWx0ZWRfX0yZ6Lvx/w3+P
 wSI5k6WnRx/rcE9yVUPPOPvqJNYNWnOZtVjwVTE4GgQV/6T3J32EKqbY8d+HTdS5+YTXaHfeM0I
 pgzRZNh8RTND+Gv/vEbvy5bWYYlANmHm32xx7I0pKsqGCV70UEph0RS7ITyIrzy/VqHB/32o7Gp
 CcJlLtUhgEnmHkhcQzNseunJJyUJYeXWA2L2aRjgWGrrWBVDhX2dllo6tfelH3OMflQo5KeNvZh
 V4ihzknK2IFOg9+12D7g/w/2UtFO+0UO2Lphqda7686Ler+eTjNAfBfrsJ0atUw6DindT6SgPPX
 5iKhWcFcNpT61OdgK8L7ujTbK/A9PbYN4J5d0N886FLqw5FVQBSiOae+UTb6w2X0NHI5GwmZNS6
 pr+Ayug3XToonEQSwrn6A2xJ7ZOtF7vFuuKnpH0pIqvp8LC5CcsVMYtAOcuEIwqcn1RvpibjgNw
 7Rbhar4oagbDndGVdbA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4NiBTYWx0ZWRfXzidCcJC8TQls
 cfmcYVLa+JzY9c6muIcXL1vao+31bXmxE7Mt0ZK3cGG+Av/7djG0rQQYvvPDalGrWDRYzLSDfGF
 z80hyrAck2bBXKZokjvf4l9Um5x82aY=
X-Proofpoint-ORIG-GUID: oE_BCYfUH1nflOCQUQUGesldN7dkfQcT
X-Proofpoint-GUID: oE_BCYfUH1nflOCQUQUGesldN7dkfQcT
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6ae26d23 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=yjr2dUU_5hJp1kNbtNwA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280086

Enable i2c0 and spi3 interfaces that are exposed on the 40-pin JHAT
connector and add the corresponding i2c0 and spi0 aliases for them.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 940a03732eef..2fa652f3ae58 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -19,9 +19,11 @@ / {
 
 	aliases {
 		ethernet0 = &ethernet0;
+		i2c0 = &i2c0;
 		i2c1 = &i2c1;
 		serial0 = &uart7;
 		serial1 = &uart10;
+		spi0 = &spi3;
 	};
 
 	chosen {
@@ -388,6 +390,11 @@ queue3 {
 	};
 };
 
+/* JHAT 40-pin I2C0 */
+&i2c0 {
+	status = "okay";
+};
+
 &i2c12 {
 	clock-frequency = <400000>;
 
@@ -562,6 +569,11 @@ &pcieport1 {
 	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
 };
 
+/* JHAT 40-pin SPI */
+&spi3 {
+	status = "okay";
+};
+
 &thermal_zones {
 	cpuss-0-0-thermal {
 		trips {
-- 
2.53.0

