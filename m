Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793366682;
	b=FU6vDmL2W6O/i6hQMFBTcJbSloCCXozLv6GuPmujdvfa0spNJQQhL9+MHEG7eG6F/aqh
	 GwjsU+D0rf8YlTyCLmE2wYg28VXqL1shwkdqA2NjJb2C6qyqNz/KNDOiaDjQbxLeMgvGi
	 DRkf6N3w8g7GAc2D2878gAW43io6OmrFfG1reqN078Qvq0mC2OS+f7ri26w7twK+CyW5E
	 7z5/K69ErbkrwEkGq42iYSjl71qSDqoA7tUR+v3wXPrV7JCaVHRAAa1w7h2fun+w87vba
	 AgSARZuUormqhCcjGuE3X38rnpNMeeRuGH/emY5zXGngEaTXLA1lKflgDHNAPWAqzwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793366682;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ythtGg0yG3+EAqvIqVWKcfK+BPgVlTfwj66J1QFf+cY=;
	b=2V2ofZVzRpt8XzAaaemr7Fi0O2YbpErfYuW5YUt+GzVmGgDUPeNhH63tx6hZbeghf9Ay
	 oXdO0HsJ54DHp6OPCmq5u/zwVH6fcuvMxFsdYx/RoXjdVoMgrDWGPugfq2JvH1Hkp8TzT
	 j/0lOBslgDb6DoU/6dtkb5qYV5XyAx1i9b5/QQfC96Z6y7uLMfRDEV5C1cMw8FLVCsHv5
	 bY4i1R6qGG+/rVBsJKl7g972VJJYuac2eHUSZM0Ju+ClaCwkvxydxuM0YvGQhUR/9//pF
	 arxi69uFj3RBVOkvYeK46DDXTCIu7POs8JmUNMcgAZ/zyuDWYk6SOePXEhr/CscyeRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cIeyKeLP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QwvzN83n;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9C5606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 13:24:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A9C5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cIeyKeLP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QwvzN83n
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBFxjq3089201
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 13:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ythtGg0yG3+EAqvIqVWKcfK+BPgVlTfwj66J1QFf+cY=; b=cIeyKeLPhNEgstoP
	wPPRXFTKXYqqc0/UJUjoWSR3xQH0JER2i1Bn7R1eFj6lvctaNFU++mbkp+CTSNIJ
	oehmfXmG3weqfEKvrXsnSC/D7Lc8KjH9XVWsuWcRHP/zB+OQXpGsUO7TxDtNvIFj
	Ya4ObHq7Q51EOd3q0MNoiVTsPuJw3RhzrM9o6TktsisYk0h5n2Uy+7Ugx8e7g+CN
	IaMbJ31gY2lNJAh9FPxCluD+JH9nb6Tom0qsHJwxZzVQYIWIJi4I5EfuXe9g5Flh
	q3Qu2W0cY2ZMJmDZbIu33I3u5+2x4cz5Y9n9pYG9JlUp8EBzczTbZnYNANdCUzch
	LkPE7g==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qk802-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 13:24:41 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c97957d83bso53127e0c.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793366681; x=1793971481; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ythtGg0yG3+EAqvIqVWKcfK+BPgVlTfwj66J1QFf+cY=;
        b=QwvzN83nkFGNetDhPZHVPfOnNICMHt42WxRJib5Nkve8wzAN3xmug1Fv5HYQjxxl8+
         SOUY47n8pqIZuetVMlZr2+RZg4mMhomX4YpOqlvhu1795p7qQ2SDJ8sH5ZNlG2JToUvq
         KqReL6+JtD3PISibQK5P2Eed3/GOP0Yl/5SjB3iQSqYR8GSwyCjy8PosfvNU8w9f3Nlx
         x5cVtAJPcEIXDjCZLzPeO+EqWK87Q05gK5jlzhrwKuFa0IU6mKQJo2sXIwJ+bmlN7wPf
         AhqaWyVKqodpBJDzgDAqqPAc0o0f2/v69x1CbpKaIiRxNHSlvAV15phHxUrk2741Shvl
         pSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793366681; x=1793971481;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ythtGg0yG3+EAqvIqVWKcfK+BPgVlTfwj66J1QFf+cY=;
        b=PagN/l67xHpoPmcLhAYFud1nSGDv9/jWpkkKmE0Qc/T6Am8TkYvefOqZzmRo7Ycq+m
         TRrmDWZrKQYC3xZ7PgQkxjz1YjmFaMsiRYNyn6gWR8px+ZkL3lWOeITT3OMc/+85IDZC
         YxhjjaDT2NBQuApWlEw5plGppgbwI9cZvdLKIjH8cnqWeWZIcyKxcpUuDfgdQ06CH/Cl
         /BYg27P2mKs2Wx4rAPjWy80u9vzUZ/2xsALXp5rgt/n6c/+R/UBKeaMIFIkScOgX/QhM
         yatr2xVi0f5fbUB1RbkcpOre2hjAhg6l2Pi4bao65qrbzmMzcQK4ZYsBWzEe6HuAzoL4
         j4dg==
X-Forwarded-Encrypted: i=1; AKwUvBycstjLZ7qAaATYYPeDR05iyzOld/CLg3EK9kHa5vqn7TnNI1zVl//8rBW69h8HB9O/JeaQAqEun+sW6cK8@vger.kernel.org
X-Gm-Message-State: AFq9FYIjzbN+kPGmJdwkV1hVn4e6zUx6QzXdOWUso4Bm1Mr6KHcSRkdQ
	HpwACbWQH9RwLL+9trANltgQO9Z3SpPtEZv4QO2st+vmBjW5k/QFzlLMMQH1TDYc47vMA/d/hsR
	8EbmJxEJrfYm2WSci8KcTjw5219dqZDJrLz/dJXSy6QFtgAlXEg1SiN02MaU83RN2wSyy
X-Gm-Gg: AYBFou2eBef+R3i/CmgktGTFzJxcIPgkQI4FAjm1VU1wmEK09YZwNVJbdtkhsb8QR7f
	dMf6dFXLCocw11IbupZI/vXctSUO1YQdqcOIeKUK+/DJfe9SqehgqnuP7ehS0XOJZ5Hg3xr94me
	wywucxU35isEJ/TnGEPVLi+74uF1L+ZikKpgSQbGfOt8+a3of8h1pOjASR/RYYpcGq+ZlvRrTiH
	2wleKB7RM8anub+RxiGPpqPRIqDBRceyOgi2JbnzPxbtKZhPhVyedlgLOePEIag7bOGx/k3Juvp
	1C85GRwlRqFCEhrIReXYHPuW52L8TrtyhcNfy5O+tGK6LExU9FLOvL+AUlI8WacPHKm0saVlx1Z
	xaU64YyBPIFsvpOnRE5XFDazRwVH/ZtXeGditZNRSha+/jgVg2ih9/+fskvyJa4hiH+MXQRHY
X-Received: by 2002:a05:6122:8487:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ec6881cab8mr998187e0c.3.1793366680578;
        Fri, 30 Oct 2026 06:24:40 -0700 (PDT)
X-Received: by 2002:a05:6122:8487:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ec6881cab8mr998149e0c.3.1793366680110;
        Fri, 30 Oct 2026 06:24:40 -0700 (PDT)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabf0d1aasm62841066b.79.2026.10.30.06.24.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 06:24:39 -0700 (PDT)
Message-ID: <a05ddb1a-a84b-4db0-9806-918958f3a962@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:24:37 +0100
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
Subject: Re: [PATCH v1 1/2] phy: qcom: qmp-combo: Add PM suspend/resume
 callbacks
To: Prashanth K <prashanth.k@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261022104321.306679-1-prashanth.k@oss.qualcomm.com>
 <20261022104321.306679-2-prashanth.k@oss.qualcomm.com>
 <de3e5baf-dab5-417b-a9ed-225cbc56ce1a@oss.qualcomm.com>
 <a8104e92-990c-4e1a-aa4a-c97b9a801935@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a8104e92-990c-4e1a-aa4a-c97b9a801935@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: v80i6pUT0klYeB6ls27QbpzzKhkWWCJs
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae49a99 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=2hzCyEILiIFHTW-stH4A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MyBTYWx0ZWRfX2MyHg1QN4mTJ
 ln47lyzBC2qJpvnA8Wj/1g9zqbsBsp+MPLi56COEYqaWjSIHPY726cgv/fQatV68pcifC/tiEqp
 lw+MFfnsbzLFogcyvXkEr26JuGP8HliwxAa/EqVF9fSEXbGDmKRVwut2bMFgUH61I/xD8GxxNgN
 sjmR3Lb4ZaDIQWsikm5TmYgyl9QxD6QTvfZ0gvsE8r4pLvA7p/kD092A5zybHIa3FfV9dykumaX
 Wo1Yq833M945cu/InrRNLKUyxGY7n1KXJAA0OD6sAafbYisSOdKWFPqJs+Nbi7egE3Ys4VtBFb3
 LDjJoBlmTHKPaX5Z7tA8/zzLm1dq+3igdqew0BnXQH2ZqJx8U9YPi2CV6HVpkZX67KMI7bJKwz8
 Rwubvcc6ms5e9d7Tdy4N3EYZKNrETLwQpR014BPu9FmHLtoBGOOfxDZA9cJ6nkYqmo7ApR7s4rE
 awC2CKOmganoQRIy/Ww==
X-Proofpoint-ORIG-GUID: v80i6pUT0klYeB6ls27QbpzzKhkWWCJs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MyBTYWx0ZWRfXyQhF/cY+MC/+
 ouNBfwZzwYmr7AV+C+aZNdYZICePLZ8NhQ7cWRPhtwb9Qbkuf2cqQBOV/IBCjn3XkdsGYa9LQ3l
 WB98yhwyrSJ+2/ouduD9V/D0z2B5oF8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300053

On 10/29/26 7:11 AM, Prashanth K wrote:
> 
> 
> On 10/23/2026 3:53 PM, Konrad Dybcio wrote:
>> On 10/22/26 12:43 PM, Prashanth K wrote:
>>> Currently when we perform system suspend, the phy clocks aren't
>>> turned off leading to power leakage. Prevent this by adding PM
>>> suspend/resume callbacks for the qmp-combo-phy which toggles
>>> clocks on/off correspondingly.
>>>
>>> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
>>> ---
>>
>> Well this still leaves pm_runtime_forbid() in the probe function..
>>
> 
> Not sure about the history behind this, I assume its for controlling RT
> behavior from user-space.

Long story short it was an opt-in because it was broken.. can't recall
if the issues were on the dwc3-qcom(-legacy) side or somewhere in the
PHY code itself.

Konrad
