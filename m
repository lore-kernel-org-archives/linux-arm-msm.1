Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202025;
	b=saqTVWePzYU9DixvCWhRgkxjsQk2SuwqVNIEtM5hBEFgd0XO/yvWh5os+FRvdOH77qPh
	 uuzd0YlaanmDQUrw7gYjX99pLeE3NUTikvuqZsOxItpOXsa98Uzfdzu7R46dLD/xHEXVf
	 rRxXT+z4O6xLiQpWEbbMT8yo8JSHEAjwxMW45kNAS2J0nlF6p0BLShn+vSkiiNGPdwy2n
	 5LzYiwtGUR2ozA5jJ1NoohupUxPpgu6OaWoBOn+hKmRICamKXPjf8kcxoOqb/kfHj5RiT
	 nkg9lkGVpkEUxdQgp7Zwmd/EKCxlitHHsxzhu5H+FrfQf16cJRbyK0Bw5TqANQQl3Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202025;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lZeWqgO+2lHgeB2G3uZ2RGo97UeDvnaxq8shefBQPMQ=;
	b=S+QhSLzfCrDH4rqJ4uolRxm/fQbO05tpeksofwABOwwRu7e8qE6JBdC4u5TwFutdvek+
	 rvIkLD2mv10izlYlB+lPLLBE1AzKYtWK8/KKALEodrxEUWKCoIaTKc/lDbvTK2BUfmp67
	 grolJqgxITEVrDVA+Czx0wbduAtRXj3N+LVrYl7QgBKqE3bttFsiml7nC9x6d0753yFPt
	 xuGUo7+HvgpYo3OkHpo7q3HYiKMBnfwdJqcNf9wdha5xm45bxnmi6+kDZrMl0cY7bTn9K
	 Mcgv9w8ZUbnosUt4mLlAoYzm7cjE1L2u8VNUAVBJYDkMvuIXcBg3A1HcRfO9JonmKPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b4gG80mw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TyEy2RNE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A18606A323
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90A18606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b4gG80mw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TyEy2RNE
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAX4N1153211
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:40:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lZeWqgO+2lHgeB2G3uZ2RGo9
	7UeDvnaxq8shefBQPMQ=; b=b4gG80mwz9eOkArK4wem2b/toBhwdMRvOpAazlgi
	QaGwu0u7Z+CSUeIm8cDdiaaaV6VPEWgJxDRpRzAyAmTESsDswyDXDYUdkgWFpKMN
	ol89qlux3BGZGJZaY7AvrxsST86HegLkTcj6z9xbhhevMKdSPQGIByzkP+jkBj0w
	jf1Ptq9UU6sm0/nXAuWg0egt7G9f1xDrnf64iWTmA8ikHndHH+5RZonOUPOuClp5
	k2/cbTn/BpNvlDOygac1DXQsbksoTqpXRWUSAAVJb3eilEOpaGQJdw29PQwUCt3E
	TDGLOPe3B6h9EpVUWVdOBoKUcya3aTTz1yUpU0PGDIKjXA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be38fv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:40:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5351f1b26e6so19522711cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793202023; x=1793806823; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lZeWqgO+2lHgeB2G3uZ2RGo97UeDvnaxq8shefBQPMQ=;
        b=TyEy2RNERyb2jnyF/hYjP2mWcqc+3xblit56FgbE9GRpq3OCeG2QbFNBHI9NJeVrfF
         HmMp8ydKlSBomEeofrs5TA5v+HJjqqqL/R1+6JNLVnGOA2uIKUiD6QrMKhdi2RTLFg4S
         g0FEY3LgC8v6VNEAn0iYHTzBbIyHkzQUKs+cGJAMOvUdJEFOzeDaRFdo/yRiOiAg7dcu
         9MizbtNTjkd+JX5E62OMFTWkUm620sYsJ+IE30QnR0dWqE0mN4HVimkisbEunK2jachi
         IzewGeTeArCr+pMif20IkqGhe2N1DxT9MDIWALEFdklvuH9R17vd3xYDVfrP9cuue6mD
         lzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202023; x=1793806823;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lZeWqgO+2lHgeB2G3uZ2RGo97UeDvnaxq8shefBQPMQ=;
        b=yfaNjaBOKw+teHja3o4+tTT7MYn/4kgdO9DBECOMGJgT/lGgPuqBOnrDhZxZmhb09X
         67E6N1e/x1WlvYNtRczyo11C2bSNuSGDmBWM+05nc7LZUIoQqiScuJDyI+syMZadrjBH
         wa3aiGXLxcGgAaFp0Oihy67YyKwHBmegib1ClTlCdsPrWlC9LRU4leKDccB03GabYb4c
         /JfRn7MzA4btiax62WwC1+doq0dWmCLq0cAnMJoJtGZOgDzfmzDr45CjEdDQZEjT+4oi
         Kc/5mTB2bhd/i+M9Vf4iE/HZCkmCsSjMDN6nScbzbpgLRgnHt/+G4cgn/NiaM/89k07J
         2kYQ==
X-Forwarded-Encrypted: i=1; AKwUvByKjr18CZ/jBXIZ65bI3A/wPLTeZDjNuoVv/3LYsu0tL4WkaVM5a2yoQRQsxpesPaaGsPeKhyUFSxX39f29@vger.kernel.org
X-Gm-Message-State: AFq9FYLYbYfmwIoQiOwH+3tPqXPbZX0A/8gpMiOVX+NHBAMcg+vx0R//
	NZAXfy1CH7Ya5q7mRJkD6pTsJSvZSXWoofBLyaercnjjbY9kM4EGCsZTiVf7dbsbyfNX+ud/Etj
	JVgDv/zndE7ITM7p135tltOHVy6/3vh3sBTbdYyQkqNvAr2jtBPs/HV892RwSzPWxEf5IWAn2PS
	y7
X-Gm-Gg: AYBFou0x/j/qLi0s81DcT5tUovlixyiUDNZp/WekvBHxLfd9JF63zmXjkwv0bpfscNt
	5VRhZRIjpLDyykqK98Ez8RYAmvm/BBaGAXjuWrDLhcps8gQ74pX+TFycnQUqcO1/aw9vFcTNCE7
	S4dEtwMGHs1EhLkmscWK61hLG6ADiWkwzTLu1Clv34LyVvXBv65iXjFyP6JFuq3+1rCnkJsvAEw
	k9mubeiHV1XC7bSurEY7Vq5XJCh5MQpmRs43wM72AY87TpXkAwi4jqo87la6PzHp3a/JLEmUICi
	TespZ5UDB6nolaG+PrXzTHJ2FlfcT/L4wcF4XE6fmYaLPybToRvX3pOd9T+9pL1UaeaBCISVpEM
	t5N2oAd5ZzKMzPrs3bM/J6mUJmCs3SCScjSW2qvodxlIC1lMqKm5ecqJLVOrqN3LhGw==
X-Received: by 2002:ac8:59c5:0:b0:533:3868:1f6d with SMTP id d75a77b69052e-53fccea7447mr44209291cf.59.1793202022428;
        Wed, 28 Oct 2026 08:40:22 -0700 (PDT)
X-Received: by 2002:a05:6122:e208:b0:5c9:a60b:e5d8 with SMTP id 71dfb90a1353d-5ec4ccfee2dmr1553631e0c.18.1793201562412;
        Wed, 28 Oct 2026 08:32:42 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4be6sm26641291f8f.37.2026.10.28.08.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:32:41 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:32:39 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 08/12] pinctrl: qcom: qcs615: Add gp_mn mux function
Message-ID: <iw26iktbkxacfgbt6btvh6nd7u7b3wvogh5c6sgdt47ve24qpi@wsc7vilt3bge>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-8-ff8e4bc8d567@oss.qualcomm.com>
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
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-8-ff8e4bc8d567@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 3ybt2BAJRg4BdI4E-YO4RHX3Toe0yQ5Y
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae21767 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Y5GSmcL30hd6fLb0oHwA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfX3c5Y1+B4QluF
 UpKqTKAqDB/IdyQck5wSxCiF71bFmkPJ5p60VJIyYYL1JO2LWlHaKnio6eoRFWab6zjKnQ1idNs
 ZXh8TDgR8ZjLDTLS0qiqhBZvlID9X1Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfX3e0IUOp5cZuh
 cPiyKVSDqMNJ2+tlrKYeaMQxB+3PHttCn9KyBhelkmakB6Ihhv9JgCizzW5Tcyej3xLUqoJf/zA
 wcqrHsj3FR2nJ5+R3GY2I4IWFogwrKNyqqSU27PHORFbLHz6+P3D6l9+ct8jMRTzv7lXJuBgQrC
 VJsV30rF320ld8iyN0nGl7RI6540GqnDD9FaJtDQH0AgSu6uG2W8wXpwlRH0oJXPKzPqSStEmxF
 d6Sm2utvfO90X0ZameqvQGwOxY49fRfDKSHBFMb67YxEe5vJjuYY8QhQju7BZF7sbx0M1CVJg/I
 SDFLYQpCt0tywWKIUUUd9+8Z5/SwE086tG2uS26DUiGnXWSoP5r2Yo33eIV3K+495/7dPsatGKF
 VyIkGiIK9iPhssq5HCsxqNb0IUXn0OuFxArZHR3dA3QtnHuCzjMPdZhIr4jEUn+rc+DIgRtx4K/
 +w3zQhOZeg4R8T3SX2A==
X-Proofpoint-GUID: 3ybt2BAJRg4BdI4E-YO4RHX3Toe0yQ5Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280062

On 26-10-26 16:59:34, Taniya Das wrote:
> Add the gp_mn pin mux function on gpio29 of QCS615. This exposes the
> GP M/N divider clock output on the dedicated GPIO pin.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
