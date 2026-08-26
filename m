Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8608737CD29
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735364; cv=none; b=CuCns90aC3gRGVwNivM8uP/ebKcX44228g58bXEFYAv0PRpj9Lk5V4YTvO3I7XtKpkoNsqGdqevW+QOGRYz8COjfDFw8gfmBiMYBf4DUlITvqvxpDWibAs5LDfX1cNwRARU7Mc2l6YDMhCj0QlZDqm4OcY2k2dEUDqfkhxCJK3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735364; c=relaxed/simple;
	bh=fVZb3hlfvSYx7/7oA1wKCbINApD/1g3mdrNyA854KYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jKlKnDGQsbHuu71j+nYFNDvPb+slMJx+BUr3QqEec/U2IfY+aAquKqPybatqZObGVH/apeTX1Jk00eipr8Yi7xkDw137Id4ylD6xyPV502IsezYaWWz/5zKOstvAIQkU657NwwsugJG3hYLie+DXxYFau4306iHCNxirOBQQa/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=myAFVSaP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xq1DX45x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="myAFVSaP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xq1DX45x"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6RqaB3210733
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HJTeMn6x+gmnlbmnE6fCgEjecytS/hHGiR+pD9B66uI=; b=myAFVSaPgWIqP+Ft
	fNgo62D3rHNkTjzreTIaQKMLGDhN6GQU7BOWPsihae6UuC0EttIbm/FQkgR2kuoU
	YyYoW+dpnd/OVXbAfsK46OaN+DQ4b/rXyxgKCKG9rjOvr42oqKqgBthJIqS6pFv2
	UzyEIGpbNKw1TEPbG98Ty7Cze+mwBGtmeWBeMSBDLr/Gl9jqvSzFfWzFnYX9s0hw
	9qBvs48qRKsiqp2tHq+V4h/01Bp5hPHYQfrvDjzOwzi3OkNntQRfg1kt+zwgL2l3
	if5CVrH9AhqCIgMkG3WanEJ1t8iC7i54Jis8GDJ0WUSk0r3R9LC+JSzoA8wkSgl9
	6DUTYA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fgrb41c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:09:22 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-903694fd3bfso1398186d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 02:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787735362; x=1788340162; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HJTeMn6x+gmnlbmnE6fCgEjecytS/hHGiR+pD9B66uI=;
        b=Xq1DX45x9ZgXaIzAs8it31jk3lxKS0Ruw1sezVGNWsRZ+LUTrufxZzehRjL2H4qZHf
         XE97PIdBvYAv2TGJnWlh2rTGSDHgaXHOVMQCEAov4d+qECD3gAusxYr7vC6m9Nbj1UAc
         WX1G5jDTgP3WCJ7J/PHwxafDCOUHGuuMr9K1OLuQbTTwdFZxSHQHPp/oSCl3kd9vyPcu
         77kE5YDQS38BIYt30KMDSWf2ysG3vF8cBWBuuMcE3yTp7Cv301oRoUV9aoZ8bweheD/t
         dwz/wyv7rbSZCpAVrsFyMxVCQDzWi3xWO1XGZxhNOFBskeTDlfRokswKntVN7AzY3TSJ
         f5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787735362; x=1788340162;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HJTeMn6x+gmnlbmnE6fCgEjecytS/hHGiR+pD9B66uI=;
        b=XSqnlx1JlkenN2KYSp2snywZ78K8k02NLc7jwOeqvLuu+dMOD38gCAJ+pOO7w8rrmI
         Zlrj08z//oES/YgunuwTOgBtVQK9STa7suAzMsOSBIFuIYevMU0vFQdY7Aw3R0Fxnw88
         L8SHLEsD2pTxXEY0QvvANJQMAsPx4E61vVCwwPQWW9O1btIWa8iJ3Hz6w1qA7jhawZ4k
         jcXL2CV2eqyQSOlkt7icxE/xWvNONlONkaCbwXLxYPgoNfF77YDGdR9EHti2z+SwfSxA
         vBwGGxAzKqRZ6owgsw2iixgSH+qLafTMXdioCADooYIWlJEWubaP4yF0l5jTkwqP6Dvw
         oMZQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr/Q5MEV9Yp+nqB4jBFgP8vEtXMhjKS6FDa+LNa5qgXnk8ntog4XRRfmLF77h9tz5sdq41oPbUr3FMHEcI9@vger.kernel.org
X-Gm-Message-State: AFuF++kG068+j0DlJPPQaSh0ZyncTuLampmKM4HbghfQyRmn336Uk2ra
	mYMGRClkFnWUfVH4tPHl33si8/I5pjdYwbIbjDBdSHysDJjJOyduNXUN3VHWKqvmCS9ghNKvxag
	sGLWMVzpUgMApiRoK7pyE8COwf0VTlfIXgFyg5ot8KYStEPb3BCfMRuOK1l74E7tCO9qx
X-Gm-Gg: AR+sD10fMBqW3RCojcj7nk+qir7IPQ9kFShD4pssjAGEUh8MiqDJj6GYzZ4+W+li9D8
	PpiOZhH9Lr28OOXuwUgmuOsfOSImJA7/s7Y9EHfgMsDE3IjJ+PSxtaLGcNLayFVjD6BR+usvsmP
	/FNB76gG2BqpiWa4HcsU45l198SIWyinbKiHopaUju7fXlKR/tQAyY0ilSssJYHkgV8BuWPyoqx
	RniL/ZFEGHpbSlUmO+21E24uEZiGM+msrk//Biv58ZY65iaMMhL9YOXKb8OY7cBhC5Q7Dd9Dciu
	3OYqH3KQanQXTaZoWXNasZvIzKtfaTxLwPgDbxyrt+olVyCnaGlAMA/MUYEx+DhNCfpZCdyYbnW
	GVnOBekwaUgo0PCVvaT+X3ldg
X-Received: by 2002:a05:622a:1b88:b0:52d:f626:a46c with SMTP id d75a77b69052e-52e42414888mr35922981cf.4.1787735361747;
        Wed, 26 Aug 2026 02:09:21 -0700 (PDT)
X-Received: by 2002:a05:622a:1b88:b0:52d:f626:a46c with SMTP id d75a77b69052e-52e42414888mr35922401cf.4.1787735361082;
        Wed, 26 Aug 2026 02:09:21 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5dea83a25sm3677704a12.18.2026.08.26.02.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 02:09:19 -0700 (PDT)
Message-ID: <850d76f3-d170-45ab-9889-a511d6486a1d@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 11:09:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] phy: qcom: qmp-pcie: Select MFD_SYSCON for the
 multi-PHY driver
To: David Carlier <devnexen@gmail.com>, vkoul@kernel.org
Cc: neil.armstrong@linaro.org, qiang.yu@oss.qualcomm.com, mani@kernel.org,
        krishna.chundru@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260825225729.230493-1-devnexen@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825225729.230493-1-devnexen@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: f5gmZYMg9SL489MG-NYQ3KBz3LDw_neb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA3NSBTYWx0ZWRfX4KHfhvRMglop
 QmrPJQXGqs6FK6IpoUctBOFswtgeuyUOHHLxaY3fVdPBUntIMRBfjZxnDZPOwrHC7nooOtoWAvk
 ud5r61joxz/gM2jn7VyjgsxOVi5Js16buWOK3jh5v7322r5H+2+Ci8n/arpMujlEKJYf2Pc6sD2
 gr4Hk3Q0TUCgDdMOjdKJIiNiYt5P8mhGwNO338BPAMAyfzA+vnbs60iTMBj8kpqnCYxkHAZrsVT
 2fqO5yYqFeLIwYRv5OJg0UVajkHnG6n4s3Q8R/VctFQiR397KQMr40Hf0A3bsGVeyqmPSy5ZAUP
 T1sH4FJaBo68/FdluurirqpucoPMiO3AeXSz529SGMifH1MFVaKGsPckCOrwwCQ9IP6lQO8qyOu
 kU91fd7icVQuPaeUnrilW7v3u6gz1POOQLPJagzD983dKZMFLTws1zVtBXMCB+hszSL3mi7NwSe
 8MoVzK8SVL3LjRLSJZw==
X-Authority-Analysis: v=2.4 cv=d8LFDxjE c=1 sm=1 tr=0 ts=6a8ead42 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=E07dJwykKe2z2xQ6SqgA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: f5gmZYMg9SL489MG-NYQ3KBz3LDw_neb
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA3NSBTYWx0ZWRfXwdIRxGdJgfks
 rLGUxp4/dG+wYsMuP76i89BKMD7DjA/XTF+KNCrs045GdhTa/g7s0w5PhFgUbV0QxfI+pgJpuAN
 4lOptIBVuddNXZzBbAyjUqbUZ6fLz6c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260075

On 8/26/26 12:57 AM, David Carlier wrote:
> The driver reads the active link mode through
> syscon_regmap_lookup_by_phandle_args(). Without CONFIG_MFD_SYSCON the
> stub returning -ENOTSUPP is compiled in instead, so probe fails for
> every device and no PHY is ever registered.
> 
> Nothing in the build catches this: the driver still compiles, and arm64
> defconfig happens to enable MFD_SYSCON through an unrelated select.
> 
> Fixes: 1781be3c8a5d ("phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY driver")
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
