Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5424437FF67
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 20:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791316849; cv=none; b=GlidsM2Jh6a9i4D/Ux+8ZUcfMTY1D78M1b6rs/2HQBWCmxNbBofwcfKrhZLnceBMOGlYhsldA+S66xLU/6WNYZ1QH1sXWABdCsOoRcyoQHzhHm6PpvRuoNw5EYCd7s9cHhQGB7WreUZuMawwH114BGCebJAVxhoAPfi5tERZLkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791316849; c=relaxed/simple;
	bh=IOTVLEFCya+bwAvPF8aWNmU1ouHNoQKiZ6FbT18pmDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FnwwIfS5+MVcTdG/KHfeEiWSbcKRY74ocaUdjN0SuXDHDQeOCq8PpT9PPRmiv7DmQVhdyWM0MZQ0f4Llvh6g5+oZR52zag8xDnXGDD6SFeLGwb5SyBg0vXWh3epnbqUEsvU1wjziNGbJ+uuTJZ1xzr1JznsKCg7IXVtDgVqcyOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a1suUD4r; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a1suUD4r"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so11184215e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 13:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791316846; x=1791921646; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o3DAyDVHNrcV6GLzUE6mqYOVGNLRQA+er+Rt7Tx0w2s=;
        b=a1suUD4rAF76viJJmvrblT+5oP5If4OkUCOfgS8TB5Yq1eUM/fxq9gjDg4cy2WT4c1
         j+JTa2r61dIFGae3AKf+oW8oYJkDCuEq0vF/Yq3kzBUXU7KGuKdoipeMSkJecyJaBXVa
         5cvVI5xvF/l1/Zv6Ctz/DLA/ewzuCavxrdNDuEjbkyB2U3GoKBcV6K6Y+2VxaWaWP6f8
         nR9QtpNQQ8uAtg4HbybAZoPnFOWmNkweFKRyGlLGqclRngXOEi4T68QeFFf6/6a4RBce
         hrY8SH4mX98hIbw1Km+Oac/N1YYim5PoaewvSjhXqVjzobIzxRAo56RQTa1+KU3yqTpP
         n2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791316846; x=1791921646;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=o3DAyDVHNrcV6GLzUE6mqYOVGNLRQA+er+Rt7Tx0w2s=;
        b=EVxkTRvLyShAV0rB3+1EuENiIep+BzKfC2FCwG9vb73ycDrsWouOfPCktfTqbkruO7
         8yRC8UAPOkKe1diNDaNuhrRYBT7bKZvAZnkUSn/kPhyBnQic9+0vZ3bNy0eFiM1mbEoG
         T+/3SPH9QU/25my6hkz5Y95tuUlA80hsKLVOiPR1bn16X4Bn7zBgW8zsSuxZCYFJJRZz
         WJn0Mm5gBieZlbFm38wWV3Pb3oWEaLyY6bVR3Gv7V8Yex6MNX5d7/4cVIM+Cxs5ttbPw
         kuAnHLhI6IiZ/EKO6y5wbA9wd/pEA59Fk0RGsJuIlM2iuH9G9WLfo9MT1hUPwUP20az/
         WGeA==
X-Gm-Message-State: AFuF++n92QC35VfoFZdvtu1/NF5cr05/I/BXF8lwaAAyB9JyAyC9G9vp
	Zp+hSQaakhjhW7vWO1z/QfQft1glk+oNDK4xz64SeLwIk1+OlMqfWp7vN4K7gw==
X-Gm-Gg: AYBFou37/18oqJD8fVg6+po26oRF+Ya65L043FFalzn4Rt+MSjv3eYGgw/pixGfb+8H
	Cnlneq80WM2SpMrgfkPV2TahFUGzLQJVyVkr8NImEm37P5TMLArId1y0psczy/uYpmDJBMXBBos
	XetA6DXxFQu4zST7/tWonUCU31CsqHCAUp+zqqhV9m6ROx5VETN6nLa1CLAwiJAkDvLYn7tqnLz
	6IHtZ9iTzbUV7xkbXe/YVxN4TryYlvFjbvDOa5oKMy8rdpFYBNjPELNcLxKBwWuy+ZcXm0ToNBJ
	PXyPkCnp6Hiqj9QHa1hfSd6R1NgcCPMrzk6hoeJcbVrPitpnpTYn9+fxjZZpyrWJI0CcJf+SSRg
	wVm3Z7/5gTjrRZXJcj0cNA2nsnMoQQVVxKgxTCbHL09mzGmyJcM2f21piROCiHKXa4oNZSrVd6n
	Mnc/sVSPnUbAvJPszGGCLtJhHCJLdZPfJplgasOxU/z9oml20KDrnGL1wEBhZZPsUmRFxv33QVy
	V+U0205NGTQYElEEfR/usrcHgU=
X-Received: by 2002:a05:600c:840e:b0:49e:645e:2616 with SMTP id 5b1f17b1804b1-4a17b5365d6mr54722065e9.5.1791316846361;
        Tue, 06 Oct 2026 13:00:46 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a17f692cf4sm16366515e9.3.2026.10.06.13.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:00:45 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Tue, 06 Oct 2026 22:00:41 +0200
Subject: [PATCH] mtd: parsers: qcom: drop setting of partition's mask_flags
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-qcom-smempart-ignore-mask_flags-v1-1-a48d9395b21b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3N3QrCMAxA4VcZuTaQFZ0/ryIioctq0LZbIiKMv
 bvFy+/mnBVcTMXh0q1g8lHXWhr6XQfxwSUJ6tgMgcLQEw24xJrRs+SZ7Y2aSjXBzP68Ty9Ojqc
 jxXjgcN6PBK0ym0z6/R+ut237AW0ir+1xAAAA
X-Change-ID: 20261006-qcom-smempart-ignore-mask_flags-870cc5a294d0
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

The 'attr' member of struct 'smem_flash_pentry' is 8 bits wide,
so it is only usable to mask the lower 8 bits in the MTD flags.
However the MTD layer does not define any maskable flags in
these bits at all. Additionally, the meaning of the bits in the
'attr' field is not documented, so it is not even possible to map
those to the defined MTD flags.

Due to the reasons above, remove the 'mask_flags' assignment code
since it has no effect anyway.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/mtd/parsers/qcomsmempart.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/parsers/qcomsmempart.c b/drivers/mtd/parsers/qcomsmempart.c
index d4fdc46a0073..cd562514f88d 100644
--- a/drivers/mtd/parsers/qcomsmempart.c
+++ b/drivers/mtd/parsers/qcomsmempart.c
@@ -144,7 +144,6 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
 
 		parts[j].name = name;
 		parts[j].offset = le32_to_cpu(pentry->offset) * mtd->erasesize;
-		parts[j].mask_flags = pentry->attr;
 		parts[j].size = le32_to_cpu(pentry->length) * mtd->erasesize;
 		pr_debug("%d: %s offs=0x%08x size=0x%08x attr:0x%08x\n",
 			 i, pentry->name, le32_to_cpu(pentry->offset),

---
base-commit: 55c5b6d5f59f59a8c98a7effc3195226cc20175c
change-id: 20261006-qcom-smempart-ignore-mask_flags-870cc5a294d0

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>

