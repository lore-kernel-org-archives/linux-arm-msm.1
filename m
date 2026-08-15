Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F30D392C32
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 16:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786812245; cv=none; b=n+SDdxAOUqnMGXlQgeOQ1QGBtfZwoP1NVZf/gkQwDNyiPkald2enmaFayydEhLd6NzKBqPZxkGg/QUdZKgHFf3CUqL64mAXYhn2ZIPzcD2JT0aPJhW1sZ6Pg88c2dLFch/TY5w0e8GLFdPBH1wbJYKHfy8kWTgeGmHxM1JFHbsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786812245; c=relaxed/simple;
	bh=C11+4BgTC6JKYX5e/U2N/bMsOkLvdLEpdpDM9Ng9gbc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ljPZx80HCHliuGqID+GzhIqxdwAiAPyhC0p944t6MVHB3Lquz7fbav5b3ZO297/S9SvrAFjXYTHpzcwDR0QISAyjWYZlQvWUTKAvsKwxamIRpGTjs8ICt6Qe9zhyIKwy54F0SQkj3gP7g/Y7jMj23vFGk5Alh5q9/9sA/czc8K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VMxRBh5U; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VMxRBh5U"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cbb7926836eso1358919a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 09:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786812243; x=1787417043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3VN4xZ3Op1b1omL9ErnQwlmSHW9OrraRQaNnvp6WcmE=;
        b=VMxRBh5UbXJaznmA5c1V9Igl5UQNHqr4fbgNuX6bDomneHbc3kzgN+jwUyxllf1Ro6
         E+xwL2iEn+MsRlz9pZPREJyVlihGGQNPNWN6soOyWRtJqj99OTgN2cKcx8au1VdTdFQz
         G+/XZye4GiZuhicdcIV6K4yzhsruEx7FE2AWKC88vCEHm9UMPn38lBAuQgOh2axDiW6x
         TlcWRkGHbupgBew2E6RG1MD/20qIeJwvCmvddoAG/Ay7Q6et8vbZJVZkB41eE0orifxR
         wJSrBjzcWKtdadFMYNSUFMFoSpIIlqFUcVGxFBwQDHE+pjwtOi8W2Ur0r9JCzBZmNUBs
         cNHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786812243; x=1787417043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3VN4xZ3Op1b1omL9ErnQwlmSHW9OrraRQaNnvp6WcmE=;
        b=qwx8N50rmafmYPTYTlHWSwEZ7q80gIeoG11Wv7YDnTdTjG2c/Bd/+DOpy7YaSRSDFx
         UZeOcUVt8+diQZX/EjsprS0o5wVFZMa/I77GMDSZgVQ6q966MwdvugyqL8GLmI1AI+iS
         aSx9GqmxXa5lNYUZslpurvudU+JSjz3yGgCzewY1gr8BTgiSOolctzNlLlmi8o6YjPte
         v2JwIhk1eqlUPeoTMrM+KtHXjzdLB/UmpY8mLcWIvB9cIVaQ3a8W4kUCxvrtcv3KEnSS
         hOiTy9jiT7dUsLfKDL6YSetBzs8nrQA5718D2l+LMSr+yytrhWlE8Z8clJTB0iDGsggx
         e8kQ==
X-Gm-Message-State: AOJu0YwA11uCY3spNUePFZcZyvGxIBimON353Cth7tY345yzy3y/olAN
	pPKDKCvQwCkVgtLsmuU1uCanU6hIfBXAqe9x9fO34vfKHQ484jz2QjQC
X-Gm-Gg: AR+sD11JRTvJVMFDIzn8ChskSwP79XJdV8i7TZsUPC4qY04AvN23bQ9S6MVWIuWUXl7
	G5PAWPMZ4OU67FEM6XVfkeHhlJU+oJq8OXoHizdRJnssf3XRsPm1H73gijDaZwBLwIQlNsUStF+
	6QWwzFOy/Az0YWgX0EXPfIFTYpAHtYaO6vkUc/DNEGTVFRqIN8sVq2Eh/RiMgtPdmrFJLMICSth
	ficw942i9yiHLzVBE2TEGJ7pLQO2O+3TEI3Tj1m4YsDn9fBdY7w4NtIOoMw/M3moP3IVuszSxm6
	k/FSvo7kMxPTVIvdoFotmk3I6p5ZefFDtLXCp5yitWj7wd67EyHL5pv0ViFBEp74v/xDPEaCQUP
	V5DF0c99f+vNT9EU67zV5luh42kF5Y3HFPEAQYnqDIoYlorryEIR9Cvcka/0qOsy8AuFo89rgSP
	xxU9TROljiEFOlWmB+XFNl1wvGlgnHRk+u+RD5syi0DLpEEX9uVIrG52XXWcj4Z7+38i5KLZCTg
	TOFpVSDtg8TAyMRAwDuFg8w
X-Received: by 2002:a05:6a20:9143:b0:3bf:6856:d8fb with SMTP id adf61e73a8af0-3cc7203428cmr13172808637.29.1786812243271;
        Sat, 15 Aug 2026 09:44:03 -0700 (PDT)
Received: from OMEN ([103.148.21.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387c56aesm20406417c88.4.2026.08.15.09.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 09:44:02 -0700 (PDT)
From: George Emmanuel Thomas <georgeemmanuelthomas@gmail.com>
To: robin.clark@oss.qualcomm.com,
	lumag@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	George Emmanuel Thomas <georgeemmanuelthomas@gmail.com>
Subject: [PATCH] drm/msm: remove stale perf counter XML TODO
Date: Sat, 15 Aug 2026 22:13:35 +0530
Message-ID: <20260815164335.158958-1-georgeemmanuelthomas@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The adreno_perfcntrs macro already takes the XML file stem as its second
argument, allowing each perf counter JSON file to select the appropriate
register XML. The a2xx and a5xx entries already pass their respective
XML file stems.

Remove the stale TODO comment.

Signed-off-by: George Emmanuel Thomas <georgeemmanuelthomas@gmail.com>
---
 drivers/gpu/drm/msm/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index d0c3a4c6703b..0b8f2cafed19 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -177,7 +177,6 @@ quiet_cmd_headergen = GENHDR  $@
       cmd_headergen = mkdir -p $(obj)/generated && $(PYTHON3) $(src)/registers/gen_header.py \
 		      $(headergen-opts) --rnn $(src)/registers --xml $< c-defines > $@
 
-# TODO how to do this for a2xx/a5xx which have different .xml arg?
 quiet_cmd_headergen_json = GENHDRJSN  $@
       cmd_headergen_json = mkdir -p $(obj)/generated && $(PYTHON3) $(src)/registers/gen_header.py \
 		      $(headergen-opts) --rnn $(src)/registers --xml $(filter %.xml,$^) perfcntrs --json $< > $@
-- 
2.53.0

