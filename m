Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9276047728D
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 12:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203122; cv=none; b=rB16fKDKSgdo7/Qc/PpoEJbmdZmLBMR6TrZHHulFJxe2NquW/b6nGjElXom+isTqNWvzp8tjDiWD45ohA6lHdS7zWD9QwmS2xqxYk6xgCXBd+vR9TDmNPwEUN7KWNwDWdv1Sj4OaqmYawuf9T02xEXND7VNgmH1W30qE3sq7qRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203122; c=relaxed/simple;
	bh=dwDSmlc61jnT+AWru7uQHSWcbB/PF2x4JEqn6VemRVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dxNbZkkdPLq+m95dgFFkFrjXZLq8dwN/r2HUm8sCYXBEIZirZt8Za+BXbClYDdk4RJiaweI3EJG+v6KRiIf2nQ67hibMpFMv8Jrqu+iFmc8UHbwg2hM8gFCBykDJTbGu1hQZY9tZcVkbFD8l5WWfz+2DOd2oyeSIr/KK4LQwJsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LvxnH/Bw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J5sj92pJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LvxnH/Bw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J5sj92pJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFU1Y2849755
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 12:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iP/rmLAH2uQHpy0g0pb++AJnYnatGH4acjwykoyxZ5w=; b=LvxnH/Bwik2EhgZo
	cMucxqtju9k1R4FGbmT2LP43/ZeOyuhgFuyxEvJCC3oDxfRjB4MaDXYo5V//0oaE
	LrWX+UA48Y4dHZbovHduc1LXQIbEFcaBZSQya8nGsA9FiJrja/j5SAcIDfg754GU
	Pek/AUwdkMVbNdKldQTBFPjWdlq+Dcu2Q6FTuqcvfpKsn7BZBEz3PUw3hzKyssx1
	CMNqzh+TR5mHQppdzPPBNrvX+oLbMpl5/xMMcViNk3T3qtUGPjW8ToFeSHqlS4NF
	H/926sMqXmJ9HzPXerks9M6zuNG0rdTyXCl1VfhL4PlmMtGB6vT8XBiSbiYT3CGt
	hFog4w==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h49u40d6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 12:25:20 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-80621978fddso1292262a34.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 05:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203120; x=1791807920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iP/rmLAH2uQHpy0g0pb++AJnYnatGH4acjwykoyxZ5w=;
        b=J5sj92pJagmr58kJvoZE+kaMzyIzk/beUV5wzQuxu2grOjtx2QtTOXyKxX4idBV3AF
         8+nVwONsodwVu4pBKh9uwJMDPjJeqxxSAxcoSoNDVZz9Lts4qT6H3bT5xlVv+67E/SOV
         ecuv2gJMcvlE/9hCFiGgil0mtBCzghjan2vqUwYVzRFlMcsqBlkPAine5lE+Ept0GXYH
         KO8kQ/k32S/SiY+YqeyKoq8o2OUaxwG8CmbvWlvplqFY0e4/7pEd3PA0kxMOZGv8W2qr
         +XxWxk5VixzPQPGGrUQn4bCCVzfvDE66FnquTvYcu6uvt9mgDo439zLaU5LbJLeMeyO/
         NnFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203120; x=1791807920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iP/rmLAH2uQHpy0g0pb++AJnYnatGH4acjwykoyxZ5w=;
        b=Am68R9B6VhbylQditwBieh7ozxtz37JjrzYQkJjgfJs0pppq/UTIGl6D+xwTT8r/9/
         XYP0+RqHAz5VAj8vALSg+OuRud+HWDVRwhgF3s6BTbJslcTSCRLMff8bbKoRAmioovmf
         Vhbr3IuUZKEl8RlV/cKQyIEMnxVklKXXT6yNnI/2Vcjz7TiamsHEObNclfjzRvUMEHvV
         yiNOkv6vfI5e/lA9ItAevH8phTA/eXIBSGtjIWu9P2T/mEwPEHrmQ7ALM4sG89mcYO3U
         bOgUnYQejSlTd65TsGrWWQuskjemBqsY6TsjrwF92UUWbBgfuNPd1Z7GvEpFcT9AgAKO
         r+yQ==
X-Forwarded-Encrypted: i=1; AKwUvBzG/Z5rpHlqjcUrOJiSAI8IaIvSWLFtqySLA1ZIyp2hvr0Pgc4uRuNkwE2yHoPrC49GXs1Fw3+ZLXlY6hOS@vger.kernel.org
X-Gm-Message-State: AFuF++ml50qKSDpYLJdYv10DjKVXSEyiRIQPNN/mmLzCyY3I904dtHR8
	CEZESYQcGYFSVOq/cFaZqHbsqhtgrjvV4V3tPJaabTEt8Cq5w/Wb7NGSMaeKBMnAts8B8T/EpJw
	aFpW6zet8pLh/y9EzP4jobK443bUcnWcYf+C2nEtiHup+0Wfmk1K0titZ4uhikEsk18dl
X-Gm-Gg: AYBFou1QEBPwS7St8U/HZ98PThIWdGsjntcPF0VA1FpClxAtFWtZk/0rwory7pz7dwB
	2QHlkpB3TG1Fuo6EaRP3loIc75o9MU/gwKrlyyJrg4gkKkDV/isTd0QTkDH4s3D2ozzWcvg7y01
	U+RW1rRrS1OScNxDHRzsA4x2g3M+juKoYL6mkLbVUi8B+0yyMgB3FfjVFJiIJJjS1VJZ5ogbhOS
	ELFZ0eoJRq2SBRQdF3dJnAQnInBwr2n4PGI076uiu3MNjPdVnK6Go9Syf8ZUQMfoFLD3Ghxp2oU
	e5pB/HU6MP0/GJbt4Z4YfY1zROufajbXFpobCGhT11deI7w2+7kVusGxF0t9ShKen1hG4rxpXXD
	NgcXCalR2JstCAFTkXoDPUt9Mkbbz0idu5A==
X-Received: by 2002:a05:6830:82aa:b0:7dc:c7aa:22c7 with SMTP id 46e09a7af769-8227eac1882mr11374434a34.0.1791203119898;
        Mon, 05 Oct 2026 05:25:19 -0700 (PDT)
X-Received: by 2002:a05:6830:82aa:b0:7dc:c7aa:22c7 with SMTP id 46e09a7af769-8227eac1882mr11374425a34.0.1791203119382;
        Mon, 05 Oct 2026 05:25:19 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82273e27adesm10896314a34.0.2026.10.05.05.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:25:19 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:54:06 +0530
Subject: [PATCH v4 05/12] arm64: dts: qcom: pm7550-eliza: Enable BCL sensor
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-qcom-bcl-hwmon-v4-5-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791203081; l=1220;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=dwDSmlc61jnT+AWru7uQHSWcbB/PF2x4JEqn6VemRVs=;
 b=USfjZgve7IwAll0Fc3jaXO1yeYZXW0dw4CRX+9heQYvw82iWdkDm7r6PnwgSJ0Zb6xvXTv9Xn
 fiMb7YIyXn1B37ngJCt1AT9ZnLbbGQdMOjK0wTOh7Q9BnZzT8VgC5Rn
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: opTdd8UJ_gEDGOtH5cOZgsyOASlkmdFO
X-Proofpoint-GUID: opTdd8UJ_gEDGOtH5cOZgsyOASlkmdFO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX5p1AjN6UE7lp
 ZAT/4yrEP+zPqE9PX1dQHmz2TJwmPqfBoJy45AtA+d4i4/rYdUiYRdPy0kRaQ+wqCzf4G6fWK5T
 nR1+AjhF/O58RPSRK9gDmQoVRNU/+9g=
X-Authority-Analysis: v=2.4 cv=LuEHWXdc c=1 sm=1 tr=0 ts=6ac39730 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=FmpG-t0u5PG92cBmzUAA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX4C8jrT7Seb8i
 mTubVk9QL4F50e+WSJ+orIV/lIwZxbtIJQog7OKbmK0o8oJtPRfRUW78kUPWfBjuMZDoUJEMUrN
 18Js44RuY3y3nv0IweI3mqkzHZGIQ4aDnQdenSiaOhC20uWv0F0niQeFzQVZi/eN1uXDirYlATn
 iMy6hmhfZOraHnLHUBanLjrboVfuV5oxlkgwOVkqCExIFVaSbezGPlyXPW4cnDzYTd8GqB2Z75D
 UQzy+A9jEwhKRrjCf67i7+AZ8NYT1X/OPWRnmMRz8SG6Bx93K0rrwdqED6WXO5T9YbisbBvobgb
 ddPbQ4Aoy1yHDvg1kYfO9qFLG3Fa2cLjLVBdD0KT5gsRAp8lR7HSccVB9k35gzWiD2IwE98Qzll
 iMXH8T9hajOYN5eoeh6vdV7dUWIuMaiuDT4LkTjR7PADSSs8BYy0aQ122ojXCVVFNx2pwzJ/ehf
 JdJrW9/KrB5rlUbcmjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

Add Battery Current Limiting (BCL) hardware monitor node for
pm7550-eliza. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
index 9b907f69264b..9cc734001a68 100644
--- a/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
@@ -48,6 +48,17 @@ pm7550_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm7550-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm7550_gpios: gpio@8800 {
 			compatible = "qcom,pm7550-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

