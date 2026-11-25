Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600768;
	b=JY9HLAfxaTWN6OMwhFMEnMLmHUZ7GSouEsiGqg8ZViqNgdfAdh2wL6j//LAQwsVDLx9B
	 wK6jWFnoKFXZx2qjPlR5UNiVMi0/McwkO1o2gMR/OjY0Ei+ZneGuFLM6qYuzeDWra/k9o
	 p2pVJb4c8x/Azs69O2PsD0J8xXt6rCDmQneGUIvbbBkcJlGRJclwS3wHhZa/Pc47ZpMS8
	 m62VLMin1AKTDLGrfdTv7dDuu5pUcOCsDn6aaZX1mHUTZQ3iyTMI3vsVANE3dhsPaJC3g
	 ICm90R1JLryBYmzwfQiATkaZVjuBwYvILUJ2GCUtYxBBdljuhleqBDdKf6rU2w3sqFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600768;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=byNHV446L/V7mjmck13sT+XYA3eloj6npRjMPiWvVow=;
	b=S/aXF+ai/qQTb0nvlwkGihw8Q9yR7nV+hZqpQMBYqrPPk6uEmqsR8I4LwnFMQUormJMQ
	 kNnLii9hmrLeKWcUeC3sxpNHodxJlyFK2gZeGqvGixfC1neP2U9GTfHpT2C8JglWAZ8Pl
	 9iyyVbVX5rFulKCsZ3p5V6PMwp77Is915TBnezIo6v1lmsni5XukuFGcENGKN+wdatYT7
	 1I9pZ+hRqlCo+Nlrw8++HHfxQ2pCrk/SLq4LGHH+o3/YiaZKa/j8m3Xv2uMkiEQDN5RsU
	 /smzWqFGF0vamzWVflDbBMWnjx1n3kUunHlohYhgTFfDCpWT9ziatceD8aOZYvFo4MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T0ur4FUC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P3ZSuchf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8CD606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:59:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE8CD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T0ur4FUC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P3ZSuchf
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mdWR796830
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	byNHV446L/V7mjmck13sT+XYA3eloj6npRjMPiWvVow=; b=T0ur4FUCnYn6C+5F
	1AHhpLgLG07kqgjRjTMIf1uTsVjHhCJa12pLd6l3aTzqJoA0pq1G5wZnfLyU3B+n
	RTtYjf/W1zWe22X5cKVSh/xLcIeaAdLCXrXZ2OrypuKUwDBEmkTcUUQzCzRI+ObK
	LoWcT4uf31GnECyxIdDKoCmAbi/l7wsjAVBnL1yAtKs3i6ETcXRdpCMYlBbbFf3i
	mlJaEz5fxU6b1KhfXcVEJ5vyVCsKlgh1vSd5WHOJgg1BXGtqjhdFkEA6mYCnz/Se
	YRLqX2GVne8gjaUmramKemKwfzxProiXBj1eda6nUtJJZWxVTpqG3Mka+Kxh7DXK
	8fZwIA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rt31h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:59:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495f7e03b9so54262785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 01:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795600766; x=1796205566; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=byNHV446L/V7mjmck13sT+XYA3eloj6npRjMPiWvVow=;
        b=P3ZSuchfOlRVjxmlSUN9vHXNq5KDU3U5iD4dnWZp9+lfl+4JmftZsx/k49JDckwRwj
         6nnS1o8APjhlHAWHTLodRtCklvxhv0v/mrTQp7dJvwXKOCvdxBWdHLOHeRl9LTwoanOO
         8/wr6uJKR867u1+rB9TflSG7eZGx3+LE3i0bvdqFnzKW9Xt4co4l8Dk1wvydw53bB2x0
         zy8X3QNd7+Pr3tg98tu/sR0k0RQBhKJXMlBZMxb+yFkyi9MWGn/DiCos47A/+IaROSHJ
         d5S6uhbEdgdzY7q+5ECKogtBTpEGsT4W0IX3Xe///hcLXWUAXyZakRw09AbLANExL2Tp
         SQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795600766; x=1796205566;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=byNHV446L/V7mjmck13sT+XYA3eloj6npRjMPiWvVow=;
        b=gU9oa88uQNT+ZnloWtOhq0Y5Prqwyu5rcrRUTrwcwJNvsQA/zRTxLGLL0LqSrjB35t
         47UDU40Rui4wOBMqyxJ9pEHvvCShm4Wvy2KQVkELV4mkBnTHIqvHnI3exT7lpF+qj78G
         92eWp6dto35DQ2YVjPZLaQsbUvXJiJowbOMKmPo1ZbkwDum661jOwikEHMBulKE1myiP
         Il+4o0vrIGO1JBFiO/qe9ZIWujAfo5FXTOAkJBVzkzjH5TnWUMss9M1CxNXbmYwxwqMQ
         ++Hvy1fN1GLR86hWyQqKaVpn8mYKg3qvvAztoAr5zFaRC/6Ib65wOaXXEnQ6qBitPmaV
         +l/Q==
X-Gm-Message-State: APuU4Z9+aq4G9EoOfba7cbg7UsBhYK20ziGp2ZDoe82kNfUoSuyPQJdd
	1v4jPMCI1yjzCG/V9WqcMRE1pldxMYsmyNGb+C7KlwQdXJ8by7pvwEBS7QfzCEEORxK/BTqbFPW
	b+tBHxivIQwsCkCurnIvMIuvFhqWXeiubwh+fCbDOerXP3emZOheHJOWM+KZ5FfYIDe8M
X-Gm-Gg: AZFdTZeKkUd+Tj056tTE2U1A34bx4uyCJtnEy3d7gEfPu2t0qEJVHLdC8oeiVWM02wz
	DeTmLAMpml7BghkfXQvf/pVVaGg3WrnK7wn0imExoz4FnxWZnW4YtOM+LSP6wyGJn/lhE2lX7Qh
	tOvLMGErRknXsF0nk7ER1gb3N8mJnyIpw4HVsr2TOZmZhgkm//A5gK9Y/9gVVVmIDK+zRUXP+y0
	PWE/mRvGhWUFC7OEc+mtNHguMmXvwh3WK6P6/0eRFXzInVrDaIUQCD9TIHu1spn0sk4HndvOpv0
	61rOHl3gA38sqtu+WoAmMwJMaz0TnPfxIrg89q5npDTdZWbxY/sgq+SL5toNAnmc2jUpjk2+g/Q
	FL0ipTx/pW0JFuAchL2iz6tVjKXAzAjdj4j6tMqU4gRwJ0zSKUuNfH//6DgjaxcXLr2GF7Ps=
X-Received: by 2002:a05:620a:2310:10b0:944:12fe:c8f1 with SMTP id af79cd13be357-949ba68ae5amr2993466785a.0.1795600765919;
        Wed, 25 Nov 2026 01:59:25 -0800 (PST)
X-Received: by 2002:a05:620a:2310:10b0:944:12fe:c8f1 with SMTP id af79cd13be357-949ba68ae5amr2993463185a.0.1795600765368;
        Wed, 25 Nov 2026 01:59:25 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae66053sm612112666b.19.2026.11.25.01.59.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:59:24 -0800 (PST)
Message-ID: <9b450609-2db3-4b17-aba9-b0ba910d05f3@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 10:59:23 +0100
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
Subject: Re: [PATCH] soc: qcom: ubwc: Don't use swizzle-enable values as flags
 for Milos
To: Aditya Choudhury <mail@inferno0230.in>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org
References: <20261123-ubwc-swizzle-fix-v1-1-2dc84e31e22a@inferno0230.in>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-ubwc-swizzle-fix-v1-1-2dc84e31e22a@inferno0230.in>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX24kMC2dBBtIH
 sQrTOIDrmUYVCJcj3hQsCpR0XsFMjoB0R8evbmIod+9KA+lP0EenmNZxYvWZ9+sO0q/nKv2Uvu9
 OE/hIz51TBJ5kPhs53sOR4VuXyDB2Qp5KkdtenqRFryl+K9NPMIieYL5YtSfLn7kyObHYn51RtT
 FHPOy69zxCgIkOJmj33M4aWgWMhRtMprnJe+NMGEMUrpkg2Bm4w6PQGUUxnFvOFjQ3+ZjcF1P/7
 nZa9SJhXa3DqEwv5WfCxsa6Hz8absZUoA1IG8dQ5vaek54GwYQQyIsqBnrMyFNi6WiSj5KuDhGL
 XR1Qhfbuk6Qzmy133sqDcswOSUl0sjo1NUqiYk5OXR6dcVqpQuGQBX9ym5ekPX5jSFlnk+Jk4sT
 UNC2qmdF6ShMGQw1ES1DVJmb6305DMNAaO3EAzbresrAmK1OJGIBUc+CYurho/+HjAHX30dQXZ8
 CHcKmBpfql74B8A47qg==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b06b17e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=0BjEkSJ8zLIZl09DWdkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: oIxbvbylYhxNy8Fn5yh2_jOM2kai3pd4
X-Proofpoint-ORIG-GUID: oIxbvbylYhxNy8Fn5yh2_jOM2kai3pd4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX3A/juxwyNhBc
 xSMOC7W1Qi54+7xigaMCGjyDf/oH1cQ46x8IiSpHQnwzq55voHu+PZ32zFm3OpyEDkZQO4PpKuz
 6zIEkfF/yq4JBmR+/VGSDzBU4NOlZRc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250038

On 11/23/26 7:12 AM, Aditya Choudhury wrote:
> Since commit 31e1c3248586 ("soc: qcom: ubwc: sort out the rest of the
> UBWC swizzle settings"), the flags field holds swizzle-disable bits, not
> enable bits. milos_data still sets it to UBWC_SWIZZLE_ENABLE_LVL2 |
> UBWC_SWIZZLE_ENABLE_LVL3. Its BIT(1) is UBWC_FLAG_DISABLE_SWIZZLE_LVL3,
> so level 3 swizzling ends up disabled and qcom_ubwc_swizzle() returns
> 0x2 instead of 0x6. The downstream Milos configuration enables both
> levels.
> 
> Drop the flags so that levels 2 and 3 stay enabled.
> 
> Fixes: 889ee1f4f663 ("soc: qcom: ubwc: Add config for Milos")
> Signed-off-by: Aditya Choudhury <mail@inferno0230.in>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
