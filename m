Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88793ACF1D
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 10:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791801840; cv=none; b=tTRq3s0DXzAgRa0wWMVBvzwU6JOw4+MMuFClXLo9PMykiH+ck9zhtwuRK5Z1NG5DbnVq333f8smMjjBn9KNdtYkKdWXhv8+trhTjTjOqUS3g/7+bK0HHEvJz4dnI/Yff5v8hgrN6nCTZxw3jYQUNAh5Hm89+aaVV5hcSBO5xr2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791801840; c=relaxed/simple;
	bh=BNdsjpIcrl2SvMv2g05d3FRuaOWoOiHQZm5siBmAQPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQKqR5uWoJxzULw8gRTALddvBu+Cr0yVtvF+ICfnpJoayIIqSZyDAI1l89BwrTiJe7AgNwI70aqFpeA96fvBAK+mKJwOP293QhzwfTP9w2KNqQsD/2BYJ7vl4fFUEgai3FKz6XkjOyBYDrPjm3XhLfnFP5JEtyArFvuqA4gSc0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SNLoHXUT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i8ooR6nV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SNLoHXUT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i8ooR6nV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CA3iHU2527365
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 10:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dNk1oee1aO8oZn2gGB7+4wyF
	LBZMDyUH14s2FZUuI/I=; b=SNLoHXUTbWKSGXvlPd8V7i5MH2+YdLK/EVxUhfFO
	kPgXexU17bpswyHymlFb2GIMVMKhkxrcGIgebMRmii692mZclyxeJX0SgQQ3q8D+
	4whq/8SBv4zjGsx0/dGPHMOcj3i/+g79tQ7lPmGiiVjHqSyR7O2bIK1cdoxMMAUA
	nrSvx3RvAQwxuDardNiRfSsgR8P0LXzOUubCAcFg8tkX7pE0onh88sMuMZeEple0
	vIuXYQy4c9mPFNoFJamPceKv7PxOcPAbwmpcSe3Llw/eKG0ZWXCpFaI7Sqggb7Vk
	e3xnDBg5ZWr5+YM3uvBFX1V4Vesw6Y7a3XUsf76qIew0TQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wffg66m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 10:43:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6f75c1219so28114665ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 03:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791801836; x=1792406636; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dNk1oee1aO8oZn2gGB7+4wyFLBZMDyUH14s2FZUuI/I=;
        b=i8ooR6nVS495+wuPSU5AnTLbDAlGSnXa1/p0unowW5EplHmpT6VjKPekW3kY+vybHA
         UsKb3QA+GHnTR+XwOlgwu19zF0iOYkvJGJvERgQrXpWuWx8+YS1mGBrZC/vDDa/Ur5ID
         7o7MGuYf2MUVU4R4QvvZw2Azv5Rveur5LSbHToznetDoaSLKKenUj8emFLO3X1EZI7le
         eV4jqIaWeUTI68rtB13Jj+11c+SidNlPqK8tzric1ajpnWeQz89W1CSsNKlpXxrK2BNC
         vGW+KEaWVwzTo+jGuaXl5Z4YmxB7CNpf4rFysL6szzJiZfq+9tRilOjA41vceYvNJW0T
         QR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791801836; x=1792406636;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dNk1oee1aO8oZn2gGB7+4wyFLBZMDyUH14s2FZUuI/I=;
        b=RdRB93858Ktk5GJw0dbWxC5xMeQJdp2ZtiUIxXHrmaxwc7Y+6j0SD8HYphcx/kIZy0
         lE+HCQyrLJZwDuZ/6EtBvcMJd4Uv2Edw8RBeMLJbKe/MN4Kcqt5MAGgoyLh5jGh6mc9m
         l8C0fcBn9FsPxw8m/1yGJXwt0O93NtkVkGuYY5jqA8XAIe6zMNnhspdWBuQ/oIANNMLd
         SzJELvcBFjH3awwtQITvuMIx4gsniih5+69RvY0FXW9QDX3sxxPzs5rIet3fBCUwZCQ/
         FMsLBDdpyYAsk8aWJsNEGf8uLQVsfg4HMuaoJ4FgyNgIXDriGU9rhsF+W55hLyE/rClN
         XSzg==
X-Forwarded-Encrypted: i=1; AKwUvByVmuadJ1+UussUuIM0c5ctQXkj5rLVubkcJSkJteDOKviP9YYrs9MBCooKmsbMZurAM4J0G9bjDupSNNS0@vger.kernel.org
X-Gm-Message-State: AFq9FYLl4qD3O9ZB4ud+9wlNgZHAB1h4UY6A8GTtIFK6PlJoriCFWvgg
	qABRzujVVC0SbL4c7hlDMXiocHom73BBHcFGTwVRaU3IHqExDzhn4BSTuz1ZFl0uAF2ZpY/4aje
	VMuKauf0t0kOxO+f/w2N7nZinaPfiqST9IOvLjcW3RPUk1bof7qtW4VUY9kWCgBia87o0
X-Gm-Gg: AYBFou19hyXkUHexJu6ciVDZkFg6HGYDNWBjzdcTaw+AN8AzscqskC1dRNfos65WlKc
	tglHb+gkvwQYqafYli6tS59dLwB5m7GWev02I8Bt5ca6sD4PlY6INqX4UpqbxGrT+vuHM7i4lhm
	w8qJtjOk++OuMOds10TQUrndczYoGPEOicFdD2JK8Gr8ZD5Dkpn3tLcX6jxmPE2N057phnYWDQm
	3yvMh2C0kpRaUWLR2TTGdvIoTifasPucg38qbYUR2dRI9C3V6j05TGrIfsRCMARlFglQhGZPdzw
	T0EdrOHICOAW8mwLERFlQ7Pz7+YEZdJV7Lo7ZCY1/b/cU+Lf2TSdi9ah0m6S1D9A4JmTHbGLKmS
	7TUcjCZAcvkBlqb6KM2zs521J4/HG
X-Received: by 2002:a17:903:1d1:b0:2e6:2868:e57d with SMTP id d9443c01a7336-2e842f319b1mr86209445ad.49.1791801836309;
        Mon, 12 Oct 2026 03:43:56 -0700 (PDT)
X-Received: by 2002:a17:903:1d1:b0:2e6:2868:e57d with SMTP id d9443c01a7336-2e842f319b1mr86209215ad.49.1791801835817;
        Mon, 12 Oct 2026 03:43:55 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8c6esm39841945ad.61.2026.10.12.03.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:43:55 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:13:50 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: sre@kernel.org, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] power: supply: qcom_battmgr: report the USB type from
 USB_ADAP_TYPE
Message-ID: <ifk6e5oefouaw52ms6rngezuvazbdoagak7sxpziwazifwvwdt@lonlpjntuq7y>
References: <20261007123932.1664-1-26rote@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007123932.1664-1-26rote@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0MiBTYWx0ZWRfX1dCkf9+RPj6Z
 slQYAkDrq4G/nLIUDrrI4HHNVF1GM+4kEAXys4kvC1p4Xm4mIMMAffxr0f9Wp1LDZM7Fi8qo6x1
 AfxlInOGmTWXNLUs5vBOmt9/fkTB4HDPPshe9EWvdYimJIbLDsQkut6DgiUyYB90WMiNeE4i1ac
 NyitrxKPhOgiHUHtXiCeCw0OXDS1Lk2cbyFV5lBFMkReYEt9Tp9LVqyjbQFgiZcdZntQPowdJJw
 hPLZIIfdMjxWFRn7EfIz/YfAV2gWmO+ydLbBNa3PTMvkLtmHiXOnoulrsdkVylQshYSmtb/MQ0T
 wzcg5xFYyETqauNyi+gckkxYdPo9p7oCCrQmqypmrcHxJCP4mn/gdNU0G66F3ayL3T0vSY9qzX0
 hpNWvg0F9RrFn0UoJ0KMcLopiwqlMCvLKq+lXAvkmZab9eilMBVyhMn/hG1BfxduRbhrGE2Em2l
 80h2Va8e/sRqH4Xdusw==
X-Proofpoint-GUID: f9XYm7fz-SKYxSzyTIZ9niQyMPMzkgRR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0MiBTYWx0ZWRfX9gPWUrPNC/Jw
 FTUJwI089XZ/PqiIRvSW84xUqPH/JHWBeAK9f+wE31BlHeG7SHKOD5UTJVquddQn09MhNpST5t2
 PV1/rcNCfSMIBXYfjOig3EnhKIfN4W8=
X-Authority-Analysis: v=2.4 cv=ZcWIpcVA c=1 sm=1 tr=0 ts=6accb9ed cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=sRrwSrtRdHjplqK8FsoA:9
 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: f9XYm7fz-SKYxSzyTIZ9niQyMPMzkgRR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120042

On Wed, Oct 07, 2026 at 09:39:32PM +0900, Joonhoe Kim wrote:
> On SM8350 and SM8550 class firmware the USB power supply reads its
> usb_type from the USB_TYPE property. On a Kaanapali (SM8850) tablet that
> property is 1 (SDP) whatever is plugged in, while USB_ADAP_TYPE reports
> the adapter, using the same numbering as POWER_SUPPLY_USB_TYPE_*:
> 
>   PC port                  USB_TYPE 1   USB_ADAP_TYPE 1 (SDP) USB-C dock, 5 V
>   PD       USB_TYPE 1   USB_ADAP_TYPE 6 (PD) 65 W PPS charger
>   USB_TYPE 1   USB_ADAP_TYPE 8 (PD_PPS)
> 
> Qualcomm's downstream qti_battery_charger driver also maps
> USB_ADAP_TYPE to POWER_SUPPLY_PROP_USB_TYPE.
> 
> Request USB_ADAP_TYPE for POWER_SUPPLY_PROP_USB_TYPE instead.
> 
> Tested on a Lenovo Legion Tab Y700 gen 5 (qcom,kaanapali-pmic-glink,
> which uses the SM8550 path). Only tested on this device; the SM8350
> variant shares the property map and was not tested.
> 
> Assisted-by: LLM
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>

Add fixes tag, with that i think it should be good to go.

Reviewed-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

> --- The downstream qti_battery_charger in SM8350, SM8450, SM8550, SM8650 and
> SM7635 vendor kernels uses the same property ids, maps USB_ADAP_TYPE to
> POWER_SUPPLY_PROP_USB_TYPE and reads it on every USB change, so the firmware
> of this family should implement it. Like downstream, values outside the enum
> (QC chargers, 0x80 and up there) are passed through.
> 
> Not tested with a plain DCP or a QC charger. Once, when the USB gadget
> did not connect to the PC after plugging, USB_ADAP_TYPE read 4 (ACA)
> until the cable was plugged again; when the gadget connects, the PC
> port reads 1 (SDP).
> 
> Kamal Wadhwa's multi-port series makes the same switch for X1E80100
> (a new x1e80100_usb_prop_map) [1]; this patch is for the shared SM8350/
> SM8550 map, which that series leaves on USB_TYPE.
> 
> [1] https://lore.kernel.org/all/20260806-b4-battmgr-multiport-usb-v2-1-1a6dd1e06cc2@oss.qualcomm.com/
> 
>  drivers/power/supply/qcom_battmgr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
> index 7716eb9e1aff..b24860d2ded2 100644
> --- a/drivers/power/supply/qcom_battmgr.c
> +++ b/drivers/power/supply/qcom_battmgr.c
> @@ -975,7 +975,7 @@ static const u8 sm8350_usb_prop_map[] = {
>  	[POWER_SUPPLY_PROP_CURRENT_NOW] = USB_CURR_NOW,
>  	[POWER_SUPPLY_PROP_CURRENT_MAX] = USB_CURR_MAX,
>  	[POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT] = USB_INPUT_CURR_LIMIT,
> -	[POWER_SUPPLY_PROP_USB_TYPE] = USB_TYPE,
> +	[POWER_SUPPLY_PROP_USB_TYPE] = USB_ADAP_TYPE,
>  };
>  
>  static int qcom_battmgr_usb_sm8350_update(struct qcom_battmgr *battmgr,
> @@ -1513,7 +1513,7 @@ static void qcom_battmgr_sm8350_callback(struct qcom_battmgr *battmgr,
>  		case USB_INPUT_CURR_LIMIT:
>  			battmgr->usb.current_limit = le32_to_cpu(resp->intval.value);
>  			break;
> -		case USB_TYPE:
> +		case USB_ADAP_TYPE:
>  			battmgr->usb.usb_type = le32_to_cpu(resp->intval.value);
>  			break;
>  		default:
> -- 
> 2.43.0
> 
