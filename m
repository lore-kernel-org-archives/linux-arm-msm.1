Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7782A382381
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 14:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790950913; cv=none; b=j2un4ynew/eUYRzrDnIe7kMp8Dc/vSd5gkqxe51xg/EsRPQ3PCovGVQHN7BPf42lV0+M9Blu/BU/PzKa/OGZ4TTQxZ70Gbc+PrH/0a+QXJ0nNskx5QvpH9X0aJTEDeWW0ggacPmQHaD66udV9pfmCL1MrNegCqW8TbA3c4ApcKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790950913; c=relaxed/simple;
	bh=NrQQe+ffbbsZUbQfuVMBkJLb7Eu4aQxcLMmswA46ZKM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l3weAr2jEynDxTVCaq3Ge5dNwtgPeRHget73Ff6Yyvxrf62Za9pyKgODR9wlY4LvvRkI0BUgqGCyEdNktotk9+fFFQJpatE5q/z2Y2uLjA4H7BgFUYL1h3ozfihThRHBybVjkHA2f+A1/yoUJHz7/8BR086bF7tlQ4RgU0wNVJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=4l2Spv+b; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="4l2Spv+b"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e028ed54dso13118066b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 07:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1790950910; x=1791555710; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Hi8AlywePpuCp/I6l8npdCyUnuCu9uLP5sJkPsGRVk8=;
        b=4l2Spv+b2KfK+AfG4Kq/eKSs5Mts6yAaZN7O/nqgFK6GWlQRBrZbRcBOOEQEivcbmb
         52KKsw74nAboal3l7e6VHGHy7cRTfo+sWF6NRMdG9/rgcR0+HH/0UqRwbIXw3n8VynmP
         TWBYE3ouFX/Nn+WarlSEAJXPbW5H0fPLrVm8kSI1+PjNFKud71hQrdRkhvbe+jp0HZZI
         YsPjrsOnwFLq+ISuhOXgsk66AIpmtXBb+1/zoTFZWG19Z5EmD3IsQdVEYrD/EwXsLaSf
         09vzFUCC4nBCNkX/l+tj1dSg1ShnSQ+Ci3ZxvBgFHbvevlrOO7zhXS82pTBCsPfNhgiB
         Dsdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790950910; x=1791555710;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hi8AlywePpuCp/I6l8npdCyUnuCu9uLP5sJkPsGRVk8=;
        b=AmlD78+VT+c0pqFOF/DTo8o0RxhfDvZCK+fjg4Sqc5CPKTVPI70rI90oTNyNdpac9J
         8N5yuKyeFS79zrc5p4Kc9nRloBVajyam1QbJK0U+aEI3FJjnRcp1al8lfkDJdxroY4cs
         XrjduID7DtcTqVeJOH4G/xqBREwPhaIN9hG1IKucDsF+q5L+Ak9YUD/U9BhsW48T5xsc
         EBeF09P9WMUr9fBFcfRyS+m97zZaf8n3UolLQFRw3vbHYp1Uz60Zi3wqCqfWMQGxuGP2
         Crj7T6k98zU0ZCX2b6ks9oCy6EeDtFZkj5NwtEFYSUBLlSjL29H/jHWdxcH2v9CxJSJJ
         Sh7g==
X-Forwarded-Encrypted: i=1; AKwUvByGrGiC6Itx6pJq6SKxPS3+AHfmLEZCsctPbUJhrPL2Qu53+iwJeQy2+NnrN1M/WXSE5vFYi8KfEoklhvNC@vger.kernel.org
X-Gm-Message-State: AFuF++nAV03tqTBNP8+ScM9Z2rCADU1NfkQcLSo4Ry5t+/QbpyU6MxRQ
	SKMRszGw6A0zH8d0Dq/CW4DDnUyDypdiV0U2yLbpINJFpz/rVwWhk5jXH67XqkAsn8jmNVdjHLI
	nOf5EQ2Q=
X-Gm-Gg: AYBFou0InFSwvlBLHybJm5LHykNwGFyBFnM1F5Yr+r5nXvdYEFcF2jsUMz62RtstONm
	o90ljzujBjSt+PGAHVxnN5C8R6Duyrx3VV4Dfpx4VlIRw7aouFDaOSktB+gKz/FKH/B6mKo8n3L
	lGnpUVkurcZekRQsZAdbee8wnzfIO9Jc9clwAEu1ZWWFnLR+k3f6YjDwD30ZIztU0kapb7Eva9u
	C3pUns9wyLmvrMo9vklakM64aY6T4csak2Q45uTVFp50Vq40X6uUK/bn3Jy9IORerZPg7O+j0nS
	fHEAVds0I7i3lrotw/U277LGagUBMnaGo201aZSmVluK/6EmDQWqCiKw/NZ2FEAJuidXzSIV3jQ
	dgdjm5LWMfMX2larYx4auchhSfam1zy9YDgBQV3lcFcmz0DQ4c46AxURPWYqMYaj2AVMImmLNnL
	tvJX8VYNFIlWt8vUyN6JxQRLZhRqwbnnO84FjYtB/eZSIpix9FdGDlhINGKco71fSp+j8la5CMP
	eTjk0NKINBPXY2n05TMcTKcwSZRMgpfklxLVYjdOkaomP7A5W2l
X-Received: by 2002:a17:907:2d10:b0:c2d:cdc6:827e with SMTP id a640c23a62f3a-c2e4af677d3mr241217366b.41.1790950909638;
        Fri, 02 Oct 2026 07:21:49 -0700 (PDT)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf684e3sm89307166b.51.2026.10.02.07.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:21:49 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v3 0/4] Add Novatek NT37705 panel driver for Fairphone
 (Gen. 6)
Date: Fri, 02 Oct 2026 16:21:44 +0200
Message-Id: <20261002-fp6-panel-v3-0-4b80f83bc936@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OQQ6CMBBFr0K6tmba2kpZeQ/jAoZBahSwxUZju
 LsVTTTG5U/eezN3Fsg7CqzI7sxTdMH1XRpqkTFsy25P3NVpMwnSgAbBm8HwoezoyFWtNFpr69y
 uWOIHT427zq3t7rXDpToQjs/Am/B0vqQj4wtjVRmIY386ubHI4nqpuEfFnnbrwtj72/xYFDP85
 4coOHACixVoowXipimdH9q+o2XKzqUoP7YV+bctk22M1bgCyK2EX3uapge/DQfqIgEAAA==
X-Change-ID: 20260501-fp6-panel-3d35c999d894
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790950908; l=1468;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=NrQQe+ffbbsZUbQfuVMBkJLb7Eu4aQxcLMmswA46ZKM=;
 b=+KnsUStWqf+ki9Bj4Hq0RXT697KNdlbH52n35vhI+yqQTDUqeanE4a/XtKcxAs0t19T8OBgMJ
 NKhSTvVvfClBOP34uXjdxonv9HZans0NcThfNKohGCcG8y5/R8RTysN
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings and a panel driver for the NT37705, and then enable display
on the Fairphone (Gen. 6).

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v3:
- dt-bindings: don't use 'contains' (Sashiko)
- driver: Use devm_drm_panel_add & devm_mipi_dsi_attach
- driver: Replace linux/mod_devicetable.h with linux/device-id/of.h
  (Uwe)
- Link to v2: https://patch.msgid.link/20260918-fp6-panel-v2-0-6695c4008920@fairphone.com

Changes in v2:
- Fix kconfig dependencies of panel driver
- Pick up tags
- Link to v1: https://patch.msgid.link/20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com

---
Luca Weiss (4):
      dt-bindings: display: panel: Add Novatek NT37705
      drm/panel: Add driver for Novatek NT37705 panel
      arm64: defconfig: Enable Novatek NT37705 panel
      arm64: dts: qcom: milos-fairphone-fp6: Enable display

 .../bindings/display/panel/novatek,nt37705.yaml    |  71 ++++
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   |  64 ++++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/gpu/drm/panel/Kconfig                      |  12 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt37705.c      | 396 +++++++++++++++++++++
 6 files changed, 545 insertions(+)
---
base-commit: c2cd463d6ee7d55a3ec0719d93c49ff99022d58f
change-id: 20260501-fp6-panel-3d35c999d894

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

