Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F6C2264A7
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 07:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786952299; cv=none; b=Mjw2arKW7CDIwe5cHIBTpRjkY3VVdEThHK4MUGaGX79LPF94uBiixrYqw8hIm+ZKiXvuPi2LgVgnnxevCFMs+BWc1s+FgCzYeaLMEy3GIiBfPKBToyn1ng1dfDX5O/n9pxhCCcZ72YgsyOt5BuC5O7CiXtg0TnmwZDFxww5BG7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786952299; c=relaxed/simple;
	bh=h70NX2tPDeIemqmiH4OvRNY2fd98eCZxuoknqCOX6RI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xmg2NGOF9nXFB5N4i60+Kw0aHi5WSFkXDQJNFF1K7Rx/1RuRUPwl5WaJncKU7jskfLkPdGkEnPTHUSFsjCi8BQl0yKsYPCsk+fiGWLwjIUVm6X/KSOM3Fy1lqpvOJ/+Qt5ABBi5QwjNAdubORm9NrwTqYDLwpALWAr+/AbIs5FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nw1c1E8N; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nw1c1E8N"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38e347638adso3726190a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 00:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786952297; x=1787557097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pi4vUpszV154rKYux2ZJWc/G1Sxirs0ok7VY9vQ3rG8=;
        b=Nw1c1E8N2udfiXBQygA0FIHyyxbf6WNKYr2BxHlxdH+AB9NuhYqNpopdH0Vody40lX
         eKT627OV5qH/elyOIUVSCqXkFLOrr12sAQNkRuj5GDZz7GqqqTm35ZsJJ1yyyIHEtN93
         iN4augQ/LFarZqJu9aTgKdUVsCI2swO4hxz4xvYMsFGoDsLYovvzb4tLXD+Tw0vDrO12
         8kzv2k0UXpi2Cd0w8TKQsiox0sZ51Dh9xs3vCGyoH8uFiODLWpSCTkFV9FzmhcdekSU+
         fJHDHRWbJF+nA0P1PSyWZWV6irh2gzxnjOWRn2bEQ/JKLWiR/L36MlUzyv7hjgsffsHJ
         avIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786952297; x=1787557097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pi4vUpszV154rKYux2ZJWc/G1Sxirs0ok7VY9vQ3rG8=;
        b=IHgVjjbD9mee7QfB3FJognVMqeUq8yHXkHiqPTdUT9eWBIf3M9j18CIOfs+xCnejPV
         7StrxnP/nd12CfZXjKVHRkCp5zJSAv3+9DPD8730oqvjqf0og7bKfe5gNYOHA57a9hX8
         ZALLyBmCNVGapi/dKf7pMJ94sJBfIJfplAFSdS1Q6LkL5KexBHVWIUfj5zYbV22xJpng
         A8dVwJhszPxwB3SOaAPdp9CRHWdc7CrK5J9i/OLSYLduJgjK+NJUh1w8QOFyqfmav8uc
         +B1b7x/eTV7Y18LdVRANRkCl0YyOZhgdb7IGk1jWAaLy6FgmijjoAPRVO1v2eU89NlsQ
         bidQ==
X-Gm-Message-State: AOJu0Yy32eCgdK9qI3I9HuzRGh68P9n+H7+jzYkPtBZi0Q2CXVR8y2IT
	9l9eEKXO9znR+92hwtpVqOtQcMqAEwEqXcfpAdLm9+x4AhHnPKSl8qhL
X-Gm-Gg: AR+sD11p6/vpDQA4zddpqjP0I+ZVwwqeiQoz5KY9xmNUDDGyuJcA4CfcFmCEySGKDKN
	vYEUrM+wU3SOlaUvZcs3hBmPFDz2h+jWgPQO7P9mBClEd4Q60bEskKql1JJ52QAFaTRgqg9KL52
	dEZ7tPVgRMlKq5ZzkaZSVnV7jWwbTz6qtQgyrUkBwhJ95A1qSxqT/8rHzv4PpQMb6BLHewDcguM
	GK7LRRaL/LmpheCSI+91RM9hv5n3gj+M6kLJZa3uaQF3rK+aQxDZUQrSfY3pAoA7heyMiU9Vm04
	O1DMtIeKCk+m7T4PMLHOJM1PU5MuRbuLfEKuBF7JmHRnZabmcJf+z2hUGtPMEmF6PDbWaY6GXaz
	rSRqgb5kh4909fpzJ0x1+AoXIFRn9f8qiL/X1RUhC1XWxaMtMWtdBK1TAtgXcrhA43QAEVLNq/U
	6JQNM6L7waua5PQvPhvU4xbM8GDPKYe64iE8ZtrV80UdhAMzMAAxbXg5OT8FazouYHwzSTWx34S
	uCbH5d0sSBZ
X-Received: by 2002:a17:90b:1b05:b0:38e:3fdc:62e5 with SMTP id 98e67ed59e1d1-3933ba9e81bmr22812914a91.19.1786952297087;
        Mon, 17 Aug 2026 00:38:17 -0700 (PDT)
Received: from localhost.localdomain ([157.51.221.167])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267cc91278sm3359088eec.31.2026.08.17.00.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 00:38:16 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v2 0/2] Add Qualcomm SM7250 SoC ID
Date: Mon, 17 Aug 2026 07:37:53 +0000
Message-ID: <20260817073755.2087-1-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm SM7250 SoC is known as lito.
This patchset add SM7250 SoC ID.

v2 - Fixes/Changes
1. Changed the commit order in patchset (first bindings, then driver).

Sreeshankar K (2):
  dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
  soc: qcom: socinfo: Add SM7250 SoC ID

 drivers/soc/qcom/socinfo.c         | 1 +
 include/dt-bindings/arm/qcom,ids.h | 1 +
 2 files changed, 2 insertions(+)

-- 
2.43.0

