Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DF43FDBEF
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 13:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784294676; cv=none; b=m40UHHSrhho64l4LEccl/Pzt+HLAPwJzqQkW7B15hVs9e94ZiWEpbtBLMYpCVNbGVhRPAD3jiQupk17eJJFZESsq+vbXGP7va6h7rcfWEeVXDNJKdj+OcrsAI/JZKu1qMp+/hyvvhY49brGhIhKBjjKsaBIT0O9Be9xsNhzObuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784294676; c=relaxed/simple;
	bh=236unSeVwnwnwtnjaBsb30cBdIDCZYuX+cT8wVq+Nds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mmqCur4apEWeIgNVzRUEUbs3C/ReuU2ZsmcSF1bXNP4CqK+l/CIPIPqFWgUFyjRvq9yUqH/llCFw9YPkdE0cSKXUW3QdyrwtTsmzEzJPqSist+VhRUC/1JloJEUeeFplFnzjodK/tLTzWCtgjYf0Gg2E1zqM3UkuWaisa08fGCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZhasVj+3; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZhasVj+3"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493f4638f4aso37352345e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 06:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784294673; x=1784899473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3VsQ/KzpbmIPz/ijHmyGGKeW2JGVH1BkLtqfTcLEshA=;
        b=ZhasVj+3BJhuyVhJ1xyd8VPTe0MsyIqk/EWMosXu66gfQryQTlT3GfR56UnsGZRsdy
         xzTkSVUPaMBosLXIgPuyrLikyye1x6v6ma/FiN69h96FxLZalR1kbSs4qoObacKuZB6c
         N366HIvI7K/T70jfyponyuuF3CWRbieTtw+CglgYq65UVV38j2xUJdT0/mv8SRTqBFNH
         Pt0ML/R9WTqoBkiyp1jbwgnZzwjIXPOS3PJSyi6I4HM6vyncjbG6xtSIXjFySNLXY4DX
         TZw5d0dRNarnaKuRoy199u47TfuvbtuMcN/i17Mf2vdXdaP83VKCkCOa3LJqgCL0ko+X
         WM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784294673; x=1784899473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3VsQ/KzpbmIPz/ijHmyGGKeW2JGVH1BkLtqfTcLEshA=;
        b=Di7fzYpXhwj82swKWwgQTIT7bVe+UTxGD+FxZXUybOQEWatF3zY0upUKIxuxmt+p5h
         cO+TA+UdLIao3AF0QXyZk3jbGBHtNuoMERKaKaphaVWHdt93jg7oUDYc8RBJWWJr9jKr
         il3vuppI2vL1FpIpk7r9qGxQd2rxhAcgqRTM6d4gBeJN9+4rNVBzCdeUJpbaQ6YO20R6
         2xxpy5RTJiOhPLtdsya+SpB0tx3gvR56Smn+A8SjoFr4N58IlYEB+UdlGhVQhloAj+i8
         7vPFQEELJKFOTMnZ2DepbXJS+CgejfOs9Bn92DrQjbG8HiySte31b632VEqK9F+yUahr
         f6oQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqp2QMnvOeKlQ1ZXOCS9L4C+3Nx373QU2Cr5RIQJWJYJqYRHE0jZHcDoif578aiUn3+YaG7dmpIQsJ9f5Qy@vger.kernel.org
X-Gm-Message-State: AOJu0YzLNXDoguNcegXO/oPTFB3jn1ravnqi0lvJp8r4Koza3Y11Kizy
	t9oeAPPgpqJCsrTeH2DBLKQYszPU5TfenhHM5BjuSLoUYl8D2pXaS1ezgZ6dPA==
X-Gm-Gg: AfdE7cmUPaqTL2MZMe/bG3BoXm8j2+xpMpJ4Q0WDWtFscAbw0Gl3ouC+Ri+YAd+c1bb
	eu+K3t5FRvrk92ctiaOIJAGHbLbBw02u2q5R5tGpxwNTzuZ6q+CL8f68naxy9uoSSPK3WwcbCib
	nM7A0gwFIkpRDKTPYQ9s2/fv8iGKN8ILOjFgihrK0W7DmOgPwEtdA15KM9iptlKdxy4yg7EeRvU
	8nlNFPzYB1hYu/Ag9nDZ7jnhY6YkQKHPMNjpeeR9tRFLEa8t0lZEXzQxCF1SOBIj0CB2886dGym
	cEFUOaiyWlWCOG6R9HsEXFzz3f7gvHu/kkKSIG4X0o9L4AHtczxPBNuatE9Et5zk3kHJHbbIcmt
	ZLf2hJxTyU4XnElvopxCawzqhjSjKUra7FLGtu6LhkG8dKtkrTvT9ztJ2VGjraOUDz7XG+BMFre
	FKUpYd60FRimWrJexzZ+M=
X-Received: by 2002:a05:600c:3b9e:b0:493:c1bc:79bd with SMTP id 5b1f17b1804b1-4954a41150fmr30040545e9.20.1784294673034;
        Fri, 17 Jul 2026 06:24:33 -0700 (PDT)
Received: from localhost.localdomain ([151.27.210.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e49ab8sm4288423f8f.5.2026.07.17.06.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 06:24:32 -0700 (PDT)
From: Oleksii Onchul <oleksiionchul@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oleksii Onchul <oleksiionchul@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom: Add Xiaomi 11 Lite 5G NE
Date: Fri, 17 Jul 2026 15:22:17 +0200
Message-ID: <20260717132218.27007-2-oleksiionchul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717132218.27007-1-oleksiionchul@gmail.com>
References: <20260717132218.27007-1-oleksiionchul@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible for the Xiaomi 11 Lite 5G NE, codenamed lisa,
which is based on the Qualcomm SM7325 SoC.

Signed-off-by: Oleksii Onchul <oleksiionchul@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 0b4c17419..494d1425d 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1080,6 +1080,7 @@ properties:
           - enum:
               - motorola,dubai
               - nothing,spacewar
+              - xiaomi,lisa
               - xiaomi,taoyao
           - const: qcom,sm7325
 
-- 
2.55.0

