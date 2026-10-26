Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008497;
	b=lzaBZUJPFJUThgJwE9N1YLvVlGpBmJO8pGFoEP7G8N5dV69Sjv0d68+SZ9N4X8f+0N3A
	 bwjnUtLpGn3NaYUm2kdKgY4ygatGiTXLHQ+skPsi2cpanM5v9w6ejBgQZLYGldhMMc2kK
	 VxDGj8ctuLVaaTg4v+6gjf42Yv4AVxE+Y6he8t6EIhIB4fZk9JnR27aypZg4clS42bfxm
	 7lEyj63i9LyKduC7xpTY60z1bHGnBappk0mHgeaUUQVGB59fhD4nxeoqMZZFpbgOY7Obw
	 9UlfxOQirfqqYLfHbxCqgqCXG6elp7zsEj9GUcLoNwMc4ggJYO9/0sZqealAebH0YSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008497;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4lGKfZVXFhhfUcscOMxly8EEWx0e5wo0QpCfadLOD5M=;
	b=NQE5My3ekFtPvIefShZ1dhIgZFOMoTVV010zqRm9MPVWNhhdt8P98cJj1vdl6iZJ5A3j
	 ZsM+eZgen9CLRHioRl6VJwJHQZXei8HbPZ2o1gIwOyKNtuiKFIGshAXpudG9i3BwarmuH
	 Z+gAVsrcWLeyUebmTzSkg+p09+U22gwuJoslsZ1Q126/T6L4U5690oWzJ905OoJ8pOVnp
	 uJrrZpU0Vyoas1wtkzFCS0nUgPjG49tNQZ7NUkE66jI67urgnQx1x/IbLjIrx/TLEq31a
	 dB4VqTaXzBwRY9qzQA1MMoVCBmVE3Bv+g6BQjim9hDCpGlP+WoPYBAyunhJp3zijFwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N5W8DIl9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QVSrMAkv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DA2606A32C
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6DA2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N5W8DIl9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QVSrMAkv
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b1el2206175
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4lGKfZVXFhhfUcscOMxly8EEWx0e5wo0QpCfadLOD5M=; b=N5W8DIl905zdUdEn
	qMbz2L9XzB/oJuADjsf4cZE/bvkhvRd6uu0G+9TTTul28/E1lSfrBHA8Z6IMaFil
	NQA+jkFNNyZOQrnEw+gHIPcOlukQCh+GN60GQt+X+9wcnO5qtqtYN1SxTfYyj6eL
	vh8RD/RSU6vuoMIPqtDyQH1IRWH6cSeb9fsSDvZ8nW28e7fQ0bGnrS4XFjh+D2kQ
	AbVS4p2bpszlELjTh01WbWgrM6/UJCEMTdZH+TGVA7lkr4Eeh13R+s/bUlXeyKwB
	Lak2AUheOJNar1ZjP1ZDuJbRv3RZsjx/vyW3+K3bf6bPqDYONHlpzpowFz0jfipj
	MiDRig==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmrunsw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:54:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-536708d1a3eso11976401cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793008495; x=1793613295; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4lGKfZVXFhhfUcscOMxly8EEWx0e5wo0QpCfadLOD5M=;
        b=QVSrMAkvf7zD6FdUXuGrkU+gg8uraVME65VPCjIlhE1FmmVZCW1VO+AzeqkCpPiT1q
         /UY0Q8jb+g1i0L6/b7GMsHQWn5kwbi5dk0xJpkMXZ77upo/pIMNKncZohHRnv3OtDtQl
         tQG46oNcqI5U7bGYjHvcomgWepBtJVx1teRydIuhtZwc6r7ImMacWrSp8PH20jXabIjv
         eg3oOZrDGXCPzPk5ouqb4MQo1loewCq0OOSRvZBqEhfT/J3AXtU4PDAy42+UsaAj2B0N
         XlEwoA9WBPgEcU5Flxf/PBvnLHbU/AlFaj8aPoR7g7ToFxGzWcJN8nnGCkK4yU+ozccz
         9h/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008495; x=1793613295;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4lGKfZVXFhhfUcscOMxly8EEWx0e5wo0QpCfadLOD5M=;
        b=kFnhLhCH1hcNKtum2HCX4R3iNtJYIRyiD8GqnEa3xl9ihUQDaKhlEwdFhIGRJvAhc/
         4NezRJhwuAoEDASD8GxuCC4vg8aeFck139Nz3zl2WoJ1kXsPwVM0LrJeFpEVLrVl5EG3
         U3rZAL+ljiNCI41l+Mk1FTkZcfZYYxUB6Z/lqgE6MjywgUy1Cnsfaij/fcoGKJ4MkLuK
         acvID0Iuic5wVgfQ8cg4lWtM1JfDmldvMxbYvearzNS3jUIB798RDYALueNceuGKzwZ2
         gy70pSuF5yo2c3VgPlHM0/9CNa9q0BBJRJThBa9z70bFc4dR3/56jAkDpCxTn8pci344
         sJ9Q==
X-Gm-Message-State: AFq9FYLhlM7AzWPfPTn7Vo0mzQcQNqYIS/2ORbWWw1XpbxCV2DS+NPeR
	FG1PM9TqVkkbRWDD7F92aplswwAfF1fxs460XfMTtRpeNBP2WrO6HeHPiYfJI5B+4QbtcR34V6f
	qra4UTRJ0n1fz4AGnKEXMr3L5WdqXVbWbwVASJZs0mW+MUMCybM0LLVHkfLOZsk7M+mSU
X-Gm-Gg: AYBFou3l7OyEgq8toRyseCUNlUWp2HF9aSB9K5GoCE+gFu4xwZ1ANZY43QoIKDViYXa
	lMFsev/PEAbsOFXBbDKTnaU7w3tBTryebHN/8XkKvBhEyibclQnXEhSSiynyQVSCVQP5O5Za3DA
	qm3uXwojqqvj5YMWPChgKPmnXnP0M6zvxLZCIQT8TjO0e4rz0kdNKvI69W+X7UpRA0UpOuJ7qPi
	XVPqhTGOF9j9lk8NtIkD6Pvlv1tPFDOdcq/PBGlhMnS2IWc8o0djeMNQPyLtKhhx9grbaN8MHt1
	B3tCdPkAJnjyZtNdHGmDUdG/e5x3ANkFNNEEmQZhZKfzmbWUjbV1nku2ultZ2KRhle783A6aoVI
	iua9TEs59VHDh6F0FbVSzWg==
X-Received: by 2002:a05:620a:8703:10b0:93e:5a3f:ac13 with SMTP id af79cd13be357-940ef672271mr925540485a.0.1793008494872;
        Mon, 26 Oct 2026 02:54:54 -0700 (PDT)
X-Received: by 2002:a05:620a:8703:10b0:93e:5a3f:ac13 with SMTP id af79cd13be357-940ef672271mr925538585a.0.1793008494426;
        Mon, 26 Oct 2026 02:54:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd524271sm309870266b.35.2026.10.26.02.54.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:54:53 -0700 (PDT)
Message-ID: <370ec92a-2c33-42c0-8579-495e8bb4ae8c@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:54:50 +0100
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
Subject: Re: [PATCH 7/8] drm/msm/a6xx: Request CLX enable from secure world
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <ltuikov89@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com>
 <20261024-assorted-fixes-oct-v1-7-2977f974ddb7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-assorted-fixes-oct-v1-7-2977f974ddb7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfXzqMM8N4fQ7/R
 VeUTQLObN6g2XBE0Ut/oSWj6lRPwSl3LNMEEw86mbL4suEpdKtCKL9HNGNN3QvFfzwwZdeMD37L
 13lA1vydqgBiFmlqTOUddJGt0gMPiHYCZnm4gkUOXyPyOF3d5+nedbppQ3iulI+ISVg/y0TrBwX
 2+kejOyGfi/gRyIrSzY0lnCmhYNdtLUyU0Qg7Zffsl/RZScOGgbHbp7V3iBbcIGD7Pi1I7vsR+S
 6Gbm/62Kx83/LZrcCfaHeiwbZrgggBK9qa/mNPd+xWNaixv9/HQErcfZuvJqKJHhI3bZTqDquSO
 +iKloiCjDnbOrBVB6gyeHgK7mh6nBQsbtZfOEblHpJSoicCvps+fHufcrp4ygHwHg3y4kPau7kH
 LJLlgqm2u4dHgkvZhDgJmyHXxA4e9rC6DA1oeLE3BdBZo1w6V4ztk2ov7bI/3f8LmgP7vpNw8mL
 yLAdzid8hLVY/vMgQlw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX6TL54Zl9jnSF
 jNZzesU1qcKArDkNYeFWy8eRd/i6pEPVebUs31EFzXRXVcmRmWuk2lC7c8l2wPkt8NdaRf3C6Rf
 Jhah4RrfGa0YEH+JIYtEAY7W1ibQ6Cs=
X-Proofpoint-ORIG-GUID: WrkL292z-gQsovIdTsEvduxv7MfWGmtb
X-Authority-Analysis: v=2.4 cv=e+aT2qp/ c=1 sm=1 tr=0 ts=6adf236f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=UCowTn2RA8sYE9T27pYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: WrkL292z-gQsovIdTsEvduxv7MfWGmtb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260039

On 10/24/26 12:30 PM, Akhil P Oommen wrote:
> The CLX (Current Limit Extension) feature also requires the secure
> world to enable it via the GPU init regs SCM call. Without the
> QCOM_SCM_GPU_CLX_EN_REQ flag, the CLX tables sent to the GMU over HFI
> are not effective.
> 
> Set QCOM_SCM_GPU_CLX_EN_REQ in the SCM request on GPUs that have a CLX
> table in their catalog entry.
> 
> Fixes: 967e62fbeecc ("drm/msm/a6xx: Add HFI support for CLX feature")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 991db3c9cd96..a1561ca41a5b 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1247,8 +1247,12 @@ static int a6xx_gmu_secure_init(struct a6xx_gpu *a6xx_gpu)
>  			goto done;
>  		}
>  
> -		ret = qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ |
> -					     QCOM_SCM_GPU_TSENSE_EN_REQ);
> +		u32 gpu_req = QCOM_SCM_GPU_ALWAYS_EN_REQ | QCOM_SCM_GPU_TSENSE_EN_REQ;

Preferably any local variables would be defined at the beginning of
the scope

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
