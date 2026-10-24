Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792874328;
	b=0gDhHihkyoyxXZe1OWOGdZ9Lt8JBAAnBh7dVU2liq/T0I2GJXdUHl3Htwgy+Fe/tkm/d
	 N8VCmoy4xQvBAqJL6z3V19UDxtt0b7oebm/oNQTnoPspHrkN565wDW8WRKlrgSRZ7fP+T
	 EhOXi572dJ8Ot5ayMeCZpJjjfmBqN8vwGd0fpaF13+ROr8BowNKiIlzFm8fqyj9feqPwr
	 rWKQkwYmhen6306Q0Q1CgZunj226keiPFxSI1n+5m1rDXfFlUfLvehJm8gkTcAoT/9xPX
	 QHB2khf1wlVvkNRlfFwy5VZJWenl0vf530ddOR19Uk26Kn1D17RpucTNYznMTjJULIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792874328;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jmQdvOcLeHgrhM9Jlt4/V9JsPNpFugxpi7xLAla95oA=;
	b=oApdrVz7GfjLGF9JmIypB11Q74JDjifKyzyjJGuKzO6q//zaDFPm+RpipOgGyoYr77j+
	 na7L5WTjEOz0BW9oqIAuIjWFvIQ8EW2pQMNyroSN9nQ/xA/d+OOT1O6qW2eYYp5XI1Aei
	 6b/GOsP12S+P7Vx4JU3LCgIHUGl43HrwjFxda6pDVuwrcmFE3PvRZAUMtJ6Ixly+c0lEo
	 sNZhkgqat6JoM0hVYzfhlXa5OsED8BbXigJ90gPgTova3hnQ5FYzo8zdFveo/pctXU0s8
	 cGJ8+3u9yXEb0g3b9AN3ELEngVxFr/5Vfi9Nhsxa4cby+pLZZWIL4QpH02Lxo3eipdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ag+f3dIq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cf7N8aGo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE44606A31B
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 20:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCE44606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ag+f3dIq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cf7N8aGo
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69OIU6wL798289
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 20:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jmQdvOcLeHgrhM9Jlt4/V9Js
	PNpFugxpi7xLAla95oA=; b=ag+f3dIqoUJexnVqnzI4uMwh/evPI7jYTcmjNgoR
	9pqLAGpdFpyFiu1WAWLYI3SiZOS8Tv7t/NslhB+2JhZlTs3mXaAleXygJ7Efbrnx
	P0WTozD8xJ0vI8oof10etJSOJp3Z3Yama7xPixD8VZn0BkKWpXqQt+xwKdjAemYH
	4RYNljpRpdcGfVT8LZ++ZG6qU4K+iyFNPXSl8mVwP/VgF2m72jVTAWD4UfM0EULb
	CFK6UN7jZ336qI69M24YK8/e8XLzT6SWvRuUaQjKMYRTP18Xmkn5jvuyKJBUNQ9X
	ZsYKAG7YLa7WM92tIiZgrkcmoKuqQEjwCgDBXBgyfiW2GQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgnuk9kvc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 20:38:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936aa34873bso399367885a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 13:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792874326; x=1793479126; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jmQdvOcLeHgrhM9Jlt4/V9JsPNpFugxpi7xLAla95oA=;
        b=cf7N8aGoNpJbpDoveH2HnhhQPIO/esV9GjKpXL+g0BnHHW1fOR4gtXv11YhmACVnC8
         YZjt21AINs/gRqRvSEKhsfh0v2bxjhobVEt4nPu22gQ6RZmHV18n4VjNCfH5fBgScP+n
         /+El3WWdbHafCqG+krX3hdHS0w4+ZRkdq/e3AH3oaVIsqQ5hwqo9dJV2I7ZFVbESsIEe
         nvvur17Ymt1JoFaxRE4JWblVa2muUxaUKbUqTw84FTqjUkDkovSt8FqsmnWlys/h90t6
         JUlHH0K4SoJ2PT0JUCB2OjCpiBC5ilC0qAWM+vgy4bCR57G/NFyMAkvMpqYx4AJOp0za
         u9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792874326; x=1793479126;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jmQdvOcLeHgrhM9Jlt4/V9JsPNpFugxpi7xLAla95oA=;
        b=pVp7azv42B/X28rakLANUnx4pAQ7nAOIOP4vpDbkmjzp6l+Hxc+sG87/+yMQ1nZsUo
         n9zKsOrrEXPKdxCC4nLWYxutfyncC++4WxrYXzeJOlzL+lIhIn4FEXumta2pHlvKlyJK
         kh74PR4FgikKPhGhbr95YLmUFYD+5jLcXGDsf+lPZHcE1zwh78UNhZTgaP/nOeftSqb8
         sKx1Wp5ATmkGT3WCLq1Ye0DfUJO/B7k88GBdOrJ7FABw7HnsELugoYgnvjPujLS9tQfi
         WhN/C6riche/fXbRw2SDhUa0GAy83bCEnNO6HNwc6T9sOgQJR39oWKLkzuJFeU8zNV9V
         /IlQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjlc1SjQm/HScz7HAnASKvrtpY3ZqsKis/lgGsbyCfzKj4l7K8uhmcSa+kt05DRnmZN3afRmNPTqPKpbcq@vger.kernel.org
X-Gm-Message-State: AFq9FYIEHvxuo3qFMQXaP0Un0L2MN64B5yw9yp9Z1aIgASh4JUhaerH2
	pf7JsD8u1GTp2oTsTanF5/gIU4dP8km8iosX9P0Pn2pVU0gYC8U5F3FD7zoV7JPXthZyJwOv6lm
	Jv533tmU6ZA5ZvvAViAgIPZhwSbBadBhbw49EsaX4c33MULU2GAH2kEJNznr/qyAKMPFm
X-Gm-Gg: AYBFou2AY8OYsvQYnWb9Zw0tC4V52F2LNd5AjVww3FacMBDTFsgbcxgwmRy6W1xqkcE
	7kXqQ6O5GAAZONQrMgFECM5ivg18hY6/sHAIKxP9x0P0NfQ6KO+jJilJl63tRDZKwsctlis8v9O
	ncdMpTsFx41NBmKuRJ6n7jQNXf8GSwveCFyg8fSCY0t4V1Ur9oTsa+4t/sqIrVo+GbDAf4asWY7
	JDTuLuttnz9nT/Jg5XDd+x1izE0LxRRkilWmQQiJ/6DNHJcSx5MC645+VCCDgIdkiVQbuZHP1+S
	UuEEuuvz/pTfi23AKfyx60OwCQ6xru4KRYT6VKrw4wP4JtW4d1lP2sN3XW58xbAtlH4N2Rxo9iN
	j8RNLgVA5MoImTBcw
X-Received: by 2002:a05:620a:a8d0:20b0:942:e4f7:6104 with SMTP id af79cd13be357-942e4f76149mr101912885a.55.1792874325974;
        Sat, 24 Oct 2026 13:38:45 -0700 (PDT)
X-Received: by 2002:a05:620a:a8d0:20b0:942:e4f7:6104 with SMTP id af79cd13be357-942e4f76149mr101911385a.55.1792874325422;
        Sat, 24 Oct 2026 13:38:45 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2d6f6fsm73963625e9.12.2026.10.24.13.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:38:44 -0700 (PDT)
Date: Sat, 24 Oct 2026 23:38:43 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: Re: [PATCH RFC v3 1/3] arm64: dts: qcom: nord: Add SoCCP remoteproc
 DT support for Nord
Message-ID: <p4auxf2q5hzcdwynse75ipjmzmlh625shldy32ovlv42gpf7og@vy6jv5kfs7gn>
References: <20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com>
 <20261022-nord-soccp-dt-v3-1-1a69a4d54c42@oss.qualcomm.com>
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
In-Reply-To: <20261022-nord-soccp-dt-v3-1-1a69a4d54c42@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Z8Z5j3RA c=1 sm=1 tr=0 ts=6add1757 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=OoMBhQ6JWsPECC_GQXkA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 9h0w0fGOE-alDh59Q7LPxTxccMCE6p7e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA4MiBTYWx0ZWRfX91qj6B1oF192
 6GW/vj+Hf5c2qFP7SujRFyeaEACXA/2Ymh2ikTMzi0incwhc2GPMwONipIigJ0hYqAvpNKyjnJ8
 L8BFtLd4OH4qd5wLLslzhtfXdxI+2KDuZBZ8BiwgUGJi9/EG3BEX2N9Pe2iPgtPERVPvmwvwGHZ
 BPZHkLAHBYDIR5CATl9GuqAWYrZtJHWGL6E8UWnt5OwhtwSByt3OqDUUVwiGDERLEklWTZU3otU
 t9SGPUT6YZYhSxg04PDxyYizmw0o+Y1ijQf8tdfOOih/6s9mSb8mrqb1dAs3s2Qni6N0RYLhJbc
 DpXAtDXIolDZxT8gQJrFEZ5FMbKvCN/Fz5SYyBmNfVypOpQCsNHCmOPZmOE5VxSfcx+liK4LpYf
 Avk5rNLt/DpN6OyExWwOFWkrsz45tzjOfAw84CGpnpuHQ2XkLcsRTfPobl3azaByEYKM6tTbzG/
 UiagHUlYhe5UOEZJRfw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA4MiBTYWx0ZWRfX1yW2B7P06BFf
 ar5asUxVz6Q7ZZozEIXBrK0AlQJCwp16FhD5PmRiVUN2AiCPefo/FgComO/6mQDtRNDa7ceey05
 bFxOb6zOwiTOgcqttrsOBdGR02uGFR0=
X-Proofpoint-GUID: 9h0w0fGOE-alDh59Q7LPxTxccMCE6p7e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240082

On 26-10-22 17:27:01, Anurag Pateriya wrote:
> Add the SoCCP (System on Chip Control Processor) remoteproc node and
> its SMP2P configuration at the SoC level in nord.dtsi, and wire up
> the clock and power-domain dependencies shared by all Nord embedded
> variants in nord-embedded.dtsi.
> 
> Move the SoCCP compatible to nord-embedded.dtsi to fix binding
> errors reported for the Ride board.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
