Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866650;
	b=DR9TuXJnX+Jv2Q3mE07zKtFyC10Av2g64r92KWtNg9x3ZJxZjcxOrTcBsozvyE3goePL
	 GB7E8XX8FwLdELOhuVhuv5ZZpGZyFegeX/0OUP+1kvwmCcWF3wOjGCOZnbSFplmIOysjJ
	 v9SQY9hzfKkEYLP+G0QOI22Hq/7sUhqOI6LwqLBi4AhRjDe6WfY4pZMeMHZ+LRnbC+ZeN
	 P+ry2cFL0+7iY+PJvBS83ynVcfKZahpZuUTjWtE4rJi3r2IMbO1STl5QBpEf7+B1d77Wr
	 IEwu8GbRH9MC2PofIQgF8GBV2sk28C5VP9T45ybfN2Yr2+AlRfZU3o7D5ePbi1Irl7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866650;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BJGWFOkAbAvqtC9ZmVuWCIdXA4sNhgkQh3qqt15eZLE=;
	b=wq+hgAg3YeQACobsUoeOlbnIa4uUuR+thmuNrvapi6GZlSWkq3hqaWN+i66+r1qlPU3/
	 wDqgF0VroOTbNWbeYSgFY/7Q6nfZeSsm6lU0YsDvmt+kfHtWPUWUf+3hm5Kbfd7hbEHuw
	 bkwq/vAZmso//Au8bLkEV38btc+k+HY0nB1qeajFVQdqHOktyVDDDOQqVP98Qn1PooTj+
	 6ysxVyLczWwJzLQW0k6oV6Jo3Lov/AQytdVX2Zg8m1IKNcOynvtWCjFOR4UkV/lkr8Nxq
	 p6u1V2JeUz7Go05L/yoKMoKHVEplwjV+TyZOc6J2mtruX9VyrBc3LMOLzhtntc3cvCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n5yEkUO1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OWxloPAe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAD1606D80A
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 08:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDAD1606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n5yEkUO1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OWxloPAe
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UCGB942014
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 08:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BJGWFOkAbAvqtC9ZmVuWCIdXA4sNhgkQh3qqt15eZLE=; b=n5yEkUO1a3p8uX3j
	AmpIH1k4enZhmFn9bgq/EnLzLvIXZj3GwObapkpLpTr1qH4xdJubO/3IjGrGXD29
	H/DrjwtFdDSWNn4f4ggp5ZTq4j0lqMV+NQ6V/PGUPw0XtnTsMgJ4A++4a+PGImbY
	40fmVY4NUBLLo5BGW3gR/6fLx0kXmolH98Y3TrmeE2KHu/JH36yAK34I2V5AtMIm
	HSCiaxro49pxGM+OnVmzQX7TnlLtQXIpKGKJ3y1K2oNCFi/7sLQWiTMVmSZsKgkZ
	y3oHOA42mfH0Pic4cpuC6szq5cT/4D2qEqQ0rvmuy2uITDzqbSLFxe5tUKI8QqDk
	xz4VLA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bj3xmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 08:17:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e629c7b16so42039585a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 00:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793866648; x=1794471448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BJGWFOkAbAvqtC9ZmVuWCIdXA4sNhgkQh3qqt15eZLE=;
        b=OWxloPAe1vgJV2Ooner+Jk40SD6GR3OzR3mBkyYRXUI2c+RcbIXQiJBHH99SrKrz1p
         KFFj/G6yQoggke43zckm9+H4/ITM/Bw9CxtSRZLpP4RK4FRT5nnEjp0dCtdj+y/Pk3L1
         e1MDd1RPPFxC/a49zx7qvgqBOCXRh4HUCp4F6IYI1iRGgCvOZluq04Q0+5XZXWmNKS6U
         5M55U8i9UYBMMJV5iikeCvZp+PXhcqg2SFHjZ7TEfuoP5oXMhPVdMwpIKIu6fqRB/ix0
         AT3di7OJhT1ygweT+jSBOTfPY7WjFz/9afbuhH/FuaSqSLF75GXzRe+xrkrXdnfesNtL
         8l3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866648; x=1794471448;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BJGWFOkAbAvqtC9ZmVuWCIdXA4sNhgkQh3qqt15eZLE=;
        b=MIPGLkTaEkx61jCAlWrBAnuR5nlTynxM6PbY1qwgulfYzogL6OSEa+f4gE8yDDGe7X
         RH7Zs0NrR61H7FzmzZiD3zywprxVtWwbU0AkHh7ziZs8ucwqDtpMc8ddXRGz2hRaCwt2
         f1FggMkxy+OnhnSjkI5lNlI2G2CnGP+aT3sBpa9mOrn42BntM5p/uJnJ3NsJryBIPx6S
         YTJsi5MnJGHhFIrHCBqvjLXcASNjuLkYXkbn09KgHgs8mX65tNIfptFC5Msfr/zzg1gb
         WsKN26VIzj/Xh3ILQWFJgg1bJIoAsGV7ZHv9WtveUcyok3ob9Rb+KUdoe5kQcvoqSGe/
         MleQ==
X-Forwarded-Encrypted: i=1; AKwUvByCj0Ohxu2S030uEuPa7ecTqWg1gK3auUNXudivg9HXLfZdx5ELN5J6mNzessMCCfjr2j8yWtS8l6sp/5Ho@vger.kernel.org
X-Gm-Message-State: APuU4Z/moQskgIH2xhp7u3oxtxSW+kpRjnO5Z1VQy9COdNyboSn9V6h7
	4RrEk7K4M7523D2NlByg5Fs9E6Fps1PqKSyxma0zJj646YrgtnPHTtr9lpaywzZEQ3y5a0cY8LC
	ViMFOc/h1x9567PXIgEZbIXM/R+dIwnE+yNLUD7GPAwuFReJHogXUNCOQVzFB2sLjExkoVd1H4s
	N9
X-Gm-Gg: AYBFou2b4F05JnO8S1HLQXCcv3SNGZ/ZtH2xGpYAmeAu5oN8DiCt6or4ZTqEuEKD2RR
	Ky4cGciNVK051WaglljEMxgp9tFs/ZCkd48Ez0W26LGSU9fxlSLKRbQk6aN3P23U196b1oAY41Z
	O8itFDj16ko6Z9n13ZBoxaDAmiiPh//PUbHS9i8KJBL48NcGMpqh0wPkdfSwg4VIPfyqF/fqWoq
	N+bI9NhuRRSQx/3SvQkU6r2rvLNeT0YiQZNKWcmlYa7lFx278OOiXQruAdYuGgwN3jsexprj3dY
	2D3nK4Vf904es0eeZfG/U0u6NTJiqsUbuACaFkBs9OeP+wFhc7/ufdcL1xkeCt23YJtSXcSafqn
	djvLQx6WRNE3/j04TssbmE1nBjipFxgigaGu+X9CHzIdgQkyguSYDi2llCH0nDbU62hAJ
X-Received: by 2002:a05:620a:a40e:10b0:92e:6485:f640 with SMTP id af79cd13be357-94421762860mr3088643085a.4.1793866647964;
        Thu, 05 Nov 2026 00:17:27 -0800 (PST)
X-Received: by 2002:a05:620a:a40e:10b0:92e:6485:f640 with SMTP id af79cd13be357-94421762860mr3088640685a.4.1793866647490;
        Thu, 05 Nov 2026 00:17:27 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e4236basm148809766b.26.2026.11.05.00.17.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:17:26 -0800 (PST)
Message-ID: <b9bc095b-e22a-4965-937a-0e4f9543f874@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:17:24 +0100
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
Subject: Re: [PATCH] soc: qcom: cmd-db: Fix probe race with possible ERR_PTR
 dereference
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Haotian Zhang <vulab@iscas.ac.cn>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
References: <20261104151550.215604-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104151550.215604-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX42RKDhIfAOpV
 DLSL8UuS7FG2EdpHmVZb/ONkEGYmVDQfeN8bVhf5YFUFpVSb6LcEWl5304GzZSTo8YBksJyC693
 pOo1Ll9qqC74YTIiE6PA8cxIHhNCkIPhQJg2lxGCUwcdhxaEosWpIv/yUm+Qev/iIK0e8NAJ8eg
 882kV1UfidL8C2QN7PDjTAdGb5tjGqQI5I7fU64t1ag+TvpKBWDWLyexrPRHTDGTjqbuq+vvmYp
 JmOJRLLXF+6BJVPzh4CPNl0I0/ZTIugtxTlllqN8GKr40D8jPblyfH1jJ6Kfda83WIh1dbmiezu
 C6b+sWHuvENGPZDqnAtXPI/fj7mrv9gNSAmfTypgmo717ZrUErfNH6b61oQE2eaKgcg4XszU7vm
 Y+hJbf1op079+Fsh1hxfYQyQGtfY9xN3fmtQEF6KmeRL4pmI2pIEypONitR+vQep9UnUC+zlrQH
 mkeF+1ukPthdr6A7d/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX3mgkOJOclpyn
 XnCs/eN6dVivQj/e384QffLwosQD/Vcl0W9opLEIiRr4zriSB+xcVddD9InWBNxGmUjuiWGcQSp
 hmp5kwIgh7J+TZ+XhCIWFRD1gLXnsTI=
X-Proofpoint-ORIG-GUID: DyzBgT_2W5-KqSwX9IO7nj2KiRQY4wbv
X-Proofpoint-GUID: DyzBgT_2W5-KqSwX9IO7nj2KiRQY4wbv
X-Authority-Analysis: v=2.4 cv=N/u8hG9B c=1 sm=1 tr=0 ts=6aec3b99 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=h-WqzLMcamjAHn9wFlcA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050032

On 11/4/26 4:15 PM, Krzysztof Kozlowski wrote:
> cmd_db_dev_probe() stores the result of devm_memremap() directly in the
> global "cmd_db_header" variable and only afterwards validates it, which
> opens a very short window where a concurrent thread could access and
> dereference stored ERR_PTR.
> 
> Theoretical (not reproduced) race condition could look like:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
