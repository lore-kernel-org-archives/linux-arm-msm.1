Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A314BC010
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 12:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785462; cv=pass; b=GMcDFGYnFWafkmH6LY9xaE/zXEZ8eSMg8olCp3HuLp/5bvSlMBOGpISntEcv2DR87viXVM2hAmufqiQNVCP6og1/iVPqBfti+jk1qso53jxjrANV/gvUQ8IMWPRtGbMpHJQS5Msj6JeKBLnwrlaax6SVeOYWPLt+H/5ubVgD7Lo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785462; c=relaxed/simple;
	bh=gT+Bt5eURaG5QY5OQe8D6BhKgHr/3HEhc0BcnyDPJsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lLaZtmoxr+9gMywHxMkB7Sz7E3xDWOFqnATadTrNRIXSQ2KVa6wGoLAreXDBZDAtSlklr3DUrmX3uvQwV1EoQRq+hY2SkBpeoI+JZjpVRA0Tn9OYhlvFd9v4BZjhDN+Fz+KKTr+Wf+HCPRIAiG83C0x2lb48Igo5enFnAWhjSxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U04jKatk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D7S/LEd5; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U04jKatk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D7S/LEd5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnQ55217657
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 12:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gT+Bt5eURaG5QY5OQe8D6BhKgHr/3HEhc0BcnyDPJsc=; b=U04jKatkX5/Of0Lk
	NmSq95IrJaz5jcdpR2S3y2CdjZZrtZ5yoWV23Nl9G6UoLVXFr5aJFDMsoJi9WX0I
	nscIDNxtlNflYhFNPAXMWADWfbhGH4jyE+UTB9K4qxcPXD49SSYVfWcrjguxeEIT
	5YxVZHRqY0IiHKiufD+oEu3sQ692rdNZR0iwB2iLAudyyGRUXah+yzW/eGC/j5GV
	OpNpHAZsAMwSdDV1TDRFnU/WVuXH2wSDuQRWd50xY5EagiCkjIaZj703b4cFmVsP
	v0sXaSQuO7cUCRLl/3/CJmTrcuN6JvGiwTM4bqVg0Ec4ccJogB1oAkJj0fPshJKx
	ZHO2kA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtdqgux9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 12:50:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9103c9c0b34so78224286d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 05:50:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788785458; cv=none;
        d=google.com; s=arc-20260327;
        b=MYMEi9JQG2LsrJF/uuldAhI+lAdQ2cSUCvfOGqjniI2l7tz/ybYIHLL88PtSi6uef9
         iYtUhLgCp8ITHKVSkCJk3dO7ovNSe97J7FjhedbSxDkECIr2aQEKHDfSE6x8YN0jpXis
         Gh5zbxesKoWPwf42uCCVN1ileVy+bgeoBWIx4boRj0uJy5wljD1vOLQxp7cion6zOD6M
         CRiMtp4BW+jjCX18waHoXdBILKJG2JBoomtI/YOQvDfIpSBveDdjR8v8BB7T4kGX4D/D
         rFXpZO+QV8qRtacYt4c7usWGbwU9m5cQcHl79ecEd0muChmbG4HbVknFzViiRRh9qA5k
         fQOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gT+Bt5eURaG5QY5OQe8D6BhKgHr/3HEhc0BcnyDPJsc=;
        fh=ZZgc+eV8tusXJOxoCnFkicd0buNWySa/ehGU7/1WWco=;
        b=drdghAIUS2J1sm9XE9JjMQdzHwU9tpedjK+13Zw5hWJjpTSXvbJTfDWYIcd+Cql2Po
         CXsdiJvBKEkDbEUDf62YNl5vgvZbByRWp6hvvFDlEqQszs6SFUQlX/XeiEj5M7sRfSG/
         SptRvmTzqgAHgAjULdgm82ogHAFxcCpnuXu81LqXZX5lwzEvAbx8kZ6xk2CePeZgn32+
         t7/2+lIrrEX5y0nw7dP0XABiKKF8oZodI+jxtkvKQnjByaW8ToUsaO9ldpRlsO0c8TcR
         E28oHw4VJC9/N6j8WnLzNq0fJuAqr1t5piJt+3K/kW0AUkSuus5EeLdSZBsKI90a2UeY
         098g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788785458; x=1789390258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gT+Bt5eURaG5QY5OQe8D6BhKgHr/3HEhc0BcnyDPJsc=;
        b=D7S/LEd5tfmtAEoVBVUlbGFPQU6VKZUF6Je2YKaHzboMgG4c99XlJi2XdYmYUTlbFV
         2jcTK3II3F5K7p3rCXJWuLbI23ZM/zO4YMK1gF9S98VsFnH9njBf9UL3qWHYCDrC/iQ1
         P8KcfZ2fjjnCiuRCybfFhjBvFTifik1vvY70WK7D4A0dSmotItmcUZ2jaIxZTkqcH+cI
         ry4v9QNHbBpTXQGV1d6qic2TEaPCOCzgTIgVv1e80EnheXyqK2M+eegseltrbo8kVYvN
         yVWdPTTYKtR1xBSXGe0YDdvv6hpftT+suysydKLOpr0WFpUIcKyWHWH19noPraGnXB8j
         +9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788785458; x=1789390258;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gT+Bt5eURaG5QY5OQe8D6BhKgHr/3HEhc0BcnyDPJsc=;
        b=UEV1MouRkyoXHD2L9Dv5rQmB2U2Z97iagI1DorPO8g5plcedZzYMLnG3e8BW5RJ+VD
         0NQFIX1L907X+fAAiKaGH8ZqlceKBaFcOCUMDiNGjgLNuEXm5DZdhTLy8pAb7wRBTO9S
         yTJaIL1PpuNBu/LknGSXYqdRVqmzHAkt+iCmbG6r5VjpfshzWu/5hzsuX0Mcso9pGY/C
         t2A4ddDCPiV7k1OHcLGbGWNLyaeZxId5fsyA3VANs1+V77RwnXOxxsNZYXMLlnsKR4Vi
         ZnA5e8KXKSkA3bhrph3QsHyEidg7/7r2nnneEoEWxR/aLlZ+PMCIA6mie/jO7Lk64Q65
         NkQw==
X-Forwarded-Encrypted: i=1; AKwUvBysmfm/4dJIetfqiHnJ8eCFLLv2ftERFjlTcdhzLSsXzLIDTWuRnJovyiihwirNHSv9Wbrp2SnYMdC7a8es@vger.kernel.org
X-Gm-Message-State: AFuF++lHxL3S0oQjQyG0u/RjmT6jypybJEggQ5UY5QsFC+WUIZVu6NVU
	sX+bmNd40HbdMsZMbI1Rq9NRzlYHb2bPqA3nxrIpfC+jEEzmKMggqXJvLWlh78/0qhM4kJBtBsM
	43E2KZXhIpu2WQ2wtMT1bKQBrZR7t2GfVhKOTP/6/LekQVFvN98zuyFuEbU305j37padCyUNa9w
	MmUdR21MdmY8kuqtiv1hnHBltNkpOWl3EJ0cLa6ZzfiPg=
X-Gm-Gg: AYBFou0i2433+uKdcWn2P7eZ8h63HAmfnfGj+2pDLS1l9PpA6KvUYRLMV+Yqd/ZZyIU
	6Sfmfpyj5Sm/E7FgKZJ8cuB9kArktb0NdNdSZm0lCW4JF7yGwsXiOzlKFADyOczg2fN4Mw+lqPI
	I7QErAqHEM+LWXHNODEpjpGrCJ1ykZiB7rncgtebIzSKt8+684ljUt+vpqE297aa5g0YbBEXMBn
	RWsIpqORTa3IlYXKwHZfUgbszZ3IWW0rs4kowSQpxkZSCioe7pK4F3igdK5XOzm7qE4ue+RgPU=
X-Received: by 2002:ad4:5d67:0:b0:90e:84e1:8b93 with SMTP id 6a1803df08f44-9103efbc676mr253793416d6.16.1788785458351;
        Mon, 07 Sep 2026 05:50:58 -0700 (PDT)
X-Received: by 2002:ad4:5d67:0:b0:90e:84e1:8b93 with SMTP id
 6a1803df08f44-9103efbc676mr253793026d6.16.1788785457864; Mon, 07 Sep 2026
 05:50:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-monza-wireless-v6-0-d8c5042b3efd@oss.qualcomm.com> <CAMRc=MfDAiUMzOYRWioK2NDM37=yQqb4pQ5ETZz1PVOKQhhdug@mail.gmail.com>
In-Reply-To: <CAMRc=MfDAiUMzOYRWioK2NDM37=yQqb4pQ5ETZz1PVOKQhhdug@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:50:45 +0200
X-Gm-Features: AcwNN1Uy8Dv_z6eHdNiSSHvTLy1MMXc0Rh3LRZ3dI-XaUt9s5OrddNB4Kn5BgT8
Message-ID: <CAFEp6-1PuGMGkdfWYiUQnYffm7en8b-DQybg_4M9xw9MVDNRsQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/11] arm64: dts: monaco-arduino-monza: Add support
 for LGA WiFi/BT module
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0MiBTYWx0ZWRfX1HlgL5vAhJ+Q
 OAbUMLZxiKhrV1db4zzclGOwxWfHuIn41+tkBDwnTl2f7y1r6bef5Jb0YYw5iZTkRvgFYwizZtp
 38h7p8uqj1ddzbMbiTCjMs/a3N4gT2fRlX3Fbbx/+nF/jfCCwrID0JVfp8iJvs2LOvGBQGDgaxk
 J8PnYtXiB7z/qoQ+WW3BYMw9UfcoZsMH7SCVQkqW72gtES8GacGDO/T+kSWs4bObeSSjNCjFIlj
 awa+oUQPpwhuMfwnkDymEIA2yu7JUcquoxmV0TdKjye+/zA9Oqv00/SRBAHQvMCjI0fs6oN/G2k
 2gXfx59KABexpfos7YREkzrew6lIJ1VZyy4FmP/rfJJgvGWQSthdblp+6/bQZ7GMp7ZJGRBBdoo
 1cvEQ+Rcr1XUIrAtoN9899zKHQbZb5tOhj9aTfIqTZPnavHHY4RccP3NvkcxURZSVh6enuyZj/v
 deu/7wq6PrMhHbLHuUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0MiBTYWx0ZWRfX6Y8FcuuH3tC6
 FQya6753anR4FKUjF2zVBHMO+1bkaPRyrEEzX35iSDlxTCPJTm9zUaZL5sCbAwkx5GNVg/pW2tM
 ugIb6H3ZiVraMEsiQPHDjlPBsEtQ6+g=
X-Proofpoint-ORIG-GUID: tbIRBWiboYHoO2vNG3543syOqSqqjqge
X-Authority-Analysis: v=2.4 cv=U6aiy+ru c=1 sm=1 tr=0 ts=6a9eb332 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=YKo8iWYt6ehE2M1v1KUA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: tbIRBWiboYHoO2vNG3543syOqSqqjqge
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070142

Hi Bartosz,

On Mon, Sep 7, 2026 at 10:24=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Fri, 4 Sep 2026 17:42:15 +0200, Loic Poulain
> <loic.poulain@oss.qualcomm.com> said:
> > This series describes support for the onboard WiFi/Bluetooth module
> > present on the Arduino VENTUNO Q (monaco) platform.
> >
> > The board provides LGA pads for a wireless module. On the VENTUNO Q
> > these pads are populated with an NFA725B module featuring the
> > QCA2066 WiFi/BT combo chip. While implemented as an LGA footprint,
> > the design is functionally compatible with the M.2 Key E.
> >
> > The NFA725B exposes WiFi over PCIe and Bluetooth over a UART.
> > Both interfaces are gated through the W_DISABLE1# and W_DISABLE2#
> > signals, as defined by the M.2 specification and handled here via
> > the pcie-m2 power sequencer.
> >
> > This series models the hardware using the existing pwrseq framework
> > and connector bindings, allowing coordinated PCIe and UART bring-up.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
>
> What is the merge strategy? Do the pwrseq changes depend on first two blu=
etooth
> patches (I don't think so)? Can they go onto an immutable branch shared w=
ith
> the BT tree?

The pwrseq changes are only a dependency for the Bluetooth changes,
not the other way around. So yes, they can potentially go separately.

Regards,
Loic
