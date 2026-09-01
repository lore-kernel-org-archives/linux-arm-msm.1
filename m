Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CB13B47FD
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 01:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226633; cv=none; b=SGlk2QU7L/7g0a/D6OM+j0FynHH17fVAa2JXRJNa//go5PsJ37DyYCBiEeYQRjFd/M1qVLbCGaFo0A7SBAvaq2tEbEn2seP7HgSF1IKkfZdp8CObCqZ2+7c9hInUTOMnpc9TkohBg87OEf0qTIohziOCsrIue4wVyGMPSxSu+Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226633; c=relaxed/simple;
	bh=gWLSQTYzpRTWXwqnP8H/tU2Csjcptl2cwKKWkLyEbWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ViS19VGql7ddkf9k3ymPHVTCkftGa8XIkptLnOQNXVWJTH3mMeDTonOrCW9EOPlEUxhOdBgR081050fqfqkVQC1qgwuZABjGmad4iyIzMZPZ6rOV2Yc9ECo9dvlcXZuJknztLBuaX1vHLZ01aJzW/DJr+Ob9T7siXVCvWlbr6q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=KlT6UL+F; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="KlT6UL+F"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-92e99ef0902so293815985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 18:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788226627; x=1788831427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5jGRI8snO8C8blmH9R2yiVabxY6zDHESm9tJwnyuGAc=;
        b=KlT6UL+FNuV43NRdaE2YMZ/XQ3y2JtpKrvgbcvSW5L6Po4NpYQ7C1Gkt5ZyN4yDo9R
         X/QfQ4YnKkO3bbt1UO0UjdBlXkcUEmo6cumMFEvpmgrxgLgWNFGzA4pQyyyOQwyF1I/Y
         9QmZZ3yIq2rs2OdF7eG5Kl1kb4Qlbw47UsvjVTvoZ/EPYXSUs5FpkM8JozgKOOloB9dE
         U8RbA6nokmQDBefRFKOrLkObmQT+rXYotDbVVDBGKOL42IrVBhcZxrqf/AsFv6xqQiAu
         ftwSsrn4cfbZfiLYEp/cjHyPY0T8zUk/AVehdqtRinSIS2qZawN2CHYqktw5QSaTSFoD
         Vh7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226627; x=1788831427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5jGRI8snO8C8blmH9R2yiVabxY6zDHESm9tJwnyuGAc=;
        b=kkTPZrOevp7Qlw0n0jrFxfF0TyFxLsMYhnMdCc/rmU3EwxdsHNHafRmoskOAgEdmnq
         W7sgQaXlAOoVB2UFm9OJeInVBBUFLuOqMKZj3xz8CmCNPQ75nsXZ0bGPGTMHs8PmpzXd
         dxgnZTUtLG5/sXy2n/aDZWo/d7rNaWxxI9/r7zQasp/zXgsXgS8N1CcC/0c5VKMboJgn
         bzBfF188lf2HK6AgkJVJfqcy1tFEMytGPwCaV37WJ51Ta+i9qSYJtEVt8W9P1IMBKxZv
         WHqQt3Qf/D2ZPS9mJTqx4uQ4h0aO9S06G31J9/sSpZml4Lmta8AczH4Lye1uXIpq6Ltu
         SSBA==
X-Forwarded-Encrypted: i=1; AHgh+Rpo4j+YcIAAn0IhiHnCoocYnvssaV5XrpIFQ8nygko28EIDd2Bi0B//0IqfJ+sUP9SHe6Yjvpfi6fT4xcXm@vger.kernel.org
X-Gm-Message-State: AFuF++m3wo3c8cy66lgBPkPLaj1yFyLokfquNrHOhxw+YlWu1F71WxiB
	BeWAVRSYIXUEozNbz/fsKW7ms0tVlLbIgjZ0ujzbr6090CwRIs6nhh4kXxtyO/Nz3BQ=
X-Gm-Gg: AR+sD11xxHIuZxLKdiugVSTf2CRcUtiKEgyBQFhDVSFU/5EJbmzyfYp7DzUjNO0WFUn
	zzbljrV2w88h7bYQnrIxAiOAhe1gjEIouh/yEDoG+AH4UtUY47MH5NbK54cgxNmKwlw6BA7TWrT
	nkdtKU5Bf3G4HE7CejgY05Jc1o1zM/QgHx6SeruXfDlQbJPPHssRI7yIBpxbHHjY1gt2hBoteIf
	rzsC014q2xheTim+19MK3kqC0ciBOjRqsMvpkyKHjIecPDed3TrzJXISk0P2RHhCcr5xtZk97ce
	6ymZJu9FFCWWLzug4F1A1ZQ2AZvSNS0FPYv7FS3xYtx1sX81Nr4kNL1pTcKTkdrWylt9Kse6XXY
	YPk30EoD7BRdjWiKvKvwtc1EBts8wAZQ1wYwtaRWALL8jYZ5SGSy90IpR2jw11cpIWf7t5mVy5h
	/dfYZRO3ObrAcHe7NQfT2qhKVogFf8g0EagdybVgTK3kVxG8Av6pAmW7YAEhTVMkrx
X-Received: by 2002:a05:620a:1d0b:b0:939:3c0:7520 with SMTP id af79cd13be357-93948004098mr760507185a.18.1788226627261;
        Mon, 31 Aug 2026 18:37:07 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9391703a918sm919265485a.12.2026.08.31.18.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:37:06 -0700 (PDT)
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
Subject: [PATCH v2 5/6] arm64: dts: qcom: qcs6490-thundercomm-minipc-g1iot: clean up PCI function nodes
Date: Mon, 31 Aug 2026 20:36:52 -0500
Message-ID: <20260901013654.1343537-6-elder@riscstar.com>
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

The Thundercomm AI Mini PC G1 IoT devicetree source file defines a node
representing a TC956x chip which contains a PCIe switch and an embedded
endpoint that implements two PCIe functions.

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
Fixes: 1cde54c54b83b ("arm64: dts: qcom: qcs6490: Add Thundercomm AI Mini PC G1 IoT")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts    | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
index 31bafa2cf51db..3e8d144f57b00 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
@@ -792,18 +792,10 @@ pcie@3,0 {
 
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

