Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A4E471430
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658664; cv=none; b=QMbFiOZnIX0ds9bIFu1aa5ElaF5t6OMzX2VPPbfq4wulEAWEdbUnxOjFnebKuQYmmr5wQw2KbhNReG+IhKvJPaqI9vhn+lpW02JrrS/yxa4+8wqNIg3xcpZFX50TkEwgRI4HoY+pSWweGnFOYPseK6hpZgFORNwYy4dY7m3Ehxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658664; c=relaxed/simple;
	bh=OS3nTF5uZPVKUD9c+8gRRWe/CCVuPxrxct2FrXKjb9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tOPIcpRPSZrvgKmbcrfxnliW4A4YxWOpPHgT1QcqUo3jwLj4zoOcCUC/wpBb82IycZx3hk/D7Vq4p7bFDW7HmKkEubsW2C0jURR10oohO0zJBAEB1PwQbcIFokW+XiXgz/95Zro1VgXhS/V2WIdV8vVRk/yixyZKImEoZJz0BNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DZ5o0lDA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UySsZ7ew; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DZ5o0lDA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UySsZ7ew"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LHRZCF1926748
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f5wNs4m6LnJpHyT+aiEgGGlPGkyjXvFa+jnHRCQHPbg=; b=DZ5o0lDAvSWuNUkh
	PNCUO1RO94zIyy611KI7rOr06WRghGJxZ+R3VsU6W5X5qQ3olj+lNGn+++dkkVpn
	PNJkCarywted9j7EdzYURCYH08KVsow/saidjFgit47zV2CoTW1163TbCj+8uNAW
	ekDQ5goCN3TzyD4FU3Z1ZSC7Dmtc/hFJjktTKRa4bGUDQV2JNKOarLQ3G/B0TvwB
	sPHHk9Wa7ds9pIobB8NkNR6bqwTClIbw11oNidtP/CHzKtXKG+uffv8LWVBuJ65F
	CMlxhfTgLwRF5jr1iB9fmF92oyJzP6J0YdU38aM5ogNAXNKYkRsPLVQwJjYBzdLa
	/YWFHg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6fra6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:31:01 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so17778967a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784658660; x=1785263460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f5wNs4m6LnJpHyT+aiEgGGlPGkyjXvFa+jnHRCQHPbg=;
        b=UySsZ7ewE2EO0ahhb8bg6KCz8T6vB/JgVPFSNBo2pkctyVJx2A3ALH5eSzij94P+BH
         aVw7mb0NiPbL+/tTJSMjERED9MwOHmFBSNUWRd7QjOF6Qt/YBS7vZPP8vefEbL1YSfIg
         DCxWesA9hanZVwxU493NekGR4BW+D5q4oNAHi1TH9kNe8P544DVU5lqQs0lXaXOAkN6w
         qn/Ql7vlLsy8rgmjXXamPkae4he9JUs3NiUVf3U3s8TAjxp5g7UBxeNJEiU2etfINvRx
         oaZx4fhR15gAcJdGFr2PaieNCNChmZOvEK3y+T0sywD7oyfluS+eCMxQhK1C7glTtsLx
         rj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658660; x=1785263460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f5wNs4m6LnJpHyT+aiEgGGlPGkyjXvFa+jnHRCQHPbg=;
        b=r6S9VeDN8kUoSC+eIqbJ6Yuzcp/aR8RKWp2uYuiGBNFEFAmtXX6G+ziUMk741RMkiT
         QHSU0hyc0n5eI2bZZjTkqOr/+Ufp/KLRbrkaGDvjNS1tD+5JzWqFFJ1i2oiEAEXCyowI
         y01AFdvaxakkPuRRS9o4Y0/jHEhofAYUKu6CTZDD96+R5EaX9586MYSh2eFgXbQHKVzT
         Vy5+QnvSSd4ReLByIpXG1Mmnh1/sfsSjPvGw7VCplV4G9Iz7RBzSSP8jGUdIHF87IXps
         IznX/PUmGfe5KKJR0D3+lNjwOEmrNazvhuNjkN4tHTBUkoYMeOKmZt9nECL5ltdREn16
         NEcQ==
X-Forwarded-Encrypted: i=1; AHgh+RrMUW1t25dmxtioBMbs+XlxWYgH00DlHAbDZltUzSkfEmsU+ZI3SVJuwK/jv+27h6SakrEE2F57mTY6WlNT@vger.kernel.org
X-Gm-Message-State: AOJu0YzeWIvRXtGzKrNtrQY25M2neD+b8IyqMO6fbiNKHJ3w/+hypTpY
	0LYS/a5uxx4AYZTNc23JQQXv+bwQq20lZfa4/TqNSglluOwBb505YZpCuD9IVoRtlL2bm74wtae
	TR9m7hg/4rdoCNTv+eWZBTypfy/9k0so0XuvcCnkvVMacD2n8CbkWDH+xR5gcFY9aps8l
X-Gm-Gg: AR+sD100vEFQdvGxK5IAM1+h7anTJXfauq0iRB+N3TJC1p8a/UP01upDnaYVcHxr0Qh
	s19PR+PbUTCb+jRoOpvcfP+mno2iAadveYcE3ZYYpdeDf8ywAqhUikVv5szX6mQJr+DyRArKOCJ
	IWXMsn7UHEWWHLfZD6uckhxM4Qa4clLVFR0sAFrE5LTNeW6YrSUPoncvDyu+rqTA8lqrpT8kYME
	ztuoIK3QGDg8aW/VmsIbkvSLnqQBZok9O8HXqiQ/lnrJvlA4fBdDn/DetxUQUkdQz96ltMaty/4
	u387WVYdlVr0TPoHV1hmfnILlleNa1Z7+KiJ3sCYPkVyY7PyHZ4pPIQRXyuq3AXfc7daNoXGT4d
	WrhMA/txnYWLg88n6EJtkVtwxzJdgJDdjz9k=
X-Received: by 2002:a05:6a20:c70b:b0:3c3:8651:b317 with SMTP id adf61e73a8af0-3c3ad600b4dmr20941794637.10.1784658660265;
        Tue, 21 Jul 2026 11:31:00 -0700 (PDT)
X-Received: by 2002:a05:6a20:c70b:b0:3c3:8651:b317 with SMTP id adf61e73a8af0-3c3ad600b4dmr20941746637.10.1784658659751;
        Tue, 21 Jul 2026 11:30:59 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm1185298eec.30.2026.07.21.11.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:30:59 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 00:00:13 +0530
Subject: [PATCH v2 08/10] arm64: dts: qcom: pmih0108-kaanapali: Enable BCL
 sensor node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom-bcl-hwmon-v2-8-febe2805e17b@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
In-Reply-To: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784658614; l=1138;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=OS3nTF5uZPVKUD9c+8gRRWe/CCVuPxrxct2FrXKjb9g=;
 b=fxSUs7sskz28RP5L7ovnF1zUOcd5APy+e4zGoyJcuIWsZqb4bRibuaRo31EJ7gt0YoCzYusAw
 7VtTFeMuA1kCuDp3Or9fRBCcp2Q7duZI6wIaZz0EOIiXm4QFjmXZnr5
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-GUID: wk-Du91R94L35DES8f1NwfaA3RIE8HwH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX/Y2ulWahYdsd
 JL8Uxj/pxTcLBuOL9X7KFimusuTAhLvBmEf2qv/qxbGvanM9VjodpGJHPnf/3SopCqnNNG/53OG
 KQ9vpAEqURQ9p975cibxnOmhEducVgEDmTa66UL25l9hY17B8u0guLpe6GllQW4cpOf0X8PgMaa
 sS3EnSLuVmxwccApuuN2uI03WCIu07CMuVWDod+nyTv4H0RIy4vOAXD6EvqTc/tcg8hiGckNpuw
 qunK027vDkKeH7BaCh3+EyNuOuT5ZMlSKhKCkOK+UP+yc9QlWPHy/zBFIObhhvyXki6eWivPH+h
 qaBoJ5hAPM1fh24P+5Wg61YXJp0vCHOXTgVyCyoZFb77CQmJxk9kvfwKljpezoS8Wcmr8QXyhZI
 2+BYLUtBFzcLhZtchybhs+dG4zp+nyEgbTZvbBLlKGbgem9P25+eSHK5FUB6bJFh6IiL1G32RfL
 wrCfTM25kAPPobCdYPg==
X-Authority-Analysis: v=2.4 cv=e/o2j6p/ c=1 sm=1 tr=0 ts=6a5fbae5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=09zRouN1k7u6xsjrD3kA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: wk-Du91R94L35DES8f1NwfaA3RIE8HwH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX6SJqSHSTFK0t
 cq3Oogf5oRk3vIIP37lWlHI7Ll5rVjuQNRqfHp2Ho+40DKDLj57mBGxnLwu5g4s+rgxFl8rMi6H
 ZBxNqcK1DcupLYywXmoLxmtnRas9z8k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210194

Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
index b73b0e82c3d3..67b77272b0cf 100644
--- a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
@@ -49,6 +49,15 @@ pmih0108_e1_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmih0108-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical";
+		};
+
 		pmih0108_e1_gpios: gpio@8800 {
 			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

