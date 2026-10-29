Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261561;
	b=KeofEgxxLee45MoWLUxqLCwr0p41kE6Fe++LYDQSgWdnNikPLwozSvcUsDGJaN38ioFL
	 juSsargPC7VcBoiG8Qvy4Ebz0H/3ZfH7lXLHVZGf533JJqcO7XCpvIgL8mvintNGJjCiI
	 OM5vnX+RWgrDhADyAWY9G2tay9n1T4KB65uF+WG/rfxM3rTbG0SKwLzIfDndXAxpYe6FW
	 i0TMa6kF5paAcKO1z3+tODMKgZFEe0JyF/F56Wx9o8pUxbZsqSHD0ygpPxJqe/6mJt4Uf
	 0hV4DF4KyktwvuIEYCdEyQPcqDNry0K8t20VLfU14PebsSOSs7kLajDlCF8rgu2NyWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261561;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4Gx7lqvnG/BvQzcb7FZF75lNrmiCJrQ3HXAWDiqM22g=;
	b=JP432ZRocWvb/SKO5KNLWvRMGYv4gXT16D1AV/s0/Z+cbzjNY/VVlzaPFRE2eMnJb7tu
	 LpxmhewxHn7V6nRwC6mljNFaBoPyA7lMCjXFuPu9dnmhrjgXF0S3VT2Ug9Vy9tE396flF
	 CY0A/mYe0GP0I64nhbKMftQ8Q6pntQ0ah39rF0Vmgbh3Ct897JZCFS7M93P2UGzH2is9b
	 GdwW/oAXNOfinH9QSX3OXP/2Ss3TP6chfnhGkYSum2/tBiq85xfBwc5C3sKOdmqVZz0W5
	 R1toddLcNVwa5y8ItG/tS1wGZRA1m7np3GURvS9OTJaF10D08Mhp/OGv8+3ymqNgbxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cfNAFbY7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JmXOH2jL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A151606A31F
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:12:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A151606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cfNAFbY7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JmXOH2jL
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5Gvev2974015
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Gx7lqvnG/BvQzcb7FZF75lNrmiCJrQ3HXAWDiqM22g=; b=cfNAFbY718CdPzs0
	gks9jL3tDCLNUytVxopK0FMhowj8SONPJGzNffluO9R+OYPIH3oS2J4tqtGNYryt
	aTM1g2YJ9xW86cvZXEByPXNnR23RcnKz62chCqSqK7LkQ3jQK4+Os2yH+vm2Z0IF
	4ZfjoZCyN1NBWoWXqHxokEbF6uNX3XSkpCgcYGox/eBdNAsbS2l+WXlVDFwDQSlA
	0/aXAGvJVyfu8SLKejBMJnUo0O4AbRNoJN/q1T+Uj5Ehm37qzVLjeT5bmlAXd3P9
	VJ9E14oHQJBxgMfo/8DwVTmK5tcfVFh132q/UeX/oEZok0/rfuSb7lQSDwdl4XiX
	anYSWg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknkpav7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:12:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-943fffbc5dbso39525085a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 01:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793261559; x=1793866359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Gx7lqvnG/BvQzcb7FZF75lNrmiCJrQ3HXAWDiqM22g=;
        b=JmXOH2jLg1uwQv5EuX6ntSNU5SivKZ4oqmfPYQXR4thXk+cAD1DeYJCfhISEZiZE0n
         NfSfKxmc6IwqbTtMZEHdC0gjKYvPoKISox/qt+OwLPOWN/MSx/VqHWBWnRpsflogx9ol
         LZv5UDaVQ1bUhRi6PrJoSADrnxiz2egqZ1H9rpVDVUM+KG54JTk09s9K1fGkdyqFiTpX
         nfQgfBt9VXdlDVef1LQ5gfhHl16khINIqbEvbRm2wixRdL7e+1YBsRop3ZkD1XNJkXzn
         N3yIAj2Uc10gU5TL/pDglV5Mql6MRbO/CNgfe7W0NCAZvXpOFNimyjhnEiyhkM2B7kmj
         tFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793261559; x=1793866359;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Gx7lqvnG/BvQzcb7FZF75lNrmiCJrQ3HXAWDiqM22g=;
        b=KdpyYXG50rBnhWCH4fpy4WSUTatTS8NSKIG7kHkRXL0wGIJvefLvVx95uSbx0hI8e7
         Adk6gN6toSq9oQcASKusnmn0u45Jfyr1IMyGV4y2SGnEvRopgwL9UO/gvNJ4UQZiKIPN
         43ANcCV78elbu34z1tqfPQhEpq//+jitLI5+lVJMgv1VqJE29t5lZTO0JYJWLPAaaKKT
         mFVuewPIS6OR0pfq6lenULfJHXcm4mrOwxumhrLsLF3E0u537RV0vNz3m+H9U1dJYaru
         rjA6bxldvnTNhqfKbi1n5aErA/IdYfhZ8TryjZV44V7wzRF6z0WSLMJm1i6Mi8FLxD1M
         Qg6A==
X-Gm-Message-State: AFq9FYJ++4OWyKGgWrkfsjGVzu4Y09MnVDKtqTl2pW3UdMddhFk+JYHJ
	xXVgT4mJMY3xFNrsL1+Pw1JcKnZu1nxUOQrBoHlSANpxtm0F2SJe+uaEcWL37B7kwxO3vZprVz4
	+LaufJHATlsrBkSdOWDzilNZAwJrL0/Mg3nChW+IEhj7lG4zygR2GSb3Fv4e5s8WJ060L
X-Gm-Gg: AYBFou3rK7Yr7vtew5bE4XzXCYFYfeZX/Wu+ei7ybKp2RR2phVTcUWpjgW/vyDR5SCf
	NQCHAZk/ALOeBFgK4N0GTQXfbWup14Tsmhzi82Pdr52JZy534Mcw+tLskH3Trq2vDkBoCbb+H4D
	2k2+2226IVroBwst7CYPtfYQIvQPjKumczi1iGX1ZCPsn+jDSt5Akvg3fFmwH9qM0sWI7/OLmIy
	k7IG4ivBSXrFBQGuKSsYSIguDGSYljpSUCqVGoFwcG03J06N9bCGm0/KjMcj/4qiQV24UrxFopd
	pA8XrLDhmn7OLwacZWHixJ9Q8+1OM0+PJCcYaNK2oZq/ajQVkl9F2+R4r/I31wckLa9D+rX6ftw
	/FWl0J/n/JUScSCfigjckzAPgHzoABB9WT5kF61XTBEJv2HfTOfMUckOyywy5UxLhlilBsjE=
X-Received: by 2002:a05:620a:3bc9:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-94408d42cd1mr786314385a.6.1793261559429;
        Thu, 29 Oct 2026 01:12:39 -0700 (PDT)
X-Received: by 2002:a05:620a:3bc9:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-94408d42cd1mr786311785a.6.1793261558953;
        Thu, 29 Oct 2026 01:12:38 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34fa1asm706394666b.6.2026.10.29.01.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 01:12:38 -0700 (PDT)
Message-ID: <3481d0a0-0d22-454a-91a2-45b983710f83@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 09:12:36 +0100
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
Subject: Re: [PATCH] soc: qcom: pd-mapper: Add support for SM6125
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261028-sm6125-pd-mapper-v1-1-af9a645b4b8a@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261028-sm6125-pd-mapper-v1-1-af9a645b4b8a@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ju9kP84C c=1 sm=1 tr=0 ts=6ae2fff8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=5y-B75Cv0MY6F-VHK48A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: mo9phWypNii01iI6N-1MHBIt8GiWTP3V
X-Proofpoint-GUID: mo9phWypNii01iI6N-1MHBIt8GiWTP3V
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfX05nOlV/fTvYG
 x9S7LBNBv7yunYCPiCYlOdQqPFx1tbYD6sS3zE1g5Cs3Zr4hx8xqSzMLJVQ5gbBQjlYbcX7Xlwt
 M6t2cjNS4NG5v6ZZ4jgRCm7dh5pXPn0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfX+yEBUIstCaaR
 hqO+Jp7L7H3kMw3vGd2m/IRAT6gloLLj4riyDAS3u7JaKU5adNqlyFOjUJlWqoRE1hTEqvdl8L8
 3Klmn/dW5rdvTo5HEulB/RiG1pfbp4wDuCbTmVf3sZpxdTmLxYxji/krdah3LvejfGydvTFl043
 dQvrUq26uY5PcgQsJvI1Q7JfheFhROfRXbdsWOL5GGLNbqsTLinhpC3ok2jRPJ0/nd4elOF3bJI
 ffuD73vCccP0v2aW5vL7wIxPrF79zZRJFmvbdfjS3uc5YsRBlPytFkGZOWjV0vewqmC+YDaY+5P
 XeHxdZoCqbwiKrAiqnsr6AdfLV6xXdzw1XOPTtSp3Bn8hnu47egc/RRFmYd3BN8/WReAA2gA0iM
 Tdakd6D7tCFUrFP3zDorhqaOF2KOi/3Dvn9WXyeqspRcaJuq4BFqdSUePS+3CcP82cZUbomDS1k
 8eDNoMsDYhoGQ5xIo+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290031

On 10/28/26 9:20 PM, Barnabás Czémán wrote:
> Add support for the Qualcomm SM6125 SoC to the protection
> domain mapper. SM6125 shares the same protection domain
> configuration as SM6115.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
