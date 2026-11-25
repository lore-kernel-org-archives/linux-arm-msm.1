Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614305;
	b=jvEmEw8oTwj9ChvvBTV4OZP4g734RXgbozbe/nUwkU+3kslUXLek7ELu0bPt/bXZ8f9T
	 U94DVu/ojzHOuwrXaqyQ0n3s3stZCtIvbprBJXt7NTUr78CNEepdZhrbTdMWZe8OobYO3
	 YFHco7dWvC6Vkxikzcv5QLG1qXvPaJvhmd9nrAEjkSFgyihbMvjkvgh73CU39L5J1aDpA
	 DNiMh589IMMb1gHi1nEUx+Y0QsRCGx8snKxwOXWLNO7a42SZBFzuEGVT9QLHRCjNXlIGQ
	 9IxnBkbbLcThwNmR2ieVkeDFnmBO7KpQ0s27nSnyT4bTFhnuBGz4tNzVs1uEHO9LUYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=s0Od9VH9UpG5Ndkdf4jvk5NSEfMYmhVaO3t7hSReGUw=;
	b=gimV8oNcsAp3968d35m2t4XT4Wh8OeVF+L+G/wETGq9NNmFORzvssDKdhWW3+Mt4zKzb
	 IM/WRF6/VznYcNf1J1aP/ercSZPXG1dF26KXu2PleYxm19cv1s9s+q6pqbguZ5FFrM8Hh
	 pC6VwbmIkdhLtYlA/GdHG1JesmZLggLOLx/FUNtVO3axq/sSyrz3RuWHk/moejpL9u3ci
	 7BX2Ua8NcAyO/p/O5wV/x9CzyXazQpB7l8dJ2rVs0LpvLpebr0iKW/+YmjYlEnD3ck2dE
	 tUEKIna3dTAZPNnnawLRkEJgwvT/XEzrc1GA5sFUHNtJCzA5L+d4AsqWXDs9q3xktfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xozhstFc;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D73606A32A
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33D73606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xozhstFc
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3866a784546so7734128eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 05:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795614304; x=1796219104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s0Od9VH9UpG5Ndkdf4jvk5NSEfMYmhVaO3t7hSReGUw=;
        b=xozhstFceUDCgTCb5vaNUNE6gMRbBiSjCVklJuYVVgPuXRfzJBv59Wucpx59B7zIsK
         0jBXqTb700ESRMytDIinZGHF+Of7mgqeaIDE90RArg65rKARxuDitNkVtbrBV3ztlJUu
         Q6N6OFX0q7X+B2zJLEHTQsjqAWIpUV/pY1bWQ6k1senqGDAts8g8Nw9Z54VFUoYMQyHc
         OAMo35Dlp0aw2lvy+wp6XFX1qkd6ce6vICvoQAF2VJMpcuxeVMvlyEsi2/HVQFXF839o
         /vMZ3R8zDVzJk+HJw2bsN00TgklmzBv+MGeaiQQzzdKe3l3hvonENhGYhqM6huCpd/TA
         jqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795614304; x=1796219104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s0Od9VH9UpG5Ndkdf4jvk5NSEfMYmhVaO3t7hSReGUw=;
        b=YHF6lzOsvJjj89D5cAsPzMD79fageM/AruP62WmbcmaujrAgow+Do1RXvqikqC3fYC
         DZ5uON2DDmCAtzupyUKmE19/mNF0MtU4jO6b8SuU+MOPjJ5TA0rf55/2pWj5m83Iho7O
         wi8p6yHTarUjYw/1i1sX3CYjGS8Fp4Qi0ClKCxewEwn9hWjaHJ10K5PlafyyraAl3f5g
         YeNutqI18f/zcfIzfYeI/PrLL/VCnzE7jr7QTcs0PnmhyJNRuxVfnC7BOjO/G4ZPaQm9
         tq/udUZJR3chpbdVKndIV5/LuHfh0w9muLCoOIqIhTDt4XlYFufBiTJbbcG4ft7ga1aL
         I93A==
X-Gm-Message-State: APuU4Z9wtq1fYtLuPc8ufgHPxCpa3fYmSkICJ2yuMq6EYDSmVnGFsT0z
	KF7ZlAVS7/RO2galrWCzcv1VuSlrGw5T1mjPtPz8V5zmKHAiKw1w/FFL
X-Gm-Gg: AZFdTZftBH4BpmIQ5s2Q73kFSWggUBwd8quZ4LWidohEbsvpEHrK96tzkCV0gXo6G55
	x3UEj6EY81kAzdKH0wrrwqn8GvbzI7ejzCKafzVtvrt/spch/fTHHv2uur9IedBj6Mrqf2D94TU
	hwBBO+MW/+A9XpTg6yjUfJi97J5CMUxBwLyEWMeaRuYZpEjTUIRfzwfOac6o5CUJe5l6LoSJqdr
	61TCWrCRfIMf+1C5ZN0qeZ4Vx2G/ygs/gXM9YND2hRpHX++YuEwlB+6959RmCy3YZ4av2Z5Rky1
	24wJiRuRYTT31EyNtKPT2cJMlOa3tzcnZFE70QYyek6dM8YOnRanwE1yWOwINqi7Dz0lURuX89V
	xATc1C7PP7eimsZrEJ0FgNQ4/tdNqlwqWDDvBnHIWO3KTYCVuE2yioiUOcFFQYRS5WVHdJRgXA5
	vfWuGa4B+GpvtsRDLg7+dDDSkhoIWkOxl5KvF8VUACNTTxHvAUpGmElI5DlFdg1SrF7Eq9/gi95
	JF4f0eQvAIjYKIb4wrIzB4mzKmY72aaXasJmQyide0zTtgWIprh+E8zRH1nm4fboLwiUayKKjU3
	9/nwWq6d0CyMo0HRlMNYRiYEpL7UMWUfnOGqEam7jX1yvmQ=
X-Received: by 2002:a05:7301:46a3:b0:369:faa2:1fb2 with SMTP id 5a478bee46e88-3856f65ada3mr19391252eec.8.1795614304136;
        Wed, 25 Nov 2026 05:45:04 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm51101413eec.7.2026.11.25.05.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:45:03 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: qup: do not disable the clocks twice in remove()
Date: Wed, 25 Nov 2026 20:44:58 +0700
Message-Id: <20261125134458.2704674-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
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

qup_i2c_remove() disables the clocks unconditionally. If the controller
is already runtime suspended, the suspend callback has disabled them, so
they are disabled a second time.

It also does this before i2c_del_adapter(), so transfers from client
drivers in their remove() run with the clocks off.

Delete the adapter and disable runtime PM first, then disable the clocks
only if the device is not runtime suspended.

Fixes: 10c5a8425968 ("i2c: qup: New bus driver for the Qualcomm QUP I2C controller")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/i2c/busses/i2c-qup.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index 731bce9f9a92..f61ef2d3a10d 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -1960,15 +1960,17 @@ static void qup_i2c_remove(struct platform_device *pdev)
 {
 	struct qup_i2c_dev *qup = platform_get_drvdata(pdev);
 
+	i2c_del_adapter(&qup->adap);
+	pm_runtime_disable(qup->dev);
+
 	if (qup->is_dma) {
 		dma_release_channel(qup->btx.dma);
 		dma_release_channel(qup->brx.dma);
 	}
 
 	disable_irq(qup->irq);
-	qup_i2c_disable_clocks(qup);
-	i2c_del_adapter(&qup->adap);
-	pm_runtime_disable(qup->dev);
+	if (!pm_runtime_status_suspended(qup->dev))
+		qup_i2c_disable_clocks(qup);
 	pm_runtime_set_suspended(qup->dev);
 }
 
-- 
2.25.1

