Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7326E3BBA03
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738787; cv=pass; b=n3wVjZ4+OrpExNVGmYJlzSvXrgc1fq64TVnP1M/m6OkOQU+TliRpdTHY2osVBtLUjVU/Xkzgah0BWbty2Nii7eHw3aMErHQXDluEuRVaZHxlaR6T2FuGHAMM7kK1vlZh9hWZkpjyq6OCV5Ko9AtPmtaRqK31eeAILxtvrawN2yY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738787; c=relaxed/simple;
	bh=nfELzI6wU4evonO0YYA+RMq5+zcUXrzVSFYbXEchPEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OgUjfE23KGq+3gVJiP5uwIpZcl+jKr5IFHgGKkV94X78dUF/t57Ap5CnL0BfbBu/OoVO5+AonFpSLVds6s4syYZVcsjHkAg8muMc9hDMrcJr7SR4fMupg4/OZIyi3uKh5608wvGMQCxAKZmu73qNS8WCdjgslLH8Zd6Z4uPw2/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XOs7roEY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M5TDXplT; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XOs7roEY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M5TDXplT"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q9CffQ4157812
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RbBqoVCT+i35n1aDZvg1l2JvcEYCQIUQpQ62IsExkuY=; b=XOs7roEYF98cF8UA
	EBClHsfAsyb/XmzpzgmQr6MO+65KofxyZJhEjs5s8456kU5/m59bMv7mEUMxJep0
	FK5K8Oycx5yRJz89PpUVs45wx8xVyOvAVdoayJuNPBtCmjPfXryldHfnElMYye3P
	eDZQEkWw2HWKjioth0UlIQa2BNe/JC6ltJ1FQtL8IqcThiHJ0DNqsOzT1nYmydfx
	u2kRxdrp50ypyk/oDIdbD5fnNqwfeh1p7zYQ3NL3zL8OQh8kNMHVe8GHrzTm5hJ/
	YYIlKP/5MKdCNnCFyxRj8YfwI7yLtghOTUL1VJr82RqLJA8Rm4dg5VlVUXI7Ewx8
	IWTkkw==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9s9g99ca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:06:25 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-858b746a9a8so8437247b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 03:06:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787738785; cv=none;
        d=google.com; s=arc-20260327;
        b=ghdpATkS/fTkpcl9V7vAH3l+vons4GFxxBx44YI/8WYutYOsPWM0ou94/VtCBPmC10
         ED/9gsbXFE7oylgLhi0YlNHRRHa0oBLqtRXzuPo6bhOvc5RnxMyA2xlVpcFCDPU2aVkp
         THeLUJsDu5qaIey8gROtIZ/587qVmOX2dUD57adVAgs5ykRZuZScP8lpDuT8RgmOs/yo
         gHBGfwb01nrq45fbIo+rzditpnLHPyZdPkt4ywM4KjqB3sNPfPXZV+o13SmIGEvxRw8H
         Gza9hvtxQnreDdjsUU+NmabQNOi+KtvVhsJB0HQYUWBtN2Au6qVTvN+ErKXEp7Xpvp9c
         Q09Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RbBqoVCT+i35n1aDZvg1l2JvcEYCQIUQpQ62IsExkuY=;
        fh=mr47FrHz3bvkEoPRMylRUuHLBBS1K3IEzKrgekvkWis=;
        b=iYAU1oBe/NE7s4nctrqN+urNni1XcA3UAShTTUNNQBlBEB5fOmRvgneDHqYtGFHMdi
         zb/hOlWvRoYPldgFEgSCYbTcxnubQE91Hm4lZtm6tFHhMQlLdWoRqmuis5W4ZLiMXXqA
         ChgvhURqD1r+0OjpZtRTfnijd6JlAY9MO3OzXyitLS+RVHImFxaoivjCHrh2ek2EkP+x
         1rjBQd6rJJHNaBWCz6DN2GU5iUDAH6Pd5L9KksOeIs3Q/2I0tqSePlVDnzNK28lsGkqf
         OaA87papyE7nDiDj/6r1jCLs/0591msuSSIiCO/p5EcOdsmZMAbjZgDolEEkF1+wP04c
         P2HQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787738785; x=1788343585; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RbBqoVCT+i35n1aDZvg1l2JvcEYCQIUQpQ62IsExkuY=;
        b=M5TDXplTfc0AzPGx4qs5QTdljXhcMDl5tno/3I8eBKj8o0MrglrMN5kMwMP7nTSf2M
         tnFN4euDEZy7P0Dd5EP6IgAZ4G306qJuEqHcJqdA1P35Dvrl0BzRLsJcBt5XpNIq9+un
         s3YuDQpNHtvtc19DMNEgi1vTVwHfh5QNBKM1ftkXRyWqVjaYMY4zFb4CeJ0wbVa38Q85
         ywEXLXaWFuCbuqMHE/1uutEj27GkBaH7KHxM2DBbF16sP+aJ6N2x5FV2WTPAQZXjv6vB
         RQO4/ketPiObqTSLoD/OYD8TmYgqd9ONTB0Z4rE3+jWGVfSW0GkXMKOshbvA3S25ofU4
         8FcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787738785; x=1788343585;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RbBqoVCT+i35n1aDZvg1l2JvcEYCQIUQpQ62IsExkuY=;
        b=EVME5plIu6ydXXP9fcGDjxZ0VFNl5dAW07WSqQJJIXvsBonGEoA4BTxJkbNcQsTHrC
         mV8UdOfZY1EL9Ia4eKZhMP7i1y913AInzO7bu1z1tcQsYa++8nCInNN+Yvbb6zSGaU6R
         nitKmCoQwY5aUjWfuar1Qdh6/5lJW86OtwOvkZD7CKYr4jVpx226OtfafNBSdQzUtB0N
         NdjHcSMghNrm87O5wgiJWeXFZSPfqQN3WvD3LUW3E7VCkoHgN4huUkwW2XlldI9XX/y4
         nbTM8ErbK1qb1W5tfYlU8oEQNl4reQHIzSvPn9+2yYVyCtGJF9ISqoKvsECHGgL35dc5
         WjOg==
X-Forwarded-Encrypted: i=1; AHgh+RoReIfIkopw6cs+fGevYJT/XWKsS43I1KRksrtLkiL4mVSAS5jqu3ms5sSATwT/ZS0kCrWN7z0kXoyjdlMm@vger.kernel.org
X-Gm-Message-State: AFuF++n63kD3LOKHO38IRoHDPQG4pO01NMGIFEfl7o79Ds0Oc3uvo0Dr
	8jLCDTjA1B9SjtwrUVwU3B4mSigkNlZc3ddXMpQR+Tb0Xh3o/wF5NWmskqN9wjhgaQ0RxKUJGno
	mb3BnfGVihAYw1F5MJl3QF6PWIH4ut9fuH5r3ZVWUwq/ug1N8PXXd9yrTkqprCIRlgNVEdPpI/p
	tNa3F8XBTikIWgXGO1+aFLQ+A3/8RIGaw2VOpByMnqfFw=
X-Gm-Gg: AR+sD116Ox1AHHwG5sshUrlIecnfSHmrUBKd4q8n7FMsdV6KIwOtui/M9frEqpT2fWu
	Ktaj2s5lOs6YR/zpS9cHstbCkzBztoRCm20iEehNbeFTVRJ+CNO7QdVvHKcyiixNcGTtqLpBneR
	UAMrhqwOUAAIBiGwJEsktPYgn8JjbmAztJOrJylbAjQJQBH3jt3VllJjOV8g==
X-Received: by 2002:a53:d642:0:b0:66d:26f2:6e42 with SMTP id 956f58d0204a3-66d26f27338mr1101775d50.30.1787738779913;
        Wed, 26 Aug 2026 03:06:19 -0700 (PDT)
X-Received: by 2002:a53:d642:0:b0:66d:26f2:6e42 with SMTP id
 956f58d0204a3-66d26f27338mr1101703d50.30.1787738777434; Wed, 26 Aug 2026
 03:06:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <bf6e42b4-ff21-4b6c-a7d5-024e5b9a7da4@oss.qualcomm.com> <CAC-tS8CaVN8YgkUHJVvLcU1xWB3V5dOgS07CHVOBUnPtMjNxTg@mail.gmail.com>
 <08b6fd88-84b3-4b3f-a8c5-dd6bfd39403f@oss.qualcomm.com> <CAC-tS8CtA+wRuucDskRXSc=AHgNdbuq+khj85pFmCG8dGS3Njw@mail.gmail.com>
 <137d4a06-4542-488d-91e2-d338ffb9d47d@kernel.org>
In-Reply-To: <137d4a06-4542-488d-91e2-d338ffb9d47d@kernel.org>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:36:06 +0530
X-Gm-Features: AcwNN1UcHyQxyDgxCtp2jNw1Hyii6iQM8K7os2ERH6A2exggOEYymSFD-EPOOdw
Message-ID: <CAC-tS8ACnv2rb0k5u1bLR=EeVtZFXiByke1TFhM_n-WBqJ+dFA@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: xUdUO-xIu4OGbKgcxHRDFrQl9PAVu1uF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4MiBTYWx0ZWRfXxApriPvfGDSB
 1Ts8g1C63apaICYneyTrHeVnYMwdU+e3mOfL9C7cdFF8wvdqLGJA1qSCURb5Y7CHe9+h43e0fDQ
 e/4SnjleKe/1+X8YA2UVUqY84Nlsl2+3jPyZj1bBV0/ZbtOMVrHX1QEMAxtzBWMFU8XL5cA+/g8
 dTBIk6tc0Uxi7LDHG5sog+bjjtQe5/Vtd1ENQNlG+ZuynwG7sBaWxUppWHJAM1D0xqf3MQr3Mo7
 xtxN5DayPqlC3FMk41Tk39CNgrISQwwc+gWxObp5pJ8KuZKM8DDqmwsC4dL7gvEAOIIG8LqpRgh
 EJ8DOkrIwe6r4iRm5WRwMa0CvA2ftoGxvIA8PUOrSf4hJrq3TsZHW46gqwXxqW6+WbX+J0jmQeV
 iPSm/XVon2o2zU1zgfp/2ry+XbFtswG0pcK7PRbJo0N1MKRxtUlnX0Mw0Ajffcf1pHRvp2bB0nP
 AkoQNoeZVSD9pSK6cCw==
X-Authority-Analysis: v=2.4 cv=Xfq5Co55 c=1 sm=1 tr=0 ts=6a8ebaa1 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=f6IBhYKpExAqpe2A64UA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4MiBTYWx0ZWRfX1xsaE6tsd6gp
 OrCbE4qdRZNmbTVVQKR+cQkRM3gBjypNcfqYwNhwSJVrGDmgzeXgv/ovQmMIb1X2OUctc7pTVuV
 yZANFnJFAQerHLUf5ldMBr3/cINnlDY=
X-Proofpoint-ORIG-GUID: xUdUO-xIu4OGbKgcxHRDFrQl9PAVu1uF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260082

On Wed, Aug 26, 2026 at 3:31=E2=80=AFPM Srinivas Kandagatla <srini@kernel.o=
rg> wrote:
>
>
>
> On 8/26/26 10:55 AM, Harendra Gautam wrote:
> > On Wed, Aug 26, 2026 at 3:13=E2=80=AFPM Srinivas Kandagatla
> > <srinivas.kandagatla@oss.qualcomm.com> wrote:
> >>
> >>
> >>
> >> On 8/26/26 10:39 AM, Harendra Gautam wrote:
> >>>>> + * CIF (Codec Interface) VA TX DAI IDs -- capture from voice activ=
ity codec.
> >>>>> + * WRDMA channels collect audio from the VA codec and write it to =
memory.
> >>>>> + */
> >>>>> +#define QAIF_CDC_DMA_VA_TX0  246
> >>>>> +#define QAIF_CDC_DMA_VA_TX1  247
> >>>>> +#define QAIF_CDC_DMA_VA_TX2  248
> >>>>> +#define QAIF_CDC_DMA_VA_TX3  249
> >>>>> +#define QAIF_CDC_DMA_VA_TX4  250
> >>>>> +#define QAIF_CDC_DMA_VA_TX5  251
> >>>>> +#define QAIF_CDC_DMA_VA_TX6  252
> >>>>> +#define QAIF_CDC_DMA_VA_TX7  253
> >>>>> +#define QAIF_CDC_DMA_VA_TX8  254
> >>>>> +#define QAIF_CDC_DMA_VA_TX9  255
> >>>>> +
> >>>> These DAI IDs exceed the LPASS_MAX_PORT limit, which will cause soun=
d
> >>>> card registration to fail.
> >>>>
> >>>> Check sound/soc/qcom/common.c, as the current indices (246-255) are
> >>>> beyond the supported LPASS port range.
> >>>>
> >>>> Best Regards,
> >>>> Rafi.
> >>> Thanks for pointing this out. We can either add the range check for
> >>> min/max QAIF DAI IDs in qcom/common.c or introduce a common helper in
> >>> qcom/common.h to validate the supported DAI IDs across Qualcomm
> >>> platforms.
> >>
> >> You should add these ids to
> >> include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h instead to avoid
> >> conflicts with common code.
> >>
> >> --srini
> > Thanks for the suggestion. qcom,q6dsp-lpass-ports.h is specific to Q6
> > DSP/AFE virtual port IDs. Since QAIF is a direct MMIO driver with no
> > Q6 DSP involvement, would adding QAIF IDs there not be misleading?
>
> These are IDs that will be reused across both dsp and non-dsp solution.
> So it makes more sense to keep it in one single place to allow the
> hardware description (DT) unchanged across different software solutions.
>
>
> > would it be better to update the range check in common.c/common.h to
> > accommodate both LPASS and QAIF DAI ID ranges instead?
> No, that does not make sense because these numbering might conflicting
> with other ports in future.
>
> --srini
Thanks for the clarification. Will add QAIF DAI IDs in qcom,q6dsp-lpass-por=
ts.h.
-Harendra
>
>
> THat
> > -Harendra
> >>> -Harendra
> >>
>
