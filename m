Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A7634F247
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 04:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785387038; cv=pass; b=nZgsbSwzUXb4p6PCsg85Xq+jlVa0u5MytFQhMcT1RdV6CVhVWkWCfN7KhP8TG2NogGFNrl+ix3nXclh/r06QDDRtwScXdgZb2iyzDo+UO9w4AkO2QIhVONGwQS8pmjW1cpNbXw49kCI6PaQpGvX/rr8k+QZsRaNssMeC3u+XH3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785387038; c=relaxed/simple;
	bh=x4/nkR85gHt/p05IHxpT90cgtYPAQUFwTKs6hOHyuUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AVpmJhMzKJKQsPRP//zXVFYKXYSxstE0d/xfCpVyqfbrD8G4AQgget1oywdiesnKQgqfvKswWTJ4SCXAO4uUcvoS5rA7PJ5sm3bgq6c42OPEjuKPOwpffkUuN0IESsDExjNJRFWAynR7EFMwQ+/zuienZsGuQNuNqUlTeHbUMGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+fa664+; arc=pass smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+fa664+"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6acbf97e9a1so89683eaf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 21:50:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785387036; cv=none;
        d=google.com; s=arc-20260327;
        b=mq4bt+XHE5djPQNM/yT/xtSbuXIXRwxfZFe296fNjQqOCtanc4LVz36Pl7miHdJ6ua
         nLnmMNAjrlb3887uo3HC2+I4b83uZABVyc9jFRNKLI5U+sLky3wZC1egXsSc4+m0+5eV
         YdRKtW6OobacJr5D0RnyYDhNlP0nK4+wfJEb6dC4Z4mfvUw4kougClxzkSlqnGEFAyiz
         R7ICopLjUrHiK5mfeNoLRIGAs9oX1zYHvTCrq/g4RDZHQJL48W3EXqGV/8BH5o9S92gT
         vvSLK2Snaw3saHt5Vzubj8leapZxcahNgPOKKX/NgHildD/NnEon9s4BacMEURm3U+96
         DZQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x4/nkR85gHt/p05IHxpT90cgtYPAQUFwTKs6hOHyuUo=;
        fh=Znvb+AFi03EaHF6sKvOcDb1qVGOMm5jZX4oVUTqVz6A=;
        b=cVsdJtCJ5QPeXxYXPorUmwegUJ6ciNG4TW75/y6ZmfcM/6mjk2JrhezBKEvrtuF4t7
         RxE3MhkvyC7icfxjMn3kyk7iWNp1q7hm8SejOd6W9pcOTxC3ISxRAGGQQrIvoJ6tNcsa
         D3yslLHORk+6HRBAQWu4/hSNC4bOhF1Ht7FF6ecn5py1fB/2Qo1rSRX+V0YtlHfYPovH
         C1SSsyp6yI4RnM7cF00Z5LaDPWYNA5CHnQXy04sTuhaAw/UGcr22lASocNVa3fhAL9dD
         bKw2NU+OKjauJeqDMSrIxD5CPFMj3SMWN8Eq0CbLNkce+vqmEVoHcAOGtOENjOIsE3bR
         tazg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785387036; x=1785991836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x4/nkR85gHt/p05IHxpT90cgtYPAQUFwTKs6hOHyuUo=;
        b=M+fa664+M6wfAokcE06JIfkQ9zVHlL3dZWf1tdyDQKjyveiYur8svwsj6NXzCMsVCD
         2uqpOyvF5UTk7vWlHJRlKM1YVMlWoUFuuIkImTaObvOk1epoT/UMG8/VhIlMM2vqUzsM
         znKovwXGZ0rmYykkGjvtDADwiR2VL7StTMaHXdx6rHHtFvYNU5QG9lmlzqISGteEmp9V
         tDrxCpy2Xmoga/FIfeuqYuRbomNPvyHfygKmqe5FrMJdo9df7vkBqtvFiMUACV4prt6m
         qE1FilJvGCnA6dVZMWImH0DxLC2SCPDooLEZyK0NBoRwaNyQexFKP1YUwTrDwnOXmKN8
         7Cgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785387036; x=1785991836;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x4/nkR85gHt/p05IHxpT90cgtYPAQUFwTKs6hOHyuUo=;
        b=beGMb5/DxEPcauKEKxQBqKCElAI4zNSzyTlqcElenquI8uHF6YnivO+z+F/MjUOaWR
         DVPX7VGifauVRodQ8oeIkWQE0UPcjK5pj6WyfqSOKP9P0BqJSmc5Lvk+WngPqxyxqAz6
         rv8cbb7CJXbMbxW7y4d7s9aXiP91dPYqdFiDe1MHhIsmS1Wx8+ZBw/+V5HHQBB+RGoXN
         YZzw6AhWKe9Szpx6oRbPsOEdCJN+Hz2QxrPtYIu4qWcQJqXKyPPYTalVayccAS4x7TTY
         Q5OS3JNufvBt5h+idHG5DVPwCA8OLm7hm1UXjnWdeZKUk3r4n+3X9vMPQ/4l0hq8PqBS
         ri5g==
X-Forwarded-Encrypted: i=1; AHgh+RqhWq7WIMuA0nB0vUJWQJXTQXHBcjeak+eRntPGIhu37gkDJrY3cXhnvl6YGhb84QqZXJ1Gyyv0C8LYsK0e@vger.kernel.org
X-Gm-Message-State: AOJu0YwzKgduXTa5+ewD2QD2E7uAlocWaPhkJi/0Efteg1EjJaV9z48c
	3DtItDELJGrWCf8EHJZBIEdjhwZ/2x9PI2FHoYCj/ikSDWVdfNSzsmlp5kxqHC4RKJXSIy3S7vQ
	bGB54miXLTPUfgNoUwYIoBP6cP2HL0GE=
X-Gm-Gg: AR+sD12tO7lwZmNXboAKVc4nr6oMphDqDiCaebe6vIo2mnWIgHnhXcn9I6ct5ypSQX2
	YdA5TG5XzFsrvpCCbZgk/jMAsIFlsPo081IoiEEU28xPxBkwoSTCG/WuEwiBD3msS+8r1A7sMxR
	5bbjoPziZPdJU4WrK4qsgMxPIBGuY7uDZMWxjp97oouC6SUnMPWKtQyHHUAEyuPpMlp6dVDPBtu
	g5FmMN4r4yYJBuODl46OVeZEtvQp9gQ3GR6sm50s46TTxn9SZkYedmbrWTkJ25M69fhQYNXiNrr
	8yCyvwks9FV9cuXSLc6yzoaCZ0eXsBGHzI4bshkx4IM14LmZpeOlcJunHY2NjqfpNi6Y3/PygNp
	jlqbWH9h0QvKkkXBpHDWnwuRfU47OVOIX5FOu608vNhLF6GXnf2yVcVZYO/vSAYpIKDYCUVt9rH
	m9hY5odNj45lo6MHB30nnUsrwbPBck5ro55rOi+hyyy5Z+0xwIK0wquA==
X-Received: by 2002:a05:6820:1a0f:b0:6ac:a88f:bb7e with SMTP id
 006d021491bc7-6acbbd319dcmr707974eaf.10.1785387036300; Wed, 29 Jul 2026
 21:50:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729064538.19564-1-kaipeng94@gmail.com> <20260729064538.19564-3-kaipeng94@gmail.com>
 <7eae2da9-1d4d-4ed2-85ba-4ec5d389b0df@packett.cool>
In-Reply-To: <7eae2da9-1d4d-4ed2-85ba-4ec5d389b0df@packett.cool>
From: Jactry Zeng <jactry92@gmail.com>
Date: Thu, 30 Jul 2026 12:50:19 +0800
X-Gm-Features: AUfX_myTvI8zL7ckXgbzmHbIIIfo9z4_b0Srq0DHDvkyZHz0yFFZUAHfP5Tj3Gs
Message-ID: <CAManwEwiQXQJYP897hsq7R0-qj-2ocz+J7rX4ri82cF6gM6C7A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: Add support for Acer Swift Go
 Pro AI (SFA14-11)
To: Val Packett <val@packett.cool>
Cc: Kaipeng Zeng <kaipeng94@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, 
	robh@kernel.org, konradybcio@kernel.org, andersson@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 9:46=E2=80=AFAM Val Packett <val@packett.cool> wrot=
e:
>
> On 7/29/26 3:45 AM, Kaipeng Zeng wrote:
> > Introduce device tree for the Acer Swift Go Pro AI (SFA14-11).
>
> Are you sure it's called that?
>
> I think GoPro (the action camera company) would not have been very happy
> with that branding :D
>
> https://duckduckgo.com/?q=3DAcer+Swift+Go+Pro+AI+(SFA14-11)
>
> It's only been called that (with the "Pro") on the ubuntu forum and
> such, all the other pages refer to it as "Acer Swift Go 14 AI", no "Pro".
>

Regardless of what camera companies think, this is it.
The model is sold exclusively in China under the name "Acer =E9=9D=9E=E5=87=
=A1 Go Pro AI".
Since other Swift models were marketed as "=E9=9D=9E=E5=87=A1" in the Chine=
se market, I think
it is appropriate to translate "=E9=9D=9E=E5=87=A1" as "Swift" in this cont=
ext.
Additionally, please distinguish between the model names "SFA14-11" and
"SF14-11". I think this was well discussed in the earlier versions of
this series.
