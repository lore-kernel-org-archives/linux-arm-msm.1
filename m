Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04829321420
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 03:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790565623; cv=none; b=IYYFZpKlQKlYsgmZX9awGo8dYQBWiSjBaTPXp4cyqEMMZDL92PTgY9weaWWR+QU1krf7ir8+c6qpJQX56mLplvNnF8u/Ot02DKO9bG/zSGn/QOnFcCUV4HJWxGmmuzF0SOa5ZhF6u47D0EZETm5842lYuJggWlmiz6di91HIqtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790565623; c=relaxed/simple;
	bh=+kOjkpPIp2O0Y2TcarFiCr4rotgxnSe8KeYiGN1+xbU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GwwxR+rngGNUrt7uVBCTy8XyCAp2gM4jHoQcA3RJR+bGUWfapGdViqbJpwPlCa7WliHHm06MCaEdHSr7591yDDjwqnO6koS16bgC0kmn1y5SKeCZ4J1/9QIjbUkAk0lWTXKNXM2hGm0uM5GhQ0zQWAo2CHF/oADGXO/HiAY789g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rr72TvMk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dBCAu6QF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rr72TvMk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dBCAu6QF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RIMlG23167944
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 03:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Lnkt77Nj/YGUnzV32lk9F6
	YUGD9V84nL5hweolWWiPg=; b=Rr72TvMk8lTQ5yMdpm+GmugIFk0OSsAzLo8YCg
	iDY6nwiqweflNjfAteRG/toYCMWo9HXTvrxHNpsK6ia3lv+qG2RJIbIIajOit+cw
	ixCQj/UcbPfRV6S/uAoP8F0BGUGK7SvyMs9R7MxHoQwHs9NR7muJbl9WUe+3fZdu
	R5Gx65SuGVGRDbsiqv2Zr2Y80nm3QlX3URoRAVJrIOaDCGr73ZAJIy4vZzhpuqj2
	KDP+ZfkarRTckiOrvAENbjWM4o7pb+6WXc2fzzYRLngcLaS2SzWILxJeNYxv4BTG
	qDxaTouTswoGOABLU/asQ4bjkk7BcSWhkukJHezIfboAi4Qg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx77jv5x2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 03:20:21 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1466ab2bc8dso1558721c88.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 20:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790565621; x=1791170421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lnkt77Nj/YGUnzV32lk9F6YUGD9V84nL5hweolWWiPg=;
        b=dBCAu6QFTr9Qmfx08buElSeqlJ3i/pYxdl6hmLD+ukUbhKuMUqJdLn8UZjs3XnccVG
         0TlQ/1XEOFXtm+Tm4UxJNLad0mrNH5PrBLGAz71pcApsjqL7J9N0Zm5tmPqpKcrkx4ks
         A1zQYP3yEJ0OxPTif1y5IohW0JtJC8uUbPI+g4z0+wYcnikSaSV7f1XKafqiiUgpTP3b
         bsoUSCFTGiIAZOjBrXyessB4bKghbWp6LaGe8V19sj4KTIX6nVyF2j/Q51R6oVxFFI0v
         Ve+JXGyr29FPeh7+VX/c5dnSi60SUJNONQGI/09u2n0Eh9BYu1Un0H9+4OWiYc2zl2z1
         4OBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790565621; x=1791170421;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lnkt77Nj/YGUnzV32lk9F6YUGD9V84nL5hweolWWiPg=;
        b=lI8oYzWqRA6pO8XRkrS9zH9TSfKueguQDF+OU8Yo4GkFtuaA0XV76vVlx8tVTWjiQY
         QVcch0FZkNzydJXFHiPxjnDMeIA/qX21llXaIkyC9tWoI9r5E6s0hf02bOir3qqYjdFs
         E0Gg8OTGr5XxGGsxg900b/hbshAF+MyVrMISpTWz+GyR4WmTGpwslOgI5xl6wbbEpZ/V
         vn5BSvoiSKs2oMXc2bi4fNCjP1b3PreIp2J7fwpaBcDuOvhB5B60sXNPipmVzPLezIeE
         spVQog5T5reXvrwGkL0UNj504Di6ZY3KQo3QnOLStgyMvskzt1eh8KHLBc10Mglibtjr
         cDIg==
X-Gm-Message-State: AFuF++mWMIg89+ujL9xdgLpZQsLTjqg8/De0ARIcvuWXmFNJ/r+imoDY
	9x9mfKb2LkHkmm/Nzq4airo1iDmU+8taQg2F5TP40fTFqdIki/zLxdxuK38w65KU/B4XdVyqA3Z
	Hnv5uOxkIXTHb1SeHA7rPDZ/LXcgENJDlcDHNz8BU9+EL78unY7zpf2XUb7dbXvVqP4gv
X-Gm-Gg: AYBFou0smVE8EYOA99BJqU5KyIEUJ7HLmkhtRTcEcn5vvDG4cjY449wK7FZKca2z36F
	/ZtRZlVWKEUukagS82AHh2Jl5PYiwEreSkX7DCoJugkxkMJLuvyfO5jyBQA/qMPABPQ8xxi1bi6
	ohXLqqXU0hqaNULRbqrsV9oPvpyx8jkEIDCsBBGKEmGzrV6K266a88xyh2xhoumSiYQxHUZdtYH
	b0XO/aLeVvO+aAbsVl17YYr5LM/9hS9Y66GRzNsszGUrHJhNCTEOKqJnQ8fQT9mog7Naiuxu0Ha
	QNdYv6uCTFCJG5vMaD0gVBieRFMAowj8tZB8mADkTNHFihEl14z0aJrWL/SlpFH+a+b1tO2BMt2
	BlVw4iVhUgkZyxN6EX6IOYeqkNHGYB16sGm4NxTwQovxp8IpoXeqe
X-Received: by 2002:a05:701b:2406:b0:144:fe70:dac3 with SMTP id a92af1059eb24-146cec4a0cbmr8573079c88.12.1790565620512;
        Sun, 27 Sep 2026 20:20:20 -0700 (PDT)
X-Received: by 2002:a05:701b:2406:b0:144:fe70:dac3 with SMTP id a92af1059eb24-146cec4a0cbmr8573045c88.12.1790565619945;
        Sun, 27 Sep 2026 20:20:19 -0700 (PDT)
Received: from YUANJIEY2.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ac67c0ccsm21235372c88.4.2026.09.27.20.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 20:20:19 -0700 (PDT)
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjie.yang@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Subject: [PATCH v5 0/2] Initial support for Advantech SOM-DB5830 board
Date: Mon, 28 Sep 2026 11:18:47 +0800
Message-ID: <20260928-b4-hamoa-come-v5-v5-0-05940cdca85b@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260928-b4-hamoa-come-v5-209048957c20
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfXyjVIfsnBpC3D
 +4vKwfUaX12xHh1CZ55Fwq9VSKJitYqE/OyQmn7Fel0y7IF6IVBapT40Tanqf0VL0M595eYoblN
 5Tvacm1Z6ZmQk00pVtzY4vVhNn1eG1Q=
X-Proofpoint-GUID: V4UuRmviLfPBe7kC6OrNanQkEWHDxmjW
X-Proofpoint-ORIG-GUID: V4UuRmviLfPBe7kC6OrNanQkEWHDxmjW
X-Authority-Analysis: v=2.4 cv=J8U/fwnS c=1 sm=1 tr=0 ts=6ab9dcf5 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oqdWaPmN6A6clvLYvxEA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfXyA7wolc1HkWu
 iLokY4KX0iYzMvUDjOFFASYJxlmyQxN4Eg0oxi9c59/qrlIUxmqnEAGv289WNuovjzOl8guu7sJ
 2XbI5NGegYPzO1bBGnVQd6T6zwJavUZWUMbXC5EtyPpDDp0bBBisU7Zjqn7sRVQluR4dhLWNB1J
 umA4eSW0jYRlOiwVjsGcT0BTZH0/zAD5E3SuFQtBNv6XScziv2nLKDKqiCaWSmmhopPMBComfnN
 9Krhp16tpPnL40gj7AXo1Rub+LQQsjHQfzjnRBpQDE/PWj1elJEQv2ilGlmKtPFwz4Y3FC6olp2
 iaL+Ph2KvU+kh3wLOHagvdWvxZHlBjUYqoGedH7c+7KIgHXJW/ABvbw7In8HLnSjoTp/gB4MjvL
 +IWZadL8kphz2FN0M/0DVS/z59xnvae/V3v5cKWkADNuCwa23NHUwTE+PTAkwNKoBURidxkL1De
 cNlW21iTzqX0geU2NBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280013

Board layout:
+--------------------------------------------------+
|               SoM (Advantech SOM-6820)           |
|                                                  |
|   +------------------------------------------+   |
|   |     SiP (IQ X7181 EVK SiP)               |   |
|   |                                          |   |
|   |   +----------------------------------+   |   |
|   |   |   SoC (X1E80100)                 |   |   |
|   |   +----------------------------------+   |   |
|   |                                          |   |
|   +------------------------------------------+   |
|                                                  |
+------------------------+-------------------------+
                         |
                         |  Plugs into
                         v
+--------------------------------------------------+
|         Carrier Board (Advantech SOM-DB5830)     |
+--------------------------------------------------+

Introduce the device tree, DT bindings for Advantech SOM-DB5830 board.

Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Co-developed-by: Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Signed-off-by: Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
Changes in v5:
- rebase on next-20260925 
- fix merge conflict in Makefile
- Link to v4: https://lore.kernel.org/all/20260806-hamoa-come-v4-v4-0-706021d4bc8c@oss.qualcomm.com/

Changes in v4
- drop fix HAMOA/PURWA IOT EVK SOM compatibles patch
- rebase on next-20260805
- Link to v3: https://lore.kernel.org/all/20260805-hamoa-come-v3-v3-0-20463c43eae1@oss.qualcomm.com/

Changes in v3
- add patch to fix HAMOA/PURWA IOT EVK SOM compatibles
- update Advantech SOM-DB5830 binding and dts
- rebase on next-20260804
- Link to v2: https://lore.kernel.org/all/20260727070758.528-1-yuanjie.yang@oss.qualcomm.com/

Changes in v2:
- update commit msg
- fix binding error
- update pcie and usb DT
- Link to v1: https://lore.kernel.org/all/20260630071022.3256-1-yuanjie.yang@oss.qualcomm.com/

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Yuanjie Yang (2):
      dt-bindings: arm: qcom: Add Advantech SOM-DB5830
      arm64: dts: qcom: Add Advantech SOM-DB5830

 Documentation/devicetree/bindings/arm/qcom.yaml |   7 ++
 arch/arm64/boot/dts/qcom/Makefile               |   1 +
 arch/arm64/boot/dts/qcom/hamoa-som-6820.dtsi    |  54 +++++++++++
 arch/arm64/boot/dts/qcom/hamoa-som-db5830.dts   | 119 ++++++++++++++++++++++++
 4 files changed, 181 insertions(+)
---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20260928-b4-hamoa-come-v5-209048957c20

Best regards,
--  
Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
