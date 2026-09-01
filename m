Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9538F3BB104
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 01:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226625; cv=none; b=ETYTq5QV4cb5/v6Ov7Bk4SYpZDjTTgdrO7BH+a4JieAYp0+u+3N0LLa+gHkROsh6ACnB5zxwUQLmqiJV47VAPtc1ko0nBoUgBD8KcUoeDixzs81MOYH0EHhEDemcDjI9QDJT2kX1F74JPkDcYIC+X+FGNTTCdoAD3NKJ4MSYcjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226625; c=relaxed/simple;
	bh=gfVPdtumkZbpCiDCZ2WA4Akbi4xrYN5pE0/FfAAiH8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mV/mXlVBukSQdAknNgJN7fGcV4X6k+NWGNumrxio9yXWLhUDzhXVxWzcaj97eiluW7+V111h45AAD8eU6qPZpxW3QyAUIgP8n/f0GRdAETHXwiIPTfu7A13Ms3pYQXTusB9VQor8clWDa6hHqP9iZheJJ2i0AGqAcGglRCPH9bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=w39fElDx; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="w39fElDx"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-930c0f9c1b1so313356785a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 18:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788226620; x=1788831420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bpaBWipm1BW8poaZLaIxjgOiCGLP65h0iesgThD7XGQ=;
        b=w39fElDx2CLCUmXtZWLD3dROUG58D9jkxtmtMqemoCUiX8Q6Srb/+IR+6pigpZGwvv
         yaDCyuRlUdzlsdXPkX3PdKC8bAJJvw+GJSV9xfpKr3pknaKhRkQu5h+Qe7tOyFXIIty3
         A7RSTxCXxRKLsCfpA1eJJpP3AdQGLLE2OkfqSqOIdWNlsnGRgIeiT3WXZfh1avC3n/Ma
         Y9Z7TCidgtkQGaql7lSUb8ajrqOxBsz4uRyAG1UjuexJ27oPNT3J0xr/tFPT4xmHmSyq
         UheXR1cwZlHz1MC6E/Zlgagn/F+bHGoivRqaDgGuCOCHlLI8mhWJ5lZwnDn5bHgWLNbJ
         I88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226620; x=1788831420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bpaBWipm1BW8poaZLaIxjgOiCGLP65h0iesgThD7XGQ=;
        b=lU7wTHo15E4l36HmlTqTt/zL5JFa9SfqoRGp+8ZKladHJMda61zfWPAEhwTok1EbmQ
         OuI2O03goORMWUrpIR+tFG4oFNXu72JnlixkT/9lAB0IOQJqup/CQolcBsuRZr3zprTw
         cFw/qW7/bewS0ZIwHIkB2tlib065o54PgZhXeMchQ/rb1uLu+5EqkstV6Wn29/MVsQMQ
         3hV8z25YPglqizggmPTAEkFZdsPB8FOotNUL8ncYNcegzawSbJrV/SgKgHFddP7NWLbp
         LiFWZ7nlQq15LJWwvtKoejUEiOhI+X+WQa+MJAqQQyMrUuj8zFYbC3lKOXV0oHCuyyA9
         tWRA==
X-Forwarded-Encrypted: i=1; AHgh+Rqw8Ra36StVdevL+w+DdNDTv77UmwYSl0bw6crll12ldxwxJzb7pHcj1FiWq4xbKp76lbfpoiwyu1v+p5m0@vger.kernel.org
X-Gm-Message-State: AFuF++nWqnP0g7A6aEXxy0eZ87ZXxzuaXO2Lo90IlTjM6iTis+AH486y
	yEV0iMkwXVcRGH7EzG4/KOWLwy3IqEbf3YvAsZO68wmZup3Sn0vcPFoE2zOfAxYjw/8=
X-Gm-Gg: AR+sD13DvzTh+vc4g0Fbwy29zpmrPytM/CEVdJUlRpnh1MVv0N4CPx3qFRJi2SZNFSq
	6o0Xld+EYlBk1QBf/KB2vcji8FOU3RSrU/MBWvPiaM/OSLlfjYAPe9Nl13qnZS44ihdym6gI+Tl
	EN0/nI+OELXyrDRrV5NwbExxWawlM8EuKovBHs66H6224uYF9JMvA+dv3d9SzhkRGc966KTeOA1
	PfjeF58Ae/6YHqHRiNl2Y+CUdmCF1up2rceK7+TIewO40UG8Xt0WgJ2Ao1FiY94Cz3wZUMh5/2q
	oX4VsPHdnnTg4rXo9+Hj4YDf+MinXL0pr1NZrmXDWXZlXI8CsvkfTkRH6v/GOj9MgUd/M+c6g52
	AKJnHCbcKpjDUTfOTonRiI1vOtBbwyLA+IOkxCT851pAlOMLmUJGTN2LjFxMLx+YZAV9THW32n8
	/eWQXTjHub4a6sq2HKeK1AMH6Wrg1v6qkggCSe8tvob5ydmr4ucBbs4egqQ4LuaHZW
X-Received: by 2002:a05:620a:27c7:b0:934:9639:3a4 with SMTP id af79cd13be357-939481a476fmr754012685a.41.1788226620558;
        Mon, 31 Aug 2026 18:37:00 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9391703a918sm919265485a.12.2026.08.31.18.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:37:00 -0700 (PDT)
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
Subject: [PATCH v2 1/6] arm64: dts: qcom: qcs6490-rb3gen2: clean up PCI function nodes
Date: Mon, 31 Aug 2026 20:36:48 -0500
Message-ID: <20260901013654.1343537-2-elder@riscstar.com>
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

The TC9564 SoC contains a PCIe switch with three downstream ports.
The third downstream port connects to an embedded PCI endpoint,
and that endpoint implements two PCI functions.

The devicetree node describing those functions incorrectly includes
this property:

    device_type = "pci";

That property should only be used for a PCI device "that implements
a PCI bus", but not a PCIe function.  So remove the device_type
property from the nodes representing the two embedded PCI functions.

Additionally, those properties contain #address-cells, #size-cells,
and ranges properties.  And although these properties *will* be
appropriate for these functions on an RB3gen2, they are not normally
used for PCI functions.  So remove these properties as well; we'll
include them in the commit that actually adds the pci-ep-bus sub-node
to each of these PCI function nodes.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Fixes: aa7b4bbcb3a1d ("arm64: dts: qcom: qcs6490-rb3gen2: Add TC9563 PCIe switch node")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index a13315bf0fb07..db6578f7fba51 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -956,18 +956,10 @@ pcie@3,0 {
 
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

