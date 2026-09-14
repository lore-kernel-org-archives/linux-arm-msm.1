Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514B24137B1
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375815; cv=pass; b=kXVwymjdb0BBrw2muYz3w0PviNKm/7Lg3xdnkMWVfoQu0VCOBZH1X1mXy/A3Sy1MPW3lyf5/svtvd017VMWD7tZP0ariSFth7UfM2qgmp1a79CL+Up6NOZAvAUjLQmuaCXie0nW2lWN9kjZI20dw1cuEYGIypDGCevpJ/3anbvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375815; c=relaxed/simple;
	bh=rURd6TloKr3f0GtmYotAt/Lt132i4nJ02pnGCrda06Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tu9qBcsRkpTwYsfPPo//QIQUz7tzSybmuaUR32HlVIIZlbi0LuKaVHNJ2p14JSA8Vm3YVrSoKzQ6ZRB+TT1dzIbJ0hRFt41Pi/GLUWen9KjHS6blK2eT/1s8mrSYGtqd/v2Hyr0eATml/xyMQinau5MkDcjdpJY/vptjjY9SdmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UVcAMdwb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gIGQvN00; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UVcAMdwb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gIGQvN00"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ilWU2627003
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:50:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rURd6TloKr3f0GtmYotAt/Lt132i4nJ02pnGCrda06Y=; b=UVcAMdwbCwVGAbCV
	C+sUaDdDX+wSQ71/mmFXzE/+9fIcAZHzaY3fc/XfdVRB0NaaSP0FTc/4MgstqM9i
	si3Mf9Gz0rfrpoHnnL29Lxvcxul1FW2q/LrvaZU72WTE22DOmEuQqcE7sXLJ4nql
	RysRQcME7N72Fq8zodzLw0YqGXZ2HPtP4KN3XlDFAS4oTAGE27DHd+3Q0Sk2mdgr
	HcDGrJUw0yKoh4BLXGkfEu+jYFQpdNDIpOFZbGCEpjO/fzR/N9wHNjb1GT2HOSFM
	EAD5UqdxyBLXVJwigrgEiRRIaaseVJ8EKkFKtcsk1jj/AXalu8ePqYGRZ5iV3fBL
	YOVQAw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh5npy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:50:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so635432385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 01:50:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789375805; cv=none;
        d=google.com; s=arc-20260327;
        b=jNaIw2o0CfbQ1UcJwJPzBUd5w7/w+TELu7/eK+ETIF/dy7f3hv6PZGZduGOl6calzK
         v7xVFkWQeIYu7Mpxc+uNMiz/LCIDqpERBN+InPQ01YlvMOafjfYD3rolVd3KcRe8Guwf
         eqLb7UwQuB1E+mTHd5T0aKNwMqCmFCrkQ4nAQj1v9B6ijtfpqUJZbjhPdlYoLnLQFK2p
         YLSZIm7Ub35xyG+FAiSnKuBs90GV8l386NWuww9SjZGZVsfCbPrdXTy5VyQ7oZa4NvMK
         lHcwHEO6Mm0v8Oz9594VSxNpOAijfwsiyraazUWbpgf6tvEJwIDHQnXWIL6/BsrMTw0Q
         MLYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rURd6TloKr3f0GtmYotAt/Lt132i4nJ02pnGCrda06Y=;
        fh=UxsnQmVPHoFbW4kokrfS7oYY0XnpVVzkzch1kg7bXzA=;
        b=Nb4aNZnWYCBpxesV4HwM/l5eyMM0V6O22MnEsCsRldxzioNOfPPLaSPfeSYIKf762V
         3W73TesMK+rEV0R1xBTj+ps3qc9CA/G2AP6nNIof+SP2ovXv0gZagVGMB1ZLkoVLibcA
         jFiL2HiVj2lM8oV//F3NO/Y2PwmMjpt4vd08u7qpMpyeu36GRJQ5Hl3yO5mcnN+8QVmT
         bRWhus69NRX5f7cJ0aejYV6XWo3Swi73u7DeELYcisIAvSUGz6q+c4b4vE5mW84UWVJK
         FU6zlEcXJ1HNfNttYDjVD0KphSgx7NdRJYDknG2nWRh/1cMq//4jYhKWgDfzZpNzIAmh
         5ebw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789375805; x=1789980605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rURd6TloKr3f0GtmYotAt/Lt132i4nJ02pnGCrda06Y=;
        b=gIGQvN00XlJLIlrGcPqcLt7HHVIulIL64nwmJTXgneCQNFjmVn2g7wEZ0fzrW/2l6z
         kWff8ehsldkj4SlnTEFMq4A2Y5khFOk243AzI1o32GikMfmaI/v6Wr4i8ucNS7hfqi+K
         XrfUGRYWYxejsZnUTEfYZts/yvygqON7vSF1pCF1ecI5d0Q6V+uBcZ/4n1roS1CunWDa
         Kfc3IVJj8wuY0YvJbSaJdKqNedCMlP+fyzM5eKJNF860nauB7TM7Q8MxFXGuC598OGP6
         DUmtJfSQSwmIZE6QMQ1wXQ1UdFUVYgcUh+bZ9CYZO9oF0PkUTGcxCJ9nmimt1Y9mksjF
         PFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789375805; x=1789980605;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rURd6TloKr3f0GtmYotAt/Lt132i4nJ02pnGCrda06Y=;
        b=iHx+b9X+XBON4qX39Gde6bb4YWljvrABLv4dvNgP3UOHoiQAsKgeuGEe6utbNFq7+O
         pp67LMAlX2rsXrW0kca5VcaUQT4tmJTQccBSO7MiNmV1bOCYkOr5wsiwtdS9DFaRfS01
         U05v2XGV+B70AU765Cma3K4b/qqO1wQ96ktjUnoYEF4taDoTb5d2UrfKhevU2Rm7gyAZ
         q6br6AvUaM8Pfw1vBwGsAHAvIN0kckuztqejRQOVGchWQ0jQ2THiFEGxYpAZr6lvdv67
         8aSUB4W/D28+hzkrhROEh1KWBsRwktXeNvyQl5k8elQjfUXP9s7pgcUV8tMah0GGBGLA
         qGqA==
X-Forwarded-Encrypted: i=1; AKwUvBwnDOO/RoKYF3JHF5p6bwk5tpWQ+ZbBeA0CCBoox5YfA158Jac1q/SvDpUVzC+JxZEoq80b956hD/qMZXGP@vger.kernel.org
X-Gm-Message-State: AFuF++lwtTZ2UgDds9fV6Hkqvvgh811ub1e7KMt9X7/Rilnh+EGglFvR
	Wzgayyb9qmnbSaU6eW95dR0EAmM6yWOndT0L/IbIuJp9VLEiM5nOYr8gLpx/VfadNeyQDTJth7H
	XGgsXn1g+/HFWJdMsqSpsDQRWMWxS5SR6ksf60ivnIr1ioCUGAvongdDNDuLdmRy5VD7X8T2JDA
	g/OdXgTNbdJGvI8SpaksFRFc3ojClFKJuKI3vIdT4VUQo=
X-Gm-Gg: AYBFou3TDMX0yesMPdy8ghwXq7uwpT8Wr32w63Y7sJk9MsZsqbha/MruUhuHNHqjisj
	Pew5vTsuTj6W0X3QOCUxfW8tW74EZbHLqlherOrM+eguaYcMLmCFr5k0cex5OMysmAm07E9abcD
	RGIEdngUudPLhlma0l7zPaXpPvj8UYgqaywm5zgHUMakTf/EHrgYSvgM2uv4ZZ8TooUGeAYgXHq
	X4iMEaE2esTMZRFbjWIs0KMp/nh+spetMpujnPQrcHQpBeb5R0WuYayLUXfG9NZoYD5aGb1PJY=
X-Received: by 2002:a05:620a:1b87:b0:939:9fca:8d2 with SMTP id af79cd13be357-93a2981322bmr224905185a.18.1789375805353;
        Mon, 14 Sep 2026 01:50:05 -0700 (PDT)
X-Received: by 2002:a05:620a:1b87:b0:939:9fca:8d2 with SMTP id
 af79cd13be357-93a2981322bmr224901585a.18.1789375804889; Mon, 14 Sep 2026
 01:50:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-monza-wireless-v6-0-d8c5042b3efd@oss.qualcomm.com>
 <CAMRc=MfDAiUMzOYRWioK2NDM37=yQqb4pQ5ETZz1PVOKQhhdug@mail.gmail.com> <CAFEp6-1PuGMGkdfWYiUQnYffm7en8b-DQybg_4M9xw9MVDNRsQ@mail.gmail.com>
In-Reply-To: <CAFEp6-1PuGMGkdfWYiUQnYffm7en8b-DQybg_4M9xw9MVDNRsQ@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:49:54 +0200
X-Gm-Features: AcwNN1VznECsrEJUnLcouEQxxRZWOhGsAh6qOvyElwlmFiNZH_egy-fEq4m3Sig
Message-ID: <CAFEp6-3gD0xBJZOOmTw1MBex-DYo99MXHsQr_=uLABMHdSjaVQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/11] arm64: dts: monaco-arduino-monza: Add support
 for LGA WiFi/BT module
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-pci@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: NLd7884cC9_hEsh-z85ipzsVp0lT1CNi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyNSBTYWx0ZWRfX/etFHRhSWRww
 OhRowqzYz+x1ASUqxMsvGNNqKw1cT4U7hrc1erokfzOYoMhzTKsILOubzmXhfyy80GfSEpj9HMP
 B0GL8IB5APqaqNQwaR/A+2BKAs/YhSU/1W+VszIVUYdGmpMCjYJGqryovQxtzcRDRpJXKlKKOba
 Nw88q6ViEzSRDUAfpzy60DMBp9zv3RgYP4sEXNxWzelyHPsLMsIthIwOM/lSK+V7lv141o5vyZH
 eljK1w8JKRHSTuM0tyBj8rDphwc7lCh2hffmFKGpAJvpudrjgZpwM3FNLvLJFoaS/CJpe07DCVS
 nAS9tqNdFIzdWhC7ew+6ZziTPkBAAsr48QVrVtbwNKO9wCy93sgpqQuGDDBvbeqRFqKnbT45Xzd
 lwyZY6TIt9lzwcIxb05HszALyxIHdHvVwCgwisHJBHB08JeBj92TJ1zJT3g29S3+mbkee6Tro/9
 6GQsmbtgxOWfLdWMoMA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyNSBTYWx0ZWRfX26jtMMjKJTxH
 5dZNThR98nG9WSL5dVNKktjJXEpEPxxQqQfFoT8xNU7XygF+qHS6YuD23kx3YQZ9iS4rrLcvE+G
 aFKLxiBZt8KdlPRExFJXskv9cAjXaTM=
X-Proofpoint-ORIG-GUID: NLd7884cC9_hEsh-z85ipzsVp0lT1CNi
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa7b53e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=et7816VZQgabzuuDM88A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140125

Hi Luiz,

On Mon, Sep 7, 2026 at 2:50=E2=80=AFPM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> Hi Bartosz,
>
> On Mon, Sep 7, 2026 at 10:24=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.=
org> wrote:
> >
> > On Fri, 4 Sep 2026 17:42:15 +0200, Loic Poulain
> > <loic.poulain@oss.qualcomm.com> said:
> > > This series describes support for the onboard WiFi/Bluetooth module
> > > present on the Arduino VENTUNO Q (monaco) platform.
> > >
> > > The board provides LGA pads for a wireless module. On the VENTUNO Q
> > > these pads are populated with an NFA725B module featuring the
> > > QCA2066 WiFi/BT combo chip. While implemented as an LGA footprint,
> > > the design is functionally compatible with the M.2 Key E.
> > >
> > > The NFA725B exposes WiFi over PCIe and Bluetooth over a UART.
> > > Both interfaces are gated through the W_DISABLE1# and W_DISABLE2#
> > > signals, as defined by the M.2 specification and handled here via
> > > the pcie-m2 power sequencer.
> > >
> > > This series models the hardware using the existing pwrseq framework
> > > and connector bindings, allowing coordinated PCIe and UART bring-up.
> > >
> > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > ---
> >
> > What is the merge strategy? Do the pwrseq changes depend on first two b=
luetooth
> > patches (I don't think so)? Can they go onto an immutable branch shared=
 with
> > the BT tree?
>
> The pwrseq changes are only a dependency for the Bluetooth changes,
> not the other way around. So yes, they can potentially go separately.

Does the above work for you? Would you prefer to take the Bluetooth
change separately, or would you or Bartosz rather pick up the full
series?

Regards,
Loic
