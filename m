Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8C3430CCA
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 08:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787300011; cv=none; b=c3fYwLnfxIG1ueGYSEoJTv/rV3kzLBGPVlcOmq/rNXZZfr4kRoMtDC6Fk4t/SxGEFc9/I5ycKufHpCMzCdYaM3DTN5e+9pPJhW0KRhR+rx/sdx/KBD/LiDGqEIfRfBFxKr1nA734RNuQ2YTwrjuqBm9rUvucteIlT3Qej3S/7PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787300011; c=relaxed/simple;
	bh=Unl00eAfFi9To3aFPzg9GlTfdXTVfm9Q5VowGJ6jvsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NduAzjKztS12NgcmcTf42EdkGrjyT+GaUvCLca73p97II6q+nz5n1gHlfud42545zIsbwAc5Ahpsbf3yV72/GqlVw+iw7ErxJXQmXLfQWoqfw4Mt6X37SpmfwdbzRD+FRhWRKnI0k8+f7S6Gw6kvBb4+fhtUdej/iXbxrlyiWKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BQOqBzp2; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BQOqBzp2"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbb7926836eso546134a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 01:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787300008; x=1787904808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=BQOqBzp21Tqbs8JhsY/vedKWOJ7Ry2oNulIN0DAA02Xl0ehEzfRIHoFtUagc00uW0E
         uvAPHNDdsfgtNXKFZFHq0FhzW7qCaFQo5i7P1fooDI41/eu1js9XFOVA55RAhd9d9VyM
         WZyYb6cnmifY+hFAMERwU2Z0qDZY7i36UL0FH6okc4/7burdC6Bdli0ezPsn9jO/8z9Q
         GPlk+i1YW1P5iya7oWp//iGyZ4dJmPu6LsDBpCUlsuqo992RFxiONE/0DP1bOLDblJyj
         gqf80xw1iyHP/gj8twXq/pHhat6BkZNtobx6yflRCACgChpWxzLz0rEtV+sJXLHqdJ24
         ai9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787300008; x=1787904808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=hRtgVbYsgE/I/liJG71H3MyGF0xjD4siyrS+WNPqwP/E+KM7S+ynH8rD/cW4CJwKNS
         Q9S0D3UEoGHCzJFtp+TsPpy+it3EiCAcs7G06DYK5ez+nbUHRAPpQtsqW5mhY53pqh8u
         Al2+K+DLy08/HnrR/W5z88Dnyv6D0QDmhiH73nStKJxmMaf2LAIYoy6gJ38xOkAAaLbR
         UcvrkgcME2EHlyeOGy5n39GyIkAi7QvUxTgyEm0jct3D3kJ+mEO4eMfOGtfDPvhFV7r+
         FIYBLqoVlgXqns0r6IsqXiXrKdr8ibbsoYB94U2vvmsVmLsSYGDPl2svYcolbQ4JbutN
         t0og==
X-Forwarded-Encrypted: i=1; AHgh+Rry4FAmZn48rxadKXd6hKkBGdNk4hhaP205gUriHTx9v42fTXrIW4ydAyZnUGEk0JWVFc0OX99GhHvbTmVG@vger.kernel.org
X-Gm-Message-State: AOJu0YwBmCPeMyRaioSuGD6hMu6FWtCoa3v3EQVsaOGc58iEMitKAlOY
	s1amRJ8nubgHYbukdTXGf5HJ0jZZ1Mz0+5V59ZphCX6SY8QxxQCU2cEb
X-Gm-Gg: AR+sD11vpUTTR0uiVrd0s641i9KGcAJODB5pPY4EAjevBxd3Lhb4XVgB50/pHoO1VlB
	EBAPMxVVlYxm6vRimL3+XuDtmn2josL8Ove/Jt+uqOjoS10eJwMDQ5Z9pqDzWvS8zTChyVTA+6E
	NnFy3t8Ij6oV1D+tn0zpokF1OKNrz7BAK/cYwUCwj1X6PjCXZ80Zuq2JFbDY/AzIT2VLwnJH5jk
	rd/kKds0zC9OWw19IXYGHdA80GODMjDgBFdoEagH2QMQ4r32cig4c0esFg7HdHS0W3RXJ2HLeKj
	jlVxA/BWNO4Ur1xKm7vBRkiWb7w7tMVczj3TkBM7NSQlsAHrJrFG+6SMKpUR9gTqkb7UmXtHkq+
	j3iDXXQIaZ/UIHsIQp116Co/GjsD1UkKuUlYjZZ95wE3p/4cY4AmgPAdmM1Zg5LY2rmdoTFQarJ
	Snchn0aw0KLUuTrHO+o2FbXFNUy7+tiUpKS+cHxqlYTlEpjIg/PR7D3L4u+pIlBiiKQGKih5oaM
	bwIsZR4g/XuLBbw1g==
X-Received: by 2002:a05:6a20:e212:b0:3c4:2cf9:28ad with SMTP id adf61e73a8af0-3cd3000a175mr7931614637.12.1787300008489;
        Fri, 21 Aug 2026 01:13:28 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae48761sm22040786c88.12.2026.08.21.01.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 01:13:27 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v3 09/13] dt-bindings: arm: cpus: Document Kryo 475 CPUs
Date: Fri, 21 Aug 2026 08:11:21 +0000
Message-ID: <20260821081125.4522-10-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821081125.4522-1-sreeshankar0910@gmail.com>
References: <20260821081125.4522-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Kryo 475 CPUs found in Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 5be89c584..2a90af67c 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -212,6 +212,7 @@ properties:
           - qcom,kryo465
           - qcom,kryo468
           - qcom,kryo470
+          - qcom,kryo475
           - qcom,kryo485
           - qcom,kryo560
           - qcom,kryo570
-- 
2.43.0

