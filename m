Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE85280331
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 04:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784348942; cv=none; b=BX2So0aHb0XKHtS23h8MwHExDxI6vaSCsXcsufZpyZ8GCJwopfOqUGmnq9rrrNwLnRpTtDbS6l47a6fcW477ROJj8vbPaXIt/ygQkAT7B3nPUOzPVWmaco6ZKbFr268eoJr062kxlCqcj2199m4oOk28b/J4+5zxC/6jtCswVgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784348942; c=relaxed/simple;
	bh=iC0jX4ga18TdSbpsM8nHjqWuwCVg1+/WjJu2prwlw/g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qWKrg5RwBRiONoPcoEPpA3SY2Ha6QLLv6TnikIG56xgocvcvglWehKaEuvmos1ql/I7hekAwHr8Bvx7IjGetqqZMCcPI7WTzrPeJw7koWJqefz2X0AUlAeOsPhKdkBlMVmy3BOYDSHxQlRSDSB8PUGJY3YaWbMvg+dpUXiK1oBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lysmh4wD; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lysmh4wD"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cee9b74ee1so49961915ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 21:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784348940; x=1784953740; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B3v9gOBt4G5DQaZdSmoAndNb96FLBWZl7i/bOB0duLk=;
        b=Lysmh4wDvLWSb5Ortwo8KXOYsThhvxTpLh6h6G8XbBZxis5IyZ1/gx2e7zZFeuv+n4
         rF70k1Xbg/90HzLCx1pzYVca5fIvKQS1yzYBqldMl6CgqDy4U1+gz86NgMaaWdk4WEG3
         PM774Dr4JEhl9+eE0LhInqTgTDj6ElNCMMEvKpFZBvJCP7hmQO/dmlV3h3K1rVWNe+bS
         ylI2KEkQ2To714TTL8tSPbYbhsW7vyKzC1o3++1kGopRkyxJwtHG/8q1v0uoqQgDkcQI
         SA5RnYgksYsTy52W0RMV3A8GFrQtvif/mYyoVIh0Vmv5Jeq5KlHjQPVGOJVjsUGhrEOq
         /2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784348940; x=1784953740;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B3v9gOBt4G5DQaZdSmoAndNb96FLBWZl7i/bOB0duLk=;
        b=aEV2AhoHcjR+7ShcnEj5deihg4fxPE/RSTJrN6GyW+Qr49lovGnGnLr+AV26EbwUAp
         px6MyVQyJ0/kQ9UPT+rH10V1CiNYQ2i6xUaXj/Hl5oqvNyO9CwKRTlePaR/9ugX3oPu+
         xA+UcmPEoajSRCt3+78RROuXWFJarWmi7hrwJCbyc1c4/p/s9w4ZmCXgxSv+CcgyiK56
         V7hUE8BjWqJR/BHTcfYT67k+lx9Q/WBpfabwcMf6ok9dwCILfzxa1mZ18oCW9crjW10q
         vA5cz2N1tSJmX0FnlvzVHE28eup8wAmRhC9xX+v/Ba28EuYDAkO37NUAIAjldPsYN9kS
         yAWA==
X-Forwarded-Encrypted: i=1; AHgh+RpKyXgTsBOCsqr1902XUYamcavNyjbpidUkxoTvePq2qdybE+DYu5Lvasfbi+u2XHNqSpTxTv9NU8S4UxBA@vger.kernel.org
X-Gm-Message-State: AOJu0YyeDl8wcUdy9wircIKOvc3N3ffIkZkDvxPReJBCvtt2LtEY1jGv
	SqPOUOqamKlAozsL5jlZGWMJh3uTtrEqLzvhiPaV5sTAz2hWo+8Q1vj2
X-Gm-Gg: AfdE7ckyC2su/8+Tzs/O1Fe66M9bA6At664niMBkZGcj9WY2vAwSvISZldzTeTpgqrf
	IhyyOSrPvb6qwT2Y7KyYz1AFTDpliZFrZwbtc/TGvU9KBi4v1/S4yRs3KLougfCXyGZQ6Ilk78i
	FmpNmCipzDDUbbGXbXGRslep3eAGqch4VXSpPSbdGlMAaCTw1JkANs4Y36bosH6PQ9Gn/0eYHxN
	DJ6DVKAD7cdaZ8y6V2WOlXnmEzSEkgXKCF8XxdgEIAmSqX+mgEa4Q1jQn1uwsqonlzWZqfEVtVY
	nmr6RrjwxJP/kSqP2zXolsqHkOFYddpaNLYHvrHoQHQzQUSxUiqdA2ZCmlu1OL3Z6A/fVSeiiMS
	/OYHyOOJhZAqTHBuEL1IpSOdm5vqzzc56RaF4PN4Nuvyn/AOLH6OMpfmJPxkB4xLGbjQ3Cv9PkA
	aQgOtPUC63ULRJgcQxF6xVNafyW1SEKx4bOuLo5F2LWpU=
X-Received: by 2002:a05:6a21:3983:b0:3c3:68b0:e273 with SMTP id adf61e73a8af0-3c3ad6042c6mr6085187637.15.1784348940199;
        Fri, 17 Jul 2026 21:29:00 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:7638:3cbc:f1c5:2eeb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9bcd9sm13036597eec.3.2026.07.17.21.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 21:28:58 -0700 (PDT)
Date: Fri, 17 Jul 2026 21:28:55 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: wcd9335: switch to using sleeping variants of gpiod API
Message-ID: <alsAsTcQrpnnR46d@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The driver does not use gpiod API calls in an atomic context. Switch
to gpiod_set_value_cansleep() calls to allow using the driver with GPIO
controllers that might need process context to operate.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 sound/soc/codecs/wcd9335.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index e3ca5ca6de3d..40de279a9750 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -5010,9 +5010,9 @@ static int wcd9335_power_on_reset(struct wcd9335_codec *wcd)
 	 */
 	usleep_range(600, 650);
 
-	gpiod_set_value(wcd->reset_gpio, 1);
+	gpiod_set_value_cansleep(wcd->reset_gpio, 1);
 	msleep(20);
-	gpiod_set_value(wcd->reset_gpio, 0);
+	gpiod_set_value_cansleep(wcd->reset_gpio, 0);
 	msleep(20);
 
 	return 0;
-- 
2.55.0.229.g6434b31f56-goog


-- 
Dmitry
