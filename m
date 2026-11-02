Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629674;
	b=ZzL3tVKmK/8YafpPLx539TcZKF+0cbbj6tU81uOSqylkvO71iJF9J7OfX5fuyRhdIn4S
	 RPJqZ9keUEtSmGv3gTgM/tvqmlw2b3YKawgt5eGkREauiOTlllbV10vnu/lQMusO0u5qZ
	 +b5B4NyGvc5yUHKeKy0tS2gIVLVG6Y9f/mXPzCb4njThcVr4kTJ0cqdJT9689IV4Wm0Wr
	 xxWgiMXZInoRw5UZD09n5xoYOglADq6dSsVNCjzyfHhZt09XG43QXG1iFmnOAz6Jw2ClV
	 Z3znityyMNU3VKWf1bYZEefZX3Y/xT/OGzzijyuZL2x8X6EVI0ToqXtHKemOV1GmMAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629674;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7O78g7drrpQA9NJKlkHztJt8GYgTb6oyaZ2MZ53tc74=;
	b=13nXJRmllVjfdBqBlVNPD5nyaQq+8Yg4GGgoBp5wCVdifQJ/f+A+ssXEFIjCNC6C60OQ
	 7GvaAAc87VwNQGlZQORzGVOyEdgHnwURS3Y1H+Lvx895Z5wjz6ALrqKjiifAzFNzKy0vM
	 uOmQPhdgStjVm1qaWypFhaib808vGo7ksTUNAdR2RFvtpIBw/bH88dYvo5NZ7ZjGr6dor
	 IhfFA2qc1fvWS0HPERiiszyDUsL6gzTBTmFsFXdLM0pFSBWxyagg2PR/f1Kv3kx90ZdJx
	 nfJtLWgkXh+GHWjX2v0pV8SRhhYXfY6Efnu6+70vRbywV8ni4wl7taFdIM7RfHOU1rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZR8PHAVy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RQxuUbuq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A1D606F207
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 14:27:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7A1D606F207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZR8PHAVy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RQxuUbuq
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpRIN477106
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 14:27:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7O78g7drrpQA9NJKlkHztJt8GYgTb6oyaZ2MZ53tc74=; b=ZR8PHAVyDgsqVgY1
	AJ0KdeAERdFC8n6jm5aESl/nvRkNb4UismGJ1/QaF2jS61QVDci/f3rw0DlBr8vL
	Gx27VXo6ygscZf13LwXN9QteV+UKKRETx+IlRmEjAmCkgrOOv2d/N4535o9AnW+C
	Lree5tpHw9LWUOhfzpTPtdEbWo82Xjs/uKMxeNYEL+/kQSQpSQsxYcxnqZkitj72
	2rK6JJEXCx1kTifg0o5Cuy4i5UqhHKVn3gDslXpQmnroXKXISqyjLdUBM0zEg4Wt
	8LRaE7ADEriSdp0dLu2SXByspYK1bGuYUL0gnJbUngyOxtd2ZUXxCl0Hc8hdFOru
	LUgNLA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph19h5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 14:27:51 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-77f133855b9so100743137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 06:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793629671; x=1794234471; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7O78g7drrpQA9NJKlkHztJt8GYgTb6oyaZ2MZ53tc74=;
        b=RQxuUbuq1/DHLsRrpVazR92QWu+xyrmNUxI68PLOirBLWH/vU7fvbu9K/GWk/dPMZs
         rkEceJgXJG66Tfx26z/GP4xYFGeAbt2BXPZx+BaTbvMxXI6sAG6WEjVAWX5ObpZYaIcP
         FfGNat1azY/bCbZgl3eejZZSQBN/gUbv4uOEazjHz4GaA75V9xQkdKVpEtVtNfXu7SaO
         sXqxHW3y1hxu+ucfx/cY7216n9Ml6+40j86FC8yBAN8QKwaTyWhvgIhfg8zQBbZVoqVe
         CKzFZokMckQ0nzS6qpxrAreltWi2xuHMx79ffmuTbhap3fuA6neDZBseYwuLCxioRQ5q
         9/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629671; x=1794234471;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7O78g7drrpQA9NJKlkHztJt8GYgTb6oyaZ2MZ53tc74=;
        b=hFdPUcNxvgIh58wEfFNS4IUNNXRaEmL5SPDzNisEuWMLfX2YgaOvsIGp1Ck5URzM3E
         jf9YSC0GUaWKzPjQj8xC4ozvvLewaZDlZR+dlYa3Wq4uUWMyd+a53XFwjsO1y2YSSpze
         6jiOawWFHoG0FjlYukOQPBJB1a6C4SPIb2mkhUAnBPP1D7C2pnGegoXXAm43RRvWw3jF
         sz05loJwXsFpNBI3Y/V4osnaqYf7skwwOsbu4/ymkoGs/7xBjE+6j8Lxg0OY60PQBehr
         E/6rccAcIEqX1ekxLJZpHlSLH7s7LFJLhHmOoL/B8jeFoOPK3PKSKC/6Obqk4IS09Mpi
         A8qQ==
X-Forwarded-Encrypted: i=1; AKwUvBycS8UqrhVdyTbFg6+E58doaanveNjCkVjUpRAD1GVCvU5pALAgSYCYTT+sBEDKFg+NmRvEvt39W/McoOiU@vger.kernel.org
X-Gm-Message-State: APuU4Z8AeIXL3kNxTYLZeKJWk4l5e/P0JPX6fajCMcxdjIBI2WiVXj1X
	CZHgpDVvolfOycqzzmoZdEBuN86PdOTyJLJK9WWFl7Jpnum1ED5MzyciOHXGh+iQXkWX//Mq5ro
	H0xp+c24xvkVVH9H9+E7EojWrgOnF9RU9YVv+Hvo7CeSE6p3lmjLW2w4pExNOSt8eJ6Qk
X-Gm-Gg: AYBFou0zWkyPBD3MegfymnB8zBN03XnSF1jgMwbfGCfZNmuuUJH2b4btPbJXzZeo/Nt
	lnjR7XC0TxW6411Ux2z5/r1d1MrSG9+Gvz5kkd2/ABAO8pVnj+ICMbyzxFHooCgfOuAk6RrzLIs
	tYZ5T7v8rCm+OdI6uCdpbX+TZpTvSulDexSyqHpwyR2fRZgnLWTaWUMkRko/xjLcKMJi6NQtBPk
	nA7P2clEjlW6oK/aI7CfEBA9dH9IbE2R8GpUPMWpEZYwvFWHpRqMjK7POcOPBN72dyWH0tAXI1D
	HndC25z2P5l8KSLtGRVUH5y2TuUrqDftNyLZ5h2PKmF0VUQKUsJl7sota4Oj9A+KWz3p/WerSlU
	dZ4T7fZsSuwRhRY3F0RzKqwYMvVuROHc9f16jt8mMYNszkcMdJ57rdsoIOe/I5g7l1RvbIQeNGZ
	85Le3SQpGbYx5fwjTdPZ5ocgql+mrSVA==
X-Received: by 2002:a05:6122:5318:b0:5ea:9c73:eddb with SMTP id 71dfb90a1353d-5ec6858c115mr5084390e0c.2.1793629671103;
        Mon, 02 Nov 2026 06:27:51 -0800 (PST)
X-Received: by 2002:a05:6122:5318:b0:5ea:9c73:eddb with SMTP id 71dfb90a1353d-5ec6858c115mr5084377e0c.2.1793629670655;
        Mon, 02 Nov 2026 06:27:50 -0800 (PST)
Received: from ?IPV6:2a00:f44:e0:8d11:8079:3a24:c57d:745c? ([2a00:f44:e0:8d11:8079:3a24:c57d:745c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfdc20sm392186166b.19.2026.11.02.06.27.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 06:27:49 -0800 (PST)
Message-ID: <97c4555b-aa3d-44de-b5ae-9d11c708b530@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 15:27:48 +0100
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
Subject: Re: [PATCH v2 2/3] soc: qcom: smp2p: Fix out-of-bounds with incorrect
 DTB of too many outbound entries
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Chris Lew <chris.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
References: <20261102133531.173434-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20261102133531.173434-5-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102133531.173434-5-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RBj1VeaBHH9ijuYPGpWBwtSj_LHuCtEz
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae89de7 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=teR3AlUbzk4yVbe4HIgA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: RBj1VeaBHH9ijuYPGpWBwtSj_LHuCtEz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfX2zrVxWKHyjdT
 MDwjpifTqqPyFo7AUi8WQDtSxF3tP1cfNsXbLJMkarGWRicSTnPeUA45VD9Pxd98iBcv17ihAID
 VcFwgD5Vr8KoB8Idhjw7g5SsB6eEeuec6M6njp+oAFIETb+4qKWDMufsTX8MTptJGwn94Wg7vE7
 JKG9W+CfOyV1iNc9OpK+Yp9TAZQ4h27o8TcfbYPr2PhdtOSmYAKMF7ogvxvaNxqOGt5RjVRDL5P
 +cjpExaZSrDYbFfPhqsrF+7m2dj3YpfodszJOkDWWijuFw71+eBP5mttO0yVFaPE8zvFGFsEOY7
 qcJLaoYFZG3xQgkdT1SIHq3E4AnV3cmrBoOeVZwYi+cGA3AN3hIIg6qNUcohbcEnZAxTbMLQph1
 qB5w1QeC/YcfMEJtgOYKayoXtIMibfkJhzNtucwQbr/QGwxx0IHsJXP97Yz1VZJ5Ej8FP2rTfZN
 UvW3OQZcDrbyJiJgKTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfXxWbEG97/DPPX
 MkOUsHyE+QDHzrkKJlZZqgkP1xHCrQVi6HNgSDZtVGRRumvYN9Geo7OBZn3hOqWWDCoYFiPV6h6
 pJ/u7k05d3WR/FIWwra5bMOcRT+p2PU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020057

On 11/2/26 2:35 PM, Krzysztof Kozlowski wrote:
> The outbound SMEM item has a fixed array of SMP2P_MAX_ENTRY (16)
> entries, thus driver should be sure that DTB does not have more of
> these, otherwise such incorrect DTB would cause out-of-bounds writes.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-eaf9beb4-cc0d-4d8e-be28-4c12b039b3c8
> Fixes: 50e99641413e ("soc: qcom: smp2p: Qualcomm Shared Memory Point to Point")
> Cc: stable@vger.kernel.org
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
