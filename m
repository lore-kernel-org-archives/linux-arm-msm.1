Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C1B3A9D83
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231124; cv=none; b=NUkUmWAFgeuYcrBtrnJul5c0pGSThQnEJkY2BdwaG/73GmkQDPbCaKz/aL/jVr5QQU2013d5rRsuH5UtzI1qTpGY4e8mo7Sib8u8mFB38bva+Exxj/Tq8GagimJ1B90scSuX5beG6GO3w9owa7h0WS9Hizin7pv4hKuxe57U7wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231124; c=relaxed/simple;
	bh=QkAQArlDCgge7Yn3Fw0ePWELfay666Rr/KRC6eTwNLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ea7BVWt0ADX4/dBvRvyfzA617ddcsLLGTo5j5vZjyIwloRx5/NFOnBzWYAu6W0jFmeDnExrBF4dqLNlwcaplhpD/b6D5tPgm9zDcTBxAVefhl25Rq7s563eYO3VNkfWlsG38Ammq7kNLJqQY/QRs4JsMWeLTJTY5ZGQEObcz/so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SqI6ZuLf; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SqI6ZuLf"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f703a9d05so2387874f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 02:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785231120; x=1785835920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cVYEtk0Fsl/xm62f6qIKmBvKUDRO9X4B5IUMFICX51g=;
        b=SqI6ZuLfg7n7UyVNP+jhlPqHmRbfoh5u5Kp2inlFGlKROT25dF5hhL1cuGzXQi8noe
         GzdaiveBAG0ttzIj3TqiyoA3qOcjgMwQzXAD67moNt5NMDwtKbu+dK3tLekl7PRX4QK6
         v9VIHu5AdE8RWExi5tsp2PbuegrEOcb/w9jbTk4L7wENkAi5S2kZMxrXh6KmayAUPYHP
         yL4+CRBUJ5wHO9Ho1mjjv4n3V3NiFSfI6UyYyYvWR8SYcTVgV4OlKKhGmFSb5RVcgdjX
         DPkUQtYLOFU2gHvIyK+Oz0Gv1Dqz29WfLnlcNc+Q9Y0KNho98Po2Ujasgjv3GSjOBds0
         nGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231120; x=1785835920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cVYEtk0Fsl/xm62f6qIKmBvKUDRO9X4B5IUMFICX51g=;
        b=bTaRGiYrx2kYDg9j2PTdwsO4Ntq31BvXJtPRbfIf0Xe1YvlpT0FQJ+ASE7QIrEgikG
         olYg6a0u5iDNSGfbTqMYUyLVi1YmPmPDU5+hPhrYPzSJ+O0av3qKbU/FosEYI1JZcXeI
         nQ6B23kRvGu/ASoCA5F+lmomw6ErkwfznIT29iECs+6Z2/lmvUnhy8+fsAO9/DqRk83/
         bJAj9o5QT2OlUvovmE9xJNVnc6NCOjXj9hQbUaNgCbFC92CkQwADtOdNQmIsCbpWnHGh
         da3IA7PjZfiBijz9aLRi8IRH32Odtu2/DU9lXP5A7RaTsk7/e3TIp/sY9IsclpCvOqbs
         36lQ==
X-Gm-Message-State: AOJu0Yxs7H7VTOD8104Aq2e2smO4cMlL3a8pfUBXCrltBTGOklVVQSTn
	Ti3khcgXg6+pjDfsVgoMqy+mXbvD4EZ3d9EhcRl9FXNhEy1skyPCWjU3mxSBAxoHOBg=
X-Gm-Gg: AR+sD11OOJcLvwXsomKu05XZjzzqijLOzFKgQDmomcIAuNs5NzE5MX8DoyGGOK4XkP6
	QUkZheBB+m9AXq+vq6ejhul3yFuNqVuN4NJ0pCEnH5c8r+tTk8+uFL6CWD9Qvd7XzJNYaTyFuKJ
	Dx6tpXJozH9GMnwX9O0omixv7AL+eOQjJXXYLkQmIA2Lvvg/5d+NNnrryUTtiZktAvx/U90ksXm
	ziDd/nSCd0tGGQzwK6dz7RZzAcV8juDq/2tzwwY89028qCl8vjpgivc0URCRK+4fecfmr956YZL
	oJan4o/+niARebFfPU2K5Iehls4/6SOz0pvM+72ctxDmy5TLxhGHDhwI76oaRv/s+vYiDdlTtCs
	QQs+d6SsdB6QySp5C7UDYOUKMDXQjf89c9jnIaCJuMlSyoFkb1ukGU2ODzIqAuFkv0lNIJ3pU1I
	xUt7xak21Y65zkXh9f7yCmM2k=
X-Received: by 2002:a05:6000:1842:b0:47f:9759:7f0e with SMTP id ffacd0b85a97d-47fb1e5cf35mr1811410f8f.7.1785231119621;
        Tue, 28 Jul 2026 02:31:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm62389384f8f.1.2026.07.28.02.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:31:59 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 28 Jul 2026 11:31:56 +0200
Subject: [PATCH 1/3] arm64: defconfig: enable the SGM3804 regulator driver
 as module
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-topic-sm8650-ayaneo-pocket-s2-defconfigs-v1-1-49e3ac1c8ff4@linaro.org>
References: <20260728-topic-sm8650-ayaneo-pocket-s2-defconfigs-v1-0-49e3ac1c8ff4@linaro.org>
In-Reply-To: <20260728-topic-sm8650-ayaneo-pocket-s2-defconfigs-v1-0-49e3ac1c8ff4@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=721;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=QkAQArlDCgge7Yn3Fw0ePWELfay666Rr/KRC6eTwNLE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqaHcMmh2oKYipCU4ePc+D11GXsnRUwgtyYCVmU/b/
 OCElg4qJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCamh3DAAKCRB33NvayMhJ0dkDD/
 4sSt6rPo/7A67airdzHzVKGinRHGEmtYZs5QoU7mzWLu/Q5SG2IrXvfCJ/41koV15TGMkoRgQzYcbE
 SHWpZoIdPrbA/r0kcPAuj2jkbQOVTOQUixjnLz83G2tHyrTt+ZmirrUoUpgSRtqvAuSTjShZHXVRa/
 PWG2C7pKsDlrI4QCvcJZHpVbeZ/TiFuELBss6dAf5gN7oyYtjRTkM1/Fa2pFlGXJlO8UA0jVHbjA/s
 pyJ/yD/SvydgS5epsfQ3wsuQkZ624uAYxYFGUsLV312v1UpNW1DDyQHka44j77J3px5lWrLJc+iQtf
 SMReyU6ZO9JJcC2Q1mxEH60YwxQZwtji2DGD8JEon+sySVjnFOgltitjmv7x3A6T2+lp+UmyvdbXNR
 2snUfq/3ODzbcF5/UlYBxDHezDdV7Iy4n8Owz1HB5O6FMkrN77jUXAZ4aQO0Kz9S2x9ZCSBmnKIaPl
 5C+I50qdLAOEIFoiQBljvlWGG3ch5USJMsy8yK9hQrabbR/zV3YcP9491KGjTE6zVjimCrzFd0wd4v
 uBfHt9tbYU93bbHNjuKHesrZB4RPnfMzWTizfgnXWErKsrncMGfrPULXGht5ybz6ePstj2/MWtaQUw
 Et7ZtCM1t+UVnjle6dx9e4BN5WfdUozMm18dizTLe1w359KXfdoGu0XqtILQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Enable the SGM3804 regulator driver as module since it's
used by the Ayaneo Pocket S2 board as Display voltage regulator.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98..97a51c238f55 100644
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

-- 
2.34.1

