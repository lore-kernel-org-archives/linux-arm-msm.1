Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85962EEB3
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Sep 2026 01:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788571830; cv=none; b=tNPanBwU9b1g24Q/FS8OHdKUZcVNC27jNOvG5oN032l2eDMrVMoqbQclndMcWJ4RzJ5zu04ivf3cLZD0S2buNDEOp6MgAiVL9CXdspD4GHoZ4K8Resahk/4P9bCwOyr57r8DhyzDz7jSIwQ8pkyK8tHXM3b7QZ50DorRM9XlgUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788571830; c=relaxed/simple;
	bh=oynvcZIBlKecsc+DylIsm1cw5mg6L3sp0dapU7DYUPA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jVOJjiDFdBwdT1uUIbZprP9OLxHwLZqEciqVORTn1la6lSINppW0lxs061++N3mbrgoPqdDvp2hlF27E83bPdTIl5CEAQYgeFD2rziZFHxAW6Xcl5SqprUjxQQlABJJuqwKefTkQQEmhzyGlbtF+c7XnKy7oxgoH6qg0ZkuR6X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zyubo8aA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NJUDZzdC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zyubo8aA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NJUDZzdC"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6850w29k335428
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Sep 2026 01:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+21il19V1Z5TYHdo2qdTyi
	Tu2nZQ1nvhaiIQQsBk3eA=; b=Zyubo8aA8YlJBpYzlKpXh6quTlLTmP9pBMqr7r
	qeMEpRNRwyIcYF+Hm2OCMv7KeZrB3x6/Ru9G7xfwUcpJaGIsqGU928JWWves2cBy
	U0t0MG6RiTG3q+D9nsgLTVDO6jBI6cPZEn9GRPV/S4R17JxenUtrmg3yZsBH7Vyf
	+aYvl0kLsx8EKDqigBfhM7RAkHILWARlr1oYjqwo7HBt59363wH0kv455U6+F1R3
	isHK2zJnKUxo3sw8dxH68YhRhNN0SKisVIFAE0HtWuv7ZSlfuSDP6nYVOnTIUnOm
	mab1NWbYvqXAM42clCV0qA29s1uWq/8fGKQTAcmPihxrSI0g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp1fn2fb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Sep 2026 01:30:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-399315379fcso325353a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 18:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788571826; x=1789176626; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+21il19V1Z5TYHdo2qdTyiTu2nZQ1nvhaiIQQsBk3eA=;
        b=NJUDZzdCAT25XFrwQfYP6YDeZ6vBt62jEBk/u/P8kpRMe70nBRO05/tPoz4Nx4je0E
         SzW187yCJrR7xB+k3kY9yQlQL3pQx6Dd6a8xOvtpip9famHU6cs81Qi6k2UDNVrXqVaq
         62SyrWDokh/xSTRRqlqrDbebsB+vSDCzTWjlF5vSW6DcyLFxJHddW7lCK1oIW/X9Ou8x
         Z7OFqBVeCGKNeuzk22uNxu6pLUncWnMa+144cQiY/DOwAbkfG6gkXqnZgBaU6rwlU9hN
         z14E+G5tWWVSs9rMXJuBK6jFF34Lu8WGPm4M5ZzfqgReoNqBCBMBJk/MPSFrF5wetHMI
         d+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788571826; x=1789176626;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+21il19V1Z5TYHdo2qdTyiTu2nZQ1nvhaiIQQsBk3eA=;
        b=JMO7bdt9T7BuxR3lohzy6rdNsoyfyaCId0yhwLLuU9F1FvQgSdegt2UmIND1+Aws+j
         FoOPc3iNuoOGhEn8WywGtu8xhGG4h90S0f6Pi8LCpBdZittzyA995l3lcdgmUCwVeOpX
         hz+67hiNP5lx+zCiMB7T9jKLqYC6SnZvtIDFDy/PK+IXywAyG1et++0PM3brPiZ5pCqp
         knyt66FWKM8cG5tHs15jlPuDkd3HLSp8K+tu8j14qGtSKjWogD59Y/G4iQyM5loRnpBt
         4le3WEQlpuCGCcgkSKc5+7CnUrFHJa8Frh9UarXzjdHEps7qE2MUE4bzDQHN1sCJu+Ul
         2yNg==
X-Gm-Message-State: AFuF++lscXo5UGhspeCpRB9i0KBOmn6Yw5pVc0ZIgMp78AfwPqhJBD08
	nI6GHNtvfdnbC9GWd33mTrkjap+HxTPN80V3Y5z1vZOsXVLXoDJpIYWlO9d4DxFokQt1EGNPvqR
	30OlC+tSmq16J0R3MznoznuUJMsexGXRmt2xCbs2aoP50a3jPTnlkQMvmVGb2hq0GlIdr
X-Gm-Gg: AYBFou0HosjghkzqhA2kar52PupVJeY/izMWhI+YE8ozy1y6ZFR2/oS1dpwi4+Ot5p9
	VEvBKP/HguPeAsK39O2G+PLnTIOKFS0PVWqgiNFlqCftHh2BdOrvj4cW01UI0yIiPuLM2IjoqZY
	cAg1gU2WYIAI2VhE4/MQcwgrpRS2X/e/63fK551IHN8OjfLGCcDKsB8fZ3Ldklpwg1w9veiRNK8
	mwlXfMUZxeaccd3Y0jkPIu9aABLYbxcUOAixTaxgUpom3JA7J29Xm1c7Xhche4sLIDomREC9070
	kXrdN5GVpTHXPizNO8abUUmmq+e39Lj+Rmm92k3dUhONEihraYzoMTEhavAltvgoW23nwDcHthW
	mh443WRDl2E23KBDz61jIQXvV3neRqBlXBHmxNMAK/9Pgtq2Gfb32t+vrmZBYZXcxOBhkZOgPcY
	qJ1w14WIXtjm+hIKsvQrSa
X-Received: by 2002:a17:90b:528c:b0:38e:7069:7117 with SMTP id 98e67ed59e1d1-39b3d3f7890mr3133897a91.0.1788571826338;
        Fri, 04 Sep 2026 18:30:26 -0700 (PDT)
X-Received: by 2002:a17:90b:528c:b0:38e:7069:7117 with SMTP id 98e67ed59e1d1-39b3d3f7890mr3133860a91.0.1788571825841;
        Fri, 04 Sep 2026 18:30:25 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm10170457eec.12.2026.09.04.18.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 18:30:24 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Subject: [PATCH v3 0/3] arm64: dts: qcom: Add LVDS display overlays for
 lemans, monaco and rb3gen2
Date: Sat, 05 Sep 2026 07:00:14 +0530
Message-Id: <20260905-lvds-support-v3-0-b40a1b03f63c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKZwm2oC/43RX2vDIBAA8K8S8rwrnhpjyhj7HmMP6plOaGOqa
 ego/e6zyWBs62Avwvnnd+fdpc4+BZ/rbXWpk59DDnEogXioavdmhp2HQCWuOeOKtUzDfqYM+TS
 OMU3ASTJSTDWyx7o8GZPvw3nhXl7XOPnjqajTullbkz24eDiEaVtZwxnygjiBaKkTWvZC+9YaJ
 ObKiefYyoZu9MHnbJZyttXjUk3HJBgi2E8dR3RgU6ByYdbAQChSCpX22KrnmPPmeDL7W9pNWZ7
 +8gRYuX5wNIPfA0UHsyycVtgKbRg15P/PSehjgsGfp88agXzv4tCHHcwICF3LOfYMWUftHfbWw
 beQp5jel/nMuLRwHQV230dRQAbYo3FGcBTW/AIXb+Zfhkbxw+DFUBaRicZrY9kd43q9fgD9qh5
 /NQIAAA==
X-Change-ID: 20260708-lvds-support-2d40d60654f1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788571821; l=3185;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=oynvcZIBlKecsc+DylIsm1cw5mg6L3sp0dapU7DYUPA=;
 b=QsXYhIxf3wKlrlrM3IKK4e7i0CbrJqOXBvIxPR+rRvHW8yBO+LkWZKqv3C63paood/IHRsVnx
 RJVWeohApNLAVvgKHAP7iktKxrDPi5nZhw1IBl/l2SPFyVu3N021buF
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=F+xnsKhN c=1 sm=1 tr=0 ts=6a9b70b3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LLsA5Aw0SIQ3C_74oAYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: KoJ15blU_BxzsRcvALe9rxyosdkbV4EB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDAxMSBTYWx0ZWRfX1chAu2paTv44
 EIb6+ntov6MbDkENm23Iojz/GOcnKgWsexgCB8Aje/G8/cj7A0aF4xtr/GTUWTFlfUAV1QG2aVt
 Iy4pA2+uinq/j6FsXQDt7nT87zFy13o=
X-Proofpoint-GUID: KoJ15blU_BxzsRcvALe9rxyosdkbV4EB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDAxMSBTYWx0ZWRfXyG3eQYd9I2v+
 sQ2HySFEEkO5pHmcSd3iAlRQyY6QMsGgL8gQ/pHl3dbAYKvauSKlniS/tfi7kE9jdWag8XxX/Uu
 DYT7vokjGSGx3iTQMUWMVjYjwaxS4RxDhoVzn+Zm5045ab7NbGd0tWiO5dDkI5BCEwfRJelhYti
 TKYCDsOcIJeQFvzbkvbtvPaSLsgC2lR7ehH3ijibrhVe9jGHgJxBdHRsgq/trrJVA04mugWOg0V
 09mqZP8nvSXiuqA873jtAeJbquXNEWi4PDz+yH6uuqVITWBLPXAmpJ8KT+m/6cMtELbn5ogj8+S
 Bx46ZOUex03gR5fkKyzn/kIChClQo2kjIuKnNIhhkq/TbsOgxNU7HyYF4jE86W+j/b1VnyfgaX9
 wxOtjhuC0SrzWSoaHm0MZDOpHdS4da6MMtkUbUurrc/2Xw1IQ4Reb1z3RHXS5MVDLFRK0UQBtuG
 HftxEjy9Yee+ljxl68A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609050011

This series adds LVDS display support via device tree overlays for three
Qualcomm platforms: Lemans EVK, Monaco EVK, and QCS6490 RB3 Gen2
industrial mezzanine.

All three platforms use the Lontium LT9211C DSI-to-LVDS bridge chip, which
converts DSI output to dual-channel LVDS for driving 1920x1080 panels.
The overlays are structured to be applied on top of the existing IFP
mezzanine overlay.

This series depends on:
  [PATCH v8 0/2] This series adds LT9211C bridge driver by extending LT9211
  https://lore.kernel.org/all/20260904-add-lt9211c-bridge-v8-0-36d66168e176@oss.qualcomm.com/

which adds lontium,lt9211c compatible support to the lontium-lt9211 driver
and extends the binding YAML accordingly,

  [PATCH v4 0/2] This series adds BOE DV215FHM-R01 LVDS panel support
  https://lore.kernel.org/all/20260903-b4-lvds-panel-doc-v4-0-861738a0d5de@oss.qualcomm.com/

which documents the boe,dv215fhm-r01 panel and adds the timings used by these
overlays, and:

  arm64: defconfig: Enable Lontium LT9211 driver
  https://lore.kernel.org/all/20260904-for-next-lt9211-defconfig-v1-1-97221f0109d7@oss.qualcomm.com/

which enables the driver in defconfig.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
Changes in v3:
- Removed redundant status = "okay" on nodes that are enabled by
  default [Konrad]
- Added a blank line between the last property and the following
  subnode throughout the port@N blocks [Konrad]
- Link to v2: https://lore.kernel.org/r/20260813-lvds-support-v2-0-6b11035e8ab0@oss.qualcomm.com

Changes in v2:
- Updated overlays to make them compatable with panel-simple-lvds-dual-ports.yaml [Rob (in panel series)]
- Added Empty lines before the status property  [Dmitry]
- Link to v0: https://lore.kernel.org/r/20260719-lvds-support-v1-0-1f1aca3213ba@oss.qualcomm.com

---
Vishnu Saini (3):
      arm64: dts: qcom: lemans-evk: Add LVDS display overlay
      arm64: dts: qcom: monaco-evk: Add LVDS display overlay
      arm64: dts: qcom: qcs6490-rb3gen2: Add LVDS display overlay

 arch/arm64/boot/dts/qcom/Makefile                  |  14 +++
 .../dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso | 113 ++++++++++++++++++++
 .../dts/qcom/monaco-evk-lvds-boe,dv215fhm-r01.dtso | 114 +++++++++++++++++++++
 ...industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso | 106 +++++++++++++++++++
 4 files changed, 347 insertions(+)
---
base-commit: ba20122d4c311bd9384f38e7ba1d0c122e21745d
change-id: 20260708-lvds-support-2d40d60654f1
prerequisite-message-id: <20260904-add-lt9211c-bridge-v8-0-36d66168e176@oss.qualcomm.com>
prerequisite-patch-id: dbba64d1ace696df388c5df3d1cb05a0701df194
prerequisite-patch-id: fac2b93f3e250589dffd7c076d2ef1aa7a2519a1
prerequisite-message-id: <20260903-b4-lvds-panel-doc-v4-0-861738a0d5de@oss.qualcomm.com>
prerequisite-patch-id: 1d3e40bbefcb2550afd81c5cced812a1d3b943a2
prerequisite-patch-id: bd3612ce053552e2ae7401a1217c4884413563f4
prerequisite-message-id: <20260904-for-next-lt9211-defconfig-v1-1-97221f0109d7@oss.qualcomm.com>
prerequisite-patch-id: 9e3233401819ca53c119e6cfab95b0c471ef254e

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>

