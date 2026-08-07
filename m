Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7C4367B7B
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 19:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786132734; cv=none; b=LGYoOXv5tyDE/o7Qm4yDQC0gTipZtrdLQXOr9VKgJmf7dgDO1MNZPG7hrPo7VmkBJyPdrik4i+Hx8GRg/YWbx0pGo7iuqPLgtqKe1Q0nMbR+mk/Z4Jq9A0zUn0C+IYx9+/hW821ymkQbHviUv+USYcNl/eiVqAeDXjsStKK/jPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786132734; c=relaxed/simple;
	bh=q92BmS1TMU4fA8tTbEfubmt9qSqkiCe5co5TbaZfdnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dZfFLbfQmikJSbthNYSCRTJePlj4hVPcc22pFrS5wDdWxF7K996YXZacMupPy7t7ekVtNQrHz3Czd+qwWJSKAzSJK8UUKSaTt0SFtY3Saf3XQuh+fzaIpgq+K9vzdpf6yUatpfW5fG37lbJXTkDE1m3Z61uGLsdpx3R+1Xc0Ckc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=cKDPjdM0; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="cKDPjdM0"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51c5382806fso38548591cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 12:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786132732; x=1786737532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f69xMGzZrOlWqmsW9pivu6gSwpVQmPjx16bBsvNBC8E=;
        b=cKDPjdM02lZJRUNgWj20cuSA45stFJu/M2CPeSdWLANAfMlZ/DGDKm366wKYIUeUJK
         ZWIIdxCVIKkP7zC7by0spXnD7bx21KsXpOLicl4qf7XDnKtQ7WQHYInfpEePOPnU2OJe
         fCBEY63FOVdZRCC7DYO3KvXtHWOEf7uiXYL7k1T7h4PLjvszY+zC8+LHvzTa7kS8WV3E
         U8zcdgXtjY9qqEc+vjMvKQ3rfRczzpboMjK8GLgrwYcpBqkL/QPkEXcRXUwMUQkhGV9N
         35fHuyDyf8vu/3qqkdPBjfDEXQphfgGzprwPmeC11pdYCMKtd69j6ESMG8ho57X8lvNV
         elvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786132732; x=1786737532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f69xMGzZrOlWqmsW9pivu6gSwpVQmPjx16bBsvNBC8E=;
        b=RGLsijFnz6NhpdLaBfGZgjAWLMrWagt+nzzE/u3uD/4JFZwa6Fbf2vLMAj3hejMzw9
         v1YQQMgiKoeYMQav/bCJzixy5u44sYe4z6NQdcsqIkbD/WE/CnC8Dldd8tauSbsTNVeY
         DVqUhCK8819LCVh9kw5LrbFwBtBqHxnqUC6yjvsLVYOSoEBjUpb5FZD9Pvx9YGAF7xLi
         ncHAqwcqToWHp2vpjWY4B1wqNu56CM18YyIi2y1izlBTyf8W0regj+0OmW/zWvkG5JVy
         RGotodOeehQACPVgab8ocBPs1/3vqMrZBdNwU7v3X8HUmKRjUVP89RWRTiuA48i9kS+P
         rprw==
X-Forwarded-Encrypted: i=1; AHgh+RpHcGOqSIN97DLrWIv1Y/MLJyrlMouYGsp1vGg0fXrxYYTurIJzhp17g+sqanyo0/AbwALuat32u8DvjWDe@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1pn/V64ylG4ZWYbq1UAkAOth+RD0ZOe/Y9mzopqoIKwvSkPUK
	qmNsrr+p/7UnYhy5413m9FVHYE/Gir2fixaijd8RuygraOTpVn3lsRI2EC+UzHybe1o=
X-Gm-Gg: AR+sD100dnCja8B+v2iLUG/+6SnArNATrZ6hTIEJ/VRBL9u38vfzKp90X+RDKblU5Pb
	Eix1c9XsDnu3KLmj53bNncXw/KbVYRPeoBrsuCsoAbMuUtCWpTGk6+N0QVKYmRPjZHSFBRTUxYz
	6cXJ1+iQ4CXPKQn4ys4y49QAe7PPMox/xs4TPF1rOAEsDvaz4hjyGWwqJxLSnkXuz4IJ5K08w95
	4Fa/p6L/yq+jKGkYlSteNALrMKGCC1Bc+sTY2Rp8M/zfiLWklJxxq4blDTFkZgogW5HCzJmjQiN
	aUgAKEaz4T+TN3OKHOZCNT6T6YKEIlbWoBzJmpXtfkKFLeBR2LUbWt7CYTy9hjnI8U97vtqLMLP
	HwMrkD9g/LNNpM1BycQYy9TltAT0fnBi1rf6XPH/kER8B+e8gh6/ceN8FlsV4pwbN6aSXAy4s+F
	FMpxeX2VKi0Q3qw+MchEw8Laf/HCHDJQm41dVBRWYuMlIzKYVA/wh5miL6XpTDRMdz
X-Received: by 2002:a05:622a:2448:b0:51c:1117:c79 with SMTP id d75a77b69052e-52d0b193284mr153445671cf.24.1786132732042;
        Fri, 07 Aug 2026 12:58:52 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908a92ff366sm15824226d6.32.2026.08.07.12.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 12:58:51 -0700 (PDT)
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
Subject: [PATCH 2/5] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: clean up PCI function nodes
Date: Fri,  7 Aug 2026 14:58:41 -0500
Message-ID: <20260807195846.456079-3-elder@riscstar.com>
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

