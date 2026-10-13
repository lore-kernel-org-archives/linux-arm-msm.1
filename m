Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A312F470EA0
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887547; cv=none; b=jVwkPJzaZcKfByAsDa/0TLbW89fEXYG52U1bRf47l8u1PxwzKmmkN6p6w0C4J57MvPLTdYVz5ZugfET7GI2CJQ7QJNDtfOu1/vNLbN7JqcabCumCbPpltoJpuB0m0W8RBfhjXEnmBimPCOjcOP8Ru2FCk7LNmYHB7RPJQJlKDOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887547; c=relaxed/simple;
	bh=GiOfZFcnmBGnCMiWMtapV+hav8ET/JL0ZQMsoP/OvUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=s0xMlljfrILRHcHaeExCAIT9GIFCCOV5WpPRPxaiUdrt0xC2uTyuCcNdBSUso8H/300r9SkB6s7kO/mlkN1bDx9uvvmB4ZB241CBOHKubcaNEgP5wHxwpCtXi4owSTq5VDljymF4HSzehWxVzw0FD4K+Vw2bhRrTsNtGboQe61o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lWaxzrfd; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lWaxzrfd"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso622175e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 03:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791887544; x=1792492344; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ln3w1ZtEGqIVHWsrNbZbcY9fGH5uqhlzYmvQ7c8J00A=;
        b=lWaxzrfdy4yG/b7H0Z7uNYCPaIh8hLAjSWWY/VuntEZOWFN8DJRZ77soGWJWuiT3AB
         cOTffHyJlJGLxZqE8ny+s5Sur4RdGNWa9Nq6o5vmxDtirzK3Knc9O2GL58DtP+SHxQNB
         hL9J6IYpHj1kIjKIld6F38Op7lFKIS3mRbpRrTSKLCASe1Xe+gJENjOvlT45OQ/+q5ii
         jmBz8m58Dd0ixxt53gTj5pisQKzPsnFVKmuiCITt5v51abmoNenQ8piT4+gdxTX20uqB
         gCk9q5nCQkvKg9olm0ys08ZD+DhV2ywjdaD/E8wNSHme/XZYEqj9i0bjvLxt/kMhcHJx
         NhHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887544; x=1792492344;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ln3w1ZtEGqIVHWsrNbZbcY9fGH5uqhlzYmvQ7c8J00A=;
        b=oZalhLBZHeCeOE0g0yoL6ZwGiw06lkzrfeoqdq9ZRR14oph/yQQaDiEfd3XMIbPfmw
         TbT+FPwfBuFauNETs1ZHfpY1COFI24eFsglJVhQVdwjBmYQpd3fLWNTBVxBkRKEA0jmW
         vL9qP+x8ljWr8HrbH/8269q5xrkLUK8N7t2O1UDpZe7sLn6BB7jrQQpJUbiO6Gdkx7J/
         QCXKxDcpQjsGSYFeajRHDPbDxpIF6MqzGKZFNTBYLsbxxxidqvYNkR0hDVtQ9Gq6Tt0H
         a89B5paaq9AiDEdEnbGwZWDez2vu7uVm8UykdoNI2ZB4z8VbaCs4BzgOl2Wo6MKD/2iS
         ePwQ==
X-Gm-Message-State: AFq9FYKW+81IpAUAOvZ6EWf+uT53Rzq1He61HdhvTjJ9+VH32YORSuNk
	8XRQLWhXWi0dJ5JjgXkzQZNAIOvaLhQMvIO/KrrNmGAQTxeQ4VWQ7IyfRssxvg==
X-Gm-Gg: AYBFou2S5f7lVxB/TMwcojL+n/WRPCd2bZTgCu30srhqL+YbCItWtScbWPUkQTpQTQH
	OPqfZY0LH0eMqGOD+qANG9GuD3o6aWirPzU+TraR0lm3wrNXeU30j+k/LAR8UNTEESEIn4rp2Ok
	Z/zJb8GQNE87FahkV3C8HVqsDeyrRlJ+urSWsYIhDGeMEN7r1LHE6fALeEk5XDEB7QbireUu0LR
	HEt1bHwMvutoETxKlkfSpkuh0ti95E7G6RWhbnXd3kX8YHdMW1Hka5IfNs2EnFdfZJxeHVZqehx
	9UYHSAGNaeRv930osogP6WBzS/A3w9bIqoHBCEdjyLEsEmucHXQI3YjoV9Psr1V2KzpkTOgnsse
	KggxFUJALJfdMM07HKXdHeFiXlsSkzi7v6GTRb24lmkGfUEuFOp691P4vu4cdL/+EoWvoE+KOXX
	wiF7838dqZGPpcP/TBRzMXBigw7gp/nFeZs8BUdS14LxW81FvMwgp6BgENNsMi8QWVH+3AUMzwR
	NlVYZn81O+oJLcsH+DYHHvWazM=
X-Received: by 2002:a05:600c:c165:b0:4a1:706f:b40d with SMTP id 5b1f17b1804b1-4a18e4988ecmr231302395e9.7.1791887543444;
        Tue, 13 Oct 2026 03:32:23 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a18bb68abfsm392806055e9.0.2026.10.13.03.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:32:22 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Tue, 13 Oct 2026 12:32:12 +0200
Subject: [PATCH v2] mtd: parsers: qcom: drop setting of partition's
 mask_flags
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-qcom-smempart-ignore-mask_flags-v2-1-01b7e133f273@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr2K6dkxbAcGV9zDEDGUoEynFlhAN4
 e5WTuDy/eS/t4pIgSmK62EVgRaO7McE+ngQpsfREnCbWGipCyVlAS/jHURHbsIwA9vRBwKH8fn
 oBrQRyos0JkddZa0UyTIF6vi9F+514p7j7MNnDy7qt/7vXhQowKxsq3OVN1o1N+uQh1O6iXrbt
 i/3Cf1MzgAAAA==
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
Changes in v2:
  - rebase on tip of mtd/next
  - Link to v1: https://lore.kernel.org/r/20261006-qcom-smempart-ignore-mask_flags-v1-1-a48d9395b21b@gmail.com
---
 drivers/mtd/parsers/qcomsmempart.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/parsers/qcomsmempart.c b/drivers/mtd/parsers/qcomsmempart.c
index 1591aea48b28..355efb2e4e40 100644
--- a/drivers/mtd/parsers/qcomsmempart.c
+++ b/drivers/mtd/parsers/qcomsmempart.c
@@ -144,7 +144,6 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
 
 		parts[j].name = name;
 		parts[j].offset = (u64)le32_to_cpu(pentry->offset) * mtd->erasesize;
-		parts[j].mask_flags = pentry->attr;
 		parts[j].size = (u64)le32_to_cpu(pentry->length) * mtd->erasesize;
 		pr_debug("%d: %s offs=0x%08x size=0x%08x attr:0x%08x\n",
 			 i, pentry->name, le32_to_cpu(pentry->offset),

---
base-commit: 2f7fa8d90694d21dce68ceabd8383252b111cfea
change-id: 20261006-qcom-smempart-ignore-mask_flags-870cc5a294d0

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>

