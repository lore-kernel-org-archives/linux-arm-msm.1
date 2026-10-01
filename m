Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E42503BD8
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 12:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858812; cv=none; b=ckwia/+MKX30UbIXiIrzjehh8iR2Y19CRiNdQlz9zNd11eSZKVQqSKn0sXU9qDMxkzVPff/ksXQ6ZCOgOvcWZx7zvcGalHRwF4VpDd98mNgecSm8Y4WxEjt+fqbblXhpIYDQKd2BhZpL4cN+Co3RD8/XtSCeg2kJCJS2R1gcttw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858812; c=relaxed/simple;
	bh=77L1muj7k+YHdofGO9d+jbfNzZo5/xYLV7lyWsqkMog=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qytgwDYnSPaOVLr/01gUUOkPR+yAlg/gSwoHr3rYoWlgsr2rwIQuiWvoSoiw6Rs3A39O30bsvvgvrAkeiM2JRGL5oLEXmKAZ0st+knJX06WWRb+GtQqnmWZKTGaj/B/8OUULbaHapL4YPDZj4Hj5ja9WGxN5jhUvG2lWWL+3mac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wj6egu8Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tw0+FGlR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wj6egu8Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tw0+FGlR"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xNl51933065
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 12:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=g66/6p7SoHo+a2sXbr4vYl
	W/9bqSj2xwZ/SEoCSQ0pE=; b=Wj6egu8QHzm3erGOQtQsxqEPkzmNjHboj/6GSq
	hXXxn+CT97OJRWz26N2J9EbjvdXx+Z4oEbXbRLHtzpDco2vI5g8405TreiV/eJYS
	lvVfReZGGAzybUgbGi14T8vVY9hDBUW6qd9YLTL4CNn1Ol55pQF9pYAaiEwu1xf9
	vP/XlhkaWcUGYNByjSh5GI1k49XfsU62wBySVeD10TuTVPrXtd1KEnB3ApuKi4DR
	21H2tlPbCFpxk47KeyBsJ1PwKGu3+DlNYvHqHHsCBLu+s7P0A5J+GV+Kbq8SnzSn
	53e2ZOJemndbuBQz4DjjiTVB1+iFDDm9Nr7kW4X013pzuMbg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1jcfshy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 12:46:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a4aa263a4aso2900910a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 05:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790858808; x=1791463608; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g66/6p7SoHo+a2sXbr4vYlW/9bqSj2xwZ/SEoCSQ0pE=;
        b=Tw0+FGlRpzWZehJFep9+MXlrkwJ0pnses7OGPgGMA4jacNb7vwnqJIgsK0BaOuMZrx
         O4YeFDx5wmKK4znUgpzulg0O/BctTSioMyOOlrxx5qyEVF7MwqhFksJybaIgExKQP+DV
         c/78qBt7xkOLlLNIiFAwFVdKSiDK6KqrauOqDh1dgDj05EW4XPh8lbVZhFVMgxMypRpT
         DJgtuXghSzh73jXnwuqrWBHMuoMRIt0i7iQMO7nzV3qBoJLH0G4726bIsLk9GQBKT+5S
         wa0a0winiMAslAuu2YtKPJ+91TJ0LxAfd1fiF/wCzvseFQUazo8BzFH0rKd+G9TYO5vl
         PeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858808; x=1791463608;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g66/6p7SoHo+a2sXbr4vYlW/9bqSj2xwZ/SEoCSQ0pE=;
        b=NDhJjDMf3NVnu4v2uzT7Jsdu/+ZIcejZixOR/BLQbPBApm4Q2nIDybNW+62H6AQgRr
         QiCtOGNN86MX8BySd5S5VFCTK0GF/V3OelQENlOT+MJYWNmpliXqdoAat8/ncWna0E26
         lGdlAyd8YjGJJgZ420RafDbgAU807h+Tofso21V7kcgqfIBBpCN/6ct0o79MXGYb3gll
         dwyq6aGluLWspt3o1+4NiqP51J9SZ0x9b+YrayiAnibfifJadeWaMh6ml0yiQMJalV99
         Ymr1gTofET3SreIlEN+1rCSdAJ8xQ9Os8y6IlA6CZwA+ZakO+FRLXK+vC1XOuZin1aBI
         l0pg==
X-Forwarded-Encrypted: i=1; AKwUvBxOEO3LyVIMe4XAnGE+SGmgWeqxIlwRSqKr/bT/qGF7C4M11skHhRp9GmGbJaf7RORaB03QJpF0xtehfvw4@vger.kernel.org
X-Gm-Message-State: AFq9FYLSPcrGYOqaSk0n7eNAYoQx7DDVBuvSmGE91KsQ+enMs3Wz3BHJ
	+UVgRnOSB180COFfY4CSJH1UPjxScoNyi/lCce3hOMO9XJC1Fq8E2oA28JhynEeLjtiXcAe3L1x
	3MfmfyMWUWqWa4HvgfyOy3D73tIzCDg3z/c4G/P+b3NUZfTotOER3DQlTvPaXpiUJeOW5
X-Gm-Gg: AYBFou0K6V7VnkQWdDXe7TNxvVJrsJgfDY39r0a/YPBs5jhrOFrx92GFRK/eystetok
	dG5hUVpg1rQ/Y3DCCGSQih1VwBmUjClo28A5va8g7K+1SrqdO0IrmlRZQeVCynkJUKyxVUXDdIa
	hbnWz8TQpN4zOpR1psBI2KfrFalJq5sAHbnbFCSf5RjKezfhs746XKjJrYy0rwWlOhRw3jdwilN
	G67+PD9tjAvHpwbqw/iPfp03SD4K7JSg1RYbnL60FggvVGQcmxtKFMTxqH2yldV2BQZHynFeaD5
	8B+583F1dG6PykzFqHGUI4+IuW5TsADCXfXgH8Yl5L0LxooaPvZcfSQ6J8RBKwnRhI8ZnclD3/W
	gcDLQOP6tWESYjy/LFO0=
X-Received: by 2002:a17:90b:1a92:b0:3a2:b20f:21b2 with SMTP id 98e67ed59e1d1-3a4d0f022afmr4108882a91.8.1790858808212;
        Thu, 01 Oct 2026 05:46:48 -0700 (PDT)
X-Received: by 2002:a17:90b:1a92:b0:3a2:b20f:21b2 with SMTP id 98e67ed59e1d1-3a4d0f022afmr4108858a91.8.1790858807663;
        Thu, 01 Oct 2026 05:46:47 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f479dc9fsm4567467a91.15.2026.10.01.05.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:46:47 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v4 0/4] regulator: qcom-rpmh: Add support for off-on-delay
 and debounce-delay
Date: Thu, 01 Oct 2026 18:16:27 +0530
Message-Id: <20261001-regulator-off-on-delay-v4-0-258ba9612da8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACNWvmoC/yWNwQ6DIBAFf8VwLoZFY7Wn/kfjAXDVtRYaUFNj/
 PeiHieZN29jAT1hYI9kYx4XCuRshPyWMNMr2yGnJjKTQhaiAsE9dvOoJue5a1vuLG9wVCuXpiy
 MLtsMdcni+Ouxpd8ZftUXh1kPaKajdhg9hVhZz+cFDu86AXmHSkiAFPIMJAeuh6DoTV7ZZ/dRN
 KbGfVi97/sfG++NCb4AAAA=
X-Change-ID: 20260910-regulator-off-on-delay-2c86cb8f3eb8
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Saikiran <bjsaikiran@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790858803; l=3008;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=77L1muj7k+YHdofGO9d+jbfNzZo5/xYLV7lyWsqkMog=;
 b=0rbOPbo4L8B6ulfw+DM9toNiTA9hr1FHc03zRSrNoXcdIhnvL1T4WFuBvWpv6okDsE5ppC7r9
 m2Rc5Gf4+L5AgEsoj0A3a3pNk4Mde0bXaUodZuu6/0e84CQ7sPyHUYE
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX56MgUpGpP4oh
 FehT9IjVoi20I8M8zCAy0uY55cXzZI3Q124oLGY1oS9zPWdm9Icds+u5a4okvE547jb/kMZjANW
 1LrWwfsVjiM2De6n0CeMWUY0olRxBqU=
X-Proofpoint-GUID: yUfW5jPiV7Wlg7jqyqAPZdhPAeL-giwJ
X-Authority-Analysis: v=2.4 cv=b4YncdGx c=1 sm=1 tr=0 ts=6abe5639 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=tNq1FA5SYRbIvcvF6n0A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: yUfW5jPiV7Wlg7jqyqAPZdhPAeL-giwJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfXyZG39cGBXbWu
 55Rb/b5msEncFtTktCOnBA/wnWxjHpdt1estUVgKDnsAziICc2E/2m05UOJvOZIsbBONE1MNHGA
 Ghva14Yv8DaPSxP3d5zwqunJmoFTXRQWLNxFDb77Ox7w3ocZCtgQhtMQ+QsEh43ZvJPsaeqCA2k
 DylKjNvvUFaienTZtjaGdR14ViLP3I3OrZfzLrmEf54faopI5kuO7EorYq3LriEvhrdJZPkKaTS
 Z5gmDvPo8ht54fmQjdGDjDFVo08Hrt6QEb5t+LrvQKn+yBPWBrrc0SuATdrYoFnMr2wPr6wsLE5
 GXL07bVAl0bANAbvLf6J6AtbZfO9579Gg38prRftOry6vjVbcfwCzw1nkDH3h44YLBKMK2ks4JD
 s9YVGOmkdGl1M2vVGSosbSXiYtdJrZN9K8/fvW2uJANZMkXPH9am7D/MZiVpq4mLb0WqVReNnIA
 +3/T8HOLngpZxr2Ahtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010050

This series adds support for two related delay properties for the Qualcomm
RPMh regulator driver: `regulator-off-on-delay-us` (enforces a minimum
physical off-time before re-enable) and `qcom,regulator-off-debounce-delay-us`
(defers sending a disable request to RPMh so quick disable/enable bounces
never reach the hardware).

Motivation:
On the Lenovo Yoga Slim 7x (Snapdragon X Elite), the camera regulators
(LDO1, LDO3, LDO7) have large bulk capacitors and rely on passive discharge.
When these regulators are disabled, the voltage decays very slowly. If
re-enabled too quickly, the sensor experiences a brownout and fails to
initialize. This can be prevented by specifying a minimum off-time.

Separately, some consumers rapidly toggle a regulator off and on again,
for example, a driver that disables its supply on -EPROBE_DEFER and
re-enables it on the next probe attempt. Sending the disable vote to RPMh
immediately in this case causes needless power cycling, so
qcom,regulator-off-debounce-delay-us lets this be deferred and canceled
if a quick re-enable follows.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Changes in v4:
- Taking over upstreaming this series from Saikiran.
- Made the binding change for `regulator-off-on-delay-us` in
  Documentation/devicetree/bindings/regulator/regulator.yaml instead of
  Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml,
  as this property seems better suited to be a generic one.
- Added new `qcom,regulator-off-debounce-delay-us` property and driver
  support for deferring the RPMh disable request to implement Mark's
  suggestion.
- Rebased to Linux 7.3-rc5.
- Link to v3: https://patch.msgid.link/20260127190211.14312-1-bjsaikiran@gmail.com

Changes in v3:
- Added Patch 1/2: Update DT bindings to allow `regulator-off-on-delay-us`
  for `qcom,rpmh-regulator` (Requested by Mark Brown).
- Updated Patch 2/2: Refined commit message to explicitly mention the
  passive discharge and bulk capacitor mechanism on the Yoga Slim 7x
  (Requested by Mark Brown).

Changes in v2:
- Moved the motivation/context from the cover letter into the commit
  message of the driver patch.

---
Jishnu Prakash (3):
      regulator: dt-bindings: Add 'regulator-off-on-delay-us' property
      regulator: dt-bindings: qcom,rpmh-regulator: Add debounce delay property
      regulator: qcom-rpmh: Add debounce delay before disabling regulator

Saikiran (1):
      regulator: qcom-rpmh: Add support for regulator-off-on-delay-us

 .../bindings/regulator/qcom,rpmh-regulator.yaml    |  18 ++++
 .../devicetree/bindings/regulator/regulator.yaml   |   5 +
 drivers/regulator/qcom-rpmh-regulator.c            | 113 ++++++++++++++++++++-
 3 files changed, 132 insertions(+), 4 deletions(-)
---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20260910-regulator-off-on-delay-2c86cb8f3eb8

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

