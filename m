Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C579D23395D
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 00:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792284723; cv=none; b=YSQj/DliYAw9LC5w+KpWSCssA2yp8BGsGqzC64vfFbE+vPVB3qrNWaPGJ7W9g6FiGYNsm2WMcH4gZW/RblXpdl0L/+lSNDzfSBQbNGtIVq2zCMh82xiRdvPvZUr+Ux1krD1h6nZZnrLTuYghM/aYUe6zWYTov75EmWOjZ6Qk7UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792284723; c=relaxed/simple;
	bh=eTUJ67U7/3BnLFH+qFQIlNgaP3/PqrNrZtJFDGZhTNU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SgLv1N3gGov6r9vW9jdse/AHRqy3O1Cf5Vv+A07Z2FUKtjoPnsu1cHdzOckC9S1Vw39CRUQtN4f2LSZLnc12wvN+hu4U9qwvsdCM/4O5ejWDSoSv8ld3qIQXOeYqO9gNuWDXZ8G2QijbBBlI/JaeIUHok/UkNahen7qVVZwwwXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GMVzsHe3; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GMVzsHe3"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bce4e278baso1332356e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 17:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792284720; x=1792889520; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7AXHPdZUYZbA72hWR34lPKHVl/XaRfzFZKPUd7IEbek=;
        b=GMVzsHe3uPcI/30D2LiG6SQnAoMk4kDqsxpv3tG+Y1+WdagUo/iZBmBNCIBr3lHrwh
         QP+qaCQRprfA6u6YmYe91jg4uUaE2bhwViQJK/6WPFmD+Obbuzjg84ZRYZzQZvfDkiwV
         pd+tY3/9m5bm8R6vSOerNXQ+Hl/oDqFKaLD8KwzeP4QyZXR2pneWS+T1vENHIcAAu9HT
         d8y9wtkidzEYvQC0wqcHle3cCJr/+O0wjyZ3UM98yf2YmdlOMbPg0mXSnSUkIDs5CamW
         1/is9s29Z+ksp1EvnR6WfibKp+bEPR5wEuxbb6yJBvc3+vN1iPI2g8xkDJ1FdqdFwU9Z
         XtxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792284720; x=1792889520;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7AXHPdZUYZbA72hWR34lPKHVl/XaRfzFZKPUd7IEbek=;
        b=02407MLvAHaAMIDoYBQc7L/J2BwHGVnd9mE/tRxqRefkumiZiNsjpWqtC/p+y8wot5
         uJi99SH2A1NlgZVDDyS+hhyFAKC33k/plngOugXEhg1ePB6WZEZVeRZvZnMGxnB8fcu+
         SKGDh9L2PY3Prsw3ZZsMMV1GUOZ6MtKuCH6+cS9BM4oOX1FTlbD9SAwgOVqQpl9F+3ap
         HZBB99wmOer1uegBBTv+w7Sau/Y3BgSM4asKbuEksLvj5PxrhHyJwMYK0XuIWGwhInLe
         ATRrTmrD84mIVRCLNLcGIhwMUmrlsU1SLcBNKqoSIbcCW93FhPn353LQNQALe3y/jBg8
         UY1A==
X-Forwarded-Encrypted: i=1; AKwUvBxqahGTNgd8SPgy/ZN20VjmpYJL60+mvHzZAHnb7NfMqjslqQidbBtv+US4QasI88Au91u4nTd7RgaM5SUT@vger.kernel.org
X-Gm-Message-State: AFq9FYIPpbohtKFPOKJbwOkgYovcZZ5BsWZYBemVn4oRS5akMFPhdhXY
	7D/nB5nEBzoTQXdlXHTRKiWwV3Gsv0RuNLbmT3SUddvxNgvh5uwkbJKL
X-Gm-Gg: AYBFou0gRUHgd7BRI97w6RUbIRLO84zDIxMVYvB+WENXil8kG+i39lov+bfk0JYa6e4
	+hQcCP6+7hb1HNkezHML+VZCl9DYBZIe6TojBVQH1+40FiIRyBSJwOUFFPlKjoJwbv5guMMbeFf
	3AaDQRKSw8FMSDzbgNwXxDpaahwcfPxtjOSpkr/puqytNU+CsnWAwFIpAMKZsjPJqBy5EA9NDLu
	rW1Uf6nbiC0+bOREpx/7U2iLBKJebmg5cnoRFAJubhbx/MvzAwrikSia373npzDPIIbuR78qDpV
	hTvJ/Omovu4RUtLW482AZyFjEZAGnQwZHRMz9dAkmzfv+oUOfP1OAgEO8/+2jPuV1r2qsgtPLzG
	6XeNVREnLifi6efmf21ttdRTg5HCt+Zc8ht2EXF4QyNoanAdQEkrIAHw8v2PMuwKj5l+bBHIrQ+
	fKNDhlXovVkED6saRSDRsYOwEZ69Hp5I/p9SgF1Acnw1jHN0mj2QKqrNATPhpBlHwXiyTY1HMGI
	hzeoCvvVECGHY8aHi3SPWaQ6MaVTiXuWuI77B/SdjoD
X-Received: by 2002:a05:6512:a83:b0:5be:4f62:5b84 with SMTP id 2adb3069b0e04-5be4f625f92mr1163822e87.19.1792284719388;
        Sat, 17 Oct 2026 17:51:59 -0700 (PDT)
Received: from [127.0.1.1] ([93.189.202.99])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a6335fesm1158148e87.57.2026.10.17.17.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 17:51:57 -0700 (PDT)
From: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
Subject: [PATCH v5] bq27xxx: support interchangeable OnePlus 6/6T fuel
 gauges
Date: Sun, 18 Oct 2026 03:51:22 +0300
Message-Id: <20261018-master-v5-0-0be16441cdd1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zWOQQ6CMBBFr2JmbbVUaMWV9zAs2jLAGGlNi0RDu
 LsUwvLN/Hl/JogYCCPcDhMEHCmSdwsUxwPYTrsWGdULg+BC8lIo1us4YGCm5rqpS1lKbGAJvwM
 29F1Fj2rj+DFPtEO6TgmjIzITtLNdGvlALbnzpkv7juLgw2/9ZMyTZy+97qVjzjLGC2HVBW2mp
 Lq3vabXyfoeqnme/+1Z0knOAAAA
X-Change-ID: 20260927-master-bd0afd9696ef
To: linux-pm@vger.kernel.org
Cc: pali@kernel.org, sre@kernel.org, afd@ti.com, 
 konrad.dybcio@oss.qualcomm.com, david@ixit.cz, krzk@kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792284715; l=1522;
 i=rinat.muhamedgaliev@gmail.com; s=default; h=from:subject:message-id;
 bh=eTUJ67U7/3BnLFH+qFQIlNgaP3/PqrNrZtJFDGZhTNU=;
 b=uiGK+g5pHQItU5xVxRjt8VNW+ZCmDvRM3V11IWSecneXJCH+CRkZxvse2DbTG8loYZ3qLdd6H
 f6ItcjEytIhCoJc/KwaeLzxB8oF8HRcodNTbYIqdFlangqBPQhgOSq2
X-Developer-Key: i=rinat.muhamedgaliev@gmail.com; a=ed25519;
 pk=qkYQO8LRlRErWiLzlpK8jHbRIxv8+7v06+ytcxX8mec=

OnePlus 6 and 6T replacement battery packs can contain either a bq27411 or a
bq27541 fuel gauge. The latter requires a different register map and produces
invalid battery readings when interpreted as a bq27411.

v4 drops the proposed generic DT compatible and DTS changes. The I2C driver
instead reads DeviceType while probing the existing bq27411 compatible, and
selects the bq27541 profile if the device reports 0x0541.

The bq27541 path was tested on a OnePlus 6T with DeviceType 0x0541. It
reported 4.338 V, 100% capacity, 27.8 C, and Full/Good battery status.
Testing on an OnePlus 6 or 6T whose fuel gauge reports DeviceType 0x0421
(bq27411) would be appreciated.

Changes in v5:
- Report detected and expected DeviceType values instead of hard-coding chip names.
- Describe an unknown DeviceType as unrecognized.
- Link to v4: https://patch.msgid.link/20260928-master-v4-1-052c73ec1767@gmail.com

Changes in v4:
- Drop the generic compatible and binding update.
- Keep the established OnePlus DTS unchanged.
- Detect bq27541 from DeviceType in the bq27411 probe path.
- Send as a new thread.

---
Rinat Muhamedgaliev (1):
      power: supply: bq27xxx: detect bq27541 behind bq27411 compatible

 drivers/power/supply/bq27xxx_battery_i2c.c | 39 ++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
---
base-commit: 830b3c68c1fb1e9176028d02ef86f3cf76aa2476
change-id: 20260927-master-bd0afd9696ef

Best regards,
--  
Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>

