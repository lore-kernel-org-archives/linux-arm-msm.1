Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792707779;
	b=0/iy0jlFoRo3Zs2TYcLYpIEpnGs7atRKW2wqXYwZyW4oTCz3oIq82U7oKw5puWCD9Dko
	 7qO7tGrII5eq65T2j4d/0UMZt1b9DuLdoM9h5MlrVe5MsXOWNvoje2dofGdGC3BXJLicK
	 TULb7LilOqUlCmFWnDWULj8WiNg7I+PF2FTFPkgtf+BH5ZDnGOG2ginxSDjq/2597qVkk
	 ADu5DzmOFSPaTNr1xenF5/3zEoC5214pgAJab8mbm9iwV7joiJIzq0G2lxabW0ZN1j5g/
	 zZmw6gFXk6dOc7zMSuWXl/VlJJMLFnixmvTydriwJlWOQpSecan8KqBwTxT+t3l/Omg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792707779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=IyxDX/14UOt5RYjU5kEETSEQBq9q7xKeyVkNGXy+RHg=;
	b=naqWuRRZukxItBgMG/5wl4Mtnqkz+qx6II/yLKioab0L1hsi/41XHfIstghlPRAQ8xDR
	 16ndPTvO1Efhny8BaiSCJt3QnRCmKTAz6Eeg16VXAXdAEakKLVsbp4D03dBK/GjiYaiJ4
	 S/7MLgPgBZrglrys/FIs5xlfN2vWspR3tPyw80UP30kytEl9NlmEMpgmKTBUeywove3RG
	 Ilvd54xrbwjVJaDdL4OCybpBIjX6c8FWlo/BT0ct19++ug7QlCsWQ7Y0/BPhbUdWO9mvy
	 XsGLS+sGhI/q3LHYPYq0McbUQA1Ngq6DPPpRKJFVTO8QoBHnNEm+rZGYHoHPEiGoUvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KyHDxi4C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A54B606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 22:22:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A54B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KyHDxi4C
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-677af43eed4so418008d50.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 15:22:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792707778; cv=none;
        d=google.com; s=arc-20260327;
        b=DSSxZsydkEf7AiNJD/T9vcODqUgweFvHTmJiQUS5ruMreZafiwhWCAOonipVXbZL6+
         1w7iQhdSjlmq18KrBd6KQTgpjGfPHEYLF393WCib9uh6Hp0Pn0vYpaVsJe9o9jHe8Djd
         aacj3jeOJAf7x/dA3afmaWl3d1BVw/a0Ua/sHeALFEmV/mYUgdr3jXLacnu7hoMCbtM6
         NZXDRmnOZ4ehDGZmP64sjAlnX09fmNk0zoCz3Iqjk+qXZkj1Jg+U6UI3wBSdxaRWILuP
         cDXhAgOIkUqh/eRq9PbN9WFZntY/2HGTmA7G5PE0ovkSIFr67Dr1zjqGWjmnKFbOHlIa
         RYJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IyxDX/14UOt5RYjU5kEETSEQBq9q7xKeyVkNGXy+RHg=;
        fh=hQ/e9OUkbGt1jBhTAVf90xCqKqNIXmGvzcp0rT/6lig=;
        b=IWU6p2iYoAyaVOpkok/qDHjRr+xYvBcQNQDjaj9IxWB+E1dCsaD/i76+6DyKMtlEg3
         KE/0WB+ozUR8pNR/KjmeUSj6ezLzEhHaOeAFRH+4vFpm6520iX6cFFelbPGcG31YcF8O
         IdZ20Jnd7fziEnihJNg3wHDZlWC8Oc8vwxlTP2Vf9Qytgm1G+xI9DdsIMLQCx2xtORPH
         FI+F2IZy/NDIoPzOKJhkPYKezSrhKNDlGCql0s39/2kxmWAFzmnF2kFRLbwTdcmvihLN
         6Itm6E8KeY4EqTGx14HEOwLzDhcMe7xD4Ky93k07eC9SLo48so8yowVmsWPOuK/bfMEB
         BCUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792707778; x=1793312578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IyxDX/14UOt5RYjU5kEETSEQBq9q7xKeyVkNGXy+RHg=;
        b=KyHDxi4CO1dlTSB0PZdWRpX9lVvvYP8pv9IEi9Swu309GDyky2KsK5da/gXMpgMaKu
         iieO6qB6tKk/B6AYAUiA0d1cWCq/W0OcyMVn0KIZhlQXAqqhupwnjBELVva8+szoAEW0
         1j0U/uKOTMvKF3MemhvLYAQkUCnYyCAYtvxoQsNhzc6VCEM/ic7UwbphWJaoGAAX5K0w
         /6vWlTGktCCxFhVkb9YFYh8P+oYC+aEfgix5mhGAOdDi4wm+010LNxIgYwpgF76skXcq
         YDzuXYJtUfxF0dgacD7sJz7l0QivjpfcoXmfhUFcDybsYeFS3x9KRz4J0C/ZszHVJmoE
         VCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792707778; x=1793312578;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IyxDX/14UOt5RYjU5kEETSEQBq9q7xKeyVkNGXy+RHg=;
        b=jVw54SoOv8nrvvrUj1kc+sbW3AHlwy+F+0zv0VS6lB0YbakgogAW00yOmbgb76JWo2
         A2rPXnm/5h+66iNFsGmWnuGJ/h67TL27YfyTDb18yh9pAFHxi+lDYs6uUftYimnmKF5d
         e4bxyVa9i8MxVxQrVx5tB15fNnkOKlNqIBw1V6b3ho9TQD5p5jO/3zXi5BhVcOjiptxr
         WaZFRI1I01/CqmJTYHvKwETmqw6DkFvA8DUevfzO+3zQRq1wEmPXVARMSYOxr1d7O1zS
         tiUZAPhxpcPx/eaYhFrHgtTsPiOBtRLMGpfPg8ctf4JKHL9MjG7puo23uf/8Ufqr0mGX
         MtJw==
X-Gm-Message-State: AFq9FYL1fHd+SRTqOTM2Xy9hgAaKwga1kGMpCfdsksv3dp0VsPUTVo9F
	/3Kk3Hg/Fp386z3BP/SifBf2FjmmDUL3fvg5wYCmeLdrBKuApbe9F3HuIdlwAWeWdGQACIvj1iu
	GNcA5CzuItfp0Eh4ObX6wR37fTv0Cg3s=
X-Gm-Gg: AYBFou1+8ozpiv+QdF378bwqtoB1Q3kuCYgL3BytM35uGhaiKsbEn7YxQIUf/qR215y
	fWJH5nOHxecAUA7tbroUiKVGhtWeoXTPi4Ad+4NSFGauRZD5WZCWaAodH08EphbjMlnznfulFeP
	GKml3+Xr8NhpTWT52APybXVTVQvKV6+xCrU5lNDtF+XuzuX8OMGOXQHZKPbo5sGoERE6Icxte0a
	Mc7YfJgq3FysDnlOFMWj+55E2XhXZzTtlHsYmHID0tF2NcsfmqqmumwDKMuw1/Eq4POCEtknjtZ
	3kIjdpy/2XZbeeWForh6Jqwwk2sJQkFlhsyFqhIUVUaO/IqFJ/2wn09jPU2MmGgqbZj5e4OY3D5
	Km4lql3Sxbwor4viwnZTP3lGZ/YcZo9ATDaeGnw==
X-Received: by 2002:a05:690e:458a:20b0:677:d023:49e3 with SMTP id
 956f58d0204a3-67a35c5e1dbmr219502d50.65.1792707777994; Thu, 22 Oct 2026
 15:22:57 -0700 (PDT)
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
Date: Thu, 22 Oct 2026 17:22:47 -0500
X-Gm-Features: AclHuK_THKaZgTd8Q3McUkEjDSZQ9aA9YmOt6KEHNPU3LIirDaGfRVMJ66NDL6s
Message-ID: <CAAnD8RaQLxstSjib-521b9fTKgzDnS+x84rLZeEYT=M=D5f6gA@mail.gmail.com>
Subject: Re: HP OmniBook X 16 (X2 Elite, Mahua): DT bring-up report and questions
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 3:30=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:

> > 2. CPU frequency. scmi_cpufreq fails: "timed out in resp" and "Failed
> >    to query supported version for protocol 0x13", probe -110. The SCMI
> >    base protocol answers at boot ("Qualcomm:PDP0"). The perf
> >    protocol never does. The clocks stay where UEFI left them (about 3.5
> >    and 3.9 GHz). Is perf over SCMI expected to work on Mahua with
> >    production firmware, or is something else needed?
>
> For a workaround, adjust your config to CONFIG_QCOM_CPUCP_MBOX=3Dy
> from =3Dm

Thanks. Before rebuilding the kernel image I tried to check whether
load timing is the issue, and it does not seem to be:

- The Ubuntu kernel has CONFIG_QCOM_CPUCP_MBOX=3Dm, but the module is
  already in the initramfs and loads about 1 s into boot. The SCMI
  core probes right after it and the base protocol answers.

- I also put scmi_cpufreq in the initramfs (dracut --force-drivers,
  loaded before udev). It now probes immediately after the SCMI core,
  in consecutive log lines, and fails the same way: "timed out in
  resp", "Failed to query supported version for protocol 0x13",
  probe -110.

- Later, with SCMI raw mode (debugfs scmi/0/raw), base
  PROTOCOL_VERSION still answers (2.0) and DISCOVER_LIST_PROTOCOLS
  lists 0x13 and 0x80. But perf PROTOCOL_VERSION and
  PROTOCOL_ATTRIBUTES get no reply at all, not even a late one. The
  apss_cpucp_mbox interrupt count only goes up for the base replies.

So the channel works, and the firmware advertises perf but ignores
perf messages, whether they are sent early or late. Could you say why
=3Dy would make a difference? Is it about the order relative to
something else at boot (e.g. a firmware handshake that only happens
if the mailbox driver is up before a certain point), or something
else? I want to understand it before I rebuild the kernel image.

I've since put my test initramfs back the way it was.

Thanks,
Jeff
