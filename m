Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0921F218EBA
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 08:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337474; cv=none; b=VLCa9EKtziTeDY4WpsRRYNHm0ElbDA6QXdEaOZSbBxOxFBTT7P7rRpFkfgFQpl18HgHZE3tYRRfBVmim8Vz3HU7zDc1XDW8DqSQfaFP3pdeP64OU1xEsgAbktt3SxDR83ZMy/Q1WSpFdegadNd7Q/DcoT7nFpe9KGtjhiGSSGF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337474; c=relaxed/simple;
	bh=USw1vEHEnGZ577Me1GPxccUL9xDu+6I1Z7yk0147Z8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gp75CoohehfmGGjJ5B+D03MnX8aO29ku0SPxL9Z27L0cQObcfprQixGULNJhK5WnLilF0nz4twZ1fBviiolCLozvQXzXTOmK+YFEWd9QD+OWKwGVbmQf0Tw6tG6Fikm0XLyrWPT9adaTNNvjnEgMVgwgyHlLbDnXOz4ORe06+68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=binH7OZj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZLjs2LGa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="binH7OZj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZLjs2LGa"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826VVXs1451368
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 08:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zo52MvMbBViPq0rbxALKDgNTDWskVrOQXYF6VoVWBAU=; b=binH7OZjSuchccFh
	TQeSgoaZ082lvCimYr2/uz0AL8xWGNhoCbRPgif+gh0Rtd1sdPUtuNm3V6c111Ol
	lMsSr83w7FYMfRdu8S1mqr5v3t9quTnr9M9RX4CeXCtRejok91MeSO+qd+6ri+52
	/g/3DvinbHoWNBjr9gyeCRP4quke3x2ov3AhLqgzH4Q+QgBuaOePo1PLwoiZt6m6
	zYbUa88jESItg1CX27yfBdqakJEqRwdiFCgv3RGJTn7YPB1yg07ETa9YmOejKVgJ
	CsFQFXOqWLu3nYGnTSRq5b9nYJkqCZqnpXNcYbCo7TmPIhVZjilWTROZtO31hPQQ
	biPmKA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gebsx11f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 08:24:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c9e97b626so1534011cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 01:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788337471; x=1788942271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zo52MvMbBViPq0rbxALKDgNTDWskVrOQXYF6VoVWBAU=;
        b=ZLjs2LGapL2m0EWHymMXmVl7grS5qQyIrmJVsQkEj6AF+ly3QMrwL4lJ89KqowwOdk
         h27PYtNwpwHxM/mhsDDEc13LFmPmprObAS91vL94vEczyiQ6fzvxKvqUjeCbFPmiJo3b
         MOlwvhsy68POCed1w+CnbdMEj/aiULhzqASz+/wTdQWymDEBrggAqoSkDOz6kLc4S6dO
         bGd30QiFPuqKlSoPuFGWmiD/xSXQ0zPRT5/ESouFNuIaqzzG9t8WLwq4M401EQreOrIw
         QDXeYFR33jGpIXwCTaLDpddEHCLzeNsK5PuyqTJ2A8S2S1hJobElD9QYmeLrdEUcR7DP
         LBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788337471; x=1788942271;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zo52MvMbBViPq0rbxALKDgNTDWskVrOQXYF6VoVWBAU=;
        b=Bb1J3beiiq4C7Ed4HLvTuTbQ0doKWj54aiYhcNIpUcJ9NYoQpFtfGX/JtqO4ymS2MO
         19BjsS/TyqDaLF9NhEwy5N6ZHHKwZQ6m7cR7zBtGga91wubqn+a2TKsj7LjI6Z8Z7zvw
         NlvFHzG25Xq7yhJj/gIbv6huZ50x3ms2N8+68JfkVxwqSS+jPwhhXcwPK8QYv58n4CW+
         uEppAItznMQsIXG8KUjToRjhhJylFpinjLEH+Pb6BBwd/Se99U0geXHvwvTy04veRVGd
         E8O5+NWZoRShAEGLeHY+KvsGHlOVqcPy53bgaoPwE2tqvnAEnlBTJLcLoCj7jZqaZ5lK
         UFrg==
X-Forwarded-Encrypted: i=1; AHgh+Rozuw68Al2tscHQ7ACWrHE6SLJaaRTcJdhvTAeofHt0jXK/8ZoLJnq3yKRKH8xSKapSQw7JyPjpXEQXhOOa@vger.kernel.org
X-Gm-Message-State: AFuF++mjkgQ8sJv023fHojikWPSa9U9yMBGayhBXlGh0fawyTpD08IKM
	EaIg2fryZ5J3y+iJhtcSnZyRrwm5MUFSDSrsVOz/+vGYeiZV5lvxurQcyOryh9WbHp6ZLGhyDBr
	45czhAhBwILl1a500wWP++uxzceS6TkzmL8jhoiX638+mdVn64Yvzp5cq4s+j/+F3kgPE
X-Gm-Gg: AYBFou33yhNPpDG3YZAhImGLG1IqR0Sth8kI8FlruRikXdZYqKpBSCQIf72ZwM3WvLW
	az2dePN/J1mSQaxNLrXQA8mOHEqgs5ttHh9V3VnNFKFS+nKyvtmS97HvKhcWLj2nqI29s7lLJfW
	+d5Hrq+XC6nt0lNiODvKsTpIvdOP1eF5tOpTn0x7aK9GFEwjPg1A4RuCQ+jpJQbA7DD6yG+twRd
	6bVMmz+QJ3dotsFuLHzcxk04uSA6tMVyuLPO6V1PZWIdL2BNdOeReFuvvU9IGh+2JdFHF4wD1QP
	KiW/CinLjnhHrXAMPntIBHmGxauVb1TSKIX7CFS7nekXx3Z+hWRZ0o1u/ufzOnJpO2qikZYHYBu
	xSmUm5SockpHzVLXT3zmYJw==
X-Received: by 2002:a05:620a:444e:b0:936:2f59:dfe4 with SMTP id af79cd13be357-939608b0e19mr205846285a.0.1788337471109;
        Wed, 02 Sep 2026 01:24:31 -0700 (PDT)
X-Received: by 2002:a05:620a:444e:b0:936:2f59:dfe4 with SMTP id af79cd13be357-939608b0e19mr205842885a.0.1788337470667;
        Wed, 02 Sep 2026 01:24:30 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d002e542sm89009966b.14.2026.09.02.01.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 01:24:29 -0700 (PDT)
Message-ID: <e9a0a9af-defd-4894-bb3b-e6e19ba3370a@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 10:24:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] usb: typec: mux: ps883x: add a delay after writing
 config regs
To: jens.glathe@oldschoolsolutions.biz,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        stable@vger.kernel.org, "Dr. David Alan Gilbert" <dave@treblig.org>
References: <20260718-ps883x-disable-usb4-v1-0-cec86d0b909e@oldschoolsolutions.biz>
 <20260718-ps883x-disable-usb4-v1-4-cec86d0b909e@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260718-ps883x-disable-usb4-v1-4-cec86d0b909e@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EEA49WI3Usj1Y6RstMt0RmfDI_OwRLil
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3MyBTYWx0ZWRfX0gGnzpSAadv6
 T/vOQBW4Yy06pZgUG5JCF6mS1xDunqpYhj+ESA9mAaJ3RAAsNPdXGq/mX2X88xM+zR4ej9hIhxy
 7B0WE27S1YBC0ukxAE6uZ0DemckYKs8cEjc4Bd/sd24FxV2+P6Sb1JvNwBtO3boAw7UBNEsKb0+
 LknMCyzjNWzcOYfqf8T5LxqweaoM7gtXcw1meft01XM8VY3wKnEhtSuZ3G8spHqSfaX172ccBiI
 r123C3mZ3IJixAn6dATJNJV/p5W/pTYORNDO5ZnkaKMs7XTS8KkubftfrW/ywj26n2GCCGDJQMg
 KrdheND9WNxE/B/Magy7vpZ6loEP1mjhBSIiLTEpqDFPfENCwzuMG9EDEkOL+wDuMN9kyjeHtUR
 Qhd4CfIPKw0XxnMWI0dO3Q9wMCbx1Y3/qhkBT2ojbPG/Xj3HDHXmuwUJ3CDWp54UVr2o8+4HGjq
 LZjjDBGLGyEFY9RdCig==
X-Proofpoint-GUID: EEA49WI3Usj1Y6RstMt0RmfDI_OwRLil
X-Authority-Analysis: v=2.4 cv=AufeGu9P c=1 sm=1 tr=0 ts=6a97dd40 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=vq9KN19LKcxqXYNRiqoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3MyBTYWx0ZWRfX5q8Z7lcB6nko
 kKCcKU+LfX9pAbLPSCM2WRZaECShRUfuBUNgVCiFvYc0N4feESn26nM8sS/i+mbZTalPJOsqNAc
 DVzJ0r/jNb6Z5kjT2+4zVO9MBHLW+ic=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020073

On 7/18/26 7:06 PM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The config regs seem to need a few ms to propagate the changes through the
> system (like, PLLs). This improves the hotplug dp altmode success rate
> on the Lenovo 40B0 dock to 100%.
> 
> Tested with T14s G6 and 40B0 dock on the HDMI port with a type-c host cable.
> 
> Assisted-by: Gemini:3
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  drivers/usb/typec/mux/ps883x.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/typec/mux/ps883x.c b/drivers/usb/typec/mux/ps883x.c
> index 3533d4f363286..3ca2952e6a0a3 100644
> --- a/drivers/usb/typec/mux/ps883x.c
> +++ b/drivers/usb/typec/mux/ps883x.c
> @@ -185,6 +185,8 @@ static int ps883x_configure(struct ps883x_retimer *retimer, int cfg0,
>  		return ret;
>  	}
>  
> +	usleep_range(20000, 30000);

I learned our firmware (which drives the retimer on Glymur, instead of
the OS) does that as well.

With Heikki's comment addresed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
