Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F394399E5
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 12:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788437589; cv=pass; b=JMfr4qn2LZcwOl0n17dLK5drUwKxPHwsLRtTtQ8DB5p5+2dcPwhKIwaB19+I3KPe3ueQnTn2zhL8Ui6Uh/KlQezlmtq7ltoM5tezYAmJYjRAVWhH+4+Lj933blHxGsmBNh3gnye7GNLhGKmL00Ie/At3Z/kXdMavtVXB3IoqmuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788437589; c=relaxed/simple;
	bh=rCAsFqPyObwtdPuK7mooJ6bECLcZM9KoaNHChmdp/NQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=buiHOkQrnV0+I3bdIuiD1yFwKOGB8yTuVjAE4ZBccWiQxRcJkS0WAc+rsyKYtefpW3cs/W9uTOiwXgCTqBXjMYAvSBafAxw5EHWY7oYHfS7+vjJcGhLWm1hnxQQBsylLV84oHqu34snzC6T0qM9n15U3sqT4l8NqvtWn0a22YH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SiPv4OR+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W6pURTlZ; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SiPv4OR+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W6pURTlZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHRG03852489
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 12:13:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rCAsFqPyObwtdPuK7mooJ6bECLcZM9KoaNHChmdp/NQ=; b=SiPv4OR+84hEgH6l
	RPDmsXUNwVS4Vz7tInAaqyOFtAWWmW/Mq53+MMoW+ppSEyHti73UEj+894ftwZTL
	ZQdL2iCEsYxQ3wfF5+F4ZNAQfJ38Qp3rlb7p5uSzige/fReEKt9tMyc4ICm8s80M
	GOXJ0gUS9XtKZpZ0JYlmIc90m7k+5RoS5AE2lZ8hUPRTnU339LhruDV2SCfAuURo
	QhX3fLJjP+DifKMlYSPEWu4gfqkcPsGf6QESbpJD1vLRl03dphAR8fUY8TGBqvdC
	JwZZRlXUo4mdUzcBS8cwxEU4pwTtxspFVkB6Ay9QpG1UlyOhTOsJqnxfWXjluawH
	3hW3kQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf51m0yt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 12:13:06 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e99ff505c2so2963560a34.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 05:13:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788437586; cv=none;
        d=google.com; s=arc-20260327;
        b=W3renMVA7Duem2Mw/mcSDyQMlRo+QNk/xzNrfSak2c9mv2GRHP2l8tUX9mrrbFneRx
         AaSOTSQhQkuxVrwTbvkzcCZHhGoYdp44uGDE45CDw13am441U8IdaB1w9X0gbQuHcj2k
         ehU9GKPoqWVPXSoogLAdkVisbiYs2loTlofMWmc+aBw3ZU0oP9mDDUPL6xGz2wmwWTEK
         nK5ambcasuTpjZRjsf8LkvPZqaEr1XHY2v2yH4x7ee8plIccRAIwpIDoPdHL6iUI8Mbl
         McyMz4wws3ioKNvuYsCAeXjG/8fxf1XmqaDIM4yVgJUcIssEJgtPcPP+RNbU7FdeAkXO
         pbYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rCAsFqPyObwtdPuK7mooJ6bECLcZM9KoaNHChmdp/NQ=;
        fh=SPZAnBZrwmdtY0y/0rXbR573J2GI1PuUoE+7JbeZ64w=;
        b=HW/016qh+TwH9R2JK4efLmeg9Me7evTNxOd0krG0FMAEyorYT2gg2rHY/JdyrrHaIk
         vSXMCfWbcjHHLizLBFe7gjOhDWthnb3DY1o5WPCMp9R3+iAfZlmbzTvZ6xXjba00RDt8
         ha9SED9V8xW7P6nqC3Or2uxwDtGSTYkwWwUCxT8uWlBv2kPStEsiD7oX25vaajUSOR5m
         Od5G+PnCoMK9dHvP9aUtKimpNMospkomPpgePSjwZhEOyPC6sBWWvneN32egP0XnDGL/
         r1dRleoh/WQsiWopChnWgk8MdhSSSK/J1KnVhllCF0z/pRottOf88MOmkUwb6+ocMUp+
         PmsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788437586; x=1789042386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rCAsFqPyObwtdPuK7mooJ6bECLcZM9KoaNHChmdp/NQ=;
        b=W6pURTlZf3b3uJnaOP/MUFdsMve15giipOaMoCfjg1O6lzZJQ/YCeKojhv9QxjL41I
         9gM06nDWiZQx3xgTlpSbqmGDdq6GOvE070ckMjfg2Tfrh1JnNVKH1mmkw7vr/wgOhiGz
         aIRCyiBPFWkKsZlCJBNCa1bYXcPq2ECdJMSO2A5IpXovtdwxLq/2bDdFl7YpxRi/XOJc
         PZuFYdI4pAM6eY9k4SQ330CJeGTKse3scqH8B8S7eJr+OvPdm2HNfYKwjLOHmX/F8dZM
         WjG/8kG2Va3rNCnKHTnQh6gV69+K4VIEEfqvBq0I17Q9ciXjgOqlIKGReJfssqnknWr3
         qc8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788437586; x=1789042386;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rCAsFqPyObwtdPuK7mooJ6bECLcZM9KoaNHChmdp/NQ=;
        b=VcEqI/gpzBKNUYV59+ww2EKtBqKoOH7YZY4/smx13pjJ/wRWd/VC4I7gN8ri8cthUO
         KfFdnFvpRlfQEVlhNHh/eHEsDUlDgGZZH+0HRI7Ef5AMhTknDNPUNpr6kd90puD56UmA
         UcorlfQSmz6oAHlzvo+z8w4ZBSQmlZJq+jEfooCz852T3QceqO98uq2CaYRNTzv3I7yS
         vA4l68YVSm3J9P5k5gLT5nrOdAR6WdkpkuPPgUFIguIUPn5PMP2WnSWmNcFFMfLS+XyP
         XBNX1muxxzW6kZ6iNNu477i81bHsWjLitJgSsIQIVsGbdPO2awmhjKh4ffgGEaO1Jhc0
         ju3g==
X-Forwarded-Encrypted: i=1; AKwUvBxjF+o7B0++2WeexzOfHH6da0BhS1YcAuKc3Ymq0e7aiNQAlOLjZuophAlxIohvxuQ4FcaRYVZHPQdgd3JL@vger.kernel.org
X-Gm-Message-State: AFuF++kSaShLKixltPScgiyZmYtn/4/wcH/OZG7g48AYInXuvGHMW4gG
	3drmUuBh18sygVi54Mhds/bu+V2gttvyVbGB5Cknx+h3NbaK4gDPmR05e3otK9LAlTyQpY+3XEQ
	rKLc0CON0i+YQnNb2squjw1Lx4sllMJFdNfpr9CpOMNoCBWWphwG8KOExGKiRxn5gSgTUyXbrSX
	iTLjnWKsf/c1UU0Q1YrOeA9qgCwniKKk271OHN/XK1z1o=
X-Gm-Gg: AYBFou3IGreg1FlJlGLLu73kwjEFB7gkhYY+Jj1Q6gc2VrPek1MHIXc1mp3l2eLZbPh
	poB+A2MbSsWzp6tax2KiOykkymMCJjkmJNfbDTHmcVgBNNp2QT6YMoUIZ33XU9MLVXmmg7s4pm6
	MtEGkc3Ci13RZpVyfHqPfn7mV+5WjulJCTObszU1n5RG1N1PQGm+Vh3B+FHQ==
X-Received: by 2002:a05:6820:2d08:b0:6a3:92f8:96ab with SMTP id 006d021491bc7-6b47ecce067mr9305164eaf.1.1788437586037;
        Thu, 03 Sep 2026 05:13:06 -0700 (PDT)
X-Received: by 2002:a05:6820:2d08:b0:6a3:92f8:96ab with SMTP id
 006d021491bc7-6b47ecce067mr9305119eaf.1.1788437585657; Thu, 03 Sep 2026
 05:13:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-skip_suspend-v1-1-ba2d877e22b1@oss.qualcomm.com> <5bsz2arpufrnbglizghlr3ztkjeqhvsc5pr2qmgmkhj3n6l6ia@atgkmc2igd7r>
In-Reply-To: <5bsz2arpufrnbglizghlr3ztkjeqhvsc5pr2qmgmkhj3n6l6ia@atgkmc2igd7r>
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 17:42:53 +0530
X-Gm-Features: AcwNN1Xjdf69rGqtBAINnrwGBccYKfXH5cndtne3yrRdPJSmPRATyngrRU3ToFs
Message-ID: <CAMyL0qOSUzMjqMgVuhbHAT3oCfAQ_n2mtq+9iU=ZDC=y_n438w@mail.gmail.com>
Subject: Re: [PATCH] PCI: qcom: Skip system suspend/resume for
 firmware-managed PCIe
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Rama Krishna <rama.krishna@oss.qualcomm.com>,
        Rashmi A N <ayiluri.rashmi@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: HpDODHOPiIr_Gnq32xaF71Eb1ImuaWct
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwNiBTYWx0ZWRfX87svIgli2lMf
 sW78eKdXUx+QlbnKnyrmZH0iERUN7AK+ww6YyQrz3A+WKAq+ND+xaN8fDdCMnvqATfVKFjMDtmm
 KH6a2VS19aTC+mMSvu3r7G+k6lzg87cDdAViUS0/vFQtbg9qOmPe4452hr0v3Qt3Kwst70XaqaG
 xdefw2KG8r+7dvdZ9smYDiCk0fAYp3zYp4KwcRt9zrWVlN+vS7x0RVqwHSCbeRuBYsJfADK5Cja
 qe2xt1+VtuwwYzdovciACHFAstwUguI2ZkhCsRVevOvBN8700V23LQBXHCREcO7p+hpSSV9uZ3w
 3TepTWPyJUGWnx0+mneuPSiG//BJ8P8ql4bh5ePPKP54Z0mFRUIKcVAGOmHpiylrKf1sZytvZSv
 cbe4zIBbixiHUW28tO4y6PVu0XUBG6Un2xgHAquuIRMoDchFtM7e6J2Is/4/CVoQJwoXdILdjXS
 32DPdlWAUGArFozfneQ==
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=6a996452 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=Nm-cwpUMS-KaPtIAedgA:9
 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwNiBTYWx0ZWRfX7kSkLbYu4ExY
 pLvApmltNKwSPmP9y9wWS4ycd9F1I5upIoS3NrS6yApcpzzuqwCTeAqjdOv3AcT8PCK9cpnuz02
 ao00EMn+CAMCzyrpu+QA69Ia8UyWIGQ=
X-Proofpoint-ORIG-GUID: HpDODHOPiIr_Gnq32xaF71Eb1ImuaWct
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030106

On Thu, Sep 3, 2026 at 5:05=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.o=
rg> wrote:
>
> On Mon, Aug 31, 2026 at 07:07:02PM +0530, Mrinmay Sarkar wrote:
> > For firmware-managed PCIe controllers, all resources, including clocks,
> > regulators, resets, PHYs and link state, are owned and managed by
> > firmware. The host driver must not attempt to manage these resources
> > during system suspend or resume.
> >
> > Skip the suspend and resume operations for firmware-managed controllers=
.
> > The associated power domain transitions are handled independently by th=
e
> > genpd framework through its own system suspend/resume callbacks, so no
> > explicit action is required by the PCIe driver.
> >
>
> What about the D3Cold sequence like broadcasting PME_Turn_Off? Is it also
> handled by the fw?
>
> - Mani

Thanks, Mani for the review.
Yes. The firmware sends PME_Turn_Off as part of its port
deinitialization flow and
waits for the link to enter L2/L3 Ready before powering down the controller=
.

-Mrinmay
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
