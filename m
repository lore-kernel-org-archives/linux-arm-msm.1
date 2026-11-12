Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490393;
	b=wKt2ge1KwDI/PZvE3G7+NRB7uyZdiHsJ6mgJPaea9JZrELQdyyNCAB/SF0jIWupgOvTh
	 WF34KRVphvJb6k078+8yMBoUf5yojmlmfVLlfs7mDGoqPVgOGOuSe1hID+C7fMAY+imLz
	 Aqey/6O6gNSZ16vT5XCqIfzn0grdvtFXSyK26qXdEl7eFI62u/sqnKCMU+rtgkBVm4s6N
	 jrmsXSf1pNqdFErL6VHt1ftNuFqWVV8gvT/sdOSVxW/hlGasM+P6I82j3E9LXXkPnLBCP
	 mpfwYeNEB3VTaY7LLTXciwwmuJN2MH72zpQ/cjLQnPkPOBMQR+ZSE54PDkIpgi9sVBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=iflmLAY0kf4050MDdL5qSOXphw4HFfvwSOJfmWdwNFw=;
	b=cjQZOjefiSP73bWMdtu0sNQcvXJSgwYSq/Fhyw2U9uMisHQfHfJqr5m6PEDMXOYJHVNK
	 4rJ+CVlcZUf28aC4iI/s5Bvp3uCbWql/YUBlj+BrEj1x3yHFi+HyS+xUHNrzmvWgmR90N
	 2vLALCCN56TkJni2qe3x4LLJPJTedqwHRC2YFg0e5yVbEkfLJaK4fwfhyTZausu/IqFpO
	 GnTCyJFcG4P8mzhnWemqd7sDW4x+fM80tpcbcU/jokLnRifY1v4aJHJoSvF/JH5nl0D3w
	 pq1Y8Hwa+v2TT67jVvNkFwOm9UnfVAZMeThAyjvDXKuKhyzLquY3jXuZa27L6E2DATw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ib+38hIj;
	arc=none smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C50B606A337
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 13:33:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C50B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ib+38hIj
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3acd239776cso32634121fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 05:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794490391; x=1795095191; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iflmLAY0kf4050MDdL5qSOXphw4HFfvwSOJfmWdwNFw=;
        b=Ib+38hIj0RFGoFOjrvPfYEyLa4R8naqV7ydkUoB7aq201lboVxR1gaVYnmJVl09jJU
         t2N540G5RK8oyUPQK+JKEaoOeo//uc4IZDL3DWy2+PNvgm4hgGSLFDtP1WaOT5wwbM+I
         dr1g2FfJgZdFzsgn77FGw+Jf6aven/M/Gvo22Xr99P6FD0ayzE+tHxUM3ynEK8foxkx0
         Oo++IVge9uKDYRb39qZj18a9e0mqxlc1VRINBgF8tceBnQjsZraz9OgJLX/srOOs8Ufi
         h+PPH3nK964dN1uUIMXPYmfWGao/Lp9Mjs+pIt/bCNfOuEo4HCoQ8FnfwjzbZq324y8z
         Kb4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490391; x=1795095191;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iflmLAY0kf4050MDdL5qSOXphw4HFfvwSOJfmWdwNFw=;
        b=XMtvdkLjohjy5e6aLIH+C7cRZDMMZZ5braHkKWaOyEUECJsCB3xzgXjyHaznMSVbEv
         H0tk0mBLLvjtcmlmZLVV6f9FWLrGD+ZnIDW7m2B5JF1cLWVqfkSXkzNKa+Ovc/1JSjs8
         b7tfhsfZoAd5bJPsX8JazKu1n0aADgxtLER7AxeCYMwI8oaNFvY/2S5yGovcd94vtV+b
         3x47lSZ/iPd7RpWSQRE1ezYDWSnW6yCiqmJOP9ojgcrfvRRCSmCOw6jyDS16xTcEPsf8
         7djIpMZBKixUY5TdcROHmnwKgjpE67jFx0FD/xWEm+nD2rs7C/9nVqvlkm4BK211IhkM
         dJpA==
X-Gm-Message-State: APuU4Z+8YUu0xVATfJCnX7VkQuRLO8U6v3vFlFpgelgmS2lxBNu2X5cD
	EkLhnwXNLJbM2e72/AD/RyrPiV9P5HD0RdmrUqAP4pnvs/iQHOgpCbTR3H6qqYfN
X-Gm-Gg: AYBFou2QMxpYfV2VqOGVkEMv2pVrkOO6gQ1NSFeQAHknmaHvK2s0+267puCk0+RsRTm
	FUJxgB9ikcXdf+3lT2prZ4Npk0hG15Vll2/cEVseX4FKCINN64FwDn+0P4wuIJZukgOIDKcAKxz
	7lWjy78cuojKRwYKhVptqyhADJlukaZvn8dTnXBIQWt2O3d/Jlhb3Vjcjd5nYVk8cc6XTxi9JZb
	iSv7gDYwznxbYXXTyMoLIymSMG/65hTvTlb31qVhBhfXgaIbPbXYu09M1+kunoXhARYS+OfT40P
	E5jVN7VchjTrgbfWgZQr6N1VS7UU4gEZhFYsgWUE57GqugET3wGZCjBt0Q98VVv7ksnkPkkzIB7
	Apc0FKlmcxKt9R/srcGtIB3dv4CrTtlsDoMWdLXkFD/sRQuS8MG1B6PZEzfXgJZCchgoWy9nUtU
	mvSM40Jj9m/Z71JlrD6K6BlshKJi2dnPoacZ9fGuUtymKPnTqdn1hCCpMJFVrGnSmoFkvebo966
	jCM/5ahzxdcAwsQNyh6sccS8Xpwc6D5lgGldiJwNrGRlMB/uBIRyhKVTbMdNfUMJIL2lHkYM/0A
	/kRqu8hIgQLovwJz93p+SVtX2COtYMYwNxMM+iSl
X-Received: by 2002:a2e:a915:0:b0:3a9:87c0:7737 with SMTP id 38308e7fff4ca-3ae126b980fmr14214761fa.21.1794490391466;
        Thu, 12 Nov 2026 05:33:11 -0800 (PST)
Received: from crispy-cucumber.local ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae0926c65fsm19217631fa.28.2026.11.12.05.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:33:11 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH 0/2] arm64: dts: qcom: sm7125-samsung: add grip sensor
Date: Thu, 12 Nov 2026 15:32:57 +0200
Message-Id: <20261112-sm7125-samsung-grip-sensor-v1-0-d45dd9c845e7@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CQAwAwK+Qnm1CK7iJXzEeFqhrTVhIC8aE8
 HdXPM5lNnAxFYdrtYHJW12nXECnCvpnzElQh2Lgmi9ExOhjIG7R4+hrTphMZ3TJPhlypDoM7Tl
 0DUMJZpOHfo78dv/b1+4l/fIbYd+/QIFvlH4AAAA=
X-Change-ID: 20261112-sm7125-samsung-grip-sensor-2a107d537b42
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Samsung Galaxy A52 and A72 use Semtech SX9360 SAR sensor to detect if
the phone has been gripped. This sensor was initially added as part of
device introduction series, however, an older revision of the series was
picked up instead, which did not include this sensor. A link to this
series can be found here:
https://lore.kernel.org/linux-arm-msm/20261024-sm7125-samsung-v5-1-5a602ab00626@gmail.com/

This series fixes up issues mentioned in v5 and adds the grip sensor. No
changes from what was submitted before are intended.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Erikas Bitovtas (2):
      arm64: dts: qcom: sm7125-samsung: drop unused label
      arm64: dts: qcom: sm7125-samsung: add grip sensor

 .../arm64/boot/dts/qcom/sm7125-samsung-common.dtsi | 48 +++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)
---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261112-sm7125-samsung-grip-sensor-2a107d537b42

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>

