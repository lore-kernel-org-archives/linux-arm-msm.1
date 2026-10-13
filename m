Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F06B3C988E
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882434; cv=none; b=oPkogu+qfEzDNN549s1qwRqs7h1CsOuiotTp4iIBJYbWd44mQLAjPFI+/AH2yvF6VUhEX8zEVhsbRxLztneafpi6v0W0Ohrlm061UNqJYfKJezxTcCO1BFG4d8GRGPUYzykiyOS1r7f4Aubyp3Vcr5HHG6Ml4X/P9kKyMdslb3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882434; c=relaxed/simple;
	bh=D5v5XjS9Za/NZrCDDLTC3rmHvrDIZNE1cAPRc78Y1jY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gENCRdKTINlujcoQuva/oMli6Esf1Xp5zSV0hSA22COornVaZPNC0x6E0gKlBMxxNF+FWbTA42uEHTJL+XGw4moco1wmZtOXfSRR63Up9y2akFUm31MbdxwcrZ3y181EKaE9GFhE7LHRy3UHqeDW20/S9BXYCdiDJNvOytKwr0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NfUnAvJj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F7zsWj0e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NfUnAvJj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F7zsWj0e"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D9079R791622
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oczbn9c8EH/S76/n/7Imk8gAToyAYy+KiSqeDjWGDyY=; b=NfUnAvJjerCyPC70
	bs7AX8X2H1HG4lFOxsy2Ocyeb0Z3YG8bKo5vhgORpsq7EXcDDlXIpp0DUYgS1Uzt
	aUKITslRV4Ko1IFJ42SNAfRnvzFtX1VDOIJ6hHxpHrUEGRWcZdMXRvL1Sp3tRUrr
	4+p/mCIm2AdnxeLH+wtAfRA/KMHt+io37kZuW3fQZ6pYasqR6bcD3bVC6Kat7Aip
	QlIEffB9BCPzKJOC5UPLXpN23Kh5AsjUt1QNMWY3JEUyTDtGaHUQ5dH98R5UCq6P
	h5JQLbX1hIsAAV54p9EBUShzk9YtI1xmvERmoVlKsfSvtAIJPCtV68pZOUaMw0Lz
	jGgndQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hmjr153-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:07:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5351b6bd8adso7986211cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 02:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791882431; x=1792487231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oczbn9c8EH/S76/n/7Imk8gAToyAYy+KiSqeDjWGDyY=;
        b=F7zsWj0eLOxl4BAmwOyM6mZexQsDFbuTMFDrs+rXNNmyq2p2Z0A8oln9ttViVyfA7l
         DIbhokbQWqrMEopHlYaLsAw2WUbJA38QYbh9Jv2KmAu5n59CXHInVeJTkXJBjRzuBFzC
         qp2KjKOdQDeIJjlkBE52p8Rhua3I+3FSdRG55StyGde6CiNTLuNFaExA+/dmcI4UX7Ed
         1X3Z9f2HXCGcbsLpA3xsw/V+bV2xqqCc59mFAAWs3HlIos4uPsMIJK3h3I6bB8tm11UK
         tQjSjNWJBdofaNoK5oef9bfQPPojbAOjcrc4zM5AveZFivDSpYaAHBBeFaZG6R4X5Coz
         OR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791882431; x=1792487231;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oczbn9c8EH/S76/n/7Imk8gAToyAYy+KiSqeDjWGDyY=;
        b=GcQO+5CJUHsreBrDCbpIxziCXlhqGBODhGTYBb5a8NxFyJrwLwgKMyCe5GFQD4Zg+b
         d0PniqBH8e9Cy5X0gs58DR7JRAW84sCGM/yT68VubA5E5wT2x3UxUaIhLfMgz5vk7W7Q
         eFdWzUTR8V6lsRYTznYiCtp5fd4vajIAY7fQBOQRhS8WBMLq0YA+jlQU4hYsraNgG/kG
         Kla2qq8Wq5PlB8bY3tS+6Ud6zGS1wd3u0YEXX+Q45k4SuLUnQKn01Vv9vCaCor1ao+Ft
         GlgqA1qG0aPPtcwZG4ZyoYd/MMGmCK8MVlBxz+roH5PtNITS7e+ne2CQpnEZp0LCufav
         owYg==
X-Forwarded-Encrypted: i=1; AKwUvByuDaP5ZMM18JGyaQd9ITjUAYIVp4gfBS1rtwjAUlp2QD6HsVU17zCa4p+Y04SD3wAYZmRBOPAZTfi3WTDJ@vger.kernel.org
X-Gm-Message-State: AFq9FYIN+888jOJCvICEe7Eq+EXJZn3URXFl2x8XSEke315FUEZ250it
	hVDnUgYUjUO0fD4nPUEaZkO1LlCUb0pb4ls0hy2oGrNlpWBrkrzT1bt7ZSMNR9iq9JQmSCAagax
	1O+VnAQRx24X3E73B9NQSjYF4SeSYpKWO4f2Mb21NSgxCyESp8Ml+c4TjbqbBSsEqwHBS
X-Gm-Gg: AYBFou3lCteHks97gokz1Lr8O3gbVWr5Hq3hSwLm+buHZY7D7JyKcTnoKWGZRJXGNPy
	UPSPLSaU8pgAGHm6HeiubCQIeFApSrJwJ9yuCMwXKknys4OX9dYpU61H62BANcUQ9S+U96w1T0J
	moL8TQPOv2ii1zRnKulh9eawz91m+ukvjhFbpPwpqT1JJDMdWIzY/FmTNOvrwirO0yp3quJo2gc
	UBOJO3DF6R3j8BbX668w/1rHHRiJNadHGPjFBIyXecD2rY2bGFbkCPemnHfJlsoR4boTicAIVFx
	Z3kz7W8hEtJd54UQHcldqfrlPGcFTOfMToplRrv3TyrTq8q1zqODOX99qu3i0Kv+wcLXjbzNeq3
	ZJdBknygc/yxrPgI3C9AcZg==
X-Received: by 2002:a05:620a:6501:b0:93a:1312:ff19 with SMTP id af79cd13be357-93ebd2661bdmr2413308085a.5.1791882431664;
        Tue, 13 Oct 2026 02:07:11 -0700 (PDT)
X-Received: by 2002:a05:620a:6501:b0:93a:1312:ff19 with SMTP id af79cd13be357-93ebd2661bdmr2413303985a.5.1791882431112;
        Tue, 13 Oct 2026 02:07:11 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ae6fb7sm551980166b.84.2026.10.13.02.07.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:07:09 -0700 (PDT)
Message-ID: <ac6f5318-6257-4e42-a6e0-9f6a94c8eb5e@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:07:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: nord: Wire UFS PHY symbol clocks to
 NEGCC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261008085640.3512895-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261008085640.3512895-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNiBTYWx0ZWRfX6ySQy2ImToCp
 VgkkcUeTUxKAt1rCXNMDzipvkB0xckDovs7GyXsHVNnylaKeH0k3gCAU0QgzSm5G0eg575f/kno
 +eMBm3r8XGdT/xK8RG1eD14uUmQCd2Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNiBTYWx0ZWRfX/ZdItgWngzsG
 buJlUke948tI4ZjzvpKWc5QO/yR9qnHiFXTV/6FuyHy9GpC1OJTQ4P4dqh8IqoGqc84o275nU7q
 FgmyAwURiC1dV6p0SmC1TvupH4wkwLPdVXUPn4RT8bv2Pg8S0mW9BT2o63UvnBVL71191rWi0wm
 08RS2UCTv5H5TdgtBLOEqgS/uD8HxJBTUZgbUj5ZFqUfdh2cmr8B+O+PUV/lqmLuIO9m86mfKSZ
 nPUbXaYU0rQMWDBSqQfRl/2rJZ+EwfsUi702mywN1HKoHe1C+Y3zvGi/0hDu1GYTG1tRF6Z8qyG
 Q7F/MhXP251/TBArSWPpO140sPXpKovRI8SsZasuSezdQPgDrIEUh9IYPWXx8IQvJxMbDw9WNKF
 ZeK5iTai/eIPYqVok/YyXiRVVJke+5ZP12A5fRhPXOe3Bo96Wvo6psDCyU3zcPTtv8Ietl0RWDv
 XD03QJZit8WGcQwNGdw==
X-Proofpoint-ORIG-GUID: CAVBHR2AQrrggNR1SLXscSlCxm91tAfo
X-Authority-Analysis: v=2.4 cv=O5+sLx9W c=1 sm=1 tr=0 ts=6acdf4c0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=wmFSuXOd6YqTMbDCKN0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: CAVBHR2AQrrggNR1SLXscSlCxm91tAfo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130036

On 10/8/26 10:56 AM, Shawn Guo wrote:
> Pass UFS PHY symbol clocks to NEGCC rather than leaving the NEGCC UFS
> symbol muxes orphaned.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
