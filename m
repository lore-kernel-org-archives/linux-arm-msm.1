Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795693478;
	b=BlnBL/4pp1VRARniZgUDYELxMSp3zsI82nCcrtRItytW4TIGl/UqhFlmrraN2ZjTfqjl
	 mxHUy5lIGybYN2koboh3R7b4jNfM2BpE0E5xYrTq8bGLF8QYloWNGmVGNw6CtNM8Kc5yc
	 WMe4AZZuIOQkjSM3lclaLnRoQwOtMHVN+ErQ7V3WBFvG1U93OMnxE4AWZs2L2HwHtyr3w
	 CIOCCtf4VP7/uoRVVvGd4Eu/HIj6pCvEVy0bBh9/rkNeRZn2bA0ypMqPJ2L5XMFXXzQZ9
	 FXC2STV13uotBkVTItsAlzafm8/a0LlHGX/VSsDNBCG71UD4qomane5Ki6hHXvz/E5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693478;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dasQhEugGyhjw2vWgB8+KQ3T5J6mdhNR/K9EdifPI5Y=;
	b=WCoI1fuxIz7VVRuBFDnH1ZPOnk18BSzi6PwBl4SxC4n4jHlK96rweeBdMnJ87xha6IuH
	 Q9Y1yN/oCbc6AHbMLLHsckjsj0E6+2Kr5OluivfyJz74z393kaEL1LaVMHg0n880YmgTj
	 q6UkNP5j3t2XPsGj4OxOgBtNtFFOPreIpRzEJfVbEGcN+8p5je176tTKh9kIFlHqQd0yN
	 NZzl1t+CxIebOiCceyTXtPhPNf/vibUuI6gULOC9FwnroJ/f7QyY4PotCmaUeqHfilZXe
	 wGuqeGjcM+WzNSqheGWT+CpT3iJYj3ypFEcPt8V4OPOmVggi9POgMecAhOO+NzkW1ng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CqwfbaA+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N+2oZXb8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1A8606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF1A8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CqwfbaA+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N+2oZXb8
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVQxT3277988
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dasQhEugGyhjw2vWgB8+KQ3T5J6mdhNR/K9EdifPI5Y=; b=CqwfbaA+k+gbYXLJ
	KjRoylV3rZ1exJ5uFizbBBFmPc3iHg9CbdXGhJ+tmiw2PhP3GlRg9wDGx5NbHRVT
	4LgUXCORp+6oj/xiORGchdy62D+3Kx+41iZIxU1MsJIbs1mr4w5OzaUu93LrF0Br
	TSD32oRkHoQceeMLp9TyuwYNGBmcg5LZjGS2yqWr6s6qT8DCLGDTu1usvMetSJUi
	acwNGUMmC2kYTlOM64VGQQi5PTiHBbhtkUMTfwpNlWlkug+np2V7uk3J647Ezn1n
	0/J7aUKU6vU9H4IEJA2Op5LTX3apNELYGvfFomigOxrU+RdnFlOVGJwVAXPL1t9d
	bN/emg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7g8s5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:44:36 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b4d1e90b9eso55453357b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 03:44:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795693476; cv=none;
        d=google.com; s=arc-20260327;
        b=RQFLgMZYcB2rr/YVoCcTzHWfMwkgDCrPx7jPY95xwNfFc1RTwdza72Ey0Eht/N0m0G
         vC6S3o2HFNWO9pjN5OlFXAn89cgAKqp7UkmJP9vmacdBA4/jFo1lsZYbcInIX4g84eD6
         JF94Kcebri3jNoFwHE1MMJAwj5b1DagXq9MOj2o2MlxQfgCBjawdUcXMkAI1dGYUqH3l
         gKAnc6VypZN6jiBKp3xcGG9GaFRYUB6G1NWH6xuUA2p/AL2/c2z2Ph+rzQDrjV2BrhDY
         /aIu+BefCkXaE4zm4NfWfTV3Ksh4AKA2mfUEfXtUIDhIwbse0y1KUEgWfYb/h0Y/HDmS
         2M5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dasQhEugGyhjw2vWgB8+KQ3T5J6mdhNR/K9EdifPI5Y=;
        fh=i0S1J+FmqFVRwZUAZjzL1WgNkmVOOeSZQxycw0nGMPk=;
        b=T6oAJsOWu1W/01vfBFn2fFhK1Ml7qSWCpUK0kftmK7uTz4vm+5SeXbpmQdS+KrBq3I
         kBNWWPk5pKNl/rdPGWZK94ZOEWP1QlTK7VRDHfoXTnvO191P2VNYp+Bn9AfZrxqvyLWN
         jToeyBKPcaknFiH6VIoSgg65YvFfOKN/OmFfWDQ/UFH7NFbfCO1IKYq5b7WWVN2LqYCb
         QlQp7Zil1U6CMeeaGk3nmdgSOQMvHqPqDK8w8dGXSGnZ+qufsX81GoqB9d2SI7VT0IGr
         N40gQqwzcfUZkYmmz2v1n7vfEXgbm113F5KXIXSWQRmFtp4ZniHX3mfZu6/5fiGhGppr
         sOwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795693476; x=1796298276; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dasQhEugGyhjw2vWgB8+KQ3T5J6mdhNR/K9EdifPI5Y=;
        b=N+2oZXb8j15uMH3VmvohZTgQT+tkIUlKOnrkFcO4qMq0HrgXAi0vTabIoUd+qpZnZw
         qnNfva6/73k0NKHUlmX3JhXEmpl9+sI8QqxQ1EquqCLe+Mo2BRLK2TcgxpJeNiFzpANj
         xrV38pYLHTB5jkF3PVs0KNlqp2ZEosKhAcNHx/9ehSAALac6Ker31b48YZEmDrpN/B3h
         c3LeH30wcMqgYec6WBJ/HwLyvShUIZiCNtTK33Z2blpzjC15vNXkHqHB95YnWl/u0DJ7
         zG8wl7WzGMFbgGWkjTiRZDkx/SCdbRIlIWI1KFlMv/5K7LZ39wTACzAt19vDOVnuPAc2
         3l5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693476; x=1796298276;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dasQhEugGyhjw2vWgB8+KQ3T5J6mdhNR/K9EdifPI5Y=;
        b=qsTsu8g8l+u6NnELWskbB/ROVSJTjOXmEsXyHd63aWR2pWumjDdsy1DXCXAd5Zob3x
         wq267Vk/DAAYpO7yLx0Ej7XAMfP1LOw+0T10Ewo40GUKbBaCBbrlTpyMU9zDRXniFM7k
         KbhjFPPvMGFewShfOZlBcdZt2XQVnb6yit8BZWRLcc4eC/dXuDkFACUB95OxvIdVETDN
         26IJhgp5DZ6HdJa85plLZpdOz/1qDmq5+hbl2dRyKGLwJv8Gl7C9lDF7JB6CGxY5szGQ
         zRWuv2176DOkOKCtROuMcmXXleiTKAkPXiMbRjMrny720IauGNJ8QBdAmD7Gm6e3DImb
         WyKw==
X-Forwarded-Encrypted: i=1; AL+hErEjcIjjSAiIg6ubSRw3pVG3PGXbubCPIzReOqnS1XQ8CMc+c44Vkx+EERKlh+j8rLTHBTTYLl3pc/X/4Dcs@vger.kernel.org
X-Gm-Message-State: APuU4Z9lQvIlv93xtjZut3po2j2U3sM61LBMTwvntgTnu8Z1lVFAMAWf
	QxoaW5pEE9fJPoplq6LDkKd+I3y+e+rrbwkfZ3tCqQxilkVKyP1/wD/orY9QXnEuuaK52fccDXf
	qRd1yqAk3+dJGDJQiAlwQL/HX3xxF6+iLoOGXeWl+ZPRN/x5lTa8p9qV1NGYumDrEw9axyO+Hp/
	46mIw1qVnNBBPDq3+BppiAdf3gP6eez/W5dNUR0eJFDec=
X-Gm-Gg: AZFdTZeTrAXWxBHDx3K69Ms5J6R/1rMQ8OHUqXA5jPFKOa2jyHgyDDPZjathpIDW0e9
	8+1fuNLGBYdpUWeWII6lC0yXm13yURblPel8wiCspvZedUqx+lfb2gT6egcPpjq0AdJU8o4eY/Z
	D4axpwAhvtEt8Aycw7xiqQkslSYIe3ZhKXKc7YRsYwpZfJOSzDWsjEaEE=
X-Received: by 2002:a05:690e:191a:b0:67d:b753:f6ff with SMTP id 956f58d0204a3-67df43ce21emr10002173d50.32.1795693476065;
        Thu, 26 Nov 2026 03:44:36 -0800 (PST)
X-Received: by 2002:a05:690e:191a:b0:67d:b753:f6ff with SMTP id
 956f58d0204a3-67df43ce21emr10002155d50.32.1795693475552; Thu, 26 Nov 2026
 03:44:35 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126-agatti-el2-v1-0-4e25fd64f198@oss.qualcomm.com> <5b3112f5-6b6e-4796-bb71-3ad92238bd33@oss.qualcomm.com>
In-Reply-To: <5b3112f5-6b6e-4796-bb71-3ad92238bd33@oss.qualcomm.com>
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 12:44:22 +0100
X-Gm-Features: Aa3M54pVVV5qmWM6b8CLMteH3KaRnJ0qbHg9-XNKHhrV2XXx2MVKh7bg0-fOIrg
Message-ID: <CAPzfCAajqBWB7OHYoxr=+2xRUzyWnGiiDAc--st0UGkutYrdOw@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: dts: qcom: agatti: EL2 overlay and QUP
 firmware for the Arduino UNO Q
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: fdifnViXS6mSd2xzJW0FUmCkUvW74_4L
X-Proofpoint-GUID: fdifnViXS6mSd2xzJW0FUmCkUvW74_4L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfX6StuD9Snof7o
 Sz8Qm6S4rnbPctWTsfrqfoWIwbMGi4TfPtg83hSRHi6juktk0vUxDO2BJto22ihZGBb+X+7qP3E
 SytW6usf4QAj8RyGyjnggFZLSfWsD3o2JQNLhQlVJi7WWeYONy87g0Rtu/BzyRiBlzZvJvozw6R
 YVOBprCP98RKckwsHGa+Y84UVX/8/iQ4YIrdK+M6s+xPsNjXt6NvwAiNPe0MJAOcJWi0Dl9EPN0
 8qec9+f6zyzPa0GtaeJm/mWCoVtkV1NOokicoBrE8oTbrXAOuLdzt4Tvhtnzm0osqwOU/QG38HS
 rUlhpfEppMSkAdC8mcpyY8XxGgAKpF3QLDB1PKizuxXK/1WjvGC8ipC1HsW9waBNmVkm8URxfYl
 aZEgUrgN/Ed2Ys03v+IgBuKUxYsPQ27G/MaBDgMvuf6aKeFyRwaYb4lMWNNFJOP8/s5oZYBDCFf
 Ta1t51jkhZgXrQQZteA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfXympTsaXn3xdL
 0rd29li6aPT1buBKWllUHujVqkMB6AELSHYvnnUtdtHkmxN0OVreohLNzngSIWb5gU47Ss57xyR
 FbpD+TATVhCuqxPgd/bGrxOKMY2QYnI=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b081ba4 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ycHgb9qKDJxlMUMqlp8A:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260045

On Thu, Nov 26, 2026 at 12:42=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/26/26 12:36 PM, Igor Opaniuk wrote:
> > The Arduino UNO Q (QRB2210) can boot an open firmware chain: TF-A and
> > OP-TEE in place of QTEE, no hypervisor, so Linux runs at EL2. These
> > three patches are the DT side that this chain needs and that does not
> > belong in the base board file.
> >
> > - Patch 1 names the GENI QUP firmware, so geni-se loads it when the
> >   boot firmware has not. Where the engines are already programmed, as
> >   with QTEE, the drivers do not read the property.
> > - Patch 2 adds agatti-el2.dtso, following the existing -el2 overlays:
> >   zap shader off, SMMU stream for the ADSP remoteproc.
> > - Patch 3 adds the WLAN firmware's SMMU stream to the overlay, as
> >   kodiak-el2.dtso has it.
> >
> > Loading the QUP firmware on this SoC also needs the geni-se fix in [1].
> >
> > Tested on the Arduino UNO Q with TF-A + OP-TEE, Linux at EL2: I2C, SPI
> > and the Bluetooth UART probe, the GPU renders without a zap shader, the
> > ADSP starts over PAS with no SMMU faults, and WiFi associates.
> >
> > Patch 1 was also booted on the stock QTEE + Gunyah chain, with and
> > without the property: the same serial engines probe and the same I2C
> > devices answer in both cases.
> >
> > dtbs_check (qrb2210-arduino-imola, qrb2210-arduino-imola-el2,
> > qrb2210-rb1) is clean.
> >
> > [1] https://lore.kernel.org/r/20261114-geni-minicore-v1-1-a825dd549664@=
oss.qualcomm.com
> >
> > ---
> > Igor Opaniuk (3):
> >       arm64: dts: qcom: qrb2210-arduino-imola: name the QUP firmware
> >       arm64: dts: qcom: agatti: add an EL2 overlay
> >       arm64: dts: qcom: agatti-el2: map the WLAN firmware's SMMU stream
>
> Don't fix the previous patch, squash 2 and 3 together
Will do in v2, thanks!

>
> Konrad
