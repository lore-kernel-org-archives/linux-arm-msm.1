Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452195;
	b=uCHOAYFoxoXEWzdNDMRJVPxW/KwCVakJBuAVU9pujqz5rQGv/2vzFeayEh7LV8LOgJH1
	 yKiGt3gW8SqMh1UT36XepSF3e0EU2aKMs06YFIMQ3iUaQtNfwwnIy+f/ZrKxHHUOdL1Vq
	 PBk53xwpDRkEIDrdgVtEoQZOR0nYNvQ2iWMnt8T3qPAXzMieAtDkSGZYUHSis5l2LY1V1
	 n0Qm7Blx6u+qKmnJCU18cTl9ESdtHifsBIZw4/RJc2nHINcWBf9oomU2d7w/+UbS9mx+B
	 ia0Nr0miFdSkudMKOQDQSIM18BGwWT/9UUXYbrumBqyA3HQHuL65shlTbns3zcTgG+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452195;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=K/0f/Fx9dcCRSnODkYtK3aiTY3t3xedC0JyO9Aj9vBY=;
	b=usYvJDe2WLnGTdLELc0u35I0pfMCj7rtcExWLMIuOlaSbTdSY08sx0NE9u9sBG/yR4Zf
	 lCS3qlBsKTJrZLYFLf/HDIw27aTETF06B6MgIjVBHEQFrG+W+1QpJDnlvtBIHmpWufIIO
	 0KpX8Elc+ng7qI3mSG9xYsQpxuQ2FSpRaKf9/tl8Jkn7ipd7PZdFiS/efCvxAvSYYmiLF
	 JNx16lmBC8AdiW+vUrX/bp00zyAHDOpzKOTZld7OwVjR9eyH8nXDa2hC6DZaW/c5+f9ro
	 dK51rMMyfI10UQR8JweDBH8/g20CQBTQQHmGagpBgskcCaTgmYvQRMphlRZ6lKlHNzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bYi20q5q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JSPPntkE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9233606A6A8
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 16:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9233606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bYi20q5q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JSPPntkE
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGl6A3025316
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 16:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K/0f/Fx9dcCRSnODkYtK3aiTY3t3xedC0JyO9Aj9vBY=; b=bYi20q5qmtj+mmQ/
	RBnmM37JL43Sv32HyZV40BcU0nKWzO90dX3rVPBh+1lNie/T/OprsBUPNknFKkxj
	HAPisO4bFdVYDJIVjN32uTjKpmY8b7NIi08EiaH0YgDVTF+TueO6osskrfUVtjoE
	UbNFmfaiU8JN8Dz7tkad+zWVJbi0R52qAuL/t6z3D4d7P2YfPN+fXf4TY0VGSBrt
	antkIZkSepzsRvbrHSlT08UrzekzX5MCOBsuzLtzWO1wrEnF9JzMGEy9ZdjNKxW8
	aq1UQi0B2bvlSR+EI6h+Y35kNgutMEOYsURprvKt629I0/i2wvueMyGfhmIIhvv+
	d5tieg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pae5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 16:43:14 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eacc615f73so2826781e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 08:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795452193; x=1796056993; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/0f/Fx9dcCRSnODkYtK3aiTY3t3xedC0JyO9Aj9vBY=;
        b=JSPPntkE/swE6x9ThFFHmU+dc07IYKfAskGaaC/ny6rDJof5n8MNJGyiLBLMDUGaMV
         ZCuAQa0Fgrbc4J8w9CNrYoK6moJVxuGJvwX/vBQ7b/tD8c0ufDC7xGMhwTMhI1pQ6jsP
         2gmL+AiayoJhai+fvrxLj7JeAdMhcMHIA+8zM9Q1ZOZws0kQF2y16RjKNrJJQbmfcdZt
         4GewrfNMcEZf2gVFFaPP9/xsCK//QlpCwLlTgwXEMNYDRny71OaNz4tibu1lyAGQGb9s
         FOm98+b1VpkHqNFEshV60uEiB8ejP7q+wKDsvEPOAvYpmkPiTCuo/7I437h6rJNvX2F5
         9kMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452193; x=1796056993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/0f/Fx9dcCRSnODkYtK3aiTY3t3xedC0JyO9Aj9vBY=;
        b=ik1vzf1NuHelai5f7sWYEa59hqPdhQu2G3nNbPZk4+rRZJqG694ttmUoZjNnsLGBsm
         qTqug1csS5RBqEuvmkLX82RuXKHgn/ypPIhDacIGWbxaz2qQxH0pxa4ayTAzphkA/O8X
         b2UZbWOu2bcaQ1Mm85QuDWhvofMTtlCqXOVl0p1d27VXAZsypHo4dRGPfkowtH58IF4r
         WExcTb6bIOhQ9JXoX7R1Qqc/R20cwn8IGMo7vGyqtcdrTHAOIDoRtIFqeZvLnhb3tQVo
         Z498lT/pQRU9s8q5nfAU4Pn2HuzTY8V9PtZplTl3+qPaptRiuanqEO3uIlysnq4vcA2Q
         rTCA==
X-Gm-Message-State: APuU4Z95fwn3zmUEupQ4w/eVoCQtOMGihrfthRhGicaEY6wXCf5sRhyb
	C/Ar9uNpazmbuCSHi6ADsuWL3F6jdTIM+qkJWeyh1RPJZABS3JXVaHrHCGHfoHqU9OwQhUTKT6w
	zVKGRblgU79rO0rcQLYicMSuvBcUVNi8BDoQd8RYotJMu8xN7du2MZROned1eyXFiP73y
X-Gm-Gg: AZFdTZdp953LPZdnLvjQqFTLAorw/F+trf4/80i7DPErgNW1QfCXiZnatNPYNYtS50Z
	j/AOfm3NnRO+QEqZ6jyIQjHzPKJEDTc1d4BzzzbvG3Z14kKlhUHOimPP8nuo2rqludYnv38vLD2
	XZGRumQvEwHeMRuQhS9hXEoEm6GHGfeB5RYpy3280Gy8GTVFqg3Al8At/x1CPLA8OdAxpsegxUm
	yVh5EdXOdByh518+gGlrE1hGk1hAPhVEe59bHMgtwpcRvdCnoWpikmTTRnh6BBXy4O6Uj13yz5z
	vBXy3z2BEOSJrqTYzMEDpF2YTvIp8CV/X+cDGJgSUk0eVRxNGHIgytfoSTbij8fbT1YgkVPnaVJ
	xp9Qg/CgybiMjkhsHXBLsaVhRmuRb2Kx/5aNCJmgRwiOzNLuv3JQPpu80okZtGwYQFJ6H8LGfV6
	9XkaglAvQMxxO3
X-Received: by 2002:a05:6122:1994:b0:5ee:13ad:6c8e with SMTP id 71dfb90a1353d-5ee8af3d2c9mr6205486e0c.17.1795452193277;
        Mon, 23 Nov 2026 08:43:13 -0800 (PST)
X-Received: by 2002:a05:6122:1994:b0:5ee:13ad:6c8e with SMTP id 71dfb90a1353d-5ee8af3d2c9mr6205435e0c.17.1795452192792;
        Mon, 23 Nov 2026 08:43:12 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm426725366b.80.2026.11.23.08.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:43:12 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 17:43:00 +0100
Subject: [PATCH v2 5/5] arm64: dts: qcom: qrb2210-arduino-imola: enable the
 EUD
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-qcm2290-eud-v2-5-9bfc432dee07@oss.qualcomm.com>
References: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
In-Reply-To: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: rDudw7R8L6OCvJf9LqExSxzZwFRK9GrJ
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b046d22 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=pvBjvzZ7d9aESBAnF-kA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfX7B6jF8Hw0NKb
 Uz1ubam0BZHtZKpwdyfIVdfwEqehr/dgJoDNUn3OCFp2646G4ht/ry5saTBrWMNJdA94tLFRibQ
 9jp7o3rEX2k5b6v4vBk+bb9rjR9h8Es=
X-Proofpoint-ORIG-GUID: rDudw7R8L6OCvJf9LqExSxzZwFRK9GrJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfX8xI1+BoJ7b/e
 rbtw8kRzhBWng80mqlCGPGS1ig3GuAxl9SHtUPWEUu9KNQVbbtMU5liSPYjUfvz1BeOR4Qq7t8K
 4lZscJZwB/G5nCWKQndZX3ogSa8HP6dNLHM6Oir4nOytnE+FPJBbd7rEY/+argrvv656cGH8lEr
 Lq09PTRasErUPYypJ/wDsas1fvTnIb/LBUX905TJEI7cdLFYPTSQ8DhfNUOOKk9pMHeGPRwtXvO
 FovDF6fBUlTTQER2VufhBULnWnUI/OxuAKGPDFoCr7H3Qq0uKwFJZavh5YWcUBeW2LP0TWErxgV
 sY+XKiQU7OKIgiDJ8lDpOQd5ZydFLb553FCbcgADaXjcqc1Ip+nXrsC3xM4MTyy4EkVB8C7NCKl
 ELKY8XnG+VaRtfJlMd87wTnxxIHUMPyUvMOg03IaYG+cSri6PJ0hfaTaPcPt3IqS2L7qfJeW9Us
 iJClYP1pjer0MDrnIXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230066

The UNO Q exposes the EUD on its USB-C port: with it enabled, a host
sees the EUD hub and its SWD/trace functions, which OpenOCD's EUD
adapter uses to debug the SoC.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index e99d2a56dc28..a1af2caa5bfc 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -226,6 +226,10 @@ vph_pwr: regulator-vph-pwr {
 	};
 };
 
+&eud {
+	status = "okay";
+};
+
 &gpi_dma0 {
 	status = "okay";
 };

-- 
2.53.0

