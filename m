Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956544;
	b=1aIbXbtFDK3X6aNtbfi09Iw+hxxfyJzgRnnHMHN4/iyvXyflLXdyFaCzpe+tnWZC9qLG
	 tsMHcWXsPx7wk4UZxN5j/TEUcvQK6emPTNjLMkQ5iwV238Y00CVVvNWS0sAQXRSITTpie
	 /ayHC3lZThIcIrV3J0YQ1wLNJz6GQocdAQGI1WP8XtBO3M0YTJlmR/9CVvtA3x3WeJ/3O
	 +ABJYNUd9YS6ie2T43I3Q35HKH6ZSBFCZcH4PBpILTId04yElD5VPcFBleuwcHVfJDrGI
	 mErcZWF7Xuj9x6bKaBC/Euxj8BtmI6j51FmalDRt0uTXxkocemfEgDHvZtXtnadKB2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956544;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WOvgA3Dd9qL5xew3nXRI7HiQdsmXf/0pyYG4MlTBi3U=;
	b=o4Cuk1SMkHetuatr4Z5L4ymV5rXridSEREfSLgxE70e9j1II8W9rKrDozufMVHXtodXM
	 Fr+GhZ5auBDHCCzwBa4Jfc1XdSajX8dCFVcT2/sfHqqwVjy1vQb34b/g2jVm3d3vW8p5T
	 GGsUOx0CvOTnkwLdIpc6Jpl7My/J+i9jqQLkLqe2u6PRZ6NKGn14tE/PNWYTN6LK8zsPR
	 3zDoDWdkPKCo/XpqkxQPQkdscT/LiC8Zaaf/FSxPo6tbDWtcXm2M67cCC7cvRyU5rZZrA
	 NT1LF7kuGkMLqkJqugU9mTxoNFLPA5+2DlzV4iLO4n7x2LLw3WCLJ7xDOizCAyeeOSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LWd7RSib;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WKbCo5XP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9252C606A326
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 09:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9252C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LWd7RSib;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WKbCo5XP
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RIWZ1679452
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 09:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WOvgA3Dd9qL5xew3nXRI7HiQdsmXf/0pyYG4MlTBi3U=; b=LWd7RSibu/BXc8C8
	1ooN4oJSnFH4vqexewTRgqXn8C9MFGV6nE7By94Q9Mz5Oacun4yMVGsJXx4foTQK
	8sHtWNJAjUYkIKGVtqGc9VNLBHgcJ+8GiX5mhfhLB+kEC9mtfLiMJToHXgsYFyoA
	JVqSJCp3Q21+LuusrZFHvtQhW0+tLFGmFRHz/iGcUr1U5SJt74jlKs7DpBrb/TSn
	2gLsdusz4M/J0NX5c2On3J+UggLPJdnw8XmIdQbOcE6U0FSG3obpCqUGfdw9vTSH
	vbnGMhDCDxcvW/Bv4wv071Akcy20c7IaIQo3hmThg7ZOuDlmn0/ke71gtGvN3+c6
	NhmTUg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pca220-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 09:15:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1440e081so11364785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 01:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956542; x=1794561342; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WOvgA3Dd9qL5xew3nXRI7HiQdsmXf/0pyYG4MlTBi3U=;
        b=WKbCo5XPXIEjdxlIYnBaOUiDoEmEKjmjvvWxuZMgrUjC9eAkZQisCkbblfyEdOrTns
         3kSN3mC9RI2WaYqv/R/65smcPM3Ju0mJCqGuWGlxaVY+/vuT+R2Oy3WyHbpmtbi1OwhQ
         SJkoLbgqY33RO8qV6241MR8+Zhyyadd+rVol30mENsbqYZGvxy+3X1a5DI5wNPAj3Cjf
         /wG1wDOF+2FawmdHMTFRwiKha9+OmiujOkaDstjKInGqCarBJV6SNHltbZ+C4XfGqOzp
         GWsZFBFemiBB1IlLHUFkmWp2xiLNRugaftfiE4hURu5R5hko9i7OJ7ZOukd2gLLxSzM3
         hcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956542; x=1794561342;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WOvgA3Dd9qL5xew3nXRI7HiQdsmXf/0pyYG4MlTBi3U=;
        b=CmOVz7J/DjzCeiKOZLkDbrNJZdnZJX8pFw7H+hc10d1TdBbkD4nRWhMIE6OJgnCjnC
         T1DuXqIRWCtWojw4jNdY0uinnSo/LsMKqlJcjqHfcwI/peczuZcEb3PWo5T/0YwIIrWB
         0rsnNdsipDskH7gl6OjUGRZeb+pzYH0t9Su9ocRT8ADtwadmQLjrGdIXJcObuQilEoKH
         vSN2FzIIyOaROqYls/rsthz63YDl1DU7qgkopuPdcBqcTnC2T5dE0gNol3BpgKCaot/N
         4aGvpQm5MxPt9jVcU9k+Xoj6rFZ/5bkxYFV2XEADpcAB06ucq8r/EA8MxvQq+5FofOR2
         BpLA==
X-Gm-Message-State: APuU4Z/G9UDs5Ng19jjeP94hq3Oaw7Zevi24HCuVtbGMHL/CVr0DYO9E
	YLz+iL4iapsdu6khNqiZXlX4PwBuowCMlvIU5wBQR1tcesQsU8knS8sla8u6TTFmMdI3gcYy/af
	UizWjwE7X1hhVBuIQXq5MerwM54BY0JGL9Um98nlfI74GD77L9typYqNHbl24vGtwY6vL
X-Gm-Gg: AYBFou2RE9USFJEDYTZNc5vHCNY7bGu1WX0FQGRHQzGc/oMSo9+pGLfP9QYEWxWDRA1
	oCVSm0GMy1LQ8ExjgJ8nvgQ1e8X2NWfyKFc66nSiOOyLMDH1Rz9wD8f4odgR0c9891xNZimqsbG
	Ti4dqjXXnAXKGKmOr/rSp9qCma2amsPWZBlvINgCE3n126QNb59DzHhEXIdlVDN3k2zgfEkn1Ez
	cH+JvAMe5HL/9zquTT39O3mEhDYZLkCfEmB2ZXLTwvtbP1YlRKOT5xiNRKi/0QbTEkKPyTaXwQq
	T7TsWdPkOE1cBcfnwtU8ooHglALK0z8m5u1pKOad9KAj4poeHXWqfobFKZucC3VjLFf+Y6iY8vv
	pOQUlDcEaz1aVba+ocAYqJNz0Gx14i4fOE0mvToCpKNi9DNhtch15EgOasFJKGAAV9nlP
X-Received: by 2002:a05:620a:a994:20b0:939:8148:1e3d with SMTP id af79cd13be357-945f33c0c23mr263240685a.2.1793956541158;
        Fri, 06 Nov 2026 01:15:41 -0800 (PST)
X-Received: by 2002:a05:620a:a994:20b0:939:8148:1e3d with SMTP id af79cd13be357-945f33c0c23mr263236885a.2.1793956540624;
        Fri, 06 Nov 2026 01:15:40 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3569e9f7sm61637466b.51.2026.11.06.01.15.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 01:15:39 -0800 (PST)
Message-ID: <96cc1074-9e08-4d72-8ffb-598e120d2055@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 10:15:36 +0100
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
Subject: Re: [PATCH v6 07/15] drm/msm/a8xx: Stop getting GMEM_PROTECT from
 nonctx list
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
 <20261105203057.66520-8-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261105203057.66520-8-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iV5Y6FbxqNMlxq5-qJaUEnRL1FM04Jrp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNiBTYWx0ZWRfXyH0AxrGsSkaU
 D7N2Fp2EwSbCk8WIZkaPy+c+Rx5nFeFzoPi6oISj7OmcKAENcl1AbPX0vYV3/6T7pepWZ0BLpjk
 bfoYr5zYTgy/bkMhNHghqOtnXfhkHEP3I/O/F+7dpkBmhzeguH+KbKqbsyum/94ww+M6ncLdbeF
 wc1JYpKQc4X4pVfmQAwIq3ddfrLnYerk20c3WR60FVJhL+5LKBCUAgqYD4Ppf3ggIlv+mpFOmoA
 peqHvo0HKH76/3YdxKn8Opco4W1he7PPb9pIYo+ywPIy0aRIYoT2VTNLcfcFU3+VBYzHzvizc4D
 ikwL9htPD7Bt1XRcfL8qeeYknpweAdIaoSM+x/w5UzDVH5SyNQh/qTP0Tw8p/42ml5hcF5vz1YF
 y7IAb8XQ18HKrS+n1PAVUnM6En4a4Xhh7lSw3p7fl1Qj4eL7Hez7nM0LRp7w8UrBbUek4AdUpo/
 yVuIvi6+W7mKV4SEKsg==
X-Proofpoint-GUID: iV5Y6FbxqNMlxq5-qJaUEnRL1FM04Jrp
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aed9abe cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=J6-XaVkY2UlAEipWW64A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNiBTYWx0ZWRfXywVDrd6YYxql
 umaitMWbFYNObNncQpXB7Ae6tTOF45DiOJIa3vsve18N/KcTDGL6TKjzqh9ii2g/hzbKtmLqd/p
 0FPLr2Y2RYnT+s5XauaxbXzzDwX6tFM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060036

On 11/5/26 9:29 PM, Rob Clark wrote:
> We can just simplify things and calculate the value, instead of manually
> adding it to the nonctx list.
> 
> Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

I believe I already revieed this..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
