Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFD2377AB7
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 14:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785076362; cv=none; b=XSVr1c3+dXkizJvmU3ksUtUvTf4e9iu8TRnRl1K1xYpMIdV2I9fQc80aI7eZWGGlwGZdRTvmD3xpNfQPYMUwetQGrMi2MiO6sViqGWo8WEGi/j4HIIWS2nxUmdJa65oftx04/ZsbbfNJD5FbuNKQr9ocNl5qahBN0nGRH2LkrRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785076362; c=relaxed/simple;
	bh=s4rIeCCgo6l5xX87e3qcMC4MnjazRMjVsmVzVb47VSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U/utiN3esgS7VVWVs9uk6OjML49HHlvgwsgAeBOLWWGbPulwtCVb9k0MX0MKuBZIJDcl+fVPVOYdtl712NxczGNuUcYnC4pEskB8nFPGSgVl+BXM8wC+rLabL8HSmY6MmOcfZ/90nZBnTNRQF4wfE1ZuGMlHRad2luefOEPqKtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N1fLrzS6; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N1fLrzS6"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so28781865ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 07:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785076359; x=1785681159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7F3AYz8DR4/4e3Mn9I/dRrRD8hvn3fnDDc9Y1ajQk6c=;
        b=N1fLrzS6UnM9eaYh66qT24qwAJXIvJiqQofcevvpATvNY7cc+P8fO4FIwleEquea8T
         3n/9U+oSy9gyLJt1lTTvvm9wpwdPWFkfl9SOC+I/7IZgaEGDBfnkle0JKab8kPyrv+Ze
         VSX+ws3VsPYWDeaPPZIL8Yx38FkYR61Mg45xKSYD1a5J/Kl0nVMfdv9Ghb9mPZiPJjkQ
         r0tzukqaC6GcMYYDmNFTOHChoLDhp6YlEeR5VgaJkspBFcg5TMSI5WcP9w7faz6ywjrw
         mKEJqKGGoOnOL89lraKrKo7W7vI5DyZtGt7tCzXdmgMMFrYba7/ugF+QVOwl+hOsBsJM
         0qWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785076359; x=1785681159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7F3AYz8DR4/4e3Mn9I/dRrRD8hvn3fnDDc9Y1ajQk6c=;
        b=rBstT/XqdX5dMdtW1GJmBDOU9E5tWR0cU5fophYv0UhnqCPlas6TSVQERyqPOr9+US
         DF7GwKVn62OWmZqTNx/UnrQV21x/+LydBcTDBpe++Gh1Ys2QL9vpnh4xU6rYrYILADj4
         y80LqcY06EMSGRyVDP8ytSt+DI1oUJWjW8ymxIsVFRpRffp0Jw97SjfHi2mDjw7mQGAL
         M3+yzz2WAufUyCDUJYUFn5CesqG011QXz9KHW1os6v4E8c01pdkunIKemH0Vr5x+UyKB
         OZrHWxzrO//zdy9xkoeBx3kDirb/3plooBSgzqqr84HH4eAexXBytNV+dcX5v7R9TDmw
         b0Cg==
X-Gm-Message-State: AOJu0YyEyUgfUrbFhZZlD7dZpb8e0jomg4QZqXCh9LS+7wDKalNfKf14
	Iju9SvJAYJgwLeLSa2ATuvdt0gGqI8GrxqgS4VKgcgKr2ihsSDwbvCP1
X-Gm-Gg: AR+sD127JF1/N9vBPwpzddwEKEmOdxobcDcOdgHYUw0qbQ2mxCI7CbOcJy1Dd8huE6r
	FcvyJ7U4BYVeSwcO4KQhQBFDp+MWV9QP75EJSURJLWSkddMdunWcoH9e6u64U2KF2etGelKdFRp
	oO80gjECSaxl3mxVEMvsRYbDyJcwIlKLi6EkIvuaUb/olZMUbGJfw+WIBb0uO3qwN4RBzL333Kx
	+ilIKfbxjnDhVfNLhzUOjQ/lvm/u8fGQg+q5f7EQii0FcgboxQCf68o6gZFDjPv3SlLJSAEpo0/
	B6dF94aYdrP0JGcq3IEFyBzWpGAeTVs2Lzz1zSHQ/zu4xunpiCgkAzNB8OJ1UjgPGThrcGlZzVO
	2dnVznF6hPPAzYpKTzxwagFcSAucQd+KwfB/OcYVwFTP5mPKM3CHN0cVnvqmcLyYh49ZGngTv2B
	4NWCG68Qp4eI9hV+SNZsayABivhhlVKGr03lOp+IpK5vuh
X-Received: by 2002:a17:902:c94d:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2cfde56bf07mr54508055ad.0.1785076359059;
        Sun, 26 Jul 2026 07:32:39 -0700 (PDT)
Received: from nuvole ([2408:8456:3213:88d5:c960:d4eb:e951:e287])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7f8e73sm20552015ad.72.2026.07.26.07.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 07:32:38 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v2 0/2] Introduce Lenovo Legion Y700 Gen4
Date: Sun, 26 Jul 2026 22:30:46 +0800
Message-ID: <20260726143048.130116-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an initial devicetree for the Lenovo Legion Y700 Gen4, which is
based on sm8750-qrd.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Changes in v2:
- Collect tag.
- Add the dsi panel node, since the panel driver is upstreamed.
- Use consistent name for fixed regulators. (Krzysztof)
- Link to v1: https://lore.kernel.org/linux-devicetree/20260719093226.197740-1-mitltlatltl@gmail.com

Pengyu Luo (2):
  dt-bindings: arm: qcom: Document Lenovo Legion Y700 Gen4
  arm64: dts: qcom: sm8750: Add Lenovo Legion Y700 Gen4

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../boot/dts/qcom/sm8750-lenovo-elden.dts     | 1170 +++++++++++++++++
 3 files changed, 1172 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts

-- 
2.54.0

