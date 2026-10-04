Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C40941228F
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 Oct 2026 09:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791106522; cv=none; b=PU0F2yN3RdC+WQxXcistycVUrcm+C6a4ndNZ1ah1yVova9yMsBzK+fVIYflEA+Sd3I/mklhqFRt4AkIgkLf7K6UW0bgaDNUBZIvPEw27vyYzLmSqzBx+9UykNFjmt3lwsQTWeRBjm5vkvWZbFRWub1ePTgxcSYVkPWDrpjLE4+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791106522; c=relaxed/simple;
	bh=YC9QBizNqxQpPlezV6L886RusmNNkXZHsgFDQG+2gGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CB054Wlhvov4Wi/AmyJMHRvOU/2Suaq28kfYD5CBs8u0aBpukjvBr0l5iaHByH/kR5zESKCEGcMsZtWfinjvOeiThRwLqxtZvXamQPhcx/HuA+MjN3p6pCgeYRkbQViwKz17P4PAwgKIhZJIU990lXS/fxvFl4+fUpHW2DKey8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CIIr63fP; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CIIr63fP"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ccce967aa8dso25655a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Oct 2026 02:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791106510; x=1791711310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YC9QBizNqxQpPlezV6L886RusmNNkXZHsgFDQG+2gGU=;
        b=CIIr63fP9h/9n0KDlFSfX7vEhC9Txa3dOY2q4UaMcN3y/3VPG2Ep7Bou6VB9Eo6VDr
         L3cyWaTDQluZNTncFstly6ut6FReEjikiV4XRrEtDaGHxqI8WJc83vwq9mZnhqAXoKGt
         Nnri0FndfQ18uCxuoJpBjyx6oRq9OObQb6oGJ/01YOKj7QvYIdkXEzfYxVcf9/d/Ofgt
         yC2GwGUwbPiBkmLc9vYeI88VZi9kk3N9qCcvQ8s1XsnhPjvDszSePjifs9qcSZNl5xp6
         yYHALk+jK7DGD4eHF4uKfh2OejnqD2/RrqI51Gy3sBYnOQo6OYA6zAsdhACaj+XztwjR
         yR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791106510; x=1791711310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YC9QBizNqxQpPlezV6L886RusmNNkXZHsgFDQG+2gGU=;
        b=YNzx52f19U7z9DyCVp2xw1yerGQLWUe6QqGLPtbFnz9G+29UwsrYgdGZU8yKbzF6Qv
         c1ENKENP9ETgK1CxYIWfvq5WZ0tp7a19UEKLxSec3luYeHmGk0+yLZR0Hn9llU5hO5cT
         hy52Fox5Vq06A6KX/btlzYpOtoJBHyBkn82dEGC0tY9flDkMBp6jAsmoUYzC11E+5n+b
         tWjo2NGa1TRMr794Wi3XPOEx5n7zlacnhQB8SPs8REtv+WIYSg3NqLFOwpP0WSq1RLqU
         /ct2x36mhE2zRfh0yueKor5pYIKUyHqoRPN85WoT26uj1UYahlbQ5ZRrH7k3KwJUQcMF
         06ng==
X-Forwarded-Encrypted: i=1; AKwUvBwRblDYWV1eknWDNDUUHLPBdueRr8bdPR5JGcqqqMmY6t4I8zyD/ds7XEQiacFcfDn04f7Nd6FOnODdDxm0@vger.kernel.org
X-Gm-Message-State: AFuF++kEbwHUQUCe8teH8SEo+nodcTCImDAn8gndVf5aqDkKUTIWM6t/
	WmbxvIs8D8n0TnTAVZqAExUlUMUSonq4FmJ+9Sp8RZJLX9L2YpPrMEZs
X-Gm-Gg: AYBFou37vjcX7o5P3Odbb5RfUuiUjpgsYOxsvZRWY/QZ0SFziEBHapRJEIjJXzdGLfc
	vKY5Q77Roc+f556smwRm8k6N1ARADpZArCtjxRGDIqzkxdmAI59bXItT8bD6lo6w0i8ZIl3TI6a
	2brMFMzkYMt/iKfBCcWVgde/7axjSaHNCitm5Boc+TbmnHtUxfOT/w5BG+C7vF7ixa7H5j3qBvE
	cT+7tY1toT3iP213aqD04sWczDXDpeCCj8SIbnnOBroXPIA5HmTwaWNBpjc0SNMHRl8Qnwxp4rD
	7/Zegtz77DJVUju5/NpsdaXa5ZDzLzdugPTfj3mEyErgIvGXMcueNev2iMZNzxIpnpAuimhmxAh
	zYHinrRWE3j3SR/aKTPN2ZIsDFmiX56rWDzvAWr3jDSpZJ5tQSGK5I7t23VAOR6w5hR58GLPqsm
	Hg8Nx/jmMA9mXNQ2oQPh3pPjIiwLX4gJgJssHmZC5s6JzJbRNylqyTM6B/TeEzBoQhWe+B7o3j9
	CR2nyaztFvyyg==
X-Received: by 2002:a05:6a21:4d0c:b0:3de:b120:bb93 with SMTP id adf61e73a8af0-3e0d698a377mr3925501637.1.1791106510339;
        Sun, 04 Oct 2026 02:35:10 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0d363265sm2394911b3a.60.2026.10.04.02.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:35:09 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: Oleg Keri <okerixx@gmail.com>
Cc: Joonhoe Kim <26rote@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	ds.heine@posteo.de,
	Abel Vesa <abelvesa@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: glymur: hard reset on the first system-domain idle entry (SS3, 0x0200c354) after a heavy load - Lenovo Yoga Slim 7x Gen 11
Date: Sun,  4 Oct 2026 18:35:09 +0900
Message-ID: <20261004093509.74316-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20260914094648.14502-1-okerixx@gmail.com>
References: <20260914094648.14502-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

A data point from Kaanapali (SM8850), which has the same domain states
(cluster 0x01000054, system 0x0200c354): Lenovo Legion Tab Y700 Gen 5,
v7.3-rc4, PSCI OSI mode, with the CPU PM domains split in two cluster
domains (CPU0-5, CPU6-7) under power-domain-system. With the single
cluster domain of upstream kaanapali.dtsi the firmware rejects almost
every domain state, so this does not show there. In short: we see
silent resets from plain idle, and here they follow the cluster state
rather than SS3.

Symptom: a silent reset after minutes to an hour of idle with the
display off. Nothing in the printk ring or pstore dmesg; the console
ramoops only has "watchdog: CPU7: Watchdog detected hard LOCKUP on cpu 0", and
the watchdog bites before the hardlockup panic is printed.

Keeping SS3 out of runtime idle first seemed to help, but the resets
came back with SS3 never entered at runtime.

An idle-entry recorder (per-CPU ring, records cleaned to PoC around the
PSCI call), read from a RAM dump, shows the lost CPUs entering CPU
retention (0x4) around a cluster 0 power-down (0x01000054) and never
returning from that PSCI call, with IPIs and expired hrtimers pending.
In one case the last CPU, the one requesting the cluster state, did not
return either. Most cluster cycles in the same window were fine, so it
looks like a race between the cluster state and a CPU entering
retention.

Refusing the cluster domain state at runtime: 3 h idle without a reset
(562k cluster-off requests refused). Same kernel with the state allowed:
2 resets in 78 min. Screen-off idle power did not change measurably.

Is the cluster state (and SS3) meant to be used from runtime idle on
these SoCs, or is there a firmware prerequisite we miss?

Not tested on linux-next with Ulf's CPU PM domain series yet. I can run
patches or collect dumps.

Thanks,
Joonhoe Kim
