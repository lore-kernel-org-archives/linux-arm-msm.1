Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794261782;
	b=qNDBQ+V7TTrpxzXXJxSbJBLuWndETXoQ4scpkJPZx4zZnZRMQzgYxMlEPVxlwXZ8QTbY
	 Gqv5m1ojgrM4jDkLRTWGTCYhBqBnnZiv8ndutvo5tYDcbHZJsxjJHUl9t7gbuFhw2G7B4
	 GsWslkp1xAUBlABIl0D1E3gNZp0lOk2cwCqKEuLDTuLehwaEgvAiESe5rCzW0yq8jrO5j
	 S11HFyaW1Jf4K7Czae5ctsLg0zxWyUX00CNbr4GKlAZuqaXXsaurqfuctl8jqj5+M4eAQ
	 Qirib0ji/28XmLAWAH/wrGnhUhfjcG8hpc3xdLPxQWdcQD/aX82oqj1XHegbo4eXRvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794261782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/4B+HMYQGdeNoawaC8nb2MBw5WMuUhGF+veGWpIt95w=;
	b=k0mwT80AQIcPVVaYHv1qME5MVrjW0Gqj9Q4m/5CX7+PwQ+Mr8U6GE3xYm69rSJ+IzcIa
	 H1wl8uRZjwn9UrRFEFHTKVu/G5k9sIdjAHSCPv2KYE04sNEf4o5kU0FdmozqoAzE84MgM
	 OAsNdjQmgmiY/ZcI/pygxi+XRjt8jwuFT6m+t9xiHvd9wGUlf2NC8tzQuzob3zxdK41JQ
	 /o4o3jH7mIAqprnZdszVQgAjwBgcdXe+tDdoU1DEtlC9oJB2fo1DZ2//cxQROOyFhVulO
	 Is0PNwcwLUDQcOT5Ng46Val1w/0XG5rCNya2rxxtkeW5vDtICTGwSYo+I8W9SOwnhIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=luxonis.com;
	spf=pass smtp.mailfrom=luxonis.com;
	dkim=pass header.d=luxonis.com header.i=@luxonis.com header.a=rsa-sha256 header.s=google header.b=BSUTlFht;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523C2606A339
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 22:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 523C2606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=luxonis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luxonis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=luxonis.com header.i=@luxonis.com header.a=rsa-sha256 header.s=google header.b=BSUTlFht
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b757029223so146977a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 14:03:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794261781; cv=none;
        d=google.com; s=arc-20260327;
        b=nL61P97j9PmokTTGSs5NLQafl+w/nRWKJvWU7kWnn2iNhbx1mmPKhLhZNI9VJuyLEd
         HjJEvCWdW3VR9F5ykoBupY5AWiciNI8RjJnTcWkeFPZ4B3ROnU1iF0usjTt62J1wa09P
         StZ21qRFc8jQfxKQOn6QyCpEqTD0ssVmafMBFJ5T6up2HtqvCqdYRcJ4iRFfOb3OM5Q4
         QGyLXUiM7qjgOGPHihrFrxXI0sM9J83MScM91YbFCCuul6ERdBlQJcvTjx1l1yivKppb
         YC/mgZ98UtwjyuByqPw4eNoDDTP3uVUCexFOmHJC7O8BPgS0FKIQNSRDhfuWnlthx4jD
         rANg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/4B+HMYQGdeNoawaC8nb2MBw5WMuUhGF+veGWpIt95w=;
        fh=2ZnUP2udihAxvo/eAufaW/9Vkww74LtyxOHgBzgHVA4=;
        b=MzhAfSFrBcOL0XWyzrDByEdYnTfPfJEKX/S+x4QhPcc+29kONBva4SuCQt9WYq7LZU
         IWzJYongk2LZvnwCjNqcnhD5ne7TYRBRucrebYOKPofaUmudce7OhJRuhmqvKrERWyOp
         eQzo/aZa5hsoLmf65mBE+OkrkgN+0FSerg0P2Ch19gq91MLKwfXYsQ4iGu2FsE3zeKwf
         Sam2D0y+bW1c4Zml7gUapBKGWlZUSNR281PnIPFA3eMQAYj4qMTGHFWyi/lDU5Cf2Sd5
         8qI04T/2Z8Z/vhRhVIMCZncAL5UEKs+GMCXsXffr5sDcvMm+aEa0x8X0ycak8He38UlP
         QVJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=luxonis.com; s=google; t=1794261781; x=1794866581; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/4B+HMYQGdeNoawaC8nb2MBw5WMuUhGF+veGWpIt95w=;
        b=BSUTlFht39VNuJ/f2J56X1s7bZ7V2SNgiXfLZnVcGiL1jIU4NznY9fE2HkjZmULok1
         x60Vf3QAfEuCA1jvHmnHu1CC9AcJp08kuvVT8l5qpx4T4NU4ylgNZf25JIwR3YHhAKQd
         Qn0z40snzSs1+K11hpetvZMTri1kDGLdQ9Pmb6pGGbbcBhaE0eUIspki2qJK0xwomhJY
         Rq/8cEG+xuhEWuV8g+0jDwvIqDpq26NFGtV+XemcHnqOwpN6iQVJ7qI59pGoQpyzGKeA
         +f14gx25gOszOrAfXaYBcvorgkduohNMqwnYMIgQYPwprPWNiBPoveI/vOSv0NZUaed7
         dfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794261781; x=1794866581;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/4B+HMYQGdeNoawaC8nb2MBw5WMuUhGF+veGWpIt95w=;
        b=K/bk4JOMOWB+TEuZYoH7tHlhiHy/t/0cmT7gpE5iuDoAIq9gBOSkjzq4sh0XD0OKOl
         CbQLKjuZYhyKFI3K47Vi7MclSuwjKD904DHevERKXSBkxqTmmkDSEpQo7TjiA4m5XTcD
         6x/QBJVbZvE4BJ446HAYt04rmP07BaLNtdYbhkhStWtgZJaDqCmEbsXJgeFEwHHrIBmT
         rBgckeyxe+jNVlKow14EstJeGp+n0gDZ2FsZ+Lbw5uDx06oCjfpwAv6wcu2yJCoD1pEJ
         rNSof6R0Yu5q2ajs4fUgKqUqM+FU1ipbjgWu/RuNyh1gPejw6h/BP4DzuT61BAUjvo/6
         7A9Q==
X-Forwarded-Encrypted: i=1; AL+hErHu5Udmm+DJllQrRvvRD+LBxzJhVEoOjZcDyrlaOzgiAQBxiO+tHQ2Icy3i9FVXxyIqfOVDaWSMikybXBpX@vger.kernel.org
X-Gm-Message-State: APuU4Z/45BTuT0z2rUH9vwA+RuDhsmVCg1ucXxwROWkMe1yjyO+YPX49
	ohHU3EWLlax1eEBripAaFdkkdfn52UYGoTTkUuw71bqytrSpnF2k6QZMnFIVMT/H4ppz09I1jZt
	cEqAAYWJNhKJkpm3OGuovB1g4h9lVfQ8QqKOrhegmFA==
X-Gm-Gg: AYBFou3xm0AGkyAVr9vFQxB1FL0vmXnkCyMSxCE/EbXI+r5alM/msQHKcmdnPrv2ktp
	juebvkZAFB66FMaoY8wRpGeqKYsP+XqKGile0VQbPdYLJxKa6oiUEr21gc4tm6+kbyu8eXorYSg
	0pMkxmDLpw2AzAakf58lwWTE2a6HBlXXhB8VR9tXQ5vsR9OGHNb5BANwsGAcmnFSeL0EjK0Q1Kx
	+p9jtYxls6YtNCuhSqg9IKk5aS5klGM78XoIOVgYyXojhxVwSzRw7C0hAcgo5aO6y0b0lnax8yy
	eCgTTyEj6y4YIgvC6Cub9o5aRGMHTT/AJw0M7S000cAmt09hm3194ITdVQu2SwxCTXp2nNkTati
	8GjLHZ6jEDbNNW02O4079kGnFOfhNurUEnYo=
X-Received: by 2002:a05:6402:c45:b0:6b3:e89b:126a with SMTP id
 4fb4d7f45d1cf-6b7565f7d6dmr640342a12.12.1794261780736; Mon, 09 Nov 2026
 14:03:00 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109175752.793130-1-jure.rebernik@luxonis.com> <25204208-5fcc-4b00-b359-86fc5f124700@packett.cool>
In-Reply-To: <25204208-5fcc-4b00-b359-86fc5f124700@packett.cool>
From: Jure Rebernik <jure.rebernik@luxonis.com>
Date: Mon, 9 Nov 2026 23:02:49 +0100
X-Gm-Features: AclHuK-cvftGYpN4mqto5HWIYSl8oeGTMovdxZCsAtUy9fF3sq2BZncPc5FuUyM
Message-ID: <CAD9jT+r2gBSbcO7CVu_YLhiJja4PDs6O=7v5g-VM_RYx07=4Jw@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: qcom: pas: Request stop before tearing down
 GLINK and SMD
To: Val Packett <val@packett.cool>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	konrad.dybcio@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com, 
	linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Val,

Thank you for looking at the patch and for offering to test it.

On 11/9/26 10:40 PM, Val Packett wrote:
> I've been seeing crashes in sensorspd like
>
> qcom_q6v5_pas 3700000.remoteproc: fatal error received:
> EX:kernel:0x1:SNS_SEE_I_0:0x10000025:PC=0xf00280b8:LR=0xf001f>
>
> on a Kodiak device (sm7325-motorola-dubai) also cause a whole-SoC reset
> right after logging that, when trying to restart the ADSP.
>
> Those are somewhat random and not too frequent, like once every couple days.
>
> I'll test this patch and see if I no longer end up with my phone
> randomly showing the u-boot menu when I pull it out of my pocket :D

A test on Kodiak would be very welcome, thank you. I should say up
front that I don't expect this patch to change that case, though. Your
log shows a crash that the firmware reported itself:
q6v5_fatal_interrupt() clears the running flag before it reports the
crash, so qcom_q6v5_request_stop() does not send a stop request, with
or without this patch. The patch only moves the request that is sent
for a crash the host reports, such as one triggered through the
debugfs crash file. I could not inject a firmware-reported crash on my
boards, so I would be glad to hear how it behaves on your device
either way.

> Try not to provide the free advertisement right in the commit msg btw,
> and to make it sliiightly less verbose.

Thanks for the feedback, that's fair. I added the note because
generated-content.rst asks for tool use to be noted in the changelog.
I'll wait for comments from Bjorn and Mathieu, and then send a v2 that
cuts it down to one short sentence, moves the details below the ---,
and tightens the rest of the message.

> It looks a bit funny that "stop is a device" but well, it's not like I
> can think of a more elegant solution...

Agreed, it does read a bit oddly. The alternative I could see is a hook
in the remoteproc core that runs before rproc_stop() stops the
subdevices. That would change the core for every driver to fix an
ordering problem inside the qcom drivers, so I kept the change local.
I'm happy to rework it that way if Bjorn or Mathieu prefer it.

Thanks again,
Jure
