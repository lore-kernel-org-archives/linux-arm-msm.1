Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619162;
	b=Vu11VFP46LD5q4zLrIu8Wmwv4f/H7CZpbbAQZKnFMPw4/Ej76gTkvSVaM/R7wIZcKf/9
	 w+GqWmcsy61edHel4XBNykiCLEuD2uzsBmTPCvgFNFlc9yuennOgZT1QrJchjytOuPTx9
	 vzdnwnujk4AMZLnRuq1b+1CxQ4IeX56WyQw/VyTH/CV22tYFw5pq41GWK1oq+BtRV24gX
	 JTi2cvoVXG/8putEVyWUe41u2NbB2JVKgrK3SK42t+rHpwBOBVOdY0Jr6TewvgvfICzy9
	 ufxlIhb4odcgooe5QnXKGMkAtBK7yp6fjbczpe3opeBy5TxDXxt9QN7SrirrCVV3cwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619162;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WfN2zl6N/U5Eh5uhKHe71C3cBewA9U9lpLVxicyxkzE=;
	b=KnDZizF83IGV1iF1q/VA0bcifYEzooCDvSCpmbrF+hfuUug03boIaVllV77JRyuqqvOM
	 m8h+tkV5rEtKjj5OkbFWwWKJxXrokAfFtxkv8DUKPbOaQ8JvV+X0HmYULjGj3t2Do+YE3
	 ie0mSPVgtND0r+eBTjH2RZIBIGMLmBAWb6OFaXVvYGGlXQrKN2p6xJkm5H3CP4coa7waP
	 y70ZrM/ERckH0j6r6McdXeAcaoEsJxNWILGTZwqXah/bA9ktvU+cJ4cYuAx0vZGBUUKpm
	 JI+FV1/EfS5y+TQeap/5idviCVxqn9AZrBA31heb6kPKWrowVtx6+qSIY2nMxeJ2koA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O3Y8ZWrt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bqHYuu5t;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296CF606A332
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 11:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 296CF606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O3Y8ZWrt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bqHYuu5t
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A17K3430365
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 11:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WfN2zl6N/U5Eh5uhKHe71C3cBewA9U9lpLVxicyxkzE=; b=O3Y8ZWrtZtSS2V5W
	LYyq3iyKF3Jleek/N8UVXIrjoUBfCLs0yUSiB1ehJratC3aKbH6N3I17XXhirxvU
	lFC0rK3OdQh26C+ixDNkIJnl7/LfAd06olQdlZSbeOh+rwnQjgY91hZmyPh1Zn+j
	OpoJBwkelvrKZnIoXsGCEwGwQiJgCKD62pM0liyYipZqWO22PZHVmqJ9vvzrebg/
	DhkYUsohJ06d+tPAxKqG2lPKLDzLTXYXn4Zb0ni6s5Fvt/tC4WDon+pjj7ionC39
	V/GYFVxRkspomB85S9gCsj0MaJAn1DT1GrPpKoAcyWeZEZT+QyBYSs21j9Yw+Xkj
	y5aW0g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmes2ge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 11:32:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2bdebfc5so54587185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 03:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793619160; x=1794223960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WfN2zl6N/U5Eh5uhKHe71C3cBewA9U9lpLVxicyxkzE=;
        b=bqHYuu5tuzYqzMcQJnCM4pl/piQRQTfaHxO2ZIcYjVzxIGzIVUyg2WJ0o6jGx/mmLK
         6xKXklcZljwghhKpfgJMA3BSmjOVjSWJEb0vhbhhlZykX5Sf3Fl1mU8NAY0yAdfItehA
         0m3cfTuuYV4I1nRpV1abVyAm1aKHhtrjgTI6XFxMhESq2KvORmKC9qEquAiK3tETEsN3
         NY48acuvS+cKJlMnxSHtKUwMTFjPYjCjWGtyteNRhKDqFQT8CVzZt/aXdIchYGeVuBAW
         RtG3IMkDfbN54p8H+rnXSklxhz11AW64ktJSnevAXtNHNGgH35yO/2XBGUO2S9prMm4b
         42Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793619160; x=1794223960;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WfN2zl6N/U5Eh5uhKHe71C3cBewA9U9lpLVxicyxkzE=;
        b=az6IhWZ2XZEc2SglEktmy9i8tktvtsmCJPhucss9ii3yXXPuoXgA9gkDCVh+/oZ5ps
         9geyGLWnLoAhZXoRLgPR5DIHqiSbYNkDefS40f2SPAWrrb6S8v1k3bSVB8nu1PSylf4c
         z/NNERUEJoM/BivcXxaXSpg13+VuC3Z2/WFGMu3tLsC43CoaMtHoPnDUGMA+XMd0j0hV
         fj7goSDrO/qXpjvbOXbNj/Gm2FP/L3ORHlSQTLd5hszViI12zXAH5+JwvmIzpqPGAfpF
         UNXI6PSnSwUejQJoJL0qAostZf7vu7692vj3jh/ZVon+9OJgRgd8mfnMvZjMXKuQmsPo
         e5fg==
X-Gm-Message-State: AFq9FYIuUIzmTefMNcCpQKQjIzf449MAHp2a/JoXXcvS9IjZkRR13rB/
	ekIflsdZY7mU+y6IPJyn9j87Qm6Eq/IYeVa2J4dY6QRpRxIsT1pG/fec5djMBptv5yAGMDvuFVB
	NwnhAlxJ9ZWT9h9RclM7QxkrPParIvpefQn5kf/pV1mAwUZWK/aLga8cWjEEoYp8bOMS+
X-Gm-Gg: AYBFou3kIbUnH+yaNkMDALIXrpgRuuLPj8CM+cvFC/zc1FBvWj5uV5PzQIyOksgG/nW
	3p5CiDQpTs33Es5v8FoWrI16fKSBz3zmiEwZLpA/iSHFCIWV3PLK15iG8n4BNNmEBU2J7EJrAqe
	hnWfRKPlyNDhpUIS3XlrRQst/p0+o0NOr0t6MIPjm8j54BjHpsRSbHykxaQ/fHrfFWsBI323ENh
	Xd7XcMnvrVG1Qn517xBakiYTqRgnffUyEe/lmfh3losvCiKiY3ZRzWfElJhJQzwFL0kMlNMB1pe
	ruLYfzR1ggdYSIGWeglBs8d5DA4EQBmMMxFN22KgLRr6QjedJ598BeGpVsldb3PlVlvVISsZSDj
	atZSO5VPzexSh6qo3+9E5BjnFa9W+8kZyUqCu7zV4nCwyo3no/r6Ui/7HpsOZOjaTX4rJWq4=
X-Received: by 2002:a05:620a:a40c:20b0:93f:25c7:a4e7 with SMTP id af79cd13be357-9442180ad33mr1570944985a.4.1793619160434;
        Mon, 02 Nov 2026 03:32:40 -0800 (PST)
X-Received: by 2002:a05:620a:a40c:20b0:93f:25c7:a4e7 with SMTP id af79cd13be357-9442180ad33mr1570940285a.4.1793619159969;
        Mon, 02 Nov 2026 03:32:39 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabf0d1aasm364431766b.79.2026.11.02.03.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:32:39 -0800 (PST)
Message-ID: <4f5b64de-8037-4a64-9729-3f0a3881cc40@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:32:35 +0100
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
Subject: Re: [PATCH v2 1/8] drm/msm/adreno: Fix invalid drvdata typecast in
 adreno_remove()
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akisaira <akisaira@outlook.com>,
        Vladyslav Tymoshchuk <tvlad744@gmail.com>,
        Val Packett <val@packett.cool>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261030-gmu-sync-state-fix-v2-0-89d3082d97af@oss.qualcomm.com>
 <20261030-gmu-sync-state-fix-v2-1-89d3082d97af@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-gmu-sync-state-fix-v2-1-89d3082d97af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae874d9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=67Tr9d3efp1zOqggaLoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NSBTYWx0ZWRfXy102+VjrodWB
 8O6cGMuulXiZ3oManeM6xR7FavVYlbKflm21bBtkqJ3DOMpx+albz2DTXO9RHJZZxNqVwA1JJyy
 bpXh0pFQQZqR4EiqB4RN9p8FAw9r7ThKSsU5djOZpaD7Qp8bAOw86oIXhJSA1uuNIKOmoFPwx8s
 jAaB7CuHJOnq3bnH9TSzpl6J8xwdiJb0rX1LYEGbQ7JoVLesebqidawqp56OC2ARlztUEZDKFXS
 eBLpPO/O9P5J4wBWEjQRHWsg9boi1i1SBUTA+lGcG9XW96HFSmEWfFpc9uaAyFHTSMlqFUR62+Z
 jiZD9asPfRLWI+PU85ZYgKz6D7rXlSKNIVDa098kh1jkzdxWmqDIQ4KXEaFBB8phwT59kKZDMET
 KociMxC+WzixZ2rQ2L6j5U11HkPXnZ/qOCInhYhTVdwPdw+5A4lSlPWc7kvSzd550f1MWfWQ+Gr
 bmnJRLNmY4r/B2Ec46g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NSBTYWx0ZWRfX5HTsvdEA7tjk
 I0zZSPV9+3xDz0kdhEck9LPK0xKQtoe7GHJL4L8mG5FP+pnNoINGUcJ72FqLHPt4VyA5Ze6/yPO
 3Wig/1BFvVV47PImBmmD2Izo8amW+Ms=
X-Proofpoint-ORIG-GUID: EAF5tf93jj8aDwYkVDC8iHCbMgqXmnoO
X-Proofpoint-GUID: EAF5tf93jj8aDwYkVDC8iHCbMgqXmnoO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020045

On 10/30/26 6:09 PM, Akhil P Oommen wrote:
> adreno_remove() decides between component_del() and msm_gpu_remove()
> based on platform_get_drvdata(pdev), interpreted as a struct
> msm_drm_private *. That dereference is wrong because msm_gpu_init()
> overwrites the GPU pdev's drvdata with adreno_smmu_priv pointer.
> Use an alternate check similar to adreno_probe() that avoids this.
> 
> Fixes: 643515a9cd09 ("drm/msm: rework binding of Imageon GPUs")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
