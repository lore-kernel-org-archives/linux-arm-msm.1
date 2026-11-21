Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795279497;
	b=14LJe3L/ukR68QB2PNVBf2c7eJZxkoUQMLBvlauTuEK1gGOtbXKDlB+ND8P9EaNZI47o
	 D6/iYBgieWJtDP04/M/snL412Q5xF7XojPdi7rlMTFtJz1yZvkhwXWuRHM79Uvah2OCzl
	 xLL/eq9pHoX0ZTKZqR3oZMj+Rja7ZL/6aeJ4PlahMsoc3/BsK6gemuX2j3/TQrZcm/DD/
	 d8UCen1gdONQEVj2MM29mYARfO08z55BLelxauGh9Xn3MDom2uSzHxNJmqVAH8ipYmSRz
	 X3bUIlDIxfySBVT7EWCoHIHJRNPZUOlRpSDGC2b9aiRuKwTmlXydQtNKKbmW4dwcLkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795279497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CxqkyoWUaTTX2T9h8JesIf80SZlF7IaEiUzIJtTzDJk=;
	b=y843E3SXJ7jsvkAx8uW9txti2u3PaMKTZhZUwIcb95/rL6bflhmCEa0VhDagQ6myv1wK
	 dm2NuFfj8idfWqbSEKSLgmZqZq1IlKu7IdgypQa3htI+j81PFOxRdfSeQ9nxKVzVVcUvU
	 KlH1GUTOgR9gN6qc7ID9Zq6Up5fsxooxFuRJZovHa1t3ze8elKNdCEZf7uMHKUxkGY2eq
	 QKr3yN9LGKrn/3+WQQu65YA+pm6JKP5BNkp1F4Csq5O+q7BbPPCCGAfZgtzSmAtUn9o8z
	 iXVHubodys3HNFRC2lcXfOnKfmh7oERbqvKFf65/SlC5/mcnLs6o1fZx9YfDKOmCr/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hz9sT3yV;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40CE606A330
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 16:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D40CE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hz9sT3yV
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3869f03af6aso612314eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 08:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795279496; x=1795884296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CxqkyoWUaTTX2T9h8JesIf80SZlF7IaEiUzIJtTzDJk=;
        b=hz9sT3yVPSsdmeXUzzQ/OVC/OtIFzaPMVXX0ckbqhQbtpL+VG+LssjROz4BSKZt9JK
         cdWDsaKEMuY1lyAqQeaN7+6CYDSclB/TsmEnXzMnrgNaz9GOzouZBF8sakyd5gXyqzsB
         Etp5/+yHAoTCBrW9dKobmkzg770jwKN9wJGyM2lEp+Y+/4mVArdhuebn5B6ahstfGnbB
         EXkoTkHe2aAKCiC7P7vcxii9Vt7ef0kwbdY714wM7sUFHW/64uwK3vDHooaZVrOiGdFL
         eUE/kVmyW9uFt6duKhmvb5w75l6UlHrGCycn3VNVmeMfHJm/TU0RT//F+qH/hDHP0HLa
         Cfww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795279496; x=1795884296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CxqkyoWUaTTX2T9h8JesIf80SZlF7IaEiUzIJtTzDJk=;
        b=lQf20dIkOAYNUbrBWh6p3bz7GOcOiqTWzltel4cA/4vmIOhDhiSWVNtffFXBERHuxh
         oHMVOqfa4OFyhf9axwv2WuTKN0oNB2L0XUguPxZJQb58pxL+y9FcAEq78MwgfhlJ7ryE
         S7k6gG8zbYDr/pDrzf6h6rH4X92WutNW8GobefQe2IDs2D80YNxt3++1sKt3p9oseQLq
         VyLSfzITqiG1DjZyszi6KZnxeYYkE1X7I/nEXN58G3HXn+1Dp0Z68Ie0+E4BSXReYegr
         Jdxq7iF+Jg1MEwEao3/UX4CpJR/m8tYluK7skE3zHwHUkDU6N+DI8IGKVkSGOKLBg37/
         lCzg==
X-Forwarded-Encrypted: i=1; AL+hErEoD7fM35WELr9i/4acDhsq4n+ceCEIiMRDsVJWvDO8ZXm5lFNgfpCMQ7pAzD9ZOb3C4cA2hA+of4UKClZA@vger.kernel.org
X-Gm-Message-State: APuU4Z8uRHqUQQbQWyXq2GjDDQbDQzitBQ+V3cMO/VcY0zFbKK7GPipM
	nvysHaF182eFHFq2c1qXSLl20dq7rIWnufesYRRMll6T3taAfsyx0BS/LsHSRGR0hRg=
X-Gm-Gg: AZFdTZcAWZ53f0vdYEBeFkT4R13pkGpyw2OK7TNtIRFngxuGf4ViKq/Ab08lUEdg2BP
	Vh7BqnT2sYRIG4xd91VQZVkaqtObO3vxNijDPX70+UvmbwyLeBUpSaucNv1DO5MSkDsBmf2cdVf
	kJHTOs2FvOzRaxecxQFlIgNZLQSKvcDD7k+maBo2/NKC5HTW5LuG4sx65Kyub8jaJBTpudXZgwI
	JKT4gBjwPTvYdIt1vcUIkwfWhqw95wE5artWxQk52jEOpVaJgdyeRJtdtnArZZFNlSdlUfqFFew
	I8EFdH/kJtYk59We9OlsKWD42uo6CNjmjcc8m6u0tuSD2yLXh3pBuXRoxqbQaR9LspR5qxmxZ/7
	oty6nQxfr/o7qhI4EucjOBjkgIh4fxKn3VUQGzpTcJRtTnx+k84yfqqDI3frbowtCFVgUDgTD7s
	nnWbtHO16R3b7KsOGZoaKuIC/FEsycA8SKlGsVkAYzrLbP3vZFaQCATvsPykF3ZP4Ka6Ahhjj2W
	a7wqtGNMFQ66QahMsfLEhf6DEmdvidPYoz0rHTyteTj7CS7g7Q2OMpGMXSmA1sLmkJfNWdk7rOH
	L+nbjHpObwiAg6HjD5xJ8L7Ms0V9uHWYgPBHgw==
X-Received: by 2002:a05:7300:6b0a:b0:382:75b5:e77 with SMTP id 5a478bee46e88-384b4a80eeemr8320187eec.25.1795279495752;
        Sat, 21 Nov 2026 08:44:55 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8509:ba6c:4c23:efbc:89e:50d9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm18791440eec.15.2026.11.21.08.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 08:44:55 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: abelvesa@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mani@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: kaanapali: Describe the UFS MCQ registers
Date: Sun, 22 Nov 2026 01:44:53 +0900
Message-ID: <20261121164453.26-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The UFS host on Kaanapali supports Multi-Circular Queue (MCQ) mode, but
its node only describes the standard register space, so ufshcd falls
back to the legacy single doorbell.

Describe the MCQ register region and the ITS MSI parent used for Event
Specific Interrupts (ESI). The region has the same address and size as
on Eliza, and the ITS device ID 0x60 is taken from the downstream
device tree.

On a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) this more than doubles 4k
random read throughput (fio, 4 jobs, QD32): 186k to 431k IOPS on the
first run after boot.

Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 132577d540bf..c841a1e1e1f4 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2536,10 +2536,15 @@ ufs_mem_hc: ufs@1d84000 {
 			compatible = "qcom,kaanapali-ufshc",
 				     "qcom,ufshc",
 				     "jedec,ufs-2.0";
-			reg = <0x0 0x01d84000 0x0 0x3000>;
+			reg = <0x0 0x01d84000 0x0 0x3000>,
+			      <0x0 0x01da0000 0x0 0x15000>;
+			reg-names = "std",
+				    "mcq";
 
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
 
+			msi-parent = <&gic_its 0x60>;
+
 			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
 				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
 				 <&gcc GCC_UFS_PHY_AHB_CLK>,

base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
-- 
2.53.0

