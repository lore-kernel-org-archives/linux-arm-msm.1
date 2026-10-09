Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E036A414A1E
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 08:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791533515; cv=none; b=ckjs1SJA6LztDRxylG5uidF6pvu+nTi+P0nz79vcYJ4/4ycHSvbV3YHz0m48yzCtl6FA+tJR9FRuLJJUdOP+3wrfOgwxxQh9y1+DnwAv9vy1YZDUYxLVzRPCkOKf25dZSQIEwOFbwSTF7zpTxWEoPStr7PzDo9cYvfsOej+OE1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791533515; c=relaxed/simple;
	bh=dChm9VOA+VD/Rg/cZCdywnhal/7ZxoZLcoaTrSokokk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=D8tKYlEZJdEeKfqST1c7mf20+7T/gEw9Fid4tFRwxmMYR3KQMfs4QTc3MctVDwPbLAcjxQERId5MAK52dcxtjpMfHsS7AX68pifhcu4Y/wzI84GxeyAGZrnA8X5DxgeEpRFVq4JyNCG167eqXDcpRWJ15Hnsy/R705AfdzvHWsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RoIhEb7N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CQPrxeLA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RoIhEb7N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CQPrxeLA"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HIEO564672
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 08:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OGfdOS5UK7/UzF/cCS7Hsr
	vQSu/ecExyfLjubj6ULfA=; b=RoIhEb7NCJwa6PSN0icknXA5cRsqPi4e6mPv+y
	+X+p21w1LjCsLFrt1cSAplHeWMJF+QJoXahWC5IrUTtJ7yePZwnbMwJ2B05vpZYq
	1Ntrb5qBXtzH30vR0pzP3XfK/GgIA1osFngASq6g2kbGS0jboaxI1m2mQgk2I4L3
	p4VV/ULkL7vMnZzAql38dhyLgv2nx9rx/ehpENnyIJf9kxMvmVJ2drSOD5facJOs
	vcAagp0U/UTfN8Yrxe/XbqZcaowHzM4hmNNzBHZD71EmQxvnJVYzn5WbtA4riIyX
	PXroxsjKHNWi4jVOPPyB0Z7Km6qwvQzIm1LOtpVMb7niJezw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxkaheh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 08:11:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917b7dd3f1dso102211976d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 01:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791533508; x=1792138308; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OGfdOS5UK7/UzF/cCS7HsrvQSu/ecExyfLjubj6ULfA=;
        b=CQPrxeLAwZyxDR+s8hSMjIbr4SoShy+SUFOHKvmGq67nQou1nxDv8dfDi8oj5pVtt5
         dBq9FndQ0Rx884hxY8cxeEtSEMyZfU8FB9yRGLMNuD4Csnut9fMXcrmHnfpmcVjUCVTb
         TA8fQuhPPV4fAVg6Gtg9kQM2xZvw32iC6T/Vy85wEhi9QSHKQ3IVd9fkUT8t/IdZJvR4
         ph2VMW7J1eg5yvJpLG13p3h7VpEhBkXot1GPDPDGGtc+PPYQI4SxfDe0fjzI/GJG2d69
         4eoGnYE0cZqirh4zl618A7s0hILY72Wrn23bFG+HGgJksQC9aQE3im3yVERfmr1o7VS3
         DwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791533508; x=1792138308;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OGfdOS5UK7/UzF/cCS7HsrvQSu/ecExyfLjubj6ULfA=;
        b=dPPC+eGmIrip1RolO9gddWSsbBv5xzgAR0/uylw9L+u8wwmFK/zEKGrR9ExUGOkVLs
         dBHCPZhz6KyuZOmK8yJN0gGH5Mexpjo1iIbWNMq6UodAfQfNF0eVkMM5DvFmp9DLAMki
         AdauCmTvh4ZSER0OLMJtaaWoyJN4g7vpg1fgHHliZrmyzl+nDqYw8WckvT4Kv54jUnsY
         +Sntgcqcj8w9e7e11XovLoWg2HQ6qOnKJKLWypaPbCXq6vrBIkf82rcxvdG83dmf5ZMx
         fBMQMHzeUH5MslyMh5NKJ/8RU4KXhTDXdnmEXxuwwlcnTOZIz8BUPi6io15CKI5mMWOj
         T3bw==
X-Forwarded-Encrypted: i=1; AKwUvBx3Baqkb8eUu6gdSJfo5QFesdIbHmcMW5Ov4YGgCYjmuF7akI6OjDAmMu6ImWRLo4zEn+EPVO3Q8+5mbvxk@vger.kernel.org
X-Gm-Message-State: AFuF++lDbRKPwlP8c79EgKbf6VhLV1ZrMexmDCPBaJGaYH/xtws6zKNq
	eVXacdAKv8BFMnHX6HDNDiU9juqaUNp9gWNxZMdlHjost2+W/Tq6X8YL4BSvCchLVUeNNEaWnGs
	+mckmUVxC1tDTJgYzu6xsde9I7jyeI04nRQqY2rLkGymd+SwP1InnqtkQRbqw/z/af14j
X-Gm-Gg: AYBFou1jK5F2jDBTq4ijKvv6GThrN3sQv1UFNKPMtuBAJGIFB6iPtfChZn2OB+Zxwxi
	iUKNmxohYZLw8EIlHQlYGyNiUQYi7pQuaH8bHBk5CF61vkRYO4Z7TQ8QaDRXiX9iQ9/y6ueB83z
	BwgzPnLv7jF/PiQmWVDrL6v5dwAuLTUE0xm0BSMw5xuVsfQlRNIFMN2OGd9djv+VqSon0VxjTbU
	VOi1tPQk2/BdZrrevaii3VSYa1F8Bh/U42TK3khp3BvjWGjX1F6BW/yg1Ta1v52pBUHnTfscQTd
	MAogKQizA5ti8Ps3YhYZedFNnadi3mAy2u0rhD1AjDCsXV1VK57ntd13PlilIAzjROI8lPuXKlr
	TNnXySPFhcMZtEOA/xmVkjbzmz64QYdA0hv80VrWAvcF6ea1OjxE8ZHbdWjy5gAy7Ae1h
X-Received: by 2002:a05:620a:6086:b0:93c:b7f3:9f5b with SMTP id af79cd13be357-93ebd24cda0mr142744785a.45.1791533507748;
        Fri, 09 Oct 2026 01:11:47 -0700 (PDT)
X-Received: by 2002:a05:620a:6086:b0:93c:b7f3:9f5b with SMTP id af79cd13be357-93ebd24cda0mr142742685a.45.1791533507245;
        Fri, 09 Oct 2026 01:11:47 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb986c0c4sm130780685a.18.2026.10.09.01.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:11:46 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v5 0/3] media: camss: add support for purwa platform
Date: Fri, 09 Oct 2026 16:11:19 +0800
Message-Id: <20261009-purwa_camss-v5-0-58c13dc7c4d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKehyGoC/3XN0QqCMBQG4FeRXTfZGVNnV71HRMx5zEGmbmqF+
 O5Ni0SomwP/fzjfGYlDa9CRfTASi4Nxpr75EO0Cokt1uyA1uc+EMx4zwVLa9PauzlpVzlGRRIl
 MMpkgCOIvGouFeSza8fTOFtveo91alsZ1tX0uHweY2w8ObIMPQBlFzHUR52kuEQ+1c2Hbq6uuq
 yr0g8zcwFciAtgS3BPcL6TKUuCx/kOILwGMyS0hPJHpAiAruI4j9oOYpukFyILKW0gBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791533502; l=1793;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=dChm9VOA+VD/Rg/cZCdywnhal/7ZxoZLcoaTrSokokk=;
 b=vowzy00V+SLNjzf+x4+zMTFrE+EGQpOHhliyvfzobgjVd84IKThh4I13jiyhXMPDmrhIRiycS
 ZeY4bFs1tCqDU4gkpo7AFI2vP/VtZdO7Rz36zQxt8W3m76Vi5VPkWPW
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: 7yT7siPQaJZQfup8C6aVNfxDPF-IBcIH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfXyvYlGpxc5lCT
 Tyolv0sk+OIjKmVTfDOkbAaYxdcGpBLuFXLuJ640MXFLs5EfUJhoKTMVUtIoaQ2VZ+jtEqAOSAR
 EdwZevW631cEfXmUPoCSdY2RwtA1qqM=
X-Authority-Analysis: v=2.4 cv=Cs0q4X4D c=1 sm=1 tr=0 ts=6ac8a1c4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=U4S9WEnYRaEk29xky1oA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX2nCu0P25pM5O
 Z3DqVS9ggnwPCdqiQZsb12IiXtZDL3alt0l+Hxxv+7XeTYsTBIBo8lNT5PUay/HIg7yAvBZgvap
 fQEmB8Zr1f0LJrtbXzn8yC4Ei+UpXt5WzCzEYvLL242DsqkWulIfDUjrn5lwcB4BCHJsG8rtF4g
 hcWfv08bE5Lg/afITsBjVlwLn51snUAfXBrc0JxAY7hUrCuiySvfVoEfmABXInJCE9jpQcTrGbw
 OelxXCMh3pkKnNbMJqgNtuAYKz1T0jW4WRsLGSy6U/tBbYx5+kW+HAPPb6daPxWKwx0wGJ3l7DT
 37EwVaSmmgcw+RIEOboQ/RfbGSvKiZLw5WeJWrJLopkm5Fb9k7KcDS0pXLL4aj7X+er+YUHa/gK
 sVHEXaufUBlTJSn0G33CrBLZ+wW45cMnYXbjwOHpeBb2vA4aeeQReUfjkPhjOHkkaTke0tGfkgq
 VN+ChqHkk8VQU34PSpQ==
X-Proofpoint-ORIG-GUID: 7yT7siPQaJZQfup8C6aVNfxDPF-IBcIH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090032

This series adds camss support for purwa platform.

Validated on the Purwa EVK with the OG0VA1B sensor.

---
Changes in v5:
- Set line_num of IFE0 to 3. -- Bryan
- Introduce CAMSS_CSIPHY_RES_PHY_API() to describe PHY API based csiphy
  resources and use it for X1P42100. -- Bryan
- Link to v4: https://lore.kernel.org/r/20261008-purwa_camss-v4-0-bcf11bf2c650@oss.qualcomm.com

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
 drivers/media/platform/qcom/camss/camss.c          | 215 +++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 4 files changed, 481 insertions(+), 18 deletions(-)
---
base-commit: b018686719706a781c45a874ed51374a2dc4b767
change-id: 20260409-purwa_camss-475787b87e14

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

