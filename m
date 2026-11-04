Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783047;
	b=RZxP5UmfxoUHEy0cov8eLxnjfASxC3+7Lm5rd4r3cHyRCn1Oh9vTDEriuBfUffEBMyKy
	 0pOicL6bfrwpwhWE3BVG9x+2fezbc4ENLqjIUcEht28T89hSjBh5YHPtws+Js/OQhAdNG
	 c/Ycp3hfBGF9560UrM8fzruGDG76vkmB3/xK0i6mBtsCJ159EyLNJdmwuQmLmzSayP8vf
	 nCSPUMLJMo9yIdS1wMR/EVY9u8OJCLZQrhQf6DTdoSTjIw70UicpzJsMBGDh2WaQ3CwYB
	 HKlt84rakZc7Rkkmamczr/hsecloX1/n+hNDzxF1mUIfzhcPnz86ELlaeKkxDsy4DDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783047;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CuQ+B9JkfUcZtLPB3R7ZhcX8YyKLeKZy/lDXJDIS0fs=;
	b=vGgWgKg9h5MEYm6Puxqn0MvbFKQEsHG/DsoQ7bqs268czYV/SxpFF0d9esdp4lt0QbdJ
	 qUVvjQlq5SLaX8x+uoo24WunecgjLQwBAInFdRAEhT7UNsGRHZtAWnwl7MXKDQ6qRYhpv
	 VECyFR7TgUFM3Xj8ECAcl2fOHDeOkIsIHE5nzsW4NeaLdPW3/SJEVyOc8XkyYMYqDMf4j
	 VUzVqb5BsBfP7rXFc4+T4zU51Y7N3MwcyQeavNI0drGjZG1qetmi4A3BHEDhJ8+FEXmqL
	 TMxkNoqb45ZudJfH2Dhc+N7jg28WlaxHa8th1GwwIC7YJqrXdjRg3PscSkK1wW/voRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fdr+95ZZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M5VaYGCt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B774606A32E
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 09:04:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B774606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fdr+95ZZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M5VaYGCt
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48Keht1849246
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 09:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CuQ+B9JkfUcZtLPB3R7ZhcX8YyKLeKZy/lDXJDIS0fs=; b=Fdr+95ZZqnMfP/IH
	BnG2c1HLLaVV+UjNfyYVQdNDDJVIVuHSP8kHyTAdWV1dvmQm64sBl0+QeCq/KitV
	iGfAmKluAP0UAj8XlFq6Bq1UAYlDVgVwYnqe+bG8ftzd8A4ekcnV6y1tTYoBuVBV
	jptT0/f5+tNbkf4M/Cru+n9/0Tjj3k4igPUr1AZhnVTB4oEkXWQbe+fgzIll6E65
	DdWgqD9XajqIG/Zk2eEO4K98VDh81zksl8+aCMSi7AzWbbNXUxX7+37F/gB4Bm54
	zTdTv8Xnhl3sanaRKg0DkwUfiw9Qrqlh5X5OP3nwCjmRpwUyEfI3pPpRNkJnGEtO
	aVIIDA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqkgpbm91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 09:04:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c83481504so937476d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 01:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793783044; x=1794387844; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CuQ+B9JkfUcZtLPB3R7ZhcX8YyKLeKZy/lDXJDIS0fs=;
        b=M5VaYGCttqDhVKRGgRw/IRPBFvazkbGGI76EqZ4frYuDVGpMVcv4LHbgzHBdttmHgE
         5PIuATMJmW0X3jVKATHZLDWyqfAfZK4ke7xNAxCuBlbBZyqdT2eMB7nn1v6Vy3xkx4NW
         0N+nvZB1LrvqsD3L+ICzlIqQNmIx23+hZN4L5ZIiWj8vM3n5bOCcN7qK2ccfpv9D+9v5
         yrbceO+QGtmtaSughcXkxLSpPamjmT85Ebmmd+pJhi7ijPaGepCyGBd/b2gTKf47QRmI
         V97c2LeRxX1JFr55DWgSigvf/+MsGh3Q/V4t49wh3aSPnZESEn3stmlvI0ogiCnREOH7
         KO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783044; x=1794387844;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CuQ+B9JkfUcZtLPB3R7ZhcX8YyKLeKZy/lDXJDIS0fs=;
        b=puQJ20Z3BMRJ+lp1OHgFzXvZjOC0ay+X6S9YD1Q6GXrCLiOY1AK+FZv50NYGXTIsbR
         qSux7ZOkPZpFUvIsp1Qt5fAIaQB9D+RFMBGNYoFoz45YaICWCXCgCtxsUAwKFConmDQo
         UvDDd9xF4E7zH8801sQFrX5HAc42ElgD3KK+aZkeUC9YaK8IJDaVPq4FxsuNKj2mO5JK
         hFrNc0OmChvN7BQdbtNdPBpikTN3dS4YKHAnm+5jGzb2diZGQJW4ZQ54y2BAglJ7St/Z
         6e8lZwmNgXNjFjXw36gQZGSVfOR+5bxE1w8zVRXTKhR1u2sv8vQh8QjGjtzKj3cSyaBG
         dxSA==
X-Forwarded-Encrypted: i=1; AKwUvByYbVIuX4MOJOtuSQAphZAYasv7LSE71az3pXUWrua7khXrNa7gxxEb6dd9MRqiEzPmX92Bta6gyij/4LK9@vger.kernel.org
X-Gm-Message-State: APuU4Z8D8lWHp91QYtbtr052TySd0lxG8i+alpyPtPztJsRZjLtKtqsp
	0z0ZLKV/5S6h5r2CzDHpXhdVSMQF4z+APOe6Plf7inh+pHKLlO8YWnSDZB3sDo7jXEdSV1V9Y9I
	tRI4LGyXD2LXLn8F4AFqe9efh9e9bzTASvCcybAgTIAVEJSKinTlZNHVVPWtqsOIlqV1T
X-Gm-Gg: AYBFou3mlOGBfO8T30MD17xJOI6yzlQFWS8GsrDuvexfoaslppmpPY3/pEPHmf5CtxD
	v5dIUBNMlAai5DcsiCMJ3sfvy/UuQ0hLGvB5Y+2sCGJKFgtb2nnMvVfM93IW2gffYL59ZLqi4R2
	WBQ0g3UVN4eHN2O7d4qnIzkuGIrdRp4ELKAdPcGyn75qFjNq6ot8PaiMFy0+Mpmsud/3s6FedKy
	1cfzVTcaXrESm7QZZ+LYR0IbN/ahPxEQn7QNHH5nFUDSNAcgtrUVSsX0Mta2jh74pYZ+hlQsjLd
	yVh8AeHJfPz/CChyO2M/p30uXim4FL+sVRCVPZ06IRol1ftcdOg0O0ilTn3AemwRSoqRMdWINUr
	EYaTxafelVQXJx0jFUapRx1JxwSUFXWl+41sZIzk1bzRkpvXvamdcjaOCOG15IbXi9tfg
X-Received: by 2002:a05:620a:a8d5:10b0:93a:14c:329c with SMTP id af79cd13be357-944214d09d9mr2582229785a.1.1793783044262;
        Wed, 04 Nov 2026 01:04:04 -0800 (PST)
X-Received: by 2002:a05:620a:a8d5:10b0:93a:14c:329c with SMTP id af79cd13be357-944214d09d9mr2582225285a.1.1793783043660;
        Wed, 04 Nov 2026 01:04:03 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac80752sm505660a12.31.2026.11.04.01.04.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 01:04:02 -0800 (PST)
Message-ID: <26bef7c3-3c5f-4f9d-a9fe-bde9607e532c@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 10:04:00 +0100
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
Subject: Re: [PATCH RFC 1/3] arm64: dts: qcom: nord: Add Ethernet support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
 <20261101080413.1428016-2-shengchao.guo@oss.qualcomm.com>
 <658a44f3-219e-4810-8931-192a26ebdc3b@oss.qualcomm.com>
 <aurl7S0IEOeNHDo3@QCOM-aGQu4IUr3Y>
 <02ebb6b5-4f74-41a3-b6ba-bd8ff24ef000@oss.qualcomm.com>
 <aurv-mqf4MJEiuF1@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aurv-mqf4MJEiuF1@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNSBTYWx0ZWRfX8ZHokxubAp71
 BPYoV10LnDUAMErF+WFDxpC4du4d5kibv1zza9Lwyw2/w0nBSmoBTUrEKOBIDXrZLqeBX+zev3j
 AVFggRyuaHFWRkO5JP0HHj0+C9SUJCSfud/q5lZmXjnebQDPk9/hUlQa92lJxjLvT8APij+J2Lu
 /K/QD31wNLiExN09LG52sSO6yio3D8Qoxx6caHuaGpmh/fUjhjOx0hECZzWRQKvCb6IwOjFtapI
 QCrAGCII51ziRDZa+dM72TBsr4QYwZjnwCWWhr8bbKXZTSQq9h/DMFTA4B0eibd/wrtBV5oFgaF
 trZf13b6XnH5gWC/ZQB2xrLyygYQmdizQdeRt5YSJk4Kf8vwRRT6EblGxEkZ++c21aAbUTEHig0
 py4mcSWDD+odXVLHKgNae0iqZ1Xwh8+mo76lzTx09K6jjFB8kJa1wccKqRQBOOQfpxc2GZmvf3/
 m0iS8mavAd9n1nj/mEQ==
X-Proofpoint-GUID: GT8lIMEEHLWKVF-XrL8Kj_TQzfcpZ2ot
X-Authority-Analysis: v=2.4 cv=Yoya1IYX c=1 sm=1 tr=0 ts=6aeaf504 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SrN3rVSTMKwwy_TTx0UA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNSBTYWx0ZWRfX5qH7HK6yMn8u
 2qR+qIVuCmCMTbI7HG6ZKFHtIztKkmSChnLosduIPJp/d/mMwEvlAo5VpLrr9pcI9FrTnxDi6jY
 GIbWn6VHyrt3/F74T361YxrnTQjv6EU=
X-Proofpoint-ORIG-GUID: GT8lIMEEHLWKVF-XrL8Kj_TQzfcpZ2ot
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040035

On 11/4/26 9:42 AM, Shawn Guo wrote:
> On Wed, Nov 04, 2026 at 09:04:33AM +0100, Konrad Dybcio wrote:
>> On 11/4/26 8:59 AM, Shawn Guo wrote:
>>> On Mon, Nov 02, 2026 at 04:01:03PM +0100, Konrad Dybcio wrote:
>>>> On 11/1/26 9:04 AM, Shawn Guo wrote:
>>>>> From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
>>>>>
>>>>> Describe both Nord 10-Gbps Ethernet controllers, including their XPCS and
>>>>> SerDes blocks, clocks, resets, power domains, interconnects, SMMU streams
>>>>> and DMA queues.
>>>>>
>>>>> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
>>>>> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> +	phys = <&serdes0>;
>>>>> +	phy-names = "serdes";
>>>>
>>>> I believe this holds for both GearVM and embedded, so you can move
>>>> it to the common DTSI
>>>
>>> No, this doesn't apply to GearVM. The SerDes is owned entirely by the SCMI
>>> server firmware for GearVM variant. LDOs, clkref, reset, and the per-speed
>>> PLL/RX/TX programming driven by an SCMI perf domain whose level is
>>> the link speed.
>>
>> Right, but I meant the assignment to the EMACs specifically
> 
> The EMAC0/SerDes0 and EMAC1/SerDes1 pairing is indeed the same on both
> variants. But the serdes nodes only exist in nord-embedded.dtsi, since
> GearVM doesn't expose the PHY to Linux. Or am I missing your point
> completely?

No, I was just completely sure that the nodes exist in the gvm one too
because it seems like they do on lemans:

https://lore.kernel.org/linux-arm-msm/20261103-sa8255p-eth-phy-v18-1-b00cc2fa0404@oss.qualcomm.com/

Konrad
