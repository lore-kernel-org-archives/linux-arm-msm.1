Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8F036F90A
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 01:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226635; cv=none; b=KZVQVnjF6L0BrAKkuHqJNVIDXOzULgUADaVuuECeipHS6uabfeP30CJ+aJSTOiIGMd950S3ASrfwdXNLn85JmxwUBokt6/r8GOdpI03mVvpBc9vJ+qgfvAhf0RC6BivUdIddvVTfhc5/DuHvv+lfTYXsr4Xi8X26KRQLPMFIz9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226635; c=relaxed/simple;
	bh=F4uRNuOP+2KFkvrPkqUx+q/oV97b0GVrD9D00eeSPPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZWD9b5VGDooZRjouGO4nDZiUWiWNr1wUavDfSTmU72BtxOwnoublvHFm+Mrf8Gn3rrN70slPp9cjsDsGuIFwR9ujdCHN0w1nxJI8wV10PlDoiXR2kkv0q54AOnvDXlNQ9Qcrt4+GA4rFRWV9qIGvMTgi4A5G7FRlmOO+92NBT2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=wDzHuxLU; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="wDzHuxLU"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-9391e3b21fbso244484185a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 18:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788226630; x=1788831430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YYcquwxkbINl1+Lmd2DxlHXKbpatPe7WMleZZ+FNZlg=;
        b=wDzHuxLUAoefo/t1RKoWQOp1IiVx1dfelzbfSxBPUrynU/Mpd0766R19as1KDm0pXh
         XxGKxlnFVnayAH2CAFuJb+aBnvmssmcAmtjLRaFX6h+WWZ8rI9BfU7/FCjugLBoMfbZx
         OpaIasbYpWm9d6HPZxQXApm5uBzPmwMFF/Dgp/GOAY8pZL02KR84NwifC7gt5FLqE1Zb
         1xTM5VVTpOF6MuRXOvleeLC1d7LQw6+YtWVUDASK9XlIgST/alOCs73Ofg0P+J8ddDoU
         av9iRMqMKmKKNmoa1WVG1dU4bl43aeyhm/cS/xwP7fZrLOp6YT5qJwTSMdFY2rqzlFj2
         HwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226630; x=1788831430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YYcquwxkbINl1+Lmd2DxlHXKbpatPe7WMleZZ+FNZlg=;
        b=c33TooNSyRMjt7Q2EmYxLeHdlr6JbIrNt5aI3yIxmT2fGu58qfZ8KuTv6AtyhOe3Tp
         idgdd4GwqmsdjnMj4F3jkdgTWS4yiTsFA/QteeEqkuP8t5bxAzw42tyS1rfgIudADCqh
         dIppS/C6y0KYYu1Je29zucT9/87YKU+ZZHi3JrajHEp903KzEzDpVw3Re2secswk3DM1
         zV1DfqI3NFp/39bmZWmnqkclxMxgcQVhdMAs7RTgQOfEYtVl1cYeoGILHQtUZ3IgljRn
         dKUTNzXhwDI/fYY+93cKqt8OGv+2Eteml4uB/OLyAP09AVUtXeNrhe//t0KfGzmdGQXt
         b3Jg==
X-Forwarded-Encrypted: i=1; AHgh+Rqo20KsA/9eIZoXrNv90oc2klWjQSDV83SbLDlj6IIFLTQ2E6BdkrHt5VFkwPB32le8KH2q+V8vKeKKP/4K@vger.kernel.org
X-Gm-Message-State: AFuF++kGauwWCWUJpOIEkFqjKPiTWo0jHnAo7LD2GTqRVu8cc5iRsDeO
	/hnf3u570YFSDLNVV1V7MWqOXaHsmAhjQIUib+oByofAeqg39WzYZ9L5Bt/+6Ima9S4=
X-Gm-Gg: AR+sD11pQWw1nSO/u4fYU8xG19MoUoU+x12VnyLGgsGT+/340ZkVl7XUFBuDOvHRPqq
	GnyL3VMpUyVr9uj3IrHCaKYkatmy5CLsWe05cEWUvit7MyFuMTmD7uJU5K6G6hugiWWWYYV79JF
	AaMwUnOVQdSicLYNuh8otPpo6DR9rqfUauLHdGNCZfrG/jP8VJ1rc3rBL27CQxC6wN6j0ET09Mw
	qUhxCPtI+lhUdauCNOLKU1svH4cnqq3SAiuPhy8VzHLY1z7Je3t2YwSN/xDmy8siZ6wO8QmwuuM
	Vkcjkqh2wGd3yera2tq3CRUR7v8yTZWGOKtq9IiNacYsVIsf/P1SBzR+vyAn3aXeC9cFNYbRSmZ
	Vbdom60qg9VItkdaLTnMUpRbjDWLkhDVXAXJmBUGZz8WmAKjVGLD7rA/MJYMg9FRPMrZCBD32x4
	nLk0IVi/O5tUiR5PXra94xpkzlz69yk96R4GMI20ymFpBrwX+Dmeu6gyH2lzEiwZ3m
X-Received: by 2002:a05:620a:4686:b0:939:1864:343e with SMTP id af79cd13be357-93918644403mr2684993385a.40.1788226625629;
        Mon, 31 Aug 2026 18:37:05 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9391703a918sm919265485a.12.2026.08.31.18.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:37:05 -0700 (PDT)
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
Subject: [PATCH v2 4/6] arm64: dts: qcom: monaco-evk-ifp-mezzanine: clean up PCI function nodes
Date: Mon, 31 Aug 2026 20:36:51 -0500
Message-ID: <20260901013654.1343537-5-elder@riscstar.com>
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

