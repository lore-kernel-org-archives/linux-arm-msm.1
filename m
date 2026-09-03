Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB475431A44
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 11:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788433524; cv=none; b=bALqw9G0BjmEpupAJ/ggkeRG2s2+Zd3j9INNHmVzPN9M/9xUQhTklzLzfyn6HxBNKf89M2QHwqyXlqGX1vTdqwEEEGqZcTekFHACqSQfKkObdIQlRbpPkyHydJh1P28niJehtUm2aoEWv/b4iM1so5r4AxpAqdKTiQlH4aokXdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788433524; c=relaxed/simple;
	bh=JSNJFj/SZm7uTGTbVK9n8/17MULSc8kZlfb+Oh78PQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eXe2Hi8jir/yCct4Bf6zCzegvTfHEPedyj2OzhmWPdXdQxXophZhJEloiuTcnESWMIMIFNfmVh8fmCT1aXbSk33MetQCXxc968HdNejzRDwnCCA0CUZT4CQfbFp7IYZpnlJQc8PlA1afDh3lPAkAuQAvOReCAeAExt4IEZBQfOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FA8qhCnh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c6QE3bqq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FA8qhCnh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c6QE3bqq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683Ao2Jn737123
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 11:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oLmcxsyW83ugoSx16iZT+pi02OjQGAOJWbLT9N2FVa8=; b=FA8qhCnhMVleiDRR
	SMBmRE5h01Yl1m9lsYdR6X+26Cd4ZbzzjDtINBtdpFkdbVv5/czfXRfY5gKEuKEJ
	+HcnxhWezMo3qvbkVaHW+4XaU4/WpNOIknftfhqeUE4G9P4B0MN8KOxW/AFqCYfx
	BYY1nKH/5PXMDONSWHuJDylPmomycOGCVS7MqpC61rQmQ4lK+dwtGH9bQQehRcCE
	IK9GanZvgwVKvNRbdOQhRAQbvA+OtjdJhpO1JCHtO/ElzHvEOakhl9EUUuiJaZC/
	npK29H+eVc//pQVwdst2u0O6qhGPsyJ71NXAoutFq/JFbx+6Rtonv9l/cweHFvrf
	pFgU5A==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1j4hekb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 11:05:21 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97cc5388db1so19338241.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 04:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788433521; x=1789038321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLmcxsyW83ugoSx16iZT+pi02OjQGAOJWbLT9N2FVa8=;
        b=c6QE3bqqh6RorKUt5AXEW2fkUZ+S4jRygaBiAgaIplMPqymhm2WYvaEK81b6MX152z
         1n3gWF43G1Apm05jnBZ2mcxbN3TBAK5rqW0jTAHwM9RWwinZELNCkHvFCBQkTU0rmQaj
         yf3Pd6MNvkFM4jscB1AbPacb6g5WYJ3l3QHQaYC/X1kAPavOOHYyvWtIJoHfaaEW6zXj
         r5MQhIsTcsFx5WmWZeAQtu+ccbJJDiPwZrqpVgwValclIzRLZdQuN0Ojg3i5wVnP5XLq
         dclt5Sy53K17YSfpXr+h5zqGHNwG1uPq9CDRxVYOKB+2t7vEZO+RLMPMQVlPEcRaardT
         IhAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788433521; x=1789038321;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLmcxsyW83ugoSx16iZT+pi02OjQGAOJWbLT9N2FVa8=;
        b=sF+d4PRV9Dbf6dsQiokxWBx2I+nsVixjKk3rYI635/MuZPjubUTNWDBHcBbajOl1S6
         qUDRqgL+Fr1lI6++VUeLUwinja+/+p7l2lLWRNBU9CvesjmL82c31qO6cRE3Eb7qvyiB
         1JgUhSfMFbggNbItrAEH+q+inK6R6Xn8x6enPxGQcjvhcoRKvmFJwaccuPsGbFMic/d3
         nBVcYyB1NnUNarIC9g8uQ4FkRr19fbW4hOUKB990ly4s7gUbHHY9nFV79tDa4ZdFjVHr
         sLfgZrhpbIkhfx9dYBnS0p50L3SsRgTlakZN+jYXLsP1OnLgP62gnsNMwt0x3qs4zAT4
         ziKA==
X-Forwarded-Encrypted: i=1; AKwUvBxTmeMlyLhd2Yj2VWQfW5mxC+limr4jqsw1EYTUQfWddCW59JZ35ndXh1KqayUDfc5uD5N3Cv64wlt+2UZ1@vger.kernel.org
X-Gm-Message-State: AFuF++l+CgemMcbyBW6SZAbW6AnGYGK7U70ZrWbFTcHkoJQtL1BiWZDd
	CEyK7xM0kJQtppkfQHTFomgGx3XA9BnosdOmQxpMSGNNP28ySaabgoRVtha2Xw4MeBe2caOzBHv
	DSw230V+hkBD0kSuaCmFd00ys4SrQAdRVkDOVUM+YuPmCuwBo4EqK3Hla18J1wq5cZzj9
X-Gm-Gg: AYBFou0r6Z5cOCyhrurJDkBhhoNqCflnQSEWnnMOUxTR7f20f28DYJS08+mqt/iskin
	wU9XHSAlpy9d0lJzNDjpIXIR1LVp/n/b8I9XeaC9FxEHAT6DYP1z6CCOY5D+Pj1Ya5xaaWDPTO+
	W5hQoeYk/GMSgo0HK49rhRhwiR9dEWXPEhlRBWy25fQ/lCOAHmTj0xxC7roMqH1vRmwI1yrXM/n
	BOUV60+gOdNbmObbJJHWpDBwtD7lawOQ5mBt6RsbhD5MUJDxjrKG7EwGW7acnqYvzwqCt9h0kKd
	dTc+mBjtCPsTEmtlzf4gX69/BiEvpZPBup7U498SfORAEr2FjZOVOihhmmsIm325i8EW12pr7TW
	YeWKkaJjzZsD17w7HynYPcQ==
X-Received: by 2002:a05:6102:14a5:b0:786:c254:b7f6 with SMTP id ada2fe7eead31-78a1eefb2dfmr1732795137.0.1788433520734;
        Thu, 03 Sep 2026 04:05:20 -0700 (PDT)
X-Received: by 2002:a05:6102:14a5:b0:786:c254:b7f6 with SMTP id ada2fe7eead31-78a1eefb2dfmr1732785137.0.1788433520206;
        Thu, 03 Sep 2026 04:05:20 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f41e0a28sm81661166b.40.2026.09.03.04.05.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:05:19 -0700 (PDT)
Message-ID: <c5f02888-4a89-4fad-9380-6b54ba9e599a@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 13:05:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: glymur/UX3607OA: usb_1 SS root port fails link training with
 hubs, trains Gen2x1 devices fine
To: Greg Ociepka <greg@ferrisoft.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20260812083524.775042-1-greg@ferrisoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812083524.775042-1-greg@ferrisoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dufrzVg4 c=1 sm=1 tr=0 ts=6a995471 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=_F2fZriWvz4uO8Cmh_IA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: 0R9Opq_pq4OJ-35zrKK6qz9x_rtgyBSJ
X-Proofpoint-ORIG-GUID: 0R9Opq_pq4OJ-35zrKK6qz9x_rtgyBSJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5NiBTYWx0ZWRfX16BX/5ycAOQT
 rjLQWM0H5VqcwaJMcvMla15jr77ySs4XJYlwWKWzABIOVmWIIV08umTKkKkZriaJNF3JkbUf2uZ
 8G16HIIwzHVlVtxJGEnZtmk1KmGpjd4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5NiBTYWx0ZWRfX2W82uqAVoPQK
 nNqRHMthAXorg5Grv2hhNocbiVbXqxeIzEmU8Gz1a4+MPjsjlgPZr8dIgA7D1I68OZOG72fhO7k
 bFNnFpfvEdjMM8tkmc7pK7I8XRKx19FC4owLnDNXfiFY9mY9TB5EKB/5I1uctxRLRLeFXRJJB9S
 6iTBkOr8kUXmqkzNzOcbRwVT2FyMuxKdo77s7D2SA6Rnr53mPEKA0nWji1S6d5oeDI2AKETbMzv
 2lNdr9R28GweJI+QHMy3oyyKrVeplOT57WGdsihuNg9Smq2H17nhWsjAfWJY9b6Ai8yWxI4ELIK
 UQfZvERGuJEnUWgsoOElxCVHzGnsyfX0G2+E10D3B+p/2hvg+/LLr340ndwA9FjglPUQaceuamr
 pozGL4Couh7YW+VH+Qf6HhTHCN+XM+AypG+Kn3kouo21H18qj8eZrAXF4s4wdWdLn0nhSeSvppR
 Lb3lHUs1iGpka4GdYPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030096

On 8/12/26 10:35 AM, Greg Ociepka wrote:
> Hi,
> 
> On the Asus Zenbook A16 (UX3607OA, X2 Elite Extreme), the SuperSpeed
> root port of usb_1 (a800000) cannot bring up a link to any hub, while
> the same port trains a directly attached Gen2x1 device at 10 Gbps
> without a single error. The same hub works fine on usb_0 (a600000).
> Under Windows the port drives the same hub normally.

Is this something that still happens with the interconnect
patch that you sent?

Konrad
