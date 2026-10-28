Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201115;
	b=bPHXveGayARBLkqBvpejoTpjyGPYKBd1nrZBr/Ikzcoqz7DUrBNgRsyyh+6udMky8SaH
	 EnR88mFJ2y+0HFwu0ZwNY3a0vdtOsDYvx5qjSGyRp1J3pCKLc26oOV5qRAfYSpYtKVY+c
	 V/nDpdeTBvU77dvvuMgCWjAnOy27GOna2e/baF7rSAdOsYb2c2pCKmkKum5wHJLR7M8kp
	 xrijt1I4KHm3oAFE38zNmtaXKKl+mxagCJUh2OVkq7Fcoyyi4YmkmhHfPkQgF8DbySFx3
	 07/nYM+vF7G2xSe7rTjdWSdkUbPmMrkiXAkisqQ2ouYM1m1K+zxYGEn1g6LkqbFE5/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201115;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WYDXrDV3B7esNKlNVgZYwMfud2hi1hHvN019zxOjdZ8=;
	b=mBViXwGvqg6zvqbt7mtxavd1/uDeG/8UEfSdW2+z2cpgHIvtpOniqM62IIk3pqq0cJKJ
	 e9aWNDXk4sdRbVrVnLnDhcQHz+7Ic8mqrFioR6eziR07qbi5sIO8t+qgkDetUMYyBDiL+
	 PznDFkcugfz9rYHKbFIxn59BjsiuGx23p0eDSPyEJ5BIVPqZlpZ/iclkbbOW3Vf7j8Zrm
	 ISWwQ+aZ+2LlFODbPnq754R//4r7Dr0G40IZEGKYrJa1owLxSNXWDRDqGDOVvCsW8Gsi5
	 lag8M17qZ4PNJPERxMUs+Ef492N4jOPFG2C+1B4XezXoW3iUVPyRXAfCLzENMtnItpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O7TMPUPh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=etXaAB90;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D50606A31F
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76D50606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O7TMPUPh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=etXaAB90
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAgda423537
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:25:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WYDXrDV3B7esNKlNVgZYwMfud2hi1hHvN019zxOjdZ8=; b=O7TMPUPhghvL6PoQ
	t4D+cqFyPHXysIIdMkLBOmQ3v7ybcrGH2VG2eN8mm6JasWCvZah5erx17n3ZN+gt
	0yI9FTlqR9dHFBejyU3j8UzEOp8rCpjIbIXdyABz3HDO1MDryIbvE06icVimf6Vf
	kU7jsPrmbZLgWZ9lJB9bJhkFy2mcm/xbFZbFU/04i86Hs4g+b20SsT99n8N/eGOd
	Lg4dqIxddKUSnFEp2xlUWYYIsfIJPp7eHBaQurwdvJmQpFDLBma29kBhByJFJIJ3
	5GH8f68SngkVz2yWfYLkRDl9NLJpE7WjBUNSxIFDoOMYDbAPS0v6rbkRcchodpDm
	3Sp6Lg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp1hmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:25:09 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eabddbb650so54304e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201109; x=1793805909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WYDXrDV3B7esNKlNVgZYwMfud2hi1hHvN019zxOjdZ8=;
        b=etXaAB90ihACA42E1Qpf7AbAOKN8S+s6r56wcP1MT12mSIHtpIguyoDSMXf7XN1EZJ
         FWL6LwcH602E0cJA0J01NY8GSG/weQ7nu1tdeTlkI9sXKx/AvNNfgnKlgaN2P3iiwIX7
         IjrvKReLnY+OvsXIpMbMTBI9R1cJXlVpxTkzMF2v2nC2BR4sloYR9fH6Kw1K+kXFH0kF
         wJxgX4rDdOlTB7/Sb+25/QtuuzjHm6fMQ2EBHAxgRYolKBah+PHrHGWvHYsX7Pr5C+ao
         cmpQpbD9DyDa4ggBGW1+aU3job3nARtkUNy3SgekBhHSQ+M1RW/zMSQcMfkCEJL1SAYW
         /cAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201109; x=1793805909;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WYDXrDV3B7esNKlNVgZYwMfud2hi1hHvN019zxOjdZ8=;
        b=qTNwYdOAvBSdv+zElOdOWAmNoJrMxN9P7jR8btovBhkFvS9+mu7Oi3JxzST7akVdW2
         520/ZFQjpDsgnO/q2E5FAvx58lg4xuMW+DOo3nd6E2xdQBAOO1GpLzLq3hDXUW8xssNP
         8/nSxYG/1jyRFcZiUfzRYnjuAaa8mXxzkcdjmfyv6s8xyPanUbaV5ZdDkRCF/TN3Z7Dp
         7IvXD69NU7fPnGghdegFKOmIBlnIIwWIh0Sg8semY2xXSxYdzKV5Hhu4W0rkpXI1N78m
         LPoK6Z2k/JlULdrbd2fHvwIH4LqzV/PloYBd3wdkeYKP1LRm9RgwayyGwSpuc2b5qg8l
         UJ9Q==
X-Forwarded-Encrypted: i=1; AKwUvBy8vn6ZqSUJUdsDmNcBW3zwSBUo9Qrr5v9RnedbaA8wWjfVWh7UYrdp+37MJgBDx92WgEFMNnaJE9mPFJ7G@vger.kernel.org
X-Gm-Message-State: AFq9FYJBOmKud2gc9CN4m3hut+Pw0TIgjPyi1uIL9Jkdgp2GayCyp0t3
	KHwYPKBCFldyoFx1hvPZaQoQcjF1Ox9Y6cjYRZf+MRGKKUk3OcmbmFvka8X3KePI0XzmmMJjEsP
	Nnj32lErslgKbIxAjer4EQ6/4i0ir/abt/RB0vUpN3eC0MxqfDuF3iHkmSMUTGrjPGKeQ
X-Gm-Gg: AYBFou0v//e6IC1MulEwsTe7egaIH+/502IeTM8pah+lRcz+vpLNB30hOjh3S4OPy8q
	xX0GjB40Q/Tpln6vErA0rLfLfA2SSdSlrRMkLZ+n1G71xXqeg5QZdtdOvojc2Uf2p3wtlRAVs4w
	aCQA08a7REKQxay3hwbBR+GrEZpdqD3MvJpxeaUUyhnC5xeJhbp5bqEPqGoOQyZ4rksagY4C1La
	nHCYPDwAw1DVD4pfFeqMtp9P9uTleZV5zhuqcYZ1GPFppGNIW7U1f2XvAfjPXe3CcKjKhws5bMm
	9tzAhnaYW4rrpUEaoBpi9CuihJ6ZrZ8L6UDCccdywCv8W3jSbzHaMGJ3ytPvzZN+ScEu0wCjtkq
	H6ZrBTbDUrRXgMqusR2YeGdFF6Odf28UoRAJRIbwOuT9SUWyEE913u5MADPmMvTGVcrusCf0=
X-Received: by 2002:a05:6123:5c4:10b0:5ea:e196:2742 with SMTP id 71dfb90a1353d-5ec4cc86667mr1380781e0c.4.1793201108721;
        Wed, 28 Oct 2026 08:25:08 -0700 (PDT)
X-Received: by 2002:a05:6123:5c4:10b0:5ea:e196:2742 with SMTP id 71dfb90a1353d-5ec4cc86667mr1380726e0c.4.1793201108264;
        Wed, 28 Oct 2026 08:25:08 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4992141068sm401541766b.60.2026.10.28.08.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 08:25:07 -0700 (PDT)
Message-ID: <2feeee07-b691-4c06-94a4-f9b6d9fccc2f@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 16:25:04 +0100
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
Subject: Re: phy: qcom: qmp-combo: Glymur USB Gen2 fails on one port (chip rev
 2.0)
To: Burke Cates <burke.cates@gmail.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <5b31ea48-7918-4f0b-b012-6915b384b922@gmail.com>
 <76e97352-3a54-40de-8ef0-eef0ca27ca73@oss.qualcomm.com>
 <830ef909-d0d9-4f4f-8b73-0fc0cb7b46eb@gmail.com>
 <80fad9c9-4a90-447e-96cb-b1fb0ed98a36@oss.qualcomm.com>
 <a59c982d-67f2-4e86-a110-ac7c1e0f1a6f@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a59c982d-67f2-4e86-a110-ac7c1e0f1a6f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UCzqCcj7gPS0YB3PVqWAfQ43i1EWC3om
X-Proofpoint-ORIG-GUID: UCzqCcj7gPS0YB3PVqWAfQ43i1EWC3om
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae213d5 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=f9guqRr10KZ0PglIEQoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX95lSIKynVwpu
 Fqh4PcrgwA0nU1FlsQBKQJZHEjCm15FGPxhNfyCSBcZyVt9LeEyFo3BfKk79oJt4Z4O4cu20oy/
 AD60dfsWdWb5dwM5IHiUd9yvo3hyFcPkxICv43X+7sMtD0D+xwLEVpA5VdUOGo/hW8y0vS3i6RB
 sObkeDAn1CSuhD8oG14FbL1UO8n+gz63pgNOTZ0DbVQcnKeDXZl0rg54ThMujYjUPEIErrZQQFP
 rxE1A/ZFPYAO13C7+fOS//JrElr00EfdvRvzBkh0KubdiBT6HtjHaXOCSpTWvnRrxC/hbrLgHtu
 c1N1jn5k/lVPLOHg6NTsD4GD1K3AGHD3LA+71Y4fD3mEfzkC+VTNqveqoXzrmV6upZCFd0n9YsJ
 WcreZfPGANXJfNKok/GiUgnRSBdvfCzIZm1lXh11RiITZp4Ad0kLWgTBpYnNCcVO8TbfKnkhsul
 C6J74+ao+cvlkqiGgtQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX1ErD4RAt9U2c
 QKpg8SF1DABpE1DvCBz4Xnp3JoQrzAjpV7X6SfocHLNxWSx3mRsS1Kt4J2gtukKGxrDmWWYVtiM
 avXte6o0vwz7NQU0zItmZE9iuKxrrQ0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280061

On 10/28/26 4:23 PM, Burke Cates wrote:
> On 28/10/2026 05:22, Konrad Dybcio wrote:
>> Is this something you've also seen with your local changes?
> 
> yes, but only one data point. I'll roll back to to that later and collect some more data. Anything you want to see?

No, I just wanted to confirm that the patch I suggested fixes
it "at least equally as good" as your local change, which I
assume is a "yes"

Konrad
