Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217672;
	b=1G0JKO7WrhSrfgga1vvsbV0RHGyM0GKEUaXU4bL6yhKUGYDZPs39CkAgMdItsTEk34a7
	 QzP2z2QGgBijA8Uo0LSA51uyepOqHoQoFMg7Xg8ZWJ4LcPXvAkL6LYSLRh+erst+xtpAS
	 StM3F+LUm3WcYaW83QLiZwFaf/C9aAJVWfQjkeBpAjpWFyOSj8rQ4fWi/FRQLEKzd/QUS
	 TpGoxU+2vIv7kGKPi1XyU4pqUXHrEeGeMCIY+aeJocK/0HstVaLHXOHLEuxYipmg15Jep
	 UVrTz3yffDv7vZNqKTMVhpQXJJzF3mJJPJwyCbzqaw/OD4zeua68JXzlcQDFdx20kkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217672;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/MuvRy7zEJXFRemcf8yZdEGXo8yEHmsqIace7Tdejtc=;
	b=0RETLNzdYg1pq0ahz+HUyaNknkckjG2R4TUzcj0CRZg5OpYsXFG+R3g2+r2VjThE1qBs
	 CL1VvnjSvm+IlJ6qgdu/EjU0wH8BhGpcu7CS+o/ePjCPE6Ks4lGhrxxJsSj7BtCxVxgiX
	 PduAAHvpfVK0NohHnHqZBwRSM8MDAxqpkQNRGwWJ/1PSlflAAzfql3JZGMrqPDQtIPqww
	 E+bP7r8TjdNiQ+YXM+u1O8dqV3SrbjTrAntlwdavTHpFUH0thd4DmB2QslmAzy8oeemfr
	 ORqYWSJthnqSNB5AawAvg+o9ngXiMbefYY1s5g+3/z5Nr8WE/9WKSaKvf5E6utfeeqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TF3z2FK4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AFH7bDTt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D91F606A325
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 09:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D91F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TF3z2FK4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AFH7bDTt
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A97p12A3325174
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 09:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/MuvRy7zEJXFRemcf8yZdEGXo8yEHmsqIace7Tdejtc=; b=TF3z2FK4T2A5Kr9G
	+XTpVvYhi+WHo5dPhPEe/AWDEGWEAyTUr1RmFvLPB3kyWX778Y9ysRKuE8bVXu8b
	12PUsIEGIQqp3V0ZrvmAsTwzTeB61FcBq3PA8kHJrLsYTE+aDaKimAjtL4zBrc0y
	rgLwOKr/pseMA2LU7j5NzbeAdPJkoLlgZjjqruhZvG13ELvXpjZ50VIbG9fWqyk1
	obeg6eEplo1f4VIHC7SjYTV7gtDgWjxj2hMMxWwL5jUMYJrUHPS8LN3Ikb5krBou
	OxbJyNUYiMQZ1mqfHgpJJCLfV58UedNAyy4FNV/rGjjF7EO91r+DFiz8C5UZ5pVL
	JfKuTg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua588ctx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 09:47:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e629c7b16so17468285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 01:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794217670; x=1794822470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/MuvRy7zEJXFRemcf8yZdEGXo8yEHmsqIace7Tdejtc=;
        b=AFH7bDTtmdbecSsy/AJIkub1FDtVu1rp9iHAiTg3qHVF3oS0jjVcQ9Z4IUXWthFOSr
         tNbBOHS1a2Av7R74zXvhKwbRlh8hBiE1Y8HbA2pyOnCyW3trHcDmMiqx1RXcJqJjI3AY
         CMu3S3+ULEtlATTEO1LII3ocSiNq18skrr3FIvavdFmjS8tzJ42/LuopVb6C55ptUaQm
         OhqXqLTOQ/w5rHcjs1OMzkyoWyv1f5M88IGtMNwq2bIRJruS73SPTgstmI52wM75CWrn
         Im60N25Et5JxinuoSEx4ymMwOLHf3uaRqNXXNEIbSCqQFgIsqKHuRq8Rf+Cv0zJLGBQM
         msHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794217670; x=1794822470;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/MuvRy7zEJXFRemcf8yZdEGXo8yEHmsqIace7Tdejtc=;
        b=f7uv3BVrbM6mmYokGE1F+jmraAFSrCDJ0x0YNRTbXxXDy+6f1o9ILEzDXBVk7RjfRH
         6F+QNqMfsbya8OEig/1AYSvkFMVWEg6PK1hU8dQ7omk9gwk6pwpoirme0AM3S1cdq9y3
         V1zdzJzVabEhjjdCcZKnK4I6uhgfA/On1YZXjQDFqHXhqUJkOxS68eiFECmogzzEa9PO
         V7K/RH9MP6Ci/umEKIr513MXlnRJdmkZ71x/1Lx4xWRqae/B9tui98NOlXdAhhMRxzKk
         sOSh0Fg9fj+CWEfpS1mMNwllH2K4gTImVSgH/IFJzrJV1OpYpGVhxjnfHTiRX/y7kum0
         OnUA==
X-Forwarded-Encrypted: i=1; AL+hErHJSQr4NIFwgGhHHxAw7VXGg29qNhLhOpDR97a/V1HK6EZBbKFGyoqHoOIhTaQ9l0VC1+MG3uZI18cUKwkN@vger.kernel.org
X-Gm-Message-State: APuU4Z/Za66tRhrZ/tIj78xznBlkU8zyQXl+kBq91XU3EFvIqpF/01qH
	Omeezq4Cnx/cPjFt16qjdv3bO7YPuElYFmOpWuNOmq/426eHQ0SqHv2Zxy9UGxgJujUNRbv+MmW
	7gNFNdN/+yHkBuhPNBMsxKw6lkRGya3zov/fA/9JIjkxaoJRe/bu/K5Qetoh+5pWCB9gZ
X-Gm-Gg: AYBFou3MMkxUupsRrYISQqu0pbJyugdoGBvi3NYQrG12JGegMcTVVtAJkVTn4G5joJw
	AC5R05yTkYBHnp2XGh8XL7dTn8DBNPNulGy7oCpCH5wupGMztqVnqlXIQC1S9PHFE3+3tRXplY8
	88As9XhXyiPNTjYIHTJ90jnmUQuK3OVqHy1r9TaCDZrQ60rprnHNsRmCxiZnEHS1r2Css5CZ89Y
	iOnZ6etYEErXwD50QewfV2TSaGZ43cfIy7+3A/aRVU8/VVALJX4TRyN0lEuE33byjXfHUoQzr4G
	nV9Rm3Hp6hdyyoiT0qw1VJ6InaEX9GUBuKC4ISLzDojK/PUHbTq3HYfnYHlquvydhCAAT98Zf6b
	ylhJjqX4mKLIfKQ5hrj54Jlxl4qR5JM6VB5Mcw7sZ40PUYPL+93hjMHxMAEV8Wk13ZAJE+g==
X-Received: by 2002:a05:620a:a8dc:20b0:93f:977:5d9 with SMTP id af79cd13be357-94783fd1f1bmr503400085a.0.1794217669523;
        Mon, 09 Nov 2026 01:47:49 -0800 (PST)
X-Received: by 2002:a05:620a:a8dc:20b0:93f:977:5d9 with SMTP id af79cd13be357-94783fd1f1bmr503398185a.0.1794217669064;
        Mon, 09 Nov 2026 01:47:49 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a475602sm139052866b.47.2026.11.09.01.47.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 01:47:48 -0800 (PST)
Message-ID: <8f5a4017-8503-49b5-8f89-b7a3a7145838@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:47:46 +0100
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
Subject: Re: [PATCH] firmware: qcom: scm: Detect Gunyah by Qualcomm's
 hypervisor UID too
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261109-qcom-scm-gunyah-uid-v1-1-2776343f9a3b@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109-qcom-scm-gunyah-uid-v1-1-2776343f9a3b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzOCBTYWx0ZWRfX7hkSHR3oo4Ql
 ZeBvjdMQv5UiDYFB5pO+99drJmtRRFKRPMhQxyy2Yr+7CIcBj6N3wzEgUsOk5SRIErvKQI0tUuK
 QCnMjt4crSbvXPftpmFXWHa6DXJijGUGlN0o3W/8lCVlpkQewZfkLKqvcDVbkBeZc9vROXlbmxq
 Etk4M3KbOTvRZY/jMQgbMtavo8ENZUyNOfNkVr2lX1ndsWvLUvgTYSxSUIVVnDGA5jBhgrLpKts
 S5Ib4QHVj1hRMPdu3MxLyC6wDQPbil07tVMsN71p3O0qNpwd8IuPewHUFjQVIbQsf0Y6mKBNb8g
 ZIY6hgaMSf0Of3ZFDVenRAXdFA0qJWXXMlyik1lBuFaswgx0RHlhFIR9oKmwY+WJ8Gh3a0ZV39O
 BGtC/6g6JLNvnRyt6EZaS24BZNTxWEh0QPRtvr56BL7gCUbh56rrsI85kJV+CnNSnJE/ub3oiTn
 LJaOhMh4b01gfk9JjZg==
X-Proofpoint-ORIG-GUID: kyVXqYQ703yTxk0UQZOaKSsl9Udb3UHw
X-Proofpoint-GUID: kyVXqYQ703yTxk0UQZOaKSsl9Udb3UHw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzOCBTYWx0ZWRfX4AWzuexS7jT1
 TM/gikCXZxcdxt41Pdi42VS6MZLARt49BvnILlqBCAdNiMiOAsX4fyaElyUxFfy7Et1UEqJvvj8
 zqgRG4aXE+t99rbpjXzlqqSz+tTA2L8=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af196c6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=BqTCDE78pFX49Jf4NhIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090038

On 11/9/26 1:30 AM, Stanislav Aleksandrov wrote:
> qcom_scm registers the Gunyah watchdog only when the hypervisor reports
> the Gunyah UID. On the Samsung Galaxy XR (Qualcomm Halliday), Gunyah
> reports Qualcomm's hypervisor UID instead, so gunyah_wdt never probes
> there, and no other watchdog is available.
> 
> Accept Qualcomm's hypervisor UID too. gunyah_wdt still checks for the
> watchdog: where the hypervisor reports this UID without it, the probe
> returns -ENODEV.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
