Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86FA49B5A7
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818565; cv=none; b=vA3meqiqA2lT/HhzjFg4VGCF7ADMirBdVanO/zzDCqwVGilYagVM6sN7yhQb4k6iXUQxV4H4at1jiCihPgIB1JGZMA3pcBx0ScDC/UdQbEtepcTCIQb1QjgBP6i0Udj92A5wXG+8fTicX7rF2tssy5rBm94B3RKeXX3/pU9yAm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818565; c=relaxed/simple;
	bh=wLO0SDg8LbE5ewjmIzhxAYd/FbDV4A5e2FGlHVhYGSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xwn/tlWIYFNH6ZfYZEWxC36jPEvRcXuo5yCYrXtJxK+yi4HjpyziKS6XtGiDwIZRn30MtiSCKPWObq5pRZQC5/YP7fw3xG/iC59nZnqAZyg5p/sVv8zNE/s4Uxx3+hsOAlVox/l8ukO6u2fP8UMxUai+RJACSNlIZeVYuFtpdaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KrpmS9YM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RxzfVnkO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KrpmS9YM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RxzfVnkO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0Utq3293118
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N4v6rs6hZatKqUXv8cQFe2xzrddKsExWmxLIfwuCePs=; b=KrpmS9YMU1iWHKP+
	7y8K2Tzd4971JmNE8pvRL34NzAb9Xy9s5Eaph2D3xU9nUukxOwnmrdeOfO3PPUCK
	FPx+a2XUTOt0MiGCvnTHqQ+Iv1vO5A7F/v9rp+2255NoaCyGGHZ7r2AUI2fejU1o
	fHtkKrwVdUt8knjs4wa6ykkCWn3kmOPZAa7JGLtQClZJ1n6MnAukqeZTnwLWBLtJ
	/bSZ1bZVHV56WlykdZ6PnPSKxe0rb+BoRDO7akVz+Adwb6NaMdBjwsuFURHM5W3g
	wnzJXqgoYSuiaIrbffdFLC7q0joYk7uXaP9WM/Aosc2uqePdC8jHEJqSOb+EoY5L
	Hom40A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3j1dd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:22:42 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c0e2566d30so38475137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818561; x=1792423361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N4v6rs6hZatKqUXv8cQFe2xzrddKsExWmxLIfwuCePs=;
        b=RxzfVnkOM0dccjk9oPy5wsEMXr/MPC2kMMND3mpcnXNd5y1Ie1iR20oLPoPBB6hSYd
         DsbPovlpyh612d4cVIv5aFoqIF1pq2PDurTPNB1SJCnhvWDCjI5DWG8TaQJ0S/0Lgf6K
         c5P0E1O78/U8J4m+dlolUK+C5xvVNzuzLmdS6TgZUO0gnhWzDjzX3enp2HA2Kt+qqXFK
         yQm3xss85SO2+ipq/2szpc+jcUEBnoDkSDgsIv+GeDm0lHDNqiQpOaxe/86LJybf97U5
         JX7/QDwf3YnhpZ2qlUNu6Yx8rTVGP9z4Pv5PEHmoj/tsdVs4+BiS9ylSBpIXndmqhqXh
         u9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818561; x=1792423361;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N4v6rs6hZatKqUXv8cQFe2xzrddKsExWmxLIfwuCePs=;
        b=ZcfkgRIVRvxjqu8hD927jWh+7xPgnL5TybePB/KrcpidYWbqJGqZ+EHSw5sFXb9SKO
         lJoywl2Xv6cL9uDOMxz36NdtHnG8JmbOCaQ3pGTmcPwlGVXreMOgtQ1T9hvq1RVlIIsH
         hdP1gIYKw7sNW8GoS+D0nxCRIBPQqh7CDCNAaT2/n08WqJjscQIIqpHbZ3FFiWWyxOXQ
         +sVl7oCe58R2ULC1qwM3p/FABeN5wJamKWV+VZWUvCZKn8AQyJycGf50919CzVhI5y5d
         N5E98ttaee2A3+wNyd2SY+x2JYiHpE4676vlBliGK7TnAtNd61tolQFHCe/77SeZpV2p
         IQXw==
X-Forwarded-Encrypted: i=1; AKwUvBz5H8NVbnhV4GrDMuw/IarHbrkWIU3haGUKMTDDuSDy7OUeRxzNbIrjyqmHm4Jc9KegUflsJfaNRxpQ2an7@vger.kernel.org
X-Gm-Message-State: AFq9FYKjbCRKomfLX0ecBvKsS80uCPNVYQBqfXQm5aJgHSDkhh6MsoBa
	tmwPzD/sqyv826RxOjKA5TMiLvuT2N5JRYClKi1ki3TlmPg/HqXxGLdvNNG8A9f/WPzWx3nPvhM
	H4b5R8YhJqur8RcR+hpGGBHOVNA/bqTnN/CTMcyQV+vl3+axv4A70pBtiMd4ULVPVoV8S
X-Gm-Gg: AYBFou3X/d75Lc26VTVmDOfbozDS17+uv1fvgOj4B56XwiGkPN3eWl6vWDCtZxwFEBC
	ci6+bE+wa0E6/X29g/n36Kne/MJT4DisxYah8iUaluU+6bk0ewsQoTGlVs8nv23ZtCg9bknktbZ
	GjUxuQ8Pd6qIfEW0obbolXqvQ4U4hQB8tgh58GdJ+hpK8TzmJXthxXSwLwq8PdJM4U1x8UHVUnf
	1LnMST6uK+KMvfWK1i0x+jAMHVzASsVT6GiCEebHw7hp4sutmEdBPqLXwFMrq+MU4i6FPZ+Pclb
	MnXHJOLs5CPYynxc8CDH2rapk4SD6CF9ICh4+WDyuhxzjzA/UldMokH2vWMg3x89cFJNJCuKvvI
	B21K+lOhVNhUh90gUu5PZPw==
X-Received: by 2002:a05:6122:464f:20b0:5c9:91ba:5d7a with SMTP id 71dfb90a1353d-5e91f232dbbmr1995731e0c.1.1791818561178;
        Mon, 12 Oct 2026 08:22:41 -0700 (PDT)
X-Received: by 2002:a05:6122:464f:20b0:5c9:91ba:5d7a with SMTP id 71dfb90a1353d-5e91f232dbbmr1995721e0c.1.1791818560645;
        Mon, 12 Oct 2026 08:22:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a9f776sm472745066b.48.2026.10.12.08.22.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:22:39 -0700 (PDT)
Message-ID: <f90e9e64-ea08-4264-85fa-79fd72e06e0a@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:22:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/38] arm: dts: qcom: pm8084: Remove superfluous empty
 line
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <5b04cfc8ded6fb16cf87ef9e339274763b0c8fe8.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5b04cfc8ded6fb16cf87ef9e339274763b0c8fe8.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX5+d1pSZKgTCD
 PIEh71D0mE8ORA3JHCmQ88kgbbuojXS/MxQdy2xg2xZ/NljcN6CXy3Y2wbPSNfhXZ6jiEBQnB68
 7kDIAy2GjQDSK/OccH3BH4n7lrwJEZCNHjZsGeIS6dYBPV9wbJbM7Kl3E4Wz9fxdcyF55sBlkWn
 PV3SG3zfMdC4erWlXn4m5m7OLXMlZuY1+oXaT0JSgQefoCFCSeEM3vjVNRBf/2uDldxCVKc4hxF
 ZN/66rnTuPXrh8D+geUdqdA1wX+O9uOyGn2L3XT8rytCROtG19Yo02I1C4mkEesRhr6aKaBOp3e
 3U4R8c5XMaugsphLwdgu0A02OAZ+8s0+rdEDWRUdGqANannPvxi9TCxV7/IvyAnGI1RgYIu86qf
 hZUfjqsoj6O02/9on7dzpqQFBtks+DsBTg0UtgmN/2ReFXpvxmCgpLN2zHZQHNqAfmkn7syKkkL
 ABU5LZiCf/84705+zaw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX33c4bvWGSVVL
 cVYEMrFHHgkPNGJFn/X/nwmGpV0omkLwyAQeQzespSORaGyQo+/TBp7twoF4d8S2DxHaY1dFROp
 zYgG26pXOO69+C4cFdwOEsDU0JvmJRY=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6accfb42 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=YXrApte7LvgGaje0e3AA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: OrApO4d76bl_njWawgGoPIJkpO4whsye
X-Proofpoint-GUID: OrApO4d76bl_njWawgGoPIJkpO4whsye
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There shouldn't be a newline at the start of node definition.
> Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
