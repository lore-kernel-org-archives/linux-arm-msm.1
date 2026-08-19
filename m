Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316B028CF5D
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 14:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787151153; cv=pass; b=suiMZv72Eiqy91eQRL5Xa7ZAiblC6o9vD8EeDljdLhU9dgPkRuAQVmpMHlptOQwGqyC8HI5xNR/CwkIqChwR7g5S8ChTVKZY3HuysKVPLlLgbnNQkHm07euJW/PL5Tp1FdoNQtcSAtCDyNUKrK2TDbA/KIjklg9vizBG+J0jT3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787151153; c=relaxed/simple;
	bh=bQVg3/uZoDN7rhrUQpPWCstb5hJMm7Y7k6wHsUPajZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DyiRx88fJXxL5+PCHfVnM6sevLtPGVK4n/df5koVHY5y2KcqSVf+NojZwjvxjRbF9zPO1G7lDhUlN1zPm6v+4SV4qMyOfYbGaJ1WWaeGh9tYe7EGc0RlqbCJEPTNRd3xpFJJEzbWgd8/T9Scgl/fTivrXOhStQYA7flNIy+RuIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oFn6c5Qg; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oFn6c5Qg"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-52d5bfa4bafso10837881cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 07:52:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787151151; cv=none;
        d=google.com; s=arc-20260327;
        b=EpE68CO4yruq6rg7TEga9Xr4i/GZwwUIBmqcjimO6OUIyc1gleP0RL/P5jD4geC9G6
         +s2j10DOhLYa2DDiMb6hrafNM//WPM8zBF3jlF54YtvWvgqNbYRCYiIHSnqblfWBcUSa
         bdAQFSBexIpKrwl4R6DJ/FfobDlpV8HtJ9Hij6K2smfs5FClGsmjUmZwsHKX6v+vks7n
         p1nSmbBnpvCo+k9o2skQx+u/OpSReb0UJLyum/OVLVEutFQRBf0h3FvMkc8IG9gGuqqO
         8aLDOUw4xCYTohYVwgHGBXvpBDv8uYt9hQYucJ5lLExD7FpGUwnn3a3+8ApxdwNMqDml
         Wgtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+xwbmX7UfgLnx2SwFFhwr5+els4MKcBZYG6MEEMB/6E=;
        fh=aP2fqdt3zBXlP1uu44bHePliVITZQMw3jM3vXY5290M=;
        b=VAMVpuANMrIUMRDZ3foEkQUWMsZF+JjzKLYNR9QU0bQqyT39A1O0emjZRaBv47UzQT
         C19hphh+AzIjA4U6mK8BDwN5crXFtGjHoQpAxwinX26mFlcyUx15nj1SzYBaSlPbN4RG
         7wERV+AASwPxKNKyILKlwHvJWVAn5g5sra5bqSYCD6jv0NQrbOr6+JN47WdnkvTJ8eWq
         jFyYAhPSGUKPGsKimAQV9J22sd9MMo4cI0Yhwz0EbnqFF/bNOPu8umPgU0zyB23HtbLA
         tqkLiDjKZLZ0n+Yv9/h5IoSR4C97wWfUdn3WDoHC2X/Ba3oW2JaB0P+jljI+RXyiF3cd
         x95Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787151151; x=1787755951; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+xwbmX7UfgLnx2SwFFhwr5+els4MKcBZYG6MEEMB/6E=;
        b=oFn6c5QgkZ1757/ldjs4nGUVRF13sPVRfP6+EMQfrq4/77Jox9jSr4hQAgkQ5Ny/xB
         +9/oFbTFFn8PNAK3GNUkyUm7YPV1mi71JHyM86CrJP8V3xXeX9LaHNZQyFf3a/2OlvMo
         nsAzyEkxs72TuvZmGnsocHY+TY20XuJE7UwoLCk+hsfR6DJxr5dmgEcW328SSSavJqhD
         FbIeULQrGPKMPKDwzc3cgs35haPFFssA+OYeH7bKw9imEm0SQvDS8GMOkh8u5isl0+A6
         BdNSOLal7wALcoAjdcwwyHw3JAu4b1/tax9EwphY25sR0VhsJv9EnGfIpWnt9rA31wc9
         rSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787151151; x=1787755951;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+xwbmX7UfgLnx2SwFFhwr5+els4MKcBZYG6MEEMB/6E=;
        b=m058UEwMsFsfwjL0ZVs+9bnS7cBY9KNmhWn4GTgHnZ0T6ix+82M5o2R9eedcqd0YBQ
         modfcVWbWDKn8KGUUoDTHIoLyOsI6/tPDJXPRCQrMQEpBqudTVd2B6gWX6QPXIdRkHR9
         0zAcN8zaqG5qzp3j0VqTBm47v/TxRIJClymY+7S6VlhH2NzDGnQk0pw2ufi2VB08BDOB
         xYb67LALxAveMcaXYpZf19t+yiY4swNSirJ2e4SSPjI6aXVDFy0Jsq8VwJp8qZCGXiGS
         cXEB3dacd1DvAPFigiY/2QMftm4vVEEZHLUPtJ+XmR8kqIfFJl9tfFVj0M+ruRy31Jbw
         cJoA==
X-Forwarded-Encrypted: i=1; AHgh+Rr0M2bjD0wpeGGHow3Ee3VSGjXnrYq1W+BRH/G2B0cgeHKdeqP21LARFC+qaEio3ZevvRKuwmC/m9YIUpkk@vger.kernel.org
X-Gm-Message-State: AOJu0YyDp3zahVwCetXbayTauzGdX0zD9vu2Zc3m9eVzkiL4RvZ4PIPv
	zWWMn+IuCXCFN3IswVIKJ4H/HYgNZtpTT+DTSEEFKVBUgzFd3hLy/wi/1fxY9h3cvxrG0OUWITp
	2rBRRARS0OquQIOf+SFUMlryl2lLd7VA=
X-Gm-Gg: AR+sD13Li0IVsZ+C6IysM+qFGZE7DM32RYyuMCZkaP6YkdCkBqLYFHZKLECKd2vPxAI
	DJh0EN0Sl0cvSoVyOpa8ca0rc0MRzAiIvw1feQyeWMdRLNqul5OIJKh1Gb4Bz5vx4RcTkpw7WNV
	Mtx7PWoVPQSW7JvihdVFlJVhQpxvLBphgpVERkfDecGiWTSkVdYr5mYVXiqBEScpg1C0aYYe6Uj
	/Vi0cQyX/Tkegp2U+7icqm/LGKQfmqjoPkcXZlDXQOmM1R+8A8ItHVEXuQtc1RdFcFU1HtP4CBW
	iLXekcDfZP3dNKhZrWzpC0kix3iNlkUXoV9HbuYxEPxaNcgXn2dvwPRnDUYTBhgZa8ublQ3QRkz
	+tco/k/WmTbDoI9ywaqDCX+2guH8Cg+j2Z9xxyC1ij3a2AbaQ7QmKi1j1iSoYQI8=
X-Received: by 2002:ac8:5951:0:b0:51a:8b64:69e2 with SMTP id
 d75a77b69052e-52dd575a1b6mr40323071cf.7.1787151150885; Wed, 19 Aug 2026
 07:52:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808172211.137577-1-jesse.casco@gmail.com> <642652c2-af5d-446c-ac1a-8099639c2588@oss.qualcomm.com>
In-Reply-To: <642652c2-af5d-446c-ac1a-8099639c2588@oss.qualcomm.com>
From: Jesse Casco <jesse.casco@gmail.com>
Date: Wed, 19 Aug 2026 10:52:19 -0400
X-Gm-Features: AcwNN1VqYIJRaj6NXPh_Qu65pGrQ0AJQ_-ppLD8p4Fph7-SBSWW4rl5xU6O8o0E
Message-ID: <CAEaxeoQUZKnCQPG_W0B77gB2VfC__-t7ZxY0mkVsqm1Q9pk6hw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: glymur: use polling mode for SCMI transfers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested. Everything SCMI-related was already =3Dy except the mailbox
controller itself, qcom_cpucp_mbox, which was =3Dm. Built that in,
pulled arm,no-completion-irq back out...No CMD timeout, no -110,
cpufreq comes up fine.  Looks like exactly the timing bug you
mentioned.

Keeping arm,no-completion-irq for daily use since it doesn't depend on
build config, but happy to test more if useful.


Jesse


On Tue, Aug 18, 2026 at 5:29=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 8/8/26 7:22 PM, Jesse Casco wrote:
> > On glymur the CPUCP firmware writes correct SCMI replies into the share=
d
> > memory but never rings the mailbox doorbell for them. Every transfer th=
at
> > waits for the completion interrupt therefore times out, scmi-cpufreq
> > fails to probe with -110, and the machine ends up with no cpufreq at al=
l
> > -- all CPUs pinned at their boot OPP.
>
> I'm not seeing this issue, but I heard others hit it, possibly due to som=
e
> timing bug. If you set your kernel config to build all drivers in (i.e.
> change =3Dm to =3Dy), do you still face this?
>
> Konrad



--=20
Jesse Casco
