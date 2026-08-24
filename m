Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42303DE423
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787561838; cv=none; b=mbTOw65y08dnWyH2h8s1sk4PftYLD36wwwIEYI4+vfx1NxDmuofayaalT+9rErN4XXDsxlvJPEXDUqZGC0VN1wR+zwN3khRHqkxxV5R/0UcgXiwrV9vaGUEGiyx+beW5u+l9PPyTIMC2rbYDeUw5eawr6ixeTZz/Mqm9r6hzA2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787561838; c=relaxed/simple;
	bh=n/O40m2GZ/yzb5oqxUkC+dBG0QysdnWonyA+OmACEtI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jObXOrVArbSeL6rR+m69P/OMaHpUhVujL/OTrEbmrbHgiNn3glIH+EfZxOfDT2dqzT6OAvcwzDFJ19npj9WaV6mvtkCT9tU/Dxhvk7iotMVHhP5fqo0lLm1NMtesJ1ibjWz/dMUE4ELm1BEzpAIvGAoejEeSLLBnyIQ3rQ9Ehaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gSTvfiCP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E4VnZqaK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gSTvfiCP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E4VnZqaK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O7BkNQ1815924
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:57:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FediVK++eWEGtqNNfanEj1qRZ+5vZO6tRsceojvl3NU=; b=gSTvfiCPiy6tBTT8
	H8xD01Dvexde2c9yveBahOyv+6rWc4h6vR4tVDiWFdO7sbDVLYVUnupFrNRGzpE4
	lHBSyHqMcQ3r3fo57LBmJL8xZrrxQZqs9URJCUiYYSHjS4nzhMsBNECoro8hkZ7T
	KwHhkn3dTyYiu2sJvOF6ZpGjr0GcW9EVMN891cxQBZpkkyQylhCzd6XUYim6/Py3
	ishbu7qmKPJKdZHtFCCY6O1XwZpw2gGqc2bdSjP807BzmGlEkRvo+LRWMS5qOraL
	gyZEONUUALUaSbrUfA0SCGOpI+AQaPQ9BbqGskZSlsmgucNXR5Is0ImWUYdlOLfy
	Mbcv/w==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hbtgd56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:57:15 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97c7429029bso25705241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 01:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787561835; x=1788166635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FediVK++eWEGtqNNfanEj1qRZ+5vZO6tRsceojvl3NU=;
        b=E4VnZqaK+UqwbHYSbGizgyLqfDwCMG1EjkNW8+ndYa9b0ps7fET7TilPsEesfwFUlw
         HGxMwGVPv+OJnv11wYYVISK36nCIvI/hDToeWyx03iijssVoVouVvPUUhofVUb/3tUmo
         6K4Q5G0jyk9kzmp9WchRxfhQpPXV85eqYnRWPY9jZTtECpve6qvK7pqRhnqM8HgqYO4P
         BcpsBUSPNZB6lcXknTgyH4viZKkN+xPfkH+vmgJtK+2FnqSTI5TTHNvjWYNA9UhLdwXj
         1+g//RlYEyG550P51EJV5IcJl1yekXLTBSY/RNVcAO+sAAwEsdrQiITPJj1Q1natZdCz
         lvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787561835; x=1788166635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FediVK++eWEGtqNNfanEj1qRZ+5vZO6tRsceojvl3NU=;
        b=qcI+My1FduBg5goqAMxdNcm4EGXJ/9vnr89sv2aZtae8hmo4pnKWNNDfzKBrnF9wTj
         cRz+nP1Fddmls4s7kZl8xg6xL60lnWfwEyFRLFPx3t2skkKTD9xtUvxZ0VsN5qinNlnM
         n+ETd0GHEj6MKV5YFw8BARkdsO0nCMlLX53x/a5NHFF2ui0KejarNbFlt2sVaNWGlSyt
         BCZ8KTxtLpGbEjWDPn5icUpKkySEGLNCdCfxcF4WGDjg/PkcQqFF7swttc39IWIoHvkc
         u0mldI1gp2NyLJkAY1O0uJpLU2siRC9puT5To1bLuV7OgQaubnpblOxpOvlShZI6zra9
         sW/w==
X-Forwarded-Encrypted: i=1; AHgh+Rr0DiPO/rnDVekKq7/U2EVtudcb5ywgqMPNcwmbJRdvseCz/CB3Js2PafcbSCSWnk7RJJOfc84S6NQL/WL/@vger.kernel.org
X-Gm-Message-State: AFuF++m867Wdl2hHDcfzs52WVV1+30fR8/KZCI/aSHLNojxO55CptNbz
	y/B6yD0z3H8OCaarrr4//h1rMzeRT19M4qAEbBhlyUpIa31wruXY/3YSF8HszItVqG6bZB3Qm3s
	IYwc85botFnh3pxAHHsmocM1jFsZjGRA7nxScA2dmQM7kURFLWI2twkhUHuuWhW9elvmD
X-Gm-Gg: AR+sD10ev2JcnuZQxJjhMaYDBUceQQkVQbuIe2V9lu4RQzorSk6BKSaAVGi21hwXmK9
	zp0jHMVNgGfrePkUFn090/szP0iyo+Nkr2EZlCSfxIPASiCFzkrom2yumvkmfx56ryYBEl6Jopx
	wOptTOrSoyWolKCPX8Jp9hrH4lE2wLw3YUSs8UH0l2y857wb8CMGS+sljXMnuQ+Y9fnIF35K5xN
	JbMuN21gNTGPGe0rmjtXrnEfcOvhOfnOz/peSsNfTjo1WMldG4SoX7Q2y8CBsWugz4WtpTyLyll
	alONqNmNX42At70dRtdsC9a2Jo7TJjEiFsTniiqRFIPs4lBethZEO37rVqiT+rIkwSD6zTIPi4n
	ibqJbhhtSfPF0cab4S0uA5t1H
X-Received: by 2002:a05:6102:6893:b0:74a:b1ee:e21b with SMTP id ada2fe7eead31-77a643461f0mr3515311137.1.1787561834946;
        Mon, 24 Aug 2026 01:57:14 -0700 (PDT)
X-Received: by 2002:a05:6102:6893:b0:74a:b1ee:e21b with SMTP id ada2fe7eead31-77a643461f0mr3515306137.1.1787561834572;
        Mon, 24 Aug 2026 01:57:14 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e2ddad2sm7355677a12.30.2026.08.24.01.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 01:57:13 -0700 (PDT)
Message-ID: <0cc4dcb5-cc90-46cd-9174-029416e7f51d@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 10:57:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: add
 ST21NFCD NFC
To: Kristian Brox <isyourbrainfoss@proton.me>, oe-linux-nfc@lists.linux.dev
Cc: david@ixit.cz, krzk+dt@kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, luca.weiss@fairphone.com,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org
References: <20260818205940.1973944-1-isyourbrainfoss@proton.me>
 <20260819210906.2500789-1-isyourbrainfoss@proton.me>
 <20260819210906.2500789-4-isyourbrainfoss@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819210906.2500789-4-isyourbrainfoss@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3OCBTYWx0ZWRfX2527G0azGgBR
 jzMRzGYq7fA8gi+bMo0BGNwzqYwr9Eh7mbGUrOYP5K5I1h4d2K2mqC9MLZwjtBMevWN4fFCLaR+
 UsCweU25BA9mFaLbC77s+PB8UCC+2KDGlMRrbYdJs2XmuQrbZt/S/TNv6df9HDQ/V8cSI4Vv5yk
 4GBK6x8eUfJcq0J5uNMmd5PYDkFx77tISYxB3Mb3f+SSmZdrMwBJWz5pUbt96D3W9pi2gbjCjtg
 P4fjEwz/AI/t7z/ItwbE5GYLHZd3grCZ07DmzHZjTsjvmHNfEHYrewACv828ibVpxRkM4bztuVl
 yCrrvAwvUbMqWcKq7KIs9BENleAiRB/zfHLqY1VpVWH/151hmL9/zwXqlJc++iP5hzIYowmm0eD
 zHU3/TihFWegNLE55F9ylW/pEbuqiXAVc0DGSRAzZFDSuK4Q2tZWrWUwlVF210L6wgBHw9L+ZV/
 vrmQnvBmF6QlcWesEGw==
X-Authority-Analysis: v=2.4 cv=JL0LdcKb c=1 sm=1 tr=0 ts=6a8c076b cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FWA6L-ytD-VELHUIOsEA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3OCBTYWx0ZWRfX/m82aODlBJtU
 MEI0KChbQDz5xGDUPtEsDMw4RDZuUlUMb40sh+Hk+h2CofZhRAdGkQe3IV/FWp6WHcSGtTAwZvE
 6FSsDzaRvQuhVXVF6gKSuUhrnLRtEc8=
X-Proofpoint-GUID: ScFwoo4bcItZOqNXu-C2YMgk14DU2ElX
X-Proofpoint-ORIG-GUID: ScFwoo4bcItZOqNXu-C2YMgk14DU2ElX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240078

On 8/19/26 11:09 PM, Kristian Brox wrote:
> Enable the ST21NFCD on i2c9 (0x08), IRQ TLMM 41, reset TLMM 38
> active-high. Compatible is st,st21nfcd (raw NCI).
> 
> SYS_CLK is LN_BB_CLK2. VPS_IO is L18B (vreg_l18b). ese-present and
> uicc-present follow the public schematic (NFC_SWP1/SWP2: SWP_SE to
> SIM1, SWP_UICC to SIM2). Reader path is tested; SE/HCE is not.
> 
> Signed-off-by: Kristian Brox <isyourbrainfoss@proton.me>
> ---

[...]

> +	nfc_reset_default: nfc-reset-default-state {
> +		pins = "gpio38";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-high;

This line is unnecessary, the driver should assert the pin

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
