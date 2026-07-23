Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218572DC32A
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 01:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784769864; cv=none; b=TL99Ol/4sonc5h/f5BARvIIy6c3J8AsA6zqiiH5iOZ1ntvHxNJ9smVkojm9Y627KS8jp0Hrk0S75zh238J02ytBktpiYMEAp0G+WFNOD5X1YHiTX06oRg8IONI1qWR67v1jyy+pydB0ACAP1A8YSLz1Yxz30PeuT7GZ/1Rh45OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784769864; c=relaxed/simple;
	bh=LnhLqCtXLycdS/7QOpLkbEiXHoC7lU00ZBptzqR4BvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=chM9EVgKZRPjbUuFLPORI27mC9SE6O8vQUONdlD+WbwysPz/Jud1PMsdGZQv/s7ok7wW2cQZ3kGWiEVgcIqAl0oyyvTibkrLo1Ru8XMAX3JcgD7NmObmNc4LkdwoQT/DmIBqxpD1PCaGMR57TZGPWoQ0J3zOJQHK9r/ctoajlEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OwSZyqed; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OwSZyqed"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6689402c7bfso52564d50.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 18:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784769862; x=1785374662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2b7MZm7+ICouxJH7SNvKRjGaatdEuN4EiW++/CDI8dM=;
        b=OwSZyqedpApg5deu1lXJmL3sIdM/KzKFEkddCLO+bk2Pb52cxEgemJjs260B3RaqF1
         pd/i9aym27uoSIhKbKcwBeyb8/TO2I5okL3IIbMWeIAO95JtDvUGpHIF9+do3S/kLCTb
         E2kPF8INYAEf5HplO6QWOHtcMeAL3vzEnAqX3ghorc9C9Pwto3+v7ZTCCQJfvmu8LWyU
         hsHniJ0LRSMg3vvyCeleZgxq0X66pgqVTkR0n8JWlrfdiaxNQ4rRuT/vWE7yl0s4aZor
         mfTY2HHuHBv2xOeoa59KOJZCwGksH7DuUySKEGJe/BEXmBr6wELB0KoPPRwYsPysNPv6
         2xZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784769862; x=1785374662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2b7MZm7+ICouxJH7SNvKRjGaatdEuN4EiW++/CDI8dM=;
        b=E5/B0kmTSCd8YZEESc5QB0VuuWYB3qqU2HlwTF1OCmQ0mMbSXxSCJHTxA8E4PocqS7
         MOqTqoyNZPuH76gCcmdwwOYa8dANwN4MoZYrNO+n3fhi/1CyKNpJ8Fxt9olT7hrM79CA
         girjhD/8GwmoltMZ+8FolsaJf4dpF4o3V4POj/BaUDmVKjbBXkJPPm6MYN9tn6T3Pdp+
         aEXPlXihWZkfKckC3OCHTR3EkVZfzmzhAGcHI2ENA9tY8IADPQ702f5WktY8i4bWspCk
         h9X/cadsP5hMSLPe1gLwnXLq4bz4seFcSEn30x/+T0KG2+fziCqXpVupXKHjqUzm0CI/
         3TGw==
X-Forwarded-Encrypted: i=1; AHgh+RpvPbvqkyHSXRrKCBQs52hKzYjbrLzTypLl4ua/J1du8dnc/rGjDLMMzSDvD8syeTr3pPGhU8HQZTfZe5z2@vger.kernel.org
X-Gm-Message-State: AOJu0YwWjPy+UFlhKoKPPyshbJGn21P7v0ZQsbqooT34IoLL4S3jPuoQ
	ognwZyTIJGAS3TLJg17WxJzLaFIRwQwIqCTc4U6waZopOqeLM9OtMPw2
X-Gm-Gg: AR+sD10v+mqLq/3FSpwZ6Xd+kwKmyawbPVFsbdcFV2enmbFisxZEmpHteFzZAcWk40t
	dBoqcIjultmEOWnNiHG8AIXGUnJJuADOi8hijFiG8NQm543sjCVpFIHogeJM2cQ7VK2gVz7BxHg
	hjXu4fQehV56Z5iE61wx/nZheN/k55Du7NyyNJ9y7OQ7N16HLpJZM9XgazeBcqjy8OI0NCIxVXv
	robOE4d78qsYKKcdr8f0esQvIf1rC/aUco9LTgttDrLxnexVtZfV9h8dlCdyEKq2hjiMU6Uh+qR
	2GOuLsYdaAiklgS9HAJBujjGfl0kBjfdvRObuetfTAapGcUC84Ya3J+9q8przJoXXX5iIJQPBVt
	vNcJQ/p3ypp2/v+N6Sn3BTyTl8MGqlcEmnMfPWEXI4bkDtVwb6zS/lMHDmGYKP7MpWf9TxSAuvw
	iNHfVWDLvahqoSVhAQjgAJsUzKD6xt
X-Received: by 2002:a05:690e:4381:b0:668:4cbc:9c99 with SMTP id 956f58d0204a3-668a4fa2ae7mr177580d50.86.1784769861965;
        Wed, 22 Jul 2026 18:24:21 -0700 (PDT)
Received: from karli.attlocal.net ([2600:1700:7270:4eb0::19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6689056dfbasm2319684d50.9.2026.07.22.18.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 18:24:20 -0700 (PDT)
From: Aneesh Pradhan <aneeshpradhan2004@gmail.com>
X-Google-Original-From: Aneesh Pradhan <aneeshpradhan@acm.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Catherine Frederick <serenity@floorchan.org>,
	Aneesh Pradhan <aneeshpradhan@acm.org>
Subject: [PATCH 1/2] dt-bindings: clock: qcom,rpmcc: add MSM8920
Date: Wed, 22 Jul 2026 18:24:14 -0700
Message-ID: <20260723012415.48288-2-aneeshpradhan@acm.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723012415.48288-1-aneeshpradhan@acm.org>
References: <20260723012415.48288-1-aneeshpradhan@acm.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Catherine Frederick (coolguy)" <serenity@floorchan.org>

Document the "qcom,rpmcc-msm8920" compatible for the RPM clock
controller found on MSM8920.

Signed-off-by: Catherine Frederick (coolguy) <serenity@floorchan.org>
[aneesh: split the binding into its own patch per submitting-patches;
rebased onto qcom/for-next oneOf compatible schema]
Signed-off-by: Aneesh Pradhan <aneeshpradhan@acm.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
index af9fc5b14a81..49c00e219ada 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
@@ -33,6 +33,7 @@ properties:
               - qcom,rpmcc-msm8909
               - qcom,rpmcc-msm8916
               - qcom,rpmcc-msm8917
+              - qcom,rpmcc-msm8920
               - qcom,rpmcc-msm8936
               - qcom,rpmcc-msm8937
               - qcom,rpmcc-msm8940
@@ -118,6 +119,7 @@ allOf:
               - qcom,rpmcc-msm8226
               - qcom,rpmcc-msm8916
               - qcom,rpmcc-msm8917
+              - qcom,rpmcc-msm8920
               - qcom,rpmcc-msm8936
               - qcom,rpmcc-msm8937
               - qcom,rpmcc-msm8940
-- 
2.53.0

