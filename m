Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661787;
	b=XgBISPe2xDRWmZiRKmtaXVZUjK1/44Vc0U33qjzQ1N25VZdBlV2u4iR5T1qMEAhNUyLX
	 77933Sbs75CIN6QQLrIDpL65+CsxPKh/BV68hAAUwysJyg7tqlqQ+zzzdoCeGg4DT7v3/
	 mgpV/olDXrQazzrhitm/SFxCV+OjRPVhG6rCkVfY76nrpAoGPP6HIQbg7Fc0Nc5iz0mZu
	 NAaYB5JCL/ZvvFRs+u4xRJ4XzogPbtrw5mHmMCvc3OzrubO0N1H2XWry1K9GOjYhDvAZv
	 +eh73AFhWM92evkdprYHXwLZbP+e+Xuzd1hG0r4FI2hkDwmKuE5TjTif4YJjxBiAHyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661787;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=7q9b5W9djXzZL0EMGmOjkz9fTUnN8mWGHmYaMiFb5A0=;
	b=Zmq4TD8DtReAdHeWyWofGCgeW5CIKG8/ehVAfp0gDI50BmhTAUXY7xhpdR97Q/GhRcy5
	 dsSbRe2R0FI21v7aG4otIDilkNrlx/JeNy3txu+TEsj9AoGWqtzCEqY918qQH/+ZDi8fB
	 ZWQ+5yJWBlN2hcqHXqhgseN5jLDD77vv0tmVsKekkeXe15AQZOs8dpjukwul91YqoYI6K
	 3iGDUFTKRPphkGqgFeA0HFom2RwFGoum2m/3F+WfP2wKoz16NK3IPIhTuOBwTFCt52cD+
	 CWSOkcoKcYSGNE93hVKZVwehBBn57s2X+6lfOBCm+eVsQntvN8ttFuRAGC1fe/aCqHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rziXJ9qi;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30644606A319
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30644606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rziXJ9qi
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1d293b293so9222875e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792661785; x=1793266585; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7q9b5W9djXzZL0EMGmOjkz9fTUnN8mWGHmYaMiFb5A0=;
        b=rziXJ9qij4OFJAmAFJ1BxqIN6YtdjyDlhmFtcq/QtfnV73Ld97qwC3N25XJD0qIktJ
         CkWUPBm3hxSp0GWMHm7REXa3Cl/0RafAkOE4nZtt1cLIr1AaTf0Tw16aVNbquLwqtGHE
         Y/J6pmsfvbIznOgNAE3zPax9iwZ26dsABvE4BvIGxht/tkD60KqK3CLakPK2605WnIYs
         pUaAMIyyvDwMG0reQWBDIqSv3s6P0XFMAn0q16a/UNhexiQzt7oHOdZXC4mZIjZ81d2K
         hon5apkGQ/4spv1+YofFLt8MrmjYV8XQT3jYR86SopPUIsX072M9WKF0xofnfzrWBA3w
         Ki2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661785; x=1793266585;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7q9b5W9djXzZL0EMGmOjkz9fTUnN8mWGHmYaMiFb5A0=;
        b=mO0q2VSnkq8KaCmnwTELP9wzeHpDVSMklYfMgnk2TYaRXkguy4z1ryDHwbCY/R1uYU
         UHB/3Sci5xl8s/gAkxbaiXfu138xRQTPDai3VPm1bohRrG6VfdzbJjxBEcGYcFxliNli
         rF3BUwI0vCHbxvjeB1KZdhECayh80TaY7PCiIz86ySGtqf+41KurhmQjIhaXaxtx2+rp
         MUQHCls9pNFobhdCiILYabiAK4/NNdlbKdUQtVAlgoW/W/Ls2AY2xkcKKw6V+9+Fx8Dg
         dJ0YVUiMGzX6xRHd7eV/i46LCoEp5yrRV2KwWKK6ZfxB1L5Viy+Pl0Yj2s/sAQsh7lq3
         dTKg==
X-Gm-Message-State: AFq9FYIJ+f/1gOED3ZtedGc36P8KPNlq3ZucD71XoL0GL7Gt3s5am5kL
	0x7oT+kfJl7K+T9y+F4JccTAgUtpWssBzrWBvhwkv7C4VuaY8iSE682MdMTl0gkDW9MV5tWkGU3
	ExotF
X-Gm-Gg: AYBFou2ObYndux1Hk6o3XvO3Zm1aeK1Lu63TZMO4zBT2VkxYcy/tqQXdHQZuCQi+QHP
	mLLmaU4ag2+ldgdw76QORgmYZUKdS7uaRRR0tSYBBqIavFxTiNzmoAOHo5Vt3l47nk2mF0+p+Zt
	dR11rNIu1OlYQC1CA+wgPaHazSoTyEPv1WzHIY5aUTy1hZr31zB0Y7j36J4GoETX9NBYK8hf6FQ
	3oB7dkF9YJjOxEZ8CUjBLlZm3NLZTV/UHdfef3TzAbF9RtIqvr7bQrGBOfxiW6bMvdR8XS7zPNq
	AdNsErWFeEFaZ2Cf4p5N20/qyoPa4+xltE0cP/9DPAZPYv8lp6n3fhl+7XV9rGqNJgBxG9SQxwX
	hLCL5yHaZyZVS3k+jVnnsXbbwJlJkBydCIkFP/JsF/RwpzZt8W8QEJdkZDG4oQZXzMtk0DB+oW7
	xu9rnmFhGNPRUhX0ikkiPgFMr1sy/u8V7KUWQEslYV+I7CGyCeEtk7aYBV3zxZSkszcvzCnATsP
	tO+iqza82IQpy0ihTk88kSJhv2tvbrZ0TBtewWG2GfGRl0qX1xw7jgAUtIcLpmU9acd7Jk=
X-Received: by 2002:a05:600c:1394:b0:4a1:f714:3f3 with SMTP id 5b1f17b1804b1-4a1fdd41954mr97614395e9.30.1792661785212;
        Thu, 22 Oct 2026 02:36:25 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2038ddb20sm53299485e9.0.2026.10.22.02.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:36:24 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/5] arm64: dts: qcom: allow SM[456]50 HDK/QRD boards to
 play audio via DisplayPort
Date: Thu, 22 Oct 2026 11:36:20 +0200
Message-Id: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIABTZ2WoC/yXNTQ7CIBBA4as0s3YSIBWrVzEu+Bl1tBQC1NQ0v
 buoy2/z3gqFMlOBU7dCphcXjlOD3HXg7ma6EbJvBiWUlkIprDGxwxKGZS9wTqVmMgF9QjPWED1
 hGs3bGvdE2ctBHw+9t9pC66VMV15+r/Pl7zLbB7n6HcC2fQBi7tCNjQAAAA==
X-Change-ID: 20261022-topic-sm8x50-upstream-dp-altmode-playback-14186974db6b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1164;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=qKv53hUCdB5HADSZusj8p39GNxevUv3qIqlUKSPJa3I=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq2dkVhsuZdM4BaihAYctDIMply7ywt8lea57J3qVq
 tY3Hvz2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCatnZFQAKCRB33NvayMhJ0dywEA
 CbVpybwZzi2MlMF4IgUep6Wjr0GOM20uL5jax/ZKCXVifV+OwYJz0ad+kxhitWOp0hNn/zUG6Vu/jP
 sm813xJ2moEo1gGo94FCfJY9r6dPd0ml5XsPuby2V4LyrmM7UgmAcVTb1n0uM4Qo6/g9D+YonjEfJQ
 hA3xZxgEBmIfNgyfJIH3f84Rz2y1JJ3YztW19BMJpPkG8OZ9KZUQFctozxAbVqxM7FHRPHClvvd9Ho
 E2hrRt6FghBvOQ5SRY7PcgPAmRSo9spaFjobMcyYDCjyxE9C8V6hgWAxXqwAYNwYCYBnhbjqpltG6n
 QgKCBBxY+3AfX3hAb46i4G7czZd3rhzpgb+TSaRiziR2ow5lcP/f1og4gZ/A0OumVemsKKLbB5j9aR
 gH8siSt3SA1KSARP51Li6JBqM47/RcU7sb7pjDMM4D0/l0feyy7+gpWM+ZaA4l1uPx2NqFSGGKWM5Q
 cNTGukeVp26q8lEGZmyCyb02tBb9tc5y7fHKpHnp7yLYsRQckWz3d5FnCoG97kso0Lsws/e3F6nukv
 YRo/9bqvKdaCW/K45hrGRJy+VgZM5EvaDgPXGNC305rVNIQ7ZfbGB7D2yRMlI/m8+QXfZHIQilf01A
 2YoNeqbDZk/kkY280LoLKEcm2P2/eHPXI5JBewhvL1eawd3QVJfSB/nhuJuA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the DAI link needed to enable audio playback over the DisplayPort altmode
outputs for the SM8450/SM8550/SM8650 HDK & QRD boards. 

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (5):
      arm64: dts: qcom: sm8450-hdk: add DisplayPort audio playback support
      arm64: dts: qcom: sm8550-hdk: add DisplayPort audio playback support
      arm64: dts: qcom: sm8550-qrd: add DisplayPort audio playback support
      arm64: dts: qcom: sm8650-hdk: add DisplayPort audio playback support
      arm64: dts: qcom: sm8650-qrd: add DisplayPort audio playback support

 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 16 ++++++++++++++++
 5 files changed, 80 insertions(+)
---
base-commit: 5c2379ff1e0d26520b3edbb58fe2338fb17706a1
change-id: 20261022-topic-sm8x50-upstream-dp-altmode-playback-14186974db6b

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

