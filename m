Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFCC3BA23F
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785485158; cv=none; b=twb8Lon4cXLz64mAw6hDI+7Cl6am2sstwJnjMLhZBkpkXMewrYygW/9avsVuf5aKpQT8fMNP+2To30udPXHWJTqay3TVRuIFy3I5s2GYJ11g0Y1CBFbR6qcFjVUYMy9BwjNt2BcGE3iU10ri3zsYjiECzADnpoPKJraUAARbOwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785485158; c=relaxed/simple;
	bh=WAcHU/qRwRLrH5rKuY3LudFtEXUDRG+BuozA8+vOgtU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BjZqezWZC9p5ex15ZgFgAug5XhPqZPSNTJmEHe4yBK4Njd5ukUbyQAsf2e6OJzGqyvS571G+JMC32TMg187GT2I0lazQjPYtN5mTcgThfddsxniZ2yLMqra7hrEBzo6gJLMUGuzhlgG1YdDLi7zBlXUNXc6BLJIcJ+Nop1XEGKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U6JWUuRS; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U6JWUuRS"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f707e5d75so465520f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 01:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785485155; x=1786089955; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0r+tq7k63WA6Od6PhYxu6O2aCZ4qlcR6MZ68uJcSLS8=;
        b=U6JWUuRS/MkbORlXaitjJHU2Zn+1lua4j61RsUXuzjwPNth4FBwtr31hxF7niRXnye
         u282K3bRKaqF5f4TK4M2GeeBe1PA9VzxI8WAcADrdUxVo9F77MVGtfeZBHJpT0TtImYs
         Ev62WVKzHgdx8mzq8i80Gbna5cS2Qd0Iqv1HVwVB18+eW4wnGzKhX2zZuY3qAWtJA9uE
         aqT+9sAM07GN+ISq0rYjDqMDjeN+xFOTKaEoXmwkKyvGiKgIJrZ7An+crpKtwRuipZ5O
         PCuAzT11j4q1q6HC9h7mRRho7JQd8Us/4msAqbNxJQ7mcylcma0Sybz73DHfTmeYeqmN
         DtuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785485155; x=1786089955;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0r+tq7k63WA6Od6PhYxu6O2aCZ4qlcR6MZ68uJcSLS8=;
        b=cn2X7lXBSWtbJSDju9SbrRs5+vFgbZWCb1CC8Ok7XRZAqZ+vvoWsEQzCtmcqWjaYh+
         tNjLwsQHbrKTk4iArSGidbTtEYLfaT4W0p/J/WhFNbLN2YzP5jfRCbbbLC7lH5o+L3EW
         P77MKICFNur8t1Ddg0POBNZ+U1M3XcbQc+CqBWMZhMcC0CnrC7GWIoeBJcw9YfAFMBpq
         FUVUSAa8LT9YkNChLra5uz7/fLMmOkxfChHUwEa9VeSowLFBM+Llox+6xPBbAI5fk/uS
         qh0tT/BeNSBNMOqMwr0WbVjZkR0YqVtJZzz63KUbUygrDBr8vtUGYawEJC27Pa1XQbQB
         sthQ==
X-Gm-Message-State: AOJu0YxhF7k+j5xAuDA5NdUMpRGpHUliH/71T4mV455//MygLDQLLwpW
	VO/fLrqjCxjpa53meva3W0cxas6irVoQ7GOibyfLPBp3KY2JzL53L4D5kSEbaloH2GQ=
X-Gm-Gg: AR+sD13rUUw+8uW8CAKkhJ8UC3YhjrGh388lsDzrV54PS9zLj0sHr9OqRgVSVtxehuI
	ONEJKD11ZZpmkplRjivYUrecQ8TgiMfNr6WXVYca+2ah6x6h1Q9wtcpXRIFn7CWCwbdndnBwmGU
	5GPk5sjHw/sgSg06KEk+gX9Mlf3s3+G2oyNw7NZ+dIt2zg4EGiRCqSjkShfkQFWdrtD/vyRz/up
	IlYIhoyfLCXvD9WlZ7DUC51/gFe7cuO9CBQyDlpjcS/ZvJ2qzAAX7n5JjcALV2oT8rhdkbh1Jy8
	lNQm5z94Zxw+ogR0qmQ62CEe3iEetIO49wyTJJr+UGMORb9zvR0he67xEWLKGQ0wkbrbGrVeT4C
	RHXBlgkswZNs6vv/UQrD1xK4dYCSP7OT2m4TbbrwiJHR5h2oFBDy1nbHvWcFnOC6CtKW6w2Nzlx
	hINWFZe0x3q9yt8hgYoK2KXO+dy5PFSVUPTYK02mU1SpLxCim79rnAQeWtBLuvmqEUkPH9gLOVf
	DTsoN7YUg==
X-Received: by 2002:a05:6000:41c9:b0:47f:86af:8fdd with SMTP id ffacd0b85a97d-47fd2abad19mr2575196f8f.3.1785485154641;
        Fri, 31 Jul 2026 01:05:54 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a1abfsm1689589f8f.37.2026.07.31.01.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 01:05:54 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/3] ASoC: qcom: allow SM[456]50 HDK board to play audio
 via I2S
Date: Fri, 31 Jul 2026 10:05:49 +0200
Message-Id: <20260731-topic-sm8x50-next-hdk-i2s-v2-0-42c1acee5a2d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF1XbGoC/42NTQ6CMBBGr2Jm7ZhSBMGV9zAsahlg/GlJpxIM4
 e4CXsDlS973vgmEApPAeTdBoIGFvVtA73dgO+NaQq4XBq10rk66wOh7tiivYswUOhojdvUDWQv
 mdZ5anZElY2HZ94EaHrf2tfqxvG93snENrkbHEn34bOdDsnr//AwJKtRpmRrV0NGY8vJkZ4I/+
 NBCNc/zF6Kw1BPVAAAA
X-Change-ID: 20260728-topic-sm8x50-next-hdk-i2s-6d63c25eceac
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1403;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=WAcHU/qRwRLrH5rKuY3LudFtEXUDRG+BuozA8+vOgtU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqbFdgUSKw36xqavluNnP+OrP74eGkOf0waCuxEGHb
 y77+TMeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCamxXYAAKCRB33NvayMhJ0Q3qD/
 9Dw+3izY98yf7jVeit0cnXXn5KhNfcOk3+bbpAtgzln/kfHxVU5hLIikD8bqHrKhnnEdn1VBkiNi3c
 LH2eFDhnSi85yJn5ZfsWuELYG47Bk8gkjTbHxfmu0weGi8U/rmwf47IrYdvFdlTGKEgRE6I8KdjZMb
 lWV3+OXP0puMPu16Qgrzhj9IUuT76vVHa7CZaJkz/8k5AM4WKX/NyochgCTbmJd7JX2O6m8d+eZeLp
 2pKnfHHGsdCsGKm3BjRXOJMupRl8xqbC68ecER7IBM5F9QaYQbLYP55qGbaXOhyqTLQE0CJPQyBLFv
 pWYDRnoy4DmfDaC6EUPIOOBWPZf8keBUlDQuPIyMKGBrUcgCqNIY8Cwbbicq5jrThDZeEuK2vVXTbW
 X6mqWPRQ6OLzyCEj+BleFPoE90e8ld94/17A3AHDbLs0oBHysR6B8sljbwp+0pXEqMltyj7KOHaOrN
 cakLQ7b6MLVQVDJmd1FwtznHWusRI0QLEOPA279SRqhMBrD6YPT9unhJGpqNDZ7M4ElhffnycnlKtH
 2mbaSnLpeFIjkNIwilB7LL4YJxpL577bcbO2BuUDg8TRzFM+/uewOdZvNwBN8blir/IYI2/gbb6bwZ
 GAxA6vpz4YH5xf51uQEN6UYlm3fFkpYePWVBRF8tLCbZs6AqooK6/w7gUshw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Following [1], this adds the necessary settings to setup
the I2S link to the HDMI bridge to allow audio playback.

All dependencies are merges into sound.git for-7.3

[1] https://lore.kernel.org/all/20260724182446.1484894-1-mohammad.rafi.shaik@oss.qualcomm.com/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Dropped applied patch 1
- Fixed node unit number
- Reversed clock names order to respect bindings
- Link to v1: https://patch.msgid.link/20260728-topic-sm8x50-next-hdk-i2s-v1-0-2393a0fe4aa9@linaro.org

---
Neil Armstrong (3):
      arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI
      arm64: dts: qcom: sm8550-hdk: Enable I2S for HDMI
      arm64: dts: qcom: sm8650-hdk: Enable I2S for HDMI

 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 36 +++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 40 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 36 +++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 73 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 35 +++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi    | 40 ++++++++++++++++++
 6 files changed, 257 insertions(+), 3 deletions(-)
---
base-commit: c50ed4627e333934aaf0473a822169786c83dce5
change-id: 20260728-topic-sm8x50-next-hdk-i2s-6d63c25eceac

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

