Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580951;
	b=2eqLSX2eNmR7pgLPaJZZtXjCAu2WDQryQjqVMjV8lnaKTpAZ93yE3KukxXrv9j+Os8s8
	 PuT2FyMmkDEMm88rZt7IfkK+WeoXQ0lV9up4j/CDl7tx3Aty7JEi8Dkz4drTIG9RLob1B
	 I2Jozz/eCpwo4/OuTC7ROyQdAqeU0E35z0C+BzKo5PlBQ0jDbjeMh/uv50AlsL8eEgZ+P
	 3QWcunxLnjH73K+jZmaoEd8PqBe9lFLWW8t0uhZYBot5G2GBoB2HXBX7L4P0PJ7IcqjV1
	 oXxpRFdKa4mJUYocmJp64lBrcp1LLQQUi7HoLW8EN/79LtQ3F5RADTa0e5w3rg7alVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580951;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Hy2vR6XEYdunQlOeIzDll/SmaIf4eDJn3WPqqNU+DJo=;
	b=qT6dA+nZWCW6x13AnaYQF0vh7mn/01+2/wUiXFrdxCCy6fevbJ54cyBQa0nJX96NMdi9
	 xTX2Rp4V2IpWaNd2BbhBrkObfNUKfcR14o4tn4r35DcTg6jLfcndBVIOeGcyMGEiTpEIi
	 z8A06mDknfNTID2Q7EgDag7l/gJzFI2U5tkaRvEo7LRtsQ7N4O/6bQncdMKvwhcUsC16B
	 vcyp1Bb9ucGass/rFKqUBxLKBe+43n98dUk1XSVzdYSmmATjuzZ48TWAhNSVx+4UAyPug
	 7WGy5aPkmxPzH2nkkt/nJz+ewiBAv8BBpmzqtxxQdX5CgPQDX8HHo09g8YVO2haMk/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YymxBtwr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PZICF0ud;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C74606A332
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 14:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0C74606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YymxBtwr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PZICF0ud
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJcNN688976
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 14:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hy2vR6XEYdunQlOeIzDll/SmaIf4eDJn3WPqqNU+DJo=; b=YymxBtwrPMpNZjwI
	dS/UiYllpzvW8Cj6FxCX1TXiuCYhyWexMvP5OFJ6dBM5e3DXSt3ukUe9o7hTJKbz
	69MtL4YAFXRjDVsQ8T6BmX1kds3H6sbMXro9nBHs7xgsRHOfXHAAEYjj0flb9wj4
	Fle4lz9UUvGFyw7Cq6x6POMZWi7OwpwQ5KdRTtrYxL3FA01uOHkRj47RJjGwdnCf
	w2DzE+L3Nzay0+W7MeQa+NsMFSSQMWo2jhgsVJDcZ8W0gRgGoHufUZv4w58qjgFg
	2b7iNk6PuY3TAtpRLwCB2OK0CXNx69Ncd9TLTtC8J1KXwHOOFOuUzLYqik1dXzRx
	nwZc2w==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufjsxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 14:42:30 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc081f3066so54173137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 06:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794580949; x=1795185749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hy2vR6XEYdunQlOeIzDll/SmaIf4eDJn3WPqqNU+DJo=;
        b=PZICF0udmnPEgYFh172gALIGRHcvZik/27g82Eyn1jXaZHG5b3c83s+NeUZ9gh8M45
         vX8xgvjKz+JAQgSJX7KpiKKegg4d/dyyIisJ23/SrQlP1hb5f8Oh+LH/V9nJOB6sV/TW
         ochErq9A6xvB8H8p3wZB175z4zbmtYhHQW0yCZMlown8ZUZLYyaqPUm02dBnsAhX1/im
         4PIzcj/sBliwjGc8HBwLmi8AVn8E1FW/og/Kk9eSOwmIm0a3KUMxRt6RmwbuSJta2DHz
         BeAUB3zhA0f2Dv4WIsNK4GqyuM1brCwh1HqRaF3SZ2ivbRLUGxg684ycIi6RvQobUTxG
         XZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580949; x=1795185749;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hy2vR6XEYdunQlOeIzDll/SmaIf4eDJn3WPqqNU+DJo=;
        b=s7szjmEqazRxaLXOrma9HkZ8C2pCSBzHXJi0ttjPX7RsxlXV9WivjwaqGUklV1s4rh
         uglPOrE3NvP3TkbCMszH2Ce6/UGI+KijlDegd8Tumsplc+TbiJ5Jew9+f71nTh4T/q4I
         ANP0HRCLe8FIVMEZcWE1k4KkAtj3YINtcFLp2QdN4n5XEKTyIMVwCK9d368QMt5xjwrB
         bYVvY4fDfGKz0alYkwVodqa2eqs37mtq1ZZ46S5ujz6CDiidJZp4IdHMV+5KjGHXAMkD
         /L/bxeOEckZBiDyOlirYVz2So/gwtfz+R3nzgM1I7IWPDGCrnhBdz6PxB5eL2OFaqJAn
         IY+Q==
X-Forwarded-Encrypted: i=1; AL+hErF06G9n1khnqK+9Gw5GLSWC/J2LicuqM5qvHAaX5+GT84ckhkZXGcw4aE1+//QGZIsjRexZ/oMmEstESK0t@vger.kernel.org
X-Gm-Message-State: APuU4Z8mlvYFFpjU8c9Xro26Eg/j+Iw99DelWqphQaPyH5kB6Z7pNZKt
	DYx8QR5tRWbMGgKG7KY4odguyRj9S7msYbe5sE17iHfWBy+rTgGjPhdUwaYf1kPRTtSmz09ERb8
	hAMl6EdUM9A8j60a9Amo2zdvuPx6Ct9SFjZQqS6EdUZmYqkOY8fJLhpTAqiwKyDQ9zEEH
X-Gm-Gg: AYBFou1sP1kJky57ohfGQohTGUYsXqrldDpt/Oy4C65OyVfowXXBmRBmoxuEv5QByyk
	yivunnoUqLWqScS96MT/btbXRq2ol+Yh4otdlot8dYLqbmzkOAmvOUZsZqIFIHL4e4wSnFHlxwx
	I9x6D5Fpcz2qwt01ZcaKM+frfwGKau6oX7p6wAuiipn/1Lo8SBsAttjLtF7iTOAxbbv3OkIUmow
	5UQg7p2IsmID9hWMQexGHC2c/wLxH58ZpklBfrRQO9dHcwCrgOkeQBJWCt//3RrLye8nxw/Pocc
	cW4ZdNtvds36cwwBAO1d6SYRv32F5hJWyU9ot9Pqx830Hb52U/uynsQGexYPJ1w9H+7aM5qlJo2
	b7N6EjYPuIfXwhsJVrfe3qbPxr/yq/JG5G2xHz+RmcdzKjkjMZyW6j13ZWrV3hxk7vvTCyUY=
X-Received: by 2002:a05:6122:107c:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ee34ad4402mr832950e0c.5.1794580949149;
        Fri, 13 Nov 2026 06:42:29 -0800 (PST)
X-Received: by 2002:a05:6122:107c:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ee34ad4402mr832924e0c.5.1794580948486;
        Fri, 13 Nov 2026 06:42:28 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b42163sm111420066b.41.2026.11.13.06.42.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 06:42:27 -0800 (PST)
Message-ID: <21a22750-2586-429b-9179-da3548c6c3f9@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 15:42:25 +0100
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
Subject: Re: [PATCH 0/2] soc: qcom: Add SoC ID for SM7550
To: Aditya Choudhury <mail@inferno0230.in>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261112-sm7550-soc-id-v1-v1-0-57299906d81a@inferno0230.in>
 <11036baa-7dee-45d8-9319-311288ca267d@oss.qualcomm.com>
 <avcgXkYgdjpfnfbZ@mediaserver>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <avcgXkYgdjpfnfbZ@mediaserver>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: s1nCOwUqIMfHG9sEbT9-aSzvCT0yubwg
X-Proofpoint-ORIG-GUID: s1nCOwUqIMfHG9sEbT9-aSzvCT0yubwg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1OCBTYWx0ZWRfXz4QJn4RxQFeW
 s2NTdoJx8Mo1oJhZSwRWNmdo0V5wWKXmI0BTTLkwBn10eKMJe2zvQ4zHHB7dO4HEIoCYuejQubS
 PNlwcda2N2ZJZ+faIvWhnbx1twtD9KSC3agJQ56Tmu79v3E0ihE+z3v5S7GCDX2+TKZGoBGRmov
 8auYF4zUDetxjF+8U/aWY2d4WJbvh4hNEiO+85rK9Kj6vQCqNPXpJZWd7lOxOxdt86sQKgQldBK
 bW0baw7M6ORwuu3geQVC3pXydH757aAYHUfVHMFEmzZGpGQ3lYKqM+vS2CM/n1hBPmpxrFvOmEH
 AZQuF6Sl6IeF2I5+xu/B0YlpQvA7vnT/gt6d2O5VokSaESRZzXNSVv5Oycy2ec2UjMUE5aS/Cg/
 u2WjJ1XhI77jreaeD5ckgoYEhcEH5ZFamNIO49wNEZ0zp4AqQHpEXiMi+FRJdmI1uWZ2UvwF6aM
 6mZ1DA4OMwV/nwDTunQ==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af721d6 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=UeJPBouCTXaZwcwbQKoA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1OCBTYWx0ZWRfX06PqmfKGkIz8
 DQnQtfd2hW8es5e5aezY7Rm4ZNvm3kKTdCBY4+OBjWbMtrNLQfGqjdcgLgBGd4cG3eAKQWDHwKS
 K5h6GhYVdwxJtkVic2zuA1utuP/vQ4s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130058

On 11/13/26 3:36 PM, Aditya Choudhury wrote:
> On Fri, Nov 13, 2026 at 09:12:24AM +0100, Konrad Dybcio wrote:
>> On 11/12/26 11:30 AM, Aditya Choudhury wrote:
>>> Add the SoC ID for the Qualcomm SM7550 (codename "crow" in downstream) to the
>>> dt-bindings header and the socinfo table.
>>
>> Please use the real codename of Camano for the following
>> submissions
> 
> Thanks for letting me know. I'll adapt my patches to use 
> camano instead.
> 
> Should I also send a v2 of this series with the codename
> corrected from crow to Camano?

The current commit message on this patch is accurate - downstream
calls it crow

Konrad
