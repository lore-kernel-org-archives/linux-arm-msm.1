Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213794;
	b=yrw4FlMai0P5C0Iw/rj3UwqDuKnZg2lACuMOeuUdtYpRLBAyUkq+w0WopPRy+fLT5Tj3
	 9mSHBdKL7jAIzMKdo9AsYA8VsQTBPuZxG7Wn/W+33tbW2Jrx779MtfmEYhNXqvIY3oQk7
	 LXsswWMOmhE/kZMyzXAd+nEl7aYsInhv6KzUd1ePX3b6Y9coIreFhsgs+0Z0cEjJTHrJn
	 F7Q8SQWuycBhht8XqxK/IC8sk6ZF4W6kN4z+PtFjDCpB3f6Dz1lgxoPCnvT6Qbq+8WmiA
	 0CuleQ2+2EZ46xeapz9pGC1Wc1y7qUuytcE7lsSC0KU+7d4IYnNObAYz1ZgKq+4s6PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213794;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=p/ZKyylN0Urkjhx/26exU8C/4qhR2hsoHR+1hsywbWY=;
	b=2EAd64+6qJNOZ+LSO56TWWaJ+pTqbqb5cmu7Ivfd3GF3dTL7FQyDxOTMEOHqswbASMXA
	 0LHgPaRHwwNFmjG/fKkcciz6oXIXBN8OEJ7Br+VHLlLW8eCYpMIdYgu7BJjxnpE1zmeiU
	 d2FYS1mIIBcLx3vdIHOES/3jkQ0fvO8yn9kwFWczn2pebf4cCi0plkQ023sgXgkN8nnuo
	 oir4eWCakbmS0A2aj3J0GbPuzK1ADLMP07/KrNp3yMaZcRvDcUttUbdjEDPsMUu4rNAVo
	 0EhOugGjMQfmS1MBbBZkSHbc6fhvsiRAAe2Dqt1lv5yJLCvP0vc1GUpaC61wXovXWFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="gdx/3HWj";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZN6kJWHk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA4D606A31C
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 08:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FA4D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gdx/3HWj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZN6kJWHk
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A6QQ3581948
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 08:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p/ZKyylN0Urkjhx/26exU8C/
	4qhR2hsoHR+1hsywbWY=; b=gdx/3HWjx7bdRK5oIOacDwJIX7V6Qb46z7HwDf9q
	77L/LTC5KNg0qDA9Y+M54cY15sj8Y86bPonjqpIPnz6PDqJ8aFEr097TGY7lKEJM
	GlxCgqZH7IOAz5xppM4IayJRucTK1sZRraCot8+mppUcovVq5nwjkgmP5MlfcjFa
	eQzzejKYfN4/exBqwNXfSvm4SpD9VmrHLu6NOP1AGF/qsXs8Ff4F27e9EQQvSTL9
	zDhlCR8JCFpqyDtsTXaZfu1AqVOi4jzsvfgH6ug2LtVYVKOq4LKIMu6/ER6dcAGA
	cBj1nBxcBJC20vM2c0/JJrKE2wRtMplV8I3AeKwNVnsw/g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv735e73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 08:43:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844cb60so118693485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 00:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794213792; x=1794818592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p/ZKyylN0Urkjhx/26exU8C/4qhR2hsoHR+1hsywbWY=;
        b=ZN6kJWHk6haOMJX6Wt2zh6y+0vNvTzBJFenQ9fDGNuY0NaAb4SdaA5T1WCwiHuP4Iq
         RS7apD9brmCbVS24X8L/HzGoNIkzB521oiiF2/vdg3YcmE5K0GZIhO6ni2oc4Sw1phOh
         fScFkuYEffDstSUW/UZ0ihh8XK89Lzb6fFqoGKFQGUW9x4zx9qZv91FsqaXHkA5aQ5sj
         zdgCsXNQ5HttykkpD0pTDmywtmZq2ClE1EdhhouyDtNPH4foZSerx7zRUO1maJtGmyO9
         4C/E6vAsJB2ATOWkrCXvG/lIdLbBdBQrFKxhMvgeZyzN2HhlhRs6x/MjhFSchmDcgdDJ
         H2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213792; x=1794818592;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/ZKyylN0Urkjhx/26exU8C/4qhR2hsoHR+1hsywbWY=;
        b=eubsx6N0IgqXMeupt2m869nvvy9f6PMCIc9ECo7xXWumPblKtrZWoaQX02szQApvVb
         kIcvnMVElvsugyLfET2TGJhnhi9SDAb+V+ZdZrjkjRq3XWMGramJ6ygudJN2R/z3fIw1
         3++E2eYVl7iEcJkYW0z35drYL83fvF3gBdK2c7F4xhzrr/d42BCkf+Axc1T/flPqFB6Z
         LopxyPN0maNPvDpqPhVjpMCYur+dDz7FZBmcZhTLONCMaL436Hb6/W7fISa9hPT6ltl8
         Q06GDWHSSwT7MexjwqH8blyZWrO1qKYbHfZ+r52OXbPZlYkZwa99bpmhokE3Zi24Fi+J
         I+ag==
X-Forwarded-Encrypted: i=1; AL+hErE6XS7JM+Q2I4MG+kFvS05R3XHZucQkLSvxNaQh93UyysrtO65hM06dcuZybwLOru/HvR19zfQi/JS2bvTC@vger.kernel.org
X-Gm-Message-State: APuU4Z95Cr3p2pgQPIx6/ycQmj7OVih10nZeVAtkAJ68gq4narPQX3BL
	DA8ddx0QjMUoqLKMI8ZxjHa3n7Ac810OL+wvzSDt6/CppZMDwslGTSzjgbtlfOcYJbmTqVELWc2
	fTPz+L1b3yigECAoe8XSy13k2i9N2ULR4PBtR/EyYDnQCgnQXCT2Z1pMyUO/1hIRa9M3e
X-Gm-Gg: AYBFou0jcTQqbq6OM1K+NlYbodygFRyRPtJrAEDAZXEyOSNayygV2/qpxuHwIvAz34w
	Uu1szNmZAKPtDIKQzlILFbQhsPadBqaQuAINAImRX7At+5vkx5a/0t+4VXKf6pcsaLYDV8ZDFMz
	LeCC0VV9kYBIp39pUX8Wn7fyPmoNu+d8EqxAKH60aq0VZfEL2oqrmq7g98KtJnIoEoIXjUcS87u
	MdTEdkEXSQCZIKgMpbV5vzqZT/ZczZB2FLgLGPFPvOsBYJEvAKp4/uK73F/ISqqbhnVareJ37qi
	NzHrt2lXOq1a9EqCBzp9X7qL2UUyuC1LJ3GiFPQmGCwHVJVkcOEfVOGUHVGiedS4hf63FE+dbn/
	1T8IH87svSuSnFM+3hu5344KwQ7iFy+SUVcrYeMkuYIH3b0SJHobhq3V+HxEgbl0=
X-Received: by 2002:a05:620a:7014:b0:93c:d209:4ea1 with SMTP id af79cd13be357-94604d64e78mr903640785a.24.1794213791653;
        Mon, 09 Nov 2026 00:43:11 -0800 (PST)
X-Received: by 2002:a05:620a:7014:b0:93c:d209:4ea1 with SMTP id af79cd13be357-94604d64e78mr903638285a.24.1794213791066;
        Mon, 09 Nov 2026 00:43:11 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e6eca30asm221574505e9.7.2026.11.09.00.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:43:10 -0800 (PST)
Date: Mon, 9 Nov 2026 10:43:08 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/8] arm64: dts: qcom: Unify Glymur/Mahua regulator
 handles
Message-ID: <rda5jcdbwc5xuimxvpz26j6thd5ktgw3myg5yvsfv4jkvvqrk6@vmzjdppfcfqo>
References: <20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com>
 <20261106-topic-sip_cob-v3-1-52cd3826ab49@oss.qualcomm.com>
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
In-Reply-To: <20261106-topic-sip_cob-v3-1-52cd3826ab49@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX26JNNwctm6uT
 pUDhB8fffq+UpNuPgSipfcGbW7VirFatYx8dTq4u5qhqECN204IQDb6pAbrdikHIfUowYDr2EBI
 tZI4KGsIMySakFg5gYqLZvQMr0XlFinRHak0CDTQ1z7nFW+FEYwnTMGkDpuvl0pbVF/KWQN4UXx
 UNV58kKp1Li/qjy+C4DULdVtPu0zAWHaMtngwajZNh/TSqoANPdUgNKZ4Gygq4VKIT7EQ4i6gEN
 EDZF4vrtqSZefTRB7RTSpwfVu4GCeqZi5wMLcQXIqNZ4I0GXH8Cbq1JSltgQCUcTAhD731KQHCH
 i+T8rinxOlnCe7BuuV6SErWcKwzI30nlI1znly5noIbS89xh/4SZH3sqFNaNqec5R/bvf0VYiq6
 JSZiYRfsmHTynUTUgCmeOqWaRC/hBylFSFvCjglmv35nboMdZZlkz5J9/Hy8w7Mx4RjKJ3JGmwC
 86sP8oaa5x2f+ijw02A==
X-Proofpoint-ORIG-GUID: edW10aBBuKz4lpCfAVjzPdc3K13OAxRd
X-Authority-Analysis: v=2.4 cv=bcb+w+PB c=1 sm=1 tr=0 ts=6af187a0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=fi2DgTRXG2WKjx0KyZkA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX0fEU99pTZr6i
 Wo10sT1qSPgCQWMTWAu15l4xnK0Fi2HwE5Bj0KYkHsVGnkOovEFBphzhK4W+xs+1FptlCIEIf5/
 2+u9vL/tkrvVT3IzDLJkpCzzxNzvjBw=
X-Proofpoint-GUID: edW10aBBuKz4lpCfAVjzPdc3K13OAxRd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090034

On 26-11-06 10:29:02, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> In preparation for removing on-SoC invariants from each device's DT,
> start with aligning the regulator names and phandles to the format that
> appears on schematics.
> 
> Tested-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
