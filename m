Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725F241A922
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 08:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790238826; cv=none; b=sbvmI+NVrjakLU3OFSE/6FuoANPWalYY1+MlEKiwPEWCWvKRGbXHA9lksqU58d4FKopkCfhRSClSwHpkBGUiWCl4mjIjeRNUK9lrjdyfI+fIhQPQg6cSz5PjXjQMfet14A0sBoGpu5+1ip4SCZfhGcGlrdjM6cPFX9cpTP8Ag1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790238826; c=relaxed/simple;
	bh=WBX3aGhtFyipRdYPJD5smARBTFyQZ6xFL1EZ6dKpOJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nbCF1TZd5yZ3wZktfEvDuRysBFkhZ3K9GhCohogyTk6FMk8kf5HVxcgRUxMZEeL1pUaItv5LI191xJ/SePNebfz95Xe5gbM6CYtiQOn8KSmX2OekcRYbBNFjDpVVE/O558iQEShMf5faM5Yhbduffnw1e9kfs3DfyRrtlebELWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GgUosM+2; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GgUosM+2"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2db479a55b6so2300255ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 01:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790238825; x=1790843625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ob3e92w6cY3QcE+pXNGDPAL2QL78Cpj7aplaysdp/W4=;
        b=GgUosM+2Axy9PZdEUu2ykRJbc4mILEiCSYIk/ll641JJIixyYDcFIxO7PmYMjT/oj4
         ldGjrreNp48SwONGJHfAcb87NWqsn6sMs3Y225pTjeZHhq7udtiHjxCMFKEFCuem9K8j
         jm0hgtgdHv7f4ZYnGRzEa1TCThpVd1UYaOErXugdMxSMv0WnABXhyq+sqvQ2R4WVmB5n
         cj4d2Iz6A6xNylKaO9YNpZSvIKgMeXFQQQ0ot2T/jBj727TOqiSz/lgF3i3tqtf+TpDV
         rOu8uhcnliXVG8vfw7DobjzSDMmg+170J4qC/YBR4vZ7vW1qRkDhF1CXnsmtVprDJDH7
         /Etw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790238825; x=1790843625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ob3e92w6cY3QcE+pXNGDPAL2QL78Cpj7aplaysdp/W4=;
        b=jSUMixwHS/ksMOHXiiPOHuWuKjyLZhCAUr0lO3z50nH6Fv1rkXBGFdhseAcwQO+MOl
         0xXXYBJZvWZ1XWB77ms6RaDE+uYcixRCLOlb5OMVHhZ8RmVO1y4jnb5jqKEMsebNigSd
         uOiojS/gtiffxAj0wTjj40pLkEQRbb59RxqoNplI9/IMduhyDHEau9kBgG1jcT9KMzYl
         5ztQJp/yeF7JtvEIVYbS1kyFfARfLAZP/bMp8y+H08BHDZUKGNKhXjqVNCB38FeAHXvP
         ijL8fKx26xN2l4ZplYJ4fA/fN0bhETijXjgkGeMkmampBsGMd0+E8HKLbYISvvXTay3r
         6kKg==
X-Gm-Message-State: AFuF++nuYSFw2QiItgzS5Hninqlm+YKY7PN6TKte3O8kid5eYo4AMt+y
	8aokZbumzjOXgSuwqqX+71C4Du7shRNt8XgjI3gbRh1liHb3BnDum0hDoDY0Qg==
X-Gm-Gg: AYBFou0daeFF4D0WSp7k1ZQVC35yc0J5kFH23eybUwd9alEv+2RpyZvaQt6AhBiqVCU
	OFtLrKY+/dXhYpFq/uYEdNgtcXtueEnozysK4b00oD5k9UdFFb1wFweDlLU7Za3AyHI+X8IFLF1
	9unhM0v/ugT9qUSgSqV++/JhPJpK+uqV4tq0tnfAyoc55G+I5RxjZtWUM3FvnJDJFq2HftH0AFI
	cdUp0cP7PzzzwElkWNjqvmTdmZnZM4nok5l3tzlvEm9MtSNIUiLQauhCe+owdEwi2ZA3iYgbmbI
	nbRWWZ0FOWuqkvrhhxDuADhPz4jkboF6WbBcSY1Bj+ey57ycTgSypeSnl3PxgAWKJVa3vAGUPng
	qiO7Lnyxbaf0/sALDUb2RApPrqunkt9QAhGgCOkHhKWL/XjTrAeNTbcBdS672zqvJiW5qVC6jSt
	GtOk7vdb/hQfxMlZiJhhPj2mVEeDbBfVW2foRuVWetf+QRKvJfG7ieB72DBZgSk70bPx9ZWoQJM
	AtbDG6mOwebYA==
X-Received: by 2002:a17:902:fc48:b0:2cb:2b50:d9da with SMTP id d9443c01a7336-2df7dc4be1fmr23757885ad.3.1790238819897;
        Thu, 24 Sep 2026 01:33:39 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a516d8asm22659015ad.9.2026.09.24.01.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:33:39 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] firmware: qcom: scm: Allow QSEECOM on Acer Swift SFA14-11
Date: Thu, 24 Sep 2026 16:33:03 +0800
Message-ID: <20260924083321.33129-4-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924083321.33129-1-liujianfeng1994@gmail.com>
References: <20260924083321.33129-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Hamoa-based Acer Swift SFA14-11 provides the same UEFI variable
access through uefisecapp as other Hamoa devices, add it to the
allowlist.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

Changes in v2:
- Add power-supply for the backlight (vreg_edp_bl), matching the T14s
  LCD variant
- Fix swapped vdda-phy/vdda-pll supplies on the QMP PHYs, matching the
  reference design (cf. commit 7c1d0ef2969e1 fixing the same issue on
  Purwa boards)

 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index df20773dd7541..e83814fa7766e 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2215,6 +2215,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
  + any potential issues with this, only allow validated machines for now.
  */
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
+	{ .compatible = "acer,sfa14-11" },
 	{ .compatible = "asus,vivobook-s15" },
 	{ .compatible = "asus,vivobook-s15-x1p4" },
 	{ .compatible = "asus,zenbook-a14-ux3407na" },
-- 
2.47.3

