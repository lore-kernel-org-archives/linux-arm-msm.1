Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314DE430CCA
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 08:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787300031; cv=none; b=BISGXdmcqX0jMq1KLmd9oZ/RwycJthRiVirvunF5YxNlfV++psfe2aYcd5DU+H9nju1zq4osYbJD4XBl+nOVTzqC1J3gSRZe0lHR5Ssf9MuId3tTtbWT5eeC03OiRhocJidyylZmt9CPgvEO1jdPE69IbzdODAa35M7zo99Iw9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787300031; c=relaxed/simple;
	bh=S4gVIUWwuoALYuzwzRm82WuAYzYN5KLWtNbqZ/oM/+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CB6YY6tTE7N+PAMaUBGJL3vY39RnKwLzCK4xTcoHO9sE+MjwwQ7qFY2REaZtvogfbHPSqY0XrG3lBdbXBvnTwcsywMSbLSnDAkT+1w0y+FmEXi0LAmCt/12m2DhSfhy0DgaITyssE1+8W1vOMYWvOeiTCgfWclJHG1tPPzf9k3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJoK4GYg; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJoK4GYg"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-381b831d535so947852a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 01:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787300029; x=1787904829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=EJoK4GYgFSAzpEh9YFNwO5Mk5s9sNwBHyWF80DghZE5kc988pKUQnL/P/xAfGxEphb
         Vu6zPWJhXpiSGypkiAQnv/q12VG7AULICtGMcIL76VD9rYJFtG3gdi2zdj3sxmi57AHk
         iQ2ojaO/6l+V/Zd7+h8eIcitIlPnbfRPmWDPX5OtKnY96px1juK9wbcR68npe3/q8woN
         oSWdb/AILgHZFt/pVqH3sgDEvJc2eM0AiJ63N6X4bIuexU9fMdq6+irjcrWmEmWIK8uW
         9Dkt+TwpHjTZePmkTaqR82A/WjVa/4ZfD6CbHw/VEt0KSb4OC50k/uDP9YU6DZrIfDFq
         NCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787300029; x=1787904829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=c3vX7acKoZ5LEDh5lFVI0gbNO/pnOpiCBPM2n8YVIbZkgiEwvgysGgLhOH0VhTc2Du
         fAOqvLlt91hN7gkhYeMrI7lsSKc1Yf1SIHKuoBgd9TgM95l7ecQ+f6sXKKfBU5G/Jd2I
         9ahws0ObouMP5qe/hIi5CKrwfWrthTsKknW0k11ZCl16MBk0HJ3aC5ATJ7O4CZq6i7D/
         0ljUpaz9mY7a1MFxpVGkx8FZeNH3pX8iN4cQnAznbGtTQUpIdNqM1pnHm2PVzK91zAUs
         Ub4/hl0NLVTQcfRZwz4UqpRM4+8jqri0jEHUdcmWhGiDGEvc8KjV924YH450RJl3edCD
         w5WA==
X-Forwarded-Encrypted: i=1; AHgh+Rr+5RNRgJO4eYvFRXdR7ppnMv2T3Q1CSA/Cikigf5G//3lPt1+eOGFNcXgVZRbx9hCedcoxu3EHdDe3BVV1@vger.kernel.org
X-Gm-Message-State: AFuF++mDPf7oXwI3lrJINefU3f6C5cm0jowT8i6vIJBabMbNw5aYeHye
	cAbu0szr4UewTHG3U8EQFe4eZlHx+c77MQxLQLz1c+ykJkloaJKGDkeN
X-Gm-Gg: AR+sD11MtsfB9Xj4bGF50CnYSzB4cirNdatBii/PjsY9ahMdwEuVo+sUnFuVXWBH+yV
	Ilz6/24MPdCo5tX345H/Pipzey3Rvi4lSW4rQYRlTSJVRN+Mbx77Pq2b0glM4y7CAjaidhCiP3L
	lVmi0fszndxPKsljXMoIpnFM1wVpJyPKRJjFuV+D8mONKly/SBS6ksdpv6IyYyMvSL2FQgKTLw4
	3SHKcGm/r9EIEFpJ8GjqDye+zaufGZjCCjgiZX7V7cvNiNAYNn79JBxgg8aQ7OqWNLcjwPpWokM
	+nYxGxqa11Y+4xGvSsQPSoFAXMdtfgIcC01i1dZ/5HnT4hUrf4FAJAdWpcvsqadGkbvnAWNC369
	WqDw5A/zDLCzuj+u1kke35naS4fletIt+IroGOFEcBQbMdL5ud/NXiSwWjPd7KI64AFilGwSJnZ
	yHwcSFN2HRyr19mgWUB+liSUpkg2n7BxbeaUa8FBsZw3/+SKSGVUP8IDsEbNvtSEVDsPxXMGDK+
	aYLdy57Wnf4
X-Received: by 2002:a17:90b:2d0e:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-395c2f65bfbmr9339432a91.0.1787300029568;
        Fri, 21 Aug 2026 01:13:49 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae48761sm22040786c88.12.2026.08.21.01.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 01:13:49 -0700 (PDT)
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
Subject: [PATCH v3 11/13] dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
Date: Fri, 21 Aug 2026 08:11:23 +0000
Message-ID: <20260821081125.4522-12-sreeshankar0910@gmail.com>
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

Document the PDC block on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d4..c30b88589 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -50,6 +50,7 @@ properties:
           - qcom,sdx75-pdc
           - qcom,sm4450-pdc
           - qcom,sm6350-pdc
+          - qcom,sm7250-pdc
           - qcom,sm8150-pdc
           - qcom,sm8250-pdc
           - qcom,sm8350-pdc
-- 
2.43.0

