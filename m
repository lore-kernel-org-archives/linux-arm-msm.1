Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626502;
	b=XRis7/CgANsMzQf18OSpMRRm2RW6Ky7Uwp80UD6dVPich4Rg1GxsAoArYEcGtjeymtQa
	 wTNWy2OLO8LWQLfCjWbln+iCGdFx21ipoXcfM32w64116vWYQMF3jG0nOrP9IOecnToFo
	 c1h9joV94KauMjMU1sn5QOkLGjgQ1Ca/JdZFEyBJzUA6sAlGvwNtaFEJfY5LWvVQkj4nu
	 CC62x0+hM977b+KzQWlQfT31qDDokHnEjakH7xghwrfCAqxcKSWj8bdRanPU8ZTvsF+l2
	 iZG7NIJPkAM0mM4kS11TYVt9lRARvkmhzX7QCCdmW1SNj6COKE/fQUKL+iuMcmpUMMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626502;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D3OWRg1rBciJm/YVBuNgf6sr+pRkNnJI+vUSSl5wbsQ=;
	b=On1y++3bxsvt393KMwWFdHK11AsD5/4825Ocf+vyl/98dWAcB/oc7cuSpDpvUVRXCpt+
	 OZo+boX0nnCGpH904+OCXGOqNgzYBEUqUNLs+ns25SwFgdCJt94045LmTPhGHnRvAhvUY
	 xI0KDkjlZuYl/UCcK8ElA53l7p/DuazjlWexLV8VfGY4mXPfNKgH3c63FLJcWSW6pBQmn
	 B6G0fi4WAgrG2r2jIO60i0nf7x6jTcF1q4RRaSObbSVsq8OKtYxlx+dCYHc/oUVoAbP+1
	 +KzakHZs3P6Ks5jvyayL+PQndDOSml2iAvlrU0UekfOJ8iGzdWLsYO+EjNfr/+mNTYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fpi7fyrS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KO4vprHf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8791F606A326
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 13:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8791F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fpi7fyrS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KO4vprHf
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAien3982126
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 13:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=D3OWRg1rBciJm/YVBuNgf6sr
	+pRkNnJI+vUSSl5wbsQ=; b=fpi7fyrSBEJTfdPY3Ac7FbpxbNfNRmqUrl5rsy4c
	fWTKZHcGigUUQxfQDV3oWicArPDkKb3K9yIZyEd7fwe9jwQsH9b42rUFTr6WwWgG
	dzYqYNxOCV+3pXJITXjYK8Z++MJPT2+eVWHw4fqt1zJElrvcUV0IHOsJ0NwQP17L
	HK1rXv3xV5kaehmaKbH7ykVshK6g76IbCwI/L6PE75LTXNwM0QhXk9gAttlumm8i
	8LCXrjnLlKlGgaf+xGac/2Z1LW+Gvl1Pn6saDyCAxgptvS278wiqrRTmUsr5siQz
	nsuuHzbLxjEgn60w/t6lD5rdx4a2SKZRJYO1vF2YVqgwuA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpss5ge0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 13:34:59 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc099197b9so2503002137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 05:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793626499; x=1794231299; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D3OWRg1rBciJm/YVBuNgf6sr+pRkNnJI+vUSSl5wbsQ=;
        b=KO4vprHfEwIEOMWdDGmZS00ApXb9jCCkr4ayuBfLU1wXUvpWYluYtPwOv0iF72DXAP
         a62siY1O5wfrR+ZY9XcZcZtoyyVTjPN8XcoZRs931M2jESk8R2sKTdBtMAwxznj/CGeC
         /WrMFV+5g4+2ciUH66gxLtdEY16EM1ga5cl5xr1Hwyk82wxLaH/0MUhjNJ1gfOTVNN0m
         +WAMGKoKdfhzD1XldLAkSJfrDXbFgFlJPo/n4r9ImqDkFXYzrKSDVP7+phH7eeNAet2z
         lR07lEZwG1FCfHxN8h+EhvF2zckfqYaiMSOfp2yHy8tzR5kh7b9Isoanc4HHm8fP6igN
         45uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626499; x=1794231299;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D3OWRg1rBciJm/YVBuNgf6sr+pRkNnJI+vUSSl5wbsQ=;
        b=1noQzOI/fNnVghAj8asednkuOEsETwvaub2xrhaBg8nSxKew6M7WNoM92BEE4B3nId
         w2yBSYAWEK0KkmoVmHLprISqdTP99OdVn+QxwwB8BdZZxPewchhdrMyZzh08jSRW0DSF
         B6Pc/hGKxTN4iiFLnT3rgm/pOMw9OWrk1YoVBwV4G0TJwyA2w8Tr9Ooh9089MLHGmqUU
         VQNDsZvv/YqLo6PNgqS06u/cVdAOE0bHpN+UUvMKREBzRrAol9uCRaVXqFJv8W7eR9Zp
         neVExX4DBfdHyhfcU8cmNpmatMWPW5VkSMZdL81Gt3KL54hpQDMeEjufvuc3qKGNjyuH
         Be/A==
X-Forwarded-Encrypted: i=1; AKwUvBwtoBZTvJFIiJPhO4bG2SFRd8CKeoZ11xjhvGXLZkShAH+1htIk9jFoWTq3i5Ora4ThIFuPzcB+SRaO7RGO@vger.kernel.org
X-Gm-Message-State: APuU4Z/HJIVC1fmIXDjrBV83uQ7jGg5v+MwjY/FAngfrrsId1fbGO0TT
	KKUA4wDKdgM04oT2rebCAWZjURiqochpvy798qnrgASV43X8lXT8B1vdoMj6dke0pNPRnN+hvbp
	HI4dCBjF/r27V/Q9ipiP3R1eptubPL4Rjiq7L9zUEbayxsNo17j5+XkVS48xWBkJuw9pA
X-Gm-Gg: AYBFou2Gfd3c+4xei4n4IQSJ5GZ6Vga46Gz3o64H7bFVrK7tdXBR8WgUB8Uh+201keT
	DGA/kaDnF/+PrwUxNaphxWmChcH2VD8w/PlcXfj9QiGKXdrtC0pssinpd6DnRWKtCj19+1mWDoV
	67rLK3UIswnGGvyMAzcwvTFNjBwjftDYwQn5HrkJuwxIe476uD9Iz0JgmzCw2iOQRnMnGIX+ZRL
	eahkLXM+XYUoKNABRwUh2JGB+Q5Y/SthkhYbSDSJQVwkBqZMUezYR/TxA2YTxlEDpbSm+gy1XjA
	FnF7O2+eiZmcqw19D0ibyYldfV85qeeoH4WbDYbzmCrtj6Yp30nfCjiy6ol86xN8vW+2tVD9Cvw
	JlPcZslw3dTyi6nXteGOcrBKs6ixK7spYuc0nDTH8rckiu1brMtuMzq/I7C93HfI=
X-Received: by 2002:a05:6102:524a:b0:7d0:3ed0:c630 with SMTP id ada2fe7eead31-7d072d5f983mr4251370137.34.1793626499203;
        Mon, 02 Nov 2026 05:34:59 -0800 (PST)
X-Received: by 2002:a05:6102:524a:b0:7d0:3ed0:c630 with SMTP id ada2fe7eead31-7d072d5f983mr4251349137.34.1793626498551;
        Mon, 02 Nov 2026 05:34:58 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm19915342f8f.23.2026.11.02.05.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:34:57 -0800 (PST)
Date: Mon, 2 Nov 2026 15:34:56 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: milos-nothing-asteroids: Enable
 IPA
Message-ID: <gyfssymhkvifeb5a5xh5bazpoaguqtfijrxsjlibtd6u2zm4x6@otcsrjngserp>
References: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
 <20261030-asteroids-dts-updates-v2-5-66a56c537749@pm.me>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030-asteroids-dts-updates-v2-5-66a56c537749@pm.me>
X-Authority-Analysis: v=2.4 cv=VORIDNPX c=1 sm=1 tr=0 ts=6ae89184 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=RBzhS24iIX_dIUMOZkEA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: H_PKTTI6_3kRv--qbwycCBw-G8Vmq4A8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfX3RSif6fvbhO7
 /cP1qXyM54cxXpgEO3twYQ0MA0zVFl6I0Fv5sIxaCh/hG0ZmH2pregOpNclMEMZ9Dup/BdQwTxe
 Aw7wP4q6VcdRSlr9Pfatandr5Bmbv626dRfg9kKL7TgM6dgIKMQXafeM3OhrlYsost7n7eS9nkV
 jacQKlU/cojXO7AWQGnpV5kqGuXTDOMpcg61+n98gQA8fSaW0U03d3VZch3P2sRzdlAQWFe99Zj
 XWPnu0sH0AOiA/lLwZWsXAWQ5xJVWKV3t8Ub8e6eyUs3zhQGuKYK7NS5bi9iQE/t56+bd/I3rnx
 TwQIiDGbBAjIF91fEEf+1lviRHBgTHvzGsP3CHHltet6N3B6LSmJrU7n1Hx0Vev+RW//2S1c602
 0jCiZVsDh9I5PQk6mfqe4CzB5wdjebPiCMohE3JUakeMVGZJNzM36LgoQHYxMEx2ILG8PRypAbN
 ySggiUKpWdXqn5Gq6cw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfX8oq9vuqBa810
 CKJnRWXe6Cnqskoni5FH0P0n2zYwuC2vrZy53dLyMvLOPmT40NOYn6OlhEKB0YHZVDXew2Yqu4F
 7XDVXfNssyjr72I8dwwWdE3qjhup5sI=
X-Proofpoint-GUID: H_PKTTI6_3kRv--qbwycCBw-G8Vmq4A8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020054

On 26-10-30 22:41:46, Alexander Koskovich wrote:
> Configure and enable the node for IPA which enables mobile data on this
> device.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
