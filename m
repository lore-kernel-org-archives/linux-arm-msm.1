Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792666896;
	b=VoMAAIFoy61p7azHiRCNd/Hd2isRGlDVpp7X/a2VEFxree2MtjRMp72NTuilvoUlkE2L
	 FmUfS/rb3B+sNTFci47bDk1xfSmSUk8iLNe+4oWyc76PiX2uPYJ45qRiUDCEngMHRZ3xu
	 zrD+vGDAx0zCa9KWPR4BVpP489YW6JC0Yt6Tw6aTPSeCsmuFy8ATJsvTaaPbG+e4ND/ou
	 F+8tEWOeTaHzHyt3qXuhcZq5jjYXX39gZQhVE42GDL/f+eq27TpV+7WWvDwCGgjAtCZ1o
	 //EVBbQnNc2h6TwtEeDCg6zndmMeEcq0+GXIGNmLl5wIgQGv8kVQMtcLeRwfFjwFr6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792666896;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=h5KbZjkHI+qASxHH5C1P7BwhKMwlWe8TrkEBvRsRJrQ=;
	b=YPRNw51CmrFodSYWi2CBnOqt7SWeoMaSE6mxC+3ShDSJHOTAOTcCRb1ZU7ooU2iL03on
	 RqXtC6yJfV6Q8qCMpkDsDBcCut0uW1oD0cpVOH4kWkkDo/81+yXoYshWXqMn64arObqwA
	 392BP2wpQQhTPUZ2sdgf7xPlNOtzjz2FHIvVUjooX4w+4vhWYroElKMvH2jB0JQ0mgOSr
	 j0f7I11lJN4cuRjzWJJPFiqa0IpdrU88oPy6EhGslSq280TBLolJWZYCpBtxDWSJFvJT+
	 6K/M+10OZquU+TYfqFuAg8BU/1hUUoRsZBe8YY4gdpyCkM5XaNuil1JH9fFVKCmjkbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VQmtlaS9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HHLNItX6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27093606A32C
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27093606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VQmtlaS9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HHLNItX6
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xmw4317711
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h5KbZjkHI+qASxHH5C1P7BwhKMwlWe8TrkEBvRsRJrQ=; b=VQmtlaS97nGOD0lY
	HrDLOen9H7Q2dMF1UOwPZnBC1Qsgdgz+zz1bw5z3Sa0cbj8T0NzItgRlWjO+9xEt
	h3LkI8Ufnv9XhhiQR03CjCImEWb2Vtky7z8MSEY6gGDmfBrPfYy2xU80gGOU6y9T
	q8NruAikgGxk728bw3E/9vKum8wtjeNm9Ml9t+zQjKKrTEi/y/w/29OqO1rKccXP
	Pg6W5XHtG0bEr4jplWSIaQsLHuI/BnnjPpEQyyVNxGboCkQe4GF/ebO24P+NtzV2
	r1lnK7RdU2wmmYOc3mHCYpZO6P3BPUm3GlN8CNqWbpqTzUWfsv+Uz/MDsZ+UdY+n
	va/mmw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ajes6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:01:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cac495d99so31807585a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 04:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792666894; x=1793271694; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h5KbZjkHI+qASxHH5C1P7BwhKMwlWe8TrkEBvRsRJrQ=;
        b=HHLNItX6KVJNSDlTp3rOL9yAroyxN6kCveAXK8smjConiKNpE8Sh/62mQa5OvR892P
         2HAnxm6npMya/YAUxFW/ZmqUYtNGyCJFkHyihoKg64oBDREmRf7jHFEPnM7VMN78Lzeb
         6uuLRzoFSHANa5rEXy5aArbBu3NiyfF4eaY03WJlHvldm+x2qKxJRPQ2+AP8Z9a/2VOK
         eF4OwiC3AD30FmNo+5J5Su1nCA7wwUl4XY95AZBl2nsinrWwAaXKKB/arQutNIVrEQY3
         ympGt5zwC4lj3fZ2KxlQK4abBfUtnL1YdQKUFyfw0sEFrqrDUlcGAVX23a6oiADI1gHn
         vm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792666894; x=1793271694;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h5KbZjkHI+qASxHH5C1P7BwhKMwlWe8TrkEBvRsRJrQ=;
        b=nPYpm8NWkAZuMjshMzaYayakZ78Sab+gWaYaIZO/4hqssoQKDB36cr/0m6bI5kQS4n
         ha3ERhGTZLAs9zsCWlJdwTKQc2BojmrC/3/pUoOCkSSUJGBwVFROxzZv4fm6BO+CCgnm
         KSey/4PurCr0LkMB0BlvvxYKGH0RtC03H1Bj6/aBqyF3C7Z0KjQYBTW2frhgAhHYHwoi
         UI2ZOtjC2Pj8gDOpKfRDolT1BNyOHjlAevF4GVYa7KO7P4xTP5lEtSbTXmtxjWzfMGPY
         U6e4D26Mvx6/XTAwvt/zdLhzgeftcFo+CpRWNrexi3SWwiZQHJyDDalPAXd3ekuw0IXG
         16Gg==
X-Gm-Message-State: AFq9FYJ9epXwWoW90HRPqs0Ri8WlErpFod/kJ2IaN5sSEo34vVLDL618
	cEGPy06cjve1rs5/n+78NmYyHy1iPZ4900gMbwjbKsZuNMZ1GADdRJ1eRJ/CFB5Wng91GVFgFgU
	FNcJSUSd9QUmOg0I/NXiVQg7Siwb/niiixHSG5PDYjZq8OIa7I4k+a0kkpJWyAdvA0Uce5/mXxl
	d9
X-Gm-Gg: AYBFou2SySMAP+apIfd4kNez5CQGSARWcfeEQiyLt9R2xEea5DdWsvGKO67HZkxyPJt
	tiAv9gd5QQbFwijM24s0wzJpBdfbC6nF1Z74jkbKmmqOOeOPEiSUP3uaPG07EHDiOZXYGjmOy7t
	UTqCOhPMyAESY9fXF9hDFDusy88z3n/1UT8mp0SnA8oW6xTkJIh2ONXepFUcB4wGpUReWXh1JIf
	9zwEhrtrk8zTiOj+taF/hxsNtnIrVavfVgwnlJVA2gJAaSxasoppsYSM7JQkmC5YwmUaQ/QdGAM
	/+MXLbhrSKHmZXTPR40w4ExsX5BNc1gjmJbeD18/NgZWanjuQ7b78uUa6ZHe/PR7Cw7DM0zcMcZ
	ZvP8AUWZd7axVC5Yu/3/CWA==
X-Received: by 2002:a05:620a:450e:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93f57faf861mr1060083885a.4.1792666888540;
        Thu, 22 Oct 2026 04:01:28 -0700 (PDT)
X-Received: by 2002:a05:620a:450e:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93f57faf861mr1060075985a.4.1792666887962;
        Thu, 22 Oct 2026 04:01:27 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a4ffd13sm91654866b.20.2026.10.22.04.01.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 04:01:26 -0700 (PDT)
Message-ID: <d808c486-42be-41f8-9f45-0d935c2a57a9@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 13:01:23 +0200
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
Subject: Re: [PATCH v5 11/11] phy: qualcomm: qmp-combo: Fix error propagation
 in qmp_combo_dp_power_on()
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa
 <abelvesa@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
 <20261001-glymur-phy-v3-v5-11-3848c2615d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001-glymur-phy-v3-v5-11-3848c2615d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MyBTYWx0ZWRfX9u5/M+wj4uYv
 1foNI4VQcXput1AgUGeo+FeCSC2D8QaatTnFAzWqo7kW6M2qX6zcW41xCnvwH7Thn5BM0EGQfoA
 MTK4TtoJH6bckLlbPtjv5aqxUBulwMkLqi56b5zoI2Cy7RpSsQPIg1M0aF17mzQsURhOT2Oexjo
 pKsRn7SQmMgY3A1l7daIY6cdCPNBQflV8Slk9AtyBzks+Ud3Hp38bFXq6s62l1CxO9VmjVR9DYc
 oBbJFwSsEgq7AP2zGDYF52WbvbngG8W0mvnl5eyIpL5nY6FSceToYB95FjHKWEMuW78mPmNDlmf
 +HS/L3yX/O93dA/fk6I9168bMuPX2OgKIiJOFrVROhBwrqsiXxLjfyhrtizQEfuz3wlazPmrzS+
 bfDI3k5RKb6+YsUcsl5i7pY3ho9hP7JzLBGfOikq1GqzvYjZX0u9+QwaTWONgaF0VylDccav9cX
 sQdjJYaKTczmkYdKLXQ==
X-Authority-Analysis: v=2.4 cv=H7FOUOYi c=1 sm=1 tr=0 ts=6ad9ed0e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=1jkgN9UX300lxNHWC5EA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: sS2Yd4C2LJGwY_1t5GiQn_m9BX8hug5i
X-Proofpoint-GUID: sS2Yd4C2LJGwY_1t5GiQn_m9BX8hug5i
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MyBTYWx0ZWRfXy/M3rpDKbAUR
 ljuksZNpXscRBYI+Z1vkyK9yr1/Kp8rsgXWsWUjW4V5g5FbaUWG5GFT2d4VTtG9YkH1uhdAsCFY
 schuSVwypEFE0rdyMEFxX6SXHv8aaf4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220043

On 10/1/26 11:34 AM, Nabige Aala wrote:
> The configure_dp_phy() callback can return an error (e.g. -ETIMEDOUT on
> PLL lock failure), but qmp_combo_dp_power_on() was ignoring the return
> value and always returning 0.
> 
> Capture the return value, skip setting dp_powered_on on failure, and
> propagate the error to the caller.
> 
> Fixes: dd1153651b038 ("phy: qcom-qmp-combo: merge driver data")
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 5bbb2b5f8c74..13d5586b981c 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -4376,6 +4376,7 @@ static int qmp_combo_dp_power_on(struct phy *phy)
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
>  	void __iomem *tx = qmp->dp_tx;
>  	void __iomem *tx2 = qmp->dp_tx2;
> +	int ret;
>  
>  	mutex_lock(&qmp->phy_mutex);
>  
> @@ -4388,13 +4389,17 @@ static int qmp_combo_dp_power_on(struct phy *phy)
>  	cfg->configure_dp_tx(qmp);
>  
>  	/* Configure link rate, swing, etc. */
> -	cfg->configure_dp_phy(qmp);
> +	ret = cfg->configure_dp_phy(qmp);
> +	if (ret) {
> +		dev_err(qmp->dev, "DP PHY configuration failed: %d\n", ret);
> +		goto out_unlock;

Please switch to guard(mutex) which will let you remove the goto

Konrad
