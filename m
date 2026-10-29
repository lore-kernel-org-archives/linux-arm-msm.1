Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793288647;
	b=N9c4wj4FaxsDdh+t413tobbO3IsKORNbGUD+SLAARwuAu+jP77wEkD1J5YTwelfrCDaZ
	 xnEqNGSOGH5GZ8JfwrN5ao4aisNcWJhkMiYtrdUd03RmEsFAZ8tgMdWsPJv2hv74YLn8s
	 996oAc5a342wpps1zSqqCczuqEeGoxzSrf1jCF55prrGR3Am/Ic0HKuPvpLCo/lapvD2U
	 aY6HqEmUktHdKDsRvmiDecTZ9VxtAqJsj9GyPQ76fs/C6tsIhDgOzZzfCq6r0YtnZ/L0I
	 HKUPd2Wt+yG/ww34YvI9Z36jyVyenrKuvH7nalK7b2JMX5nNGwedJKZPmd4ymTdGGyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793288647;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=t+2r/9PfTubZjd4lLMkfZfAHyJrC3B//dU+UHnZewOk=;
	b=argBDDgGGPA8IydaHNKJ+C9fj0VOJsIPuGKwv5jRrNfpd0ORP9SKCu3RT4g/c1lNkWfq
	 vbB/TFFyI4Z8kvzyipXRhDVhPQbQ1vdiuKatYo90hvEzEHe2OutBl3qJ1xqGp1s8qagkW
	 Ya9fUxznUk8BI3bbzNAbKckJj9QYIlW1056PaEqeHMp/1VXk95475OiCZvLkYo2R1xPjj
	 bNAz148ciRBtCfvy8SnuNqK8J8hABVnYymr1DFCwRLXzhWMGCQm/GtLrYFVwSLSLN7006
	 GgNoIdhoLC4tnyFCVvtB6gJWWdSMdhEVvZF7vD7Uip4GErTPp+EROzpCzmvm70yq/1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L0sJSXE9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CKbGRPoD;
	arc=fail smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D61606A31A
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 15:44:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11D61606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L0sJSXE9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CKbGRPoD
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCdojg1176841
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 15:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t+2r/9PfTubZjd4lLMkfZfAHyJrC3B//dU+UHnZewOk=; b=L0sJSXE934S1b5Q7
	4WWQgqoR2Vqai6mvLXVRqTP2hf7Y5fgh0epPFI7WRP4hb0OR/tXwD9NZi7lxXxpa
	MAyKrq9Lk8ja5g8meTTEzPcJh2iOXvrfxn7QzTJ1Zrv5R8XXxLCMtSbRLMqFmeA+
	TvE1nr0KRq4kS7HXH4q/U9p0/e0a3hiFODZv/uejPlF/2E6ifrAQ6XGGjXrWeBVN
	c9QUvJwW/9vIuw+iw/tmzHz4k805gZwvxkGk2tJ35aIp5uN+jtFbq4A+rtRuUg0x
	I1ABIkmTGB4kGoy9tgmZMSSRFYsbawz/lvWbVJCH/krpJn5FZl/mR9beosYnuDpp
	iMoCXg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm4a218y9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 15:44:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1e62510cso546370085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:44:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793288644; cv=none;
        d=google.com; s=arc-20260327;
        b=UqhlUKPvsCsNnr6CPmFwOkDfI+1lachKV+SDgSPQ48SZTiXvvRTX6xdxMdPlkqJMck
         hgMJZOXIwTaBP2vs1oJH4M8Oz9x3USVMbExdgQwV8lwy3PBO4Z18mUslPcBiblb5VfoI
         7oKHSW/98Ff5VxdSOYEoab2aQvhurRlaWbyo3M5fM1EhqEiRZzvamSeUNUg6MXNgKwIc
         FRy1GNE/l156+yxq0YRa3uWvzdZDV34z8VhJ2TK57Gijnay3t7bA1XI6StnX+chQOMo+
         ULyBGjHoKnU8OwkQhgp0OgYkruDsHZyUOMCozEnYtBYqTjmnDfijhwJCOfLivw3d8m08
         ABgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t+2r/9PfTubZjd4lLMkfZfAHyJrC3B//dU+UHnZewOk=;
        fh=kQj1pA995KYH+DgfZJ2qIo8b+R7jeEOdIm8QWUidzzE=;
        b=RGRTqnXXP03xWtQXyB/lmaDikznQmBF0wjPlxbhwIrTPSX37Sd5nnsFacaUHrD+ytX
         /+7xp+ngUZmgJBWzzDfmERtKeMx734oO32irWuGRJNxM2pKNpvBdsJJ+/dNRiS5YZEQT
         ZAM6v/vVPiWHsLSCTLOeCK4QjNKMIsJxIdUH58BCjyuAgun+ciAeTZHgjfxWAA+r6oZW
         0VHT7w013bdSZPZ/as5LXBa56AohN5tKtmQsjBk3GAUUpO9OZK+eGtPAmkh1nb8qxHGk
         6zczvLUf4Yoksz6PlZQE1pYvIv/MH9MtXWGa3rf74RC6xdbp1rDtGG4ldqNBKQ5v4FK1
         W2+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793288644; x=1793893444; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t+2r/9PfTubZjd4lLMkfZfAHyJrC3B//dU+UHnZewOk=;
        b=CKbGRPoDHFs5KdTOKD9KY8k00fesNObZr8GlbxFSr2HWiKtJQwki38kesekBCNUPGR
         g6gCqTaKln0464b8Th3LyxRCd6iRT2an+EJrWedvRpL954aIXj3oYEIBAGodPHOr6i1H
         1XMkd4uYu+h56dxZKw1SWIAt9Yj/UizJ76NuZDw9MNjqKnyxHhjNNNsJ4ZBNViRiRwVD
         beoWsD93cOzApWsZgpljYJhBVwauR/EB9Ayrvmx9s2cdl+fEW9pmsDQYezB3mPuxiEBN
         z8d3yoaigtzyehR+j7a1DNwa8F9Pj6KHFMwwXI1M3a4I7sL20n4/DhAQWNwWB08eJgqb
         CyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793288644; x=1793893444;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t+2r/9PfTubZjd4lLMkfZfAHyJrC3B//dU+UHnZewOk=;
        b=wsnYr732u6hZin8nuP7JpdCvlJdPPcPXK13Ixmngz01r+dPobloTpMtb44J4QCanz4
         3j5Il4Q5lrIya+yPnHFvzBi4SL6z47K/JmkjNzLe8gLHbpLb/OeEE2FHz/+U1epWE4cu
         vjsNZmnxZFsWamfimr2wwmDueLQMItSSobgtQ6eZgrk+0+RgkYOxTiFSNwCuKq2ZJjFF
         zeGfEnCvmehAVWI6GYdgI3f4FcUeRXbZA4lrWhYXmwi25+OIgEJSGyGEMryVP7Ewx8YO
         uyhy3QHK8CykhOI9r7aQ5Kl9vvSrsQz9ce0q/Aijbi+r9QtK5P25wPUO5nNvfUNvT49P
         Jolg==
X-Forwarded-Encrypted: i=1; AKwUvByXZ6fzo8c3hLy6e6UXfyPMLKBYTeraCh+eJ7vr/9mq0wpSMOwEiBOgXIEGT7DPrwl45tj0t5FcdmQSH9UW@vger.kernel.org
X-Gm-Message-State: AFq9FYJn9z1iZWuXiy89R3J3AcBVkIby0Ns4H9BBl3su68OtawcyC2By
	6H+pLxW+4dasseX6Y/d5oFN04u+bkXDJvRLYoCEE0QSBEg3+6bw5AkSPbxSMJ++D/mt/uMKPUHU
	bswga9b49X3/akKLYynD+qJo/R40oECZHMnXA0ZipnXrLyb854X0addsyrIGtoLcybNaIeR+Awc
	XEKFfhqGMpjvBpPWRjF0t7TW6mSW/oq7NXadqKH8YqtvA=
X-Gm-Gg: AYBFou1nl68yE5//ZKYWks2bpxidJhYGBfNXi7zK8Qh4Vt0geD/WzIdbN0DUDTnFKas
	FzkzCn5OQTut9zKUDO9bvBNKyECccucQEbkmbD8ucGi0PEIsWSJLdn015SSPTXieCOK+54EEHaf
	9B2jpRczqTt5ANpEB5o1Z5zJsRmKHDmTZkSzjkJf+JG3Nb/mG5P8WlTL7LaPFrTerTzsfWh0aNo
	MAATXl8Qg96NLIrDpby0RBmQ50l28HLLSbajZvSRHuOu2tskNp7qWfCyH0r5prcLEpFxPS5K0K2
X-Received: by 2002:a05:620a:17a9:b0:93e:94f2:ada9 with SMTP id af79cd13be357-94408cf77dbmr902384185a.58.1793288643955;
        Thu, 29 Oct 2026 08:44:03 -0700 (PDT)
X-Received: by 2002:a05:620a:17a9:b0:93e:94f2:ada9 with SMTP id
 af79cd13be357-94408cf77dbmr902378885a.58.1793288643316; Thu, 29 Oct 2026
 08:44:03 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org> <20261029-v4l2-frame-sync-v1-5-d37992559c58@kernel.org>
In-Reply-To: <20261029-v4l2-frame-sync-v1-5-d37992559c58@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 16:43:50 +0100
X-Gm-Features: AclHuK9NubgRSXuctoCBUtKUfM90zobYJmwFx0BidUU7P_UDH-kzWoIpGwxYW38
Message-ID: <CAFEp6-2ykusk85REekU3mmFw=4g3yjB=doOi=i=1LS5JEe4T3g@mail.gmail.com>
Subject: Re: [PATCH 05/14] media: qcom: camss: csid-gen3: Enable RDI SOF driving
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2MSBTYWx0ZWRfX0L8oFV4t2Q+k
 Z1oFqHVwNqGxz4F9hRkQUvUZcavqFk3IUHITidRuQuOP0NBLorEP6D7e0zJVSlVAFajMZgoXSAK
 dUR5QZmJmWFYpZfpnkjd+cHMYqJRJCLdM3xmillYpfZQYtc24j5HLeG6FphGBNO5D12P8bqVKQk
 TvT7klpDl5vCxtA0iO+klUrVaOh20JsfgaMu/Gzt/UA2JWsRj0oKGxpnIXUhphzLDR5tUrfB+u0
 v+5xTGTlbNrFafRHjMIMswJI0G1dBvRTil2wdefrpDwWqTvKtCLx+WlGOiw2PGYNr76CzqwBQOa
 DedwrbJxWeFlwYPpcW8Ghtb5ThnvQ85dBARYPxXpcv9UlqVM2ZFf1rjVrcnDs/I7TNmWaFaBAUk
 QXiUDa9YdHiGFlMz41U4NqisYuB7I6zO/a8a5itBCJI0M4A4WPNYeXGr+qRj5rL8UqkX7CUEj3J
 glvA8eWdEC57d7fZK8Q==
X-Authority-Analysis: v=2.4 cv=E8tYNqdl c=1 sm=1 tr=0 ts=6ae369c5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8 a=1sShYwCD-S9XEYFb0O0A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2MSBTYWx0ZWRfX1Gqv1YD/lFrF
 TYwsqNisABeJnky++Bpj4qwd8gWjSLu81B+iKY9ZuWpDXXtuJb79hsv0OsDlsr1Yu1kIo9BJJsa
 disZFaj+OutYgAsbz89A91RCOcazE48=
X-Proofpoint-ORIG-GUID: 8wgur_tm-s5Q2BKEyxsqQShFbb_uNqJ8
X-Proofpoint-GUID: 8wgur_tm-s5Q2BKEyxsqQShFbb_uNqJ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290061

On Thu, Oct 29, 2026 at 10:55=E2=80=AFAM <bryan.odonoghue@linaro.org> wrote=
:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> Add in silicon enabling code to generate SOF and trigger the routine whic=
h
> produces V4L2_EVENT_FRAME_SYNC based on SOF per standard v4l2 behaviour.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../media/platform/qcom/camss/camss-csid-gen3.c    | 27 ++++++++++++++++=
++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/driver=
s/media/platform/qcom/camss/camss-csid-gen3.c
> index 0fdbf75fb27db..6a538d825f78b 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -34,6 +34,7 @@
>  #define                CSID_RUP_AUP_RDI(rdi)           ((BIT(4) | BIT(20=
)) << (rdi))
>
>  #define CSID_TOP_IRQ_STATUS            0x7C
> +#define                TOP_IRQ_RDI(rdi)                BIT(8 + (rdi))
>  #define                 TOP_IRQ_STATUS_RESET_DONE      BIT(0)
>
>  #define CSID_TOP_IRQ_MASK              0x80
> @@ -58,6 +59,9 @@
>  #define CSID_CSI2_RDIN_IRQ_STATUS(rdi) (0xEC + 0x10 * (rdi))
>  #define                RUP_DONE_IRQ_STATUS             BIT(23)
>
> +#define CSID_CSI2_RDIN_IRQ_MASK(rdi)   (0xF0 + 0x10 * (rdi))
> +#define                INFO_INPUT_SOF_IRQ              BIT(12)
> +
>  #define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)  (0xF4 + 0x10 * (rdi))
>  #define CSID_CSI2_RDIN_IRQ_SET(rdi)    (0xF8 + 0x10 * (rdi))
>
> @@ -219,6 +223,25 @@ static void __csid_configure_rdi_stream(struct csid_=
device *csid, u8 enable, u8
>         writel(val, csid->base + CSID_RDI_CFG0(port));
>  }
>
> +static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable=
, u8 rdi)
> +{
> +       u32 val =3D 0;
> +
> +       if (enable)
> +               val =3D INFO_INPUT_SOF_IRQ;
> +
> +       writel(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
> +
> +       val =3D readl(csid->base + CSID_TOP_IRQ_MASK);
> +
> +       if (enable)
> +               val |=3D TOP_IRQ_RDI(rdi);
> +       else
> +               val &=3D ~TOP_IRQ_RDI(rdi);
> +
> +       writel(val, csid->base + CSID_TOP_IRQ_MASK);
> +}
> +
>  static void csid_configure_stream(struct csid_device *csid, u8 enable)
>  {
>         u8 i;
> @@ -230,6 +253,7 @@ static void csid_configure_stream(struct csid_device =
*csid, u8 enable)
>                 if (csid->phy.en_vc & BIT(i)) {
>                         __csid_configure_rdi_stream(csid, enable, i, 0);
>                         __csid_configure_rx(csid, &csid->phy, 0);
> +                       __csid_configure_rdi_irq(csid, enable, i);

Is this something that should also be tied to frame_sync_en?

Also, just thinking out loud, are there cases where we'd want to
toggle this dynamically at runtime based on any V4L2 configuration or
pipeline path? For example, should it be enabled for the pixel path
but disabled for RDI?

I'm asking because one of the appreciated strengths of CAMSS is its
relatively low-latency and lightweight capture path. As we add more
features, it may be worth preserving that characteristic where
possible. Not saying this particular feature has a meaningful latency
or compute cost, but more as a general design consideration.

Regards,
Loic

>                         __csid_ctrl_rdi(csid, enable, i);
>                 }
>  }
> @@ -279,6 +303,9 @@ static irqreturn_t csid_isr(int irq, void *dev)
>                         val =3D readl(csid->base + CSID_CSI2_RDIN_IRQ_STA=
TUS(i));
>                         writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR=
(i));
>
> +                       if (val & INFO_INPUT_SOF_IRQ)
> +                               csid_sof_event(csid, i);
> +
>                         if (val & RUP_DONE_IRQ_STATUS)
>                                 /* clear the reg update bit */
>                                 csid_subdev_reg_update(csid, i, true);
>
> --
> 2.56.0
>
