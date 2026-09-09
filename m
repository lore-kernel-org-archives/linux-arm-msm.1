Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3944E5505DF
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 12:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788955943; cv=none; b=IEf3TMKKjMEIxfNhx6FZiLcwjKZjEyRL7dixl9rekwAs1mFXv+MKTjTnczSKaGfb7e8QuuFq8RRdDwMJ4yB4EKEZr+tru3255HzufHZhsjuacvm5TNPybyXH6WaGC9CdlqZi5FLiN0WqgRkSnjz6lx8HZ5x4EtjEMIieqFFC+aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788955943; c=relaxed/simple;
	bh=31CCzmJ9mUdDNRl82f6pdz6H2VXsBhLBUJvmcItofrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ar7xQcSdsj1NGiU7gE7F3T/gWyBklMbpnECx92ASSSzgOr8+9fiqeTShO4XnRrpXobJ982tHMKllE16kMOCocyy+l0ALikeeCf6rub+DGDH1FUrAauzK8ZhVl0pA+BIc5xzdtzHMveB/+bnMd2uWQ/K3I2WiLsd1GkgKrMvs9Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JRIeJlJl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OJdKI+p8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JRIeJlJl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OJdKI+p8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUAUG1843008
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 12:12:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1BTQYNCRWWifNWNawrPpsyR4
	zn15wpTVJTQ9AFXK2Mw=; b=JRIeJlJl8X6YtscUPWlEZoXb8vqsBhqoyCyD1I6m
	Wj+dD6VyxADamLU74QTGu9HSfnT1V1kZxb+ah3kPfV/T9NcmB8bzEFgzjuEE7/4R
	jAbWaZkHxXUbn1qFUFEx9k3vaE9prYApK2To0IolK5RgLj9VtH0yQoyd0wiKopYm
	udC2EDIuT8wsUrr7FcyV1jzD8qpa2qNf75tJlXwJGfmSolLtEmltFxtTOtetwrl6
	zxAOXylgiD7AaCnfd2TcAXpSniHeyTSGTIaZ7g7Gbu6KYfWn93knDlg/9lUzicUc
	2bN1TBGMuzPzr51geupqZVCM+8cwogNfNzcHsO99NCTplQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjxqja5dm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 12:12:20 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73850dfc198so635631137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 05:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788955939; x=1789560739; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1BTQYNCRWWifNWNawrPpsyR4zn15wpTVJTQ9AFXK2Mw=;
        b=OJdKI+p8um+KDYErEnBlW+HIUmnG2vSXkyFgsVpYVKtAfQFbfTW87GYnN+xn8+NbBq
         zYIc9JobNkog75UlP3Dv7A3okIFSgX91J78obmPA/HXbc2xLu30EcJBKYTHO6FhjrkZM
         d83S1uVJ4dFr3qq+V98K2TsFcurWE16FEtAtVvB16IkUd8EGKB4AvXcWxugJlfy/FPQE
         zGXSXPFwpzOYXB2VbvGwHAx7pIF54iZfPZSdfc2oEbn303ZYpZvjpavsU7bqiKh1t2m8
         k+dTlVlMfii0/v9v1f2LxajAdQjIOKGXkIpS42eT9b2i7XD5rlbE4K58K4VSZCRek0Ot
         y05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788955939; x=1789560739;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1BTQYNCRWWifNWNawrPpsyR4zn15wpTVJTQ9AFXK2Mw=;
        b=eWZPZahKgCeBIJ/gXBmlOsY1/srG/R7IzUM04mVh2JV5amX3sjG9j0izqImZD7DU0+
         z6dWKXjQhx2Bok3ik716YMSDR2v3oZlHggjC5sprCGv+MCpe4x9U/+ZjjSs4MIuj2kcJ
         Zoag9Jm/IxeDxs2+ZhTBsNXYl+M0GOZ15+DEQnaFLZ5QZUzGX7K7vjK/zaqgS/RLMqR2
         ZV2GaLgxNYtqfTJLUkcDOKREsx1BxqZ6f6Z+qDKiEopKB4uSikWRZEnlmdAIiyjKu+if
         JX99C8Va5X6gTWLrHPjCXRlvAHliUPgWDDF/H+FwX1x6KdHtw2lLmfjDFtcJgF2Wf2sL
         zumQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdmtyX4MbPfJV02pz2jWeoBRdwmQ8kKLJGn6QEWgwncXZZ6h4EGRK/mm5D9+0aBtbIGsnV2umkAEyl4Vz1@vger.kernel.org
X-Gm-Message-State: AFuF++k/8UGeUFPVegzayHgJ5qEdAPesPzZIBqux1l4jXxZDGdJeRBz5
	H3/ZLFLdFGF2zzlFKloLUAs1pg0k18878V0EllU1+e3KeprK+7n/lcm7R7+JfxohwNyLv5Trfo5
	h7X37ZJcBwdPWvFsernQVs3gXW4VOd0bgQwXPRDzu337N7LNxbJCjUTAAp3JJiWLxRtl6+ud+Wg
	Vj
X-Gm-Gg: AYBFou0hwDBvyfg3jum/0QU7xp26pE2enZOvksltYPprT6F+sqiBtdq5R7+Txg9tQkR
	axm6f6pSRppFYA4Me/WAEaFw5Ro3O9YrHtaRROrfDSod7H+bfCICKX8EEXBt0v4qOTo7dEjc6z3
	gh8K3v5xje4ks6AsUoOfdraDbviEKF3sgoqtKli5XfAm2Jw21q91xwKO4gmVfyJA+rBoAB4NUwl
	GZbp7hJRG05qR9lH9NASFHq9snP9VuRboHv4oEjbKosI1lUa67+snwjZWqQK/EqA/jCx7dmeGgn
	HnLoHa+MPwsd/9yNE4UsSLOLOSxiURThkGZjyyEQ5DTIO8MPvi2bZwSoUKl70lkTQ64PB4KsNMs
	PK7KRT8k1yGTtSr+yVHRrjkcAsA7i7Puhi/i33rWKcopB2wgGYJvMjiDtHfpbmehc8IEJq8qgHM
	uzrl1KBWH0MgsV
X-Received: by 2002:a05:6102:54a6:b0:785:e069:6c5 with SMTP id ada2fe7eead31-790776ffba8mr289213137.8.1788955939216;
        Wed, 09 Sep 2026 05:12:19 -0700 (PDT)
X-Received: by 2002:a05:6102:54a6:b0:785:e069:6c5 with SMTP id ada2fe7eead31-790776ffba8mr289186137.8.1788955938751;
        Wed, 09 Sep 2026 05:12:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b74cbfdfd7sm3249322e87.75.2026.09.09.05.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:12:17 -0700 (PDT)
Date: Wed, 9 Sep 2026 15:12:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Sebastian Reichel <sre@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] power: reset: qcom-pon: Drop reason shift for PMK8350
Message-ID: <4tghecpbblnbyqbdj2y2ma553sswccycw3hflspqoxrvr3d2kq@q5jzvzwq3jah>
References: <20260907-pon-pbs-v1-1-cff2f5810769@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-pon-pbs-v1-1-cff2f5810769@pm.me>
X-Proofpoint-ORIG-GUID: ADFq--0m5oWD1QI7KX55DZwiAol-VY_W
X-Proofpoint-GUID: ADFq--0m5oWD1QI7KX55DZwiAol-VY_W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzNiBTYWx0ZWRfXzu2N+ymX+K5R
 6jAuVy6nzojFCNeOTxX58IC7MPATFvqe+wkxRL7UecqSdv72NOF/SnhsPy83y+iX81mJwv9cwHR
 5FfanF5Pg2ir5UmUiDrEm24zHHGWhpxR/74xXqqYxadhonMie5FSLDozZaw11BBe95dsEMsev3q
 LlOKCMpz5zF+axxheZMHDc3kK5f1mro7Q2GQ7lbQzEgncZ2+DEWWA6ZPFv4B67qnEWX6lniNIZh
 CqtDjQKJt4dKAkONhJfLHhgDvJwJsrKZgJMHGQoYRX4Xq0GQSrr9jskOLkdSlviJsM/Z4eOHdJi
 wyD3fUq/mt+thDNOK6Ub1S8dzmkTWoHA3nnScUwTOpbyoo/7ukh8lCUdOdMCaU0MSpHcOXyneHR
 3BbNtT+4UPR+Q7qwxQzSA3zxish9igxJkzJM1peZvJr707VszYeItw+0xTfKYEImsxn62mhmW+B
 ORWSM5Pn8F3ECkQgwnQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzNiBTYWx0ZWRfX3vWPZjUMVq8e
 R7K80rxT55RfnDONEhnFVPlzXAo0ULjpBBg8AarpbFJElMss9k9RYWKGeiZJsPfCVNq4svnsNEl
 F3SSWd9WJaw7h69jpwG03v8hm2KFzms=
X-Authority-Analysis: v=2.4 cv=f/p4wuyM c=1 sm=1 tr=0 ts=6aa14d24 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=XjHw8PULWccToXi1muEA:9
 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090136

On Mon, Sep 07, 2026 at 04:44:29PM +0000, Alexander Koskovich wrote:
> On the PMK8350 the SOFT_RB_SPARE register does not exist, the reset
> reason is instead kept in SDAM and written through the reboot-reason
> nvmem cell.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
> Would like some feedback on this as I'm seeing conflicting results,
> SOFT_RB_SPARE does not exist on HLOS but it looks like the downstream
> qpnp-power-on driver writes to XVDD_RB_SPARE2 for GEN3, which is on PBS.
> 
> Though, targets like waipio don't seem to have access to write to PBS
> from HLOS? Get SPMI errors when I try. Didn't have an issue doing so on
> milos though.

It well might be that the PMIC has the spare register but whether it
gets used or not depends on the platform (and the firmware) rather than
the PMIC.

> 
> Besides, the bindings doesn't allow reboot modes on PMK8350 so maybe
> setting no reason shift is correct regardless so it gets skipped?
> ---
>  drivers/power/reset/qcom-pon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
> index 7e108982a582..9cd55f5536b4 100644
> --- a/drivers/power/reset/qcom-pon.c
> +++ b/drivers/power/reset/qcom-pon.c
> @@ -90,7 +90,7 @@ static const struct of_device_id qcom_pon_id_table[] = {
>  	{ .compatible = "qcom,pm8941-pon", .data = (void *)NO_REASON_SHIFT },
>  	{ .compatible = "qcom,pms405-pon", .data = (void *)GEN1_REASON_SHIFT },
>  	{ .compatible = "qcom,pm8998-pon", .data = (void *)GEN2_REASON_SHIFT },
> -	{ .compatible = "qcom,pmk8350-pon", .data = (void *)GEN2_REASON_SHIFT },
> +	{ .compatible = "qcom,pmk8350-pon", .data = (void *)NO_REASON_SHIFT },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, qcom_pon_id_table);
> 
> ---
> base-commit: 944a035ecca915ae947905dcfb03f2b9dc6d032c
> change-id: 20260907-pon-pbs-76b7ecaafe33
> 
> Best regards,
> -- 
> Alexander Koskovich <akoskovich@pm.me>
> 
> 

-- 
With best wishes
Dmitry
