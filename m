Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792475574;
	b=bxcBaE8rNhphbvBKphhEKu7db0R4hveHG5p1qj+iyN3chcDu3JgXWFDx1NN9mUhtmXj7
	 raqN62IslDJ2BSLRsRtsI1IlUJ1KHYINeVdxiUnSNLAfCr2w0eBGRL+I0Jf2SHHsfntuw
	 IXbjAH5eW9HHfThE+Bmf1i9US2c7An+yTCH0r8omNx663puJJjufyMfBT17742ZQ004fQ
	 vrtVY8uTVwx9+IVyd0dfI0ZgCSLT4l1DWSegaEbyoUObsqspkMbD8/TkQnXhRkO5CK303
	 MEMKvlvtqIPJxIB5ifKAQ+jFFxeZUaKC1ljAr8AqzOPA5RwXuKnjoovIU1HguYfY7og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792475574;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RN3wmZAM7GFWTpaZKW6y51wUf6lXSD82i4H184b/1FU=;
	b=4DHb4p/OcpvizrMKT3dhyo5u+UF0Wqh5rnTPwZzz3PJx3tax9VuuNOrGCW1ujALeL9lN
	 s5BRwY78xl2l6WLMCOSUfGu3gm+C5+EheSThO2+6GA6Y7WiCtqDJMWHByzT5/GHUKY930
	 jtjMRQ7r28VNX6IJZSdplrYCVHp21aJn0gcIit8mf+cIrw/szjyGzQGp95X9zOo3lSPf5
	 /iQZFwL5ZMXCd/gR1qC2E/Jp42eFqvpOo+5B6YVgThofCO9un9TPLDWcYmkfeEuzQse1U
	 ELuo+uwZ8ydMWtqsSTyUeKEjrJWqmCpuivk8LcOKgrr1pE6sQFF5ryBopR+fiE6EKjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P93bWUie;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Aqi9lt12;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854BE606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 05:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 854BE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P93bWUie;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Aqi9lt12
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K4XbGg1175920
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 05:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RN3wmZAM7GFWTpaZKW6y51wUf6lXSD82i4H184b/1FU=; b=P93bWUieowygmN7l
	UjmKOil+5SZeXhIw1dYC+/jGPIFaWv8szg213Dsvhax7WMGMFhe0Jp63y7xfEvJ3
	oIVkWSH7+CPiVQelteFqAkcc+bkDvsipf/dcNgWvluNiOwnEf8Uqv1DboWnlhq5T
	2yDdGkxEgRqSIMTjE7Dn6qfHvA7EfMADYXvkjhDTmuCIn4X3kX/bU8AMto0LnYb/
	i1Pz8fgSVvEImcJ19/g5NAOtAjCKx7lJV2Hr7OVr5+YSZfqwrVcYIiqg3sSoh7CJ
	e3H/FHj4wEneKXD9OkdOuqpsFslM7oizWb7xTxAwv8wjuTe0ykC+hqrlBXAaRUT1
	2hbSig==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ph3p0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 05:52:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e58614290so43126685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 22:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792475572; x=1793080372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RN3wmZAM7GFWTpaZKW6y51wUf6lXSD82i4H184b/1FU=;
        b=Aqi9lt12y4gp/rEpac2SQF4TCikAzOMqYXwy4ORyqp9efWtkEt5x4mHzfVBa2b21zN
         O1TANR8zWT0sLUZYGlu0jav7SgMvAaRXaIOoa9lCP+aH9H1CuPd78DQqQDDeEJ4wERly
         eLaWLE3agyqLd5JV+GzhPx+TPQp8ANoiOkotCnM/asCoj+983SoVobh9tDIL5m7ijRw8
         CKucKtI91h7H8NbeOJzysgIPc6OHGExnFCqGgU3eud16Dk+wCBhCGF8wNSBQnj8hxP/m
         XWMEhQA+SZfgztEN5q/tyoiABCmnUqyrAao/gtgyFmvFIm9PC/AaemTv8ib6oFmqpIhY
         HWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792475572; x=1793080372;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RN3wmZAM7GFWTpaZKW6y51wUf6lXSD82i4H184b/1FU=;
        b=OGfD+vEP/Cw55aOv6AU57ddUMaA5EeLez4f2xLuLfqGK2TM1kB93n63qTMO8cQMeBw
         D8P2+yATTmxy0MHt3UtuOQws0St8EmGo3xcmzyak32ivNeWye3IEqrPZQofcI4lBy8OZ
         9QQ98hlOUdKCRCQpRML2oEMlXqXeio1wo4SAKo/0FNpMarXcxWpdBJTkWd0jb1uw0NmX
         GBS+rYf3dfUxZY7inkb5pg/GbcVCFLA4onkchSJTmPbcj3PEeXAACLzBtFzIJMTXJpUP
         tm/xKkfDw71y3FjqM45B9icuQtnQqciXNnDIqZ6U2sNyxEYEkeldM9mLJyGgTLkt9P9m
         cG1g==
X-Gm-Message-State: AFq9FYJrpfr6RZG9LpIFtLyo012+mfNLpBVUaXd4rHGIvx9mr9mj0L8Y
	N6NyV8dbBH8VBwKvWa8LeelsTCDt9n3mWUij1zvz5DDjKft5qsUzmjuwHy2gToYFo1pue1U3Kx2
	qX4DFdwmeZbo6lTyF89f4ZxpZMrogrg9EFcjEXnMzN0N3lIyRfz5kgOZP4kudz1Uyp2Dx
X-Gm-Gg: AYBFou2Ex+nQ62QEKeoNnJekKb0TChYVud03i9XxnDaGM/hoqZ3HIMpeJSMLgimP+Pe
	caybvTxrRbhhgIUkuDz90p8u1x6/ABz2OeQLlcDGfH3XV6JcJ7eT60OS3coOZc8mwSodZwCL14a
	jO5IivxzgerpsId2mrnHFLef5yWEHGkp6UbvD6r70c5sYfSFydju+Fo3xsIV1gEiRwuVL699a7k
	OovbMqtI1lk9kwJoepe6/31NoDXdnah0jdyyw+flv5DtnnQh8ozDU6Mln0fjEaU1vtFBmmd2mW0
	GEkY6OtJ95Ipqfbsa3R60XaH2+36A1YBxCKJ1eiZ+xpVI8BSzhQEopxxNE4xvSZ4qJzGU8NoWHT
	b/DQWSp3lCQlfgJrVOcXV0Q==
X-Received: by 2002:a05:620a:6410:b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f29c4bde6mr1838302985a.2.1792475571869;
        Mon, 19 Oct 2026 22:52:51 -0700 (PDT)
X-Received: by 2002:a05:620a:6410:b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f29c4bde6mr1838299885a.2.1792475571373;
        Mon, 19 Oct 2026 22:52:51 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1ea1ddsm4705947a12.34.2026.10.19.22.52.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 22:52:49 -0700 (PDT)
Message-ID: <be1e1980-061e-45dd-8b33-a70709e76677@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 07:52:45 +0200
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
Subject: Re: [PATCH 1/3] soc: qcom: spm: fix the SDM660 silver L2 AVS control
 value
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ilia Lin <ilialin@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rt-devel@lists.linux.dev
References: <20261019-fix-qcom-saw-v1-0-9c7ba3fc2493@oss.qualcomm.com>
 <20261019-fix-qcom-saw-v1-1-9c7ba3fc2493@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-fix-qcom-saw-v1-1-9c7ba3fc2493@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad701b4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=FhHAzHn85Cby55PZOKIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: WkKQlC9y1xGeQs9VptcMIDTqaayn_IYG
X-Proofpoint-GUID: WkKQlC9y1xGeQs9VptcMIDTqaayn_IYG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyMyBTYWx0ZWRfX2PLSbmMbCdJJ
 BU4b4ltwnmuiuML8ioZ5LcFU8s6CoG/9IahTnJYdIJoeO5385tVD96yUNtBCdtYDWDw3B0/zss4
 xoy3HKFEmN2LJO/4LIkNYHSLW7v7blIFrJ9BEU4GZrVQDRAngzWXPLUKbDjfLR+jPD/BkSZNHXu
 nOsYIs4Y1bVTwF3I9jf9w1hETl+VD3fD/GeeDddO22iQ8/rEoow66c89ZqPTlTB+jfkkIrWgLhQ
 UmwRSe/TQ2xlJ9Doe0RcFb5V/7Y6Plz4UagyP5TK5L0nKhABM2VzMYAsmYHI/N8onVuqq3yyBpF
 3QomaOmm3wdWQTVJyMbootInhrUKfAmVFK4EGiTfzMm9Vspx1ExvOre6zcN/tdFcAP9WDjyA0f1
 LJ7XV67g5ewkyRZA4YZRpZN1IQaKT0S6O+C5qOT0KJDWk2j54XMBaF+QXpqhLgroA0YLenPERLM
 9b+qETz7gX6Sqbu7Xig==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyMyBTYWx0ZWRfXypIWPfPN3C8f
 pO9jzv29ZR544hvlX2L71dXoH+3m/kVdL33VUhY3HqGsG0V7JqyYJJ4/omVN6t638RSg32f2lgn
 RJKQgIvVMzvH2NkLyuaviiUO4R2FS+8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200023

On 10/19/26 4:39 PM, Dmitry Baryshkov wrote:
> The power cluster L2 SAW of SDM660 is programmed with an AVS control
> value that differs from the one the vendor kernel uses for this SAW
> (0x1010031), so the AVS hardware runs with the wrong configuration.
> 
> Use the vendor value.
> 
> Fixes: 13e72c3e2261 ("soc: qcom: spm: Implement support for SAWv4.1, SDM630/660 L2 AVS")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
