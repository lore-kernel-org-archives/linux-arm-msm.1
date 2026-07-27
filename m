Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552394314A1
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 17:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785172826; cv=none; b=Od5r0LvTTQy1oUM+FpyeGUgdK7NxXnwXWVS3wEUybXr1ujSsIhu2W1GXloFmjNhiZqtBbWGzLAkQSzbYc7gW82qpGXX2wcLhKpTGievYU4Bh1gcl1yskD9I5hXnYV4oQvdgaevnxudsa0SBpgjYO/pLMLJYWStuTfjul7R8bYT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785172826; c=relaxed/simple;
	bh=PDsxrt7keAbY0sXOhE86fzjNlxProfp5doOstLTQAwI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W6ppvypRg+w/CpA+vkgvWVvgA85lJarU8lkh9V8Y6ynPi2tCcm1rr7oy872jieCtdM5OsXS6xiAgT2Zm7ZGBluNmpp39V4ElyAA9MPxtPsiFR3/Mb0ZEfgHaAmPpWdhXm37NKMvW+QIj0aKsG53e9NDg3wz6Asj6FaO2bOKImo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QzUGDxeR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EEPL9Ym7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QzUGDxeR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EEPL9Ym7"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlYo5855735
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 17:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Uv3zEN9xXjNg7XDyTuERbi
	G9Y88PwNHYIN3PilyCZww=; b=QzUGDxeRtGqgLy0ZDTMo+keFTemMVJ1qOTE3hC
	gHGWlEhGUlIjHU0MMLVtsuVIaQ3QC0OdpYkQx6ECCcwIAefvqo1Ngl8oVPMxqSlV
	au9aTE7g8Gh1bvdA+O0RUAzaRevODLUzfMUdJsa+q+htInmldu9kgnOY/ZH5Pa6n
	KT52JJQTekT1NAwUHtMblazC3Oph9EbAcFCel95U4xecWqGhYmQP8AY9hNhv/PRS
	Lgbkz06Si0mlwKVTI8/6jSdIFlJn3oPB0GsG5OTwSrdt3Samn3KZJhAogz1KH1Za
	PdT/PF05ym3IYIlQlr3bi3jVrJNt++kaw3VhTRF6J0EAcsLQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fny9wkb1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 17:20:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f0fe57470so105685a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 10:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785172816; x=1785777616; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Uv3zEN9xXjNg7XDyTuERbiG9Y88PwNHYIN3PilyCZww=;
        b=EEPL9Ym7LCBcPzVU3j+5A8knqQZu87JuG3b7evEWoRc1Dz1c0DPLptqRfm9Zi4mbT6
         qCFFiSsXFonGxY7PvH3UKIN7mEj9+zrtumNpefw/+E6pTNFjtlAcyX/4FNB9wM/yH5JH
         J473VnL76GWYUSbsJMEojS6Omweg0ZfPVgt1IV1ITRnH7WjAkNqlZdLhSho+4rEdgzeI
         J22PcJ/Jg2PW3il+HrXC3ROEi5+wWvVzMeAknAY4zqBVktniWUz22q6MHiURPKoek50+
         AWHKTvnijBHUZPAQiSQoDjerPVuFaXUorGypyvuvhLYS+Ee2D8PiG5uogH3rXNtoxAVR
         adYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785172816; x=1785777616;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Uv3zEN9xXjNg7XDyTuERbiG9Y88PwNHYIN3PilyCZww=;
        b=XGMIhaIbTaI1lbmdy+GZ9k2EVZHtRj5hbHSb2/ganYGEBlRDng/AtXR7Rm2fT7kM0u
         Qa5LNUUkrhVwF2W1DxzGycRtxn69BWHG1rNlqVkexdJ470GtWlR0PhdAr9eCm9V3CmEv
         TLQmreqLPbgvGkp/2fyY/lH3Pe3S2PF8ADvpmIp0Gn8aNbGdHtB1BxVXeTkdqi9Ls8mt
         XXBjrndFSpZKQOs8SaQ79Friedt5kWRmZPF1GD3AYGsJFGSvVVePg7kYfi5V6u8iz8++
         aR7wmlIPn4XvSrVj4B9wwBDp4U3aYpxY3V2VZdUQ6hrpZRS3XOF++prc4XHPzPwrQeG9
         yw4g==
X-Gm-Message-State: AOJu0YwbIMZh723C3gZCA8We6VzQy7+WZ6zUyxyPdt6DQfppZitdxTc0
	ik1nqEW6/UMYgooccIURKSb/GB+TR6t+R5f7jZu6LO0cCbKh+tvocVjQNujTCcjdKN0N7rJM/RD
	2gnU6xfJRTcawGOHdZacXfgnneipg5nNGiF6Q8o7Fq6kyN1T1CH8aTyqJ0GelY0bAikcM
X-Gm-Gg: AR+sD13IQsew+w49qK1HFBoPknq9oMPvGc5q9wKkkdmwS6KXck69vIzF1aJ2/Kk/iRU
	vYwgdhjZwEKgfiRzy8WdbrHAP62WRK3VbqsyR5xg1FqWl3nzQ3RZ6KsvmyYNlu5XjfudrRl0/K+
	qTtt59qiOPpottJMKX81qduW42p5a1AO+YyXzOwwgLlW297LZVdHx6p3xbMcLrR6a+i18Qjr0Cy
	oTI9tsoHW0V61WdTIf+ml4ihSb1WMkLlrBP7V7PSXgyi2MUzA5fiSd5s0pp+RRpqKuxEuY7gMGi
	FikYEkm8eifXiB7EG9SqIPzqNApKDkGGNB3EPL+E5VqJCqZ6CJkhHvPcpMRub7N5gv/jzFYuHlb
	c0KvNZPkCEENxPziWI7E=
X-Received: by 2002:a17:902:ebc2:b0:2cf:4c37:d955 with SMTP id d9443c01a7336-2d00e864b58mr2732055ad.27.1785172815932;
        Mon, 27 Jul 2026 10:20:15 -0700 (PDT)
X-Received: by 2002:a17:902:ebc2:b0:2cf:4c37:d955 with SMTP id d9443c01a7336-2d00e864b58mr2731595ad.27.1785172815300;
        Mon, 27 Jul 2026 10:20:15 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc44cb92sm55892988eec.13.2026.07.27.10.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 10:20:14 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v3 0/4] Add ADC support for lemans, monaco and hamoa.
Date: Mon, 27 Jul 2026 22:49:10 +0530
Message-Id: <20260727-adc5_gen3_dt-v3-0-bc00223648f3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA6TZ2oC/3XMywrCMBCF4VeRrE3J3cvK9xApbTJtA7bRpAal9
 N2ddiOIbgb+A/NNJEH0kMhxM5EI2ScfBgy53RDbVUML1DtsIpgwTElGK2d12cIgSzfSBifFtQY
 QmuDLLULjnyt3vmB3Po0hvlY982X9A2VOcalFXSvWOHVgp5BScX9UVxv6vsBDFi+Lj2G4+jIEG
 lKA1Ttj9d7oH8Y8z2+TmrOZ8wAAAA==
X-Change-ID: 20260430-adc5_gen3_dt-f0434155ee25
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785172810; l=2379;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=PDsxrt7keAbY0sXOhE86fzjNlxProfp5doOstLTQAwI=;
 b=Zd8hPdARyoOyofHX8tnW3qk3Ymc6tX8OGpE0XjpzgvBhYZqVYfv+kp+5bRsaZn6m8Ce8wUPw9
 nZEC3YgH+bkAiig87T/emwd3WYNcstkUS/zz29IS157HgKOgPx1CSE0
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE2MCBTYWx0ZWRfXzhazlw5PsubP
 1+rOo1344fb9Wgp72DtvgEZqorlP2YFAPLVcvgiDrxuWsxIJSCzwIUwBWcUo/CPIFEw+BdibRFR
 77ExbF1YuaIoA+mADpdpKFpi7tbio7lrfG9muQaQMfV6eBjbvEAAgusk58jutCBRbgj/tDMKT4l
 23JxQargxPzFXxJ/rn+Bj0/RPkUKDkse+CWEUrkn9Cf+onOjQ0EK63Egnz1bGkTRGWTMSDwczdW
 83z84YOw0fyJwwZ1IyhqH/HiDCW6vIfQwaU2LHcSNP2u9iWmD4rnuQTtZoaoq+NiZu5AGRoiltI
 Ov8MS7W+fSIjbHRtFl/jz0GhYAGDNNh0jgjGuNnMGJDXlYRuz4S7y9YbqpO/xh1It++682DS14F
 86lP80Hldp+HWKTg1xnwLVRu2TUI0piq2KPiYEXsD1AZnJDxES9dFWO0QCqF0aKWFmYjnGUNYD2
 r7d4R+H0H7R/xqNIycg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE2MCBTYWx0ZWRfX1qTvlc/DXolj
 RpXzTtlOVCTN6JtFtdu+VNLrfJmiI5EWLMv0M2u/JOlyORHiHB4NKLCX0tmRlZG1gIcdzf669VS
 niTFnhYaSUUoVew4lejzjhDMI9+GRV0=
X-Proofpoint-ORIG-GUID: 6iKu-YA3JN47w9wz8ocyZcrm1M71GGGQ
X-Authority-Analysis: v=2.4 cv=E4b9Y6dl c=1 sm=1 tr=0 ts=6a679350 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=ispjFfhwX7dSH34Uv1IA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 6iKu-YA3JN47w9wz8ocyZcrm1M71GGGQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270160

This patch series adds Gen3 ADC channel macro definitions, with basic ADC
support for lemans, monaco and hamoa.

Patch 1 adds ADC virtual channel macro definitions, which are used in
the "reg" property of individual ADC channels and also by ADC clients
to reference channels. These are a combination of PMIC SID and HW ADC
channel number, which are parsed in the driver to identify the intended
PMIC and channel under it.

Patch 2 adds ADC nodes with channels under the PMIC instances on lemans.

Patch 3 adds ADC nodes with channels under the PMIC instances on monaco.

Patch 4 adds ADC nodes with channels under the PMIC instances on hamoa.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Changes in v3:
- Collected Konrad's Reviewed-by tags on patches 1-3 and Loic's Tested-by tag
  on patch 3.
- Replaced "interrupts" with "interrupts-extended" and moved it above *-cells
  properties in all patches, as Konrad suggested.
- Excluded PMC8380_6 die_temp channel on Purwa as Konrad suggested.
- Removed all ADC thermal-zones in patch 4 as Bjorn suggested, and also
  "qcom,adc-tm" and "#thermal-sensor-cells" properties to avoid thermal-related
  errors.
- Reordered ADC channels in patch 4 based on node names.
- Link to v2: https://patch.msgid.link/20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com

Changes in v2:
- Added ADC support for hamoa.
- Link to v1: https://patch.msgid.link/20260430-adc5_gen3_dt-v1-0-ab2bb40fd490@oss.qualcomm.com

---
Ayyagari Ushasreevalli (3):
      arm64: dts: qcom: lemans-pmics: Add ADC support for PMM8654au
      arm64: dts: qcom: monaco-pmics: Add ADC support for PMM8620AU
      arm64: dts: qcom: hamoa-pmics: Add ADC support

Jishnu Prakash (1):
      arm64: dts: qcom: Add header file for ADC5 Gen3 channel macros

 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi   | 158 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-pmics.dtsi  |  93 ++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi  |  43 ++++++++
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi |   1 +
 arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h   |  88 ++++++++++++++++
 5 files changed, 383 insertions(+)
---
base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
change-id: 20260430-adc5_gen3_dt-f0434155ee25

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

