Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A8341D4D0
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 08:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040594; cv=none; b=MH6AaGAr0wMr4LjFyeNcybAGUMzoBFI2rrhXiP330TACQ6XLFzZFOc0Ox2sVY55+gi1c71DNzanJMwdQINtKoWtt0fwXeV+T9MaQqFFzeKLnaYZrr7vgL77uGLiB9ShUCXpluPiJtxZBuSERt7GfJtypH2K9t2KU4dgbOrgEvjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040594; c=relaxed/simple;
	bh=R6Ql6qBhxv8nRfMWDl4ii2I8yaMmIwHS8a/lEb+KgZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Acis3r+sPkxRSK6xn8/TxsyXkBfQaX06fkUa4kr9ab2rkMlxi+WiK5p84oyj3lAM/5ztiyhU/jPodUVnwx5VbVMaNYRHm68B3LtvZhPye2BSiFv4G3JTX/CzdRSR+G1Ah2RV4+KJ2nSSudK7Zqb/Pkgh1RrI5YtzNCd+9KZR4Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqF0OkXv; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqF0OkXv"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84f77cc7302so1387772b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 01:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787040592; x=1787645392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xro5hLO6XYdeO9sCaq310qk5ul0LDKCYcbgwbKMsfxo=;
        b=RqF0OkXvtql/Sg6zAj8GbAFhLm80lL97I3T5Zd9Gkaf0mfeenzHtQ3F2IThpdlGxPl
         0AKNqagT6PBkqI33PmpWn9dZ88CJJ80rFrvNfUI9ea6DkbAXc/RgegrD7F6RnLathQm2
         QWe9fLQqD2mu3tepMuAMST+NP6rxhjLJTJnfkHLScU54zEKsWk78JkGpnTrWiA8327e2
         dICxHo6ivixJSLyu4BhM3Lio9DiX9VxqJeChKgq/nnF4J/5DO/+IIGJyXdKU3Fyn5Oa9
         TZeMwJMMxjicsK1ETNEoG3KGU47lNzGLAcpl79o4jf6U+51jlVUbPmWAyr6RbPTy0p/Y
         ptIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040592; x=1787645392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xro5hLO6XYdeO9sCaq310qk5ul0LDKCYcbgwbKMsfxo=;
        b=XFVLamCZevYKf5U3g2olW1GvNCf0yv33WxViwoKwilf+6QEz12VPnnDDhi8s4xu86c
         /0snBOCF+KsNWBJSkQcFJAcZiMegXC9zOxTTB7yktJXZtfvmBlVk3KkaKLV1SUsg8llJ
         +s5Du9LsbjI58jMIuBNidy0veJ+KnnT5QNRjpBAKXoPJuqD0Z78/YuygIblqM9EgPt/3
         xmzXkuiT4jq4xcFJ6vuVhtP+StPPoRM+mTO0VnbdFzmHmH5Ahqclly1K1IGnszkTvqsC
         OmLKKQB+V76DgcauGDtabBU1K52ebIuVG1EGNJLi4rOJyv+HNNy2qD1iPoH2kKd8Nu6h
         +FHg==
X-Forwarded-Encrypted: i=1; AHgh+RqFFyNDh9LL5magLC8+OPHhfL70PoWU1T/WTBCgBqHpwbU0uF0/CZq7TuSW/BmoDYN3Rb/JNt6bkcCsTBGH@vger.kernel.org
X-Gm-Message-State: AOJu0YwGt6MctT3F5m0cHXP68CUzh68PTxiUX2+uRfpCL4gKOWIHvfGw
	JXfftsURAUvgkQJ5+gy8gFMUD4Ei7ihzacUCc78ad1ktp+nKdKw6u1Y6
X-Gm-Gg: AR+sD115Qhu4STJ0mnHXSBmDZzG3woYP5Q4en5I9IX27IqhEjaZK2fAx+GqQNYDoWJu
	Qd4v3J72+P/T0Ucz9Ydl4L8L6+NV2/TTbTP8z7lQMCmjN4r/cYQqCHIugmxVlPzmv0YoWt16gIZ
	n6d62HWRnlZAg8nFCKpTLJPvqIia7NhnROdo6NsPvS6QtURdNzxjXn9CSxVPBrGM7H48+380bp3
	vCmHPYyqjMcx1pNxVmjO0GzuhlSvRHT+rzNAL8v1Wl/mwr8prX+51BPuowyoef2TEW66L1yBTwL
	EvPRmHAU4nb5aVLwY4gd6QvM7y33310RY0XRklFF/gtMPn+9BfQDZnQgv/mBIuVV0qnxr+N3ceT
	BB/ZnhpSUtDLHyGWW3qY1c3pkqwuvQqj9DeOplkBOfAD/AxsY1PnpcW19ljE86No9e/8ps2ACpl
	RH3vbFCPTRPRB2fNqUMCvPW72aWwRcEXIGwaBbLHFYaDVGsCElw9HKvt01dNYZjj4GCqMVA/YXF
	LT7Vic28n4IQ2OwkAQCyg==
X-Received: by 2002:a05:6a20:9143:b0:3c3:76a8:c0f with SMTP id adf61e73a8af0-3cc7196e809mr31096183637.4.1787040591855;
        Tue, 18 Aug 2026 01:09:51 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dd08d6sm22606290eec.4.2026.08.18.01.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:09:51 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 10/12] dt-bindings: firmware: qcom,scm: Document SM7250 SCM
Date: Tue, 18 Aug 2026 08:07:52 +0000
Message-ID: <20260818080754.4362-11-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818080754.4362-1-sreeshankar0910@gmail.com>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the SCM compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 25f62bacb..7446a54eb 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -72,6 +72,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350
-- 
2.43.0

