Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8CF3E3D98
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787552749; cv=pass; b=XC/fdi+DI90woq/IFX/OqgRbnbhrbdD4AONv9FSgObXmuheT4XHC8QAxZhXj+KOyaDuHiCExowH0YaRT7LoWqfJHTDLoZ92KynYZgYNUsfSweNfd9EoADALCIWJGfQXUdO3jZKUHNaaiMZAjUQaIbHVN4uNfi0LcpD+q+ir0KM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787552749; c=relaxed/simple;
	bh=K6n5beyT7b2xC5a82nuhKtQd2qh5DqtuyS9OHA9w1qM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q+vZtI3/DtFM+zt75Wq+qULe5hGsJ9kKy/Xvdztxws+5mFn/HtfPUHZ2LOyWQM+j8NtlpaCZXjM06fyxkTAuDyjYMI+FkCAF1I/LZPEXO3NmbWEENQ4SiAGEToaMmHPylzQkx6aOIj8A/k5fzQgqF8WaUx+UM3IqauQOxyxZNLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aarzTtmw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YA6iQxkh; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aarzTtmw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YA6iQxkh"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RE9L2602044
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mCajhJHR3Pp/IpuVOzEzedPicvstmSGI2JFzY0KKFNM=; b=aarzTtmwCjyN2sbw
	X+Zi/X9PRU/YFpjXp3Z/g+6eiN6An3pgY7L48zEKpxjngrHImrHK5tXpywQUNFoQ
	XnOOEtPqUVv1Tyl0++WDFh6Jz/v0h0CuagulM5lsvwJRmJVoAVB9IBqtioKswfVV
	HrYN/PtNJt5x0YdO9kxIHTVDI49L3IiEyw1jN2tom8jZhW18GRXiss5OLcbXCloC
	+fF5Uq4MN5ZHdY4TPsFgi/Dzguz6Xw7Y/J+RJ/gC2PREOuGzOfFQXASOcOF+puPh
	qtbBnqX1Rs2zcY8xMsAS/ODoUvJs2chnkDkiWENSqzZq/Ta1KpGfmp88T/2JKNgn
	6WzSNQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g744wwf64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:25:41 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-836ec8c3338so52612357b3.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 23:25:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787552741; cv=none;
        d=google.com; s=arc-20260327;
        b=kOXArWFkeBTSH2kXNR7SW4w9QfTCixcrd6OcNu9cwonelO1mazZKFl7rpqVYRekL2j
         aFzNpbB3MxBG+sMUWA5L1GwpMJEuBDsHdJdlhPeuM7CRAx8xHXDy3pa7k0twgkiDVGGw
         +5PbgkmKRTN5zGIogk83cAwxCmTSkLwLNoGUItF8iWW/VmgNt6X4+7Vb77em6qKQrAjI
         4I5QBscGqp/8rBqpA2apKUg1kpHS2WseZRxUShrAp7FsoZ6j2ksx+eUJRNC8Uo6Se02Q
         HAb03gKNjhwo3vEYe7RaJjaMa4aNmf2eNO5jseG1+mjd6RLhlL274ocAJn4Gu2x55FPH
         UmaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mCajhJHR3Pp/IpuVOzEzedPicvstmSGI2JFzY0KKFNM=;
        fh=qEVs1jXVdyniqNIvbnlAwbJLaTH9ioLQA0+0P5Swy8c=;
        b=A2lXFcJfH44AjoWC91ZXF/dzCoFlfXh7WKB7Zmw4E2m+30GQx51l7nAkk6NhABPp9D
         upy0KiUE5Xq9+7GXd8NutrhSOyohPVlHXSBne46ePO0i1Pv662PVb8RC904/3f2NFT4M
         jI66R5WP8azN/W7gUKY9Y6Gy3YoYa1e5Htaxqr/u0laJNoIeQd3cQmUY/BZMxI8N6/A9
         OsePFEdg09DxR3UNNsXUst+FEv/1EMl+Nno2bne0zAIxOSipVbFUHjogUKnDLg04Gjct
         aoMTRA7BVrigtR1DtT/JbQ5cMYVFjhMbyczwFe97XgugEef7H+8SDaQXi3dbE3T7/TKm
         6fiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787552741; x=1788157541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mCajhJHR3Pp/IpuVOzEzedPicvstmSGI2JFzY0KKFNM=;
        b=YA6iQxkhtNvmZaNj3f4vczlRP1KqwPdmmp5ApJBUAkfCnn9twF51BDFhVBMDee+1Ez
         YtcUEyFFQxV+Nfz57WM44B3QQzH1sjTcplPir8az25Yr8FNfuqbPIdWVtQubW2Ouswrb
         6HQ9nAQEQoQKRuvzyuf66jdROdT36IBYrtXInITk1seo0m5bXwjdnAwqDBLiNso+U/qK
         gw062cdgosalO3axeWCB3fQb7kQ04r2rCbJuXyctyujOpMEkEwoi51Fbrtnf9HNsyI5d
         KzUDHeHowbKfRmhXnO0HgOHR3sFvfQORXgWNxok+AH5q7xpjo+y0Jm634UHbghe2cT2t
         ybvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787552741; x=1788157541;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mCajhJHR3Pp/IpuVOzEzedPicvstmSGI2JFzY0KKFNM=;
        b=V5cD/W8rWSnZ+cLmv2LoqPGoivlA6/a3PrFDf85StIxQIBYjq3BXVWzN88j2Hz/DYg
         ECebm54GJ8djeRe9kPv86qeqhXGTOG7ag4/LNWnsM2jDMKznbiR4Gb5//L4pjlg1dzcn
         NGfZMzYWHfdt1DQqqqgOZ0ptNpAOQ3DDDMLP/HLzRXhRzUGtYOfgj05leUNy9oApl3K2
         dOj3WD4lYu/9b9SXXXA5y03Y3+wtMnpxvYO1ty8WhgrS9O/F21LA4dsDfslFgau4jHMa
         VRYrS7hAwbNmO7k/WqP2ZqFnflYBAIurt7EycgAzmuH5LhxLM40sLqRJ8reMDhmClleT
         VUwg==
X-Forwarded-Encrypted: i=1; AHgh+RpfGkgX+fYVKSWFLQ6zWZejube6Ep2IQ3at87IaaB/TVzd8QZgndc7bb0MsvOq98Uj3NVcar6YtR8vSpo/S@vger.kernel.org
X-Gm-Message-State: AFuF++lz3vLZ5hbIO+lUQHa0Zv2k8TFAhxxVKmfzPPqwVMOPBYoGtiUE
	p7/4E3B2oepkBEHrsUZ5fgQ7wDXEGWlX0/8PwW2B51dCt710Nfg/oZiIHHuzziR6y2O0W7txws6
	2gE2IJFkT5Ic+/QpUy8/Lf2BA5ySbkp89eqsAmIyAozZRc0ZGTNQmT4j27oZvH/Sn4SxPiozoRz
	0GIk+Id58vjgjXxN6kj/HkhY9AnSLwcHFKlBnBa13ONVQ=
X-Gm-Gg: AR+sD12MrxUGTaqA53OPpSLz+C7rjXq9XSOvKFEGCgbRru1p7qUK3KHJYNztjQGoFC8
	Op9cJffin1NiPjCSkDzGmOw+w9jf9meQrqhojdi1fI1T4ETIA6aX3966cc6OqSHMvgG7d2zPwzV
	Vf5Ei+k2FvQvlPH+3KIHA4fyJDOT2VWltbdomi+v6uyAs2gJUHYMdlaljVZlA=
X-Received: by 2002:a05:690c:c94:b0:81f:a595:2e19 with SMTP id 00721157ae682-84c98c15838mr61606447b3.23.1787552740917;
        Sun, 23 Aug 2026 23:25:40 -0700 (PDT)
X-Received: by 2002:a05:690c:c94:b0:81f:a595:2e19 with SMTP id
 00721157ae682-84c98c15838mr61606227b3.23.1787552740496; Sun, 23 Aug 2026
 23:25:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
 <20260701105757.2779738-7-harendra.gautam@oss.qualcomm.com> <20260702-augmented-raccoon-from-asgard-1878d9@quoll>
In-Reply-To: <20260702-augmented-raccoon-from-asgard-1878d9@quoll>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:55:29 +0530
X-Gm-Features: AcwNN1XHf1j87QKD7cF1jGyxFPL-NX8DXn1dD1RwuLYfH38PNhcv9vuhBxW9jVs
Message-ID: <CAC-tS8D3KReZ8tJ3LZdnrUbEE36KVACDHaZ+=cDddKLgSLUgtg@mail.gmail.com>
Subject: Re: [PATCH v2 06/11] ASoC: qcom: Add generic of_xlate_dai_name helper
 and use it in lpass-cpu and qaif-cpu
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 4-7hQ1Z70jx2pAICPtOlZ2Xo1rpj91dY
X-Proofpoint-GUID: 4-7hQ1Z70jx2pAICPtOlZ2Xo1rpj91dY
X-Authority-Analysis: v=2.4 cv=KuF9H2WN c=1 sm=1 tr=0 ts=6a8be3e5 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=Z5INuiQzEjELwub_QUcA:9
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NCBTYWx0ZWRfX8Yr11nhC6KFP
 r+Kgq5JUC1tBekhTtfC3WEgwS1qpXqyGAgBrYLilk6yVBaJQZfMQSIGDzz18gOSqMmJ/gIoDeHG
 szmD1qwsGHxzX0d9L0Na8eF1n92scssBT/ujY02pGuvASSdtaO2GK2cBEjUp5bJzYY0mY937hEM
 JzJ5CvX4gP0Py2wpQUmcdIf9XUlplZA2suUANSmPCmhw4jJOV7j08Rle9/Atb05LOZlgCFVoNCQ
 T6/31v7Cwnl7sKUkF63qEIaDTXAHPbtyo72bmsJ3/ZicxXevMS5EElmRA26eAn1/FEehyrtud0f
 mqsdbKc4T5qgDkB3lGJGHOQMxF8XwXS2eSe1Kf51wNAohKKv0nqjoPpM8cZ6F43xzllS7OGERYf
 sgm+FMNU714XR/1K1St6ZF5N2moG2W4vwj95aFC7WkpfqntIkU6Gd6k6z/BcEj+0vNTKBOoFK7x
 xCytDIJ3VTBntPigkBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NCBTYWx0ZWRfXx3EmNJ9H4UZa
 8rDzHyBpdmpY7Bc9pLJv2UjnrWLV1rNjmVRmgRGylMYynmx/25GyuZgmoiiaPFVCDxec2Z6Xe3m
 qLygbNjRPoz7Tn3AEz8LMHdsiZ0Kh/U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240054

On Thu, Jul 2, 2026 at 12:42=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Jul 01, 2026 at 04:27:52PM +0530, Harendra Gautam wrote:
> > Multiple Qualcomm ASoC CPU DAI drivers need to resolve a sound-dai
> > phandle argument to a DAI name by searching the component's DAI driver
> > array by ID. Each driver currently implements this identically.
>
> Heh? Identically? So why even doing this?
>
>  +
> > +static int qaif_cpu_of_xlate_dai_name(struct snd_soc_component *compon=
ent,
> > +                                   const struct of_phandle_args *args,
> > +                                   const char **dai_name)
> > +{
> > +     struct qaif_drv_data *drvdata =3D snd_soc_component_get_drvdata(c=
omponent);
> > +     const struct qaif_variant *v =3D drvdata->variant;
> > +
> > +     return asoc_qcom_of_xlate_dai_name(v->dai_driver,
> > +                                        v->num_dai, args, dai_name);
> > +}
> > +
> > +static const struct snd_soc_component_driver qaif_cpu_comp_driver =3D =
{
> > +     .name =3D "qaif-cpu",
> > +     .of_xlate_dai_name =3D qaif_cpu_of_xlate_dai_name,
>
> I miss something - qaif_cpu_of_xlate_dai_name() wrapper and
> lpass_cpu_of_xlate_dai_name() are identical. Why can't you use
> asoc_qcom_of_xlate_dai_name() here directly (or
> lpass_cpu_of_xlate_dai_name() without all this renaming)?
>
>
>
> Best regards,
> Krzysztof
>
Will address this in next patchset.
-Harendra
