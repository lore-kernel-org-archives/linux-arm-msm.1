Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA5E3BBA18
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 01:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226627; cv=none; b=qDJI802Cta0VUB+ZgKC+8FW+RdCeYXYjRTd5NVeAmsNo+u1POFZt32ECneoI6mn8uvoLkTCKkFlSB/FLjyWD+3iQgBdcv2XVbUzmmiwc+jhaaOkIfob9Nv+9LJ5O7i77NH9lorU5oRpVBzWY/4W9coYyRsy5n3vFh0QnzYjOGIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226627; c=relaxed/simple;
	bh=ooCrCfo7oLVOrvAobTBfT5HplE+C8HQJo3SAieGJjk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ikwEfUQSLGdlsoAvHnp5AR0H/M45MN+xPKp+KH7eznvR7wwxN+EWn0IgO0TzNM1sE1Tl5rg+klM2XZ50GGOwTVzqR/JYGcW/H9tHMq0Eoe3HfH92idRLrYG3faDxVnB+A04ifwZuE4/otbtOM+6hvaV6ELmp9VFJu7EQuQd6wTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=hIIsHE+G; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="hIIsHE+G"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93905b1dc65so291657385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 18:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788226622; x=1788831422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QNTyYnbC0W+gwozSIufWIpELF6tjMCW60rG99iaQh1g=;
        b=hIIsHE+GlQdcBwdsmmTUkAsdM4xtoLNkarcHdbLGj5FXaQ1aXrFIDDc88rU96dknNN
         l01mB+okJ5Wsortsi3CkgairRmFpoAvniWwqORhRem+5m3dkZXgpUQhjJSk2nRGNtaX7
         p6YkKqP024up0YvksMdGgViCFVcsH/XQhk2/oPNHiizLX3SbnRY0Fe6qt9K3AdrZg0ak
         oGPPAB7wC8ZJ5RgyVgqSR7Z7OgSTjggh72y/waSc+lkum/a/mrOyjPVpfcCfXuDTSoUj
         oKAyx6JEJuPiwALgh3h38W3hkyjl2CVRvtCqNLY6N0k0TjV5MFyE3iqUy8OsXbXIysmJ
         PG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226622; x=1788831422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QNTyYnbC0W+gwozSIufWIpELF6tjMCW60rG99iaQh1g=;
        b=WdaNCPO9OblX4XlzAzkfbAE+DLwGj1iLz6ETVTwAZ1nNqFAQYlSBBZC3/9w56cnXlG
         RzdFK+0ek1cXHsgxhvLvYFPsWoEvCSDDMuv9yKO6IqDtxMolZ7L3thNgDjF7NcHgkn2U
         YTFhO9peGR2BNtxRjVbqxHUJeFPy29U4dZ57/oaS0YpJu2hNl2IeADyM2aEp5l4lMJXy
         078kQTdG52/beoeHZcA+boh8CJ4xaVyJVprSwk94fLF16CHv+bncb7gFUBu4CC3qS1sp
         5c4oCkwfzwrJ8qh1pNdgtOblRbSE4ddC8rxlpC0TVIfdasixvuce766B7zEPzCzmS1dO
         3MNw==
X-Forwarded-Encrypted: i=1; AHgh+RoYe8dowpKEZeavyJrdFJ9KaSY9viqPjVHJwLxSpschUb0I3L6D5p3C2UHIxpGUtwdkzCn7f4Jxs3sS4sRS@vger.kernel.org
X-Gm-Message-State: AFuF++mMw29y2UUhbn8j7J0WOpRDxvHdVeU7wx6oH8UXhX9rTuB333Pw
	q449bVkFqlcGfcwHAIHc79vDbBduNNzZUkbAGwjbbs8MGBo05xPHkmY8l/vjHXMgkbg=
X-Gm-Gg: AR+sD10NiyVDmN8yp7OrC9XbeSGpGDb7RDZ+PPe9OTF1BPZ7E0MpHrb+ZwV7YzDymsh
	QzWAjEQD8ee1mtQz1mIoQ0GM3O+oQpZBOwrA3M1G4vJ9OKZjdzVcgrVhGGnKumPw5jsH6NopKSc
	OoGYK0TD7jroCkROYIhxRsREc42KAc+mT4qsZT4pSHLlayXjVq5iDA+fXOyfK78henH/nyR3x0B
	PVHtWIZhp9RAXaYLbYD4EahVEpwOksIUnYQbas8MHBulxs/QtLHzsGJ1SIuZ72z/qvtSbHIbVIn
	baTf3/9rV0bydzRlAMMdLeg7iwLyiUO9tkLZBmvUPnjKKqKA/RmqRecFPF7MUPXdDPUp5KMAx0J
	y0fTcAMmR2vIh0pmhBWnfLwKUXJ8lBnHQF7rIqGQxEfgJCBy4TDpqNgNrpODb9/R236OTxteNVO
	Wsi38S218QdSsW4eE6DD0wlYQIaNPGsw2kmQZQamkSCMgukS8t063KylX8/WZ++XfM
X-Received: by 2002:a05:620a:440e:b0:939:34c6:a333 with SMTP id af79cd13be357-93948135358mr651883985a.40.1788226622264;
        Mon, 31 Aug 2026 18:37:02 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9391703a918sm919265485a.12.2026.08.31.18.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:37:01 -0700 (PDT)
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 2/6] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: clean up PCI function nodes
Date: Mon, 31 Aug 2026 20:36:49 -0500
Message-ID: <20260901013654.1343537-3-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901013654.1343537-1-elder@riscstar.com>
References: <20260901013654.1343537-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The qcs6490-rb3gen2-industrial-mezzanine overlay defines two nodes
representing TC956x chips, each of which contains a PCIe switch and
an embedded endpoint that implements two PCIe functions.

The devicetree nodes erroneously include a "pci" device_type property
for the two PCIe functions.  That property should only be used for a
PCI device "that implements a PCI bus".  Remove this property for the
two function nodes.

In addition, these nodes define #address-cells, #size-cells, and ranges
properties, which are not normally defined for PCIe endpoints.  Remove
properties as well; they can be added back once they are actually
needed/used.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Fixes: 4559b435f741b ("arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch node for PCIe0")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../qcs6490-rb3gen2-industrial-mezzanine.dtso    | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
index 46bb52c667a4d..82c4d47fc2aaa 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
@@ -132,18 +132,10 @@ pcie@3,0 {
 
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
 
@@ -227,18 +219,10 @@ pcie@3,0 {
 
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

