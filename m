Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5363976AE
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 15:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350185; cv=none; b=dWNOChrFlmPwaemCyszN8VH+Ovxtgz5tWirDwLqLjgoJ8vBHxXRmG6O62V2bWsz+leYW8PdItGXBqZksI8A/gnJVA8fJbLCztYhjki/eTTnvhsdFWHrnH93NYfKLnsXxeF1rH+bcgPte9KkORjLuff3S3p35ZEoxm+6RvvCO+h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350185; c=relaxed/simple;
	bh=frWnPQsAsHwq1WTd/9q6n1j47PwQpCWFOmdGfvwQGoM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pSrwJerCJ53ExEV7l2veoviTcX9e4jKa/KS+0F1gZbLiBVLIHKE4qW7kVL5zDWX6AAhpYmvRDuw07WMINHUCfJjOE4rf4q1THmOoe/WywHgLky/BpUA3v+jAmNVWZWDruazS+VqT3Nd68hCULA7FdptEbD/lL1Xqx7mtp6bgAfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nzw7nhTy; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nzw7nhTy"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493b6f1b14bso12659725e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350181; x=1783954981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LoayvTOy8B3Va9ZlXEOzucZkBIfqtEfrLl72tyzTD0I=;
        b=nzw7nhTy/5xylWKOrJpqlTzVixQqZ3nxvMI3/7ONNGIYD1a24xMiXS/KKvLuzguJek
         8T0HLE43ZH66vUFZvssK1d/pbJmdbXBHAkwOyaj73xmdyZyxxqbwfHLzxlkKRPiXPlHb
         ckeUZCnufADPlDYV1LyYaQgP405jxL84UaWKy1eZ85Iw+kEw/GgI/kOdQly6vVbJd2ip
         R3qHCIQrTksmbA6ptUsryd66qLNxv5FbeUnLxVpaNIalHVzTX4szkMb74CbOp/ai38Qk
         Yovkvc6etOhs4oBiNiKxDIHhzkn3MNQnNWXPmo2hfklYjlZGr7oNIU3BJM6crRPP7pOW
         XHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350181; x=1783954981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LoayvTOy8B3Va9ZlXEOzucZkBIfqtEfrLl72tyzTD0I=;
        b=TS6aQMpVVWywsdbZ66DNVsNFtJRN0OtQza0m+3UBYlvkQc3tFnaN8/kqZf2CjEEa+C
         jVrKzT51NMZ63YQojPs3m59Nzd0TAoSXqAkOOGRLFoJely8vNb1wiqL5OnoQ5f5ufhIJ
         p8xll2FEPoUXkCdaDJB6m3bemEIOuV9KVBnal1HXIoaJIYdXMCj4xug4HSw/v/9ld/tS
         LKrdgURQxVIYTMwdmzSswVuTF2Sh5D2oyxecRi7mtXzVwlSfP9FcX8dbSxIxLajW/W2H
         DxgkD9vLZGH7KVIxLpyDA+U4wD+Kyysco3VWROwm1HPUHl6kdDvpzAI7QdXvyWLmFpf+
         Or4A==
X-Forwarded-Encrypted: i=1; AHgh+RranlM6yKgW3CkzG8q+QzOIFYrO8Pv8e+GwiPbEtJdj7l816IGlHVdhxpLNZyLRQ5qnduz6Yh17wQBEhBX/@vger.kernel.org
X-Gm-Message-State: AOJu0YxtK8bVjbkIBuEq7paRTl349fmvDHbtPKCYccXEQpdld/na7S/Q
	mlXiHaeC5XM35vO/5hBdXgSMVuZuGuYpNhTQWtEvtJC9Lukj7e6fDElYndrbCIiShCc=
X-Gm-Gg: AfdE7cmlaGx8w58aMyDmMoLEDIPDbuhbz4+3KcPoFGumrlcmK2PQDFqq4oT2vySSM9e
	pIW5jQ1eQx+AVqsCRJAYJOl1VQ5xb+KhAUO1za14GrbWccP6+s+Ietu7jkeTxhVo+KzWZkwBqTf
	E7sOPshWu9BZSCZHtuud547y0MRlar28Z8yRvYRz/LemZs26TUn6ORaF0Uhn2I90qLW5fsCDsxY
	UGaAs0A8TvwxP7BygiA+g+ml9OocvlZqxhKFdn+gFiJD/vicA/E4ZLf1HAjIDA8keDoeKMrdfQZ
	ZD2bqzQVo2i2GQNGXv1YWtRpdRJqICa2pzawuUNkjIPuXlETeAcCwkPgKW4oVhUKFCu0i/PWxrp
	3sn06nnYZrLeytaXWiSjZcXefFRvNthSGQZ8uxPoAxOK9WkI60tjcCwMbcdiLi+EJzorzetwnct
	GtrOMwabRTYcjV7FuDNWDq0jl3G/XBP6qKZiA0
X-Received: by 2002:a05:600c:4a21:b0:492:63c3:8eeb with SMTP id 5b1f17b1804b1-493df09b53amr7429595e9.35.1783350181202;
        Mon, 06 Jul 2026 08:03:01 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm397741625e9.4.2026.07.06.08.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:03:00 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:02:16 +0200
Subject: [PATCH v2 09/12] dt-bindings: clock: qcom: gcc-mdm9607: Drop
 SYSTEM_NOC_BFDCD_CLK_SRC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-clk-mdm9607-fixes-v2-9-745565101869@linaro.org>
References: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
In-Reply-To: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

From: Stephan Gerhold <stephan@gerhold.net>

This clock does not exist in the hardware, it has no consumers and
reading/writing to the registers fails. Drop it from the bindings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 include/dt-bindings/clock/qcom,gcc-mdm9607.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/dt-bindings/clock/qcom,gcc-mdm9607.h b/include/dt-bindings/clock/qcom,gcc-mdm9607.h
index 357a680a40da..246bce28137e 100644
--- a/include/dt-bindings/clock/qcom,gcc-mdm9607.h
+++ b/include/dt-bindings/clock/qcom,gcc-mdm9607.h
@@ -13,7 +13,6 @@
 #define GPLL2							4
 #define GPLL2_EARLY						5
 #define PCNOC_BFDCD_CLK_SRC				6
-#define SYSTEM_NOC_BFDCD_CLK_SRC		7
 #define GCC_SMMU_CFG_CLK				8
 #define APSS_AHB_CLK_SRC				9
 #define GCC_QDSS_DAP_CLK				10

-- 
2.54.0

