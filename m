Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD66395AED
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 22:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791497130; cv=none; b=k/YNLgBcYOc5rwbQCXKyJvZMMeRnmNBBERrjZLwRvbrnDVazIaAm3K/hOIXdIhtnWku2VhY39aQS7F37ciNXeos0dQjqQ5xpvW2CUNwe/JA/T87qxdKKedU1LyyZT3PCvw88HA8ybKh/QYvomHZisgA6Pem05+dYB+D+p1OV03g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791497130; c=relaxed/simple;
	bh=k5kD2nd+PYguRx7d9ujuhrEXWk+ffbxPUJaokYyDUwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jqZIrFcrLLPmfkAXWecI2ONTs9RDRSTRKTE8eF9gdJahH7zC0ueRE36SeL+JYuJ9KuhHjuUwoHGNeb+lznujA7RI9MFVsP5BGvwllyI8tTO9EUUGHdqnevOT/mZ0lMbYXx7Y4IeDGJaMAOq8vKHpOwsE+HqkpiXqR6sG8yuJWtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jCTo1u7U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M9aIuIez; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jCTo1u7U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M9aIuIez"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698L0Cjh296600
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 22:05:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8spVoufNRd3rhz5qESpKFXoN
	lzuoHybzemabbo/sQ/E=; b=jCTo1u7UkBR37iS6fekZDhxUAlIgikoG4nioGC/f
	ld6zICWXRVcJWqjqYL6z902op2tF9PgAW2Ar4EkvticAugaHpreB4YEt2x8RBLzp
	4Qi3ccIsjYkQxVP0HLsykkoRjZnhAUY+Fr2m1vaY/8SFMdUPm7XbjEm9jcxjLbUs
	QrYNs/a27HgG64nW8Oc9xnL2IUz0nYE11Yb1YagFSQrmuj2X0FgNMik40TTfHwWa
	NBE/Rq4PbNPUwZ1is/hqnOCeXVNlgMTJhJWz83jvXFLJEtBQXAjDaFrmYh5+LFG6
	6coEChN8SuRT8WAozFnE59SHaWT2I4FkeQJTCcfFBF7y2A==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ekv94xj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 22:05:28 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5df0d59528dso1278501e0c.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 15:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791497127; x=1792101927; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8spVoufNRd3rhz5qESpKFXoNlzuoHybzemabbo/sQ/E=;
        b=M9aIuIez1Rd1Qi3m5Ky4sEjSLmZw7+ZDB9iif5vPDMR1qKZyYzUkxfrP5U05B+De9V
         VtcHvdQ3ux3Xo0yIee8kkGyOuDI0jmsCNAa1IPhw4fPmTBQKm0T8v3fR+O9bvMDGNfgk
         OOhWMJljIETz76KgXuyKKpNNFGU5Vm15milCAKXlVaMfabHb7ZzgSBGIBGO4h0mjX39Z
         Zux0ApEnAnVTsvKvt+yoxle/g22RFfTyigeKvvmLeRTIAuRH+WozaAL1UrQWs+rhaJDz
         uiAmIHtqJXbp6Ep07FQnYLUWOHfuTBEw45svpXsA3+59KrBbkZBVSmh0jnjZrRNWcj76
         aiNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791497127; x=1792101927;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8spVoufNRd3rhz5qESpKFXoNlzuoHybzemabbo/sQ/E=;
        b=vQ9up3KkeeMz0SzbiFrgfJ4B89lmnptnpclMRK/Gi7PtJOlCeMkajhTnIvpk7ERNFc
         RFOt5t0lHyRmGUbGAYoCSt1eP+NV7lzDyScCs7hxU8qCFhB0l/9lm33tk6CXvN3J/eoz
         hIyarJ89FJ/W85D8oiYOs3lxQzftfi7xUbq/vIbB6Uuy6o05oswVLCnzO/BIdhOgSvoy
         zZsDbK+8eYIl6uWEqYqfV0GHW7fKhaIVObOqA72iw4TF0FYi6ObygcB2OBhgop89Bd2+
         dcZcywItFklyR/+UF6WqQyyfebO7Jk7bUKQZ5zbyZFamMg1nn/qUR72czaV8NzJ7AHb6
         +/Ig==
X-Forwarded-Encrypted: i=1; AKwUvBwdULY1Ny3P6zqYPsdT8cBC45H3laufG2LCgQjvGvWehalNduSKyfQi+obLj+n7bodeIN899IFi3e8b0LyA@vger.kernel.org
X-Gm-Message-State: AFq9FYI6CLjQoPd/Kgb2MULyGxmKOUhLnc6OIqTujdnW49vpL/srnTCC
	CjHykB2kd+A8i9dmUD3uvbkrfMMwbtDcW4MIt6cnm7NW/hsMHqQHQav4XxtNFRX/wi4FgBLdsBd
	u2iDH9Dyt67apozgq4BhkLxtIxLyJYNCD4Ml8UWkVf7jNcvuKqwBJHSMM+/sZm6G35BMp
X-Gm-Gg: AYBFou3Ek4u+LNAhzAH6C/1UI1tLkKACIQ+MLQKmKNhgSVLAFcdjj2C6AzR+X7TuhMF
	lYQPgiq4gqWDfejcBNcE/vDDQdWlC1ziSE355VldeLNmsv9I++1NMIiAkB7rTs+QPpffnSa8B6m
	b9UhfJdsZ8FY2Hi3kO+BYJhBF1pfeVw/RSCbbG851xN4pOl1IAd/Nsnnk84DNc/dfZG81AnfdAU
	nW+7y+CACPU9kEwVNH0RQkKEMEx/e4DWWO3Fs1gZsd9CfXD2hodr7KZFCQxHvIuSVWioDr8KJT6
	67R2FDxviDGVCvX55bpvXqW4ia32v0oV0eKkEJagCebJcLZTVaMjRizA0vfgOV2yWlELCJM18ji
	km5WtRkLyRQgh1Jcly1Uy01lzaj3F7wSKWD8uSxcQPiMJZpRD/ZzFuG/SxutyrnakdNM5iq5gN7
	xrJnw284wDArw6
X-Received: by 2002:a05:6102:c07:b0:7c3:43cd:6fa6 with SMTP id ada2fe7eead31-7cb372e11b5mr69711137.18.1791497127598;
        Thu, 08 Oct 2026 15:05:27 -0700 (PDT)
X-Received: by 2002:a05:6102:c07:b0:7c3:43cd:6fa6 with SMTP id ada2fe7eead31-7cb372e11b5mr69698137.18.1791497126996;
        Thu, 08 Oct 2026 15:05:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3caa6edsm1062341fa.16.2026.10.08.15.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 15:05:24 -0700 (PDT)
Date: Fri, 9 Oct 2026 01:05:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: fabricioakio@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: mmcc-sdm660: Do not keep the video core clock
 always on
Message-ID: <lc6rpnhdxy6kdc35k2l4ffr5j77thjrpwlvig72msrl6rzbho4@do46m7g6lt27>
References: <20261008-mmcc-sdm660-video-core-v1-1-3a772ad6a436@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-mmcc-sdm660-video-core-v1-1-3a772ad6a436@gmail.com>
X-Proofpoint-ORIG-GUID: PLMDl3nTXzXDkasi4SPxfbe78kA1lXqJ
X-Authority-Analysis: v=2.4 cv=csYOAF4i c=1 sm=1 tr=0 ts=6ac813a8 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=f4K2bgMlGXeKnjgVb0cA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA4OCBTYWx0ZWRfXy+HckPkD8078
 kJV3Crz/Tdxtsk3emogGzzOiLtJP+7aJxmJZd3WU7/kW2lQKEQ4TL2ghN6WGrY3WaLaqMYiZnXh
 nW0sCWOwLXCBzJrq0cQHUdMXo4pXPZK0kohzA/BWuikZSX4kd4QoAGhf1CQC5QfbEQbhFCwPivo
 q4blXicz18ieXt2YudY0rY2CNcNuCkilgYGRcVXADHXcW502fJE1Ms8J8yShKjIpbOxuoRTuvUy
 ZUsB9wIN/jue+WvURifbWuUjGeM51NWTR4OhhtccX7v1BpdtgakMIF3ROLVTE/BllT3MGpUAPWJ
 ZRXr2yWL4QaCg6anp+HRM18vsEoMS0c2zwPw2mjf/ANzbOwye19aulmzE5mQ1E5h2r102BFEKsp
 VgqJVNDqyHt9ZKR4n9nVmJ1GjIWnGa/T3hw7Be3GYwoO7zpnRbQWu2qlxycAXUtTwUnHVtPxRMd
 4OlzppCF3JJUtlJG5HA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA4OCBTYWx0ZWRfXxse+EWJ4jcvE
 l8dBjq1oFfNnqPYE7r9Bilfr4MSzLBJ7hmBrJPUrQD9zncNY3qQOVEqj6RbhGeYT3TOndkWkshM
 rO3VSnD4yrJ60zxU1iD/92eeRKH6opM=
X-Proofpoint-GUID: PLMDl3nTXzXDkasi4SPxfbe78kA1lXqJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_07,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080088

On Thu, Oct 08, 2026 at 06:49:18PM -0300, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> video_core_clk_src is marked CLK_IS_CRITICAL, so it is kept prepared and
> enabled from boot, and with it its parent XO, which the RPM then can
> never shut down. Nothing records why: the clock only feeds the video
> codec, whose driver enables the core clock it needs, and the same clock
> is not critical on MSM8996 or MSM8998.
> 
> Drop the flag.
> 
> Fixes: 5db3ae8b33de ("clk: qcom: Add SDM660 Multimedia Clock Controller (MMCC) driver")
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---
> Tested on a Motorola Moto X4 (SDM630): with the other votes that hold
> XO removed, the SoC shut XO down in every suspend with this change and
> in none without it. With the video codec enabled for the test, it
> probed and loaded its firmware, and the clock was off while the codec
> was idle.
> ---
>  drivers/clk/qcom/mmcc-sdm660.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
