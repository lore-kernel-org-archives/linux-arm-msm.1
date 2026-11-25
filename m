Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795612207;
	b=U7hqZngzZlQr4vTONFihP1L8lkx89aqedImJ/LvVGocsGIz2BLfuM3DI65aPSJns+aKb
	 WpjpW4ch6RRneXz0i40ZOewu3Z3MKBgTRhHOslpZuRI+Kg5XUYQiy9OMKxJCSDFm2K7Cm
	 +Au/KqMPi5ta19K5QE5AMOGHHhmoPhNyKMIX8fLZb4RGVHcqWgciQGZ1q6bSKZXaK4pWy
	 NdDwlhnxqxLskXQ+s8XJ+XuyfipEteB8qTWk/sLoH+Rfp876PXEy7Okfbl+yqVvThYFsQ
	 4Bb+AM6IZOFH1fW/+016MyVkgFdPcfQFwGLGasPX74brLG5Vs0neeNPYhgJA60MTvXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612207;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7zYC14kkeeAydLtOuE3dZ/lyIfuyBLa6WSEsS0ZThvY=;
	b=BKwRDLBvcbaDxyE56DGFqw7hoIGPWmprFtidqG/DF94bpsTungKzqcqsTzqfvk6Cc0ys
	 wGKIJWXihZw74r18JDWa7+C2wPe8Dmnwi1BAy+ZzbEopTjPGH7heBFdXXqoZPdmZY7f3i
	 L+2TFtvPIGrKetHGljjRPmIXkiYAhkkc7OKwZZsge2ySkqZWyzlF0zQMeuDsX3lDmVFXd
	 cN7QnDLom8DQzk4MG0wrYO8fJxWFvNDPKeDP/y0e9koqkVH4vglBMop2SuWN+mD9B8bQg
	 QrRUyOPwDbANurm2KTs5ITrAWJC4Hq/vFOpwLL83miQC5ih7CMszjp0W8IXWBVGVc0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XP1uVxlM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HCTsscWa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F892606A323
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F892606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XP1uVxlM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HCTsscWa
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mScm3764057
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7zYC14kkeeAydLtOuE3dZ/lyIfuyBLa6WSEsS0ZThvY=; b=XP1uVxlMIAT52RJ6
	U9GJgrDIM6cDgB3qq5Udzh/EG3fWMBTEkexAfef9+HRsup89OlthsGib/Y58NBkT
	3vzJ9UPhFt0O3P87OPZda+jjqojkoPp6Htp25iWkVaHhd5CT88vfjLtXsZW0XEJc
	R00lw8tuXWN9W8qwS3h2Um9zBNl9S0qNUWQE+ZMBdzSqDV/9N+tWyccR1ZKGs65L
	Ug0Q7R+VEJlPmGiML16PG5Lme1zfEK02jbLRu/NyV9ymzRfMrG5e2u129tQOcWPu
	raeMT1soGb1sQfhkbbgRszux6zuqrU8b6lxp8ie/HuTtqah7MUWjQIFyfl9eZgD9
	Itib/g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vv2rwq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:10:05 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd3b9e70f88so596745a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 05:10:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795612204; cv=none;
        d=google.com; s=arc-20260327;
        b=ZYXtzTJZJqIVznFOtn6TS/24cV8krrN7eZsGm1aXCrHB1HLuFRq8F3Jq/c3oQGyvnj
         WTIxMKWDgNABGgXz2Xm+bEz6NZsyiL0i5jkPTQk2Ajul7wKcGQW2wRGdUqRCgblar70m
         GTCBCq3z4Iva45vaxvOUpKIFyvOEuB2NoEZxZ0S1dMEvZNGvgsgykH2CL3lcPHxRJNV3
         nUFbTNuQPDRi9L1dyYWHIIG+unKEmq2NDEMAzkkbQfi7zT440XbX5t3L0MEZhy5YJmHe
         S/ybPCOT5ls5hFGRjrvjqA7wTp6+ZGNuK6f+RfeKSRlXsLmAt1rUP8nplEloEfvFES7p
         aLJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7zYC14kkeeAydLtOuE3dZ/lyIfuyBLa6WSEsS0ZThvY=;
        fh=zppEkFzqJn031qS3HOZOswgd/46KJV4k0WRIOo0vu1s=;
        b=qJFUm6wKr54cBHpfRHdJRJvffiCLl5NejG1yR/7VHL0iztESSxbmAOzoQhJJyyyt8D
         +oSCTGHFOnizMwBKk3NzcmR5LsuUDGai1duy4FtD9OAJ8kuCvbMrJ4Cx8kpXaIRzsi6H
         vSJted2PEQm75x78O3wvm3+ZQsmm39DIJjETPnU/MEDhIJ4oiJcd6/LZeSf4YJ/6PRt+
         7G23TRWBlxxmYuZ6F3u4w3lhcsUYoY6+f3WLJK3E+EwzD7EjfrrD4INxLK6kDoMZmsAu
         7XAtK7sTdQllFlCSneiAkMHtPxm9WxtCifka/LXCgY/LP7chpBMjDBAlWvtxdaZkbyPg
         tmyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795612204; x=1796217004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7zYC14kkeeAydLtOuE3dZ/lyIfuyBLa6WSEsS0ZThvY=;
        b=HCTsscWaQ0D/mLUs3YEjnkg5QclaMq1At5oYtldJ5fjwzF2x16N+otkCNG53wwaNzI
         IhdT4WZlYW4Ufm+0ycBj5wnFbKit+0UQv+rUZchlOVytuxR1kznYro7E24+kzisjehjf
         wijIxlJvOZ9ikUVsVWHw4aDJB9fira0HQy/9Xc3tbubxsLXzt/tX4evuAQWofuogu9ry
         M9Y+GIebPWFyr66FAFQOfLqX0+g33k4ho2pGFpjICNYKayzTsdt7W/w3MyvQLG7u47P5
         64ve9mjHkF5Soiy2Zzl7ZlANa8qU0XEKnPuTx54kEX7wEXPlXxC1pcn9/A1091lkKq7d
         MmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612204; x=1796217004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7zYC14kkeeAydLtOuE3dZ/lyIfuyBLa6WSEsS0ZThvY=;
        b=u+S2TUtDI8V+70FlN3b1B/2BOzT6lb8JdcjsmMvWr8coQh0XzhjmaYXCVQ2drRO0kV
         mJa5m6TB/pcfDXJsBMppTVHgJw3/I7lGGW2FXdS2lFlE/YEMs+RmonAbhZabCELm+bvM
         VmGXDe4MpE3MjdQg/JZF8gHfPxZXB1Dnsb2yResO10xg3vt4dYnLQ74tEW75b6y8FhAr
         B3F68Mk7wGqB+/uBvXXIedjoRp/7yf5gI0imQrzd5NOXHWGB5JbNuBfPuaS0BZ4lxMqU
         T8nEpqMwxi4ceFrrRDnNqISNiiafNv6BY1Q1Wqyg8o0Q2btIruEaXwSKXOO8ssChp/I9
         VwvA==
X-Forwarded-Encrypted: i=1; AL+hErFluAAvx6LVSCOS2rxI/cT3U1f9zPU6vR60fy4tVBixHTwqBx+hz0ClTRMEqnpNAYAsfj9aCqu4YekSBWj2@vger.kernel.org
X-Gm-Message-State: APuU4Z/DyvgoBoEYjQJm4SIr3lJPSn9n0INH3vsT3B8pdzRV+Px5PYLk
	KZmDzJ6pBrd1NPygo/uaLg9F3+WxPc5vT4Ig5QSI4LANe9TuIA26TN5Gg4ZyRPvOIFwAPkVyT3D
	C13ipUe5EuLVJslrIY4NV/DAciCjhgo3BSgz4bZwviwDCLWjKUbVjKvPs9OpSO68NwRyv5GB2bK
	XlaO7cdjruSo37pm5iDrrCHsqBImnd05OSfqL3Kwa9di4=
X-Gm-Gg: AZFdTZcCfz+Aq0coAPRCoTXVGd5qA2kXiIvTY19dpnVKWm31Ez1COfi7CzHN6//gpfH
	Qm0onszJuwMnJYKezd2TP+LDxEpLyDECOYNqcQryTloiehEvLbJKiPrw5adrxkEtKHyXJgposM9
	h0EaeDQiY1fI53csTkBW8hmh+B+njzOmvQ5GPhdqc7lhlkswtbb8fheSfaHw==
X-Received: by 2002:a17:90b:5346:b0:3b3:ab74:74f7 with SMTP id 98e67ed59e1d1-3b41c955bc5mr17028231a91.39.1795612203960;
        Wed, 25 Nov 2026 05:10:03 -0800 (PST)
X-Received: by 2002:a17:90b:5346:b0:3b3:ab74:74f7 with SMTP id
 98e67ed59e1d1-3b41c955bc5mr17028202a91.39.1795612203470; Wed, 25 Nov 2026
 05:10:03 -0800 (PST)
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
 <CAAq9HC4doEs2v=aW0-tR+ARD8a1OGes8xDi2BV=T7m40YFBmww@mail.gmail.com>
In-Reply-To: <CAAq9HC4doEs2v=aW0-tR+ARD8a1OGes8xDi2BV=T7m40YFBmww@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:09:52 +0100
X-Gm-Features: Aa3M54oxcK6RC0Uj2-RqU1IkNrdUwbjccr03Fd36W2QS4bujwoCnie3WcicoJCs
Message-ID: <CAPx+jO9CHiWfHNqApccUb=srYec+Ep-bupo+iQteu9ZPVZ9MYQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: psci: Add skip-suspend-mode-switch
 property
To: Reza Kurniawan <imkyufie@gmail.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Val Packett <val@packett.cool>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX28xbApTKch3u
 LD71/rYNAXXDBlSjgRQfOhWvnWYQ+ww7nZGNVwgOMj8ORfC0Kgtj5Le2Z2tvNZruZB+5S/m+hRk
 zswatIQGjogn4Md2EzFZ15X/WwhdMXw=
X-Proofpoint-GUID: xjY4MNPMqXKxejKUZ94EdPCyY5QK-p2m
X-Proofpoint-ORIG-GUID: xjY4MNPMqXKxejKUZ94EdPCyY5QK-p2m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX1W2xQKyCUF7K
 ykwJQ1H+SHReXUYgLawmVl3ASpd2K61Ki+Fd9QN4n2W2eXf5mE1w/d2dyoZRx7+PATZ7ypWVM+F
 LJgKhAPu4ENU8qmcDALojz7F+PcpJr0pauR6WMAvO/9iV7HnV8tjiwMrzX+l5hJbCr1LGcADIm+
 MqYH/9vgWM4u+KFrWgAXnrqMJ0dNhKQS5J0sOmfwvZCD/2Af7HrkK0/xTVzfUg2ZNPoSfU/pakz
 zejcU4lhVWP+ook5+Yza7yUkhZU+pk1YTU9zWhKmIV+l+tmsIhfo0dXUBDq+/Ucq36w03S6ywQq
 zXvW2d0gu2H2bAG7ZtUcce2V9M6x7OgETHo10sIunqRVWAxEUex1tfiqkvDk+GNP/ldDRlaH+H2
 CRtrzUS+B2Uuw1KH4bZNWVdERuWZ2zfzzI1/PcAIBOgPHFSHoEbtzPlMLJOUnbYA8dzZr+62QMZ
 Y/ctAtW5PGIvb3rGZcg==
X-Authority-Analysis: v=2.4 cv=A/z5rKWG c=1 sm=1 tr=0 ts=6b06de2d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=UY4Qpe7uAAAA:8
 a=gEszbayXw1Bg4_vTXsgA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=Dz9CbhmWzz49oM4s8yQO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250052

On Tue, Nov 17, 2026 at 7:15=E2=80=AFAM Reza Kurniawan <imkyufie@gmail.com>=
 wrote:
>
> On Fri, Nov 13, 2026 at 8:10=E2=80=AFPM Ulf Hansson
> <ulf.hansson@oss.qualcomm.com> wrote:
> >
> > + Sudeep
> >
> > On Thu, Oct 22, 2026 at 11:41=E2=80=AFAM Reza Kurniawan <imkyufie@gmail=
.com> wrote:
> > >
> > > From: Alejandro Tafalla <atafalla@dnyon.com>
> > >
> > > On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI_FEATURES repor=
ts
> > > that OS-initiated mode is supported, but every PSCI_SET_SUSPEND_MODE
> > > call is rejected with NOT_SUPPORTED.
> > >
> > > PSCI provides no call to read back the current suspend mode, so the O=
S
> > > cannot tell which mode the firmware is operating in or why the switch
> > > is rejected.
> > >
> > > Add an optional flag that tells the OS not to issue
> > > PSCI_SET_SUSPEND_MODE on such firmware.
> >
> > I think it would be nice to further clarify what's going on in the
> > PSCI FW. If I understand correctly, the only supported mode is the
> > PSCI OS-initiated mode, hence it's always running in this mode, right?
>
> That is correct.
>
> >
> > This is clearly a violation of the PSCI spec - and I guess updating
> > the FW isn't possible at this late state, or is it?
>
> Just as Val stated, it's not possible sadly.
>
> >
> > >
> > > Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
> > > [Reza Kurniawan: split out the patch, rewrote the property descriptio=
n,
> > >  renamed the property]
> > > Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
> > > Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> > > ---
> > >  Documentation/devicetree/bindings/arm/psci.yaml | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Docume=
ntation/devicetree/bindings/arm/psci.yaml
> > > index 0d04389c81..2eee38d155 100644
> > > --- a/Documentation/devicetree/bindings/arm/psci.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/psci.yaml
> > > @@ -98,6 +98,19 @@ properties:
> > >        [1] Kernel documentation - ARM idle states bindings
> > >          Documentation/devicetree/bindings/cpu/idle-states.yaml
> > >
> > > +  skip-suspend-mode-switch:
> >
> > Maybe a more descriptive name can be found?
> >
> > osi-mode-only or broken-suspend-mode-osi-only?
>
> I initially settled with a similar name before (with 'osi-only'
> phrasing). I ultimately went with 'skip-suspend-mode-switch' because
> the root cause was only due to the mode switch not functioning
> properly. This property doesn't do anything regarding the mode the
> firmware is stuck at as it's only fixing the failed call. Normally,
> the driver sets the PSCI to the preferred mode at driver probe (OSI if
> supported, PC otherwise). This property simply skips that part and
> assumes the FW is already in the preferred mode. It could
> theoretically work for firmware stuck at either OSI or PC mode, as long
> as the platform shows the same symptom, It is mode-agnostic essentially.
> That being said, I'm not completely against the 'osi-only' phrasing.
>
> What do you think of the above rationale? I'm open to suggestions.
>
> I admit that the word "skip" here isn't really helpful since it counts
> as an implementation detail. "broken" should better describe that it's
> a quirk.

I guess "broken" deserves to be part of the property somehow, to
clearly indicate that the FW do not follow the spec.

People have different tastes and I have no strong opinion in the end.
Anyway, I suggest you to respin this to clarify the commit message and
to suggest a better name of the property. Let's see what Sudeep and
the arm folkz think of this as well.

Kind regards
Uffe
