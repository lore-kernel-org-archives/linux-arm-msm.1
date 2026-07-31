Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F53306B3B
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 14:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785509338; cv=none; b=TkoW43S8CaaaKx766oCMfRBiIAxbaJxx6iyivcmtES0zhh57L/afmoimlpIu7xyaSvwa9JSWqGX7OLeJ3muO+m7Kx79WzayuSwe4kUgsZlZJG85NOj6/z2MUGVzRbiB8tzqhvNysUPuPuY+c2irxm/w/PlpPTLMBzY+lMFvVa3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785509338; c=relaxed/simple;
	bh=nmb4mCgvryFrwNA2mwZKsK8uMaWetaN8jhYb7byYB5g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bxX8Z2jRj3Ohi7pRhYOj2j4Bu4q30xT/ZO0omp/q7K5llww8u28ASuzQbEC4ftFRVdEYLR/5V7xdU3PB7eLPdtwv/4kIzjWPsaMcDw2aQu0wmdZch3XO1EqefUQcPALjJRBYxUJTxWoELhMtK5On6EvkhNCHbT9AIf7NIuxcBVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=ii74OcCx; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="ii74OcCx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=lwe32szhdba3zjd6qy5f25tcxm.protonmail; t=1785509333; x=1785768533;
	bh=nmb4mCgvryFrwNA2mwZKsK8uMaWetaN8jhYb7byYB5g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ii74OcCxTqNUwOeEg/8dfA5CdcanGsk0hrqWrhQWS1cAQi/9fLpv00TKze2reydfj
	 KLBfYJ7NSuJTLQqYBRqPobcDaqy9KskWDXhwyocvq5vK24CHKfw7AIvmCwsZ73oD+x
	 QeAen0xVPjtABKpImNcw0ME0J8vtCD53ms7CHgNPs1lq2oGQcFbsyYp2xwdKV53J5+
	 WceDlZAtc+JzCiW9hpT2T5G+FnRbKe4zrwJfspjGlfAjdkB9xftfd5DcMq1SxZPUpc
	 X8oPzWtHj/y+4jmvBjosqsJ8SPfZoAyTEebfsoL9yjOueIY0R408Mf9tp6JRaHT5rR
	 KOACRTFhPpqPw==
Date: Fri, 31 Jul 2026 14:48:47 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] usb: typec: ucsi: ucsi_glink: Add compatible string for SM8475
Message-ID: <562c2302-34f6-4d2c-b60e-39726601ba7a@proton.me>
In-Reply-To: <20260731-light-kelpie-of-will-8b71bb@quoll>
References: <20260731-sm8475-pmic-glink-v2-0-28c04928ef22@proton.me> <20260731-sm8475-pmic-glink-v2-2-28c04928ef22@proton.me> <20260731-light-kelpie-of-will-8b71bb@quoll>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 3d0f6338d01d99fb3dbcd1ea68e555399928b881
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 7/31/26 5:59 AM, Krzysztof Kozlowski wrote:
> Really, you just wrote IT IS DIFFERENT in the bindings, so how can it be =
the same data?
No. I said "different process design", not that they were different.
Other SoCs also use older data despite being newer, such as QCM6490
which uses SC8280XP data.

Regards,
Esteban

