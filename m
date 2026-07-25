Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2E827FD4F
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jul 2026 13:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784984609; cv=pass; b=YkGpjGL4vXka21WNubRhxJdzElcf0behtEmDQVx6OSVgaCC4sVNzUijzBaVBbgLsWEDqob6QUeWNXNWGDc3YszyiFFCSWL7SlhNrp2TE8CX6HymkUU5BbwzYOADAwxtgeLqaapcLJgL+7V0DfFoeVIJNtcVAsoLrf+6Ok2yeBv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784984609; c=relaxed/simple;
	bh=dbu6UYmI3kvfiQA2rZZsMgSOUK8VMN5tArWIhMkxvRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uJG++bD0n47Mp2N/np8nQFb1Q812M/cTUPJ3Yk68terBC5I4fHJdlRdYqgTKDA4qvA9ziIGCvlIvhBc1mMwKX8OdPxfDwJZv3jxtubBMxF8v4WS4hs6EwklyOTevJnx6iCeS9iW/G57jsjFOz96WdXU6NjK8PvGigTLDxdsclJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=KRpMXh7t; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="KRpMXh7t"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38101f85591so2161477a91.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jul 2026 06:03:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784984606; cv=none;
        d=google.com; s=arc-20260327;
        b=m89xLQ/q+2i6ySWItigRLl2Ze69vZs9y1rj0E09zF3nTgNMfEp6E3qlsjb5COw8qPU
         iLs0gvQq7rssQs52KY22QFY1cAbjXvFw0YvCdD797Ww0WbKR8BuCGC5L8LfxL+VTtvtg
         uGE7O9eGriBO4955ty55I9Qx+E7dHqoi5Q0zJ27eTqjyYXTPrpsL/47JPN2VdJdgWhAm
         gAY11Raf9acVL1tnB43x0z6JJRyztt43eWsOTsgVhfvOmAXAkTY5SgCiQ6diqwWqrWXg
         swjsjozm1dKiXaWlWDn+xX9LqGe945+Ww5pyIVwAUjb+l3kXhMMVnDbvX8D9KL6FqUuh
         knYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6s4tv0lqxlKjKfIg1m/4hOF+FjqSFcDxkpdQkfgs7fs=;
        fh=J8RtqBGzmhgfWdpFgVTOZHbxVTqY+IvGmyrIzBGTCBE=;
        b=Yv2Rf2g6ezCLAAqQjMkAU4ekLP8WwA5xUkBKOhlBo/PYVYew01H765ADuVY8Vm/gbi
         milNWSChEbsqOg6cCxsoN1um8cVmj63aWJQ3s7NzpFNyladavoYE35Ii2YslbK4DMlbq
         6TI2CmFBRHqkNQ3GcrbNyFY5F//QyroOfdFJi3utif8tBvpaAAomdsdlg5DLq5F7+pj1
         SMBTEMvZZvZ3ZIv8ICm9Xg45sqbivcy4zElHhzVpDfZXSgW3x5GbUl6rJz5SzFUEIOJW
         VMaA33IoKVtTjFiT+o03ANvZxNv8ez6vWZNGsa988W+x6ZbPkAXsPTpFg5aTWBQDY1gF
         lbEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1784984606; x=1785589406; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6s4tv0lqxlKjKfIg1m/4hOF+FjqSFcDxkpdQkfgs7fs=;
        b=KRpMXh7th20yizvygWpJlFeu3UDDGc5ldEanRGSYzpNTV3yhIEZiVZE7AuGdmu6h7F
         M0/xZfNof1X81amviqBdzQ1htRxPIuqNIb+O/jWGWR7bajvPd20280O/Ca2AWREVkyEf
         0VDX9WbwROTNDwsSKj6258ih837ILc7vm6rOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784984606; x=1785589406;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6s4tv0lqxlKjKfIg1m/4hOF+FjqSFcDxkpdQkfgs7fs=;
        b=avk9UgkJiVdQLNgWo+r9cZnzFNrYQYmiZlnjp55AS288C2JadInAnszne89fHInPvw
         Y9qpAoBWSgz7p5kwKaBEZBz5AVW9Zq8BkmERam0AXzFKV0iUHxafSeO4+fhwZWkuDql6
         KqdIrTNoWZPbHIMLw63Um/FsQ0TBQMeAUAvbtnKkOKc2ZpEFHihwWEEdiMJvEdsdKlZ+
         1WdEo47GGxTpm/nhHUwBaOjHMnxUTtKly7AA7Gm3uf88QilDERnLi/gdalDE4PPELK4U
         AuvWbDaoF1bkJtIVGqWGQd0xuYivFHfTkrIuCOGER7tJQRDw46PTDF/NUHHnLqWZ2sz8
         SuLg==
X-Forwarded-Encrypted: i=1; AHgh+RrT9eIxjeIJvUNoZRVpodlWhMGpDACKM9zYiXhgT9znA62wCi+rNnP4LfTanv7xtuvBZuSbhM8StmmQUYgy@vger.kernel.org
X-Gm-Message-State: AOJu0YxcDlMvRDj80tOIY4FPgSUsnyBGy7l36zf7EYJZ7jWx4m0PfAaP
	3MSaBERCpMuDsc5A+q+smJ5CzceprZDs/kvQsKHGm2EUanxkfjETtDzC9gJM5YyMHmvg8RTKI8j
	KDaj6DSyaCvwE+pgbCsJEMjd92OquPV9lZuS7ZRGNOQ==
X-Gm-Gg: AR+sD12J9L1bl9Exqzun/xiOCxgNch0abcO1fNS84fTG1Yt58q2yQT0eVWoYfGK0LLL
	TpCR41eeNlgohFpnlQBgdX+np6GAPvCFsGB1z/WnUh2ozxylVivzEc8NmGln4+UHkA/4p4M1pzg
	MS5fTFM/L0zM+1QdVXQh49fXEz9Q6bZtddjlr6xnt3KU64MUm6PPpj77zCD4BsihDq8GdqlRoA+
	a320374rhjHFU9zfYrqixV4SXVU5zIFWDki4NbfwkFBlJju0QpKaEZi/8M0i6+yriBHiYe6DIRD
	wuuouTbEhuLkHr6BhkHeildX0zDStkFfWUaAElhUeu4N7xYcApScCi3Tc0ZRoGt+ZSh/QGXEK0A
	0RPokwg15raj0ylZYACPWM8/H/RbCGV90oz4AJVqcfMaFOnR6maKcR1mVhmh2k5Hk7F8LMe2+lJ
	47FMudmZptplkyObBdPVE80hntkMZqT8a3JUxFSQB4ZLOyg0SSGNtU9YKIrynFO3ysE7qhbQ==
X-Received: by 2002:a17:90b:224e:b0:38e:c232:9d2c with SMTP id
 98e67ed59e1d1-38f2a90f031mr1691512a91.2.1784984606019; Sat, 25 Jul 2026
 06:03:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-x1e-csi2-phy-v9-0-0210b90c04cf@linaro.org>
In-Reply-To: <20260708-x1e-csi2-phy-v9-0-0210b90c04cf@linaro.org>
From: Daniel J Blueman <daniel@quora.org>
Date: Sat, 25 Jul 2026 21:03:14 +0800
X-Gm-Features: AUfX_mz8NhtAru7ACt0Z-tRBKmj_hK1Y1jnq_iZl2mP2Qxsq6jEVKI3kIp6vQW0
Message-ID: <CAMVG2ssrwmWVApoYBKeWt=th1Pq7tj-t1jxCndsyZCmubS7cHg@mail.gmail.com>
Subject: Re: [PATCH v9 0/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jul 2026 at 07:39, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Vinod, Kishon what do you need to take this for 7.2 ?
>
> Key advantages of implementing this logic as drivers/phy:
>
>   a) Per-PHY power rails become declarable and enforceable on a per-PHY
>      basis.
>   b) With future adaptations of CAMSS routing the PHY output to something
>      other than the CSI Decoders becomes possible.
>   c) Standard framework contract. phy_configure(mipi_dphy opts) / power_on / of_xlate.
>   d) Introduction of CPHY in this driver will elaborate CPHY for Linux in
>      general as there is currently no mipi_cphy_opts structure.
[...]
> This driver is tested and working on x1e/Hamoa and has been tested as not
> breaking sc8280xp/Makena and sm8250/Kona.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Superb work Bryan! This works for me on 7.2.0-rc4 with 'qcam'. I
support integrating this dependency for 7.2-rc to reduce complexity
later.

Tested-by: Daniel J Blueman <daniel@quora.org> # Lenovo Slim 7x X1E80100

Dan
-- 
Daniel J Blueman
