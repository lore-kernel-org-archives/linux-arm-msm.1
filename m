Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995295;
	b=OH5PTOdKkMC6ryVqB1NnJgQEZ0+lb3sB16L/3jh02h0G1H0QZbQfoelTGp5DkdnpjlQs
	 U9NDh8u/Wq5izKgQ0C3j6n8TdqBZ/m//ZxJNCOEjV8jw5HEvpQumtFrGKh1Od5CgqcvJm
	 jlLOOV0d2ehYHo5hRx3VZBGbxFatV6TRBU46zlBDFKBJaEWYJROt88AGv6U/CExbU9TcM
	 AazS89ktTI4ArfxtoaqlX2UVlkHKu0c0lSqWH+eD1pMrTAZnkr/WDFNncpqxgvw8R75ly
	 ysWk9pqhTS02+aP/tm6NhFs5Kf712SCyjp7RUJX7CV0HaGv9V1O4zlpq8wfuUwVI67w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995295;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kLnvSYRMn2ne36NTXb1nZYBaoMvTs9kFclp6tyj7WCY=;
	b=zXiUgY+QoZ5p5FCKbgfrENCmV8jsmNG5aQbL9KxODreSyZmKXk0gh9svE569FtIzZU/n
	 bTq+y7eIIgnDuT8hMO537GuISuslp3pcIWr5JMDB0fJ/WdmuwVJHk0qycObKM+Hoq5UtY
	 ap7pNimOLU7bNNhYq5USUpfB3ATRs9pXrKmp/5svuN8gRdt98iNAdZjhl9J3Rbc8VJSWQ
	 6KrstpTNQ9DxkaYJD1LmFq/9M1YZ460KfrtM38fQZ98CTj0rBEHreyMCM0K9g3zpdZqD5
	 XWJSU7tKawqMyFMoqfHuIfXeQYOmyK4a4J1JtK+ZH+CNZWdO1XiFq5uRV5Ikr6ShwXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hFVEUO5W;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=drA6BBiF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8633B606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 09:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8633B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hFVEUO5W;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=drA6BBiF
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI9k3qQ3353933
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 09:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kLnvSYRMn2ne36NTXb1nZYBaoMvTs9kFclp6tyj7WCY=; b=hFVEUO5WeSIobojN
	UVIw2O6MToBWX4CaZBcpZxtQT820QajyDdXRy9Td4vVQvTRIrizSrsWqOn6o3XdK
	mCy5dhWkjoqFP/1KPXqA7Kj6uwsXz2HHuMtmc2GlfWwUKfKVY2M9RxAzEdJ9dNMb
	qvXAs5AZ+WWCHY+sI5Z0etjtbE3iyLI+hvwnDhE/Q6dkEqPX/jHDMY7jONEedr/p
	XrS/9PjpuiOlCxdS7NgTLWz+nyZjaTGK8XrVjLrJELW7yreeIvdb7rYfdbuWncg3
	ZaZLtZimYJWULfgwezkXIpGgMfkik7d5s9PuQpSOuOmtDKYdG7daBxUCL+X4siD6
	zXm5lQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvatdxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 09:48:14 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a06750c74fso767172b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 01:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794995294; x=1795600094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kLnvSYRMn2ne36NTXb1nZYBaoMvTs9kFclp6tyj7WCY=;
        b=drA6BBiFKQRvXjawVSxnk0rsv3v2tUC5+6fTjFIzJZlxgNiYjn3beKYb6ZDiTCCMXl
         Rd6Ew513IL+0exjvSG824u3na/grMh5w9dQ5uirOzfe0QAIvERiSezA55AkUzoqrx32A
         hxkxsoxjwHUUva1MXGOm5LvOBc1LsGRp1DY8FST9EQ0iKm9eMbOYNENPTET+KlhXEx1x
         67QONNl3vStJLPkN1hG4LEG61S52VT8+79gIC/dlQblcNkmPSbmZjtbs9k9KHOju+/mP
         WT85mALYaA82UlmWOa8+rvYP+84C8AX3dYbN7337SvLVBjj/Rmh9noEQj06h7E8lYIKr
         tugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794995294; x=1795600094;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kLnvSYRMn2ne36NTXb1nZYBaoMvTs9kFclp6tyj7WCY=;
        b=xqft/Tf5RLwmHMwiI8/LC+0UKUF6+GeoUdkEEnOEF8ftzR5ErnnTu+im1+wdmpvqm+
         hQdLm3bg6GRh4kY8UmAdsdlDBOTo3ajt05KjYt2pyTlKZ68vYLRBYbd+e9lPDaPemJ5H
         BlSJW4IhHobnrzqOrq0Y5TPGIa36RW7C2GN5YquY7lV9G4c5SETpR4Rk7vNe0FSJRmxb
         5616+RacEvLiaWRS9H5A7Vmx6EEdPrRMRqniNl94qKVcHNhUrc6cvzGOd00iJgBjrDCe
         hM4/30JL4dhKC6g87Gh1cTg4cRUw8IGXn4Kqlh1iZFwslwxnixKzZWkI7pSSdwyD5rd/
         xlaw==
X-Gm-Message-State: APuU4Z+nKGHjixbsXQN3vvorQ2Yl2aI9v4eF0PZuowkxpJwt2/7g/Nox
	W7SI1mI3Q/+Deue3pXa7b6ck8zCPczjvJP7+VQ0E2LslzoEhz6blIwEJbPH6iJCScU+ZjCmSCVX
	z+inmHkAuuYecENn/FK3rz79qlbaaxL1bRl2ZFW66AQKaV+o8hjk1L0e2UiLeosedudTj
X-Gm-Gg: AYBFou1SHTIz7oiY8UbiiHA/ot73Tu/phvmSW36Nv5qkGtnJvvEnzdXd0A/0YjJAdfM
	85MfO5vf+CaE6KQyqg+q/ewWLUYdBqVK4RQ2Zu95qAQOi8iH++pI2jZ+h+8LOYw0KpKYqe+Apjo
	Pxwunm1R/ZjdHyRvis4tbBtvbkkhFLRt/meE8Ptuncx7wzz9OVyuyMX3YDDcOfI18l4HvfQa9WT
	mds1nwWLOPcYwInx7zYUTdhEfJes6aN8ER7h+c/mVlXLkqZ+Y7os8us5W9aPcaWLU4eNBIfz1yj
	V+6zu3cmipAX3iOjgXXU9EObFUzKCslNJ0p+QPJL1uSH+TRwakSkvRwrXQID1wjbkkKzCDsN5mR
	fZUePvui+gwmHeZ+2XoJVfrADuJoPl50kJfacBuIihND5vG8U4PURyKTOMcOcZyIUpudJClwA8A
	UFQcM=
X-Received: by 2002:a05:6a20:6a08:b0:3e2:7a40:a566 with SMTP id adf61e73a8af0-3fe8acfad99mr2273415637.45.1794995294247;
        Wed, 18 Nov 2026 01:48:14 -0800 (PST)
X-Received: by 2002:a05:6a20:6a08:b0:3e2:7a40:a566 with SMTP id adf61e73a8af0-3fe8acfad99mr2273388637.45.1794995293773;
        Wed, 18 Nov 2026 01:48:13 -0800 (PST)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cb54e413sm938597b3a.43.2026.11.18.01.48.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 01:48:13 -0800 (PST)
Message-ID: <61542423-9ad8-4791-abac-3745e032cbf0@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 15:18:07 +0530
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
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: glymur: Add ICE node for UFS
 inline encryption
To: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261118-glymur_ufs_ice-v2-0-7ef4556eea15@oss.qualcomm.com>
 <20261118-glymur_ufs_ice-v2-2-7ef4556eea15@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20261118-glymur_ufs_ice-v2-2-7ef4556eea15@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd745e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=SooqmcQUKh5i17ny3PUA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: Hbe_uzc6HslD0ydcVe-szZhcB8Z0o6Rm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX9ZYdpqDaZJjD
 BdagARi6kbL/MIwb94bnbXCW9uG4A8qSsAdFsTl9br8gWeUCl5Dl0jmP63H7TMOD/2f2wvCrOdH
 py2W3ZXA04JKvOY0oIAtnMu7aXuxbOJ54/mzmZnXBXmoPhFyRmMwCa3pu9xC6uwKp8kgTASMHfN
 /9Fu7UwlLzBZBv4hRBJzC4PjvzsmMKUP2gZUNUPuw8SFlwR6IR5Ren2HR6IE+QC69gQImMfBm8X
 LzDbyfMM6CB97VeoGIgNIDTtNnZPhI9Qz5ZNX91Pb1iYnXWx28bn2B9l5LaM/0Q/4b18rw4yo66
 3bk3vVRWhR3nDtQtZT+H9WDRUpFr3308VW3nBfkJQRi+M5LSo+qpIS+tI7a/30QikE4hJag4DxY
 TioqHl04koc3olyYSCU/crhYmjLJsxomil29KfdXoI40CzRU1HWEAiB3VRoR+gKwf8YMTHTDY7S
 1wMGUE1ejnyJz+FA3WA==
X-Proofpoint-ORIG-GUID: Hbe_uzc6HslD0ydcVe-szZhcB8Z0o6Rm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX2obW3RM3Hb8b
 b2I6JAFwW8CRtyOZUgS6dVZKvMF0bw8A3fkZQjB3gQEusN71m0OE91m+0foUeHfkai4M+5ckzg5
 stTWaXiDyulkGIWcNNAke2z1H/PqMRI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180038

On 18-11-2026 14:38, Wenjia Zhang wrote:
> Add the Inline Crypto Engine (ICE) device node to describe the
> hardware-accelerated inline encryption for UFS storage on the
> Glymur QCB board.
> 
> Signed-off-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>

ICE addr/reg and other values are correct as per hardware spec.

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep

