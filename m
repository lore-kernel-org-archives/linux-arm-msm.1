Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC0D23395D
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jul 2026 12:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784983634; cv=pass; b=JquVyYm1U3vhfIiFnyl4gZqi2NMFsFBBFV89ACWWtYsLHXnabjO7sN6VuXRAb9sVCgk6LvUtCKsxJpDmvBkCYl2HHqQ8NFbFYZ0A+yLdZJEEupn2qTCz2fWmfBq78D6XhDQ4HoN+Cpk9gx1ohQ2d5SuzPc4ts+N5P9MfURn4qZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784983634; c=relaxed/simple;
	bh=nbfEHiFg3ujAMDl8T5Sowr96/ZasmMbVmzrGHikYY2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A+6kLtOk8oAW+bqbrAghTcv4X3hsGW3Ir93DidnDE81SX/e+UYvfCH4saRfz9VSuTbr2H9QUEktPcerbzsVmBsCbU4M09PNFkC2+Q5J/oiNTMHtbQRaMOGsejQXmlomHZ3yfVuTojTH8PJONpcCPOaR3K5CmtVbNUNhgzBCWxG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=hzTnJ1kZ; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="hzTnJ1kZ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ce7d2adef4so16616255ad.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jul 2026 05:47:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784983632; cv=none;
        d=google.com; s=arc-20260327;
        b=CV/1i4BrkrRux/n8oHQZowBigA6IQb0TYC+kR+RkaTMoPIWcautoOD9nRNhsYX9rEI
         bDY1ha+PZ7re7JVj+nqxPXZ4aCb48FEHPyOccZUQtnbqsTbDcGjLqQD3pYiqi8X4bc8P
         JAC3cCeo/Tv78KeOZS2CIcE1PAKrUBEaeVSr8iIP4KL8l//iAg9MsDufRwOiTdLrnlnT
         GyS6eqnGKtbf6DSnrjJ4A7dMGyp6gEcya3a6q8TlJQhFnVkXXjJfeIGGbNkhrwmTYM5s
         zw2fCLoHZKStEnSKqnrCdCBa6ZtvvxFdl/rYPgprSBMAisAnoQjW4A6cYkMPRV010HXA
         aHMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NFb3xFmMVZz4nbO4NmTzoVtr612rRjtqaPgKgbVu0P4=;
        fh=5ZY1y7sxNzfq/nsCR0NggnEorZ/cYbwqCNCL+PBE7mU=;
        b=sk553m1aUbk8w7TPwPPpcvlGK+E79Qwv18YrYsz8p++BvzMya0jcY1j18tq+T4i7Ph
         /9bO+btMDAAI9ehJECluF2kjj2ho6YclzdBdyHqsaBycOSXSxYlWr5r69Hjbofox7ntQ
         KBIRHNI79caU4/y0CpB14ZEYDLeTLb5wlyHwXu+9L26Ait/iSvfYGR2SKxjK2vb7MmAS
         3mi4IgIpziAlrJ/CwO4/KxFtm2BAeDaM4z57NxXqvxcETaiMXmqFkB4J3YlmUJsnzj+i
         BvsRvRKuYYXniF8Bd5UmquYWJngZX/IqGt2qiaYgHLX8cioacGppTD1FDSAkZ1Q/6t+H
         xtpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1784983632; x=1785588432; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NFb3xFmMVZz4nbO4NmTzoVtr612rRjtqaPgKgbVu0P4=;
        b=hzTnJ1kZ8VTPX2spDgxKSesmfIj1g9m2IqHc8k+xpgUndOW6+Jz0Knq6axDOrDSES0
         QyWZtsKv1WXuOS5NsC/qsqVOud+XECSiynAMq8yDBGnwOG364hXikPmLhcIVxbMuU+b9
         cksvPr90Bwm2pExw1Xbz2yowaCUyCF/tOS80s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784983632; x=1785588432;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NFb3xFmMVZz4nbO4NmTzoVtr612rRjtqaPgKgbVu0P4=;
        b=sK6t9J8DICXeKAMoO6R5iYOyUVO6GbtcANRs5Lj9v5xQx2YpoMr1uXM9Sajo3NYz3Z
         hpdZX+QjXDpkX0iwAQwQ8Me3NxgNstLd0Rc85XvLPU0fQ2bhO2t3XCT22pfjNMZQMGYe
         PDKlOBotsanqE82xk3vHmnTn0DbRxnY1/yOR5o2uvAXzcoXAp6GG6Ch8j6SiERwJ5Zmb
         0CehtuvCfq9eABTRrfa9FXhOZLAkr9Gk/1XI+IDzyLHArH4j4HVcZ9qK8QGyFGst/Acg
         Xd97dDWhg19TP3t9+WM+SpHge3I2iUS37Su12PZ9TObrDLQ4GolntEnR/0o5LMpKg1A3
         5jKA==
X-Forwarded-Encrypted: i=1; AHgh+RolI5Lm54gqJ++hoWQO3UKZZcUR8IIF1ObjdGj2EK+7z8XpbmKiE/yxIv9fLyUf+kAxBGqBoYAE1N/25NZY@vger.kernel.org
X-Gm-Message-State: AOJu0YwJt07JHDich/Ytae7lg50/5w4XeaM+kCKo1tLh2sTpIa5uhAaw
	j/4GqFSF+Kvokm81sg9LtLm0/pWHnDz2OZhkyOF7wmDTQUkJNSQnyx/eiZYzAlyy2CcNB56JQbj
	uj/p7sBrBrkodDRb5wXQwJZAkJunj4aHwvLUwk06NEA==
X-Gm-Gg: AR+sD12/MhJF4JpoH42XpuhUkOO+s7orj7L6XRx89t32n3f6uQhQ768M9KFaurtkqb3
	K8IzufFj7z2v/mruLoaka/4raibYdCesgPArl0D87rHRSJR0PRRa6UETvSlNKaVcOmZnLSkJ3cK
	R0I6/gh3osnGGxkZ340lP025dEbzynVtfBnRdc4Gqwyrp3V/Bf3aHJ+oeS2/o7NehqIcRI9zaok
	8uidte/Y/1XOnY1cwjOHaQhQ5YSUiCWgrlJIbNAK6oyl123/rARfIvG6SC/Xgzx0WEinJwdlry4
	C8wxs+rzhMZ6c/2im5XIhzX5u2RuBNTBDidZvDfmmDryaua5JBAcj1z+ZuT6wBLSIBDL/8rpD+Q
	orOmxRkUL2Q9da5Ax4RNJJFw9qZpvKNF+ChFANytp/M03xkiVifLvf/gwDgnhOER9wcwoQFaA9Z
	Xb1c/FndTXJg/sQb/1GK38kVVZeiqIGDhac2NWk7nDSy4q0QQKRQTC/sVRQLlu0AgJ8oou1g==
X-Received: by 2002:a17:903:26cf:b0:2c9:97a9:2098 with SMTP id
 d9443c01a7336-2cfde895b4bmr22242195ad.44.1784983632412; Sat, 25 Jul 2026
 05:47:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
From: Daniel J Blueman <daniel@quora.org>
Date: Sat, 25 Jul 2026 20:47:00 +0800
X-Gm-Features: AUfX_mwTJNR7-hRaq1ZTUYAiX7Ud5gZGyBy8PdA42w9wDa17cNUs0zXUmHoUAFI
Message-ID: <CAMVG2stKmNxe-mdqbqO4MDLDrJCiNXw9kt8SA8egYAmByf9fKw@mail.gmail.com>
Subject: Re: [PATCH v12 0/6] Add dt-bindings and PHY updates for CAMSS on
 x1e80100 silicon
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jul 2026 at 08:06, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
> Changes in v12:
> - Updates camss sensor find method to find the sensor in the CSIPHY port. -
>   Neil, Vlad, Bryan
> - Drops dependency on passing polarities and positions. Moved into CSIPHY
>   port as agreed. Neil, Vlad, Bryan
> - Omitted mux to CSID as discussed this will be done when splitting CSID
>   out as its own individual node. Neil, Bryan
> - Updated Reviewed-by: - Loic
> - Link to v11: https://lore.kernel.org/r/20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org
[...]
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Works for me on 7.2.0-rc4 with 'qcam'.

Tested-by: Daniel J Blueman <daniel@quora.org> # Lenovo Slim 7x X1E80100

Thanks and fine work!
  Dan
-- 
Daniel J Blueman
