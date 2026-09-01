Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710703C0A04
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 01:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226628; cv=none; b=ZOKOKdTpCgXLSzxMU26DiO3yi4/yqQuj3uUPbLuWlXu4mw0I+MkLhJ6WBtWxqpNrAzx3vmLLVpYf76d1YngP4E0BUfCX2fjzrJEpbDY+UmsSiAWhFJo55YyX22LIv9u30NaAfWc+Utt32OmkoLdRMFdTfIAjIXqw/j7bCb6a5q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226628; c=relaxed/simple;
	bh=Rux3sdXj3VDwxYn53lIo+IwdAPJhr8/dj2W3Qm3wyFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m43YsQcloAuBGTNeLVqrNOr7Rs6YcSZeUFg4bwvZot4imDvIAg90eTD5uJnUhiRvmNbmqlXHNcOSDY9r5szHKTeRWz7M4bSOcIh/aPr4fYi4J6NiBUrHD1i05kegZeMR9GVDtlvW6j79wZ6YD1YrH5QS69FVpzuxgZyyKy3/vlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=id9k1C0d; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="id9k1C0d"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-92edb12cdf2so31922085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 18:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788226624; x=1788831424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7nNvsaEQcRTultSSBuVd+REzQYtjIe97pxmt20zLlCw=;
        b=id9k1C0dBEfzrWu1piSRmdCDtn/STJAUdw9MZC6lWet+sg/4J+zdJMMMHUFgfXfzgH
         JVxtVg25RzlKTIah4Y6EOc0mJX0rSQl7xXjwQitPg2FBtGk0u/urlDKzm9bDNgvt+epX
         0AQmnIRgcuJkvsMtG6JUQjAyTaSgJk/+f7JrsxcAzSLTtfjLWY+nZBFcsf6PVuT5Ptmx
         YEr2nHrREOMMbjTse2Co7LtpYTs8CO974rw9TM9gfsowQrpu1ZavELsELoZpkV92Leb7
         ly+sI6FsRbiU93ZVJ9tVCSNiHEkZMIhWXUoKMqxrGUWN8XyI5OH7W1lB70o3zCvE95XE
         vK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226624; x=1788831424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7nNvsaEQcRTultSSBuVd+REzQYtjIe97pxmt20zLlCw=;
        b=RSqE5Zy7oKLeZPa8k+cNl6pQG5d2I+dTmeYLNuxNwoPPXFMUjDI9rfj0edkhCEIc3Q
         dd98m+0oX+wij+q0ZsxECVbGKMUDycELNVjIEA5z/geFSt9lguqPTAD4xJ+aLrmbKWqW
         UVfOm9Ljs44TBFTIuJNrCbldpwwd2UIJfHmrTiMTOFuax8m1ZvrFAQHV5SZfjyTMy9E7
         dupuI2XqNJVnOOAWgdTWPHT0jQu7+nA2hRZQQi380ccYrp3lPNL97tdcgmh5ubQN9/iu
         DYsASoTlOs5znkcBzS5ulyVNWu9x5e6wo4gWc07tZyZQ3SvKFTgxsUJno0arqjDj0iyH
         8cAA==
X-Forwarded-Encrypted: i=1; AHgh+RpTujxhbUsaZ98IjRD4PhQWqdFSiERDeCYcUJqLNTgDrqFXUqylMAl5jWiGJGa1CtVPlnfKJ6q3wDfMAo7r@vger.kernel.org
X-Gm-Message-State: AFuF++lKYIaOabhPLk9cCwXUwjNSTZ0ca9AqxcSpy3mWT619ClG2LzgA
	K5I2l9WWHqlGczTy7okpvwkgA2cHj5buN4VJxsErffa+fzfg+gdaGnryJ88SNskwB6F1v6raMIQ
	fFZV1elc=
X-Gm-Gg: AR+sD12wrjXxG6w5DGySHGExKyFMdh2zH/PVrn6TPLdttPRdPw3jAvXEeKD2nu1fYdy
	cYVHasZnwm2hUVFOEtGZekFyatyDzW5OEdysQ6CcCzFHivFttKUYOhh/f/WaRIfjRUaUGR9EdPw
	Y07ehNOLetedhSymGGIFYH8R9D9z5kKtVrOtchAwNN7C/c05A+gaa43v4R7A6fPL0izd+xtC2Tx
	Q34lzzyT/WF3Ugbpv5wKGkL5DdK5Z9f93221S69GcmxWRQnYvJKTYJ5xBi8OcV2lFmvdabLzQuY
	rKJZTanwKXuTxwHbr7pQ5K1vBE7kx0XfmmFNW9+UTy3o6O1QDPj5GZab9wVyQlMPhdWoIOnbvnv
	A+kSSRk+vQQw+qpiynalOs084ij5Svn8dAh+aF0AZ/L4b/chTJu0I6yst4nh6YtqF/LVjB/MN/+
	fMAAE5UhxbN2R7KzxN0Ab9rgJutNDSYYrBla5nCQXygdxBrEYkPeZeQwUIG4rZoLje
X-Received: by 2002:a05:620a:45ab:b0:92e:6637:da3 with SMTP id af79cd13be357-9391394836dmr3178329585a.38.1788226623956;
        Mon, 31 Aug 2026 18:37:03 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9391703a918sm919265485a.12.2026.08.31.18.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:37:03 -0700 (PDT)
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
Subject: [PATCH v2 3/6] arm64: dts: qcom: lemans-evk-ifp-mezzanine: clean up PCI function nodes
Date: Mon, 31 Aug 2026 20:36:50 -0500
Message-ID: <20260901013654.1343537-4-elder@riscstar.com>
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

