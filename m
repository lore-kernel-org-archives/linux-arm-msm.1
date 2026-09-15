Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075CA4BD0E0
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 18:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789495817; cv=none; b=n08WCVRRhZ+Rmkxm6S9Daj+vM9yPA8kV/KyEVz7q3b0LEJZUFO9yVkHlRghJHgVMUm/tMM6mo7ik8Ma3yiEHoyEnybbmwS0SYvjr1NGstCShSDEeCd+zd131o28rZk/v4/gv0OL3rAHFU8qOOUpslEpSi9HI1V1mtgCDaVvQ214=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789495817; c=relaxed/simple;
	bh=tdYpvWgSjy9pb8wMZZMf3uOm14EnHaub2C79rnVIBoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EL5sZbSrdm6w3yPF28yn2Iwgkwwjf3kLbjr9IyILfX+jeU6sb9vBAHlXCLV5RqkoDkRMjevqe8QVKPf1YrSBKLFmFbpktVuskAyhkPDKWXFMup3bqPHQcdrnczF/Kq/4/B4s51Nh5bgIBkOVmtBubX77Z92qhON/sRlVvcaX6ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=pLeoUaZH; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="pLeoUaZH"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-939109f067fso6056185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 11:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789495811; x=1790100611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wVBxclk9QgEAlFYkz8nlTTQ0570gfN7zk+u3PBMIQfU=;
        b=pLeoUaZHFwXqKvQfAvxW6w9XjTgMcZZpwUT6JOWOlLr4BimjldmpjhIjG7SJUDIwiP
         RCFaiMbzUeQZYwKEJGd8UINUw604HAYfqiZ4Wr2jOsYfVaLSlZ7zFfwj7INAIXco+Dll
         Erwyk5bdKKN1AxUDGprq6T9lGOVfIt/ulBbDQ1c/HXqeMbRM6F00CpfoX5TpjLsphKRt
         QTSxCT3eISuZ6qTuWrAPEFwrAuXwUZvTnHSFE0NqfzO3uNpt5v/rNpnu5yZE3hxlTDPf
         vQi7vsFDZe+NUT0XFE+2sF8awdNjgvA2Mh1APc1BuaHSlhDlnbPKwnkBSDKWGMKAPDvX
         BAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789495811; x=1790100611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wVBxclk9QgEAlFYkz8nlTTQ0570gfN7zk+u3PBMIQfU=;
        b=k3UUN5ShZZryUoMJ0stTP4Wf6FzzRzeYlZh9Vp091ctCNXTAQSb7XCAknY2SQ+Oucn
         Tv7Clkvfihp4vZVVWYyGfwK/3urKH6Sedy5yXRoCAXs65CGWTDXmBw7citU8llN8D0tO
         KCMHGGosY7sUBSrKqKFA4Zq1j/iujS8GKLNKKDP4KPXgr3fNYkh5JU2ZDBTA7imimWxO
         X3KW7lRnv8EqJdKJX4f7MlPGAgaU1ylzOzq+WfMa5Ey0yyRcX7LWp7Q1yt0crAHBWXfY
         HvqUtNq1hACriQdbctp0FmJNP5ggkUXXOvRRvgd5xSG07penBmIsD++qyOCvm3nK/UMM
         aLdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkWeg70QVE2zTggkFPzeS3roqCIGeEtG1Fa0cyOQ89S/VdGHVoaAzZ9i4Ru2w/6zXu15xPaNgNeIrgNhpC@vger.kernel.org
X-Gm-Message-State: AFuF++leXdT/RlGpxbLmzKMLV4f2PhAanRuarUqJmFiojL1zWSpYVb9c
	k8D9LraowX2oaPRYcXdttao4TFjgoVWm+Vkf/IZM9WvW1ouEiNWETEy87nbH2XPtX0U=
X-Gm-Gg: AYBFou0inshK4P94vCYq7TCyY1DQyB/Xbeiix1wE6DCH0JKEQo0waOobwAXOeV8/7R2
	cQNbILv6eT5TJCSPYPY+SzvgYPapdYLpfDVyEHff7mG61RAX4psMESUd8BaOqcYC07nP8u0riKu
	wYvg7f1n6775a4g9mCNT7gQUp8ONa1FgTotyYNTd42IEfCvTRte8+9tpyFdzdTJHCOCejjg6drD
	YA4xPrP6BvIiej/c9F5jlUII2EA4X/WqZZfXbs1cBkw8vLWc1OLo+aCwD1v4qmQ8+h1AMSRbipV
	ngFnhOCdkfb09KITSWoDENYE5H1vHSlYjSVJSMdjK+W9GGhNCadiE24bC/BiTzflwvvQOlOf6ti
	Ul3QxQkIThwlPUL8fE9SdQzBS/bT4ay0LHgDhYOCxPXSo1kZT4IcZq7QtWGJN6fa1R3W/VL3VKA
	T6ibHF54w6BxVFcvoLJjnYpCOObuteVYHS3udTrxc2G9/CANzUdkFdhVcLDqH81zhlz4eSVk/Up
	Uw=
X-Received: by 2002:a05:620a:640b:b0:939:e735:c50e with SMTP id af79cd13be357-93a297c8d0fmr1256082585a.13.1789495811337;
        Tue, 15 Sep 2026 11:10:11 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b7824f72fsm14648485a.28.2026.09.15.11.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 11:10:11 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	bhelgaas@google.com,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org
Cc: daniel@riscstar.com,
	mohdayaa@qti.qualcomm.com,
	lbiancon@qti.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: dts: qcom: qcs6490-rb3gen2: add endpoint buses
Date: Tue, 15 Sep 2026 13:10:02 -0500
Message-ID: <20260915181003.1633543-4-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915181003.1633543-1-elder@riscstar.com>
References: <20260915181003.1633543-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TC9564 SoC incorporates a PCIe switch, which is connected via
the second PCI segment (0001) on the RB3gen2 platform.  The third
downstream port of that switch (pcie@3,0) has an embedded PCIe
endpoint that implements two PCIe functions.

The SoC implements other peripherals, and they will be accessed via
PCI endpoint bus.  Define the devicetree nodes representing these
buses, including the mapping of each BAR's address range to its
local address space.

The endpoint's ranges property must be defined, but it will be
updated dynamically to include all BARs.  As a result of this update,
the parent address portion of each range will reflect the specific
address assigned to the BAR.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - Updated ranges property "parent" addresses so they're unique

 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 30 ++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 3bb5fca8e2b13..5b7f5292a8864 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -955,11 +955,41 @@ pcie@3,0 {
 			bus-range = <0x5 0xff>;
 
 			dev@0,0 {
+				compatible = "pci1179,0220";
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				/* Ranges will be updated dynamically */
+				ranges = <0x0 0x0 0x0  0x83050000 0x0 0x0  0x0 0x4000>,
+					 <0x2 0x0 0x0  0x83050000 0x0 0x4000  0x0 0x80000>,
+					 <0x4 0x0 0x0  0x83050000 0x0 0x84000  0x0 0x200000>;
+
+				pci-ep-bus@4 {
+					compatible = "simple-bus";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					/* Map 0x0-0x1fffff to BAR 4 */
+					ranges = <0x0  0x4 0x0 0x0  0x200000>;
+				};
 			};
 
 			dev@0,1 {
+				compatible = "pci1179,0220";
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				/* Ranges will be updated dynamically */
+				ranges = <0x0 0x0 0x0  0x83050100 0x0 0x0  0x0 0x4000>,
+					 <0x2 0x0 0x0  0x83050100 0x0 0x4000  0x0 0x80000>,
+					 <0x4 0x0 0x0  0x83050100 0x0 0x84000  0x0 0x200000>;
+
+				pci-ep-bus@4 {
+					compatible = "simple-bus";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					/* Map 0x0-0x1fffff to BAR 4 */
+					ranges = <0x0  0x4 0x0 0x0  0x200000>;
+				};
 			};
 		};
 	};
-- 
2.53.0

