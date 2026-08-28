Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA093EB106
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 08:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787907507; cv=pass; b=gkbrOZlvMqBgrYY4RhVeMh87+9VK7IzkTn8PC+pkOVfPvUTx/Iy+HJXDqis5wecHoH6Bxe2IyO59FyDmkjfSi8qSz8NUDGbceLH5/FfwB9zMeYEO3Xj77pARrHF2V3YpKgD387nWhdpiezHNJjmTdfSBlG5SDXW47d+MwvY0ev8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787907507; c=relaxed/simple;
	bh=1tsOIF7GoqjTfi40uyZxs9Vza8UXlgkEXcU+W5xhQJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o+Dn01fVvB5WJ1VPjfmHloF+hcDG8JjetSMFmBDoq1Ve8BRkC10Pq6VJ50F/aN3Tc9CeWjFEyeCMnoosJHV72csHiG+SFyGWpbtirRvBigDw/cmv2fDQdqVvH1ZzBb0WUe8bwMBUrNIFkIpujBW5kBt/Cno3ZZzKBkolIfwxQ+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pXtXKF5y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YiixQJdM; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pXtXKF5y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YiixQJdM"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S676iR1043780
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 08:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h9qkRpA0u5mykihbpeoCW8HU
	7LRmqZIXoSQrDWLq8YY=; b=pXtXKF5yPk1BKfDBQCYDpjfC5+Ujrkw6ShRTS9M9
	abPLyOFuyzKreu3L1tMX2o+qXkeLAckAhc6+QyMjRnyMLT3fCFP7/1K/T5ty6XjX
	QZ0CjE39GhPmvhFXmCVrHZqpAck8XwVR07KgVfRTY+S+ycIkuIlmXlq1ZpiO5chK
	BxOS4pXOfw/CE/WNov+UHYsngtrgj4qkPsFOTCuin8tSLgUyCZyv9bogsSh+LRaw
	86a68TCzYMqOwLrxfIzd4G69CE5PvOvJg2hFvTa+MIzo/SIg1qhMJ71AuYdafD3f
	DGAy9FSTiHMo6+MJiwbr2bIBtLnDGktmaF/zmNN1vYxzIQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gatnc33nu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 08:58:24 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-85b946f1c13so18049647b3.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 01:58:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787907503; cv=none;
        d=google.com; s=arc-20260327;
        b=Lod0Z/671IvZfVDixIFYMNpMoViFqKxWaYgZC/94BeIA+i4ZqcBDcWqAb4E4kG2YDx
         nZ4IMfYyyRvYqCQb4zZL8lVaDq1FtxwZEk08waUDDAPRkLllMCl2xTk1V740VQXGho60
         azWQpYhKrUM/6LO7z3KOmzfncWiJxHKCKwZ9oGwl0t3FS/f3l/IrTopKX72L+Uruu8uC
         i0jgCt7i0eHaOJ3MdWjUhsOctGStmzz6e+wvesYpdmYg04s3prJQA3c1h1H1cCuES8Zi
         9eZp5jZJPwMBJqzq1Liwqi1FbYtUKgstSfk0Cw2U56h+U0snr3LM6bVa6YpxDSlnhsa9
         EXxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=h9qkRpA0u5mykihbpeoCW8HU7LRmqZIXoSQrDWLq8YY=;
        fh=nQB+oHeoGYWEjFLPc9TAZRReKzLDzs+LV0pJMywuk0w=;
        b=cq5Bn1xaQpfvLew2wz6lOxI1I8jB1q69Ng/BBWHm00PAGqVMJD+EeAZYJuUsx7vE1+
         EoxL/sdSRaJRv4VizXqZNRHRnSMdu5FjwBAJVpcYXAL5MFqy0XOKVRgdte5vNPQWiv2m
         X1nKIT4+T/7CkN6vKsr7yiHEoYOde0Y1Nb2Ty6JVPt8Ig4AH7SsgXXfvbjWTeimdLDeX
         mYeL61Wqk524RYDr4CtGK2gsstOF0lZMF+bJe2kFHU+zuKEuiW3BN/Yn97ZVZ7gGFaNC
         Sa4g8CbqJ1180vU2P+pMlYU7dj2CR2/WoA2CC3l8c8zkym/0V705TOO99zdjftGOzt3X
         Uv7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787907503; x=1788512303; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h9qkRpA0u5mykihbpeoCW8HU7LRmqZIXoSQrDWLq8YY=;
        b=YiixQJdM5fptqa8SZjHzXQn/I5KIYhbs7E7W51MC4UDf8HuHeR6BleBUfibRNLkm3U
         w3bO3mEYlq5YSjD2GEKYFmHyaMGU833QKhGhmS/NVmCSjOH4iqJF9/VZRgj2pf7eZdG9
         KlqmJAV7uqsIL2q0SDRyEqQQm9i3KMSyj0LgCaDaFrp5RlyAWue6NGSbQMPeCDWJjCtY
         xK4CEDYF9BGICuiWpQcXVS0fL15NSJNoNDdRFV/I9pOwyRfHIZVeNJftmmBpo1GxqdJQ
         MHvchYL8PUugfX11cXhnV7NBE+uDpUzIKvkKDUEc6aTQuvW3TpVXHnQsr1Qz0ntHe7+n
         Snig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787907503; x=1788512303;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h9qkRpA0u5mykihbpeoCW8HU7LRmqZIXoSQrDWLq8YY=;
        b=R06Zb0GN6HAjNsQ4aKvxo+IjkJKpVCjlV3voDJWGMiXTOxhwoRkw7XuAGII2ETAf4i
         pUAXWirDqn19Yo6IeX/G5mVArKnZvgpJIW/EZCx//rn2hgDcvvmBzy4IR3PU2G16s2Th
         1zoczTAaXtHVTUUqB3YoJ9pBFot5mQsuVikcSBYB3Pq7QEdenymQGZ9qE9JRzmPuHJ5R
         2hELZWIuVvprSArc8MyHyuFWWAqnVwb2PcMzoGYL7ZHXvaCh2/0Vn/xv5fUR6caItt5s
         4hfVMtV6LK0SqcZQgGlI2zuMqvFfvbrrGNmjeNCYW9XVeYSNT+8PKfHKnjN+xyHamwvC
         c+ZQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro6PuM4rKL3isCQpWOo3K19kjgGQmF6GssmqbcU75SU1KDZUQJkrn4vlqpHP2rin6WhDlWVDVAEe/bAQwQS@vger.kernel.org
X-Gm-Message-State: AFuF++n9KU/toay0RxiLOqdJqCQ5m7WeuKt6I3P1RLHtkiQhTGr/+7Z8
	jo4Zr+dC7ZNJxhnOJJslP25m83HA+uILo3hUDalDQ1NZkB5A3TKgic4cqwFpbdjVs1byQ+tyVKE
	0e5S51BCn2xBsSbxfDLIZf9xvxbkgeiwW1Eh58NQa3P9YDg41Ys+Wsfq7BROKjd2ih8aJRdCzzh
	1Qaur05CZ5yE4Zb6ApSIaHizh04YbqQ79cKPwr67DuBWs=
X-Gm-Gg: AR+sD10Fm7sm0d20tFQpgd+vxmiGhp8di5vq8puk+ins7yk+ZeMdlvq9g4L1cd+RDRJ
	tg7dpl12sMS8JgSE0BZxFLzMKCceSnhchYC+QbJ4OaziYd6lMsGU1lPl/oNhNeV7wLBErqVgJk9
	0nUjeIK+v4lbAEXvJ636uIzY7IdfVRLiNYgRKMS5WohiAoKn7r16Q+H2x5pSQ=
X-Received: by 2002:a53:d0c9:0:b0:667:7dae:8707 with SMTP id 956f58d0204a3-66e4c6007a0mr1146609d50.8.1787907503461;
        Fri, 28 Aug 2026 01:58:23 -0700 (PDT)
X-Received: by 2002:a53:d0c9:0:b0:667:7dae:8707 with SMTP id
 956f58d0204a3-66e4c6007a0mr1146595d50.8.1787907503061; Fri, 28 Aug 2026
 01:58:23 -0700 (PDT)
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
Date: Fri, 28 Aug 2026 14:28:10 +0530
X-Gm-Features: AcwNN1UHIzNqBIGzwT_M18HWoKDt3V5mbkibZsr-oWOmOtjNKEOEnS-AEr9thQ4
Message-ID: <CAC-tS8DbJq_hAcOA3x+mRAihYdPeCDMYJOBng5kqtBN-TaBM=g@mail.gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA3NiBTYWx0ZWRfX0JOUIsm2PwzV
 /XPwhJ6QklxffBxqOct52SmVQDwebZ78ZQEJe9ylzLaf/lxTDmYfUvUlGgfjnwtWbbRz1qEA8mS
 d2LJ5bx6SGxAa/YpFJE8NK4R6T2Gs7ilL3zVAnqAf5sM0fQGNlluzZsHLh6l0TbCIWUc5oQsx2z
 YQPpee8jwgopMN7jPBGFFFqezWo4a3wkyzmbh/22SrUKp+DFOzaUWsXVU2sAJ4nKEbHOJStYvAq
 CJaxHLzU2Ajglg1LGYo5KBo9CnepGrdbHMaVLdtQtao0rwdfcUorAyiMJvApEkmD/LuKPUYdhGc
 IjzqidgxMv0e/Q0eegdBFg2DZVahZrLjCB9zYI1f9+Q3X9yahcB9evY2+6pnG2JVkxFUWs1+/y0
 OBf9s3W7bd64kqD8pylnik/kLFldpicrJTzvDcg42ooJlSwrHuSijlvX6zNyoWeBEA6u+YqQg+w
 tJV1aAET3qhS/SV/Aug==
X-Proofpoint-ORIG-GUID: 4pnmhJiIERu1ZGyv7lP7n-diVh_PEcQ3
X-Authority-Analysis: v=2.4 cv=HfUkiCE8 c=1 sm=1 tr=0 ts=6a914db0 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=P-IC7800AAAA:8 a=VRosaQPrOrfO6Z3GwksA:9
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA3NiBTYWx0ZWRfX9ZaRggsS3QXD
 d7Z1MjWjI4k+YwaEoOG5Ei2KKcOHSoioJHx+nYK3jLh00nz9P/fnuf3mg8wo7lchqrLnlCYSWgd
 /thafvp8VDFw8BtX95s2BH++jkNPx+Y=
X-Proofpoint-GUID: 4pnmhJiIERu1ZGyv7lP7n-diVh_PEcQ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280076

> >>>>> +#define QAIF_CDC_DMA_VA_TX8  254
> >>>>> +#define QAIF_CDC_DMA_VA_TX9  255
> >>>>> +
> >>>> These DAI IDs exceed the LPASS_MAX_PORT limit, which will cause sound
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
Srini, could you please confirm if adding QAIF DAIs to
qcom,q6dsp-lpass-ports.h is acceptable given that it increases
LPASS_MAX_PORT by 56 (from 149 to 205), which indirectly grows
multiple arrays sized by AFE_PORT_MAX and APM_PORT_MAX in other
drivers eg below
https://elixir.bootlin.com/linux/v7.2/source/sound/soc/qcom/qdsp6/q6afe-dai.c#L30
https://elixir.bootlin.com/linux/v7.2/source/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c#L21
-Harendra
