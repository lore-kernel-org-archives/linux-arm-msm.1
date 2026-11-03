Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793682958;
	b=JD4wvGiILuaoFINxwfM242tZXZJk/IHhSRJlIl8NA2ehauqdnRfz2wvii8bN2p9MqYKn
	 mOoIKPKMFn9h8g9FLO7YctsR2+S2PKKVqlsp816m/GfiVmwjcUzN6IFw2TjfPIPZXIaGJ
	 M3taM2UQDB1kp8P1671SSATL+19sEkJXuNewggTsiDvwwysRAYD8OaghPSR6cYf/B0RV7
	 zIRYLrVZWRmaMFxfQZVoKn0+UGU80QzynewYVX5xmUxJwo4o8o2tXGfdDlOzsprNtdyH+
	 B6nEpKAF5GaGg8N0WQf9DIskmfXtwp+bIOt3ijbs7I96f7+u0qEK4BdoZ/oszqVMvWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793682958;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xTRrlyDoy7EVZYwU152JYLRxtMJGNPslDC+aQvpyMkA=;
	b=A+KlYwiCQZdp1aBtzLQ3Pj+SgLxxFlu07uewmgeITZ15hoUd7LkDNWfpygW8J4+BiqHP
	 sssybkHV/KFLxTWvIWcT1sLqqF+abymluY6UVwu49NZO7l+ZckETLZsC6+iibdUKkIlnh
	 /BuR9T55EwMJv+GjxDuEuq/+dRq+2UPnLMnbcfLfVSHWTnimrpEcGflkWXbwu4eQAXEvu
	 3xgC2Tp46fSQ1qqxhHwDunh9PNYY6mqFTehsOTploqmucwlOiC8RcK7AlRTFh0iJ5E/q2
	 uEnJ5L7D6Q7PXq1xfAVEbAWQNlpiqzmDMwDXdyVwcOpmNXSa4ny9i6h6Do1QozXh0vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ORvIJS1n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FE+alEup;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8D9606A32C
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 05:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D8D9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ORvIJS1n;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FE+alEup
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A352kJm2449000
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 05:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xTRrlyDoy7EVZYwU152JYLRxtMJGNPslDC+aQvpyMkA=; b=ORvIJS1na4Fn+v0g
	HinKegmpNDkvU7G0tetJOyhqavkqpXre145VlmM0+jKXaQHMghxlhdRejYPvQZmC
	6nS4kryPLvxWJZ7YjUx3cgOeoMANYeUrVffL23zQoA0eta6Nk4inQANaoxJIAFOj
	6Na04QeZmKDxauru1pTAUmhHOQyG5BwRFxFJ36vrx3LjaskEmacpDlHLcm1DjEWa
	dDOoi9ocDLvy5TaARCk0nZY1PU0y8TffXMSLCjSBerZpeD/w2E4Ov61E6XzEw8tG
	D170URgRj8ylBeMEtmfx2rK6AAVo+SMtdWHXAVtmw5WP4qnteHwGNybPaxTs08bC
	OC66vw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq94cr1ea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 05:15:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab2395f104so3328734a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 21:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793682955; x=1794287755; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xTRrlyDoy7EVZYwU152JYLRxtMJGNPslDC+aQvpyMkA=;
        b=FE+alEupiVxijjhG4JjH+aGSk4hEpVFNZ36t5rFp3A3mNElh8ZiQZFC1qGwusqiV8M
         pADYaIxg4rxdM1Ku8DVzrTNHdYGbI3/X0OMNyE5P1YRi409n+QwKFEryZHnoUY952HX6
         G1oM/eEXxnSG1uEuTT15ydHu30vtEFLLdRj5vgtJqjiefg8SAnK2uaR2M9CkGKxOx19Z
         SPfgDILFeGkvXyk/FGZxvIDOo27EY1jM5Ty0Pnn1jJWnfJBypleq/q+gQUlo5th692c4
         Ll9CNanx+sRvjVf3j30fPcwWtymxvRs7Y8I5RjO4D6OqUGgmyUFTpbkrj2+aXhuDI1Lj
         MHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793682955; x=1794287755;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xTRrlyDoy7EVZYwU152JYLRxtMJGNPslDC+aQvpyMkA=;
        b=xfq6aFUeNy3QCPFKRkhBMDyiqJwz+5OyY2v5+WuO0F/wLbJuC1gIwF9pqzXAe8CgCn
         CJ3WXPlKJng4r0h0Ig4TaqyoRUAQFckaXE7TuLmIuA5qa/St5Jte/PhWsuD4Mm6uZarG
         pcAMx5j7nueUrJ39EcacGVWdDc8LY8b45emNg45LmwIPjecS1WrFICuZsnzjDf1W3VRq
         m5KO20TuwuQRRKkzAybH+d8sqIGvXZhtxRLXRutuC+jm374uaX+A6DauLQtd93xLjM38
         oi/4RPLSwi5D4zPx33p5ZK92mJI3Mvp28DbJEMjrHSVpMYEbiIBStqxI920PaS0zVwRd
         KIfg==
X-Forwarded-Encrypted: i=1; AKwUvBx+zCTsfUUlbzKFoHUQTt8hCKmfqHQJOv+pLQC1Hu/7XinMhlnCj+XoODV4d9qGCCaaDhlbBuDamjxyBhpm@vger.kernel.org
X-Gm-Message-State: APuU4Z9m1BXLZrBFeIVlbqooJ/GDt1L4T8SewMo/6fzqHQwgciOWucdz
	9ZeVF8bsQPKACCfPPr2z7LyPHOot4TMEgiU0jprtdHx9zj+sVcJzVjqZatjKyfcZlsbe09cV/IR
	OgEYOU1DBEQSzsqbwvCjrfbCbS4Kg4Smia9uHOspwWSmXtxKwOY6DlbQe8bVEyTTyJO+P
X-Gm-Gg: AYBFou2rOuBzAbU0BGhdQO1IuuRuOdscSq4f8nKrlphlcDyt4+t7gXjkFcHBYITdvqM
	Q2eHI6ix2yOcmgmgzDJq68xXK35cPK1Qvx0vtiiqwVsFtQDJ9w+90Ql4vhi3WuzWZtf6JRiHUDP
	3N66Tmzp8ZRmmQCe7ilVSU0IzX4wuQoE3CnXy9OGtrbXy77qjCfg2NxPvU9oWwBRsxj3uuTiUZl
	tvNAeHRKDNmachU9AJCug8WW1zW0hSvkQ6BcTpz/Spi1fBVaJk+07OT7VILBrjgD5DQwv6yuzuz
	4VcUBCzD4xHRoIU5km7jw5pdinfbYY6BvOzJQL48eJtC2CZoS5oEQfEt4tqOFf2k5DdOrj0nhET
	7YKF96zzbcYbvo9Gnobb2fmQ5VsqeIQkZRoRzV4Z2fhmeo/zCdtkywXYLgrur0F4W0TEW6dhXsu
	KHRw==
X-Received: by 2002:a17:90b:4c12:b0:3ae:5572:c4d1 with SMTP id 98e67ed59e1d1-3ae8986e3bamr10861954a91.62.1793682955185;
        Mon, 02 Nov 2026 21:15:55 -0800 (PST)
X-Received: by 2002:a17:90b:4c12:b0:3ae:5572:c4d1 with SMTP id 98e67ed59e1d1-3ae8986e3bamr10861935a91.62.1793682954712;
        Mon, 02 Nov 2026 21:15:54 -0800 (PST)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c5814basm2423083a91.2.2026.11.02.21.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 21:15:54 -0800 (PST)
Message-ID: <43f340a6-3999-4cab-90dd-2cf7a537f5a4@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 10:45:48 +0530
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
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Fix iommu stream ID masks for
 CDSP compute CBs
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        stable@vger.kernel.org
References: <20261029-sm8750-fix-sid-masks-v1-1-5ed50a1a0342@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261029-sm8750-fix-sid-masks-v1-1-5ed50a1a0342@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O+KsLx9W c=1 sm=1 tr=0 ts=6ae96e0c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=B0GhShHi1rKA2Csm87UA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: HNAZzn_7Pt_Kon4EnqRwonIk03z6e8ye
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAxOSBTYWx0ZWRfXzeZRgmVzg5yI
 Gtx6tjGiNRiFxcdtgkBTYz2TlGO5YObbMpgKffVreqVCa+oyHtFK6WeJIwarpER6YADKMPJ1C/x
 k3oVs2x15bbUMYZ08iw+VGX1iRe1XGlcHuOZ2CKZ3k+CK8yun698CrSHAVDe3E0Wwx5GqAIuFl1
 22xqIqQvGE/JXp4fIYe8PgnRi7t/2t/Wvj2qi3cLIqL+5b9Qjmk7rnyOJPb2KJ4ne4in8/0TzqN
 bBAnZPC/LgByMDJTpMdxQgS6QDMNzvcatQS59VkmZLXaWcbdylr5mUsBS277w9RXT2fwFrSOElf
 gphT+nWPhrg+wZWzCFPmLE7XfcrV1AHAOMaXA+I9Knx4URztYwiUlVEfJ85E/Qr+fbiGvgzzV6S
 B1W4/kXsefL82he6RxK8V1bdtBxSPlA5PZWmIlz3odFAsZVnY1MghnxYsUEdba5M1Qo5c50rbdM
 /sPChKVlDSXwaqJ7QRA==
X-Proofpoint-GUID: HNAZzn_7Pt_Kon4EnqRwonIk03z6e8ye
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAxOSBTYWx0ZWRfX/EoOi0/79vm+
 0Dq2d0S7uLWlmcns30UDdYHG9bKn7EjdybXwQYyBj2Ip2uTeHeLsM4syVztGXOUOlNaObN1ZPQ0
 GDoSq7rN+xRWeHyTrMpscNtm7cqe1Sg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030019

On 29-10-2026 20:11, Vinayak Katoch wrote:
> The stream ID masks of compute-cb@12 and compute-cb@14 are wrong, so
> these two context banks fail to probe.
> 
> Fix the masks:
>  - compute-cb@12: SID 0x0c2c, mask 0x20 -> 0x0
>  - compute-cb@14: SID 0x0c0e, mask 0x20 -> 0x40
> 
> Fixes: 58471055ae76 ("arm64: dts: qcom: sm8750: Add CDSP")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

