Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3CE466B6E
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 13:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785850993; cv=pass; b=B1lKJjV/0VySxMO1BzcXdDQmzv4t7E5AtFaORE7ppx5a1jXcVGNs/azRGZJpTi85sVk7pYkK0Du4qdcgp4unsLLmGtDulM1zQbRpFksPjrFFh5FAY9Q8QUjDAv7PVev6+nMJFctEZ9o/NEbIlOPmVMJs2QKyc6hWmlvOUPlb5Hs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785850993; c=relaxed/simple;
	bh=Av355PoOiQqfN+lI28kxuagN2wHx9snA+0ylF3eg6GI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HaF84cL+wIhlS8x4l0LuEwBKwxePkvqghxcs34ovFd0c9JdBKFVvUVP/PkMENOiegQYZVDXq6OPq+K8GkfQ5q0wJuBV0gwPzmIQMP8+vTjge2xsZ1109IrHoiHv2NeC+Ih+wGAS15LXFCZHWulHOMFJWz6zXihXUjJEvcfTbr50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gWSqX4An; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bDr/Xi/9; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gWSqX4An";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bDr/Xi/9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674CWl5c818412
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 13:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QWQr/x5bEL6Unr8s/2mTIOitfI4p3mr1jrf6Pl+pGJk=; b=gWSqX4AnlEtpxj6Q
	Kolx19zNihtI79jb/u5x93/3RIRF/ynzmhH52E2pAWDlIG40klO9F3WYrDnNecrA
	Mvfb6nxJuTNXh4JIR0ajkI+lba7CtsfsM09qOuD/mdptyX0Fkf+w5a8+m+IWObVr
	aoTJeUXIt42+xRXjKmsCzTEjliHe6lqAV/6HQxo0H/0HTZTXYesd8+gx2QHlfItC
	Uew28HCg6lftgQb+cr7Mj5MnfKzClGCf0NxQGhPFOyFFZNWAElTdp0VHyA92Nsf9
	Dys7phUWfnLavtU7rZNonD8m8pk88xbX8sSZjkD/5YryOFt+sg1FIwW31MLvK0VZ
	D6JX7g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fud1dh3kn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 13:43:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ef8249f871so47326836d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 06:43:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785850990; cv=none;
        d=google.com; s=arc-20260327;
        b=H4X+d2qKpuVtytQwWP+laskeY0eJ7O8DPfehGQmRy0lNMxUEJkDdt610McZiU3wIVB
         8lMNMV3uOZE9ZgePNKw6E51SkNw+lcVSlFL063CSxbZXe8sUtm2fUnc91dtixA1j28Gs
         GtN5RDs/BXt7l26PbQCm9N/aAkk57I3lZSJrhplL4AFlZKIjknyJmlZCJo/1diqybQdG
         RJOPaqt4jJlywfTXKGcrAJIhQX0BTi0+EeHQw//tXOlcHUrouWNEZK2VxUiYDhCblfNm
         /wKiHxcizjICw7Y8PTCe1/0MpDYtoIcILC5TnDjZ/qpQRcobjvmH/XSTp4/1+71agyLa
         zDAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QWQr/x5bEL6Unr8s/2mTIOitfI4p3mr1jrf6Pl+pGJk=;
        fh=CbMIZmEvRRcSYvhYsvp/afT6p8CybCkxqIqcqRSH+NQ=;
        b=Lt23ZejIUJhnZPE4/APH8jY1i6aBy/TVuekwGCB7FlKDkKemAfXLNgSyevJMefPPaU
         8Qsl1JoUmNrSlPNnB8/OX4Q1wLwqKeC0DUGLccDPoR9huqLAt0GUrGDRcC6bMpZ0PFk0
         EN8UU7u5eRIIH9MaAXN7r7GetbktY9/KN99rlE1iDfMPmsBXB0uGsi4UkGcHIGG95uLp
         MfYX/BNfJ4bijdb1DZ0fADEazoVLRVvf3ZNingquGgrn6yX68ZZGGipEn3/ZNPu0r0tE
         n4H8t+/wIQfIct+2BXAPQWTjf6ZCNVl+TDf9js0zo1hh1vXNDlmGIOX5ZygTm8sFfCc+
         wKiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785850990; x=1786455790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QWQr/x5bEL6Unr8s/2mTIOitfI4p3mr1jrf6Pl+pGJk=;
        b=bDr/Xi/9dMLJ6nTEd7f8WqFIfnwotYVttFcpEictxgth06ojP2UQkfg8eH8K9oOCdl
         uleDltT64u8jV8ggoZKORHG310PRp5M1KL66qCcheB6KaCE1q2Qch9RhMk0C1wJIH6ZP
         OPv7lHKDetulTCOAlSsQtdlG0uT7ynxod5m+7YIbNqVKnEAMAVnrqHMwXA4fHXKzBaXt
         TRtcPCgO/Cl/Ai25FIhbu0+9Km4+8deGollP9kAcJuBNpMcfqUBoLF7SHPqfAivPRlXj
         rS7jvv9AyVHAmsuHfW75PX+7RQTOzYmkDKxokokI6PV1kkHy7d8unIfo1x/dL2TVyujX
         GRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785850990; x=1786455790;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QWQr/x5bEL6Unr8s/2mTIOitfI4p3mr1jrf6Pl+pGJk=;
        b=cN+RqQGqmgVXspzeS2tpCy5V2Q5znjNBdcmSBsCwcDfAMuX0ZmTdwlfMzxbB/QDabq
         joSYhtq6N64KoM/Fe1eutntpIFuQ0HeISIdMWflJDw2CKKT1Uq3vD2Ox3kRqBlcbQILf
         AP+O9GC04jATyexQmLjwcxjIDKQcCLoKs6XPW0BlgnetRtzoQrKpH8gfV3MVTRsjftRn
         LndTFw5qCjsUxXFy88hCqjw/ZbseFqOZzpYBXtRTcm1vLeceRWBNyHqyfK+k01zPiN44
         iR9ea6xqBqqWw0QXiCyiyIQiJ/KGJSkYLdVndBaiSAzP09xrYjpu8Mb+Dve2gWfPIPI9
         wnlg==
X-Forwarded-Encrypted: i=1; AHgh+RopQMA+Um7LIsr7PpSKPinq1Eq9TNm4HE2PBy6GOk2dghipi9MtqThEYevcw8ufusKaUvNSwjaCEEdjZN84@vger.kernel.org
X-Gm-Message-State: AOJu0YwNIyaWzAQVr5rYUHROzGCoLPex5N4Sh/rUZQ+5WYqtsflZk0h6
	Z4iq7FLxPuzVfUIAz5wGG1KjjFVhH6f1bB2t8kaOaOPmlSWiZuQGewidmwWEQwTmEdBi06MSsy1
	k3zGlk7T/ej24Um8DL/M7bLwF/1hCQ86Ta7vNls+aKJD3yHhTF0aPb8dxg3RvC93IC0x31yAXXQ
	CW9QkSYB7iv7uSbzHAk/GF7PTQSCKkXvzJdYtsizGcxzA=
X-Gm-Gg: AR+sD116yvptiFiXUG/ctR8ykg/TgX3UVTzssp0P/Pi+Xf9HpjlWRxZGv7EZSO8/fsL
	YIHSgT8ggQ378aPvUGgo5UuWiMPwnq9Otwu3aLHXc53QbzNxWL328EQvE+qVJ4uDXGPbd7gCfuZ
	cA4XCeVZR8ycs5BGsvOnnlZ3L9LHnUiIJ/QMFISmDTWJfEFWgzghfK0zV7Tw==
X-Received: by 2002:a05:6214:20e5:b0:8f3:ba0f:e7b9 with SMTP id 6a1803df08f44-90849603117mr235603326d6.18.1785850990521;
        Tue, 04 Aug 2026 06:43:10 -0700 (PDT)
X-Received: by 2002:a05:6214:20e5:b0:8f3:ba0f:e7b9 with SMTP id
 6a1803df08f44-90849603117mr235602546d6.18.1785850990119; Tue, 04 Aug 2026
 06:43:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com> <20260730-block-as-nvmem-v9-1-f72935817dbf@oss.qualcomm.com>
In-Reply-To: <20260730-block-as-nvmem-v9-1-f72935817dbf@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 15:42:57 +0200
X-Gm-Features: AUfX_mzk0wJt2Gak_njsh0rcAEI1svN-3axItB8B6ASWCCxtH7hxRBo8wnhVM-8
Message-ID: <CAPx+jO8rMUaw7MAYpfp4cLASZ75mfFD4n3NOi2wdHNVvnb4rbw@mail.gmail.com>
Subject: Re: [PATCH v9 01/10] dt-bindings: mmc: Document fixed-layout NVMEM
 provider support
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        daniel@makrotopia.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: jGAy_o5A_yaJI8c5-VVNqt9jej0EmsYs
X-Authority-Analysis: v=2.4 cv=SJRykuvH c=1 sm=1 tr=0 ts=6a71ec6f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=F73tXhIjRpzWiH7OJSEA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: jGAy_o5A_yaJI8c5-VVNqt9jej0EmsYs
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDExMCBTYWx0ZWRfXyERl8nXyNVe9
 ae5IkfIcgWUJTH/rseNvVrPRXDdeau7Aoa65c54TDK92w4fbXd3BG5p7XQeiD+ISdfL0tBMwYrs
 2JoHZcds/cdFd84nHa3lLkorBN4RNyA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDExMCBTYWx0ZWRfX5ZGBjTcyYMsD
 vG+xqZgZf1KuhYRPSBbFUhUfiXc+Fp+PIKv3X6LM7c/MnjqsnkwdMMje02XJKIqgM89IlmVtKh8
 agqmKqJnzt1VOt9qCIZTVgQsZT2upSBbi06o55ww4paqYJ4MWD9rTncCXehKtb3/XooHjNs1p/0
 kemRmmQo+3vyi7B4kJysoC29z5Bi7rTVEx4C4C15l/sY2lpYFfK/ATQw9fFMb24XL77nifQMfig
 64W1CG4omkGu1u2XSdR3sC8/E9rWPkwD42J3ljuv6UMH/+halg/jUXdgP9yH1PvZn5qHzGW8b9J
 y78uTi/rxpGX7lyxipbDsRHzdd5svqQ4LVomsp3q6+GwBE0bjcijr51MTE+IMmZPiUQDgHVrRSY
 pesraxk9xLhtZwqzKCVeqhZjKqzZxzfL55MKDdPOxcm74tsGbLMLvVuMmN3q/LXgl657D0Xqdpx
 cq2U66wV28QE/+DgP3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040110

On Thu, Jul 30, 2026 at 6:00=E2=80=AFPM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> Allow an eMMC hardware partition node to describe an NVMEM layout so the
> partition can be exposed as an NVMEM provider. This lets a partition
> (e.g. an eMMC boot partition) store device-specific information such as a
> WiFi MAC address or a Bluetooth BD address and reference it through NVMEM
> cells.
>
> Accept "fixed-layout" as the partition node compatible, in addition to
> "fixed-partitions", so the layout can be described directly on the
> partition node.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

I don't think there is any reason to push this any further, the
updated mmc binding is ready to go. So, applied for next, thanks!

Kind regards
Uffe


> ---
>  .../devicetree/bindings/mmc/mmc-card.yaml          | 23 ++++++++++++++++=
+++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-card.yaml b/Docume=
ntation/devicetree/bindings/mmc/mmc-card.yaml
> index a61d6c96df759102f9c1fbfd548b026a77921cae..0422894508478c8d0ca68292b=
58a5fdbee218358 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-card.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
> @@ -38,7 +38,9 @@ patternProperties:
>      properties:
>        compatible:
>          contains:
> -          const: fixed-partitions
> +          enum:
> +            - fixed-partitions
> +            - fixed-layout
>
>  required:
>    - compatible
> @@ -86,6 +88,25 @@ examples:
>                      read-only;
>                  };
>              };
> +
> +            partitions-boot2 {
> +                compatible =3D "fixed-layout";
> +
> +                #address-cells =3D <1>;
> +                #size-cells =3D <1>;
> +
> +                mac-addr@4400 {
> +                    compatible =3D "mac-base";
> +                    reg =3D <0x4400 0x6>;
> +                    #nvmem-cell-cells =3D <1>;
> +                };
> +
> +                bd-addr@5400 {
> +                    compatible =3D "mac-base";
> +                    reg =3D <0x5400 0x6>;
> +                    #nvmem-cell-cells =3D <1>;
> +                };
> +            };
>          };
>      };
>
>
> --
> 2.34.1
>
