Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792764122;
	b=4QkAisTFhPdnFJf+Z2Yt5BYcjt3jG4QgGCAKhoRYitqbS6q06qdjWWtPcCE5EOrN7BjP
	 EyYpp4s1Rk6IqXD4PwxDMHfJQIZK9A0xGSx2EvVeg+9bVQE3fnxNSbFb/4QooTnEE1Zv/
	 TelfkVOK2CbkEhGwWwRmmDqfbEaZq0sq2kPL5Z2SOJo1RzXH6eyWxGTeypLJ6EVtBOP0P
	 4ZR4XM85ZBdBMKcFexW0CpDDGWSOtHYBFHwQgi5t6TAjz0JThWzwEk7hzT+yYXZsPK9vh
	 xTX3ciUkbjQ74cA+gdGgzAvDO8ISXHA3zMTD55MAtnk/6tIEuuF+XeEbJuyOUOIESOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764122;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=epYwqKMMUenq+YYIVdJN8Y6zhWFe4Mlrmgte2eBFW8I=;
	b=aFX1LtRlZo8lyL499BVoVebh0H+1JmfoDSTMT38269wQXn9HBLNSvDqGh72QlcHYS7t/
	 46lAdCWhw+eatrWh3Z4W71yZHcFWvFQhSJIr+SNlMjrgVnyorEmiHen2IaRO/3QA+5rqJ
	 hEeEYvmEOVoNWfp268d7jwJ0dqgrYKOMCy5Y8N1s+mwu16z8rottdXpXrDlzPqxr7Sh7z
	 BkCjpkWKShfEzuc72z4F6/OsBFSaW4rcbcAITQ+PCeTNpjSRHmQrw5ZuDdma3ugpwPZsz
	 iEAMGVfUfpOd25CngGa/nXju+3ACMzSZRtnLI4zT2MNG+tctFpXnXBBXyijlK+v0nyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V6nvKYPh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fhLjwkIF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CB1606A31D
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 14:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5CB1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V6nvKYPh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fhLjwkIF
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NCAVon3821940
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 14:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	epYwqKMMUenq+YYIVdJN8Y6zhWFe4Mlrmgte2eBFW8I=; b=V6nvKYPhgn3BRCsH
	D+C4GKviWCHFhHRvrWqZbfTSyoaccLWj0wcjxpS6eOQ12bl7O0A5goNu3khwVj+U
	lYgBlX2I2XYnRSiUAtxrh7qB35vyAKAtWAiX0BZHJMzb7fe1kCZWzzPLRJt+XQhN
	4v8CZjjjHh1R3AsC1hhI+YzGrYDtZFuUToIRyZqSpiL/6xonmm1c7K828ozce/Nc
	w1fTshVF/33gH1E9kjj6AIymOINqWv/9syM/Ss0Wy3kkH3KxYtdj0w0AKLQ0MR1N
	sHj1IVLK4RbYwa/IJrl7YkqZdaWLci4hNqJ6S35glWV2op8uiaFoI5pdVa7sq0SW
	yqEMDQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7bw0cwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 14:02:00 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-48ade85cef5so250367b6e.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792764120; x=1793368920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=epYwqKMMUenq+YYIVdJN8Y6zhWFe4Mlrmgte2eBFW8I=;
        b=fhLjwkIFx861UZ6dl9umO8DVjLgZwxtS9LtftenNVsb9DkxSEskUKuqy2v4A+/WTps
         2AhQZSDaYXIODhMVc/0YcfQfWOCTHlteIFMstF+KHDeIBqYlKngb3QfvWIrwy7DTEW4M
         youil/+WGNyIO8tX5nJ08OmLedC0e6JMmjdDxDa1jNDVyDfCx5QECgdFaoZBijAkDBSq
         scdTARabAl69AqCQ4FXFEwieZKV2NdNM8mt//OdsUM6KRbgBTuHw0WR1GbZum73G+DGe
         MDQ5Pgbnms2AHuIcY0Tyzv/FdLM4m8Yhw55af7uSv0lrxd0qpW653KSzqkzMwyFaxS+3
         Dokw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764120; x=1793368920;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=epYwqKMMUenq+YYIVdJN8Y6zhWFe4Mlrmgte2eBFW8I=;
        b=iqZ7To3rMe9C1UAgrk5Hxi8uq0ftlfD/OjhyKEeelxIsucmwhpE21NbubCAKamu7b8
         jcUKb44V1WIAO1S8XWRocX3y5NKk3gOc4R6yOwnIkHU3OAKMAh/zEsMDjU8GGFL64xyy
         mmQ52MGw7vry+UtyG7Zlaxi7/EPfE/ugK9orQhB/veAeFH7IyUBefESU+IuKUbb7uRd/
         lxkMSDtExxuZu3S+qmj9/eygmXY4dXiyYaoLR2+ZpDpZPjAt9VFowQEZF88FkfBOt8eZ
         +5XOv44Rvt9MhxvIYImM/gBgA+pqpJnPdm8zSSf4NVyALs69o1KvqtV4SMdhexGypQMY
         78Iw==
X-Forwarded-Encrypted: i=1; AKwUvBwFJgE4RPzTNV7+4kvr80PJNlB8M067dY9REs+NFf6xbrZmLWApna3Xk5IfP5qLHfBeQMvIX82vj67mkd7+@vger.kernel.org
X-Gm-Message-State: AFq9FYK1C6OT+RvUCPl4V6+a1ebvJFIWd3tz2qgyyFZUQSaugqvwPsFW
	NF+SFG2yVTRaE1tQTyfTpqCG+A9D1ypuZ4QMyr9VzGGN6NHJzj41bCX20rZnr6U3KgbJL3pdEfb
	T9IQAy6kwfzjAPzCDxAjPUYmMACT4pmCIIP2wk45wzaJxZrpXnrVMZ0zfbOD70iG+JUQl
X-Gm-Gg: AYBFou1XuSvwCSbp2mt6yrMXVhDw4TgLXOT9j0knOthi4fqE9JhnhhlZVgDPasGeF1o
	ikdG5IsFIYDzWRV4tzAyg4T/3xVO/7MCs9Kc+ywy5iUTrqjOWcXVDgFFCxLNhgr8UwlV9TbPAAv
	AM6J47c/vM3puT1MRERkVhD7doqlw7eQfkhMpl8cA/nXQiK0eL092HOZtxm1rSa/3ECBXBoiuO/
	MKZA2u5YbwdmIQ6gVFXGGdnthTL32s8OZxaJZFo0bFXKamuh4ZevYGxTMFjjRPQgad1lKrkULzd
	uM7aLqVzKv7ouapuTpA2uUlWfzspIOdhy6ZON3eSWTYFqznn/oJEdSB+gIGlVLzv4Ux7/EB++Po
	25qRsurZcYBbFMKCUyD+mbg==
X-Received: by 2002:a05:6808:1386:b0:4e8:b729:3ebe with SMTP id 5614622812f47-55bf88f8b08mr793496b6e.4.1792764119633;
        Fri, 23 Oct 2026 07:01:59 -0700 (PDT)
X-Received: by 2002:a05:6808:1386:b0:4e8:b729:3ebe with SMTP id 5614622812f47-55bf88f8b08mr793350b6e.4.1792764118501;
        Fri, 23 Oct 2026 07:01:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46b8da9019sm3783766b.78.2026.10.23.07.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 07:01:57 -0700 (PDT)
Message-ID: <071fef59-9131-42b8-941f-d7fbf5f57ba1@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:01:54 +0200
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
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: ipq5018: enable the PRNG by
 default
To: Andrei-Alexandru Bleortu <me@andrei-z.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
References: <cover.1792761470.git.me@andrei-z.com>
 <8a595ee4a7facd53a25f51790500a642c78c2e59.1792761470.git.me@andrei-z.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8a595ee4a7facd53a25f51790500a642c78c2e59.1792761470.git.me@andrei-z.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fTi-boQ44QKDwV4fNLXBjEqJZQCPAEVp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1NCBTYWx0ZWRfX/XzFG9+7XMSW
 HufalQf2x40mySQZTlIpZwLgePdXZ29J074H9LDfmP50ybbMJcUD5jsibms4Uj+DhH/mAotbSsM
 A62fr1bIHg4fTVt4mxlf8IGmqldPr0A=
X-Authority-Analysis: v=2.4 cv=QdTzLcbv c=1 sm=1 tr=0 ts=6adb68d8 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=J72pobsmAAAA:8 a=EUspDBNiAAAA:8 a=pjGKqCRHFsEXOSBd6YcA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22 a=CEj32ImPKXYnrW9rpEIO:22
X-Proofpoint-GUID: fTi-boQ44QKDwV4fNLXBjEqJZQCPAEVp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1NCBTYWx0ZWRfX87X/zhDaB0MG
 n3WFvkLnfOoD4eLMWTXLT/bLDqXznhxrRSrlfhB2vPLC56zg1NMcwd+OSw3MWkrk+4Di0CFSJMH
 CnUl1cNicSIVytQVKeiP+4vxmjiq+sMA7Cn4bhIS8QzTKsTo+xnZK+RE8WyOUedxrV38ZtWYOhK
 XeVJHODsEuScp27iaIpI+iBcBQBCSdxo4aoV/WsFQgSPymEMnbfY/4a/arpDsQJO7jCyVvUK7TS
 /Y1GEPo767fAHdDJngbwAtet7lkUNwEEodUmL9CXBHdcXY04p/zc8guoG9quuXYuFWT3ucEHiyE
 N9eBt+EmCjbbjCqNz3ODCUfP/BI6Tujt7j6HB3RiW8sCFu5WU5Qdo7352s6dRs9rDSL+rLmA/ep
 3WzN0nNdZTGojiqopu7wJRC06+MDKZfsrqUbTSWy/KzHQWHRdcJBnBQrdutU8S1mBAws6XtYgMn
 nJGtJT6XHZ1rns2257A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230054

On 10/23/26 3:36 PM, Andrei-Alexandru Bleortu wrote:
> The PRNG needs nothing from the board: its only resource is a GCC clock,
> and no IPQ5018 board has a reason to switch it off. Enable it in the SoC
> dtsi, as ipq5332 and ipq9574 do, rather than in every board file.
> 
> Assisted-by: LLM
> Signed-off-by: Andrei-Alexandru Bleortu <me@andrei-z.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
