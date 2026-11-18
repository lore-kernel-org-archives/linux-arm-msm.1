Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795024446;
	b=VToJ2eiUoi9H2n1ofwXQuUwsSAwYCtSC6zQsMwdq/ssuGea7+WR5n1VIvQ1DZud/zJSw
	 /SLtWre3De5IjqoL28Ucu0+20jMXeNFOtF7K4rzQqV15KTaDvfHzXwx1jxezy49wbtDPi
	 pxBSpuKJj5CsVsVf5EVfiMiKj08QOv4A8lCZ5t7pKdurdwl4IIKFBLpPvxlFuRqTMwU5d
	 Z8Vm++u5QzGYf/GdTD4PBDf/NGEpX75UzjN1uLA0anYIpS0xG03mCFMyZXwXuAdJD6Whh
	 vvY8QiXlfg6U5ngT5j+dlBFDXceC4X3jGe/onqKzsx1SYorqDZ0CS6JAE6KZt2yFjmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795024446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QqweH0pYyIm/pZwPzk7IcmA/lXOB2dIrOde0Tai0CcU=;
	b=1VScgN2tl4aozcJS3gXfgbyHCk4+88ETAxDmPJ0yM1tclgHf/kqFEboqJSFB2IBQI8rX
	 jdrpp/xpM59BeBbuZA8sijW97V8HPwJOkkzMNni8lZHhDnOuyPoa6Pdv5EWENLdMLZtVV
	 hS3kXkTd/pMVB12EzTfHcT8vOdfswGXCnrpOoPQYHYXttdwmFyo7BV1/z9ZpX1sWCGcPQ
	 XslNsc64y6EekdJFaMyj4GJ2NX7bYnGkJRKp8h0w4IMNqZITFInafCLqoRpwPKO5VvJBj
	 Gd25CEFpdacCl4Vrcc+dCZW0LgAJrdLzv4AQqp6PdWlBLLKHqqGV26PiAA+AQdLpr1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nPmfWjhF;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2118606A332
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 17:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2118606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nPmfWjhF
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-378915168c7so118502eec.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 09:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795024445; x=1795629245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QqweH0pYyIm/pZwPzk7IcmA/lXOB2dIrOde0Tai0CcU=;
        b=nPmfWjhFSXKVsOedyCpWGxiT0bmkvZTBxQAIoH3WOGQ+Tkpav5ZboHgU8H7zmbfgK2
         oI+BGSsLQDxb4KMhZDuvQGVWTISfprhkwTCgbs9EqjqELWCn+GYEkHK8B4jpo0seRq/7
         Lo52EaLrsc1kkTbyXs15jn9zbI+x6kVfNxsZuG3E18VGqPSN3kN7EzRUAU7UGVN8NmGW
         8z1Tq6YnQo6vsY+PRUdTswyX6WEonDwPD7kF6ibHYWMoHY9VHxTOuFcQ6jxfZ9+0Sien
         +D6AX0Ts7YOfA0zFuRP2DXyP3tDrCkyn0a9SRuUEYSG/W5pITNRbv7FBcNp43LyQiYRC
         6CGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795024445; x=1795629245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QqweH0pYyIm/pZwPzk7IcmA/lXOB2dIrOde0Tai0CcU=;
        b=SmWiMtiFg9MDcqmmMNzxBOS5vspJCZUMf89LGG0PTYGHSseALApO7K6AAX+2VDaHqY
         IPLiPGGu1fujKOd4Mj8z1TQ8Z/ekV6OBV4Kijeh9T6FHQcMpXEQCmOcly/2QSKtv0l0W
         v3o19hj/nhSIJt7AC4F6J0DlAy4lepfRuQXAq9ez6d+fe/VBuwGccI8917+tJLBBze3f
         UlJ4qAk+8N9CX+UnL1PGnl2n9FGQON9yzsObE9/qfVAY9MeWtZKOH9pyKzdA8uJGAAh3
         tUoRh3oTERDoiRKv/NpxMbP/x2QbP9o4IlNFQqcvCbTwZETZspgzhDxnEMQ7r8TW7PZh
         D9cw==
X-Forwarded-Encrypted: i=1; AL+hErHB+6xGBT3N4XclJYPKos/NRJ0Yg+V3wpAoTqyww+6QbmhAMU/P5KQ5PK3uoDf3tzji27SDl8K2hOXxKEhI@vger.kernel.org
X-Gm-Message-State: APuU4Z/nY2HgTwjdEQqw6NuZ2PtFdV1bOFdPjwja9ckB6VTKnTbqWUIH
	+2o1WNgVZaNOYpyzDkck/VXckh4ARVX2zdKs+ceCNwQH0rlp3MStb9+R
X-Gm-Gg: AZFdTZcsGg6BUUnbGynZhcOJtTzWf3qaG/KwCtVkQPUfxOSVw+tAIrVv9GB/bsZXari
	S7hK0YtxnFMI2o76LhMA/hWSmFBS13WSgXers6RcYcc9675XGryOt7MDLUnG8Pbi2bSLSfij8QS
	8xV503G00gRK1lbEtcZPSgk4EMMbxJjsxwltAXtQNEK0Z6x/Kc9S7jhgp6WokVrzYcahqWDjMPn
	u03F74WZ+kJ7+thk2GYSZje7u79Akl6vElwajxB6VDyL6MPWw06YT2SD6u/OyIXhC2FZz8rR88i
	aOkJIQfPiCCZRxLseYtaRBt4IvRM+oHShdhka5vC6TU4XojxAM38tdramD6LESdruNBuV9c4lWR
	/iKEba540fFH6457Ju+2X9bHBaHYLHJfA9dDxkLaNGMncXu7k95c9WZOvMFDAY3kdrhlmwvm5OC
	yZFSXpUPwaegzmLFHxSkrxq2or7/caGtUwQOcXyEOHhWnPnOvrNJsv1V3vNTyIZbhL6qyU7X/ml
	BHINBS+FTmWWU3gq7+Yaqz+WkY8LteAGqzbiV2y0pzzXil3h7B+SSVKcuKD+ibhxg7MQRPXILny
	XyIYOHWH9qyNDI9YmfqAeA919PbrsTeUXa5OyBlD2QmKtnir17ascQ==
X-Received: by 2002:a05:7300:c595:b0:377:d6e5:e642 with SMTP id 5a478bee46e88-3827f98fedbmr5064472eec.1.1795024444661;
        Wed, 18 Nov 2026 09:54:04 -0800 (PST)
Received: from localhost.localdomain ([38.254.175.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a79c96b2sm10352900eec.24.2026.11.18.09.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:54:04 -0800 (PST)
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: quic_akdwived@quicinc.com,
	dmitry.baryshkov@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sailesh Nandanavanam <saileshnandanavanam@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH RESEND] remoteproc: qcom_q6v5_mss: Fix off-by-one error in regulator error cleanup
Date: Wed, 18 Nov 2026 23:23:54 +0530
Message-Id: <20261118175354.42351-1-saileshnandanavanam@gmail.com>
X-Mailer: git-send-email 2.34.1
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

In q6v5_regulator_enable(), when any operation fails for regulator at
index 'i', the error cleanup path unconditionally calls
regulator_disable() starting from index 'i'. However, regulator 'i'
was never successfully enabled at this point, resulting in an
unbalanced disable.

There are three distinct failure points:
- regulator_set_voltage() failure: voltage was never set, load was
never set, regulator was never enabled.
- regulator_set_load() failure: voltage was set, but regulator was
never enabled.
- regulator_enable() failure: voltage and load were set, but
regulator was never enabled.

Fix this by introducing three separate error labels to handle each
failure point correctly. For the failing regulator at index 'i',
only reset the resources that were actually configured, without
calling regulator_disable(). Then roll back all previously enabled
regulators using 'i--' in the for loop initializer to skip the
never-enabled regulator.

Fixes: 19f902b53b47 ("remoteproc: qcom: Initialize and enable proxy and active regulators.")
Cc: stable@vger.kernel.org
Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---

Resend, rebased on next-20261117, no code changes. Reviewed by Dmitry
on Aug 18. Original posting:
https://lore.kernel.org/r/20260710194638.1502-1-saileshnandanavanam@gmail.com
 drivers/remoteproc/qcom_q6v5_mss.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index dd052a62b858..692cbdece318 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -313,7 +313,7 @@ static int q6v5_regulator_enable(struct q6v5 *qproc,
 				dev_err(qproc->dev,
 					"Failed to request voltage for %d.\n",
 						i);
-				goto err;
+				goto err_set_voltage;
 			}
 		}
 
@@ -323,20 +323,26 @@ static int q6v5_regulator_enable(struct q6v5 *qproc,
 			if (ret < 0) {
 				dev_err(qproc->dev,
 					"Failed to set regulator mode\n");
-				goto err;
+				goto err_set_load;
 			}
 		}
 
 		ret = regulator_enable(regs[i].reg);
 		if (ret) {
 			dev_err(qproc->dev, "Regulator enable failed\n");
-			goto err;
+			goto err_enable;
 		}
 	}
 
 	return 0;
-err:
-	for (; i >= 0; i--) {
+err_enable:
+	if (regs[i].uA > 0)
+		regulator_set_load(regs[i].reg, 0);
+err_set_load:
+	if (regs[i].uV > 0)
+		regulator_set_voltage(regs[i].reg, 0, INT_MAX);
+err_set_voltage:
+	for (i--; i >= 0; i--) {
 		if (regs[i].uV > 0)
 			regulator_set_voltage(regs[i].reg, 0, INT_MAX);
 
-- 
2.34.1

