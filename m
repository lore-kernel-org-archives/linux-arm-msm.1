Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040BE30B53A
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811406; cv=none; b=i3gNZ+NG2dYCr0fkC2zVg5vJ9HRtUS6TT+CCBJIP2CS3eaFVyGMCUOSh+xXNfg+asts8upqPUpgWNmSZXSlJ+A2m+lxtIEEEHRZjw102CRXPIRgl+myAGTVFnOqwmGiPPREKK+gbVwbb9qERt/TYTySt3hI4f7BU2FVwdQDhXw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811406; c=relaxed/simple;
	bh=R28SeeBt9BfCJhpMmjquk97CFZSG0kKrI1J07/GucNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eo2W9We06D0SuZNoHnju2siRnHNct5ImrqbagjoHs4B85rluqKXavq02cJ2SogP2hROGT2l+xbRLrhNmWCq516s0a+8rACd0UlaWtqxoFWHU7UEAMMo4IdZcvz8/303YUfdKchNlx5TPTPMhhvnIRraeEY3Uruym+jX4wYPotFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wy0CFUem; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ULWMuEEv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wy0CFUem";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ULWMuEEv"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0DkC2275997
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HqDiWOuLptx8G+jFnl5RV+jg+K9hUTE/Qbj1fk+J+i8=; b=Wy0CFUemNZ/OOIc+
	/eWdi10emTqaruTWSL/gmhM3paSbIdGW/m+yGEI31dLGX8y/jhjf6JaTNASgeqYD
	JXn7Fi48LQ2ice+Rwg1maVBO5BF1oEcOoBJDniwDRaGWtsg3PSkzOqYU88RrN4tI
	onlQPoxsNArN4hR/B/Zwh8W95MyJNDqywkg1Tkzlp65SO4xZmIN/9cSrxivcFV5A
	hDVwh7Ot52atWuqiyM5+BJDsC+Q1DooLOWfZTPu+kYm2KbPiFeDimg3BJhFUiWXc
	R57bf0KYjUA0O5ZttkVumXR9wWvehG2FaxFIluKji5Vql+aoZmnuq+WDazKlhx43
	TLrxRA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq1gqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:23:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea6b66e53so25688085a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791811403; x=1792416203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqDiWOuLptx8G+jFnl5RV+jg+K9hUTE/Qbj1fk+J+i8=;
        b=ULWMuEEvucm9DwfOHqiaMU1qbyigM3w4111Ffy8pdYg2HLXA0aon9+i1VkeqIl+8vF
         GNclsbxc+ErZseD6sthBgXXLHRAnQwCIDpBnTuO26qBGY1LBKfcF1n5lOn+8YEF5Y3Ju
         +rsUdSEd24hBalRTx18dbomcpBmXKggyB1Kuyle1i6Dz4Trc4zOansEbqnO+PQVBLWZ6
         1HuFwMt0grKNlo3yW3Y+jnNYwr5yXARwzCuIR2CmT+L/e5kSsjl4xKow5NrQ2tOC+9Ae
         0LOp/4NRxIR2mUEUrsVaUjr8lUlJ5WmVIAqWaM947IDTy9rXtP15mu66b5cgGJJ7R/Eq
         342Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791811403; x=1792416203;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqDiWOuLptx8G+jFnl5RV+jg+K9hUTE/Qbj1fk+J+i8=;
        b=SuDS0jucAwmGH2tWM7S/aXeA+0RiqlcrTeeWb1Ne0In9d60FHTyTFMlWGWsXFuAP8D
         JKyu2DaOMrU5w9k+z0A0Dkps3N9/0xTNEIBLLUPNqSbPxsOZqKZBwDpwG+uqnabUnj4Z
         n1hUiuooegb9z0yx5HDKCcwPc3kgFF4jcraOz3vLPeNTDgqU/GUNWWqattDIbiQ6e3Bk
         gLBNrBqCqi0oBi9TklLJLSqr8wdKIXUf7nRbhf2yDIvCoMKy1HluHDqDSkMxGJRmpXSK
         WJOlNhujGO5f6P/sLzYDVk1cj+iyG8qJ2h70BzMA7zN5T1tJyHGRTS1J9AXenPe8b6Jx
         UuKg==
X-Forwarded-Encrypted: i=1; AKwUvBypcjZ2/rFed1QIfOO2Gp2Gr+7KoRYtwAVLbhFFOo3mvJbklT3Zi6UFLpt4ClTY4dfsGfe5kYo6NdJPebQq@vger.kernel.org
X-Gm-Message-State: AFq9FYJyfGsTgRWFaeC806xC6Ti+uz972pBQx2zVRmr99fTIqp32bAbN
	vwk9VZRHhDuU8dM1vmZAAhmrZM1ZGyPy/4PS1Rm4KQhyl5a7AcLwRqvnLG9mVaUx3zXxl/N7lwO
	OGUpi7s6tChxTRG0e18iTUTx9Mo67QCe13GoDXWhL6V8E5t6cUJVbfqDFeJ2BN9NsaQ+9
X-Gm-Gg: AYBFou2ARE6BNcjI+i6RFLtboG70HmjOeYk8JlZGdo56GL7sZQghPI2JOwfZk8KojCD
	5pisN0X5PR07DIATshs7wqtZdSbtL30JOVBs3pOIse/S3XXXa1uqP2Or7azQj5b7GtpQwha9XR0
	iMKg6wyS6dIRLQvtc0nRheEcTmiSOyNv3yO5U5Ei/YkQQtkUMLyEP94GJWdAQLgAEVehHYnMhA7
	AkzJV2cYgDe/fc8r+u0w3sK/+qGZecjwJbWHmrux1SVWXi4R9fh85W4ZWEirWlAOtdfNUKtAzvz
	B/jC3N+0B2zQ3fkgw3INWXpqcnZ3/wtQGpW8R27E7h1wgxR5tAmJpGjlVYtXlsybO+8IxEZcJ1P
	qarfiUWw7cCts3ikG1HgHmg==
X-Received: by 2002:a05:620a:2855:b0:939:8148:1e3d with SMTP id af79cd13be357-93ebd0d7987mr1589452885a.2.1791811402940;
        Mon, 12 Oct 2026 06:23:22 -0700 (PDT)
X-Received: by 2002:a05:620a:2855:b0:939:8148:1e3d with SMTP id af79cd13be357-93ebd0d7987mr1589448485a.2.1791811402480;
        Mon, 12 Oct 2026 06:23:22 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a9fffbsm460528366b.49.2026.10.12.06.23.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 06:23:21 -0700 (PDT)
Message-ID: <e52eb142-182e-487e-9371-d6b383b700c8@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 15:23:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] power: supply: qcom_battmgr: report the USB type from
 USB_ADAP_TYPE
To: Joonhoe Kim <26rote@gmail.com>, sre@kernel.org
Cc: kamal.wadhwa@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261012130053.442-1-26rote@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012130053.442-1-26rote@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6accdf4c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=_5F9AhPyAwiU4pQxHRYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfXw6OTDo/J9oUn
 /tjkE81u1+5B9tGqnbt+YGcsTfhuicdNK9coKAjb2bRtLh4OKJgCmZ0bmCNokU/T7lQQQg/xWRq
 +oFZv7g9mWxXnhMTIxJ7LyjWAnUYY8g=
X-Proofpoint-GUID: 5QGVU14Ttgs2NXKmdnVijNy2WmzgANqN
X-Proofpoint-ORIG-GUID: 5QGVU14Ttgs2NXKmdnVijNy2WmzgANqN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfXy9SKFvMYfkZm
 O0IjLAuWVYWCbYNTsj0Ed88E9k2MIiGytNCWR4oXXHSfrPQHdcS51OpzMlngEludjKqGeRrn2zg
 qbkGPCA32RPrGreBze6OvJk5Y5+gRKvXsHJnWr16XmsILGD5eQdtLDNl1mfjjz/VWKa5pgZHk5j
 nO9Nz03J7o7Ua6kAxn3eXzc9i88zpflPasj+q5ensbZ2JfmHCeteeuA6hLraOyLgUjWwqCig6qz
 NcGYWQYb3nAr4Vs07dc+Pead1Fhzk2Dgw/69Rz+CpOYLzS5kximoX8ABQNlmM9XXRF9W7/WWLe1
 mnBwGe8WEeBV72SUxUpuPSM4vzF/EAx3nV83HNzzY0Kzdcx9f+M4/C8z2HsSTNOw/s2MasRo9E2
 Rp+7T0XVO2EtGtIbl6r4Bug0pzaTtOnHphJRm0sxBuebdksCg8EL88NWN9UL3nSJlsr1sBMK3pi
 xbWShXaC5RuaR3xaPOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120053

On 10/12/26 3:00 PM, Joonhoe Kim wrote:
> On SM8350 and SM8550 class firmware the USB power supply reads its
> usb_type from the USB_TYPE property. On a Kaanapali (SM8850) tablet that
> property is 1 (SDP) whatever is plugged in, while USB_ADAP_TYPE reports
> the adapter, using the same numbering as POWER_SUPPLY_USB_TYPE_*:
> 
>   PC port                  USB_TYPE 1   USB_ADAP_TYPE 1 (SDP)
>   USB-C dock, 5 V PD       USB_TYPE 1   USB_ADAP_TYPE 6 (PD)
>   65 W PPS charger         USB_TYPE 1   USB_ADAP_TYPE 8 (PD_PPS)
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
> Fixes: 29e8142b5623 ("power: supply: Introduce Qualcomm PMIC GLINK power supply")
> Reviewed-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Assisted-by: LLM
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
