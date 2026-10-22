Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662103;
	b=jdVYdok9vGamojgB1sjuhFZ79xzu/ujsy30tiNtSZRkltSmFwm6hJ6arGy//1hQ5iMj9
	 1BDugifzZYIQOZUQXsY2pLb/sYzBQMisSO2xqLZyaEXmoLYhbdrYQ/iSWNU7VNJgVnt/Q
	 lCxHOzS8vEv6eaeKMI/muD1+l8nWFmE8ikj6PNEpomOa+F9D8iXHP7J1lg8U4dqtitKRW
	 aMfmXHuIUEtbYhdcBTRmqmdC5oQsAbHi1M+NBaEb+KIN5DbyfTkzmgO4daEihM5IjFiTN
	 Z9gUTBUpGPqynDFz0XvCNhJNOfKaP9NlKyuOi/5gRU8fjflZDbtSHxujx+vnWFQPHeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=OYDgm4R1tjaY+JvgEyu2MMXdyhh68gFfDYeaLIp9hAE=;
	b=Pk1LsnLtwzrr4/LTRY5cBsPPrbWnXg6+6vxqBdecYatqq+LT6oWXp9JF0DnKz3GMSUZu
	 ORUsgqUcdg7xWqZDohvbtl4apU67j+/KDSP145DQVCSIlqMi0Wyfw/n001mtPB45eMw1r
	 FlaZvSv1IKdZgRYYTazZ3AUUY3SCXqG0sQIThKtBucxTEGGDD5jPwE5QwXQhLgVAWrhzc
	 vpDttNDyl8PLmQa2pfI1HMXBswU178T974RNzKV8A76YccGgESBZIA7PtyIBFCypL4Luf
	 t6uOmnuCWAtjeDDHK3RYbuQMJNo7hzP3lO0r3YisNIlee54f2qmvLWpjaioXvkC/S/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ft85iyEp;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7F7606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C7F7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ft85iyEp
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e9d7791b00so7405225ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792662102; x=1793266902; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OYDgm4R1tjaY+JvgEyu2MMXdyhh68gFfDYeaLIp9hAE=;
        b=Ft85iyEp/12SfLEwAij9mE92Qr0ZiQXzSmTKtFfmLaSrmJxg1uOe4AbPE77e1Efbza
         WlbgZCwprEcvIugCo3kFPmDksaKpGt05pcesVs+k5n2Qarm/yYZkLa+R1KhJXOlFsQMW
         2pZYasxHMnAIPQsFFEQ7SxM5pU39s8R8rEw3PAPDt80ATC+3qvJHWeov/M0NBoGUAgMn
         9OjDc8Dbd5x1jP3dkG61kmki85Vrn3IfBSKbHNghQVJD6ZM7tOISdEKQcgI3UyC09lLP
         X36CYvLY2uTLdDnutUqm7V9mvt+FSIWsf2nVyk8i5Lh/sxNiPn81hIdU5SuAmalUX/cY
         S2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662102; x=1793266902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OYDgm4R1tjaY+JvgEyu2MMXdyhh68gFfDYeaLIp9hAE=;
        b=kgYPcFnLIMC/j7TllIp/CA5ZgAfB7HNoaG2KwgJPO3UlUq2W+dABvvQghK/m1mc/fY
         2BgypcxY9cSdj4xcTgblJW2SdTBDLTJ2OH/uEhUjjuwiuMeaS2eAbe+RThurZ4N8ktW8
         HKDKO1nsGUsK0l0cLS1e/vrZnQLkgTpy3GuxEKB6aYLTwiUqd0xzIaez7Z9xft9Ekz19
         ee5wEKP0UpDUsu9D5+FgOUTDBGbttW1io7pJ8pj5X6utbXAubEBEQgiwpsEpjtKbplnS
         ZKpwXrArAVDA+Lg1mvKtmmIoEdwg6OFDj2r35B+3XelFXURpgang0aPRebPwZRCPC6p3
         OX3w==
X-Forwarded-Encrypted: i=1; AKwUvBzHLw2Qjx9o2PCmA1JqXUq76rOHf9PydzGf979KopOE6RclnKNJCxQIkjMRo7D2oEDH4GqF+2XGVW7KD6Go@vger.kernel.org
X-Gm-Message-State: AFq9FYKu56axBm1foBAVgww9KTaD+0MTiFwxN+OrY0S/GiqnSWPSpytc
	O9gZkZPJr41uXhnFTMVXKA7wcDaDT0LshXsKSKOTU5sIIR2gw8dX2LyP
X-Gm-Gg: AYBFou1eScWH+bYA5yLRTIstCbCbpXdItF+RsdtNYzPB/IC4QnqFHIyErLI2UR8YZcx
	derQ2SiyQ4t+TFLm3GcmmwvMHxZIuNxTj4zxbDmRVQOdnT9R8j2ZgfSmd29FO1xAXuzx3riXPLY
	uP4z6c+b+XkSpLcSJBLL9FnTAFkSybEtkrMmMpxEZT5/8wuopYIgh2L3Ni7CUmG2dcjIMWoWPdI
	I4Z3931SJAIDzX//Pmh5fk2vRjyQdEl6QCdMa333oZg6KkpVZ/DQ+ANSI+iq5coSnCRRsl/wLzd
	4L7xqqa/Ov7WmkhZ3xMUBg+OYUaKtNWxzYyUNsFlizWgNDHrD1PoN4TUHhwIpm4uoGOD53tOEMG
	ZEAj1/W9Vg3s9tTPTo2VzBxHxYUilgVkSALYCPFNak4ZTs5KVYnqzKUDab/bIhB/S1l+a2qawnI
	s7lPC1ayi7keTRQvlcncbvqP8Njghki0Fw5gCmQrdntmrnpJG6zqCmc7Ckvnqhru8G5I5RTASiR
	+nDekw4HL3qwR+IuNBf6rwuNNvQPhkhbMoZ2HQzrLShoI+1
X-Received: by 2002:a17:902:da8a:b0:2e9:660b:35a with SMTP id d9443c01a7336-2ea437b199fmr37175735ad.3.1792662102554;
        Thu, 22 Oct 2026 02:41:42 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:701f:d27a:ab05:82e0:7670:1951])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b4356c1sm21483075ad.38.2026.10.22.02.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:41:42 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Thu, 22 Oct 2026 09:41:10 +0000
Subject: [PATCH v3 1/4] dt-bindings: arm: psci: Add
 skip-suspend-mode-switch property
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-psci-fix-v3-1-9ce2133c5659@gmail.com>
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
In-Reply-To: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
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
2.56.0

