Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693067;
	b=VjDp/GS36O773uXA6DIIIQ0Icc8XPl8UJyGbtS2VP+DV7PmRolxU+mvRmnBnFqsLQ+b5
	 9Vfg3TqLRFZArpRsaDggNCKUvGghzuZdk2IGG9E8fuaLpPftcxlz6rBtY2M7izVgZqQVB
	 uTyyQAeCl8g8Xn1I18BNwiNH2EikS745McOXXz9NXRL8k+FPLV36hq+Bgi+DCchsisYCp
	 nwXYUuz8k2ppbt/T5poHA8gLREXyMnabtPe2qFnrETq/YKsOmhp6mltoxL9glYnfTH1f0
	 Nemu7hI1T6TFOgI3F2wYu28bH9uGT/nE8MWdoAsHf99zX2i/2zFVCBGLvXyG2xXwesg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693067;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kTMR2M8nH+EwQ5Y7z7vyw9+nC0Feou+p6LDtfZIOJLw=;
	b=k13kruC5naMJ/LBbX6l/4mzKGEDMr8+y6EnJG6sEFNV2kLJkt7PTMrvu9OxG525YPgLQ
	 MWP/y3XrXX6T4DeVNOxNSNlyRFbkTki1dmLytrYgH8LRIsx+w4H+GiHnracir4fpavc3R
	 CCbIzLXdkb3xQKRsepvoUHOZ0rBx2BSxKXYNwEDVKIysv2Q26XpXf+5nXItmX31F2z7WO
	 KTIz7IVTscZAjKDdzRF1JEySchgz2SH0nFURfGdVRVie0h+mktO/lJvvvXnTZfNav0YeB
	 6DU8k0II4PKXRJPRg37EUYiXLXDe8q3CLyLg5WLBFEzd773ubABOirR0Bco4e1fVI/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EDWtmAx3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LVeimmRV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DB5606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84DB5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EDWtmAx3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LVeimmRV
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVIoX3476075
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kTMR2M8nH+EwQ5Y7z7vyw9
	+nC0Feou+p6LDtfZIOJLw=; b=EDWtmAx3GvvNN3a+Z9iWMw6Q/E5iJXROPRDHPv
	GTu4wUatkZ6yHEq28Rk+OR7sHdiNz3so4/6bKoD08YDftefTSOrNQLcwPDgDKM/0
	82+UM+Id0BucWjHgrOSfcfUrUjmm3/GfNKW7dMme/T7mZwOTcXEUNEg09uuV+uPQ
	whPuXgpwCkocviFOUp8VK+5mxPf9fd7Fjjub44ulB6OUhvpIihXL1NniZMDu0Qu9
	SC6vBFZ7oPIPtnBrhA3XxMn9ENcBV5GsOCFn9hNbmkbZEMiqv923XZ1YjRL+0kLd
	NwfXaMLFFlBXm8crwzl2S7qCpoSFshZDn6i3241XmIcfbGGQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rh7sf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:37:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495a1f5e47so1048690785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 03:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795693066; x=1796297866; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kTMR2M8nH+EwQ5Y7z7vyw9+nC0Feou+p6LDtfZIOJLw=;
        b=LVeimmRVS8ewCYfEF/M1zlboIBbY3DfEYFGj3BF9PhLaaTDSX+eBdinDKhry6zgGQo
         rEGUOI5LgDIJyALgxPMQM6zjC0h5LG78ZL7ab/cEb9inXwnXOBO6hdb7B50rPtSljPUG
         P4NcFeNPSK1gWf9SsHh7JFT5nRn5duw4abx7qxDhPoFnJX484t36h2aCmxjzyDx4l3xQ
         ZkLBPqJn/r4Kf3p0oAtN4GpdcaY/ZtrbwhAmmGZbxmLoDatF+faX6YA05Txi9is6m3rZ
         b4hiR39zVzR9IF1V+nStQF3zxieEDLDzjy3qvGTNmgSSXVWdwEj1XbtrF1P7DVP76OpH
         OBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693066; x=1796297866;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kTMR2M8nH+EwQ5Y7z7vyw9+nC0Feou+p6LDtfZIOJLw=;
        b=24MLqZEulCIh4luIKBD2Dn9yf5bSZXVh9Bv5Os1tAAPnf/HWWkuHgKFYqmg1+z3m35
         IaNlDdknZzmEEU8/M1CC7GUkNTKu2GPxHalqdN3i3ASBrACbD+TXuW5zWjE77uS1CVaS
         h82fJj3Ql1F0zjuPMIL0dUBgPUrno/sfCoZZY3TVayjNzaPHwsdbYAK5BiyIrn/tfMcP
         x3wadSeM4K82P2kKa4+Mtm+cUt4eZGFXZJ2kO7C49vNFeDVe9/lO+ZXE5VEDRQO6o15k
         le8C0cWQzzlnmAjqdIMMEFDyumJ7UstPQPGXK9ccVSk50ilDoTTBJN4dOmhmshnMUOD3
         apcg==
X-Gm-Message-State: APuU4Z+86JRwZ2empYrYgF14dFkrfdzkm0hpxweAUVmzrXksw4vxWE+A
	/2mMjR6d4Uc28PASEtKHXZXr3P8VAI/pxVXFnsS66Q8DP7TptQlqpwK7D5thf2b4lznB8p6x+i6
	6wPiEVPdy5ns6wC4mwTknRhdMEQVgxSNjXkkLchU2wbOWzdBjDJDhGEo1YIMlehgz4E2R
X-Gm-Gg: AZFdTZdwyhUo8IsAoUA1VK9G5QK7pE1LnxpE61MTte2AE6pEkne8A5w6K/T8uEbVjY2
	vds1h4VuNe/0VMpZ9OvrQxxTpUajO6WwFJwIXnfMGQxCpf0Ts3U5hvibn5w9OeCrO2YfCObAUqA
	nWjC9KwD7847rAVcBTrU3UHi87HEJ0GUEReM/WXYSMrr1x9Ft8EUZJNpypz3UaPvgjbEPmuAKiw
	hbskQACpEjr81ML8dLEUepi6U4bnal+3WC4XLrRdtoKow0Hkk+Ays5kaESkBrB4nl60JYx+K5ze
	n02/tmKtvfLQU6OOqLHHPv2vvw4JTOrr9WgUMVelO65jbFaWw1b3s5gVvKe3SwJRfSSv+J8naca
	WfqKVv4mu+9CJeW2xn1C1F1MTAaXb/y5LjoSMLFtDfLIH8IscR1Rd95d3TMD2/ZgJISzHAhTHnr
	7b3Qwan4dfr+X9
X-Received: by 2002:a05:620a:2842:b0:93f:5717:e7b9 with SMTP id af79cd13be357-949ba99b091mr3609369985a.30.1795693065800;
        Thu, 26 Nov 2026 03:37:45 -0800 (PST)
X-Received: by 2002:a05:620a:2842:b0:93f:5717:e7b9 with SMTP id af79cd13be357-949ba99b091mr3609366785a.30.1795693065246;
        Thu, 26 Nov 2026 03:37:45 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afec08asm748210666b.73.2026.11.26.03.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:37:44 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: agatti: EL2 overlay and QUP firmware
 for the Arduino UNO Q
Date: Thu, 26 Nov 2026 12:36:46 +0100
Message-Id: <20261126-agatti-el2-v1-0-4e25fd64f198@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyMz3cT0xJKSTN3UHCPdNPNkA2PLNNNkkzQzJaCGgqLUtMwKsGHRsbW
 1AAjjrhtcAAAA
X-Change-ID: 20261126-agatti-el2-f7c039f5c4f6
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfX6typp4nEqEML
 KzD39eZ168+cRRQy0ok0HZjAhiRG/QDWxT653ZMBUIEtS8UMgrzuHtFw3+ILkZ38O49EHq06WPz
 otNsd0k7Pf4yHssfN0oggdu5HJW/yhu4J6ayv29ROfHDImAbYHzahhUr0ZE1AFUPmvs/30sdu5h
 2hB7Nd/4MqByJHs1y/vFLXJOS8OGTarKEcQLKxWT2obGG2G9/URP0fxyIvS3qAKoWkKMqBipjBz
 BXkOWEn5VSqX0z7jpMKGnvCPFAPjWnm3bZ+79mOMOI/vCVHi0sNPrPjAo93tgM9+VaKzDWZ6RFL
 4JBBSyrtVSOLcubDbHLM+NZJgBCOLDoK2G0KecUaaAmOiJslp+rdOzPXMUfUM5Z7i+vXq1gpLtC
 POjWrmMnIYGuBwO1BXjeZ8mdNx5KO7oBWbGOpzin43hVwtTepsNUUeQlkF9le1rV2BGF03L8w+z
 QQ9oJ+FWLRJyPZp9oCw==
X-Proofpoint-GUID: 3phuI4PLBiFokxxBMGHvASyNQnrkh9gq
X-Proofpoint-ORIG-GUID: 3phuI4PLBiFokxxBMGHvASyNQnrkh9gq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfXwGmI/Wg/kQIg
 zBF9bnh6gcBluxDUvcNVGPxV4GP/tkk99mGbQ+ASUH+DDWCsQMPb8Dz7tVVjLa6S3LJMGzbxwuy
 evMXTVd2X56pEq9I1/EQcuXONuR65MU=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b081a0a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xXV0mXPzIewK9BSCCcUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260045

The Arduino UNO Q (QRB2210) can boot an open firmware chain: TF-A and
OP-TEE in place of QTEE, no hypervisor, so Linux runs at EL2. These
three patches are the DT side that this chain needs and that does not
belong in the base board file.

- Patch 1 names the GENI QUP firmware, so geni-se loads it when the
  boot firmware has not. Where the engines are already programmed, as
  with QTEE, the drivers do not read the property.
- Patch 2 adds agatti-el2.dtso, following the existing -el2 overlays:
  zap shader off, SMMU stream for the ADSP remoteproc.
- Patch 3 adds the WLAN firmware's SMMU stream to the overlay, as
  kodiak-el2.dtso has it.

Loading the QUP firmware on this SoC also needs the geni-se fix in [1].

Tested on the Arduino UNO Q with TF-A + OP-TEE, Linux at EL2: I2C, SPI
and the Bluetooth UART probe, the GPU renders without a zap shader, the
ADSP starts over PAS with no SMMU faults, and WiFi associates.

Patch 1 was also booted on the stock QTEE + Gunyah chain, with and
without the property: the same serial engines probe and the same I2C
devices answer in both cases.

dtbs_check (qrb2210-arduino-imola, qrb2210-arduino-imola-el2,
qrb2210-rb1) is clean.

[1] https://lore.kernel.org/r/20261114-geni-minicore-v1-1-a825dd549664@oss.qualcomm.com

---
Igor Opaniuk (3):
      arm64: dts: qcom: qrb2210-arduino-imola: name the QUP firmware
      arm64: dts: qcom: agatti: add an EL2 overlay
      arm64: dts: qcom: agatti-el2: map the WLAN firmware's SMMU stream

 arch/arm64/boot/dts/qcom/Makefile                  |  4 ++++
 arch/arm64/boot/dts/qcom/agatti-el2.dtso           | 25 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |  2 ++
 3 files changed, 31 insertions(+)
---
base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
change-id: 20261126-agatti-el2-f7c039f5c4f6

Best regards,
-- 
Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

