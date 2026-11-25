Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636360;
	b=y3ZLYYLnNM7X733EiclGIvVlJnuPyFWD73zYcthKSyExJvZznFl4bEoa4YR1uDieT8Wn
	 dThnGq5jpAUR8O/vyXza5NPwU61lw/LKPPi/c2SrcCj7GgHE3kpbqmU/NHsRASHLK9R14
	 Q9DMmLmygdjM54e1ju2/ou8H6XGO34HFHBoTyo3rKElKocgyANgicYudfoIO/5SdNj+xx
	 aXBPLA48OyZP6IxMY/WQXyVuM2C9XnZx1qi+Uj3NdXfsY8oMSop/HdGJkVePYC9a2cM3U
	 MT5F2i+FywNgYoyySjb1HEWg3M8+ok55hHGaYkG18sgOjQFkaIA72a/XJys581UVMUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636360;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lRl8a2c+F775fiXICpW/PScHe8VmAp8qGYbgkcFxwMA=;
	b=l5xPgqP+wiYKPrrWP+LcdvQDzVv7wWnkam7Iegq4I/xXe8fnMIK5FxiEjzfeDoUH0g10
	 M80CS7hxdRyygcdYjNKo6n92a9jzAKYvFLDL0ckgwDDCmGJsdYW94ydZ7q+lI0NYIP5EX
	 jFpZRcGTzpQjzxLrOzQZ3SMlHtC0Y8viXAeX9aM7600hxWbhnmH7dQMeGGuYxlrFuUfRh
	 UHdLbOw+7Meh/UnxH8jABhZs8ZpVov7z1YspB12uBOQue0VDMjPDPr/RRL7CZIQsM7ZH/
	 C/nV+TByH1l3f6W+C96zbZxMiJXVb92MIwjK6iI3sk53QMvsrx686TiJUOQzETMERKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="H/LTMWGw";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EDvZgpZP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0B5606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 19:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A0B5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H/LTMWGw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EDvZgpZP
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJAt4T3367494
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 19:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=lRl8a2c+F775fiXICpW/PScHe8VmAp8qGYb
	gkcFxwMA=; b=H/LTMWGwpLj4JnzWOodswvm27tbYjNKHCSyk3agPibFXS44LUs/
	SLl2ElF0+fpNXQaCXxFEs2zZlPGR328IJSf1iRk4e74gNARICRzRUC9Dp08wh26b
	xpLeEKtHT4b713wC2YE3IZUahzLIXXA15+VyOT6qkbM39879E/u7K1vajUAOkqpF
	j2u/Bg7PKqnHKSCEt78iG++qT9PbmJwCBu0MbO5rIeS9S8ZU9+N1g2UZV+ODESpj
	beGBkB9DwhLkxJFcoqvkam1+6py1H9qhUSLAdZ+B9Hc4vx0bBWROYQ9d4TYpqLLX
	707wqksJm2IWlDddM/A8eVTBf0oOVzamM/w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuktjt1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 19:52:39 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-92179251e32so21608296d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795636358; x=1796241158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lRl8a2c+F775fiXICpW/PScHe8VmAp8qGYbgkcFxwMA=;
        b=EDvZgpZP/8Wy2yKHCu/KzpebFeNF6c0ZFMzytVNHzSo49GNvDSNfJWWdNeHKvOsAWv
         gRXLElZVT4AcRc0yViP/C+cnFDm6WJeFLEZFzhDc5PyG9/1eEzZfrxr4RxrDGLZ0S6XA
         GYyCxbn96zqG12KiXMiaPPBaEA7csLpd5fqdbU2bXKD5yboGewGm0gSggDPC9seM+ikb
         s4DYamKaLqCCvbYFKkcxswoD0X4Q2hS7yM/wuI6gfuhul6oPtUAdt5rNFKLE2ERQuSoj
         T+xBpwirvTc8OBl+72bqCpEIU2SZTQ+6RQECRsLmPaDcZs2Z9bZfTtEbWnX4AjJ6RkoC
         VPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636358; x=1796241158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lRl8a2c+F775fiXICpW/PScHe8VmAp8qGYbgkcFxwMA=;
        b=RUDKWgFsZxYjqTHojl1fAfn5vpY0S+9DwChfQjsShOJ7t/Gl+cG6yPWD278q2QoAd4
         /NqBiHKJyn5tCUc4RqXB46s/FXrz5XDal8kQ/xdvh2qUXkjjXXoPQbeGVCtyBZ4iNZR7
         rVfW9weq0gPLLASSlScXoNTh88uGjYUJoEO+HtYsSmDLixkaKQQ85q4N/67E0mVM3MHA
         tOdOlw+BrMxtMvEDp0jWdW9P0UBYWNX+ZfxiHoXVVJ2viwr2guvY+oAzIsolHZNuhAa+
         RAX0wdSMPXlgDt4j6za/qoizeBZ2B3CX55haBxbVuc3MlzjqTAzVJ7LYejACW5BuOG6g
         yVfg==
X-Forwarded-Encrypted: i=1; AL+hErGA0nEfE/blZR91U+OGEr9OrEXDXF+D2DQpoAHV8HaDP9QcQfvJRrPAFl4a2SY/lP25xmAoyWjlvnJCkFxr@vger.kernel.org
X-Gm-Message-State: APuU4Z+Y3+3Bop3Sd7zvYMZzZORSMEzISLKjvOjFB9MUhA4SydRWwZYa
	7cqG4nwYeSTj3QcDzQs2fDkxTSlfWLU9QnPZMyjDqChjP4dceQVcVE+lfayfQj+MEZMUIRYmqrY
	ICzT2n8NZGdRacZtrbSjoTuidpQQ5eAVRuFA2Ii49sG9lF2mEBrMVgWQquTMJD3YJojMgjkmIZm
	/q
X-Gm-Gg: AZFdTZd8UiPyIyfmqwgIbrVOAamry0DwhEEJK1s+wGd6Z0cQ5D4DDNWDCZY3JbI2B0I
	x0DRYtza99GrsefvQW0ssgBcC6dFJbs2e2jTIIcPxu4O9kJFpn2gfIVvzmDfnRF4tcgmafGrKB0
	sC2x7y+M37/OwQZtGpUibcffcDB8A5HrtBCR+hLKvenkY/U0W6KsjazzwvvPYh3gLCMjkgyiwKH
	MWtR64/Axxy4qWMlzmVrj9fevHNR7PFuyVisznHB1o+2ONrrukMncixfRlWggJ9nOK7BhDvPAMP
	/5nOrguCf5E0y6Q5swD32kn2W6coFqFI9GnJPXaKABgI5HvBXv69mdhdThTRyUhh8ZQr3GMMLuK
	t8jmM1Qn8gRIUS3xOBYayihmGAe+mzXqPmj2mK0dYx5Bb1+guhxr9/8G25eD+KGqz
X-Received: by 2002:a05:620a:260a:b0:947:7f5e:2b64 with SMTP id af79cd13be357-949ba969faemr3131218385a.18.1795636358450;
        Wed, 25 Nov 2026 11:52:38 -0800 (PST)
X-Received: by 2002:a05:620a:260a:b0:947:7f5e:2b64 with SMTP id af79cd13be357-949ba969faemr3131214785a.18.1795636358031;
        Wed, 25 Nov 2026 11:52:38 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm774316205e9.11.2026.11.25.11.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:52:37 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>,
        Luke Macken <luke@phorex.org>, Srinivas Kandagatla <srini@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 0/3] qcom: PMK8850 LPG backlight on Mahua T14s
Date: Wed, 25 Nov 2026 19:52:23 +0000
Message-ID: <20261125195226.1563577-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
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
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b073c87 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=eNx2SGrOvgKyolGvBP8A:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: lj6yGImp3fZ6vCnkzOb5Rs1W5J_dtKQF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3OSBTYWx0ZWRfX0W3GzEarGGOE
 9WEEt5fWDWkgUIlJFhMD1GRMVLqhp2uU7rsLVPsv20BtMKBWU85vGS5fElo5emaNEun3T8LVmH5
 qSZmltDP/Ys4Z0Y8CDoHTECIsXDl+CY=
X-Proofpoint-GUID: lj6yGImp3fZ6vCnkzOb5Rs1W5J_dtKQF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3OSBTYWx0ZWRfXwPe5i0fljqlS
 4R5wPT+gM4j34/zp5deh08q08FVs1HOfon4/vT7+yAHOVD+ZppjfrqoWNKCDQNQ6o+WZK6d0KIz
 N2gD6e/1R6vfzalJU5VPmf1/Kq/0fFoixrCUr7LXqWt62ZlZlPVNtuJyCFCK2eN9bSvbjVuXOKP
 J7sHzhAuDFf6D+s2CWWW7x5m4DNdBn/zGcZG/ilQxV53cgGTVCQyRO4aQardocKGbCmv5J4Oga3
 RZHCYrun0HBolHUMixbY0+x3hzNDQyWLaK4hTd9Ee76BuBgA+slQO8voJKSOw8+rn8834jrRgUb
 oZ6kivbh4GevbmPBLEy9ym03YO/kPURxhvmwcmHtPTlgFqSf27I5X+aPWVTZepKzs3pubsJPrG3
 reYl2WXsMlsVtVI3tcSDUHLnBn2ox+RpqfGNX5B1h4Ws2oKjjT9PaFS5cKuEIJiIobHMMyt+WYW
 O2/B3J9/DVsJQcJEraQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250079

Wire the eDP backlight on the Lenovo ThinkPad T14s Gen 7 (Mahua) through
the LPG/PWM channel on the PMK8850 sleep-clock PMIC. The PMK8850 PWM
block is register-compatible with PMK8550, so list qcom,pmk8550-pwm as
a fallback compatible; no new driver match entry is needed.

Changes in v2:
- 1/3 binding: use qcom,pmk8550-pwm as a fallback compatible for
      qcom,pmk8850-pwm instead of listing it as a standalone compatible
      (Lee). Krzysztof's v1 Acked-by dropped since the compatible
      structure changed; re-requesting ack. Tested-by not applied
      here (bindings have nothing runtime to test).
- Drop the driver patch; the fallback compatible matches the existing
  qcom,pmk8550-pwm entry in lpg_of_table[] (Lee).
- 2/3 pmk8850 dtsi: use the two-string fallback form "qcom,pmk8850-pwm",
      "qcom,pmk8550-pwm"; pick up Reviewed-by from Konrad and Tested-by
      from Luke.
- 3/3 mahua-t14s: pick up Reviewed-by from Konrad and Tested-by from
      Luke.

v1: https://lore.kernel.org/all/20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com

Srinivas Kandagatla (3):
  dt-bindings: leds: qcom-lpg: add qcom,pmk8850-pwm compatible
  arm64: dts: qcom: pmk8850: add PWM node
  arm64: dts: qcom: mahua-t14s: wire backlight through pmk8850 pwm

 .../bindings/leds/leds-qcom-lpg.yaml          |  4 +++
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 26 ++++++++++++++++---
 arch/arm64/boot/dts/qcom/pmk8850.dtsi         |  7 +++++
 3 files changed, 33 insertions(+), 4 deletions(-)


base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
-- 
2.53.0

