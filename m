Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390FD3ECBDA
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 07:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395702; cv=pass; b=gh6aAg0QJE2AXh/fZ2stKLrdxf/Poa4KMenXn2D8LwBMw/n1p4pSCgueHlDvwqQEqeJ1JSHLA5Jz74xZnocv3aZQti8jpnsUI6q3ay4i73VoJGRhQf0zSAK6VddiPOZdS3ehUOdAuKzqsnmqdq12AyV4erHU1qFbMqxJlh7vbXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395702; c=relaxed/simple;
	bh=h8c0jyzgi67+tCd3ukwwu6aqwYJd+LcuIZyhRhSGv/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ljhnl3HJSCaZ7+086EepxeqodMaphd5aNzSIboSuuvmqUGaPqkACabUqnumY/GnxXZmurIUgMr7/VnBkvsaPXoGC7gbgfmXmx+efzN4/67T0TTkM1HYIaIrEEiYCszybdYcbI+SpS+4KtocvNRkLr3KmwK6vDsj8LXEKZKIOFfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ie6BG9nl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B1LYow1D; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ie6BG9nl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B1LYow1D"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4j0OZ683097
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 07:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rgncg1X2NqOexcfRvQJKJUsizuXyxT/HxxZeYT2aoFg=; b=Ie6BG9nliLhoxWdy
	55QRXTjafw18UlwduSmAdj2bFtb2v8IvtAWgmje920t7Gli0TgodefhQTDgmSt33
	KNkDwZG31Jr/TOA1xlhuHrfUhUMnsUr01W6pKsWqd808TkkLmNPvU74u7Qel6Szk
	nYCZUtFvlMYCtDkPRBoKMZeLZrWv6ViBDc/dhnkbW5vowKJ2aF4q96x74RCnRPaz
	lprc4fDf3OcRiWPHQqVOiHfLZsIEzhnoV7U4tcvlo1R2KZSOVzfTFH+qaGP5cShT
	2m5KlHreFpPCTnPGk3TPb4eVL0ubqUdyUCADhWnmRCLLn76sd4tBwOuxVYzZqkhF
	/Z4BKQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1d7wgp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 07:41:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2005ce21so322231385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 00:41:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792395699; cv=none;
        d=google.com; s=arc-20260327;
        b=pZYqkZPSW+XtfIj8lafwblIy8enquhXcs281xYZMuzW9+1aEcDvby3cXufR99CIssu
         tBLd7zanXcJbGQe8gyz/OZcxREWW3KsCCkaEcp9Hn/jvSidu8d/T/FS+z97AM/fHJ/bU
         EfhodbLRNkUCizahdlr7eEi0EHF+n6fmRds7jSow6cmv17mkwRRjGxHsOdSiNrfat7rU
         EfQSMWYz+3pryBgwP45p8lTjrVtUNG5UVned92XrQzeZ3/0kE63zPgJA2gWP1+hbnGWl
         9JJHd9rLti/SsEVQs9opWrmrpgkEleZE8xVvgKm7ahkJwMWK/Kkv4lqS/5OxYU5niGm0
         b9Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rgncg1X2NqOexcfRvQJKJUsizuXyxT/HxxZeYT2aoFg=;
        fh=enkWw6l0ApRDp7iwxrIs3erPYz05e5pLvE9PrfCeQGw=;
        b=OeSK1CcyKyatUwYLf8btWDAWamifji9yxr2TvHMhm/oAkq1Nf3wPX7yRSEg8XWOCGu
         IiEiMisgOS4A+gVtWwUZ7sqs7KXC/zeInAZJIJIWT7AQPEx4eZzuaCAj1KA/VHTZYBrp
         BAyv5IX2W9bLqHbO5p3RSBYAuFnGezUerhtd3cNFwjNBdWeweQD5T00m/TnLhUW2ljpe
         twbPlldKEg0emk638EXjU/mEoOYZccFNr8B796cRD1RgSZnzgTCrPs8EjZAl4fAGHNL+
         uhvsIm3BpEqu4WUZJXo60FtLPNdW5u40TU3bJEE/8+uHAiJsFoSnGPgDq7XCyiCGnOIM
         YUpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792395699; x=1793000499; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rgncg1X2NqOexcfRvQJKJUsizuXyxT/HxxZeYT2aoFg=;
        b=B1LYow1DGophj4wq/H/Ya4GJLEfgoZAGGnkiAbwG8ZPcsQJrCyBv9yzL9w7MB9P3TD
         oLZwjPtbqzpnN1GNBakFPqd2BtQ3WteQDgnPm0nhKotwOlzZ2/dctJXYQ47Ix+dy9qQS
         WjNaP5qaSQNgTUdPyO2BfZr4N1VQKC54hed8IJVYb81TpncXbQA2ARHnlDAk7kFbCVnH
         XZi5qybx/DNZieRFG3EfGA/V2/QZ2WeOpblFlf0czNfcHobGLkhPxG2byPYSqie72lJ9
         dNF/MJ783epkJwEVgkXPKybk91UbA1gmKvwdrMV2euI8yuV3vBpqHLuj/Wmg6uzeCoKd
         2eaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792395699; x=1793000499;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rgncg1X2NqOexcfRvQJKJUsizuXyxT/HxxZeYT2aoFg=;
        b=DLkXgINvEggs6kcI9X7ICgexX/GAvwbdDiDzLMfQtf2d59VKJ6y8YBhmJ3UTlHycUb
         H2rEkPJ31ZOSo1JArZMhTQuPKYWF2vQRN0VokJmKwOxM/dCuXTdwSrqRDLzD8lEJF62Q
         I0EBDwIdAtq4sZmYGQA8J3bxJGmbKW7dQW8fhZZIBJ9wp0bXOXtaNAPX3KP7o6JN8uD3
         qWY2Y7VlBWwflGNujW7gg8PztNB+7gD3Re2Zf18pXkmVY5ZBaN3UgR1lnPNn/HTITlZH
         oPDvPd2hSTBE9dLzGEk3C07Wr6nuF8mWhFajNyBUOXDyWl3TpkRocp46FZoRTzicpbko
         Ghjg==
X-Forwarded-Encrypted: i=1; AKwUvBxQ7pvScpZzGUPCZ2OqzqbcJ+avRJ9mUUQekvm3qU8hSlRV1A3mFKKhuLqDj9zIVphUGlCSLHokkU2+xtch@vger.kernel.org
X-Gm-Message-State: AFq9FYICqNcabuOKwcRVx/h6qzmKmefwpICTpMBNh/5W/n4z+0D5+LtW
	FO9pNmv2C0UHXJueuirtbWA18MOPOa4LgbblJodrSngEw6txl7Y8pfMYWkAz6ZXeHh26Xi3F+Uk
	X3We29UQ85vdni0A9uphZctou/HhT2BcMXcxSRNsqODYF27zWOxNwjqwnzD9eEcYEXF62t48mUx
	9Q+DX0+wcs8KJNLNFN8que0vLbtmEbpX7wMbsY4Ust0iA=
X-Gm-Gg: AYBFou3Y7+KOsY+LuswgV1I/mI3WuzY6nk6XNscvX/i8yA+S4iF0tj9cEuvVvUWu3X5
	MCj8IuOu3iv1OJaNrIzqMnKYwBX8xFJNCjAF9QpTJhYUU79Eu7iQBxpAYEu0cmMta3cch4bUATr
	z/lRGp1pPj00KWESjsVIiNg1mO5zePyRakxmuWDpY7OV6wKlsEz55U9QXZr4lTrM1ZkaR2/18Rd
	S/3nv4440/6t4Wtd3v6L5DAtYPSmPe3NW088nuTBbqvI++/WDbCyuApP4It7ES7NYh/D3J7Yi4=
X-Received: by 2002:a05:620a:294e:b0:93f:24e6:403e with SMTP id af79cd13be357-93f29d6fcfdmr1150742985a.54.1792395699195;
        Mon, 19 Oct 2026 00:41:39 -0700 (PDT)
X-Received: by 2002:a05:620a:294e:b0:93f:24e6:403e with SMTP id
 af79cd13be357-93f29d6fcfdmr1150741285a.54.1792395698710; Mon, 19 Oct 2026
 00:41:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261019055109.49922-1-slark_xiao@163.com>
In-Reply-To: <20261019055109.49922-1-slark_xiao@163.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 09:41:27 +0200
X-Gm-Features: AclHuK87o9aE_B39B5wPYtHeWDW3Kp1B7I1cs-f1eftQiD1mAzEwlv18JNhWfQY
Message-ID: <CAFEp6-2XUE4AQPm5hinnRGyrrsHok2ftsFXragiHgDSKKtKWow@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Update the default
 autosuspend_delay_ms as 5000ms
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, jeff.hugo@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzMCBTYWx0ZWRfX2bDiBrsMBrXx
 BdnZiVuw8E8oxdST1I2aDw3YvoPJb8vZHHFHenRKcruik6Og2pocITVsPJU2E4ORRjUEqZwO/+c
 rk8vmFluy4h6gVtvXabE4xF+wwuDORU=
X-Proofpoint-ORIG-GUID: NM20qLy060QA6VBRa97Np9opdwsQiGqO
X-Proofpoint-GUID: NM20qLy060QA6VBRa97Np9opdwsQiGqO
X-Authority-Analysis: v=2.4 cv=K4O3jCWI c=1 sm=1 tr=0 ts=6ad5c9b3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=Byx-y9mGAAAA:8 a=VwQbUJbxAAAA:8
 a=vR8mXinTnKmWltssjH4A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzMCBTYWx0ZWRfX/FNpQvuAXMc+
 gdt03agK5rxgI3ucYKncwS7SKJjgO91lTUWSC/+jyFhTufiwebkB3U/DyuwarYQQbfhvEVPgals
 tko0YPh3qiXh03oRzVMnPbKLY10FWn/H/H6fU1w9849+d9o4PCDAmIBTONNDJOC05JYPLfziEda
 sSUWGpnM6iFauMI+NHnu+RbO6+jBWdMo7VVxMBboIhh5c2fKAUrF0DDt3p+umyErR9Z1Kw7ew10
 fpsrSted38ft2iMX2c+ZjMCjEp7KjIocE3T5chC9XUtW2fp9lZ3C7EQ+XAYAXFHsuSKmFLk/rKf
 eAlbQPkZMyl+PJLstuOcbBaojEy9nvCYdo82ye/XtOZe5oI6DQVLV7q9op2qXv19AlkTredBjVF
 lQhFW1zhKkrPu2sHSP/DZoV/H/JQCQx/QSSrUICcUrLucDGiPKKgCZCXN3yAInnHxL2qk2+eRLg
 meLEMqmvwIoikq7Pnfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190030

On Mon, Oct 19, 2026 at 7:52=E2=80=AFAM Slark Xiao <slark_xiao@163.com> wro=
te:
>
> For some MHI devices in some specific scenario, the default value
> of autosuspend_delay_ms may not enough to handle last wake event.
> This may lead to some unexpected problems.
>
> Refer to the Qualcomm's Windows settings and we checked this with
> Quaclomm over case, Qualcomm recommend us to set this as 5000ms.

Qualcomm

> Qualcomm also suggests us to update this for all MHI devices.
> Since this setting has affected some existed kernel versions, it's
> better to be applied to stable version.

This looks more like a workaround than a proper fix. It would be
helpful to describe the underlying issue, including the timing and
sequence of events that make this necessary. In principle, either the
device can be suspended at that point or it cannot. Relying on a
delayed suspend feels fragile and may end up masking the real problem.

>
> Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime PM")
> Cc: stable@vger.kernel.org
> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pc=
i_generic.c
> index 7193a384cca4..40735beb46cb 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -1483,7 +1483,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, cons=
t struct pci_device_id *id)
>
>         /* Allow runtime suspend only if both PME from D3Hot and M3 are s=
upported */
>         if (pci_pme_capable(pdev, PCI_D3hot) && !(info->no_m3)) {
> -               pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
> +               pm_runtime_set_autosuspend_delay(&pdev->dev, 5000);
>                 pm_runtime_use_autosuspend(&pdev->dev);
>                 pm_runtime_mark_last_busy(&pdev->dev);
>                 pm_runtime_put_noidle(&pdev->dev);
> --
> 2.53.0
>
