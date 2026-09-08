Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A99E54CF4B
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 13:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872884; cv=none; b=utPCuJ2JwKUZkE2F3N8+fqRuex2CPQRwrgTFNL7lqh8XXs9n6J6kjfyySBZpmEdZs5340qASSKUjkVtI4axUdqf2bqdR4ESGu/IKQNI8KPEEuxttYbYPVGInreGyYMLRY109fufI+Y5qdbdQF9Fe8T8gJ+5pU7tvA9tCv2NRRZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872884; c=relaxed/simple;
	bh=gkkTYq1OpW1LdtRjfwsi/bJV0O2wt9hs+XlnNEqqaw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mM60vdE8Bp3bj+9PQxyLwxpfhjiuNPgsn7nm8+sbvr7/69qJiCMvdwnVG19Rpv36MdolBrLr0Xo9eWB34elIs/9Z1xCNBH2d+nMyDn7MyhrxCKmDVFYDpkdermlgBrtiGtEbP0+HRSzIHwIV+2vyN2aVmw6HdtPrOR05mYrMiQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CQaVp+R8; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CQaVp+R8"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-485850cbac3so2978197f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 06:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788872880; x=1789477680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6zK26D4c5pgQKL2UdaReKAoHDcjPjh8dzU2JRSqnNNE=;
        b=CQaVp+R8OR9mHUoeuDZWeZcJtaGV4ThWXqnYEbTTZ/oFshajW6hgPxOEbDM/pA5BD0
         yVe92J/YOBdj8RfxtlAo5PAb0YTawx9Ey5J88LWqO6iEQqWKMSa0oBIiFfXJgP1ZryDy
         QXVywcHGv5IGcFcQkMhIkYI8iqbOq4mo8IIsy2TZ+r95RfOpcfQR1j0a2YvrqOHhZ9g9
         05/hg+IBK74GO3lPRuLewoKSQpxBpRhDWDCap/TvaeVBbW1r2sO1Jw5foLAY/P8HdbPL
         RmYofswyjiPrMPe9AWhGv/Apb/gCT+Zd1EA3BhDp6Kj4Q1USlYGauAyRcqNnvEqVvkqM
         pYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872880; x=1789477680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6zK26D4c5pgQKL2UdaReKAoHDcjPjh8dzU2JRSqnNNE=;
        b=DDYniF+P6CQNq0NqRnRkm4PMSCWASpi8DVMAJLK6WoIzoVBwjUZN8pKkimfyKjaCpn
         etV1JueNcH0wrmRKxyasEkoPqaZsLT54TXE1nOlTk8nP7DtcIDGEnmlJvJ7Tog1qVrFo
         9EWHCl1U3nC8QM1ucfjAQaoY2VfGA4B04OlpN5KtV2g7vCNluIS3/+yNTGkJGHFFDUoa
         u2ogJXWb2SSB2A8Ye2q7Ymhnm8yZJapKDL9ewLjOAx9hEY82UEPUzOKl2DElCEXyAb4v
         4e7nTL2LwnES6K192NS4XgQDIiVZZy5yd4aAs5K9RNt4tXVIU2Qbkeaw9LMf09mO8diI
         xdIQ==
X-Gm-Message-State: AFuF++kAdGqeHgTj8YeXbZDpPcCuDcotClpF6g0uurzWRr/a8KZPoqJ5
	PNCsbPtS40Ba15+ZHLddHR12+r9sE/ZkV9WT3qhir5ZFmhodbgTgBQCy
X-Gm-Gg: AYBFou3Bzkqdg9sVJBcxBgye1zluRblAl4mtEmFJsTrsiKQAfmeLYNCdeWZx3klE32C
	NhozWca4vUu2sh5QCAfzPayabwTMab+A77YLeGc1atTfk9YgXnRlxAB3n4LzMQmUq6YSidDWHsd
	uof5uzGj7AhkTrWiPbqZzSf23eVj8zaZevCJBw5iKSRKeNiDcdLur+cdGfDNQW7WBeDzuXjjPkV
	pcTsBCpXO8bQdU9GIg/uuxBmlE5OIx8QWsfkdLSAzws+/AMlZhQsB72e2LqhToZnbjfv4Dunsft
	go5waNE8m0/4teJiFJQZJYAXSyccqywiW+80ObzK9FY1hJ7GIloSemFXgKuqglL/Ga0uvJFXRQ/
	JysmbJYgDrkxSUW1wk8IsjfGKtkuS9TB69CeJmAMumnDnGEWOaGhmg785imb4EpWhAf3mFkOpi3
	We/pLZR1QCyfJlq0prnWVDffv/ikCIqDNB/RmfRpRQNyZA/3KBHHmeFblO18zctETV2lZDhnSRR
	u9G82VqUWkIY/YNkQZN1t/yN0cdm/oik5O2DAMsJoc=
X-Received: by 2002:a05:6000:610:b0:485:82bf:8728 with SMTP id ffacd0b85a97d-48586e32b7amr34058783f8f.0.1788872880038;
        Tue, 08 Sep 2026 06:08:00 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4859162f354sm28884165f8f.20.2026.09.08.06.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:07:59 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: mfd: qcom,pm8008: make the interrupt line optional
Date: Tue,  8 Sep 2026 15:07:44 +0200
Message-ID: <20260908130745.2545-2-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908130745.2545-1-okerixx@gmail.com>
References: <20260908130745.2545-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PM8008 raises an interrupt for its own status, its temperature alarm
and its two GPIOs, but the pin does not have to be routed. On the Lenovo
Yoga Slim 7x Gen 11 it is not: the platform firmware describes the PMIC
with an I2C connection and nothing else, and the vendor driver talks to it
purely over I2C.

Drop interrupts from the required list, along with interrupt-controller
and #interrupt-cells, which cannot work without it. Add a dependency so
that a node claiming to be an interrupt controller still has to say where
its own interrupt comes from.

Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 0c6e1870db1d..db1592e115e8 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -88,7 +88,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
   - vdd-l1-l2-supply
   - vdd-l3-l4-supply
   - vdd-l5-supply
@@ -97,10 +96,12 @@ required:
   - gpio-controller
   - "#gpio-cells"
   - gpio-ranges
-  - interrupt-controller
-  - "#interrupt-cells"
   - "#thermal-sensor-cells"
 
+dependentRequired:
+  interrupt-controller: [ interrupts ]
+  "#interrupt-cells": [ interrupts ]
+
 additionalProperties: false
 
 examples:
-- 
2.55.0

