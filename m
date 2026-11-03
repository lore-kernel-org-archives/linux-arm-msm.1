Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713848;
	b=T7u0aeLrrBZePU/i0kgVkD7HGKxUmXZb+BUBmBqCz5uYfsnZD6jRrjeXFga6o/LY9Q/g
	 DSDJOLyoBtZlbyn4c4MbWcA7D+8/52L8folLr49sHoopS09lQhbhY7O3YSP8zuhdMULlf
	 JIkK0a1Ev5mbkXh9MKoxx9bdLZwA+4XvHk0Z5FJMEyY7428l5Xqy1uNYdxYfw/qTJCDYX
	 vUl2VhJigVaBMwXbrOrN0cLMd/VPm4VycRYbKOljK7Gc0QwN8QY2t6RKwb+h74KHUo5ql
	 /e4VUiTg17IiMY2s7YCk5GfbwtbKnX4o/l+wgD55hklrmdqgCmSCcrSRvzhb392PKmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iz8THq3Ta5/c6lJGQpR1glZjC7mwlp4rMFLr7kynKic=;
	b=cuPVk0jpZttCsij+wOCPG8kziW5QDsnitA8zkcqBmnP4AVfaD1qcEiBggOrcXyW6xmqN
	 oZ9bxacQnorp8y9zWz6p0crwD0yNyoHxv4nWts27IlIrmOzObBUXghOYvRaxjvPkbtQ9d
	 nnq5eJmP3qDA73ma0Duu9Id3dmRGosoJwVuA1Ztx9vtJS1ftP/0gOGCWrjOcS+xNrGPbe
	 JISssqFGnGBrZHhhlD4/sUOwXM0Io7AwjzQivoZd+e8Edhaij5nkOrjcq9Uawwab7WMNo
	 uR/Zh4yoeaRs/duhNZR0swsx12uyfhocM0IfUQ1IgX/7iAG0G5l/JA7Kg0EnRLWQmUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m+cGWw8H;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB2D606D817
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 13:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFB2D606D817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m+cGWw8H
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b1ce85287aso2127484c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 05:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793713847; x=1794318647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iz8THq3Ta5/c6lJGQpR1glZjC7mwlp4rMFLr7kynKic=;
        b=m+cGWw8HKJ8o6/4u8Q6E0ZLb/I3Bj5h5DWw7ICnAPKp4/EwJAuPzCkuy23H8DCc+dY
         +ND+UCXf6Isyw+r9M4VIyJd0A5TIxxqKpl5jqd7fHPQEa91T1xMUiSPei87Zz7ootcdQ
         lG9gX376h8ayU9xs+y0y9pq5tA6m824QkSwLuKCHYVAXxbjDHkpPFDX/Z5OZkFef4fUW
         GEyIa/KesY/b2Ohn15JyLZQdVnjWGaDWS2METlbt/acCnqqCGhZdAshzTbkNqTVCWiLK
         v+2b2rxqZiWPFWNMRMzUxzqEmT8lBACT2/nkzmcrejuwEcHIoV/92SB3+Bn0oQZ4JQIw
         XQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713847; x=1794318647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iz8THq3Ta5/c6lJGQpR1glZjC7mwlp4rMFLr7kynKic=;
        b=jIG8uugpM5rbt5y94XwRiHKEMVRcfYjX95xMZy9ntxY+RgY9K5Ao87py4L+tQNakA6
         ltYwitI3eMuUFCXtqlMRhngxMRfdjdF6X2ZzU9z/NZyB83ZCa5oDnEnHwXljNDRa34OJ
         1KcSn4fOJF0ZYT/K0xZSytlJD0+qLnAbhb7oymPWq3RnD2AwGKKXQq/ZV7zpe3XpY+cE
         39vkvwXGXv9EvKEkAyVBScuaB3K1X9PGnl28YaXoNxlUIo+jDfq7IhtLPUGQzxIBpBlr
         1z9xkN6cCGrG2mPOyXlYZZkhBXkHeYCZ9A5Ac5Db8zN5LHIWK/HEQLyedb2LW9D0dV5w
         R5/g==
X-Forwarded-Encrypted: i=1; AKwUvByt5RWW+UosYNTqXfHtlNpL3MrZsIw+hOPfb6M8pfHx9U7Qi98TyK/qw7vg/Q7yKVG3MsidmRapbK2DfY9r@vger.kernel.org
X-Gm-Message-State: APuU4Z/Exyqyig3rksNsfKNpVy4nNGbRiKFcrIcwXkXgDwrxOrdYd4ya
	4bmDuBXJtIzY8x/apnwj7wVHAIbmXn3yZ6Cm0Er3IkeIH8e462eI36ao
X-Gm-Gg: AYBFou1jgWTNU9zBdvAcxOWZotqL2Zo+GqySPtqRDO/5S0VSf0tNvZs93hBUGtq0Ohw
	Tn59vTRyW7QvZeP8IzGJqdbWXyX7NVXSBka9BxlQCSsjnCXkII/m57oQeBWVJrNwIzGpG502Osx
	b56cjlAQYwb+a8mN4ZckmomeMvwNZSof7zD3ky7XrX6oMtBFtNvBjyUKT/cIE07/gKsKiMN7dhO
	p8OyeJsjtxBQoktwUxgF0KxiXIWm46s/aZlC0iX4+t5obALOEIm3ElM53OSY9zN2j8DUDVBqXz0
	rqQqHj03ghMRbbIfmKQb2BBncy4r6Zyc/ZixfMdCPjPoET+5e/+EqBaGsZWyZJtPMkBVMVHnpKA
	9FB1xum0TW5yP42O3FHgrDWYVmWJC94yfSLHoZyMpxEwJJlM4Y3qFYK7N/RBMtPtOWR/hd/d5SK
	rhf10Rj1pHtHh2scprGL3qqn+ugdXxcLF/HWoFP6b+zLDjxlT5QHDehZVzqgmbTlZeEneTnJ7o4
	1CzWiAHf8iDzmaocsfobfthMvEiyuLiFnwKD5fXo7JPTQmLRF84rj5CemNHc0qrDqogpupjTgmB
	r0C8NWRp6z/Hvim9wumV+PtTxmqsL6BJbCK08vHj1WkDcUi+j8GkQAbydl+++yKUNA==
X-Received: by 2002:a05:7022:ef12:b0:14d:ef19:246f with SMTP id a92af1059eb24-1ac5f36d5cbmr21734399c88.45.1793713846762;
        Tue, 03 Nov 2026 05:50:46 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac0e738445sm44055965c88.0.2026.11.03.05.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:50:46 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: neil.armstrong@linaro.org,
	dmitry.baryshkov@oss.qualcomm.com,
	tvlad744@gmail.com,
	linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: Leave the mux to the altmode driver for alt mode partners
Date: Tue,  3 Nov 2026 22:50:46 +0900
Message-ID: <20261103135046.1654-1-26rote@gmail.com>
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

Commit 25a2bc21c863 ("usb: typec: ucsi: call typec_set_mode on
non-altmode partner change") set TYPEC_STATE_USB only when the partner
flags were exactly USB, so that the altmode drivers set up the
switches, muxes and retimers for alt mode partners. Commit 226ff2e681d0
("usb: typec: ucsi: Convert connector specific commands to bitmaps")
turned that into a test of the USB bit alone, so a partner that
reports both USB and alt mode now gets TYPEC_STATE_USB as well.

On pmic_glink platforms the altmode driver programs the same mux chain,
and the two notifications are not ordered. When the UCSI connector
change comes last, an FSA4480 switches the SBU lines off, the
DisplayPort AUX channel stops working and the sink is never detected.
On the Lenovo Y700 Gen 5 (TB323FU, Kaanapali) this happens when a
DisplayPort sink is plugged in during system suspend.

Set TYPEC_STATE_USB only when the partner does not report alt mode.
USB4 partners keep TYPEC_STATE_USB, as they do now.

Fixes: 226ff2e681d0 ("usb: typec: ucsi: Convert connector specific commands to bitmaps")
Cc: stable@vger.kernel.org
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 2f9adf4f8bde..395554ba0312 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1356,7 +1356,8 @@ static void ucsi_partner_change(struct ucsi_connector *con)
 			typec_set_mode(con->port, TYPEC_MODE_AUDIO);
 			break;
 		default:
-			if (UCSI_CONSTAT(con, PARTNER_FLAG_USB))
+			if (UCSI_CONSTAT(con, PARTNER_FLAG_USB) &&
+			    !UCSI_CONSTAT(con, PARTNER_FLAG_ALT_MODE))
 				typec_set_mode(con->port, TYPEC_STATE_USB);
 		}
 

base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
-- 
2.43.0

