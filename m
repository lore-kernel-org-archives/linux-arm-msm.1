Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2084030E0EE
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 07:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791185081; cv=none; b=f7hpo4PjQzJv0qQAqoM/gRXhG4q0x5H3x+qcpm7rFFTKp8n6jkuHtehg94BNHLiek5HbPNdTcY1nYzvsaP/m+PoiggkEl8WEPJDTojuaHqbtjxJzIHv+VbVbGiUl9N+zWalwf5hLNHk44GDZChyHniJJonHWHcXLuzgR78gXl9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791185081; c=relaxed/simple;
	bh=PB2fJ2NPkTsLvE1rgds9beFGAFlS+6IeewjHF7IqqAA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RbEBMz24cI4H2fcmfxAm4UpUVQbVKh6/cia3Y9ccMiBzrlj1dIyF09vbYrAE+9M2tCP+H57sObn2PC1wAbM7W9vwBk+7fmGMl2cA6GWNffZMn+rceIdYuT7dPh1ruDo5KoWogZndX03ZuH/tHqPzqIrJDBM7Dno5h1suOTNwX9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wt2dRDyT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hTp3NWra; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wt2dRDyT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hTp3NWra"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695103oM1464827
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 07:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Azp63sWT2CMgHHs8K2ACf9
	MkCZDugyXiO1aUWelBT2o=; b=Wt2dRDyTnkF+pdHOpaKGQBWxScFEJqRY3lwpAD
	1jHwEZ0QfGRqWNy99WW7bBc3uaZouzQPTZ+VQG5SE/LLFg3fo2/wspwmsAzBhldL
	NBYO7iFuKfxbDebVwPPnujTns3qu2PcssM2Gwx9TIehCgHfR/cVTLnjHgdCoGRDx
	LAyrykYEDSKJ6fYL3d2DED9xadNBzqR16xo2KVQjHZ0P2Pi6t5pfIVB/af8NSwxm
	UkZC7+X7bcjpj6yT2IzIwkjtS/wItinIJ0C5JfhzWo7VoVhKffRK6csuQyp11ibG
	QH4sMu1NZcmjgvSCHD/DYoZO2KmUGi44+AIq4paeSWFTZVww==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sssmugt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 07:24:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39deda201bcso2299227a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 00:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791185079; x=1791789879; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Azp63sWT2CMgHHs8K2ACf9MkCZDugyXiO1aUWelBT2o=;
        b=hTp3NWra9yAnmS9jGiD1uUh7qcP9fHndfRUXaNQNvINCbVBb+PbQOSNFB4uVCrEEFx
         LR8sBzhBxOd8Y5nFBPRVRoDUin/ISlMm6G3htcuM7y14dofm+5v1iIuek0YKye6EU2dn
         RmmfBNoEYWGLEivndcGlbLq5vI/gg1ra2SAeCXfUytUs9iDYhSdT8UOA7sSXlJvg4JRO
         cofSxZ6dM4B9ox7Iai2Ymu7eArrLPLptesYLl7ZmEyND0URQMtety0axSRvp+rmq69Wi
         ocwgwrNCT8EVDaFLopf+IZuxT7Nx/GXqYrGBgzeSsSM/j5OH+BpWkKznmqX+FYUz+6dc
         m6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791185079; x=1791789879;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Azp63sWT2CMgHHs8K2ACf9MkCZDugyXiO1aUWelBT2o=;
        b=E007sIIvHhYMI0S74RSCGHtE1cek6raSS6SMJ//BO254+uZrh0PTyJy7Mor0Ya8YU1
         MUfJM2yKTCLSSbbOxMSc62vKK3zU4hBu2lupOTDFwxBUWIWrvvzWwBMToD4jQtiDk4XA
         hH2DQr9+hHExz+WHKrIybfsA1RaeV+HcaDBlr17g0RAy1TR4h8fsQSItTYkWQUHapKi9
         ZpxjOwVON8zfLcThpDDeZbRu694WIQXXTuIcrdHWgbkuQREhiC1dSkXQUpfAroVRiBZx
         iFNLaF2oWOPfc/ut7PzqWqK4mFScKPXwc+u8JmQxyYj98VQDT0owvgkDO/h9XVDQN5iJ
         JDkg==
X-Gm-Message-State: AFq9FYJAveE7y4weRGf8pYrjVubrDPRjl20r7lTR42Y+GbgtiFWeViZv
	xk7V9Rh0tLbyV5Z3fqjdOMLxPJ4VQBKQl/SYoL1vxyrAajrazkcW7yN3wmiCjsEBGXPEL4Wxhfa
	IZ+GPq2bZnjfjRPjcNcqN2fF1V8MUefFEjlfFJjVC4TUnMb+nLIItiHEaXkZVp0iANgJdU4y2eR
	4fTUo=
X-Gm-Gg: AYBFou2WV9brQkNDaIw/dLwIkyCc8DimUx6+qFzZ3PavszcC0fbIalEGD9mksssuI5H
	MHymn2oVxR0kwJQ85Qc4UZwyL9Eh31SNY+zFxiwQTTi2j28rzEUNHiXku0VvxG/qzjVYh8y93rK
	ifnpyvo/q1EFeNO2CC6xSwUrk22m81MgYfbzWUyAVOQKzAk6A+BIHvbsCvXMz6nuGWw45pK6PcV
	jfIXXVvrBCUUcwi3SPvQaFdrPTZq8GeChU4Y6UxEujoUCnI14mZfwpkPC0DxPQujmxEsPicsqGE
	wq5vpLwAf3P7BQPKOmiNzvtEOGgxx1TiMm0z39hG6i/gJNKXGjMNJaKHDMBe377DAJEkI7zb6jq
	OSCU/Jxf/IyiiX2oMtD1dqZQ+3MT8iWCdqLc=
X-Received: by 2002:a17:90b:3843:b0:3a0:a259:c67d with SMTP id 98e67ed59e1d1-3a6ce6ca70bmr8637876a91.20.1791185078569;
        Mon, 05 Oct 2026 00:24:38 -0700 (PDT)
X-Received: by 2002:a17:90b:3843:b0:3a0:a259:c67d with SMTP id 98e67ed59e1d1-3a6ce6ca70bmr8637862a91.20.1791185078128;
        Mon, 05 Oct 2026 00:24:38 -0700 (PDT)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4f3911sm9901421a91.15.2026.10.05.00.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:24:37 -0700 (PDT)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Subject: [PATCH 0/5] arm64: dts: qcom: kaanapali: Enable DisplayPort
Date: Mon, 05 Oct 2026 12:54:25 +0530
Message-Id: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKlQw2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAwNT3ezExLzEgsSczPiUAt00sxQzC2NLc2PDtCQloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loAjdVQvnAAAAA=
X-Change-ID: 20261005-kaanapali_dp-f6d6839731fb
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791185070; l=1855;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=PB2fJ2NPkTsLvE1rgds9beFGAFlS+6IeewjHF7IqqAA=;
 b=ZMRkJEBRxbn++DECTU2DBJxRTOxV1Zf422DCROr+2zMMUeZ7a43VwmL0EndjE+8+8i8LQuuks
 A6jKmG5MAbtDyFpRhiEQbsytABeLC1k/y/uS617BRIW3JwE+D1UbYMM
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX9voJuUaWgqBH
 BLfbVmHCe9YfrURzQP4MjGaWNCHLEvno/6ol2Wx4pch8LjnPkS2CH1aUnaW6WYRWTwD0ZH6xf6N
 ozWSe4qVoAp78BmBqTqrpcmqgajkbhc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX2aEWRL/3HNuE
 3hVp9SCHi8P4OUcC+FPyf+PciT19EXdr9FjcNZ124AwyWXJCpl5rLq8bCU6VVFLHOiHLghrSyXo
 08chiZ7O+6joMVWWzDXFHN0VXmET/NIdz1NZC5GX+Ct4xfJug7exGtkHVHlXmOg5VUKiV6seHHY
 uNF4SDlTlxFALA7LJTCMj8XA+m1/9GkCE8eozVTPQCc9S2MWsKq3rQivtvqIat/mc8Nf59fWQ9s
 7Rk1d29g9cRUwoWDFWOY5XkqzFtkDOfaxgGg+27IfPSWL6vv+1+HwlGYL8EjNI5fs9QcuA+lfNc
 Cq3eGCNhZe0/J7KEDkjb7sDcoHN+jM+R1t/ySlS7M59jjwcWLtlz3ACtjoGUXox4p20OHGinfIv
 ZeMY6KQRS9iOb49eBItqXGh4gYGe4pGDrvC40Cc/6Nk+43lfnbRLeAa6k12dPOR01YmMWLra0lY
 aYpi0AO/3//SK3O/kTA==
X-Proofpoint-GUID: GghGYo49uHdb7b-yhvQEJ_zK1zWPbemg
X-Authority-Analysis: v=2.4 cv=HqjjiETS c=1 sm=1 tr=0 ts=6ac350b7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=sU2yQpN9xp1-T3Bds64A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: GghGYo49uHdb7b-yhvQEJ_zK1zWPbemg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050028

This series adds DisplayPort support for the Qualcomm Kaanapali SoC and
enables it on the MTP board.

Kaanapali has a single DisplayPort controller reusing the SM8750 IP
revision, routed through the combo USB/DP QMP PHY. The series:

 - Documents the new "qcom,kaanapali-dp" compatible in the DP controller
   and Kaanapali MDSS bindings.
 - Adds the Kaanapali descriptor to the DP driver.
 - Describes the DisplayPort controller node in kaanapali.dtsi, including
   its OPP table, clocks, and power domain, and wires it to the DPU and
   the USB/DP QMP PHY.
 - Enables USB-C audio support on the MTP board (WCD939x USBSS Type-C mux)
   as a prerequisite for exercising DP alt mode over the same Type-C port.
 - Enables the DisplayPort controller on MTP and advertises the supported
   link frequencies for DisplayPort over USB-C.

Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
---
Balaji Kalkonda (5):
      dt-bindings: display/msm: dp-controller: Add Kaanapali
      drm/msm/dp: Add DisplayPort controller for Kaanapali
      arm64: dts: qcom: kaanapali: Add DisplayPort controller
      arm64: dts: qcom: kaanapali-mtp: Enable USB headset and Type-C accessory mode
      arm64: dts: qcom: kaanapali-mtp: Enable DisplayPort over USB

 .../bindings/display/msm/dp-controller.yaml        |  1 +
 .../bindings/display/msm/qcom,kaanapali-mdss.yaml  |  6 ++
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         | 59 +++++++++++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            | 87 +++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_display.c                |  6 ++
 5 files changed, 157 insertions(+), 2 deletions(-)
---
base-commit: f0406245cb9855e6318335a8a223551354291a46
change-id: 20261005-kaanapali_dp-f6d6839731fb

Best regards,
--  
Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>

