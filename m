Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C414A99A5
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 21:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385423; cv=none; b=ip9dXJnhm5AbyiWUHoKuQAmrqHl/PRuI0g1SulVwC5JcAl1mjzhFPcXGDWneVVfOdY/yukTgueOkmIwbB97DNuqkM4L9blRTJoN9tIODqHiaIMy9wZVR+tsRjy6IP0gfXTP9dPRAPQCqO7/B2vL6vHcINw6OSveE5lf2ukFFmcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385423; c=relaxed/simple;
	bh=TP1Bh8BMB77s3uGsbNePeTglxwrDKfUoi3tjClOr/kI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P2sevhdpZvUU69jn2+K15La+E9g6zirPZuLSK5kHFZ83RL09KUpVtWh69mxkQEBkRSGO2XAfN5xJPkUuwzmP7hfdgX89b/mPoyCWcRC5jO4pxa0vVOqHhP/5HU4KyRrNn6McEKwwpeCLa7GZjKZDj5+6nBPbpGF/tmTxu3qQnWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=nFTVjEkI; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="nFTVjEkI"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-90e8e70fa02so20398556d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 14:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788385407; x=1788990207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bzNUro+3MyICCA3f0xAO39ZT/LJoY8Qojj7g/8tVsbA=;
        b=nFTVjEkITS1unsGevX1U/mNUFgo30gcNN/QKrM1R1ru7sf4Jgz8rGjgs5pO9+umsxX
         bb3kvlQlcDy+fMZS3BjPpe8OvWLOJhNuW91/laOs1Pfh1JOJVzUIZ2JbhzhSGR76w4ia
         XnDdE85kV5Czs3Zh4lu+z9rrwk/PdlpjoyMyxpAHF16XkR8n4OVSxnIj5lkNm7GV40JU
         QtWYKWjYGpLcZAR3mig0StehItKN7TuvbL+mc0nmPuGQFuzgvHyblAkCsmNC/vG1JDXA
         WpsyM5Evas5sq/r8kUylrg3k57w+UnQlGi9t8jSTDv9tF6whg0s4bRuHD/uQG+YytKYw
         XrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788385407; x=1788990207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bzNUro+3MyICCA3f0xAO39ZT/LJoY8Qojj7g/8tVsbA=;
        b=i5xhwNrW+JcLHQALxny4DVIJ9VyK2i7dDQkzUJyPIHCRJJI7x1lm/z3E4f0GD02sGE
         16dTlbR+i3NCwFVM/HYkipwWetSDc+ZNF0ZH9YSbpHK2s+tg5F4v1f0tdpa4v3vgyzGe
         wr02eFy7+2UAgAhB62i4cBhqZZKKFhuoBQLdJINNx/tipAlhc+3jf5bitPO60E3snKMI
         lj9hfLJx0LuulLBtqRNjF4JSU/sbuCmT//ZuTR5jcFUpOx/PCIsad0xoeuf/vyTLmfEI
         119rcBWbwccQ5JpMfZAHfnm4XrZSUtUQ566DoUslS8odCVjSq0cCY7cW65PTmDnlo4z9
         rTCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDlR/mFeoJM90F5FqxZjmh/2h6uXWn+enD2PGGEoy0O/n79W8BsNL5vN032Hjtlf8oDFLu85DP1lS2utzf@vger.kernel.org
X-Gm-Message-State: AFuF++lPQJM8XBdr50vulezZSmcrSwTFxz/TauP8YOyLMmC8g4E98Zzx
	HMyETMay4WHg8moBbGIQBZFFeTvgMAar3xgPgKDVzG5wzCuGp/Rl2ZDHhOihoUKD2i4=
X-Gm-Gg: AYBFou3J+tAOHtukWe7GDZ4Q7+bjZtm/XMG1yhyCLvK/rfo/luaun0ivQB3fdk6N1/B
	dKCnZVfujsBO08O7idB72XDha/FSJgQkg1g8Xgpk438v9v9kYAqSVQUehZzixWaPjbZSXoQk377
	jn2M7hlkl44NHl58Z5iksU3zRiH3Cu+HDOnY4MYQEHVcqCN/QCK7bZRcFUTvlQO3SLVfwOoD9gz
	yRUfO8LodtBJBw2OVSKGYpD798Tb7V/scIaXsnMspjMsGALDcbNdvY4YHUhQxROPZZlVRu+Cj+U
	XwUnDXTPyvHI8AJx/4sJFwvOylKkzJ9ib9al8p8ID6ssEhxKsrrNBC5Qgay/fhFALyPtDNgxmr2
	cH/m8MkSX2g6axDOnIB2s9ArPQuWGQnQIjk++Lu3raWCUqhEOZijgC7Uvz4neyNbX8LBo+sR+n7
	BVJ4mNTxrEo7dzpqx1O7MvdCuQb7fgbLxeG3o2WhHLO2d+UeJCEQooQEWGnrCMx1O3
X-Received: by 2002:a05:6214:dc5:b0:900:6ec7:19d9 with SMTP id 6a1803df08f44-90e9f204195mr106473946d6.3.1788385406590;
        Wed, 02 Sep 2026 14:43:26 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ee06d30sm28372546d6.6.2026.09.02.14.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:43:26 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mani@kernel.org,
	krishna.chundru@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	sushrut.trivedi@oss.qualcomm.com,
	umang.chheda@oss.qualcomm.com,
	rosh@debian.org,
	jsandom@axon.com,
	daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 1/6] arm64: dts: qcom: qcs6490-rb3gen2: clean up PCI function nodes
Date: Wed,  2 Sep 2026 16:43:15 -0500
Message-ID: <20260902214321.1721477-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902214321.1721477-1-elder@riscstar.com>
References: <20260902214321.1721477-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TC9564 SoC contains a PCIe switch with three downstream ports.
The third downstream port connects to an embedded PCI endpoint,
and that endpoint implements two PCI functions.

The devicetree node describing those functions incorrectly includes
this property:

    device_type = "pci";

That property should only be used for a PCI device "that implements
a PCI bus", but not a PCIe function.  So remove the device_type
property from the nodes representing the two embedded PCI functions.

Additionally, only PCI bridge nodes should be named "pcie@" (or "pci@").
PCI endpoint nodes are typically named based on the functionality they
implement (e.g., "ethernet@").  In this case, the role of these PCI
functions is not (yet) specified, and furthermore they will be used
with PCI endpoint buses.  Rename these to use "dev@", following the
convention used in of_pci_make_dev_node() for dynamically-created
devicetree nodes.

Finally, those properties contain #address-cells, #size-cells,
and ranges properties.  And although these properties *will* be
appropriate for these functions on an RB3gen2, they are not normally
used for PCI functions.  So remove these properties as well; we'll
include them in the commit that actually adds a pci-ep-bus sub-node
to these PCI function nodes.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Fixes: aa7b4bbcb3a1d ("arm64: dts: qcom: qcs6490-rb3gen2: Add TC9563 PCIe switch node")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index a13315bf0fb07..3bb5fca8e2b13 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -954,20 +954,12 @@ pcie@3,0 {
 			ranges;
 			bus-range = <0x5 0xff>;
 
-			pcie@0,0 {
+			dev@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
-				#address-cells = <3>;
-				#size-cells = <2>;
-				device_type = "pci";
-				ranges;
 			};
 
-			pcie@0,1 {
+			dev@0,1 {
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

