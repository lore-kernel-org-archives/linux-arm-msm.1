Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770671;
	b=O+kmWgazczX/BUD0wH2ZbTtXJWwjRGNxvcR0q4ViPG2Uh6WJahO9camh/g59iTfW8SJJ
	 4tw9ygA1GE8t4sD3NdbW2J7bW1HeHxFA5obnRixXWVnVunjUBGIQx7X4CD572M1Rjdw0O
	 u7k1CIxVdnFRM2KWusMzJQRfYswLSjDAcpgFZVZdjZWe0sJwbK3TLKkw7velN8YtLzXhL
	 zwb9s7BQmKPRFx6ycV5ZbkWeojzFnp0QLM5rC+wQTFOA7oPmAdYxwc4Dkj5BJUKygk/k0
	 t9cWMIPiDdTPOiHQSFRC/Qj/31LYDAfEjbND+i7LGHaak8NOodwO0pYGXaETn4HAfkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770671;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IgUsGcjyfX3pn/47na2rOFgHRHCfaEjUCpn+6VJ9aDM=;
	b=zMe2yPJhaSPkgijayqaId0oy/7mCRwjJCh5oRD7pKmxOiWDmGeF7h+XHo6Y8JzS6UT9h
	 /CJPvVIzbTGBVFX/PS3S0Pd85c0L24A44hplQzcTf9T27CG+LlO8kIpYrCoEz4juvjRov
	 UKllUhW2ThgLYttVvbWoNieZLn4saEhFmEjN/gxX5csQhfZ4zVURVZm4Z0d3KneSnE8QJ
	 Hah1sTmdy/x8/GO8q98lfkYkAq8yKUQgqx3K7FHZHmpiD3kd5BvyRVXwucvTK8s8Y9uVh
	 n1LR9pk0mJJOkK1RN9F6aM4JewibNpxXJ2E52sSXVy5jtr9QeLyNi+MMdAnil+YMb2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xj3Z3Cob;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kwqa3sSi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4EB606A324
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D4EB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xj3Z3Cob;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kwqa3sSi
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GJ631779842
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IgUsGcjyfX3pn/47na2rOFgHRHCfaEjUCpn+6VJ9aDM=; b=Xj3Z3CobRIVJY8WD
	UnqJ/SMwLSCDazOFshwsUrN0xRwkHhr/r4mDo3e7WQJJDpap8dala8XgfPLQcu4l
	7JveU0dyBEKXzdu20o/kTIBkkMTpVKEVif1pQOP6EimGKAd+9HhXbAsKKw+reOm9
	QYzVXhA+WGtmpv4M+pZnkfyFMJHKUaix8RktRRjjk3YsdINu7rF1/yeI21Xa2GGe
	isBrxxB51PZ3014BEUdRdaGRn/SpLuim55rihyMQUZFATtQQtsJFmXWr/Rqu/EH2
	7aw1jPQn2yxIl4pA6sZFmEfIvfjMv1OlVf997L7NZZrCRvgAS6b58ls4fu3t4tzP
	lkgx7g==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhgu2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:11:09 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5edfa7703ffso361004e0c.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 01:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795770669; x=1796375469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IgUsGcjyfX3pn/47na2rOFgHRHCfaEjUCpn+6VJ9aDM=;
        b=kwqa3sSi99JqJQ/UrrmJb8f4dSIezGUFyqP/gSQEciSRk3fvmPz92ARxmjh/Q9cWbf
         veLAEFYDNSaBqPI4Fm1ntsCllLFuAlUAci1scY5m2UMZJuaGu8w6HwjEj1IGxtnn1m/4
         IN+G7mMMuKfa559LauD8jvbNN9gQ6rJtcMs6m+ZReKdeQT+rKQAEB4uNHfdPHDv1zIPV
         544prfqkE8tSDlLC22I73H5S1iVSEDQp/RgsAFB/ZB1sjhQBUfZzXRCBETwFKYnqRw6v
         iz/5e0WKAgw/1sncgTXnFukj1phdR+RVkE/p5iAv64y+yQcBT60gRLTV5sb7IcePtLgW
         ePjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770669; x=1796375469;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IgUsGcjyfX3pn/47na2rOFgHRHCfaEjUCpn+6VJ9aDM=;
        b=JsRpOYrkBT6oQdSmtNT/rwcEplWrnLLjtsldJc76NuWmeJQ7ZAaMCuxneI0JFGHahR
         4IvY8PfXed8f47Z+4PZ/hs3XGG4CrXRYW0CASg00WH0GwTad8zjUQe4hDkNeB6MzJK0x
         N4o5mNEZMgM59v6YWnGSeOrPZtO7fpMxAYSwCblI18vU0/g0WpT/MQB/ryUZeEl8dh80
         RuEaHv0vppKM2367IAcXjyJ2X6GthNWvNdL83PYMjhIo+UvvwqRIKPNEwgIViezCcOWD
         VUz4SXkGaJskcfSzBllbB7UfY4RyQzpyTCMG3iKjFQLoZWhYrA6p3g7c5XatCVcRQaCG
         GoBg==
X-Gm-Message-State: APuU4Z+861ypZl6OXL8iy9phL5E26+EkNxK/TeR0tBS9kYQb5wUisIgZ
	FDO2xZnf/PHf09CXu8v4/Aa9xZgCJdtW2p1kLJsFAuqE6bCl2qtzn4B9ukIT/Grvm2E8vhx8vzX
	Tvz//Eoql0jdRTV/E4BBifJtRfQUQkA8Vj7t/K5o/9k4Ejv9US0gUoZXNoMiRGIkIcYWQ
X-Gm-Gg: AZFdTZdn8v93knjnE5RESYmQgyuVJuR1lXnbrgzXf3JGVBR142ZyhAK+8UAg93hgovg
	1iFqRcGQDpBU05FQyRPFB3n61rWMuX9miUe0+Plb5KcCI4JLxNyXUphs31lm1YiNN55/B2Y+pyH
	RzoJEag0m1Jis941IqyxsclUb8bP+p8YMlnZX0V8kXZFXwhYKmDQxs+B8OyrMABMYPK8qoOJ/P5
	gOmqh2s2GXF5vDc/aWm6zCubMrXLrxND1PtbFHwFdrs9ft3YoO0Kgj/8yflj9sUhN+0JIk7+h6t
	jDz+mLnOgKAEyHSXZFrFnm5ZfFrVzm/iBtIVDPqEvUy4xGyMBm/TQ1M96Ey9rrhZ6m8w/H6GNNP
	q/ALfIzcAUsp7J6UdD8fylmUNXFPTOjAc9MDnJ0ejW8PHGXlcey6lJKKaQbAg5FhMwm3kTQo=
X-Received: by 2002:a05:6122:4a01:10b0:5ef:d97b:2867 with SMTP id 71dfb90a1353d-5efd97b3b39mr322617e0c.0.1795770668665;
        Fri, 27 Nov 2026 01:11:08 -0800 (PST)
X-Received: by 2002:a05:6122:4a01:10b0:5ef:d97b:2867 with SMTP id 71dfb90a1353d-5efd97b3b39mr322603e0c.0.1795770668162;
        Fri, 27 Nov 2026 01:11:08 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b03723bsm840417766b.87.2026.11.27.01.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:11:07 -0800 (PST)
Message-ID: <4aa25716-37ab-43ba-b3d1-b0b48671dfc5@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 10:11:04 +0100
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
Subject: Re: [PATCH v5 2/2] pinctrl: qcom: Add Molokai TLMM driver
To: venkat.yadlapati@yahoo.com, Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20261126-molokai-tlmm-v5-0-ada44435bdd3@yahoo.com>
 <20261126-molokai-tlmm-v5-2-ada44435bdd3@yahoo.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261126-molokai-tlmm-v5-2-ada44435bdd3@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNiBTYWx0ZWRfX99JOIZX5thcx
 1gpkSYk2qqlZOGCfISX4T8qLLteve4gZyAK+1yzJoI88gKq/C4T7QnauvFEAQG4XuxKa++guu1u
 5kk7exX+DxH5v11SB4ySqjLqDODn2v4=
X-Proofpoint-ORIG-GUID: GXAGiEfT0NPEYBBNOfEb5eOy1qcGb3Bp
X-Proofpoint-GUID: GXAGiEfT0NPEYBBNOfEb5eOy1qcGb3Bp
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b09492d cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=CjxXgO3LAAAA:8 a=EUspDBNiAAAA:8 a=tfEBk67aE7w0iaTIDxoA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNiBTYWx0ZWRfX/b304MBk8Q6V
 tl9D9l6sGX7ahiTw/7yqVWXXNRTf2a9Btv7A9qlxNJC42iLOUcn73EyGwk0e4Pow6txTD1hfKeq
 JtkNpoG+WBYEXmzwxxFgLgGyPb7NEjZnptBuSPT1P8piYJosMbmsg7aSeEOtQZoZ2ebihJdNwAz
 scaqSe4l2DiAsSZt6Hp7iR+SI6YCPpI9gdNG3qeroBHARxYJh8U8yyYQQsH7XZjsuvTC4S6VkM6
 BwxYNoJAHmJTVpM2kAiGnJe6IAjoDe8xX1MhjpkTtp1WR/PfHWWfTeo+qZbc3qWt7+4hz/hOhss
 o17O7O1dpz/376U5lxpRGOtdMqsXdum7m+J0GHzHTe6Mnv/YPATup8cvnYL/5lkZzWQHr7ZC2w0
 D0eUI/WWuJur6UZKxNA5i7cUgmdPA2FkZ/O2bvK9t47x1fuhjsj+ua0lbrn3mT4n6quqqegJbl6
 71BeF/iSdortBDUE74A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270036

On 11/26/26 5:51 PM, Venkat Yadlapati via B4 Relay wrote:
> From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
> 
> Add the pin controller driver for the TLMM block of the Qualcomm Molokai
> (SM8845) SoC.
> 
> The register layout is the one of Kaanapali, but only 29 of the 205 pins
> have the Kaanapali pin functions and the GPIO to PDC wakeup interrupt map
> has no entry in common with Kaanapali, so the Kaanapali driver cannot be
> reused: with its tables, a wake-capable GPIO interrupt on Molokai is
> routed to the wrong PDC input and never fires.
> 
> Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
