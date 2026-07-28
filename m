Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0CF419FCB
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 08:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228815; cv=none; b=gAwX6clwL4MYI8v4nGf29Hr3Id/oJVNRIWQ68kgVvWTL0YXPj/1Uq6K7iZwKSniD876dHlLYcR56fO9R14uycEhQdJRgzp3MCA6zkqyLcHjRBly7cl8oDxKgGdoy+os3CAE9M5iMtBli5wAQacjCXoGqKeC7goeAPpjdv8YNGmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228815; c=relaxed/simple;
	bh=VEol4MpQ/vd4sMptySnGnfMbIc5Lchl8dn9beinFDNA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ucTn/6u0wUK34P3Xw38HskYivj1/oYWH/FS0PPsM9rtkeN93VMWwDK6tsWHVb/fd8b6i2yxTSHFL1N4LXgQm4JcikxzVDXE9tgBlaMnzcYSkQ4PHxGTkv//F0zDJtyS2vCJebeh3GvjrNLemJ0ZV7tFO3Ql6LXtIS+AP0oG3NQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AwE8vT3L; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AwE8vT3L"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-476a130c138so3470751f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 01:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785228812; x=1785833612; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dcBEi/HRhSIINJDw7B0mIDw8ehwzIYBCeaRJCG9G0Is=;
        b=AwE8vT3LngmECCsSlPFNKxWgN96psqCxtJfDtPpLPHUGmm+Vs2I0fzzG3eJKp8WziD
         Ft149rjtqLGxmOtQQBvtFwdgBgwjyZQh62aN869tmZ+JU/VH2fPUvhcf8sFe0ueTMVHb
         zXcSq2YA+ItGkeLREaxvrlb+MRHVi1oxBlFCBsrJm/XmTTFHGmc8460w03G06RvpD2Qy
         A/OfAPhE5M/4NCH45WLL0Dbhagy4Mbb3YN3kmQDStW7FrIA890hDz4IuR7uZq+h05Zbs
         dMxcWtQFWIht63uZBlwSvPi+opn3Q5Ocp3LsxM5jeUU+15QJLod/vkpBe/naHkkebKgW
         PWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785228812; x=1785833612;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dcBEi/HRhSIINJDw7B0mIDw8ehwzIYBCeaRJCG9G0Is=;
        b=MZ5yhO9O9mwjFtnwn4+BJrBBrfyECZyF0eVXdZjxd4lzXuVEy/s3vL5Jplo5RSaOen
         Q67VKBs/24YMNOCSJiurRcD89O7p/chwMqLDcmMckoYgMmW9Vro/lOUK31eT/H54O54r
         jgaLl9UMFwgbHeFXhNKMmh3XOZoqdkHAFF4jmI4fKbFRMvwJpLihL9xarFWbZN/WDmfR
         9/lsvSo+bT4KFzthrKhUHo7cdzJQzA8lX3p0sqcGCpL0oDcpAsQF3eXw6WqWwpISOq68
         +bNe7NRONffqsF0IzTfqUoG3PTKUzAn69v6YxMQAyeKdWTND+95cxZ55RL6Hr33h2xxH
         WDQg==
X-Forwarded-Encrypted: i=1; AHgh+RoMR6Ep3O3iQ8OOb6tT42qVHLiSmeeRYbZAh5ofyNy81vUHy3+gIzQcOHq8JG4BZEFrLKqsBuLnyxrqP5tl@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6vCi+qrSeH2IK4AQFw7krzcqm2dXqZs95hHO59tRgaHpkG/fO
	XkVg8Y3/IRryTWlBj84WjIb+hHzJKwxl2Bc5KT/PEcC1a4susQVTUbRJavs3Tn6/39c=
X-Gm-Gg: AR+sD13TBgezpZ0h9TfCOqivcIy1ZDXJ9he4oBGzRUYeSOKJeOfVgmvKE4qa+Q40awq
	A1pyPRPuH1W7rOz9xW6rYcD3suBQTFIYejTL0Tp25tfDnVEQuCVwLVNxzXIxlKpj4JONCTSmJ5W
	UkfwwprVLXaFu/Rid6oRHI3KrTOO7M3iZ1l/oJSSK/AI/N56z/XoVb5gDiXEolaOzj3jgSzmlJK
	6dz3MzRaarMqQcQ7NgF5Wgs3CwkYhhUoME1JmARDNxWstsHtCljGwfVzK5LB+rrPCQMx03vFTb/
	P6+zs9tob1Yox9Cyn+97JKrj5sXaRiCAp5QHSlwbY4qMRXYWN+kaN1zUMODkyc1Csn5ZgssQSsY
	HAPqhtT+0dfUgXbBQeuC+hNdBgiwk2sdPGe+wMQK76+jvBsaoXbWi22eBBSNOJCAdXhduFy7iQg
	MGJO3/45z9lcnP9Ex0bH1NQlY=
X-Received: by 2002:a05:6000:4009:b0:47f:8b05:f65c with SMTP id ffacd0b85a97d-47fb1ef3eefmr1668840f8f.59.1785228812341;
        Tue, 28 Jul 2026 01:53:32 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5c4sm56430085f8f.8.2026.07.28.01.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 01:53:31 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/4] ASoC: qcom: allow SM[456]50 HDK board to play audio
 via I2S
Date: Tue, 28 Jul 2026 10:53:27 +0200
Message-Id: <20260728-topic-sm8x50-next-hdk-i2s-v1-0-2393a0fe4aa9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAduaGoC/yXMwQrCMAyA4VcZORuoGavDVxEPM40uit1oOimMv
 fuqHr/D/69gklQMzs0KST5qOsWK46EBHof4ENRQDeTIuxP1mKdZGe3dl85hlJJxDC9UMvTBt0y
 dsAwMtZ+T3LX83pfr37bcnsL5O4Rt2wH5Xf16fQAAAA==
X-Change-ID: 20260728-topic-sm8x50-next-hdk-i2s-6d63c25eceac
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1265;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=VEol4MpQ/vd4sMptySnGnfMbIc5Lchl8dn9beinFDNA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqaG4JQSChPtDcstQSPzSLHHf4mfb+0NHrSaUHkWq0
 c6H2hqiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCamhuCQAKCRB33NvayMhJ0VbmEA
 COiD3RO78D1f+Sr4OV8rV+x0Fl7zE0t6YQIgyHZojtRrG37fNy6QfqzHxlK0aJeY/KbqAhzGzt07gc
 vI4tzfBmonfGjPvAcIQcEnkieoiXGQqNXBRSF5+psugSipSS/HTnyIKMLBkscvSIPg0YwTepuABn+U
 nFkHn5f3f43eofxolCvUC+oZVwfOJvGsUuNwHpnnvuA00eoPw8WvhKkMbI0x+Gtyzy37OPD0GBrT2Z
 Xf8XqLtJbe6G934drFXqfKDh7zGh+4cgA1rdXVWJJyquBywDmeUD6z99YEAp7jKfpWpUGiqDIu3vvz
 YaD6PT6npYoIvgd+NnZeivyKZcnRhc98xavZYkkbhikvdZWaMdtE4MVDaTzJdB7vHhHXvekaJizrFC
 c8lAEWhdjN+SGZujrpPSg/pz4lRHkk+OWjLLOB1Hp6ezLt63IOqQ2ex5XKtO9JSGaBNZsQyWnPyY2M
 JzuL4PGL3kZrRp2zRtP9xLawkko02uwBB3UrC8sz6EKA2X7fSyL2I9Ph02qmuWdk1m+eFmRBKVCl0t
 hwvkzhDy6BRPhLUGmL6QHTgbF+8FaoiMHsLVb3qjzhNlnZQbfipdYkHI+rWVTZ1trKOpOkRL8bXhBi
 LgfT66dZEH/IA9kcLI0NVwCDUAW0uTZMDT5WT6tp6ncW3/kkExDY3hi9MBag==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Following [1], this adds the necessary settings to setup
the I2S link to the HDMI bridge to allow audio playback.

Depends on:
[1] https://lore.kernel.org/all/20260724182446.1484894-1-mohammad.rafi.shaik@oss.qualcomm.com/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (4):
      ASoC: qcom: sc8280xp: allow setting m2is clocks for SM8[456]50 boards
      arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI
      arm64: dts: qcom: sm8550-hdk: Enable I2S for HDMI
      arm64: dts: qcom: sm8650-hdk: Enable I2S for HDMI

 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 36 +++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 40 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 36 +++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 73 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 35 +++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi    | 40 ++++++++++++++++++
 sound/soc/qcom/sc8280xp.c               | 18 ++++++++
 7 files changed, 275 insertions(+), 3 deletions(-)
---
base-commit: e32a7107f6b53deda611de9d79b150f70c7aa74f
change-id: 20260728-topic-sm8x50-next-hdk-i2s-6d63c25eceac

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

