Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169463;
	b=JvDeVi1qhJiLPZoJqkJ6OzCL1In9FD5A/WeyNWhMLIBISZqYhf1vI2EOEw0LdwBMTXDy
	 ldex3a0/Pe+7LQ+NAx40d1LKzP0b0ZjO9XHd4LhEj+7byhkVW8bjCBBDGjgAtLTdHl7R0
	 tTe6jHobz135E5J9Uc9Dc8JF7wqxmRIQAvqBwrmvfEbhr9REpPjL6B0+LHu5Lx4j4yFMG
	 NGwT3WYqbJEEx+KyalfDutddscA12Jk+uY3LKvy7sYV7WvCyA2enkkxVEIRUH7Opx6i97
	 qjFZQPx/ZrJm5CQa82O/Ck2OBAlAEaiEnuq3oCW8D13g4R/IzbFP5Y47cQQ87PAthag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=+X2P66M1lXCjV9DI3ActaGpKyPOmtotCNbn7tD4AhLo=;
	b=OZdVdTZsuGR9+PjDljagKyBL9fWAZFpUid1N2LaGx6hLGPjP4zDNL4O0fsh7JKzfxKeh
	 2bIH03Fq1Ey/CI6XUxOHZRf7wDdkOvkNrzhx59uogxwmOHvS4xoVvFeXhO6ukzvU5P7Xf
	 jDYtc6nqsQcaO0Dnz27E9soIy+pDFZyD4ewqk9ncPQomvHDiPkjnkUIPBq/qZnernszFl
	 R6Ky53QG5hao8iSPDLSG6Pwf/YikR6b3Fc50mMiWcyp3LZoSBzGf6K3W8wjFbpvxaqR0B
	 8riSpRtZvqul1CBspU3+RsiV6tUCYj/c0TbUFC8V+QiHQrBR2aVzIk/JPmiokAC6zHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rB43Fbn+;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8275606A325
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:11:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8275606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rB43Fbn+
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso426786f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 02:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795169461; x=1795774261; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+X2P66M1lXCjV9DI3ActaGpKyPOmtotCNbn7tD4AhLo=;
        b=rB43Fbn+qwmU1ELgHG0hARagsN5peq998DdnJflLGLIMYogt8npO4/0Dsut1FPhHG4
         CcCTnM3Z9AWehcuiTvv2Gj2Np3jXRh7ar1uUMut2IBlplPKe6oKlkf82qR+IjO1zQJU4
         uQjRwAtu6bgUtbcGuhV6FdB6WFclgNLl6Nw7VWzuflSc8Hu4qy7PO+w/kpK8yqqLoBfY
         Ses3vx/IOlbss30hl53LVqar9O2pmjBp6b9t8YZgIr4pMIMA7KiCXsJdEjLylc9T+JBs
         tyCrs9Xj9mRnvOTToo91qQvMsTEVtkuvT3tgD7kKTZCXK3IHXL3bGElircoXGc5MSGjC
         nwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169461; x=1795774261;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+X2P66M1lXCjV9DI3ActaGpKyPOmtotCNbn7tD4AhLo=;
        b=mOo/YeRk3yuyp+8Ruk1F13jlvDn+PtfUziKNBctiWjAkZ00c8wXzh7Rfgz7Sgsv4ve
         9OlY7ApGDli6gbEkGO5MbaecLO9FO7DRHuUGBPRP0hCbOnJRt9C9j0MFGrv5N6uDgsym
         yNYkfRFQgAWxHd5nJmDT0mxG1dwt7f4c9NPlKlENAomaTU6DBkgz44gyg5Ol4XSxzmXo
         3u9IPX0v6HyBB660du4Cu0urFwSo7DbdiBuvWt+k3jlgsMxGOnSIvHWrlSOs/ybNVnbh
         Ul+CIV/Ld9rJTPwFGEaWh6fpPfuyeEN6o41M3uHGvJLMecV3ZxszzIhyMf7YMijs9ex0
         Fu3g==
X-Gm-Message-State: APuU4Z9NrOwRD9MUahP+5Q6/uyW2qnB3OudnznQdhOSjVAvO9WPkTunq
	/or15EwPPOuUv4pAUHF0VjSImRdAM3jU2Y/Zht7yxNdFQjVxq0BcMEYQadtPItblUijlD0dQVcr
	deg0eTJQ=
X-Gm-Gg: AZFdTZcfnFPmysqwYZr9W9Ia4mnOmaosXvz2/66v0EKRjMwXEw9tOHDoxK0YuIaVRyO
	XxlFCz/qOgPtJKCUSuLkeByvBorK7jqPx35nfMgeJXDh00cTYbXVmvxXPVK/Hj9mSw6PV5LuCA0
	xqVDDPELFkFmgFlQrXKsB0Fo+c/zIYvuWNY3zOi8v6GqLda8uxTqPqpwE+1u/1YJjHCbGdiQMkg
	RcZvjx+8f4+0Ojzdde3w6KBpv8l3IaMK6fVPKwLwSCJ22oe3QLwmWzJvFVEJMKp1ThfAcIryAo2
	/oBL9FKjDsspUOv+cjdShdTjleAjAMIop8yPLfdidfZ3FU1k8+X/p/NxTMgjhnYrFkE5O1QkNuy
	hHxYf/flOgT3XDtxWBzO2ixb36vZ0s1g2VelnMbti4EP65I1sY9uKqFZTobTufrXuipT1ayPZBV
	qc1Z57ji02J8aMr5r21fSc0+h2YZQtTnpAhvqoKC0QxwlNISLpwHZSDXNNG8xFNCD6/lLoHABHG
	+QmPLo3A0OKqf4nrVhiTFQiylz69yZ/+yWyoV4r7y2IjcUa3hq9Qhz03u3kNoBwdkOJtDXGSFnr
	5sz1rxHp4o3EB4UPuZueXfwQ2+ozRy3d9uwY3v+euhU2+ZS1w38=
X-Received: by 2002:a05:6000:470c:b0:4a6:ad0e:6cd4 with SMTP id ffacd0b85a97d-4abb759dd4dmr4599736f8f.48.1795169461013;
        Fri, 20 Nov 2026 02:11:01 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm4674937f8f.47.2026.11.20.02.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:11:00 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] regulator: qcom_usb_vbus: support PM8550B
Date: Fri, 20 Nov 2026 11:10:57 +0100
Message-Id: <20261120-topic-sm8x50-pm8550b-usb-vbus-v1-0-bbda7b708359@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIALEcAGsC/yXMwQrCMAwA0F8ZORtoyyrVXxEPTc00wrbSrGMw9
 u9WPb7L20G5CCtcux0Kr6IyTw321EF6xenJKI9mcMadrXUGlzlLQh3D5g3mMXhvCKsSrlQVbU9
 xcBfLgSK0IxceZPv9t/vfWunNafmmcBwflZrqz4EAAAA=
X-Change-ID: 20261120-topic-sm8x50-pm8550b-usb-vbus-14baf291e8ba
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=786;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=dCoXljQk0vCwBnBceIsu+9Qc7k0ECyYukQk/bODbAII=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrAByz/VqqfDxo0w+8gq9XP5KjuBclG2X/c2x/5ir9
 2g5hGhqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawAcswAKCRB33NvayMhJ0fOYEA
 CF6kEIoP/fB7P/5O94hVj2It3YLHcH0SkctguuSe6zXULjqzwfle3WkOUI2jvTSUtmLFPbhT2+h81y
 OTozs30JQt6YqRUGUouq/mBpZsqUYBJEwwyJPk5wKIfFM2OMloiyFvYDu3Kzx8z6sQvEV97zE1tOgo
 4q/5TEqcfFqqS3AHyk3pHav77LKZNgxScjWU7aWVZrlPQlOowwqCb/mBGh7QUjDRk9AxO2vvGUYp08
 3GQ0sBSZwnY3/9bGXQvLMebc+u1YmeCD6aqA0Rzajhny2YFzxiAMoERtD04mg3/xKHmYGdqPiK5ua6
 8LGI7EN87DwtWII2Ah5PIWfsq2taGY0jDEQN+ot7ihXNKih1PmpPhF2EoU5lNTXRuluIoQkDhgY5sw
 8S4MAqSERLGzskl5muZJY9nrUoH7226VyovbgbvLQCSdhcA0wlUDtgNPgd3hbSoCcT4QMclsSIzFt4
 bQtR1QZwkW99OKuxQRSAYAGRxeO3ygsbjCYmLbmoP2Y3Gduq2Q7v10MD5kCPweSnBNvwGEdC+WAr/3
 Rhwc72IaCyzyv3T9ZFGUMCbj4Um/VVO4MQLpVk+BsDMREn1ih4HKRx7Mx4yLK3tKn1IIbavg9PSQi6
 F0+HrmAj2mpA0+d7n26x6+jhQ+i7EdZ1hVup0MEkwojXIjn+/v2iFgH4NzLQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document and add support for the PM8550B OTG boost with a different
register layout, supporting a current limit encoding from 1 A to
1.75 A in 250 mA steps, then 2 A to 10 3.5 A in 500 mA steps.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (2):
      dt-bindings: regulator: qcom,usb-vbus-regulator: document PM8550B
      regulator: qcom_usb_vbus: add PM8550B support

 .../regulator/qcom,usb-vbus-regulator.yaml         |  6 ++++++
 drivers/regulator/qcom_usb_vbus-regulator.c        | 22 ++++++++++++++++++++++
 2 files changed, 28 insertions(+)
---
base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
change-id: 20261120-topic-sm8x50-pm8550b-usb-vbus-14baf291e8ba

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

