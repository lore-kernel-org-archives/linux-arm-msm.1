Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E4646C4AC
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 12:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154149; cv=none; b=LQwZTp1b/SWRj5soAZZfYpVAVKnKOII/NVFghpuYZwvjVRJWUtQFp+whTpDqBAmYMSFK1oLL/XJhVwZcGYwDPdawRbExbwQq1ydnev45QGnIMl+Z70Y/7ZPCMbuaRLNYxGjlszDTiS6W0OpLxYX++nQzB23dDK1gS6wOYOX7jNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154149; c=relaxed/simple;
	bh=+t6dshiwg0k2lvBeYJnIPtUGTCv/MJX/wKhxUVf2VfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hM74dCUpbNbFbrgoZP+mBtwvDg+0P03Dw7sw2I63wVidc6bNRwJbKenFtbm0GICcg44xUpi0dIK5ScRcoLw5pzGMjQuOH8pzOqB2YF3wiERGqzFunsaPoHcaWkqnJ85xikFN75LWLlu/KpzZLa6IuRhvBE55Aj47KWHyZep+cRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CbqxDIsp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kpV7As+v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CbqxDIsp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kpV7As+v"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAP2w488776
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 12:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FDV7CVjOSiyTwKyte/cvf6mHtD43N/X0AGHKK6OXI8A=; b=CbqxDIspWJc82/Br
	YdeqAbaY1uVfAN7+BVpfVMWEIktZahTVC57FYB1w8smrQyP1vRQT32QGiPqST3at
	0IRfN6ABvss4inCnjBBQwJNwPbXr2u52KOZvWGhJ8KQv3+N2J4dj+uOtX6F7AMID
	ttf3ekLADbLa+kC72Kkv1qfu6VcQ4kWyx0hOz2f+SZn4A27x5H2OaXiV/D0MbDJJ
	HrXGjAoMiwu4QsACereQyb+vYl64q0Kzx1W5Woie9UNosKWhKx9zv1npk7jkKb7x
	Hx221WIL49TP7BwLMS7o2Iy1M02V6Sb2InUKMHAcgo00astXhEoULVHgsKZ3FImA
	jIylEw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjt9u1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 12:35:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc50fb0d2so125315985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 05:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792154137; x=1792758937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FDV7CVjOSiyTwKyte/cvf6mHtD43N/X0AGHKK6OXI8A=;
        b=kpV7As+v4rDMD8zHWRchaLI9w+kFkqQ8zblVKhPBaheqWsHRc3DtsQ5tpfxx4RX0Kp
         zys2T2Sh5WX5LPHA3Unrl47nCmvFXWAOvymOCd+iEBhlDmY+vnepAxMlfp3enveDulAA
         afEb7Yqx+SXBwcnwUbweZL/GjXjPxMjTse4OOFNY4sZ/UQdy/bHc5DMJMajpBbjsDoe7
         LJL0o/8e2pQ2NwRyHR7F/9AF0NjhneQS0twvtkVr9d8XvIBoi63fwID9mEtYTsc8cJuW
         Myhg+zBJSC52Nv9KJZWXtngjPrrrchehNZsUC6JN/Mk2zq+tlb8301TO0VDvS07vrdqP
         Xs5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792154137; x=1792758937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FDV7CVjOSiyTwKyte/cvf6mHtD43N/X0AGHKK6OXI8A=;
        b=cGjDKvVtZgaJs2PMz+pG11UrPaL6GJAnVUzs/pjEaBgF4yhM+PdnkKeR5PvqwoFG1g
         zDQqcqD0jwyY+uR4q7QnPD8Stw6DgTYstPDyBSKFkwkfdTaooefpSrZ4tRosf/pvtlaX
         gDIA99/yGgShqk5c+A2ShraTZGwweo5aUk9gMQsG76xWnbSl6YOTnL0ggAjCcY9Sjfdf
         7ooJ2rrDEOTWYWH4/iVujQ4r0OwQSHnslSW+T+HPRYRksTjfAg3FywiMP6RQranIgP5H
         uKf8bm2b1nm0SOCMVJbgIVYJsok8QTM0YeMB/OPpatzuk0oMc+f1KpAJkeWAOjdHTOSp
         +I4A==
X-Gm-Message-State: AFq9FYJ3TUf95IarvCATyEr+b8iT7i9baJ32tNcZ8O4j3Gm0XGFwrra8
	nMgjxme+la4tNCNWW0Fa6ZA5/o1y2IZrOj+E1SE+prWlKtGi3EXmTtWxheXl3m7VoH0UNGZnATW
	foTxjoAXyusWEicw4QJ5ZfdoAM2U+CCo7+5PqAHQIMoNA/ByKSU1rzgSMLwJTQ6VUNb0l
X-Gm-Gg: AYBFou34ceOAPYadcWVCcJ2kNpM4c40G2IvsrrS7MdQpPBvEQqaLt+mf18HrQ7sWP0O
	hATR7/eEKmL9SXRUywm52p1OtD6ZzXE9az1cPHDkiMRcgYehfDuQTeqab/DspdpDyeK+YzHucfu
	cRHTQxEBCvpmk75NIAOFwuVug/um3uMmXyFYt2BaQk/CcLg6avTgIjGy3TwP4jRR2rYaEYzZDbi
	LPrYNJ8ZC4WtBrCUV5FhzaPZGfMgws1cZBt5NlgzZKSVFhpLKuO9ZhKl5P93xrxBxkp/KzVVhBL
	Jl+xsnV5PTnLOTqog/b0/zTGnkmMzKSShInZzeS01hZN8hu0PCb/GX6cA5rbay/wsrwUxAnSzp1
	k7AxqBh1YJOKxdwXAGJ+tKg==
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr4094558085a.4.1792154136735;
        Fri, 16 Oct 2026 05:35:36 -0700 (PDT)
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr4094529985a.4.1792154135803;
        Fri, 16 Oct 2026 05:35:35 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919bc742sm67074066b.54.2026.10.16.05.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 05:35:34 -0700 (PDT)
Message-ID: <fa8940eb-45ce-4778-88fa-5502dbd686c1@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 14:35:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur-asus-zenbook: Drop the CMA
 region
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261014-dts-qcom-glymur-asus-drop-cma-v1-1-46f745d5b2d9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-dts-qcom-glymur-asus-drop-cma-v1-1-46f745d5b2d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1MCBTYWx0ZWRfX3/ZoLVARF/M5
 tHsiWN/5/ft/kynB/F4FSoL2U79ysIVBR6oox/6UX3+YMbuuAggll163zMxj2D5jIDEMYwkqoIe
 TiZogqRqM+pKKSunO/EFF4VHYzbs+wgdbDKXW6FiFHUC5KxDVhzUJA4KYSl9/qo8qONiB8uzMIH
 aNfsDETxwrFrx4PyUjntA49y27kxA5RPtRCJcmya1siSRp6v1KPhmRRJ4sVcQwNN+frlQI9T9E2
 WtkSynchQauXWAZcvYMYfleWzgJT6KjTpTrxoeUalR2AqeCtcFeFa5VgrE/XqIcTsEFXpofbxO3
 VweYEz9Jf6V3EFlBwgfkZgpaVaxsODt8JFb9wX5U/ppEpZDmtjdiqg4ZxB5QRjJ3pPNRPEr/MvS
 7ZdxBHtHPyady5RfabaMZ2b3lGfrhm8eNfic1SOStioGEBRAmybfHM4MMT0tswqojfNSB6Ds8Oj
 JVUytWseEz3ZkUpwH7w==
X-Proofpoint-ORIG-GUID: a8nmzAbMIycCj0XWj9wZJHJmx_w1_5Pl
X-Proofpoint-GUID: a8nmzAbMIycCj0XWj9wZJHJmx_w1_5Pl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1MCBTYWx0ZWRfX59izlcvg3LOX
 dM7UtamhiQjC6WdqZq8yCrTp9p04cDliCqL+X1ls2xfjk8Nmg4ur3OaRrgsrQ7LWBlOu8CuulL7
 mVAD13ccOOx+M8HCdQxfsO/HOJKlpqo=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad21a19 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=IoKEEaSRBiMpOdyFCbAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160050

On 10/14/26 3:55 PM, Abel Vesa wrote:
> The linux,cma reserved-memory region was carried over from the X1E80100
> boards, where it is needed because the PCIe SMMU is reserved (owned by
> the hypervisor) and PCIe devices such as the WCN7850 WLAN end up doing
> DMA to physically contiguous memory.
> 
> On Glymur the PCIe SMMU is owned by Linux and the devices behind it are
> attached to translated IOMMU domains, so there is no need for a large
> contiguous DMA pool. Describing a CMA size in the DT is also more of a
> use-case policy than a hardware description. None of the other Glymur
> boards reserve one, so drop it from the two ASUS Zenbooks as well.
> 
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # Zenbook A16

Konrad
