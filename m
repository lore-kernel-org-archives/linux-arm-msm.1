Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C7B4BE451
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 16:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791392371; cv=none; b=NhnC8FJyy22yEOJzJHaLHwnEXCkeCn0aR5I6ToisFxl8v7PLyzMVmKqYTpYtlNAxih5/GmZfVGReuf/8u8RTFI4ajZX4asZoHR0bwD0rOfqeebBdNn/y6XhAyBwRvwIpe1ypV8MLCfzIdG3h3jweU5OjIRNk298WtflEHxMvZaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791392371; c=relaxed/simple;
	bh=3Y4nSIKQIMHtksHP4TKmqeOEV26YVlYf6CD4ZN6MqNA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cZUEIj3UZyXmMCuCh0KD/SpEHNntNjrjAse+kpr9XFjtLVr3bjMowL//aeK4cjBuFA76y5sDErytbagpR8JGcHlXpbt8Ap4DlgjZ6esM0dib7HsAJkWumr6dc7H3Jnpd2jzkgvxSlDag0eYGqOrBCXaFroahHTvw8i1uV1Ug4Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Su3V+hY7; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Su3V+hY7"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so13716105e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 09:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791392368; x=1791997168; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wY0HKhs5xhI+kbPGubJTNM/4f9SJfPTvcRyxFTTWKz4=;
        b=Su3V+hY7eIMTDQR/2oJKBjKRSXm4kMCBMF0VnZgiUj0QnDjPur6Hpbe23flDbx/9lz
         pUz000smWFW1rf8Si3X5A8LJUqzMqcrsPohmsDCT1dvND/taGhqMgqck5BZmCb25SigL
         oZSQPny9f0Z8oJjZSpetKNsT1SJWfMcIEv3JG8CXVOaArTIRlJ1tkYnB03GpMQokEK47
         JWjal6yabomkOlqtfTGhXndRcZpwLoVC87ojH9aYG9HMx4jfdcBovTyCAT0iJCrWShiS
         di2ON1jiBgru9KoMQidtbbAa9ecHI0/0Xd9Vvp8ZVG2x0M+GdVQvNX2zlMxreDc6Y3uF
         J8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791392368; x=1791997168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wY0HKhs5xhI+kbPGubJTNM/4f9SJfPTvcRyxFTTWKz4=;
        b=w7USn3WCRguHcL5SSNOuaWjGciMFnmHS194izgVyzxDq+jfSaf7U05rmzfjMUxm6dz
         N12U2yGUTvQyD1wFiZ1zHluC26qR930vfdy0w1gTUX2YHseIMh5x2qACZahM7TUGLoNL
         VpgEZUvvaTQm4ReXGPhrRxav6Rr8+zLQs2I0Qs81WLKU09bnN2Xbj5j4GE9+xAJ5C1rL
         PUt15cxZT2+3dq4tISVtxCVGyDxx+WnBvCxffINusvY5PsqBb6Sa0mi5NOeeY1X0vN1n
         6eNsIo6z5BRmeSdqd/O3uAxpgg8u7tPlt52cZu5OlJsMmPTp7NRATUUpvgK8pTmyiUoC
         kqwA==
X-Gm-Message-State: AFuF++mrwaVlQ0jKwXDdhrqZZHuxTZgJHhvZka+8RZ9Iy29h6Nu/tUnG
	ATkP00wwaa1Lj8IYX4Hnie/uC+0diBNtn9ZgsvBtrYGHSFYQvLyU6gJ9
X-Gm-Gg: AYBFou1OMVtP7RtLmjTmIjsmEPnp0LTpZjmxOEwepIOUzq0S1tkkIZ4ARpHbEEqMoEh
	9+O55aQu0EbV5NyFYh+Z6LjE2AZr8YOC+yD730eIwWxbiexMlc0VY9tM2+SMgByXuoqOF3dCVR2
	F0WrSsByCb74i11C3sFjajrS1ORHra10WkoHJz6FG1R8YWM9zsPG96f3kaA1GTBUETIibxMMi9y
	6z2SaXP3uun0D4Ybk9XpR3Aqefo9B1j3e1nBjRbtrml23HR5TrJ6dl2312kaMQvHGqlp9zMkBT3
	M/4xM91pNRjebGXPw38dUwqPUlv/yOdjDKNqk5vUJMfYsIQm/eHfMwnwti4J4iSCu6kaKCWPQc5
	STc2GK+v8gwqQrC0XdmvPnTHnHHedADQvB01cgHq0CPEDj/xZ7YBatd+0OuIeNRkJ3HtLgp9t4y
	7fZnEYyX2uex6R3w5O2xkMGUrKobBRS9UhZEIgiJIw4EkOa0GoIqM7bRzkYr3SMiGvRpDBeGUJn
	49/WLhwh6mt0KAOsl5U2+uLqUE=
X-Received: by 2002:a05:600c:8b54:b0:4a1:7d3d:10a4 with SMTP id 5b1f17b1804b1-4a18042a44dmr46613435e9.17.1791392368350;
        Wed, 07 Oct 2026 09:59:28 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1843d198csm4682525e9.7.2026.10.07.09.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 09:59:27 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 07 Oct 2026 18:59:20 +0200
Subject: [PATCH 1/3] dt-bindings: arm: qcom: add 'qcom,ipq0518' compatible
 for TP-Link Archer AX55 v1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-tplink-ax55-v1-ipq0518-v1-1-0ef058756596@gmail.com>
References: <20261007-tplink-ax55-v1-ipq0518-v1-0-0ef058756596@gmail.com>
In-Reply-To: <20261007-tplink-ax55-v1-ipq0518-v1-0-0ef058756596@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

The TP-Link Archer AX55 v1 board is based on the IPQ0518 SoC, so add a
new 'qcom,ipq0518' compatible string for that.

Since the SoC is a trimmed down version of IPQ5018, keep the 'qcom,ipq5018'
compatible string as a fallback.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..2a8af3402814 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -94,6 +94,12 @@ properties:
               - qcom,glymur-qcb
           - const: qcom,glymur
 
+      - items:
+          - enum:
+              - tplink,archer-ax55-v1
+          - const: qcom,ipq0518
+          - const: qcom,ipq5018
+
       - items:
           - enum:
               - 8dev,jalapeno
@@ -112,7 +118,6 @@ properties:
       - items:
           - enum:
               - qcom,ipq5018-rdp432-c2
-              - tplink,archer-ax55-v1
           - const: qcom,ipq5018
 
       - items:

-- 
2.55.0

