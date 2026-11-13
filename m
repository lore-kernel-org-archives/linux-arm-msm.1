Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794591683;
	b=NejHUgLhxhs75dYMd0Zrfu6JhHwUMBP5/U7/kdn2zYMeugs7hFdOk/9xQQImN4zm+SNN
	 /Zxc3S+0uywT/jdQMs9JyvDdnJN4MvNkTWKG9RbAeGvAKB04UcfbuJDeAOHdFx5qXho1f
	 MqB3F87M1GlKEM825J+TXbuTQ9iK4NuXgLR0bvrFyYFFEMQOPgbCOHyUKRQ5BMmiKAeaK
	 +HBxaMgZOY52MbRRgrPh8fQYct32qWH4lrgDV9mudKhtUO/QnjOyz6/t+/LS747FTvjpM
	 xqwVZyMZnkOjosiYghJnwfUB6kRKOFjQx6zhLC2eHZAaur0ikOP+E6SJmzxZqQoL2UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794591683;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uIeY3cSe4codMyJtw4tcntFc9/W1d8epw+OkHuY4l/Y=;
	b=nWPsvNAg6DtDEaSy9lpiSiFnuBjDoLO08l2svyzK2z+qxENc5t+XWftAIJhWN9420IoO
	 FEZ1J+3xLXPeoOV/jQhvCEdOGByXgkXMrIN5aXir3yxtnYAmM7ijzlZfKzXTgXC8EoaKg
	 8QxJhhFZsvl8rTTEqCbXk74byBdZpbd86OQFYR0XJuEm0dbrgXHtqIwVLl6+rpabzfOOB
	 WWTs+6SRlPB5BfYCgt0Yx2iKLRpnbK+OBvynQYaSd3uK9dA1MRpUF59d3lQILpkI8ZRdH
	 2Y+QaMNPvqSWqunWCOXMpfukPc2ZLbyN3mUXA38SxRzLrH5fLd57u5gp9lws1z/JVpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mivVSyox;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=acxpalzT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2280C60703F7
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 17:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2280C60703F7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mivVSyox;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=acxpalzT
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR7UE552097
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 17:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uIeY3cSe4codMyJtw4tcntFc9/W1d8epw+OkHuY4l/Y=; b=mivVSyoxeM/tvaji
	OETnsBbiUeXU5EB/w07Pxz0/ScxvRAkCPHCvCg8f3+JaAQboKxaG+9Azc2eJTKkn
	aU7iYvhxchXieSbC/reSIt4dq4sqy2KjbbNr7n9XepTL+rmiGAYjFi5Es1vTPeXY
	lOFuPM/bYTv0qT443rcY0NfkEcI/k16EK8Kkrbb4RH1Dv/SXPXQRnc45DBPro4ih
	sOK2s1r2xaNbyGIGsfk9GHWNhjNDL7qiQNR7rnUOL8xBjxxdAVuTkVHzaETv87il
	Jmpgjo1k2IOMxL7GalvAJhmgJIMlgRYmVWn5TZ8a+uMrPafvcStNLD1xP7FsX8TZ
	DWBKJw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwc375-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 17:41:21 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-37549877380so1551740eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 09:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794591681; x=1795196481; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uIeY3cSe4codMyJtw4tcntFc9/W1d8epw+OkHuY4l/Y=;
        b=acxpalzTXpYOq3AmYmbEoWIPs7iEo4utQws6pK2ZJaMADWuhi/C2hql5dLJFXupQnr
         n6YOOAzjfxt9Bj8F5q/CZxOfMZCibYjPVT0Z3eVskH8vbNCKGNXwS/7pd1kTSompB0YB
         M4h5lO8VgCMyDolsUq+r77hk+MDMd+m6Ie5xxBtPu1i/2eF5Ph2vEkkljF8e42MSjrFw
         4YybvwMgvVumDmfC9m1vkebOU1FKiyxbyJFiO98bxNCm0cbaU7/8eaJBSpHjfXbbVhIR
         0QhTzbNbxiNz3nd9kQX5eFytDfsug1ody7XbwI8Z4oHM+Ra2+emEtvR0vbRbXGQ5zX5W
         FPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794591681; x=1795196481;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uIeY3cSe4codMyJtw4tcntFc9/W1d8epw+OkHuY4l/Y=;
        b=ZFv6hmbgXEjlDGshcBxvj2LX/hN+vZSHnq7Jq/w78hqEamO2wxG2B5gFtVEQlbeFyR
         5zEcxD+NBd1YxLeFWMAbD0ddYBQ7VhTZ1krC6Q4wUFSdvzMDK6vr1XVPTo0h9VSLq7ig
         8311WDgApxLyIbp4aiV5SI00tqi73X0kJQcrj/UjMRCcqy4co7Nu0rHu+EP/ynJg7zYD
         3f4sDIHQo/760g2RXi8n/Xk3UF7Vq3dhlJ6ygq7BITnQcMMyber7CwLjdrp1ghHo76B2
         OPlOouauHNpDel3LbHmDAw6gwXJsAcMu8xqOweg9FeWPvihMXz5v0RqoEjhstioXNh9A
         VVhA==
X-Forwarded-Encrypted: i=1; AL+hErEXqgKrl87Y6ki5W4TvjFSr7/Wp2WJXfWIUntKybiRFPUm6TtuFkzy7IPz6LBhGenxJU7RoSdbwSlFCSlNQ@vger.kernel.org
X-Gm-Message-State: APuU4Z9psfIAZZWheEBqP8Rzf4iQTfwLHZntPJBrufjY24KA0MXc/VSv
	2Z9Zi3eRSKE0rU1R8e9t1GE8apS3SqBe8HAVAtEeUgxPEhU2PZnBnIQYRVPlX0xRpGcal45xc8O
	N49lXiHc2ZWAIMyD9RKobXMCWBsGDaVaS730y+hE1bE1WGb5IC3LVVOaANk+gpJXEmoOl
X-Gm-Gg: AYBFou1EvUnKe8ppjHYCm8RkPpLOJuorvlkeIKBhklRnBzBszaGaaKJlJJSB3Ubq0WX
	2RANYEkGX2Qe688qXvkGWTgLYyIu2HWrjxC8hMkg9QwS6S4iDMxLDWFbw0B1tVvqzMvkPW4q0xu
	5EDPHXeS49DcamNdMnycbtFVSao6uobLOSHpwQde+ZucYMxD9Qi1OWt50VkmMJYOkt7ERjgkV7R
	GJ14xrrNygv2MMvYQDRNdT8ibH3ZMbEYInFJC5KoAUtAdkEBPFvR3BKoL+NYgoFCoQyz707QbTD
	9LPlhbIWIEbi7hcMvPHmkWLdVvDhm/CieK9b4TiBot6GPA+6IE/vnebIEkNUCgX4OUnyhCvul42
	cAy20W6LDze5mV2457UIs6hdLHIsJUjIwjrhTMzl2TNJyGGp+blgYStNFcS5Dz7tKufdn12OBxa
	88kxZ7mSdmiYWDTV5HWVdbHpQ=
X-Received: by 2002:a05:7022:5e08:b0:1a7:99b9:2eb9 with SMTP id a92af1059eb24-1b503115942mr2694500c88.27.1794591680871;
        Fri, 13 Nov 2026 09:41:20 -0800 (PST)
X-Received: by 2002:a05:7022:5e08:b0:1a7:99b9:2eb9 with SMTP id a92af1059eb24-1b503115942mr2694472c88.27.1794591680368;
        Fri, 13 Nov 2026 09:41:20 -0800 (PST)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319d40asm8020312c88.11.2026.11.13.09.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 09:41:19 -0800 (PST)
Message-ID: <29f8645e-8360-4463-a809-da6faccd2f6f@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:41:19 -0700
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
Subject: Re: [PATCH] accel/qaic: Harden checks in BO execute and wait IOCTLs
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20261106194434.4062205-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261106194434.4062205-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af74bc1 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=_a0-uAXI4ZKTf_5tdocA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: YWFl84nKJxQ4e61vzzqSrLievKVBC6cx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfX1gcb40+H/kRq
 cMz6YdG55XmpVLJ3Zthwlhdsrvl7Z4zrA5YP1Jg0PEypOGKtI7q1tj9Mwi2DBPqGUujp8cb8KCB
 zpHk+13a5Fsmlh3cdurlF9XhLerfLfPL2ntGgj8KiWtSbodSh3RvadbA7LhZ9F1tSumE9gD28wI
 WoGkTHl1VeKtFkzhxo4L4nydbphta/mHm1P84Ab21Gyvkv/4ZY/GRE2CcN5tVHjoWAfPZpeZ5vG
 sE2lbsQwYc59Sjng99bb2BeBRPekmH5O6fiXo0DFhIbMyhqgXC02wkUBHWFHCCYT1/0JTqmQ8hM
 jXsqKJDZLDXJnLmaQO8jW8qgUaasTmxCgtQt3JpFT8u35i/kvOM792QWnD15iZhnOySYUCzv9zU
 Zp7Q6CjgpeXo+a0jT6/BFT3Np7WNiLFFmRed1Sqry1sp4L8cuEMyouNUCJOqQx8eARPQAS03I6m
 XxRyi9ovjz6bpNnMu/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfX1ky5xx7NNXS8
 z6bZoOEampqQYTfqZbOh+7sTVOuH0KMut3MehnG5LGZtEaJo/h47GoZe6ykTayY62/03zIjjZAr
 OnKpZmzzjffhA314TSIfIH+6ccWTYnQ=
X-Proofpoint-GUID: YWFl84nKJxQ4e61vzzqSrLievKVBC6cx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130070

On 11/6/2026 12:44 PM, Youssef Samir wrote:
> send_bo_list_to_device() does not validate if the BOs the user passes
> through DRM_QAIC_EXECUTE_BO and DRM_QAIC_PARTIAL_EXECUTE_BO IOCTLs are
> attached to the DBC provided. This allows the user to slice and attach
> BOs to one DBC, and execute them over another DBC.
> 
> The same case applies for qaic_wait_bo_ioctl() as well as it neither
> checks if the BO is sliced, nor if it attached to the passed DBC.
> 
> Fixes: ff13be830333 ("accel/qaic: Add datapath")
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Applied to drm-misc-fixes.

-Jeff
