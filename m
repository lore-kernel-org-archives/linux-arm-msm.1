Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1475B4CA768
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 18:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791828676; cv=none; b=UXIf6cBamvfpq9NVG4s9+R81nOJA5xYOsGOOt0Aq09U1GOEKekiDNCXV1AHemzBTn1lYlh2OYhxpBNgGTNjGe0B1545xrkbXcExHR5K1Hj6L5mR/778lu5eXXjkHblrO4gg1Q+8S7JhqpooP8Y/aZEf1Vikg/rhCrIOfy8A5Uo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791828676; c=relaxed/simple;
	bh=2LAXvFWjSHWpY8mhkHXQzcq9Ba7ggDc8u4QUBCqYd6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=omhxli1B8RxE+TiVBDeazKx10CSaFtyDVRQv9xLemW0SSHh2EWB98kvcipIvH/uKnsZFQWh8ybCHQdx/2rlEr3a06ZzwGC5CX0xlNzqtIUfle8sGfe/bwun3a1nq0KkZW9iLCFeLYf6AMi5z6XI97Z4NYMCwr6BWOUNi6cXhy4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=APTor5fj; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="APTor5fj"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a374bea882so3171675a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 11:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1791828673; x=1792433473; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rxZgZ36Wo50LsnIKnkOJrinMNq3Hzc2rg+tfq9dowts=;
        b=APTor5fjY85R5pPId1ei9EZBx9dI69hfSWNT8Plq+QjIMaQLvo0dlvbV58IBOw8A/+
         WGPzHQYBn1ouBnuzgcRLvzf9633tokVpvZDwSKlsJ0p+qpW2C9E6M0IVplKpTsTfNM2u
         WEhwHz3D++F6HLTL0S2lYdwBjuoy8HIxk0nX6P3tZ9pr+6gMYG6EmUbKpD2TgqqmGnBa
         n6okTapoZFaU1833oNV1mjrfqIuvyt3eCdOAqAH3ORjJyQX6Qr1+2dM7/DGuuzr/iZwC
         q54MwXzKEF7JjwMH7F8OfNzaG3S4o9uonMtKME1N0kZXzgaf4xv0n51kPFXMx/8foQbh
         P1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791828673; x=1792433473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rxZgZ36Wo50LsnIKnkOJrinMNq3Hzc2rg+tfq9dowts=;
        b=xTrkpx7pr3THyEh5OHcGf5re7mQanIZb7EgxcRxLuUVxituxGORS0/fLTxTl5vcaFq
         8615Uagh8Ji9ycaD13zKoD/v76T539ibZKdbHppmRWAJZ42pj19WtZkCzEGqqn6rTIF7
         Ix+Aq5jyZSNvh9nCayb6To2xPcsGFUDsfUumqmgQtgLNB7GXWtAwQ2W7pGBugoUqndJT
         VUSJnIIw4GVGC0nZM92vJvU/m5gp+zsfUOYSIHnIkX+42iBCf0kPiAXQm5YaJPw8YzVm
         xlankXjf6rtR545yG5yehgb5O5xOSdmm1N34qdQmJIk6oO9WsNbpAHR4oHJCEpjZROK9
         jtlQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5sh7h3XO06Jdz37HN8D9Rds6SUU2388fjngDdsccBHPG2Me4i2fpG3fYIvtoIjc7c/6KpvkSODPkhbdoR@vger.kernel.org
X-Gm-Message-State: AFq9FYLlfOtJOOt/MOG9I4KK609jvBSto5gZlOKZSsxwyuA3p8bJisE4
	dt2BJrThd6lf0pfCSGacBiopX5oyxF26ya+Usz//nVaVw4OYH0Xvv3K68KtVmmIZjJs=
X-Gm-Gg: AYBFou21wlaty6yvZQ5butw3++xBj5Ux/Vy9YGCpkxdwGbYsSuAO+SZoLsXfl0Jwky5
	0z48UV+v7HTixg7lZWTC/HcobLbKi9pE3y+LTtR1jduf/X6RF+Rv2bl/2HcmDx9m3brLDV2oT/V
	zfzUyhVEHVc1BZPi/FH3W8SVS9zxXGVElGSAi4GmdBTCzXN8R8GepHhovGzKO3MZdZd93cUlsL3
	Cbawy2F8zJeUpnARmpoexF5MX4FnVM6X9tp8F/wypu5MRaa8lH5iQwncz5LCr6NIod4uCCV4/nL
	kX4WFyq1gVwol9u6S7fONXpTML6fPSbInob0ZWZ0EffopmULooJnoFa/hgoMkyNxQN64VbfwFqa
	cgugXqhLprKLP/5FduvoFN3hMdllMCRLyTsfwAC+NMmr4GmjgZ2Pjt7zi7r45MjjFuDtjG7qojP
	CtF3/qQNgk580imL7T7kDtoKSUs7c9UlFgc46q0eF8qDm6q+OEAhXJQTbWnLV8u2qn4x3PRnNaI
	+HITNaOb2Y+HFgztEmUFagR8n/oijJ29m/ACyFYlfx8t90MkFOcwlHLxziTvrIl/ichqcNHM18F
	6nFV0Sh7jJhFBiLCl18=
X-Received: by 2002:a17:907:1997:b0:c29:f5d8:9c6c with SMTP id a640c23a62f3a-c31aa056fedmr1008415266b.27.1791828673444;
        Mon, 12 Oct 2026 11:11:13 -0700 (PDT)
Received: from [192.168.101.179] (2001-1c04-0504-7401-4b2e-1820-6d24-b264.cable.dynamic.v6.ziggo.nl. [2001:1c04:504:7401:4b2e:1820:6d24:b264])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac924dsm498415466b.70.2026.10.12.11.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:11:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 12 Oct 2026 20:11:03 +0200
Subject: [PATCH 1/3] drm/panel-edp: Add AUO B140HAN04.0 panel entry
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-book2go-v1-1-7188e7ea7a15@fairphone.com>
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
In-Reply-To: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, Jasper Korten <jja2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791828669; l=1566;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=sMlOHXWIQUaAlGkuR7ZEpwEAbe+Afp5+xO5cvE91lII=;
 b=5ESqndbcoHCWmYQ1IFMtTt9lOImdBH4J2Ge/7LsrgcAiob3q5Ug0lELJHEh6SUsH8K5XyfvN3
 QeGNqjyQhkcBP7aV6EPAieM/u/rshdDDc0LzpFqGrvF47BlU1FtdRDB
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

From: Jasper Korten <jja2000@gmail.com>

Add an entry for the B140HAN04.0 eDP panel. It is found on the Samsung
Galaxy Book2 Go.

$ edid-decode /sys/class/drm/card0-eDP-1/edid

00 ff ff ff ff ff ff 00 06 af a9 65 00 00 00 00
28 20 01 04 a5 1f 11 78 02 9b 85 92 56 59 90 29
20 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 14 37 80 b8 70 38 24 40 10 10
3e 00 35 ae 10 00 00 18 00 00 00 0f 00 00 00 00
00 00 00 00 00 00 00 00 00 20 00 00 00 fe 00 41
55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
00 42 31 34 30 48 41 4e 30 34 2e 30 20 0a 00 ed

Signed-off-by: Jasper Korten <jja2000@gmail.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 2b455369ed70..73cdc2d37ab7 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1986,6 +1986,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x635c, &delay_200_500_e50, "B116XAN06.3"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x639c, &delay_200_500_e50, "B140HAK02.7"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x643d, &delay_200_500_e50, "B140HAN06.4"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x65a9, &delay_200_500_e50, "B140HAN04.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x67a8, &delay_200_500_e200, "B140XTK02.4"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x723c, &delay_200_500_e50, "B140XTN07.2"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x73aa, &delay_200_500_e50, "B116XTN02.3"),

-- 
2.56.0

