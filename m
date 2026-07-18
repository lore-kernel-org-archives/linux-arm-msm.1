Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D118A4D8CE
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 00:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784334139; cv=none; b=Ky6ilS+u1iJy3pD15YKfQnIu4D0nDzhNm15uGDsAnRswf6PBNIYmI6EAbw01tmYTlHZaORJ+MsBx6k1oJqxfMGxYNFvADebBZRnpWK/R2oge+B8QoOGU41/LVHNxy28BWF4X3TwSjEuQ/ar6o7RwVwAnsctjjxzxGHyFAaEiRR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784334139; c=relaxed/simple;
	bh=csB9LW5WHw0un70nxzrglTex95/RRB8IvOAAZHtG94s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QK8+RotGZYHHSmvb4pzaFGwLzj0bo0ORkUx2u69LfwzJfDgrCmHvLU0XHmVzkkz0zUTt+jFiBHrC8KVZsocHu5olI7kdidSlWrDg/jl0nEIHIuKocbz+cLcbfqBvx/ctG3mVF3jY2wUyNxZ8gcutCfJviqOU4L9kgWXsTNhSBjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+8I9D8Q; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+8I9D8Q"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso5662888f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 17:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784334136; x=1784938936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zZebbFaWsy8eWuCYvjuH4LuGSdt8lE+CXg5X68CJPwI=;
        b=l+8I9D8Qz79dvYxf1e9jG9Sb9esgjOCkgi25Nn5G9duE5Gpe6ZFqqti+HZ4pFfawA3
         CamTKFPF4zhFbjGMtpDdJuHt+bpKsuPeGmYM2myCxFpUgLOpoOyKDWNIKG3CWDeZEqYB
         AqNGiV7OEZS6bso/MnDE4TB8CZalmoszXmxEjNuwbBczXWXsZYQu1aCPKySGxOT0RPRC
         I1lyi/hS1Zfj9Qlq9WB/VBlTDSEuIP+D8nBk1o835oF0XBiYjcCNyzRc11PJiTeEkptX
         juGkryJ/SFTu6u7/6HUD5BlOlz+473HAvXsnjjfbNMCsps2ZAqI0WAJ5Eji1FNFwjXTi
         LVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784334136; x=1784938936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zZebbFaWsy8eWuCYvjuH4LuGSdt8lE+CXg5X68CJPwI=;
        b=tFYQmbtUKdEqLfCIE8v3p8E/RzH7xYAPoQ72U/S9r5SFCFSvV7msX7/5RHwpwmkH+s
         w8yEPXi/9IiW288x5KaUe2TwVB4TmbmmK9L2umAoHs+7dRAw2yAW6zQ0copVcnyDUOJQ
         5s9SilsLDM1eyme/PDA2pmT/hXaOT0bz8g8J9dhjpaP3jerSmeaMt6+ERmMqCom8U00f
         uI1qLhIrWrGWc4VwRI8tP2TvurrBA/lCIncriVsGsDYxYtddmW37OwtdgngaZhqlcrwG
         +Y0H1MNnE8l4Y1A2FrvmratBn7mpG5Y41XsBc4DaGEEGGQyEnzZNVNtPj2nJJP/EOJUj
         GEiQ==
X-Forwarded-Encrypted: i=1; AHgh+RopxftgJD7Wj5zKTM5RE7hwbB8j9kV6s4rqAf0ROXEu+OWgZcNbX0gE13yBXaFK6BCJBSrglcTkmVNCpeDR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/kdMEaS/nlXYZDcOnUm8xtcKJYtLGDZH8Hcyn+Er8wcN9TIq6
	9z/fsxgEhvy2aV6Gf8bJ/lODIDtYTs81j1E1n4Z4w+E0l0niBH08cj1j
X-Gm-Gg: AfdE7clMKtA1vE5gmTZZrBDSTs9AlSa0/oLxHy8Tx81O0Uro2KvoBBNcnLCFu1V+5vf
	iXY8nFZgwDZZXbwe01bsb4kyj0q0ubtDWHVZ+QYc1GgreueZwmzwG+a/ltoKoS7DfXLOA4BAB+i
	M2PIvUiTDtDZNFPeYmDO+zIdrgQwp38tfWXrc9R2eSTBaoCfGNCk9GQbQse+Y2BZGVkwOKLDOtd
	fcePGnQlwGfBqipU7I5yCy+qM9JFSaGmXZ13fRKg7DcDu3X0yGfBb7l2ZL4g/khx2XrelakJen8
	0MXNmKjNEcD7zJ5DBIhoRgM2IUOEY3G8pN+J8UPFjSGITrrHUJ7RkueAmLr0E+c0LF9FDV79zkq
	mTKR+pN4U5wAG62vtvk0+zeVL/Z9Tvo4LYtjo5P8nocS1/qv1w05Ko/l6L/d22mbTk9Ed4tecK4
	TPXD/tk7EIZrc8hEy7zZevsbcb2JGMXLRa2XYQLjhmii8yR4rjxw9lRlUAZ+wmjTworgkt6tUEQ
	SnugQViFRkw2LE6Ifosm5QG+E8VfkZlWNaXSPN9NUyFG04drWLPsQ==
X-Received: by 2002:a05:6000:2412:b0:47f:6103:e0c2 with SMTP id ffacd0b85a97d-47f623270efmr6122555f8f.35.1784334135843;
        Fri, 17 Jul 2026 17:22:15 -0700 (PDT)
Received: from spaceship.tailf1107e.ts.net ([2a00:1d36:1938:ea00:6509:ca16:7c02:4e47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63eea8afsm8504757f8f.33.2026.07.17.17.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 17:22:13 -0700 (PDT)
From: Taceddin Sancak <ts.solidarity@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taceddin Sancak <ts.solidarity@gmail.com>
Subject: [PATCH] pinctrl: qcom: ipq9650: fix audio_sec_mclk_in1/out1 group pins
Date: Sat, 18 Jul 2026 03:21:46 +0300
Message-ID: <20260718002146.698973-1-ts.solidarity@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The audio_sec_mclk_in1 and audio_sec_mclk_out1 groups both list
"gpio37", but in the pingroup table those functions are muxed on
gpio39, while gpio37 provides the audio_sec_mclk_in0/out0 variants.
This makes both functions unusable: selecting them on gpio39 is
rejected by the pinmux core because the group is not listed for the
function, and selecting them on gpio37 trips the WARN_ON() in
msm_pinmux_set_mux() and fails with -EINVAL because that group
cannot mux them.

Point both groups at gpio39, matching the pingroup table. This also
mirrors the primary audio MCLK pair, where the mclk0 and mclk1
variants live on separate pins (gpio53 and gpio51 respectively).

Fixes: 3c8e7ba0e399 ("pinctrl: qcom: Introduce IPQ9650 TLMM driver")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Taceddin Sancak <ts.solidarity@gmail.com>
---
 drivers/pinctrl/qcom/pinctrl-ipq9650.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ipq9650.c b/drivers/pinctrl/qcom/pinctrl-ipq9650.c
index 64e443aa31b2..5399d7ad934c 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq9650.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq9650.c
@@ -310,11 +310,11 @@ static const char *const audio_sec_mclk_out0_groups[] = {
 };
 
 static const char *const audio_sec_mclk_in1_groups[] = {
-	"gpio37",
+	"gpio39",
 };
 
 static const char *const audio_sec_mclk_out1_groups[] = {
-	"gpio37",
+	"gpio39",
 };
 
 static const char *const audio_sec_groups[] = {
-- 
2.43.0

