Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DC53D8103
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383817; cv=none; b=OTSGXKHFwa7JhWP6FRq22Y6wlJqJEcy+Sw0L2Ixr7I1MIdVRKNJK2vw2/KB8dyDJjOB9ziRkTeJE0dvjJvmy0ZtJn3jip7nNCEUoJ0GZsZcKir35PmGMFGdgiOejhVhJoCHYCiTS7f63+mEsx5pM6CCS4Naj5B4IFz6H/wZWsVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383817; c=relaxed/simple;
	bh=6s485u4hsYX3q0MFvfZq3ETXD6xoKXpFGTAjFn2Mero=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MwRVkD0jiXpi64w6t5vJ9wTXdXPLcha3Tqrn9o21ryz1B0ErOJ2VJJTGxIN4IEzt7FLlBe3yXREugW642YFDx8BYNik/9MrRmheUK3t9y6k9kHadHcIJhed6qA1Y1TmpvHD3TnxedKE/UJy0qztjHU96KWBpbeZUsMDGZnttidc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lvl8iQ1Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eQhgXbQ6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lvl8iQ1Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eQhgXbQ6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmLDJ4032469
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pSgCXYyWjXSuxjyZ8n8hFNw6JNFa309KScyB8XosxnI=; b=Lvl8iQ1ZHjpUnBCu
	qs2lemQF2cn9q2OFiHv468EBRV64Mc0iV/s+LYh3H7bAU5bZUSCNTwarnH8wgufb
	RY7KtcFM4nqcRo0BGT+i3gtJfQoK3P8MSyEtmvLRrd4uzj4uhLonKX7+po/MfMyL
	AjTej3k9So3N0J5BuhP/3id0QgTEi2qEZ+UkuM/W72izsHk5ALkcbEdKsZ9A1fek
	asFjBfW7xuacj+odCA8uxoY/q16TMCLg8tfBvKWG+R3UIqWsZJKeaZpayvm3atHP
	TQifkfrLGzSroyRgldhPIMGROAMuSkdT8Mwd6HuCi8PPvFQ7F7hWNVN23H7Sr0aT
	x6z1Tg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq87t2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:03:33 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c8383e6a13so53461e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 04:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789383812; x=1789988612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pSgCXYyWjXSuxjyZ8n8hFNw6JNFa309KScyB8XosxnI=;
        b=eQhgXbQ65yj/87yASNbgP6sXDOjYQyHXZORMoWpiQHXoLtKy2fCxVV+0CCGbCH+15N
         dq1i2EuRJy6dCQfYHmlYSvafILF7jjytHW928ci573FYqyc5JMy9GRfE3DTFR/sFDY8G
         YeeNxpvVBM1BhN/JZBrk+W0j2LV7P6nQKO2zS0GtA4n8m/w7Qt9URXVVwYc80B3qjwJ/
         ho2wqdfIz1L9/RVFj+iJ/uITclIaTz9f2o2xlTQJLqB1BEHhHtmfuy7QsBVjt1PfNj1/
         h5+WoROvJb7BzIg18wm6NZEidlNIY2hXH90H5ZJ8phM3PTrgMoa+2b6k2Qr+IUV9xtJo
         EmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383812; x=1789988612;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pSgCXYyWjXSuxjyZ8n8hFNw6JNFa309KScyB8XosxnI=;
        b=MQwxeqJbfY6E6rQtC+PP1DcJJog/ectuedlFeHSkH8yFwSabGamLN8Y1ozaJt5DEvG
         2gTIfk5cTyGuDG9AHkWKBj0cHjDpgsX0VpgnyL0mT8VdCzMfCk/bMCOxZFQ/jC0X4M3N
         phsTDlWOMtSG6aKhOxowVroOru/p5Tg0RkFt4IHIBEYI/CGyXX8jn1kCz7h7tUaQRvm/
         T1mrBbfqfE+MbnC4KgdaTw5bZTqNn+vlTPogF1Dm2OINeIOY7uWH6NFKsl4jiD3hMtoo
         /15PEqgY7a5s5N/fB/iZeY8k7dInjvj5fQg6FWknWRHzDHMIyE569SSbzTXG1XUl6nhT
         uPCA==
X-Gm-Message-State: AFuF++mfhzfGzZmV/JthVH7R/HEl032Fx9FXSw3pfP/YHLMPTS/1qNXs
	w75N7EIcNQZ0ET3sGCMho3Lyctl2lzIcMeKxnivu6gRZ0SVI4HYHWkuayEQihGUl47eA59tIDlQ
	xNzcPdbH3NpXY/tS5/Hb8fP4aXxZiAbW0LKNgqy28m2NVKOT92Ra2PzNqeIenmNzZu5jQ6p9ZxF
	K4
X-Gm-Gg: AYBFou3LSqZNZdJuDQEfjU155xpZSUjkkZ6hIQc6qbltPp0IHXYZdQN951y/4AAlijr
	J0DeBK+b8dGr4CL3U2qBNzQE0zBFEVkiH8HvoskhFs2mepY2SlbvWFCXsX6HDpc6qqYhzcvqjtN
	3VbZenIqvFWK3MUp/jqdW0/kqHNkviQTmHPlKFPpRjhManjI813zzkV78P8K6fH9NvP6LHqyrmR
	lFhkV8gMgg5sDzaN9Mw2Vt83bwcSJBYE3jwXSHn4GpU+QUD9gXVVnuHtCS4yQorT1HswT6a5qGf
	8pZcgNyFQNfVrDYapHE09nyOQmz95xYogkDjLGGKgYvJBNq4sNvUyEGjVuGaNhFJuH09Zxmvnp+
	3Z2uBdUw2+wtZAkZdvbQcKg==
X-Received: by 2002:a05:6102:149a:b0:797:576b:a9f with SMTP id ada2fe7eead31-79b5be3a274mr279360137.2.1789383731441;
        Mon, 14 Sep 2026 04:02:11 -0700 (PDT)
X-Received: by 2002:a05:6102:149a:b0:797:576b:a9f with SMTP id ada2fe7eead31-79b5be3a274mr273874137.2.1789383696795;
        Mon, 14 Sep 2026 04:01:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966122101sm409923766b.54.2026.09.14.04.01.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:01:36 -0700 (PDT)
Message-ID: <6353d1e7-32a3-4a2f-b68c-97f2bdbf55ad@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:01:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/34] arm64: dts: qcom: qcs404: Move PCIe phy and GPIOs
 to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-22-90a252ddbbfa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-22-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfXwnq3FfWl+Z7E
 /RT1Jani0pHOM+JLgcolyfd6hFQo5sJ1aKYF22aqYs4iWamVzC3gk+LWF7knCrqqSz6U3a70X7l
 UTMcvftt+pvq6lsD4nBe9p+2OuzaDY1+whbAzKOOKMSMUbSzdJwp9WW8jiT3896/YNBfeD6Ay8j
 7QIISRrMVjO+3oi7uDBBXB/9p8ffnkie8INdNc9vsVoRIl6SKmPNU3hMQaE+kigII3g5MH/XFxC
 G4aKo/qHvF84Wryi2C7S6AQbZoa3sH/z6egKgmLUq3oGQwU44tO7ukN4cyVTmvNR0Bwyf5IUbqv
 jecG6mVtjNsbbFqYzGCEqXskXbwu/KvsBPC2iEGT85b2Aja3okZR+bB8TW2jaip07NN/9F2JI9x
 cDcUCNpI5WIRLN4N45Netf7wTQdIXcFV2KDKnE7wNgwEqOeJr8EAVPvym1wUhXYBVRkvQgjb0A8
 MMuiSleN9B497fGP+5Q==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa7d485 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: AaKBbWvti5p9B4klu9mk2gOphthxMShK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfX4KLtDUrq+fUK
 PVA2UaL6sBtQCB+CM516oO3LhePaQ3S0//pt56tprnpUh7kQ2nChVWPIMNX50nw4Q/flvbBhyAw
 6KmGPojIoaH9vPDEmuTsKk2mkcxGSD4=
X-Proofpoint-GUID: AaKBbWvti5p9B4klu9mk2gOphthxMShK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140156

On 9/10/26 3:29 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst GPIO property are per root port
> and belong in the root port node (pcie@0), not in the RC controller
> node. Move phys and phy-names from the controller to pcie0_port0,
> adding a label to this node to allow board-level overrides. Move
> perst-gpios from the &pcie controller override to &pcie0_port0 in
> the board file, renaming perst-gpios to reset-gpios to match the
> binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
