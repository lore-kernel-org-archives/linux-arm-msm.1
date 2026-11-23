Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413132;
	b=aajbiJgeE8CMwzvMoXCKELlnqTHE8/8ZjvKwuACPmB5B8EA+nXzYk0rxYGetcu+4Gzds
	 Z8upmifPXvo+PHQn04BARg9FjX4TSYHhYtdJeC3bQGo+j9KgTlYHiM+EuRI41t3DiD2nr
	 9pRf/3YySBlNWBsLTrIfMePCqMJohBxkjNyax7YdZTtlHSA4nMzN1XrDjJfVh76BjW5lM
	 /ivtyJ1lCt2Z0dZ2eyl3idaTkns7TvWOYuwfKzmv0Tcc9MfXf7eGjhZCbWVSq00jRHqiX
	 l0M75kGzjwolCtEZtvVs3Qhoin5HH/ceIsRvqz7L648q/GnvyuT5Jc19W6lpsXeB7Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413132;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9hm43OtswkK288yIc7y7a6niTTQ/DMHsEoXPRykDlWk=;
	b=G8Pnv3kf926S1Ag5HO8wT9OMINtiOc8J9AwOstZB0rZmJtLH9OH2hU4nOMIh5RHcXKDb
	 p2BCmj+H28HZsTqPcOglj3AaEr13XrppEMOnIik4U4Jcaj2pzTppx9D/E2Q54k2LDAxWQ
	 8SxgJS1GnKL0ota5YiWcgU5FAuoWUTtkrmcsOs2B/finlgCzwd3rvpOlio2TtoAIt0HGW
	 fuZdh5pfBlkVs94u0PbeE2c7s0pYNhDSZwPYTSraPPzcKwLh1XCkv0xLZNENqNQ5HF7fm
	 3MQaMtRJADrjutrxnfg/vN+k+9kJFIXUQzgPu0oBh9GNweyfaaQulu5c50gP9t900FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CGSEUnFN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fvyUHcWB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0963606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 05:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0963606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CGSEUnFN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fvyUHcWB
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN50qWv1264083
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 05:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9hm43OtswkK288yIc7y7a6niTTQ/DMHsEoXPRykDlWk=; b=CGSEUnFN6ASWTf9j
	nhtenKl5ijDt/bsnl8gO1DErbLN89LpxWx0xpUGioyMcAoOcdwiP8eeS+cUMUvbF
	xoaBzXrV/Ux4+MMITjae8hZo+DMTbj2qqg5fjCjzq2Lmh56wpch83Uusv3k8Z0AH
	NkJ3Tfo79Z9e0lzOoeHcoHdQKotkJdllFnNVrto9hEVS7zwgzx/0VyWq5UOOauy2
	ntZeB0a9EaOLevFYlBUDnzxVxQV/MiqWSCjozV9jzl+jKs2al5lsnSVDPsPB/6Y/
	Goc1OU1edWcwxlCCneCyEY5556Xvih3YruPtARxuWQZLZMxde6TRUNeq8SY+8PfY
	ZX5Y9g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33h35bq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 05:52:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f022026e60so31878065ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 21:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795413130; x=1796017930; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9hm43OtswkK288yIc7y7a6niTTQ/DMHsEoXPRykDlWk=;
        b=fvyUHcWB/hIXRmwdDlGYN4BcvmODhXyg3xGKSanJvSbfZPhS02HtvMXVsHWX5RX4w5
         ggSwoJlvKsiWm37eHD9W/uTIDQWKKdpEM3w4x8ZY2nZ1cfD3yKvTqiiy2nBlOeoodguM
         l/D9L9Dc+LFQ3M9RMI/uVIVQFagHvigTi6W/PQYTbWhIgAWLotQ/TAYZMx03fMwHrMbu
         W12md+ybsoKAulHq80Sqd4q/jNKkv/X+UHkSYGuJALwXU04ivJDPcvbDZiLcs9qnL3iL
         QX9tj2Wk79QEBIFtQQgeugsp+SkTF5hlhixMSbEvvHQqhFi/YX+13D9FtgyIZlGRdrSW
         BpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413130; x=1796017930;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9hm43OtswkK288yIc7y7a6niTTQ/DMHsEoXPRykDlWk=;
        b=bhc/jdG+6NFNwqnbsOB6vzQnbTakcH0Lkh3Rhf9Y3mx3Sk/Aycaw7hvKtYgNmBFDNR
         /h3gLsjX0E15UFvRwkJcnnG2W5OR7p+76sG48jUGGLJ7OL56sxj0Gm5ge23pnYWkQ1wo
         +Fnqtb9RJVbJ8OCRyb17UZd1tPMKeleq/86jt9WHnDzC/t7y/E34uE0Ts6SGachXuTxb
         NCF54m6mQjmLLudxGoIhN8KQ2Uo/Gvhu85tg09ym8ulA/unTOrH5/XN2HkUdYVbsA2G2
         H4MyOjkNwl8TPSGEmfcZD8Zp2cU3Q/4jClnKHgYnLciJ2ED+wBAzVVuWkOkHOJBUfmUt
         I1Mg==
X-Forwarded-Encrypted: i=1; AL+hErEKZpTtdJtX82OmqibLXg7xFluU3LkNkiVEpZqF/d0wUd+B3+WExPnygvKU1FAmgugivj6jh6pbGOlz4bHT@vger.kernel.org
X-Gm-Message-State: APuU4Z97rFmD1yYS7UdBTFfXRTiXfEXpy0aEFype9BbZew3XSVqdE3WN
	WdRNeJbtloMQbyn7ZNFrVKfMNK29giXrkXtzECL++v7zdDUA7YOaNFMbHAaB6XCCt5J9IezyxkF
	TY7KGyWvnz5I8CSyWLrZb7N8WZEbdKlwfusrGAKAcwE5nrcymqDiJSOQkzYmhs1NQ/URD
X-Gm-Gg: AZFdTZdHSCdai+g8Wr0ttJKRsUNdYjapyHy3MJgesILXXKfgkYO9ogIlZGp+vB8TYP5
	sTA4hSd/4NN3qlERVX8ifU1vcnYtP2S/GHVUUAzM6dJeu4FX9Znwhw16wqF6hHCUN48YaHZJYTI
	dBnPh6StCA72L+VV04tsqu0HYtWCG94rnlBSvR52ipXlUmU7wT/fy0Gop7BCPaT4gS+lYscbj/3
	esIjU47b+5aXylJR/cIQhq9y874cx8fzG/GfMsx1elWoo5/nl+hBrdZGjXlDYS1AmSQ9pfsq+iW
	bGg4A8FQR2eSwzwhgAdhWqRT9RiJBwv2ev9KUz9eAa+1xHmLtTS/JWkgf6VHsjsBV630VE8oXD/
	wMIq2ZrqfUGSCQKzj2rhhzFVQ0lsN/lCP92cCX+PPaIZVXj6bjf1M+3CM7wZcCeBWGc5X5+ZJfk
	klkw==
X-Received: by 2002:a17:902:db01:b0:2e9:57bb:72df with SMTP id d9443c01a7336-2f031fc3478mr91827535ad.28.1795413130485;
        Sun, 22 Nov 2026 21:52:10 -0800 (PST)
X-Received: by 2002:a17:902:db01:b0:2e9:57bb:72df with SMTP id d9443c01a7336-2f031fc3478mr91827355ad.28.1795413129945;
        Sun, 22 Nov 2026 21:52:09 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1a69sm45065075ad.18.2026.11.22.21.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 21:52:09 -0800 (PST)
Message-ID: <0c289a75-8625-4b9c-81ce-7714ce9eccc9@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:22:04 +0530
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
Subject: Re: [PATCH v3 1/2] dt-bindings: media: qcom,glymur-camss: Use linear
 CSI ports
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
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
References: <20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com>
 <20261119-glymur_camss-v3-1-71ab966c41c9@oss.qualcomm.com>
 <20261122-jumping-slim-wolf-aa3e9f@quoll>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20261122-jumping-slim-wolf-aa3e9f@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EsxHPicA c=1 sm=1 tr=0 ts=6b03d48b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=ceModZNawzzamKazbfEA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: ebZkgb5LPf9LfoLlrUR9DPJbwp7SDP6B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfX5Wd5Bf1+qtX+
 /P0qWo4BjZ7z4wROUB2sUrspZhXObKxUuSORSJYGKfuyXrMCE3oJVeTuC6q1kQVplqwvb/GhQDD
 ZhsTHj3MA2hKN6ULV+MR3xT/ztaneLqCPXG64sGK4tAes1BT/vfjVnDwuuXXHrxWTDsbNScn4HT
 y9gfSVPaJ9trxTwu7DT8n2yOSyEU//GjEvFpQ91MTsRjRd65nAVDB7E9YCNCUZKU1STtZGxxBfp
 z94TF7vHh+dMYXU+4RSD8cqQn1mUYpdl8QgkqeHMK8DwyqnLfOEd9h7bg+cBYXPotgaEgAi9D7q
 fHcWohPwfN+8l1UmHXCZIWkO4xAO3nLbSxMDWqz12HHem3pOVMDTE02helOqBriQn7Lqls51aoP
 0l+iIS3+RWK0cpQSMbKi2RJQixVAdpiSk433E9wHsyCWUZqHyOwZDPbnTvJy80e+zCcO4YUJo0W
 ITp2RucJkA3V2xuDIPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfX4e02t9hicoJc
 170SIbgHVQCKJ78u845lV7EBPPov1CMybYGfZJ8Mb+S3L588rbn0rROB1QiTxIDQ7uWtpEAUdM7
 BGx4EI4vtFTouW8rmrClvRzsd17Uau0=
X-Proofpoint-GUID: ebZkgb5LPf9LfoLlrUR9DPJbwp7SDP6B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230023



On 22-11-2026 22:36, Krzysztof Kozlowski wrote:
>> Use linear graph ports 0-2 by replacing port@3 with port@2 for the third
>> CSI2 PHY connection. The matching Glymur driver data maps port@2 to
>> hardware PHY id 4, and there are no in-tree users of the old port@3 ABI
>> yet.
> There is in-tree user - I clearly see camss.c. Your next patch even
> changes that user!
> 
There are no in-tree DTS users, but camss.c is already an in-tree
consumer of the documented ABI. I will drop that wording.

> This is just not correct :/
> 
> Anyway, mark it as fixes and be explicit that you target CURRENT RC. Or
> was this already a released ABI?
The binding entered in the v7.4 cycle and is present in v7.4-rc1/rc2,
but not in v7.3.

I will mark this as a current v7.4-rc fix and add the Fixes tags.

-- 
Regards,
Nihal Kumar Gupta

