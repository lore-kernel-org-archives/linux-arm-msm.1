Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F843BE174
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 10:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786359234; cv=none; b=QxwbQa6bCCFVVfdwGrzkbHGNtddbG6XUfwYz+KmvDl5Rnnrf8Q34XzJqaiucxxvlUgmBL/k5w2J1Jel/47G4qX5u6Oi/YfDqAyVAzfOl/+ta6uQNwzaNPc81P1fKg3NtD2CIiWsmSU8PiRTtXQAC7oqvNHYstCUGxWr6YRSA7hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786359234; c=relaxed/simple;
	bh=RkuPU+szxSRPLV8KTuj8qDOUbDRUGKXjs8KU3FAuvSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MbaP8nQwU9qlf7zRPU9RwfTDkDcfXuIgCls8KquY5fyH7XfOuyEK9gm367CvR1mKxVCa3n84Uxjfw11CSaFhcJu3hf5s24gXxFhy8ATdYE3jgqOGy/JPS2iFOHT7UIuDB0suKABUympAokPAWuL3l3q8AQXtus7ZrgETIY1EihA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kpjxpqlo; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kpjxpqlo"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cea3004256so20874085ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 03:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786359232; x=1786964032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v/6jA0iwEsO1NI5+qHVdBrDXRWsEHwRKhdyQ9tPIjyM=;
        b=kpjxpqlo7I3SyUgiwsnXSlaa3DV9tANwR3zoyr4Ota+Z9mw+Sd/4I6XdJ88qSIYiH6
         sEPZQnFxrlFxgVpwJO9xVfxKHeVgnQT5MsJcRJDqeqndr1qzdDJsfLdHBLW7g2E+DOr9
         vAJ9m37agKevWFo8a0PG1ePFBXVWTSIVp1Z9RdrssbCFFe5BuxuxrtVLzq2+GMSma9ll
         Bxn2T4vplLpI2ZWPvRAe6jYeWF9ix9zOGkiYWcHZRdScgXaFATJwFH0gzziB4yywExUe
         qqHNRfOpKvw7JuEXeqWs7mWU1lquBCS63cDfBFsTuDq2qh8e9BzrTDRNdmwuXVKRKzkk
         CZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786359232; x=1786964032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v/6jA0iwEsO1NI5+qHVdBrDXRWsEHwRKhdyQ9tPIjyM=;
        b=Xft7ck6HcNxldiesdBTzrtUoG2HlZKBcyG2mOUw2fDuwLXCbFmD1DVz+p7tVt8NY6T
         gl0JdXBZu/W1YXWM8MtDmwNA7CvzcgypVgtiTkMLnQ7h73NjEfag2dyrWW5yFN3D1KH2
         iwAp2qifI0h2VI/P5TQyU7KSvS7BemnLiKNoVEfwrtjTwA9ceiy0CXPrAUhanysHqmQ2
         ea61g1kreDtcE9gu+gpBvXaI7mD/vCgUdGPAhIyFJXsp8K/NMZ8dP60AJaq2rR7sK8Qf
         TqSPyol1ql6R+n09Xgp1svi0vxMW7JEVnk4FO8e5swgTkgZMxOH22N45/Md4OZ2FcV+D
         28dA==
X-Gm-Message-State: AOJu0YyLDkyAp3Md5DtAPDmz8ramArpCJq1BRBoqyEV1jNUfaP1NTjQK
	cOdr3o7GAMZLrg+LKIY5LD/Y7903ynofxGMcgMfqcObS9GjqBI1agHgc
X-Gm-Gg: AR+sD11xXJGfCfH4qqZvfsk5oTF+sFVD9l0NB85figyv+71OPSl4RwCbvdu1xFlaHuf
	7LRMJe6x856LjB88NDrl20mYxbxEoidpkPAgpneImRl8lBquG5qVOmrEDRi+lV0dLJrONXqUuu+
	scEShfzQ8FB1xUQQLYE24aHbfeq7WLs3ak0QFeHgOrgSx8R8lRfASY6TZbieI/s/DcQuEjksOf7
	LWgwrfQHRMrB4mnJ+x50z2BEUXr4zFlvH6NvA8UWIyIbLNZFnNBmWZljNixCHXGBOTz2KCISYWK
	zb5aBr7xXa3Cx3kDTzho+l0nltXzer0L6UA3PnZOsmm1/zCfiArog00DjtcbVF14GN4WTLiM9H0
	H4U/dXx3AWR10LCHi70WJ0VtKLaKCvem+MhPWXhJLiN6PalcxVO0z1QnjS4qsuvGGBQx/HWcQ3y
	am/lu7x3+N7jnFDOVtNvA/wXf6FXVQ0KkB0YM1xlhrmp6U2onT+qY=
X-Received: by 2002:a17:903:943:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2d0ca770d5bmr492858775ad.13.1786359232472;
        Mon, 10 Aug 2026 03:53:52 -0700 (PDT)
Received: from thefoxflat ([2404:c0:7028:5cc2:57f2:a6e1:6be7:bb30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d15ebfcb2fsm32890075ad.55.2026.08.10.03.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 03:53:51 -0700 (PDT)
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
Subject: [PATCH v2 1/3] arm64: dts: qcom: Add UART support for Xiaomi Redmi 5A (riva)
Date: Mon, 10 Aug 2026 17:53:35 +0700
Message-ID: <20260810105337.855546-2-imkyufie@gmail.com>
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
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
index 4ea4fbdb5..abfaae502 100644
--- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
@@ -13,6 +13,10 @@ / {
 
 	qcom,board-id = <0x1000b 1>, <0x1000b 2>;
 
+	chosen {
+		stdout-path = &blsp1_uart2;
+	};
+
 	battery: battery {
 		compatible = "simple-battery";
 		charge-full-design-microamp-hours = <3000000>;
@@ -25,6 +29,10 @@ battery: battery {
 	};
 };
 
+&blsp1_uart2 {
+	status = "okay";
+};
+
 &blsp2_i2c1 {
 	status = "okay";
 
-- 
2.55.0

