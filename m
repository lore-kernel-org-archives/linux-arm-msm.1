Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794F139D6F6
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 18:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785780734; cv=none; b=cVkThRVPFA0c9vBnU/cZrtHo/F0dPFDDymHiWBfh1N/vvJwJ5ARnqf/6yCjGbpmlakvNLSVTYPCouaenddVfuUKJMdTGAutCUBbvUBLU7oiryqGG0OcDsfjAiNXbT6qvyUHcFY3YTFqyhslN7rAcUB82R+dWsTB0xWl9Ae1ZSfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785780734; c=relaxed/simple;
	bh=zV40Ig/Q47xgMmfb1w1DsDefx9nFfpfRri82MNiTCHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ryt9zPsvG6wnlFd5ZzWq2avepm8H+4tnrorpYBTQ0WDldmp/S7Tp65xeXqU96a9nSoJ18wF2MfifYX1prbZAhlZBXz4IX3lza3KHPBPQ7HBq5TrS8QYd1ezA8vNszOz71Um+pgguG+G9dcQbPw3Wr6fkAy//4+qcl03O3dzAMdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FcsUUb6O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HDA5kLPd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FcsUUb6O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HDA5kLPd"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673Gw1On974057
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 18:12:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r0BAKzWOvEXoVkK4l8UklRSB
	xzayU8+csMIB3SSayVA=; b=FcsUUb6OX4P25AIoFQL+6zEGUzyOBtu3kP10Y7uP
	5jxOEKdtYcBue0BSxy09wtdx0zSSTyIueZJH5j8s2SBXcBS+6+keWB6ezK8aHm1x
	B43GnxOuM6q37pBt62x1ruySdbx35ykrrjJJ/dQJEFoZJP9ftpoMrzP6bRe/FcDW
	4QR0IqXRonrS15OD+D8XHTIfwpTnJjDV6K6MwELVZYpSb4VT6KZkvcBLPU5litTV
	7M9w+Ne539q+lomMxcKJCCJY8j2DkQW8MvK/5enGky5nukdXZOw/bAEQvG8MtYvO
	eNQrGWKjNqWcpguHYOtrvemCd5Sv2Y4R4kpjlnpKyrWVGw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhb33b9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 18:12:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c19493ac2so41993511cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 11:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785780732; x=1786385532; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r0BAKzWOvEXoVkK4l8UklRSBxzayU8+csMIB3SSayVA=;
        b=HDA5kLPdBWU9ipU0JQuA3jvLv6YgRvdB2r4jJt7ywlQoz2L5qgYAsdUtRkHGrWYR3d
         c32lWAJu4rts4pZtPB+3Cfr7ich6Ik5BcGKuOShBvcAxXEaOy8Y4ONY0wOY4SmgN7Pfm
         13gIxQwL6Jbz/IED9Uo781lcrvgsz0iH8WKeq4trKMVkwGc97do8BbFABkdB7d+GDTXM
         ODQM9Liq3Gr+w2DH73mCPUhhHjbf9Zm+shAfzBm1TVR4yRnVy88kOXtiUnA6fpxmshir
         Ep5Z1GqV2qQKT0AQUgt1TQUnopBRScieNLpDJMn7Rc8gBIegMh/T1lZesfq5O0gcTFrI
         tE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785780732; x=1786385532;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r0BAKzWOvEXoVkK4l8UklRSBxzayU8+csMIB3SSayVA=;
        b=HB/ZkY+GM/cZu5PT8Rqaqj2di43Kgee9Z6LG7M9rO/5gSgBBBeapeqjjAKxMLklXfi
         GIufbdOon5MiGZV3FdLaEeYAmkso0XOxuGWdtj9I6X/UtBawn17VmiLPt0EkJLXL3iDJ
         AD7S/lUcO1uD50HAT60JqXsxxN6OEwhfQEn+S5eRnOLv27hT0r2LEF+aW6qRYn0IblM5
         SN3H1s/4tCq6iqH13qpFDkN4DXmirNNC+Vgqg7HoDM+7BG8rGhvEFh7foJfBEB+cUwqY
         l6rnKoiWIhlz77iE548QQrKc7f1f3Y8hx052FX7qkkaykMmfvhjGPOGf7O76kddeNm1V
         DJ8A==
X-Forwarded-Encrypted: i=1; AHgh+Rp5PQUJoFeEJfU+9Kt4H62+t93MyFXLzUuXySS3P+awD4nRJ/CbYsRIEm5XbncAZ8LgSuNPoMOA3Yy76vfv@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9cEmR766Hi4mktlwvcCw7vIMXPJCjqjUZoexFvIa6sHOum8DD
	GGcIK4BgMObqx/UD633l3Y05B+tHUaLbHgLVQ/rC5GHzRjTwIlI4gG3nOu1t2tfnjyh1b22DSG3
	EwsYhXICgz3i5qpZ6yvaYwp5eHdiCf4UVh95289k02dZN6trAIji4Q3i5U8l7DtNvvyr1
X-Gm-Gg: AR+sD11MHgeGenLoo7ZGnF+C2dUy3gH9vZSiSjvzNaIGiwqbLO0inOBSJutf8TkkXwW
	h4A6LG95TUclDG6cXTnUjecinfDjuEOX0EYoVIpyyvTaKKYMghK5M2HYnFjOUv9ap15CTzrKqdl
	b9DKibPbZJ7790WqcljV+FKRqHEDcyReD4wDrDVNPuEACm4Ueq06A/xKpJ7u9Kfq1lWMj9gbKqb
	Jmmjic6NC0m4K2J6rQ71chOJ4zQ5w3DWD/5W0R+mvRdpqTy58p768tPcIewUtFEWpGogPEYL8qS
	gIxunh/x4xPx7y2KPvfHs+QeROeMXUhFRVcF4nwxdthh6prIYG1r9xKNM6vZiPfftibzxGvJAFe
	iPQLXEdZnl60J1uChqV08afBVwTeLBwPTtalyN3J5RMJpwpX/9s4eWtwoTWhjDx56Vc8qX8QxSs
	MQDl2U0Bx1E9Jj0g==
X-Received: by 2002:a05:622a:53c3:b0:528:3ae6:14b1 with SMTP id d75a77b69052e-52b5684b9aemr192077781cf.43.1785780731770;
        Mon, 03 Aug 2026 11:12:11 -0700 (PDT)
X-Received: by 2002:a05:622a:53c3:b0:528:3ae6:14b1 with SMTP id d75a77b69052e-52b5684b9aemr192076911cf.43.1785780731161;
        Mon, 03 Aug 2026 11:12:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f810a05b6sm15787181fa.3.2026.08.03.11.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:12:08 -0700 (PDT)
Date: Mon, 3 Aug 2026 21:12:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: ebiggers@kernel.org, ulf.hansson@linaro.org, adrian.hunter@intel.com,
        quic_dmukhopa@quicinc.com, quic_rampraka@quicinc.com,
        quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_gaurkash@quicinc.com,
        quic_sartgarg@quicinc.com, ram.gupta@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v6 1/2] mmc: Allow host driver to control the
 re-programming of crypto keys
Message-ID: <wz2zgw7kp7vsc3r43wa2kssi4niy5itsmee5rbnki6lfvmid4z@qdt6ib3sj4wl>
References: <20260803163123.1802005-1-neeraj.soni@oss.qualcomm.com>
 <20260803163123.1802005-2-neeraj.soni@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803163123.1802005-2-neeraj.soni@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: fNkzCJhB2LjvETRlDmejw2DfiVHDdAoD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE2MiBTYWx0ZWRfX8M8Gy4IZBaWv
 NyKTEq9aA3+H97EYI6iFixOgkCjVKhS5f4e2/aZv2xumkKm3nf8wDAUl6eyAG1C5IbHvvOCfjrc
 ZpFfiyXmKBNJl5m7gIgGAdQYM3dR3cs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE2MiBTYWx0ZWRfXyFWeckRbe8QN
 vUo1fxAiFMiDpgrvv++hpUpmznuOoF6XqL8XmMo1NEPpEhBHi0RmSPDWAf5mwQ2iENStb7VSEEI
 LW0OYLs2YJKYWKshTJkySBDrboeBzpcg0b0a2ooekyQF4QIVfQFn7M+znGgUwxWfSBkkCVvF8yj
 YWvMFjYhZg2qV+p0WHTLzlmTyIAItgsz/eErjD1LEIC6C7Dxucs4087lGdgmaMqiz73IKB4DaRa
 ExjG5U0589KU/9BJI9wSeZS5sNPDp0oqJA+iVPJqOM+QWFZ22Vv9Mk2QdMCrdtBwBhBJ2gx2yrR
 0sPq5gITKdVAmkFrp0nk0QFIRNb24h59aLxxCx1Dh6tQ1N4RId88oaaoY1bR6UWeL8ImF/R+/R8
 THynDBtGlwcwmni4bHrvk7pgjZhrruleVDtKICrQRbD/Gr5SNPvlgekbQLSs5e1eoZOeBp3e6RI
 tGucJESA37xZ8VApeDw==
X-Proofpoint-GUID: fNkzCJhB2LjvETRlDmejw2DfiVHDdAoD
X-Authority-Analysis: v=2.4 cv=bKEm5v+Z c=1 sm=1 tr=0 ts=6a70d9fc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=Ria5deTLU_ndSx9n1-gA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030162

On Mon, Aug 03, 2026 at 10:01:22PM +0530, Neeraj Soni wrote:
> The register context for the crypto profile belongs to the
> sdhci/cqhci host and not the mmc card, hence re-programming should be
> managed by the host driver itself.

Don't you have a reference to the host in the function?

> 
> Add the flag MMC_CAP2_CRYPTO_NO_REPROG as part of host->caps2 to control
> reprogramming keys to crypto engine for SoCs which do not require this
> feature.
> 
> Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
> Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
> Co-developed-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> Signed-off-by: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
> ---
>  drivers/mmc/core/crypto.c | 2 +-
>  include/linux/mmc/host.h  | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/core/crypto.c b/drivers/mmc/core/crypto.c
> index fec4fbf16a5b..a5a90bfc634e 100644
> --- a/drivers/mmc/core/crypto.c
> +++ b/drivers/mmc/core/crypto.c
> @@ -15,7 +15,7 @@
>  void mmc_crypto_set_initial_state(struct mmc_host *host)
>  {
>  	/* Reset might clear all keys, so reprogram all the keys. */
> -	if (host->caps2 & MMC_CAP2_CRYPTO)
> +	if ((host->caps2 & MMC_CAP2_CRYPTO) && !(host->caps2 & MMC_CAP2_CRYPTO_NO_REPROG))
>  		blk_crypto_reprogram_all_keys(&host->crypto_profile);
>  }

-- 
With best wishes
Dmitry
