Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AC1463B9B
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 08:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791448034; cv=none; b=c6aqO1bwxVolt+g0Nuu0z4J+fO1WhZQEoSlUB5iDY1PD9YDiu0vi42G2Bey1iZcGOSMx4cpCuXqPKeyYgM1eTsWwKdeOscUO+Gj2KlIlYlKVyq/r/RRSz80PB0QDsixvR4umKGN32l3cq/ae91fhtzbIKN2KvHAGxGPjLq8gZfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791448034; c=relaxed/simple;
	bh=DvY286Kgs9LpIkD3BgrOsMV5PkiyQTq3FRBZELc+J8E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JKP6ttaSOZH3S5rLpxSjmH6Wq5p6GiEPCXEeatfL2kplrURiN7VcaX8mqbZOV4BbnAp6Oz0tN4OW9Jds2a0HyyYK6lsjzNV7h67nPYWPQg5R+cpCRZcXb9WW+iBeH2GVYQlgvZEUjpLjRISbCjiTtMII2kuQPNGTDjW2ZQY278c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U5uBGPQX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iOky1WjZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U5uBGPQX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iOky1WjZ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KBgE2560127
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 08:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=B37p6ZFYdaHkkMX6RKFojK
	hCiYRU07fS2ZyvpTfamfk=; b=U5uBGPQXb2/ryfUqoopPMymvE9wwESyofzbjqZ
	oSSLcagOnT0N26vDEpFx+Tumv0Y5lGvPwJy5wC3R/CbwKDNuKeYizIT1BAt6rwQK
	yMlqJCPYy1kKZWhHJ70WLXzzy7Tcj7asTmYF9wJecWuvRUtzqqr5utyfTpQXRt5L
	DII/zpSRRvpiLwaOcnagjRYyV0pNec60FCYuP3V9qX8Oga/8DXMDVfgrIp67tmje
	AhNcsKKYnQB7lFJVPUhQcu5zSayenc41ApYqI44sCssA1Ct8mdQ7FeWfVWRK+tKo
	GxSgwEXdvwPK0CNAYwM50zwdwfb7lpgUySIZ6y4hnkbR7/7g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe81vey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 08:27:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5337ed1ba44so97895241cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 01:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791448030; x=1792052830; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B37p6ZFYdaHkkMX6RKFojKhCiYRU07fS2ZyvpTfamfk=;
        b=iOky1WjZ1mTQvXMp7EQvi7wJVNNRE139ygTcsCualUWq/1k9q6t6JiOL3GrzXkSO0Y
         CGtgrVy9mXkwjVXmN+hQ9lsTsjcaNizvwho5vqsRzdUytjZnhypKivIeZBGKPMkb+EiB
         ENrmWDOUSNvRCp5y5q0g2TPLvKMM0surd2RIW1+U16wijmu+F4DwUmR23IsZetBmg/qC
         Moz7MQaho4VJIXdW4g0Hxj7d4VI3v4z4mY8VGV1q2OWHZkUpE4kYsLm1H4cPwwgWZCwf
         icBj81dP5k2wIfgE+08/7mx3Md0vkOyymt762IBFrD1rdjyKUKYFx7KEFAq3qPRi0Nce
         NjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791448030; x=1792052830;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B37p6ZFYdaHkkMX6RKFojKhCiYRU07fS2ZyvpTfamfk=;
        b=RFWgvKcFwiZWy7D+oG5Expy0+SHA+W3FRaBdTlGKA6cYnjvOmQ7vRP7NXV8IVXtX8G
         Oqv7f1vT+jXmYZefVnV+kZJF3ApNtiPrB9TDAR3SlofesjJUiKlQDMWhibUwSR0vPLNh
         v0J/u2SQ1g1JS6x8sDBlsOQVInW7HtpWLOUyVIrYj7ppmgJ8ExZ0lBRzqmelZi2DiwFQ
         YHiiBKq28v1rAYJyeQweWCHWOJ+P/2ocEzu5AVYHfpn3APdswm7QIukhxTuBcN9gRvpD
         6ws7ThPMMClDabkgcY/3ht+Sh2MbtyOEZAC0H/1LOE/9KPXDB9vYJnbuKKNQtJngdjRl
         88mA==
X-Forwarded-Encrypted: i=1; AKwUvBxuU05yAid5uhGkfx8jVXwFR/jd7x6EojhDJYUJKuXhTAf0ne6QnnqaJuO309WyHK1ciGy0zurjMN4tn5fC@vger.kernel.org
X-Gm-Message-State: AFuF++m6LOGksXEQ/YeAttUwMYCyLXzZRbyEArfZjCpDLinZdJvTZtnv
	F7m7iNJXU8xebHy3Kh/cTsnocQ9f+eVnzvxHX+HS7PTbKqJatBkX3FZO1BhqFEBCEyAkldU29hl
	k/b2ZCA76lm3ZqD2buIEzmAdZ7GE0f/cSDn9uCNHEf58GkwdM1iZd2umQXDp+SRroKKrJ
X-Gm-Gg: AYBFou17wQBmDlNesA03WX0ZK0AG9QOUF/39m64UFZvDsV4/KuN90SezRhYLrq7IPlK
	Bo8pO3IspBYNz3p0CB9TP5TE4RGoO+61wJ0wSpq9hy7LWV53TpSGugVlgNEABjwMaa/fqc+ZnHG
	OQRxDYR5eaZoA9Q74mdmDQicKA30/wHHYR6XA9HFrQIAUAesJ9rbvJ3uSBfDi8P2ZYYPyxDIWwF
	WZ3gpGIY5inogxO8D6YzsY9js6yROC5ZjqlvtSqkcGBuons8xD1gx2cF32IScTZAbUbqP0j1ZV4
	7qrd5f8jyqup57PBL0bYWxryT4389GTRI1qFcQ5lhgIUHlQGOo8Hf5YFNEeGQRKtdNqbdAATijF
	Ue1fBqj/sNGH1IIR0svtrU1TGoJCaKtiIfZexoDoS+wx47CrKBMagWKScrQ6RJC39SLhN
X-Received: by 2002:a05:622a:90c:b0:535:16c1:264f with SMTP id d75a77b69052e-535753ed71dmr84042201cf.14.1791448029864;
        Thu, 08 Oct 2026 01:27:09 -0700 (PDT)
X-Received: by 2002:a05:622a:90c:b0:535:16c1:264f with SMTP id d75a77b69052e-535753ed71dmr84041981cf.14.1791448029301;
        Thu, 08 Oct 2026 01:27:09 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5357219c5f5sm38928981cf.25.2026.10.08.01.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 01:27:08 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v4 0/3] media: camss: add support for purwa platform
Date: Thu, 08 Oct 2026 16:26:57 +0800
Message-Id: <20261008-purwa_camss-v4-0-bcf11bf2c650@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANFTx2oC/23N0QqDIBQG4FcJr2eoWNau9h5jDNPTEtYsLbcRv
 fusDSLYzYH/P5zvTMiDM+DRMZmQg2C8sY8Y+CFBqpGPG2CjY0aMsJxwUuJudE95VbL1HnORiUJ
 UhQDKUbzoHNTmtWrnyzc76MeIDlvZGD9Y914/Brq0P5ySHR4oJhhAqzrXpS4ATtb7tB/lXdm2T
 eNACxfYRmSU7gkWCRYXhaxKynL1h5jn+QPR+O1qBQEAAA==
X-Change-ID: 20260409-purwa_camss-475787b87e14
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791448024; l=1519;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=DvY286Kgs9LpIkD3BgrOsMV5PkiyQTq3FRBZELc+J8E=;
 b=VY96vHEHUrDOot2nltDp9uwKQjd8s/jdJDNM6WIGK5hDt5+b+NGF6616hnCa7QgSJLs1oZQuQ
 7t+V9HKK3I1AGTFrxyFNPlMSNKctKAJE39fDAVQj75WxGV8DMhZZ87q
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzMyBTYWx0ZWRfX0LRaeQWBUPnq
 7Zc95DcgOTXUsh4ESLdxZPib+6vMrm2R5Xct/KG2OUDLsKgU5xIwOF/fO3VFs8nX81mneS3iv/T
 pCwtjdvRo3lhBKwAaXcYBBwB0IyCnNKcUNfEpdHT0A6A267rRjZRGH2BiOUn1QYMABZyuIl6WiW
 dupiL64zMJSzmqtKbCdsgXj3LLDZrMUA8ZXXFgdc5a7234atOgmBlCwoHNE7yMRlOQ8WciL5W43
 2jQPNX5AKzF21Xv88XOT3lu8OQcJ0ffd7i169Ko6HVmCWzpOjQ/RxqHvysq5+BFOQ5XyszTWeJz
 aTwe2cUx0f9nK3OAWUiZGsglQgymoYqY6bEcJBJ+hND7aEZZA+uqkMuSl3vobXd7Ae/K+SvQOQQ
 9vCX3QgueXfq/r2+4B/KdAPbOFvBOjwQa77GINcmGwN2yrwXjnMEt5lApoRz2kPUCKZA66Z8q5w
 0T/TXwUaB8OjKLNJQgQ==
X-Proofpoint-GUID: oxn-5d2hjHltnO95hn_QNNvzsJ-tj7SO
X-Proofpoint-ORIG-GUID: oxn-5d2hjHltnO95hn_QNNvzsJ-tj7SO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzMyBTYWx0ZWRfX+yNvBIOGlESm
 RfvS9YUEPladBDcNLAOTZ9V7MkIhuOlpgw511MU7E+xIYobc86Qpb7tgsopC+wEvg0MsbCuARSq
 hbpZw+vyH52IWQVQsbGGN6xxJMS2oDI=
X-Authority-Analysis: v=2.4 cv=MPT1C8Zl c=1 sm=1 tr=0 ts=6ac753de cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=U4S9WEnYRaEk29xky1oA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080033

This series adds camss support for purwa platform.

Validated on the Purwa EVK with the OG0VA1B sensor.

---
Changes in v4:
- Collect R-b tags from Bryan and Krzysztof on dt-bindings patch.
- Rebase on linux-next and add Bryan`s vfe patch.
- Link to v3: https://lore.kernel.org/all/20260930-purwa_camss-v3-0-0fe2a5b11208@oss.qualcomm.com

Changes in v3:
- Rebased on the latest CSIPHY code.
- Link to v2: https://lore.kernel.org/r/20260511-purwa_camss-v2-0-22608ab9126c@oss.qualcomm.com

Changes in v2:
- Based on the old version of csiphy.
- Remove Src clk. -- Bryan
- Extend the register block of the VFE. -- Bryan
- Add comments for IOMMU. -- Bryan
- Link to v1: https://lore.kernel.org/r/20260410-purwa_camss-v1-0-eedcf6d9d8ee@oss.qualcomm.com

---
Bryan O'Donoghue (1):
      media: qcom: camss: vfe: Eliminate ever expanding src_pad_code switch logic

Wenmeng Liu (2):
      dt-bindings: media: Add qcom,x1p42100-camss
      media: qcom: camss: Add support for X1P42100 CAMSS

 .../bindings/media/qcom,x1p42100-camss.yaml        | 263 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |  20 +-
 drivers/media/platform/qcom/camss/camss.c          | 216 +++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 4 files changed, 482 insertions(+), 18 deletions(-)
---
base-commit: b018686719706a781c45a874ed51374a2dc4b767
change-id: 20260409-purwa_camss-475787b87e14

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

