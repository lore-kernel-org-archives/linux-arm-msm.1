Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792691184;
	b=MB8W32iwfPHy+pEiuE2j6eaN1IEqxLvZa23q14kLCjM7G7VkCdus1wN0myMhl/fGiIb3
	 HngrESleoVfr38wgmF2zhWDLbgCDy2F7OhaK5M3tvhm5/hfO5h/7F9quigYntk3j/A//f
	 jcGyr7x2KNWJ/xch+9+etsYQnsDvvvTrMEJvTTKVYiD5YTxfDGHyhpP4G2zRe12lusGEe
	 +YXamP+s/ufMXLYFcfkJJtU6tnq0KYrZBnK/Ikzg6db8FZYOwt43C5Qr1hYulonzH7z5m
	 VGZYmuAXns7qXaGFGy5JTJqesK7cTuBCD8f0NSbCs+7I2G5OWpTq7wlOg7U3B0b3NWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792691184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=KcxnS2rO3PjTrZzlNqZ6wvXV+cdtsvmn8hmZkoyfpCo=;
	b=VXbcMFMhlxbfz9hLAYR3szayTBlsq5r/fIiitf0O/HXc8VjtoKf9vdWMtZ/tRO2VINhz
	 JYQLyXkTlOhvQFlqHWKsZhDN4g5gppcXRGQlNVoLSEkLer0zZTZxlPQYC9I3iqUZBAz0U
	 sgojm1d7+G0586AZcJVVTZZUm60NwxfcyGbSl7X24YsNDC+WLwn+8Ik+ufF0XxGcWY0a8
	 eFsOGbkV6HcQ2JzuYiidfCpRkd/P/ZmUQlX03QqH2qOAdGtSPvYUX9ctr08qpsU+iFohY
	 jDpvh30wOWHbJmlq/4nSqidTFguDzBwsQN0ZLWg68WPo3MPjcH5LzeIdYNrCbxO4pIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sY7uQlNA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C78606A319
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 17:46:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81C78606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sY7uQlNA
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-679aeeddc6bso169531d50.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:46:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792691183; cv=none;
        d=google.com; s=arc-20260327;
        b=HJuiBQqQGJIc9G7TdyYnX6KBTrf7KWwzdaWG4AtnZ0xe3Sp4HxnYxrmZ+8VEIPUrP4
         lZ341jh5f7v+RJfI5+TSqdoaU02cwbU+Bg0nZKdlteUBDLlnDO/9GBZZjrn5FWT2oyAV
         Khv4LwCpcklhIzp+BnDMpHOkT2t2YMQ4vu3vE3DIHpJuxeJ5AdEeiWGpblTMcKp8Hhy7
         E6IbC9GsLbIhoxNPx3MOoNN5QNoLkRMU845UAF0J9K3ceO9DeCHCkl9jPf2XT9avIpee
         Y9tEKIFncmIaeMDU0HDCYsCSgNPk9oiX3uXIiIgMxsE5R0ScwbKZKvKLvBOGz387qpuq
         aOFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KcxnS2rO3PjTrZzlNqZ6wvXV+cdtsvmn8hmZkoyfpCo=;
        fh=hQ/e9OUkbGt1jBhTAVf90xCqKqNIXmGvzcp0rT/6lig=;
        b=Jp93NJuTaIz1bDKSywjce1/VRP2KqlLx1/7Y4tOWHW1OLu2YeFFtCpx4//dLB2FmQz
         FGM3tCmwuGNXqWTjXqbsaYHe6D0riISlloTI+GNGxW6CjFpubLgsj+O5JInco4GhbLwa
         c5eYBiX8B+M4NbAzpCjnfrMRXoOBHfkPCriG4gmGX980g/VoGQCjBkL95nRgy0GtUbbS
         anEfyKbFasJaSet9dn+iPeZV79CmH2mDFKypKQ1mIhy534lQHmqLV7rKpPJLr89i+K6Y
         tD5t10k55MNzjLBX+1C7mev7Z6VzBDA8R1ghlAhwOCPnrV8y3e9hpAT0ySXarYpiCFzh
         Qllg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792691183; x=1793295983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KcxnS2rO3PjTrZzlNqZ6wvXV+cdtsvmn8hmZkoyfpCo=;
        b=sY7uQlNAAy+0iIFRfIGhlQ2TTLeUwlzZZ286y52XInH7gKXjiSngaTFqTvn/9IM+sh
         XZbRWWZApeRLuOP2qgyIyjw+qgVNFGHCU2HqT+kuwS06ZsoBp++N2sWl2sMeOgnXBMbO
         ojPp0WQbBrIA4cfxKBPMPznqHxKK3WFW3/DbzAuJpbUFC9SqoTervl/a2W17XsS0icOo
         qxraqB0egp9e+wm6p6OG6s+3JWKE/T+H8451BZTDbnQCqVDCPJVy5oKvFGXLUE4FK/Rm
         OF8pHSMLDrzRsSSAKIfWjN+73kBhGy/uosMibQX8dNzQf97v+CXtOqWJrdzDYXf5HVAK
         IA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691183; x=1793295983;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KcxnS2rO3PjTrZzlNqZ6wvXV+cdtsvmn8hmZkoyfpCo=;
        b=U8kv1fd9r9qEm4teuPnA5U5UVO3sXHaPDygjBkvzAxmfwx/NX/eIM3VKbn6r8o6ieu
         JFxDQlJy3EQFwGio6yzFPs9gSMDfR9ifp6pDOUXbSOtO4wLhtMqDFvSNZjLdzKV2L8aa
         yFLDnpZzpTE89N6WHYmh9ZNFMMGRRA/qgdYDEwgkmrRQNtbaqI094UZCpUg5cD/fRHx4
         Se5LVVxETN+EqjLgocpRLk/+5GxY7YuA/ib6v82ml6qe625DjkAFRcdXQbA9gToFpqf0
         C//5s4puHPc3q+2946GHr5/ZnUhPsAiCZlUML8z+9DjMUBXCn0GEhvMxpq01qCGiKf9H
         QRWg==
X-Gm-Message-State: AFq9FYLS/hNNHCr8BJOPA0JacUaefUAGzqwhzSn3JfjYCO/KmktLj7zh
	ySXAjz9SwfZc6km5k+3StGF2y45bUZEGjaIM8cksK2SJqEPAW+8ZYdtpwijwiXrF5RzsRf3MZuV
	DrSiIvB6FEMvMjPKUTMRQASIY72lfEeU=
X-Gm-Gg: AYBFou3rQQ9rkOsmCFmjHBdeSF2uZvH5veNdn9jDL8Tf82W59uNsLlbwSIn5mNErPIO
	DP0KUJHeVxP7UugQLQ0tVDyTcyA0LvJPxT7jkgSlXDBgezgSlQOmva2tUKveS5wt7tF3NrAvSRD
	D90Glnj0PXlTOl4sNXCpfoxzxU3MtNVE7FGe1t+Hv7CV1e6uYgQo9CaAL0862xyqMRbsGSD8K5b
	ugvRSVUcqi8qQBWZeWcMpLni81TUZrhFHExCpWxIhk/kEqgiUIwlwpWByr7aB5j6W3EfeMY1SLg
	5HvT+iSkk32fv/bPb97kVY0ffUTUU2ET5ImhGpR3jQN31Z0BdYwmoI6Xoj//H6aW3OpLqxMHBLg
	Z+bOcYpsU6+W2OTo1lEooNMw4U+vfGbrEJ0pcIA==
X-Received: by 2002:a05:690e:108a:10b0:679:af57:d19e with SMTP id
 956f58d0204a3-67a0e48803cmr1504815d50.45.1792691183482; Thu, 22 Oct 2026
 10:46:23 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAAnD8Rb4ZZrHFWMJayabioB_8bOHh1mqZ5LCXZz0jTNGMA7UZQ@mail.gmail.com>
 <0e5df58a-e97f-474b-bd3b-9b1a24ae0c03@oss.qualcomm.com>
In-Reply-To: <0e5df58a-e97f-474b-bd3b-9b1a24ae0c03@oss.qualcomm.com>
From: Jeff Roach <jeff.roach0@gmail.com>
Date: Thu, 22 Oct 2026 12:46:12 -0500
X-Gm-Features: AclHuK-1tPswR_MEEVFFZpsW45xvCgAhx1gXNNVF6lrKgi8e5Ie2wvHW3NWPcds
Message-ID: <CAAnD8RZ4+BFkE_dubDr7cj14wUaOfYUYWMw3_cwS5G0SrTsU-g@mail.gmail.com>
Subject: Re: HP OmniBook X 16 (X2 Elite, Mahua): DT bring-up report and questions
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 3:30=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:

> >    - The pm8xxx RTC probe fails with -ENOENT because this machine has n=
o
> >      RTCInfo UEFI variable (qcom,uefi-rtc-info).
>
> Remove the property.

Thanks, I tried that. With qcom,uefi-rtc-info removed from the
pmk8850 RTC node, rtc-pm8xxx probes fine and registers rtc0 (no more
-ENOENT), read-only as expected.

But the raw counter is not wall-clock time on this machine. At boot it
read 16385826 s, i.e. 1970-07-09, roughly 190 days of uptime since
some earlier power event, and it ticks at 1 Hz. Since
CONFIG_RTC_HCTOSYS=3Dy runs at registration, the kernel sets the system
clock to 1970-07-09 early in boot; NTP corrects it later once the
network is up.

So whatever the firmware/Windows use to turn the counter into real
time, it is not the RTCInfo variable: that variable does not exist in
UEFI on this laptop (checked via efivarfs in DT mode).

Do you know where else the offset could be kept on these HP machines?
If there is no known location, would you rather the board DTS keep
qcom,uefi-rtc-info (probe fails until something creates RTCInfo) or
drop it (working but read-only rtc0 that reads 1970)?

Thanks,
Jeff
