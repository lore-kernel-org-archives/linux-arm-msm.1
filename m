Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105412;
	b=EYGckgEQR2coS9czep97auWLJ/PTJZ7fT8hhJjlRA0Hr+I0ACrHvQBSJiUdiBubjLFAu
	 sSoMoAQIPMdEZx1OT+XyNkbhB2R8Fwr7jWZQho7pChIW5e/xqr+6avEHLPuuvy7C1Cc64
	 DrN2CfiKAY1bZCATttW9XxYZy6LTVU/5puQOup+2RUF1wcCM6aCE4OvWt4ob580yLOzKU
	 rwTDJKKkvWGcgnmvVnQOiXWsgDXEkz6HuiQxtRAHaiCREyXm+D2KsRPKLqVZPjXarO4YB
	 v8q/M8CQV456qAaBKdhfkBcxjqN2vo62oLYQUh4Gd55BVlfAnPIRHXwhRqpZo7KS32Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sODvYeqV5gDMhpF3/tE93N3B3mOo+hnfsfgEpH0noQs=;
	b=FbsDpwd/pl9Tw+1oSmrUFduFDtWwO5cMb4BdMKGdXOus3qzGVw1Q7hyW02yqlc1m6N0V
	 WcS0TCQCW80kUzK3Mou+4rBACfqMutpKlhuuUfHs6KIoWw3+8GfMpTjeumkxqwunXxJb4
	 tkqAy1WLjquwmX8ReucqKMKiWc+HvvnPaff2W6t4Vgu442bvBb4myh+qaX1vYcsI0//DN
	 a8OAJG2ZxxpZ284cenGzOJIDEjgmNjkRLxLXDxx+OheqDbrkioGNoK9H9g8Saolh7xSI3
	 /TrJYlBxc3oBgbXmadgXvMQIZ1tgM7LcpLq0coMAukaYL2+i6zGcVarYjfk7ZJoYKKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R5tOWkju;
	arc=none smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F56060A381B
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F56060A381B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R5tOWkju
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5be3ea5a7adso1832115e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793105411; x=1793710211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sODvYeqV5gDMhpF3/tE93N3B3mOo+hnfsfgEpH0noQs=;
        b=R5tOWkju4v00bJxZmvuwB7/pKDsqkBAU/1/eg0Y2mI3+68zI0Mic91igIxblPKDv1G
         ITUYcqzhY/lj7Jsr1hZnifgKAqFARw15N52gxtgWV5Z4lGJVtKLPhp90ADC8Gm6jVEEK
         m7auX7ATnMoHARvtbiA5YgQdCiP6D2li77+Jjj+62l4UY6g5dncYC3HE6dOrlNYK9L/Z
         zF8Bd6Jya6/rQtR+dvCGbiZipSrRIlt4ttb3zUHpSQGM+8ankrnZ0WxqoNSuaIA9Hqkf
         dSbrLbL8x0jXh1KjkboyEe31U+cLqIgHffdPEUIIPx0GRNvxzr/TlbiR3a3NLsUgNl3D
         6Jcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105411; x=1793710211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sODvYeqV5gDMhpF3/tE93N3B3mOo+hnfsfgEpH0noQs=;
        b=vthSeL5hn/EzX3vnze07bu3eblDFFcyDW0qvI73MpCuWUA0hsRovJPsL1zzxZuLnOf
         akqeDuUrZosb0rREEJuzQrUnqxJnZnY02HPvsHd19CqMPPQHhDp3UvsPf4Vvp4DpVG05
         U2BVFuBpaXmo7KpGEW15f5DHZ5G8kl2CLmk54HLRctYaJtTdRv9++YRJCnNsIpzR/7+l
         q+g31NZRntpadIS33bgpbF513hr+UTRiqxszDnzSoB6eqNh4Hcvf8mu1UTcpA5qeFK3k
         da5lMdlfUiqG1px4n/TfUKDDebNZAhv3uqPoQJVMxWDXrHPuZR4jiyqwgf2uIfliPl6y
         tE2g==
X-Forwarded-Encrypted: i=1; AKwUvBzxKAiYP2eJMmVikmF2TUe6xKb3k0E3NadHppwl0RMKii9WRdVnB+j9LLPFkogiLrFKe7KFVpipedA1TUpy@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8fFmMhhdPPYaXtDhV74d4UCag1xSsLp5zZTkg70pKZ53icP8a
	5yBsmSbgvNAih5sHjtT0cM3dKKUQXVIQdghCGaLVbNI7HlWwOg7PRaZW
X-Gm-Gg: AYBFou1UwfGWgYKe5M9a/MiESBrWL3uy2/nQC/lHD0YSokW1GkGrT5NsxjcW8BclNX7
	66q6vIMsp/oBYOuSm00J4usuKkPEsR4DNyiTv58ohz8KspMQgV/X+23/nWjLv33YXFQeASKuQH9
	KUrsWvFa8X/s015XWvAxi4JwdPfo1KfbkHT4wYd+9l/P1ZW+cALoDQvUYJn8aItv2LIjdD8WNUt
	7bWdRmG2h5otCiPuGFJI+4v2mmKporLK8hsgGZi2R1X/1yBkhTmGJ0u9/41qUjy2JC86Pv0DnM0
	FQnFXUyPaweO2opYL4Qh5gpVWV24fCYP2jPueL/hi4BOHBVX0uuCOyJIoLbkvczIRCHuxlp02cy
	lsfhrhpmp4jJtIfJNs8jHki87q4JijCljWk1HPNvk0acD2d5HOIU7FLm+PtySGX6/fkgkex18hv
	7ERh22+W2FQg/qOjgPxsy0Y4W+751ftxRWwXsBAq/EEBg1cIaWPDcqS/Mn/PZuKt0sqRNKeq6VP
	M8uR4suuGz/6krdhyo/8zpXhhf+6AYzL/Fk7KcbU5LpF5Ae54bPAhw9yxEO3E9CfBrkVE3upLJM
	v/0pXWfxUDuU+q6GMg+xKNqulzIZYqrvMgQJSyex6dHjF1JD8YS2pJLAgz4nii5Y
X-Received: by 2002:a05:6512:3409:b0:5bf:b963:70fa with SMTP id 2adb3069b0e04-5bfb96372f8mr3300311e87.48.1793105410585;
        Tue, 27 Oct 2026 05:50:10 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:10 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Alex Lanzano <lanzano.alex@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	David Lechner <dlechner@baylibre.com>,
	Guenter Roeck <groeck@chromium.org>,
	Jagath Jog J <jagathjog1996@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Jinseob Kim <kimjinseob88@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Remi Buisson <remi.buisson@tdk.com>
Cc: chrome-platform@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	Marco Elver <elver@google.com>,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH v4 8/9] iio: light: veml6031x00: annotate the event enable helpers
Date: Tue, 27 Oct 2026 14:49:53 +0200
Message-ID: <20261027124954.110697-9-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027124954.110697-1-zoone.rupert@gmail.com>
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
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

veml6031x00_event_enable() and veml6031x00_event_disable() call
veml6031x00_set_interrupt(), which needs irq_lock held. Their only
caller holds it, so mark both __must_hold(&data->irq_lock).

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>

 drivers/iio/light/veml6031x00.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml6031x00.c
index f6308498e422..476ac3717f8e 100644
--- a/drivers/iio/light/veml6031x00.c
+++ b/drivers/iio/light/veml6031x00.c
@@ -784,6 +784,7 @@ static int veml6031x00_read_event_config(struct iio_dev *iio,
 }
 
 static int veml6031x00_event_enable(struct veml6031x00_data *data)
+	__must_hold(&data->irq_lock)
 {
 	struct device *dev = regmap_get_device(data->regmap);
 	int ret;
@@ -804,6 +805,7 @@ static int veml6031x00_event_enable(struct veml6031x00_data *data)
 }
 
 static int veml6031x00_event_disable(struct veml6031x00_data *data)
+	__must_hold(&data->irq_lock)
 {
 	struct device *dev = regmap_get_device(data->regmap);
 	int ret;
-- 
2.43.0

