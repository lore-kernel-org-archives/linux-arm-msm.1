Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606350;
	b=jOw41qVLuaIBgcyg2b4D4yeiIFX5+hKgLarpOhzXxH0BHMr6O5eLZ4ohtq0CVUbUZP1q
	 9Nj0PRXLflYO0eXb4JNh7ailMrKBi0ppRzUEjU3R/wLl0fdKCrRasZdPHD/aTV3vT7bfA
	 S8IBElZ7/2qGS5zYFnbu9YD6qwrCVGv34/UXoR454dWX4WmFClccXEBs/OVV9tSRB9tjW
	 p0iQK1utBzHSxAeGJMQqNsNQNhUmynHDcwhio837O3rQMkp1QBhHncOhlAymA79jcQsJn
	 6nBRdDurTzDvU1dgoRMuMFmwW80C6WXs9eynAUZTxh7WCbxR7mmXbptQ20L02XVYEsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qnZe4r96eV9XQddf8cIn7zFYQlAR4JFIMaPlUKVPy/U=;
	b=3/aVhQcAQ9YM65fOl8ZFKIpmeXVUsaggzzkqu9tnpNRDJrNxkcajSTR9ufhmCRpUrDsR
	 vPNL2QXSsSrCFcRrU2ynhBKr8dpCwwYhPy26sz0gR/qVixqtsA9VVILc4QOXRrT2RKF5b
	 rTtXNuVLK1zOSj6w6pb4BYCAPhYCrnZds70rhuDuDukVgMfbDbBJc1jHpF93SN9/zrkAt
	 P9i6qCjgFWVcMq7avMc15aXsp2LdlSIc6D48TTV70d6zGJwNdJU5pFikNYwUXsehtEW8u
	 4TaRbiMrp+J0VE/KG+3WDe8dJDD6HEAwGI0x1IhCHWceBiMfYkaxi365KlzhcPWxGWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U3uGx+gv;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF39606A337
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 21:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBF39606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U3uGx+gv
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso8172565e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 13:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794606348; x=1795211148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qnZe4r96eV9XQddf8cIn7zFYQlAR4JFIMaPlUKVPy/U=;
        b=U3uGx+gvuZDprzJ4de+g1kPBhFPsmhOG8fbWOLie4ZXFQmNrteTZcEMXX6pVg9UPSU
         cApvRPxr/1uid9VGXaDI7fxh2MVOBcFRqUWH2DHtD/cscVA6C0/NzWKxVDqDhoxyWuGx
         cltzpA08sMXM/KOaBCfELHrrJjlb8BLhdMc3huTbz8UuIWR1aETLtG9wFjgS1xjlGo1r
         2eOPseEBdATET3c5Do4XzqBYi5H4gmQt7RdvuiujvD6mjqz43N8dP1uaK3MilzfHJewQ
         jPGJ+jJhe+0ogNdVhfniiW44qkUTFtHl5e+9i+IjD8ywpaYz3ECFIbZKhHmmPIkOASZM
         TFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606348; x=1795211148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qnZe4r96eV9XQddf8cIn7zFYQlAR4JFIMaPlUKVPy/U=;
        b=V0WldHZ/CrRo3DsrO4AqYzhZuGJiJWpKQXnrAmFDCi1XN20noTQSFwmNsus2Z69Qpn
         Gqv6uNgI41I6TTgOeN28MIUrm7yJnNymY5fhZQO4yhUev+idYqnG2BJFDVHenM1YSOFI
         mnuY/bwfFI+y4ZvMNLEzgJHzdCz2Hsrz/Hakw/HihVc7iTOyT8jW+kLau3c1hA/G1JaT
         HaHtjV8NuVH6XCdZ7l3oRZRsVSOq/p8tUiLGTyUI2833WzaRskfOdbrRg+P5QJ88AWVw
         8wJP6iAiZYF2yH1rvFvKiS202O7xR9iuGqWUdC6uYHprMf3d5/IzZUx1YMhP8E0nYDCT
         tLDw==
X-Forwarded-Encrypted: i=1; AL+hErE8iy1uZjDyrqEdOH3jO0WtxFCeuOLdWDbEyK5SARQEGTyEefaVR9+RlJEo/NrnlNcydWvw124GQWOcU3ap@vger.kernel.org
X-Gm-Message-State: APuU4Z9dtthDTOIuI8n28OKsT2d8xIfL+YxJYqqCZEFVtnSnjg/dSt/b
	3laY+6ipSzdDXovZlRQ1QSZGKVGMErP0bHpGVH+lkawU6kUbgjTfvavAYwIRxjBLWwQ=
X-Gm-Gg: AYBFou1LZg0CA6f5qFnxytgf/T14bgSFmsOh7EZbdSnO5AdP7uGX6w3B5QdGreN9Uu9
	b31fuKSe2w2regSQbbBWxa4dGG1UVDGVY93sipKMnHGTKlrPGV0UruE1aPvB4aQyNNOrRjK0G9s
	ovOfAKbiWI0sU+wI6OhgnbOKF4fKMWUz+F5tk7x+jKI+humUbuwbHZ+UMoNs2gNV+lcHtdCZXa4
	v6uS4ckc/VbPifzUFon5cWKFQsiIR4IouTYgtkHVFPY6tgYXKqLbsoPDwER6f4Z0TP8LEpjX5E7
	j8n+FZUvKm1f81zPD8L11RyRwVFJppciWVJ4GDai1uw6KUzf9v4euYvoY6WKr5w+FD8yWZnrDjJ
	TjAbPTDewWXx6n96t10wkIEatSGd/eCHfS5qJQxlr+jNtNn71BqsG2HeM5l7AVUtkj9MsnkpE24
	YoKE2r4A044pHevDNDsLoMYj/Wsobz9Y/roAQYsRro1dEsLby50gzqT7H1PxcT+3lNC1WHU15K/
	h+OHbjclLWIhQzDu1ZBJjg6ymM1VKEEAbODBgkSngopiCNUXMbCJW0CH9Fi8Zwsl+pvmzOPK7fE
	VuYtantcDJdED9Oo0HsDikKU/uDGgNdr/oLXvQrm9SlHsKtiEg==
X-Received: by 2002:a05:600c:a44:b0:4a2:a6e:80f5 with SMTP id 5b1f17b1804b1-4bb55a45045mr82664865e9.11.1794606348036;
        Fri, 13 Nov 2026 13:45:48 -0800 (PST)
Received: from vivobook-s16.fritz.box ([2a02:908:e843:f280:6cae:291b:a1:8362])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e294420sm175346295e9.9.2026.11.13.13.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:45:47 -0800 (PST)
From: "Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
Subject: [PATCH] ASoC: qcom: common: report line-out plugs on the Headphone Jack pin
Date: Fri, 13 Nov 2026 22:45:35 +0100
Message-ID: <20261113214544.232836-1-ingo.kubbilun@gmail.com>
X-Mailer: git-send-email 2.47.3
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

The WCD MBHC classifies high-impedance loads (above linein_th, 5 kOhm
on wcd938x) such as active speakers as SND_JACK_LINEOUT. The
"Headphone Jack" pin only matched SND_JACK_HEADPHONE, so the jack
control stayed off and userspace (UCM JackControl) never switched to
the headphone output for those loads.

Seen on ASUS Vivobook S16 S3607QA (X1P42100, WCD9385): active
speakers measured at ~20 kOhm per channel were reported as LINEOUT only.

Developed with the help of an AI coding assistant (Anthropic Claude),
which drafted the changes from the Windows ACPI tables, existing device
trees and test logs; reviewed, built and tested on the device by the
submitter.

Signed-off-by: Ingo A. Kubbilun <ingo.kubbilun@gmail.com>
---
 sound/soc/qcom/common.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 5dc954dc1cb2..af5cacddf67d 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -335,7 +335,11 @@ static struct snd_soc_jack_pin qcom_headset_jack_pins[] = {
 	},
 	{
 		.pin = "Headphone Jack",
-		.mask = SND_JACK_HEADPHONE,
+		/*
+		 * WCD MBHC reports loads above linein_th (5 kOhm) as LINEOUT,
+		 * e.g. active speakers; treat them like headphones for routing.
+		 */
+		.mask = SND_JACK_HEADPHONE | SND_JACK_LINEOUT,
 	},
 };
 
-- 
2.47.3

