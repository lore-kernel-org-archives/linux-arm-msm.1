Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D87F41D230
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 21:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385426; cv=none; b=RJG7hFWy0uY/kzx33HFUJHUjl7L2itxtL6Wkuv0i+MgiT36L4zDcfw19oKk0PE+CMj1JRxokm5eOBxvNeGRbW+gAzTUXsaJAVtLw+62FYzrVVwgqxUE6P6aDYxxV46+dHOYOtMfaHhQ75kVYwDwVMVQmc4EVcsPEI4CtbYHB8iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385426; c=relaxed/simple;
	bh=9DoePrAAT2pHQcCNh17LMiEyk8hU6ueOgPJ3ghTAW08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F1QtLtXqw9+BOrZF0z2+rf/m3ZSGzz0uLZmJDNV0h5ak+5GD+pOrsc/ff5LYN11QkCFUQyqY7an2zQAbdYLQMAUTtnBDwHKzuREa4eLJB5BrH8yKFHYEgVmto9H/s1AHTmkaq6S6z7GuxocknA3x7LDk9qPtE5WTAmEWjyYHJbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=0JBaLS7H; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="0JBaLS7H"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-90e8e70fa02so20399386d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 14:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788385411; x=1788990211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yza9D0ffScBd6nt5AlUPa1owLlRxXSrXmCqLbjeXPMI=;
        b=0JBaLS7HuxZycRWeqbzmQN0PoG4ng2/8NooWa5+CveaXXkt2Mf1c1Wi8B7duTRF46Y
         UnFBm3BJj1PLvE4sVlugjxpQYAc5wf3C5NHt+G0TVrm8mAe7cj41A11PPeoHfTvCBS4N
         jv3u+EJwL6CvjC18w/S/IQOrVCgErLhBKJ9oXWpj4RLyGrui/8vXxFosH22e5BdNoEts
         YXNrEV86F60tnm33wwS6pTtGvol4c6V4nLYRH0o20k2yHxZSXTT1L9ih7sEJBQOnH4kR
         9h6uLO0uUupFjUTULtT7KabxenKqnIwPrE/Ex1G6ji4/bBCdxOvmsfAuuHmxi2/kYJsB
         feCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788385411; x=1788990211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yza9D0ffScBd6nt5AlUPa1owLlRxXSrXmCqLbjeXPMI=;
        b=ISGtygeRN49Sfw6+aVbcjPDOq8Wl+CmxibC5Y4aLossC+DrTdLBwyOoO3Cgra16kTI
         N0JjldZdR5fIVOeJtIUXx+LYQR6nMWkjOmY3sKNWBebzQaU2fQuo7tMqTUTz3Lp6FPPW
         mOq7bC6KzCRLf4W/DLc/35bnuO3kgP9TxQ1bOj/umZI3E+WGpx4JHn/SqW+7435fQyg5
         OMBEU+wAXod/PF9N3/Y/ncOsbR77aIXpcayo3j3axccul0oTCXly3qbeyC6mIY5DngUB
         cSPN4UOPKDjFpWC7X7vtEq8ADa52bI+wy0HrSwqJqUy+lpVjaxHh38gV7NkMqlwFsz73
         sUNA==
X-Forwarded-Encrypted: i=1; AKwUvBxU7br3xBD+PSNqXUsp4aU65A/M1PXmgvkfwNog7Qba/J/dnxvcJ3XziWEIRgO3+pEtYlrE+R+756mIigKt@vger.kernel.org
X-Gm-Message-State: AFuF++mABuT8uz8uqQ+EhodyVusKxORSqxGvFsaTt8sk41OCrCvsqaWs
	SVmm0Rfr41Hz9l72r8UVNfPKwIg/EbRX+Eb65+2z7C37+KuXPqPkSvcU+1quYZblspw=
X-Gm-Gg: AYBFou3FxIg1W69gqItu8ZFeKtkwHsSMLLVm80A+oMOjc2KE7Vxs3XL59AL6/9YvUFY
	nfQTlk7pW2PyvqXzenkGQqAVkHiUtTDnWajmQJ5iBPd4Ng3fuciJkTf7WKzUp2bwchExXUss5Sk
	ymIPLSYQ17gqAi3a0D3GnsHdkxnJCe+AuYPi4jEeOMqgnpNtrMVdUKILDg+OhqjGOBMyi44iBRp
	8wr+yzozZjO6Qveq5QiM22QUarb9hZwRSOsERF+nVp4Xt8dVSoKSNWCUZOlJvGEE8MUboxSCbHN
	x5R6ZBaw3BDn89klB7t40kjjL7W4NHl4Fo4RFbJAnJp/7FKGIrB1HLoDNg+6kncOhbfhD93T4e8
	dMwg33lJDuS9M6t5ePGCVknykbZhEgG6laVYVT/uaOoL4CtBltquXUFJXD0Ck+BTtDA3LZ5azxS
	UbLcbUgD9tpQcljer5md6Hv8BLrMAX3RWc6VDW2xcvauqgrVXcRbDE/PDbjeAWPdy6
X-Received: by 2002:a05:6214:f61:b0:90e:9361:d035 with SMTP id 6a1803df08f44-90ebab8194cmr94657936d6.21.1788385411027;
        Wed, 02 Sep 2026 14:43:31 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ee06d30sm28372546d6.6.2026.09.02.14.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:43:30 -0700 (PDT)
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
Subject: [PATCH v3 4/6] arm64: dts: qcom: monaco-evk-ifp-mezzanine: clean up PCI function nodes
Date: Wed,  2 Sep 2026 16:43:18 -0500
Message-ID: <20260902214321.1721477-5-elder@riscstar.com>
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

The monaco-evk-ifp-mezzanine overlay defines a node representing a
TC956x chip which contains a PCIe switch and an embedded endpoint
that implements two PCIe functions.

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
Fixes: 5a67924d2fc57 ("arm64: dts: qcom: monaco-evk: Add IFP Mezzanine")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso      | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
index ca5bf0fe5ec6e..4f727ff6ecb61 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
@@ -117,20 +117,12 @@ pcie@3,0 {
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

