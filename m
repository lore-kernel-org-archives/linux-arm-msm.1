Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557586;
	b=bqA/BTWB9Bi7bGtF1QXSzt/J4rcHL8OaYDU9j9eOJxMUfc7599SOxyuI/WvXAb3JCbx8
	 8CBTJ/lcUDWiB0IMVLUl9OjGRLcBl381YBQ2PIYQMk2kuIOSePo+GJ3mZw4OntT0XXu4B
	 58TgFCmg0/aSiuSmAPUOV64+3JwUnpSTuuVW2vA64duCjxByzCVtcf4gIAXtHfkJHZlvA
	 O5ysesfh3jpKT4lvM/Jlyb1jJZtHHLqTxSRgzmWU0EtwABnVHG9YlWO2/ygWmGk7uSgOE
	 Xvr9XEFY0a0GOD70zSHcoG/vRWGJPX1SUF7NverXcuqAUi71vb4eU0u6YFyg+3+xb7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557586;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=h6K5DZ6BT6PPRrqksZkUMcUpto2/+I23hqXq9QoTxbY=;
	b=TECIpWCz+dPoS2IQGN1eltgr36kkAE0eaVShfSZADKEcBvJPvCiLwtNd/VNn2X5OQkBf
	 IgAdyViD0vjCU1FdQ2W7sv0HO/uUZVu3xJQkBSZDz33zSVOjpleMfZ0agnJXDUZb9Jq0e
	 rwje74iMqxyJbkhxSByQQYv/bldp82WFUBhmVSD/jMSLrVr0VKBXj6XhS8yvGJu983sAH
	 a6L4tNlct7qghn3vWqGzfLdtWmtJlYgcMl/UZRHf00M1tssO4qKbiPqMkJyZgYragN+R2
	 QhmAKmV9nirkZ0STHtm+Dc8gn299L8p/0sPBdYSDpv514snKMwpjJJ5R5ZqunzbLW8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EUDuXOlR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jtw9YpE0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D20606A32D
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91D20606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EUDuXOlR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jtw9YpE0
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57AJ93615962
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h6K5DZ6BT6PPRrqksZkUMcUpto2/+I23hqXq9QoTxbY=; b=EUDuXOlRXuJ3IcDz
	2DcpKzQGdALG+oJDx5gaNbkmaoThuRjrdXnMyNVETD/BnGS4mT2ZtezAOyg54iao
	79VA2Txb4loofUy9wCNDUlB1P473ZkSWTWHSAbMXoeBh9FTrDyrd8eJlUovndr4L
	SFEmT/suSlm9O+JSa4xFACYwStZnNnLg5GfFB5fPpI2x0Tshr6GTYylPN/hHtz9M
	S7wxj0dzXZSVXMYtFWgqHYe2RMZ7RAT8i9R+sYrXxjLmcEMB1x/98LUb1rF2rVyi
	s+rfGrs/EwC0sM4y5HjuCmW9p3l6VbsQ7wBiNDO6iDzZHIw6VQcNtctmQjYWVvLV
	K89yBw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0aju02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:13:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e629c7b16so19377585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 00:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794557584; x=1795162384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h6K5DZ6BT6PPRrqksZkUMcUpto2/+I23hqXq9QoTxbY=;
        b=jtw9YpE0gDV9HKApclCQGi/Gw8fBuf9exXV9R/cCEJn6BhH/G0QiMFuarhbYcg0BMN
         xvMzHKUjSLdtEI+UYIszwNqAb1ulYHGMaRCWJBtkMxwLd46fLHTDiXhJaq/d0pV1g0GD
         VOUJ6JlzI3WJ/Bfy5SsCmKHEgjc8BB29WGRslb/+gIGIQBzNOCubYzSHyPiEkHmY84WG
         4j1p8vRubZuBO2AGOKHG2cS1eF1R4uPsQC5UtAL+vXeZ+2FOJhdOqDEU0UMx0UBan6uE
         kxgkCtymJ5EIina33xdCRhTW66A2kjBKjQnMVXnnCLnU0HQhuM8J7dVdhctgDkuyedQ/
         4zFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557584; x=1795162384;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h6K5DZ6BT6PPRrqksZkUMcUpto2/+I23hqXq9QoTxbY=;
        b=W2f9E7m5aY7TvVHmZyTG5ggr9Kh80hWThbMpdnF07qD+i1Z2pVOilZqUM+y19vsmWT
         aUlIq19/5YRZtkuZYpZX5Iw4E0CavgltFAaQJgOwMllwTr8+cC5mF4phUju6FUr0TOzj
         0/f2YmzOk39fsotGXSfPghIhei/ZRGWoalN2oRbjOtr8DCSGA6vp0yc02xcxYvlKGbY8
         jKZ2Y5yo5nNV+SrHMcwJ0M7e2kSim1WzxcOYas5N685HF7C5K0NaF8EdhAgnFVUjWPUr
         zt6RoxZxuMIj5G1coX4fHHvsFQPRMPuV4eIIHomugSooOcAfaEL5kiDdzUmNj9BDmgHf
         95wA==
X-Gm-Message-State: APuU4Z/ftIMTWwhCNRUhAPs4PQzyQkOHkASzCcfpuoCx84aQ/n8FlSOJ
	H/vLNjwoc57DtmpSBBlSAPqcoNr1HWaF8TTn4jhkUC/1I0s4eezt4xChXWE4KL9QBn/t7uVVmaa
	5YqByN+Og5zYA1LXIKF3Z1NzwRQ14kOmnqJtqyEkhS+ZtfOPuIwPtBKuYyO0X+VYCKMiN
X-Gm-Gg: AYBFou3q2WEBG0wDZaiSu79Yz+bwORtuSyegHBdD2hKtLyWiA7ziqDNf8fDfkWNiamE
	hjFF3JNPLAqrCicgEPsvvQ9//bvhb5WLgwbvd524y9C+W01ctLNWxBKvWvsc82AYc4jIDdDE/y4
	Vv9O1uLqmgc69U87P4tBu4apR4ifJFD05Z9/JGm1OiNIKlHgVPvRAe32OAWehwkpPZjhMnpsFP/
	EOQxCRHurAB4zWKiGfTKLAOzLMelrGlB2aiKucHPMeP3NPBoaygbP7QpVd8p8eM5EyJO1ZsPJ+o
	SZv6w6QUYrQsApJaBT3uyreevwujvKip8SiYlfA4v3FdXIJODrAC8o7UoUnh51cw13DbJjAw53O
	9N+T09bNOCPrkNmFI9W4iqfjBDKrTvdjdR/0ILSAe9DRls/9NppyUe9Dqsv3WCK+L7T73oDM=
X-Received: by 2002:a05:620a:a819:b0:949:4dcd:da3f with SMTP id af79cd13be357-9494dcddd38mr215156585a.6.1794557583777;
        Fri, 13 Nov 2026 00:13:03 -0800 (PST)
X-Received: by 2002:a05:620a:a819:b0:949:4dcd:da3f with SMTP id af79cd13be357-9494dcddd38mr215154485a.6.1794557583413;
        Fri, 13 Nov 2026 00:13:03 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7e5cfsm63993866b.76.2026.11.13.00.13.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 00:13:02 -0800 (PST)
Message-ID: <83150fee-ae52-40ab-a3b4-ef180a29d48b@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 09:13:00 +0100
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
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SM7550
To: Aditya Choudhury <mail@inferno0230.in>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261112-sm7550-soc-id-v1-v1-0-57299906d81a@inferno0230.in>
 <20261112-sm7550-soc-id-v1-v1-1-57299906d81a@inferno0230.in>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261112-sm7550-soc-id-v1-v1-1-57299906d81a@inferno0230.in>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMiBTYWx0ZWRfX51EoVdNUhFgF
 piRdznjIwgW+SHULaoYmjBbsbVbiagwUAEA1AnQ4BCxI9hgdekOGUXzQRfmvKcdGrg27R9I6mc8
 CEWtyQ3HfKACfVTpd2WsXBqHvAJpuEs=
X-Proofpoint-GUID: 348vwVvyl253i1RPPi-SkY37LslfHKfk
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af6c690 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=mPRu1C3yLCZmAX2_wYUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMiBTYWx0ZWRfX9GOZw5Kmf5Wx
 PuO6sJko6/EIqy0Sjiu2b1cnFu97w0fvyY0NgHeCLunsvTCnpYPutOBBdAH3HPr415DWWFgYkyM
 IBHxdvT+RC3sr1MPY2QOOiNGAto88EHqY8x+M1O6+QgDwaYBpA2Cwa3BH9W/NqdQVFFIe7ARcWy
 m33gAXY5eK/ccnGXXq+Rfx6SF9P2ca64AdxG1sZKiBYtX31FUcocL3sFE6DnsB/pL3HE8eAU0hv
 7B2TTsIuHll21+TO8kKEO7QSQ61YiCRDCNuE/20+sedmaVqGp43aiHZjOEk0BobZDmXqY5CuUaD
 Xx5ZH34qwBFPx3oyq6eEzqtrNkPaq8wq8u6t37qRP4Lpw8GzyND6k1Dt+6PBni1lbSkFQfyX5jU
 32ctWvawgjXUOyJJC4SXYef3fhwlQlidR0+HcQAGZaN28s4QKUZ6d5EnUfnX/iYRpP/aY14uhaA
 503iN18S8g8tbXt9z/g==
X-Proofpoint-ORIG-GUID: 348vwVvyl253i1RPPi-SkY37LslfHKfk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130032

On 11/12/26 11:30 AM, Aditya Choudhury wrote:
> Add the ID for the Qualcomm SM7550 SoC, whose internal codename is crow.
> 
> Signed-off-by: Aditya Choudhury <mail@inferno0230.in>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
