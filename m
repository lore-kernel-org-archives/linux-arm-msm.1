Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216399;
	b=hkdriBXwCTRaG8AOqjKz9vHah1D5xAJJss7ITbB0JVKfg0D6rsH5Y81Gd5Fd+vGJl+83
	 BXytfXNpe3qKUnope+iIeWfI2yv0YHTclWeuGpfB/d3QlNN+VToq5kdy1PI9OSmpRldTz
	 rYf/SvCQ8JdTsHXmCOeiL52+2CR/rYuSVXKGvMzcIdElslaFqawkApOQT9PqdoYUbLd3q
	 8G5rJf1GMKmJCmPD8kBFFego/uEqT2tpcPS0F/oa0mikn2wEywIObvtGVTvr0BD+s/0MU
	 6eiBAmn/Nb3ppJnppoY0+fgzBdCN8RVZPQ+fjaClZZsiC4v8aBSqjWDDFAky0cPBLow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216399;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CU19/uceQg+oPr853pViYrNcsskRDc482nGLsBh3btA=;
	b=RDSKlgw/ut2v4Ti29V2o888N/QG/Z/WFVkuXZk4I1MAOeO7bUFZlRTSo6TnqbgwL3p7F
	 1Rws7f7PkxC61P4hQmhgRii6M/u3I0GaDj9N6AvnmWgLkYruJWcqQyiGcpYWlEaWZeJhT
	 I6QWavNpBAl+HN5vFPWZEz2EpTD6EcaNXwN+1p5syPL8dAH0dDpD6Cexda5usi81+wUzs
	 hL6LyCLzJ54zXwMxfXYpVMB3y3IPBFKyPnGNcDdgDd/rVeCIQ7rDgzhoYdjWrlHzmF36P
	 NYPeLiTIdaLNBftz42yX9JSZWAGWuFl7vFXluZcXJtcVagHyHhFYhbZBEnD0fKbGM8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U3c9yBTX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="NS6/n01m";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D763C606A326
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 09:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D763C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U3c9yBTX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NS6/n01m
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96AWFJ066276
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 09:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CU19/uceQg+oPr853pViYrNcsskRDc482nGLsBh3btA=; b=U3c9yBTX4AZuU3Ua
	syCbEkae6OEU9JjKr7jcgceea19Mz4+tCOb5Ff3iu8u+gsXsWepkqy4EEgZcQcqE
	DyUQb4EqCJt8cw876gL1PZNwz8HrZFvoU22Wo7LKGg0l4YgRU4sPCOV/c61D3B4P
	W7lKPDrA24T2ZahBzsRQ3etV2x75ADbYLVRtbrV4glMnAmx5OadfiaH3xtpIhDvE
	S8Rf5cP8x+8JMr6pu6FpF/mwRid3FUJmuC21PSeyB4bESiAM/0xXC5GAvclzVbRX
	PXXgejkQKuvsOrHWk52C/gMym3CQnYfMzYCZuGtNMCl77cIhm0Ql7zLAK81A7jsL
	/XkRLA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxdqps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 09:26:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-54d1b91e088so2443061cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 01:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794216397; x=1794821197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CU19/uceQg+oPr853pViYrNcsskRDc482nGLsBh3btA=;
        b=NS6/n01mYXh6SSY3uDFwNW/dUTr62iqH2SEFfE2gEqpwn+2y7NMO+DtmzmzxVHDHUN
         7Gj//F4UYkc+1VvY+mCnnld5HIsVBCUbhJgmXI/uvpN29Kk/rb+oCTNtkTtBSePqn7Ee
         io/8+EglZsBHE7rE52wCPvO1VR+RuNj4awrDv1ODe49TFNG1AyvMGYEMQHuSfQOyFYWx
         C4kCQLfpE8JT4o5015NxHbvbbnJIfREecRYBN/77TYXb0h8HgOXP1lVX/E8tpdwbFMnf
         +QgI4gHV52PqJO5IejsUqC51bjWGUFmILQP/08kZeYS0SNdsnqDA37w2PZgX+tWpvF25
         eR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794216397; x=1794821197;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CU19/uceQg+oPr853pViYrNcsskRDc482nGLsBh3btA=;
        b=z4cj1NOMdGQL1oMrooxetjlnCHrcSn8ZL4e+5VPpgQ6kUkql2lTSc9gaJabV9VyTJ3
         blepGyfszk8b65SSe/FOiLPrvaDMdlUxfW1ePkln3tqmV1Z5walTyNMIgXBUO3FcLoQ6
         I+g648pM/4EpxU/ASQHGyyxeun31z4YZibJz1w2tFi7806WSYkFEQvxjShpkXF7nObkZ
         pGGiiSaJXAGd6IUPvAiTR82Be9WtolcTDIGKpaZ4OLVPaoDUx50S1WX8AJaAoh28ITj4
         Z5DN8UETXCa/wWxfEhmC9EL9muSQCfgEEY8+xWwnjcPf8fezlkWeTyCDZt+R5EGQgDsG
         04zw==
X-Gm-Message-State: APuU4Z96WfnxdjPt4wweDh0UBSHm7I1WufJOllzgPT916ReWUuwyx05f
	U1IUa1CWoZ6SjXtSUQmYHrvU9Aoz8d5yDEbJjiMY6gVLtEWad0DHByJrPbajYsHWRSJ8XZDA00I
	X+50CDdFLlVidYowe62ndMxJAxT73jpy5ogf/xhPhPc1PMqWfYMhmQZsFT6MQHtAgqSXM
X-Gm-Gg: AYBFou2IstSR1e2Efy+3VGyDxt8QKuuzL9GHTMH5AoBvwx82GrlKl4D9uXziRUyZH4L
	XFUgc8l5psNI7ilJGr3Jj5VfWcZmrlH6kXbyu8Jry/EbsCNlyZ7nsBCJ1Q/4rJQrcSm5AmFYgF/
	rU7jVkKXMQ+oi+4cbDpdgwK4JWr+RedAdVZw4T9IaHllO8yZjPlILzgY5EbyPiimdQhzb3iHsss
	FaTPIpSedy5fRh9nI/iFISprEXhTx3qib9amudWAK7wEKNBRwq6vkNLjqRHNDvS19lL6dRgSMYX
	CNZFiD/oKMO9jPIX6thAt1xhYK/XTYZKY7Nz4kJodppNuLExAnHHcv1Zb9cfhuDLjSiCijTUI+D
	9CoOXQg5ueR70j2TU+26TZJENV4h4nqkB7KKC08gVIEcU4dQa/0HNta8xBdIGN/Twr/4mMg==
X-Received: by 2002:a05:622a:5c09:b0:538:40e2:ba55 with SMTP id d75a77b69052e-5529f4260a7mr79989971cf.0.1794216396958;
        Mon, 09 Nov 2026 01:26:36 -0800 (PST)
X-Received: by 2002:a05:622a:5c09:b0:538:40e2:ba55 with SMTP id d75a77b69052e-5529f4260a7mr79989701cf.0.1794216396483;
        Mon, 09 Nov 2026 01:26:36 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ea4134sm1200061a12.9.2026.11.09.01.26.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 01:26:35 -0800 (PST)
Message-ID: <90abad23-519a-44e3-b268-e010ae330286@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:26:33 +0100
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
Subject: Re: [PATCH 3/4] phy: qcom-qmp-pcie-msm8996: Do not request reset by
 index
To: Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261106-reset-deindex-phy-v1-0-6a9c9f428be8@pengutronix.de>
 <20261106-reset-deindex-phy-v1-3-6a9c9f428be8@pengutronix.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261106-reset-deindex-phy-v1-3-6a9c9f428be8@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DHqig9oUrhWKO1vZ2dmi4yv29Q2mV7mL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfXyLxFLHKYjF1w
 PDt5xh5GwPAi3J0E6kqWPbga6X0WyO/Z2Wn0V70by8BAkNWEM8qWtxtSTxCfZcNuJaClgClWor0
 pGd7qHq24oB9l9rhNl4/KVNIMioXMzcm6qzEKIARbktOZCiVUnfFfrQ67GF6q0KIK5pB+V59Gxe
 bT0Hjr37LMw3aEJiQCg5C/Zh+8DRca9cHb8GWCkh32r1TdRbtz0gIERQHqUvPueW2ULJdWpzDiy
 bweSXkeHDEb73p2iWTYGAoCSFmWXem8r8ynhMn3rnQRoNHtrhaJyZEZFlpWI3sWilE38wA1OasQ
 0nO6922kvaQwmpsSYUjtcs8MkroAHr8ao93+TFkboHCL1QIMlElTHO/e+mvPY4y0GlRfVlsOPTs
 18jvEgxHrOw4zfo987qtopy932BmOeVLR1zzzjv1W08Cov1dmQT/HU0wmrBKuWw1tSB+E/Xo84h
 nmab3WYaxB+g5BOg35g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfX9tNBa+QV4acP
 Q6giEsZYAqbdhYDdPm5tPPiczzE4TyQjCYwF7yliw22kSiSbGLZQiNINQ3krvYEEF7oHEELlhQp
 F4Lm2LohRwmSMBUILDD+8le5kiZDcgg=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af191cd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Nus541BASMCDIAVa8f8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: DHqig9oUrhWKO1vZ2dmi4yv29Q2mV7mL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090037

On 11/6/26 4:01 PM, Philipp Zabel wrote:
> There is no need to request a single reset by index.
> Use of_reset_control_get_exclusive() to request the first and only
> reset.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
