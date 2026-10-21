Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591343;
	b=O8oYpHwXL6AHIxTkcEujqT3g2qg6j1mT638Fnu96AMH9EZmxJywnL4hyW6rd0qcqbvze
	 kF01dJ0bGo/r3SaZwBHadxlaozFcAj/BVpmzA7lgIbxix4HEcUZUxyjHlHa/O1EiNt0Be
	 ArHYtYnqjq3pUuZZ72D8vju6a3H6XE/bFabded4zQoFN7nBrYNLnKbUK6/wxDIyYkvVhJ
	 5ltjOk4+dIs387Ga6ny6nQwlkLoNCdVwM96vTtTWVFCbYy3EnsZGbDXXgtrxTxS7ylGXd
	 56+e2cFR3O/TNvtP/Ybq5xiZzXGeK3OLohIU+bFDs56izVnkBb0sjky8zpOKJ++0kGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591343;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HdQ2R3se5w8ic9Lfj8qGSYTbGzQ/J+m8NimOyWriIrM=;
	b=3BkAQeuXCZ53dDVImD/BV/FlJApwuYsE1K3QITSkEjoqFoEjke2Vg3scIllMdfiNesq9
	 Wi80PTe9JTkUYDQNrLrb/7yTXQfRDyXlslkNmdff2BefEBNC7+MvvbHd5vqAYiaVauyYz
	 fzkJVZA3xGaWrpulAGJwh7prpgzvCGMLCvEAvJx52PFh4+f4SFsyedi4ib2jf4ML1iA0D
	 EnEUC7IyDIWuGlsTm2lejB/o1DmjXFFVmL4JiXYW6evnli50epxbCn9vlWQnN7BUfjdi4
	 YLGatZntULVQOSdGMhJtXHDkNZvmEtRy7o6y1gzd+vcMPye7G5jtgFbwoB1Vxyz8+OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=di2bf290;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YnYgPett;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6037606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6037606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=di2bf290;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YnYgPett
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgMrv4168155
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:02:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HdQ2R3se5w8ic9Lfj8qGSYTbGzQ/J+m8NimOyWriIrM=; b=di2bf290CClcfrhc
	jKzh/qb1Tyb2Dez0KXF5lHo78AqpupmhKBvOqSewBsyOdqxvu8biDiIOPyNpDgNn
	d2H+AVDxpSzD6SSAi48DYV6INTM+aWRzxMRvYt7zzVaJR0YrSzKd0NqQb2s1Koxw
	khCwHPAmM+fkf3iov2OpGJ1FNwprBNQDSN5/a7u4BlRwjlXAxBBzWu0fN2Z8bRWD
	eoWHsFeawCoo70HcizOlBf/b2NwqNtygHmlwUS0W5ZZ86SFNhcWOzi15TcM8z7iL
	Fwe6fRKCa50MEhq1XertPSk1M3PByLk2NwK0C1sjzRa/I4/dAS9HCOySsLp9qVqY
	lRPUHQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0m8uk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:02:21 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-517b58de0eeso21261b6e.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792591341; x=1793196141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HdQ2R3se5w8ic9Lfj8qGSYTbGzQ/J+m8NimOyWriIrM=;
        b=YnYgPettYe3RxdQG9r4/qhTs2eKwPOLdC6Zxq/RveeV2Zov6UiKlbawF9muxkq1E5a
         OvyPyzANNyv1v+NYqWm0LotFp7BYa8VkXIIV6O4Ciud5WueCaWgcn/TZkCWWpE//ek5q
         /9tYIutHlofKlUEUA/mvIkNXKHxAYc834V0fuu9jLcwgL4Zj8KozA8fomjlLha1ciKYl
         KSPBCrWYnx6kDUPVwdSZax0uhdX4rKoWmoe03D2OMvBYO50VQt0MaBO1KrUGfH9izYmV
         qF8iQ9JhP9qfeIxF7codRTaesY0y6JnattSV5/1OctaueqiS3zH7R0J4/VD28fZ5BmVt
         uICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792591341; x=1793196141;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HdQ2R3se5w8ic9Lfj8qGSYTbGzQ/J+m8NimOyWriIrM=;
        b=qPSPE+lh8nbhSbDwTBP9MHM7q2YnxEeQy+UU4A1O+vS+042Nwi4bkjSGD5/i6DMAMp
         50ZWn6V7CJFj0NhDbTsuGrUfM3UjOrPXU6bvQoM5JtdPNH5shtVpr1TxQLAIjk4GQGKg
         T8XdseVS0Q9KBXZUv7e38ByFre0JrbfhXu1+G9TlvnZdaP2JlAoxZsaIOheNt8AuvJ/c
         xRpmgwg+9i42QjKyF3oTuEPUGzyJpC4ESxCdJ+ADBXjmIIzWWDguUDpzG/C67HQgz6II
         9p5qXsLq8olihFVzgUhFptCxtqOPqi/FFoVsOVu3kE30o5KPdTkNoLDZOwz6mzYtzddJ
         zNAA==
X-Forwarded-Encrypted: i=1; AKwUvBw0z+xsitEnKme52aG8MM6TD6whsTYq8aWuOaxjJ3Rpa8UGk8wAaQs/4+V1JxGHoos3Ayog+zK8KDxHJcZf@vger.kernel.org
X-Gm-Message-State: AFq9FYIH9Or1R0IPjbf7pmyx+HTkW/uhYGcEYfsZ+BEpovKB+FI5kDQL
	JZwEp/FL4sQhLSpHqx9bO+f4rGAXOoSlnyt5UiH6+F4eNlyodC4XjeG+ks5Mh2VEHQgXS3fMKO9
	gHWg5bFeFjPL3U+qDcmoQlFSfC8ZnSrzj4ibE3PyAAs4nr7ivVv4bLK85LUce+XzsL9lO
X-Gm-Gg: AYBFou1e+DMPmOsj6VKdHev5iaTEXJNJOEd98P7MCnnI9fVL2iHJHIc4fhDiQq5mTPW
	XOu2RB/rGY89EbtUY+6sgtSIfdURnCL7VZcekvrF8DEKtH8nyTBmg1Uh7avh932lPM/E8bL0OX6
	KwXo+/Y91lkaLgEzsKducFsFwFmtrvRAvUR7ZL477U2zkN330uSJAtd8WpB0QDhBQdHrhFcd2vS
	IG6lqS8GHe4pnu4HSXgQodzsUsB/RNzV5QAamA3VveSAEHNpZUCA1RR/elS4a+W6TZtKX/KkCkf
	fLUtqMT5EmtoVdzDx9olcR3ibNScXNaXgYh3stpxbHbwowCXOrHvYPmHyyGPhJuo/xEchh2YNAT
	faZ3mAx6WU1jWsHEqaNNGMw==
X-Received: by 2002:a05:6808:1914:b0:4f3:890b:5fd3 with SMTP id 5614622812f47-55362b28972mr2213770b6e.6.1792591340818;
        Wed, 21 Oct 2026 07:02:20 -0700 (PDT)
X-Received: by 2002:a05:6808:1914:b0:4f3:890b:5fd3 with SMTP id 5614622812f47-55362b28972mr2213659b6e.6.1792591340150;
        Wed, 21 Oct 2026 07:02:20 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40316a2b3sm856108a12.35.2026.10.21.07.02.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 07:02:18 -0700 (PDT)
Message-ID: <92bb95d5-946e-4169-8382-487ed9ed2254@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 16:02:12 +0200
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
Subject: Re: [PATCH v21 14/14] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
 Add DT overlay
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-14-04fd28d815c6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261011-kaanapali-camss-v21-14-04fd28d815c6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX7/JYXVJgLC0Z
 phP2YLxsy74+4N9JZOpjEn0l2AQgNSGpuja0xhrcL5s+5L7FU4ZAeCxyPUvxe2iP3oucRaGcdvH
 sZsBBKblO3gsBVtmRM3ylBHsak6JPMbXDpgqqiaLTzDxWf/VTcze1byPSAXVdzQm/stzBtd2o/W
 4EyPdJ/1o+ENCL+Hu3xIQI2SLHdt4/nYtnl5MVhgtb4XvtjsCXP1939hg2NKKGUPlYiKWnKEHuq
 z3GrXcJJpExW88BMqK1pnpSEe/gekCdO+FrART6GPomswx3HkCnDDynSsZYFJjroV90vS1HrZlj
 WllbiEVhpfxO8PlAgnr3S52MvgRV2ZHCiEDLVzwBBeOP9uau3nhg7RaLAUY9jgcYYMmedqksGuU
 GUpJ6t2a9NfFQpnXEjRtWJhEvXJ9Z5BGN/igjvNRDSNO8LAFp3bWvN4xZX/TQRGbqn5cjL3ahSY
 orVkZ+T3DGcxrp1HhLQ==
X-Proofpoint-ORIG-GUID: tqkd6nRUDj9b4FifCb-U1x9wy8_NjCea
X-Proofpoint-GUID: tqkd6nRUDj9b4FifCb-U1x9wy8_NjCea
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfXy7q9iXk30vls
 XsbZr+qW3dNhgDjtK/hXNqovsPlqnNX7bCs/hsQaRaglL129hH0ieQL2DOy5amiUG8J60iuMxc+
 atEbjO6zNBr3yXjwmRnKExWPoLcKZi4=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad8c5ee cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=g0yJHs1RHlB3dt4QKcIA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210055

On 10/12/26 8:45 AM, Hangxiang Ma wrote:
> Enable the S5KJN5 image sensor via CCI on Kaanapali MTP board.
> 
> The Kaanapali MTP board connect S5KJN5 with QUP I2C bus by default. This
> DTBO enables S5KJN5 on CCI-0 interface connected to the CSIPHY2 in four
> lane mode on a rework camera module.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---

[...]

> +&camss_csiphy2_in_port {
> +	camss_csiphy2_inep: endpoint {
> +		data-lanes = <1 2 3 4>;
> +		remote-endpoint = <&csiphy2_out_ep>;
> +	};
> +};

Please define the endpoint in the SoC DTSI like the glymur submission:

https://lore.kernel.org/linux-arm-msm/b5734dac-1285-452b-8107-9164e6a3e5fa@oss.qualcomm.com/T/#m55a2d04f3fe573dbbc86fe89a874514494eca345

[...]


> +&csiphy2_in_port {
> +	csiphy2_in_ep: endpoint {
> +		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +		clock-lanes = <0>;
> +		data-lanes = <1 2 3 4>;
> +		remote-endpoint = <&s5kjn5_out_ep>;
> +	};
> +};
> +
> +&csiphy2_out_port {
> +	csiphy2_out_ep: endpoint {
> +		remote-endpoint = <&camss_csiphy2_inep>;
> +	};
> +};

likewise for these two

With that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
