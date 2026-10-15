Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A063F4841
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 19:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792093681; cv=none; b=XD4FNk54IZDQgUJicXlZrrb39QwGwsm0QUk9iIhkDKFeNfXO9VomIkgpHJVp1cPlC19GdPFPAviDiAP/wE6JtHHGCQARaEqIie8g5wSj0V7/0XvezMwNY3GFfsZhLQU4R8U+8ANnaCZWOeWpJXYAvWwLfcFOWqkXagAo3FUekN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792093681; c=relaxed/simple;
	bh=5oab1R1aq42rAyzD3U2Std8brNnLwvPCUtJcAWd+yfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KOlFpUhFsEUrwixa/b8+gZlaaPet+MsY8nEsQpQelosNQfwbmVoLR7/TaxcV0uGVf7Pbgfb5BTh2PNqSDWhKeJsWMAhsze2wY9hpmqNPs78MG4QUI8CZCdKWFEBU6zZ7mDS79piAHd6ileo3ytrVCBDatSIef0g4maogwtvvMVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GRPTr39B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L7Ck44Z2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GRPTr39B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L7Ck44Z2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FDYOua3462822
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 19:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wMU0CL1oXRl
	v1bCCuzBInDSj9OJvGkz88zUTHMOfhDs=; b=GRPTr39B8OuQ4jXdhqK6PmFDmh7
	+sCGjoJoxuyKEwPLsNYWWn0wknW00fCPWKD6K/Y0XEyXl0CMMAsgY8pwVyxRV45P
	AsqdidnHUpOdiwWJwMHL9Zn3fvhwm1Er8ug2Z7QRBE0mZ75fOhsRwfIKUirjFmay
	jwL3sz011VH9x6xrrRhp1BGe5wdq3fQJvY/yjEacB+cpE1C125iV3gWMv814y6oH
	oiz0YxIPKVTLNlJyTbYJBpwNn/B1ah2s3wj+wThhIn89IBdHduPA/6bI34fb1FjC
	8mM8TyuR54E/tAAI5DoU7bzyq4Mw2mKXJUHRkWsytePAYnQpU92FNl/kbFQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hayu69gmc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 19:47:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936aa34873bso387917285a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792093678; x=1792698478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wMU0CL1oXRlv1bCCuzBInDSj9OJvGkz88zUTHMOfhDs=;
        b=L7Ck44Z2JCIlBss/vlFi/GSC8FWjnf089laMbUSLE6g+ynAA5niI1Lcdvab8c5pKlB
         sIAtRjzClbPBGFmGmOg8IRmt06t10vfQkNVC2jN9FUQ25OsCf0oUrpWxPk36xbfTs002
         HP5UmOZqGusljyoBfPZTQeDQvqvauXo8N7xCWIq311gjr9QwpJiyL2luRFhG+T9VOsuF
         02YFDSosnRcb9yrrr7bx4cUAJRhgBlKwd5M56c9g7Vw2Wsxi3OP2/paUI7Das/nGk6eL
         xQqDPYGqEGvH2ivQE+pJiaA/HAcxUvBImtbgUAXwVupT9/rz1YqcOW3tov3hJv/Yhx9j
         Twgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792093678; x=1792698478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wMU0CL1oXRlv1bCCuzBInDSj9OJvGkz88zUTHMOfhDs=;
        b=phfsUz3vI3D2fZ2IPTfsCmQaNUNPVX7u575SiXdUK4d03VLjnEsNHf9TycDcvGQUKg
         DoyFE4bdS95NTEcSEnS3Fm7lTtoEi6ltlYl7Bm1jlHqIyKWN0MZgyZFY5fa/2orVVqdC
         vFJTyf6o4w9ydbPSq60xGSxhvukN6x59X+3RWeFQWJaewdWCzUwcr/EKIcA+Q7GUW20V
         8MgVOO3PhBq6Iof9XODOrLL6CAcb3fIstEd8MMEGx6A5eKs8g1Zl4eOxcNGtCV3yIr4f
         aHcfraHJg98cWOqEJg2HiOxqx9vLmiQ3I4pDM7+tZi+Z0uA70UiaKhBXClsk0W68E+3a
         Qz5g==
X-Forwarded-Encrypted: i=1; AKwUvBwzKzXJN7t0sp3SxNBU1ONuVfbuGoK144rOWhAva+5Nr2PTtxk2ZADb93zPMbyNn7icPEVWezQIIlMuIDqU@vger.kernel.org
X-Gm-Message-State: AFq9FYJZlsQuj63ZxfAcmp305gmi54PYTbsUL6SaiIDiMfHEp842/FvH
	MNFrnFbg1USpX4qoC1qyklA3r4kqag5ixGxPjAyl+bL7CRXT94H07zlELTcOwl/k/Yu2cY7egUl
	4hQ8yVA0+CvIP8UoV5AaF0zpy5eMd4rAP8t4oGe8xscOO9JubJyJkEe4y3OGVkNoA++T8
X-Gm-Gg: AYBFou2Y5VpvmfJwCDgYTsxLVMUXTfvxhP3oEIPeTdSE2t2Zx/XBQp5nr2qWfBCygKZ
	kzhegi0al0/4O3+IC200iYOJ8y+vVytIKC+SYTJZ74ekqV6sH07OBuDjlAF1tvCQU57WRWsVHA/
	pNbx7jP7MXkyEEkqkVxWal4zzqQ3oOkq1ASVOKMYeaf5S8GlwwcWSQXkdtbnBz+g6L2zfOp1kkJ
	QJmx/CwKAR9A29sOIMS7cfpZ+dWt9AwzmF0MyH/DxoOus3U9Z88dCWc++3KExvL3eLmEjUdncXx
	DeyEhAtdZfRONrvtFcZMyo/XR3qD1M9sefIYNvMNpJ12hkQgqhGoE0tgDNtv/JalqpevDG/7Ael
	ptxtGdCA9IGwJ
X-Received: by 2002:a05:620a:1b8a:b0:93f:9f2:86dc with SMTP id af79cd13be357-93f09f29e75mr757820985a.83.1792093677769;
        Thu, 15 Oct 2026 12:47:57 -0700 (PDT)
X-Received: by 2002:a05:620a:1b8a:b0:93f:9f2:86dc with SMTP id af79cd13be357-93f09f29e75mr757818685a.83.1792093677253;
        Thu, 15 Oct 2026 12:47:57 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c4fc4sm138027f8f.15.2026.10.15.12.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:47:56 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 3/4] arm64: dts: qcom: pmk8850: add PWM node
Date: Thu, 15 Oct 2026 20:47:30 +0100
Message-ID: <20261015194732.64428-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ZINZdQlQcUxgoHZr7xclrERYne9apJ2B
X-Authority-Analysis: v=2.4 cv=ff04WEQF c=1 sm=1 tr=0 ts=6ad12dee cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=zgIjqA5jzSmhAMQQ9ZAA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ZINZdQlQcUxgoHZr7xclrERYne9apJ2B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA3OCBTYWx0ZWRfX6hIc6e3pNzFm
 iYLvVy317fIWJTDn0qObXrTUQY3ivu9hRiGApl9sn6df/pwWR7uFn+TN8wk+9eTfZme0CWKGgu7
 Ok83cZirZbA7R9fHGe1j36l6wvNwVT/+TTTYpcNmWx3m/RBTIjqpZW29MQ4Epig/EZX2Lz3Ho30
 R53VfeRTLsQw9mfAL3tVkg9iO+jbkieiSVZFYPwDkGbm6Jqrfh6jCZUBwsBY7pScCXEryUK7Chf
 ramHTVoivVzXgYVOZQeXVrtq3Q4i+QHOA8c9hi3buYKRwLQz2lC7nuzgvZF3SRFsxkgqzb80M22
 pGsYu9VXOi346QjbKJ4uSXDK2Gs15MX5FRQUGYlb8NMG55BL/zhn6Fw8DW+Balii0WZVW+yDwdA
 ljPrP6w9+qINQ0pqf7QYzbgQcdRVgueYV7g1ONDTkP4L/e61eMsc721+MrnOhMplivJokfWDsJc
 oYHQUB+h6wDi14gahuA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA3OCBTYWx0ZWRfX0wbQEoVDjjXd
 6kV7WLsESRjVDlsSniG2+bNQi61XpKmE+4d07f9lrehaNHs0IaJLk+POZuwzH/C8DC2KuugCNrz
 qNFO/mq/5W3HpaWMDilHJa1MLydbj9k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150078

Describe the LPG/PWM block on the PMK8850 sleep-clock PMIC. Left
disabled at the SoC level; boards enable it and reference the channel
that drives their backlight or LED.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmk8850.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmk8850.dtsi b/arch/arm64/boot/dts/qcom/pmk8850.dtsi
index c7ba72fd48bc..79c87db8e95d 100644
--- a/arch/arm64/boot/dts/qcom/pmk8850.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8850.dtsi
@@ -66,5 +66,15 @@ reboot_reason: reboot-reason@48 {
 				bits = <1 7>;
 			};
 		};
+
+		pmk8850_pwm: pwm {
+			compatible = "qcom,pmk8850-pwm";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#pwm-cells = <2>;
+
+			status = "disabled";
+		};
 	};
 };
-- 
2.53.0

