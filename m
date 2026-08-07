Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D823C76BB
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 19:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786132742; cv=none; b=MFOcV1xtrEyA6p/T8XVQf+SWgRWrySLKoezXm5fIYUz70lkrD2N+Nt4h6duLRuxw2A3wLKl5GfTjNbLDSvgsqaUGkt9R7w+dPALyQM40TUh0YoMOpvfWqQC6HBjtwSEqOI95iA/qIG+0Z2kqqALGhnamYJbI5XhPralNmya0dok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786132742; c=relaxed/simple;
	bh=QiXDP5a/p9iG4MitEVx5J5d3MhyHsUrvD44Z2yG4aDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cxoI63kpYbXr1U1WWxo/SsJxo8BIVk1YYPZetFYanwXy70O/Tc0gj14FKmdM6SyrujgAoeu2bWlfd4P7SUP3GlKiyVqMt328XuY2Ch0XFWpT0QBT64KmCKgonn3tPhJoHMfeOcegueufmBqhfePXSy48JM+6ZPTad0JPArXONb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Usaf0nw7; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Usaf0nw7"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8fcc43c48f7so37956216d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 12:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786132735; x=1786737535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fDcofZ4S8ZEPXUXp4lQuVMHLOZNcIGHwYtKwcoJ453M=;
        b=Usaf0nw7rW2S5zvygIN77eD9WudsIVv3xw7JvYq/O9XSocmMMnV14KhgKBfk7HLYkH
         wfhGuTvMIw/xAC30u0C6tGtXa+kmltNjTNog2NYPbFc8NoAQ95c66Dxv5Uz1y59kMKDQ
         2k0LZ5slB0pj+/914SRNUVOxMMvnVPcYXUYAgjZ1f4fCpWbFks2+DXTqGYBAweIl0Dwb
         rtExk0yfspcIKdSMI15BloVKPw2uHjBSahMKuH5EznbXHHuTvDtYTysgoBm68zxVZj9t
         BdtASsnX4V0HSTMiB67yYFvN24LHPMtYTn87G28MQFuWsEK73Md/NMj1mEGUAu4+3Uj1
         l7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786132735; x=1786737535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fDcofZ4S8ZEPXUXp4lQuVMHLOZNcIGHwYtKwcoJ453M=;
        b=YffrkmOGt+K2LbbE/I1cm71DGu5+1vYc/XwbXEEdPpuzZy8p+I+a5jBwzadI+J1rLO
         s+Z6uQdMjI6vkZKtgLDpxEU9EqzNdu+eRvd0OERgzg1e1BAoOdvMSp8RXGKk79+1720/
         Dkl0R0HggxujcGh3ESxhvCTCAL2OEbQRDikXC/mjrb8xEGS0wumb/G1X6ukb5c64py3u
         N5WvwGeVHFr2hJuZu6UZf+uIceoeVlNxD2LhruuSuVX+uqUI/KPL2wx+ovUeTGJrHVOx
         9vHi0G//d4UQRX/BC9Y9HHHbu1Rn8mIKkpHo1UiP/8YFBUppDBJjKimLZG/903NiqBim
         U6xw==
X-Forwarded-Encrypted: i=1; AHgh+RodHy37ap3aEGzWvsktT3kryXKIp///rQKRq4MXrDsdHtOpTU50shpHVtabOpsZcH4/23mvBdIwrlZ1xaF6@vger.kernel.org
X-Gm-Message-State: AOJu0YyQo5qKUqw8buMQxVpmZTwMUimrwnDnkiA09umXuhozib1tz3nN
	Pm8NlmObal3lJJujdNGIu14qb0079aoiFuKuCtDfjxPrRFHxZyQFdmi02PytZEdHcZw=
X-Gm-Gg: AR+sD137SC7ZPc5bzFESo1UfgCSgxBYSuyhVPitz077OAwH6RuCmx9eruUAKG9w73YA
	GqRsZiUZcxf7EyVncpL3RAsYgwYwIIC3PYwNSrdCMZyqQN2iRNUrFaSLKIpCcW5Nivb+SVYq4n0
	3y/cxxzmDDL2IL73S1p8UC1P1WX1CgfMI6qs8QoXWot1wDTIfEFREyQSUJMpiENR586JvTzCc2r
	vaH4mX+VqAGPFVRLlyLecAnL58pvB/qNj6OMJX0f6vmqzMgoB9rCNQt9Zoc3CerXK1NS+XmREKO
	U7cidaaDgc/Pa9Q3ZYK4lrkDSdmzX1SrqgjVlTB+fgJj/tvzWz3WSxMFJ9ZOCLu6lVqPi+yQMci
	4sZfCc00FIW+QgNzV9m4zl47uoFftSSYyuTcHAHiE+tXNI/P/AHlYD1aomfCTuJ13//DXrBb2S0
	/0ix4oxov8csTIOhyHTQglPFZ6f4R2RE8Px3WVaVc5Rsn5vc+lDC+q8uNeO5oa0jN3g6MfWB4Vq
	nA=
X-Received: by 2002:a0c:f099:0:b0:908:8f6e:52be with SMTP id 6a1803df08f44-9088f6e5917mr214892616d6.15.1786132734818;
        Fri, 07 Aug 2026 12:58:54 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908a92ff366sm15824226d6.32.2026.08.07.12.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 12:58:54 -0700 (PDT)
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
Subject: [PATCH 4/5] arm64: dts: qcom: monaco-evk: clean up PCI function nodes
Date: Fri,  7 Aug 2026 14:58:43 -0500
Message-ID: <20260807195846.456079-5-elder@riscstar.com>
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

The monaco-evk-ifp-mezzanine overlay defines a node representing a
TC956x chip which contains a PCIe switch and an embedded endpoint
that implements two PCIe functions.

The devicetree nodes erroneously include a "pci" device_type property
for the two PCIe functions.  That property should only be used for a
PCI device "that implements a PCI bus".  Remove this property for the
two function nodes.

In addition, these nodes define #address-cells, #size-cells, and ranges
properties, which are not normally defined for PCIe endpoints.  Remove
properties as well; they can be added back once they are actually
needed/used.

Fixes: 5a67924d2fc57 ("arm64: dts: qcom: monaco-evk: Add IFP Mezzanine")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
index ca5bf0fe5ec6e..9b5e911b83210 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
@@ -119,18 +119,10 @@ pcie@3,0 {
 
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

