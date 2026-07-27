Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F8A3AC0C5
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 12:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785156712; cv=none; b=CYo4Yx28Qg5BcHXla/c66L10uPTFSo1eO+06lGZBA3K5EXvGsJznVBZWYEVUS3s1y55EQokhRfyipO2M8PnLWFiVUbQe0FiIOgytaUtEc8Iddt5skw9xQLeLIUuh9rTFIMmLJUzT4GCZTUPwcSO1YhaqwmGd/4t8Vv+BQD4W3Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785156712; c=relaxed/simple;
	bh=SkbzOGWyL2WHXqZnQOzystryiRSavuC6q0QFnAf4eZ0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=E0L4s515Tk+kTO2rSsMmI6SfeEcad2shZ/CBJPtvfHIXdiFT6dM8T9J6joGaMoGLt5W6k8bYqHgZMybeekKaw1t4HzlqC8rSXdoEgntQbUIAeyZOUIHY740XXqpwRS5FAqEjx0LHqmBuxxpr7X+9iy4j7szpDnaO6Pzn5XaNvBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vs4d4H4j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qt2/Ta3d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vs4d4H4j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qt2/Ta3d"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RALv9J3570789
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 12:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dzasj/a0P5Gzifk+kNyh0X
	WVpQVv9BzBRNZUoAUBTcg=; b=Vs4d4H4jqeae2Fmf93LECAb8yHyDjYhXkhXahD
	leb2E7WY7lP9yvGrahklPVQVlTvkPqiUEtbeKNe91FVtt19L2c7Hoc3p2SQJcUT7
	uMZYnitVf9iSOvtvGxFXB0b+TFvoFGB2plRlml8Ybp0C5rv+QJFV/JBYzgpa3ucq
	M9rO0RhPS6AD/nbp1debHOGFzlb1d/UWZ0eblUI1gL9RJESj2+oUp1hLJ5zpkfmh
	6KOXHGzd1qTCAGKEAWtnl2dBjbFFAC4mMI0cQFtPkPDmOWnKln0zgNAwvON2HvTP
	22ZLTyPYWMov/3hjug0Owmi297voOkklx8mN0FaW2HOFm3cw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp30g18qx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 12:51:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce8a76df2dso47659935ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 05:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785156709; x=1785761509; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dzasj/a0P5Gzifk+kNyh0XWVpQVv9BzBRNZUoAUBTcg=;
        b=Qt2/Ta3dk72emoQg939yurOIxYpXknXTl39W7fUS40qEzeoSt4yKDcU5c2OhDLiQCC
         0ChLUPoKk0FbEJcmpTPBueVMO/f+vpx25z9Z6fFBUeAWKoUXessf5iGZ3Y2M9N9hKNSt
         kCp0MQ//Z8RVejEiJFSSd3kxw7R58wrVGrOoosE+f8h8pONBIMtMLCTG07x+9wrQ6pYF
         GPYRTSOtsa8j8qbzEYnRnQG1QstlflkIpYvQEjnX74a27036FS+wZJhtU+yVeO3uwpoN
         IzmaTGRYnI3dZkDwa7Qo/7lMjaTz8g+qVHK5rgwvv0DlgMA+1/VB3SypsNP/uBOO3TH2
         t72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785156709; x=1785761509;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dzasj/a0P5Gzifk+kNyh0XWVpQVv9BzBRNZUoAUBTcg=;
        b=GTI2vTUGnSQXJTgpzsRi8zsilFM/mMFrnmLv4gokplcilgvRsGZwRsglBEGkibIxAA
         KTFf2vLiRTmwcTkTbI10GEKSZa7kRbZoOaHJH9WMJUj2lV/PV94nYAC50YH/J1ts0wya
         c8R4fLuD8Rul2AWEq6GskKQ+IR4735oQauLDsb+BJGIH+d6rN0iMG06uyQdVhjgpIcmg
         aT7lwWpQ5sS11ORtB48pstKFz3bnZMhS6eCYV7uHUk/czv4PCfHeOcf2GJ4EpVjb9oC1
         wNdK/tG0pdisnnF32xX8wfpDs2ylZSa3APqXZRHQxppyjjJxcZX6URj99riergnPb+Ay
         VBiA==
X-Forwarded-Encrypted: i=1; AHgh+Rqya0lnrL0AKYLCMjM5R5GJyCj4cpOBtTcz4in4cLlbkgmi7gp3/g0mB4E2t5dBcYGn+SFtcOniPlWEH4L+@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg7r2+6728SVvww6Vwn3XlbGdtcta7byHoKFcEMQxLV9uOku97
	zuV08BEmzqpUxnSOTFTWqjFq6T75MX3v0QFaGLsIHIvK/R0jaAznpGJKfSxilNScRmx21d1oegE
	n7CmqoIsOl16NT94+1Yq71noLJMZDXG6w40mHIgO6CPqtOq+UztcOmnXp5FS31C0ymSQF
X-Gm-Gg: AR+sD11WmuTX7Pkz3FCJLwR/Z7onaJx0/kKUX6u/kXL0TurqxpBLQ1lBB1DDb0tZEis
	wJQF+5bFJ8z/D2risrWwDlfQpU24LmrJRJUvBI14ZtPLxWHPWLzFur786H8jlGqVy8VCqZwIt4o
	ho2yL2QD8HTRjMGExjZFOlJJ61qvZW6KNw/0TEd+5+mrp0RpE5oIjHDsOjd/am7Bx11uOv+CUF6
	xwwOKa8wfzM3bYYMliv8oBhmU03kKVfz7hZnygzqShEl/Vw9DdsrP6pr+Y7PHS5Md4gECuWxK/F
	9az0qZrdgC7own962eR+u2D1v+8lDJKkYeJkqRg5aY4aM1vFEvwJLKyHAv5YEgF6t0wIo0zYm6p
	qsQHRCErJoo1Ckw7fuPPqX9xcAsQgBp2Pi8nAKpHyk90IouObZahk+3hION6rqEae
X-Received: by 2002:a17:902:c951:b0:2ca:ca48:c36a with SMTP id d9443c01a7336-2cfde79fa90mr78292405ad.18.1785156708763;
        Mon, 27 Jul 2026 05:51:48 -0700 (PDT)
X-Received: by 2002:a17:902:c951:b0:2ca:ca48:c36a with SMTP id d9443c01a7336-2cfde79fa90mr78292085ad.18.1785156708304;
        Mon, 27 Jul 2026 05:51:48 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e878esm32263425eec.3.2026.07.27.05.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:51:47 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH v3 0/5] arm64: dts: qcom: Add Kalambo SoC and CRD
Date: Mon, 27 Jul 2026 05:51:37 -0700
Message-Id: <20260727-b4-kalambo-crd-v3-0-25280faceece@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFlUZ2oC/23MywrCMBCF4VcpWZuSTHp15XuIi8lFG2wbTTQop
 e9uWhBE3Qz8A+ebSDDemkC22US8iTZYN6YQm4yoDseToVanJsCgYjUvqSzoGXscpKPKa9pULQd
 kQkoNJI0u3hztYwX3h9SdDTfnn6sf+fJ9U803FTllFDmrWlki1GW9cyHk1zv2yg1Dng5ZxAgfC
 sCPAkkRoAvUWnFU7R9lnucXLqMqevkAAAA=
X-Change-ID: 20260715-b4-kalambo-crd-86912a03bbd2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785156707; l=1919;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=SkbzOGWyL2WHXqZnQOzystryiRSavuC6q0QFnAf4eZ0=;
 b=cFLZDZq6HZkNHu9S0G7b/HOxfE8WQ9lhRgjnZesiTFEDy7Yz8b5atZTMrXUpryyoKsE1Hyx9N
 +MzdzNQA00sBW/yioOFthPRuhuGNTHYtbLec3DypPYcTXxWVOO/AatK
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a675465 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=M4FQ34ecsjHDf1F0CBYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEyNSBTYWx0ZWRfX7cVGPJuptiuA
 eKKETP3yL2mNOFi1ILJFWVG9Hau9+ezAcGdiNsHAWycVR7etscP1nrVUe9LJySRKtPj2SfMLkEF
 O6ygMv7KEfOxmk2hp742afo0Fiau1rM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEyNSBTYWx0ZWRfX/MyVZBtSltYU
 dnRhZO2fbfylBX2TzGz8Y5QKrI0Wq7EVFZauCvMDhrB/l5q1rXLZWKvaSVZpPsAI4Yy1zQhh1tK
 Jz7MAsUQLRaQ62l7qDf7v02spiMXDrTov2dJo9BdOzRZY6yf/UADAnixWVUCr3kyJigfLLpnm6r
 jEo1XMPN4WiIOuFcRFZ3BQxuF9jg9qbTta2rBlz9dqtX82QMUlLOb+rAzOMeSVA53B6Jpo74GH9
 jAvdkaZ1U3MrosbTPztWDCqgn1A1XTMe/r8uA15v56Irx8SZoCRMRiEYlnKM79BWHGHIr/Dn/gi
 WMmT9UWWSL2GurAJvt34L+JY+2AzdTcf8VGsYQDWp8IxrA70uHp1oWdxd2gM8005FooEI4gqxyI
 jrNkmslTU40fELpdx2d6JJhKHrnMbYKF/vPnKp0wfR3ooanBP3iTx6d2P+6IgeKh5FhaavLU1FV
 rpiPeZTRrBEWnQlUZFg==
X-Proofpoint-GUID: Wj4xESCzEJic3QqkX2St0KNXGoByvCRQ
X-Proofpoint-ORIG-GUID: Wj4xESCzEJic3QqkX2St0KNXGoByvCRQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270125

Qualcomm Kalambo SoC is derived from Mahua SoC with CPU cluster 0 
removed,leaving only cluster 1 present.

This series documents the board compatibles and adds the SoC and
Compute Reference Device (CRD) device trees. It also adds the Kalambo
compatible to the UBWC configuration table and allowlists the Kalambo
CRD for QSEECOM to enable access to efivars.

---
Changes in v3:
- Delete and redefine the whole cpu-map via the /cpus label.
- pdp0_mbox: one reg entry per line and use '0x0' instead of '0'.
- Rebased on next-20260726.
- Picked up R-b tags.
- Link to v2: https://patch.msgid.link/20260722-b4-kalambo-crd-v2-0-32d4addc1ac9@oss.qualcomm.com

Changes in v2:
- Fix the cpu-map and SCMI perf domain for the single cluster.
- Give the SCP shared-memory window its own IMEM section.
- Rebased on next-20260721.
- Picked up R-b tags.
- Link to v1: https://patch.msgid.link/20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com

---
Gopikrishna Garmidi (5):
      dt-bindings: arm: qcom: Document Kalambo SoC and board
      arm64: dts: qcom: Add Kalambo SoC
      arm64: dts: qcom: Add Kalambo CRD
      firmware: qcom: scm: Allow QSEECOM on Kalambo CRD
      soc: qcom: ubwc: Add Kalambo UBWC config

 Documentation/devicetree/bindings/arm/qcom.yaml |  5 ++
 arch/arm64/boot/dts/qcom/Makefile               |  1 +
 arch/arm64/boot/dts/qcom/glymur.dtsi            |  4 +-
 arch/arm64/boot/dts/qcom/kalambo-crd.dts        | 21 ++++++
 arch/arm64/boot/dts/qcom/kalambo.dtsi           | 97 +++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                |  1 +
 drivers/soc/qcom/ubwc_config.c                  |  1 +
 7 files changed, 128 insertions(+), 2 deletions(-)
---
base-commit: c5e32e86ca02b003f86e095d379b38148999293d
change-id: 20260715-b4-kalambo-crd-86912a03bbd2

Best regards,
--  
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

