Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB0049E5E4
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054734; cv=none; b=Fu1pqUMZFCI0SEWz30dfOSGlKrPm0UN8P9Us3y+smh66T9s/k+428Z/XaoIDoQ57nhb/0lBCDDlUH4ByDp9tyHhFfKFy5njoK/W6k0fWRjM35dGfDpRSqCfmqj94mREA5JF1Kwl7uRW1vB2g3ivXBYW3Li84Aho+44UYIphlee4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054734; c=relaxed/simple;
	bh=DzOAZZPP7V5LiM8vT34fJpQqdL8F6A0V377brE+YB8Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=r4mg4FpKTwnbhQO6toxKAzT6E/f2IZQzm7RNq5EIBkAz3yKnFekk0Jmef3KCtiBHhojTYrOet+Ji0wY3BJ/hN2YHFFwSiq+c+ouFIl13yD3MQoilbrz/JDItcTOHM+ZoQl4T5mCJIf0wxo7bM8z+ju9vxTh8t6+SFj6coCog9Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lQc/6Fzv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NsPltDOd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lQc/6Fzv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NsPltDOd"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F7ESE61672554
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:58:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=g2LOIKPWSqLofxnH5RVIx2
	cwVtotRbWzdXgPnB3dv64=; b=lQc/6FzvBvy3z6GyVKobtHgHtUX2qoUGKyJida
	UPmuNmF6YHeTDRnr1W6HnKy4xtHQAWWyk50Xebzjhy9Rcu4nbBfa9150zGRsgoYw
	2fhvpXBnW4i2aZ3u+evUjEnnpGau+5sin3KOmywd0sMUoYiaG1sfMzQ2NMc13ruC
	rDbfHgrWib8qxDK3qt6GsMnTJuhQ9g9dtbGnouG5kOq6UOtnj5YvEbUyJ0+PJ9Nt
	bIAz//wkboz9Wk8hRQ8swcXrQj44Rcie3T7CGDcNZXwah80q3LHPUQ7XVWpvm296
	feepIPkDVbfKvvsSYlH4+G8O+qfzZbyJyfu58OGq5CLSqZTg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrhbhk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:58:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc359d9easo841323485a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 01:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792054731; x=1792659531; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g2LOIKPWSqLofxnH5RVIx2cwVtotRbWzdXgPnB3dv64=;
        b=NsPltDOdjZ7FMn/9JtLwIOmUHCecEPbQ6eDDY4rAmD0H2q9B4lv407cLForFciw9TL
         UqbjvBr2qCLoundRpC/AWG5pAOnyVgwU41QrLIGQ043XMmnKeUJHoLqmsBYpHFXsFrQP
         SHrYHmx5OtzSGUe10IX1UumiehrjlFDReBsTLPEl+fFxclug9qfy7+GMey1ACXoKS7bO
         KHgxZSAwoT2I8qS7JzVrdzNzwrIJkg8BZZugGJWBMRaytvzx3xVoaEu6ezRjoXx1j651
         06Z+mjugvvEFii3pKiRzjWKX2dwBPCOJBdPTLam1J+kVJdnoEMn9X6KPlu50PNNseqvX
         ontw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054731; x=1792659531;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g2LOIKPWSqLofxnH5RVIx2cwVtotRbWzdXgPnB3dv64=;
        b=t/vxiJKAJxAQwrgyNHfxPRPZULl5uWduM9p5i6kbH65sFhvVocZsh6v90f+83jaSBe
         FI6BvLg9SxPNlGDWQZ/6clW9sDF7jt0cEsv1s0+h6v8ozJj+bDPGSTs20WJ7Kx5wzzCV
         Xk5xyODFvNliObtPWJLin/5X0jsFbYfgSAcFwykU0ywjlXy0fYyBSceuYZG+IeAX9Ncc
         yUdLEp7qLE9LN3Sm8x9cHkLr46eT5IavGP3D0IvrgjwE/u63BDmyc6K8N7xZZQXRM7BM
         OC7eNQSBJ2LwyK6sk8tKgxX03BtMNbEY708PB7gtPyRp6R/rhFfl49uwLXB5Mybw6Yk6
         rZrw==
X-Gm-Message-State: AFq9FYLDZcnluE7Z4+4Z7Jqr3qhTx8FWkU64Ujts26T/4PBqb0EmAHQR
	YrKiSjmxD1BJiI22nzbAKtNz7rqxMr2e+fg8xINUrSLfzi88ScFtFqzrWnZ/EEKLE5YLZFzOuTH
	2kJ+RcdVsVjupuddC9fUG0OLHdwHUVi3KjhELS3cOPdx/85iJFm0RnrGPo+l7Q/qz78GYSuZq/H
	CD
X-Gm-Gg: AYBFou1Ishk0ILj+hoDjxUEemAOvTssdfrLY88NaBCjzmrisnjb5gIeVRZFvipaC+0I
	efab7GzLn3/XHK8/NFtTyGGQ/MlqrgS18X4grEV1HLjc7mIs5hoe1aI4cMF/YZ4p3gsgb7Q39Eo
	McU2ynYw1UXMTMPQWwIcq8pZ8W+eve2d9xVBtiYLf4HiDJBEvolpQtm6zO5wGfph6OpCa9Z6DUU
	e0I6Z9DzyJbtPe9hE97f9Z7K6/6oi1ZqHEjrqN5eyMajGJAkuIj4SfhI2LZawCSOnZ9daNu4ig0
	JrK5uIwGuUTsdXXLfW1DXs/m6omA2TXFfXdsFLcO8lZY8BIy3R4yAqug/84v/TymdntqzbE0dia
	7hRpWMxLrCQboA0BtFS56cNRYUViU9l7zAa9vAEEbtnS1RPLKLipSdMBN9xNaE5125Sh7k27XhG
	x02azqPxKyqxZC
X-Received: by 2002:a05:620a:4586:b0:93e:7ec0:7c63 with SMTP id af79cd13be357-93ebd2751d8mr2809642785a.57.1792054730626;
        Thu, 15 Oct 2026 01:58:50 -0700 (PDT)
X-Received: by 2002:a05:620a:4586:b0:93e:7ec0:7c63 with SMTP id af79cd13be357-93ebd2751d8mr2809639485a.57.1792054730174;
        Thu, 15 Oct 2026 01:58:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be3b51fd1dsm371590e87.58.2026.10.15.01.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:58:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/9] arm64: qcom: enable display card support on SM8150 HDK
Date: Thu, 15 Oct 2026 11:58:37 +0300
Message-Id: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL2V0GoC/0WNwQ7CIBAFf6Xh7EaggLW/YjxQWBWVVlna1Bj/X
 aomHid5b+bJCFNAYm31ZAmnQGHoC4hVxdzJ9keE4AszyaURXCig2AjNwQe6Xe0DnE0eUNWIuuO
 NM4KV5y3hIcwf627/ZRq7M7q8qH6LhPex5PJ39q+11dLiQkogHxul4eQvsFXG6Jo7Jc2mndTi6
 CwhuCHGkNuqxzmvo6WMie1frzez9dtC2AAAAA==
X-Change-ID: 20261014-sm8150-display-card-e43ee5b08c61
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2414;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DzOAZZPP7V5LiM8vT34fJpQqdL8F6A0V377brE+YB8Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq0JXARHgIXLonLZHieroeOkW3Oz63AObd9Cnuj
 PzR2u7N6/KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatCVwAAKCRCLPIo+Aiko
 1QeuB/4yll4W1X8cb3TD+jh5awefNEjJGU1yDK+LpcAJK8YnshbKfyUpsC8K0gnrNsH6EBCOJuj
 18SCiCtLR6FdwlG9sgp9LBqTzpBfFvq//iKPUbmUo9NwI+mKYIUlqAVT8L1HpyI9Z3XNw08R3bR
 UmNeYn3nHddT474pMst7IPa7lM4gkUZSQqwuF3X92CXyQEvi2dXiIpZMro1Hzywu/4dfPM/eep7
 n4UTMbp6MIXGCCGrleo7gNytWnLJjaSs9KCjhGEr21u3UjRuLVaEWkm/b9Cp9chCFgNidIrNEoY
 7Y1N4XU/+28lq+Cn/x5ndNTAVKaQz9mX/M9Ujf4aXHyoxsvH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 2fnz5EPnGctWlpunOUfvOBecJ_v9k9mv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX5a0jm2aCnVNx
 ls9mnvC8QleaQwoaygh0qQztE2Fk5ttnivFn25+XvM9Ft9431j5WS93CuCyn5N9nPsGV/0aqwCm
 pBsagEpMgibkX6jqrfsxf6pMuep+z8w=
X-Proofpoint-GUID: 2fnz5EPnGctWlpunOUfvOBecJ_v9k9mv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX0LBOKRF5DhfH
 dETUUEvN6uiXgRVHmaFGqt3fMdETpZi2a1QW/Wv+YSmCCp/QiwzpQjioO/GJML/QqW7jvG67XIH
 VcR5Zju2u5/tKKPWiCdqqpXCqzTmyXhvtz1Be3tJ9sOXnq672wHyLzr/A66ELtEpcneMDtf20BS
 IZVhdmMqGmgIqU6E1Hbwn+uHwtUvCCppD/5AzKLWXbTfGhUhpd7x6XZUR5PCfRuXSRLhXlhU8Hq
 cnwtSe4w/PI37zyLP5aIf8fAS19JsC6euVs8xk9mfls15BjGA/Ob5nwScVZ/QfKAtv3dIMNVzel
 aJMnN75r1CuMUtNIh2NiaihNzjrJcs/O/ux8gqRBBtFD3wJr6KfbP+pgHvBATgaqSanE0DE9qFK
 ejfO3rKaI5o1LfUxfI1AcA507U0+QTwBnjLC0cnU8eJ8Mn5F1NKwctEmBfw7dlhEP/qce8bt4vY
 uq1mg1qAGszfeX5JlvA==
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6ad095cb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=4w3W_SM6jFQUSMShjksA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150035

The Qualcomm SM8150 HDK can be equipped with an optional display card
having the same panel as the display card for SDM845 HDK. Reuse the
driver submitted at [1] and enable display card support on this HDK.

Unlike SDM845, this also requires a new LCDB driver, providing voltage
for the panel and several fixes in the WLED driver. The FSA4480 address
fix is independent and can be applied earlier.

[1] https://lore.kernel.org/dri-devel/20261014-sdm845-hdk-v2-0-6d0b4b42f267@oss.qualcomm.com/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (9):
      backlight: qcom-wled: fix unbalanced OVP interrupt enable
      backlight: qcom-wled: fix string detection brightness on WLED5
      dt-bindings: regulator: add Qualcomm LCDB regulator
      dt-bindings: mfd: qcom,spmi-pmic: add LCDB
      regulator: add Qualcomm LCDB driver
      arm64: dts: qcom: pm8150l: add LCDB regulators
      arm64: dts: qcom: sm8150: add MDSS reset
      arm64: dts: qcom: sm8150-hdk: fix FSA4480 address
      arm64: dts: qcom: sm8150-hdk: add display card overlay

 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |   4 +
 .../bindings/regulator/qcom,pm8150l-lcdb.yaml      |  81 ++++
 arch/arm64/boot/dts/qcom/Makefile                  |   4 +
 arch/arm64/boot/dts/qcom/pm8150l.dtsi              |  18 +
 .../boot/dts/qcom/sm8150-hdk-display-card.dtso     | 103 +++++
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            |   4 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |   1 +
 drivers/regulator/Kconfig                          |   8 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/qcom-lcdb-regulator.c            | 475 +++++++++++++++++++++
 drivers/video/backlight/qcom-wled.c                |  31 +-
 11 files changed, 723 insertions(+), 7 deletions(-)
---
base-commit: 1fffefb00cc0b0da1f2ae24e3d33364530ea6515
change-id: 20261014-sm8150-display-card-e43ee5b08c61
prerequisite-change-id: 20260122-sdm845-hdk-9466530c4267:v4
prerequisite-patch-id: cb272273cdb260eb5049ba5cfffe13e7904e7a70
prerequisite-patch-id: 118ae0e92f82e1d5be7b75cd310509388e6f5606
prerequisite-patch-id: efe1cd41bd8c1ddf7c9491a6fca5aec877afce3d
prerequisite-patch-id: 8759433719a8151e1a8399fe88036844f60f2ec8
prerequisite-patch-id: e46e47c4d158362a382efc455438ef1fd5c95f42

Best regards,
--  
With best wishes
Dmitry

