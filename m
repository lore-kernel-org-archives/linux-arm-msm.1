Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955720;
	b=rfQpnJajjAR/qLWd3eCDvkuuCrkis9yRG5gDYP056UmHridcySjJiv2aUTgimwDTEsae
	 hrGMLDb9KDWOTKAHi+ug/IDDOQgY8nRu/JhrZFZ6pxPXUi8AfyfHWFVpj4Sv/p51Eka/4
	 Gw7NUvPxEjPmg47YNMv8kLCOF++hodEwpg6QO//zRidStATVmYh96fQ6C/5KTyz4UgVoh
	 Lalnp7BB59w0KMDcXGpKeClvINBlhSwwMvMtxBhiPkVcp8+5LYH8GvIK2wPVyj2crIQwM
	 HeIFcEgd6G7azdbj8fIXvR0wqqDjzTtQELW1mg414uJRz54Gf401PElykdVy3qDVWrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ZNcBLqWAyNJp/9Ob/qdifA0LjCwb6pxRLzUpAFt2R8M=;
	b=SIiqVyTfqcwNqHwNhtcVgQBor/EbqcRXwks23084/q4+2kDtJM6T6jHZslBubI/UC1kc
	 QCav52dR7CCqf23Nfadz37i4lpcf/Ih1dpVybZqLIDXSupbrD9hH80fIjU7ikH7oq/Vl0
	 0c4M5yjry2rLGTT5AJtHeJ/PmMNiMnZCxEGLnFOUoxsHsL7GFPi2uDT7pFZxj2dSfXOle
	 N9+Yl+Z6P3m4pb03JrZE0vGw/2sXr+Pn4k++xEt+5Q6ZPft1R+b2e4OcCWtSdQhdNTXBj
	 6w2w6OnQIJRLWNzzaDjadgIRuLwS5ou8ArvLceLV6xMw68VoKdFm7VDrg32Rmvdp+aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N8pkrUGe;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EEB606A31E
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 19:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92EEB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N8pkrUGe
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5be3ea5a7adso239038e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 12:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792955718; x=1793560518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZNcBLqWAyNJp/9Ob/qdifA0LjCwb6pxRLzUpAFt2R8M=;
        b=N8pkrUGeiYT1k6wkM0LXvk4AZeGpUoGdqHa1tEHKmz3I4f9HVTKjxpXzABIy7d4GKH
         84yIdL0EjaYBfs77J72pVKB67AJZA6co2SkII8zjgkdDOU1+EmsCJlu9goMqzSEiXW1T
         kMTgND8A7f+LkkcRIFuTbapGjkj8D7Z2dl8w1A6+F8kwacoBVdMg7gcClyDxfDg/F3vK
         2/HwaRK5dApqNop9RjeCrWLy+MJ1dTyoJTsW2ZtSmYF+UvZMFVmbql9P90OZ/x5WbKX9
         RINxIm2Bca1geYUTpJEGVTY5IqxipKrBYJmnlerWKWDrossJ29skAlc5uPJrNDjuulXo
         55/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792955718; x=1793560518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZNcBLqWAyNJp/9Ob/qdifA0LjCwb6pxRLzUpAFt2R8M=;
        b=ePXEkXoYyGHe2M8w2X39SuNuGLHNsd5ZNGdoBUZuroKocgZHeMsuOv/FcQp2UYtYxj
         aoskjr+GNXR5zMtFGywc1RuFblMFFkllLv8r/6fwP9lJTYPR4V4+BmXMhslY79b0GGLa
         k5S2h8V0PJ8A59yKCabwaq1LW/6kuGk8iRJbdYJ3IvoGGGfS/8sGXspBUOzLLEjSw/0V
         peqAExJNFxBgTaCNBaHj/aL8XItYQl8A5thqvKhdc7nE/2omAqWO7vxt0o0iyFQEQwIW
         7LfnEA5y8asbm0DeUisBHiimauiFWDzCO8mW9Qphno3k3qN2stiXyWIttE5ORt4m05BP
         Nndg==
X-Gm-Message-State: AFq9FYKOBUwXagfejrl3hrY+AW/LdG/IkjbObfxfBaxINOIjPkrDpjwc
	9eC/pVVkCQfvxV5dKuLAMNc4bm7KZm6L0U7CILNGbHWohCc7zjSFpsxm
X-Gm-Gg: AYBFou19LD0ljBuUfC5jCMfe4OIJTdNPFWxX62IcK8xRH7bKZJmiLcsM5AHLthcT4fn
	A5Go9nv4nGlCrxOCO3XAap8k0gQFfcjYwtMch1GanGzb23ohBOnjtzd0jPwvIaFEtgAIhBvx+LT
	BwXKeqMDnqwwc/cZyacCm9UUtEvq/d3hhIZjj5PK04NsgQV6S1E1XFUBCzvXZuMlHZjl8DBJVS/
	2eNeLB6i8sLswQNWOhvClZx9kyi8C1qreZhMSyD+Z06xkcJbfzB0PrzFbxQqa2Lc+D5louhv/Ds
	YChMV93Iy62evKV6+0DJMhtsNc5WlK5GHXxdAzqF3GwOAdzFx6fidlfPilSrilc4xvWj54fd9mT
	/xw4FAnicJeFOfHQrtM82LE6c7hXx/t3Ts87xFfGgYj5EEOWkBYW9tncixHSOpITlA+FeyUTTq1
	Kp8DPzXFAQlvDaP14PpNl/7EbklmACp43e7XtHZBs4GNwvb6Ps+Z/hSu7B61oVvrlXiUFJeYEQl
	ttXQD3hDgO8c5iUimcbh5vZc0EknelQiHnuJPBbwf3bEv5HNen/eHyEBKCOfxWAzkO1UrcUsF2J
	lTDtx4KgTjmWxxkwLg1DIjaaz8It/YcLmiKI99LZtQCAqqD61pPFHj3WcQxbbzI8wETmCOvorcm
	AOyqEi+0=
X-Received: by 2002:a05:6512:3e04:b0:5bf:a467:32ab with SMTP id 2adb3069b0e04-5bfb71d1366mr1553389e87.29.1792955717490;
        Sun, 25 Oct 2026 12:15:17 -0700 (PDT)
Received: from yantra.. (nekmmqusumz5xuyc5yb-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:b52c:35a:762:9323])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a75a79sm1147287e87.39.2026.10.25.12.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 12:15:17 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	Marco Elver <elver@google.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v3] iio: adc: qcom-spmi-adc5-gen3: fix lock annotations on mutex helpers
Date: Sun, 25 Oct 2026 21:15:10 +0200
Message-ID: <20261025191510.22261-1-zoone.rupert@gmail.com>
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

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>
Cc: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

v3: drop Fixes tag (Jonathan), trailer cleanup (Andy)
v2: __context_unsafe() explained in commit message (Andy)
    https://lore.kernel.org/linux-iio/20261021052435.112686-1-zoone.rupert@gmail.com/
v1: https://lore.kernel.org/linux-iio/20261003214516.128573-1-zoone.rupert@gmail.com/

Found by building with CONTEXT_ANALYSIS_qcom-spmi-adc5-gen3.o=y, which the
driver does not set today. Enabling it comes later, with the IIO core
annotations. Build tested only, no hardware here. Patch and commit
message drafted with an LLM coding assistant.

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

base-commit: c9dbe2a47f635465c9985b7af74d2ae310e98125
-- 
2.43.0

