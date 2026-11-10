Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794307152;
	b=C5FKrmXERjWUhzci98JYrMxIV7FI8t7JE8GK+bG7ypBukiUJGdT8Kw4HfTIM9JhmXntx
	 3QfuaYJ8kDAdonctQiWHYwBH7wwZWWaxClR15kfOGaF6Uc0j3OTvN/tsbLWFpZo8VH5iV
	 YAdXkJzCAPm3WY/5hoRMV1TQHIZy1iz5IJDI2cybkI6aUWmSagH9jk2YJdAjCFJxJpvqN
	 cRIH0T6YsXwytte7sm6kz5CYIcgiTJwY/VOPt7CA5b8BJ3fPKUS+SPuEN9I1vlfX49tfX
	 WP7QZ+upiIUVFToIYVYPbdEUOdEVGYt5do929DVgukRydiLzQHTSFXEUdUtoq1TMq6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307152;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZG386YuIEJ6iBTpDnR8DFXW4CBJWh4A+gyfmdTuSbgg=;
	b=BCWt5q6dM3GhHSixHvtlRHp1hod7EE7652VsArgA/G+KEjlrSrGc1OgoggsQv+fGc7th
	 lgiobLB1RD5AqxH867Z15VW0ZGXrvDpf40QL1r/xfgpDUCih60OJgx14D4u6S/PUbCda2
	 zi47bTWLN67RmoN7cMngATTBVXQPBPCWSUokzwBIEJB0LLYIouvx+NtfB8EwaVy69zZz7
	 RUWnAP3aAiRrDtxUXKgsbNk4pJNWlJbl22ksufzvY9OWBPQ9wgL6CIma/g7svGQkVnT90
	 P87HqCp1teeuWtgmh1dVgPGsqGuXCtMXVfKrVED08fZXXC1EbYqzduzLrqwZa260ihQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="WsYM/0i0";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S8Avzhk8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD40F60A2637
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 10:39:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD40F60A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WsYM/0i0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S8Avzhk8
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA8ZXTP1916740
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 10:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZG386YuIEJ6iBTpDnR8DFXW4CBJWh4A+gyfmdTuSbgg=; b=WsYM/0i0nj6QVCNB
	LD+5ZXziGhs5DAXhRYtHyjhlhZn8/Gn2PQVVq6e6pDhepOv/Grzj/YaGYZZgzzYQ
	lsVoEtwjT8+/asdkQZ9DH+hD2KbDaXtyIIhFnQnhEMIdm8RVqSvh9CYYDKF9MoAB
	hGA2a0ugeA+7XaweJmxcumOyUKupX6b8wh5dKzKUCGhAgeQPhjDutaBaAUz9IoZK
	2zqxKbdlGREPrWUhXrIeLYCrAvSkpBFrMh8vlJXA/Zy6G1j0CqpNOlMCZN6y4oG+
	9hBEnroL8BeKOstRhhBrnVqxbrthJ3Oxs2uOfI39c3DWq2l5r67Oiyw8hoatb8pN
	dO17iA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyw48e7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 10:39:10 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso3389934eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 02:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794307150; x=1794911950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZG386YuIEJ6iBTpDnR8DFXW4CBJWh4A+gyfmdTuSbgg=;
        b=S8Avzhk8BQhS4V86f2YKIuF0MCy4TSBwVJHNILESf7NgW0w4h8hLRk2/UvhjKCoL6w
         wdC4NFyI5Sl5F4FCO1zZt1JK+9ccKNiXDmDcEWTQ2xAcUAgqbH8WyVJx07s6mZhIgv/e
         CR35LwYczwc8MXQtswGy7WwSHeEfF5tWP3B8djCC05wWsdgrK1rckmW68kTjABDW9W/q
         mc6nAl39IoXEd7Bzk1Y7A80MDNk3FPHL8ihMvh+NVOWntzu4XZzj/RfDorhLKS6eX+4J
         cSHQR+tEbfg4165AtzxspCll20XlQMYoEKilvNgfduaqpwmfltGjqZ7N5CYnUbra3sGw
         IkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794307150; x=1794911950;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZG386YuIEJ6iBTpDnR8DFXW4CBJWh4A+gyfmdTuSbgg=;
        b=YnB0Np0nPwh8bnnFYgyUpA2WMCjCh5HyJvJOoHl8GbH2Wel3s3LuCSNTXKivJCiWqe
         /D+lSeurXFdwQNsYFVclTj0Ct6gTmUnKaUdRf1+Zos+v+A8eJ8u7l+UolCs+iAMl+9UJ
         wNw3ZNB/ukmRnyMQkHgT3wGG7P5VFRPimR1DpBusYXeYmaeoTPyL5HbKCjvhbR4kj4TZ
         pJOfZALXoueASr5s81DXnLjDnh4Ip4npG7Mwf6Z4oFIC9PKLRv10NEss9do+Bjnp6uKt
         YV0XP3riqT8jIzBoAe8ykVU2VC27+IJ6FBcRkaFAWKJDEvVlu3Pqv+Okkm+oghBlV1yd
         QuYA==
X-Gm-Message-State: APuU4Z/U1p8ieiq/Gl7/6vzIJQl1lw90Jim0OUDB5qGJAcFuKlvg0q84
	Z10b3tJ8Ol4ilVpZyBcZB2laT1sKsWTLhsg/Nw0Ks8M83d5pGbS4lhFySwmNUXGH64lUeXZn8Bl
	IJg/hx45hqO+qQoHJIixptJsiE4+P+wC+jK5K9GWOy0KUer6IE1Wza/Kr3hTanY9UKdlp1CelNr
	UL
X-Gm-Gg: AYBFou3922lG7PrFEGkvuYrsIpvk0KKZd2xnqVeMOIZ0SHb2APxh87qD0yEtg5en7S/
	1jxK2jyFO9AMeHYtV6dUyKkTXKihceLXOIzqpjK+1/gbCAqVHIriMJwk697LxLXZknm+Uagj9XS
	i1yFDujGDYf640RWATwLyJBrx4B/wvyLYtwMxd9WJ/kSjUC7oryXl9QpbjvE9xAzImqT6tbpjcN
	3K56fuZdeX5qf+xEn6eMQKD4iRiO/uxtj2ORmCtkvoq61+QdKOeyT9ftp+p2L1ngI0lIP2gBHEi
	OsvTiHm5qLv21PLN+bPuQKNZPBtne2FcU040KF6GCHwxg7O/9eJI2HR7sP2YkcvxpEhbvRk3s9g
	/dph1e0a+T/uAdfLiqNx/x/ZZtZAjRyApDWPsTI5+7aVvLMH4n8l7a1iZKtM68abGQR5jB78YG/
	Y+qvnMCw==
X-Received: by 2002:a05:7301:4d05:b0:36f:14ef:ad08 with SMTP id 5a478bee46e88-3751e6ae405mr2608458eec.9.1794307150134;
        Tue, 10 Nov 2026 02:39:10 -0800 (PST)
X-Received: by 2002:a05:7301:4d05:b0:36f:14ef:ad08 with SMTP id 5a478bee46e88-3751e6ae405mr2608420eec.9.1794307149455;
        Tue, 10 Nov 2026 02:39:09 -0800 (PST)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9d78sm6411676eec.25.2026.11.10.02.39.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 02:39:08 -0800 (PST)
Message-ID: <69573381-2c8e-4744-bcad-0165de4b1406@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 16:09:03 +0530
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
Subject: Re: [PATCH v13 0/2] Add LPASS VA CSR HeartBeat pulse clock support
To: sarath.ganapathiraju@oss.qualcomm.com, andersson@kernel.org,
        abelvesa@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srinivas.kandagatla@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261105-master-v13-0-dbb43cdc60e5@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261105-master-v13-0-dbb43cdc60e5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0MiBTYWx0ZWRfXxppzjmtvLCSc
 cjY5h+ZC6l9ezHOy/xPGMKLtrJR+mrDow710XABWhgsCIjpp+gtOdb2FceOrYENeo4gDrsAIose
 W2LHnLv5xHjwJ++15MJ+QG+Crn3iUBpekqea+lx2d/3KGRK4OZdVGrV0KqFaV9MwsCB1PSlv9bb
 bjGZcJQv2PmP21kps+WZfeYqrDZWcU+a9de2tJ0fHWP8tTahh5RIM8VM3aCVDkdNwL+BspplsPm
 idsETWDESKHUTTmHBN79EvD7tIOpVrx1oKHbM6ToxeuIcq83Vpxew0NKWLgJl5TN8TyX342JvI5
 Bg2aZhq6WMb9cWngb7exoO9FG6OqyNCcByl2zImeiWJAE+dnCVVxXC4L3afRRY0E4Lg0yeRs7Jh
 QxvkMjcyQOuKMv0wHOHRlBkb2xMYP7/21lsxwW0toVI6ES67LvzdYHAEX2ROm7OXwZwmidwb9/z
 y2yI4evSpUdeNLMa3pw==
X-Authority-Analysis: v=2.4 cv=Ee1d0/mC c=1 sm=1 tr=0 ts=6af2f44e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=4tIis3KsY0wH9TNJrrgA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0MiBTYWx0ZWRfXzwea8Fe9QVfv
 BaDa4dbYf1FDyL3s7kp/FFpN+gtrq5kzOfhBCLHXA/tDzsKcmZzV/cyMiaZKqAKAGR4L8s/FeQK
 vJsqA9elVmkhigkKlD7/87sVmMrtFf4=
X-Proofpoint-GUID: 1po26xctRZ0NUqEKpLfkMuFwDTOiae86
X-Proofpoint-ORIG-GUID: 1po26xctRZ0NUqEKpLfkMuFwDTOiae86
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100042

> - Split the qcom,lpass-va-csr and qcom,lpass-va-macro bindings into
>    separate patches.
>
> Changes in v1:
> - Initial version
>
> Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> ---
> Sarath Ganapathiraju (2):
>        dt-bindings: clock: qcom: Add LPASS VA CSR HeartBeat pulse clock
>        clk: qcom: Add LPASS VA CSR heartbeat pulse clock
>
>   .../bindings/clock/qcom,hawi-lpass-va-csr.yaml     |  62 ++++++
>   drivers/clk/qcom/Kconfig                           |  15 ++
>   drivers/clk/qcom/Makefile                          |   1 +
>   drivers/clk/qcom/lpass-va-csr.c                    | 210 +++++++++++++++++++++
>   4 files changed, 288 insertions(+)
> ---
> base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
> change-id: 20260917-master-6c2778f57a9a
>
> Best regards,
> --
> Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>


Reviewed-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>
Tested-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>

Thanks,
Prasad

