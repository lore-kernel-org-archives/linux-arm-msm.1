Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A4F36B93D
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973535; cv=none; b=QOlORSsPRp8ux7A++lsGPjxRmPf4s9PLcb/nBWxWp0RH6QmTMdGydub1pciD4LKMEE0Z0D65xk1CQwdvY5un9BRNB7iHdcGngMYhsyxVnz73SCeWlFybl9C0VWKmzE+n7spIeSp1e8wjmUWVaFFVV4RP5oLxcpykJqNemOhZdK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973535; c=relaxed/simple;
	bh=M9wKcZRx+UctBcFXzOs619bBCYQFQfI4WYmoZUzWH7w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Xtu6WqDmcKvDgI2A4GJ30jvkniljhmm0oPJ7KPrn2iAkVB4kdIJeW1ZG5D/ZHJtWSwOZz0/HXhUWEGx4iaFsXek8GqJBDa5H4Nq8YEaAK4O02ffh6kyl5gw+PRuY8+CCRQI2nZ8GkIR8OKh15nkpMen2CcWH2d3i3nCrzN11/aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zh3TgV8s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QjUSD+x/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zh3TgV8s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QjUSD+x/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3Yv1l1162082
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kmVizujLsrgmM/SgR/HB3+
	HMHu7OihCsv3vpcpmpjj0=; b=Zh3TgV8svLg+7k3rr1Yagf6gKX40efPetnaxg/
	UEx+BKM2jbV3Pm/Bn5HqV/hT0lbNS7tjimsLLLbNFubnRIPqhe1SD5f2c6VUk5ju
	/FyWiD/PGaWJ8wzHU9MQhOpJkcMY8jdjXvqYQBiaWJmqeXbZZlefGwKYoFTexiXR
	H0TrEDoyekoWypOg4G4ML4lGY8TfeGmAqbhMOFfd1Gfl2Y/y8eczl/vZ2mAmlhwA
	Not0NEEW3uJZtZ2on9SHXnOZn0SSCMwKVoesexEtf64pPdMZ+feAfY4T9Od9PVNP
	LID+O7riS/DgLifDINoTZTzlJkH2Ngcvl1RCHbHxSeJE8VyA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3ws12e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:52:13 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4922b7c31so2686838a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 23:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789973533; x=1790578333; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kmVizujLsrgmM/SgR/HB3+HMHu7OihCsv3vpcpmpjj0=;
        b=QjUSD+x/57gv5Qm8SscdlJWZ0xy+J+AOAns6BVr+UZBFbKmPPkRLG8nHaORTfQ3uvF
         cR6JbK8rn/tJjRoIUxsje4DY4UnU+kRaaSlMDFbePI0X0q/JWhDk7+0ilwOOvduoM+yj
         6QgP/m1uTWXMb+gnOtPmwngP+FMDZtD/b6O+tc7gYXNXygfeva7qOJXlEbM1CIsVnDaV
         4GrkOdv7w9D4Hn0TIKkSi8OJx7OI82a7H7+719cG2MjrM6Mv7AbN816QrG2968u/roC1
         /PxB9bo/9BKILpHgHHxTMgrgutIy18nzrbGHxBMG9vekIOP59YF9qZvHyfehPZ8asg8X
         5wGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789973533; x=1790578333;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kmVizujLsrgmM/SgR/HB3+HMHu7OihCsv3vpcpmpjj0=;
        b=pEfaVmtjXyObsnBxTFNDnIfLILfepfq9DoD9qX0VmwJrcNcH5lVUBcXr429ftFoofS
         tpP6VkFvRctOPgfwRBLjYs+LlP6OEFDXLNePPXN3yHlkWHpQzpNqZcPqfLN5tqO0x18I
         ixkxJXGZ9ZvTcBp4VJ3j+7B+T8ZRF21OMeCeqUy23yoQnexwdmFyKJ73H6QTuslOR8+f
         L0A2/jaqlYbCM+s5TlULBqJnmp0vDd6LdFvCwOpuxjtIu1te+etVUc4g0benUvlr23Xn
         ZlE0I6UDw/EIP4bV6biuyPrmzuxuUcTXn3z7MueZurbfzyWblIIIUEBOi3S1y/1TH/sF
         yxSQ==
X-Gm-Message-State: AFuF++llTNy9KgLm5qlNKwIVKIWyno+5g3G9fkMumsBB3/ex4xqwa74O
	37gWGbXn4lfMXg6AjNWqpmxHCqhEvzJNCD8S7MUmaWvHzhGZpoo4az5Pt64iye7D4cBhcL6fHmb
	is+OT6tCS/EmsrmCy27hPSdBBzgQG+h+wnnOgvyDKUEeZZp30xcsCjw0mqG9zXORodd10
X-Gm-Gg: AYBFou206c07kT1rhFWjsKaHtn1M8VjzJaIYYzqI4mzmhCmNyl+qmYf3qoJumLNuopk
	v8DaX9ImJtWHMvz+AKqeagNf8YIWbYJlr35qOSCWsZ26W1pg9+Dc6toUsqO0SboZB5YUoGXCuHv
	9GwkeAFeDw9YyYMnGfBT0LnXLpB8zvl6t6UlzdEDEu4GDbLtglUekcpELZRhAgj53Z73yZv7A9+
	CWe+W5v7cIVTIvNEWmBZDcym9E31BrhGoV5LArJXhtOOQipU9Jrow9uqMLP+bIsjbj7wZMs/uJe
	TGKqug1J60dFy0Tax+j3bDczPkQj+fbaoCiwcB7AY9nrClxCyIOBVXtoS3svLEhhFrgPLk+XF4+
	Pi/jbQFOiH+w6Aenih4vHPWPFHFvJpOGL/gazMieV5IJOAkfFJ/+wmmVmaSx8X9WRVq1hTYk0JU
	YEvxO+baRksJvJOokZ7Flhcu85QXKZ6DcJzw==
X-Received: by 2002:a05:6a20:5483:b0:3dd:a196:3090 with SMTP id adf61e73a8af0-3dda19633c6mr10931930637.64.1789973533055;
        Sun, 20 Sep 2026 23:52:13 -0700 (PDT)
X-Received: by 2002:a05:6a20:5483:b0:3dd:a196:3090 with SMTP id adf61e73a8af0-3dda19633c6mr10931912637.64.1789973532638;
        Sun, 20 Sep 2026 23:52:12 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55f299fsm31342975c88.15.2026.09.20.23.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:52:12 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/2] Add few more SOC IDs for IPQ5210 family
Date: Mon, 21 Sep 2026 12:21:51 +0530
Message-Id: <20260921-ipq52xx_new_ids-v1-0-63d68a11bbff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAfUsGoC/yXMTQqDMBBA4avIrA2YYPzpVUSkiaOOi2gz2gbEu
 zfq8lu8dwCjJ2R4JQd4/BLT4iJkmoCd3m5EQX00qEwVWS1LQetHqxA6h7+OehbS6Co3VuclVhC
 r1eNA4T427WPezYx2uzZwnn8c4gp6cwAAAA==
X-Change-ID: 20260917-ipq52xx_new_ids-1b584bc547e8
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA5NyBTYWx0ZWRfX/0L+YYdwYITJ
 kqRLb4hwF8LV/PgbfMrO2a1o874zQd29qHQEdiVlwTVkdPswC8jTJusiLv6u7IOcCa6hUKs5K07
 Yl38bpW51YNBxjZOOqNEIegkXjSC0NA7dqHSu/01TN+fgiVRPxEUXch6bqlSwzCg6QKo91IaEWr
 LsSA6eD6DVYeDrHSs4ky5nQVTb+nrbjYchkKA47er4HyCKltbySlOWVMF0qpM2Isqd1eqTxvqY3
 qhjRVJRWzLM3n4wu1GaW/vOM4q2xrn9tpZDrlh/vs6vrXslz9X2+KDD9kqKEw+OrK8KgIHAKgAy
 yIck5O1/W5rAq7dLcd+zIJAHn8bOIAR5RIBwY6trR/E9eX1u3X5NqahPyzS73fGuUMNmboQDL9J
 YUyWldj03YyNP2oL5jUpEDmib9+yBPTmT1qOCtlKbaU0DhxeJR/5VMngo4Xe0Pwuwr76QS4F4zw
 FAQqjuuOXffPbuRsF4g==
X-Proofpoint-ORIG-GUID: eKOIu90dW1uokKocVU7tnhD4tnZl4GcE
X-Proofpoint-GUID: eKOIu90dW1uokKocVU7tnhD4tnZl4GcE
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6ab0d41d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=RD-zy9ve7f5AjEsD0N8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA5NyBTYWx0ZWRfXxx+wT69unnzb
 7CURLyK2e30X+TKj3ffiBa+GWH6YdSnR1lGIVDbLnIxRA8Rsm6L18G+d5fclTXahAWs3Fh2RN4Y
 HB7Wrt9Pod4R08SxCoOmJBdszKqfwsk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210097

QCF3211 and IPQ5211 are the new SoCs based on the IPQ5210 family. Add
the SoC IDs for the same.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (2):
      dt-bindings: arm: qcom,ids: add few more SOC IDs for IPQ5210 family
      soc: qcom: socinfo: add few more SOC IDs for IPQ5210 family

 drivers/soc/qcom/socinfo.c         | 2 ++
 include/dt-bindings/arm/qcom,ids.h | 2 ++
 2 files changed, 4 insertions(+)
---
base-commit: 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
change-id: 20260917-ipq52xx_new_ids-1b584bc547e8

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

