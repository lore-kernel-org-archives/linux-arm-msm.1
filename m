Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795671991;
	b=c7jlp9CaOUHZxFFHE9iCkrcJH0Ae+qRvwbiajWW7X/o7eKeAihca6iBFb751DeK/gw93
	 OjxdjZR7z3j56bCTPHDYgEEAZIRRXv/KRvZh9sawJE6iT/nXNxUAEO2Pta9r2eljL/mTq
	 +f2pMRHMD0A2NfmWlultYX5NFkb4nzyrYW7yClRPsngFy63MyhoIcv23pANSzAxDG0XCd
	 RzDiLGQXxA56hi1S8ikwsMk5p4W2vSINY2M39LUGcoB95V0RnIgWfU5woWkvYXT1gJjPU
	 ydMouonhPa7Kyv9CEV2CG4g4vDKPfew7t6IfUH2tcJfD9/yrqZ42XWreGTJ4bbhuS1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795671991;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Cc:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EzRkfbSnGE4AsgzW9OkzdK1iO6kjsbcDrybh+qxoCCE=;
	b=XU/VXPGGh51Cs5mFoRTJ839E78EEphtr2FwOtBZqgckj/b0cHkg5pXQa1n71mVRA2PRA
	 /bnbirqYLFoJ47Li/290MCOYALkoXHiiWr4uuz64BdtFc2pWg3Q17ZL/PjuNHSP5nAG0g
	 BiiI9m9ZcDJEfT9eHdjukBFsDypxpkahm+KpC8AF83yzAq/75RAwskAGGG+TS9qOpkbuO
	 /N8jAzxH9y6omVyVs+PUBIYDDvUuwpavoSGFxGAH+8cr7G0ygutWHqQR+n+R4MqU2LLpf
	 2EpCZ1lQgK1+ntJ+0pC9kooq1YmdbTE85VQZOKn/5iJ+Uz4N1lZtXfbgLPuHQJ+rivw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dGHclHLz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AjpCtBWf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706E9606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 05:46:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 706E9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dGHclHLz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AjpCtBWf
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36W5S1647599
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 05:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EzRkfbSnGE4AsgzW9OkzdK1iO6kjsbcDrybh+qxoCCE=; b=dGHclHLzI850Hspu
	1TdBchJmfOIflHZu+5SrcJsVIVYPz9AnWcG3D+8fRkIWirdwJTGU5ubCHOoYoPtR
	aP7u79LlcIt50h2MmsOKRyL+nh8X6/6fZbWRAHN6IlH8nJBr+Biw8Vp/CQ/jo4zy
	o/YJHzH4qwMJVaUK7TKJ7QIfuf9DzOC84Ib3jq4JDruGmHvMh2jafk5Gf0q0G1MT
	dnJN9ERCaWHF6RF2bU1PzQp/SxXdmdLhQkfwSKss8xalYI6ETtbdcUa0zxpb1UnF
	DTMPOKPvjUMJMb2hMawQ6z6glpq1SkaA91ujqtTrarXnxUvPl2jvGQcyECr4xc7i
	1wteqA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahtw8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 05:46:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b42c3dba96so7644105a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 21:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795671990; x=1796276790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EzRkfbSnGE4AsgzW9OkzdK1iO6kjsbcDrybh+qxoCCE=;
        b=AjpCtBWfymD+Au6hBB8IABhVfdoXtApE17sZ1SIVBOfiFVHCPS/1QqtuOzgpQWBaC+
         7tvFCBfE6E546QKCDnshXQwUDtKR3CQXSBsKlJjgiht3n+c+DVwEAWFSE2zC1Tzc4D/v
         bUoA7Fjnm7J7hcZrsbyLzDLjRtb9KEhiBiDtmUj6Pl0GUds9ebAZ0i8U8Vp1Dhb/7xV8
         E1zXCFO0Imj4SJ1dlC9rl/4R1AzLAQAPsTqC6j6GFZVyvP4rQfTeeyPZg2OeuISA6Mg0
         kuv4gFeTDtPMszOz3GrzW12hA9YdvtFNLiIHMcdZCfpBzAxB80PO2pyxhUbneqZfBJjs
         dZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795671990; x=1796276790;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EzRkfbSnGE4AsgzW9OkzdK1iO6kjsbcDrybh+qxoCCE=;
        b=xPVsAgu8tdnFeaKdHlVB30PV7VUmoOywxiFmexhFYJOeCEGpX18ykoQu19o0+hDzRG
         DCKi7wVdGNw2BrZiiwLZXrBT6v232g1gpeFopZ5iDTDrLZT7zBBaVY9f67Ef7IhgBfBS
         iRhDLaBWEyamtiM1Kh2iLdtWPu6AcH3CoCo1c+uP9RhYwJAPtEqC33yfCfcuwnLFH3sn
         V8CaGaGYnyfO4uln4+uh0HHsBV9V2QaH4/6QSlWnejMxc65sglnLHpLW1ewBsvevHzAw
         ZNwOZel6TBKyjVbYkYPk7uEXXP0wtFKJgQ8rFmyVUpiLi0x+wL4zrvBSM8Lyo1nAJLli
         hfig==
X-Forwarded-Encrypted: i=1; AL+hErFZ9wWg0jXYazFOSPqqoQuu9qH9BCGyCJAMaKicniXnd3MEDyOlP1Lxc3aDJDady3W4KBvc5En8t30Et5dZ@vger.kernel.org
X-Gm-Message-State: APuU4Z/HdUP5BODCBuGJQLsxoGX9og7vjKYnyKROybE23VosFi6FZY0u
	crUKF/sz2WKP8CcDG/Ogqkou1Bp0TAkMQ8ns47q6VU0SNUQAa/6QnqdbNVX31FBRnVX1Sn6M9sb
	7dcoXgElFDmKP1YIvDeTVbuTiObUxMHXSG8v7hfqVbhLvS0AONqA4Sm/m+5656J0SusbN
X-Gm-Gg: AZFdTZcwnBHLsL4DnpUs4waar8wnUl1nW66BRi5vxPpUW4yA0QStirxjDVJUo1nf4Ea
	ZA+RX4C5zdJNa3dLDW8aZ+W2VhIxP6k0AxBbrIFE0/4/1Z1XniowJv/WHwKmH+tYjdz6LQY6dJH
	i7jhV6l8io5URUKAllpHC83PcMSYCahYdU6XOWdPaXTyDqDsKeTdDRI5KcZSUNnPFBYc9SbGLqU
	i8BZrGYuSjG8UNxb9aJDYF7HztXcqF4/Fgzksb7j+XW/6uUGENkdwsbofz63uuYEsYlmXz8Xq0m
	HZc3OAV5oCNToW2XCuPeEpvT5v5p8NQ12F+mgMY/32bNJnnlqLlpOEZxj+TSZHVi7uRGw7TEPa1
	IqdEMhFV4gy2P4XArfmnEZ40q9RvJricp1aLuAYdVmKctTCo7jDHJYdM0M7rFYq6LJAcqEDSXLF
	LcHgXLCi9wjqmSTwjx+tHiKUyjfXiKV+QSzdEw1Wo5nX8=
X-Received: by 2002:a17:90b:2d8a:b0:3ac:450b:164c with SMTP id 98e67ed59e1d1-3b41c96cde4mr20837126a91.47.1795671989893;
        Wed, 25 Nov 2026 21:46:29 -0800 (PST)
X-Received: by 2002:a17:90b:2d8a:b0:3ac:450b:164c with SMTP id 98e67ed59e1d1-3b41c96cde4mr20837104a91.47.1795671989445;
        Wed, 25 Nov 2026 21:46:29 -0800 (PST)
Received: from [10.249.29.132] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8ef99sm31772158a91.12.2026.11.25.21.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 21:46:28 -0800 (PST)
Message-ID: <61b5252d-151b-4a6a-8ab8-28bb94583ffb@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 13:46:22 +0800
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
Cc: wangao.wang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/8] dt-bindings: media: qcom,hawi-iris: Add Hawi video
 codec
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20261118-add_iris_for_hawi-v3-0-51786f6d4057@oss.qualcomm.com>
 <20261118-add_iris_for_hawi-v3-3-51786f6d4057@oss.qualcomm.com>
 <40185500-441e-3706-b68f-188a55b88014@oss.qualcomm.com>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <40185500-441e-3706-b68f-188a55b88014@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bJfz4zvDnxhQDd_JvvnJRcR40U0GOt4P
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyMSBTYWx0ZWRfXzT+Zc44ReA6j
 +A9W/j203LMoAzQcYSPguIDa/6pfPoPqF+Mw2TN36uRPqM1iRXBFEKLZnSdhmvFQzmwC7RDzkmj
 RIiaQ0zY6bK5Lwb1qgVu+lkZEDP+Lr8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyMSBTYWx0ZWRfX4Sdojgu0/5Ml
 Mi3bHh1iE3mKDSo6UIg7RkuIwsYEI6TGZpDhgPrW61HIvwRd9D2SLOSVU+iq44DipzxiWrIS4ON
 8ktMzXEYqaAvqIvrdok6ZivJesxwOzp3HqjD7YixOdg1sg8O0jpKtv0FtZg7YA0wZrBoSn2dQMM
 agaFgjP+w50zQc0hFy8qX2bQMfXV8Pm85azZUPvrbqet8z+aPDvOMYaXXoiMzwMWIi8jRDSaWIk
 8FIeN2Tt2pPEDzPNOdIro81Gi/fuB4GH8xcb4iKInEzzpHZE9UmxEgelYGw054i/EocnyNhkjen
 p43J/8Pc3yj6g4wxH6YzjYp3zX4UT3qJSOa39WE1mMXERZlMbd2HASXOYme9LXUZdyg5s2W+wdP
 CKJ1bT/Rx/fJLGnUeNDw8KbImskj08gAZRF0lYwXeU0tTh+37Bv/38eoydKFldpd95zD/07Eu7q
 4iehOBy7ht7s/jwrB5w==
X-Proofpoint-ORIG-GUID: bJfz4zvDnxhQDd_JvvnJRcR40U0GOt4P
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b07c7b6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=h9KLfewQyvMvtfKxVGoA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260021



On 2026/11/26 13:43, Vishnu Reddy wrote:
>> +
>> +  reset-names:
>> +    items:
>> +      - const: bus0
>> +      - const: core
>> +
>> +  iommus:
> 
> Since iommus has been moved to the child nodes, it is no longer required in
> the iris node.
> 

Thanks for the review. I will fix this issue in v4.

-- 
Best Regards,
Wangao

