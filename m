Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29FE3A9015
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231122; cv=none; b=uJE9DmUmD5dPFngeDaWtejj6WE4LSR4D1b2P9vyOkyqSxs75yiHcuAWDfXK/ofhG2NAZSjsOO4yUS3JI0h9ZDO+3kCdojJYBl1xJyiFf8cNENs4LLTfH8u3EGd6LIX4cxLvVJJmyLYkX5OP5GQ38ZjUNon29ReBu5nZfkTecXcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231122; c=relaxed/simple;
	bh=thP/GwB4GLCCXTXiIlgnJ68amkbzT1D925DfODkrm2w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iPPrQSziGuNH8YCqTdlztwauehEFSKZOJPwb5Cds9w6u87UQLiFI8aa9+ftpZ2gHeramN7eup8lmAFrfNltZMy3r4Ty2oULT3XpX8zdqVRFQojRlvlMcmY68Kg3oUxFhMvqrjz6sv8oNuuinQv4elE1h/XY/lICIw00LbAESURA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ErqpLB7D; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ErqpLB7D"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-495635a85d2so29861325e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 02:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785231119; x=1785835919; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QauyaNd/XQMqVFtAv3ll2oSoodU/3X6RpqEB6YOpU4A=;
        b=ErqpLB7D8MBJa6XWZ/kh9TPPuzm/m7PIZgTR2DGLs2kX9UWVHMXzp+VLOHCJzuJgkw
         F5FmEM64blO5Szzxow7MZs/JF5NvhK2t38PiYTrGVuHkXf0SroANcF/OxNQ+xQ3QMJ9Z
         RaZjSLHKV4XERU7UoSWc8ap18fehEB4invCFHXKh3GyISOctwIqfTGGbsyfBE2GxsiEg
         +HBpOE0Ve8WGA0K06yoWm/tQfjj5CtZdzkqiv2QVPlWh041znbMrcqM2upApdlZYOafE
         F+nOFepgphZgFnzeWXu4OPhqSPlvNQGF5l3uLi95wWC7tuU/Wb4si6Yli9LH1jWRfMkA
         OMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231119; x=1785835919;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QauyaNd/XQMqVFtAv3ll2oSoodU/3X6RpqEB6YOpU4A=;
        b=XKaysI6E6EwHbJxpYgS0EQmVtgmWyzdgBQE4HuVv8INAOL1binZfPHyKnCwxh2kDz+
         vu6WcC2hsp1+/SZwi+dDQJWfMC5mPmngXpzMSJY32poIX/zWHvu2WCNdiNVK1DI70hqC
         MnMiu+/PiIY4QXwrxlP45KwyhgzJTDc15fLbIN6yOZaqdnLrF8dwZ1uI+kOK2iUE1ZrI
         IERFlceCoo0Xo5dD+xutMYmXG36PLUUv6oqwzgprJ9IMwuj6gVe4uzc1Xe3F62D5z2FU
         TPIxPipBa2XmzKL5VFI81caMns9g+vu6e0Yiy4mQiUSLvQcznUVpw1XgKYM0avqfsgdQ
         YcKw==
X-Gm-Message-State: AOJu0YwiYPQiPoSRxMASmLh2k6+SIOyjStTvQegHa8RavuP0J5lPmd/G
	xrRLbIdn7Xwf4FL9+Tj3TuuZDx0pnOw0X9/ZOjJ2LfCHC5Ea6IEFKzCwFqgMYzL3plA=
X-Gm-Gg: AR+sD11TozuSVZeuYqSDPVpW3ISFVSMlW0CYAeAh3O64TF+roUAnhn+IZLqDjlMKm8h
	dB77zk35LdbWIhNxnWheSP4dNYIQIKLz5W07Sa/Da1UkruLpbbJ62U1TjsQ2tpiVevYwICVAli2
	k/B1fwUKN4m1i5xt5ai/o3rtXk9GfZg7OEZy7cXSFS09cXF0uGdwN2TaoZxaJAQz1JmAW3t8eZa
	5BlBSSMnB9B0lERxT21J5zrGFRXT3QO69jR3DZw0KUkCQvxCmEwPZsHmjkMLvOyHpgyyZt8mJvV
	0QnExkGdFb6/JOEklsBZg+UgQQ9196/MD+aZCbVnK59rOqaGb7GRysJxNHDgwcxhkRfgjhQKSYd
	qJVX7FS+CDIGncPpxJo/zJf76/W+vnKG6SSr6rwWyLI3L7cBmCq4aS20TrPjL5lzMCnUTBDAplh
	m8bpZQsndWMtslsOUQt8xtk5oKUldQiuT9ZA==
X-Received: by 2002:a05:600c:1d0a:b0:495:7838:7e25 with SMTP id 5b1f17b1804b1-496c642c881mr18935325e9.15.1785231118874;
        Tue, 28 Jul 2026 02:31:58 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm62389384f8f.1.2026.07.28.02.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:31:58 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/3] arm64: defconfig: Enable drivers for the Ayaneo Pocket
 S2
Date: Tue, 28 Jul 2026 11:31:55 +0200
Message-Id: <20260728-topic-sm8650-ayaneo-pocket-s2-defconfigs-v1-0-49e3ac1c8ff4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAt3aGoC/yXNQQ7CIBBA0as0s3YSSiygVzFdIB3qaISGQaNpe
 ndRl2/z/wpChUng2K1Q6MnCOTX0uw7CxaeZkKdm0EobZbXDmhcOKHdnBoX+7RNlXHK4UUXROFE
 MOUWeBW1U1gyHvTOxh5ZbCkV+/Van8W95nK8U6rcP2/YBdazrQIwAAAA=
X-Change-ID: 20260728-topic-sm8650-ayaneo-pocket-s2-defconfigs-7f07659486f1
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=787;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=thP/GwB4GLCCXTXiIlgnJ68amkbzT1D925DfODkrm2w=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqaHcMvmTlTF00t6xn6JmmL4J0JWAfT8Mc+AvjDgD8
 DxwSIayJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCamh3DAAKCRB33NvayMhJ0SEZEA
 CtENtR//eZGAcMjDmMkbG0XBDwq76s5PEOacmTiz1Us9425b1MUfpvJ2EQi9TEdrqBFvjKO1/Jim+n
 7iNUlNXvZBso4ox/xPCuLFiinaLvBJZijNIvNufCU/jHxkFECENvHtbeNTwO+ORwyRy5iEbKjtSjPh
 whWWctxIfYZgmzqQPpTWxI2BAw0ZjNTTsH9eFpX0AmshtzZT2/jsaWj2YBH3BdOJVxE1SVjif4BGyt
 UZDu4cLCqCgNsCH+xYFKrgoaFgSGz0m7zF3f3yOhJ7JhSvhGlvXdkaibEBw7ymjJi7qWMOdJyIGcD7
 i6/FzV3YUiZiKuVCw+AFmF+iMlcj3RamBDDfVmZbuXPhrhYTv8Lkcr4V6d0EfkS6Gi/lb9bfvjGQlC
 tYeQlRDGLcuFswrphYld600eNphsdIxEQvgxttvSxg8rL2bbJUZKxRVwDQb8fhdCADvBtJlTkllSt9
 53CZwmoOEni/Kya+EBsZy3qlcbwDFDbMQ3VZgMppRgbF9snLmd0bWYUB0iqwakFkCRBW+smQYrY+cS
 5V3N7hrtso8QFBPouNKWVi1dxF+E/o8xPWF2/OuMHq99sFsQRIogDKhx26YdIInv1b3ZmsHKhpC1+S
 wV3IoDm6xnKtG7DfJNhtqZeVMrfDTDezghUBsjZHco/WXqghnY1WurhCkkrw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Enable the missing drivers for the Ayaneo Pocket S2 to allow
full support of the Gaming device with defconfig.

The missing configs enables the drivers for the Display
regulator, backlight and DSI panel.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (3):
      arm64: defconfig: enable the SGM3804 regulator driver as module
      arm64: defconfig: enable the SY7758 backlight driver as module
      arm64: defconfig: enable the Renesas 63419 panel driver as module

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)
---
base-commit: 0d33d21e47d9dc66f91e44da3fc9220c74d93df7
change-id: 20260728-topic-sm8650-ayaneo-pocket-s2-defconfigs-7f07659486f1

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

