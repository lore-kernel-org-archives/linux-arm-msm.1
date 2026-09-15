Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC04542376C
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 21:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789507258; cv=none; b=aRZKwMNrmH7j2eQHHOooXhy+1UxuE5YptFRwwteiaqwCZpHEUn3yynTS8dEjjs1irSWklRWVRPEZwfRRZ56GH2nynsKAzeVY3cqtrh1WEdX5AWuisq4LHs7Y06uXZA2Aa2zc08drzupCpp1zREFtd2KEuG9v/8eeY+5tktUO5GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789507258; c=relaxed/simple;
	bh=MSZLGiz5e/E+Jo5v6EY6+916sywfFch7614F0EqdXes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CdnVD90ADTblpCIDrwIPM2Wpv5TeDi7/uDYQbR6UvROmrtfL3yNR7ELOYXE17NDEUO5GO5KtsjXxRH2QZo1kz5Z2nM/WhRpKC1tUDddFw8+XblDw6ro1qSsT3Vn0qAw7smDqK/58vq+3gfU642ZEfWajyNFBnsahMa1ofbQ2YCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P8O/E+cH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PU6GrND2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P8O/E+cH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PU6GrND2"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FItm2q277084
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 21:20:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	chAJluwUiQNqr4LZZnWIA9G5yILa+6S7/Y3KKqeYuRQ=; b=P8O/E+cH5ZhO7tUU
	u5TgnSJyp5SvxJfPD1XY6QBLo30991IkgTRGJaNCEdHexZ+skk66jvReoHmr9iqS
	OJLWi0Sic4zahwuOwJpBxFGQQsWhGlBth7c/fC1EoaJMDImznPFUgwVVJS06t72x
	MntpxGT7INviqcfOpN8PcWp/HsqqcTVIOIlY2kPRS7sbd9Ce0bKfO4RMA5MRsxTL
	VMafdTLjTteSwTz5ZWEyfpuVbe9X/fTr0in7CwzJSAjIx2fOuDwXb3Z6RaT2fSgu
	RL3IPdXXossl7N1Exai+0LtAfLfcyn7OjL3eR1k4Ep6i8JA73nWHDlrCK3rInRcv
	f4OMUg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq2y2kbwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 21:20:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39b6416441eso9337769a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 14:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789507255; x=1790112055; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=chAJluwUiQNqr4LZZnWIA9G5yILa+6S7/Y3KKqeYuRQ=;
        b=PU6GrND24mtRM9AK3JNtIiT3BO1il1LlAqoS91u3m4TrPMGqgmzqwY1CKRNBdXuNEd
         vSQls5FRbrwcQRIYVSdyOvdIOzDUEWH/bpRSdKmPw/TLV+ZnkFNCahto9XBLvHR4Nnjr
         hTz9hW/Br3ugjviEs+BdEjAMY7ZvmG0TZaIEq0JRmZicOl6p1wL2P2Udgs1hNaayhrjj
         Y0i99LEIhWefkcOL1lguaGHCGTerCE5SH31W6zS5+rzuyqWiznqg1StWwqq7d+5AhKi5
         vESg4DX148hNZ+Z7iPsfgNzm+4WyfL53tF2w0KuVM5JLB3QA5P5DJA3cZD1eLcedzNR5
         3eUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789507255; x=1790112055;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=chAJluwUiQNqr4LZZnWIA9G5yILa+6S7/Y3KKqeYuRQ=;
        b=BS7KJ27iFzfhEupQX48eBTiaKt/YpUqOrOH+hFVlrV9DYcdHwECOYmBVO03HtA6E6V
         yQ5OhcigLZFm53PID8l71YoXgFNVoJfNnCXREkj0H2wPt0cTZDt7AoR4XOQZsz8UFBTI
         JlFCtdRs8Tk68hs1fdvhg9iyE32PiudC/XRTVVkVjHhtGf5wm4BijrK9IAROGeQEqQjJ
         G3Vm7leYOuNOAViPV11XCjRlMTUp2WK3F75S37Qhbly5/BlhsDVfFASENLTUYL1WA4Bi
         G3rSDLagWYyHqvEopydOUkh95tKPuv3DUft8rm4Gtwrya1Y/IPqG4FmC9HpTym0+OXoY
         IG+g==
X-Gm-Message-State: AFuF++lYS9Heq9zeyJVmssPzKx1D8qb7bSbuUZNp7kN4qXId2n9CV8pN
	gaHnehxw6/SJdQ3QBlwnbvgsAQjy7dDjPD46lsKY7b4Q7LkrPXM2SVx929qW20PZRGACJe5FqSl
	hS30xbQ9oG1xa0aueMeC+3wWQjXZ8FMyMDD0HWWSf/iolLnC5mlHvAWydE2UIjlqAfgpv
X-Gm-Gg: AYBFou0XZYEOYRWpAXKH9i3QT3p0xITEtTxv4cTTrOkm4KjDKi7kh0RlafRCdRVKzIu
	IoavZFLyo20JcCVQGAf/RkD/X/UoGyE8IMc1iYWmKGt4EYH+d71gQiXfUijf4CXAVU6b44Abbs1
	7jWhnYG/2zDvY6LXgcYLXGprecCVScCGUvZ4ZtIdrBbhAON5GgVzOoiNOalE7Z/xRUZf3Ckq4Yf
	kqTQegWmMclVLBku2qZI0trlGwril5ACY3FA0ke5aRng+tYRfYi1eFfH77BCrbCk/ZesHqmFkZn
	/T1+cjXs5a6Tc34y7nMKET2eeSHqjypOyVPTINp4LB7d6oSeiONFlawJnTMySwf7rqsjPnluPgA
	deg8RgvqQ+17lKE3Hnn50yqd0hQ==
X-Received: by 2002:a17:90b:390e:b0:39e:53a:c8d4 with SMTP id 98e67ed59e1d1-39e1e424a7dmr277889a91.12.1789507254621;
        Tue, 15 Sep 2026 14:20:54 -0700 (PDT)
X-Received: by 2002:a17:90b:390e:b0:39e:53a:c8d4 with SMTP id 98e67ed59e1d1-39e1e424a7dmr277857a91.12.1789507254153;
        Tue, 15 Sep 2026 14:20:54 -0700 (PDT)
Received: from [192.168.1.15] ([106.222.230.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a166sm1717762eec.10.2026.09.15.14.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 14:20:53 -0700 (PDT)
Message-ID: <7128505e-c8c9-4d00-96f9-2576ea2a0fda@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 02:50:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] drm/msm/a6xx: use correct timestamp counter on
 A750 GPU
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260909-topic-sm8650-gmu-a750-timestamp-reg-v2-0-091d74958951@linaro.org>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20260909-topic-sm8650-gmu-a750-timestamp-reg-v2-0-091d74958951@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: X8afvmj8Lf5FbRZeUD_jOVYZM6wBAMPn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDMxMiBTYWx0ZWRfX9pvdYFmGmVUk
 kVkjNFmV4Y/BYQGUG98GWQ0EKrfqf83ZVkdno3PEy8qmJsff1MLfgXv1Psn08ZH11tCr+E96b8g
 QHnjiS1mlQunJK5pASJtBGQcDtffjWJp9VtJ1Tg3mIRAAzBQ86jBLXO94d4myuA1gg6Pt0HMPXQ
 9EXJeuAQoP9kI+960uGUM/pYc8xotR8N6cew+/+QqYyUKx6vvzv8k8IkW9CLqXxZlV4Kpgo56U+
 REdwxB8EHTwNjAsB1wYMqeBNw32plZHbsEGcmmpuLXz8VEAQeYf3RQYmM+okHnF5vUlJnPBw8TW
 t7sueXpKxayaZwo8MqV1dCqjrQwo6mViyA31uCkY6o9c3loU5czyHis55DWy7un3EXaSFLSG0JW
 HhkjvWqVyphZgy/FqqkKROPA7bJAguEDU0OZ4BM9+YNLAEmGnCv4l27uhf800+kjYMzn1TwhUpE
 xNsEQIuEXuiPEgy2RGA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDMxMiBTYWx0ZWRfX6mJsZo9t/dnY
 5V4FgO/bf1H/RXb1ToBmltqfp4gK8AtfePOHthULgOzW8xgpvwvo6JdVM+7J/hkStSk/Cg0zivc
 rYw1tBNMH+B7Bl3jPbpD7OhC1LMsUt4=
X-Proofpoint-GUID: X8afvmj8Lf5FbRZeUD_jOVYZM6wBAMPn
X-Authority-Analysis: v=2.4 cv=IcISymqa c=1 sm=1 tr=0 ts=6aa9b6b7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=BSf2YShhMxZyV2bg4MjkLg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Nyh0hyempXrTQnLp8KQA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1011 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150312



On 9/9/2026 6:37 PM, Neil Armstrong wrote:
> The A750 uses a different counter register as used on the downstream
> driver:
> 
> static u64 gen7_9_0_read_alwayson(struct adreno_device *adreno_dev)
> {
> ...
> 	/* Always use the GMU AO counter when doing a AHB read */
> 	gmu_core_regread(device, GEN7_GMU_CX_AO_COUNTER_HI, &hi);
> 	gmu_core_regread(device, GEN7_GMU_CX_AO_COUNTER_LO, &lo);
> ...
> }
> 
> gen7_reg.h:#define GEN7_GMU_CX_AO_COUNTER_LO		0x1f880
> gen7_reg.h:#define GEN7_GMU_CX_AO_COUNTER_HI		0x1f881
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

This is correct. There was a register shuffling in the gmu_cx block in a750 and another shuffling later in gen8 family.

It is a good idea to review other GMU_CX* register offsets with KGSL. Also, please consider including a fixes tag.

-Akhil.


> ---
> Changes in v2:
> - Fix swapped H/L registers in XML
> - Link to v1: https://patch.msgid.link/20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-0-284880d6e68b@linaro.org
> 
> ---
> Neil Armstrong (2):
>       drm/msm/a6xx: Add CX AO Counter registers used for a750 GPUs
>       drm/msm/a6xx: Use CX AO Counter register for timestamp on a750 GPUs
> 
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c             | 12 +++++++++---
>  drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml |  2 ++
>  2 files changed, 11 insertions(+), 3 deletions(-)
> ---
> base-commit: df2908090cda368b01ff43709f51890076c56157
> change-id: 20260908-topic-sm8650-gmu-a750-timestamp-reg-2e7575e6279d
> 
> Best regards,
> --  
> Neil Armstrong <neil.armstrong@linaro.org>

