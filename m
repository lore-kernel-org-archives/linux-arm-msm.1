Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C398B2AD3F
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 19:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783712829; cv=none; b=CEi0RdXm0wyJapkuwReYGlGbuCUBzcQ3Vn5b8SE7E5dE/Nwyc0STCsJy4Iq71Ed1GvPnZPs2HSlR20RjR7zlLzaNJ0ZVv70RWQ0l6Yn2oFgi2o3AKEw+uxwnvc59XVRme2+o2Jp7oBoyiAnhYki/LeLtIUN4t0/Dg59LKIVuUeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783712829; c=relaxed/simple;
	bh=Mm8vmAyeqbEmk4lfT/fA/O5FmMAxOPU4AKwyS6lFPR0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TrHjkHFCy0z6cEv0LIPRP+7G1+XTTV4HkccG3FgTuGCQUnZj4bJZqoCMpabou1Xnvu3EAXsRoltDfPcj/0LLwfsf8w6LXMQWM0ZgIrrz8/icKK5bBLHrwAtx4zlQDNOMZpu07eEuTurxBBndIidTvhamBVPC1THSiZcuccuRrvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L0GLydS5; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0GLydS5"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-383fff6e8b6so127210a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783712827; x=1784317627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ix8W+jjo7ckHJm6uTAC69TwW0JFsA0cAa6gGpTMsiag=;
        b=L0GLydS5q2IHCh38Y6jFbrtMBTl4H3Cb8puJeJEKsgQtaiQdJXtGm1+J8Ta2rfVt6r
         YzzIIm6GNeKzTdme3lgvbI6TMiTgP0FQSUkoIHaFGHKO2ot/zWDblpZNmwmjCp8DbhAp
         Pj5UY/tIjXowC/aFm1l+G8IL7nj3vIw100IzEfxdBW9pNG6pe27pn4gB8lrhX7KXDI7o
         ndDQJJQ9zFvg5dxc8cKmYY2gx4rHsg9nRyUcjpE+Fci3DylLsZh41rt8fn5VzXuvu6uO
         dAJxIvb/U9e01VbOMefKj680NrMT8HMhLzXn2lmkgzGwCb9GOI/why/dVY67HU6+E3ys
         kQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783712827; x=1784317627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ix8W+jjo7ckHJm6uTAC69TwW0JFsA0cAa6gGpTMsiag=;
        b=iO78RE3bSbiGCwVc2xaYm7EN+xsBfbYJ69FCrJeiefVHt1DLslfbHFSw9TFT+NHUf4
         UpgHwOCh31PLFgm5iWhf7KdWMpD2NDDDCSxEtLPl8TfynFdQx7N1xgdXjP6GL9hpzAIo
         bkL67/ykgCpljrdtcrhG7wmNSHQ24onq4lppSpyT8BqtUarmO4FMNSMzUMN8N1Vw1f3y
         8DEDdl7mZ2SyoYEM4je7Jra9luZgjKsu6LcPHuzuRwFHVpr1eXLqQ7v73uJNE0TO+J86
         MmbXw4nZ93cQqLVc5LGxEdqC0MPupzTnmA5INYc7D4H8l+JDuicWnwQSuelDpJETiyJf
         LVEA==
X-Forwarded-Encrypted: i=1; AHgh+Rrt9GsFxhUzWvY5ZCKITZF9eN59zg4FjSC9s/3ec1rS06sx8lFzM9JNcm8AMJoQs88kXFYSyXCgeXd6jYfI@vger.kernel.org
X-Gm-Message-State: AOJu0YwuLAxA/9sfRn7ijOA9E2Bx8tx5ZfXlRpEqno2TsgaJx8bbANBn
	uULMVvMXRmVO3pUHrCL26W1EeVAJxeJVpn/Cz7RlRyZ8hWlSZRU/iylD
X-Gm-Gg: AfdE7clof8RJXsEU8cbuk7/eD/NzaaUSBh9zO3TZxTU/51dkhuJdC+btZBhGspxz7fE
	8M/3F6FgXDqc8lgVckLaCVSBFCrA5mxv2ai+++Dqho9KSHeTk+ZmY51aoURF/+SeXOaoI+HhRcu
	2xM99Ny8loSX3H4OqXWBaE1/dZMh/wETkOIXgmGrC7t6QCCLAAlL77VjDXt4sxxySg/xb8SxpMc
	vyqSzLIGSpAkDIUComITx+f6s1DjJzmWsZnhcYMl02Mw5IoKSxaiROJOxFiU7rmIuLTgYfoqia/
	hNbmeGPef62OmaFZkiqYz70Tq8qjtSKlo4Z8wCU99MS5Kb6UwVhQ21fK6y0Xr43wzXQjgwH5fSx
	1xvZ8D5RwenEd+bYz210AuCu7Jl3iGzLhOVfWrZjVCopxiwC70TtsnJWveouRl+9cxC6A1cpRc9
	K5oLLbPqtQtZ24nGTXys9/YSF/QzP8liUvrlUkuSg=
X-Received: by 2002:a17:90b:3bd0:b0:36b:9323:c726 with SMTP id 98e67ed59e1d1-38dc77ec3f6mr243899a91.4.1783712827167;
        Fri, 10 Jul 2026 12:47:07 -0700 (PDT)
Received: from localhost.localdomain ([202.164.135.140])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311b00048a3sm13699031eec.5.2026.07.10.12.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 12:47:06 -0700 (PDT)
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: quic_akdwived@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sailesh Nandanavanam <saileshnandanavanam@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] remoteproc: qcom_q6v5_mss: Fix off-by-one error in regulator error cleanup
Date: Sat, 11 Jul 2026 01:16:38 +0530
Message-Id: <20260710194638.1502-1-saileshnandanavanam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
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
---
 drivers/remoteproc/qcom_q6v5_mss.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index ae78f5c7c1b6..9a17aa065f50 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -311,7 +311,7 @@ static int q6v5_regulator_enable(struct q6v5 *qproc,
 				dev_err(qproc->dev,
 					"Failed to request voltage for %d.\n",
 						i);
-				goto err;
+				goto err_set_voltage;
 			}
 		}
 
@@ -321,20 +321,26 @@ static int q6v5_regulator_enable(struct q6v5 *qproc,
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

