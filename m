Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB8C3B059A
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 12:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791377491; cv=none; b=DHlI57+U9CbMcsTtf71d/yJEkjVzZrPROouplb/pkCgRRCFEHKIk6hCN1+GsJbCWWzsbpWPfxfxx9KzQ8Kj6YcWnDa25x5elLrfAPrsLu6qDDNuXcfHEgHb+qeM3E9UjpHzZtVmVgK9cGDABmgTe5ySM04AQfVDEaxkRecNt5e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791377491; c=relaxed/simple;
	bh=Yh+Qn1FxrRhzwIRz7fKF5WN6g4+iXup778g/Qf1o/OY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PHXkYRY6yoUovb6OjDb9gCmFBT0sOQPfQ6L+He/NULtlQJQLXG06zPDHe4f26153nBL921coe2KhN1Sbk00cFhNORtxQk04sQc3DdPRVE5WtIUQRA1oEfl+1gXVGHzaaBjYTC/RQK5sC4OUus/ECwcd4rd4Kfk3m/TcgN7hDEKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4ms9/00; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bI0WCY3b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M4ms9/00";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bI0WCY3b"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BVKlW2363983
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 12:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sC6O26SQSLtN/B6et8VWsXOn2YkPcZ8zoEBjKieVz70=; b=M4ms9/00RYMIIzaw
	7wroUm/vK66HpCunxJeKWfwDYkrWHek92yPUPUBXGMlj+dBBaJ9lVpSRRuYrW8sJ
	sOL8xgGYcZabjURvHwYTZKEIeFyaY20dgDkgLflK2MlNhsflcM/HtsGbbF5su9U1
	46PvJnFOaxEO4nrZNcEb0P0VUuIFBxF6MbWziyIYkvlQ6Xqh7gJMAcaIJMZd6d9E
	liIcJky4ahniSvaPYiWJU+nMgtS2sFrwJFtIwhWyxmAU16YArXc9NxapKb+cT9Vv
	T4/fv2nf+mt2THB2owS6G3F1QbxyHrbgvWvWFlcsYlT8r7q5svUzC1sO8wr3bRAO
	ElilxA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fw8se2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 12:51:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2db8e9fe9c7so42999285ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 05:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791377480; x=1791982280; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sC6O26SQSLtN/B6et8VWsXOn2YkPcZ8zoEBjKieVz70=;
        b=bI0WCY3bNgK7JMq2tsln/PxwC7HK1lv/V+b4qjbXTBerhpVwGXhtjRSiljM7ExsyuS
         l6jMHd4AluAVFvv3xKD7r0fjbj2GxP7RT/SqeRCsZr+aSTjMpjqYjjQ7QXvVWosr717g
         4kEWy+2woXcZraEgG0V+Oh307Xpxmtvtxe049GvnJlgCqdVFMma13lbdJlozm/I+bTV5
         /zQoRy1Ld1bGyod5c51xwe92Ndyy3fhFq/WdWMRLQBNZGL+7/zbozGNtxDNNgqCQYa58
         kEb+d29XMfsPKkA8GlwQYCIxJQCETVZ25QtG+qxX53R0P5ZKdv1ZlxzMNu7MeAGFs9Eb
         RPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791377480; x=1791982280;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sC6O26SQSLtN/B6et8VWsXOn2YkPcZ8zoEBjKieVz70=;
        b=a34PGMY076LlY4LD9yz2DlnhzWa05Ws9pKhChLm/CBgqL/bJaqSnn0J/940evo3bpX
         UATe0Xmf6jM17E5pO811FlXrI1JDiPYalYRred44Fl4urzuDfVptHG3Vk8cLqn2e+751
         tDcVSn2VpOdet2eHgr2iXbqW253OtvaP14/Kdisjg5WuqxwBU5NaxsV6QhVWfmG6dNzh
         PilKUT/+tuFFns3Wy5zE7oEHHD+68KgqNIMYvqd6qn3OV8tRZqoJCSjsY97ubKKtH9PD
         KE7I1Ixaq7vCVHfjYNtLXEgLc1YIyRBjhhmDligaC6YGleXNrz5t+iSOwFZvvprJePyL
         d8jA==
X-Forwarded-Encrypted: i=1; AKwUvBzK9yDtDYlNAkwnduKi2Ry2PjRzI5nna0Q2w2fquAS0bdeO8WUJelQbXcDG0oLaRD9iYD+/DZpaj1k9/t7N@vger.kernel.org
X-Gm-Message-State: AFq9FYIP0S27iTVY0toBe9xTvH6JEkBg+1wFkzkUYUFe1SQ/2hyJtF1e
	8sRypXmkWF20S9l3BrUedDtWqKgC58RI1q/EM96btcdmEeS0miRzaa18X+bAdA1lGwJ6DjbY5IV
	SRCq7zY+Ki5WFaER6L4HxYW/oIZ3a4bf+ZkhAX54GWI7sz791zEsGGIm0klNFNAcTnRVW
X-Gm-Gg: AYBFou2Ii/QTCg06MJdXwK08ZMjt8nzkVdFZutaX7RKfGo8eyhuQxAx6ilPJN9Dzsl1
	Al5Q98X/DFhiKUsv9conFiEw9COtfuxpCYCDdHK9w1f54vprbroUpUhFnQkcbNiWQtlWt422jpS
	TPfW4oGcHyLbRzoMfzblGTC8Qst3EmGnAk8Du90X5gah1bezVxIFO9EFpXBPlgzwGXxfwFYg56O
	xHo/g6AC1ffcuEbeRYdnmmyQqreSiSJexf+qwgRlJmICf+FrRDMWBc7z0+GfJPlG7XxhcDsoXRB
	6vRPaxVPDY6urhB7d04z73YDOmZxVQRKIzs4yJQuaHFF7147da23BZ+0bVnLVgZnOsA0KQTJS8V
	9OgeGE+wrhC4I8Dj1wQE9CfSyYnsqO0/I
X-Received: by 2002:a17:903:4588:b0:2e4:b37a:d573 with SMTP id d9443c01a7336-2e600545f0emr23100805ad.47.1791377480545;
        Wed, 07 Oct 2026 05:51:20 -0700 (PDT)
X-Received: by 2002:a17:903:4588:b0:2e4:b37a:d573 with SMTP id d9443c01a7336-2e600545f0emr23100655ad.47.1791377480120;
        Wed, 07 Oct 2026 05:51:20 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e604852079sm9721535ad.60.2026.10.07.05.51.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 05:51:19 -0700 (PDT)
Message-ID: <c333f1a3-39e7-49f1-b0e0-f3bc0348a242@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 18:21:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: defconfig: Enable Hawi LPASS LPI pinctrl
 driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261006053717.3455143-1-prasad.kumpatla@oss.qualcomm.com>
 <20261006053717.3455143-4-prasad.kumpatla@oss.qualcomm.com>
 <1072f38f-8dd5-4e70-a583-c06e402ee90c@kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <1072f38f-8dd5-4e70-a583-c06e402ee90c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1MSBTYWx0ZWRfX/6MZw+0ZLyxk
 sycSY61NxawKnLJbU03AOIp+Yu4DlbLEwvghUm8j0EiIQhbETYs5S6xfXa19K5P6oSnWZIlSE5T
 IA4cLtE0cwvlzyij09C0eXK3fG99JNY=
X-Proofpoint-ORIG-GUID: JWIrGIG-OOjifx9SwpmBpDYeDUG_rbxy
X-Proofpoint-GUID: JWIrGIG-OOjifx9SwpmBpDYeDUG_rbxy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1MSBTYWx0ZWRfXwZL/wkEbndB5
 lBUo+jyEOl9batnxBT8Zt/iIGxMpx/I3+7JLRyclP5DbkSbvzM2Hz5cfINoJWTLSFMBbix3vPzx
 w2iGs7yIysuKrHQj5h46bBMpHoEXC2xBkNy2SSe6gwZFCrwBv9hs3dZoZuXtrhficl5yEss6yjL
 JKJD7WOIOdoZFWccunivuHiHJC9DjLunWlFSW1MfT8X3Pz0dxNCkkSFGe+YueUJEA/9P8T7xzaf
 nkgf/YZ9kmQ7A0qVv4Vq7tNRWFqp3fbYs5KXxnfJCShFAXwU4uwbQVt4x/msx9b3o3eLDXAjnmR
 huIK1SqtnVbTqOoMeE70QFPOO2ulegEr9l/4OBLTDUeyJDCy9TjAwaTxrbJamQNnrluwrbVKqMe
 xaJU8Obz9m2Qv+DTNK6rxANiDChAMXlwE9/80EEg5FRIKKzOQrqHQzTeLQmdgPqsVQMBcHjjsOo
 frL15eqWSgoeHxVlPcQ==
X-Authority-Analysis: v=2.4 cv=Af0kjHXG c=1 sm=1 tr=0 ts=6ac64049 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Ii1R4P4Ja65leNuhIA0A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070051


On 10/7/2026 1:15 PM, Krzysztof Kozlowski wrote:
> On 06/10/2026 07:37, Prasad Kumpatla wrote:
>> Build the LPASS LPI pinctrl driver as module, as required by the Hawi
>> and Maili platforms to control all the LPI GPIOs.
> You already sent it two weeks ago, so this is not v1.


Thanks for the note.
This patch was previously posted as part of the earlier Hawi/Maili 
series. I'll update the versioning in the next revision to reflect its 
posting history correctly.

>
> It wasn't picked up and this won't be either.
>
> Same comments as for every other defconfig patches. Missing proper
> description, missing rationale why. Hawi and Maili do not need that.

Thanks for the feedback.

I understand your concern regarding the defconfig change.
The defconfig change goes along with the Hawi/Maili DT updates in the 
original series, so I'll keep it there and improve the commit 
description and rationale.
Thanks,
Prasad

>
> Best regards,
> Krzysztof
