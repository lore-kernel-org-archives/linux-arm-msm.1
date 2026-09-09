Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC191568540
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 19:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788980408; cv=none; b=gwygyCKH1MRax0zY0l+U+VLRUcchUEPG2m9/TDXBT+wZUduXajGJls9djKhKn8+i5mdF1y0eljGaQbfbm5NAXWaD+Q/ZNn35m/fEJCvOpEWYWgTG5DuWc3hQBTW0u/kwlaq8By2IFS06K8U6rVzhaDJvcUycnotIX4JPDicKT54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788980408; c=relaxed/simple;
	bh=W+Y4C7lHQn13v7O++mmrTUHwaeZ7ipXp12hzVPadans=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gr+Tacavg+VOqcc7ZT7Xdl7/LLN4Kn4aWuPTGTp9ZZzrDWg6d2YRIQUBd1oIDccXutd001fogoci3zfJTV991zkQwh3xkaoogIYE34wqxhE44mcF5yFCF2O8fspT3FFaWG768Nh/06TTHLjD7ShYQHyaI4t9WHw26x9bEZL0ZNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TIh9tdfg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c9bP8HEF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TIh9tdfg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c9bP8HEF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689Ig9fa2281203
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 19:00:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=88vmkQNz1OKcT0Fc3h/2B8Pl
	KW5uTuDj9Fb2OV0HY+0=; b=TIh9tdfgYQaKCg37idhlMd4IQXtIOer9SilaggD7
	vZFqsrelQJs4U0bfP0oykbnqysIa5OBHvnSneIgZZ6j8ZpuO0cSYA0rBPniSWTzP
	XcTqkzZ/5n37u6za5sPrmonoLgwIrf7k9WUmIvL88YrgUNQLvf0ZFwO76fjgwRaK
	X/D38tJlxn92tojuQ/bnmkHkFxxRqaw6zWN7X9LrdMmqdXEQB5Ll2aGcGD5ab98v
	IjszW3NLoOfVffhfulYDKZgXVJ7N1+/7tPEcu0rmJmLGMGBPY3eeoHWSeZBJO/iz
	XxV1W4oB1Jv3WJzU3GCoiGH6aTh+44+fze0AcCUANY7cbg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydr3x3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 19:00:05 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78fb9f59781so1007510137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 12:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788980405; x=1789585205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=88vmkQNz1OKcT0Fc3h/2B8PlKW5uTuDj9Fb2OV0HY+0=;
        b=c9bP8HEFL86vzkh1TtDlP6Jo1qyH0jSidrMeuJKMt5KNaPJftqvjOeqXzZSBmCMAYt
         ygj9wPo/A59pIVSV28Dy4fALwcww1BrBaE4cJiF346CuCxjVtLWdWOgdGzC92ngaG6DU
         1lu1gOMsoHYpmXppKk+/HZsa7pvJhq6hvNf8AOpNspFCgdlqFcVJshl/BQTZPGaF+1hO
         Uaj6B1O9zCH8SS8w6V+nY9HVVx+U1YpgWOgCLUpgE9L+ZX/MBkcMTaZgArQvy/L/1Pc8
         +FcXSjGL3bmQqjPdwVWmkjaWAdi8cpxJvRQwl6qByBJ45TM/jGXqvXAmhbS4xTNkxEDV
         QFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788980405; x=1789585205;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=88vmkQNz1OKcT0Fc3h/2B8PlKW5uTuDj9Fb2OV0HY+0=;
        b=bgDwtAKsix2kFC+hJHH4qD5nBRK8mzPuRFooesM3PlNB3FqlxkJsdu9qb7yBIGht6T
         +VG41wba6ljRLv+j6yDCGJzt91Fkft5J9ph651yIl0cdEfj7/1dYrD/nN0ccXhAJu8Nx
         0uzyp+C+DsYT97bnvNuwFKSK7vxmvjSK7Ql97MmE7PUpmE/RVKuNRbHoZtxuhHIefmpH
         EowQucRJQR/ll9s/lh+V6fGrgyXlkRdfX/dY5e48mWoSsL06zFwFrwB6KVGRSkBUKPrc
         lrtpiEp2o/x++AHFaqDC800IVoyQvB+UuFJQA+m9q3vfgfPGcFo2yLyWUKU5JJjp/PoG
         5ftA==
X-Forwarded-Encrypted: i=1; AKwUvByLZW7Zr3Kr8W1A0N2rHIrI3+uF3Og7PerWJtcWN/IsbiehcyEhzwnEXHVfaglaFjFbZ38bIqWlRyJPU/Cj@vger.kernel.org
X-Gm-Message-State: AFuF++nNgqR41v2THPuZLRzD4BY8BTY0UPDUDAE5eRRaRgS1amWz2cPP
	47H6zvSRtYNKm1tchvRTY0c9pHb5gXF5/l9UGs1L/FM8cZpz0MR+5NUswIXNiVjnwjP9C/tXDUp
	M/SgIa5tfbyTxFCC+9rJ28L3QJpL7fASTRyyBcdc2jmgQxkdQUmAyVeNEU2niamXLk+zg
X-Gm-Gg: AYBFou0eVmQX/sf3RQipe10PGw/o3nI8a1fXM/cPyCCkcLDcha4c2Edu2Zt9PWhQRvU
	sUvoGN3ohq2+W0M42czwOOWmJIem7YduvJJuqex+lG7jbjbrudS783bqZJeAzGzzoT7bxCx2Krc
	0OBL8et8YGAvLLkwxrGkt3HOTPzCqU59GC2e7bPDG+p70AMb2tR+iJ5gx6tU7G1G+zrZfeTv+TT
	1E1l6973y762K170GHRhudaahakgw2KgjJVCpe1Wl5sfD5bUcdIpDs9fAA69qNrfbkDlXeWvxD3
	hjvbhQjeA3twnQVP3T4+Ce6Y5RLBTxTp0XjmX0h6i7B1o4oqn29rizHbki1z+kUx5tPO/2OfLvj
	Sj4QVsuVSUanSSSk5vymgFaS0CN62J96xSjBlKLLP3yiYliugTXq6RrkvyjxfJSLyGHQuST1spc
	zyLr3Qw7Ju4Knl
X-Received: by 2002:a05:6102:54a3:b0:778:5bbb:b2d2 with SMTP id ada2fe7eead31-7907882b3b5mr1538091137.11.1788980404733;
        Wed, 09 Sep 2026 12:00:04 -0700 (PDT)
X-Received: by 2002:a05:6102:54a3:b0:778:5bbb:b2d2 with SMTP id ada2fe7eead31-7907882b3b5mr1538055137.11.1788980404290;
        Wed, 09 Sep 2026 12:00:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b899b012a1sm157308e87.53.2026.09.09.12.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:00:03 -0700 (PDT)
Date: Wed, 9 Sep 2026 22:00:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Evan Green <evgreen@chromium.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 6/6] interconnect: qcom: msm8976: Configure auxiliary GPU
 QoS port
Message-ID: <fzowmjp5r4cry3wdlxejdsm24jdh4j4gzbbndbdf7ydqq2vk5p@lx3eb3q7o75c>
References: <20260909-topic-icc_rpm_smd_qol-v1-0-6dc5b5e97626@oss.qualcomm.com>
 <20260909-topic-icc_rpm_smd_qol-v1-6-6dc5b5e97626@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-topic-icc_rpm_smd_qol-v1-6-6dc5b5e97626@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=IfsSymqa c=1 sm=1 tr=0 ts=6aa1acb5
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=FHrIvcMS070A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=jW8lGn9s46bW74Nh9CgA:9 a=CjuIK1q_8ugA:10
 a=PkAOt9_mmfBkvtOLxIEI:22 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: xtUA2Zcl5K3QTt11e_q6N19jczDo8Gpi
X-Proofpoint-ORIG-GUID: xtUA2Zcl5K3QTt11e_q6N19jczDo8Gpi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIxMiBTYWx0ZWRfX0PmiFaf2LZvk
 LlBLFGBJFEWNIKDqmW1tLHf/YWXMz8C3txTntYIIptZua/pFF54n+PzgUZjmHZCJp8+vt0qi1Yr
 Hhq5t7SDFwuMzrjelSYYuFBnO72tSL0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIxMiBTYWx0ZWRfX/pmvx5wSgwew
 e4eKt9DIrJOBwzqGor2GU0S+cHrSRcbEfCe1r23pSQkRMbkdW7YbhnOYZZ0pcwwSJIiTxC6I7X0
 2/qr3pbNL66RakPl0BiM2AIfKyca2NzxiwR9NAH4N0pYZZ7pXuaT2sXhAdpP76DpVTS7IQGshzg
 oyMqw3pv1OeZmLnyNUltno/jERK/lSGB5zAltACeeAwmOwUQT6uTyjC4ThTA6mQFFDvP3k4Kv68
 B55O/BeqnvsPOx5yDiTHJ2OcTcSao3mDJajMtErZwGFvxqjnZ8TMdj18X/zAqc9xSLxTVDXWs0E
 fxeXXLBCmeXJt/nn0eAPZ2xkXrJUbtdBGecuoT4gWKDFhZKo/5ExZZuBUPsQ/jLoXXUPGiqPX3A
 /bHUA1d0Yw2Kzp/12GR+n0kkniIKo4IJ8OzKatWp5tel3ON0ACIJJJxBJYdQxkWhgLo9gmzqx2t
 FCRjtWxVDoSiuibm3GA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609090212

On Wed, Sep 09, 2026 at 06:41:59PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Enable the secondary QoS port used by the MSM8976 GPU node.
> 
> Assisted-by: LLM
> Fixes: 6e3ea1f36b10 ("interconnect: qcom: Add MSM8976 interconnect provider driver")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/msm8976.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
