Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797229;
	b=sLUTaKaLN9iL+AwYBF1aFrBfxmTgSQzBbum+VEKxXFe1YoD0p99J3kCFggazRcx/1o5A
	 WH2xsgvUSDpFBgVr+FSdHF3v/pbnOsOmHQ5xbmCRI5i1RxNNbvfsanYn7lP6cpJvGb8yr
	 NrTzDIynlHgVa4yeFSjD53r/nFTR/0w9npD5kb4L31ietafFA/XDSPru5rTRGEW12nyDQ
	 HRNMmcVnnlFaKZ+fPU2GoKSYK0//WEIyHhzbVUXB8QcgowH2caU8p2CONaa71ExodwWyX
	 OvF4FgR0O3FDXZPWXaypshqA/pCFTC/D7Rf8tUU/AFXj4kCQnphn/TvAlLIYcXIe9uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IgRJMvkMbufLA4hYRamTMgpsDzcIpVPimViHdBYnCW4=;
	b=zMtIMZS5T15VN1XNR9yL3huPxfFpZkql9vxlLYeX+5S2asITCMkfIVRDFJFM4zpQydo8
	 SLB8c/FtCbhKifFYmPoFQjJkfBX6sPn4ZDAawK4s9kHoJyqvmlKyRRCuKDpCkFbHLLAFO
	 Zp6CeRSJ2waT65hVsDKa76ATDR05Z/MjdfoAhrQ7cGF4CTA9xaO3MTqy8ahyIiRPQZ36G
	 /ogTPBuuHxgbCYUd31+23Zs9G3Yw6gpW9Ax6eOlfUOFnsmzBBXTpmy2tBFMX9pwI9etHx
	 4aWS6RDV6WDGAy5sbdVOda2OmGg/nc70lWTl9hODY12Rz31qZZTta8FbCIbybLahK9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JWX1OApr;
	arc=none smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B3D606A328
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 13:00:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2B3D606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JWX1OApr
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be41a7aba4so100239e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 05:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793797227; x=1794402027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IgRJMvkMbufLA4hYRamTMgpsDzcIpVPimViHdBYnCW4=;
        b=JWX1OAprnVOLO6VQ0sv5Nf4pRSy6czws29BzVZ4JiHbyKdMJrNtr2wPYTJrVOVALZK
         8Mv855CJLze2XCpsopAl1kNQ+6wxyg7NT7hs/xJI2zmXEjs2Fthf4/64iqdlAkjgWUlv
         prGcMjbpWw04L30GGSMCQG35YI30J3p0cSj9gRyd4AybQVKlRsYcjmnDXedM6PKuY16+
         s90Dv1jhSPTtnmsNjJUvBmhxb9DitJc5RXCNk4BXDeeXZ7npou1hpSneqvn7jiSr+dkN
         TupmKTDEQWZ7MgQ0b4RrNh0nRAi2R6BvZYF7cpB5jCn1nJmmAPYmXPyPTEK3xZXHT3fe
         qk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793797227; x=1794402027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IgRJMvkMbufLA4hYRamTMgpsDzcIpVPimViHdBYnCW4=;
        b=xnjsdStjSSuy2Ow5erD0tzTHDG3Qr3YbSDkkgcdHd7NGnUlOGH++50cDEP/T9ISv1Q
         yE+cHp59O9ZhqUAYPd+HsuWJxc/irMlCZ7YnsKWS8DZ2VfdwBbbddkW6s7puI4aoRKOE
         Yc6xoHb1IKNLqA5/2PC5RCsnqJvEpqGygJtkY/4jgKkF49FwglZ1c4EoehYljztfsVCC
         BmSpjMJBXQTVw1ch7Vn+ogWdGNkiEzQML5AJUhiwYEEOwQUEYibb+sIolGVPa8Gao5Gc
         B48LjwKLUmtqEg7rCpjdxI1PSyBj8GqdG4dA26x5dsXl83hR0vBbaHODratWbZn2S0jw
         L8sg==
X-Forwarded-Encrypted: i=1; AKwUvBzfXlw4N7tAruYCFg8eEIDvTnQPWalw1rrJHzPdxdnSchuAfjQrUCraDsmhOL4gH3QwRGae8tiVi41D63J6@vger.kernel.org
X-Gm-Message-State: APuU4Z9Fg20ivSwwMApJT2oY8jq4g8KjCI59/dQvvlOmkAzNZ/y1Nfh5
	KQjyBUT69SxBNbfcLNoVnoRCo9eKhz7CYZ5wcaxNwpNTJMDXtWuKOqbR6ZsYaTOQTp8=
X-Gm-Gg: AYBFou2wiesNun9rk+BEEjxJfr7YkaHG/XG4ebef4J4qazrwlVFxHueKTDFbgfwg+aK
	rf25C8fitmm/7DBgi1pDfPshWVkFNs3ESuz0f8SNZCLLrqI0zIWmoi5bODNMZefM4eJQruPwvQS
	ZYgFJ2IKPBFiaguMtsYZLVT+GOSz5bOvv52egoKlLu+t9qyY09myWZGexwfb1n43jt6K/w9XsZd
	D/5onIelDAhnekhbWUG53HdanQr1XHi5nD7vdajPh3nUdFaSM1ND9UHOmum5LKAIEhsGF3yi1jA
	bk8VnH4ViHRaIlhaIZSt68/U2mI2xnuDG9TpVCzWPpsapSwPNhdUebkI6HZxO/XRJA5SENHKhaY
	dRN2KzNLPo8z9hjgNZz+mZhVQ8CPbRgEc06U8vdxEIP1s5XRO62qf9lTtsnjQla6vZIy37Up359
	MJUcrrfF9dL/sCb08zNveo4tQBs/MqEw6+37W60ww/gpPr7pWWfvlvoDth6W+ctVXse7RILCu2D
	Vt16eqA7cm4cGjLNOWhKvm5HsWfoAmo3XtW7o9eU8NstoAB18Y7Ij1KyFDi/3D1jmfjHmYwXVN1
	IjZnR7cSTUm5sSYwGwAo57lxdat27mijK4SJ6bCCeIeB2DB/tSUwfrz4SgxMETZbyDdrSd8=
X-Received: by 2002:a05:6512:220d:b0:5bf:b8f1:80ce with SMTP id 2adb3069b0e04-5bfd9578721mr5782338e87.5.1793797226857;
        Wed, 04 Nov 2026 05:00:26 -0800 (PST)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff384c93fsm375948e87.10.2026.11.04.05.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:00:25 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] media: qcom: camss: Change CSIPHY device name from "csiX" to "csiphyX"
Date: Wed,  4 Nov 2026 15:00:14 +0200
Message-ID: <20261104130014.681769-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
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

In the CSI2 PHY mode CSIPHY devices are named as csiX instead of csiphyX,
which is inconsistent with the legacy CSIPHY mode and CSIPHY media entity
names, and it may be confused with CSI decoder names.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csiphy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index f99eea2ef228..dcc005674d8a 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -839,7 +839,7 @@ int msm_csiphy_subdev_init(struct camss *camss, u8 port)
 	csiphy->id = res->csiphy.id;
 	csiphy->res = &res->csiphy;
 
-	snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csi%d", csiphy->id);
+	snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csiphy%d", csiphy->id);
 
 	return 0;
 
-- 
2.53.0

