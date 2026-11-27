Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772900;
	b=X0ovQnX+VQj2+g/ANTnNfiLAtFjyESbnFXeoodZuHT2RKhtfOTZBKEEcr0mS7YqbAFfn
	 FXNX8U5OPjK9PRqEn5v1NSU0dOKRQ/teEtuZONBD/bwu48w8+kTvHbCgTJZxchr00JnIS
	 lpNbrIpbyzkjqywWABy/fmSjACixZPzMjnyphmVi8O32RTjK38Ii3BPE02KyH7xdp4CGl
	 KiYhsJTCO/F/arzuw1UmJtSpu0yBLW+LOZIhasOd+QhcqFZNNWlZ+ik8OMSyKg7g4j2gU
	 d7ucAn8ZTARtdWoo3bMBsuUF5XQiKoRa4W0eKfRT7CAzAFJh/hiWEt6lNv5sSTMCYqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772900;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ab35YM3lnptTqwtYOc9MLi1LtF4BDA/SuR6VP3OwrRw=;
	b=f2O3YGZl1ROaOKyA6ERn1Nnom2FqWFtLqzefle51QLyU5uRfKcGgZGUDhXWz/nqCh+du
	 DmPyoE43EjyHpl/watkMDlQkJm3oWCg9iV2zwjqWW7nGjx8L6NJ+uXISpWxdTHDslqTdv
	 ZHNKAIRwVoHYwAtI36vYUmvAJn3soP3s8Bo3MD9w1iP9QhJ+prm9k38m6fSCNphKoltdc
	 u1TaqoRNrBsXLN43nzcQe7i74AnA0ypE+i/4Jx/rtcqkkaj9X4pv5ScEcK9zHbClXUY1r
	 N8LEuGsmDR19Nalor+wEOwM09W0s6zbO3eb2T9OP4CZFY3YI4bbhPhdCeZhJjbY48vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fZjyaOow;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C5oSXALr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281F5606A32D
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 281F5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fZjyaOow;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C5oSXALr
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GqNn560475
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ab35YM3lnptTqwtYOc9MLi1LtF4BDA/SuR6VP3OwrRw=; b=fZjyaOowGea9OJ+y
	GAEOqSDBMxGhKNfGZx7uZPHCGvgTGF7cYDktJ+48vi0QJ7n71fVLFWEaKm9b+J36
	eT8sSyaaZRkpnhur2FlvWo8rHMP7Eox8SSN3kHpbE9FxDWHIcCoeiLe9jV5HiEme
	3lywV8yDlxISOy4jsX/okmkRd79yf67B7IYkYTeeJBB0wInDq/jl9kw3yppHYZgu
	7uxSXwLFc+rfsFryUSRXbQV0ITAgQLapuEO3ftV2qg05zibPwYGSBacn9q4x87UV
	OXMzaeEAz/vZ6cF0QsbYIhFUh2BVyh8Qx3zbTtVI7shX8BkTH4/blmAOlp/Gkkhg
	U5LfyA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqkaxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:48:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f053f95aadso67396295ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 01:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795772899; x=1796377699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ab35YM3lnptTqwtYOc9MLi1LtF4BDA/SuR6VP3OwrRw=;
        b=C5oSXALre9byhG3JOjtRwFsImfkdKz+YfBXja4OhHljw9Sy/3w1onxdywOe/IRCqvW
         pCBCwuBb8GW0mBXYjj4S3mwOTfrll0/BScDexAXBHR1vETIpsZXAZXkpuqDmQo67Jmq6
         kQZFxZoKeeYe/2CossTflYtiQ3u/rDYjgr6Y7SeYckUd1fqu/dSdbSyldFQBLK6CFddi
         +mmEGt3VRzurMegvOrqsnwqiAzLQ0rPGdFCUwQfS99bFn/O9AkvdkcRz73G96gxQ5bmd
         oYSqxK8LgYANIBHkkUxqqs+8yv7vgLhMy9+7H8vAP6Y7vv1/mv5odsRN+Ktu9+SuSryr
         1Epw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772899; x=1796377699;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ab35YM3lnptTqwtYOc9MLi1LtF4BDA/SuR6VP3OwrRw=;
        b=lIW/z8i7waGDjDCv6sQoAJvQ3cG460qF+ZXo8ObQ7NGO2n/nWrFS+VeRxCeE4K5LJt
         eQjXCwiTAPGe/tpiYAY4t/9JQyhalNFFCPV3V9WfCHHKOb69/lPYu8J8NVeFcZvYPH31
         WRJZa2ugXqjqZVkVsEqqipPixtBllSvBN6AVhU/zUablWQtXaGrUCBqo75nFVnojJSss
         UVSxdgC0+GiNlYALNlzEhbcRJDciFH9pIzw7GXYTxJDMkGnxr7I6V1cxPfKwUG8tlwXY
         4mi6ELw9vxzd9mMTgUePpq8WDViFp+bONFdt5KrMfOOhEMIkG3A29w9dwnGqfJL/bBLO
         xUWw==
X-Forwarded-Encrypted: i=1; AL+hErH1vQzY9fez0b7/4OFyGgvhHqcVTfRvfuu9gfORPO7IopYKzG1pMZoB8X1b3jQAxqB+qLD2ThYVphj4ZB52@vger.kernel.org
X-Gm-Message-State: APuU4Z+pXWPVnhJJSYaebOfAiaR56R8Z3JbtbJAUH9nkLyFmPJeP5HiP
	IA4c1j2Q56VomuAWF6VklDn4JKuH7yseb1CgYjsEf9seZyOqs2Pk9+e6Us2x/ABI9oMA6C3hFMz
	YWqLVRpbFxAOOwa3XaoeFTAMrQswyA5R2RGKac51+Z5Ngk/FWt/DB/mXkPO+djlLaFOwn
X-Gm-Gg: AZFdTZfkuAgIO21IKZwbLNNCcnkMB0jyTIvqjSwRTkU/Q0qcH9lY1D0bNhHJwcIF0bJ
	byVeM2XQsO82F9mkcfb1TmpZavuoMM+FzBFa/uhIYaLX4/VB/7+CTuJmhUdsv7OSUHN3PoWsoKi
	nR9Kxg8+dP1yQqE1ra5HA1eMRZuRyUBmCk3hvn7+lOdpvBJ/uSl6uOjUbKIIjXuKDaV7l1y0H82
	j26Va2higjSF1NRyfvh03HB3wIBlLyv1W/6goQCjKb6v/ualoWcrRBquu7PqlIACJokGLVS8U4L
	JIPDMXuP3/WPoeXHP6ENDsu0ye6yLeDWLMQUbmqvgSX58Idy0zz2OBq45AQFYhbvzka0WtnjrzA
	+H0hf90YoayLlCXH1Q5dch5aN3w2iLIezjOos3TQMzlFEJp3e/6omuuMEbo3ghT/3Iva+yUo9Wn
	rSlHGxj2c204vtFQCMdl56EOODhD5M7aTsEk8GOkjTHM9xJaHP+W0aZxOS8+MM2nPgmIyDDk6lC
	Rgn
X-Received: by 2002:a17:903:94b:b0:2f0:3618:f170 with SMTP id d9443c01a7336-2f03f1acb10mr233462935ad.66.1795772898791;
        Fri, 27 Nov 2026 01:48:18 -0800 (PST)
X-Received: by 2002:a17:903:94b:b0:2f0:3618:f170 with SMTP id d9443c01a7336-2f03f1acb10mr233462675ad.66.1795772898346;
        Fri, 27 Nov 2026 01:48:18 -0800 (PST)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dbe86sm117153235ad.32.2026.11.27.01.48.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:48:18 -0800 (PST)
Message-ID: <7a77f62b-7ea3-43e3-963b-e01b86e14e62@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:18:13 +0530
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
Subject: Re: [PATCH 1/4] remoteproc: qcom: Fix bounds check in adsp_da_to_va()
To: Atul Akella <atul.akella@gmail.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, sibi.sankar@oss.qualcomm.com,
        quic_srichara@quicinc.com
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261106184312.100-1-atul.akella@gmail.com>
 <20261106184312.100-2-atul.akella@gmail.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20261106184312.100-2-atul.akella@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sijJ2ibpN5-G_vv12Sl-AY8JyghkNcLR
X-Proofpoint-ORIG-GUID: sijJ2ibpN5-G_vv12Sl-AY8JyghkNcLR
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b0951e3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=E4ycadI1TCjYcBWHacUA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfXz8CDQ9HwhyVj
 WCBjkU/baZbDdmQLSEcE13qwi2izhhdoWn/UQEqW4AXlIHBGd8vzzf84ZDZCKhkSJUd6cxufsEK
 8TQ9KqQoGFxF1UkzD/sHznnUgyJMAak=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfXxR/93BBxLGSv
 jXR05gn3SsjRedvOWNmvEZYSZsi+wZxqLx3E0Sh/Qriiq2/fWcfbu2uyJ754bduM98t+vlW20ff
 A0joNy+OD6px1MUGL7BqLV5DdE7LPFcMvTFh3+VfDCGoDgyR8XvaM3zSXTAEZDTZ3nYE95ToRO5
 uNDJk23GU96GFnK6xAYC+huTefBjvpJsTrvDs32pSl6Fnl925wzO3pBj8NvEAY9jl1UZffgR8sC
 p7oQVf96rZtExAo4Ns3Bu5ZnztVujDibFQgvEiYBn2YU5gT6SXYNCI3xNyi76arsi8g0PPO5SwM
 le7ZhX4LCYr3O0f+u4RmXe9vsf++BzgccTS1+Ikk0tv4nRUlcOsvITtczJTVphWiAFPqDzfWlVE
 e4peadEJ60WthS8KRUK80YHhK+s4TU4D27OSfaPxIwttw24AAj6goocH97/NhQVI4peGLZwNuhw
 ayUM5iBRDdhwqEZMwow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270038



On 11/7/2026 12:13 AM, Atul Akella wrote:
> offset is calculated as da - adsp->mem_reloc and stored in a
> 32 bit signed int, while da and adsp->mem_reloc are both u64.
> For a sufficiently small da, the 64bit difference is truncated
> into the 32 bit int, bypassing the offset < 0 underflow check
> with a small positive value. Additionally, offset + len >
> adsp->mem_size can itself overflow when offset and len are both
> large, providing a second bypass.
> 
> da and len come from firmware's ELF program headers via
> rproc_da_to_va(), and the result is used by the ELF loader
> to write firmware segments, so a malformed firmware image can
> cause writes outside the carveout.
> 
> Rewrite the bounds check entirely in u64 arithmetic. Reject
> underflow before computing offset (da < adsp->mem_reloc).
> Replace the addition based overflow check with a
> subtraction based one (len > adsp->mem_size - offset) so no
> intermediate sum can wrap.
> 
> Fixes: dc160e449122 ("remoteproc: qcom: Introduce Non-PAS ADSP PIL driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Atul Akella <atul.akella@gmail.com>
> ---
Looks good to me.

Reviewed-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

Thanks,
Gopikrishna
