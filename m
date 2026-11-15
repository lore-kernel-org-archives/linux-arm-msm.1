Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794725411;
	b=LXlDoeIHbV3542djJo5HU98FxR74JBGoQvgkV3i5uBluk2KOIoBkHbezqeZqCLh/3fuB
	 /dgBaWXtM+B9eBztYNT5WMAczXTfy0fCQd+xrTSvzngFgDF1h2j4aKPHS9UIKmU6jFeSz
	 imVLX/BdfjdPAj4fajB3Nby99A/5Zq+F3YaZ31YwhVJocoVOJoQTezNSuKOssHbAFQ434
	 J/jBUlJzkw02cOSe7Z1GSYjs+lSyD5LrJJuCYKGqNx4qSBtjIGY2/zdgCn76x0aToUGQN
	 b8mW9OE8/8oCqX39uirY8zomEQ7zCvD21sjiA/PPupBZHCuLjjsfWs43nj50yncIIig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794725411;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3R67sizKxdGIAtBE34WIZvdULNtMn96MLTYZQZLf4TU=;
	b=j8MWKgpdvLRW8Psyw6PvnsEH62aF0g81KjxOEeE3bWazMjaRCtHLIW4f+85+9hyaeP0k
	 WaQWTOxuMByByFRmavdpHqO32OJxbBL8ITtqQnPjsF9uiG1UDAVAl7fBmeKbeGJF5OADI
	 /s9Dd7V0oLcWhz95VLYgxSVnivOJPh1juL01gfBuOB6ZDCJ3pT5RxbybtiSLfREDLGPcP
	 EKQzDt+CN53kwaynABq7TjIkCxfiviqR6U37f8dBpyHX/gyLcGF0wH0K6m7Y++w+434NQ
	 hGrJG8pxGSX7M9K8qPEqA0/+J3ds+fVEitrlGY2ImG2BwBbqHL3CsSm6ojWj9mfp/4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e46aqNi+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZVCeNmEt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38DB606A33E
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 06:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B38DB606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e46aqNi+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZVCeNmEt
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF4S7U21715897
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 06:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3R67sizKxdGIAtBE34WIZvdULNtMn96MLTYZQZLf4TU=; b=e46aqNi+2m8qj2TI
	mP7W+9TWSufJ2gq2nnkmdklX5kA9OZkNI3GY5GPUO4UXJnLUtlexFO2s2qkxQPP5
	k3qyYg5J4hltqx4HN8r7lBGCfN2O9+2aSn6FCgzH84yCNZJ1N4CPpior9hNbSAlb
	IeTxVfDak6qnudDPm//6fAyos1oXzQUrJdeajC+wOVO8XNmVTpEX/2dJ1LEbQDRI
	ulEgpQ2y801Cplcy5BonEjQnHRKDNeTYuCQEuKtLfSPKWr5EeSQkJ8wok82EVCpM
	YR7o2p0ufoBQ9JRa7JYAnh4Qq3FQ0pI2chlh/15qWMEO9Ez4qjw0yWj2BJvkJzUH
	ZuFMDw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhjtjg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 06:50:07 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-378722fd4a3so2809158eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 22:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794725407; x=1795330207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3R67sizKxdGIAtBE34WIZvdULNtMn96MLTYZQZLf4TU=;
        b=ZVCeNmEt2quO6iOfqAJWXx62gfQTsa99PE5+B42FYFhZ+6IbnBq9swMhRfvQ9rYY+y
         jA83j1lUnSeIDmMLeW0tMftN/fba4Cb6kQ0g1bv1TTy01sBKiS9ByUC6MD6aU9VO9A82
         6AOkGCydVydaItfqqX6anmEISezd+2I7l3PtImVrCKJxFQJOUiHf+cJCI5lvmW8RgmA1
         Eyv/UhKZ6e44Uen6T+HxUO/LwqT2KRAvVtfEDAuvaHtgbXuiSqQUfyIsb9gVLI3N2omW
         3LbCiUMZaHbqWNLvvmLnZ8s9OhUWzGUlZO2URSY6m56NQVS/bdYRJ5Q4jeCQi7b9+sKb
         3Gbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794725407; x=1795330207;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3R67sizKxdGIAtBE34WIZvdULNtMn96MLTYZQZLf4TU=;
        b=h0yZqBFrxs9sJQjHFmbj45pbsckn9Bw+zMMJYw0DkoIARFayGCh/Dyi2Sap1X4ylWI
         u/PPUyUi1JLZ39YNL/C9S6UX+XxwDc4FQB3QL7RB/lvJS1TAP+q5CBQGCnyDNz+w3tIz
         QYtlYuA0wNEBck5j12aGOWMpgf2z7LbeatoMOfGXkFAsicu6WBh2AzbGKdqEnD+STmUZ
         94RTf409tPfsfv16uCVm6fPKAh4hEaAP7ejlhfy847wex48/FQLzuw4xD5rjDSCDXwlr
         yT4mDWhJjkz9HUd2d3baY3mgI8Ig3ookN3vP71LfhgsQdBXawh4NodaG8OqH/Bbz78I1
         7J4A==
X-Forwarded-Encrypted: i=1; AL+hErGFKZceybcDZL/N5X2UanCcqMTIGIT3w6+9n5F6gRSn5xLRP/6HK2sxmfdkO/MGg/xp0Sv2zTY7Fvro64iK@vger.kernel.org
X-Gm-Message-State: APuU4Z+hDBvKTqi8nY3eZEFy9k5ea46eCVfi4lVMuOuMW8Vs1jvWlz1s
	d0drtQA80Yqyy2zhxysjftW9vcjAY7yNvGTM0mOO1VhtGGBYwoWOU4mdBtmXPZEL0IUpT1aqhFN
	vJXTc4Tv8J9SwMOoNS81fKjBf1QnJBzQ7sU47HPpjz0HP7Yp6AI0+YoMUg1+tbx+5ITsC
X-Gm-Gg: AYBFou3KjK8YSDR14ZIlBSqXuCVCJYYUBfYFx+oLwEywZpmm2uBnDQN8ujj8Ctw+nm6
	s1xHuu6BcNWJo4aCoHIuUT80DIQrqoK9Zs8nUruZVUJexH+tIfirRzVVJpcIgCMCG1HxYDIDh/g
	G2A7BVd4vTQLtKRNt830Axk/Iuz7enD+spX/CaVEbTLMSIc+p4ecehd3P8NydKLy5ghMm2au2cT
	vqWzdVR73LK5Mpl7w/4y58aI8SthPsCpSWZEWJn9r0pDA0yLuVyj0bMlLbyGvecIwsJOvHmpr+m
	mOFkepdlFZyYw4GqSHDAobGIbqpEjERPxkBrRTEvlj9robuuLmLyQTTWH0O7zNkTVgLK4sT5ToX
	Ancp42SUrf1xDo3mI7ivnqcUP43POvaF8VhVzoCjMeiujkxkwS9+x5iQMqM4vKL9RcRREylzt3c
	sM
X-Received: by 2002:a05:7301:1285:b0:375:dc5b:4400 with SMTP id 5a478bee46e88-379633723abmr10149292eec.1.1794725407148;
        Sat, 14 Nov 2026 22:50:07 -0800 (PST)
X-Received: by 2002:a05:7301:1285:b0:375:dc5b:4400 with SMTP id 5a478bee46e88-379633723abmr10149264eec.1.1794725406608;
        Sat, 14 Nov 2026 22:50:06 -0800 (PST)
Received: from [192.168.1.14] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379558231eesm21907314eec.12.2026.11.14.22.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 22:50:06 -0800 (PST)
Message-ID: <a348ca35-eb03-423e-80f9-4a61a25439c9@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 12:19:58 +0530
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
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,glymur-camss: Drop port@3
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
 <20261113-glymur_camss-v2-1-b1b76509c744@oss.qualcomm.com>
 <CAFEp6-2Twta_X4nyQVBa72zj1uaeGiK=F4j2edZFJrXA3rmtFQ@mail.gmail.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <CAFEp6-2Twta_X4nyQVBa72zj1uaeGiK=F4j2edZFJrXA3rmtFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDAyNiBTYWx0ZWRfX5o+f3F1Pd12A
 7M6hNzGCtTbqETdY26nvYNL01IunSSluATjubE08HBzN71WHOIIUWSFuEYmIWtabMCE/vBoUIim
 kkQoMhFcLbhTDNIzVR3rBA7+BbmgmYGGz7rvU9fIbqfkRPjshr1WKp98K4jMk8FhIBZU6N9zXjE
 hiokf7FZ1SW3eNOHks611cjyPU6qmNs8Q3ipNXzd2uPvbEqYyI2HtE6jklv5Tacpb0fGGixykmo
 XZOEF8T7LJmdvHkQZA31HaX3dsGzx2yiFQZ7Im02btD0GHMI9ajkP+PYD4LFn9geSIMy16hJjuj
 Tslmvu24q8C4Y0Z2U55dpCfO3MKv4Byo5kvEeBZLGNCNzkNHLJKzMAmfjIX0jCuPPLu/AW4MC3/
 p74sTacKSToqGrmfFNlSw0BNd0HL86kkfGLrBrwsEQ7t27LJIZWaQp7pd+khSizZnF8qKGKP5+d
 pQ/zKDFolwLX9P9FpKA==
X-Proofpoint-ORIG-GUID: m3O18bzih6kt3W1dvfVMosLNVsGsOvZQ
X-Proofpoint-GUID: m3O18bzih6kt3W1dvfVMosLNVsGsOvZQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDAyNiBTYWx0ZWRfX5Dd2sz14Et7I
 4Io0ai/C4gn8k1qhvmHHE57/aZ/C6Bwyp7pqOtSdR4wptAO7y6SWKcuBj2ajQuI08k8oUBxtkTW
 wXUw3sgjCLT5IZZYIC8TqIR+n3+XD9A=
X-Authority-Analysis: v=2.4 cv=X9rHu2Te c=1 sm=1 tr=0 ts=6af95620 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=9TA2UkIA_kddnzGnNAoA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150026



On 13-11-2026 15:24, Loic Poulain wrote:
>> Limit the allowed ports to port@0 through port@2 and update the example
>> to use port@2 for the third CSI2 PHY connection.
> I know you put this in the cover letter but you should probably
> explain here why you think it's ok to break the backward
> compatibility.
> Even if the binding is recent and we don't have in-tree users yet, you
> may encounter pushback on this.

Sure, I will update the commit message as below next ver:

Glymur has only three CSI2 PHYs, so there is no port@3 in the CAMSS
binding. There are no in-tree users of the old port@3 example yet.

Limit the allowed ports to port@0 through port@2 and update the example
to use port@2 for the third CSI2 PHY connection.

-- 
Regards,
Nihal Kumar Gupta

