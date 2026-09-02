Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599D33F210C
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 21:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385427; cv=none; b=UygRSN+FnXeOO9zVpYZzJ+IRFxuLf2zsxkLdEd0d/l0h2xiLIqUJIdaZtgMkYcL2WRVUzmOqi5/LgGwHr5kHIZUy9whAv6QmoT1PIR4IuKdZ5ayfAS7AEkr16H+4jZGSubqAKubVfP/27aWc+qNKA75WohKNc31dNx5w9Q7QDZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385427; c=relaxed/simple;
	bh=Yp9V0DDM7pBN4oFzQoY+w3CvzCQSulT8S9p6P3JO8Ps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jJ2x3xr3hK8sEv14Hr549mh/dbnOcQZmy8x/F9WwRfhYDAqQ+RFmzSLMorsIIPNh22I+JNWj/oyxz8KIhPHjUEeHnZJbGs+r5EAbUjYsJhIWwpELnwOh5LlX53/VfzFjP2WSJF/OUBsn2X5qz6X7jo6NalvVkQLfhzKsjTVNIMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=WuqaxmCs; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="WuqaxmCs"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-90e8e70fa02so20399676d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 14:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788385413; x=1788990213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uBSlViqDjCQ5gbe8ZY0C60syox7ylssOjTgWF3IsE/U=;
        b=WuqaxmCsNCE/3WAEUBssLC8LdqNv4vEAAzpXwyIcvpOHLlkJwheNX+pE4jqVAnNMT5
         ogxxvbRA+xnUH1MDEQ2w+28n/zj3V9pC6j0FKa5um1NrhVSnywjJgkH+ejx73b14ccUj
         jE7yPNdKsCoCOhxAXwqZQITVFVUE/i1VW+aGF3XEXf/02nBEB00vizIb4bLJsm5CLbO6
         zfSSddQDpG6cR4YBXNQ4mNt64uUjaTFrDb1nRDlWJOH3SdT3/z3JODlrrpCcl5TXhljY
         4arM80t9V5S6rYPjGCAMRGIFfJqHlW8pb+lnOfhtX07DHV0Fse1O6lsWJnifN3NpNPn/
         D0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788385413; x=1788990213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uBSlViqDjCQ5gbe8ZY0C60syox7ylssOjTgWF3IsE/U=;
        b=eFksbuP2EwzPz87w9ihsnm+q5FPQ7O3ebNUwJveM2FABErgCsvxMPLr5pdkZVwDk5y
         6zccwgfWPMvRW/+gSpjAu6y7eUwaChy+rnJI9M2Ou0Olj4rm4CUfCCmtmxeVOOBk8al7
         3/Hv0LH8LD1LXZZ7JrwFDGDqANEITaCaeONQx7zwUNSSR42l0hrgiCtI2E7fmSfpeZ7l
         dGCX2oj+80X52GO2H5FZZ3f6FPZbXCoPlUolb8jrntpsI4BO7TDspEVKeLiQ139KtV5P
         RVfG2COw7227VOV769b9rbgq29qr+az12TMEw1wbtzO6ULitYXRWwTgUJrCW9au/yFs8
         1d6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwwry645YSMT/OMNEZ9VnL+Ner2v4HSV2zyOXytHTMU1zKwu+rvhexCW2EVsKyEU4KSARNJc1HL3XmQYqkP@vger.kernel.org
X-Gm-Message-State: AFuF++liqvG3nqMNzL0lfbbuGyt1L6YgULWUrq0Uv/4C8Zy1ArbH/bmp
	gs+gjf6r8jCOJE8tuoUDfjjErVxYzbQMSVMgfMR/bTtZPlqR41smaH0kR30nV70FVN0=
X-Gm-Gg: AYBFou1Z+MVhrpUDCpVy2u72gkq9Dt73zVVGxVA9uVIv4sapJmaGZfhSIbX4EaJn+Pi
	2sCbtcLTP4lffE9a756kStzloJhshik9s7Ea/mFv/4Q1S8kjL2eMH+bu3IK8UwQs2RBXio+iM7W
	SLVkms6NzipP/ysatNI2FjSNoxnoRyEiBqfNzwkvHD3HjAf2wlcdrhWyfGi1YnuoWdSHWNriV0X
	a9AW73KTQc0QLE4if41rcXMB+rnHJT8ENtBE/6PAWv7nwmSh2otSZl5IFdR75AVqFAZmbPRm6ld
	bRtNv+41BD4BbliWfb1X+hy4TX0gGlSNkoEhEU6y4axjH7NaTs42e+HtvPCIZb0uZZ1BKZqwwnI
	NsTuvWL4MDQuddcqdtokK0f+Kz+7eXc4tqOF3isyFYl9RnHI4Jb0Vv5SPTaA+PfbKOHxjE0Bdbz
	CVit/pmjfVtDNNP8WHXSqdoT38zFtmla3HTmwPkF3ZDXup75Vgh8Pbxuz7b5IUuYXL
X-Received: by 2002:ad4:5ae3:0:b0:90c:e8ad:7fb9 with SMTP id 6a1803df08f44-90e9f205935mr108583056d6.5.1788385412590;
        Wed, 02 Sep 2026 14:43:32 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ee06d30sm28372546d6.6.2026.09.02.14.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:43:32 -0700 (PDT)
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
Subject: [PATCH v3 5/6] arm64: dts: qcom: qcs6490-thundercomm-minipc-g1iot: clean up PCI function nodes
Date: Wed,  2 Sep 2026 16:43:19 -0500
Message-ID: <20260902214321.1721477-6-elder@riscstar.com>
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

The Thundercomm AI Mini PC G1 IoT devicetree source file defines a node
representing a TC956x chip which contains a PCIe switch and an embedded
endpoint that implements two PCIe functions.

The devicetree nodes erroneously include a "pci" device_type property
for the two PCIe functions.  That property should only be used for a
PCI device "that implements a PCI bus".  Remove this property for the
two function nodes.

In addition, only PCI bridge nodes should be named "pcie@" (or "pci@").
PCI endpoint nodes are typically named based on the functionality they
implement (e.g., "ethernet@").  In this case, the role of these PCI
functions is not (yet) specified, and furthermore they will be used
with PCI endpoint buses.  Rename these to use "dev@", following the
convention used in of_pci_make_dev_node() for dynamically-created
devicetree nodes.

Finally, these nodes define #address-cells, #size-cells, and ranges
properties, which are not normally defined for PCIe endpoints.  Remove
these properties as well; they can be added back once they are actually
needed/used.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Fixes: 1cde54c54b83b ("arm64: dts: qcom: qcs6490: Add Thundercomm AI Mini PC G1 IoT")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts    | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
index 31bafa2cf51db..51b59a75c1e03 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
@@ -790,20 +790,12 @@ pcie@3,0 {
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

