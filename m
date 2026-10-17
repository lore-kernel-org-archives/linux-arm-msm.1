Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5571E520A
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 16:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792255357; cv=none; b=X/8MEfWwads2RRuAY74xYmQTxahT1/ach4O3DMgAHX+D4f7DpE/Hh/OpHjoZKaaS5kEDiNCynBi+bKe5OhfCfGO8z3BAj3DEPFANmnoBs7uLhYVyf0JgYJK31AMHtZ/Bn3JZpDdODSWAKnW+R6BjjPx+T8ng22tEO1rH+Ry5eQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792255357; c=relaxed/simple;
	bh=PvCtvOycJmdiDgVzTzfFtgjjZ7LYOBs5XgQP+trDJVM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Nl3dPgAS12o5euF+bJqpnq6vysvYvS/pKZRqn10E3zi/Rn8u4BG2Ra8pfZVl/0i9uKzrRrzfAr8YyJsKc53X4wd5qM0ZClbtPxlg/r+c7J6BTfeE3Ezywl7s2iIGzHUlT/ISx5u1OKK1zTJVfZAQrW4Z3ad+loXr4u0n4ryUhW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fw4WZwvf; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fw4WZwvf"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ac677668a9so683649a91.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 09:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792255356; x=1792860156; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Kv1aGnhKIy4dQPOs4e+ES3Qr9yc3Tep8lN5nihq3WSc=;
        b=Fw4WZwvfriO+l3kRN/bjOuImPUIFcZ4lRcFN8sxbu/R3cDe1FXp4WayNlgdiBmv9RL
         3M+Sje4h0j3Wl2Kg2POv3bAOlngb4bKncoO/Kbpu+6NmXM5mm+HN0v4W01F9VHcG3Ve1
         19JI4PTBa5/yworDhfq+D/T7dTs50MaREmNhr/I4FzNsu9qkzsibWS11efYeSahjOyar
         ke/yq5QSzuKc3TIedoyCV5JPonmqGY8Vl6BSBb3zbdy+NsEUe+d4Kw1rPojVPDK9glvg
         oh5YO6Meiu4mWIJI9k8Jb72O4l71Ybalm3lle22OjHBf8h5RGF1Ka25baN+JxO1uVdQz
         5NtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255356; x=1792860156;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kv1aGnhKIy4dQPOs4e+ES3Qr9yc3Tep8lN5nihq3WSc=;
        b=hhWAqwVEThMsVWxTI4dcZJ3mjPafQl76uZbw+T0MnshkRBVnPqU58B4cEdnysXgxdg
         JQNnIWGMPetm6ajqGETizeExQgAyTZF7guKu1Cc3+yyUBDE4NjkVgOEcwzGK7fQOxhNj
         i0xGF19HNYLuFNhgDwQ7+u7zYQ+J9wqt+wXEi4/I3ovmvMm6aqiMjNgBA1lMjlcHN6MJ
         4XB9B2YNXaqvwwsNPAPpFMJ0fijoafHNsnlusKzKxVZ9/7sVhbZL01kYBI28enKu/FiY
         ligiKwewvzjzCnJfexocYR2LRRIq4nW8/z0qvKLL6xuRGOHHD06pYZ/035I5D2V809Hr
         i8bw==
X-Forwarded-Encrypted: i=1; AKwUvBwogWt2/jEDSiRawlMU3fPJaMIZPgKrZhdR/VwwDGZC104c6/tFcSPE968WX78SIpxdc+58KvduNXK83fS8@vger.kernel.org
X-Gm-Message-State: AFq9FYJknO2f22OkUuU5rrmwlJ972V4rqIrXyajXlzZI4wKsBeu6Z0AK
	R4TRxDyk7FJiWSPOFFVaui4PdNmUQ0i1zbJ6Ex+PoMAEmfTP/5dvz2ES
X-Gm-Gg: AYBFou2w+ikuX2gaf+34fdVzpxZzJsPY0RwJzhhQj7rVWXaVc0jjmnib6UAfQD0uNOC
	LFZiBcx2TwMW9U6dnP7rEIx9ca434WB0hMR5xW0cl0kxe58yydg/vMqJ1EObcX765KxXzM9oCSj
	7epvnkBCe4nWzHN/nQfmhss2FaPUvtsyzwFvF1nOEaPUfAOizYMU0qkopjAF83Vm2f5l33UE2VC
	8ysg1zzM3f8UlN31Btw/+n/dY7jvqTJk3oz132S9I2S8yAWV5mrKLcW31poD0ZxnE4OSXyfNVM9
	/kk/NEa+lm1zEZA8rsh+vjXyIuM/o5S0g4AL2xv5VQDptyaglqG8Lq3v9RudQ3XD3n/z3HRXXNm
	HMr/SGu+4TT6c2cV07XYkxD3x7gUpUzN3iKOvkjcdlieD+VjyTLk/azsmh+tyF++2bRiAVb34f+
	T/vxoP1WdlknSA+pZjVAt7BTBmuyBX2+1Uqr5zdT2ZCXz7XDCpDaFdBXWtRr1R9A==
X-Received: by 2002:a17:90b:4c8c:b0:3a7:ecab:c4c7 with SMTP id 98e67ed59e1d1-3acef1486bemr2929602a91.34.1792255356104;
        Sat, 17 Oct 2026 09:42:36 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:7618:4e1c:2cb7:b2e6:ffb7:d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94798212sm13816164a91.14.2026.10.17.09.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:42:34 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Subject: [PATCH 0/4] Fix PSCI on MSM8917 and MSM8937
Date: Sat, 17 Oct 2026 23:41:22 +0700
Message-Id: <20261017-psci-fix-v1-0-dedae27e4a31@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQqAIBAE0F+JPSeogUS/Eh1M19oOFW5FIP57V
 sc3zEwCxkjI0FUJIl7EtK0Fqq7AzXadUJAvBi21UVI1YmdHItAtWqud9EYbEyyU+h6xxN9VP/z
 mc1zQHe8ecn4AiZ//EGwAAAA=
X-Change-ID: 20261013-psci-fix-8a2c0d6266fa
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Christian Loehle <christian.loehle@arm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>, 
 Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2

PSCI on Qualcomm MSM8917 and MSM8937 advertises support for OS-initiated
mode through PSCI_FEATURES, but rejects every PSCI_SET_SUSPEND_MODE call
with NOT_SUPPORTED. The cpuidle-psci-domain driver treats this as a
fatal error, so probe fails and the CPU PM domain topology is never
registered:

  psci-cpuidle-domain psci: probe with driver psci-cpuidle-domain failed
  with error -95

This series adds a "skip-suspend-mode-switch" property to the PSCI node.
When present, cpuidle-psci-domain does not call psci_set_osi_mode() and
continues with the topology it has already built.

Skipping the switch is expected to be safe on these platforms since it
matches the behavior of the downstream kernel, which manages the
cluster power level in addition to the CPU power level, just as Linux
does when OSI is supported.

Additionally, it also adds the property to the PSCI node for both
platforms. For MSM8917, additional change is added to fix the system
being unresponsive at idle.

---
Alejandro Tafalla (2):
      dt-bindings: arm: psci: Add skip-suspend-mode-switch property
      cpuidle: psci: Allow skipping the suspend mode switch

Reza Kurniawan (2):
      arm64: dts: qcom: Skip suspend mode switch on MSM8917 and MSM8937
      arm64: dts: qcom: msm8917: Use a shallower cluster state to fix unresponsive idle

 Documentation/devicetree/bindings/arm/psci.yaml | 13 +++++++++++++
 arch/arm64/boot/dts/qcom/msm8917.dtsi           |  9 +++++----
 arch/arm64/boot/dts/qcom/msm8937.dtsi           |  1 +
 drivers/cpuidle/cpuidle-psci-domain.c           | 16 ++++++++++------
 4 files changed, 29 insertions(+), 10 deletions(-)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261013-psci-fix-8a2c0d6266fa

Best regards,
--  
Reza Kurniawan <imkyufie@gmail.com>

