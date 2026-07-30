Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DD53FA5D9
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785404110; cv=none; b=nohvWPOYTphvTYUv9eUnoU0ys0LTEYETdcGYG97LEL3LcQp+949OyLJHsn34sgh9VvemwVANgJtDbvXQUCmA7iVwrqpfpwvMCrzlLikHY6uxo64P2p+Azxg1IxrNaqaM6UjWeHHT5MMLVQeapPOh0HjaYOiQXB7bVblMVZ92J3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785404110; c=relaxed/simple;
	bh=Tjd+qqKRlPATrV03pdQqCuwbNQZAlKYm8gvQMT9w2Dw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=II8FyFgksWQrhNAt9jQD5u8rfy4tVrzf4SUTZYcVZPkBJJAgSm4ouiE5kTapa7oDVs3KERngavssEJo6AOZZ14S7z8XKifmjkO623IxFOvpWYjg0DDtYLuKoR6lDvEcvCcCPxzzEyLUunjvGFp5n6WO+Gq3xBEnOQd2CcWmvaOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G2Eawk14; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2Eawk14"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-698acd36d67so3385434a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 02:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785404107; x=1786008907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lw0S7j61Xivg5Kyv67PljsWbYXB5K5jcfpwkKzbAMRA=;
        b=G2Eawk14W2Wxzn+5rau8+r/S/V07rV+gwAUQEWin4ziHjuvGIk7PjDpbDc6cI/5Afi
         1c+Gfi/oowW0FVuUQLhtAx1mhjYrbLpVW2+EpWHfRnYyWPHfFr6beET/jNJfuUvIEbIS
         k7I7L0TPB1WVkpwZiPKhb9qIi1CGt0ILvp60OykAhCMzZ5xkHmOEmvSQkpBulpSzfJXn
         9ejkpK1H8xFp0FQW88ggsRzzgxkwYDEZMSH/2xvMqc4xOSg720SK4Fs1tILaEgkBWMt0
         45PktRKzvCvpjX9vzcu2hv9ZPVwQA24JxhqFfpQBZPHcT/MXEvQ95G8ebUWcwcr5jVSk
         2L6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785404107; x=1786008907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lw0S7j61Xivg5Kyv67PljsWbYXB5K5jcfpwkKzbAMRA=;
        b=NnknTo0OZ1dJmBABoq6H9NmcvPOvt3pZSJGomArn2AINhcspoAcQVeQONZHkaPtNqT
         Qy4wLtAsdDRAFduGQD7FGAnE3BG0BLHrsdbrHqBtoDplC6xR8S+9swgiYABkuCvPZOW2
         z7W2+XdNU0Qz+jlhGDSDFUWKkWX9lUbk7PGORziIYNZE+Aajd/YsHGFwPIBZuAuX5TeW
         nQGbGBMhdwVvCeaagTL2X3lT0THHz7Jccy6EEVe7Ezq8fPjPDfWa6e5/kT13eDwaiZnF
         1F/pWAxd7sJJR1QxxT7Gq5ev6wzPCM+oibZUdevYn7K82hi/Hm5WgvyGe1TupzxCQnXS
         zUXw==
X-Gm-Message-State: AOJu0YzozUJvJPSuL0qEtEZVA4EuDXp+0PcGaGkBkMNykJC52tjAydha
	2P5oRFYkbiE3eoB/PEEF4C4Fqc3NCNGFHR2iXOyC042XKlmzxCq2txII
X-Gm-Gg: AR+sD139aAsN3FgFpniXDVQDnMqTPgnLafuHlES4xs7P2uB+PdxGC9tedpnuIcrBwpJ
	GnHFVSxx7a3aJgk5zSm4rrHgiOHLfLKuCwdPEKhxVjfUxwxRbf2aI2w8rwOwH2uJFbmnsbOQnUT
	JjSDQrmbCTKWkl5EQCU0SNSSauX3+yORbFaYvNhLv3IdsVr6nkdsNzA0HmCoydqeIkju1v2qb0m
	sgjVHx5buyTgE6pMv5tJOS3BT+eV2fwgl2fKhKKKs7b4yfmdqzOSrRnEiqtaMsBAppbZWAGZn4x
	IzBKgortkCmKMicscT21GqzkMQ58sGZapSnk4yu1kZdRKJ5HkfdX6BKLsww+g+SoNCDtlUDk+At
	T8gT7EcnMC1QZpIJz19j1Q6iQ2lfke9zOP62wOMEMBPnPgJvG5QZ5u1jJA+hEK2Lz9345enWDxM
	RytgCy9/SifBV4ihf7dEuEY1YEn4VZt5Yuj+enVNL5wYCBpgrNM5EP0Uun7laUGu7yd0oBKstof
	6E4q99K8GmdX//igoWqPlU=
X-Received: by 2002:a17:907:3e95:b0:c12:6d26:1ca with SMTP id a640c23a62f3a-c1fa5b8c45bmr96855566b.61.1785404106729;
        Thu, 30 Jul 2026 02:35:06 -0700 (PDT)
Received: from workstation (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8577e78sm46733066b.20.2026.07.30.02.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:35:06 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [RFC PATCH 1/3] dt-bindings: soc: qcom: add xiaomi,taoyao-pmic-glink compatible
Date: Thu, 30 Jul 2026 11:35:00 +0200
Message-ID: <20260730093502.689505-2-zstaseg@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730093502.689505-1-zstaseg@gmail.com>
References: <20260730093502.689505-1-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible string used by Xiaomi 12 Lite 5G (taoyao) so its
battery manager can be matched to a device-specific variant in
qcom_battmgr.

Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 16ad4f5698fc..8ca057c4e3e6 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -41,6 +41,7 @@ properties:
       - items:
           - enum:
               - qcom,sm7325-pmic-glink
+              - xiaomi,taoyao-pmic-glink
           - const: qcom,qcm6490-pmic-glink
           - const: qcom,pmic-glink
       - items:
-- 
2.53.0

