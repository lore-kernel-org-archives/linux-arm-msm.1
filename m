Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726A2402422
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 03:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789441849; cv=none; b=ka8kcvc3JPIaASuuEuWVSEPa+ca7IGBgQ0NCxW2jhEMOnYnGJyNvNmceuBQmt5eW8Ow1IwXTCWkYST5dCtynSMkfKOWPipnic85cTGxbKk9AJ3L4I3xmMCa+dTzg9nlnIjA9vVojLQPuU5ev/E5FmB4HSP2cw2k++8S8/UJvrPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789441849; c=relaxed/simple;
	bh=Tqm8mGXvI2nKoUm+9pLtaJ+uyO5KFGl5Yiy7z7wtnBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FLAEVnOANhnj/z3i0vNVhkCEKMrdbFBnoJCV6/N45rI1n69EaNYMPzNaBQYMtxXXaTRK3MACzvz8Yf5cl+E2y3oIvZyd5FiUjw1OGsSskxV+2U/zJ23XcoPF3ODwfFHW6M6X5vvOfOMVVUVUK/RXOtqDiFOfS9kAQQUa4uxrqsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=tGa9frY1; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="tGa9frY1"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-530e5b2cab9so17135341cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 20:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789441846; x=1790046646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSNWHoyvKJfGdDxylfGmEXIoCFeqbapyGd1fgWyygV0=;
        b=tGa9frY1CyWiXP3Ve/Nl+X1cwDGI7vW6LYKcX9kUlCsoo4gg68RRZ+F/+XxLR/DHYF
         CkLjUkEygXTmYTxln3LzeYTwCKvxP4X+yVSwkM5F8Kf2vw5Igc0TKGUuqNo6Q1Gdj1pW
         SA7LVU441bJ+u3ZGtlQ+M1R+maw50Lnt54uTtBVAZFKaTjKjqJ0ztKK6MgzGD4E3LUGm
         I/Bwc5AW1Y+kwEra3LdsxTfeQjiz53Bo4o6RsnortHXK5t8YA07Xw6rOHse9DpGtmxHw
         R1UhP4r3Xa/+9fAChpR3zLNO72vFy6RMHcJ7RBy2mc+1MoMbfJlKmZCdMCmTyJ99bO/H
         SEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789441846; x=1790046646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xSNWHoyvKJfGdDxylfGmEXIoCFeqbapyGd1fgWyygV0=;
        b=TluZsWIsQ97gsQFdQY/O+Ll9aFw0Z4Ij2WxAESyMo9Fn12mP739B3WwiChGrerhWK/
         jwyDM0DaVDHUVjQh/QFZffpm2lOagu8i6htxqTX+Zm9C1mI6aVtP/4rQKCltv+EyYRPt
         vUIfoSIoDwCVGR30z0PFV2CGExQkPz4RXqET5A44eUlXTeVteKygATF7sY0ZIqL2UaHl
         tPa8NkW+TwZDBOnMECv7Rpm72REMn/T32+93Yf63NZf4yNsAmFvtlMN0gyvoeZjPufVy
         YkAf+H59z/rwcoqplm9dboXHDUsjMh1ihk2E25TIYkFzUUmfqMiS712XdCuB+AxA9M5i
         I0KQ==
X-Forwarded-Encrypted: i=1; AKwUvByAC/1Ju5tnZVw1qwE+mMlhh0DAvOyROJuG1si76GlGyEEOZBnwWJOBbLuP8GXT9hyPLT3SuPfW4+K342yi@vger.kernel.org
X-Gm-Message-State: AFuF++mstMD9SVjn35ehRuaklt188F6H9p2NKE4szCgiHNt3o9qBEIcu
	cMXCPth55Ev4qas/+nhwEHSRpg7TePEFpENeZ+MCBspTFrELAI6zAGnRAjLJPdmQQvg=
X-Gm-Gg: AYBFou1wAWEzn3IxFeoyCkW7sYDrr8WlCW3GS/mjxUPJHe2/eTm+1IAFFSUOpkplDeP
	1i6cE/hdTmvV435XlxPACDx1w5pSVVbepnT1ecLvp268QgQCXHFwYNNNTwke4Sv83YPw6pAigiy
	FsHmSuST8PyEfUsklf/JIMW+pjFC2avxdBlgI19N4hAKgI4A8I1TfV65LYSAFQo5LF8O+e7dtPI
	qxK/ZYW0ET9L7AGe1h41Bj2dLc48973sCBovBlJkzHM6Embdxe/iLH65Qa03Dt4/lzZeVuI+TLq
	ALFafrvtpDvCfyKOmfeFI3itxypvbzIZLgCjdycvgVKRA5B8mr/bHxo4iWviGtyxL/q8KJ4yJHb
	+mp72wwye9OcLMkEvIQX7GtITu5GrYGv6zH8tSeIE65Ymd+xAIHURUQAN9rFDgVt1D5AEEJ3yOj
	udBeAmSJkr9h1xJTgFMrl/WDIIRYc8uPXfjcUMpa1SekrpAVf+QTF1oKQCdFoJifuf85+n6uvdk
	ZY=
X-Received: by 2002:a05:622a:1919:b0:530:efea:7a55 with SMTP id d75a77b69052e-5310cef6b70mr77015881cf.4.1789441846176;
        Mon, 14 Sep 2026 20:10:46 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ce4ec298sm118563841cf.16.2026.09.14.20.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 20:10:45 -0700 (PDT)
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
Subject: [PATCH v2 3/3] arm64: dts: qcom: qcs6490-rb3gen2: add endpoint buses
Date: Mon, 14 Sep 2026 22:10:37 -0500
Message-ID: <20260915031038.1087264-4-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915031038.1087264-1-elder@riscstar.com>
References: <20260915031038.1087264-1-elder@riscstar.com>
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
v2: - Added this patch to the series

 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 30 ++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 3bb5fca8e2b13..59fbb0444d9b7 100644
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
+				ranges = <0x0 0x0 0x0  0x83050000 0x0 0x0 0x0 0x4000>,
+					 <0x2 0x0 0x0  0x83050000 0x0 0x0 0x0 0x80000>,
+					 <0x4 0x0 0x0  0x83050000 0x0 0x0 0x0 0x200000>;
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
+				ranges = <0x0 0x0 0x0  0x83050100 0x0 0x0 0x0 0x4000>,
+					 <0x2 0x0 0x0  0x83050100 0x0 0x0 0x0 0x80000>,
+					 <0x4 0x0 0x0  0x83050100 0x0 0x0 0x0 0x200000>;
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

