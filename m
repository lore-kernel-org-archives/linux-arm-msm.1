Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4F33AD539
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785485637; cv=none; b=GaloivgY3YHtvkQ+PVwcVWkJDe5rpgh4+Hk7FH/tiryPFYMbuz9Jfo+wzo2fb6OO/l0BlluPnPfi+D+dTqSmcrzihxgG/KNVRgG+O2AdDU+bnfWuptJpROjstyyY9XdkhBcutiy8Y5YAfelM2bfTFSPkMrzsOZhBQ6+W81P3q8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785485637; c=relaxed/simple;
	bh=we+DC/08M4N7EVgA6SraID4DmZkWSjnOzGNLaszNwyc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jSVOw5HQ1v9yF8jwMy/QKmVkUfuw19sHMGB9EvwEkGbfdvCDK1ma9Ec22Y7p766BhHuwlyucaK0D++/X5FDbf6MV98ePSdAmQNcXZTnKj3DHDKj94aK5H9MJy2JD0B7Tus79NMyyULYECwplmNnd3SYtTpJL9K54AQNxTq1v7Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L9lBj2q/; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L9lBj2q/"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so508312f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 01:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785485630; x=1786090430; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vCNkmuNJ+jyrMeSxC0r34tia/dGpyDz8rIS27XFQHTQ=;
        b=L9lBj2q/HkhgW0cW5VEDvBHU72HeFAGuDTwr8oqxeJa5GP30qULrd/cc0nZO2PDYFm
         twYMZePiE5buPXx6+ZIrgPJVFeALOPqESwXC8LO66K72fgPqys2sO3eYN+1XxagngDac
         VHzanEOFhB0h/fifsWR6XI3IRapmhZi6dr04HpoGbehFwdkFN78HKdFR3tTF/YLUhnGU
         oUyMxHiPhHjRvDDcbdUdkMDr96Q3haJhRDPQbCFQsLSMdiIGbkxwzDqge+BXV+TKhDjG
         AFySv32Qd9LzYpk1XUPdHLGiuL1nT766iDOcpWtVCvJpFXuLyWqFQgOgGmucb6Fz+CkN
         lI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785485630; x=1786090430;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vCNkmuNJ+jyrMeSxC0r34tia/dGpyDz8rIS27XFQHTQ=;
        b=XYXIszLZPA/6Oi5QVpyB3LMWkNIWNhwrf90rjVqHzd4tKX2pEgZbNi7K6Gn7PdFLNN
         G7IMQHC/ilYHckxNVocQUaLwn5Eeu1MZQtIWgroTDoW1WW54+o1b/7IVyS1afHgz16pY
         UEzxki34+XIie7W65sf/6yIpviYAps2Bvi/EuE3z+5e+h/dbVYz3b5m6h67Hyjyw/rnT
         kiB6vaaIIPMkyxE+95Cb4j/eRildrEuOsh9U6e9w1BgtoobAL/5gw9rQDsyGeY8wB1ww
         NXvSRJP9E4NjweE1YWtMRE1ojEA5dmBM/ECLHruqgdUFjb4gQdrfPbusOHvlH3z+mc/L
         GNIQ==
X-Gm-Message-State: AOJu0YwoZ76SFHws9NLMUNKEYuQW1iduZa1PrmrZtccOVgLAPbcHcms6
	5UP13mfw8KCSeLDvpR9eLEQ6FxE9mwkTX1hxj6kCNNm6ozbnlcUf6pLOLd77xptc/4I=
X-Gm-Gg: AR+sD12xDcHwIfbzmnU9GPRBFgvWz1Gz5PDdEgod8Kw19wQMo6fjKSkeKbkxbVO6sqF
	dyb6B3MSgcpvhEjID63Q1UU1i9FOx845MP4Y0NRr/NN8fchepGIffiPaZ0BLkUjfzkoxap54JPI
	WZ+QgIKQL0/qaithRe18+NVSgivozXBN5AtQ9txR1JoVQYtdyWOCrp2SRHbo1Oo0FZ4lqTfLn6l
	uAR/HR4Q+b8q14LypTAxOSntWg3SxJZ1FKI5PHXIClFGrgZbUARbTDRSQBMF3hGcKRpVcC6scjN
	n7CGFQqeV7ANoPmGsKjwtGD3r+UTJw697MA46ot/c2xNLioSIpGUxI2GdzqaQyCvC4UnE3TTNFD
	NsARL3+lzBqs3PaEtJZ19nnnNu9oP2NSuiOHYX6AZf0ImqL9RSEsamajzkwYctkl0Zg8ATrPicF
	x5W7hBd1D0umoizVIOIflqm0UcLPZyhOq2CW8fL9AA5JswabvKKhZk6w4Em7u+jdyE2gwoLgzF/
	22AkFTbxBV0hBH0XCcg
X-Received: by 2002:a05:6000:1ac5:b0:474:5a38:f650 with SMTP id ffacd0b85a97d-47fd2abab1fmr2508864f8f.3.1785485629851;
        Fri, 31 Jul 2026 01:13:49 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd4562a38sm1881226f8f.21.2026.07.31.01.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 01:13:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 31 Jul 2026 10:13:48 +0200
Subject: [PATCH v2] arm64: defconfig: enable the necessary drivers for the
 Ayaneo Pockegt S2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-topic-sm8650-ayaneo-pocket-s2-defconfigs-v2-1-fc409e59290c@linaro.org>
X-B4-Tracking: v=1; b=H4sIADtZbGoC/52OSw6CMBRFt0I69plSoRRH7sMwqOUVnp+WtJVIC
 HsXcAcOT3Jyz51ZxEAY2TmbWcCRInm3gjhkzPTadQjUrswEF5JXQkHyAxmILyVLDnrSDj0M3jw
 wQRTQojXeWeoiVJZXsqwLJW3O1rkhoKXPnro2P47v2x1N2vY3o6eYfJj2L2O+eX9kxxw4FDWet
 MmNsra4PMnp4I8+dKxZluULWEoTgPMAAAA=
X-Change-ID: 20260728-topic-sm8650-ayaneo-pocket-s2-defconfigs-7f07659486f1
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1696;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=we+DC/08M4N7EVgA6SraID4DmZkWSjnOzGNLaszNwyc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqbFk8LOyHWU3lJGNh3ljX/hFGdeiGirL7L8In2sy1
 luUHEsOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCamxZPAAKCRB33NvayMhJ0UUvEA
 CcwlLcfUWQv6VEdORKw+ZBSvs8/mpeRUzVNYfuoBqHpJEsTKoJG1HZUQ5TJJtJEuTcZn2wIgJ8aIfv
 TgbkzMPVttmlcJccgi3G8X4VVj5s07Qn1xFVIWJGPen35tM6X0q53zbtSKpVDNnUXC6kquwvzQrWlB
 cfd8d0/Q7rNExfC/NmATbCZ3Eu/Jwwru3s1rleEz6p0a7icDNNYHXYzjQ+A7sizJp+qPfAIwxSKNy0
 IXB6JezBwHbYTbb7v8hXtE5c8Yw/HCaQk6+Dk+svyhZQyZ4hsjfC8hLhRrRqWDK9B4JkFCwF2SmOqW
 OcamhNcNXSOT2F8cO2r5gXQSvaeYiBfE1YFVURvoNgoyVorMaAlxmYe1kaWHkmYOBYKvX1lpXNCSE3
 Epnom/1G9bF0JAcYEKlZJp7DzBV/D0OogYX5wOZBR8tKhDAidVA/Lf0h1sssy8D9lIs/4xyDErNPGM
 LivF2/ZEFKggUApfLpBL2meKd99Zi/jDer4tv8WTRAa4RWjSu0VlDSbjP8ELD+Tbfw73vsuP++HMUt
 i3E09uhWvSLKj2tYtZUAzde6Vv9EyiG0wHok5z/XIn0A0meyiDP32Ia2xVBU4+ZohXHuMSq0BimUrV
 kfqNC6ESo981GrL3Twjn27Wk7I09webpuwPPvtMs41ZTehODXBWcvBD9YwAQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Enable the SGM3804 regulator, SY7758 backlight and Renesas 63419 panel
drivers as module since used by the display on the Qualcomm SM8650 based
Ayaneo Pocket S2 Gaming Console.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- squashed into a single patch
- Link to v1: https://patch.msgid.link/20260728-topic-sm8650-ayaneo-pocket-s2-defconfigs-v1-0-49e3ac1c8ff4@linaro.org
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98..87a6c50bdd14 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -895,6 +895,7 @@ CONFIG_REGULATOR_QCOM_USB_VBUS=m
 CONFIG_REGULATOR_RAA215300=y
 CONFIG_REGULATOR_RK808=y
 CONFIG_REGULATOR_S2MPS11=y
+CONFIG_REGULATOR_SGM3804=y
 CONFIG_REGULATOR_TPS65132=m
 CONFIG_REGULATOR_TPS65219=y
 CONFIG_REGULATOR_VCTRL=m
@@ -1026,6 +1027,7 @@ CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
 CONFIG_DRM_PANEL_NOVATEK_NT37801=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_RAYDIUM_RM692E5=m
+CONFIG_DRM_PANEL_RENESAS_R63419=m
 CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=m
 CONFIG_DRM_PANEL_SITRONIX_ST7703=m
 CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
@@ -1062,6 +1064,7 @@ CONFIG_DRM_ZYNQMP_DPSUB_AUDIO=y
 CONFIG_FB=y
 CONFIG_FB_EFI=y
 CONFIG_FB_MODE_HELPERS=y
+CONFIG_BACKLIGHT_SY7758=m
 CONFIG_BACKLIGHT_PWM=m
 CONFIG_BACKLIGHT_APPLE_DWI=m
 CONFIG_BACKLIGHT_QCOM_WLED=m

---
base-commit: 0d33d21e47d9dc66f91e44da3fc9220c74d93df7
change-id: 20260728-topic-sm8650-ayaneo-pocket-s2-defconfigs-7f07659486f1

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

