Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B6F2E11C7
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 18:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783796228; cv=none; b=s9fxwq6Q7kNHCtFTW8UjqS05QVXsSvMmQdB7XQ5TNY+PBEKRw0yIgwfMrl+a5fBiuwsRLEiT8x7izv8lNbyPNf2/1zBe6s5/uvWZswUSFdeWKNUYhfbP2k8JMTp4SFk1ZbuIMHJWRzeOsvhJL+jIbtbwRjKnY6WyAkoTrwrVXJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783796228; c=relaxed/simple;
	bh=09w37F7G01jmNkwQJh2unBpO+oKrXGgQNCyjoitWlKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IUKy4V80al9T2KeWT4l9seyUEK5jq1axzIqpAG3dBrUSxRnljnpv2TXGet5tScqqNNeOzxmQdqiYrzh/AmnvlTTDkYTCppDTuOJ9lrnHsDemO2jmoSwEmCjWL7UkIDDs9ZeUI1EQhCwr5S5uQpOwOjhmPSj4MJeZsTukUNqAz9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMJ8mN1Q; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMJ8mN1Q"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47dec32798aso2016045f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 11:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783796225; x=1784401025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z9tvHRB7bEupQJjf2HD4EouNWdI+ExQrix2Zn7FFOPs=;
        b=gMJ8mN1QvpYHjeUN9Fw0Fu9ylryD/ZnHE3cVrAtKHeFiCjZJYsbh3YW/ezVU2mDXmh
         p+2tXwF9F80/YU4ABx8MlJ9pCRCxaK1d214V0Au/tF538n9I+zLyD64RQxMXZLpuh0Wp
         qIQc1RwqxKJrHbXqHVSOdUReN+cx7d/edRyN+XqeGKT7xZ8t1Osm1AMTGFJqcvbSe52n
         DGux7JEhni+XuYqDCDvU1TrSFjQSJNCdStUTAa/eaJeQ3D8huF1fMNn5sDHwHF6fwVQB
         42reZfCpfKMr8Dl2WjrWL8yExyOBoyv5hqHPbm5q9Ok3j6WlAEak35ttEx5p0z1fPbR8
         pLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783796225; x=1784401025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z9tvHRB7bEupQJjf2HD4EouNWdI+ExQrix2Zn7FFOPs=;
        b=BnAEs4cjaDLQpF/gRSEcUKVhUfiUZizhKgGKyFbaExuV4xT6f3htTIBg5WH3+PvAC0
         xOVd4aWLTgRg1dad9DB+AaJMyd6qNZ7bPpm1Ez4sSYIA1oWgQBqQkalFcwn26+8Zs75n
         u//+yFy+8iY1fsKM1L1mzUtZTnBmXDDPX9lEkAl5W3I6LU5hEPwHKOKVytI0Q5Woemfh
         6Vi/JL1tp/oFFAuC89qdVNsCYrJofWXP24pg3fSGbKyAWJV1Izz5cwXghqJ/SA7QYFiO
         W5dKzg1taovRme4Nl+Q8pb+3txvDjXy33xowyi/WUUyZFUoR4L7SvjvO1DDg2azN39TD
         hWZA==
X-Forwarded-Encrypted: i=1; AHgh+RovMOhdGEKH01uri8WCZ6qnnmh3lku6RoQKLyDdqXyI37NoLQ/MxrH+w9UhrV0/jjLcqvDDNUiqb53cXRMz@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7vSjzBKUtT1QhW/nNYvYRjSoq4xgALbUy2d7ad9OuFHCeeavP
	CHNfnoRRIkqtaxcipCUxRtJD6BI0c4FqO4ZSNMUhenxSKZBzZ5ir0mGH
X-Gm-Gg: AfdE7cmtQP1mItZ97zRk8sIwyTPLkaoNc7ABb18ic40bd3NsmYwnOdielymDxi3Ok6Z
	L4vs0Ip+Zyduwuk1qF+VJfMGVHCEfBpR5+nQOwgpCaNiS8FX32GUOHY3WkkmDhZXFAsWhUqMmOE
	iBOpPrGAWwALVxSTrb6gQEVTXbCUmlt6yAH6J6dTC+zWTTkh+yMB06MfZfNsgEGjuKsJCmVSJ92
	ccG+wt1Ty4JfKDzguTU0HTx9VLRKU4/TEgrygM49yYSCfHTnHvhm44WUXJCry25zZ8okm2L0cyO
	cwq8AD/N3QkUTG/8VR8xyw0wMA2ZnuI3fm1EcDuIZVbVCtfCor3YcK7w8wr1aJ9YTocczjb6GUF
	vL98E2a4Ii1UqqUAyvRlJCrQnLKeuK9EEAXMhtpGMngGk70MoxordPr2BVOqNNZ12VEa/0Njtps
	7bp0Zs+aDrX9hZpduzQeRejVeemiI7Pw==
X-Received: by 2002:a05:6000:1a86:b0:46f:f12b:e44b with SMTP id ffacd0b85a97d-47f2dcd7193mr4247369f8f.31.1783796225154;
        Sat, 11 Jul 2026 11:57:05 -0700 (PDT)
Received: from localhost.localdomain ([151.27.210.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039afacsm66905647f8f.19.2026.07.11.11.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 11:57:04 -0700 (PDT)
From: Oleksii Onchul <oleksiionchul@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oleksii Onchul <oleksiionchul@gmail.com>
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add Xiaomi 11 Lite 5G NE
Date: Sat, 11 Jul 2026 20:49:33 +0200
Message-ID: <20260711184934.55701-2-oleksiionchul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260711184934.55701-1-oleksiionchul@gmail.com>
References: <20260711184934.55701-1-oleksiionchul@gmail.com>
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
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6e..21b8af509 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1054,6 +1054,7 @@ properties:
           - enum:
               - motorola,dubai
               - nothing,spacewar
+              - xiaomi,lisa
           - const: qcom,sm7325
 
       - items:
-- 
2.55.0

