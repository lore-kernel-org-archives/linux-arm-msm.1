Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B29359A6F
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 07:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787815665; cv=none; b=s9kmxB47HIjSG+gS2xeW37uBfbuC69yA+hcwSHd9VGqBtTbHXELnC4lIMGQj4cumsFauEK3SizEwQhQHnLeyLyWte8a5RR2B1aOzJRhrec1XVY4wLI8x7Ueili1QnpvySHa1TavSkQtQ4saAL/HYTy+0f/sdZUWfXMnhxoDF7g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787815665; c=relaxed/simple;
	bh=RW+2FLygnkT7VKSaO3nDahuHx/wOKYtQk2ensP7S75Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L6+aaqZnUNdhcR4RqBbG5tX+Go5Bks7M+YmF5JV5GzKZpBDJKSlHN/R3NKgpuiX7DdhM5iYw7ponbCvBodx2PkMERn0XQhLM7o6NJBBKIZ/TTZdVBnLgADTgTevFQsKrNu2/U4r3LxnHRQT16kVDcoMCdGWHI1xs/Zme8MwBo4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H4KA730I; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H4KA730I"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3964e76d0f4so2288751a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 00:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787815663; x=1788420463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jhgeScSczCiBwmHIIxWPTFb5OADckPp/7bxTknyDE6w=;
        b=H4KA730IG6fHs1R2p4nUSj+Hpok6dD6Zd8Ij3DbHqbsvjqCXkquc4CLaaGRtSA5tYb
         ddcYs9ZEaJ4h7TQ1C9iQq+/yn+XlLgKIGX/Ia2ZAF6/45jsFTj5f4kL5Z8EEX5x0q1Hf
         fYqyu7ipVheyDM9e1sAODuAAdIZeB9a58kVlGgeah9GiJs851R4c1tNylJb8ZaFWWgdd
         GQIzG0bUYapTzerdza2VUEH5t5Qum5s6PE9SqXITOkObM60r9S2i9UNMgW1MuNfJGDXv
         9u0BDbZ7dn2oLGDJTCiM/ZrrzQdJfH7eE58kKhxqosk0nBCZU8n1+j4q+IuuOfZ6RT6u
         NVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787815663; x=1788420463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jhgeScSczCiBwmHIIxWPTFb5OADckPp/7bxTknyDE6w=;
        b=hMDZHL3hjSDbMJUqGEeeMzOKINAea0btafj6BSwk45k07SMxWX5cvCOLgO94Hr1Bm1
         l2JSn98FOcTI9HLanfqOlA4d4NWjMO2u4w4Bvr2EW6bgQYKEF+C6O4+ChIO/a/M8q1zn
         FPIwTfJ4fTvg1wNUKnA/X/ZG1Gp8s21+cI7nLLCW0FC1hDj1t9cMQZuQUMI36whIQJq2
         If2JPaUjETIyJxe4ANFSg892Xn/71TRWb7eKlDnZEpQPVXwb69XLlZUDLl2Br9HKuctW
         +oysNpK8DDzBdzoNXDkPgjCGdt//5c0PpBmdzLmOOk/RjnTIDcnqQ4WS0pQJlMzwu/zL
         j10Q==
X-Forwarded-Encrypted: i=1; AHgh+RoTCB6IEY2qEi4yWuqXxaWDL8rweJailoZomc2E9a11PHxdkqDBVrJ38A5DiumC63dNqqZk/c4GM/m+F/EF@vger.kernel.org
X-Gm-Message-State: AFuF++n10beKkEUcVVunnW6vayBIpB1GiQq6e8XVo5zcIiPMaihhbl2a
	vC1NUpJ+9r8l/eXfDLgw+8YXWIzD4RLvpXUeXyKx5o7JU5AKvZv3ggSj
X-Gm-Gg: AR+sD11RE9L1cO7RPqx8LiJTR+9hKQGrC9IemGQYIKAc2I451cdpIJOMy/XyVvuGGwe
	B7UJBLRPMKG37IXhfbicYsEBzbTuopCyy58uLiCl4y4uGUhi8un4Ek3ccyAK4tqAPYR2i9HW1O+
	cj5YW0MS5q0GJR65fXwipOeGymX1G4nLwIw+0EPy42lWwrfMvDAuQClicN5Db/MOBraevrdETEQ
	j/dq6zMHSty1VUCNeiY+lK9XVRKyKCG+onUGvjWpfG1TrvuW73GOUvLPuLHwWtauyFiyOfJ5fJT
	BSpiymAV41fQnWgLs2JrJsm4TtmK5A5O1MFjoVUcqaoj9iTbsigyT7MD9++3TTS4vC8rQ8RI16K
	lT+d130/29abqG84F8so/kUMebnuBAwklTLgWEpUhOBgdvnLgcscMZE840ACWumrRMncnuYs+2Y
	NaIIycX3UstzBXS8DeSxZ6f9L6dVlc/hA59RAm6oHOsbF7ibfrxUwjWZENyiARMeoDMRXTcWwIg
	FgOnSS0ebuM/kHAOqnlMRxVK/0U8g2TnVhM6Q==
X-Received: by 2002:a17:90b:4c8e:b0:396:65dd:4093 with SMTP id 98e67ed59e1d1-3966d44daf1mr21255453a91.14.1787815663140;
        Thu, 27 Aug 2026 00:27:43 -0700 (PDT)
Received: from urmom.192.168.1.1 ([14.170.170.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396705f6106sm1791052a91.0.2026.08.27.00.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 00:27:42 -0700 (PDT)
From: Lucas Sproule <lucas.sproule.42@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] remoteproc: qcom_wcnss: Fix error check after devm_ioremap_wc() switch
Date: Thu, 27 Aug 2026 14:27:33 +0700
Message-ID: <20260827072735.2262888-1-lucas.sproule.42@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit f9b888599418 ("remoteproc: qcom_wcnss: Fix reserved region
mapping failure") switched back from devm_ioremap_resource_wc() to
devm_ioremap_wc(), but kept the IS_ERR() check that had been added to
match the resource variant.

devm_ioremap_wc() returns NULL on failure rather than an error pointer,
so IS_ERR() never fires and wcnss_alloc_memory_region() returns success
with wcnss->mem_region left NULL.  Probe completes, and every subsequent
firmware boot then fails with a bare -EINVAL from qcom_mdt_load_no_init(),
masking the real mapping failure.

Check for NULL instead, and return -ENOMEM to match the other remoteproc
drivers.

Fixes: f9b888599418 ("remoteproc: qcom_wcnss: Fix reserved region mapping failure")
Cc: stable@vger.kernel.org # v7.0+
Signed-off-by: Lucas Sproule <lucas.sproule.42@gmail.com>
---
 drivers/remoteproc/qcom_wcnss.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index c856a92af43c..90747af237f7 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -542,9 +542,9 @@ static int wcnss_alloc_memory_region(struct qcom_wcnss *wcnss)
  wcnss->mem_phys = wcnss->mem_reloc = res.start;
  wcnss->mem_size = resource_size(&res);
  wcnss->mem_region = devm_ioremap_wc(wcnss->dev, wcnss->mem_phys, wcnss->mem_size);
- if (IS_ERR(wcnss->mem_region)) {
+ if (!wcnss->mem_region) {
    dev_err(wcnss->dev, "unable to map memory region: %pR\n", &res);
-   return PTR_ERR(wcnss->mem_region);
+   return -ENOMEM;
  }
 
  return 0;
-- 
2.53.0

