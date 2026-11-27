Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769488;
	b=0tWEz6mFUstJ5r5DqJq0+PyiWRIcmyyJ4rD21ix8abfdYN1eUAy9vXfSoDeW7Mk9pCup
	 uYzf+BIGcUGKHg4ocYLmBAMm45m9zHaicCKJ0/4Vclx5wb79Bt6P97fyi95sdkeb/WCnk
	 aHxNbD/x8JY1W/vnKPkt1iQk/OAxWog3wDJp+ZXcOW9Y9sQk/lQJEkZenWKRtw+tOLPaW
	 B9AS68AC+l59qR77o0yFo6OhlUgcTaqh3/vIEdT7lIb/xR0b4PTid/WbdEy8DEoaXkt6l
	 E0uc+Cl/VogRh9BuwgkI+ZqS1UMA59NOZpU7UUfcalQpHBtWaMnrzo+1Kaa+NI+QLCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769488;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ncAkwniUiKCZ57s4pfRLhFI/iOUpcsVyWReMCLf+sjA=;
	b=T2MTTxg4JnFIe5PN7c5w4e0tIIUzNYlIx81ioNWDHgCxDvT/DCrDh6d3rf0hq/RhZVs7
	 XvnrR84DtHo9Lej8LDTsXphcKX1h+HIoarT5hR1kI+/12OOe9ysStSBc2mP7E+wA0TGnJ
	 k3U+JmyUSz498QVGWWSQcTCXyFqwiopAOCe6gt+Ovik7VN40rQTK9zwmMOnuFDE/9yhl7
	 MafHjyti7HE2Eea6XJ9wFfFlzh2MmaefkYt/Qw4KXkCaeMcVf2aMRh+jSGmAEa3olLYRP
	 Y7kkxGK8/eCoEpUOg/gnhcbfOUyoBL+ZGEyzxoyThOOIVKJx2V9N36Lu/P2YSUsWMTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YcLlb51+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AhJ79DrL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DEC606A330
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28DEC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YcLlb51+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AhJ79DrL
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GpA9560400
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:51:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ncAkwniUiKCZ57s4pfRLhFI/iOUpcsVyWReMCLf+sjA=; b=YcLlb51+4v2NN04o
	5zS4k2bopuvWlh0VcLauCjavalzbzCU9Iy8GINWU2h4Td5r1NJIZwFQ1+QXRR57u
	m7qMUP/fpXMOUP+7bXmAOR/n9daanr1Y8T+Mw7J1PhYavLzenv/LjNw63Q4UJWCw
	ifdHNBr2S8bG+IjxAuBgqGA5XXqI3vWC9UnP4+TzqTJvy4UkgN/coQYDa0gTBeUQ
	wMXkXWBjodLboeeksYpKcu43tzkdy8/S89xp9TUYLj0GRtrBZu8gpucgtv73SsLD
	UQ1YQ5w3LHIDBn5YKZym0GD5pwHZmjogdqNm1s4uErA2g8mzfZd/fFCWEBUB2aQL
	A4nhEw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqk3jb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:51:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5476f5bd009so24588831cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 00:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769486; x=1796374286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ncAkwniUiKCZ57s4pfRLhFI/iOUpcsVyWReMCLf+sjA=;
        b=AhJ79DrLJvCCLFLmdZiylIbV7d9OBRpjMNHqR+77fh5G83JYp2w5xdN/13YStyBmZ7
         LqyKh81/a104qLuUEHwcJAZZSaIYvKh2sAGQvCho73cnXwU3q32N6S4shB8PhDhIqjGJ
         1KNUVogAq0y5WX67mwTgXcZeAFGWuxwHFrYGvF40KvqU1D8FSMVZtrLFTSde1c3FePg3
         yVv32XQjuG0qUcsedBxmprP5D4KMeEiZ/iOce1U3azDnAQs9CEJwJr9XLRVRN3x16OVq
         nLwbWugz2GaLcmuhGeFYKhZVZ1aD8L+Q7H9pF/wXn6lMyYc4tAtS6uG01RA88+aZ/aCH
         M9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769486; x=1796374286;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ncAkwniUiKCZ57s4pfRLhFI/iOUpcsVyWReMCLf+sjA=;
        b=YtK8+nsq3qNXUxiMKQUe7X564csCYOYZyuQOJcEP8OqCOa21o2IxQhy1XFclLdKvEv
         qoGBNbYQMgSFLSMiDIRzxQgFMgTZXtlSNq3AfifpCOdGb/urhIFAvsbuhppoa1E3tpsT
         ZmZ4ryua3tzXM+fEfxRUZZqMetFvY0a1a0ZmFurSQTI8yl3uDs2WemnnrQARk0ZBbzeh
         q1LJZ4NXuSVSkllKJHgANpKhPDhnfLPsXWJZocySYQtkQEPCz1P8AcfD2mvWUTtMjdrz
         BpTuWM9xYlKibQGK9nxmDuvOjTzpsjFZMXe1ypQg5ZfipVy3MOCyNbjt+yOM9HVP6bz+
         MzVA==
X-Gm-Message-State: APuU4Z+NZxw3808m+Bz8F0tHB8ihLWAcJcjPwJDpB5e+2KTbYQJRfPFr
	uh458BlYXPH9X907gDMXAoWt/8NlTfgP3zil8DNb46fwHfyY3mHE84hyoHhb1/EhtQmXAAtaHNT
	m8TedU1frH/qPGriOh4/ePGN//xna1NuprgUAAoQ2OYryX4R++AJTA1TT/tyxgClUA/pI
X-Gm-Gg: AZFdTZevKVSmetBXR7MmYnQzLdhJNGeOG2eN95kOEMuJxb60mmwKerohP4Aku1DSQjC
	8qsFwf7FVPCXiiCJ9+SRJKQhhInGbos5Ylz/1sJzY7MdddfN1Rpat0uD84C92L1aDuQxax3aTtP
	NRJkl8TVdVe6g7E/PPiKpglHIKbk3XlHrD4w5l4IqRfO33dt2EtPvm1mXCKVzjLCwawedOl6NJu
	JGAZpnyI6VtlnBpLHuqf0IQtvIJ2T1XbL/jysL5HooRRjWAdnIY8YcM9ubdpEe9gSj9byVJvh/8
	JbUpbveSYuM3KgANzLo2eWHqkzXkZkCgmE2xYFDhf9f5p1aj/CRYcef152Kdf8b20J4uyP7qlu1
	ZjiQHRmjEDoGUmY9AYKnYCicLg8EkRnh4nFxfnNu2ZiXh3ucikOVTWJZ5fEmGk2X8zpKIZQEET7
	XkXo6ub3c=
X-Received: by 2002:a05:620a:a78d:b0:945:c5b3:6356 with SMTP id af79cd13be357-949ba8aecbfmr3881940285a.2.1795769486558;
        Fri, 27 Nov 2026 00:51:26 -0800 (PST)
X-Received: by 2002:a05:620a:a78d:b0:945:c5b3:6356 with SMTP id af79cd13be357-949ba8aecbfmr3881937585a.2.1795769486037;
        Fri, 27 Nov 2026 00:51:26 -0800 (PST)
Received: from [192.168.0.242] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm260458785e9.3.2026.11.27.00.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 00:51:25 -0800 (PST)
Message-ID: <dd5b2309-fe69-4c78-abdf-8be998247c62@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 09:51:23 +0100
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
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: Add Netrani TLMM support
To: SignKirigami <prcups@krgm.moe>, Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261127-netrani-tlmm-v4-20261127-v4-0-a77415255784@krgm.moe>
 <20261127-netrani-tlmm-v4-20261127-v4-2-a77415255784@krgm.moe>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261127-netrani-tlmm-v4-20261127-v4-2-a77415255784@krgm.moe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XwaKqz5quJ6gDPsA8vpbrPBcPK8DXJFJ
X-Proofpoint-ORIG-GUID: XwaKqz5quJ6gDPsA8vpbrPBcPK8DXJFJ
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b09448f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=1w543XZNT9zSpPk5rH8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNSBTYWx0ZWRfX2EQrjNd1Kla8
 JbZOL166Mn/vAw3o3geZTY8GJ56vIdXf0ovXYTynBDYfMbxLeNFlsiUDJurrGHoonHPZZUca3aT
 hKhWao91Vbujx7Hsh+YBHSpUd0Lc38E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNSBTYWx0ZWRfX5X4omrKrFSb4
 yM7SKFDOaebxBYMdE2AhW3wBcHRdN4M71XUthIfzWOb8vl47j7wkupxD0boZqXd9MrrawQOiKdb
 42mScr66RBjSBHCDrlL9lrLHOJZffpKB7NExb46ZHa4FAzk7tCVooLiy1emkv1nd+JQgN17645U
 druCM48wX4kolkLnXVGe1JjGCzMdfoZasDwA6awIPrh7eCSh+Qch1CBv/YdcRaRpVTXXuOKIAxp
 ErioGe4jI/EimjkFnPg2I1s1DVjgC5MA7O70Z/IpBDbfd1d/UVzG0uTK9dvoe5f9yYv3I8KLfqj
 Kfo4ZYHyBEahzVkSTca8zyimS+s7YCe8+DoiWD9tkEnVeXXPPvVUoJWKob8cp9h1J2a6G1SIpxX
 Ek7ClwEFgDrvm7Ntylo5QXNYKLpW/MrshJ/ybZP1Tchovt5t/ZQr3nEdkV6wwMp6wBCRre3mJsX
 pW0eNVSD4Xi/el3RGgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270035



On 27-Nov-26 03:47, SignKirigami wrote:
> Add build support and the driver for the Netrani TLMM controller, which
> provides 142 GPIOs, pin configuration, eGPIO and dedicated SDC/UFS pins.
> 
> Signed-off-by: SignKirigami <prcups@krgm.moe>
> ---


Feedback from an LLM with doc access:

Move gp_mn on GPIO18 from selector 2 to selector 4.

Add gp_pdm_mira on GPIO14/selector 4 and GPIO15, 17/selector 3.
Add gp_pdm_mirb on GPIO59, 60/selector 2 and GPIO61/selector 1.

Add rffe0_clk/data through rffe4_clk/data at selector 1 on
GPIO76-85, in order. Add grfc0-grfc9 at selector 2 on GPIO76-85,
in order. Also add grfc12 at GPIO86/selector 1, grfc0_mira at
GPIO87/selector 1, grfc10 at GPIO90/selector 1, and grfc11 at
GPIO91/selector 1.

The rest checks out.

Konrad
