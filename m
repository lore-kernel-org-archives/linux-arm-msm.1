Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D2F489866
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 12:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315844; cv=none; b=cbd/YyJbTmKr1y2tboDi/6+cOvzf+aa3isERrYmkD+FQBIlQe+KIGoCW5CS9cG/2i+g+eFJMUDQrWbiOHX59QS4RGuVCyBmM8K6PNnsm4i78gJmD3JZs0vIWlN/tJO+36dKgVbOBRRdC1q+K2qT+RSA9Xes2YNaoSi7dqHH0lOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315844; c=relaxed/simple;
	bh=a2V+I7UeXRDj3lHU2NGFDjdBIe3drc9UQsymhMr1D/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dl0jndfP91oaLy4sgGotSWM2tZZt0xA6hG8kFLssOGeDgzPD2dB7K7Ekt8CUorxUozCcfRTrd9oQKETy7g4YBxNshaH6y7sNuKwwAHe+IhCiLUJE1HBwhUV2sqXATa4VsM1haGLdj7KoTrHQqxaHzHqwejCWwkqzZNLeH/ONvVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LeOTDygC; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LeOTDygC"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a20319d030so1642561a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 05:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315837; x=1787920637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CC6zM5DNH7SSIqqjxl1MzTwo2sU+cNMvlHaMx4m2Zy8=;
        b=LeOTDygCXGkBZ1wZum1J79iHIB1rXhswcjl4Vxr1/j1k7at99FMQ8uG32FTKnitp9t
         6zjDQ69WuS/p2/HbgxHMXMizbu07txQ+RWqTruNxAuBslksMkzbATgteR3m3yBtlAE02
         N9IB/qHFXYNzT1DHwmW9und2ANyFS4pg9r9PdwKPPuYn+GScIjDhT5FY205oQ4oouCZR
         RTkMsthNvcCcJOdHDBPtXYEUIrrKod8/7FP9YiCWq5aHnkSl3wk/CLp8A03qbdwH0rTp
         R3ZBNOgjjrU1wjFqb7x96uz8zjCSEu62o1mc7puYEgIoU5ICwiDPCvvwwI77kPb4SxlP
         KUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315837; x=1787920637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CC6zM5DNH7SSIqqjxl1MzTwo2sU+cNMvlHaMx4m2Zy8=;
        b=JfmYtk31PFuLyxvWppeq0QDPgPt6w4LnnY2rJ56B0h62L/R1uhDfvbIUZS8rsTzaJq
         6ZT0k/CWLH3oQSsiZayH3i41cCKXWWjwSBuTWig6ONYj8BXzrozncuUUKDJagkOaEZfK
         Iili3QPto00vceFtM9YkI1FfdkKPSk6Vp3+TlQKOesfuNNPNv2X1wWG9w3OXAs2zWhD/
         lf5X6DOwNe4mIArWoshmOm8Byu7waBaNDkY/En8anucdDY/xoarFN//Q9reL2PxnkbCF
         1ts8NlDFsveHGx9E7JzF8YfRHEQ+hpmC4LwhNBgCDJwuWBdHGSo9C3HOikvZfojR1dcF
         KGPw==
X-Gm-Message-State: AFuF++kpyHv5plxaHmcl3EEmBW+7xretkKtTlRNSfG2GFl+arfd3lTSn
	HawTprDO/pdVgiOOYq+eM42ufDlGCHpqXRs++OFMrYCau8il+mDQS0qu
X-Gm-Gg: AR+sD12+IzwrXJpxGoEHUm4j6bV2n8K815wgpuJOI0lVV994UDASBvL5kDcxrQr234k
	IHA+7mu7QbNc4w+w73pkn58htcC1Kes1yxnlL8swVaEh1ZngS2XbOkFmKgPmGYay4bDy5O8AimF
	OWJgE22HNDf23t27mkZ2oVoDfErQD2RkejUI5/36Fb3Wfb10lLGuyG3ZuCLCQfWzAquwA585fpo
	mPLUjfUwxizLKt/vHJJ8KxbrTYlwRRuiRstsxV1HBofzOWi5jfcdNWNw3ZEbYvZGZOibFBVtXbk
	L1IH57JA5tS3kwp5whKOISkaC/HwM/M8slh5775WGLW4aL0j6O5qmgguFPeeFvxrD7LHvehb51R
	akXNky/crNqf8HvG13GG0dTQXf2Lz54EdH4YAYO47co3C61KCUs6C4FsyqA9V0f9/b92eRGGp7h
	gBY2esX1dfQc5XE8Vd26WmuZcsm59i5DnA28cypCB4e2CHWl69KhpykA+DqzQQftNa0wfNXDUnl
	hi52XofcO6CM8CtdBx77A==
X-Received: by 2002:a17:906:f359:b0:c15:f0b8:eb91 with SMTP id a640c23a62f3a-c246a359a52mr510507766b.7.1787315837384;
        Fri, 21 Aug 2026 05:37:17 -0700 (PDT)
Received: from workstation (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24591e0397sm451194666b.53.2026.08.21.05.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:37:16 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [RFC PATCH v3 3/3] arm64: dts: qcom: sm7325-xiaomi-taoyao: switch to device-specific pmic-glink compatible
Date: Fri, 21 Aug 2026 14:37:11 +0200
Message-ID: <20260821123711.1579539-4-zstaseg@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821123711.1579539-1-zstaseg@gmail.com>
References: <20260821123711.1579539-1-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch taoyao to "xiaomi,taoyao-pmic-glink" compatible so
qcom_battmgr can identify the device and apply its taoyao-specific
battery property mapping, required because its firmware shifts
battery property IDs relative to the generic sm7325-pmic-glink
firmware.

Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
index 6f8bc65bb99b..bc4dfa49ef38 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
@@ -72,7 +72,7 @@ key-volume-up {
 	};
 
 	pmic-glink {
-		compatible = "qcom,sm7325-pmic-glink",
+		compatible = "xiaomi,taoyao-pmic-glink",
 			     "qcom,qcm6490-pmic-glink",
 			     "qcom,pmic-glink";
 
-- 
2.53.0

