Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79C5265623
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691923; cv=none; b=I4+MKnMIDVDAjc7HrC8ps6Y50p9KCSnyHTCenJ2qg6xBwShlscoRRPWmmgRRR9sNMva1jxUB9eZehOzdX9zz7bg10aSwKk+axBsI/JHRTTPeNnCLAvzydU0cmX/MP8X+R6jKC3+FF5pVLRRSx1WurE8u5LCNxJRDYI7BDL5+Sqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691923; c=relaxed/simple;
	bh=oDMFkzxjs/KXUSaVb8duhkY5CEnHTeJPvE9VzQ6FDQc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Tvmk2RsRU+qrIJQm8tRJhGua4JKDDF27KFgAUCatGuZHsIXp2kMe6+y/9qYtzUfO85UCkhPwlPHOSAwO1iczv4M/YW3Vf4ITEokKkblbcHBI2ljxW6kBOaZV742tt+VJgh/K0HxcqDi/AuaBoCVu5z7kyw+7oEnvIS4MH2cB2lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=HHVfu76P; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="HHVfu76P"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-697564cb69eso2016487a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1783691917; x=1784296717; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oDMFkzxjs/KXUSaVb8duhkY5CEnHTeJPvE9VzQ6FDQc=;
        b=HHVfu76PljNItpbRCBn4egmQy6/B4UiN8P92zrc5eGS0B0Q65poEDe3B2DnA7Z6Omj
         TRLYt4zjm7+5inPC/IUfNvo//2eI5r69qMPEjguJsqgWCz0/oqUm0c3NrdqfYuX/ULk2
         KkBgXb/3Fk+qsAEF0xXvZ/6cpluqpHOdwJ8/jxUa5Aa6t3zw/F/7mgJSHK+gLGs/IUfZ
         2hF+DhfL9i5fU3Tf6lYwSsn0vroM86DXkbciETq8JhqFW/45D6CbeC7wAEUTIKuNktYd
         6V6IHuCITuCDgPxye6L4kDBBwpgQRO07k3FXBQCVSbaPCAoPvg1aNvS/tNygqakVAKXv
         yHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691917; x=1784296717;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oDMFkzxjs/KXUSaVb8duhkY5CEnHTeJPvE9VzQ6FDQc=;
        b=Cr7oyP/i6bZsw3YjtkzLGm+jGIdsQ2uzCuR8TPdEkg8dNA7WC5E5dCtVi6XuS8UIiL
         UMQ7403pvt9XM6LwHcW8CgmZO1YLdJqgXE+SieGMLMjlpBwgmFmGRC0EedUyHH5p4ujU
         FInvTUyXSjVp3tmIAe5cHoqZNItYWgcxYHmIAjznTlmhZ+InmSQ04+D8kjAjSq7TmG13
         By837tw5WvbzTBR0K6/9fRIhm9JObSNiSgbbFU3kg53w6+ocmj7GEYIqj587xe0/WbOv
         6BaRYN4qxzP3COncOfY6Q0tb7w4bVhiEFAvu+7w2ZyeabAWohCO8K40OQqVBa9g//Lgb
         8qHg==
X-Forwarded-Encrypted: i=1; AHgh+RpXMuI2cj66oM5fb68QxLjw4B2WJh1xC1q87YHpUXkHCbXTdUzALDt31VqK0MNHTX5hdo3jMtjhYSaRkXnq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Niv3PVKURIgcA7xUUykLef0HYp1fTu0Kcgs2uKiOqoEwd0U5
	8lLNWkN7VWL4JrqIlYpg3ZT9pLme+NECX5JYC8gusGihSvqwAULOEUjjlXSJj9MY3jk=
X-Gm-Gg: AfdE7cm/mxBKq4uOFld/IQMhDiU8t41Wo6g9yX1nGdR9OpY4HlivriW7bUbf/NdQvor
	T2xH1GUnNlh3xNfJY/Aprs92PYhAwa12CChdNuqlaXKcfM+nFxdduJ6hHH50sHbf+OTxn83NizL
	s+J93yd0EWu2h2/udzHBE6UUZl+xCX14Kt4PEUkOVikRCRKZlr5UBKZfiK2rtdjOiP+hrJb1bpI
	8FmeeTbC7lY+UUXjnNQzxUQpTvpGG65xHNVrb3ZFgkyR+vn0tSDmn7ZFlhwfwIAKPW0Ss11YbBy
	82iit+tPcYoUuM8oUr1H1qsowkjl8figjaeKlGh3pbGcAZnmNQ6ywjnWjRrGvvDwBsBpi1IQRfz
	hAy/5PxGxVJYwux5FLyp8t1OsLnYIXOFNK2f3KXXQTU9yZxJZ+pj6e96Jl0oTFdcFNneisb0V55
	Wy4rtg/a1m8M/3Y68J5mhysAU712cA/44bB77UkXJ6NDwG6rQQkbkpHhBBrA==
X-Received: by 2002:a17:907:990f:b0:c12:695b:8876 with SMTP id a640c23a62f3a-c15cded1355mr392545366b.5.1783691917105;
        Fri, 10 Jul 2026 06:58:37 -0700 (PDT)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d3859f69sm407039066b.27.2026.07.10.06.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 06:58:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jul 2026 15:58:35 +0200
Message-Id: <DJUY0I0R3DGG.1YC9D7H4AAI0J@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] arm64: dts: qcom: milos: add OSM L3 node
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Georgi Djakov" <djakov@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Sibi Sankar"
 <sibi.sankar@oss.qualcomm.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Alexander Koskovich"
 <akoskovich@pm.me>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260710-milos-cpu-opp-v1-0-ae7f4b09bc77@fairphone.com>
 <20260710-milos-cpu-opp-v1-2-ae7f4b09bc77@fairphone.com>
 <bf766035-54fa-4e98-8abe-22cf0a229ffa@oss.qualcomm.com>
In-Reply-To: <bf766035-54fa-4e98-8abe-22cf0a229ffa@oss.qualcomm.com>

Hi Konrad,

On Fri Jul 10, 2026 at 3:44 PM CEST, Konrad Dybcio wrote:
> On 7/10/26 11:22 AM, Luca Weiss wrote:
>> Add the OSC L3 Cache controller node.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>
> I'd suggest to squash this series into 1 big patch, without patch
> 3 applied the OSM driver will engage and perform sync_state (with
> 0 requests, so it will vote for 0/lowest) and the system
> performance will be tragic

Fair point I think, I took the structure of the patches from sm8650
which had it split this way but yes, it doesn't make too much sense in
terms of keeping system performance alive through bisection.

Will do so in v2.

Regards
Luca

>
> Konrad

