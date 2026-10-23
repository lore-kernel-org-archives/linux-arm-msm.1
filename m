Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725244;
	b=G7He/n9X/SoVKgp76Uss1YdhmA8nMp7N7NK3MFFEqEBkCoCs1yCoreG/yx281epimjgz
	 y8335fis9RfbwJR2lSA+AwH8KeDOm7t/7xWwNms3Wmh/+lJg7ZPNNc5va/uk/x/glZnjr
	 jAUwAwQYwdPQ6d7r16rv7QjMNWR4+A6RWW4bEQVdkHKwMKN18z/mYhBECiivUvRl35GaG
	 M0jMri1jQ2E7ouWp8Rms8zk2uN1/RD/rx0Qco8K7YkGu1YbzVlUjMHukPmljYPJ8Ruu5s
	 /7khLJngmg/63ejXvj74ZjVE0IkLNPTDxOcofRqRf9gh68OFhdM9dOZM2lAj04sVFNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725244;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=y4QYmaKosc0eqCjBcuMLgpeZCWwCkKpgCeWv4X2n4lI=;
	b=P5N8GlVTy9ty5gpsm2VndcGnSP0z7A1T39qHif6tHk0reOl9C3UQsSLhsTyOVnODy5zp
	 ck+xIviHoi+lKtyud8yzAh0xvGjBgG/WRu0vrNJUjIZ/JVLmK/1ksQsp/dPAaDrN7wt9q
	 +BWmqw5haWHmBKBw13eYJZ8PrP/lQgPpAhzk/3NOdxDK0Vm36tDSfcR3SkjPqQ7iNsrLg
	 +xLQKONV/XlaUH541Udt00+SR+Rocayu6bE6iCvR02pSrAH/Pbnu9QR2p23zoLXchE/ks
	 WdG6ypcN6IXhun9BhJ8UUeF1rZB9CisYK5n4tM/cGa7s/fvTtiqqtPjM7EX8Y8cNiTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="c2/0eV5p";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dVahHaa2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42126606A31F
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 03:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42126606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c2/0eV5p;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dVahHaa2
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1FEKK1792477
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 03:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y4QYmaKosc0eqCjBcuMLgpeZCWwCkKpgCeWv4X2n4lI=; b=c2/0eV5pBeOc3Aac
	EddJmSPcQpZ0iOgux1W22RkgzjpeZI1Lr42HNgnYCrpgIbQt8ZPT6NLWWtZmrP2f
	YRnUNQtEaE6ASOmGGett3lTRq+VmsbKIhzs7l0zkvMs98ROiJXlh24Sb2T7urOmk
	5aLXXy9bgsBFWmJgiOJHGlem53L0uAlcaiZ1M+80Wj7S9aEm94N6qb+ykILs9S0O
	cD0xIGTlwnKAvYOJDdEQjHWGFo8xawyXEky1nsMYGo3dOOu75EuGSqvx5rRLjEdM
	EWFb63jBRbfug+xSknqOasOkOVmrjLPE44q9tuM5sgCNqOpkmZW+DOR0sCyFMGdb
	cod4uw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0j6gu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 03:14:02 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd3e7a65fa8so277825a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 20:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792725242; x=1793330042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y4QYmaKosc0eqCjBcuMLgpeZCWwCkKpgCeWv4X2n4lI=;
        b=dVahHaa2mK6p5u7p8qrltX+wOVyVT+xp6a0q/LqOUGdpCgtmZtOyahtm61LXpVll/g
         qzwHcZW0DlqZYfc+bJi5b92QGLf4PpnzUI73zXeF5ZWk9RYr1Kco4WiLypiauw/kEyNA
         cCOFyTtznzWet/6gAT6w13aYSqGm1+qmmIO0yIRTLSP1MUSXYMIhv21EoLKn6RuL3v7Y
         FJaWmhPJRKGQnWF8VU719bkv9LduOE0cuKUrwA2Mhiq0jLsmF12kpKnJb2NhHD7ked97
         XAW4VPYqrfwYAVPNFgi16yQqi3cAqn3/qm2bR9cUEpsLB8aMm2S+aMHS0TDkRj4j94WQ
         ifGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792725242; x=1793330042;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y4QYmaKosc0eqCjBcuMLgpeZCWwCkKpgCeWv4X2n4lI=;
        b=VzN8YsyoH7KJj6CM/GcGFkL7IbrNYZc8kqfcFx3XQJjskHiNnLk3jzwJim6E9bKR/D
         t6gEeeGUfF4RkllSr9PfolbzHBRR5kAo3ZQP61SzYTcyIs/i+wUY7JQKA5eCitKgH6R0
         eGqr0mG3bkD0rlk8h2ffFx7VYmzMioABlUPFhxLSJieRbSEgYqnjn6E/Q4j0+5lGhxPD
         EPjnQoP8H8YxLQc/tEaODj9xp4PZgYOhUTTQWurUS1VuiBGJG00WVUQUtH0RyYVgcaWK
         u8nuAjUjtKrcELObu/X5hFoOC1kTAnQxkgOS3yrhBKyaYRHVTZ/NWIKNMrnLR/2XYhpd
         YtMg==
X-Forwarded-Encrypted: i=1; AKwUvBxYk594rsb3+mPL85FzBWMo34x1VOf+6eNv6iruH4IY0qMrn5LW2N97KwFNBognLI7dYs27+SOrTw8MKKZX@vger.kernel.org
X-Gm-Message-State: AFq9FYLsOOkvvpk3ZB36mmBB0VC54RwyvMyrIqbhhECKV/67dtDqHjis
	K9Pm/VYlQGRdMEMAYd2473AdP0D2yNUtJ7splrURswyewnPEXV9KD0wXdGP4l1x8nGUYeDEN+29
	YnLci7uXf1knG8wrdKzbqowec2bS/sHy/lOiYgjhn/ruB4glJfs2fL6ikJouf+eIwf8jySopoeN
	VI
X-Gm-Gg: AYBFou3+1kIgyWAAVPzdDU7PU9jeUh2fBwVtINnazTxt/Y+dc4oyVBshEeKvBTtjtmE
	1EGX+KT45jZtc3s4u/MrG5M6xK29tnBbYgtZ0+Ug1wFDsZDga6YujeD4jJrao+wd/13ni8J8InC
	/O1PfsBCLZRxck6yynK6BUMY9Rdog/ejF/V1uwuMyb2QhitrO/HXWq04dz0pb+lZ1wbmP1xRORa
	z0B/X96q7V3njK1k5Pis9/cpcYVnQ8FPIQg5xab9WW0Oo+J9N84gME4OOT+rIXObCcrqEH4Qf2q
	wJQOG767apPuOwlOxfSDiWdbZhtPygv6tY7+giWf/BPTKttobje/waRYa+SzcFkmoEk1XKMhIiy
	d++x3MssgIgJkBTjdmlen+KbuqLzX+QgCDsOYYQlI9QgYRHexIksmQfqmRuQlLaDKcaRrJi5m
X-Received: by 2002:a17:902:db11:b0:2e9:a166:f7fe with SMTP id d9443c01a7336-2ea7cf79e57mr10605315ad.62.1792725242042;
        Thu, 22 Oct 2026 20:14:02 -0700 (PDT)
X-Received: by 2002:a17:902:db11:b0:2e9:a166:f7fe with SMTP id d9443c01a7336-2ea7cf79e57mr10605125ad.62.1792725241501;
        Thu, 22 Oct 2026 20:14:01 -0700 (PDT)
Received: from [10.133.33.125] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b369900sm4424225ad.34.2026.10.22.20.13.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 20:14:00 -0700 (PDT)
Message-ID: <38fc5a6d-c019-43bb-98f6-ba6a667c64e1@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 11:13:56 +0800
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
Subject: Re: [PATCH ath-next] wifi: ath12k: change MAC buffer ring size to
 4096
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Yingying Tang <yingying.tang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
References: <20260610031358.2043716-1-yingying.tang@oss.qualcomm.com>
 <atcr70WFLxp8zreK@QCOM-aGQu4IUr3Y>
 <0423c93c-8359-4fd5-9ba0-17e5ed3927dc@oss.qualcomm.com>
 <atnVeGiu9Q07HyUq@QCOM-aGQu4IUr3Y> <atoTUgEIfkg6b29U@QCOM-aGQu4IUr3Y>
 <cbfa35c9-cfa5-4eb5-a203-09c9069e3b0b@oss.qualcomm.com>
 <atrJv0wgF20tmuDr@QCOM-aGQu4IUr3Y>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <atrJv0wgF20tmuDr@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GwWZvdZ7zfGy2YPxyS0Pof9yU2a4tvP_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAxMiBTYWx0ZWRfX+hLEE40PEV4J
 uEu42pwS39tsQ8H/BBGKJe+DKIT612V+Imk+QcThM+faGuyDEOAHqHn2lQqCkqa+fKgDnaaSHNW
 LdT6CjbnaMU4xmSSNJULyIQLNlUa4V7GJ77D/eI+WkPatfVa0DJ56rjtnE+Pk8BNzkC+GJqerw4
 /D2mGnLnK1SaL6lNiMBS/LKl7YNk1VYpDq5Bir7TJiwuu7Zu2BFQj+MrxqUvzfysUKRCi1d9AGh
 5MSMvYio9PzmwvcLqpI5CuBGxR1AegZXbs8rx/GysoVYvm8AOWlUgasBtHkMoxsfK6rtugeatfu
 Py0Y8yHhAzpE9wQCDCf8yoNCY+OY0QdnslMDyLI3aW2pfddk5oT/0JaKZmsRw/IXgoVCsUviKe2
 I1KvpN0ntVO1DH/j2exuOnr13XpxdU10ZyFZSP11uuXv2KMbPNdD8xe4qVQIXvzLBruhG6RrHzj
 7nePLYXNVqGQsfqijqQ==
X-Proofpoint-GUID: GwWZvdZ7zfGy2YPxyS0Pof9yU2a4tvP_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAxMiBTYWx0ZWRfX4EHdqPMwZdx7
 FxDg0WNbabuUVyfQDRhOBzAItJZvnVxsUfJCb0MMi7aYh4qJkNshe5eWP6vYS+JlhnIqlPAc8iH
 mVjOm8C+pqMMtVuv3fdRGczok7reG9Y=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6adad0fb cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=0oYm2DgIxsn4U9MLWVAA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230012



On 10/23/2026 10:43 AM, Shawn Guo wrote:
> On Fri, Oct 23, 2026 at 10:13:18AM +0800, Baochen Qiang wrote:
>> On 10/22/2026 9:44 PM, Shawn Guo wrote:
> 
> [...]
> 
>>> I bisected drivers/net/wireless/ath/ath12k between v7.3 (broken) and
>>> the ath tag (working). It lands on:
>>>
>>>   15f7603b69a8 ("wifi: ath12k: Increase RXDMA buffer ring size for default memory profile")
>>>
>>> The previous commit, 643f0bf93617, still has 4096 entries and is broken.
>>> 15f7603b69a8 changes one line, .rxdma_buf_ring_size from 4096 to 8192,
>>> and works.
>>
>> thanks for sharing this. I can repro it using the 481 firmware once get 15f7603b69a8 reverted.
> 
> Thanks for confirming!
> 
>> so the rule here seems that rxdma_buf_ring_size must be at least twice as large as
>> DP_RX_MAC_BUF_RING_SIZE (I also tries four times large, it works). This rule looks
>> reasonable to me, since WCN7850 get twos HW MACs and its firmware setups rx_mac_buf ring
>> for each, and each ring fills itself using the buffers all from the single RXDMA buffer ring.
>>
>> maybe I should submit a patch mandate this rule.
> 
> I'm more concerned about how we would fix the regression for 7.3.x stable
> kernel.

we can try to ask stable team to backport 15f7603b69a8 ?
