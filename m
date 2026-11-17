Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794896101;
	b=E80QGV7BIf2f2fsIoUqCugxLuQhjMyTQHAVQxbpLM05Ojx17/I8jB5elhHDbrrJuS9Gc
	 WFHlC1nRSHszWX+IZk4LF/innIQ2Eo3GWQdtNz69+Zw4wPUIbCDtT00eDxUW3Imt73tGL
	 rZMpPrhqeLNzq9GWBhbWegnhBE0+PPzp0g8gex7Z3ZFv9CUZtEF2lQf7e1RuPlZvUr9fe
	 ZVkv49itrEp8Wqa24cqxYf6+fXi6FQIVrHkZHO4jeG/u/tCUxo9TAKElVwoYtHmvrWCim
	 adQl1OWV7QbPcHeXDq/WYkJkjm+jZ3kkdf8KXzBueUZ9cwRERxV3dzxXG0wtuaVgMDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794896101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2tlG1uGoZcjaYy1xmlXhRKnsoUqHxLQ1mQdDaLWoWxw=;
	b=0nmoklbhQypusymOc8KRNzl6y3m2ieitWct6LO5d0uiPwIk2kqQaZGipsx52opYhtK8r
	 g9lfiEQgpF6+9NIUokkO98eEBhCzbpgl0VMCKSnjdzX4ky7ujumnyNqNHhiqWk4hFqaVT
	 p3teLJMDy8kv2YmVca9GPUz7sRlIW9oWdwlEYNKuvQMvCSbxX4xDhOt9KL59Q/6J0rr4b
	 j3FxMzuUfFJs8J2KLUxy2XkPKut/DgyUcXoPE8WQACTCJnRhvGkzoFR3EW0Yb1D8rns26
	 CQI6sgtgm3+IDkjbt4bfasnPyONg+s9rmK1pZfDuz0sDZp6sGbNLGUyXlFb9adbMt/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BG4FZG5e;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D01606A32A
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 06:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74D01606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BG4FZG5e
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-170135e43c7so6858323c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 22:15:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794896100; cv=none;
        d=google.com; s=arc-20260327;
        b=MR4FIzeRFB4i1yKt0XuraseKmdFvUH3RmDK5BnBwCe8ETTR4xkN4ZQc3KUirYrLVCd
         RnIA+bqCgpMKo+JNE1BmMQZthIRwms0lSL+XPeSRvRwCQ7SxvunN9yZE3/xeQvJnjTB8
         /lgk7Yo1SZg0vM0H4cVPnRZpsiYoGPtEFlYi526Ov2Ig6KI3BXkmTjANibSACY9U+VPI
         +F+vQ3F/DTywmNUZd2RnCwQ39eX9beTA0TARij2xchFchRF78epf9Sch7jkNykd9rjKA
         nQwvRVr0HsHRt90kRTQnmTofQqN6CvMi6TwR4X/LME5lvOGWRoMn6uyXb6DWBw9VBZk2
         GPhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2tlG1uGoZcjaYy1xmlXhRKnsoUqHxLQ1mQdDaLWoWxw=;
        fh=vYODYIKjt06aAFx16MY883AFNY37Xj4Bc+cOdfrWJKU=;
        b=ZQIMxRplzH59AtZnxtlGMYarT+fgHg2CjAx3+bAloOLGiFmlNCog2CXt6F1KTCRJE9
         YV6so6N3R2NFWT3IVeqNOZtPwl2tkMiWbS66v/rmcTI2tKFpbAnKh4D3CLow6Gj1Py/6
         vPCp2SPkju8Qacp5tjlQa5KPVfWrD5QgyeYUhxCFduL8gRPB/1MhNn2lg3qFL16KOgCz
         AvJPR5JfHJkAeohHEmmyo+Cz5HV10T1cT1gnPqPAThViigV7H2POSUVHEaK7SDPIo0ZM
         3EDQbbFMlUWa+bDJtxRnXpe+HIPllNitvpAWEhdLAXbW3WvP3sai+ez/F2PrmLn2gsb9
         0mxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794896100; x=1795500900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2tlG1uGoZcjaYy1xmlXhRKnsoUqHxLQ1mQdDaLWoWxw=;
        b=BG4FZG5ebLAflhDHW2u0yN8dm3eyrZXUYTLHo5JldGheWYi1fIsH2FaizeVmFA9kLI
         +RyhuNCMrzqWS7kJhDGPo4BxJFoKyvf2IYtNVsgl0LkC/dmaN8aKXN2eml8i0ij6E0qs
         BvT6Jk6X4MklIDZaKrqCiwvBjo61puWWfw2hdNfM48pEQ/LxtMvvxqI7j9nGjYxHmsE8
         UrnoDT3FJLhp7ZFdLeDNpw5eLbBmuR/zTY+xxKAAgxqoGkfGsb9IZgXJmtfSEGleFcRE
         ifTsOtpXm4n6cQW6dWpaKzDipKLQwPpnl/vqAnbpR0nin39ANrSZbIj8udtOVpcwRmkk
         KvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794896100; x=1795500900;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2tlG1uGoZcjaYy1xmlXhRKnsoUqHxLQ1mQdDaLWoWxw=;
        b=YjwULedPpK5vyEc+p0X0xslG1AgziJ7rjOq5NAIacudXXxJ1yLNTqAXB33t8bCOTY/
         TuC6S1hYeicFNxiv03fC/TCynqyYpf8nfV75k/UPpvPjQsiFYFLCAV2W+ODcsivf8Rzf
         msZO6iUkvz97I4GUeT4HzR3ziLG7P0GwQ+qrlJ2wkZuQfByNY9O+BtoOzoEgAGTuf+gJ
         glvaHjqlHCQOpsenjopYAW95E+ot4A1vu9vniGDcK0enX+fN/+Gw4fiT2NmBpIVkcO7z
         DyN5KKb2+rP9K5Q3NNd8ZY8WoMzZkuXiMFORVlplTFykYRi777PngInZ52pF7QSk58M2
         ZxVg==
X-Forwarded-Encrypted: i=1; AL+hErE/VVJsHNSolf/orxac2QLVEzhobOD6GxhY9FzG6LSMhNdPTpu8HPXRvSZA3Hwc9AaW3aGJLOqpZKN14mFI@vger.kernel.org
X-Gm-Message-State: APuU4Z+apPsnZDq/mtEGmO1Ipp/YCkVE1wi1rGZivKqGcA4wpKUq8AIM
	TNg6FpeTn9E5xsuVaFxfOHN9e40y0vPcRskw4G0E48tMG41Dg7lD2ter1PrNo7Wmv4kiFtRRi3W
	+Q2E9CmoT07Ln//on0VKa/zUzRtNMdSY=
X-Gm-Gg: AYBFou1dSXepBpf+0a4B+jK3Ko3CVINDRE6QWSkgQBxrifN92j5i/dZpb+N5X0MRqe5
	cNZI6YDKi3R5H6FHhxiE7Zd+E79629XUQIGebisg9/1mrhuYOMtmhw3aPi1BeBhzbrx98CEjOdo
	/hrKGyhoNdC4d5j96PYzi/MutLXAnYJEHhepWSOEWEsr7xM4AdQSZC4J2Oc7xUwKdj4k88aqweA
	4BuDxz8rmj3SmYgCqK0ylbnGXRl6T/clNp7xTvcDImgEE+KnKxDBen5GcKDwzzG2+jlIAGlKnDv
	Y92o34NefN8LQ7y/u6CXf86caOn/veYuzGXVLm5sS7nEB6rnxaGFYLZY1Aq8qgxg/6NC0KmXTdF
	MZlZYvyh6NYhIf5UoxVTZOL8mtxy+pM6yfyAz23I=
X-Received: by 2002:a05:701a:cccc:20b0:1b5:32d7:7d73 with SMTP id
 a92af1059eb24-1b532d780bbmr3902889c88.30.1794896100415; Mon, 16 Nov 2026
 22:15:00 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
 <20261022-psci-fix-v3-1-9ce2133c5659@gmail.com> <CAPx+jO-rMeg8BvemcMUcC10enjt0dkqWvsK+uRwc75rWpLXhMg@mail.gmail.com>
In-Reply-To: <CAPx+jO-rMeg8BvemcMUcC10enjt0dkqWvsK+uRwc75rWpLXhMg@mail.gmail.com>
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Tue, 17 Nov 2026 13:14:49 +0700
X-Gm-Features: AclHuK-92z3C_GXFHu7R-8mmf-2cWRgFAIJrCVXLvNtI2-ZT_Yern3kmnNXQGro
Message-ID: <CAAq9HC4doEs2v=aW0-tR+ARD8a1OGes8xDi2BV=T7m40YFBmww@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: psci: Add skip-suspend-mode-switch
 property
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Christian Loehle <christian.loehle@arm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Val Packett <val@packett.cool>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Alejandro Tafalla <atafalla@dnyon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 8:10=E2=80=AFPM Ulf Hansson
<ulf.hansson@oss.qualcomm.com> wrote:
>
> + Sudeep
>
> On Thu, Oct 22, 2026 at 11:41=E2=80=AFAM Reza Kurniawan <imkyufie@gmail.c=
om> wrote:
> >
> > From: Alejandro Tafalla <atafalla@dnyon.com>
> >
> > On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI_FEATURES reports
> > that OS-initiated mode is supported, but every PSCI_SET_SUSPEND_MODE
> > call is rejected with NOT_SUPPORTED.
> >
> > PSCI provides no call to read back the current suspend mode, so the OS
> > cannot tell which mode the firmware is operating in or why the switch
> > is rejected.
> >
> > Add an optional flag that tells the OS not to issue
> > PSCI_SET_SUSPEND_MODE on such firmware.
>
> I think it would be nice to further clarify what's going on in the
> PSCI FW. If I understand correctly, the only supported mode is the
> PSCI OS-initiated mode, hence it's always running in this mode, right?

That is correct.

>
> This is clearly a violation of the PSCI spec - and I guess updating
> the FW isn't possible at this late state, or is it?

Just as Val stated, it's not possible sadly.

>
> >
> > Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
> > [Reza Kurniawan: split out the patch, rewrote the property description,
> >  renamed the property]
> > Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
> > Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/arm/psci.yaml | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Document=
ation/devicetree/bindings/arm/psci.yaml
> > index 0d04389c81..2eee38d155 100644
> > --- a/Documentation/devicetree/bindings/arm/psci.yaml
> > +++ b/Documentation/devicetree/bindings/arm/psci.yaml
> > @@ -98,6 +98,19 @@ properties:
> >        [1] Kernel documentation - ARM idle states bindings
> >          Documentation/devicetree/bindings/cpu/idle-states.yaml
> >
> > +  skip-suspend-mode-switch:
>
> Maybe a more descriptive name can be found?
>
> osi-mode-only or broken-suspend-mode-osi-only?

I initially settled with a similar name before (with 'osi-only'
phrasing). I ultimately went with 'skip-suspend-mode-switch' because
the root cause was only due to the mode switch not functioning
properly. This property doesn't do anything regarding the mode the
firmware is stuck at as it's only fixing the failed call. Normally,
the driver sets the PSCI to the preferred mode at driver probe (OSI if
supported, PC otherwise). This property simply skips that part and
assumes the FW is already in the preferred mode. It could
theoretically work for firmware stuck at either OSI or PC mode, as long
as the platform shows the same symptom, It is mode-agnostic essentially.
That being said, I'm not completely against the 'osi-only' phrasing.

What do you think of the above rationale? I'm open to suggestions.

I admit that the word "skip" here isn't really helpful since it counts
as an implementation detail. "broken" should better describe that it's
a quirk.

Best regards,
Reza
