Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EF14DD3CD
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073182; cv=none; b=GwS6i+TMqOMM8ZzosyuIqRcqFLCaHv9dNaBjCjNRQVEfazCYd+Mpl1DKZ1wMYKipMYAvc36kStVjVCVZqJIuO1tX53ShmNK2HFB9bPWcCXx7TqQ2wexMSJ0EbtJ4dwriJchGPN9rM8Etv4n6slYRE8NxaebVgbTmfd/ovq38R5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073182; c=relaxed/simple;
	bh=7dNe8Ub5qUIc/i0QAD/HshqgBvrYEmV/jNY8/VYo1HY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uuXiHUnhqlfzZPu3WlJ77qf4TyR3KO7S5UX7LsR0ubqXGISD4t4rtQ7Y5OrwP64uTHYrJwHyHMQ0F0FVPSxb1kI6Lvb0+mxegZrKuQApOXdOChiBMS3iKO5lVhZzSyVlSYLgwI+JKszb0shP9UwDKunSqE7L88zJlbXRn272RZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oTkqjiuh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XZtii9cm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oTkqjiuh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XZtii9cm"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M9ZtQD3382586
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:33:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rRtsKf07olYMuCWrU155QmQScMjW2NkOARmDMAKurM0=; b=oTkqjiuhwAWixN2J
	2x3aoIGq0vNtNcHgw1NWZ+c/vle6zdG7RIhHCqZXv+FwSxkk1l73SpquRy4tyZHM
	E6+S2jH2mgDJSevpR0a8S+AxBQauO+qGw8nFDLJlzM6ATbknHsfux+M68otLxDcK
	VsWD9yZwj0AJDYV1iGBZGrMj1u8Zrf1s4D29NqxluKAVE5h+WLYeNoFQQQ73hGmj
	EraL18YwWfUW8LTKle+0Ry0hknDT0uJaZbqdHMf8nF1VgAP99FjX1ijNuPqNDtRF
	7jCpVg96gVEtHh5IAm8zM/508UhvsNxOhVF5xP4dc1qeK7Pyc0gXGtyCfBIhzmDR
	FtQ8Zw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkj9e41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:33:00 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97cace0be95so13904241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 03:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790073180; x=1790677980; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rRtsKf07olYMuCWrU155QmQScMjW2NkOARmDMAKurM0=;
        b=XZtii9cm3khEik0s06m91dBMXhQdx0zzOLFALze9Dek+xTPojGbWiGxF1lciMKvBto
         WKNFfdpE4qe8P/FpnWh/ebo6XmuAOlBhfMv4KTk8VWJzb3By/I1ZAJrhZxsFNswv/Jn0
         JwBTpMTaGBy7PIFQH8WIZm7cfy2RuZ8Ah6jZzDBEytlXKZI9SaX+yzgrUrcjIcJqlsdc
         kcIT+IpIKxdjImE0yOtloOp+lQGpQrRq9Hv748nXwI1C12kKMUC9QEvbVtdOv4uu/1G/
         k1PQbNz6uMKIDQ6d3fCuYTcMEjuAKCMorpArzXzCV47q65rsyWRwk4fCnwd8n3p+fF1b
         PdRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790073180; x=1790677980;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rRtsKf07olYMuCWrU155QmQScMjW2NkOARmDMAKurM0=;
        b=A1jqHJraa7iTOvhpe+UsGO3FGBzuPAA73oeYKM87gXJDaEO50MrY1nFuRC6rfUpp/f
         pcZ+6osoxoVj/bycJkvHUBaZ+iqlW6hALe5aX8w3NDd2LtgUSvw7FtEFZnAdn+26bmc7
         j5yaWJJaNm2ZjwJxZ48Ki+gk11B745qs7l5uH9TKaQAJTwMvuM3CuAPsqz+JQhfgn3Ts
         DZDyFkIMyogcYh8/FfUl4xoVkXK6o0vLw77TOfouHIsRn8A8Wp7Scgc7JRgJqdLQhtDL
         kkYdNdoKmkybvECHTMs2mEsDXCekfh77tM1NNinNn+F8ux6KI3YdRV/f0s7zKnfz7MR0
         xPHQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4ty+upsiTdRZnKI6Dh+xZn1W3tfe3nWS1WsZ/VcAHi7EBdrtfNSNsOLng53h/k25ApIwZ0xxQOk4en4p0@vger.kernel.org
X-Gm-Message-State: AFuF++kroOYQXL+DV5vsCWP8O6p17wa2vvkjxtsIR1JQbavf1QQMYixI
	aJdAhPRgidjT2fIKE1xCi5BQWN+KRr7ndyLwMCBz/r2p6s0rs8F77s+oq2fo+Fo48AFMzYWhKbm
	AJjdVeDCVmX5fz1Z5apmUEESUGpuq1RtI3lr0RA2m8yd1kDNNbgk8d7arCdnHKZZCjbGi
X-Gm-Gg: AYBFou1mN4PPQrDRqvpgrFrcv/GLd+2WSjAd77FcoboU9QQJ8aKcY6DM6ooYVkYjfxy
	481BcGfiQyaV5/eRL5RCFKVPchs+PyUpQhsMSFZ85CDat4kT4+Ms1hgmBSgxlOydeZQnJOY6YRa
	GM+UgdwFzlsZONFqyaINpUDuB1vMYxU17ybWIDZzh8zJlCUYRjqDSFrtiXmrBO59pmEZaKH5xhp
	pVR0/1c5iWDgYaF2sd94g5vea1ru6kcAtGv3YyGvQv9S9TTQn/6snWsJpn3CbS0gWK82niEWgJU
	0Qm06BZuL6pR8p+2pZLpN6IKVMH6viaC34mj5r1dIYDvvJQkEH/M80nYAdpbXSq5AYrIn7CKUmr
	6lT43hhF7Ocq0nwqSFjd6OA==
X-Received: by 2002:a05:6102:3754:b0:7a7:c789:88e with SMTP id ada2fe7eead31-7a7c798bbb9mr5325179137.1.1790073179662;
        Tue, 22 Sep 2026 03:32:59 -0700 (PDT)
X-Received: by 2002:a05:6102:3754:b0:7a7:c789:88e with SMTP id ada2fe7eead31-7a7c798bbb9mr5325164137.1.1790073179275;
        Tue, 22 Sep 2026 03:32:59 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c54f5dbsm61657966b.22.2026.09.22.03.32.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 03:32:58 -0700 (PDT)
Message-ID: <f2fdd3f9-4412-40b9-a4a4-c777ff023663@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 12:32:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: nord: Add bwmon node for Nord
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pushpendra Singh <pussin@qti.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
References: <20260922080416.484280-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922080416.484280-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IfCitFgEcO48bHoGFfXW-homZRysdKHH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1MSBTYWx0ZWRfX/C7nNATwNZtn
 Bi7G7+ycrNskPLVqJy2UvpVWXXD/cutqyFF9sbLo9S6KK3MS1OjYZC+BGQgZA1WX86TPBmWWqhI
 L+PXS4a5S7szmt/8tnyWE21Zb9Tyc80Xq12tDEroBt6Wcefpdg7Lo1VXeR8C2LzWuTQW8mYvQnT
 fTTvqKBMFVetM9ZojrO1L2IMpnHozaw9vjqfnrsMwGD+hImz0BiUbL2wD7D8BTM40t6hDy2348s
 R0zbp1NYMOVrFyn85I3qIAk2wAmN+fIegzjH/Bw1qNxc+X2mgqRcRqir1OLXl8rWhaX/SLw0WTk
 ZUJ3YyEEZ0cs1fX2EPUDuVTKa+cjIbJj3GVaMMrf025JgQjrLTelCw/FHjTZXjKys7STsyNYJwb
 G/CK/6r6MKrDeU7LbfugtYnFGW8Jm508QUBNrNf833hxQnAHgvTLjRSOa+LGtjafN2SykIqvvJj
 OoRqA200FaZ4OlCD+RQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1MSBTYWx0ZWRfX975ZAoTSFhmc
 n49AdVKAftuc40uL+1ODIMzbJk8wZuYCYjG8Kt/X8gVOrDNxmW5221GzliYPcRRRIFZ0FJKwAnP
 8fAMw9sn1xlp7o8J5GiYuU5sY6Rng7E=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab2595c cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=vK6GiN-Vya7UJqaPjmUA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: IfCitFgEcO48bHoGFfXW-homZRysdKHH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220151

On 9/22/26 10:04 AM, Shawn Guo wrote:
> From: Pushpendra Singh <pussin@qti.qualcomm.com>
> 
> Add BWMON nodes and associated OPP tables to enable dynamic DDR/LLCC
> frequency scaling.

[...]

> +		bwmon_cluster2: pmu@1014400 {
> +			reg = <0x0 0x01014400 0x0 0x600>;

len=0x500 for all the region is 0x600-long, but the docs say
it starts  0x100 earlier (with registers actually starting
at +0x400 like your node here) - unless you want to solve that
discrepancy in the driver, but i'm not sure it's worth the
hassle

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
