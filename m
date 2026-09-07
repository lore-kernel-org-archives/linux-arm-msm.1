Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51600392820
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 06:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788761874; cv=none; b=EpsO+0hS7k2U00WIee+bRczMyenQwVtktMpoAd4BAiqxD+o3tE9UMaDwkunGOEEw148YczjKCvwnI7CZ+ULo7Wzy/nypGR5qWl4rq32widDZu6tImgQ9SrrT24a4LqQAlkPdiBMbuIDYpUkVJq5vX/izYfIWH4wAeanyZaXK+zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788761874; c=relaxed/simple;
	bh=TplUxq1CFTdcfiRVqjUbZN0mq1bRP7VLWIHFh6q6tJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AhlGPa/vqjtXfYHGybSPOsnEdA3VHF4lR00ORhl9QPkxkNrJGbjQsKdS/f5fj0UIUFckkD2s9M886Ixom6PmN6Y+9iNWYlm0hDQdpsaSGcf2n4opisXqsAaHzfO9kI797qtsYccrU89HLuVocTxQE/HQHBeNkWajzvDhEfY0ecU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VEDSFAY+; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VEDSFAY+"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso2081062a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Sep 2026 23:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788761871; x=1789366671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SWobaaywacMu/vGUnRLBYXlkY7KOyfbApyOliISYw4w=;
        b=VEDSFAY+qId0lOc+/jxg7sKFjcwK+1yFwqYyjMsdIMlCblFX7Eb5MPxV5NC/3qBNjl
         jKRWDjn5NL+e4HTRhp6SKGscO6TUEajCOi3S8ZeH3ZTeAHW4UtKZPKuM2lDC5uW6HlIR
         qviBr1R/nFnEIyHEnmmY4Wd6Ia0oLyig3WOeVDqHDEo+hhtXJWokDH78FcNeUfnCawqm
         awg1RMbUmHEF6n3yyrqSl4kTgzCYIem441UBczz22AOrP7NVG15oXEIQ/TFEJYi2xF4C
         b+Vp5C8DUYHCvMSjnYcqNJyPOI9SzcK7oau18ld6BOOeRF+KMujJ9GMLsxdVVLJKvHLN
         g7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788761871; x=1789366671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SWobaaywacMu/vGUnRLBYXlkY7KOyfbApyOliISYw4w=;
        b=e6GODWKPa+L0aTaQ9PUN4xGivqogsNGjUe7y5YmiPhQrYn48EklqydjCvDxjfUbMEz
         2CF45QYAtHShVhpkEcOUFsdvOGBhEvNot6zP/nY0tgR0H3+kcEWkazXDGMovl4D20r3o
         9dJwDx6caj0gP6fcCE+ClU7lX2CPZeC0mfdldxP7rUpTVI3DJeJLosjbRsa1Mq1jx5uI
         Vh6Z3MHC2Pai3Dl0jSN32tAjUh+vqhDLfvHZKF9ocaofkkqQEKj38LbH+X+uPT/gJnKt
         rlCnuhwqBPwU2FVlIsil43Zob5OJr63MMNeHYs3n/LWFA/xQiC61pwJxhp3wJW6HoLFH
         /seA==
X-Gm-Message-State: AFuF++lc3t54pYUAm4bIGcw356NKf6osj3XtZIHVYW5Tiyx5g4GaV8UW
	Dl2VdLjxrKnAQ/gcMqlE/Jj3ZSz4AWK5KzmDphLpiUj6C3+OB+jrx7ZQ
X-Gm-Gg: AYBFou0ZOg9EMW//gp14i38gUthaodKFL2cWc77N1DWOvYQjgi5JblWBefX2AzK/gjG
	yI9f841iVNS7d91GRKfMkSoQ0Dv+X+hxIvTScWazaYV0gB+zftFQoJ9VYg5kqF6PZ4pbtqhWbt0
	grIOgFY+1LDvhVsOXRkWNyTEEobVa/Qd25Lo2fBsdy5yTFf3ylSjQy7831kShyQCFiwRDukpJHK
	yWvGdTjokMije3HBMatz7z8KUcEeiahSSppFKVP93oy4kJLbT6kO39RiaPLnqg5j6f9X+yQsfhZ
	ZqzAr6g1KAX+Rq0e6e9C5+z5XGwaPdkpHI9fDw7CvgIks6W+IHcr3c5p1Y/AQMd5HxFMreBy10G
	IntZ2Ly5DyLw1yPgaG696Jbtnv1Fod3QiXgNSvURG42LCfPZU2xmGmT9A2Qik+nFhQtH519nIyG
	yEfGm3DaEiLxnA+BfeQAwknBDOv48Hodd0HYcS20AOCrfRNe/7mQV9VV/J0+VY2eLnIdmSXHSgm
	HhGfsyauMIcaSA=
X-Received: by 2002:a05:6a21:115:b0:3d1:be60:2811 with SMTP id adf61e73a8af0-3da3a1204e8mr31320928637.15.1788761871530;
        Sun, 06 Sep 2026 23:17:51 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm24275961eec.22.2026.09.06.23.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:17:51 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] soc: qcom: fix typo "upto" in comment
Date: Mon,  7 Sep 2026 11:47:42 +0530
Message-ID: <20260907061742.10954-3-hemanth.selam@gmail.com>
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

Correct "upto" to "up to", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/soc/qcom/qcom-geni-se.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 873bfbd6b2b7..6b42da3b6c5e 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -42,7 +42,7 @@ EXPORT_TRACEPOINT_SYMBOL_GPL(geni_se_regs);
  *
  * GENI based QUP is a highly-flexible and programmable module for supporting
  * a wide range of serial interfaces like UART, SPI, I2C, I3C, etc. A single
- * QUP module can provide upto 8 serial interfaces, using its internal
+ * QUP module can provide up to 8 serial interfaces, using its internal
  * serial engines. The actual configuration is determined by the target
  * platform configuration. The protocol supported by each interface is
  * determined by the firmware loaded to the serial engine. Each SE consists
-- 
2.48.1

