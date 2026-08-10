Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932903BD22E
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 10:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786359238; cv=none; b=Iwp2ZTMxgM9vYU+m/8pCqEYDqrG1rfmVlsXzHHaxYgarV0j1QO7yIYeSvXiXLOSkzGnSB2MzUJuMnuhHYEEokhkgLaQsppukNB6yj+X4srGhGFMtQClzHfUe1bZtTUMbFZXIIRYVtmvVln+CUiFNTTXNrs6dT5CIgNurIaE/XRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786359238; c=relaxed/simple;
	bh=G7eP5YCSI4SzGzvGz5kC/+b5PLqqfbdmE9HFSM6UyJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tvSTm6tLduH3pNeAKUNSxrmFR8SQVFojrkmOlSpRmUxtE7FTDXVfpOnnPhT9PwTcs8RYgEeSE5FtUFsq6giLIvKcZxJCapqlY/xuN6B5+rzvBUzJyzmdI5Ve/lgbS94fZYRE21FA9N4bxXuTPy5EiNpe024xaP9M4dEHOUXz7vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OjjzPiT6; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OjjzPiT6"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2caced6038eso17187925ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 03:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786359237; x=1786964037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GSJXjIpApji3JuT2njswM5BpludxNlNhNE9Knof+UR0=;
        b=OjjzPiT6ZBIb9JgJAsSrO0iNDlr+egk/fw6RJ+BAQuDnkXOIwe+f9OFW61TyF8FqIe
         rmFwXJOpgmoS212E1KizWk9dQwBcbDHAfxIhmXmNToyjhAqtA5YNTAA3/qsBCUU3nnj/
         cQstPij1d65Ue2eJf7EGh5dgk/G3+LW1bieYJWWQLsPNhBurwmw/JMMnP/qUxIdBUudp
         kfCrkJtiFc75WSQ658ji81KXWOYkuBzc7QHnrW8fibGyfzGqkR4KAME9c6poEZnVbPbj
         0X3cMhDedHt1r2rI+l88M7HOFR10Q+6ZTHWYKoajSVgkVoWgA9toKrdU8vMkZEHcQ07c
         AbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786359237; x=1786964037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GSJXjIpApji3JuT2njswM5BpludxNlNhNE9Knof+UR0=;
        b=PLj5RMzel65PDOcXptLd2xB5OS4eUC0oZlOJI8JUDmO4OSQl4uVstjFYf4hb2PXZia
         JPdvpTu3qEkqc8aPdYsUlWvF65RXT3SdkwHzshb5LaeTx1DXFmAn8dayzivU14ma42N5
         pABvMt1HqohvFXtnFJeoP/sPzbpTsD2LjZrIM1QmkU98IaZQZtL2P0SJ5ISGF4GT+T0S
         /gA+1c/Dzjqxo5eeyd6AqdvM/7bZj26iXTMV2vJ9Byge5u9y3PWsJf1cH6sxjAznEAqt
         YtOUs35+hRy8emaAMC3jNJv6IAoudt57IL2z4+j758M8NfNB7SFCd6pyCVB/EI3zJR17
         LAOQ==
X-Gm-Message-State: AOJu0YxKQT5s+USiMLljFlr1tYwImW5+goeyTSWoDbCRJMCgV7XvRUIF
	SkMd2RhP/lJ4W8S+bHhAnv7zFC7ei5edjfpZUAmDauHfK2IzesHE0RqK
X-Gm-Gg: AR+sD12CrZUV2yfEzSFv6iTCe02i1yjceW7Lf4vHKskxQDeoHoeFSsoYwGumtsY76a1
	2kX3PfbN7VLHvKVM4q57j7H1pd3uS8SHidQozi8P0HHKWfGs+bz5Cd0ScMOY84LKCQmFVNnMFyM
	mRmQVK+t/X+3h8NA4vcUfe7qEP8jeIMC8qzmuerxEw+fzC6kDHDGfNO2PX6pnoRvGD6vCnvfpph
	dFDamxCV0M/G8z4Xhu1Rx21/xFYmd+Mteof8thcgJgRqHlFWbEVSuOKBDO49/38mi10SHyfD0ZO
	KthKmpJEGKM1Elj+xsVZmZ+O6mmRhBQV6VFYg/1M9m5HRqA3P+XClfy8VtkrDKhKjLD6iLd029u
	FmqBawOy8yVUEDF7B1ryFN5Ct5l9HN5j6RlbrQ8gSq9RTyL7jk3R9AZgbootUADU2D1Q3pvF+R8
	3vCyAHqe3t/Mcbm0fcP1WtbES2/jqKk5FvxVd0ptOOFtEfQQupKyg=
X-Received: by 2002:a17:903:1a26:b0:2ce:a6a4:451b with SMTP id d9443c01a7336-2d2b2e5e230mr192870795ad.11.1786359236894;
        Mon, 10 Aug 2026 03:53:56 -0700 (PDT)
Received: from thefoxflat ([2404:c0:7028:5cc2:57f2:a6e1:6be7:bb30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d15ebfcb2fsm32890075ad.55.2026.08.10.03.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 03:53:56 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Reza Kurniawan <imkyufie@gmail.com>
Subject: [PATCH v2 2/3] arm64: dts: qcom: Add haptic vibrator support for Xiaomi Redmi 5A (riva)
Date: Mon, 10 Aug 2026 17:53:36 +0700
Message-ID: <20260810105337.855546-3-imkyufie@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260810105337.855546-1-imkyufie@gmail.com>
References: <20260810105337.855546-1-imkyufie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
index abfaae502..e6e708601 100644
--- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
@@ -27,6 +27,11 @@ battery: battery {
 		charge-term-current-microamp = <60000>;
 		voltage-min-design-microvolt = <3400000>;
 	};
+
+	vibrator {
+		compatible = "gpio-vibrator";
+		enable-gpios = <&tlmm 97 GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &blsp1_uart2 {
-- 
2.55.0

