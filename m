Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D15B4E0219
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 23:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792021891; cv=none; b=IbR/CYOXh88U6hFekZ5FjWLZT20/Hy6dbw1zzL2PQj6YsreZgDbTyuTXJ/rE47W5m4iP91mPtu221rAA8HGmuPwY2TpZpIn/hcy+fg9f3YXWqQRbbUgTcN717b+81kVOjx7siF/TEAuCcvJLqSs9638vBqwXX1/JUjrdwoHSqsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792021891; c=relaxed/simple;
	bh=RP7WTrwAPt6xLoUSEeNrq3/jN4TYEWno3wYkzoYf07I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FbvB/EpXlqylp/TGj/vimdkEqu1FOloJVrFbZ/pO26DR886xYCxI9SJQGoffDys94Plgj4ydd0XeL2Wz8XcnYIP3TvikmVBmvgEtXs4op/BBJvNAZxC21ZV1HupDarSwg5CtUHXIZ33iD4Mwsf74V2NaVYaxZz5XRHyhkoTgySg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a0KUcVxT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kSN2QYAa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a0KUcVxT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kSN2QYAa"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EMfldZ152375
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 23:51:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LmbkMsHPiT3BBG3ZeJHnzx
	QOZZxaOSDnnOlylj3EKhg=; b=a0KUcVxTRKjRJt03yTKS/lmKIBinCps5dyUSph
	PgkzVgrQqMzqMA1vA7n+DhN44U1Y1kOeLZlliEWDwXjlCxE1A3fk5EwCffryva/2
	wYyVfpVdlq0Wb3U4ATwv8n8/OqsFWBum0GqjuewmjNP7VlrUjDRX1RbHY7P2rzBV
	fQVqZII6NheoZxCbJD+EnZq6fG/4vLM2XEzZOP2bRkwiPkWNuqz5hm+g+F3Y4fkb
	p0xEDtt9EKIKyiPrFsHqP00qUig7JJ2K/C1DjUFwZ7ue/AtQjkawvlmih9w6c6X3
	smdWPHgDBHa0r7nscCd+rRT5ZqIc1w9LF0wtpMm3ksRF/sDQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha7aek49n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 23:51:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb7f9bb86so957786885a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 16:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792021887; x=1792626687; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LmbkMsHPiT3BBG3ZeJHnzxQOZZxaOSDnnOlylj3EKhg=;
        b=kSN2QYAazX0jj12KI79xsGr/VcIx/7puSMdMqFbMa0MUGyakO43hVR5KcgzBWFl4Ac
         GKL6Niv000Jw8XMSnCyugYMHu+Are64M5/Xu2lB6JC51eVVShgpZcrUTbUa1CwVKAS25
         tr2U6Mq9OmXNSWFWjN429ktIPmoTnI1LxKlNbbOuynT96j9vjtSXSt5iSgY/dNBr84ma
         LtidW+ID0hYs9kpVtOy7Ao2j0hu9OZ5cH5ylVEkmUTcRe4Qq5zGUvfdyFpZJS6heqwjH
         FTGLP5DkJytPAsjumtEeYhaQhMaUxY5Hzb4WovdeKuW7W9GgkuEBbLQvqMVGmUqokxvl
         rwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792021887; x=1792626687;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LmbkMsHPiT3BBG3ZeJHnzxQOZZxaOSDnnOlylj3EKhg=;
        b=x3pCRKmZv6oTlwAYaUD5uoRvXgMrIqUbHOL9sxzM6gq4KPDejMCAG1v6qDjUnTAkKQ
         XnRaopQMwjAq1Ez8cvqOT5MchPTKpGJi2vQXVF+yrezA40b3dlXp+LEDAMq5PY0L0x7V
         ULSHmOzUVXbUGOIcZ3SjndnHgQxaeOrbH+37u7fv7tkXDGXlg9DptHn9K0qj6fY+W52x
         R4b0C7r/H0zHNQFzHShyruagqXwQ+SIOi5Mq0V/YEaWoZtq6W+XaschblGdiSRdsMauu
         yUCb+7EGtLYvJc0c3i4Z83SYhxp2k/o3XxJn2u5uWgfvovIagZND02Z04ixSLeQFqIMG
         Z0dg==
X-Gm-Message-State: AFq9FYIa2Zan4L3Q+Wdyv+JVfi1V7VK55Ahpql6Tj3ZdGwq7GivxDI8L
	iFBnR/xIzhcmkCVIZXo4bl7APLeEwWTAWFU+G4pqIFonDvQzzlYISEdgbkCJl7hmZvLoZLeiqbH
	gdJQ7eIfN70BM2ittct9yAozI3X4vhR17WTJVpsO0UCy8kDDe7kKD7CkKlcF6JZq/d9Wi
X-Gm-Gg: AYBFou1X7Tde2cM3fiR1XthImvNwR5EHPwDrENZ1ugixeKbytZ2oRFoWcW+1sR/iz+Y
	OE68BPgYc2Wr9jbj2Vva6rK0J+xN9OMRUIn7sVCE3wd01yi5V/7Lsm+8cdvBB35sUoxwP2WsPth
	R1/be0P3/YwPF0nsFfVu6Af3xIP8T2Lv6/Aj8/mdzFW7YQKCE3HIOem6LdexIuQrQQlZMYY57Bm
	Q0IF7Ms3RGLPd1XLu646x53JLvThModF0DCXe5Zn+a/8ULbNG8iB+djbz/KQSfZxCeqakzK8Iy0
	HLLZ9fJnbnz5xqav6ZEDQcNvNHACdl4nwyExxa+rBbraH9aMK+32vav+l7b8Pr9z4clILOpGLNB
	/zXQtmqvZh7ch1C4giBGCdK7DnnF3weUGMEjDUHyt2OWSDfGlOoMz7yCoBXdovUxDSmF4VUmiM2
	RRhBJERk20T44p
X-Received: by 2002:a05:620a:6cc3:b0:93e:c12c:f128 with SMTP id af79cd13be357-93ec12d059dmr2761717785a.67.1792021886694;
        Wed, 14 Oct 2026 16:51:26 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc3:b0:93e:c12c:f128 with SMTP id af79cd13be357-93ec12d059dmr2761713685a.67.1792021886184;
        Wed, 14 Oct 2026 16:51:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3aafded5414sm2285281fa.16.2026.10.14.16.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:51:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/5] arm64: dts: qcom: support SDM845 HDK
Date: Thu, 15 Oct 2026 02:51:12 +0300
Message-Id: <20261015-sdm845-hdk-v3-0-1c179cd0d16f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHAV0GoC/23OSwrCMBCA4auUrE1Jpum0deU9xEWbhw3aRhMNS
 undTSuIgpuBf2A+ZiJBe6sD2WYT8TraYN2YothkRPbteNTUqtQEGCDjADSooRYl7dWJNgKxLJg
 UgBVJBxevjX2s2P6Qurfh5vxztSNftm8GePXNRE4ZrRENb7A02lQ7F0J+vbdn6YYhT4MsWoSPw
 BkXPwIkARXrRCfApG/+CPM8vwCrvqJ+7QAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2832;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=RP7WTrwAPt6xLoUSEeNrq3/jN4TYEWno3wYkzoYf07I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq0BV1C2bhr93FymPWgE8pLAQxduOhlAe8Ec7rl
 oEbFE3/5iyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatAVdQAKCRCLPIo+Aiko
 1fU5B/9EQtqAkzf2qdc1i8rt4O/Z1ucIW8ZYZRV9y1fwjJK55oSjCDiiQVbvMdZdC0kmB9zn12A
 XiQAsg1i4PTCWWmctEQok0A0MhuC+qs9sxOxeVgjlkTfQWu0Hm3yRMiA7zDQmH0wrmgfHzaVj0h
 0QS92wvtu9dcrbG/4WYhw/PU3G23q72owT/KbZtGu7LaifX73BYrKeOYFAhD7LAtuqegBUsQUqX
 3i8ZGo+LFJUHNE3MfrgZl2trBnP/GhzmFYl2Gcm5umdSKRTwiKs6d6Xw72Za/4K/f0doVUOxR2J
 xr+f5rdhEnSu+GFsqydNiKjnZ5QOKMCQVv5fB/i4YYjid8ND
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: d_XlyRX1HmDOmFfSWJhgmbLQ0ENolj3b
X-Proofpoint-GUID: d_XlyRX1HmDOmFfSWJhgmbLQ0ENolj3b
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA5NSBTYWx0ZWRfX9zdqeYdr5hEM
 HOf8pO/GyuFLR+uoBB2Z9d+JsnSIF7c5Dv1GujcE+y4fyEh5xiuL9MAwRhMRS8sroCBQnlxtoYX
 wM9gU2N3QWFq1lQa6W+mkOPqLtg5Bek=
X-Authority-Analysis: v=2.4 cv=NctzRGD4 c=1 sm=1 tr=0 ts=6ad0157f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8 a=S_NnZ3hT_RIKTG7XCKUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA5NSBTYWx0ZWRfX/yfnJHsAcqdJ
 9qg4Fu8hSeB3RF6Ut+C6rSTw0aIuaaH/lu5lULo7MGnKxN0SvDtffldytTx2YZGBUFtmwUwawcC
 yx+t5iH8g1KymUQRKllgiTUy7Zhv+I3dcUvAvbNxwjDvio5aZ0cRMNeMUJ3MSVsqOpD3r60WNtv
 ejp6Rv06izoWWvCsjEhvCxg7OyL++UWJwoxvTSWT7NQIXsFNt9oaUKPLhkYrTxXiHXZHpoP8iMO
 rpJrzEfWj3I65uoNNSQtNiOVVbq+iFF4vupf7r1GM0K6pSFNl9yqpKe4Cx/Fw8NjhoeOU9fYngs
 /R4nI71zxrWtA6rK01i1ZfleMzzdYtN7ulg64H70MfnrtdwP1dBxiOrSlzkxEUw0k2+d3B7M16d
 gshzhKESMh0gCSuPqOUG0s7mz4lYPoYWlQDjEpIlJpkvwPsyyNUlVhiD2Nfj0VjjYtm8QXF68WP
 5meCT9AVdDw3I9cA/NA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140095

Lantronix HDK845 aka Qualcomm SDM845-HDK is a hardware development kit
for the Qualcomm SDM845 / SDA845 platform. It uses the modem-less
version of the chip (SDA845) and provides a rich set of the peripherals
and connectors. The DSI panel is an optional addon, so it is being split
to a separate overlay. To (hopefully) ease merging, the overlay is split
to a separate patch as it depends on the panel. The base DT doesn't have
external dependencies.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
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
 arch/arm64/boot/dts/qcom/sdm845-hdk.dts            | 824 +++++++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                      |  10 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt36850.c      | 344 +++++++++
 8 files changed, 1392 insertions(+)
---
base-commit: a7d52d51b31a58da686320f5e4edac74e2dad682
change-id: 20260122-sdm845-hdk-9466530c4267

Best regards,
--  
With best wishes
Dmitry

