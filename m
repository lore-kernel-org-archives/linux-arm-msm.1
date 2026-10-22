Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660624;
	b=mczoS032ndGeuGlk9mb+Mmr48e3v3QjviiG8vWcCtKIqGILgdggoTrUtPfUSVBaogzpg
	 5kQmnf2bXlouGmjG62xeU4/KqdjL0UldUA9UVU8aS9dWBNMrNfkSHkGH3qnYk7XV/M5Zu
	 53FdtTZdC4UYnKRKxvKm6Bne5eK4b28GoToO3CMc2jgbfAmU/iLDkXAU+Fne8ZaJzSrGc
	 RRdhzvvI5Y1h3vjyGolay2SSW90Q4XwMEx+bLLwBBo1l37tWL0qbU7UemQCv4QaFgDNyF
	 kqfmdI2nX+hR+NpQFxdy/Mbj+d3xd1VeTmYgghFvw32tbaZ5P4nsP4MMd2h3r0j8gPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=sFDfLWzuLmzLc7JScTXjpTuCNPOQkIh9Celfe9MAx4I=;
	b=cMaIr14J6edwVM6Hdyt8J1MlwL/Y2W/mcvFxvsgXhiUsJpOxK7KAJBxw2X+puSSHumMi
	 dOY8gca1ttnfrm0iPZq2+bZ5c1lNCCepxp/E+fcmBK2inyl0gX9EEx6HZpje89krp/L88
	 e3+UU/cABUARcK3NDYNoaEatrv8psf6kXELanRZ6Twv9SwHx9hI4dtFXrSvNTJsn3yCT4
	 dhFCvRYr8uYiAA+hkSg4nYsa/NRpw9xUP3tDwh6WLzXn0tiR1nfPoqQAKqEnI0HLibSZA
	 Ow98YPyIc4WPRyeFIa3Hr13loW5aAJt1RN1AWWnhFBGyOVtNbi3VnqmEdRQAb57ZtfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NoB5nAPU;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C76D606A319
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:17:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C76D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NoB5nAPU
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b0584ad71so1123119f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792660621; x=1793265421; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sFDfLWzuLmzLc7JScTXjpTuCNPOQkIh9Celfe9MAx4I=;
        b=NoB5nAPU72HPKSj24x2jYmQAVMrvyGV09hmlsSiU4mdh2uFiHPP0finmH7n7quq6cQ
         koAOQjkS228hRuZkLi4VpAPiS+X39KrVfR/hYEAVBQRNipi2xyxEC5LEJxl2iBMAM1te
         H3bfs5NWHPCiOGojsTSD6QZtFJvqJ8GlkJsFiB9XUAis2a591OZNzCTzqs7GLUdotP4F
         5SI/dA5xk4Ao2tUPznmKpqLd2XxJ7qy1Z95ghawXmP/ZcgwrWt9UDzMjiEfewX8D/Vho
         Chr20vwuTuJ1C0rEbM/QhWLl4lQ3guh2DBeTBCGAhk7WK87kW5gR26wl3xQlKW0/asW9
         PPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660621; x=1793265421;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sFDfLWzuLmzLc7JScTXjpTuCNPOQkIh9Celfe9MAx4I=;
        b=VwhNBDohOX1fs0KWPxFYv9wlJvOStO8E0Pn+J89+TB7FdFgDDv4aXcxZPp2PzJYhn4
         inAZHboRCx4wlPw02Cylm3/iUW8ta/M0RR2+FWg/+AqsETYPFzFja2DWhwsae9f7Rbc0
         cYputBMndkm4mb/2XXH3GplZNn/ETGxs9aKEqBKzHbggWQUuO8xvkt1XigeFvGyS7tvr
         6p7ui/ISVj94aZUNpVjGoH08gKqMrUk0sOMR/lKdQQPkD6ONe7tCsiZmvruPPwrKVmgE
         Ujuoo7DwjSXjIeE86M3jETEcSViLHXz0XA7qL/NhipDYxt0fz8W6Y7kMffwuuSOeE7Lp
         IvWA==
X-Gm-Message-State: AFq9FYICyaQCH7jHhML3jYHvEi2w+xdlczPuL8is8hFef++K1+8xV38s
	nxuyBSqrRSMwgaC66U37qurCmjeLErwkJvIGozP8ueT+eWF2CTCC/J63ud/pQapcWKY=
X-Gm-Gg: AYBFou11NzlIAQk0VAuOAxEGL/UNeCEJv4b0LRobVUaxEmI2wp4FVtO2ktcuD4LC8ZW
	thDfHHT9l312SHhJTJ1SJHC/VXAsbqqjDCGDZrbpWbJeZ7io4AqpXrxdoEu/zHB55Xo8ufeB1K+
	PD0hI6kPnnAtZtvn1bozXOCxJkqJ2z2rf/AVe2XMXcYhMBPPZng2hRpgz/NxaRGObbLnB03CRP/
	E0TB3jet/xYv2Ntj169keThMESZO72NI7JTmy2VEZIQzKL6oDYH0sVK+Mh9yuGLqhloK0iQ8SUp
	Oi7Y6UUVPCbF6Kd+zO8wMNzDxXz0eSXjdOdi7H1b85AFJWQ76sftZg/cOeFmU5Xo9EyfGFmCDIg
	WEJk1R8EVYdX1KhXiDuaZjjMH5Mztv1GEIcKP4sYA2DZxiJ56/LPL8LdOwsdAQe8CkRdClDP5sA
	4DL6awjnVGfg/roPZ8JGcHgxoJkKJ3bVkuaP6+9CSV9gPqfoTkMaZ8Zt2ba07rCSR6Jt+Dw19Av
	l9BpJtqPLVNNYQlQj6xX7R7j0B3cPUAyLKs2gsJw8hLIyFXPvsOZqu+SBwAmRj6PvOXhjCuHL6P
	/7JezDPNMZZl+mLK
X-Received: by 2002:a05:600c:1f88:b0:4a1:d2b5:38e0 with SMTP id 5b1f17b1804b1-4a1fdd4b4c2mr93088245e9.25.1792660621117;
        Thu, 22 Oct 2026 02:17:01 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258213cesm11293672f8f.11.2026.10.22.02.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:17:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v5 0/3] arm64: dts: qcom: allow SM[456]50 HDK board to play
 audio via I2S
Date: Thu, 22 Oct 2026 11:16:56 +0200
Message-Id: <20261022-topic-sm8x50-next-hdk-i2s-v5-0-aa1030a75e46@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIAIjU2WoC/43PTW7CMBAF4KsgrzuVM7ZD0lXvUbEYnAmZ/sTID
 lEQyt3rwAIqpKjLJ42/93xRiaNwUm+bi4o8SpLQ5+BeNsp31B8YpMlZocZSb7GCIRzFQ/qpJqe
 h52mArvkCwQRlUxqPjj2TV/n9MXIr09X+2N1yOu0/2Q8LuFx0koYQz9fysVju/tMzFqABTW1It
 2yJ6vdv6SmG1xAPaika8YEyxRqFmbLoC/LMjrB5osydqrRbo0ym9JZKWxlvjW6fKPtAra+ymSL
 E/Le8v63/rprn+Rfn5YL7tgEAAA==
X-Change-ID: 20260728-topic-sm8x50-next-hdk-i2s-6d63c25eceac
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2189;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=RwnJkJ4XSH0ufql5jTfBYo07LHUrFtd0N7J3Im52S5M=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq2dSKpuN+B9pWmXeCrZNed6s0pPHsBbr5qOVLlc+U
 eId9T2eJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCatnUigAKCRB33NvayMhJ0RexD/
 9gBz+Ie8BYVTB5BBYgZWK12eBH56UZay3Eer5hIJ/18hQ0ls0+wPVwNi3YfRjrC4LYl4Urhd/4G4bw
 KXBNxl4/IeDXAYKCIKxAE3ujjoScUJcE0v426FU7nxMxQUyM5X/82IFiKRVIlmd0+zvW/kXb+fuTDP
 MvghTI186A46mr8JF9WzCSLb9a97tVH8l+k+tE0iXQ4nhJr94fi0pPLA45Bx/FGR2BEOWuCeYJCi9l
 SBC/A9AaSJ3fzh8JwjgptK+YaumOu/Q8dSLgk0hfZvJHVrTldFDQ9TKVnsCt8GlSXHCVLtXdS2yke8
 U/Ld9hmLdxLQrIHu5MeWZKiTQsGJb3tmT8UJhejxt5vAntw6QMfJ3fBpd8U34XzQo4huED4StFgVW8
 4/Jz38uyOXlKqWEAo2aznxqUiVdegeuvuvkY9leBhNgPMEAY5pkjJhxFPzElH03wrZIf0drGKEi/7A
 RlfLtAloyMh4zRL3cxTptn8Csx1IZqGqZRKsNJPekcadnc7cNr87YBkLY3hIbxWB6czk9JgdhhLUta
 Y4sn8y376AuayAH+ule/1uKQ17aigLfXKqiT64e0QS8oE6G9ydCXPMGY+zCbO3Rrw95Yy+GEzOFskU
 t9TLCM2V3XRPDOY2UgYtpmMvC7RrbMxut2HM58Yg5ZxV/2Lnb8MKA/98m7AQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Following [1], this adds the necessary settings to setup
the I2S link to the HDMI bridge to allow audio playback.

All dependencies are merged v7.3-rc1

[1] https://lore.kernel.org/all/20260724182446.1484894-1-mohammad.rafi.shaik@oss.qualcomm.com/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v5:
- Rebased on linux-next
- Link to v4: https://patch.msgid.link/20260831-topic-sm8x50-next-hdk-i2s-v4-0-a224aa073f9d@linaro.org

Changes in v4:
- Rebased on v7.3-rc1
- Link to v3: https://patch.msgid.link/20260805-topic-sm8x50-next-hdk-i2s-v3-0-07a6483c430f@linaro.org

Changes in v3:
- Fixed node unit number on patch 3
- Link to v2: https://patch.msgid.link/20260731-topic-sm8x50-next-hdk-i2s-v2-0-42c1acee5a2d@linaro.org

Changes in v2:
- Dropped applied patch 1
- Fixed node unit number
- Reversed clock names order to respect bindings
- Link to v1: https://patch.msgid.link/20260728-topic-sm8x50-next-hdk-i2s-v1-0-2393a0fe4aa9@linaro.org

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

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
base-commit: 9a482184d910775cf648863148944945b74e2815
change-id: 20260728-topic-sm8x50-next-hdk-i2s-6d63c25eceac

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

