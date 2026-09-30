Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899424C8FFE
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767015; cv=none; b=grKhlD4HlDxOZaBhdqNOxLMXHaUSgjHfH2MDY5XxbEDe30JceQmcdNYqYW47FSROaDtpS+orjc45Zf27MHdD3iowH73jihHnsxw8aZkYsv3jI1NfLOME8LOnT0YLzk3FnPR3OvLdPeXEaENsdTtEtcnw9PMj+GuezIFqhpA6ywY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767015; c=relaxed/simple;
	bh=PTm7KfAf22Pq8oTJK9JiCTt7+1syK75vpiOwmFtY9J0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J72IkJgW8o/2iITK7ZtL9b9lDoHqNBWezU4sIUNZv9BW70Z8qe0LigSt7BSV+EqOLroznidCyJOmuJlT4T+mgnqQ2ZEHEp41Vs3liVvjH1Pmnkq/Wp5xPJHRDGwKOfmq2UVbTLAwa9/VlkL6+TgcSgayejyoXCSUc6FlnsHSK/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FUvQzYJe; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FUvQzYJe"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a498cb99b3so972113a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 04:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790767012; x=1791371812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wY93XBZD56JE3eyu1OkHEle/LlbtoW01BFCKk6aYmNc=;
        b=FUvQzYJewIwlr6o5zL/7Vg5RevxVcyF8QJ3I+yogBzB1R/B4ZN1xDLpG0gKYTmvwUj
         YfPtQ310owCh1dWR6H+YvKehCnuPF0VthJ3IWL+vr3ubtkW+wWV8m9n0tk97MIH++6RR
         JmrOWoPwfikZa8JAd1fmznCHBol9FBxsOY7QFA7UdUY19u46i/6QoyQrJpys0hsonB/F
         uCG9RMMcPyUbPLTmWMCKyJONY3dyWFY0sH061xGl28Nn69iPJLLYMQKxce8gCbw8o9ie
         7bOrbW0MfWCQxuucAbqdY2S3ClqR4zIb666W40k4MUwc9kIp5NiX3kaZjTQMch/ltGmv
         bsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767012; x=1791371812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wY93XBZD56JE3eyu1OkHEle/LlbtoW01BFCKk6aYmNc=;
        b=IayYlIq5wnCZZys1GP8bT6NuIgpFKkpvoq4PibVoELK5MwJHBhy3tcwdWAkhHpVlO1
         yOHOuOg67r48Nfal1OooaGTr0TkVDiXUGv8+YFVkQllIKdLbPwR+SLzp/voKqhwCA29x
         HAzDip/27duJNTPSc0NvZ7b3c4MnXGsflp4Zd3iFd0HnChyJJbWqwaAXm0ZmrY95ABra
         5Yf1kbZWjolMvWxGVE9X5fWdVEJtvc1vFixKAUlrLdp5bLXQ2dRn+O+LmFUzU3bTCZnd
         qvt8XHEXQgfDzFYVPGm3otmBiDqQbGQ4rV4KiWiUcP2aK0os+N4Bi919wsT4yAfaJ5bF
         FOKg==
X-Forwarded-Encrypted: i=1; AKwUvBy28etvDsJ2PIFyrnxTdR+RrSvg4zNUfCNHD9TgbjJpfV8ChGg562g7jSdIDAEIlOm9E/Eun4wELl07LCkU@vger.kernel.org
X-Gm-Message-State: AFq9FYIPlA26+uY001THH6KzcPaV2ImTDhT0I8MzLzy3+QWdNkelRN5r
	CEzxW5SvWNYitos0xbOROCUcdU35bsnimeNxX8c3goT5uLrnLDtN0120
X-Gm-Gg: AYBFou1AP71ECARCsnPqqPEYAZsaKNBg2pTzzyDXycPhRCdel6WUfhc3v5io72akc7a
	rzrpR2by3KJlJSfxTUM5VhdXOK1aXAZlW/qdRY4vTtXE33Gybi1DGR9j+GsR/skJOCevOSYRoug
	R2US+cgn1o4gK7C+guv5LCaD4Vg86SXFNjPK4pGki1FNSKSlcrdJJ3R/TrToPR0R1jEBbbh4Oe+
	cBd0gtwa5Iqi7kT8sbX2LgcfI8yXSj/F8zazI3RqIS2hUd/pkLL4gp1WKKMqJCWnVCjGvBreDif
	qsZx29UO49N8YTsGBohnldBU3VIc930RZgblpf7tishbtciZ9x0JdhUInzEBAZullKg9LX4iLWs
	tF2AJFMgO79bMghx0Xz49D2OpbehJGqhmihIc48jWGMuH6M0p7YNrcqWxwK1DOo3P+I4PlqGacw
	VlvP8lQt7lqzu2IfOwDI0sBCwWMiMv3em/LBZ9jDo4zbJ+AkTkocfMztRGP1YMn2SItc72/SCn+
	X3sqMDxhhpmv9G0sltypJTzuZY5588tP108EEoiGkvXeb37JSJYnnCnnZDs4laDr7efe9kKWcGi
	HjPEO4dT3WNvWJWrcsrFJs5IAbVZTSPKFdxn2uzyX91R0A8=
X-Received: by 2002:a17:90b:5830:b0:3a4:a045:27cb with SMTP id 98e67ed59e1d1-3a4d193d3a7mr590091a91.46.1790767011654;
        Wed, 30 Sep 2026 04:16:51 -0700 (PDT)
Received: from rahuls-x2elite ([110.226.112.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ce40a6d5sm2873273a91.15.2026.09.30.04.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:16:51 -0700 (PDT)
From: Rahul Pon <theflyingrahul@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Praveen Talari <praveen.talari@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: qcom-geni: release runtime PM reference when set_rate fails
Date: Wed, 30 Sep 2026 16:46:41 +0530
Message-ID: <20260930111641.1134-1-theflyingrahul@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

geni_i2c_xfer() takes a runtime-PM reference with pm_runtime_get_sync()
and then returns directly if the set_rate() callback fails, leaking the
reference and keeping the controller resumed for good. Route that error
through the existing cleanup path, which drops the reference and resets
the transfer state.

Found by code review; compile-tested with arm64 defconfig plus ACPI and
W=1.

Fixes: 10e74f4c5046 ("i2c: qcom-geni: Enable I2C on SA8255p Qualcomm platforms")
Assisted-by: LLM
Signed-off-by: Rahul Pon <theflyingrahul@gmail.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 6a39e21d5e..ed6495ef81 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1003,13 +1003,14 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 
 	ret = gi2c->dev_data->set_rate(&gi2c->se, gi2c->clk_freq_out);
 	if (ret)
-		return ret;
+		goto out_pm;
 
 	if (gi2c->gpi_mode)
 		ret = geni_i2c_gpi_xfer(gi2c, msgs, num);
 	else
 		ret = geni_i2c_fifo_xfer(gi2c, msgs, num);
 
+out_pm:
 	pm_runtime_put_autosuspend(gi2c->se.dev);
 	gi2c->cur = NULL;
 	gi2c->err = 0;

base-commit: 551c722f40809618230001baccf219193e22fc5a
-- 
2.53.0

