Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9DA4DD3C0
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 13:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157706; cv=none; b=CPZ+PChtmCMtxC0nSziMQxyckzFscnYgFbOd4DisHSAd0J3+FgNiQ3tgE68oRhZK/Vv4sDMi+j2epoPs6/p+U1SgN1pRiBsknYzOdcPxkwr53stahwvc+Ufxk1T0qO3i7M8Kq1HOHTBDp3KHXhVNQTEzfEc8bJGPHfKabYWqaFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157706; c=relaxed/simple;
	bh=dRZedsXewJ7k0dyhzhYnHamgKjexRp9Kdmjv0oGUStA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dcoIZDnMA3EZSDxaXZHA8chmRL0+SPuMMsLNgjri4pazz2L7oOBnKFRDZSbeSZbHQv1NQg7kDplqDKYQuXTlzaf3MA7ebE72/nfPsH02dcxyvXv1DZ4U+XZV8f1boDR8iGP71RC/fnmaA9Nd8UEZwHpS7/UWQ6eKQ7uwwQn4h4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nKIsq1Yt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KFb5WlY3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nKIsq1Yt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KFb5WlY3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAGWI1983368
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 13:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	njwMX125nYX7Y7esAb3jpSpeXBBuKrFsO53FPtwpfrk=; b=nKIsq1Ytw8tE6UbQ
	rxgaLGfpqwjy8DGVazmvj4GzP7oq4Lz7JoePkCzfJ16uoPx5TSGQ/b2gPuXOU69O
	M5CQRRknKY479QI3FXU6TOAVecZkAtsJnuqoPdzX4DYc2JerXeHheLe18/P4iM3A
	fwCJATRY0sC9QBLNbHLBvSdEX6K9qGUtGnKfLQIEu9u6z9Atl0USZiwhHox4xzhy
	Io2T2cDn8OdCKMjdvbgT80iw570HRmI1NHXLu/5HKTxRKCiUIDAqyJlTJ2jaIzEa
	htUOlkbWbeexhENDXlGSFsl8UsHCMSrnxH9ohSc/kKrZ16dEKlHMp6yaZV5r2eBr
	HmGhDg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8a8au9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 13:35:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53389750985so13536421cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 06:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792157701; x=1792762501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=njwMX125nYX7Y7esAb3jpSpeXBBuKrFsO53FPtwpfrk=;
        b=KFb5WlY3UjzpDXOgsWFmoNZfiXHN/fz9/C92jS27oqt4v2PF32kIUIJMx0V7D6mROd
         WmqT9rsXOcGiHe1CAIKMx2cVBbESq9SWXIfbS7MH2+TS9pwsV0n9kHjkXKEnlHDweWJ5
         mSY113bpHB7oulB3mcA/yxyH5rA61SVpd+ujlyiZTECf9geSfiTZghllB7BrMN2wjXl0
         hG7KiYijdVUaP+R1zcxSe7ksU7EWoAWCoSjv5yxTRF2mIc74Nbl4QNL7NouOsXKhU22k
         SzdSHMXQVRne3CuULk/iETGIaf00ETc4SsaNSM3e+7nZFWqRmkvEQE/jRRTGzp+NyVPr
         iwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792157701; x=1792762501;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=njwMX125nYX7Y7esAb3jpSpeXBBuKrFsO53FPtwpfrk=;
        b=eSZh+zIndQYChIVt8hRK/XWz4kHqCI+H+lBcq9rCepg0gs+37YIN0pmN975G5oSkm4
         mLeq1cdJWj47X4bPY+aUDtFVaP7367QTHdOOWli7dtRSZj//+70NuMHqmiLKqHuLpsIK
         ePGBqoRE1gtxKQl1qcn76ZnSrW2D42B86JAy028ekUe81EnsPvZ2+Y2AchlHKu2hef3g
         A0ERGOX4jY3Ot2/3f0s4nK0spu2VNfpBbHVFisV8y1VKm1bzpQN+lQE4x0h0VTVhnyM+
         2Hq5R5+tw7yKhhjQ82lr8dj2hcdinlwsFXT1jA3CeCUeNkLh+P00Lr+ly9SD/CyJbN6m
         QO4g==
X-Forwarded-Encrypted: i=1; AKwUvBzoVmcCfRTsLLks3AlFU6Gf076mzVeBI3Q7NPGlyjVOOG0kMxA9vsp+839XDE9/5rWqiHFEn6ui7VlU6V0S@vger.kernel.org
X-Gm-Message-State: AFq9FYIQclBwKzH0a9YEGxUMvlEoQNK3szrEqFQB7Z0F5j9VXkauCAMZ
	E6bHU2Awfe3+1JLVYSUsXaNx7Y+u6S9u1QrJ94BoTiE7hzMktyR4ODTDyEwKiofbQTU918impCZ
	K2CdfONIsQ+k2ltIhNda/ywZ1cEgEQLO39I8gk6A+88GJKMm3ov/LBUjEFP7KqarJdPZN
X-Gm-Gg: AYBFou0dw5lK4laOEkYE9wuKY+slmlCdl7GxQ3fPu1PVv+/TuP2Z5HX9LkWiqp6pzpj
	QUBk4mX8ySqRhPW7pPLiys+Qx/nuNGwII7p9WbeRzLEJzNBSJ12NN9nPtd7cAymrB0rRUr27uDO
	RB/VlgByKVEEWmziV8SvjSGA2Vd8opu6BzzrnS/wRqH69vUcfdc5ryYWpaVrOWOEvkDAXbrK4Ft
	NFaSFctbf2pSBYHe+6jeOFfWFvKYTXQ6SSZfv9KlqsWYUILfafhk27ZNiHbCrgCUlgSyUcDM7hE
	AucteUrQTak/YW3LXxa+2DyIjO9NR7wsWgxPwBOuDU5k0vfPh+/Hxk+l0/iJ+qiyZGQbgLU4dPr
	MYQd12k2WIvxHrgDoB/CV3g==
X-Received: by 2002:a05:622a:1791:b0:535:162c:2e81 with SMTP id d75a77b69052e-535a014c6c7mr430286071cf.5.1792157700707;
        Fri, 16 Oct 2026 06:35:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1791:b0:535:162c:2e81 with SMTP id d75a77b69052e-535a014c6c7mr430285181cf.5.1792157700035;
        Fri, 16 Oct 2026 06:35:00 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb14a7sm73711666b.76.2026.10.16.06.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:34:59 -0700 (PDT)
Message-ID: <0e5b7d2e-e141-4ce4-a873-b65bd9ef3c4a@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 15:34:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] power: supply: qcom_battmgr: fix the battery current
 sign on Kaanapali
To: Joonhoe Kim <26rote@gmail.com>, sre@kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: kamal.wadhwa@oss.qualcomm.com, anjelique.melendez@oss.qualcomm.com,
        dhruvin.rajpura@oss.qualcomm.com, andersson@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016124806.1789-1-26rote@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016124806.1789-1-26rote@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NCBTYWx0ZWRfX317lFg51Yuz/
 alWV6e6wiCUjYYeXd9RAjMpE9r6Lkh0TbH9Sleafi1792XMa0CdeyxSmc0MnKn9zeV8oKvVAN97
 QyAhJm/HRbqVZxejqkv2HTRgwtlVp3o=
X-Proofpoint-ORIG-GUID: _ou_IiS1ZgKhxQYRh5QwwOJhTxBAgDEZ
X-Authority-Analysis: v=2.4 cv=GJadgeNK c=1 sm=1 tr=0 ts=6ad22805 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=gZfuR-GZJQvasSKj:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=DYa_1O34AAAA:8 a=pGLkceISAAAA:8 a=nbsK_V1Wq9JmJ-PpB0gA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=piCpHeHFVjWJlYWd443B:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NCBTYWx0ZWRfX4UGCwGPrOAXF
 JMhhUc1JamQ7rqw3ZiWBBcEao5NABneEiqdimLN4hFLrlQjPETyT1V5rQIUgkS/TwhF8AOAmEHh
 N9/BVOHPvBHDeXXd5ddFqzC6ORb9QTwX1RJd1bAK8i33R/Xw90Y6ZiRya70K5XwhgyWWUlfyNZM
 Lr9LA5obGHRROUh4cu77rdZc+NX0aSK1tnSbId6OiS52DPGwQaa+rJXmZdRy3azgLyKk3w+ss1s
 6gFyg5T2F1e0RX7p5UPE8r/swNqHD97MLTats74ZzRSA9+FPolZ3xRCknxkZXB7HRatFaUrldiV
 1gwD0TM7SjqAlY5UkH5dhvelVR+yriJY2N8q2lVspt0LByUy93VMAcg/iRinIbncb/rGRvXpMO+
 bq6MsQLxLDXmeFnPwarkvXgpX1GfPiK8fQjR+4/RIc6hk4SmHF5Q0gsQYMXXdA2FtB/tdThaJSm
 g93JJo4oKsu2h55wjPw==
X-Proofpoint-GUID: _ou_IiS1ZgKhxQYRh5QwwOJhTxBAgDEZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160054

On 10/16/26 2:48 PM, Joonhoe Kim wrote:
> The Kaanapali battery firmware reports the battery current with
> discharge positive: on a Lenovo Legion Tab Y700 Gen 5 current_now reads
> -9.1 A while charging and +0.57 A on battery. The power_supply ABI has
> charging positive, and upower reports such a charging battery as
> discharging.
> 
> Other firmware behind the same callback uses the ABI sign [1], so
> negate the value only for qcom,kaanapali-pmic-glink.
> 
> Fixes: 16a7c32e586e ("power: supply: qcom_battmgr: Add support for Glymur and Kaanapali")
> Link: https://lore.kernel.org/all/20260829054546.86210-1-jan.brummer@tabos.org/ [1]
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>
> ---
> I could only check this on one device, not on MTP or QRD firmware.
> Anjelique, could you confirm the sign there?
> 
> Both patches apply before or after my two battmgr patches still under
> review (USB_ADAP_TYPE v2 and the USB input current limit).

+Jingyi could you please check if this applies to QRD/MTP?

Konrad

> 
>  drivers/power/supply/qcom_battmgr.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
> index a7237ba09be1..0d55458b2881 100644
> --- a/drivers/power/supply/qcom_battmgr.c
> +++ b/drivers/power/supply/qcom_battmgr.c
> @@ -313,6 +313,7 @@ struct qcom_battmgr {
>  	struct pmic_glink_client *client;
>  
>  	enum qcom_battmgr_variant variant;
> +	bool current_inverted;
>  
>  	struct power_supply *ac_psy;
>  	struct power_supply *bat_psy;
> @@ -1435,6 +1436,8 @@ static void qcom_battmgr_sm8350_callback(struct qcom_battmgr *battmgr,
>  			break;
>  		case BATT_CURR_NOW:
>  			battmgr->status.current_now = le32_to_cpu(resp->intval.value);
> +			if (battmgr->current_inverted)
> +				battmgr->status.current_now = -battmgr->status.current_now;
>  			break;
>  		case BATT_TEMP:
>  			val = le32_to_cpu(resp->intval.value);
> @@ -1659,6 +1662,9 @@ static int qcom_battmgr_probe(struct auxiliary_device *adev,
>  	else
>  		battmgr->variant = QCOM_BATTMGR_SM8350;
>  
> +	battmgr->current_inverted = device_is_compatible(dev->parent,
> +							 "qcom,kaanapali-pmic-glink");
> +
>  	ret = qcom_battmgr_charge_control_thresholds_init(battmgr);
>  	if (ret < 0)
>  		return dev_err_probe(dev, ret,
> 
> base-commit: b810335a0699d1810683796b0e3ffe8827ddfe6c
