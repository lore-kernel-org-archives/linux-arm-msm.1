Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A4551356B
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 10:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790678998; cv=pass; b=rpMTcinHcKCgUh9ttJYBn/8Ci1tdGdk2pkPm/+khGLhUarGfvXWL2BxKKfdGdwwZd7SpDatD+bWkWeac56h1hEYHNebce+cRSf0ZBM6ZFe/J3UTFRluMpZoITuNdLas2cTtCarVRP2ebXKdkNnjuoFr8GwuuaY8jtMjEBlPFNvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790678998; c=relaxed/simple;
	bh=jusFXHQSwUzPgCyWA+EDUN4R6SZS9ccq8vL5Y7+Dcrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qyf5nSi0fcCcR4ee40fqbhsaQ1pcA3MuuqFZv3qLubJMlifpClcu4dDN8GCiND/au5F6kUfeOIt3nIxtbuWZqXqsUXO5le8XJI4oqcu+r6bUt1fLn3zGpZoSfqdnqES/BOXOR9yPyef6Ka2DomA8cNwNMhIOWGrMeQ/LN/p6fa8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pZw8GiML; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AEKjU+qg; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pZw8GiML";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AEKjU+qg"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TAj5NW335116
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 10:49:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SGYRi0hqFtpQeL566b6/F5werlBt/r9sl8eXWumcCs8=; b=pZw8GiML1qPDPMG5
	zudI4T4YM5tutdt73UHz/FWZPCeXfJuzD0D+1vH8Qo5cGNTtiX2l38i4M87uGuNa
	i2uhFjwGrtNw5AwBYbjvavIJy6VmWAGu5E2+r0LK64WSKWkhGay+M+UaRcDnH4OJ
	kj7RtBfnzPWocfT+Sllc8cPinbhkF8TIeDtgRbEIZaV1HYQEok6r0E0ttsjTs6+9
	9lzsU+9Ike3iqnqTqLaqPPiZAXKGo5S/fJ1NOyPlaYyZWYOqpLcX3ApIJc7F5yhT
	oyQFdwrjnNUXYJtAtSdQGxfCqD4M9dNCQlH+X5IWRi+1qLHLG3Kjv361v9EB/kin
	+e8hgA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew21r4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 10:49:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a47a81e70bso1720637a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 03:49:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790678986; cv=none;
        d=google.com; s=arc-20260327;
        b=eCWCe7pQ8ix0/SiwLcl1i2/CPmswe/GFFfM9gqaqsTmVh7qHwL+F3EjZ+/ohRElrw5
         +WpD1+8SU2IDWJ0VqMDQF4grphJTSKeRm0ZA6nwSHJPXEny7wBxhPE9lyJCkFX2vhzDo
         DubF6C7aC2JEn3s2tA+nRBYzNp/MTSB8b/783s6NU7FfHhNE8TUqtukkyrAP5RlJqwLG
         fo52ddDi+wYQX8naNFRL5Y1M7eUHfUo4yV0d1Cw7mGMOEbUATGE/n8Ui2uv3Oh9JH7EC
         8DVEafzxcHmdTZl2eyTlgHSKtf8iRMmfxX9fasqkkDggPqrRkBmyMq6c9HLxm0SlvOFi
         maDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SGYRi0hqFtpQeL566b6/F5werlBt/r9sl8eXWumcCs8=;
        fh=aRgM6iEjI87Ulb/TT+YW0zT1ziaTOuSbdBnA8N5IhOE=;
        b=dwXLTLzo9vFC4I1+NO09EjGzFaU9D15xvOGT97MmEHu0v8tjAOxCu4K5/7QyDUddEX
         A+3ECA1W31twd8q4xqhkRWk1hRPekWA7GiQVWpp7erQMOe2KPuZc5CBVYf2lgzzvYVXt
         sz0KqvpJE7KEzvOodJ6T7YZVATgns0Bi7t5mqkxATcV6RkpEfBK4wxPIGLAFSh5VcGJb
         kfUJDdhOLaURE5iw85uYVNG6EoJad3nj29Wn0HRgGMijibW2WsF+yqavbh3uKf78YskF
         EaAvytlYpGXC6ey1nJIIjGT+653jTxlbGX4j7hEss0zxM9syDLBJQ4k5pVx3rdTgVzhw
         6FIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790678986; x=1791283786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SGYRi0hqFtpQeL566b6/F5werlBt/r9sl8eXWumcCs8=;
        b=AEKjU+qgnXDHomyya0uKgTBzZTUniaVslolYm2ehPMFk0xetsPnxrSWbXal0jIvw3h
         gKX7rV0qaDNqF5OHE2/4ktD0Zc/xFlSLrBAUHy8aDGwey4/dXaqD64Dv8Pud1cLuj+LV
         UN3L7qLLpCwu8ScD0Hsg/OPWxSpfLTEwDuV5MimuLBMmZhe1F//4PBN52iLqLu64PKNX
         S04F3H+ZvBwRTFOmk5XxpwvBDKwfb4Lm0gLTlIhbjLThRO2FsgdzGSVfyi4qNfcUwS4h
         TRYfccGL9hPudTVKDvE0qpHpkrYgS2i65Bxb74/BGozOWre1LS2le02NSu9mT1M+hxRw
         WDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790678986; x=1791283786;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SGYRi0hqFtpQeL566b6/F5werlBt/r9sl8eXWumcCs8=;
        b=q6+Xtv7fG8Sg+gC5kTgW1Y0KWdtg2bmziJeDiS1twMb/ZoGrYUQ0fvbkejFvjnHvQC
         q7fXMq92FR6dhMZQ2irC6Ei7p3cTeJnqI4/GmsDT9bYCiOSFsGFQ3j8q/QMTOhXKHeKZ
         chwn+NHtYEUtrD+LPJdNglNF/xyvimIO6BnfX0zQbgj0/neUBBMyp936/aSiwCXEZKqh
         jbXTYVN7/88bQ5oxbZEitQNOyEVV1exk214JXppr31MIwhiMeAd+IgtzjIVyqCtZGszd
         i2ImAlofrD8rblrpEV2nE/s5vtpEpgMWK4L44jkVanAmbQu6V1WZpyYihD6MDAlpAPhq
         3fsw==
X-Forwarded-Encrypted: i=1; AKwUvBz5rVov14krT2A6SD773Yiv+3U5zVEuSrdjnucso8jgEUDxThabj0Zg1h2X8wlDslpMIAA6cn2kK0cadhkN@vger.kernel.org
X-Gm-Message-State: AFq9FYKyS8c5NTbBhhGBTgJJtmwVBs3bpr7NcSbYuhj39cMcxubvI8+h
	gDLgNYzu/OSzM+pcbjmLVvMzmAftBa6hkt3FekY4af3lzCBbMe+Bs2fx9p0CQAOJ1IlnZ+KDVDS
	whPJJpRmI6MKEmH5ZCVBO7mnoqt5OoTmMqvyH/0tPOqGzvdHFdqqJO8UVsAJ1BNlMUb6NsIuRN8
	tuNFAHRq8zZIFq8EJ9egPTKPCbrFS6Zr9EYdPpUxdJZ3Q=
X-Gm-Gg: AYBFou1K6uUZNy6MgU2a4mEltvDX9J6CbGL02ffSXGtUrtacXpojoCz/5ZjpLWBP6y1
	3r1VOqV3CMLj1mcVmVALhSfA9B/O4AGriI8L5dQHhQ9QHolU/scbPfDFHmHGuRBmGiRLIhPkxjz
	owg4vaK+pKWftCm8u4RU7QB173/ZVqs0OQGizlDjJgr3ah7M5rd5OVtP/VjA==
X-Received: by 2002:a17:90b:4c4c:b0:3a0:c135:3e5e with SMTP id 98e67ed59e1d1-3a0c1355d67mr10311384a91.27.1790678985339;
        Tue, 29 Sep 2026 03:49:45 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4c:b0:3a0:c135:3e5e with SMTP id
 98e67ed59e1d1-3a0c1355d67mr10311373a91.27.1790678984858; Tue, 29 Sep 2026
 03:49:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
 <CAFkd8hvoUi3dyff8w72pmRHce0XDNUepCsR=1gtimFMgA6gmBQ@mail.gmail.com> <20260928-steel-hornet-of-kindness-aa5e2f@quoll>
In-Reply-To: <20260928-steel-hornet-of-kindness-aa5e2f@quoll>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:49:33 +0800
X-Gm-Features: AclHuK8lK5qr26yCIDEnhIRFlV9znH4XanXV1TnOvthhB38ZY0UIVpeLTmtUFHA
Message-ID: <CAFkd8hs6H-WT6C2Nzns2jB1yHq1CfODijAX1VbMxUUAe7zH6Rg@mail.gmail.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0MyBTYWx0ZWRfX8BsVoHLLsAU/
 SP4dsYFp2pldCH8b12+cBB+l3IASZ3EczajkO9zo47w8TzGCVgvrEfAHGGSFSL+oYOT88ENv8xv
 2znvBl7mDHhBytbuupar1VzGUOvWZEQ=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abb97ca cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=SRrnDWHc4gHVzc1XPIAA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0MyBTYWx0ZWRfX4uf6qFUvyjVu
 lZc1crmbwmQuUthKBhFKNrDqcVSLYXan0+LttEfqZAOZl1zvOn8WO8OtPmt3qU9ycJu5vd2biqN
 K+Cdf2p/Sz72VaJJ6RuUihDnoNreVqv/WZiDsHiQNOizlOc/RqZrxiBZDRju+fExlCdk3uJ/OFE
 KMRGgIuZ191ERoTj1aRkEzChroBQHzz2iHUVK+EpGt28jGUp8wxkVZLYqlUHwcz82twXHV+9AlO
 qspvPOgnQZ/Jh4ZEJ34ldRd8hrHW3PI2/WNNADouUIII+ZZV+va/tYi6tPptlc7nIuGK+ZPtzu8
 nXIUTb7KDKe/JqvOLlUy2QR9zxMJu+CK8qfesEafsv5S3iQW2HB3XwkAJH0ao69v8oNeIKY4dqN
 IWjXXzXs29HkiQoT8XvyftxuVE+OnDjO9LxVBeg0I7owZaa2FXTd+648sFz+uxpXy2b1X2yCrML
 T///T/3NkZeV0zMggMg==
X-Proofpoint-GUID: VhBt3hkQCCbcQ6PxjHoVaW4V08SwAdGq
X-Proofpoint-ORIG-GUID: VhBt3hkQCCbcQ6PxjHoVaW4V08SwAdGq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290043

Hi, Krzysztof

On Mon, Sep 28, 2026 at 6:19=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Sep 23, 2026 at 04:58:03PM +0800, Zhangfei Gao wrote:
> > On Wed, Sep 23, 2026 at 8:04=E2=80=AFAM Mohd Ayaan Anwar
> > <mohd.anwar@oss.qualcomm.com> wrote:
> > >
> > > This series adds support for the Ethernet SerDes found on the Qualcom=
m
> > > Nord SoC.
> > >
> > > Nord uses a QMP v7 SerDes block, which is an updated version of the
> > > SGMII SerDes PHY IP already handled by phy-qcom-sgmii-eth. The driver
> > > currently supports the 1.25 Gbaud and 3.125 Gbaud configurations used=
 by
> > > SGMII, 1000BASE-X and 2500BASE-X. Nord additionally requires the SerD=
es
> > > to operate at 10.3125 Gbaud for its 10 Gigabit Ethernet interfaces.
> > >
> > > The series can be broadly divided into three parts:
> > >
> > >   1. Add the qcom,nord-dwmac-sgmii-phy compatible to the binding.
> > >   2. Prepare the driver for PHY modes which require different SerDes
> > >      programming and readiness checks. Existing SA8775P behaviour is
> > >      unchanged.
> > >   3. Add the QMP v7 register definitions, 10.3125 Gbaud programming
> > >      sequence and readiness checks required for USXGMII and 10GBASE-R=
.
> > >
> > > The changes have been tested on the Nord Ride SX platform, which has =
a
> > > MV-Q6223 switch, running in fixed link USXGMII 10G mode.
> > >
> > > Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> > > ---
> > > Mohd Ayaan Anwar (3):
> > >       dt-bindings: phy: qcom,sa8775p-dwmac-sgmii-phy: add Nord compat=
ible
> > >       phy: qcom: sgmii-eth: prepare for additional PHY modes
> > >       phy: qcom: sgmii-eth: add Nord USXGMII support
> > >
> > >  .../bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml |   1 +
> > >  drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h      |   5 +
> > >  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h |   2 +
> > >  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h    |   9 +
> > >  drivers/phy/qualcomm/phy-qcom-sgmii-eth.c          | 226 +++++++++++=
+++++++---
> > >  5 files changed, 219 insertions(+), 24 deletions(-)
> > > ---
> > > base-commit: a8c591ed6b672915e0be57843f943a2a723aff40
> > > change-id: 20260923-nord_ethernet_serdes-c486f715f383
> > >
> > > Best regards,
> > > --
> > > Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> > >
> >
> > Good Job=EF=BC=8C
> >
> > Tested-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
>
> This has to stop.
>
> Why again adding fake testing to the bindings? You cannot reply twice?
Reply twice since I thought they are two different patch set, one is phy,
the other is net, while net maintainer said that is too ealry for rfc.

The tested branch is
https://github.com/zhangfei-gao/kernel-topics/tree/next-9.23 ( and
9.24-eth), and may keep testing for each cycle.
contianing dts, phy, net and all required patchset, assuming one
integrated branch will be easier for interal track.
The dts will be send later.
Testing hardware is ride and rrd.

Thanks
