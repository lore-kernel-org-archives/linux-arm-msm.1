Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4961D30E0EE
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 06:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789196232; cv=none; b=nmGaE2cVLgvtMJ9n3WttlqHWRbHz8h0keNlcoBfrBGeCbtS1SwzZtnCznFfOnV7q9Jnsf0L8/Pmz3mzq9e9GfUVS6Xww2FLrGvQt/WdoybxPDWxpWFRFwHuo/JI4msxMjF3SPFM35zem8AlYgBgyXZbvS2I2j77zTM2Iwgy98Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789196232; c=relaxed/simple;
	bh=mr9mEofpZg517wnfuvyOVQlKcymgg20rBs3rPdaoQTE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gGpGE6tjUZLVRgQicOM8jAKYqTtol1qtb2JvA0FxH0UO5VG2n7hoti2tTDHw5my/yMNBiZbbzVSalZC6nHt+GRtn8yE5fWjbL3tx3Rf7dw74x+lo3gi02lLUeW1b0K9NMDS2nSFbLCKWNi97L+6zs8ooPgOS+6BZ+VflkVEUjpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BQ7edGGc; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BQ7edGGc"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4858bc96fabso195539f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 23:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789196229; x=1789801029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=81nBBk0ZNsJNmNXGHQvlj0ybllEDe9lXdGKxk1W969Q=;
        b=BQ7edGGcyXg75I9K0WkY+sMjmYL4/JPuPrsehQFI28AOotsdiDSy3dlQwWiXsXnAfw
         KB5VuEQ7yFFJVuV8++TajvFeqOX03DMT9JmxVcKPt4rmtQKvKUYsz1Q6CzyyhyBygZ9J
         AnOssCbbPZcXtNius+J7i3bWXwWdPIhEjclfw+jrdZWJoFWZIVNYwO63tBv4bqRQZAeP
         T1Su8rRFWs6WpdzDBlqbYCkQCquoHaMa91zD+IdrU/3yL2l5P1HvUXZWXCVVmMbxZKY0
         pmA82b/s4Su4PSa4xsVwPoZT+ps23vxX2IrEc689BmPxRmKSza+OvgjoUSHOOoO88Bkk
         bEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789196229; x=1789801029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=81nBBk0ZNsJNmNXGHQvlj0ybllEDe9lXdGKxk1W969Q=;
        b=d7k++/CCIxFrj9ZF8MtUFqPIYtKwThNVh/cdp9/Gepfrl/j96ISb5BjZY/dknGQwqv
         WMRtrtbfmMyTGHfiRp3vp/wlG+kRYQD6qrOvDg/kzJE2uPRj0rjhLX2m0WO8wOA7dFmy
         CHm2SyZsC3uo1JOkg23orbo3p6CyUhsrd+IU+ErYSrRLmlYq9R15rP0CkBxdcNEGKy4J
         WEoONo98EHtAJ6UeSd2SPp2SwiogVZufCIojVJcdWpByy2Z2hGzK8V2LCwAH8cdG2xxu
         99kCYwDdln5Cj+hM3duBDjVy/+uJSB6V89kqwy5JjaCCwNh45Co+YPYKhLa41sF3g37q
         fJEg==
X-Gm-Message-State: AFuF++mAZfnErn1QFG+TKoATsXarBYoo+ARZLZO0FA7AA/NM8xxVEMKR
	oeZhXyGM1SMkSFUvRFAk6Hblmzmrc89RG4YJTgf15B0tX0dutdUjzlgV
X-Gm-Gg: AYBFou3XEJTFYGeRSGJiVhe6yyR8kE/f8eOICfWo+kA1ZJ8Bgum6DDHjMH5Rrp3O8O2
	tSZdnaOBUzHdH1puIcNyJI1KaPPK6IMisB2j9QO9jOjeG8urBE+FkcZMtkAo6TExXN71Ztq2Lgc
	d/b+TcFSC3YZSimZuH7t7+AM9cteJb+cw/MGTXwE6g1IZ/MGEb0gEV5IEgmAcgYIAb7EkLRA3sV
	uvmI81hx4ElyCYdAu0nSQumFUHPMetkM2q3QxGB0qClFqwmTwoZvH/txvGa2XiihIAkFclM/Ui+
	8os4Kjes8sIC2ShOkhE1d59vY8XmTAaFU6Z326jJWd50rtBbzOklWsNYrw7sehz7kXBKnCo+D2M
	K84ISYWfQDdLRGNyRBUWkxownEqIZXK0klTMZjWrjbS493bKbz3E0gg+/xAJbaL86nYPwiASCDq
	WEuBTwHP+VhHdNrp60rkeJwJKLTOM55cRiXsilYcRNR2zANu2n8hWFIPcK4BVljdbjzvPcncw9X
	5m9BWCbXDZIBxdEUQE+/S3Klg2KTbz4KIlQhhzSqmO5ku1h8aA5lonEYo/+8ErV+udeU3h2mSZI
	rNPw0ASigwqN
X-Received: by 2002:a05:6000:71a:b0:485:8a46:704e with SMTP id ffacd0b85a97d-486f6c4b7fbmr1611416f8f.32.1789196229218;
        Fri, 11 Sep 2026 23:57:09 -0700 (PDT)
Received: from localhost.localdomain ([41.90.145.204])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486f301121asm6495278f8f.0.2026.09.11.23.57.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 23:57:07 -0700 (PDT)
From: Kenneth Kabogo <kennethkabogo2@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kenneth Kabogo <kennethkabogo2@gmail.com>
Subject: [PATCH] soc: qcom: mdt_loader: fix off-by-one heap overflow in segment name
Date: Sat, 12 Sep 2026 09:56:51 +0300
Message-ID: <20260912065651.59968-1-kennethkabogo2@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mdt_load_split_segment() builds a segment firmware filename by
overwriting the last three characters of a kstrdup'd copy of fw_name
with "b%02d" formatted from segment. %02d is a minimum field width,
not a cap: for segment in [0, 99] this produces exactly "bNN" + NUL,
which fits the buffer, but for segment >= 100 it writes "b100" or
wider, one or more bytes past the end of the kstrdup allocation.

segment is not bounded to [0, 99] anywhere before this point. It is a
raw index into the firmware's ELF program header table, ultimately
bounded only by e_phnum, a 16-bit ELF field (max 65535). The existing
check in mdt_header_valid() only verifies that the program header
table fits inside the firmware file, not that e_phnum itself is sane,
so a small firmware file can supply e_phnum > 100 and reach this path
with segment >= 100 from either qcom_mdt_read_metadata() (the hash
segment scan) or the main loadable-segment loop in
qcom_mdt_load_no_init(), whenever the image uses the split-firmware
convention.

segment was never valid past 99 under this driver's own "bNN" naming
scheme, so reject it outright instead of widening the buffer.

Found by code inspection while auditing the Qualcomm PIL/PAS
firmware-authentication flow. No reproducer beyond code inspection is
available; I don't have affected hardware to trigger it on.

Signed-off-by: Kenneth Kabogo <kennethkabogo2@gmail.com>
---
 drivers/soc/qcom/mdt_loader.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 002100fe2..0d55e9e0a 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -77,6 +77,9 @@ static ssize_t mdt_load_split_segment(void *ptr, const struct elf32_phdr *phdrs,
 	if (strlen(fw_name) < 4)
 		return -EINVAL;
 
+	if (segment > 99)
+		return -EINVAL;
+
 	char *seg_name __free(kfree) = kstrdup(fw_name, GFP_KERNEL);
 	if (!seg_name)
 		return -ENOMEM;
-- 
2.55.0

