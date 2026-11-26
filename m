Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706665;
	b=awWP1G3Xy+QG9BKMPIsEWcSYlRbI7zij4ftePiaO7ysPCAZ+0nD/tRL5pqgBTZhKd8c9
	 nBawK7GKqfl55IroqKrSf0hNZyJdMeO1R+3hvF7kSMoZFahRyJYLZn49dxUVmVpnsnagB
	 0KMEZTOI4tBm+cfbID3f8EqY1p3CSab+fNdx1dMllBI0Q7+lyL1XsFC57yhq263+nPaLi
	 iXE27Iobkt3WWnNT85OuuCvB2eK0/K3C75U24w9BdI/Tk5byxjZADlr9FAq68D1sUB6AA
	 lSsnkhA4CdWQiMF+jqQ8eYEzZ5Cta5tGVc1/273n2/FbNerLEy3fKwH8o+l8CILXB/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706665;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ddeSWRJiwf5WvSlmpCixetWSsoiQ/GzJgm/q8yfJVbk=;
	b=ieiluQJ/ayBS+fV4uegBU5CfW+DwFfeIjCL71Jo11Gv7a0OZ7SgPdZhHD85i6wL/gVLM
	 xzk8GbQ39/CHFW9sBry6Ikg71Z1wG/vnXp96S0lYJ9ILedhlpvh5FNY3AtP/g9/yMYTrP
	 Ii90jb+y0DWdomDIll2vY6MVNMrIS55njGM/5mgOCI6H6jIhJDlYI/SJKiGQ0B1EOOIiU
	 odMtQIDNNAqOhLY+qPoF/3qwsm6FfeUNQ3M4wl8ybTTvCv+wAbEi+D/LrpqVBC+2qqfQu
	 xVO3J4Kkz85YCU/aZ6TUfGLvBWpJjAUtF4PXLu23RWThZSEZtLhim+GixsmMeCTVT/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HMZn3wmA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ECnW0BvP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE68606A339
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 15:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACE68606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HMZn3wmA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ECnW0BvP
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEVvEE1022140
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 15:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ddeSWRJiwf5WvSlmpCixetWSsoiQ/GzJgm/q8yfJVbk=; b=HMZn3wmA0wZXV+co
	kEEjut5SBIKnG2l8a3tc0xXzgztLSWul/gruZ4XlZRK9pF03iIRt5qCK7iXnp3mp
	gHm6XD/2vGq035joUC5QBAxbk3OgBsUB15/pZ838ic+KFyATqel+3QbmsAiXy2K2
	i+jersnRlrp8NLjGlNIl7RE87mNML1FUUPWu5qU6YwonLKxE0riJTRFM8G2rcMST
	u4axiocEu6OxJujgj1+i59w4egJPevhilAgCGF9KzN+nvu9txF1xvzo9HKlV/Fra
	cwDpPa8qceF185j2aXZQAtFqbh670YVVb5ChPQGGhzMRddpqHjBFS4PKj9ccWeWv
	19r/Ig==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6gne1ket-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 15:24:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93edac5877bso100753385a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795706662; x=1796311462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddeSWRJiwf5WvSlmpCixetWSsoiQ/GzJgm/q8yfJVbk=;
        b=ECnW0BvPj2WJs8CFhKhE8CLSVmm+PMeOpBNHgOLbSLvhO6Y2Pk5ycmEXxAitFOtGgI
         2QASRdQKskkfQzPEQqTRy4qaBYs4m2iEofsMy1BzY7z1LjPgflkG5ijgkNwyJvSPE2mq
         +g9VJevZzDWSsWyXA/7iuufzhVhIISqS+VTEKzk55IbIYwddwdQeeDqgYOMYZkyceAzB
         gIw2Ewt+LIhfzhrOgLjLdpSLhkrixvGk9wMAwxRHqwCOJlAGQolyCNaGULaFYmmjalZY
         mS6Mbjqx1gRyZE2msmiugVcTNxIXrutQOZJqfmj1hjSwJzSANikCl1A3jzzINnq67VOR
         Iz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706662; x=1796311462;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ddeSWRJiwf5WvSlmpCixetWSsoiQ/GzJgm/q8yfJVbk=;
        b=yXdK58NkYsp24ERhLBtqu+2l/8A/38Evbyd9WggYCpCtSSsJP93AUPsmtVPuBnqKeI
         v3rzS6aDvcd7eGcy6QMCqwWjAgOMlms+1xYmHkyV5xQ4UcDDA3i3zsTuUvbht5DD5wG4
         HRBq5yXzxuXQ7fXOTH2PJ37fKCNGDPnK1G5fMI9ayUPvG3dPKAvM/b+V7bxFaBrDGvkP
         /UygbnOkrDo49s86P97J7EylYDX53BIBKf4TcxhGqL4fppyrrCqtjNMmaPXGjx4KTgy1
         CHQnj/IYRs9HcZtZoovkjLFfBBZAkdWneZ2GN1jTV/JKguI3WoVTYydkhD+GLum4TiIW
         A20Q==
X-Forwarded-Encrypted: i=1; AL+hErFJ3gkgk6J6UHlP7UYPq2PShZzz4986RQcgY/KWtICtzBuBA7CedK/b2F+dWjoRbEqoUoPgZLNhAusWywxz@vger.kernel.org
X-Gm-Message-State: APuU4Z9U5JI6a6+QPPqzIwz9wD2A/OyX9hRV1NBBFpgkhenfqvfkq+ZC
	8TETguVIYI3fJo3RIO/RFr+56qywRjKQ3LI5u/S6rzh1WMNAxwi63L9sqLnvhuxfn7+S3ngrMDT
	7uGsj4LhGxlx9/+SeJ49D6tdzmO2mAznxubChbFozR+OPcSDIfETs24jLbEc8h79/SVku
X-Gm-Gg: AZFdTZf435thfrvpud5BxtodGatPR0LqEVXJQxGeVJ5v9wZm1C0QH6IYopPmoLYFPD/
	n5vnz9iPGpR64RtE9wlGgW8VdVjwwa66IdyGgs38DTHu2DgslOlOfuVVj9xxqkssas7tXZNkwcB
	sKgH3MUAkuuzd8wxG7AXQk4kSmTQF0WhiiMPYSxMRUHlA6r8BWX5Nt+QXuF4b1vEcz9VQ9qz4xU
	JJjwiiA4Rbmr0S3+v/TDrYzSrnuWTwX/OCwNEWbd74wP/NZNAPQU/3NKSuQq+o6kEuc4xU5sq0Z
	kZdN+T0/+KFUL5uwQNOf1xnXMInqw6wTiQO6TufH5jQiasL1FfmvF0oIDiYBUDcn2RO2FTgODi3
	Pd1SRCQbaBKxPxqNy3hfPJVKty5ww//2YSvhVO6T0zJscmYRY/rJ9Xs1U/tJYkuC2HBu4i00=
X-Received: by 2002:a05:620a:6f82:10b0:93f:1eb0:88bc with SMTP id af79cd13be357-949ba7fc843mr3540534685a.1.1795706661809;
        Thu, 26 Nov 2026 07:24:21 -0800 (PST)
X-Received: by 2002:a05:620a:6f82:10b0:93f:1eb0:88bc with SMTP id af79cd13be357-949ba7fc843mr3540530785a.1.1795706661313;
        Thu, 26 Nov 2026 07:24:21 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae6872asm744107866b.13.2026.11.26.07.24.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:24:20 -0800 (PST)
Message-ID: <9bc0e617-6840-4be8-93c9-3a4429bfa3a2@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:24:18 +0100
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
Subject: Re: [PATCH 1/2] media: iris: check the packet size after reading from
 shared memory
To: Hungyu Lin <dennylin0707@gmail.com>, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org,
        hverkuil@kernel.org, stefan.schmidt@linaro.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261117204946.21359-1-dennylin0707@gmail.com>
 <20261117204946.21359-2-dennylin0707@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261117204946.21359-2-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XpVvqlF9 c=1 sm=1 tr=0 ts=6b084f27 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=s5JhuylEIwHktN9E_WEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2MCBTYWx0ZWRfX6xikgUqySOxm
 d2+ddCuTYEZA3GnMnXJ1q4Sz6JodCVhSCeaKbgNe4zwPdCqqC0C7j6S2cqDTDelT6pUhrqyso2j
 GlPwmnUZpkRZC2Q2I1dDdz8yn9P+zpACfm0AfJgDG8n/iV+BHoEJKD5dmOID3mcYoxAtjprUbgy
 WNKRSErSjWb27H9qGJgwl6rHr50l1IwfZhNfcSebQ6gTXyoefrLPBhDtyav/jOaClB1DBcWi9Hh
 LloK7ZYKZcbMhtKCahiYb0ae+4UAMlIH9sOimyUlaYFEQpvUXRrL9caQfYeIDjYcMMItxfFBnLr
 sH3FYMbq1QPBeOmHxB1WBIL9nlaGjDiZcEPYsdkliLOfdCR6gbO926QeTd7xiE+pilWWCNJWroa
 iJ38+RyahmbgiWFG2KVJ3Hp6OX+C0p6f/Dam2b0cbYDLGh95+kMgGnMVteAX9MZSnbp0UEywIJD
 dpONFNSdqsRXaCritpA==
X-Proofpoint-GUID: c2ZG0iFSiyGTk3BZzO8nSOvduinzjlHG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2MCBTYWx0ZWRfX0BS5vky8HdGi
 wB0bXnI7q+yiUouqCOqmCarZnxRM/FNuUZnK9Ftm7jipTYKu4ebCjYMnx1X/iunJLEPdZJ9arvd
 MOh/KMtMwbq53yah6mUdJOpRjA6yl+o=
X-Proofpoint-ORIG-GUID: c2ZG0iFSiyGTk3BZzO8nSOvduinzjlHG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260060

On 11/17/26 9:49 PM, Hungyu Lin wrote:
> iris_hfi_queue_read() takes the size of a packet from the first word of
> the packet in the shared queue and then copies that many bytes, including
> that word, out of the queue. The firmware can change the word in between,
> so the size field of the copy can be larger than what was copied. The
> gen1 response handlers use that field as the length of the packet, for
> example to walk the buffer requirements in
> iris_hfi_gen1_session_property_info().
> 
> venus got the same check in commit 49befc830daa ("media: venus: Add a
> check for packet size after reading from shared memory"). Compare the
> size field of the copy with the size that was used for the copy and fail
> the read if they differ.
> 
> Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_queue.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> index bf6db23b53e2..5d3315f71623 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> @@ -95,6 +95,8 @@ static int iris_hfi_queue_read(struct iris_iface_q_info *qinfo, void *packet)
>  			       qinfo->kernel_vaddr, residue);
>  			new_read_idx = residue;
>  		}
> +		if (*(u32 *)packet != packet_size)
> +			return -EINVAL;

Sashiko has a concern

Konrad
