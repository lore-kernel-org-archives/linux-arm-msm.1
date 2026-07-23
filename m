Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B7F3FAE15
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 21:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784842794; cv=none; b=b4qI+FEkZI4ZfRN3/mhgfE5UT6hiW6BrcDMB+QOuamgzbJv/Ss6xYo0fV5+I3ngc4feiEXgBGI2dQqoCxWrsfJjLr1XlxcX36DYdc89pzVvwhSeP0FZPV1VlFNMlxxH7Xi29V2Z1kfOjHUgE8I3o4aelNPdSXH/lncz8ur58KpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784842794; c=relaxed/simple;
	bh=ip8Uyl2oFgcRZWwtJXR0j8TqrNAuq0h7S8y9j+lDnVk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OMKm4bhc+aYLZk0+JuYsAc7ujmSg/pZk7tsdc/ERnPF9JneSH3Cxw3J4/Z3PMpSkvWMjUgsH4KUoQGbaht98V/a9eBofnjfnfiPwNejtdRJmDrqzWNruaw3o67jL3EAFimbBZtwN1fhUyIWi59Trvb5vfnzgkxmyN3ugUhMbPN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BIuXAtUM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d0tsxmXS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BIuXAtUM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d0tsxmXS"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NImG1I575363
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 21:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=j92jrThRL6soH6MtbhOTvj
	gHsBqSRNODwQ6Agj7cVE8=; b=BIuXAtUMwRGDSHATEgxofilwvNiX/jsYhQvMUa
	NXhLYxjkV4a+Tut9D9bTo/H5hXVqW5igqvBppSZ+z/aQbhV29LYwP5kFM0dSuZ3e
	MkQOH94ZstQrBs/5xDHCJOKXvC6U/5e1S+OmEaeG8WmEN+T2o7/qIRETY/1SIKvv
	dBQ50eKXEoSksxtI2/2D7lKp6Zlz2I5M5kpE4m7nnOzcQWeWawp1ahCdF2ifgClR
	0Cy3O4fRH4QIvCNIG8Vpx88glGzKpHTXAhU6GJOFySpdwPulek9vEeVRplMk/Q78
	FcvvBw/gs+Ku5HLOaUpUA1SHriQKR3wCQHIcPdr1wr/MNjcw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fke0kupn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 21:39:40 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so902659a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 14:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784842780; x=1785447580; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j92jrThRL6soH6MtbhOTvjgHsBqSRNODwQ6Agj7cVE8=;
        b=d0tsxmXSIlepql/lythhIbCTILIGegZzmCgr0zCMXPVBDu/Fxbpy4EYCFnv6Jv2X2z
         P6TSpLCHPV/sSlmv3fsGmwqPH6Omlh2uaNJFjGhzhSwQTLUb8jwJDKNnWSUaxToIHyGO
         Jn6fUa2pMarcMjVMmhJOf/csW6Wct8UMaVIx8b4jnkOjZo7SDc9vT4QV4V9DCgmLedzd
         4cC/1HyDDc0bACcmlTiSCbwBkAFODvsHGz/Jef2L+Z8ogsAZyWbcByvpUg9v+62rmKFH
         fppwJOByX+k8nAENzFiAooYnqeL29vDZIUZ8q+NWawpPINRKia+3Fk/qafEuGx6OV+Dp
         QyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784842780; x=1785447580;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j92jrThRL6soH6MtbhOTvjgHsBqSRNODwQ6Agj7cVE8=;
        b=QqSa34TLtLVwFp7kJ6+7UnoLBYvLDk1ml9mSSzs+FvVDm4Ca/ME28BwqgykvohCLIs
         DyC9j7rNQvNGhl7g3ndrP/Tn+7DtoXN8A4QMIy/QQo7WdB3XKJ/f8uaIsIrEh5kPjfxP
         98avZO8T3cWtcpW4GNTHebcfUPt84A/91YnTz4dahTOPFYW/X9MSIPMvcRzDi5K+FOtg
         9b/yHPwmTqWY3ARxd0F9p6TXAHtuIzInySuHzH1lW/okzSKP5+YDZQ8p79Npby78GeHc
         5L/Fvmlr/DacAVyRxdMoBClP/jf8CSRySpZj3I/K7O7iWbR210tTnYKMOTzcZ7d1lkja
         ncuw==
X-Gm-Message-State: AOJu0YwLmcA+E1J9SuO8PUT5sV6oy7qe1ebaZn+gSI5Y7yyj3Or4uL+O
	wz0IH7c/XR8zFdlq0HuNqOD4Kspqbl7bBpwGd3ECaLUFG5rGMqbzsrlyrhFkM/IpL7M6c31mGbG
	ysEUrT46NQRDW72F9qggGLdDHjmpBPYYLbdEtsl9xw78lVEI1VHRVibiWZkJ4eWQHnv8w
X-Gm-Gg: AR+sD10m3O4wPBupqtmPzYLiMC4Tg+LKaBasRBA0e3kdp9PYVyYg+x//fRMFfr1nfbO
	rCeK1aX821ZVUCo8jjRSaQgSByYumnCK1WejVtV1ILG0tupgi4fcHgJPv75HcXHJF8LA7gOBZCb
	Lsb8fl2ujJyB9v3bxDVp4l8z3CZfF7dvAfBM23UzVMusGHitJ2ocmBOvTn/ok8yr6cqj4MuBdLm
	RafCZGosdBUG19Dpv3TJk16XEH+HEyG+M6y8whZ9k9pB/wjyllAa3J+CuzdNXS2IPILrvQmwLZS
	YYAfbV/b5aJmYj/NwpnSVxEY/B4d1s0J47AX9P9pFlI3eJl61yy2Y2i9lCBtpky7HCPn91jtstd
	ABg19cU89/CKHf5pZ28FBpn8J74/4HHyg9nYcLoW6Gnz31e5rEI0V5lU=
X-Received: by 2002:a05:6a21:a8b:b0:3bf:63af:859 with SMTP id adf61e73a8af0-3c44b1a56famr5502962637.45.1784842779420;
        Thu, 23 Jul 2026 14:39:39 -0700 (PDT)
X-Received: by 2002:a05:6a21:a8b:b0:3bf:63af:859 with SMTP id adf61e73a8af0-3c44b1a56famr5502924637.45.1784842778887;
        Thu, 23 Jul 2026 14:39:38 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e070538sm22904174eec.20.2026.07.23.14.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 14:39:38 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: add camera clock controller support for
 Hawi SoC
Date: Thu, 23 Jul 2026 14:38:56 -0700
Message-Id: <20260723-camcc-hawi-v1-0-7057658c5c47@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPCJYmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUwML3eTE3ORk3YzE8kxdk6RUCwvzVOOk1CRTJaCGgqLUtMwKsGHRsbW
 1APcnnZpcAAAA
X-Change-ID: 20260508-camcc-hawi-4be887e3beb5
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784842777; l=883;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=ip8Uyl2oFgcRZWwtJXR0j8TqrNAuq0h7S8y9j+lDnVk=;
 b=3pRIkh3PunAdsIQqNXpbDxGRI1UtriHcG1yEQCmDtbgnGcKeMpdzJX7TYPOjPz6mOEYiAXZOA
 LvSm/I/1xnzD5iLelbD7AEWB785e2phslqOm/R7BDTDzEcYc1TqHbMc
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-ORIG-GUID: pMScxULdn1jz3R-5HaMz6YLRNKjDi6Lg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDIwOSBTYWx0ZWRfXxAIX3xz4HHHI
 P+IxSIVwzQeF138kK0xqfn5mNy5pFqF2+/4rLpy6sKo0BO+sd9O9kFtJxmDElh8dQ7W9BClVqWZ
 R9YHH76pFFAdyfzNfxW7Yg+gwSTEXV0=
X-Authority-Analysis: v=2.4 cv=S7DpBosP c=1 sm=1 tr=0 ts=6a628a1c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=3-IOAT0Sqvn_RtttD7cA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: pMScxULdn1jz3R-5HaMz6YLRNKjDi6Lg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDIwOSBTYWx0ZWRfX4+0IFcGFdMRu
 e/aFS6qgnAe3uOv9sX4c7UeUdkZHlYz0PxbbI771AXd0byOkpUHD2r+BvtLH3muDn4MLGfa2sAc
 v9Svp8Gx4C8H/l5oa5Ub9ASlnhN9KZFemS3RQDwIvYM4g3xjMDFyuTtgNlyzXeLESptftCFgdAG
 BTLOmyHbU4nujvlHYUOHN8Qa4TFGCPT2d5NsHfEbffHJBUcBMNFo0qCZNCm+fsmLSwDRpziBFy8
 vcdAuQah34xeGTXgjUZO08qbBWKapQUg7tz6ZTDErdH92UBu8VtOwF1aY2icwV19FKUqdxDX+Lz
 nMuN0SQnkaGyuX46g2bKC93sdaj3d5tKb/5ntFUgeVAPIrVedIoQ9a9mOaSEbqpqlnCDdC7U827
 4m/1a/cADmDQUTZuze25NJf/ZAJBb83JaMgBsBcwCIzpAw36da0S6JWbmzSv3f/fx8CSx2dKy+y
 5+3JcfbOgtkM8N9SVPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_06,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230209

Add support for the camera clock controllers on the upcoming
Qualcomm Hawi SoC.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
Vivek Aknurwar (2):
      dt-bindings: clock: qcom: Add Hawi camera clock controller
      clk: qcom: Add support for the camera clock controller (CAMCC) on Hawi

 .../bindings/clock/qcom,sm8450-camcc.yaml          |   36 +-
 drivers/clk/qcom/Kconfig                           |   11 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/camcc-hawi.c                      | 2984 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,hawi-camcc.h        |  165 ++
 5 files changed, 3188 insertions(+), 9 deletions(-)
---
base-commit: 9eebf259d5352b87080d67758f483583d9e763d7
change-id: 20260508-camcc-hawi-4be887e3beb5

Best regards,
-- 
Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>

