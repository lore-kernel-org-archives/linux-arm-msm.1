Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073103DBD51
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2026 07:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785916117; cv=none; b=TCA6c6RoZx2F4AdA90E9YcO6BdMo2GHkko5r4qZjvXDGYpNvMcSdbV41kwaA5XPPhh3YadBcoarPrArouAPjkxwx5XCVUQaEWXb+ZWzZyvGxUkZzRIeKDlWJmf+fz/ED1CpzL6KGP0ZQgGEiMuo0LEuG3oQdBgZ2nX3j/JWkY0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785916117; c=relaxed/simple;
	bh=EdYe4NmHLzfEcXfTD0KKtKVWiHI/j55HS8/9YRuaA3M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I4Z7jm3F/CLrL/lnyfn+4yoAkKpo3+TA+nw9+k8ZpaSQTFrxnPmVxmXdl4bO/r5YpGFJl/i31JFPy4/2VV8WSsOp0x1ES0IPIkx5g6dygFGtT0rKRwmfPmPI78FLBn/el3D4aNJGsHd2074c0rTFvqqiB1k9vCcwDmESDU2HkV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p/fy+yiQ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p/fy+yiQ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47fecbbafdaso178609f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 00:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785916113; x=1786520913; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zjZpHq06gYjNP6yS8alCV4qUFIXmklNycOXjGjR7rig=;
        b=p/fy+yiQBz3RdicGwDjjBXOF0Xct9KYcH8TnFKL0bviK93KUcjvqp3/cq/PCBH5mhI
         0+BCvJsFgkqJh85oqmohSevf9g789wX9vI0DnDWtu68kWOQDw4EK0/atw4ZnLx9RFtlP
         hqqCmDI/cbqtYM8gUarslhp8t6NZc8Lu7zFQ3a5vBjM6Ms7v1cTq0Xs1j/Ftj31cuNEf
         txGVWJ/gIjzeBk9Mx2UkGIKXa7QXphKWE5sb20ow7MR+jtsO6I3zaKVgfOF6J4PgwwIn
         ZfxvbQ1lBIGRpGpVNJvQpo2B/u4hIbCCV6Wlg2yVnmgKAWVJmfQlSoLjsL8IH3VK3FEr
         tApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785916113; x=1786520913;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zjZpHq06gYjNP6yS8alCV4qUFIXmklNycOXjGjR7rig=;
        b=KVTNsQ3+T4yQEQCO94rJR4CEQc0PfnmvsAO2pVJqawnQeEuzdbf7oyXwHRdNWptkev
         cvJj735H3jcLQ/vMze1hjwSz0MrGef3f44iYGYxfOhwFp3erMaU8Rl8hZqV/iV8Sh0Az
         mCN3a33+Y0HyHWK6uANCdWnW9NB6m5lvGEd80zZiv9qdm5KaSEgjA+w8px68bTtrivq1
         4K8Jg5dfxkch9W3YvyFmdMAgabCJh6A7XifnOAjquelqoZz0NhumrFXGguIyqg4Gqn4w
         GY9r2X9GNIH1Rh4vPmNGTNOLpfGRKAqW7nt0vzV/cvp6CPoaHLoWI+2JhP1R3vXzsd+h
         ZtkQ==
X-Gm-Message-State: AOJu0YxxwzhR6EdhB8At85K3Ggfpg/uJk+EPMikZK2fDW6LrzLrQ21rG
	CVh3kGNCn90+UYk+3dgRkm53he8lLDuNrNICapqMSXaxg5LkGhDX6vdSfi/fBUr9bjc=
X-Gm-Gg: AR+sD11TCcoKDD21cuYQ1/EKmuLNR8G5PaWCSQTtMcIoIXi/APGI3PgyDCxqVJ9X7QQ
	wioqkwaYFUTWitV4gkebVn1kXZHDNS4mFEaj4AEk7+17Lsz0oKc5nB7uWxH1eeBzM8rR8/dLK6p
	uSiTpBYdPL/o94Oq+6+8++vnD5nndXgtd511SEl/+aHkkuUL1/bn5eNfmZ4WhRaoonKIK85Eea0
	HK1Mdf97sL5lcqk3y3PHrpiR3g0Kc/q1rj9ToAurLf18VdR/IPQ0gmOAxgjt6FTEj0OdFCXXoEw
	UNMXApMNKHVcCBZOaSftTDpRbIgQR2sWCn+KYJFNT0kwCPorZiHBBHu0cqktmXKqYUMaUwqs5VY
	4quwspFhd+ovizbNjMHDXjheSZ5AgjX6ZwcWrp+lUnKROC8U8DDkcPtcIPp7Jzs8l0LhPqmWgLr
	zC17uqrpYBIY/Q2OGnFmmdlEtqmYOHlkLZhZKlqFH0U5nBjmWqiC1IKA1NJEjde7iPauym02lq7
	4PPR9lW2w==
X-Received: by 2002:adf:e010:0:10b0:47f:8ce7:8684 with SMTP id ffacd0b85a97d-47fec509a94mr5676165f8f.6.1785916113106;
        Wed, 05 Aug 2026 00:48:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47febf7e5bdsm6470840f8f.0.2026.08.05.00.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 00:48:32 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 0/3] ASoC: qcom: allow SM[456]50 HDK board to play audio
 via I2S
Date: Wed, 05 Aug 2026 09:48:28 +0200
Message-Id: <20260805-topic-sm8x50-next-hdk-i2s-v3-0-07a6483c430f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMzqcmoC/42Nyw6CMBBFf4V07ZgyBQRX/odxUcsA44OSFgmG8
 O8W3OjGuDzJvedMwpNj8mIfTcLRwJ5tG0BtImEa3dYEXAYWKDGTO8yhtx0b8Pd8TCW0NPbQlFd
 g9JCVmTKYkiFtRPh3jioeV/fx9Gb/OF/I9ItwWTTse+uea3yIl90/nSEGCagKpWVFidbF4catd
 nZrXS2W0IAfKhX/UmFQJWhibYhSjeWXap7nF1JQ8B4gAQAA
X-Change-ID: 20260728-topic-sm8x50-next-hdk-i2s-6d63c25eceac
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1562;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=EdYe4NmHLzfEcXfTD0KKtKVWiHI/j55HS8/9YRuaA3M=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqcurOWkQWyZsqObCKVHV7QV0sJUC5vxG2OfNxGRdM
 Pyl+7A+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCanLqzgAKCRB33NvayMhJ0co6EA
 CpxDL+k/OtkRRODfQe5EsQvn6u+rrcH2/0xQOvATsKcTaoF9gDQK9HgyHqJ8Vq+Swrc82kfdAWTljY
 hnHxvZbQQosHFooaP8nKuArdf12/plgoKX3I5zOtGMw8r0CLlP08ODyhauY9eeYQdTuQVqd0LYWAY/
 piBxssKhY20QNyKiiGAblsa6q06QczX5jqu9pgX7j23Yd8A/DgHt5SB8YsA6NkArU1gUl1G6YLiqDs
 fEEkNYzSG+wRYQ3pG4P3GtSZiFIjtYSQM7i2lfQzt7uOvxXw6HJdozV4fB+QqdpIZUBX3TtKs7yDUn
 4uAPnVSBmoL8HLZT2nbUpuhM+sYK7QE1xxECobQlfZaecpfUpqQ8BqdC01nmkboZqgJ90z6AQyb1n+
 2m76epn7P3iCWT1QxMeesiEjtdkF/B4yeC0PRr15DBbZaqLM/yReODXJYhItBKtYa2tWbm4lLtzmfW
 SeaEQAhNsc2iQ+CPEoMVU0Jymkw4QvreIEmzr/BZ8GMbWdEfGftyZf8f5ZR1v/X7O81ObxlsL0ZdXy
 3I0pyJOLam1ij52gN0TE3L1MbylI93Lu/6fmL3BcrGPm4Tck2Zg4PoKCh+nvwIybxc6o13XX5M+fDm
 ApOsbc3Jyr2outIx/fHAyKZgKxV1oW1BxsaLSdUUeCPzTZzgamnipg1pk2qg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Following [1], this adds the necessary settings to setup
the I2S link to the HDMI bridge to allow audio playback.

All dependencies are merges into sound.git for-7.3

[1] https://lore.kernel.org/all/20260724182446.1484894-1-mohammad.rafi.shaik@oss.qualcomm.com/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v3:
- Fixed node unit number on patch 3
- Link to v2: https://patch.msgid.link/20260731-topic-sm8x50-next-hdk-i2s-v2-0-42c1acee5a2d@linaro.org

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

