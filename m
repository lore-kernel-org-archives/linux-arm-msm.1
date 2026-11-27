Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789741;
	b=eLXAROI+b5fU11WRiSnaRzZVBR5BV3YgHDHUK3TjDd9MimD+4/GL+9nCylKLqmjL2cUf
	 xcbRRIaKuHqt4VomU/35g0vXNtq0pIshggn7fQS9fBpzt6/nXpJtiQM+mcgyPvwrNKfNy
	 HKUTP+ydmDWkTIsu/+2JkCLgbaXlCeS4OO+2L48WEfqszkxc4a/q+16ms1FLzI+TTOASq
	 qNHS3oNnFpY7xNiF/ER7Dywe9DAeMrO0VdiD90+mdhxtM9JDdBXk8MzRYLwN3x6K2fIiZ
	 KmMeYzcDzxAmTlQpEHmRbDufsC7Nh/oiLa9hVNxFD6EL6xIljn5u4VmVkHhM2qprHKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789741;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YfdJK8DklmuldJ6da0BpfSV93ceFX6oC4GgDqZr+sFs=;
	b=h4gBTj80RTjLEAX/hewfie9fOXAAVgHqk6uAqHUkZgJQU+nu2i1NJhACUltyharvoHNf
	 qWl8moDjy8vZ+jk87UjjFfrP3/474/AdsZldne74fjIPtCLL+qy+lQK5cgsU2R6XZ4RcP
	 2TBQVxt4+FVLT77P8Ldqmgg8PNBydUt2Sueo3qr1YgvqorYFblVbrz8lTC9SBL4EcsvJt
	 fNKxMCTCFhUjt6jVPEhJVMsLoL7DYxFKiKK97+wTD6fUBlKsuO6P5nG151NCDssmK0rPS
	 r6idV8j4dGGlBec9u1tNNg2fLEEQ6btOtiKN1bZdLbiTVVgsXOKtXvwbJS9424w8F1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ME+Apf+1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eipCavVS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3B4606A33C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF3B4606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ME+Apf+1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eipCavVS
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1GlX2376247
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YfdJK8DklmuldJ6da0BpfSV93ceFX6oC4GgDqZr+sFs=; b=ME+Apf+1iDseekYi
	S2ctqAoafiXutknT0XGP7uQmd1KlUZVJ1rmuaJVQQPrwJthmQXyr/EAx3HHFD/2U
	FEak7mcGkXfnh8yVGkZyctvmkx8vFfT1g/ccFjKF/7FpF5m/ifKVTuLvohDOtEa2
	rmqHnpiPSxVpo5cs4mQYnZyORBlnJbVgEHv1kgou6HIeEQqzTA0A0JkprCr9Xy66
	ikHMAsBIVDN380V7gjCevd0PrF98TsEYKEQzRq6hLgWygPxLghc8nWp4KH56XSNY
	frId/WNzJZAE1tNTqZLw6pD9/dVH+xBVR/tr01BOlHwsNIZq72syGSY5d14OPJaX
	9vOKOw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4huetc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:29:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f02c63901aso73059325ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 06:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789740; x=1796394540; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YfdJK8DklmuldJ6da0BpfSV93ceFX6oC4GgDqZr+sFs=;
        b=eipCavVSrsKYBkfcMqs+A9U+iIuzWs2IIFM3HRFBuCqxuXvjWa9mlwg3xZk5aXpJ0D
         +x7ObHcboeBW41DAaJQ+3DJRgQ1ov1aSGPzbJ01Z549QzPm+DrIerOY9rgV7V0hvf0hh
         SZUyg83q2ODX74F5tiVpaZoswrLB6zZn8qyeP1U4PPSHBvzcCDhL8BCjdO7TX10kzyN+
         P4XfVceKNm2j6UZmW7rgZC4WxLZC8n/vwfVFt6BzRqMB+8T3O2Kt4atwPTUbijecKIhV
         xHUceoY1CnM44BZK10SwiAuj+7NeYfdbfPczVH5mdjvJGH8cQHdroF8cZzeuT7KlcLuJ
         RIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789740; x=1796394540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YfdJK8DklmuldJ6da0BpfSV93ceFX6oC4GgDqZr+sFs=;
        b=wxsDKJZP5HJntdqvEpvesWbbHCwdazgTDLz4iF2um7FkS7uxshBt8KRnX1kqR1bR15
         D1weTGMBHP9T0qu5QOw2FKNLONLKe2LBhWnu31pO9BtC1/kFZyLyXunBZTezE9veSzKt
         ovv4+tkfvIvS2Sty0UvKJHbtdI4ZC1kGZ6Wm4s7sYeVLo83SlHWVmToCSrHkRAViNYjn
         koj8JZT1J3AYzqbK/bcewOJ5sBk5Q0S7olV8kKhzM70IFE5fhsEIFU7cNjXBj65z3sPi
         IfPUgp78LHq47oNG9N6QUMlatXRJeEQ1sHnWg+HYkP9Knm4WwEvD98F6P6+Y46oYbfDR
         OdBw==
X-Forwarded-Encrypted: i=1; AL+hErEmFrxk4vl9ltFo4McCkNVSXWe87ycztZWeFVYRbpvSQtFQwN81Kdypn72GGI7tWeChjj0oc1/zNQcM7xjl@vger.kernel.org
X-Gm-Message-State: APuU4Z85BSMVnnyNizEI1D7FeM0IPbgLS3k9mTA2soBkJOeDkC73txnM
	yM3eM4WFVF79enZAIN5keA1HLuIGjeFO9HrEOsCoDyN/OF8i5LDQ/wrMaNRYq622XWiQ6c3L/et
	fjiS3PF2mUCDu/zHd9BDBggixiUww/ny7gT/vOIScfU3WNB8rNDEtbjApobIw2cpisiaR
X-Gm-Gg: AZFdTZc7ti3WoVkkkNQ95GuKl0WepvNKr9mfWepc7oQJkroCsxRHtapWIvCkIXQLqky
	WKdrTmcs19HA7VWsTdwIRB4SYiVSmG51NaaU4RftO1BJCqQiquPU1uL4Gt0MnDxHL57onxOcDSl
	MJ8nWdmXJsHGL3KQroCo/8M3U0ltsg4ZVmEVOB8G63sFNVrU3v+cPDGUNBUo8VR02IWrygy56Tb
	SKX2JphaRI7rDYJF7+ojMDgylItLZfRny4P2V7VdsRbSbHFGU8Bf0Y2EtEYtTyQLmPpRK9DNDod
	MCwRlgkOf9W465tGy5FSb8RB/IAIL3y8IgdlnLibmwMmLOR0Yvx8GDcC0ddzr5yibgvvBz4zq0r
	RTEIi3Kbb1g8CDTfzjQDUt3DqbbxAluTFGY7wO9nz/OZaOOPWXpa9khsuy1k5IY2yDAx5fsvbtX
	BXQuWvQf3mFw==
X-Received: by 2002:a17:902:dac6:b0:2e2:dfe4:adab with SMTP id d9443c01a7336-2f03f17d22bmr242099775ad.10.1795789739777;
        Fri, 27 Nov 2026 06:28:59 -0800 (PST)
X-Received: by 2002:a17:902:dac6:b0:2e2:dfe4:adab with SMTP id d9443c01a7336-2f03f17d22bmr242099025ad.10.1795789739086;
        Fri, 27 Nov 2026 06:28:59 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84285sm120324055ad.3.2026.11.27.06.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:28:58 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:57:03 +0530
Subject: [PATCH v28 10/10] arm64: dts: qcom: Add psci reboot-modes for
 talos boards
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
Message-Id: <20261127-arm-psci-system_reset2-vendor-reboots-v28-10-da05a33b08d8@oss.qualcomm.com>
References: <20261127-arm-psci-system_reset2-vendor-reboots-v28-0-da05a33b08d8@oss.qualcomm.com>
In-Reply-To: <20261127-arm-psci-system_reset2-vendor-reboots-v28-0-da05a33b08d8@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795789617; l=1615;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=ph2cyJOL6BXy/8+AP/FfiYNzz31fptD13LLAgSe1knk=;
 b=qrajNkTQVVFubVOWFdztpP2X8o7fcbr5Vd3UeRaqzrLhe8BmaG+Qreuv+VZAsHl0Dz+TAF7tr
 9rg+2IbNBJ5CVgDghP8uA/pFRF3CHYIwUs+QDhWRnh8bgx0XzIsnGCZ
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX9GKj10mtzCwG
 koiZ7r72ZXXPnkQRkqt7Y9eVtaBaJkPEK6YBG/a8Tim33x5NZmFphECj6gpxoROvLg0IMxm5uRD
 v33IngmNvBWUIzPP2BQR5u/uyvD+H/M=
X-Proofpoint-GUID: C45mLanCw5SWWp-pzyivAihk94IpvChe
X-Proofpoint-ORIG-GUID: C45mLanCw5SWWp-pzyivAihk94IpvChe
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b0993ac cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=bjH5yOvFM8yfI_BY5k4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX7RHJBbab+xb5
 NE1Fxf6zJDE/ZrsuuTWzAn/fHfVeSM2abMfLFpzBubO134DDUBkf4Gc2yyngUnhof2EH4pcRRC/
 68A6lXi7ZnKQjhIccZF64g/KOPdjO8foS81DPLVmUZP7Xxl4lByXTkcMZQFLZHz2EQ7HXA8rhc2
 4D/OnKvgfRmGE1XK5WJZDzXJgzYvsyLMO87dCpI+FEvQbS7JScg+IrcZvTnskOVV11ie8pHJLRb
 vjX2A8Ar7srC7hcDMwGqZfJ0g78OPoFtVvGhuChlo1mGLFHtjHQ3JBSjG8QGrStHxhgnMhlS/fc
 HV7bEgWb2xWsL2owgMcRfHPnxXYpNtEwnmwkgQjumIUtayudVJv0OwGD0XH46zSNhZvvA5ipqUZ
 D7u2Cqe8hbMnn5G3wJpOmbloaojcuGCjwKTYeX6QdEQ1KiyUHbsIIsVadpPuazguQAyMT4CW5Cx
 eOHzbGEDZUrzEqBS6RQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270057

Add PSCI SYSTEM_RESET2 reboot-modes for qcs615-ride, for use by the
psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via the
  Firehose protocol.

  Support for these modes is firmware dependent.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Song Xue <quic_songxue@quicinc.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/talos.dtsi      | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 142dafb04324b..30e4cb642473d 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -497,6 +497,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qspi {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 1d74e459f892e..937e1d557d41a 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -582,7 +582,7 @@ pmu-a76 {
 		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1

