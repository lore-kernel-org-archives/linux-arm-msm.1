Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDE53FBB4D
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 04:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792297818; cv=none; b=KQDmuCzB0vsPPwgOau6J+/d1cPCdJW9xsLrF8TU0SuxZngB5xV8fv5SeQGHaLMFiTf+kGOgKZqtMvTNWuf/4M8gTalW1iO4xMELpz1Q0tZ1Yj+UNhdkOasBZEITO3qyXP5SbJuY3I7PBN0iBpgex44BKV7P3KAv3VzFqGvq1RPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792297818; c=relaxed/simple;
	bh=hAfXoKWlQ0jAYSRb83dpejZBHSXKa/px0bS9uQ6kQ3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eDLA0iFIfJ3nSfccLMrMEnP78Sk21DoS/AI5wHRDaELujyFONaTih2dOhQMkdenTMLK6EDqtNBYVXd/ZruL5YIup4vvFExB1Ia9p0KruinKBfiAXfd/7yq3iIO0M7GCBDvHLx/Xz8tspyZOkGs0nqySn24AJ8bvR6AoBySNgr8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8Il7KcC; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8Il7KcC"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e985106c0cso7171785ad.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 21:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792297809; x=1792902609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C9/qTcpGmqHaagDBr3uuGLszB9r96QIe5+vf42bKI7w=;
        b=H8Il7KcC49qskOzNjTWMS4GJFZ+XankItDHzLPmC/bTan+fpr1JIVIUmSaIWVzAw5a
         dJdXpq47mvtzf70hwiBVCrlCAUWEsm9WV6MYg41GL4kpZjQXbPcAqr1zuL66YQHz0Aas
         p9oA6nVtzgDc5xKT18NHY24FA+Xjw47IgGWKecncGwipZ1MlynnKkwuVoqND9FpKG8AL
         0aT9ESnqbzCpvCP3viO5C4hZ/MQe8E9oQNrXxkBbMcc3Cz55oOOPLwkOjMvR1R2+r/hE
         6wqpYB+aamwQmCFj/A+DHpdf5Lu0BaRNAMXzp5A2fj9R8nITMRDcHCxMakOSLSFklxCX
         wGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792297809; x=1792902609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9/qTcpGmqHaagDBr3uuGLszB9r96QIe5+vf42bKI7w=;
        b=uAzk8auXcvz6s7stcqngq1btFuxnEwuSkgHoSjtP0vpoDQuRF3c0dlssqVRgTkKxVx
         r6A2x3Iu4QiQg6M3imdSfal1hVDcqAKZ49ouUracXv8Tg7n7Pr72IBJWEX/3xOXMlws0
         zj2gjME/gJ54I9ZmcSpa95BSZ1369BJieMkhI0vi5kR9Ci0+6TVC4KZ5piqf2d/VLyrs
         hnnxv8LMHSx6YgJf7Zo2iKNgwGs9zzn/DEs/GVr2ng9Cj8BQDzhIRFUyYtW3oXCYSAVl
         4/Vjz+aHDKVuww3f4FOOlf4+bLixrY0Oaopa6JEyy07D9kNIaZz7Bt9Mn5a+f2+d/LEC
         qMTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvQ9nCs8GxU0af4cWGCUYXcWucO1gfBg3S/+ZJnhVaTryHuy6BuJcpixiI6WWHKeQAiiiV9l/fx90DvHW+@vger.kernel.org
X-Gm-Message-State: AFq9FYIl2zf6Eu/cCuOCH4JSQjZr6InDdifhUJMuPX4WqsXMGdrybvGU
	IIqxNAW/ejnU+JIM9WcRlHiLISjV6tk9NRYvEBr7dMNKUCzE/cAprVvR
X-Gm-Gg: AYBFou0/9M4rLOvQGupl+8Uu338Aan659Q7KXul+zplmsM9aWwlhtX5x51vtvrQshuX
	WRZSaV+6URCo4vO59+QId518g34O8a+Edik7GXtjmE0PaQIGQpStypKI9gvssWd2DucxQgp4Ntl
	U1NQmYRVS49jW1talDn6krtXZcgzkJdbjb2b5NcTRrqoYn5PdtJTf/vq1xdmDGIrqBK3MbEcBCg
	Nm3C51vGcGvbfVcCysM6BgWaGNkQ62B0t8zbsb41HN0x+SKRdod4wSTQxSfXB/sBkBOwHBV0M0w
	j5/ec3wLs/TMGcdTbH9D+hSZxX8ln1KWGZfx9HJuHL2S6STJaDjujGIKAo0qaeQhr1cGQELW6gL
	fihLxoCe8xeIiWngWdi0C7/pSBVQRDQg4QSKPFVmkAvkXbXOXt9vLugTkuwloYUsdcZSFaVe9JE
	QfZV86VZgo94Xf5qg37T1GCKS/dEu0cWpzpRICrn1IPj1WEox5GsakijaagGbQ7BZxIVTGfKu9t
	NI=
X-Received: by 2002:a17:90b:390e:b0:3ac:ba49:2fed with SMTP id 98e67ed59e1d1-3acef5f1d7bmr3980364a91.58.1792297809016;
        Sat, 17 Oct 2026 21:30:09 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:7618:4e1c:8841:a092:12c2:47d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc9e47588sm5885369a91.1.2026.10.17.21.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 21:30:08 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Sun, 18 Oct 2026 04:29:21 +0000
Subject: [PATCH v2 1/4] dt-bindings: arm: psci: Add
 skip-suspend-mode-switch property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-psci-fix-v2-1-35f65b59eb9a@gmail.com>
References: <20261018-psci-fix-v2-0-35f65b59eb9a@gmail.com>
In-Reply-To: <20261018-psci-fix-v2-0-35f65b59eb9a@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Christian Loehle <christian.loehle@arm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Val Packett <val@packett.cool>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>, 
 Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2

From: Alejandro Tafalla <atafalla@dnyon.com>

On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI_FEATURES reports
that OS-initiated mode is supported, but every PSCI_SET_SUSPEND_MODE
call is rejected with NOT_SUPPORTED.

PSCI provides no call to read back the current suspend mode, so the OS
cannot tell which mode the firmware is operating in or why the switch
is rejected.

Add an optional flag that tells the OS not to issue
PSCI_SET_SUSPEND_MODE on such firmware.

Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
[Reza Kurniawan: split out the patch, rewrote the property description,
 renamed the property]
Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 0d04389c81..2eee38d155 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,19 @@ properties:
       [1] Kernel documentation - ARM idle states bindings
         Documentation/devicetree/bindings/cpu/idle-states.yaml
 
+  skip-suspend-mode-switch:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      Do not issue PSCI_SET_SUSPEND_MODE.
+
+      Some firmware advertises support for OS-initiated mode but rejects
+      every suspend mode switch with NOT_SUPPORTED. Since PSCI cannot report
+      the current mode, the OS cannot verify the state the firmware is in.
+
+      This property is an assertion that the firmware works correctly without
+      a mode switch. This is a workaround for non-compliant firmware, only set
+      it for devices that ship with firmware known to behave this way.
+
 patternProperties:
   "^power-domain-":
     $ref: /schemas/power/power-domain.yaml#

-- 
2.55.0

