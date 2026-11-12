Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794453394;
	b=5Fs0uXdIzjGsUBEq9+UpFQVto/RZCchFjfgi499cazlM+zw4zsddKrFKXvNAZIyaXztS
	 AaPosOIfgLfZ1qFbuDUiJMUdeDOjunCqVEczIREbNYVtgHuVM330CbJy8PqRBU8VZD0Mt
	 YMACTHUovqTMt9MDdHIyvWlHWaS8xekA72HXGDIFHoV8K2mlDhVP0Wkp2p0lgaNJ+iTCQ
	 WclFKKZHq3OPcXguHSMzrwXOMxLkd/9ZYMMS205UHXpO+wIeQLIo+csyrFNc6ihbGOQL4
	 Jbdezk+ls4eCRi5orL8GJ3IC7HCouDcet2VCg7OqPW4nZLwParsJee5l49cfcgmGcmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794453394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Sa/7J0bgFeB03Uztp+5L2ZzPguvvcrGxau3eNVvTqdI=;
	b=WVlH0h9ZyYF7TYvqwGz0VFDOt9EEHrjFyoMBZe0oNMGIb+pf8OVFNVbIy7r9wq4uXtGA
	 /uCoqtP5c9OhpO58blVLrWnym8E8ziUzLKzsdoi39nEli4stxdchejNZIn1gY/KTW3HSr
	 2a3sIpm0DCgxTeMm904pmTma5MHA5j3BQKm2xL8nINArdv8kkjskHuXrMzcCSAaNkS+VC
	 Ym9CbQL9xJpQ0UUhXKjwlqsr7mO5QZJHkdsVaM4yIL1DNWMNjUHssNwVFcqPnMpzdI0C5
	 JpC4c8zBoxhq8dzUtKkBopXSapVrxrZOOMHNlODsX21qREp4TxQqZpwAo1+sliGX/Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--mrungta.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qPTz9Fzb;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC55606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 03:16:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EC55606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mrungta.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qPTz9Fzb
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-375bac6bd21so355331eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 19:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794453393; x=1795058193; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sa/7J0bgFeB03Uztp+5L2ZzPguvvcrGxau3eNVvTqdI=;
        b=qPTz9Fzbkh0MjGTX47msgUuwEL8WpQzXVrSVMDtKuOXKb+bsCxdHCw1c29Ohyai4u1
         Wofhxyoyj2+i+8fGk5/jZX8xGcK9pis3yWAmu7m4moh6p0L2FuAznQDWFEO0Eobg4yBc
         O+9kyzOxzzojxrym5hCWed0lUzkwlnTr3J4IuHZNJG9W0qeFls8RreyvpzRZysRi3kQZ
         nW6gjYDj3Tnjs051JrUbyNxuJbeR+8oLGKVrl6Y4Yz/T7ixMhjcc7Q2TuM4BLcoaTwKK
         SLaFr3G6GYjcQL/sf1ge8Va2bZH32eXtL7yaHpOUxkoKwP6f9q4Xorev3hOCHQXSPizB
         hO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794453393; x=1795058193;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sa/7J0bgFeB03Uztp+5L2ZzPguvvcrGxau3eNVvTqdI=;
        b=wqxSLXkWAXtYSkviZ6H9nSr/rMpmm8W7l/dwLaNaoItXynfuS/86z/abIoyqVikl/b
         jqxiJWCEonGe8k9DH2UOp7Pu1xDHIwKebSDsjua0WY0g5ssfXOP35+K0M6ZWrJnxka8C
         m82SQioZFtGeO98YhI0kU5ymmlpK1aOBZP/uJTiNoIMtfpzphoJOxleW0x3hJjSCM8zU
         OR/17fhYRCsmXqzdUrq8/1YOP9wAvQNY0aBjfRK3Y4fxx0paXq8a9mFgdc4sC/DmcAAm
         Y6ZkuNKSK3MmsYr3Eth0U81nVeMuC6Bg4pP+sID2UDhhzSOY4uXDGgIupBQL+xbRYZb9
         D6Qw==
X-Forwarded-Encrypted: i=1; AL+hErE3b08mH3B2qzuFjha9JQJTZhaCXeByykJqMI3X/+J98e0JnBZfI+I/uk+ixArSxeZpImcqKYTejQwyysGw@vger.kernel.org
X-Gm-Message-State: APuU4Z/BYjodyRirUv/y/V3LtQgjC4VNV7rsNg6lNq5uelS0c5XUhtJZ
	cSQ4p8uU/EI+Xk+19Sx2NE82j6wdx7HiljgJ+lgzedBELEcIcg7Ypul9rD4BGzSR4yR+wrjOrPa
	tKSIylhdRlQ==
X-Received: from dybme13.prod.google.com ([2002:a05:7301:188d:b0:36b:c499:531f])
 (user=mrungta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:c395:b0:36d:6a77:960a
 with SMTP id 5a478bee46e88-377deaea7camr1365990eec.1.1794453393029; Wed, 11
 Nov 2026 19:16:33 -0800 (PST)
Date: Wed, 11 Nov 2026 19:16:22 -0800
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261112031629.396819-1-mrungta@google.com>
Subject: [PATCH v4 0/7] watchdog: qcom: Support NMI pretimeout warnings
From: Mayank Rungta <mrungta@google.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: Marc Zyngier <maz@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, "Kirill A . Shutemov" <kas@kernel.org>, 
	Douglas Anderson <dianders@chromium.org>, Mayank Rungta <mrungta@google.com>
Content-Type: text/plain; charset="UTF-8"

On ARM64 Qualcomm SoCs, when a system freezes completely due to hard
locked CPUs with standard interrupts disabled, a standard watchdog
pretimeout warning interrupt (bark) fails to fire. To diagnose total
system lockups, we need to transition the Qualcomm hardware watchdog
pretimeout bark interrupt into an NMI (or pseudo-NMI).

Enabling NMI pretimeout handlers within a loadable driver module requires
addressing NMI teardown synchronization, allowing global interrupts in
request_nmi(), exporting NMI registration APIs, and ensuring watchdog
pretimeout governor dispatch is NMI-safe.

This 7-patch series achieves NMI pretimeout enablement for qcom-wdt:
 1) Synchronizes in-flight NMI handlers during disable and teardown via
    an atomic counter on struct irq_desc and unlazy hardware masking.
 2) Allows global interrupts in request_nmi() and updates /proc/interrupts
    to display per-CPU counts for all NMIs.
 3) Implements synchronous disable_nmi().
 4) Exports request_nmi(), free_nmi(), enable_nmi(), and disable_nmi()
    to the qcom-wdt module using EXPORT_SYMBOL_FOR_MODULES().
 5) Replaces spinlocks in watchdog_notify_pretimeout() with RCU to
    guarantee safe governor execution from NMI context.
 6) Updates the panic pretimeout governor (pretimeout_panic) to call
    nmi_panic() when invoked from NMI context.
 7) Updates qcom-wdt to request its pretimeout bark interrupt as an
    NMI (or pseudo-NMI) with fallback to standard IRQ.

Signed-off-by: Mayank Rungta <mrungta@google.com>
---
Changes in v4:
- Replaced hardware-only NMI synchronization with a lockless software counter
  (desc->nmi_active) and unlazy hardware masking via __synchronize_nmi()
  (Patches 1 & 3) (Thomas Gleixner, Marc Zyngier, Douglas Anderson).
- Allowed global interrupts in request_nmi() by dropping the mandatory
  IRQF_PERCPU check and updating /proc/interrupts for NMIs (Patches 2 & 7)
  (Thomas Gleixner, Marc Zyngier).
- Switched NMI symbol exports to EXPORT_SYMBOL_FOR_MODULES(..., "qcom-wdt")
  (Patch 4) (Thomas Gleixner).
- Added Patch 6 to invoke nmi_panic() from pretimeout_panic() when in_nmi()
  is true.
- Link to v3: https://lore.kernel.org/r/20260902-qcom-wdt-nmi-series-v3-0-f3999362a9ea@google.com
- Link to v2: https://lore.kernel.org/r/20260828-qcom-wdt-nmi-series-v2-0-363979fe6b6b@google.com
- Link to v1: https://lore.kernel.org/r/20260730-qcom-wdt-nmi-series-v1-0-3aa86d162914@google.com

Testing & Verification:
- Tested on ARM64 Qualcomm Snapdragon SoC (Google CoachZ) with GICv3
  pseudo-NMI enabled: verified NMI pretimeout bark delivery, /proc/interrupts
  accounting, runtime sysfs governor switching (noop/panic), nmi_panic()
  execution, and driver unbind/rebind teardown.

Mayank Rungta (7):
  genirq: Synchronize in-flight handlers during NMI teardown
  genirq: Allow global interrupts in request_nmi()
  genirq: Implement synchronous disable_nmi()
  genirq: Export NMI APIs for qcom-wdt
  watchdog: pretimeout: Protect governor access with RCU for NMI safety
  watchdog: pretimeout_panic: Use nmi_panic() when invoked from NMI
    context
  watchdog: qcom: Register pretimeout interrupt as NMI

 drivers/watchdog/pretimeout_panic.c    |   8 +-
 drivers/watchdog/qcom-wdt.c            |  30 ++++-
 drivers/watchdog/watchdog_pretimeout.c |  45 ++++----
 include/linux/interrupt.h              |   1 +
 include/linux/irqdesc.h                |   4 +
 include/linux/watchdog.h               |   2 +-
 kernel/irq/chip.c                      |  35 ++++--
 kernel/irq/manage.c                    | 148 +++++++++++++++++++++----
 kernel/irq/proc.c                      |   6 +-
 kernel/irq/settings.h                  |   5 +
 10 files changed, 225 insertions(+), 59 deletions(-)


base-commit: 2a500a04d6f969318c05f46aedb6e73fc1963a00
-- 
2.56.0.611.g1030f0b940-goog

