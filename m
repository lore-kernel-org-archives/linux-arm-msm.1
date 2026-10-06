Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FE0381B1D
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 05:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791264569; cv=none; b=SXGGvyuxot0v4fNM9o5l7y/tXgNn9VRkbaBOXPv6Ts8LH+Bv6+OQXLrD+6d1jYxWdoFMlMae4SXIPL6AqAhb2mcaqoETR72XEBbvDXIoWMrSX+kcZoMcY+ExU0K3wLz1k42GenMKlwvNwEhJqxMT3s4lmgYJFO8qOrZRHAdee/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791264569; c=relaxed/simple;
	bh=NKpyav4GVat89f/6MO9Q6dZ+LXNTfCOB7JUaIKBrtPo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A7vRI5ZUx/OmXRsfNozvlOKEph3q69Lu1lODliV7DJRVN2YjbXQ7XGNbvK+JGnMmPmRZ9B89GExorW5OK2893zCzgpCnLwEZzrDdptJ3vPoxkc0TAL3rbGIePZ0+RXon+h8VRqyLj5qWqqdJk/7BDu91zmtuc19AAfFvymF/GyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JONSaldz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uby3UerO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JONSaldz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uby3UerO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6963ATgg3450569
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 05:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=spJCwhc3nrhlO7KaDiqqjv
	9tbKa8IKU0ftE5pgGnaGE=; b=JONSaldzT3qXsN7vPhCN9xz740pmwhF8k75m5i
	0HwMGAoEZ9XY2iTx+nsFyhCTv59bVWa9Xf6ytgw36iw/MnYnYGDMKUvCUEpo/SXR
	EYUombNTK3LJQrwR0F40xB4yN+0U2ZMV6M4fBXYYmUamIYf9FvBn+5hsYXX02as1
	N1bSF27UV3+zZMRAif5unxbS927AwGrsRvgg4BbVIDFTTrSTnj0YtE3ZXYoyGKS4
	UXZysCORViFgzXUqbGUsTglk8bTKAU8OwetJq82dy2Llylx2Jg/LjndsbieMfqzw
	mW54tZMOuPC8rrJIZnY5BKDSejFz8JHR96MLHEp9mba99e1g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4a7durds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 05:29:26 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5054377eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 22:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791264566; x=1791869366; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=spJCwhc3nrhlO7KaDiqqjv9tbKa8IKU0ftE5pgGnaGE=;
        b=Uby3UerOT7tMjZppGpBD0kH9hWkJHDskYzSvT5Fz3sNfXnc6kkP2dKu+S/2tlF0MvF
         vD2gNxJ9XrE7GL/divlYF5TIjjbKGkWBlYOqBtWr7r3s92WZyxerWSKvjf+ToVKBpg+l
         0FgUrwNb8dwFdrnwdfZJvxuyCl6bUx4HjOhLGHs5EJa7RvNPM66SW29oxE2X+y9DyFt7
         0kXD/vxuqvNQEa083j+KJaEUhzzzi21jONS9VORRPCg2jtKj+LaUhRl+rN3QPy0X6C0X
         pHcEmvKkhLwvQowXmq3SIql7Pwlad8RL1p7QQoXoP7UWTjSUij5Msy/7NKb4Ca4Zclbp
         m7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791264566; x=1791869366;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=spJCwhc3nrhlO7KaDiqqjv9tbKa8IKU0ftE5pgGnaGE=;
        b=0KaIPRLVgnjtRtnicqbZMdQjX25gn9H8gsB1KyH7NRbG+LqtzdrW/ZEgFlfMZBUEI4
         KYK+bnFcq87awPppyREO/iLQNpxM2uIVxqhZ7q3XvU3Yn4qDFPm4L46CoRcVXiMvJCW3
         O3XfU/BmrBHlr1rH2FedwKwQWG21PcApUOEmweGozDx6RhM/KaeZ6H2X8wfIHUck1AqT
         MuU8k3DEe6Hbn7S0GO+FY0N8gkPev++z+6So7vyzhbmYC9RuKXIhC1lEiuPGpOZePUmp
         V4tieFJnQ6zmCRbCxx5Cr1MsptieE0U/qekuGb+xajrlafNMLjeYjOOVWNzrXQYv8VMW
         DqnA==
X-Gm-Message-State: AFuF++nfcu8mzMQHPsAUnsm091t5q0SHV7pca5elTG/E+ZVrOB3mqaiU
	U0Fu2CIqPkE6nVM6gSTHFDuGk0BJwNrKoGrPHKC9yrpwaohmW602rKHP06mMBmtKUYawZn9ZQt2
	kFriAmLA0RiC0dB8YGG4MW2FDarpyJ7HIZbOPBTgeFk8i3p/V/2+7IjENauIkhbo3IECO
X-Gm-Gg: AYBFou1F+umcXoQEVxWx3BSxFXlAauY/dRCrZcPo7oF1nnol8M3uy3obvM7YLATA705
	zif8hmslSBgO8iJ9TMlLJB04uic6+ssA4f1ef6wHiw5oAg2HCsSaZCmDLYits8p7bk1YMP/62lM
	2FvO6bHLJKl3DL7VVLc1TyqzGVMOb5QzRyOLrY3OSBxQMeV40fUSSzN/Y6lN79PSM3SVGblGBRR
	vA39REYOpl7b2sY3PYWlXyCWKS7QO+y/8svIOTJREm6Zf+VHgPT0FBuvVV4dQE4u0uEGgV41r09
	cUfQDij4qrrMyYAXASgHL/D+MpM4SFu7n83cO0BK+S8u+Sbfg1ihj8boBK38jdWFpr8veTZNca8
	YEHct0YJib4XPCO5McFqTB/WUAZ0YXFk0p5J1ujJdC7K3AnhOR1/5DKGmLGsWsI2Mca7a9MH/t3
	WF5HNBpfpZZ+ZItlRFtaqdsbALxPXY
X-Received: by 2002:a05:7022:7e0b:b0:14c:96a4:b631 with SMTP id a92af1059eb24-15ec878073cmr551413c88.30.1791264565791;
        Mon, 05 Oct 2026 22:29:25 -0700 (PDT)
X-Received: by 2002:a05:7022:7e0b:b0:14c:96a4:b631 with SMTP id a92af1059eb24-15ec878073cmr551380c88.30.1791264565191;
        Mon, 05 Oct 2026 22:29:25 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d85781d49sm4017403c88.16.2026.10.05.22.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 22:29:24 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v5 0/6] Add support for USB phys in IPQ9650
Date: Tue, 06 Oct 2026 10:59:14 +0530
Message-Id: <20261006-phy-v5-0-cbe9330a6449@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACqHxGoC/3XPz46DIBAG8FcxnJdmGNBqT32PpgfAcSXZagvWa
 BrfvYjdP4fthWQIv+8bHiyQdxTYIXswT6MLru/ikH9kzLa6+yTu6jgzBCygRODXduZFoajOyQJ
 WyOLLq6fGTSnldN5mT7d7DBu2S2Z0IG77y8UNh6yjaeBroADI2QpaF4bez2mLUSTxKlSpcBQcO
 Ob7uii1RAHm2Iewu93115q5i0eKGfGXViA2ipFaW8kaG2mEad5Q+Yd+t8pIoSxpbwhso/Ubqn7
 o+qGNqkgNKKsESrJG/kOXZXkCKK72Y38BAAA=
X-Change-ID: 20260820-phy-664ed5ec0292
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAyMSBTYWx0ZWRfXwKhDOvr1QjrN
 kyfTF0CuNnLwr4LWUy/oswoBEPOWziY8GB3chlByg5/oWxBLlYPSZWCELlduKzsy5ezHKIB+icX
 HfP/xQQTkBw1DZlUKcj7Kijnw9yIeqw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAyMSBTYWx0ZWRfXxIf48jF21jre
 b6y/MjnfzypayH5PQtqGR4zi8VAwkZyZSBuY5/uwN5dKy5AWwYRhcZoZ67FteCPHrcXH6MFblwq
 2BtZB0IPIGR9c/3UmNCw+sEfnuzjOLROE1G6nOGGyAB1WrZlJpZqzuLAKrrvHXOr72HMtKlCk07
 FnjI3GbivXcURklA/4vxPIvc4IxlW3tslSl7FALU5D9e2xY9laEHT0cPgkOIWkRU9r51sHbE9vk
 1CMbj8lWJ0ILgLkCLLlsGjATiU+CYb08rttt3acIKsZVv9ARWrVbSuqiqZ4npH9a78ouIOMGgBn
 EbK+xSzjYevWo8uQnjM3rgFRsJCptY4z0U/OpkmDASfTsftQMgNyAeZzBrEHEsgLC9enwQ4SNjq
 rRmlOgZ3MuBc0bNtWbx66lwchQD/ShLVm5nAYc4dnD8R0BKSxZLYmk5vmOjv+Mo5f1d0KBdGst4
 VVJankKhZr7eg1yep8Q==
X-Proofpoint-GUID: LQBj9nQiRqirJW3k-5mkVzs4MLMzFpTl
X-Authority-Analysis: v=2.4 cv=SvwFe/O0 c=1 sm=1 tr=0 ts=6ac48737 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tpprtx7nRKxrkFoMJnUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: LQBj9nQiRqirJW3k-5mkVzs4MLMzFpTl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_01,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060021

This series
 - Adds dt-bindings and driver changes for the high speed and super speed
   phys in IPQ9650.
 - IPQ9650 specific init tables to QMP super speed phy driver.
 - The Femto high speed phy driver is refactored to accomodate differences
   in the init sequences between SoCs first and then support for IPQ9650 is
   included.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Changes in v5:
- Use FIELD_PREP_CONST to define FSEL_24MHZ
- Change commit subject to 'Fix order of arguments to qcom_snps_hsphy_write_mask'
- Use data->{pre,post}_tuning in qcom_snps_hsphy_init() instead of a temporary
  local variable
- Pick R-b from Dmitry for two patches
- Link to v4: https://lore.kernel.org/r/20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com

Changes in v4:
- Rebase to top of tree
- Split 4th patch 'phy: qcom: snps-femto-v2: Move PHY init registers to config tables'
  as follows:
	phy: qcom: snps-femto-v2: Fix qcom_snps_hsphy_write_mask argument mixup
	phy: qcom: snps-femto-v2: Move PHY init registers to config tables
- Link to v3: https://lore.kernel.org/r/20260924-phy-v3-0-088e7be0cfaa@oss.qualcomm.com

Changes in v3:
- No code changes
- Rebase to top of tree
- Pick two R-b tags
- Link to v2: https://lore.kernel.org/r/20260901-phy-v2-0-cc93d2f3b1bf@oss.qualcomm.com

Changes in v2:
- Pick one R-b from Krzysztof
- Use qcom,ipq9650-usb-hs-phy directly instead of adding a 6nm compatible
  and falling back to it
- Change pre/post to pre_tuning/post_tuning
- Use array count instead of terminating entries
- Fix value/mask mixup in 2 places
- Link to v1: https://lore.kernel.org/r/20260824-phy-v1-0-257d68a3210b@oss.qualcomm.com

---
Varadarajan Narayanan (6):
      dt-bindings: phy: qcom,qmp-usb: Add IPQ9650 USB3 PHY
      dt-bindings: phy: qcom,usb-snps-femto-v2: Add IPQ9650 compatible
      phy: qcom: qmp-usb: Add IPQ9650 USB3 PHY configuration
      phy: qcom: snps-femto-v2: Fix order of arguments to qcom_snps_hsphy_write_mask
      phy: qcom: snps-femto-v2: Move PHY init registers to config tables
      phy: qcom: snps-femto-v2: Add IPQ9650 support

 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        |   2 +
 .../bindings/phy/qcom,usb-snps-femto-v2.yaml       |   2 +
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c            | 118 +++++++++++++
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c      | 193 ++++++++++++++++-----
 4 files changed, 268 insertions(+), 47 deletions(-)
---
base-commit: 15551282e82db772bfc862f96a8abf14a60f4ea5
change-id: 20260820-phy-664ed5ec0292

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

