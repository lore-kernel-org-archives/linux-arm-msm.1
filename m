Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607651;
	b=A+JaPrJPKaECyrvyWbQsXEFRjlZIZ9QYe9QGzwIbysMk5Sv5mRlAqMI5VV/lkCWX0r0y
	 BB8+O8k6OieU28GPbo6JYmmHKLlIBcfC12PpnGf9NZ2n5KnF2EHtsOGmGdn+lmpZBJ2VU
	 PWivFtnghsrK2WMIJOzXSlQ4vt913nFQ0RwZWtKpN4wZKLuHpr+HD4drMQ6vPxzrnEURf
	 OuhcB9LM5JZe1sK1N0jq6XC+rItTh3AJF6gx9KcQaRIyBS20bL+PzvqL9YNXdMsJZY52U
	 4LTHLvlDfoO4XaDp5fjHUJuUMtvnKSJDmQaZdlgGicgxXkbbv/FCQL36oG4fTnTZ6lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=zRhT31ysuaijJ/dU24/Je9/a2fWEfgQAeCCZFcrzdQI=;
	b=I4vbZU2oEL0FrA3Ozt62b5S3I9ODf8v2CcIEtJC+rG8hfboTH8wiFS4xHSHttt+hSH1d
	 lwwUah8TRvEH4KziYjFnDD2EJ5LdA/1OxZsxP321rTUbs2wO+2cYwEjaMddcyYNcmZFB6
	 V9/mrR72OUJfgFmJKCtCmF/i8lJZsGt44ZJgk0w9O2GjESS+zC6RcB+9CJ+RUJE4Swvvf
	 +NdTCyGIpV82CaYSS0hyyA0qDyLmd3rbsU1L8Zt25bUANv3hMgOjU6ShqL3sAvFKNh1ZK
	 POhfmRd0rGvzmD2718tBOk1k8+uy8Dtj8ph4LPKezycAAKoVh4v/LP7yGaMnXIsF7bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=STIQ9xx0;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201C4606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 201C4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=STIQ9xx0
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so60721665e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795607649; x=1796212449; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zRhT31ysuaijJ/dU24/Je9/a2fWEfgQAeCCZFcrzdQI=;
        b=STIQ9xx0NMRYYAanmIAcl43MIStvuWVS9AmIs+ZA+QBeKIL1D+7lReKBMQB3Cv5SB7
         +rPyW2mjEfH5+4xw5Z0CodMMdZU/QAlqdh0uamGjn1AWiA3pt3J1lwj2zsBbvv0MXo1T
         CBGyR/n3QfrVg7VTNP51eE/wqi7XkMwnQx3V/dkc5ZY7GWXIfZpv/Pl19yQMvnOvUybT
         wHMne/8O1aHQguG/UNuMyIwFMIM0MGcVIB1nJZLXVA5hYAvysF9r2I+gZMabXtlqZE2W
         8D25DSGlyZWsuJ9pJ/gvtGDGz9l3v/S/f2beKrGo8Yy6nMBDitVUfDvmA4+mDZw44oFh
         6Rjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607649; x=1796212449;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zRhT31ysuaijJ/dU24/Je9/a2fWEfgQAeCCZFcrzdQI=;
        b=lbETGpnW5fsEUxVBIdiLPbk7XFVwJSnBRPAyKn7kFI/50I4jQyIoyoywN59BYppvPQ
         FZy4I2766Ex8FN9Z6zOP/AW22TDgrPvaeFQcRFqFPqBYF39Dhd25b5bF59UtdrsxsXd8
         GBrbV3IIFEXJHunbmAeZ43PzAqaRWZNw90yzR1jqg3TfsZPupe5iVYpTHULFR/2Vh30m
         qwyWfCse7hMkRlRyAHuxFgiHJpRboChKaYPXYCfSAHaMdHUhaHoDGAGe41MxL3W9mzja
         tGGlcQRPOMZcaSFsI46SVpEoGON9lanGi2HnmvvgCHDIbOM7XWvH+wyH5wKGF3EY5NoM
         L53g==
X-Gm-Message-State: APuU4Z8YK9fVzKIrf1XDfC2lfSxX+0XXnq7ikIfqvBTVjIMq6QqgjKOF
	NiFCURzzhnNPbxo8PzIaw2ISaTdO0RU3GKpJnm8chGzvARWwkjW6xH4lC0OgK4jNygvRp56AyRy
	+aEdZRM3quA==
X-Gm-Gg: AZFdTZddr6D+k0adfR9/+p3c1BhBW7l+tGXOGg209YBF8QAMYNTRJK3WeAPnbMy2+7+
	ew6BbKP1swGE107gk9kkiqa6vAmwyjMlKBdjVOML4Uly/OTvilzzf+PcK6hD0kvfFxNUcwj4IVL
	je+vPqyzpfdrJVQkyy/Ag7iP3WRhF+vvJUH+UiLojdp8gHBApqKl8gQ2Ap81rVcSZe8JQHRTXE4
	j1hx4R2kKshw+BJ86k/EqyPwQgSkBAZfvWVAp+CojhjD+tKHp2F2UdvaW/wbzCkxLtM/yTCkk0C
	ah9y67rOFTqS8slhSJc5riLcEoJwxPQ9rJwOs/DudqJm8vUgmIFtnbbmI7LH35d1l6JLh3fgwN4
	rrXZzuRk7+DNjTTZC8M3IOrvLdM2ga3tb6E/3WHOzw9bLFV2ccIse9Q8exwLkDpu8/Vp7uRVFZp
	l1hwaNHZ6JSO+Ww89688cmGLavmh4P+DM9lyCFvLQfr6rMBzAK4ouWacldZEBjpTfPCFxApYNiB
	Gdua0UOgjDSZXpW9yqCU7wUpxKjersu7FzyjD8PDFYSXSye8rJTbAB7YgFU2jsFZDV+ECowV2Zk
	5bcqCazr6u2+NEdqmzDf49g2xt4iL4VJsQMDSXP10BYQop5sxw==
X-Received: by 2002:a05:600c:4e87:b0:4a3:59c9:a758 with SMTP id 5b1f17b1804b1-4bb88922c81mr357192965e9.32.1795607649300;
        Wed, 25 Nov 2026 03:54:09 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f643adsm234073615e9.1.2026.11.25.03.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:54:09 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/3] arm64: qcom: sm8650-valve-deckard: enable Type-C
 controller
Date: Wed, 25 Nov 2026 12:54:05 +0100
Message-Id: <20261125-topic-sm8650-deckard-tcpm-v1-0-4af33e89ea9e@linaro.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF3MBmsC/yXMQQ6CMBBA0auQWTsJLbRar0Jc4HTU0QBNpxoTw
 t2tunyL/1dQzsIKx2aFzC9RWeYKs2uAbuN8ZZRYDba13hjrsCxJCHU6eNdiZHqMOWKhNGHf9fv
 ggzO2C1D7lPki7997OP2tz/OdqXyHsG0f8W8w130AAAA=
X-Change-ID: 20261125-topic-sm8650-deckard-tcpm-434796951239
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1095;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=OAXA7tv4rQ41VW9EpqmMAyss+JFEaIBUrOpUPjQ/e7k=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBsxffJFCCf4SjJ6kjvsBe4Nw6WEg7EtnDjNo5wfQ
 3K21DP6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbMXwAKCRB33NvayMhJ0RFCD/
 9hQ/gSbyCYyoWiKCMEkj5sYTOduIW2b+m3fCc4EB40ALq4l7YpVQAUcKGd7VNqU2IpXj9a26YhEGxL
 3guozDUgWvjahoe2DtESN1erI/5bxN7o0sW29F48ZdlrtJyLqxLWRahIIWo+ytQMR5+trGt/EObPi9
 dLN37xoBRb2DirBHpM1gabZCfy4m8pKamNVAd/iBO9MARKXYYPZTZRokjSXtibTcJEsxe965cROsdX
 Rqn/hUKr9DXSqKeEM58Tn5DQgXVMzD49LFPwbJ+0VIX0edgx0LtnXWbotQ5jWXgLK7J/U66WB2zxz5
 jH4cy/Z6XC1IWDGVjA5Mv3unJvBsnlojnl6L4EAG9bfmtx56apNajlHGIiZIgRc8ekXCMlutWSHUPl
 i+fQ3I0PVon13LlKYw7qUCz0Q0d9b4zRVQzl7Er+uZ4y8kEWjozXMGYHO760f9pMyFk7Ea6vxrVsMT
 lGYquJ/R2y+hvccM+S96QJCNlGpje2GXQ2sbiihmuEO7+VYa1bLis7aCcbaaKNpwziZfY9vfU41a7R
 0Dlf+rEOaRkVyTSpeEcUufRgKbaNIZzUZxqvtLWoc71yYvcqTa8szHbyg5QTUvgYOj21k5MJRcIStJ
 O+yPj+3oZ1/ctuhXL5mMl+QsAUuZG93x/+yrkY0U6tx8wBygzfkW6vuzDIHg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Describe the PM8550B OTG VBUS boost and the Type-C port controller,
set a regulator as always-on and enable the Type-C controller and
PHY on the PM8550b for the Valve Deckard headset.

Depends on:
- https://lore.kernel.org/all/20261125-topic-sm8x50-pm8550b-tcpm-v1-1-f54040ccbbaa@linaro.org/
- https://lore.kernel.org/all/20261120-topic-sm8x50-pm8550b-usb-vbus-v1-0-bbda7b708359@linaro.org/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (3):
      arm64: dts: qcom: pm8550b: add USB VBUS regulator and Type-C nodes
      arm64: dts: qcom: sm8650-valve-deckard: set BOB2 as always-on
      arm64: dts: qcom: sm8650-valve-deckard: add Type-C connector

 arch/arm64/boot/dts/qcom/pm8550b.dtsi             | 47 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts | 52 ++++++++++++++++++++++-
 2 files changed, 98 insertions(+), 1 deletion(-)
---
base-commit: 392248352ef971b473b50349ca834e5942bc404e
change-id: 20261125-topic-sm8650-deckard-tcpm-434796951239

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

