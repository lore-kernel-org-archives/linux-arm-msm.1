Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99F138AC7B
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 08:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786868897; cv=none; b=q8XzOIJXiJIo0lgYBpJtx5PySeVgkHoTOAzVwvbWroIlTHUPgLtuVkDJ03n4X6+gL4lC9rwel6EwKlINqh0Q7cbWeAYqLedqR8aodqNH+4Km6GZyiqZKC3Lb2k7jyoSJzwIrK3WMuXgSLkHcDaeD8r8gER0uFeos+34Sbw6zE4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786868897; c=relaxed/simple;
	bh=vVVV/m13IjNChM/ZjwQGj3Jq/cViqlU0kkgLRzO556M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sSHTsIm50vd3aQVH48bQtGjBFqyL1fpCaZ+YTGZIcrDOXSC0uNFpWLosXxyaxk9fczIJjByR0Np0aqMBSMBQvBZR0n85BX2kg7yj0vH8o55+EaKmQFvudfgcnj3pknK5HSAhqAuz3LNlfCP0MvID6ADaiQR17bKbGOPqh6rli/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X9TkdBe7; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9TkdBe7"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38f620399a0so2096221a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 01:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786868895; x=1787473695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GygFTkQxU74dE0opi3EUfTc1t7fZqz9y0D7YCf1CsrI=;
        b=X9TkdBe7qavLfbDInYx+/9Hx66YImXGBqwQglrS1z3N5SK77Pr76SSE6j2FAdXVpea
         kzLgHjhpCm9cF7yRchvM3TyahsItytMLLrDxiARB7/1HY4x2EmFbOG3PRQVzQLfnHjoq
         49VaE3bckvZGupdrLAB09VcpTTM+hI8G10z83oQVu9zsUzwnIeMkKzFLq9ITDQartZHR
         f5Tpwu31jl/4v4KixJfDqQ+02iYl8CJohmr+YFiBEBLRxpcNrWQ/FoYlyfN8Yvsdr9Gw
         /ygP9hXW4jINoNcY3VkZ4I2ugwt2pAfdM1Ojpjei6t50HuB/rc1nDc8DLlQEuDBnlyo/
         AKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786868895; x=1787473695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GygFTkQxU74dE0opi3EUfTc1t7fZqz9y0D7YCf1CsrI=;
        b=YOV/S6hlNRl5vf+LwAG8ehpTdJIonz1BaglIS3Rfif7OXvXllVjyDpnM2JPuD/xn7S
         yBDw+YTkr+O3W5IhQANT35NUYRf4Ll6cto4xBOSLj2JxYOr/ytbgnxUnAVKYhHR/ewuQ
         GG/Ok+m3gHREVkQ8VPfIezwNqwL0C6SRf2iO0jYw8uVRBe2lBUOfClstyKQX3ypGy8IH
         djwVKYkvMukYsg+JdIof7HXHbY9zkQaGjDdLg87LzyNpF9GIWPZ3kXMbigKhaTqQJo9M
         h08jNHBhWc8wUFrb/BKG/lCSABj3Euw40HjcDk4xw+ewa/guuazblGre99gALrFMTMh6
         zWnQ==
X-Forwarded-Encrypted: i=1; AHgh+RrxV3F7kkxXovKvCb53FfNaHvDDUgaR2hJMehpqXT5llg+N05gzf9aww0nHmfZpJSlveonLjz5nZu0WSGXj@vger.kernel.org
X-Gm-Message-State: AOJu0YwpWDywnH25gX5el7sEkZ4Cw1r9stsCNgbsq73wL9GMDy+f0c3R
	pdA0HUmMJHQBqf/CFgXJF8b1aWIUgHIH2pi+3idheXYpHQqh4R250qlx
X-Gm-Gg: AR+sD12HIUD7r2uhpgHPEAzwxOIz17J5czRHnkPZ0ig3A6APy5h/b1s/iuFSS2U2QEv
	MhTTMjuHtfa7eIdvi7ZJ8txFLUnyf8JqosZCcV87671ieS26gl8WQBl6vtwhmn1joO5jYsJpB1g
	YljRQFmcW+BE3ecdTC/fSFivgrBAwlW9KxTFtprBWnaesA8ENkXUUbp7vt1gZwJvS/18l61qi3M
	f7jQMxUeTn78Uo5kGF2FhJPOKPC+1wCS/1BzETOOYE34PjBxhqoCEkdXBP2zwWjQxTWKg000iag
	b84gy55BsMIZ01nakHw9VrLieqFbcGSCxIVKBXSQ2qFUhRzpH7nGUWBin+M8uF9PVb5SjAOa0ho
	OnWgzQP0FagxpEz6Ga+0gLXwXRc5EHTwQJrG1ucbH+M3Fgde7Irytxue7YeGTpUxeCwvN/6kIxG
	kxqmSfWc9W1T3WNxhUagAd/tGY+3ykt0KAgDnz4Jhnyv1uEmjdrG13WReogP92piDpd+fkCAuGc
	/xWuT18L3orvwqE8VBmLUM=
X-Received: by 2002:a17:90b:53d0:b0:38e:9e9d:9209 with SMTP id 98e67ed59e1d1-3933bcec7eemr17147634a91.17.1786868895031;
        Sun, 16 Aug 2026 01:28:15 -0700 (PDT)
Received: from localhost.localdomain ([152.58.201.186])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1413889bca5sm39510388c88.12.2026.08.16.01.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 01:28:14 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: bmasney@redhat.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 0/2] Add Global Clock Controller (GCC) driver for SM7250
Date: Sun, 16 Aug 2026 08:27:59 +0000
Message-ID: <20260816082801.5773-1-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset adds support for the global clock controller found
on SM7250 based devices. This should allow most non-multimedia
device drivers to probe and control their clocks.

Sreeshankar K (2):
  clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
  dt-bindings: clock: Add GCC clock bindings for SM7250

 .../bindings/clock/qcom,gcc-sm7250.yaml       |   60 +
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/gcc-sm7250.c                 | 2347 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sm7250.h   |  163 ++
 5 files changed, 2580 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm7250.yaml
 create mode 100644 drivers/clk/qcom/gcc-sm7250.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sm7250.h

-- 
2.43.0

