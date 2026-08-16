Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2AF1F2B88
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 13:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786887185; cv=none; b=Bi4d/2MyiKsTcgBqj2ufefNvDbYx2CkzBqQ2QG0G1pwDDUq76+ni0T3V6zwBIX+tlPCeoxyhRvwWycrKcgvIt6CEwGzdk9E5iEeQu6fOOMoXFVNYGxyEGm8hqXwV8oqxPqFt5Nw8utqzGOXnc7ooSg2sO0m4BwN67/vR6hss2Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786887185; c=relaxed/simple;
	bh=UV1HcC8o2lo+HDUW5AdLSlTWY/QuTMJBVWHiIzQQzPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r5AKkY/fsq0Xtpag4YubkDxY+47scrhR08/2QcVYRsmXoTfo11d1bDzrp9No1hEG8lPQKZbiqwOP1IYBcWq0svyFKmNVORFsFO356rX49eJGZz64F29Kmmzq5wjHHYNshEQZTtef5dCGUJ1VhvjsaACE907aVjhv6gFHY+ZUR3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y0HuSi1r; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y0HuSi1r"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso1831446a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 06:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786887183; x=1787491983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3SDYJOwc2/gQDBPl33jAG6mx3Nx+oLrgTvDpzH25eS8=;
        b=Y0HuSi1rtuQ79oa5vIL8cSPjWGcTqwAw8MOndlSWD9d0324XKLnd1qdd1FR16NW9Hf
         TdktRG6cIsZf67eEBaFzwiUjYwnOwsKorCgQT9VWKgbKU0D/L16Dt04g5LwojqkXIbUM
         T75LLxuRXqphaxgtUR/FMs0kaJjDgbp7/6p8TOPAn7/BivZveTA9SGi4Uj5y7jVG9Sg3
         4nhoN1ySQwNTS13mX6kPdaB1YCoYQFFJV1MoGBh8/YZrztdK4dCSsT7S9bA/p4d38n1t
         wdacvtY2aginfKtvnjFOJ+IH9cl+B6Wm+bNLfoACRj9OyyEMx0Ju7qNBPXRvrSxg9T07
         Bz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786887183; x=1787491983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3SDYJOwc2/gQDBPl33jAG6mx3Nx+oLrgTvDpzH25eS8=;
        b=ftRIt3NrOdvlIFBBtb39TeVg+VaNs8tnEZO2EoJ9C5NiV/kpbIuI5hbHRzWG0SDA76
         zmQ9F/tFjW+haFEULGhT7eCDB8O6BjgiOfK2duow1cMcA/Mu7V87wFFru7NVb0F64Wio
         Vf/P0lEY1av/NdDQRudDIL21WYo8LymrdbPVB+0foUAw9Gs6ts7A48hgqcjhh8/AWQ+w
         AKsv8C1inQpcTRp0uxdX/4vbJE8cpkTFyG18QLb125ngnfw7et8FAqtg8bTZBMkcNsw6
         6N7KIie1+wvwsR7bvCMVytZ12I1we55huwCN7TEjz+X6Mi3gdWk3IcuYEKtTNv8zcqab
         H3VA==
X-Forwarded-Encrypted: i=1; AHgh+RoP08GpqwkJDYIpb0NQ+mTYwgkobZHgyo5MA7MhPUn2jVVSruQxlHkFhzH4aC7kx6BuSIBbnjJdtFAB68ha@vger.kernel.org
X-Gm-Message-State: AOJu0Yw16D+ZqBAxtCxyvvHNlc9ZfhVLPNthlldfATCOj/69XL636Mpk
	yewyYp9Di8VaGs7jsNd1gep5T0aRIj1JvwIP9lbt4zmEL8zrwkBp/SIULYpIWw==
X-Gm-Gg: AR+sD11FBkZW9hp0U3lzg6NVRqSyml0vHZGKnaK50cLwnDpTKckNcUtD+i/Tj3uFtRz
	5zN3uDEoNk0gpM/hjO0USDzxIiARtkwufeVVcCcPlIrAF4Ijgi1yvbs4Tp685RawOlzcqc02FNy
	gghbRYkunYIW7oWrHfHhTan2z2gkmEVXjlyNKr3DSW69gvw0TqmJuwnNJtxFfdPy2Zyh3N9/FQY
	p5O5orQ+kV40O9vUpk3WQT81fRBtRYl+889F5r6vzHOstotDzbDBLG6/d28di/zZBQLkexcq7Tu
	SXp2zCFzHqzX9r1IhnGlUBvbc0hiWqX8z28EnbQCOCpj6qK3gsWEzL5xCSLy0WholT10X+Esi8g
	J3yMttmkCKkfZn+79YtVmhNQqg7o8OiFd8rTv8fksUuCJSoJZ/OKLpHPq+NaIohsbRKdd0KFBg0
	7FAb/PcmTHB7hTQmWTtXHVCeY+6m3Y74r2cOg4pl39X7w/J8kSHDd6qTZXUsvlHH0wt606YO5Og
	D0EmRznqObf
X-Received: by 2002:a17:90b:1650:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-3933b6f3882mr18152366a91.4.1786887183309;
        Sun, 16 Aug 2026 06:33:03 -0700 (PDT)
Received: from localhost.localdomain ([157.51.221.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm23599064eec.26.2026.08.16.06.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 06:33:02 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org
Cc: lpieralisi@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 3/5] dt-bindings: arm: qcom: Document SM7250 SoC and boards
Date: Sun, 16 Aug 2026 13:32:29 +0000
Message-ID: <20260816133231.10875-4-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816133231.10875-1-sreeshankar0910@gmail.com>
References: <20260816133231.10875-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Qualcomm SM7250 SoC binding and the MTP board.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6e..481041700 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1050,6 +1050,11 @@ properties:
               - fairphone,fp4
           - const: qcom,sm7225
 
+      - items:
+          - enum:
+              - qcom,sm7250-mtp
+          - const: qcom,sm7250
+
       - items:
           - enum:
               - motorola,dubai
@@ -1306,6 +1311,7 @@ allOf:
               - qcom,sm6350
               - qcom,sm7125
               - qcom,sm7225
+              - qcom,sm7250
               - qcom,sm8150
               - qcom,sm8250
     then:
-- 
2.43.0

