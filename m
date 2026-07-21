Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD1037702E
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784632998; cv=pass; b=Xdn+agCJQtHuugury09G/vtCFjFkl2Wby7rhdliv682wy3jrUu7PiI1kCL4h0q2I3SCDLEvAU5dNVM/xUc49DZ9Je6xdjNV0rUzT9urxi25S3xQlL7gNvEb3Ltl6u5YmzRxGWO9tPX0/79FLuPYcgZmp5zvuA3hgjgoSTlDrKbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784632998; c=relaxed/simple;
	bh=6VAx8MsHSsRET9XGAU5UE8st8JXI01ci1xclZOqmkpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PZhzfo3kIVi8QzCiQmts4E//4huLaFGDST2xjhs6IHmJtIQjVWayXaThjoa3jD0fkAqoKR7WEpcmbyZp8upuT4/HelzN15hmBgVd8WHaHs6DPEKb11kGuZaTfHK/vYT9D8DQ23GSrVKyuB5Mu8mwnKg1KKQ7HWU1sBzIogvdbm0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YuMVsVRb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W1IBx0r4; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YuMVsVRb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W1IBx0r4"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LART5J1455598
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1p6ZhkeIpwRwxNxnvxv1dr5EF7tYs7sjw5Pv6BQNvWU=; b=YuMVsVRbqqYIYTEy
	K43JAyPcUpP2ZBhjvrxmqVL5YHJXPWcWT3PPAlQR7aU5WDpGtzPCSuIsXmQrPFOb
	2zV238aBlMC4e6+GA32SMD9roGsFSNS+5DcekUa+Yl9wk3lfjpw8XwLXcODuphBx
	Ta9wD1xmBJXQYXVTZdSpVFXqlZya+WmSiu+OL5NyrzLFTG75kh3DN8yi/ncfP44D
	/MU8Rq0R7cQMesfzSCgqfii3Byiv9B0poEEjNO+IIkUqALJn2K1O1S6hNkGkUd+e
	4gzBHaLAPlbh/w1abtH8i7q00W+EWkrrIVY6cgJB3VD7KB0SRc0EG7yZQ+K8KRvg
	820hlQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1duhxq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:23:15 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-737bcdb48d2so2758578137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 04:23:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784632995; cv=none;
        d=google.com; s=arc-20260327;
        b=k7HR6S0CIRwpGLb7VyqclnTlDy6wET1UvDZeOCezz5XzVqTOjqj4hIE3bUkMcafZF7
         eGvhskhXcNDx8LyWUcx3IhoGdTeQncyhPKPggYcshg8CTGhNo34tC5YIJ1kmX87hxaK6
         GWoZ3wg4Y5hlhp+vETaMm5p+mqVTOt1+RZGrpbnxYDu/+28FwPqu/gu4VxMxgzfOCdIX
         4ozLLgX2jfcg0K5crvv9NHxmfsEj64jiKKH8GXiN0nj8Am1dI2bIrAPAhjLaK+Jqs7TX
         JbM5lL11/VgNIqzk8yOht0MQ5u8VjK0JRasx1xebGqQxSPUNUzALIn781Lam1meTwcuD
         acig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1p6ZhkeIpwRwxNxnvxv1dr5EF7tYs7sjw5Pv6BQNvWU=;
        fh=c91iQAu1tG1vxL3oGaDReT9MiBXC1AwgxtUfx++UhIA=;
        b=Zr1dHAxWXCN5ci4b6Ar2/Sf8FVTf2UBMKYL70y6AwCpDwj+UOZqvNaVQmR0NXCVvNs
         C5sCfdR6roJtnh8g3T1DGLUluxdccpkzYrKzXFfLxquqx8qkOl7bkmd1INhIiZ6JeM/b
         UmSrFA81BV8QfNDpiHVAMmXQOMg+hk3xfV4rJsoRfqbryRU+6o5YPtYzzmC1doVJ6vWD
         +33n0lZgghch0XguGrUs0TOn0eMQMfeb2mQ7sB+vBbfDzmltrzVZh8jSGgp4HjjvolM3
         YMQXsyizzKCDoKaWTuG+it/vi0ehlswKTu6hbD3IFjE1f7rrTAHtHtleoXQkxArB7xUo
         NJdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784632995; x=1785237795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1p6ZhkeIpwRwxNxnvxv1dr5EF7tYs7sjw5Pv6BQNvWU=;
        b=W1IBx0r4PMMUidhjaLR58s8+GL9YwdFRXMm7I1OJXgMhqyd8bqEiuHgq8AH8KjsTjm
         fKpkaPsJJzF9dDJfJ/P9HmNvvRpZTqQCOAyx7nAph87uSZXQxuku8zeeiVMHG+pCIoZ4
         ckjb3pGVJC7sZfxJ6jngs44dV9gaOBk0xE+DnZhzPMzYY57zaH8hpF79hCr68MuLhiQa
         82D3WXC3bTBvM+Y0uE/diECaPJ9bAlheLQxrSmfOBRV4BgIklfc/y7cP9Aj6OoFvr92t
         hQsOv8DtDlAsiINkzD2pmkKmJEa8jrKm7zmDTy/c+uwljcsqW8PKeMUCJ4a3JU1RqDjS
         9BLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784632995; x=1785237795;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1p6ZhkeIpwRwxNxnvxv1dr5EF7tYs7sjw5Pv6BQNvWU=;
        b=IHPujf5fYGRfB+fHAgp6W1frxp6DWjDZ+cORhbUIxLnrRSKTRIPnZ21uNbLFnuu7bR
         69OROJYgbLzbzgSx1PyIWlaBeTMOJ2SrpVE0Hfl7Yjx170kOwhorBPw9M+ULrpe1Df6U
         G4YtuH72JKsPFuscCSo3CoI/uMvKeUDc1g0cbdLo+zn4xgL8IBNuSZ9hegtUxWVDfodu
         QA2ylVy0Z5GdGGin9XvcVHrujpaQsNzhUFno/PqEx4NG1q5TuXd9TLpvrmIxrFQOgWV2
         skwudTQC5ygtspjhbCEDNqAmRGuppTF1y752AYTROnEHu9wHQBuDgvkfcakazx1UPDfd
         Zhaw==
X-Forwarded-Encrypted: i=1; AHgh+RozPmz0Sc7IFmZuwiHCT8A1ZIXS5Gkjd/ex09XFA18787uCU3AEpD4M+aaRoOV2YARkb6FLLtyuSARWda+q@vger.kernel.org
X-Gm-Message-State: AOJu0YxfgSVst8NBMmGkcSouDypfvtic0YnOPnOD5TSbHbvRhvEy5L0K
	bgG2mZVAyIwlNcjwDFF+slUxXWTE/D6IYYKR+UN5s3lkcdZq18N1nM/2ex1dEV4HXRvHQIqMkUI
	VaVl9gI3Jbhig39516FTe367FL5brl4oEsBfjjHd7D8wPxTPSYCZL6CaQFmKxoo1dC7DgvFAAtj
	a9MxU/gXiVQKKkBCALX+GZaNZXQX1iIyfL0vnPdgQXUq0=
X-Gm-Gg: AR+sD12ORmWh+eMruHE0y4cSaFupwTKZaRevIGyIN9xSk1ryrG8atS9L+f3mOBepbsG
	xQBug2drxMiXKSYyVOrsZfFaz9RvfNHYp+GZyEDSO3BwWfcDuNQD602Nn1U2spEeKaR5KP7aK2f
	uOhNa0YJ7h2evdrH5oAOL9r7nizAznBXgtqTi78cnGMppreuABF+KHxKioDw==
X-Received: by 2002:a05:6102:1487:b0:631:28c1:154c with SMTP id ada2fe7eead31-747534b507cmr4933450137.9.1784632994728;
        Tue, 21 Jul 2026 04:23:14 -0700 (PDT)
X-Received: by 2002:a05:6102:1487:b0:631:28c1:154c with SMTP id
 ada2fe7eead31-747534b507cmr4933436137.9.1784632994275; Tue, 21 Jul 2026
 04:23:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717095825.3962666-1-pratyush.meduri@oss.qualcomm.com>
 <20260717095825.3962666-4-pratyush.meduri@oss.qualcomm.com> <20260720-romantic-radical-avocet-bccad4@quoll>
In-Reply-To: <20260720-romantic-radical-avocet-bccad4@quoll>
From: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 16:53:01 +0530
X-Gm-Features: AUfX_mzG90RYGLzUHLgWXGQR4FxlL_eJoPUeDxHiT30MTK5iRyNxHLT3Jr0zP9A
Message-ID: <CAB3tGMOSo3rmxby3dK+UgW8FSkxkaWh6mmTEbe331J__-7AHRA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: monaco: enable audio ML offload
 memory and SMMU mappings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: b4oeJ2N2uFtql3HoUmYg7O-eRfJkY1OP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEyMCBTYWx0ZWRfX8DtXekkhk8tL
 d2db7tIcD4IrMHXboK6ki0x2KpspEZfapMws7cGmE9GwD+UGH/JGL2iLouVbQyUn0CgdazopKH8
 8UKJ4pMLRJqOxmn6wsms90XChyw5W6tAJsSVSsc4941zMl0nBhnpaR/WaZ/PSLq+G5nVhMKru/1
 G9K31qIBS5e4anByoVp5mad5IJWArrKLPbRgUv9aKD7SQ8rbwwb5Dt0FPPkaUeIyFQpCSGgF2fY
 dGIGDpxBpbDlS9il74QERNjLuc7zCYu1KVejUgRLEGrG3UVxdpOJEYAoyuHyOJURh8zUZHYO3gl
 MSTkXBno+JB18uNGy+8RneT+WWiCCv8K3aVQqlMsbvnZzd65KhAlPgenjh9/PbfwDtYayYKMPCW
 sAqSTvF+OCIrxRRlHq/f4n+2XvdTXxh62yHYDph7a0cUKv0s1egO3xBXTjim8cVvRObKE3loTJF
 NEpkFKPdVP6Tv+EI2Aw==
X-Authority-Analysis: v=2.4 cv=I9JVgtgg c=1 sm=1 tr=0 ts=6a5f56a3 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Eckrb6PB2g-3wKSLlsIA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: b4oeJ2N2uFtql3HoUmYg7O-eRfJkY1OP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEyMCBTYWx0ZWRfX5tHq0qvEjNkD
 BKp4207t7OT+yLhGAtTwSLzy7mVSh8XRrTjhU7exwxfOF0Z12zczHegJtXShm4Q2l7yniXplSK8
 U21pMb3O9I5MLFgHE7XQCNnrvpg5awA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210120

On Mon, Jul 20, 2026 at 11:42=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Fri, Jul 17, 2026 at 03:28:25PM +0530, Pratyush Meduri wrote:
> > The audio ML (machine-learning) offload use case requires a contiguous,
> > physically addressable buffer shared with the audio DSP/SPF, and issues
> > DMA transactions through additional SMMU stream IDs that are not
> > covered by the existing ADSP mapping.
> >
> > Add a dedicated reusable shared-dma-pool CMA region (16 MiB, 4 MiB
> > aligned) and wire it to the q6apm DAIs node via memory-region. A
> > dedicated pool guarantees the alignment and contiguity the DSP expects
> > and isolates these allocations from the default CMA region.
> >
> > Under the EL2 (Gunyah/hypervisor) configuration the SMMU is fully
> > enforcing, so the ML transactions are otherwise blocked and faulted:
> >
> >  arm-smmu 15000000.iommu: Blocked unknown Stream ID 0x2060
> >  arm-smmu 15000000.iommu: Blocked unknown Stream ID 0x2062
> >
> > Add the ML-related stream IDs (0x3060 mask 0x9, 0x3062 mask 0x1) to the
> > remoteproc_adsp iommus property in the EL2 overlay so these buffers are
> > translated by the SMMU instead of being rejected.
> >
> > Signed-off-by: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/monaco-el2.dtso | 4 +++-
> >  arch/arm64/boot/dts/qcom/monaco.dtsi     | 9 +++++++++
> >  2 files changed, 12 insertions(+), 1 deletion(-)
> >
>
> NAK, you keep ignoring us.

Sorry for sending a v2 before addressing all review comments.
I will make sure this does not happen again.
Thank you for the review. I will respond to all comments from both v1
and v2 and address them in the next revision.

Thanks,
Pratyush.
>
> Best regards,
> Krzysztof
>
