Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC3B391E58
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 06:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788761871; cv=none; b=hAK4NIDdm8+6n6VAxBrIKrmy8BmcJhxD/+f6njsN9a3MYmMk7zUYPITzQWPSpRhoiIHFR7CPxnvyyFhtlqMNCOydQ8c3VvxmdBTWclCb6A6LY3gcAis5jkN7ko5iCeIhnWlcGbBRG7SHQ9iO27K3Lv89FBvvth+w5SAf2qL7k/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788761871; c=relaxed/simple;
	bh=9Shnuk5nouoBhiZ/Jdx68ua35RRHyu/0qrOb3Ep+NAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t6agEH5m32VfVQo6oYyF3dAHygoYMK56GHJtPjQFRx0J7qTslBY6SIJAfxotp4oRAPstcq8gtAqKqDdmWJw0I9ihQHRIxQMuBJO2dFdzzavUDkMoRP3CUs3yjZTKbzX9MSSqMLQBK29/fhns9LMw8q+luDKdUP04iAUy2RVDfN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mu1U44lG; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mu1U44lG"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc1b838f9b6so3450819a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Sep 2026 23:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788761869; x=1789366669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rlq/2thC2NvEtZG51ldrTJ3fVj7Lzl4wwg4Vt8OZ+TQ=;
        b=Mu1U44lGc2/uyNuRFeBKK93FQFextyjIvp3rDE9Vg9t6z6ebxn+Vs8ujvIEKtjsuVZ
         VPt7kW2a94pcX84uke2PTFz05ryzRUreBlBCJoPGyb90+K4Jnj6+gqrgEx5g881aGCGI
         Lo4XRnqOPHskHd8RKe0IhE1LukqwtVEy15Fzbj8nko4XT+b9Hke6jCu++aFRdFq7fdki
         Gn+Vm9AOPZXBNg93Wx/pfO7YA4J3Z6C1188IHFuBmZpiztiC0YOdUx8ioL1uf6NRyyeM
         fZTL9tzpQjYGCbWuLbS9xlxf1ZMtSgEmfP998V1/4jQJ7IbieGnXQlFjz+gdw7HsWfog
         S12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788761869; x=1789366669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rlq/2thC2NvEtZG51ldrTJ3fVj7Lzl4wwg4Vt8OZ+TQ=;
        b=eodffvubV5gvOMjto2r3aSeESTBB3WJU8MKQ1RvzU6AlxzEsmP++vm8g0YGKZXpmjv
         tF5U82zm3nstvczqcbckYdDuPZw7GgGjdH2TxczEycrxJq7tgGyVoMU2TN5ABky8C1F3
         J58OmHb5J+8sGiL6R/hdgeuqI9q4tsYJAAS10OYGbvgAYoCC/QwQspdfnz3z17h7I8Lh
         JGbzlJD9HApEQnBr3tPXBhsdlyD0dmSoCyUWajjvdQSzFV41vMmIsaQc8AMQqtEiqGmA
         m76j/QdlZ+XOmjlXLUyvPJqxGz2m+J4T+HbxUFwWB38+VhTQnCs5h+ufWTVQsv/6VqiF
         Seqw==
X-Gm-Message-State: AFuF++lfg8SRgkuTzB84EYXTttjad6U190vlDie+258jxG6MIuGXzFI8
	JNgcTPRIOMSadfuv3rH3y9rS/Ii5h2tJBNGdGnLCofCNCuUPIP8AXFEU
X-Gm-Gg: AYBFou2biBkoyVZuVNABdyARwrcCyR7qlPtWETwjdYE5y3o3ImC7DxRbaSIVbHAaDXO
	82uplEIcORl9ScPPyXknZrdFJR6OhaSjIjyXbwCvEjnSgp3NGnn0u8LWVrFpN9jLoSqEjBFtsMy
	KJIIssWDMGpw5l6tG5ZZj+2AU5f8DVog1USeW2YBmJuEphDcFJe7exIpdDFipqHh20MGAYTp1fu
	8tlrWg6C4p06ggMWOyglWBd/sCAnIf2Wly5Df15vFGBWyx1EO4FPN9OxCkYelk25S0sZhZo+w2m
	kkuwxGasRIAkLhyDHbfPVwM7mKepWRdRM51LvQamQ4422s+lOkEPL+LAPTrPcWAqiauVCdEPStd
	KyUR4TATq1oJEpwNDkT7MggFeJjyk2HMxfXEu5CTBZYW4tt/dAJkK7ex7rTpSx/g3VzocJbkuRO
	V9gVo97rmZ7M18xDeskdbLrNp6Obvo3lL4saZOAwO3EzQ4k3rPCOw0HPMCTqJByNjQw0kgsatB7
	mZwhOGMXYldBg==
X-Received: by 2002:a05:6a21:7484:b0:3c3:8d86:9855 with SMTP id adf61e73a8af0-3da39bd47eamr40190370637.7.1788761869332;
        Sun, 06 Sep 2026 23:17:49 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm24275961eec.22.2026.09.06.23.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:17:49 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] firmware: qcom: fix typo "uninterruptable" in comment
Date: Mon,  7 Sep 2026 11:47:41 +0530
Message-ID: <20260907061742.10954-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907061742.10954-1-hemanth.selam@gmail.com>
References: <20260907061742.10954-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "uninterruptable" to "uninterruptible", reported by
scripts/checkpatch.pl using the misspelling list in scripts/spelling.txt.
Only touches comments, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/firmware/qcom/qcom_scm-legacy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm-legacy.c b/drivers/firmware/qcom/qcom_scm-legacy.c
index 029e6d117cb8..fe751ee512da 100644
--- a/drivers/firmware/qcom/qcom_scm-legacy.c
+++ b/drivers/firmware/qcom/qcom_scm-legacy.c
@@ -219,7 +219,7 @@ int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
  * @res:  SCM call return values
  *
  * This shall only be used with commands that are guaranteed to be
- * uninterruptable, atomic and SMP safe.
+ * uninterruptible, atomic and SMP safe.
  */
 int scm_legacy_call_atomic(struct device *unused,
 			   const struct qcom_scm_desc *desc,
-- 
2.48.1

