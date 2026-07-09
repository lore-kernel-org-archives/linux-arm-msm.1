Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A35405C53
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 10:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783592684; cv=none; b=jPAULGXNNHWs7DI6eS3btS0xbPWlZxY7MBEvltGf88IJBtDXZitK2jThYVJOM5QgGhm5rX256VDNUA56/d0DgGItlOFjrl8jMMWl7DoECBD0vrUPwbUi/1xRH4EisHS6Z1QVhOd7hiXBt7/o+2peEH+uCTRlnk5N7i/akW/aHIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783592684; c=relaxed/simple;
	bh=MBGPI8UBVjEAx8vPEBWBX5tpzb6M1I2+YOHMQXF/QkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rC5DQKo17avGAQUu4wBBahou0tb8wKZghGSypsCZBixp+tDWk80qgH5vsP/xV01lSgqRySO7pbIjhXtAtTzSxcCdlbuFG4rW8RLWrka6qNaotYmzP6QkP7fLE5VLgLKtv5WwL1IBgwup1Jo37VuAnUis80MNHsvAZhmQtL0Wais=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcVDKQ1f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RrzQ71P3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcVDKQ1f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RrzQ71P3"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669ANdej1315283
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 10:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DEb8PYcLVh0W3xZwHC81e8uRg/I8pPReRXKyfrU7t7U=; b=mcVDKQ1fX32quhVL
	Vgf9xNpibxLnCIyjyayFqngppg6XoS2DIPJW9Cl9uQ9R4L8RlaJ8YpD+buLDEsSj
	Y+bXZgtTh+PGK+KQF2Sl3kR/Z6prtJERbv1PyU+8KtUuDiipHepOhgHyTyMuq1qN
	+wSoECKq2EAnSE6RRyTNPbY8GMjpcgEYNQ3Y7+72/dcq7/VIG7epyk5iQExGu/tk
	Esgl3MgL7w0KTsGMiBcVKzeHNKkwX3P3wgNQEGM+da9xeFkGUzJJadwDhGrfXkXs
	SHC+SjEaDBkUqnZwkrSUvJNv+eLXlS7NAlhNuYTc0xpniny1PatInV35NEEV+HKD
	GAE/VQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa55vhbas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 10:24:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51ca37ce4c3so237081cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 03:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783592681; x=1784197481; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DEb8PYcLVh0W3xZwHC81e8uRg/I8pPReRXKyfrU7t7U=;
        b=RrzQ71P390OoLPHtRAjUGW1UyxGp5KZetmASJz6pyAGfoZgQsRUSLIUwxTkSeQS4aO
         zITpBpRq4h8ehV49B33OgrHE+eu1Fb8896x9E360zK1Bd3qZwxDw3tTrb77M/ADVJqM3
         Erp5tNNVeoyHsTCCtDGHH/9jwPB5L/F+z9mCJCh0UtVQW5emtf4DiXLYliJdPBzA9R8Y
         8f1IG3ZwopQyMK6fXVkTY/2P8RcOYiv54DKyd8uceMe7izZBRtb+988eroM4WcSyIdWg
         RPpZz8XikrkKmQkmQbvEQJMoFLlhpSPgWRJx2h1p/TrCNMCJ90FxjdrGZuQd18lLFz2n
         yvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783592681; x=1784197481;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DEb8PYcLVh0W3xZwHC81e8uRg/I8pPReRXKyfrU7t7U=;
        b=bvQDDwQEYlZ2g99P2nqvHt5/7Blsz/2qNDpguo/RCBL6tYETbFXYMQFLKQ0YIY5g28
         q3iDWR6ZgG4ZHpcXn184gkqBeiUpEU4w/aMXzM9+4nCihi25ly9Z2MMa4lelXg4Rq+cZ
         6JaFXtsA3MYw6lC8Af7/9g0ndbkfuI+s5tBa6HWS4XQyyhDkJeYN7PvMiOnobrnkAghI
         LN8fK5x0S0DV6yBDqroYWrbqu125szcjRnSdJsFQKIDeQqgbgS6mkO0xow+PlAB1a4WO
         d62rM03p/g31TZRcAOLhcg7tr2x5akAHYN6fOl8QRRqOiGyDdHMQCnIs0nOxFY1ekxvU
         xygA==
X-Forwarded-Encrypted: i=1; AHgh+RqtdVKbczzbG6SvcGXcDDf7TuZc+DnRXz01y9M+wdCLR0HCycD3T7r/YTs3TZRR9rzVWUD0omUcTyiQwa8Z@vger.kernel.org
X-Gm-Message-State: AOJu0YxapuVQd/08iMKXoBFGh/63BIRoOJvSDegj92sqS9pZpKHyLwsf
	Y0YdW830TK4brHsE2f7bInHFDmZFNbctCaU2GpU17rxH+ZLUWzY7rUMeRjfJcw/k7/1fHxIwZc5
	Ng5STQFv6kLHpwPGiYHvI3wp+yjtTbk/83kyjMYLD5r+2+hv4F8CNVaDMVNbBjzdqvzSt
X-Gm-Gg: AfdE7clDxpb1fJTzUvsr/Mu1i2O5R2vHfQ6VKcbOS0dXNEmR6Y36/vNciqFa3sNjuUk
	3kwBhOQIRkQIUwuHJe0KzydFC5TRU3VuaB/lwDapI1/DCaGvUSVC6iw7jlp6aE6whbNSsgsTkKE
	8AD0og9EZLfPvcRlgStjnN28Md7+NCShcyL5pSFBbPBSjQ3D291WJKLHR+QnxeunlLpRoKAvgw7
	Lv/kksAE19oFt+kQlAPL8BN8ny7LWM5VFpGDzLoDN8KEJ9iJkmTf44vym6Tbhevr8wrHUsR5LIu
	uSEXZegX93W2ntXusp5iGb88KcMAI6JSUMNeYJsXyTFJw/BZeJZyRoSPapSTk0dYGP92I9NM1h4
	XM3IoevgEOIGmGD3SLpWdQ8qWprRIWg5/Ln4=
X-Received: by 2002:ac8:5acd:0:b0:51a:8c9c:7de1 with SMTP id d75a77b69052e-51c9684058emr30850441cf.11.1783592681230;
        Thu, 09 Jul 2026 03:24:41 -0700 (PDT)
X-Received: by 2002:ac8:5acd:0:b0:51a:8c9c:7de1 with SMTP id d75a77b69052e-51c9684058emr30850291cf.11.1783592680862;
        Thu, 09 Jul 2026 03:24:40 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c63c04fbsm285215666b.23.2026.07.09.03.24.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 03:24:40 -0700 (PDT)
Message-ID: <228a2e14-bd33-4d41-b48d-9b477bf1f0aa@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 12:24:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: kaanapali-mtp: Add SoCCP node
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260709-knp-soccp-dt-v2-0-6e2bfca96088@oss.qualcomm.com>
 <20260709-knp-soccp-dt-v2-3-6e2bfca96088@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260709-knp-soccp-dt-v2-3-6e2bfca96088@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwMCBTYWx0ZWRfX0EVCpA22YMhf
 kPQS2ng5a5EvxoMND5aUPY9n+q/tya2TiY/TZY0fbIT2zQclu1RfokrjqpLmSdEfCbEO+se5DJn
 mD90il3HOjBCzOjkWSvz/ayIj/cZpj+/36O904yfjjnCQqmtuthKdN7+EoeWc3LuOhThBTII9dx
 zePukRfn4am343eTO7RFu4lWbUUEuDjMAhq8CwdsPDSjWaLh3GmkdUW8A4M7jea3G2r2DrFQ7+o
 rQNQgWx4CoRmxxRHbFs50oFlv3cFoaxGXelpFDHYs/tjezmbZttLF4pRvf7e3mRJ1oDOZhjw5wC
 MeM0HYF7cTWSjSuxX5IDmMkv/5ZDBrF/7qs/24gUrv5F8TrnEltC69SLdYx2aUgwtvxVgWwgyWe
 ZmwAy8kIaZ+u4ZHuzM92dekTfvhD4EL8aP5Qw09P3Rugy+inhUsbofo8mg3OkopFREq6BPosJlZ
 b1mavZGS214+iuzTZ8g==
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a4f76ea cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=xI9PflpFdleAlTMqXZ0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwMCBTYWx0ZWRfX/buOkgaWcBvd
 b5lH25cnVuPkYwXx9I49hpI1Db5QRRTVtuQY0wC0oPKpIiLOtwkjUu9Po8S/cOLPXCaW+D095cM
 ve2QTRkrQrL2rNMTl9QzQeWMRO1isms=
X-Proofpoint-ORIG-GUID: NPvCBrvtM3HKSjq8iUvZ6_dAW39-sU5B
X-Proofpoint-GUID: NPvCBrvtM3HKSjq8iUvZ6_dAW39-sU5B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090100

On 7/9/26 10:14 AM, Jingyi Wang wrote:
> Add SoCCP node on Kaanapali MTP board.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
