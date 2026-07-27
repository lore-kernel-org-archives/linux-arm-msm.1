Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A482F3D411D
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138089; cv=none; b=h373BEGsz5c+WPOsRNEs61h/5LngvSvXHwsKb0rvLhuQTkulvJL8TS8Bl39zNoJSUzgDhT/pWSlrbUWO4Eeay7mqqdi/mqA7F+WbANFnEKCi7vfMhJ3yn38Gdw+lO34JiAFRf+t4fHr13HYcusj6nXLRm2gApfPJ/egUjxE6CCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138089; c=relaxed/simple;
	bh=i/FrWikECvCNNUz/Xm4748HjItEyZOmtw+SkQjP+LFA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=azuABhXhDKQXNOtpQOOFbaYLP922E1eSy9eTOxEmJ5uODHeWWpx0fiiOHqpHmWDGa6SwI+/AedfClmy43Ah1K21s2Kq18ia4Ca63DNhrMbZ01bckAZXM8b4Uv4iKwkxJFVZ0wUEV0n6tTV88I0mR2MqTLd0Rd5Wn+YCFZVHTVnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ApB8d0wp; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ApB8d0wp"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so35792315ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 00:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785138086; x=1785742886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lr4IppW37FhX0Qct9muiBTMuyT8/uhGcBpZdV9syIrs=;
        b=ApB8d0wp/MD31sdVl8OlbRGpPPtgGNoh4VXz5VNO2vU+6U3+SX/HnatNRpyA6VCY9/
         QsmzL8S9sOvlNiXVlWLRLa1Fk8Iq5ODwVL+pdUP4dLtBBBAMIPQuyBZ6tLWjkyUyp7yf
         QfVwlk9fn4nggh6y39ld0LCLjbn/njXYZxXEf78+uNgk3Pby011uSbFbySkTVF48lUzW
         b1KAe2DZQ5fjE9vsL4c0QCu0N7L6T3c2nFzGJ+1RFg98fxRWjbWIzeHPStkHdw+bcRZC
         BUqHEAOsP9R7ViZvc4vyFMeT9lLQsRESxSdx85lQICF5ZK+kyZWb1m+r1ckKLmO7XGSM
         FpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785138086; x=1785742886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lr4IppW37FhX0Qct9muiBTMuyT8/uhGcBpZdV9syIrs=;
        b=Ss13/tVE1Dud7WkGpX1bIrZVEXu5EV16lSkvy6o0SqrGVgQoa4ViPH6vQMewK90h/3
         3mz4aiB1a2540aW2BJznP8VrKvrdgC6k9QlBKOsbwLHJPBW6iO7SeqFvnanzlQ14UtvW
         9RejNZRg+jE67xW+UUvcKgT+TfuOQbINoTJdGQHcXAcwvu39PRvyCoCsZ9Ipjj4pAeFU
         8iwHoxEGeR7MVeuLXf6HhHvEQG4ywNT+ZatfDasLvHKRyvJkpE7yxrgxu5ysZuSIRNFd
         bHliB1AFwrl+0cYvmNiM1bdGwGOM50C0KN63jOXZQnOU5jlwu2WE5UexuuKJisKIOjCw
         psBQ==
X-Gm-Message-State: AOJu0YzyICbQiHTdoYfZtyrn/aEpi2aZmIT1hfPaRrL9gDsjn5oMhcGg
	0JiL15pX6xKldpi6zTfjDIDJu3MwXNmlv1emWCpXSF60dk5I8Sy7yjrd
X-Gm-Gg: AR+sD13YvEnyxDcHWzSfyjFK6zCo07Akb9h/ATnbjtuXJ3miIjgUmONjovZkXF8uXlw
	f1IBHhFWY+YTCQKRkMqm5Mc5dnDjQ6BLPyFf01P1xPyLtR3HsCVcOqsaVI6OuKHGw0uAxUqmP4J
	iAzCn24bI44jl8kYd91JPcFhjJtrnTo4FXP5x9KmRaw0rwbD1nUoGvfFyR674P7iOHrJB52VfB9
	xx2dt2r3VYRUrUPxJ3Fw9p3e4L7le6YVfA0pQyn98awWoiJPbiKwJCjggqYBjqwFDAs6i7BnLVq
	y5FZ0+TnFY0X/0QrAOd30b3+KI/Jb6hA+tqnjpKh7MsulLIMfv8tqPnflljsukJ/C87PFj83TCW
	z0HYfCy0aZate+NU+s5xgmzUUga+SU5tPgt5MhjnNQ4G4q7skjfz0o0QByhcb79rNS/1iw0vKUQ
	KuF9rHDeY8A6h6Oecgnoet2QYGe+XmXN0Fk+Tl47UEqNeIEARTuF1AD//7rmHzwRlhlSc=
X-Received: by 2002:a17:903:191:b0:2c9:fc14:588f with SMTP id d9443c01a7336-2cfde851b92mr73992095ad.29.1785138085897;
        Mon, 27 Jul 2026 00:41:25 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5c8337sm31054755ad.20.2026.07.27.00.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:41:25 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: sre@kernel.org,
	andersson@kernel.org,
	neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] power: supply: qcom_battmgr: terminate the strings from firmware
Date: Mon, 27 Jul 2026 16:41:19 +0900
Message-ID: <20260727074119.2585463-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The qcom_battmgr_sc8280xp_strcpy() takes a Pascal-style string when the
firmware sends one. Otherwise it copies all BATTMGR_STRING_LEN bytes and
leaves the destination without a terminator.

Those destinations are model_number, serial_number and oem_info, each
BATTMGR_STRING_LEN and declared next to each other. They go out to user
space as val->strval, which power_supply_format_property() prints with
"%s", so a firmware string that fills the whole field makes that read run
into the following members.

Use strscpy() so the copy always terminates, the way the SM8350 path
already does for the same field.

Fixes: 29e8142b5623 ("power: supply: Introduce Qualcomm PMIC GLINK power supply")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 drivers/power/supply/qcom_battmgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
index 490137a23d00..c76389b2f7e8 100644
--- a/drivers/power/supply/qcom_battmgr.c
+++ b/drivers/power/supply/qcom_battmgr.c
@@ -1231,7 +1231,7 @@ static void qcom_battmgr_sc8280xp_strcpy(char *dest, const char *src)
 		memcpy(dest, src + 1, len);
 		dest[len] = '\0';
 	} else {
-		memcpy(dest, src, BATTMGR_STRING_LEN);
+		strscpy(dest, src, BATTMGR_STRING_LEN);
 	}
 }
 
-- 
2.43.0

