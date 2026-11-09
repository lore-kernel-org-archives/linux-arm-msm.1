Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794256985;
	b=cMrOxv3rxrDEz2ENUR6AU8LKHyllHXA9xmDpwE6rOfoDh8DTl3hEhOlA7Wiof8jpKnin
	 9wUH7Hz5okc2FRnBmZxTgRs8h+3qr1uNTzzDtrDxKXYcWS+FXdh7PBcPsEon/nRMJ/Oz6
	 DlN8beusRYXtcN8nieZwF2NGLeV6dTQeSOUXwWwC/JzrAWpuJL4khxF9ThiIRkpEAZKBs
	 lHGqXwbzT/uysLtlpf1JOs0P/6NWOq6UKbgNfAyZoAPfyp0wW3NYt1C8pLQ4OliQLEn65
	 17HkhhfTa854IyF/8OOxvlowe8Xjg5YJ3hc71qxuxpFH4H8elxbaH5bhdhPAvzv4CrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794256985;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=GM5RY81tK12IzXW4FZLzBT6HLn10WhpijMYtwZrR/Vo=;
	b=0ASNXcwB4QLkZo8ObhQeW/kAfGdrMepJ7UQLpE8zP75HDdpHx9m9sq8CS3kah+qAYfBc
	 qNAhmdBwywUNQEbIO/fQntg/1mewQLS53aDf93U4iagANqESBRnMOl57YLemNMBNtYdJU
	 K7urKYsEV053kwhk8wEvYxZOZDQZ8/JIc+C4AgG0fzk5t0n+tmG9/rB/aojgavgDfMrJp
	 bYGr8BHyW/XWbQGX+SOyMk4ZzDMAQhjSX3/pKzHf3iaTTNTZo6Bce51X8eDLw7lUrH5yw
	 XsmMRm4hAUbOtNffmyabdSWzmlDzBfY2y+NABTIbYlAY60pQhHE82e/+AwrAO7XKW/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=BWBxKK4q;
	arc=none smtp.remote-ip=185.70.43.16
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA82D606A321
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 20:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA82D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=BWBxKK4q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794256982; x=1794516182;
	bh=GM5RY81tK12IzXW4FZLzBT6HLn10WhpijMYtwZrR/Vo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=BWBxKK4qbVxZ7QRS+kBfPR37Sluakf9Fz6gnMv1QMfYehhdLAvU45A9u+9yMfM5lO
	 hl8TuWx97Tc49nIQ4JatZmQfA6/wNOnagHXJgv+x7GW3hKIhJgtYmBdOwPVWVgBnUy
	 uRqrWLkM2BLXdigfNtGp3N4LaE/KwdTfaeHVhD143/W36Q36Qvag1PsxES1ChzBjiJ
	 3vqhlo0WEwyfGw76aV1Nc8pEtg2b/FKcc3bFYmU3t7rULE2Ku4PqkNX3/ZkUNGg+MJ
	 E7/omH4E2WocMEJqIyAula1Zuj0F9+nUIF/fDqitJcGRZvAjbH/qHVQ9/nSkksZO4n
	 vYMOrKnK89AFA==
Date: Mon, 09 Nov 2026 20:42:57 +0000
To: Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: socinfo: Add missing PMIC identifiers
Message-ID: <qcxc7XsXmVOXMH3T-UIFGOexo2Qh1KtJspYZ15UrL2Tu_Jg6Uq6-PfJYTlJoipYPZnMnpNXN6wbs6pnJkkLTiQf4O9uOnp-NLJc-13wxigI=@pm.me>
In-Reply-To: <20261109-topic-socinfo_pmics-v1-1-ecdb6cc6e40f@oss.qualcomm.com>
References: <20261109-topic-socinfo_pmics-v1-1-ecdb6cc6e40f@oss.qualcomm.com>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 9fb916162189a8de3474dd64c23fe8cc93c2ea41
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, November 9th, 2026 at 10:39 AM, Konrad Dybcio <konradybcio@kerne=
l.org> wrote:

> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index 38efc5db7fa8..6ed8a4686e2b 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -154,15 +154,22 @@ static const char *const pmic_models[] =3D {
...
> +=09/* 68 is unknown/reserved */
> +=09[69] =3D "PM8550VS",

Duplicate?

>  =09[69] =3D "PM8550VS",
>  =09[70] =3D "PM8550VE",
>  =09[71] =3D "PM8550B",
>  =09[72] =3D "PMR735D",
>  =09[73] =3D "PM8550",
>  =09[74] =3D "PMK8550",

Thanks,
Alex

