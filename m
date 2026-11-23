Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454733;
	b=Izo+5zAopPPpv5HjmD9sZhCbIWxVyCO4PhjVlDpdKIf4XVyq2WmIjrnyve5yHnGi5bGU
	 Q1EVp/hmNy0njYqxAXNLHb0/+sz+MbQI0JJW2nK3WD0E0i0xUcC9v00DLj/Kj6KTCKsmP
	 wXXbjeY1Orz7kptl+rTqE8ZZOw5VF/Ms9wAAf8h5/JyZse5I28Slb7dFoNlPy7y/0k0ks
	 P81wBIEHic/qNsY9wwKK5NQB8ShtALfI1vko4YvFdfa4rUtsibFrOdlUNZuZe7leOz5fi
	 z2M0P6KZHIM9/7oNiwMnICFk7f+pFMI1J817eQ5uHQGbV6OKpWzeCgwwzQAhuU2HqMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454733;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lfhg2+/rNBhkH2W0arnD3tR/lai12P2aVjqQX7vl+Hc=;
	b=2G9LfhoZl9wozlFAbRAvrbNHmXNBXbupKMrFZsIglZ9tKY9v2d5JnGdEQCh7MLJfa5MF
	 R+POcAiMFUNwe66KouOae0iTWb8AGqzxa7yLYuyptpIvWEovnCcFu6niuDU1wC1acDD2n
	 8bYmLBXvFLEYssHniThF6hxKM6DWGV3CUZsoDyh409iTDXKGXHAZBejDBP1TGlYHUM2xO
	 S2DtT1zxemg6OdZKr4G8pfI/HCx1vVJeIqIWtfYeWoyDQenDaG/P3DIWNi1KBAx+Uabld
	 oZXwhaVCBry23GZYmFfFJASUU8y6Rx2SEdP/wPo/av0+OkU0rJEXYFR5NvQFW45vdJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ES/btqeW";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IRw1kSt7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D69606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 17:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2D69606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ES/btqeW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IRw1kSt7
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGm9D1861152
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 17:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lfhg2+/rNBhkH2W0arnD3tR/lai12P2aVjqQX7vl+Hc=; b=ES/btqeWk9Ry0Y4v
	sPoVsd4C6na0WcfUDwzbpyMtnHs5bhkYPybKr0Ecn5CNPpAnGtJ2KRoTSefgpWvb
	WhW4cG3J1iecCApouM0FOxcwsEPDtC/Dz+JZXNw+eJ+pABSjSMhYtz59XtGFdTeD
	d0fR+0wd+MQXKA//TVuDVjOYxcoUdchjCyvRjRsu/RcjF2KOoLQgHzN/jOWEUilb
	cY4R496mMi+8iksuU59eHyMhnG4+gSRDuR2YiBV6/Pwqa9Kqzw2Fp8Cfgk//Kqx8
	UH5imSinHWeiwAFLJ2drOD3iW/aTwHN3iVnrpD8swI+eDjvTGggOp7mbUBRauXCC
	Vue6Iw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a2hyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 17:25:32 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99af36c8b98so40416241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 09:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795454731; x=1796059531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lfhg2+/rNBhkH2W0arnD3tR/lai12P2aVjqQX7vl+Hc=;
        b=IRw1kSt73pjEXYwJdclzKQgGlvG7nnxBJ/HytOijac9G7jNTPElk53F3x9kII9r1Yn
         CO1pum/eIjjS4OM+EZL2yMK5oXbpn/4qlTZcXRRc0Yl+oxI0h9qHAC5jdlUficg9L+qp
         LPyPVTBqvLJHbTt6VsipJ7gVzRfzq7deJC9QNLCfoC1HZHGBn46a4FwYH58yCrBFsn8Q
         9Zhm/+KWB1fy9sZTGLtklj/ImEvRizE5gMORGcpkuPZJRHNu4AgKNHaAJAauO4MO34WM
         WoyDW7p8Y3U3tMEmDrf4nemtv99eNd5Ban3wGfyGPenvxjjcRlVHHMS6lbB2WpON+9i2
         73Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454731; x=1796059531;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lfhg2+/rNBhkH2W0arnD3tR/lai12P2aVjqQX7vl+Hc=;
        b=mQrYPsyRqMs8W0F3H3zhiJ304AB0S5dNXjV3M65Kwm98SDg7XEnxoYiLyTYIhK44MC
         1ZXEWC3pvqhxLRr+NDtAfeG+mLwG4+Lu+aGbhEJMS3abo0COaIrFh8StGCW1iHvF/yNI
         UlaU99aXxykvzWJEqCRoMCp2Pckn9g9nfFkcJSRI+nCFrTQUv/2PC3z4itdv51fJqx+e
         frR+XhG0DJHusr3ibHBI8jXAhPAW1Mmq+3n5XUspVfGdaRE8hXGr6txZCaBhNgTx371Y
         U64pIKDHVlUxnsdFt7DKDElZVdlbCAOOkLmILOxORO4kaHZFrcpWZx8TJTtiKmeThMOJ
         RujQ==
X-Forwarded-Encrypted: i=1; AL+hErFTXmnS4OOKus+RKa6xb1OuoM9YoOZoIyqB9DVqsleIT2WnXH7/0xCTtdMI7lCSYVVHTuIY6VZA4z6KDgxs@vger.kernel.org
X-Gm-Message-State: APuU4Z97N+J3mofDfXqbkDXOMg4R3MsTSaAurNa0oALVLbhvNWodLN8v
	wDEa47xnRBn0PvjN8SWaKrTpiiZv5YoegGXuSUgJVmPkGUCLMSgOZh7wzCLZItY5GiA5OJJt2jB
	t2MhgDlD1bsTdmdWXtAVLE3f6A1Wt3oStY+QoAzFcdqSIwc9VvH0KeS7BAOpZC9AjUueX
X-Gm-Gg: AZFdTZcjyMZrVKVqEVOcnRd29dXBE0/TF0ENRHj8tpMN6G+SSaN8XsnF24vCviITeh/
	F78XbyUYNDUCUDP6gLM4a7qtNwdcWNdvEhoyNp6ndBYDsbRtrHB/U+oiZj7kcxjb/ARTgQ9L0Cw
	GHAawejwtZiwdNrOoQ6K6Ap6nboD3iXGRqdrynGaZhnSLxCC+6n7GVuXzYdd9twvJpDlnTWHZmU
	kGrxDSwSoD0+ZqcLQNj3LcvRWT+8kT/AoWukyAAJkPCbMY5DLVTDPGM63dkELjr1eYFjTCasBFK
	4gBCGpz7ZtGHChi6MCAVOCIzKYl+Dmmwgix2LarQXQ9NVqXenAmM7RzqjTebt9h2v7XfeMWvtGl
	jxKacBtDdUgLqVo7w/od42CpI479LK7v6e/oSBqlQ87voc8kCmopAThn1k3cBni9RPvYUq94=
X-Received: by 2002:ac5:c00a:0:20b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ee8af8d7bfmr7450526e0c.5.1795454731021;
        Mon, 23 Nov 2026 09:25:31 -0800 (PST)
X-Received: by 2002:ac5:c00a:0:20b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ee8af8d7bfmr7450472e0c.5.1795454730544;
        Mon, 23 Nov 2026 09:25:30 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm432664066b.63.2026.11.23.09.25.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 09:25:29 -0800 (PST)
Message-ID: <97ccd0d2-6410-40f4-9c0f-c08931dbeb10@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 18:25:27 +0100
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
Subject: Re: [PATCH v3 2/7] media: dt-bindings: media: i2c: add Samsung S5K5E8
To: Hikmah Gumelar <hikmahgumelar@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-3-hikmahgumelar@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123152722.168879-3-hikmahgumelar@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OSBTYWx0ZWRfXzL5doaVAr1O1
 J8KeVTXPXc45qx3DnecD7/Ci2uQquELt946zknx7f8Q5+tRG+piw/v3Y6z/Lg4SQeEsdLZ286tY
 U1ClL1o03Be4/OoqSUnGlhJAPuSE05k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OSBTYWx0ZWRfX3/Y5Wx43wDAC
 q9TMOBtX6vsPYUddOEtS6+8rUNRWwYmjJost/f9D6pqq4eOBv2wa+1vNKudjurzlQnAmugn/l7S
 ptf6fJO+E/pVBPIJU5VtIwqUkK7kwpVV0Ln/VUalMGAyV0v9hU3WqBVDMVI388kMWeGKOe4mmly
 kzoXRHNhxMViaLXFUEQAFfkAEpIerBIoJ15lJcu4XYRLRBxBTCipyF9tFfyD0jrrHwEv0+7kN24
 QR77BcegRAi2YtzZO8WDxAU2tDS0dhQiwBxXtW6Xvp75Qqf74pYQko6Mjmhrpk8ryiki3Y5modv
 pqWzEJHj0uT7NJ1rbEY00lLScA2igbLlBVRzZjlbXFoDpBa42OzgWA2csY1Tp+49y82mMFpLY75
 PWIE94QjBHq9qYe73TqPVOaugM/uyKo88oHXIBStQWTskv07sM6yz9Gi5Xd5Xwq3tItYN1y1xJJ
 pl3J7rmttZkoteC/lYg==
X-Proofpoint-ORIG-GUID: 5rG8mXex8O-OmNJWHJT0EePGz-CVvXKc
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b04770c cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=2S1_hLxhzeHvXZh1LqAA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: 5rG8mXex8O-OmNJWHJT0EePGz-CVvXKc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230069

On 11/23/26 4:27 PM, Hikmah Gumelar wrote:
> Add Devicetree binding schema for the Samsung S5K5E8 5-megapixel MIPI CSI-2 CMOS image sensor.

Please wrap the commit messages at 72 chars

Konrad

