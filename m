Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795406;
	b=BspJRDOeXvIKS8Pir1CE/tSwwGjxkit+y+LjvD+Cs4ckwdX/W3nSUWDi6ReSZGpsBtwp
	 BrW9TW6J2Of1JmUZ3GoU10+lyldT4euTKfMlCuUYOGSA+ZOCeDrMNm9YKc4cUTrqaNXl2
	 VWfR16/nBlescn+5tbP1FRuO3ZelIx1t9rwFb7yTN0x32jmevtlrNC/8993FhQAazGbYB
	 C/I6Pe8xt4NAV6BzLT4b2XAVukGxxL8P25WfaUnxuZd2vc5EkCsp+Q3UPZ2khLK/0B2Nm
	 XXjrXhQ8kD4UG0NPnvlBJlV9kXki3Hyj8QquibjH4FZ7gLV9LFmlloayds1ovRVoUtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795406;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0FWIVcfNvM1BH6jx2/YFUktTXPiOwChfdc4XYcwe0FU=;
	b=mrRODm+eSmQL4MbifON9/3rA5sPTiTHma6Zs5oyVtJ8LSL+AyawBjaSveOl1TYXRjANJ
	 0M1DrUAqJS8hNG/IJmPQ8DeUhlLSsLX9OdwebY7yxdHtiuNLN/ho4QjDPoDAgL0Moy0K5
	 uda3D4auiFYdQ1T+oTjb0o35TWMuXOWhJc27OVY5JCRBCQMh3iQryokbdel2/2Z2+Oliw
	 vp27KBCgZH5IEO/VTh0Np47nuT+SRyXgmefe7YkTDPGul2kb1cxdFxe6viexxjYPQd/R3
	 yxj6oVKbRep8Ibyxb2IPZxQcoSl8v2Go/Ci25VipoO+telStp4zh1jElYT8yZXNdceg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="h/gvVvAi";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AmLH9o7D;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE834606A329
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 12:30:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE834606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h/gvVvAi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AmLH9o7D
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Ba1B72667852
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 12:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0FWIVcfNvM1BH6jx2/YFUktTXPiOwChfdc4XYcwe0FU=; b=h/gvVvAi6eAZK15C
	MLNXzeqgMsnkuBrkhrUbffgcVRYn6KMDV61wc4WoLZ4MDmhEFmeI56Re3fM/2KCS
	a/+ywz3R/Svb6BxVl9E21ZTPBvyio77QMEABtmn7n6WruVf8gQQ8fWvDF5SX2tU+
	XJEXQ5JvixttG9bieUVHoGkiN+US/XQSFskO3vM3eSe5GhFlxZXwIUQDTtuWm4iX
	yK4ey3jfowr9yxNcl+EBGjftHiMX0fBmfhqxXuNcha8pMrVhnprahllUQNei/ato
	HlINbkSDh1LmqD+1+q6aC7T2t/Wu8F1Tz8bbcz/uWereBiREB6RIkYNUfwhlDqNh
	ZVMaog==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqm2pm3q5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 12:30:04 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-998f1ee9698so13176241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 04:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793795404; x=1794400204; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0FWIVcfNvM1BH6jx2/YFUktTXPiOwChfdc4XYcwe0FU=;
        b=AmLH9o7Dug/NxxS/wAXjHeyi7VXjb8eCXyCh47ad0QWVgwxC5WBzWLpUu32H+YqZLB
         vFYTG3sBWUxwkqsvrJbS6/rrJWXHk3T17RuGbcSsqwmaTi/wwDAxdCxExEjOIxT4m1uA
         EQaN1zpHNg3/AG8FzE92mb3IavgJgzp1gnIwaE3rIAcD8vDranIMh68CFq3NcCc8T1HJ
         HF4u4KKYgGvOWFNZFj6IqlKTWUafS6yTiWNPYq2C66r7//AHPPnzNOtXbja/E+1TqD7I
         YwiYcg28dHkZ3PI7Bi9B3fUMREROGU8Z6qSwWLGShk+76UmTgauhGJcDJueZC6f4PYUL
         um2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795404; x=1794400204;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0FWIVcfNvM1BH6jx2/YFUktTXPiOwChfdc4XYcwe0FU=;
        b=xp0acv2uht20g7bCqLim59xOxQrehALIiU16q14qk4KhGxhHkRX+Wskhsb300T1NJ5
         khukqE1Tt0u2RH2nuO8j0TuPt91/vnR5RDagxKdAtGvbvpDDdS4lnm7j14UGmc8DYb6M
         O5thOr1ZDJi/btC+mFC/zfhOtuzvebX3G4x1Bwn8ORZjrvLwJwgFpPjj9Br5USKo1C2F
         kXKay23cl6vFHIjxEsRwNUtZuvQIZlJxdtSHH++xzDgHBidQYuXBnTiHZpS4CLfam0bF
         98aLRI9daUzvajzQoc9CPtPnBlePuZP0G0pTTIa0R+P0LqToEwSw78e78XN7oxd24blt
         NGKw==
X-Gm-Message-State: APuU4Z+Jj5uyF3SBmWkis+bKOMPcZQtwpXqLaZ0IzAkVZoGqxR/GJWlN
	5g64leZvOc9u27fbmFUaxfu+t6MLCDuqq7Gs4iYKjg30xK+RvdQTJ//M4RXFJdHDXWL6jzNOo9G
	ia8Zm0imxE9y1wVZPwzwVpjg4/Sy9Sv5ygPVEa5bTHYxbyp/M03uDUNJFt9NzXmk8na9O
X-Gm-Gg: AYBFou3oF4QVqrE4Jsrcmvy0M0YHHlTZvpdOEM7HtgQdWQnSX+9eWKFxQ9c2JftaSM1
	xh11Hfk/inJ0YplSo+lrnp3IMgKY5H1YADB7wilDXJ3xwXw7T93+SAJ0hk6ranmLI+e+HODNKPw
	E/dbNUD02+wpXq09y5VgOElL94UjfqOCYPkI1OxOTgrNnDIbtBUKrszagzym0AH0sHrCqghKtb3
	rF2IqzQK9oWh6B8EQmo1QCrr3dkG9gMi2CortrqtUexNUAkxsyGLXaBZhq4bpUznD1eGvGKLPI9
	gCg1qQP3DK8wDVFvdiL60j5BLzL3S1VUp9ILVfI5JLh/4kmlmW5uzzPJjAiG25NWfYHTDBNUMtk
	BYsSUWAlRVhRWK31hyKbiLA6EIU2b0XY4BRiW7TxoFFxv6k12q/n0r+nXvEYEXdsAJehr
X-Received: by 2002:a05:6122:3677:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5ec68833514mr6056992e0c.3.1793795403920;
        Wed, 04 Nov 2026 04:30:03 -0800 (PST)
X-Received: by 2002:a05:6122:3677:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5ec68833514mr6056959e0c.3.1793795403413;
        Wed, 04 Nov 2026 04:30:03 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e48d3acsm62408966b.71.2026.11.04.04.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 04:30:02 -0800 (PST)
Message-ID: <cdbdf12e-3679-412c-9a66-f9497c5ce832@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 13:30:01 +0100
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
Subject: Re: [PATCH] rpmsg: qcom_glink_rpm: Convert subsys_platform_driver()
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261104113358.1634256-1-peng.fan@oss.nxp.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104113358.1634256-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfX9uN0l1r/fZJZ
 KH0m7fOYGlRJ7rdk/RFyhHlf9164Ynla/diKqx7Oxemp/OINuQfxbtzyAzoPsRnDkiTxCMvYfIl
 1j0mI982+w/VjuiutJDpG65WYCzT7jx7fYIeSqbDS9o3rX5J06weAtPLwn9jYS+GMpKuRB9x18M
 8UgB66BN6vPccxBm2W1rA+3HH/6nHNcj8mx50ITOJkzuTMvJ4n3jy1mzDap5DQDlA1HIqaq9My0
 cPiuFq18ZV7uxoBFnlN8Pvyt46Nly1Nj+dg/tBIYuxMZsEtGits1LJZuB7ha/qg1VVR4dUTG7pE
 LOI3BqD1UApHwsd7IppDCqCQ1ggsOClUvHuSSCdcNY5DfWimYtUzLfdnGAVF+3isYZOotXjKPm8
 94OflZl8GnFnCJw5IsP/KKzJROL5q1h0NZ/Hrc85rd55zFiwQKgVh3KRRwov9d+cbOI2SB/llLR
 VtzWZuUWOVBtD2ji+3A==
X-Proofpoint-GUID: o9edpid8REo3RAVYl2IWmIyEAymDbu-P
X-Proofpoint-ORIG-GUID: o9edpid8REo3RAVYl2IWmIyEAymDbu-P
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfX/7/GliY0u74G
 OfYNYARJSPq8EXD6rLKuZ1yrKwN4vuay+Qffp+iFZyOpKtELckJxZl4CIPQjj3Pl7IjWzlguS1G
 pzpHUr0JDwJ/k88FeEUeILwK1otJH1o=
X-Authority-Analysis: v=2.4 cv=c64+0h9l c=1 sm=1 tr=0 ts=6aeb254c cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=DqZYlRkov0yPPlpfqKoA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040049

On 11/4/26 12:33 PM, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Replace the open-coded subsys_initcall()/module_exit() platform driver
> registration with subsys_platform_driver().
> 
> No functional change.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
