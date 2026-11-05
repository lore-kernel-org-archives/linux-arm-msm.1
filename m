Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793914764;
	b=0JkYz3lgmU/0SHgHD6oLqUahqO9B8MCteYgVnhX0x0EWEVBnmhiB5zIrdoFnpSe4nWiz
	 WJGHgzn6Ma1v5yDihFSNSdy03CLlzXIKhJBGEnxCT1JRgsrwBMkA/KdV3ClnVQlx+m3ed
	 WR9tlY6QefFeWmJXfIt6zQCx1pejhl0F3Ltl4+534hgEtrYAqvfk3KXxZ5rd2q2Qbf+ij
	 xJREYX3EFaaF+GTNKB7fr0QDuQahzASEyEXTECHHc6tXP1q23LngR/OZSy+tW1qLSFHjl
	 bT8Xp8LQUzCMD+g+mEdiZSXZTCg1PqPR8yK4dsHOR0EW8gBqo+Bq/BJr9C4o9r7xoCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793914764;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=C/c7itDsVVLIt8oIhrEQAQGvpBCCFqMAiXSmwOS2mWo=;
	b=o9z6ljsukz83STEM5jit1PRqCUrWM1LVRXmqIZhQWqy0Bvma1ztqAwHdtNEgT26Zbbvx
	 UoB1nTpSdiYrHW/3llxpiP1UC5mL2XK3J9pJ/Khmi7fvZLcG+RsLpA7BiAsnV9ylnG8Ck
	 4y6P+hUAnZn4vgpzO0WVIkdaU42RzayoSlsL/lNj3UVd3Rmj4n3CxC7fDJIjmQbLbstoQ
	 5ExTHoFWsQLwaBIoQYnA1y2hJ+svopwMa5MP1zETCyZLXPgp7yzAReO06XyXaOaoqM4CU
	 DzU7vLGocPUwK7h1Xd7YOzUC+yslN6nQ9AVia6AJq8JcvXKQwPOMsNvF2QBr3Sq5Yug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TIOSC20C;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DXGyK5r9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B4A606A32E
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 21:39:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9B4A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TIOSC20C;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DXGyK5r9
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5L68ao1585912
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 21:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C/c7itDsVVLIt8oIhrEQAQGvpBCCFqMAiXSmwOS2mWo=; b=TIOSC20C0vzukLEm
	C29z/egWfChkQf/y89hE7R3EwkDA7lhYGQr27nLSLQ3ZBSacOXIVBIv+wZ5ZpbDK
	xN8RUmxB+O+w2JOCj2UB/Dz/D4ZjFwnqWz+I/W6rkxh0poejW+5SdgV4FHwhC/Go
	nTgBDQpv9HehWOX0g0LN4a+vadAbIFPdi5Mh2fHAUs/qbieXtJZjsV2LrvPNpy6U
	IIPy+nSxjvZqEd0bKGq+4gBFeoE1rT3zddF9RtUFGRS9gADj44VVpM2Z8UlXnfIR
	heCjnkZFOgoKkAeKCcnE/oKa4npyyajSd3QC3loIr9Wj5zlPrv4pgAcCQflViHWy
	Myq2VQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs0wg88nj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 21:39:22 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a71dd190b0so131879c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 13:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793914762; x=1794519562; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C/c7itDsVVLIt8oIhrEQAQGvpBCCFqMAiXSmwOS2mWo=;
        b=DXGyK5r9+4CcYKag33EwHSPZueOBG5AM+7f95OxKPphSzPzlmQtpUzPpYOMpIcjhl4
         43lQfLJjKLlRcbOzW7/yieSd9VsrqsgtMPeDjkY4hSa8GHDWqX26/JjTnQikSiC4KuSd
         vC3U7ghI9NYjSkyoWeMHkxYFavLhqBgZzuFxGMxpAz9hMp+gqq/R6AnqEMDYHQ5vDf3W
         8rCaDMDL0ueoUZY5xFx6Iduz7Q9l/JtOKzCj6YSOQM/ja0iw82qvu9NekIGfWzj2k2Vi
         H5bR96CBl2q81Rtf3s6PyJphZXl8XqhSNp8dsfJ8htwWvlRY+luE04+yL/n1amKtvfbk
         h9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793914762; x=1794519562;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C/c7itDsVVLIt8oIhrEQAQGvpBCCFqMAiXSmwOS2mWo=;
        b=Fh58wxnIpr6wLVYckxR6onyOjkJDjkWIF3neU3kOI4NoszKC+EoEfEQ1VnEcUuGHmP
         cpUFDdvkXBWpKSu8la955ywHH44LwtkTb7I0JajqTb3+SmrAgLvOSM0HPFAdBsMKcCun
         03BSCI5GjfKNpCCLdXxM3pcN08rzS0Qa/bZ4R2DFL1ibVKcctaLCPgXQXslmShb9eUec
         h20xBGJxMYc6fXmKI2RfVDN1th89tziew3PGBHT4QaiwxW7Wau2NuQc6NyxZ3tWvSwCF
         dMmLEuw7DsH9nmMfsbUqtnISYE28Mf2ikltJ2BDVW16Cjes53ZAJEA4bymJmAHoAAQWJ
         vr0g==
X-Gm-Message-State: APuU4Z+ljqeUO+00ysuv48zRLCJQydg/IgsUPF9Eywu5w7qPTQb3Ya1F
	gWYIT+yy6cOR1yzzIAn8LUiBWItKYpFt8MJ4+/vIugQHZCJBbP0laZNNFqhZGnc43+E43ePNBOS
	V4aHX+Ygr0hKvZlzUME1lzskp/QL3kYmn7Au8Y5WR8Yob+ZkaxfjJNFaovhmwEaNH6FY1
X-Gm-Gg: AYBFou3A1DpyH6ZbAGYDORXkLfM0eaDyPu6uECs+Gc7L+6F2qWIrjGdHxjtpjXJu5W+
	IFMCZAIkPbGur9Z+OaorwXU+VTuajCx4Nbx0RgLeIf1bkRC1xL6/KmQSaYj0FAfyDuHy9KULJ1+
	KiJzHdJSDiBIwJr38Wi4yj35nQNw0UikQCNOVpe/2uqlH+mD+quCtWhpZjWaq0NFU+3XcvnqPiO
	MO7/sTjws1/cRJiJ1rg9lSdrEGXBWSnrk0x/ijS29HVn5QkbXbZaFz3+yMN6J8K3psd9BqgDv8e
	4UsQ2ZlViMqr0wdcuKY5XOoA/Q0GVChcSmywryPu9wj1kG/e7JvNsmlC//xCkajxorCsdV1yK3t
	/TeIuKv5gr6F2olhiYMZWM1Zdkz2ljkMcijSvcDwHe9VQF61/nDmewyQD2cDqkxjzRcSxPKA=
X-Received: by 2002:a05:7022:3b81:b0:194:3a84:e67d with SMTP id a92af1059eb24-1b25d38b6f0mr402190c88.44.1793914761727;
        Thu, 05 Nov 2026 13:39:21 -0800 (PST)
X-Received: by 2002:a05:7022:3b81:b0:194:3a84:e67d with SMTP id a92af1059eb24-1b25d38b6f0mr402157c88.44.1793914761234;
        Thu, 05 Nov 2026 13:39:21 -0800 (PST)
Received: from [192.168.1.9] ([106.222.231.155])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b8822fsm22952190c88.2.2026.11.05.13.39.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:39:20 -0800 (PST)
Message-ID: <f79f25cf-4b71-4942-84d6-dadf9b5fc52a@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 03:09:13 +0530
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
Subject: Re: [PATCH v6 05/15] drm/msm/a8xx: Add missing a850 ifpc reglist
 entries
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
 <20261105203057.66520-6-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261105203057.66520-6-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wusaSIqqUAS_BLn4vAb950NEvxIyPnNk
X-Authority-Analysis: v=2.4 cv=Ka9HIgYD c=1 sm=1 tr=0 ts=6aecf78a cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Hj0ah+TxS5FywmoD0uLh0Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=7x8pgU0wZ-WXSjAT5BsA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4NiBTYWx0ZWRfX6HcBRcoyX5ns
 kDXhHQUp3YPf7+61IoeJxZI4/JH9RkeUsjrbqrNRE1WZJ43k8OSl9QhYom18mulV4tE/p8Ql5BW
 rUE+kNWwrVB+NrITv4RIcrOtXPb/4E2696TsJsQADPw87kkVVs+vDcZ53uYiGYnuk/fIVVS9TEg
 HrYltY/AJ4VmJrf7wh40d3ZtR7l1IvUWqtdhypokQJgwYeXw7E/FjPLLRbbi3z8xHsfx1Re4bRM
 Un6sirBB5EDVWod4UFRu0cbp4i2s4MwpiNMKKhvb5H7YDZK3fbaa+SQj5N6PnQfmnLLwYr1CjcH
 TqIUeppH8ckBqPfTYndkjll1bO8RjgsVG61pwCzFRyf+MHLJWdZrj4Qj8pwJGYgNQGse/2KWEgp
 eht7Dma0BYOXzG60TAkwQSJRqIwiXm/6DxJC+QPNCMExYtXGK5sM+DwUU3Yt2HH4Itpwz5q06Wu
 lj9y58QgwcIZSZInV+Q==
X-Proofpoint-GUID: wusaSIqqUAS_BLn4vAb950NEvxIyPnNk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4NiBTYWx0ZWRfX5ygiCCieLHdw
 b/QXySSSCF6ROOxGZQk5TYvDgBDAYo66CK0hDC1ogTHC73fOgDY4XhJVrMGLqA1nVFDpN3Wy6H1
 xY9v5YVyau5W5/Y+9ffBFNd7awtRpyY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050086



On 11/6/2026 1:59 AM, Rob Clark wrote:
> We want to save/restore all of the CP_PROTECT regs across IFPC.
> 
> Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> index a3eab0307529..dd1a5ca91812 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> @@ -1393,6 +1393,13 @@ static const u32 a850_ifpc_reglist_regs[] = {
>  	REG_A8XX_CP_PROTECT_GLOBAL(53),
>  	REG_A8XX_CP_PROTECT_GLOBAL(54),
>  	REG_A8XX_CP_PROTECT_GLOBAL(55),
> +	REG_A8XX_CP_PROTECT_GLOBAL(56),
> +	REG_A8XX_CP_PROTECT_GLOBAL(57),
> +	REG_A8XX_CP_PROTECT_GLOBAL(58),
> +	REG_A8XX_CP_PROTECT_GLOBAL(59),
> +	REG_A8XX_CP_PROTECT_GLOBAL(60),
> +	REG_A8XX_CP_PROTECT_GLOBAL(61),
> +	REG_A8XX_CP_PROTECT_GLOBAL(62),
>  	REG_A8XX_CP_PROTECT_GLOBAL(63),
>  };
>  DECLARE_ADRENO_REGLIST_LIST(a850_ifpc_reglist);

