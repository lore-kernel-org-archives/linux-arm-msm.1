Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BBA3F485E
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792053576; cv=none; b=Np7oITWVAMetfzJWv5QQ4bWpSD4x/FjualQoX3azsEaIgK0Ny5shPARORAfdI29IPBj4pCmaIigvr8q09xrK+OwO5mjuqc7G1wW4plFxJv/H9cnloLD6vQn0HRz7QuaJrer8nsaPI6f6ubJQ1NM5XiHEYPi+Vf8ZgfgURJHrrpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792053576; c=relaxed/simple;
	bh=cUEtfwQBEjXbHcPZpAOE6asYzQd+8XLLUM/ii4eK1g0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cqnhlRPEKtMlfm2ih3/OoBhCrxFuKuTjZVxkrc5gPEIWGsng1OSMAtSB27m46MXTY/v0S/qUcWAmFeZR6mc5ObAatEbmdY+XfD5I6hOYHhIEmYu8xLcf+SEaYrsyig1LHsmlR0iQ9oU91eRKcy6ODaOz3EJIDuQrcdmaY11YuG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gyQ1aYgq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gygTnm5S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gyQ1aYgq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gygTnm5S"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6AN9V644584
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6Q6tXAlLgKwWbpNrJrxKLX
	H3X06JfKu+TnwxFCItEVg=; b=gyQ1aYgqQMLYBXI4000PtLvMurwL5ZdAfZzJiY
	zZX2yxkphThiiKghL84pVEc4CKAbMMJvmCmzI806fXnYgFG4SvU22gSxXg6+zQW2
	JH3ji2dR5SqFqyhMkLo3tKSdNIJWNHQAgjiuRMM1UvCWqy3vZgeI6uZMKoYFw0Tk
	zkBhgmF5b7XKT2NLDoqEGIrzIL3sNZnK9ccDlBg4gCK7sZlg8Z2qhG3YJPxhsoZm
	z7i8R7MSkJDgSwz0dfkWyZSSUkh0r6Qzdn9Gq/R9Imyko7lxkKTBWvfhBG7mmETH
	akTu4svbyC3IWxNbCJ9dYHc13ivb+sqDqi1Vra4s+SD58LHg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmya169-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:39:33 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917b7dd3f1dso20525786d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 01:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792053572; x=1792658372; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6Q6tXAlLgKwWbpNrJrxKLXH3X06JfKu+TnwxFCItEVg=;
        b=gygTnm5SwsiELNaUA00VH7ZwGhz5acPgh3q0ZUK0QrvkQxYDAJsbkqHvOOEiOK+fE0
         0e0o0GwLfmECAkcd821WJHl91P+4nxfQS/rrlSV7a9mvI11CjHYcd8o6dsfe95l+J9oS
         cUD7fPVtjYkmh7pG1Fklz+3uFvrvaoAcm7gZ1m8vETFpJXNcIP+fUQMlfBY9xtVASXYw
         blVU/UFhgV7Wu8S+qpNbL707Xeb+9bDTS6W7ShmTTGv6EA01DmoA6ujnL5WY5MoU4YU7
         efz0tkoDnup9BaOUtXRcnfH9sDmhqa2UDKTmDXvfXy2/nu6s8i/D0+VFG9YsiEF3q95T
         4SYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792053572; x=1792658372;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6Q6tXAlLgKwWbpNrJrxKLXH3X06JfKu+TnwxFCItEVg=;
        b=o3dZzLTl9rWCM2lS7iZcdFxQ8GONF0aCzvEi/f5Wf9ygNvoiws52AaLtJ0dHS77RKj
         1bpslszviLc4soiieqV1qEfPLD+J6zzsivCPFAEcjeg2jsQWeVfR6OeolsClawcB4fDP
         sfB529SszsakmQvlopiU8ObtlM+pe+3qdlJ2WRLzrqzMEg22TAQ9BVUCLXZ3fRuNCzOC
         yS2Gm3rHSOSQJ9NfgxulVFia11r3yIogcR/AkEtbIz6NdN4ib3g28z4xDvcjB9g2v5MF
         IYnPbkhN3+B/oJQXtQ0wQ/AKi2KIYxnnQAppKhyB1m3gqiKyaBARwpHuXQsK232gqt9J
         XxoQ==
X-Gm-Message-State: AFq9FYIa0C7T2Uy+3qJpyMbk1TN7N6dIVsA6T3hgL53qTtgYUIxyJRZP
	wOCHUjwZ8ZJdlq8OofZcnxsavWTWlbFCimccGqTiOHZ+ObJnEHhR2CwZTYnKLXQKa1zoIWNKAi1
	gz0x+gQhoud1ykZAz4E/E/rwMESlcRAB0W9/bJzVjnOVrLmlCq8TKRZJ/3iMOzmC0t8Ql
X-Gm-Gg: AYBFou0qbJTe1Q7OqKIBNjykqk9qNHJV3hRkSDIltOV5t05wCdbet4nLP99BMstlPXU
	8EJlD9KZz9LGJgexn6NWjOmtw/5czMI2FWQzkKcGlC/sqI542yo+tT5sd2B2Gld34PMz4dePzPY
	XepfZ0wLKga2wCqWCnLwHgmJQk2wIa4usZvQk+ce38yqeLHXFofrprlxds2BDpgZFnbwNASr/ih
	CcV904ynsFFsvKCGqDgE9aFF+00V4fbeJY2GNuLtY7ahed55hSZ2TN80ZTQNq374RRKHqopaihn
	2gRQhhsq3yvqbROSB2wT/J0csUEsJSAYq9zv+T876JWlp8YlIRlMvk3yzOcQwL6JUp4hWug64f+
	KHjcjVUMEBSgbzFWRlqdCuAJXEsFOPuP8yJonqMwHP6/fmt9xzXGM8XU3JTWFAIgwathYyNSwj/
	/XT7tTq8FZJ5Ps
X-Received: by 2002:a05:620a:46aa:b0:93e:b729:879e with SMTP id af79cd13be357-93ebd211b26mr3271332685a.23.1792053572045;
        Thu, 15 Oct 2026 01:39:32 -0700 (PDT)
X-Received: by 2002:a05:620a:46aa:b0:93e:b729:879e with SMTP id af79cd13be357-93ebd211b26mr3271329285a.23.1792053571408;
        Thu, 15 Oct 2026 01:39:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d702a5sm1175500e87.15.2026.10.15.01.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:39:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 0/5] arm64: dts: qcom: support SDM845 HDK
Date: Thu, 15 Oct 2026 11:39:07 +0300
Message-Id: <20261015-sdm845-hdk-v4-0-b532b9f4029c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACuR0GoC/3XOzQqCQBDA8VeJPbeyM66jduo9ooPuRy6llltSi
 O/eahAKdRn4D8yPGZg3nTOe7TYD60zvvGubEHK7YaoqmpPhTodmKJAEIHKv60wmvNJnnkuiJBZ
 KIqUsHFw7Y91zxg7H0JXz97Z7zXYP0/bDIKRLpgcueEZkIafEGpvuW++j26O4qLauozDYpPX4F
 UCAXAkYBNKilKVEG775I8RLIVkJcRBAQZorLTSQ/SGM4/gG0WdZQi8BAAA=
X-Change-ID: 20260122-sdm845-hdk-9466530c4267
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3240;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cUEtfwQBEjXbHcPZpAOE6asYzQd+8XLLUM/ii4eK1g0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq0JEviP9RdeTirXBNA2pdyhEOltu2yhemYxfHV
 L6uBxMfk3iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatCRLwAKCRCLPIo+Aiko
 1fu/CACI2/FqRSfQEHGxwfJmpINESPG40bjGiqCq6KnndpmBRewrkpuTbTnM7HVTTd/lJ9j3cHR
 iYmH48sDDRl9HXcamw2wZ4z5romg5oef5uhnjZJBGSPyKGQT5cc2CMyhjy2sBj8GWaAVjDceTV/
 H03eC4geCCIe1FgJ8tZBHUb7dY1pRGjJnjtZPv71CTMYICUhrhOKunuN5mgB5gYH4N8t72NdhZy
 Fly4YkJXyTI7AnoOdLE8HeYNDlwbQX10lTESSHyruDb92VAU+McC/W9h/KSdpBar2fxzi4r40Cm
 Duj3LA0OMUnVF0jerGvPDlVZqveyjIuJYZaOyRhK3XgZseXt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 9ZbWzYE_OQ-duREp8hgIs9tYpZRe_wce
X-Proofpoint-ORIG-GUID: 9ZbWzYE_OQ-duREp8hgIs9tYpZRe_wce
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNCBTYWx0ZWRfX0wki3UYbuoFs
 8lfi9/WIdlkOilkYcKJ0iGxhAmRtjEXgXfl7eAIFnA+sDg4kK2VjkFu23ghoOLVGsbmUQ63OxBM
 RxRtwuYULuB+L+lLvUIFk9V8uQs4MZk=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad09145 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8 a=WDvwZioAV1Qa1_QZ0V8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNCBTYWx0ZWRfXzwEBrywailpR
 tyLdzc5GIiAoqp8y15L+eIaHw7VDh/+PRVFusk5vNQS3iPLLYQkCtZgfcP0w2wujxwsGQON9YmN
 w9tEQXYXUABFEL3Sipv7kFd7wq/XoatcnIRJvakDXRcguW//gnZhTARPicPe+WPUEyuML4kpz6q
 H+nzmqChTPhUD41Fgte9yZt1tt96F1WnTvmQ1xOnXxLDRbD3pSWN4WeJBMDrWWBu5y10ChAt4oZ
 r6PPM0o9deonQKpVIZHnj76jEIuVGkmhM2jB3DdDp0LJEgrB9llXKjTKgoAgFL7BGIpws3lbn6H
 pQKJ9f7GKtvqPO+nQA+X5lK8v/8/ILXQJG92CDdLGHzLDWXyynnLP5iFuRHQrt46IJJeiOnrNIW
 icr4BUhZtua59Kj/uZ33LJm+waCC1cmLpUd2RSRopVYbPxU7GbkwktSzz1EsRGt5rTDNzd7DFYB
 gr6PiC8ogizD+RoIMIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150034

Lantronix HDK845 aka Qualcomm SDM845-HDK is a hardware development kit
for the Qualcomm SDM845 / SDA845 platform. It uses the modem-less
version of the chip (SDA845) and provides a rich set of the peripherals
and connectors. The DSI panel is an optional addon, so it is being split
to a separate overlay. To (hopefully) ease merging, the overlay is split
to a separate patch as it depends on the panel. The base DT doesn't have
external dependencies.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v4:
- Dropped backlight from the panel (Sashiko)
- Corrected GPIO used for the Home key (Sashiko)
- Corrected USB PHY supply mapping (Sashiko)
- Dropped backlight pointer in the panel driver (Sashiko)
- made driver more robust for a single-host DSI (Sashiko)
- Added comment regarding USB OTG
- Link to v3: https://patch.msgid.link/20261015-sdm845-hdk-v3-0-1c179cd0d16f@oss.qualcomm.com

Changes in v3:
- Dropped mipi_dsi_device_info from panel_desc (Sashiko)
- Added comment to SYS_BOB (Sashiko)
- Corrected commit message for the display card, dropping mention of
  mode select line (Sashiko)
- Link to v2: https://patch.msgid.link/20261014-sdm845-hdk-v2-0-6d0b4b42f267@oss.qualcomm.com

Changes in v2:
- Dropped MDSS reset patch (Konrad)
- Added panel driver and the display card overlay.
- Link to v1: https://lore.kernel.org/r/20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com

To: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
Dmitry Baryshkov (5):
      dt-bindings: display: panel: add Truly NT36850 WQHD panel
      drm/panel: add Novatek NT36850 panel driver
      dt-bindings: arm: qcom: add Qualcomm SDM845 HDK
      arm64: dts: qcom: add device tree for SDM845-HDK
      arm64: dts: qcom: sdm845-hdk: add display card overlay

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 .../display/panel/truly,wqhd60-nt36850.yaml        |  98 +++
 arch/arm64/boot/dts/qcom/Makefile                  |   5 +
 .../boot/dts/qcom/sdm845-hdk-display-card.dtso     | 109 +++
 arch/arm64/boot/dts/qcom/sdm845-hdk.dts            | 825 +++++++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                      |  10 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt36850.c      | 351 +++++++++
 8 files changed, 1400 insertions(+)
---
base-commit: a7d52d51b31a58da686320f5e4edac74e2dad682
change-id: 20260122-sdm845-hdk-9466530c4267

Best regards,
--  
With best wishes
Dmitry

