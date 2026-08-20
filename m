Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8559841A4F9
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 11:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787223849; cv=none; b=B6l7is+NTC6l3Vhk+t0BZ+3YweuEkovWyYwHVkIMmTNj1eKtM1e9h0a+6N+Hz8QyZdlTl2g+X9XVHTIv3UYIf6cJYilOMr/HiMfh6QxdDaAzFeRur5WddCctCyptezaeLXvyPypkmgzHHMWwqUD1at7WX5zdiPyerZxm6wrhA/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787223849; c=relaxed/simple;
	bh=pWoMjTkbFL8fsd9FdyFU+AP43bbp+tOHOCvu0aAZBrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PDTi2RGkZUs12t6+Muvrn2XbAkSEMZVz00F5f0BvHaLUkADYXnpe098+SeQMoPQbIKlGMvUPfY0dqQ0ijbi3Lp6MXR+x7cRGBYDThtIvuWH5UAxT8VjqiBNjrcqIBS1dSFHo1JUOoAZU2ouTE/Nzoqvb4SpGPynBg2qsC5eF7ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DWb4q5SF; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DWb4q5SF"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so550624a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 04:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787223847; x=1787828647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0hsPh6rJ9k7khbV1rxI1LTREfXN7mQXDJAbaQI7N/w4=;
        b=DWb4q5SFsUWbQKuYi2MNvuq6IbYaTCP6DGgW2Jz+GsbGwK0LDTojDPpFXgivyGaLgL
         dRjEJIqN/0TpmoxSqedUKZO9PC90s+P8yLG873fjjn6TgQJIrykW0faEg/8KPiiSuGfm
         N3yrqQjJmY3sVRZEmAhv+7ia49AlRhYJ+/P3wxv2CiA6lBvuCpPhYMSwP2aDTKsoa+1X
         hGlNLzFrrnldPcArsetEEltw1r3WU7mhDZSct9fa226tXl33iyAgXZSfHuvuVBPlLqcl
         A2p2t+vQPU+3KCTgSUeL/0tgrT325dxjl0WtWRD99S7TWX9AuxnBHHbEzkvekSGpTdcD
         PSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787223847; x=1787828647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0hsPh6rJ9k7khbV1rxI1LTREfXN7mQXDJAbaQI7N/w4=;
        b=QZyWf1E2qyqomxXq05n1vydkk5EgTttwUq8/20KfaUNvhS9BKZx704etamDSioYy+o
         nqIJsYX5271vwE9qfXSPJkzXztHa2RsHRRssp6tM2jF9pXG0+T7386lnUojd+teAw6UA
         5lKJsfKD4Q/v3gXvzGeaGdXSDC5gtdll+AC9sA0qanZOHwak4YnwuJ3ARAmwaQxSV73h
         97avoQanN3cYVZRhLi6ytDPc6xs4hcqgyBmRC21riwktUTFIWpyHpGuMPMxhDWziWW3f
         R+4w1u0mYIW+fZTEW8Ln/rX+oAtuYQCTK6tL3EoqbfHrsjx2+1QpBNZ7Slyn46s7C6Wa
         INfg==
X-Gm-Message-State: AFuF++noBbj3+FQCFwOz6H+4Y6gXwRjjTpiL2ksC3N5xpD56zz+qZL+X
	oji1QF3sWhan9NuchDFHPPKj5LUY+saJXUn5YX54ZvF5IoOcTS8SM+LK
X-Gm-Gg: AR+sD13L3s7YDtzO0YKP2N0q9G9sTqpT88mQpHgcUQtTzF2lykS5ZHXmLZvXgc/rbkH
	oSNnI2qtk4cvcGuzA/+gjlWoPd5B2UGWJkDakrPnFxiIwtUtxDGix1m5eNTBUJMqMZ5Ak0qId40
	a6I2ZLz8RInc3U16eJH52A13aZPfFzJDCZPoA14ocvUUsnYCFAqo3QkI80xAqQ2rmW1Q0DPe1mA
	nc7+Mj7PBwfMhfYd0JKL8p0U9QCAV5h10cbmdwjU+MZMAwPHdjw/ieML3HWyAHleiJZOPKJ9AlY
	3KcruUfvU/ZfgNOdB0LMgBVQZWUeV4RyRIGIxMOtfpGlBBCQKClUWG8UOKL4Rg9ThHHejFLEC7j
	Hfz0JoULZrvlu2hQVzQ1rLQuk86m6va+6hOwwWStN5BHo8UCtGLBAnwnmj0GmIhRIlewx/7WKh5
	slPsMjj/9s5sh320pzSFzjcofaOdHjRHkmnTl3ZVYzul+l6HTvQB8=
X-Received: by 2002:a17:90b:2584:b0:38f:de94:bf34 with SMTP id 98e67ed59e1d1-395a074aab8mr6078776a91.10.1787223846856;
        Thu, 20 Aug 2026 04:04:06 -0700 (PDT)
Received: from thefoxflat ([2404:c0:7015:a156:d857:47e6:8c8a:886f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb12145sm6200668a91.4.2026.08.20.04.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 04:04:06 -0700 (PDT)
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
Subject: [PATCH v4 1/3] arm64: dts: qcom: msm8917-xiaomi-riva: Enable debug UART console
Date: Thu, 20 Aug 2026 18:03:45 +0700
Message-ID: <20260820110347.98068-2-imkyufie@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820110347.98068-1-imkyufie@gmail.com>
References: <20260820110347.98068-1-imkyufie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xiaomi Redmi 5A has accessible UART test points on its PCB, they are
routed to the BLSP1 UART2 port.

Enable the blsp1_uart2 node and configure stdout-path under the chosen
node to allow outputting kernel logs and facilitate early debugging.

Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
v4:
- Simplify commit title
- Add commit description

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

