Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECA73AFD03
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 09:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786354685; cv=none; b=oGi7xz36ptzUFOLaqp0H+HXm7/BKpDffGQcBAg/SanQLx5Xlstsu2x/ImjurDj0z6SX1JvF3A0g9z+a94YDJdG7IgqSZFo37W3vphiNl+PuuhD1WrLgj5Rl79lyLiuIIljASwnccNHE9up6NYwpNOBfAe2qurm00iB5ngz3RkkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786354685; c=relaxed/simple;
	bh=xIcVYX0/9wf5NDk4ZC0V2d1DNB2jwH5MbDCYWw3Ll+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mcgrlJ9W7vCCXr4VBfDZ9sRfjV9qoaUjB8udrmkSiFBkRgCAIgUmesXXov6MBTcEw598K/Yd7HsJGnbJU7VI0ZHGIgAwVeorCmXjJ74XGt02MC7J5e2PPCEVGkqSXEaLa+CfTYMtK9cIhDu+63hT+jlTY8K7jpo8cgN0IfkNIjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=X7WQzG3z; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="X7WQzG3z"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-480001972b8so602931f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 02:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786354681; x=1786959481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xIcVYX0/9wf5NDk4ZC0V2d1DNB2jwH5MbDCYWw3Ll+E=;
        b=X7WQzG3zYN2tH+5v3xjFipwf/LyyZ6ev6TwkMKo9w2LmqL1nj5ERVc0V+oitt+6Aij
         m+hcj+gK1FTFvPO8wV4Ooo6BiUcfmlOtIqrJUTn7mhwLJoXddzrEIkKsNjUi+qte5Xbi
         6vbh3HaODe/NlOafSpAe7w990wEUUo1Y14XVCZJMLYo6NK3qnMfRoW1dNxg74ABHEovP
         A++eaPx5yMepnY3Debr5lWfC8T5JvR0DzfeRewSgA+OmlmxMEyRxJYfVrjK22THCl0bn
         9ozKU+OV2/Ph6HLey3EuX5ttzTsjMtYK7VJl+UFs6i2ilQMFVwuGv68h0nNJoKjl2UzV
         AWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786354681; x=1786959481;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xIcVYX0/9wf5NDk4ZC0V2d1DNB2jwH5MbDCYWw3Ll+E=;
        b=kQ9KRbexvZkfL5RcexYN4I7cYsK4grXLEmP68c2nqZuFkDiHe5z/woqvbhaL7kjBWV
         vDea7ju+ASwVh9GImtki3gfnMkAsbTuRN0P+zZ4b8MHErerVJtgKSswfLdvUvXbNKIha
         b2W8yNHtRJxIdjnLig97J6Kaj1jH/Z4GA/jTm7qnF1AF7siQ6qavrT2ms4gReBDbplwr
         g9qJBGMcMzy7Z4EPsb5l1hUO/CMOzYljYja/ZC/npdfsEuPcY8JgqV18+93lY8FvQ7nf
         nr3VTePyXHynNkC8jG7X3OK6L6A4HuNHQxzqXBVE7bKKE0HP2ViESchCy7schfM/8aa/
         QJRw==
X-Forwarded-Encrypted: i=1; AHgh+RqllImZ+h0sCDIdFVNr7FAilW/rZ4Yd/BJgdqUfSwMV+z+oS2yv5nV+g8615Sel0AOVAYyMFWARt99cne3j@vger.kernel.org
X-Gm-Message-State: AOJu0YwVRX7lanuznF2Iqs28EAYuAkzhU0OWVhz0JjEfyv2PN9G2DM4i
	lRp/nhrOgZtesWeDA21TQyGiymWWdKNjFY5ls/7EByKQyJAfJY9Ijau5cwXHxHfgu70=
X-Gm-Gg: AR+sD13NaNcjVOiiFMLeUh6WWBhHh//vIxDZHSdc5zy57dQEx3UFlb3XuMdUS4sCPFo
	pweUBKvlQBM7OJi3V1freXZTtAH+WUa0ndObFP9yFy3JRyH9TBIn+VFEJoihZ86La3MLvBwJV6V
	fbssL3EnjKavPZTwgPAVgGK459atp6LiqwyxL/bd1U9buXGHekS61Qg9w7nIbBTTcNJqeRrVV4t
	SAWI28uEffB0TWdMyJ6mF4yPyQFUXKhiwF/D0MiZOHVX228goxRWYkygBWvZq+Q+/kKIh4eCbim
	uyllC3IXoMk+ty2jNgEOCT72n9T8qDWl7DDaSS9EgH13K4mZ10F9OVtq2/IDVY5qLCVcInQpCby
	dboW8KEfhBD9o204aaHdNDe5Q62acCTscvEuwa7dByuQrkS2Qqc5c4uOqvOLweSBLaH+kwGV55O
	nlT3M7Uez3mq3ndS5abm3gHA2+qvqRvq6oslxKqreciwyUrTIUpU6THT+ptjclhEodcd7QHwSi4
	D4IShgnWSuyvFjuBAGJbGMIVo/8AM//EOmyF7T/jFsBvL4WSMhdyNOoiMNQgvo=
X-Received: by 2002:adf:e194:0:b0:47e:aa3e:e75e with SMTP id ffacd0b85a97d-481455df4f3mr803199f8f.10.1786354681431;
        Mon, 10 Aug 2026 02:38:01 -0700 (PDT)
Received: from localhost (p200300f65f017104988877d75683e2e7.dip0.t-ipconnect.de. [2003:f6:5f01:7104:9888:77d7:5683:e2e7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-480021e7b3fsm35703729f8f.20.2026.08.10.02.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 02:37:59 -0700 (PDT)
Date: Mon, 10 Aug 2026 11:37:57 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Georgi Djakov <djakov@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 07/15] interconnect: qcom: Add Kuno interconnect provider
 driver
Message-ID: <anmbi_gXKslOw0bP@monoceros>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-7-5e0ede4a0c72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3xac63pr2vji44lb"
Content-Disposition: inline
In-Reply-To: <20260809-kuno-soc-support-v1-7-5e0ede4a0c72@oss.qualcomm.com>


--3xac63pr2vji44lb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 07/15] interconnect: qcom: Add Kuno interconnect provider
 driver
MIME-Version: 1.0

Hello,

On Sun, Aug 09, 2026 at 12:57:06PM +0530, Hardeep Sharma wrote:
> +#include <linux/device.h>
> +#include <linux/interconnect.h>
> +#include <linux/interconnect-provider.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>

Please rely on <linux/platform_device.h> to provide a definition for
struct device_id and drop <linux/mod_devicetable.h>. The latter will go
away soon.

Best regards
Uwe

--3xac63pr2vji44lb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmp5m/IACgkQj4D7WH0S
/k6R5Af/ZHauc3SyLK+PyzhuAVo8KLioCnH6hR3DN0mwmmRoImnIwhh/fZ8+bxX6
4sjLWVHk3LNdw7myepDx8m5LApUqxoXGF8MFr2ei4fdCiuGploizmUZTp3Gk89n6
i05o9xebgzD7+GHFMl3dkgkR8Dlgwhlkiu/eQcM68rZlB+dcqBWwmTIlNam/Ns6h
DlMcTTmlbkteGx2LreH2BUe4x/5L5HKGnzdEbtkBPY+G/QxvT+BXS3TFwkfblKBF
KvzW5xksFzfP6mNdXxofjZ1Az5JBPefKwO2VaVRTfH90dspMqIqaB4zuscwYL2J2
gYsqyFDe+2fuOzTFDh4IeXloKHG9uQ==
=FHMs
-----END PGP SIGNATURE-----

--3xac63pr2vji44lb--
