Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED204CA765
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 16:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791392370; cv=none; b=QCbPQNzEM+u16DeL+szD/5YQz1z6k2E5zREKhkKN6ocVj/IE+jBuP8gbzMMYAkpgRb1qH84Lb4qkCqPovZTPPqsmvkGhhuYwN/jOPrKiqZ7eZgp0uqYLb609Kt3ttwuhL2ZS29RoTfTAcl1j7oeCSzy4/ImZyjLqJ+yXo2kHMk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791392370; c=relaxed/simple;
	bh=HUyYKCYOxqTADKL+UZSNNPi4asvXUnNM2CoqJTjTAZc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lfCmMaFcPV8MjklmBHfttJtJstlPJvbBr0SQOP+S1lRuPGl8zC6ZQ/dNr9rZIJeng3dZRY0tFYlMAtjB8B8E1B9jlvr7kp3nt8nSCjcRh//8ZhQRhl3iudh1tCdoyvyY3Z2U5ojTeXv1o3ILSHW71fgAsxEJiRX346p1SikMp5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIOVqA2u; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIOVqA2u"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a16c399641so20841085e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 09:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791392367; x=1791997167; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NBoYpGZisa/R4sIsPl9OzZlpg/z76qlLC9dYgcsAHGg=;
        b=JIOVqA2uXfr/3c/Qh9WPV0A4QwQwytUxTSm3636cb+JjQKK0PAgO4RXOpwyPMW/8Ap
         CimZ6ORxriXhtLJhgTsED3oUCMjfxw6Xm/BkVzdIlT7T3Vtz9+EMRX1o2IHftLCnjPnC
         y0yiIqPD9eNbGkHsJRWD5q9BNSeBIHAnFIFOaeGXYphxshN36V03PHjHcRmyzOQBN33e
         eXGBquA90MMDTGenuJ60rHvzgg3IRJM2252mGxiDgwqxJqnSTKv3nkvfQaPTb1FA9gkv
         6d4XsaCg94a/QpomMFIrGiUTm9wbjwEmrXH9CUKOPb1p1rZ9n5t4CUMQaEuMJJrSStxY
         z3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791392367; x=1791997167;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NBoYpGZisa/R4sIsPl9OzZlpg/z76qlLC9dYgcsAHGg=;
        b=kQcIVEe3D/OFyDnB4sB8vS46yiXoCStuQOMSZn1XlY9eIdbsmcOlvaSdq3F/7Gpwcr
         0E830gxw2yx40gnU/j6kF5ZgRoKcQvJ19VH+SP/veFuhKqsE2yxi6fU7JWii6wYkdFEW
         XxCoxBQkw3FvwVavSO9IPzVTQoU0NhuVp9sGkDyGb+SuzF8mB4/MqxYfdVys3XBPl39D
         qvnqlQmVEBB+dfDk3wFmh6ZRJbgd7rDQ+GHUmypX9deQrqQ71mX22/tNAfZubY5Dk/rS
         5IVx5TsbtSzjZecAIeHvHxnliLaU3yiWq56cpDqTAUTAjkxIFi9k51fm2BXmKuQxxIgD
         WMhA==
X-Gm-Message-State: AFuF++l6rIPWw7yNoXnCceAgAV3zplkLEkUpvOn1qfnv5hUObmp7B2TA
	/1IISHy1rh/jVkJsZRcTIfHKd4qhP9ru1p7Gs5YN22OyVOf+oC09sNKv
X-Gm-Gg: AYBFou09UoNt5+DLUsYE+JdRJ0CZLErNToLpt5vPnjtlf1ANSNsnMqcpiyVquACS6Np
	7HTsSZ6zXkK2TYx4TsoC66BOb4z0P+26OjWmMrlsD5gYS9+pHWvDOKNWAGknvAaX/9d3jyeC2nw
	1JrNKAg1DhXVIglrWyJNI6nVEH8s0026QawFewAuPZv1EqXjIvNnYomDbZ8xY6HHrFMPCws0CZP
	SQHWoVfoweA19/MbEgeJXXC1HgeadsmowBRZYFNFY0oaRZqeDnN6C4FeCovk2mECLdSDWl5zvU8
	RKGSm6FmF+WqZz1PymVSg6SrAqk3GlZHSF9+CD0GPvfd1TbPAHBfFezW4MiuKUXfGpKpadW79mB
	9LGATdYSraxhVQTRpWiEeMK4pI2N6/apE9umMD4/8PFdHDJxepMmWFqtwF+MylrnYD2KeFQZ+sv
	QNDyOvwQ5I30VGPwqJmP0fn4fItiq/sQbMNvPU4TBrKkqGW3xHnhvAahfOsqBCiwAt0Qi1Rwazr
	yzE8gZBvSS9b2cX5KzCzTCeMDs=
X-Received: by 2002:a05:600c:3152:b0:4a0:174:579e with SMTP id 5b1f17b1804b1-4a180650660mr41757035e9.28.1791392367152;
        Wed, 07 Oct 2026 09:59:27 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1843d198csm4682525e9.7.2026.10.07.09.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 09:59:25 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: [PATCH 0/3] add 'qcom,ipq0518' compatible for the TP-Link Archer
 AX55 v1
Date: Wed, 07 Oct 2026 18:59:19 +0200
Message-Id: <20261007-tplink-ax55-v1-ipq0518-v1-0-0ef058756596@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBBA0avIrDswiY4tvUpxIXGigyVNE5GAe
 HeDy7f4/4AsSSXDuzkgya5Zf6HCPBpwyxhmQZ2qwZLtDdETt/jVsOJYmHE3qPFPbF5oO+a+Y0f
 Ot1DjmMRrucef4TwvjKzhdGgAAAA=
X-Change-ID: 20261007-tplink-ax55-v1-ipq0518-2455645c0cf3
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

The chip marking on the SoC used in the TP-Link Archer AX55 v1 is
IPQ0518. When developing commit 5c59666c443d ("dt-bindings: arm: 
qcom: add TP-Link Archer AX55 v1") and commit e6d33c8b2f80 ("arm64:
dts: qcom: add TP-Link Archer AX55 v1") my thought was that it
contains a typo and it is really an IPQ5018. However as it turned out,
IPQ0518 is a valid SKU.

This series corrects my mistake both in binding documentation and in
the board dts file.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Gabor Juhos (3):
      dt-bindings: arm: qcom: add 'qcom,ipq0518' compatible for TP-Link Archer AX55 v1
      arm64: dts: qcom: ipq5018-tplink-archer-ax55-v1: add 'qcom,ipq0518' compatible
      arm64: dts: qcom: ipq5018-tplink-archer-ax55-v1: use 'ipq0518' prefix for dts

 Documentation/devicetree/bindings/arm/qcom.yaml                    | 7 ++++++-
 arch/arm64/boot/dts/qcom/Makefile                                  | 2 +-
 ...tplink-archer-ax55-v1.dts => ipq0518-tplink-archer-ax55-v1.dts} | 2 +-
 3 files changed, 8 insertions(+), 3 deletions(-)
---
base-commit: 7ee8eb0ebeef2e7bbf2ec8ebc43bf43f2a10a1d7
change-id: 20261007-tplink-ax55-v1-ipq0518-2455645c0cf3

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>

