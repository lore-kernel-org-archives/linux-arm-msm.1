Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A22C362133
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 06:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786516547; cv=pass; b=cFvfElCkphnwuiseduPYmRa6qq8CFd3DJoWI/8Dw3u3th1jCwKJhK3LAuKC+LLvadHaCI/cbXkGSPfEFQSePZs19pW9TBle13ctoa30+H5WEy2xj7F6cCBP2e0PRfLmqgUojcSf/1QclcRBZ22X/E9yVi2wFkSHRrSZ5tt4Z3rk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786516547; c=relaxed/simple;
	bh=UKFfyAxfc2AHZa+zZoe8RHh8COU04xbUZ9VKCkbn7nU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bSum5ntCpb3iTY7WFqBLQCWqy8nmkJNvVEdD7buh46KpH3d5Nmv4LRFx9/Gyw+qULh1pExHIFeY9uOMRWOGlfTx7B5C40V6J78kQ53mavlGAgFMvECaWbtKG1OoMY7AzEJUiIaOSq1BcMvBP3gu0YVPZkYvk4vwJRfUN6fyQ1ZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VH/t6QOD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iDCfHh4x; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VH/t6QOD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iDCfHh4x"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C626fb2593484
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 06:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BD6IIVZKV4c5mmZkoHVMchn1BaeZqhuYx+TmbD5+G58=; b=VH/t6QODNBBEPcrw
	aJzTYDSeEGW4Ia8c3WO7HTBlkJrJL7dkJ6kju0a1WUULqt/dGhMUgmOBr7Eci3u0
	pzj+hyXhl1r1xddN7LDeLAAq8w1/DNAKhd/CbVksHrqs2LzE4yMaXNevJdeE3vkq
	GBTuWV9Esd+EviUuuqavIFUNjocdLt0GK9Wn3V0R4k0zDQheI4OSvxKTacLHoZz+
	Gi+3OJ+I7Nt3xOpvor6hJOymnXNDqciWxXJvhKnTIFeSN40GG54nAAM9o5P7XVoe
	UREt3jBfEn45gVCTWwyMTwj5bsGO0+S9RO4XUxqNDpEtQyMVtO8w8Q8HTH50R0x8
	YQq2fQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g08jrjevd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 06:35:45 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ef8249f871so6170226d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 23:35:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786516544; cv=none;
        d=google.com; s=arc-20260327;
        b=kdet/zoTxWQ9pNbwvNhwTpWOKjVGaIE2sE7wJPXgcB6co+hH2FPYfh57gUs13CmAzU
         WFga6TJCjpZrHpfO6fc89ycVBINZyOcwTDM8fIbkwIQG/ZnfASisFWq4JckjZ4oohp3+
         Q5UST7RgQdi90gcJLBqzEttpZTxqKJQnIHUmO52K1xQ3k7oGXeX2o415rDYto6rjBS7D
         2DAvL2ktSYUZOzBr+dS1e4h7AFOkBwA/k7Q5zn2/sLirtQrtCPk7UiYw9hpj8XO9wPlU
         rGFUBengYewEweDVKlJE4qgMGLFQrNSWWWKljTmmPqJTCwKFx7LoSPJoBHi0MtTjqSw7
         x6DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BD6IIVZKV4c5mmZkoHVMchn1BaeZqhuYx+TmbD5+G58=;
        fh=oj9PcfnL6UC9iEsPS3LpKtpjXCj2LnsFLSFgTVyRJuU=;
        b=CzpftTIP4z/J4kZVpWj473c9TWA8bYMuOK2A1GmnYg3ToqE/kAJte46dl8BwRdHVAY
         hHpsM7ftU0EHLjOl7t40tstXyyqiTg2mYalHQGV0uu2ier4drBGPGfZsNsqZ3yZX1Stq
         LOn4PlSrWR4GZts7lb9+ClXNNTn6trGMy8byy0i2OSDQVJuvl4yifesJsE1Iy8DWYNse
         QgMRo1pLqUkhMgKX3RsP2p+tWZ0yZ9tmr9p0MGR/4B6tapha3Qd/D/XrA1j/9Z2GkrmG
         IAaBS7Jakys+sg1eH5zwLhnQU7bD/Yl/kgYxVYqXecDsz7iJbPj63W8jE/PSawiwyHzT
         +GQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786516544; x=1787121344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BD6IIVZKV4c5mmZkoHVMchn1BaeZqhuYx+TmbD5+G58=;
        b=iDCfHh4xSfOrwYELaSa6soC98DejVv9rg78mng5t1Jo4o/P3qTu/8j9RfifYqnT6Gn
         bOvZG8zIN9bZ5qYz9H1GQsk4bGJvxdiznVIdw3EYvExsciiZ5Hs3gJp4WkCgijRvC5lr
         VVm5pH5SSukOCuTgPMjuOzrEr286C4b+dvfokRB8sj9i9Bi7s6/Z/OUUhNrhW+SxGjdu
         lYitwIMdVJCEOwDeOlbrwsrZs8710vTMyDE5iu/ETGFaMW9SxELSOo6PEkRb4NjBtI6b
         7qkS9kyO3fRMZdkMzG0fejbhhrX0NJWHGY47VwOFaK1Bz8PIS3IZAEtAwzLrXSWn9oKT
         xqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786516544; x=1787121344;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BD6IIVZKV4c5mmZkoHVMchn1BaeZqhuYx+TmbD5+G58=;
        b=nIPxjVPwhM1j6wyMVXAaEXM0GmEvTIsLr2qoRee81TzIs7bFPS0LRWqWQRSLShSsK8
         RUBbMPO3r4GHntE/guRtx61ll9UCND/SIn8moMOrgS5/WWXTIgfl1YVvmTvVz1AbhdOa
         4TzYQgNpDFSZN3+AXOnEUf7suYH1X/0IEZ+zXYcyQlESx/l5XHS7g4YkNMChvZkEymOF
         GMh9feeXTpNrTp5hrcE8XxV0T9I8LSjhPg62c+7VIda2Sde8ALsSt6UsdmVGgVILrMFS
         R98McL2nw5UmZXgo3yxo1VxSVdRzzpnLnJEA3RCE4XnplRG7MqDzQL5Q0GCsIXHUSpcv
         qsRQ==
X-Forwarded-Encrypted: i=1; AHgh+RqAu/TtIJqLFqj6+0S842XDZwvQuHZ1yW7u02my3yEd87hmRSfKmkK9BqBQLHLx/iM4owf40Jd1C/yu5iDD@vger.kernel.org
X-Gm-Message-State: AOJu0YxyQtr2Y816m/wdP34avMmgtgV9JKP5MsjKyJWPrDOA35X4h62p
	B5icxqIqGWOhcIKY3fHp3HcAqqNOsEBV1SV1cUQwgNrjjtjQOOoMI0iH/lCE9GB+3m24tpmN63U
	3Pk+f1aCfF9eW7xQCXHnHbr/x//S3C7lu8LIGmD5hHCECOWUEpcGgsKAQlYmQxgaOajBwiYvsan
	OlnEqK6+zKXpe/Q5yJvaL2GQG9+73C1Le6HCTD9W0fsH4=
X-Gm-Gg: AR+sD11eihkAB5BYFFw7W2UECfnKDimuQtpW9Ma9fpowB0wJ1tIg783xtW/M5EZFJvn
	qQjVbscEUoaCwsZI732PaXZfQCuGnTMCX0Rfh8167IxLH+hcSl48vtRZRtZVn/gkp5HMqNKbJD3
	qfbdyRfvbGe4HhE/uylsg3bogPy3PRaWFFx9DUb2um/eY1mdlnNZw2hq/LGcQeWkvrhxqiugeDO
	bob84RVAuqh7LeYyYSfrscb+g341xfjADSJLoCbJwR377dIAHiEKr9CDcUm5qTipYl/IZR082+x
X-Received: by 2002:ad4:5d63:0:b0:8f0:367c:eb80 with SMTP id 6a1803df08f44-90a7001ad5cmr21931186d6.25.1786516544086;
        Tue, 11 Aug 2026 23:35:44 -0700 (PDT)
X-Received: by 2002:ad4:5d63:0:b0:8f0:367c:eb80 with SMTP id
 6a1803df08f44-90a7001ad5cmr21931006d6.25.1786516543692; Tue, 11 Aug 2026
 23:35:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807215042.2714442-1-peter.hunt@opengear.com> <20260807215042.2714442-3-peter.hunt@opengear.com>
In-Reply-To: <20260807215042.2714442-3-peter.hunt@opengear.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 08:35:32 +0200
X-Gm-Features: AUfX_mxzpLAFftiMhVSPoQ8lEsOl7VWetlmRHPSqUPRYAGRJNBVcPAJAWQl7h3k
Message-ID: <CAFEp6-1U_s2QshhUrT5nVhDubJPt3YGHuprDbj8=ps7xJgyP7Q@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/3] bus: mhi: host: pci_generic: enumerate
 IP_CTRL channel for Sierra EM919x/EM929x
To: Peter Hunt <peter.hunt@opengear.com>
Cc: ryazanov.s.a@gmail.com, mani@kernel.org, johannes@sipsolutions.net,
        netdev@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: iZQYbPZLd9L0CjNIcBqWLwRgmDWxlvem
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA1MCBTYWx0ZWRfX6H9sHwPppIUt
 f1xhPzBv02jd5mqkRkd4QnFlAVOnwL51INrBlJDucMrAU1DJCzzTO2oLXPwViGNxq5gaF4SOXC9
 h8gDYzcedOdVPTcjDU4GH3h7bCGHp5o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA1MCBTYWx0ZWRfX2j8/+QCiTsfE
 dxIpEIYNefIrloH4BMaspfdrY9foQVnFcn90wDU+mUxegB88CfFcFFRnveiN+hHyPDaFcuIMMdI
 8+D8dtF/yMowDl4EZgqcrbhukd54aFFeCM/Jg7ga/wu9qM2qELUAzNqXH7R9fek1ViKgFS460Gu
 UP50q7tlBqzY3EH3qtdCTS6elH21ZjpgWOsqLhUaGgVRxWluJOqaBXOHJryyfqUklMck+f8l0/B
 Fg7jooNhUZlhod6t70+rNXQH3R5IvJ5NNJdpI70dctRJG2eu3cUYKqjdVyUICdVTRsCKRJ6aFLq
 f6lDHsELSGZ2luiXJdQWV00pzwAXGk8SQTiedqRrmWODA6AE7lMXBZ9Cy/OC4lTnYmrU/2xCrtj
 0v6PQuj0/n2BPwQ1jc5GhuLYE8YBMwyd2sp6K6gv3Rpt/trX8sH8FAE/AXaZFrRdX/f2/CQODOK
 DRr/bb+0Z3eMt71ZNaw==
X-Authority-Analysis: v=2.4 cv=Z7Dc2nRA c=1 sm=1 tr=0 ts=6a7c1441 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=t2vznHeBAAAA:8 a=EUspDBNiAAAA:8
 a=WViMzPdn84buqVz0jb4A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=V_BghkRpYkFyHJIZkSH6:22
X-Proofpoint-ORIG-GUID: iZQYbPZLd9L0CjNIcBqWLwRgmDWxlvem
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120050

On Fri, Aug 7, 2026 at 11:51=E2=80=AFPM Peter Hunt <peter.hunt@opengear.com=
> wrote:
>
> IP_CTRL is a standard Qualcomm MHI control channel (channels 18/19) that
> carries the host serial control lines (DTR/RTS) to the modem; it is not
> Sierra-specific. It was not enumerated for any device in pci_generic, so
> the host had no way to drive those signals.
>
> Enumerate it in the Sierra em919x channel config (shared by the EM919x
> and EM929x) using the control event ring. This is the device the change
> was tested against; other Qualcomm modem configs that expose IP_CTRL can
> enable it the same way, since the mhi_wwan_ctrl DTR support that consumes
> it is device-agnostic and binds purely by channel name.
>
> Signed-off-by: Peter Hunt <peter.hunt@opengear.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/bus/mhi/host/pci_generic.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pc=
i_generic.c
> index 0d0d9c7ffa4b..ba47dd153837 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -728,6 +728,8 @@ static const struct mhi_channel_config mhi_sierra_em9=
19x_channels[] =3D {
>         MHI_CHANNEL_CONFIG_DL(13, "MBIM", 128, 0),
>         MHI_CHANNEL_CONFIG_UL(14, "QMI", 32, 0),
>         MHI_CHANNEL_CONFIG_DL(15, "QMI", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(18, "IP_CTRL", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(19, "IP_CTRL", 32, 0),
>         MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
>         MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
>         MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 512, 1),
> --
> 2.43.0
>
