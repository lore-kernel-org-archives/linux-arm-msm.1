Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792587118;
	b=lTS7TuxjIZ6J4qpn+90XyEuMYUF8NEuaONKPPya2wrEjpLzWsDXv0/md/EgsNz5QWxq4
	 JJbTGW+QXPjax9PstIbuUxAJljItoVu1X6650zs7136K0YpTTirbOEk13TS9pNHlcZxoP
	 6rpWY5ikdeajrq5btPP6/Rdlq/mzuZLtKQkK7ugORgF6IMlE6epl5Yy/SwdmANMRNSgGi
	 NHtRcp4aOwoS2Ht59+q+OLeUniVdYgJh/RN8cO3Sn9acdlvSb9iXRA1hNTsPrOwDSEYiE
	 fu8goHcz2nHKusSuGJ7M99dEmpXgxhKU+7mCQKrgneOD8Vut/HVwerwgjK+DiXojy8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587118;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tKCN/Ntx/9lDpfB3hIQgsrXXGLrS6SF0i7Fxu+R/PMI=;
	b=dpaeTNUvktC2/Gt+I+1RSGrEiA7sRzrrRtECC303UY0nEUARqcAHQSARUWvtgLEU7h7T
	 5OCQsAQBgeSpWIuj3Ol5wvXjeXrZs3miCSJLKC9+qsQnMOSgCVFM7eKfbF77uEcCQ26JJ
	 ZiSZ0OlDkVflr7y5ZYX8uBIGYcfZzZUEFsOS6ZEHyaer5exoxkpg0obLRzSpJjeLc7oFz
	 hSARGWO/O8Gupdjb4e31QXoPTxTXDo7oFWdxonGil05wsRbPdOT5M+XIxZgYx6EKOiYy7
	 sBcGu+dVOMpK6r0FeTs7UMiWzI3GSX3No2CUvW2Y8ClAVRpnw+Z10ILGP7m5Z70Hc3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gketJED3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dRcycZQK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245EF606A319
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 245EF606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gketJED3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dRcycZQK
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg47n977387
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tKCN/Ntx/9lDpfB3hIQgsrXXGLrS6SF0i7Fxu+R/PMI=; b=gketJED3Gng6Tm+J
	KacvTNyCZfwMvS3Lp28mWyYLX9yosEkoYK3b9HIQfhAJMRNTgT7q9bE+QQQl9nWT
	NV12o9+UP9p18OSgcaYdd/VC7zrlj5hOsG/rq9rT0lDWPbb8xv4V+/tlNycOa5Z0
	UXriXCV0p/+MICmDwUES6u+qHrne7Jvx2kKmnHz7SXM+BfPxko1JE3y6Y5U3dJkg
	4gLNCFrZtcwHJkcaLNRAJP1ei2oXuo4+LjK46kkeRbM/6gVPliQ/McaqutAey1BO
	Wy0L1UAE5aQjoi7r0lLlA+I09JT7RUxnkQVdqFnptbepx3tXn0tv5v/KeVtr8uXH
	pumlVw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs035tg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:51:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ce7a85f04so146249985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 05:51:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792587115; cv=none;
        d=google.com; s=arc-20260327;
        b=Cx5eyzLRWdSq+/6ldTi3VielXMX/SWpTNcLN0HRo24s3ysrH4Vez+DN920CUa+ebRG
         1PWjBs9gRXXNmCXQsjz7+kxzsY4wVHxH7k4DWdTDbOqrpsR7HWqqMutM216GbYuyq62t
         vvkbUF9Yx5x0rYBHrO9zqeSuAensKbOTU4tpvdjeqMdXS+aSJrRVKa9a3d9ecrk2wXcB
         dj0guXB5IoFp9Z37F3EEb8fEliw0YNnRFQVW2C0YaZilXE8QN9Aa8z2dx+Obd7Hz+RKO
         /GMaMsFmoilujEO1bqu/0FQ6E51ga30EQ6Vj049OTkCgFIb+1hkUHh5FRwpMQSATqeAI
         iTJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tKCN/Ntx/9lDpfB3hIQgsrXXGLrS6SF0i7Fxu+R/PMI=;
        fh=j6E7XS8bGI7h2n3ZL5AE183spmYFhrbXdC0idu/A09k=;
        b=C45Yfi8w+Vk0/7loZllyJVYuzavCxBFcD/xVP/8IDIoD6HcW8JBT/eDI7FIR/5Befb
         C2Fa/azCRcqNoVvFE4bCRZh8GsNqGM2rfmDfcwOM8xQZFrhTLssUnDQ/GiEOm7KY1C0y
         FFUjo12cJ2M32Ew8kpsCC3l8LnHAmy1fgfvg8A/yjEtpCF12d05tPzNnFCn2zcN3QkJg
         57A8BPMMuKZOOISLmzFNq1Eaazp09cs9tAh0CRjtn92+RXzLiuu2BEiLzySbS7jxGJ+e
         fCrcJx4D0Vjzkcn8jNvE6kwBYlyS3LoP0M7omTVLy6/k2GN60k9s4ngE5C4cn97XiNwW
         s0UQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792587115; x=1793191915; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tKCN/Ntx/9lDpfB3hIQgsrXXGLrS6SF0i7Fxu+R/PMI=;
        b=dRcycZQK5Y5F/pJC4zlLVfeRxLQMwvYMncEuyHcsU80MC1Gg0+fDL9r1mFb0azva8N
         7w+ui5TuCWff+ypxgbNwF6pAc2KMLQZd7BSF7WVe2in5217+PMgijV4sOTWgW2iULyyP
         k0Qw5lxoRHFBwonHW3lTbky+/4PDMvsBFPFhLaUtMq6gusBR09ruQLzg68UoMudmlw1M
         xi9kpAIdbsFM86DKAQk4zkt6+GFTePJMGEtvh6IYgkJ0dqKUEoY1rGOvF9F84ha3zOmc
         7kcqJIQ3ta8ApvhVexILuIG1PrAs0PBGtpsZ6DDvzMZaKEVPakfcX/FeDePqa1czXb2a
         PD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792587115; x=1793191915;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKCN/Ntx/9lDpfB3hIQgsrXXGLrS6SF0i7Fxu+R/PMI=;
        b=SyPQyV3zFHFxFaeHpn/eoVpeHCvDyWmiQBRGMJgNLp4BIjDsa7wAmAfXmZhvCk6Z1M
         mkPAt9SYOZWMw00cUKmVeEwTSSGEcjB3MiDKw4Yc4larwVQdz7SxH8FIl+0+8fanYvPw
         iqrI7MfnJxDNZtpO+8STIxKqpKuvsEjzVzAx4/wgwQ6JmJbX99nLEwP8I+w6/FC5xj/C
         6tnF26aQ7MPjV3SMD4EoOR9YLE0zpIfdc+01A0cPpyoVVZbi9ldHsTWxr27F4c+Khjsg
         IH0CPlgrjxOlfKLRpKpxso4Q1smq2sRtO4i51O/AYz3tTPY45eS1e/KggAaifh7vTBCK
         yA1g==
X-Forwarded-Encrypted: i=1; AKwUvByTboZt8LdelT6hu/PZtgIYlTOFeYW5bTGh1bLvaPCnQlXQXS8MNlEyOlkAg74MQLhQ7AK/HsKLNPhjmZEG@vger.kernel.org
X-Gm-Message-State: AFq9FYI9bfIuWycpX2mR3W6hEVvap6fG5T7dSmsCiBbiXl5ryirnxaDt
	LOz9tdzyP1+APpVYL+Y5i1x5a6DVdd2itlocJ79xJWLMGkh1C24vNA125TfbMQZ4pKVCz/Qi69/
	6IwsBDpnyBKSw3eNRU6Gx70sR5xVX0WEjrac5ADAeg2yfWp7JGYLMvNQ/Xg8uzE/z0e1msa25LO
	W4913wT2whY00ks9d4XQiBUyLSl0t9/ZetxKoW83qAuIw=
X-Gm-Gg: AYBFou1NpvC5dafl0fdCHOnG7L0ByWYhbwuRPOCpKtEAXIWNgGl/KgG/eANKjxaZWa8
	FXymXRa56/2dWkd3LZkVOIYF4moiy8h9C1GaTsVbVSxAXYGv8JkNvcvOUSSKiFb/NZLPftegbo/
	4YprwmicWbjWr6EzKoeZ+s0yDranSiogaeHydhW/dAFXWuGE780rHon31VYfY2TTvajkH4Mdbis
	UPp27++sYCJEReEbeeiKb6CxHSwtXAc8f3hn6z5pJFi7c5nrfkEOju1yAvsmMZaDbLlchKPLGQ=
X-Received: by 2002:a05:620a:28c8:b0:93f:2aa8:c550 with SMTP id af79cd13be357-93f57fa151emr385797185a.26.1792587115078;
        Wed, 21 Oct 2026 05:51:55 -0700 (PDT)
X-Received: by 2002:a05:620a:28c8:b0:93f:2aa8:c550 with SMTP id
 af79cd13be357-93f57fa151emr385791985a.26.1792587114427; Wed, 21 Oct 2026
 05:51:54 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021105434.29897-1-slark_xiao@163.com>
In-Reply-To: <20261021105434.29897-1-slark_xiao@163.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:51:43 +0200
X-Gm-Features: AclHuK-yPVVb7PzvbUMTFtaNy5JD5TXtzFZ7YNTeyh98oaWvr44i4RUl_uqSzOU
Message-ID: <CAFEp6-3F=fZ+kTsyZJTDk1Qfw_kPY-2u0G-PDHs7XyBs8tyOWQ@mail.gmail.com>
Subject: Re: [PATCH v3] bus: mhi: host: pci_generic: Update the default
 autosuspend_delay_ms as 5000ms
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, jeff.hugo@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, val@packett.cool,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad8b56b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=Byx-y9mGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=cfVVBkdRkn7iCyj4mtkA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1MSBTYWx0ZWRfX19GKZBw1/FA0
 jhrBpY54fPtFyXgI1SUuAUCTJial/HVQPx16hkDZs5G2iXdh7o8TruWNjbC8lTIjxdAnUW+VQfV
 mSrbUDYtPJJX+12mWNpVzpezlK/btgBUKq+atUX2ldsvxaXwtyDJUjPDGdUX7w354mFpyTynLil
 c/TivvXxZazip96Vt7Od/avwaIJhmBJxVyltnc1qkdr8UzBvZNbRZkc1Wzbocpd7nP1apPMriCi
 TjHf21JfVJES/2gm6vQGyHd0jjBAhiAlAUL/qNpmCzXdUSTc3bc73VPRvo3cL84NO2ocqERcfgL
 F8KVzvgoSPPcC/XJDFKzc0pTWtOC4xJ9Jtuc4QEOIQuJC9huzB0mkxOBpPfWR3cbP0a5ytgL4ol
 TC+wgOJWOr39iUDIwLvKiDMZnKnF/oSxgUPOnwzEuiN2eRli2uJTk1hgyZ5GlWMZC1CTuSDr8DO
 VjzEXEe5QFH6vHdQ+qQ==
X-Proofpoint-ORIG-GUID: 3KNJlGbdSpMiRnK26z3uqrjXEDc0sd7K
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1MSBTYWx0ZWRfXw18jTS6lUsry
 9vDUTOT5xG0wp3QfUDksKU6Taoojzt3J/6j+fQKaEB/RT3yGBLAOUe8D92WjkIoxV7Z1bnRRnuL
 KQnYKYMhx9sOb+5gOvMT3pI8v6BYOXk=
X-Proofpoint-GUID: 3KNJlGbdSpMiRnK26z3uqrjXEDc0sd7K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210051

On Wed, Oct 21, 2026 at 12:55=E2=80=AFPM Slark Xiao <slark_xiao@163.com> wr=
ote:
>
> For some MHI devices in some specific scenarios, the default value
> of autosuspend_delay_ms may not be enough to handle the last wake
> event, potentially leading to device timeout or link drop issues.
> This can lead to a runtime resume failure and a subsequent system
> error:
>
>   [ 8749.089545] mhi mhi0: Resuming from non M3 state (SYS ERROR)
>   [ 8749.089573] mhi-pci-generic 0000:73:00.0: failed to resume device: -=
22
>   [ 8749.090218] mhi-pci-generic 0000:73:00.0: device recovery started
>   ...
>   [ 8752.940324] mhi-pci-generic 0000:73:00.0: reset failed
>
> Following Qualcomm's recommended settings from Windows and their
> suggestion during case discussions, update the default autosuspend
> delay to 5000ms for MHI devices.
>
> Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime PM")
> Cc: stable@vger.kernel.org
> Signed-off-by: Slark Xiao <slark_xiao@163.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> v3: update the commit message and the comment of the define
> v2: define a autosuspend delay timeout and explain the reason
> ---
>  drivers/bus/mhi/host/pci_generic.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pc=
i_generic.c
> index 7193a384cca4..17d51964b55f 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -21,6 +21,9 @@
>
>  #define MHI_POST_RESET_DELAY_MS 2000
>
> +/* Timeout to accommodate a potential 'late wake-event' issue */
> +#define MHI_AUTOSUSPEND_DELAY_MS 5000
> +
>  #define HEALTH_CHECK_PERIOD (HZ * 2)
>
>  /* PCI VID definitions */
> @@ -1483,7 +1486,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, cons=
t struct pci_device_id *id)
>
>         /* Allow runtime suspend only if both PME from D3Hot and M3 are s=
upported */
>         if (pci_pme_capable(pdev, PCI_D3hot) && !(info->no_m3)) {
> -               pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
> +               pm_runtime_set_autosuspend_delay(&pdev->dev, MHI_AUTOSUSP=
END_DELAY_MS);
>                 pm_runtime_use_autosuspend(&pdev->dev);
>                 pm_runtime_mark_last_busy(&pdev->dev);
>                 pm_runtime_put_noidle(&pdev->dev);
> --
> 2.53.0
>
