Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE4A3B14D4
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 19:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786132735; cv=none; b=tEDXvj/E/xqzoIDxyvTJIM6P8LH9OdDNKXVOgzrmsxkk6onBPSLxKUrkidLHiuynMeK3ZwvhVnJju2o04c2p17QLCSC23x4voc03DKDe+QIYfxhqxWZyZMYlOGtg3ctm21kdXZdBiSdJJZKPsrSWpJHU3urYjmYzptrIJ3Q4Lkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786132735; c=relaxed/simple;
	bh=iP1XRKKFBYSsr4t2hwXtefujDnNeLBzJsKWMaMDlj04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cmp8y5lpFoWEFU79PuihH4RzSJIuPSvpdBVmmdJ+AKuItz/CG+vgTpySiEVU/4Iewll1Zzm2XgpWkvq/9nitILzjk/YraTuqfzzuZQnxRdCXy0udIxILZS78XLa+fcOtwuylTijMPCPgR8Sx9SoLLznZ2eNmad9gNxeCzZ91Dr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=gNYfCyBF; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="gNYfCyBF"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8efcef23d21so25576096d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 12:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786132733; x=1786737533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2zRXKwX0EXO1pT3i38jNqZ4SSxWPi3ZPD0vptaGJscg=;
        b=gNYfCyBFr12gdVUtFC9ekldE3bV2cLLk3NduY0HnOp2w4FX/1sBEYu79KS+gu8NSo6
         77+kJMSWNIJ7Bg9SqeBtO24ScuvYNFH/BKhEDPah3FyIjHjec0PNzJriPKY0VxWMj6Rq
         GjrSo30F4olBvpKEN7i41VQlCoocvLxMkP3TB8WJMn4QazpDLkUJKAlDhKv1GvmiFgaC
         ZkizFUnJYMYycP/Dz8cPs76rO06s6vENhFmAqOTfATnfI+XvP4sh0ZoEWRgHXTm92p+Q
         Z3+xyH87MJlR5ycEmbBQKlsfavHUu3tOPUkcrFHjl8CXv2DkPvGhBkAMilbOqxfkOcN8
         jLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786132733; x=1786737533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2zRXKwX0EXO1pT3i38jNqZ4SSxWPi3ZPD0vptaGJscg=;
        b=OOmcxzm+s+IMNg5MQEWyYMTnPOQ2EUWS5ADaJ/wOHZU9OtiI0c5Kzza6LV5n1c6dy2
         i97NGLFuOHILZ6/9XXPAznadU72DaKVrusITwdNVAhbXmMG07pvXdEQyv1vOGg3o9FTB
         amu9YgcUMMHrB10vTjk9d4s9pRr0ae6jZT4TU8nUhjg4cL4eiXh3TahFUt0K/odBV55n
         bo4MNx6s+Dz1MUDFgHz9EfvRw3edJf7qJyYIuKKSz0OYoXbBbElRk3j3B1OKAf5ujUnm
         bRNWw3MmMEAlayN9yOqSBQmhggUm4fRvVTrjnlTAK015IWI1BAVu0moSlVSFz9ac3xpa
         WCug==
X-Forwarded-Encrypted: i=1; AHgh+RoLnYtJ3WYvW/r3t2O1GIHMu2j3zlDuPNfeRwzyYOmup3kZ4IPyJNvcfbA818stCBFmdtjw/LJcCYfCRCjK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3ye0RXKBNQkWjtge6qxAexGz/f9QGOSfecQBAnXHmfqKy/lKX
	ya+d3janE/0A+Ho4fts4qcA0PdcvpPo3fRWha+MOKWAzFq++n6Q3U5b0L3rhzFlC6f8=
X-Gm-Gg: AR+sD12pBP68jOk0TpH4U5QklXAmBeCZFKySqPeG1CZZ2yrpQgPTO2RTgbI+Ge1W1RH
	hqeUOgBMdufeJULiaToOffTPsVdvLeJ9BpSsjYimKsR0X5RYsikgEZ1W0mQEHQadZjUvUMZFF3d
	wMAvpvwXzea3gy2U/RPX72ux4OjxO3WEc/+CN5udczCEBsTjXBEMZS2mEBkqqm/F9PbvJs5laDG
	cjFtgnQb12too/uCpXyFr7PraALgdzWLdGDBvATBsZPEh5HKUDlh+32AeJD3zEZyjSnDtfLc4G8
	NUPQmX//4IYC5lMlOLa+K6TOEqmBVrErq+Cl6qct07r78ffWHXmjiWVu68bMwj7EmwHV/DofMYN
	DHioCMOogENUEvvIngOlWagNaUMNYVgnu0dxWH/mDcPD6I2QnDQOfi558E+H797eDlcibgftjy+
	Ihhyb/FrfYjfQtRRYOjM0BIcG51Dy6XO++fcooeoiahc962Utt6nni8G4zLwoXwx6I
X-Received: by 2002:a05:6214:428d:b0:8dc:1f0:9f2f with SMTP id 6a1803df08f44-9088125bb0dmr323703316d6.17.1786132733259;
        Fri, 07 Aug 2026 12:58:53 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908a92ff366sm15824226d6.32.2026.08.07.12.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 12:58:52 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: krishna.chundru@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	mani@kernel.org,
	sushrut.trivedi@oss.qualcomm.com,
	umang.chheda@oss.qualcomm.com,
	rosh@debian.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] arm64: dts: qcom: lemans-evk-ifp-mezzanine: clean up PCI function nodes
Date: Fri,  7 Aug 2026 14:58:42 -0500
Message-ID: <20260807195846.456079-4-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807195846.456079-1-elder@riscstar.com>
References: <20260807195846.456079-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The lemans-evk-ifp-mezzanine overlay defines a node representing a
TC956x chip which contains a PCIe switch and an embedded endpoint
that implements two PCIe functions.

The devicetree nodes erroneously include a "pci" device_type property
for the two PCIe functions.  That property should only be used for a
PCI device "that implements a PCI bus".  Remove this property for the
two function nodes.

In addition, these nodes define #address-cells, #size-cells, and ranges
properties, which are not normally defined for PCIe endpoints.  Remove
these properties as well; they can be added back once they are actually
needed/used.

Fixes: b64abb26a2916 ("arm64: dts: qcom: lemans-evk: Add IFP Mezzanine")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
index 6cfa0bc1440e9..9edb447ee990d 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
@@ -273,18 +273,10 @@ pcie@3,0 {
 
 			pcie@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
-				#address-cells = <3>;
-				#size-cells = <2>;
-				device_type = "pci";
-				ranges;
 			};
 
 			pcie@0,1 {
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
-				#address-cells = <3>;
-				#size-cells = <2>;
-				device_type = "pci";
-				ranges;
 			};
 		};
 	};
-- 
2.53.0

