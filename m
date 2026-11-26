Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703664;
	b=fHZWlVGntXSU7oGVGNgKqbri+qjjp89M+u3qmGsTFu7BxMAnOcbfSgBT6jKbWx/Zaioz
	 tf8wQAi593LkCYYuL5+xX12H+eci639V3Yf1FDG3/27DV6Hvcs0E4rSir3kJ3FpPk8B5s
	 uoOvlQKCcSG0L/5dKfopE3n2VLDnjybM7Gkv0HFfKI8Wxzzp5NULt6djlqaiWkJQ0qrFZ
	 MbrDhCSmgwdt9Vu+VuGlS1k/L9vzPRYrK7WXRImiIciwTI4dXXWDappERnr8QyhZLn4z3
	 CpX9U+rUwMAZJqc5dSdOBholgg1uSXAwQKn0MHuUtv6HeWQGJXf+GpNo1JHMrAo8mng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703664;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=quu9PMR9UDySxr/IqPO0z01rsJ1Q0S+Kq7Ac8gw6hUY=;
	b=qER0C652y2RrbQSKu37fZAPEDTV+mr4VolPKnRJyEo+MWJtZsp58a3wIXRhTM2lIpg9r
	 4VI9AkTo7QR+X9JGMtW7D5mdK083ipxruxSzhpn2TVOCR4Gw1L9yDnOl6qJ2V3+LXFaaM
	 sjqvOzKEPpkARXl1Wweo3h3M8f7dxkJRp2qqe4YsAoqcDTJC9eALBGBNQ4eyMN79BGSQC
	 7wbg+W5EIsQU+9Ao8RqjNXxoC2qLzZT3rIY8U3qYvOWhhvhNGkePUjlJ6ca/sT2q/Me2E
	 HMclLQt4fHV+yHFNu/TD/ClfTt5LczlM2PGXB720MkgZvZkOZEgiK39vTLh4Bugfdiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yb5T9A2L;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CGKohUQT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488D3606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 488D3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yb5T9A2L;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CGKohUQT
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEVFJH3863822
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	quu9PMR9UDySxr/IqPO0z01rsJ1Q0S+Kq7Ac8gw6hUY=; b=Yb5T9A2LDhvYcSMF
	YYJSgn2/hTEgM+/24HXeLjJ8Gdr2skk9kv5BJYrd4f2Cs6reOTAAl/+mQOrx3zp/
	XBfeVDE5k2ZiUEkjSQp/n4ukxZAK4lPPspKCVKHwz2bR7+sR3QTQ8RVZwMvk90bO
	dS1T2rd5oU/EgmAv5eM33zcUswixcBLHfFvC+vnuqVFvc+KlFjCNbuCVFVxEC1H8
	XKKX2nsasBWmWvF6kaeo0ATj2QlIJSQ1flp2PhLsRUD9vp8xNhX+K5/2senat2Wd
	UTtjLaUzamdkfRJglLqXDJ9+3ogo9N2T/eVVbZr30QC9T/AtEhPXze2sVlWI75jb
	YoNC7Q==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rht8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:34:23 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99e1660e7e6so97982241.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795703662; x=1796308462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=quu9PMR9UDySxr/IqPO0z01rsJ1Q0S+Kq7Ac8gw6hUY=;
        b=CGKohUQTHrApPtjLxhI9GkbEf0AnJuVURw/f4fgkxMiY0cppkKUa0mUWAVxuC1CNF4
         Z6LD0E7CutpBLKsFMXW1l1bPAIRBZfTl9umm7YV3wCerRThwbjfoNwxUs9Ak2B0/F8K3
         rMIwXT3UJbH1mw3kTlV67MUooQjoBL31K9UPDQL7iRGUz63iDRh4DFoq7MbrorceCKfn
         ShRAl8nxJdo9vwRD8XmqNrO0oyVAGdWx7693jP1Q9zEgNtfSzzL/PWqVYS8hGhaRdNb/
         PQm9QiPpzdr5+/ajtCz1SguszJa6Xq/ccHGrftc+PHeis4PhTvm2KE20BU18Cbk/rYFX
         6WmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703662; x=1796308462;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quu9PMR9UDySxr/IqPO0z01rsJ1Q0S+Kq7Ac8gw6hUY=;
        b=W72+CnY4l7X8DiE7mbf1hNR47DaZngivTe4VeA2ShqtYHupeD7WFy0ZMLYUT/68ln9
         HYeyvzVmX7A2AZtVieKc/vRBNUoLvchOdDNZp/YrZ1uLn79y2TrK1NATsZbSN28roULX
         MjbGaU8Vfekwg7wYw9TtqTp1cLTZvgsqwaBSaQJki/6dVQii1bKaQ6Dx0+4I/21HYSII
         XFedbosqaY/174pKjNL+/O9Hdiswf8vDY7C4ipxXjKTDjnPnVJvlotqr25bLuNsDciiD
         DDTN9tAaEMi2dK00Yrb3NO+OckbJ9w9YuZ+ODkpVNs55gOIkIJK214sIcaOsoEYmS5PB
         Ybtg==
X-Forwarded-Encrypted: i=1; AL+hErG76ZndVwe191jFy3DSzvn7PB88mLyWnHlsOuA5YnNrjNX37y7e1ANNTAOrPlxhl1uxR2xsmtDdZDEh3zCA@vger.kernel.org
X-Gm-Message-State: APuU4Z/o0IMTWik6+KVVHwTSiLYZWLv6FOIzUWBGJnKEGHKmjy81XsF4
	knnlDkSQQiB0cCSdXp6/553xWZZBrs66mAz1nB0pVp82RKv81n586eoKpWEoycp6u4JqNSkb9NJ
	ARz2iaPNTJY1ynRpYZ6s3I3yfLVOaMMIu32txarMRHPMuXMlZ2rRFMO7XYj4Xlkq33BOu
X-Gm-Gg: AZFdTZfczEMtbsm50OLyzfi00MHHPmuadxsdLd321oEJlfw1umA5gi83UnIChto8D22
	Z2AyFe19sqzILAL+s82aP15MlLRziPjF6nTLu4QROeN/37g91BeZSmjfRGVBBREC71ABr2bZrvG
	qZwK6W95H+FoGy/bcZ3nKMjC4PcejaBg8Y7rTFBnWNdenRBoq/eCoxgi1HE9nOpgrZ2+dOdBnmj
	X59lvCDxHrRhhwRUzXR/cP+V7wg+pK/Hvw9sDyXoA2rr3lmde+/d9LO8PvMZtEwiav9yZnwQQvc
	Ndguzyml6REzyzCjbDDHBBMvCHqOQIgaSF6Xgkw1ohrC9+5F2IArgyf6PCoJHyxWNpDpvbPFgB+
	sS0B7ZMogVZ06dsv7sIQKAvto7X6N8QkXVS05nVK8mo6VJDw9zShRQRUnQTsK/3kgkZwEt9w=
X-Received: by 2002:a05:6122:6107:b0:5ec:e6be:d626 with SMTP id 71dfb90a1353d-5ee8ae0f76bmr14516168e0c.2.1795703662502;
        Thu, 26 Nov 2026 06:34:22 -0800 (PST)
X-Received: by 2002:a05:6122:6107:b0:5ec:e6be:d626 with SMTP id 71dfb90a1353d-5ee8ae0f76bmr14516124e0c.2.1795703662041;
        Thu, 26 Nov 2026 06:34:22 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc5396sm754027366b.58.2026.11.26.06.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:34:21 -0800 (PST)
Message-ID: <06744cd3-e8e9-41aa-be89-c70f352faaea@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:34:19 +0100
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
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: shikra: Correct QCE node
 configuration
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
References: <20261120-shikra_qce_fix-v4-0-5249e31394ce@oss.qualcomm.com>
 <20261120-shikra_qce_fix-v4-2-5249e31394ce@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261120-shikra_qce_fix-v4-2-5249e31394ce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NiBTYWx0ZWRfX5HeNPzbRzBCb
 e+Ppng5yJ7r/Kmqi9OMWvoc5M1nuS25EUCCRH/6j+oExMc9x2dZSvdfINSTVTqL5eB+QOic/9mH
 1BZqXQMJHwWHpAH91UExOMOGfobmIKRvXPl2fg+Tw5G9iptJUbrVyJ40UOBrgZiMeysM2GNTBOW
 yi0A6Yy9E0IvpX3vKes77/ATmXNgPnE4G0rBv6YuUdo79wX9Rn3v6BDlPKTPW5KHAl+oNXx2VpX
 91KQ9e+akqxH8BaXCYoaE9f5JjCgAdMWLf9n3iZwWk96qKaDqCQXL/UK5Mb7dgOjGlXIncQD8IR
 vANbd/C4bvfkTkh4IY380yr/X2waYjl8llXq0Mok+9F3I3lYCcKP6/Vy8VA7TU0KghQQl4vkD04
 RtrLzMIoZZ8t4nbzqmdk0PoFvGaLM7USZUT5LZcuwydKtdfKPDwObuLKE6KQbFLHuzmic+2GtKU
 QpAA0XKROcDeEwaQ5rQ==
X-Proofpoint-GUID: AtIZBi313Z_zxPzvdvpOHAPPlCMTBKPj
X-Proofpoint-ORIG-GUID: AtIZBi313Z_zxPzvdvpOHAPPlCMTBKPj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NiBTYWx0ZWRfX+JkHBb0TeTyX
 JEa9QKume0SEU/QG8ao1h5ZVJY089UxYA9DpvhS5YgkUlcNh/hGrdHn7Uh0N4LgJq8CJWzjCxnj
 xFnibKBBlRkzz/7gTRLG+8O00riLpWA=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b08436f cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=4q88LKyOuv55sd6UrHYA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260056

On 11/20/26 12:29 PM, Kuldeep Singh wrote:
> Shikra QCE requires an explicit core clock, which is missing from the
> current configuration. Adjust fallback compatible to "qcom,ipq4019-qce"
> and specify core clock to match updated binding description.
> 
> Cryptobam is controlled remotely and its clocks are therefore managed by
> remote crypto subsystem.
> 
> Fixes: 099cd05d200b ("arm64: dts: qcom: shikra: Add ICE, TRNG and QCE nodes")
> Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com> #on shikra device
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
