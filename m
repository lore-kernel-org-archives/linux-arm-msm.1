Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B1A41D23C
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 04:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792297804; cv=none; b=Hrco/D+s7zm51/tAkyBL9GMaiDqT1nYUaPGnfHPG1ojKrKvoDmL0LTkGj9bllPYQxDKGtFa0o/Bqdvt6yWDEuEVJDUbGUkZARzaZrIanutJOv5EYSZsIBTc2ok/a4DqU0/KwPLRceZOz3+2ZRzSy8Pkg/u5ZpBkokZb4KV/FjoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792297804; c=relaxed/simple;
	bh=Anss7133/aANMPtcn5QRXQaxDH/4VeyG3Fgcsy6YMc4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Seh0UDWH3pHoiSYgap7INRtcSrzHqqHR1turpcZUgJuIvlHeO6gZl/Qdvw7cU5hXTxSzlhLJrCnp24h8cynzx7wX6sG+eUr0qENdUhHr+EgICR1qGItG/Q84nkJUsjOUeG4cF2fb8YRXoQgnVYYTjyD4t88iqwtxXnuKzsVCnsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bbJtyab6; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbJtyab6"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso662771a91.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 21:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792297797; x=1792902597; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VWSV2lYeWe6uhtDKhgh0Nkoh2az0FS4A25FIOTm7cLg=;
        b=bbJtyab60pRpfxg2B0XuPjmJrIruUt6Dq3k25lsiQSFIjD5OaOQTdlME1k67VsWjho
         +kj7ftF8WBjhxabYEodLwoPGSZnRYLm5aZstMbMhxCLyHYebf3Sp0eTNYGqohVEHmzWo
         trVh5sjLSBoTYSgMjy3mo2tCnTv3OzqF+oL0R4sXKTFI94F4sb75bCOcrrXGCKv5Usmd
         CmUwk/acpeF7KwjCBbxD8Qi2UxA5L9+Wbe+DKBgf5yKCMuohpEfQFTlGZh4Adty2d8xj
         JSAmU9mVqech7nH08lWEMfGxVk96sXSmX15b4f2+CFMr2G4C5wsndrxlmAZPikfb7ugj
         Ul9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792297797; x=1792902597;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VWSV2lYeWe6uhtDKhgh0Nkoh2az0FS4A25FIOTm7cLg=;
        b=LJoiTTU/hhnn1COiy7rLuO+1nHZOoiFdGqvdsBsugvOyMkp5wlXpK3X553yStzzrI7
         R2OCqo6hnKkUw+XTD1DHPj7bWJ7YQNb3eSVe/qhYZ7HE/uHeHHh9pll8wvySom86ayPD
         ORsXzHeX7zScXeJgtaE9va0hKzwipjb9lTQmZa2kyKApdX9OEJp8WoeU919T6XuDX7gZ
         Ux+GK2mhfDE66TgcoEoHcWX1x5tTE/SCQAnqMl0NpG3M0c7IYjYiZxTTy8fsukayuAJI
         RAqV2exk+LLAM89yYK8jVEEOd9C21yldzrbc/QeOzhGTFFYvgZ/E4Od+39F32a/oJejH
         l9YA==
X-Forwarded-Encrypted: i=1; AKwUvBzk5EWPoeYPZm+nmtgdlo1Ysry9as/8rPnHEh7kdQc1sQK3YFPj7bzxyICUg7I0BOtiFAPQ3GQxt31qQqA9@vger.kernel.org
X-Gm-Message-State: AFq9FYJlKgbDit61NQE4qKbGgb1SAWogXwB/ow3xkiDzrgWqJhfNZ0zU
	BCOR3g7TBLnOPEv/R1UQtnVMem/stt6tz53/H42Z/enGEbW1RAYAh1jm
X-Gm-Gg: AYBFou2/kp955xyKYWNmOhIoDzby2NO92sP32Nr7e4shFQvWDg0LGyAzqhSLLTaT/JM
	QYPfI4Kt7goesfjxm6d1ylNS9a2NiB/daHRtWZ/T2kpOkX18TZF/HDYMfyy2m6Yz9RKqptYZBOX
	j7SvNToDCswXcYY3mnlAesajrwrkmGsfeQ373dVY9mtCKpqtkpofU6sePwWyMCAjGLbcRmWGJS/
	Qrgj2ofK3T2ouwrifC31KiSmVIZdKtrvPEU7nDBy0mUmO8E7BRMy2TUAipMFoRtWT/mIlirljQs
	j3SRPZiKCIFpnormH6riL6UeSKeQa3X9E1aaPaEVAPjjSsvgjlGEm0SMHKxNr/XwSWAkmTlQ5lP
	viL2xtMCtcKaRBVGcSmSMK97GUl+XVd36uubc1797THAChQh0lWo10xWVDfk4FK3EEPtHdZUTVA
	uHrP6elq93ROKIJe4gkTJgicllZLVU2bfw/fO7tmhjR49nU8JGE3FhZ4IElcQf4R0=
X-Received: by 2002:a17:90b:5610:b0:3ac:8897:7b88 with SMTP id 98e67ed59e1d1-3acef5f43f0mr3344212a91.58.1792297797308;
        Sat, 17 Oct 2026 21:29:57 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:7618:4e1c:8841:a092:12c2:47d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc9e47588sm5885369a91.1.2026.10.17.21.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 21:29:56 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Subject: [PATCH v2 0/4] Fix PSCI on MSM8917 and MSM8937
Date: Sun, 18 Oct 2026 04:29:20 +0000
Message-Id: <20261018-psci-fix-v2-0-35f65b59eb9a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0WNQQ7CIBBFr9LMWgxQQ40r79F0gTBtx9jSQCWah
 rsLNcblm7z/ZoOAnjDApdrAY6RAbs4gDxWYUc8DMrKZQXKpBBc1W4Ih1tOLnbU03CqpVK8h64v
 HfN5Tbffl8Lzd0axlX4yRwur8e/8VRfF+2eafjYJxZtFqlA2edC2uw6TpcTRugi6l9AH3CMdds
 gAAAA==
X-Change-ID: 20261013-psci-fix-8a2c0d6266fa
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
Changes in v2:
- Small phrase change in the property description
- Added property check in psci_1_0_init()
- Link to v1: https://patch.msgid.link/20261017-psci-fix-v1-0-dedae27e4a31@gmail.com

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
 drivers/firmware/psci/psci.c                    |  6 ++++--
 5 files changed, 33 insertions(+), 12 deletions(-)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261013-psci-fix-8a2c0d6266fa

Best regards,
--  
Reza Kurniawan <imkyufie@gmail.com>

