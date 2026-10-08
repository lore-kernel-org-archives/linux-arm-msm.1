Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4697175A95
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 04:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791432816; cv=pass; b=FSHXqULj4aPth01nIAcoFevgBbzjfhFfPQiJAYRJW45d74Z92F+QmSr6Z0PykkOJhdwF7bAGfecoAGGEpUr/ooAIQqKcY19OiUwgS2KTlxNY6H4fIiPY0IZEwmvft0erAF6qYTLMjeH8Z/Wtoqy9l8sG1jl2iS10H9jcU4SESrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791432816; c=relaxed/simple;
	bh=7n8n5op5cfw35RUI8xfY6ZFnQUUxNNoloaYlLatrMvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d4UFl5ccihujhqLAtyj5mt1SdjXeksrAecGxBo6bmf7ZWd5ARsPG4q9FGUB39qbaHEVC5w1Pjh6aZVG0pV/cAWE9v0fok/Qi51SYgR0CKTOYNd3r/oBDsxsDdEDLhtHmxZ+5aB23jJ94hgIjtEWpBiEbwB5RkdZtI38YIDnCzOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=prJP00kj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bTjzPspv; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="prJP00kj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bTjzPspv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BXIB753833
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 04:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nt2x+jEs12Lf5eX1DXl9eLI48xHiZT3l2Oh8LjkTB8Q=; b=prJP00kjzEXd8a0/
	+BH0YUhaZ83tX1bSGFz9j3BKLxAox5jjjG3dcT1WklGPwUY1PddfnfOKuwJA8bU4
	QFNOpZOgDozqIkX4ooV+2Wryc7+23YEqpIr1i90Fr36RohY06Juc8Q7cc1r79/zj
	eWOKNWV52TH2LJQdws1xqmzL25cd+NmX92gmYz/vArAeo9PQV8ME4qe9UTWMn+XF
	2yomndHqUEMVFYNgfiK/DTh4UDijVGgRD7WKBY9337b/VPJtYILM9hQSGzoeQlVj
	Uot5k/KNgIkKtVOjUEP9cuq/fwZNbzsTS92+AljK/1a2CIo/Qe6uFtDsL5sW5ZiD
	D1dyJw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe39013-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 04:13:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d001671a54so57827595ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 21:13:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791432813; cv=none;
        d=google.com; s=arc-20260327;
        b=S1LxzO1UkWzl/nqiIo81+G4UidLgoM0Ufl5wSei63Mn3mEeTrZw8Kk5TeUszswQagk
         vfZu8eXe2UHQDOdGXjO48e9ZuDwajZGnnnwm3PyMWP6UORqe7NTOolsT/fDjJhE9S9EF
         TXSmnsJke+b1TojoZmXwBmFOeumI8DjgorxZtMqlo9MSELiiqCtd73NwgszPKMNPDsKa
         glE/i4Hkxt39X8161te7PJpSU1ea9v3g3SD+qPyNbVCExjplTTWHzT0k4+L4z9/MlmEF
         cqaNTZGDU+i6P1gRS2J6NQRWbPJKBhI1Jfpau0QJKlpugRuW42+nifKMPucmspJ+2X2J
         hIgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Nt2x+jEs12Lf5eX1DXl9eLI48xHiZT3l2Oh8LjkTB8Q=;
        fh=7efgD6hSnm5svCCaoang8Ez18izFAgm6R1NjuFGvAA4=;
        b=PGNWawg+34Iy+zpUFDMP4NIHxnAniHOC31RtIDlTkMXEKmmcDJkidE5zLM9o4QE6VX
         QoyGDRrEizMWqJmKW9aSdEDuCtpcLIOWXatw/21raYNLcOB8XzI6QCkAKF27y7KusjFD
         CmHQ0mQvSyGAiFS/gYLtRuBHc+ajuoJZBYcxaQf9jDfArnw03pCVNXDnk6Z9b/hK/EQr
         nRgZz/A7SgKtmK5Qva4YTFtnf9SlwPS5TA1I7cBKUjmIflicXihsAbCOyTvIHcOnESi3
         cUAjGq/MqphAxYCXlEvXJH4Kzx4D4z/jITpPgYf93ACH/Pc/pBUGa7ENcm54yvUuA2dT
         g7IA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791432813; x=1792037613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nt2x+jEs12Lf5eX1DXl9eLI48xHiZT3l2Oh8LjkTB8Q=;
        b=bTjzPspvWoKEHfNwzDnFhI/J2/tPKVOxHUSAivOSjRKoMYhtCreDz4NDiUTHIVflHZ
         px/28zanM+vu+fRvX/4t9M6ez4vIHIofEjLgdByNfD3icPlRGMJtsV4kGsnAGLTxEsZd
         MmPaHdD6FuKFDX7NwNEQT1wWXfgpDW/Uslah5TrnHJllYRZRuEOmQPGLqBel0JL8bmdw
         dgOtshoGUGWpU2Bzdp59Ei2/3aT2aFmbmF8IDSQ8LRyMBDBuxc/6Eqcrv7F+xMfdlFzA
         K9Nfx0cNr5BflHIAGNDy8BREdrx1+GkskuoGbVm3PwZ6eaFTHvhf6vrjNQEXtxsJ159U
         07QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791432813; x=1792037613;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nt2x+jEs12Lf5eX1DXl9eLI48xHiZT3l2Oh8LjkTB8Q=;
        b=GX9cUkXUVVwyQxFg6LbF+2QGKeXBtqDF86NlZXYh7qbT3C9pdgxdU+FZqt0GT00ELN
         WFyo4ASLm+wshA/mHQtnQAQ+CBNjdQswVHm3yb2PrgmkWrYikBNJkBQYBA+pxkBe2y4E
         ZOyDFQqW7Qr2dOo7RWO0RPwknxe++FXyTGpj5khg2Pe2FnG76sqs7tfy+RCcTZLopV+P
         ZU9KE8Za6/ELDl6za+lmlCUJaSNVo3G1i8xBSL8LXNLA7urYRThXaokc17I0kJfs2TNg
         SucBU0N6JeSfpeE9poFn6yEuVXappRe3AB4cCSdNAUwAb2d+nciUrSFKu1TM0YrF6G+I
         8PKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxA8/LQF/Ou6/R8GeFMVo8bCj4K35jjdfEegWVRJ8nRXlwO1fjWgUf8+qfOgFEnmLAo1tiWEODdMJzCU//q@vger.kernel.org
X-Gm-Message-State: AFq9FYLKqHsv2itOO89YQ/u6VC4V+i8LMvTabHet9eQnLKKAtYQwQNvX
	A07J4U3+hKSnWghcrbL/9GpUNGw2U/YDDVwQ9Egi4CxqfLVIW+b4JFz+zvnJYOpsafIDoXClVcB
	yPjLohWi4hecE0Ovrp5dz9HS3dlZJwGG5nJxqP7Au4/0+KrKmqJt0nZSNH0cUzc0Ud1pFzKuGy9
	VW58vSHmHCSA/Phw9UWdVfb8OWF+pdLt+uS0LH/VGQWO4P9g1naykOXw==
X-Gm-Gg: AYBFou1ZPfOTj3JNHm69AzqFcEXftiXHSFRQQ2pM7yr3xTegQdsM8TZRbZlqzYPzL2F
	5D9NrawUg56yM9/RDUGs2uLPBexlGHbSBCjNmbTumvNdWt1hzruUbnRGy14INB9iM5nfXY3cRzH
	rRz+TpaPU2GoH097QfKVD4p3Dq0jPHZeEV6RIzPRSqbe/sra5BYLEScmTBCA==
X-Received: by 2002:a17:903:388b:b0:2dd:76b1:34f0 with SMTP id d9443c01a7336-2e6003b68e7mr37860775ad.11.1791432812611;
        Wed, 07 Oct 2026 21:13:32 -0700 (PDT)
X-Received: by 2002:a17:903:388b:b0:2dd:76b1:34f0 with SMTP id
 d9443c01a7336-2e6003b68e7mr37860195ad.11.1791432811391; Wed, 07 Oct 2026
 21:13:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
 <CAFkd8hvoUi3dyff8w72pmRHce0XDNUepCsR=1gtimFMgA6gmBQ@mail.gmail.com>
 <20260928-steel-hornet-of-kindness-aa5e2f@quoll> <CAFkd8hs6H-WT6C2Nzns2jB1yHq1CfODijAX1VbMxUUAe7zH6Rg@mail.gmail.com>
 <e4a07d79-199b-4998-ae2d-a9e8b91a228c@kernel.org>
In-Reply-To: <e4a07d79-199b-4998-ae2d-a9e8b91a228c@kernel.org>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 12:13:20 +0800
X-Gm-Features: AclHuK8QBXqkiOqYuICecJ7KFfILuZyxlgsMgUrPOb-9hebjAdLP4OyLrmMCzjI
Message-ID: <CAFkd8htKJO6rd4EnfjwZ7mANU4n18WMtBha=ZKS+UoF-4gT4ng@mail.gmail.com>
Subject: Re: [PATCH 0/3] phy: qcom: sgmii-eth: add Nord USXGMII support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Jhzl5Gwu0iqNn8ZJjv7ktN4J5JHcFwda
X-Authority-Analysis: v=2.4 cv=QOz91QLL c=1 sm=1 tr=0 ts=6ac7186d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=SvoBQ3C05wZ_be5UkMcA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAxNiBTYWx0ZWRfX4wqJKOUaql/M
 7KU4x7kuDiIp/Xvzi/uWBBmpzozi1EXZQMox3VcpJgGfvN1AT39s1fc1T3iga104fez1ItJlRmS
 LEQYZNQyDG2ruiftdpyTiw3Mez/hYLc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAxNiBTYWx0ZWRfX5IUDC3ls1ncU
 j3CkbT1dnrvPJheucYerMmOq6F7xd5ipJJD4PKTgE7hHUFPCxk9cfcZCIZHeg9j/C6dcuz/Wa4S
 DWp1SOX+2dZg6+eVqMmTcGjo5qSZZ51hdyyUIDBicIdKtRAeBx9ZY2y/snOAJAJls+8cUm7kmIo
 G6DL15PfAOoJ5gP6sQNXV8E3bufp+YHDS4xUGH7k7vHmSye3PGTTCXIA48OQZaOoIf0ELG0Vxr4
 KQyY+GzUqiZDt59z4HyDtoigEuDq0SV+jD0G22VzglO4qpYjwBnPbO5xi2UJghk5hw1WtBBm1oB
 rsI6tq4+ULtmgiGNKJrvQgsXIdgIIvmxf7xqchWMA+HO1c9lbIgISA2EJmDoFwtLvSGiHLiOA3p
 7Ah5PbsAcAA0PhQSxvPfIYggVtDlw2/J7gHn7iOEtmLgsf2AD0bi5cYHEM41gZwS5zCTxKp1H/P
 sLWnC0dTk1dVDImp57g==
X-Proofpoint-ORIG-GUID: Jhzl5Gwu0iqNn8ZJjv7ktN4J5JHcFwda
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080016

On Wed, Sep 30, 2026 at 1:16=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 29/09/2026 12:49, Zhangfei Gao wrote:
> > Hi, Krzysztof
> >
> > On Mon, Sep 28, 2026 at 6:19=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On Wed, Sep 23, 2026 at 04:58:03PM +0800, Zhangfei Gao wrote:
> >>> On Wed, Sep 23, 2026 at 8:04=E2=80=AFAM Mohd Ayaan Anwar
> >>> <mohd.anwar@oss.qualcomm.com> wrote:
> >>>>
> >>>> This series adds support for the Ethernet SerDes found on the Qualco=
mm
> >>>> Nord SoC.
> >>>>
> >>>> Nord uses a QMP v7 SerDes block, which is an updated version of the
> >>>> SGMII SerDes PHY IP already handled by phy-qcom-sgmii-eth. The drive=
r
> >>>> currently supports the 1.25 Gbaud and 3.125 Gbaud configurations use=
d by
> >>>> SGMII, 1000BASE-X and 2500BASE-X. Nord additionally requires the Ser=
Des
> >>>> to operate at 10.3125 Gbaud for its 10 Gigabit Ethernet interfaces.
> >>>>
> >>>> The series can be broadly divided into three parts:
> >>>>
> >>>>   1. Add the qcom,nord-dwmac-sgmii-phy compatible to the binding.
> >>>>   2. Prepare the driver for PHY modes which require different SerDes
> >>>>      programming and readiness checks. Existing SA8775P behaviour is
> >>>>      unchanged.
> >>>>   3. Add the QMP v7 register definitions, 10.3125 Gbaud programming
> >>>>      sequence and readiness checks required for USXGMII and 10GBASE-=
R.
> >>>>
> >>>> The changes have been tested on the Nord Ride SX platform, which has=
 a
> >>>> MV-Q6223 switch, running in fixed link USXGMII 10G mode.
> >>>>
> >>>> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> >>>> ---
> >>>> Mohd Ayaan Anwar (3):
> >>>>       dt-bindings: phy: qcom,sa8775p-dwmac-sgmii-phy: add Nord compa=
tible
> >>>>       phy: qcom: sgmii-eth: prepare for additional PHY modes
> >>>>       phy: qcom: sgmii-eth: add Nord USXGMII support
> >>>>
> >>>>  .../bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml |   1 +
> >>>>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h      |   5 +
> >>>>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h |   2 +
> >>>>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h    |   9 +
> >>>>  drivers/phy/qualcomm/phy-qcom-sgmii-eth.c          | 226 ++++++++++=
++++++++---
> >>>>  5 files changed, 219 insertions(+), 24 deletions(-)
> >>>> ---
> >>>> base-commit: a8c591ed6b672915e0be57843f943a2a723aff40
> >>>> change-id: 20260923-nord_ethernet_serdes-c486f715f383
> >>>>
> >>>> Best regards,
> >>>> --
> >>>> Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> >>>>
> >>>
> >>> Good Job=EF=BC=8C
> >>>
> >>> Tested-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> >>
> >> This has to stop.
> >>
> >> Why again adding fake testing to the bindings? You cannot reply twice?
> > Reply twice since I thought they are two different patch set, one is ph=
y,
>
> You don't even try to understand the problem.
>
> > the other is net, while net maintainer said that is too ealry for rfc.
> >
> > The tested branch is
> > https://github.com/zhangfei-gao/kernel-topics/tree/next-9.23 ( and
> > 9.24-eth), and may keep testing for each cycle.
> > contianing dts, phy, net and all required patchset, assuming one
> > integrated branch will be easier for interal track.
> > The dts will be send later.
> > Testing hardware is ride and rrd.
> >
>
> Explain HOW did you test the bindings in terms of Linux kernel testing.
>
> Then explain WHY you cannot give the tag only to appropriate places,
> instead of blanket one.

Oh, understand now.

I only performed hardware runtime testing,
which did not validate the binding itself.

I should have provided the Tested-by tag only for the driver patches exerci=
sed,
rather than applying it to the entire series.

I will run and report dt_binding_check separately for binding patches,
and dtbs_check for the corresponding DTS patches.

Thanks for the guidance, and sorry for the confusion.

Thanks
