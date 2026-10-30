Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364618;
	b=VPVPOuRTjCsSKTchdaes/hAHCqHJQlqoZ3FiwQO04QbnXZmFqjHf4oZufVmR28U9ORDL
	 azW6eiXMWjMMn5Fa1SyGPEb4mGJ+dYHoDqAKaTjXtHBW9wk3Sx/A3t2tEtvkD+nN5BKXA
	 eTqLEXUCTbWZvNH4MuWBhQ0zdvey0R7XMvtpIbF+cbKPADzaz0dGoASfTZWJ03Kh8NVzx
	 952BRiER2X/BMVgWbqEcO4MOPq2DZJ+uYoURgl46AnzAm0cc76XB20hCQvoItMyozhrOQ
	 I8agSvfcJ4DgMkg3tEfy/FSeL7SI4qG9F9Vmi9V+GUNebMKbQLF+/G8Jj17rXlairfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364618;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+36S2XfMH3Fmmp6nC8LledtkU6qCJGGKMmxe5Dy6N18=;
	b=DtxgxDU1W6S0vREt0qXMa/rdADqTwT9znUG8/EXSgNlUcszIpPV7aBwvFozg/JTgY1ox
	 Kttu+NjnlVU87ux4jybI+D7Gw18oH4RT5/OAtuogfE0GnPa6WAUL86fhl7IPFIKW82pf/
	 eOsB8ktsX5zS5c/q1Ikh17OgK4TiUSQdMm22VwQZYVtftQ4zsOZqL5Y64nk1+aNUgQQ3v
	 GuNomttoD5Bu2WSQnjXUvDo8zsJTAJ/Hf0e27yGzOjURAK5HcIfW/vTtJH4ltHcL++1XS
	 entmyvBp/WFSXDUcqoEfj9mm9t65YEVf74E1Um7nPc3HVbjCWETotsepCOAykdS2joQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ScWgBRoi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fr8tmmEy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD254606A324
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD254606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ScWgBRoi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fr8tmmEy
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG7Cl2541611
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+36S2XfMH3Fmmp6nC8LledtkU6qCJGGKMmxe5Dy6N18=; b=ScWgBRoisjo6bcu7
	P5SRMb1wyAhYpNggksh+eq+iYxsVYjGMrxjc3KYI8rijyR7secQ3ot2dfUlEYSql
	KttF74uobKkwHgM4p+tfKTwDGuCDB6zCNz2mvALPEs3FD2PsooWXRw4Qk7TyqkS5
	P1cykXo7eDnV/etd686Y2aUv2/G4rFxhsx4kgzB5ofN5UF2SAtJYbg6jSFMrcUCQ
	o0UPXiCg6mZlFFEgGhVDKcYaxIGDKSAGJpO1kAsFEKgiSO2LP6oVruFdok3N5+oC
	LuCL8ekSVMdsoAGF3smEpInCy8xopFJVp+CDUP8M7HXMSupbTvuAYRtpZq3r/Bsk
	ldT4Pg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qk2tm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:50:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e58614290so2803685a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 05:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364616; x=1793969416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+36S2XfMH3Fmmp6nC8LledtkU6qCJGGKMmxe5Dy6N18=;
        b=Fr8tmmEyUbTYsgDcoqM8Co4LLyDE3W0g/CEm2o3CElDpiy08PqkZoU4enMqNVaVYIf
         dmohnJNxXdrofJNRbwihwtuq3wgVorSx+1k5f+VdnwZBcPGgZaNsMal9dAU4B/eXMrPm
         UaS721UuBOEefzrt+1GpmsYPQ6T+0GW5aFqBk+GAula3HB3BitfqDKTdj9TL6E70yfRH
         qW/9ku3lly2ReVVYZe1TfiG/5PzZBnXY0R4nepFAZi/+DW3aOVU10Anh7PVEg8DKTlNs
         G6Cbb0fRY7Z6xd+0HnRpSzK4m786Ip6OxOZQeEjpvfIfkQw0dmW3EyMAoplN32HBPZeC
         fXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364616; x=1793969416;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+36S2XfMH3Fmmp6nC8LledtkU6qCJGGKMmxe5Dy6N18=;
        b=WsglIFTcUU5XaBtA4eOKUufO4bCwVzVFt1P1KGsuo1wGnc0ebEO2ui4a3fsFap3hSI
         z+Y3SpXH9VvjaaynXHlY4HfWhXMhPk6TCRnu0KJIWGiQ3shVl15V99CTEApovLOHWeeC
         FRrwk9G1WlcHMWcv80V1y+RUYI/pWi5HQbtIy6/QCihmj6AsKGNmPqxwAJzEjq9oUSTc
         G4KMeg3ESsJizNvMp7pyeOhxfQnRB1whJA5/8XofUTxtUYs2zujJP92zxhalkjGiJpE0
         Q6wXwQ7dObiwXsLImHkzCwZhobh6oxCpGCJqYNQiAML2wlKcsYhOJttBWSgNzyj3MXm8
         E8BA==
X-Forwarded-Encrypted: i=1; AKwUvBwHIxUaJ3aYJjzbNFrqNzxwxqoYQqOIR+K0nHEvUmCJVsD9pV4yMWNGNQ0KwF438BNQQZkKMziaUUmLaaA1@vger.kernel.org
X-Gm-Message-State: AFq9FYJAQcbZ9rMDRRraWMsQPItyKJ8FShD3JU85mlKDqAr0KMabvRwr
	5dSiJw9TW+/+q4QZZ3WxiOJcsEnNfsX7wspUz52ONXl6NTH/5uqx07YWyZk70ARoqZkroVQ77kk
	FtEdHNtPuzYPu9M39De3XQGo3PQ8yN1j93HfanESSa9H5viWcjGt53bteajMhJoo7+ZRm6mIIB7
	SI
X-Gm-Gg: AYBFou1rY1g0Wu2bVUCvq6d4IjUAxScc91b9Z4BKXjETjbryB/gpQ2pao4j4MKd0kHI
	SY0y3ZLiOLcIzIBPdMrQQW2v5Hpbf3uUK7hah5sCI6If094fUdjLZgt9eULOgZY4iVkmjkfF4Ri
	QLtC7NvgPcnRRblHnDeZ3ItlzAHi7l7y6PU8JvdttMnxtzGu5STenUQL3I7YYWndO2U/k1/XaBP
	dEpzvPyMHV+sKRogb4BB+6gho8GTuKp1DEM4XRHeRAyDN1CVSU96EucmfnvcC6P1xVNoqLTlHsP
	5wp5+0tA9poJ5WeYasoQ/9jVKp75dvXlzkZ2UvapRhAf6boTMJ3WoxCRUdrEVfDU1ZqQPxhfMuU
	AS1uWpr8WbrwE7yeY3VKvLVjst1csAA0WGa0ZyhRYlcKpuk/coOI34AjCc35Jr7kZyG4doT4=
X-Received: by 2002:a05:620a:a8d5:20b0:93f:1eb0:88bc with SMTP id af79cd13be357-944214c4e2dmr364701585a.1.1793364616043;
        Fri, 30 Oct 2026 05:50:16 -0700 (PDT)
X-Received: by 2002:a05:620a:a8d5:20b0:93f:1eb0:88bc with SMTP id af79cd13be357-944214c4e2dmr364694985a.1.1793364615590;
        Fri, 30 Oct 2026 05:50:15 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe8f9bbsm62954366b.67.2026.10.30.05.50.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 05:50:14 -0700 (PDT)
Message-ID: <415ffc75-d1ed-4540-9a55-dde0f6bd24cd@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 13:50:12 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: Fix GMEM_BASE on a8xx
To: Connor Abbott <cwabbott0@gmail.com>,
        Nathan Chancellor
 <nathan@kernel.org>,
        Nicolas Schier <nsc@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20261029-drm-msm-gmem-base-fix-v2-1-26b338471b46@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-drm-msm-gmem-base-fix-v2-1-26b338471b46@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX3CqbdKPnse4U
 2wGXhBUqZRZHJLyEPvmQfdXg5QeCKBhkYSd3LPP0cHVdP8NDrgoV7571kp+cvvOo4RecwCY0NIC
 S+ov7E3NGNJVT4sEHjhVHZdodTbhstJh7nclQpWc3uAHujqPr1jauBrZrf5pG73b3Hmje+ms5df
 vPFKVMlhG4eeG58uzkVxQudw1nJyyRfrm8pwNFNLePCm88a3za9Kz3J1YepzlQwp1/AzBHbjUkf
 oMLaYPGweK00XwJQi2rCHTuxkKxJ5g/btF7DfC+gPWquzJB7WuwzyzSYEqdDhuYURevZZm53EQD
 EL7rIUhS2mrHbaPEiK5yiBCcgQ7nOQtYJi8D4vUqPLE5Kx9ZLiE3wxpDpro9FSZ8mo5OeeNOzLR
 /ZXT6suTsDvacdZ3A2VQaaWqAfMM+UwlzJq/MpMFAElkVx/y/IOjM1jTFK4DDSLHDEU8/VBPhI4
 XhVbHr5Nvb37mvxE6Rw==
X-Proofpoint-GUID: 8uTLaUgLEKOVHoSpNvZBdK-Zh30X1ebd
X-Proofpoint-ORIG-GUID: 8uTLaUgLEKOVHoSpNvZBdK-Zh30X1ebd
X-Authority-Analysis: v=2.4 cv=IumL47/g c=1 sm=1 tr=0 ts=6ae49289 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=XAuXcVFvbmlwbjzS6hgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX5xEPXRIyW8+5
 OU5kR91PUpSkr90O6G5vAkZTAwiMBOMVwE7Cyq5XJL8w4ymRq4W0lloNYsNesd/V5IlCKJVZEkj
 GDcsEa+AkKVf/Ne2T/Cb2vCxkwC0Md8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300051

On 10/30/26 12:02 AM, Connor Abbott wrote:
> This was missed during initial bringup because GMEM_BASE is not used
> anymore for textures on a8xx. However other things such as mesh shading
> still use the GMEM aperture. Fix it to match the value programmed into
> the registers.
> 
> Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
