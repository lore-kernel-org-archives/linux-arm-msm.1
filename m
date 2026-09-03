Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B65B4B7143
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 14:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788446454; cv=pass; b=QVFy9Z17Rxy4eV8+8DER97bkLsDltlKM/CaCDwVaS3eAv4Fr8iv262jTJ/nAJkmJXmrF0GnPyuqbE/3VCdNwxO6Fa2N+b8QY5T22Huqr9WmOUgqbUg/+SCnFRBii/zU1w8IdzauXNY3yXL9IwNo6EsIFoyXjAXd9HP5bDXYBNqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788446454; c=relaxed/simple;
	bh=DMcoFPAWdEiA47YKBPP9R2w1Up2IfyxuLdA+slJYpIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b1aUgSN3dY/7zXYOBKjMDE2ehtf1c0/08BjK+bRvb0roQIsEFMv5m5dZ91/N4edJWploaCOk1AVhLAndblb5S0QL3n0YohkRaVFvYynlvlTT3F6BNHLUdDpg54RU5OPZSC3KOwTJgTcK+Nd4zh1oIvVWTx3CdBYXpuMyxrfEswc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hvz++bd8; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hvz++bd8"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-867a943b149so38981857b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 07:40:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788446443; cv=none;
        d=google.com; s=arc-20260327;
        b=pmacXifvTDtdu0d9N/2UtHCotwr6igJDjkGwMwce6XMUSfOHCPZNWE4NUlxsQwbmEJ
         TwAh149Jx5vw2hMeCQUGbg49qvM1E+kPx52bL/WX+XCrpUCMvRQ01cH2ZsQewQHTRdo2
         MbIIvtnr7Jr52rOeIXl95lfpIu9B9idX02fYEYE7rIVnF/O/N3elHGsorDVNZpy1NCvz
         bnkENfkHQmVNY5x/dpslxvpBNr/aoJwEH6X/WbpRylQLTihWjPKNUzbZkSqCyOic5oyM
         GQtTvErcXYSG7KBpzlJf+XFxCpnVQQrNIAZUlIbgKY6QEn36XP+fNPXjCOg1wLATyxAf
         MN7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DMcoFPAWdEiA47YKBPP9R2w1Up2IfyxuLdA+slJYpIs=;
        fh=+YmvdJTR67c52uBOtbosfAOlmxhVHFjavIltatB9dG8=;
        b=Uax875QWgERABhdJuu1H7gVvH7/X9drIwOJHmKLjTli3h7rupERMB3wWIj4o2redzT
         djq7/+FTDw04220pjMz7YWCYopnJCt4bWqv7sQGGqZTsojRontPc7L1hQh3hb0ZIvDWs
         KMfAGtEvGuqw5/hThaJ7Qh0KccwdfPvLICoZaEPDzRNiA9LPALbwBXblK4HY5Tl4mtAi
         GAF6ylxonyF5EYIO4VxFDEBDp6HnGqmunZ8qGrhVbmTlPg5EFZDqzyTTJtFnAvIH9Ujb
         zgPF9SEpPzO1GqRsWaHqgMtLX7Li9l0b316UovW5ihrv3+tLy/9I1wdH29M25tyFQu3P
         X3fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788446443; x=1789051243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DMcoFPAWdEiA47YKBPP9R2w1Up2IfyxuLdA+slJYpIs=;
        b=Hvz++bd8+eYQunNClH2gjduGXicxU7Dxf9RUQf91Lt7mmlCNFJBKNsC5TXFqAX2ksE
         KwP1DHKm0mpdNGAGNJgcDLmvLxrAf8KvNg2+oUqTjO7nSEKVjyJReCI4gAaHwfbYUSAw
         IHvyXLBr7UhhT2Q/4PCFEwo61s+0zXpm/p/2pUaMJq0IPc4UM7MZwd3YSqeS2IvhN2GF
         Cr9xZTW2ewL2WfKNfI85Oi/A3HRcMpQWKz9ST2POrBj7DvX+fQSd9K0WzFyGfhd85tt+
         eFZnM6vvgMEv1YHJAgHzmOML+iF1b+rgvY6mA3M0wUoEkS1iHy02lpQbNvuYBxYhiDRP
         X5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788446443; x=1789051243;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DMcoFPAWdEiA47YKBPP9R2w1Up2IfyxuLdA+slJYpIs=;
        b=g/qVPl/y/ByhCcbc84uytMQug1g4l12o064VHBugG9vWejPgI4IKtT3U7ZwDkNDtM7
         VCbqs7AZvHvzoI7epF09pa7hb9j3xYIgIcdrG1TfoET5umnrm2LtTVwpyfvDPZj6zfxD
         FnWFghTMscvCxUyPTwel6/NK3Kl13P8tUQszQsqRmg3IQl+0tu23zLzYQEXID5SSdBf2
         RefCzR7lX/HF75vb0zEV2XNl8h5Rl6qPjBWvbUdJH+IRilWmldVcHZmg4HwBfpDjoYZX
         kL5YXX337nAnn7MS00N70FHKbxjy82WWW4jXW6fJgkOz6F0DnctoYQAAcs+0XrvD27Rc
         AtIw==
X-Forwarded-Encrypted: i=1; AKwUvBy3VIa40+gTV5rPYCksV4QelcviXkS8ksqguRvGS74NyIEq1RRsiaAAtUK/kIUy8Hci6gt2DTzm5t93i24D@vger.kernel.org
X-Gm-Message-State: AFuF++mgJWHiEdLnOy8wewlvTr7pEYdK8sLhs5Zzn1qdfx400ArmdR/S
	FPmKKbGM8oIfp3E7vjXoolT/KZMAJelhJVK1U02n4C00PqLfEGFUEOho9QAy7IsbaTN9z22+yU6
	fnPVt9Ig+S0JBUnmVVN+C8mRbXajeCk4=
X-Gm-Gg: AYBFou2t9DSc0wQPb6hamu15Nhty84aZVqD3paq9fln4Ct1fvH7KuO0iIxp2yDRGPhC
	lPGRKI9gOw6NJwnRV7GEOepcA8p7t24GS7OyUawLX6smbnLo+7DZmEtXF9qgrPlW06ogrbMuuLW
	dj4VALiTYaTJJtG5qLgye0NZFQHStgS9T9Nd3GVDBolcMBAJOsoyyDNUz+hhj74HwZju9eC0WT8
	Js+TGYHZ4bKQO6lPjZqYwMoji2+Z3eNtWDjQPaHoa7bpIUToS3Ta3eUd2+S+05iFaUtScMcDkR5
	SsrkPi4XOQ+tjXRqfM++B64m2AOzhwEpjWIj/D1uvA7rcpOWz6uQArdo+z9Kvi/PtjpzRyf4r0b
	BaQLpYh8jkd4buh7VTdR7bUvu/qDg/hM=
X-Received: by 2002:a05:690c:e211:10b0:80c:5ce9:8f1a with SMTP id
 00721157ae682-86c54b242fbmr50652107b3.34.1788446442940; Thu, 03 Sep 2026
 07:40:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5be7vkmpzmizgmvqxyefubgi3epnlo2uf7mabcgsapvia4ckpm@ixwfppk5z5e5> <A4C1EAB3A67613DC+20260903132714.2538118-1-raoxu@uniontech.com>
In-Reply-To: <A4C1EAB3A67613DC+20260903132714.2538118-1-raoxu@uniontech.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Thu, 3 Sep 2026 10:40:31 -0400
X-Gm-Features: AcwNN1W2_JiObyW5To0IffDILn7tLdHOJXWxugOC4ExywC4Uofa9xPpYfNG3_Bo
Message-ID: <CABBYNZL2QcodKofLFbHbDJZBcjA+mRDSYi2QFZ_XvyphJYg_yg@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btqcomsmd: destroy RPMsg endpoints before
 freeing hci_dev
To: raoxu <raoxu@uniontech.com>
Cc: dmitry.baryshkov@oss.qualcomm.com, brgl@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, marcel@holtmann.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xu,

On Thu, Sep 3, 2026 at 9:27=E2=80=AFAM raoxu <raoxu@uniontech.com> wrote:
>
> Hi Luiz, Marcel,
>
> A gentle ping on this fix.
>
> It has already received:
>
> Reviewed-by: Dmitry Baryshkov
> Acked-by: Bartosz Golaszewski
>
> and the Bluetooth CI passed. The original teardown ordering is still
> present in the current Bluetooth tree.
>
> Please let me know if any further changes or testing are needed.

Please resend.

--=20
Luiz Augusto von Dentz
