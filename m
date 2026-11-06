Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793927507;
	b=H5Mi3cfcWZzsDzJeC0FpLT9xH+rpXK+voF2IR5oVDTGgIJwCfdUnFv5R5oMjGK68vD5+
	 4duPv28fuEYQIRn6jtQJVZtju9/e/m9DrMjVU9iLwuUg6PoQmDg33rXgzaHiJVXtyfCWS
	 YbA/kU53tZK71M+ts2ys0U8oUEjmNO0IuenIBDV0S+vPYUC2EjNb5pABPQhiweNo2E4yS
	 sznaZznFnijPU8jurmmCYWhA+/TQa+LUK1pRvAhw4joL6RzMN1Lx6aQ6NEEQB0wfY8g7H
	 WkIxoktlBnLdWzCWx/D0hCIQyyyDeZwu7+noQgwCxC0WQy9NGtEp2pSFgHUeNceQZIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793927507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GZL5lqTjC1Jgati4iALvSiAWsRwqBkhnaBmu9SndnLg=;
	b=fAFFlQiJsaP6J5CkBYLCqYgmiJIMrnMwUIcCli2T/ZBeEWsa3TegWG7dpH1fsOb2XJ9f
	 9RvL6vfutKSqnW8/6J4eYuuhjZ7mLpc/gXAxL4sn2uRkVRf4iJh4vmQX9vnSfSudF49Lf
	 bqaWkmZfGxSp0i6MVSKgGEcdKI5E6DfXc42MEYBtiQZoR95eKmY1Dv7Sra5JptPzXeG4U
	 qrTbgo+URKinCYJTPrwl82bWxxtdpSqKSTzWJQiqTFvJh1FEG9hH/N4R/O2Kkyq6uAr2f
	 jErDBcg87VrJ/PS0STXO7rflPFnm+/DI4gy7P6JTkjJKRLQsQGaGUUtt92tfkVYyGHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0MOtiv3i;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC4A606A326
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 01:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DC4A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0MOtiv3i
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a064fac8cbso77436b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 17:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793927506; x=1794532306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GZL5lqTjC1Jgati4iALvSiAWsRwqBkhnaBmu9SndnLg=;
        b=0MOtiv3iWf1QtxQ83Olzu/LfTVDWge2dFioij/uMULXw9z5lD7Ft8X12QL/aYDmGor
         bmLe06Jpn+jMEtvSso8hzII+9S+h8GWNIAOk4bBOU7CWdj4GEKUi/2/uP41v7pp7xJ8Z
         m4jh8bAQZ48LQp4PFLMLXEb38lOCdkTLhEieDuFXHFzfjfgS8/TDPgcTJdg+FMcC067e
         WKwTfJvXMZtbyB/j5Kr2MLZP5rGWJ3NSdMszHSa7o1+yFfqaGAtqL7DaX4TkmoOlGIBf
         EoVhs0lAvp6dcL/j665WjkuKoQ4Kp0ebKR1wvJveGxIar1zAfHf6mgnDf0jPerB4yWV2
         /AJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793927506; x=1794532306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GZL5lqTjC1Jgati4iALvSiAWsRwqBkhnaBmu9SndnLg=;
        b=d2I9bYPUepQK9XNgcwQGlCOluPuWJ+7dNDu+i8C7qtM3ff4bJwyl6EZcRI0729JkSH
         5pPcoKn7Ga3ZnxC+dpCFMDP2GFyfsVAakcddyUrc3CgcOPVJ25h1GwCG37Pit06QKjos
         Taje/UgvtFBC501UbDqLAwkbU9cY0XLh713nifTUCFvs/3RoNs6v6uI5ntYZ72o1HmEN
         ES7gY2SD2lRtFCoHNegeA4+8ibDaLRfOGfEM6W9Fj2Pk9GuocN2e11Ad+pDt1mDcpeIc
         JNBJIIXPLTbIXycbh09PONj6xKbEQXh65xd1i8S78KNJG8rOJzEbMr5GIr0E+XxQit7r
         aBnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQ6NB1wLC4Pdru1jdnRSwx1EMD0oCvjrfFxWSFt3g51g8uBC7PWUlZp7DI7S1+O9nTuMSHlfb8IONja2Vq@vger.kernel.org
X-Gm-Message-State: APuU4Z/1idML7bdF5AIJKZcczrR3D7mAp1CXG/FBGcRu+l27MIwqbScS
	NRzqCLUzfNF66Fh3UJ0/44kum/XCUfvg5Yvou9hotYoSEl5FLy5ufMEa
X-Gm-Gg: AYBFou2+RWFislunWESpJ12uLkLR2s4ifXe/pvffv/9lfXJ0kg8lAvrpVI3B0Wg/kxr
	E4mztwkVl++t+uE6ktSO1qZi+VtHPFaRAKJ+2LM1B8cUmd9FWWCPvPnu157IFIq7D+2v+s+jvGg
	IfVbOYAiCPFSvzijWehKm/kLYQo+NAPDjMAcyJwEpytuJ3hdzddWrdvDtzQWMYGRrp6c0jrnZoQ
	cQz9NnXR53zQNWW0ceSwswJMaPrpcwMUq0iovRh5w3SPHvM1oevB34XJv5iJ30vBc3HHMdOEdPu
	yaifZ1KFtzK8YoGLYJkl/SfMDPM9pyCZm6KSf5hpC09klgCZm50iEtQxP+u8Q29+uYbVb+WAOIL
	ytfMGxXIGOBsP1PwwbppHeYmiM3WLpNrcmw2O4KHVFzl2iwnqB/fv7MvzKUuBMy1vQkWuemyADU
	Li73OcRaGORlnsMwZw8vRUtI82mE6GAWQZM3PGewRlPqeiLzDgH1WTjhPTZpW7hqzE4aRgd53u9
	05JrfL5vDB1j+iIP0Ti4R7br5ME7x50YO0ggJCczC7AvbO2qfH+kxgvcrOIcKXVakheAphXrIYP
	x+m7PSt2yBjmGilfR+XlTz+GU+QyTnvGpeKy6gOBI8VbGcW8NNvFb7eUi8GGbDRAwlzfS/Bfd/q
	Y9foJDfJjl6DVT5HsEvaRUqNg4QAzeNdR2gsTF3pFQuxC4w2P61BN5mNkRYnHb/Tzi7tEN04nnH
	yHIg==
X-Received: by 2002:a05:6372:a746:b0:3e1:d13f:5fa9 with SMTP id adf61e73a8af0-3ebb2adb8d8mr1125325637.73.1793927505756;
        Thu, 05 Nov 2026 17:11:45 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70a78837sm58427a12.23.2026.11.05.17.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 17:11:45 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-phy@lists.infradead.org
Cc: Alban Bedel <albeu@free.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] phy: ath79-usb: fix the suspend override reset name
Date: Thu,  5 Nov 2026 17:11:42 -0800
Message-ID: <20261106011142.516478-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The driver gets the suspend override reset as "usb-suspend-override",
but the binding and both device trees that use it call it
"suspend-override". The reset is optional, so the lookup silently comes
back empty and the suspend override has never been used.

This is the same binding update that commit 827cb0323928 ("phy:
ath79-usb: Fix the main reset name to match the DT binding") followed
for the main reset. Follow it for the suspend override as well.

Fixes: cd3bf368aa7a ("phy: Add a driver for the ATH79 USB phy")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/phy/qualcomm/phy-ath79-usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-ath79-usb.c b/drivers/phy/qualcomm/phy-ath79-usb.c
index 09a77e556ece..8e9565846b2f 100644
--- a/drivers/phy/qualcomm/phy-ath79-usb.c
+++ b/drivers/phy/qualcomm/phy-ath79-usb.c
@@ -74,7 +74,7 @@ static int ath79_usb_phy_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->reset);
 
 	priv->no_suspend_override = devm_reset_control_get_optional(
-		&pdev->dev, "usb-suspend-override");
+		&pdev->dev, "suspend-override");
 	if (IS_ERR(priv->no_suspend_override))
 		return PTR_ERR(priv->no_suspend_override);
 
-- 
2.56.0

