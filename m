Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792560305;
	b=n4i9FQkXXoexmrkGd1/nAv9e5Un1vIhNnVPN3vY8SmyNY7OMn8lP85u6VWhud2DGvgHe
	 aI0cIlalafK0SDjuC21uWzavGeF0lAcNCdKnJYUYlv9DaVZUe3DqKrBsI6G5qYzU4YPip
	 thQbP9YdLdwTc7DLbcjyTJDzNKn/bghpspsAoNnnPVIXaPcMHLUn3GiWPkZW1n6HcLQYK
	 Ub38J7ZDf0u5UCqkXcrFKn6ySdty6v/pT36Z85Ram7Q0j2zn6PWYx30QTrBWdRjfN1vps
	 xjiVe5OoF287srS7kySudGXLIwc43wfduLyEpOZUP63OIu8UMY1QLxFnu4PBLw5UvpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792560305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=QO11p1cdvBfNgfWBeER77MVqw8qS2d4+wBk/vDSDlTM=;
	b=v9cbhpfuyKt8vjyObKCjNtZPTod8Ek3y+raNye4XC0W+qx7ApdRsLKnM8vDopVM/IsZw
	 sH1+V1JMLokfF4uchdfu62WSuRpYgAfJA/ptcoFjSVdhYITCHcQSWB8i5sBcQCznzSEeq
	 W3XAuXUnLdsJZvlYNoYZpN6oy7RkV8j7qcoWXXBInhf82YhnM9Z4W8ro/0HpqQEx66RpT
	 wl6q1DByRjaN4nov9ravt26lmtFLaX8TpSbwJgWLjmLcc3oZ/+sB20UUM1iRdAMhvyV2Q
	 laxyAyedsm9aJ2oDsmJKCoN0MK4GY2JwSnOLF6z5lcaEHc2YQX7pMdIqlKcDg5B21Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gExZuUhk;
	arc=none smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05E3606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 05:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D05E3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gExZuUhk
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso268628e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 22:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792560303; x=1793165103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QO11p1cdvBfNgfWBeER77MVqw8qS2d4+wBk/vDSDlTM=;
        b=gExZuUhkSHZ8RiSOZBDjxhHa6r4jx4Y4hhffO2HQqZCp2azJr/32CTUe+2ixB/ngsB
         l6nIgYyhfn+N1GQPLcSJUwmK4VGvOcG6SP/WfxqGuVjADDPIA6dScBH78LLRk+YalCk9
         d0U8oIdYI8kCZUclwapRe6Tqes48kUpKNhEQwRd8jCUW5NW/1FeIUzGDDDc23NLjg16D
         amdTdepRbt+fO8zyhfAyVofoJ+ncQVyCsTNyFv0M0+DgRaR/lPXQESqcDTcqFe+BF3mR
         83cuVQy/WWMmsToaMZluNvmr9LHjhC+hBm0zPdQiqzbcJriPKalP35h2uPcjWITcyAvV
         7aYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792560303; x=1793165103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QO11p1cdvBfNgfWBeER77MVqw8qS2d4+wBk/vDSDlTM=;
        b=txHSptfcjWVrjYM7TBEJFiq40ElFfyubvy4DvdAAIo6Z0FWTFRvxUBAZmQLMp/BFnK
         gJ/IjJd07lLeIz4o55JvDJLA6y9vSFdC4jELKTYLSrC0hoWfigkIBGXRjV0jk/kfMefj
         Oq0iVl0Ug2BHJNjE5KVmja1pJO5qUUGsJwBBR2Xhjd4SUSAbVb1Sp3VpXRk9gzKEOmI0
         2yiW0jp5Y7welxjhihjFQ/sBLted72DNzDmvabTbf9Qh0aQtNxUcFadIR6fMdE6NsXW6
         pGZnHfwzElSJd0y/Ctrbs10pxlBS5FpDwqogz2/HtsfbQ6VTUQbJPbgcF4E3SXT9REFc
         ma1w==
X-Gm-Message-State: AFq9FYKvhm0/H+Fj/PnBfTovZnqh/GMXqlFBZ+JlCA7TYb1tq1fImQBK
	ydk0rtXSYoMLJmy6VxpI8y51v/hHpzzdFuFQfMGTanZ8xu/DGwmkiHjm
X-Gm-Gg: AYBFou3ZU+yJ8t42Gf8K5A0rhhgBPPEwEw10j2ikMkgG2gn3uTKqXaxGfCOAfm/VoWb
	fNqUYRnZY1oVbno+Pn+LjQZT+mNKu4DN5j1mS9KWARnAtUJFg/8B8tGLftlgwrBAb25lklqc0m6
	xjfarm1Lb5r5DE2m38KcsSnOGqVg4pWeuvBcUh2hR3dv1DPq5mHtJPkYZprpdnjNvGu+dpAZTL6
	PH4Yn5OtAI0FDpxvoLWozWVhqaW6MM7sTy+xaWxZYKYLVVjVuGRIz8/jYyKUkhtkTIAKwG2ITAR
	h3p2yMyZLurFd9eGaQpizQZFL95gEPZCzRNQh1bai15e3/LGsOza9xoWNRxyVsQnbazgBzejv+P
	R6fYergcOjsoSOzYu5PQ/aPbK5EzmnaoXp/pceYhPDH5yaqsY5XQVjO8XTpvclFc8SGZxa/CyUY
	9eZmeYB8rZ+bSWfi6S34nx5fjwKXimoqK0M+BNJ6MYmX9O8JnEJhSmV1HzSOQg4muFI4ceadRcc
	UXxSyv4gkoxhfacw5y+8bBUUFHcZndNVYjE5tgcQwjwQvnxq6bSzqKFbc3KgoQVRfvlzPfOBXio
	bcb2nWfz3ac2oTRKhj0eGcRiRu1DIqHjnvnI+C2u9afGMaAUhYCmDRM3ATArLhxp
X-Received: by 2002:a05:6512:6686:10b0:5bf:a2b5:b1f8 with SMTP id 2adb3069b0e04-5bfa2b5c70emr124342e87.0.1792560302719;
        Tue, 20 Oct 2026 22:25:02 -0700 (PDT)
Received: from yantra.. (nekmmqvnobjree8k203-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:ed79:febf:8fd2:e723])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa11f6dddsm284385e87.18.2026.10.20.22.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 22:25:02 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	Marco Elver <elver@google.com>,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH v2] iio: adc: qcom-spmi-adc5-gen3: fix lock annotations on mutex helpers
Date: Wed, 21 Oct 2026 08:24:35 +0300
Message-ID: <20261021052435.112686-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 5b63d0ae94cc ("compiler-context-analysis: Remove Sparse
support"), __acquires() and __releases() only feed context analysis.
Their argument is parsed before the function body, where only dev is in
scope, so with analysis enabled for this file the build fails:

  error: use of undeclared identifier 'adc'

These helpers take and drop the lock for the ADC_TM driver, which only
sees their declarations in the header. Naming the lock there would
mean exposing struct adc5_chip, and with no annotation at all the
analysis flags the unbalanced locking. Mark both __context_unsafe().

Fixes: baff45179e90 ("iio: adc: Add support for QCOM PMIC5 Gen3 ADC")
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>
Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
v2: explain __context_unsafe() in commit message (Andy)
v1: https://lore.kernel.org/linux-iio/20261003214516.128573-1-zoone.rupert@gmail.com/

Found by building with CONTEXT_ANALYSIS_qcom-spmi-adc5-gen3.o=y, which the
driver does not set today. Build tested only, no hardware here.

 drivers/iio/adc/qcom-spmi-adc5-gen3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/qcom-spmi-adc5-gen3.c b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
index c68c6c5f6aca..6a3cabedf4e8 100644
--- a/drivers/iio/adc/qcom-spmi-adc5-gen3.c
+++ b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
@@ -663,7 +663,7 @@ static int adc5_gen3_add_aux_tm_device(struct adc5_chip *adc)
 }
 
 void adc5_gen3_mutex_lock(struct device *dev)
-	__acquires(&adc->lock)
+	__context_unsafe(/* returns with adc->lock held */)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev->parent);
 	struct adc5_chip *adc = iio_priv(indio_dev);
@@ -673,7 +673,7 @@ void adc5_gen3_mutex_lock(struct device *dev)
 EXPORT_SYMBOL_NS_GPL(adc5_gen3_mutex_lock, "QCOM_SPMI_ADC5_GEN3");
 
 void adc5_gen3_mutex_unlock(struct device *dev)
-	__releases(&adc->lock)
+	__context_unsafe(/* releases adc->lock */)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev->parent);
 	struct adc5_chip *adc = iio_priv(indio_dev);

base-commit: 43ffda3c7f8456bbe641ae8249a077a361b97880
-- 
2.43.0

