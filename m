Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC7C371071
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 16:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784909196; cv=pass; b=uvE7HvD/anNUEEHsWyOcj5Uzwtmc7lwTacYpwFNXwC5v2C41AKqKZHcYUJ9m0ln9/9OKfi1YdIpRLPnvgAxUH9iMzoOi9QKUpdSIOeWeS4lSdAiZduigI7X08fMTXN7h5zoWC4+bVct0h0h2iDTRJDtP3u2VDkG4GtEmn7WFo7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784909196; c=relaxed/simple;
	bh=1dBkWVsU5nHQtb3BqWAkQFOoST3tB7IFEaIZgopWRGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ijHCTrFaQPw43A5eleYkvRU87d38gX5aStimzSGcOKtYmTcrF1Of+Inaj1JIUpICx7ZeCN2GsymiYMKGEgxIgbKPtPwtHDeVwI4QQgCsLDUQTaBuKofJ7BHma10ZhUD0+BvANnwcm4BDT4y611HFoTJ1M20PpORAlCwlpAqgdPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OO2uouth; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OO2uouth"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-81eff3ddba4so5916237b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:06:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784909193; cv=none;
        d=google.com; s=arc-20260327;
        b=nOLIdnBcwxdvVac9ulyjhe4n5B4FY4WKjSoRM2DA6JY6J5EOTJKQRuhj4J5lkEx6VI
         9iBoLWgYODLgNmgQlsPS7PiPJSjTsl9pGchEWt9CpyQWoKOapRkAfpLrx5mRAVLVRq9J
         NmogeyCcUlyPpgBIHAJa/06XnBQjkvk+FF6uY70X/uyugAijf6g6/TlXHIb+SyXao+x+
         Utu42u4vvX1vfbKLasTsh57KlnqjDRRiOxkvHA2bM2VmaVUoEwbagXAVOMvSaQhANFSN
         ckB9RdEsjJvH9sGtzHcbPDbsb7cRRanVzxuHS7y6p1ND8tRSpf880SKy5YR+2xudGZuO
         obPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ew5N2TuKUsw5wpMVRlPG3PrZBjIkKWPJShY0hQYMAWU=;
        fh=lx5dCOExhd26EEa0/FFuZcJjRS5eypLQpGrEyP8V7jg=;
        b=BMiM/5MG6Mxzy4aFxBqmmgFJ5lJOkqbiEuc+6XRs5fjOq1D1WWWTDNatY4F+fqbGzc
         XbhEsxXV+d5D5+yORT1NQWSPlhnyYnYz0hrPelDpxf1XxX5MY2XjgvFNeLcODdjcLFiK
         othaG4nY2j5pFsqpCHGWP04/ghEe1QVMw6xNGdR+FcuoTdPE4HWxmB+bj9rsU+okf5yg
         RPjDZp0v/JHxUwbjZEOs7rR8pTxJyO9tYL3ldp/gwzKx40B6NDlDSRbKrh0Na+zZdgnL
         IaHXkm7CIEeU+G6GajZ69nxchrttlI9TjFMJnPY8WXN/bY0XY7FSvm9znUcsZgEb5pr2
         +TZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784909193; x=1785513993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ew5N2TuKUsw5wpMVRlPG3PrZBjIkKWPJShY0hQYMAWU=;
        b=OO2uouthDhLEjPKAJHic3XFqLdb9Kqi8PIanuTGzfZkZf/PbZXulPzmIz2wVXi6k/x
         srbjUlq2Gc2vylaHKLx/3Xwu02C5BakXDra9HjdmKaT2OvxQAzUvhNDRGqwh9QzPbVDe
         kVVSkUtnH3O+faTHFqskIkgqECZhe1/75Pb/cGM5wQu2USv3XsjwPsBcXs8pqM9kpWDh
         AQtE21RS4pnQA/G8hB/IuSYluvy9PqUQbSQdITKYb+lyW9jwsbTkwhIPzEd19Z+9m5bp
         zlWDgszp/jcPFZd4so/20xEecE5/I2lpEsJ6qm0UqX8mNd5YoM50xxT+kTtQAt/FAp2I
         4ChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784909193; x=1785513993;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ew5N2TuKUsw5wpMVRlPG3PrZBjIkKWPJShY0hQYMAWU=;
        b=s9ORYlS8DK41WwxMGJWzuPvv/w2Zq7m80eu/PUqY9V+jRABDCnWaqb3a5MiaFNcy5m
         dhNp5pM8UhA9oec2AS6Xndm1rEWWSGq7wKPQn97osBOYc7nG6Hnm9mbqHHPZu03TzSyA
         bOfK3JU28+ulRQqjEOSku2F+ysgJT1PSG00YDMOfBB40j1EbTr0VGCALq154TPk+68wT
         8fEMGES9GeDIs1xVa0VUvVpIXRxz76xyfE2/JHzNGfHyXz3CBMz/GPI/AQBgDKAYxEMq
         s4qfLf+P2//xGbWBoDLsa+MhLZgGVnSSYzQHLXcVp//PmHoztyD+deLfoJ2AlnBEvI9G
         77OQ==
X-Forwarded-Encrypted: i=1; AHgh+RoRpplHPhb9FqfkTm3BJ1nSJhkayq1pb2VTlrReDYB4hfhnxFP5IO2p81tY8fzOXBguJYVZu78Wj7EE55L4@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqwile2HcohLFF++F4ZyvjR494JmUXV6KFBsos19jqpI7Cyc3I
	ykcgc3+Q6GH9XoEZwoj+XR1iJis79nztnRqsXlogujO4W+obR49wfdMzDdSar1fSPyZ6APZJXAt
	U36vNhnCuoqzvNRQNSy/lL5x7EFjq7Ns=
X-Gm-Gg: AR+sD11fwzYVd3/SWE88w32lfFnE+o+LIBVpRVA1DREAi6gvllVj7sQclu+0odVKk2s
	31mU2zzKnipWY7WoFyN8UhXUD592TnKiWXgW/pInDqa6HKcQXXA966TLeQs0dhAmd+TmUPBCAXA
	vNFSgsxUzN1j9UrAcR0S8+W9Lr4uLoowhW+Qttbj1lw3Ta8BJWoICULUTdmonMnZ9oYrMvtfOOE
	Zzbs4c8OSADPT4cYb9ImNkierwC0JgRrQsnRJfEumv5rbgroolA+GKETw==
X-Received: by 2002:a05:690c:7403:b0:81e:8985:4046 with SMTP id
 00721157ae682-81f4c34faaemr23190557b3.53.1784909193265; Fri, 24 Jul 2026
 09:06:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721082410.18275-1-kaipeng94@gmail.com> <20260721082410.18275-3-kaipeng94@gmail.com>
 <aee1e26d-d3f7-4903-a34f-02fcda6a6beb@oss.qualcomm.com>
In-Reply-To: <aee1e26d-d3f7-4903-a34f-02fcda6a6beb@oss.qualcomm.com>
From: Kaipeng Zeng <kaipeng94@gmail.com>
Date: Sat, 25 Jul 2026 00:06:21 +0800
X-Gm-Features: AUfX_mzozQx6sr91XfGqke3GYXZuO5xcMO6Cbzc3XJrpc52p229Z8CNFI3YTA0s
Message-ID: <CAHk8ZduR9PxqM1-biv_6jAZ7cej-+JJpFHkjbSB3-Ba=-csKkg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add support for Acer Swift Go
 Pro AI (SFA14-11)
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	konradybcio@kernel.org, andersson@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 6:22=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 7/21/26 10:24 AM, Kaipeng Zeng wrote:
> > Introduce device tree for the Acer Swift Go Pro AI (SFA14-11).
> > It is a laptop based on the Qualcomm Snapdragon X Elite (X1E78100) SoC.
> > This device tree implementation references nodes from the x1-crd.dtsi.
> >
> > Supported features:
> >
> >  - Internal display & Brightness control
> >  - Keyboard & Touchpad
> >  - USB Type-C, Type-A
> >  - Wi-Fi & Bluetooth
> >  - ADSP & CDSP
> >  - Adreno X1-85 GPU
> >  - HDMI & USB Type-C display
> >  - Webcam
> >
> > Signed-off-by: Kaipeng Zeng <kaipeng94@gmail.com>
> > ---
>
> [...]
>
> > +             wcd-playback-dai-link {
> > +                     link-name =3D "WCD Playback";
> > +
> > +                     cpu {
> > +                             sound-dai =3D <&q6apmbedai RX_CODEC_DMA_R=
X_0>;
> > +                     };
> > +
> > +                     codec {
> > +                             sound-dai =3D <&wcd938x 0>, <&swr1 0>, <&=
lpass_rxmacro 0>;
> > +                     };
>
> 'co'dev < 'cp'u (other nodes have it correct), please also re-sort
> the -link {} nodes alphabetically
>
> [...]
>
> > +&iris {
> > +     firmware-name =3D "qcom/x1e80100/ACER/SFA14-11/qcvss8380.mbn";
> > +     status =3D "okay";
>
> Let's also keep a \n before 'status', file-wide
>
> [...]
>
>
> > +&mdss_dp1 {
> > +     ports {
> > +             /delete-node/ port@1;
> > +     };
>
> Hm?
>
> [...]
>
> > +     wcd_default: wcd-reset-n-active-state {
> > +             pins =3D "gpio191";
> > +             function =3D "gpio";
> > +             drive-strength =3D <16>;
> > +             bias-disable;
> > +             output-low;
>
> You don't need to specify output-foo on TLMM pins, the GPIO consumer
> will assert it as necessary

I noticed this before.
spkr_01_sd_n_active and spkr_23_sd_n_active (in lpass_tlmm) are also set to
output-low.

I tested that Gnome cannot detect either the speakers or the headphone usin=
g
the current DTS.
If I remove the "output-low" from wcd_default, Gnome can detect headphone
plug-in (not the speakers) and speakers will randomly output an audio pop n=
oise,
specifically when playback starts and stops.
I kept the "output-low" of them for safety.

Is it still proper to remove this "output-low"?
Should I also remove the "output-low" from spkr_*?

>
> Konrad
