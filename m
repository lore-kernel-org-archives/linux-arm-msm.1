Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795373811;
	b=wNW/sbEsT8sxESrmdDevBvqUNWLOqDZE6jTtVEyTDAGflqBXIF4tBcNoEzeDRBZeW/IG
	 RGDfJs9KuxmEoQzyw27obAGLJCZKUR4McxKAuMFLAj/0uaqVNaUZFPjBC0t29Xvnh0DCl
	 p+OiJSU4q2X9aZPHlFf1YDT72S6CJWQPPWWlvA7sUHNAAuPMH8kgrkpCylriIzD7ZOXg3
	 XgdUS+igH1bjFhnm3qXvNmiR/wbI1ufqFnNCcMGFYl6CnjgFjPqja2hFSpZdSVlsYN6V7
	 BbosXzKm4I/WlDFb0dQQc4/Tw4mTD1ARCp2FBEse7WYLO431cpiskEW16MOXb3C6lCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373811;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HRvN52s7z6Z6ebg/B7u9QoUXaIdsxgVH6C5C+S1jI1c=;
	b=Mytjc/Jpc7kyib9WxksJVYM6F0Q2/7IfWL5pH9IUVcrHfQxj1o8hWCOKgiLwFt8vxyG5
	 WlMkheGo2A9l8PDApqa8dPV1V9lJEafubRfvZCD5esafvsaWMkP+ciijy8G3DbY+02WyS
	 13c7WcpFciSSyNijCSRFLmlamkbipi2l18NqEzoyelVCu6+2M2fZO4Aew1tTUpyI0hPVG
	 t8+wn2U9yqktHoVQ8q5ermLgLPd0A2fdAtkb6Rb9kBaW71ZVMY1q+iRiXemBHWSaw5uxk
	 Et34djcCHYFE8B40ykstBPk7MlkDsgIjzZqimrwU9HQROkB/fNTqVgVSLuKyTyIJxBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tga9OHiB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jSQJdwYl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102E2606A331
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 18:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 102E2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tga9OHiB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jSQJdwYl
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGUkEP4154182
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 18:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HRvN52s7z6Z6ebg/B7u9QoUXaIdsxgVH6C5C+S1jI1c=; b=Tga9OHiBWXVl+nTY
	DKDA4ERV8awrNJTU6vWHB+B++4uCOvHAUuQgI5MRr5KNNje/krngRdL5hsw23T3+
	WTZfCAgmbhhZhQ2OOKkc599UnBpVOfoBR/grypJ6mpyAr9lm0Ea3YDbqoMvzUEqY
	6eLlzcMkV5JlrH0zsG0/fBd+kYemQNad5StvmxeEudnOTTkFQMefnlGZ7oAt5t0s
	LbSyVpVnSa1oiYzcyMKczk4dK8ic8enhqU8LroTjxLPrqueEZ6m0ztnL13mH3B3H
	bsMfMuHzKR69zvLOAr5UAgnqO6bWiA3tZ7LF9jzSQjlRedctMjnUeSO9k8045D1N
	34IojA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j328rv7ct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 18:56:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9496ff065bcso375446885a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 10:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795373809; x=1795978609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRvN52s7z6Z6ebg/B7u9QoUXaIdsxgVH6C5C+S1jI1c=;
        b=jSQJdwYlo2r+9m3bOyza6XXx0si231V7050R83+Ylkf7R2gFpvpyaEi0CIMNnU6HQC
         42OpdyEgrio9wgNKDbmOEk7LZkMQ4Pek6UdXofSP7tvrqT0+v4s3fLiYrE6T0E71Ya+l
         AUd1C0Be4niaZxkBQBzi46Hg8iq35kU4Qv84xuXvuhNFIuG2HVC6ddZ0hxoehqDoDLdy
         MVl0gdmS1zZnfcKvERONgFTmxvoNbTo3phpAVuvjus1OZ8DHkgj/Q4H11Hk6mpNE02be
         4Yj9Xmu5eAP6FMU1PkDkrEDCCSzEMtoW+wTrDHchyLTasedltbvW3ykbEounxWin3lFj
         4TeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373809; x=1795978609;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HRvN52s7z6Z6ebg/B7u9QoUXaIdsxgVH6C5C+S1jI1c=;
        b=hzRQTs2Lc/+N0hxFTlUTanEylKh3Nd8Y97FF/2eGofk3Is1iMXDUVllH7YtWEhSD3V
         b+wEV2ZqkckjIZ2fNF4D8oNA3JUqjhQMsIZw0ExIlierIBpO8PCqLtD846IfMdVUl6cG
         N0QvDC74OGeQ9MjHuDWIyWUoRx/dl1xqok+CqXUyQ0Bv/Rp+quOI/ogDB8dCBV0myRu5
         lDr5wPG9B5+8tnP0r44+4m6LPS5KbWqEsXoA6/Ovgr9MMwg95Ukgz7FznE+muTsq4hzW
         Yr5ZYgO1CSkmU1QCbhxGRPKPqOQPDFlNLfukJVlOgt3Daa2OvLaPYiXgCQ7hgQza7JIW
         3cFg==
X-Forwarded-Encrypted: i=1; AL+hErF7nsxNotFpHpgBf/sRbeIUW4XU+ktUU6FS7YFH4KCV2lfT/+a76KuyTZIuTY0vM4wTzIdZtK2VPtTDRner@vger.kernel.org
X-Gm-Message-State: APuU4Z/XOXcI+aU3m8VU04a71nZB49L3LfJsAjTOUB6ZafGd6I0vDyaf
	9kc9fQ6aWn+J0j08HAUVxBWeN0y5xYe6Pw5SCNTfHOyjdvNeSUkK6uHqtBvEI6PZubyURVXTYhq
	9y2Z0EmK8ToKQasv5t7ZPm0Twxpfe978ndx8zV1XXX5W3wREwf/oGw1J+/qznZS/bs2yC5tq7lN
	lq
X-Gm-Gg: AZFdTZfRoGE+nunedqRIL3Q52uqazUcmf2BhOgmsu7hB4LMgAHdn98W63qKiUN7G+Kl
	wYO67bu/1CKa8MrIgkm4VpcnqCfv11FFVjm12oVJVw9K6vE0mUOSD0t/W10ZOgpFsVbGaeQ1Tzg
	IxlAv6mG6dd08a+MJ8VSqyjl9hp/9k5Py0Qy8ZpK+Ddv47yQb0eVHZ+G7ZmT9sxpaSJOA9qLeKR
	jHggx7AZ01JxjGMvCgRVhJ2FFbY+has88OYfMpCsF6ivSlLW6rNIM6vFqdY93JxelIicYgE4uA6
	NjmpFVEPWRfYkXj5pR1Wt9WiGnXjWlZMjcOL6KCu4U4DyNTN3lOiNmQTQMkRcgKG1gG9EK7nguz
	H88VfbNI8YYNkPExOKZ1nIsSLzl7rpnuksJyDpJigEo5ATSteSbufEbLqfDyzhTb/jeDv4AY/pa
	IGK9jnwhfnG3vW
X-Received: by 2002:a05:620a:2842:b0:93f:5717:e7b9 with SMTP id af79cd13be357-949ba99b091mr1605106185a.30.1795373809386;
        Sun, 22 Nov 2026 10:56:49 -0800 (PST)
X-Received: by 2002:a05:620a:2842:b0:93f:5717:e7b9 with SMTP id af79cd13be357-949ba99b091mr1605104985a.30.1795373808954;
        Sun, 22 Nov 2026 10:56:48 -0800 (PST)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad6403fdbbsm12158751f8f.15.2026.11.22.10.56.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 10:56:48 -0800 (PST)
Message-ID: <8e4a9c2e-e92c-4491-8f7a-25f68d468df1@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 20:56:46 +0200
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
Subject: Re: [PATCH 2/2] media: qcom: camss: Map each CSID to the VFE it feeds
To: Jesse Casco <jesse.casco@gmail.com>,
        Allan Siriani <allan@fatecpompeia.edu.br>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <cover.1795196107.git.jesse.casco@gmail.com>
 <9e5bee0dbc1c116672ba0020013ef0a346385c29.1795196107.git.jesse.casco@gmail.com>
 <331d37b0-eea3-40b1-9a27-9a33cc756949@oss.qualcomm.com>
 <20261120220025.56887-1-allan@fatecpompeia.edu.br>
 <20261122002800.41569-1-jesse.casco@gmail.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261122002800.41569-1-jesse.casco@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3NSBTYWx0ZWRfX5m8bnC/nVKcc
 owWc+etmVQz0xlHSwria3+KC5yNwcT9mOAmX7GLNdHgleFKjJaXmo7PDadDyM6PvGZM8DQf4feb
 K2NvFURaa8zmZV9QHNy4DNxPWx71tKM=
X-Proofpoint-GUID: _VH33IaMWq3ZIUiiUvX0UbbIJfWCEFJj
X-Proofpoint-ORIG-GUID: _VH33IaMWq3ZIUiiUvX0UbbIJfWCEFJj
X-Authority-Analysis: v=2.4 cv=c9w+0h9l c=1 sm=1 tr=0 ts=6b033af2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=W52NO4HEYjdIeXn2O88A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3NSBTYWx0ZWRfXw4gjFTx8VuTc
 1eQUQGnB9/iz6xqYS05hr7FbqJzhuQw0QOvqP8gO3+cazN+mKkR62Wc4qmZ+H9EEH078sf8dJyL
 M9yTB28v9IUq1E/WoVybe6uEAsUTrWAgqh131Ncb7Dbi8/aDAComqs/zh11Fg3Re1SyX98+lZ86
 BPmqQBG6umnrKJ04VuUGlAfNgNmt6ClVlGMSYHh6CNKoeOWXPhHpHfosqgB/T4T87QAJcvym1oU
 vlxPiebEyGeX7fmWQNXQBr1go6qvxLfFIAcJ1C5K6rmcQ7cOAOYj5hXYmcuUTICuCVCEz7bn6xH
 A4RFEkDPY76mrfbPXzowaeYrM0PUnzX1k1H+ThC6/EKn5KkAx8BEjtXCVEXLQ1G/nyFpVkb2dEY
 ya3FhSTFGizAqXQPqQ7OvP+kfQfokJipBMMq/raxC9KcHLdaA7Xmp02m0djsLDIXggN8+C8EsPx
 NAgh148i8jR6EIlw5Nw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220075

Hi Jesse,

On 11/22/2026 2:28 AM, Jesse Casco wrote:
> On Fri, Nov 20, 2026 at 07:00:25PM -0300, Allan Siriani wrote:
>> I'll drop it if the parent is resolved from the link as in Jesse's 2/2.
> 
> Hi Allan, Gjorgji, and Loic,
> 
> Allan, my 2/2 mapped CSIDs to VFEs by index, not from the link, so
> MSM8916 CSID1 would still fail. v2 drops CSID2 instead, as Gjorgji
> suggested on 0/2, and leaves vfe_parent_dev_ops_get() alone, so please
> keep your patch.
> 
> Loic, every CSID still links to every lite and full VFE today. I can
> add a patch to v2 that skips links between lite and full blocks, but I
> can only test Glymur. Are they never connected on any of the non-ISPIF
> SoCs?

There is already patch for linking issue as part of multistream support:
https://lore.kernel.org/all/20260911062213.195007-6-gjorgji.rosikopulos@oss.qualcomm.com/

However this fix will not be part of new series for stream API. Bryan plan to 
post bugfix for addressing linking for all SoC's. Please wait for that and hold with
linking fixes.

~Gjorgji

> 
> Jesse

