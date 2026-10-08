Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289B74D4886
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 15:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791474121; cv=pass; b=Ye1GdRH7we2Y/BQUVX+T2QmiC5dVpfHrG/4JYG8rF/HWFZ0KQQcimqx33IiWhN1NJv6gAQwhZikAqz/gTudslQCwtpljdkgE7UJnVvYIm9LsidN+ryQZKcUOYUZiDpQvnplA4mtZ/LtE1xTACpis+cLX4tCtWHc1J/33ZGtmgFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791474121; c=relaxed/simple;
	bh=t20Ga3x8bXqC2bOb7ons2kgZbLzv9IG8A7SxB1EW40M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Djnj+iz1BgWttErS63wgRIyb2ufcVd6KcEyKMWwtvnv+LHB4cAEmbqrm13FV34ZtxvpQ6kgAEdggK1rFhu/G4mSXLtPU23yOOh8Vo9++yDx4WWruV2jcZ3qwcTZ7y6f2pfSiM2zVMJsNnHKjzrgD7P+qsH3UtZTCNz95ur1mz00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OEgbYTy7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DrD6cYxL; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OEgbYTy7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DrD6cYxL"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVh9H2124112
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 15:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BjM/nY2k93xH8zJGRXcEc24X+zL/pJP08AQxr27mCe8=; b=OEgbYTy710WUPuNO
	RjKY3GPUnKrdQ4I1jXmsmAx1LqtadDZ/Nx6f2EgiEfWEkq3cgpv2/VuROLQiQXJk
	M/6lnZdnw5bG5aX8GyMSWjQtQ7tRPQ8A5tDg30a5gus4fUrwMR38IlBC/WZy6FW7
	3rZYVfCJfmgKB2kAR2VLS253RERTM3jWFTgr83vnvGMpUNrGPMgfzOFWqXo8uXuJ
	TJWlctt4JyOKzbTfu/fcjd4UbVEEsFLCcuytkWiN8u8yktcBcqg3zm5xKmimTU7p
	Z0Shlg4TvAS53Bp2U63xEuo4qjs62+85idT0rSGYWuZY5OFXamARyox3NiKh2YcO
	MP4ZTA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3bhtd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 15:41:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a3f673221so1477423985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 08:41:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791474118; cv=none;
        d=google.com; s=arc-20260327;
        b=ooN5NUfm7ocTlWDFAmrMVrXTCEFqIri7TlJAnt6N0JV55i3gXH91V5bRVTD6yRImsj
         6Ffw5NSyv8Nd5gDZ+uzz6YrctWYYVuw7bK/EmfAhqtFKtefBYX84rE80Y0mgUwCNV5JD
         AOmg7JDEkpsqhrcjdorvh8N7yRj984PcPIyMJy2V4GrA9pCzG4ac0/ONL5549ZF3l1gm
         oiTm4aWkY76dtE7+S6uHKzYldMGHGP8ghnECMRTcvQzXG6ja9QNee0Yxhv8qEll13KMM
         Qw/xHAB0CLAhAgvouryizJPQJvdQ5w7KIP3XRRl3JmeSfc2IO7214cAu84kSuUyjJac0
         WMIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BjM/nY2k93xH8zJGRXcEc24X+zL/pJP08AQxr27mCe8=;
        fh=0o1ZBqM/za2uqHWU+SlcI/Q/y0siio5cFdSea1bsnrQ=;
        b=NJYN1GxiMrx0R81d/JL18eV5w6qvF+p8/ufIX8zCOnojCg3M8XPS+erH3Ny3a74DZS
         /xWmXLr3C88krGQ4nY+d+85d6AaAg+Iu8P756ywMRaqKUBYEcaVHjFhS85wfAP9R7mvL
         BZPcMK6NaAaSXH48hrkZOBG7AsuRBnuJ6ohII3B4uyHncc1jvZBMgPDVFjAGgdhb5RJg
         ddxyA+bx8s3vmCpfiuzZTXvIU4EcvfPYXJsPu2LFXMVc4AYsgujUMrCHCMWtXnFgWBDn
         85Bvrz+BI6X3hb70rkAdEiTZF8D6W32t6LarFVza3coDxW8DhkgLfiwwe4ZiYb78uS7w
         2eNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791474118; x=1792078918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BjM/nY2k93xH8zJGRXcEc24X+zL/pJP08AQxr27mCe8=;
        b=DrD6cYxL+1jq8/mNm1rLaq64Q74i7jWKAR1qNqONUT4WEBW8Fu5RUkGjpg/AgXotCm
         ghgQ8YtzSiloTxNOxkTHgZcHmMHmjsFp/yXMvPt6VZqxMC9GG8AJIIlElPCTS0A6R+k3
         Ovh0Fk8IsRLVWhb4E1fccgoarKUINQbKA9k1tcR2UbpEUsz0F2hm5qSxEvRrE8ACr3l6
         8+OT4L8002tFIXVFtMt1ZTp4X6bOv2UnZ9ktiCYDT2l5FrbadYpeqrNl3PakckjxeUCH
         E3IFIAwyuHNiuK30jhVuC81tX68j6pPDTMLYQPd6rcAkWcsGwrKvp8MdXpfHP0wd9Hpa
         VFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791474118; x=1792078918;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BjM/nY2k93xH8zJGRXcEc24X+zL/pJP08AQxr27mCe8=;
        b=YURzfEcPwmGVvvNNle8bBXrPBp3Ts9khJSiyOOIE/Mls+0GGvWsPgGuF7BrUe+o28Q
         KS5XZRdCtkqbhQhyhgjw15CLOfaUn8osrInN7s5Te8JD1VvnAs7xWvCoIFllftDQoYIS
         Ysl1ZDTIdXowxc8Vlm3sFazfnKu4HjauaggwjC8BX18pouVCVMpYTaW71qlV+1nCYKlT
         89TuBB92rpjNcEW5Vq9/b7b2rnyscK01BEkdqj6LR2RidJGNNF49t+5kBkvaT/5QcDHI
         9dEIA4dtxTUizS3cgYND5riaXSV8nykDdtaXpgqIQJTjeC9AEu6Ca77zWpSUUknuF6U7
         ErCQ==
X-Forwarded-Encrypted: i=1; AKwUvByZ1WwIflWIejukof0pD7EpTkplCMjdCEV5M+sM2mO5cBHsNCV0jGHR35nxR3oay0bC0sYCmU56adky99hJ@vger.kernel.org
X-Gm-Message-State: AFuF++ky5EqPre4xvYIFhaol0giJL+gDodMlSnC7GDEpmAr0id4wVVZ5
	LxlzvZineSoZhoa2qHcPpp3mYZSvTty04m2HISoKSxnIhYDO0zFxIaVrfGAi133pyd9ghdjaFzs
	icgWnbXwzFK64Var9UbQRVemadmiExdT0+4lrz3Ho8UKLVdCVpsoN4kdDhF69i4t8wwBAI1ClvG
	MeWEUEVe7Ezy4Iqe8Oom5GL3RdCq3lAsa3ZpxOIR2VcIk=
X-Gm-Gg: AYBFou2VSxA4K72wVStrUdQg3vFsH8OvnrQ/dQErNNcO/v474eBQn9LCHr5djL96FT7
	Et9M0i7NFPLBqY3C6V9dMG6bJk2cuUxoaA2Tl4EYRZ5/duC67xk0h1mwjmD5/kJIc5P+JIMuMDW
	3CSpKvkEy6FF+SUVNZZkS/Tx/54m7FVmpx5MglUaa5hMWB74UqGJfPZstOvxtPyhe+V3H2Vi9BY
	Yp9nHKdUdchkHacKN9KW7+v3tet51rwHYuOwzaZOr8TeFkuEaUdKGzTiQ7iSUZ+YRl2xfVM9Q0=
X-Received: by 2002:a05:620a:470b:b0:93c:c96c:a592 with SMTP id af79cd13be357-93e9b7753ebmr1062747785a.36.1791474118260;
        Thu, 08 Oct 2026 08:41:58 -0700 (PDT)
X-Received: by 2002:a05:620a:470b:b0:93c:c96c:a592 with SMTP id
 af79cd13be357-93e9b7753ebmr1062733885a.36.1791474116529; Thu, 08 Oct 2026
 08:41:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004-cci-imp-v1-0-227d12cb4829@oss.qualcomm.com>
 <20261004-cci-imp-v1-2-227d12cb4829@oss.qualcomm.com> <asS-ppSQ3zHjjVBs@zenone.zhora.eu>
In-Reply-To: <asS-ppSQ3zHjjVBs@zenone.zhora.eu>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 17:41:45 +0200
X-Gm-Features: AclHuK9ctZbMWTN3PEzNG4CbIi1vmDGf5VZHwy1UaF8tqiYzoG87hLMVrDUMXo8
Message-ID: <CAFEp6-0nLqJ2BxzALKoGzTYw+dgzrvAB9BgvRVtNMZ10yXsXnQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] i2c: qcom-cci: Handle and report queue
 overflow/underflow interrupts
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 01vjCClEIXHg12--zeLsWiVC30hVtkts
X-Authority-Analysis: v=2.4 cv=QOz91QLL c=1 sm=1 tr=0 ts=6ac7b9c6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=eS36LTtrxdnvZwTP-pUA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA2MiBTYWx0ZWRfX2oZSGB268mm8
 wwj8AzUL2PLXLeFioHIFcR9k1tQ7k7wH1CNGsYoord/WsLUkRf/9AZwPdriKQOrDOXrXnj3nbjB
 bSjGgSnhlXchFtr2W2n/RgHmYkat/WE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA2MiBTYWx0ZWRfXwggjh/gNlACd
 /TBNUrkeK8vGHyR8fBKHgIJRgKENYtcquure+OK4Voal9+/6OZ8sHy25rRe2ewe0RIMOFl9v6MH
 OYlvPP/1jT17G0pbkBxQ1xLTkx0Fr0oD6zz4oPwQVc3opTJsG2prfiiApnNyFv8aTZnzJ75H6WG
 mBPZHrCuCpd2dc8vXssvBo6IPh6ZguyxE2MjGdrGRVaf5cY8ftQ+IJ2XvjCRftbS4N/2wm25hrV
 VxN9uO0y35F1CycDhEiyuOI2GwdwwhS4Lejw6EwTnGPCmrng8yPP9aGfSyWndhHHSR5NwSWcxei
 P+L+PP31I4RLtKnXHXKJeMcn5mkEx83Pqtwoa+W6Oyf25z5ivqVEHwUjZlcx2xc0ZLYvnSa9r+O
 dybHQnx+FxLPFzQAaoaEpvs5F/+JEtyl2ROs2FLXozqeMKSt/EVytc52jhEyySml1ZYlhebv1H/
 FJVXD+BDDvoMmBu5LXg==
X-Proofpoint-ORIG-GUID: 01vjCClEIXHg12--zeLsWiVC30hVtkts
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080062

On Tue, Oct 6, 2026 at 11:28=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org> =
wrote:
>
> Hi Loic,
>
> ...
>
> >       if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M0_Q0Q1_HALT_ACK)) {
> > -             reset =3D CCI_RESET_CMD_M0_MASK;
> > +             reset |=3D CCI_RESET_CMD_M0_MASK;
> >               ret =3D IRQ_HANDLED;
> >       }
> >
> >       if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M1_Q0Q1_HALT_ACK)) {
> > -             reset =3D CCI_RESET_CMD_M1_MASK;
> > +             reset |=3D CCI_RESET_CMD_M1_MASK;
>
> these changes are independent from the patch you sent. Can you
> move them to another patch? Probably this part can also be
> considered as a fix and if so it can be sent separately. Right?

Indeed, I've just been lazy on that point. I will submit it as a separate f=
ix.

Thanks,
Loic
