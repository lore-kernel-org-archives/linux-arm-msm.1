Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FFC3BED66
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 18:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784830711; cv=none; b=YSjFA3uZ2W/UWBiHVq1HShmSHvTvvpQkzC3LfD/lat3SsyNPZxmrgO97ub79/edHYoIuSVVRO6bd1wm21TpAYlhEYtpLAoFCjXwIlChxgEribv6lA1sXaCPxjed0NLfT3NxiBOeyQv3IVm1rOr+XhclTVu/lOqZkQbnjYrMWjik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784830711; c=relaxed/simple;
	bh=YNnjlmdOOeK9GU+75gVS9bzIZJJubhpoaDjK03p+XYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lzSCCJsdjPh/f5S1vAN7cHzvOAJ8Zq6q13xAA25J34o0yNy4ddZmyfyP1xcuvlxc8FMgpB5R2zjvhPxePKes13gyOFDkhxG4ZT/3C8W4fQndGfRx4ZbbzuuadQNxMZFNcCt6MmnKy4jyV9unEHRZcmmUwih0ts8qcHLasyQc2OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=cgjpFXUQ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="cgjpFXUQ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4954df200ddso6010025e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1784830698; x=1785435498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fi3P82Ix1Tb8eWi6q5vyGVMfBwFnpb0LNapIFC8mek4=;
        b=cgjpFXUQWrDixieFdO3OZIHJTQe9gRQLwIh942wQaju3dqhgOJ19o1kjKAeXB2LWTn
         CF61aEZ4k2cpFVU5rJxU6BfxMPTlKWIg1vbKtY+Q0/4E/9RjDaNqZeKWEoqjGiD+1M2g
         Rbdp6cFfHyFMN1lY7JmyRS+qAD+fSrTmMWLRcSOl/3Sz5d1BvNaHLzvT14T6mXhlbcv7
         ddRubHcwPhI7gCEJv+Cff36wAuUiOVi4ZD+6ItlMRGSKVb+YXxRyV+IGSjUzqhr1IzjO
         UPaJ7/afdwtxmiRHRRypygN91e9KSV9h9F2JAVtP4I3+jlqPRqhmNgai0FWvkx9M16D0
         Z1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784830698; x=1785435498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fi3P82Ix1Tb8eWi6q5vyGVMfBwFnpb0LNapIFC8mek4=;
        b=a+vbQiA8uEU4YYftDCQDfJBlghipBi2+lPm2D7duQPFlvYARIN4iDppLeTNcAD5erh
         K8lj0tRkj/+EG3zl+PC29lZWd6EkclgkYmGPUMjyupUrO7Qwf0Or5G+FwXvQUEAL1cpQ
         o3wl4GY6n/xGlyTQhg0l5rUKAQ03WuKLRHFZuwAQdeJp2s+0zKJItwiPx6DjTmj8M3bu
         WeHy7Kr+BqD38UyzVOzciKEkGX7dW4tFMzNIG0QoHQ52H4jDnCkdmeHOb1U/RMLjVRAS
         1rnCre1oGKGB+XARdHNWfAL4Lu0s7Gw+/RYWt4OAw2fpeDi50IR14SjoHOLSWD7oiSGR
         vZQw==
X-Forwarded-Encrypted: i=1; AHgh+Rqd5iCHrPG2zursd/4fZ7cwr1/iMkz34F3vT+08BtK7ECm2zlu2i4ChTee1aCFx23FMeXjGAPmumb5BOXBy@vger.kernel.org
X-Gm-Message-State: AOJu0YwxXMGQBJic4L7nDa3pqS+wBcYgaVO4Sgcw7M3625FCCWuxL7eW
	yCzw32CJubqRHX/U+wUgSZILjGMRK8OpBy5K88021Tp78SWihZYjzr80FB8xeeoPi/o=
X-Gm-Gg: AR+sD11OHLfPfSs3bo56GLcxNEKVUUSxEYLQ/Tow3rYGs6YrSJFxq/1w5K6C+yMqAvP
	4IWI1slTvdQhZuFFnIugPYK/sFGT6hx2iBp+JmhuXaxz6pYFCG2OZ9xwcpJt2rtxrGLGhN9c38f
	3U5ySbyjaaS4ruDPjEwDeq7xA//nQJxK9thUegiW4v/DVe6R1TTUr/DNhCbWixT8kRidCEgLGTK
	CGsdXR3DVmbgy5wdgJ0ZlsrSUZM2F0xT4wMhXc/JpwXys3CSDEarbxLa2YCIuwYYBmzymJpq9kM
	r/9c0l0HAYved0YBypG30vlMHuTtiy4TDS4cpR0FtoRwkOfTHNKfGq2GPH53KapL2nrtfp3+2WS
	Sp6UbrwaSa/nfDMH53sUCSLQkGjfaX6lA0ESQFbGBAmvf1wf+o20d4azZulvMjacCHo+BlBGx12
	yr9pQ4IGHkHl6PShVxhXps4ADiRKM3pIoU+unetzQsCQ/MIMIX8iwrOJtS7C9HBNW2pWo58vcQr
	/kM/WMpquYgL2svaC9PRFv5cBOqqKBothNW8RwseOmEPPnwaPVpTcKeZklzXIl4
X-Received: by 2002:a05:600c:1d29:b0:495:699:84ca with SMTP id 5b1f17b1804b1-49573d142bamr48720575e9.28.1784830698142;
        Thu, 23 Jul 2026 11:18:18 -0700 (PDT)
Received: from [127.0.1.1] (host86-157-235-39.range86-157.btcentralplus.com. [86.157.235.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957af914a9sm10799055e9.15.2026.07.23.11.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 11:18:17 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Thu, 23 Jul 2026 19:18:08 +0100
Subject: [PATCH v5 2/4] dt-bindings: arm: qcom: Document IMDT QCS8550
 SBC/SoM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-imdt-qcs8550-sbc-rfc-v5-2-2fb988854623@imd-tec.com>
References: <20260723-imdt-qcs8550-sbc-rfc-v5-0-2fb988854623@imd-tec.com>
In-Reply-To: <20260723-imdt-qcs8550-sbc-rfc-v5-0-2fb988854623@imd-tec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

Document the IMDT QCS8550 SBC which consists of an IMDT QCS8550 SoM
soldered onto an IMDT QCS8550 carrier board.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index f8c37096df46..8d01cfbef8f6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1137,6 +1137,13 @@ properties:
               - sony,pdx234
           - const: qcom,sm8550
 
+      - items:
+          - enum:
+              - imdt,qcs8550-sbc
+          - const: imdt,qcs8550-som
+          - const: qcom,qcs8550
+          - const: qcom,sm8550
+
       - items:
           - enum:
               - qcom,qcs8550-aim300-aiot

-- 
2.43.0

