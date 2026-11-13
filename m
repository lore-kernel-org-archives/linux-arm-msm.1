Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794608268;
	b=KD/LWRLzAMa9B3cM6Su9VyD/vPWZKhHUmOzkdnt7nHbblklHrbj1o7sH38+Wd2YyCc7m
	 nfr6VEf9p48gMIFF1W6ToAuauL6ptklN0GSwD+uFWOwRPfHo0BTQGt5tckFMKWsYrR1gp
	 PS5Yr0nTg3zwX5RoGLYGylxU8ki1UCEXWJ4R9MAAhKTqS6IXduBH2aROSsQQYpV+IPHRr
	 DdjgexGkGXZgzAgWe4ddLWC+Y+FwNsNPtYD+y7a72nysSGlCzSJDKpmycgwy/NvNuYERk
	 yl73aOsfR8wVQVcEjMwwfq3Zt6fSARvbETnqhrc/pLyYhSOLJRTMlFQVlDkzgO5Song==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RoOMKJstRsz6kzVltt6LynRLltK4wJnMWDIO5lBxAHs=;
	b=T+sgdgqsrxP70ctG9VxAMKmAFNKEZnZF7z+qVId4LjyXxiUDmJCNLmaR4Mz+5+SoAwM9
	 TdvNkiDimBTfXdSHreQAX5XHgTXkA7MqBlfEVqmkIwIsCUypOPn7DV6bFRgSvAjNZqz+D
	 Gd43az+mmwQqGCPNkapNkCEh6W29fgnCTp82p0oaEm+9R6ip2vETRjEs6WMmfXInpokNR
	 MrIHlLTv23UYmTh2FW0QpkNDczcMQoY/T5oN08CtEqhHpAV3t0cBJGSoEDG77Pb7rJ9E1
	 /1O/thsttNvs2VmLJYuQ7cPg5lG39Tr2jvl19G6BHfL1zLD0CR0/HPLctD/loJmsFHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JUm7RyM+;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85691606A32E
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 22:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85691606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JUm7RyM+
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36a6ce64b95so578585eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 14:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794608268; x=1795213068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RoOMKJstRsz6kzVltt6LynRLltK4wJnMWDIO5lBxAHs=;
        b=JUm7RyM+AXnjvlrIH2lobJSVH0t/Th2jSkDpo0OPg7nx87/mKmOc4/Y+3HOngLad3B
         O1GBloJGH/x7tNHFVTdP0y+A/2aZxz+nOV+Qy8hdKmVzwcUGBN2stSRPPaqbmvd42lyO
         v8mk3Ku0eL/v/nhnAgp5pucHc9Qk5NkSJCE5jCGtfLCI/poehuw5Z8YD5UfBdwog0rHE
         pQJeQieHsN0wksmeC2iEel4yEuYNnbUdNpAmNfOaQQ/GJ1Fjx4E7SnKu7Ezb9Fg0bS0P
         uqikaNy+J/mIloWXi+sX3FcbCuEjzNl00L3Faaz4FXfxkqQQk+kxq7wSz+XPnioI98uz
         +u1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794608268; x=1795213068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RoOMKJstRsz6kzVltt6LynRLltK4wJnMWDIO5lBxAHs=;
        b=Zy2n155cC+zIP9mdNPOCPeUI+gPLyOkRbNo6gwZUn2BdfU2CPQqmKC+IzMLQknBU66
         uHY68BVNuY7gZEcRjrS5SsZ4IH+7XpVZEKf+q/1TkwmJuW4bGWozVrNSsF/Tq2x3LeY0
         PWME54isiaOyXHfuGIFpLyKJpx4XYc4dV06mv2vlNgoZ2327tkg86oda5HHwAKS6qd0l
         uBuu5A54bInXJByB9rOCq10hymNBjYbt5YxUZrRZ+Lw2fjJzjtEWJjbGmfqP2oNNt0Di
         8D+PetxB1PPGUEFs7d3m4kCEB4QMKf2DIImBfYAmuKKWkX59y9NnTlMcUbH6drytaK6W
         L/tQ==
X-Forwarded-Encrypted: i=1; AL+hErHc79XKaoK2nhI2fPszIDI8ajw9sC60dGYtC489k6jHixvfUL6A+mI8xHD2hRDOsWU3MMTQCgsBA+7Rw3zT@vger.kernel.org
X-Gm-Message-State: APuU4Z+A7eq+zalioqul06Me0oOvFvFLWG8LWGVrE+UQd8R5blMtT60i
	b8ump10ltZWL2QG0EgIGIv51FLCIuKrR+e+LR+T7DI9AxFFMZbt7QZeG
X-Gm-Gg: AYBFou0FV42nksACyaVWL2wGHoYUV7BFF4HIMvi2Q0fSDzmN8bh+I7Cb9Cp5MV2nt3i
	VUHUzqmZGrtVAAIq6bmZ0ZSBOgDdWBu+etuN63OlqlYT5kYFIqG6gED0Yv5aTkCpcUDOaQeP1ME
	VYldKpHJZVV31fWE/qQmqMOgQWL9GYGwBJ0g+ko+09TIZlxJCBYF2xFO4YHjd8i9jkE38LVwEeR
	NIN9FL6v3DFn0qwGl2uEH2GiawEFmZuTw4/sZCJ52mh/T2eqpA3FCYM+fnYxZ4LI3BxBV2o1pYj
	nwcxk+Mcw/vrWiJcMwwX//Mg2513aXh55nVJmGssxaVStTkVIzh2V61bEe5tmUuGkLDjAeFaECp
	wjNMheuuw6ANkcpUUgS1lG5Xg2Ii3tYdej6kd/1iB5x6Ah6E6Zuv1AacRzpm/IfQD8bHnjhzxud
	sjYcUFhXg+HyCN0jrMOjydWqBjktkXU1y6id2au3ZbX/9Ny4kKymEQj/FDeRtfa61VEyvveBRuL
	kW+6bHsZ6d+BGGQS8pK/LN7/0wvH/ytr640KD2tWJVhdNo0YyDscNur5pOcr+GPJhUiwG6+rXZX
	hanirkyW1Mp/ynfyfhBm8VcuM/epS4J3IogsuNtgujf8f/Vn3uvmfpX3nfdfR/Rn2g/0rdZUS1e
	kFxCJUT4BEqQwAKMvCGY5OA3o/rM4QVin9TRGtQ==
X-Received: by 2002:a05:701b:230b:b0:1b5:10cf:c458 with SMTP id a92af1059eb24-1b510cff4a1mr939693c88.23.1794608267442;
        Fri, 13 Nov 2026 14:17:47 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d8f5sm16886713c88.3.2026.11.13.14.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 14:17:47 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
	linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] power: supply: qcom_battmgr: return charge threshold write errors
Date: Fri, 13 Nov 2026 22:17:32 +0000
Message-ID: <20261113221732.97506-1-dennylin0707@gmail.com>
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

Both charge threshold setters return success even when
qcom_battmgr_set_charge_control() fails. If the PMIC GLINK transport
returns an error or the firmware does not reply in time, the sysfs write
still reports that it consumed the input while the cached thresholds
retain their previous values.

Return the request status from both setters so userspace can detect the
failed write.

Fixes: cc3e883a0625 ("power: supply: qcom_battmgr: Add charge control support")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/power/supply/qcom_battmgr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
index 636d6f6acecc..f14d731e0283 100644
--- a/drivers/power/supply/qcom_battmgr.c
+++ b/drivers/power/supply/qcom_battmgr.c
@@ -704,7 +704,7 @@ static int qcom_battmgr_set_charge_start_threshold(struct qcom_battmgr *battmgr,
 		battmgr->info.charge_ctrl_end = target_soc;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int qcom_battmgr_set_charge_end_threshold(struct qcom_battmgr *battmgr, int end_soc)
@@ -725,7 +725,7 @@ static int qcom_battmgr_set_charge_end_threshold(struct qcom_battmgr *battmgr, i
 		battmgr->info.charge_ctrl_end = end_soc;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int qcom_battmgr_charge_control_thresholds_init(struct qcom_battmgr *battmgr)

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
