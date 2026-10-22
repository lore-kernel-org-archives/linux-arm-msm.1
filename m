Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792687907;
	b=1pDTi7ovjuD7iiJrzT3m5+8zRChxJB9ZJZaHghp+3rpJijN07C/sz/AizZnfZEXDyG8u
	 ViOQkUgMcdG6SeQLT5s6q3iUiPHeK8K6KP1rUsZz003pe2jinqC7HS7DT/QePweKdkQtR
	 g/HyI7ReprhwmYxhsv8eHzvLT7uJS8NKyU6IDtH9hmOQEdvaUtGJfMJ9JUXiId7Cvr9i7
	 m7JM5o9Ac8Yx+kV4K/lJTqdXD67Hubg+vCOZC2yoab2um6hbRiKAKW/855BFVACnF5Nmb
	 MQmK4TFukjN7d4PM095r6Yr/N5QUlQTiTeG/nzhiA2GAlSR5IEE0ucbdFr2WnbYJOQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MDRQGAeJLdbef9dVZwQAv7nGIbRRq1DpVqeg51obZuA=;
	b=Kr2yrIw6RJlQKY7PawVT1GnUtCY++dpVX35KTUU2XxUBNR/F52JR4P4drjxM9+wEfo8O
	 YAc9bhN46SGqax03OuW4ndRIWQWGeMhvb8luWf90ahWfWda6hwBDdad6ilzijE/86vtwI
	 wzlmHUHh9HUc9yUNxWIr5VxFMCMOomlg4ODSLocQ8GS1IAuSwO2KJ+wVgB8n3AJN+MJsc
	 id8tf8d1JL/9D5SqzIKQhHXD7W+oXaKBe+6ZXQnLmcG/w6ee/NosppbgcootS14+dXACU
	 KDuinFElbyn3EV3J9A+kcJRD830PGTK1Tb4LovJVpMNGzRKfYCZwVqpYTMIr33RbxAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KBp3mBBV;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4967606A31A
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 16:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4967606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KBp3mBBV
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-18cdcfc05ffso2335086c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792687906; x=1793292706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MDRQGAeJLdbef9dVZwQAv7nGIbRRq1DpVqeg51obZuA=;
        b=KBp3mBBVD8mfQPf1xPzMq78aeOa7OjwZrfrkFTLv2MOomwMfKo99PpbcsyR98PDW6g
         tlLlCzCxgP+Il1BNJNs21b8d88NZyIipvWgy701LcDZjekp2TPyi5kfoqZfNifcoLnQv
         pCVLLkfC4iJTo11uUocrgB6P+bNIQhMrcr3Cv9WAYYPQZkoL0MmkkQ7cBgqIb1s5+SD/
         LdLxXBZC6br+p7I05cm4zZ1V/+dSp/OcLLSiBU5OkH5QNaEfFB4qR6ZPQX1+MzBum8nj
         vJ8XEp1KCdtY9mQCDytv2jub6UXE3/+3BsU17StIu8Qf4QJpxIAuxzHzaPZxmwuEzTC1
         UUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792687906; x=1793292706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MDRQGAeJLdbef9dVZwQAv7nGIbRRq1DpVqeg51obZuA=;
        b=HfOfJ7LK/pHT7QPwhzc/gUNiEn2UnfjfwmC9kN7DFyC6GeTWTqMbOUPFNeZNoU8UZ/
         HEMOnrwX7r6lgayXZ23FkxLVjALVcP9bryG8Ymn9gAoRegUvTgLjBjZMT2Vn9U3gtS0Z
         P3qYM04UTn7REXGawfsK7dzmtNcyZqLo0xDrL/ceFZiED+c+97MHGKtYJQ2/ki9urnp/
         eNszK7CJH2K5uA40vNFwF9TrdJ5Ar/3MceDeQ5SnmsVvHHva+eCXvLUwKuNsXNx+YFYV
         ilR3cT56oMFtJ7PNPh9rpt6N/rH8goA+BxRutGOAUQxBizTVYhTZBXm853uNRZPAygm1
         WssA==
X-Forwarded-Encrypted: i=1; AKwUvByquBgeWseNtNm+VaD7A3RtE0lypwaur954hwTv8Wg4/fJf7HnJ5k29bRVhcakg+BTJ+ML83Z4Ue3hsviqP@vger.kernel.org
X-Gm-Message-State: AFq9FYLTlpMgOiB08jeqJs/z6UP/mSj+gUvNV2YwAmqblcFVbACiqebN
	uXaQL04xB7dp4wkt/ZbT2YZJ1PG8JUmC4uC6UGkkzqrmiGAySNKGfklH
X-Gm-Gg: AYBFou0fhS6mDh0INzxyx//l9ItnED/Imtmghp+to3nunVLpjLMGSJKe8gWXDUoabSs
	wdMwWf0qBlylk4hOuzMD0mcvTuQzBbvCRZJjFRuJf/Pi7hRkjJaaNFcxcOsIkpj3LSwXRdzRTF7
	GdKwkjxgRcbfyVs1UfG3XZZBwJZr8CTFx8vZY4ttbWzPOY9X4SmxL3M1UhTf1WGRh/gM54Imxdl
	f0FDqOs2fxFu26Dgn8cHqXVNZb/9IRh2ozxpg6DPOTV7B88WrLrhZlUiSlt7fwImLwFP8CVc9/Z
	kD3FaXwLpbP1EI3R+yoatLFoLxNIIjfJw2dCR474rfinLKtGlSLE11xGa0ZOkNQg6iInPENof9L
	YRDPvKBSBhR0BTdtYvOOdtysTgS2sr2YNwcGLeJaYHMzQdJK/a6sZh01Cli4hEWoAtSudlXobFj
	iBNEqJWY/vrPXg/thV5v5t3GVE6e/tPu0hhNyBPHaeNA594U2fdncVD9RHsRCVJZE2eZ+Oy7fy5
	MCuUfg/8Q/lMVn38sO109j8W/E+3kCeHFiEuA5nFpRNEAOMmqeYKD1cqfaenluKmmjUO14=
X-Received: by 2002:a05:701b:42d4:20b0:191:444:425 with SMTP id a92af1059eb24-19104440440mr6489634c88.2.1792687905761;
        Thu, 22 Oct 2026 09:51:45 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1959dd144aasm46566c88.0.2026.10.22.09.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:51:44 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: neil.armstrong@linaro.org,
	linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: typec: mux: fsa4480: Keep the USB 2.0 switch on in DP-only modes
Date: Fri, 23 Oct 2026 01:51:43 +0900
Message-ID: <20261022165143.1327-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
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

DisplayPort pin assignments C and E give all four SuperSpeed lanes to
DisplayPort, but the USB 2.0 D+/D- pair is not part of the pin
assignment and stays available. The FSA4480 sits on that pair, and in
these modes the driver turns its USB switch off, so a USB 2.0 hub or
device behind a DisplayPort sink is disconnected as soon as the
DisplayPort mode is set.

Configure the USB switch the same way in all DisplayPort modes.

Fixes: c7054c31c1c9 ("usb: typec: fsa4480: rework mux & switch setup to handle more states")
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Tested on a Lenovo Y700 Gen 5 (TB323FU, Kaanapali; out-of-tree board
support) with a USB-C monitor in pin assignment C: its USB 2.0 hub was
disconnected when the mux was set; with this change the hub and the
keyboard behind it stay connected.

 drivers/usb/typec/mux/fsa4480.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/usb/typec/mux/fsa4480.c b/drivers/usb/typec/mux/fsa4480.c
index bea0c1deec94..e05ab3c10c81 100644
--- a/drivers/usb/typec/mux/fsa4480.c
+++ b/drivers/usb/typec/mux/fsa4480.c
@@ -93,16 +93,9 @@ static int fsa4480_set(struct fsa4480 *fsa)
 		sel = FSA4480_SEL_USB;
 	} else if (fsa->svid) {
 		switch (fsa->mode) {
-		/* DP Only */
 		case TYPEC_DP_STATE_C:
-		case TYPEC_DP_STATE_E:
-			enable |= FSA4480_ENABLE_SBU;
-			if (reverse)
-				sel = FSA4480_SEL_SBU_REVERSE;
-			break;
-
-		/* DP + USB */
 		case TYPEC_DP_STATE_D:
+		case TYPEC_DP_STATE_E:
 		case TYPEC_DP_STATE_F:
 			enable |= FSA4480_ENABLE_USB | FSA4480_ENABLE_SBU;
 			sel = FSA4480_SEL_USB;

base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
-- 
2.43.0

