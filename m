Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E50A318ED6
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784559752; cv=none; b=SYyRJEhK/utr+0JFu84AotYPofMzyHt4Hi1HSBvYiwe8lkkRzkNzJqKq0pQFvIp0zyeTOJ5cokRwpl0iGeI5FM88JpPplHC9++pAW+P/N1ftydIvvDcm3pfgLbWJwZM8opX3uq2OsMtYtOpqrSgBOnegUh+3HhiVdoQ2Q+s9rNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784559752; c=relaxed/simple;
	bh=uJpumEa60QPZADqxRWofuPqkQDFelr+xSr0q38FeboY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YT6xj9HfEylRvNEwY9kGhjN4fCaCB+qOjiyhiAtcvYTBenuhGtmP6aNfRI63TFV5nTtConXZpBUIsoQNYTYEd9w1drprZKmgp8HXfPpMFXu3wpX5g3OXvZZcw84sLJQm+pHpPsDVCnbQxj3w6zxadif9QiHLLYFuQFKMLXj/f3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+EWRp2Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h4xXEP2R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+EWRp2Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h4xXEP2R"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KDrFhx3860057
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QeHXLsm10YZKxXcyqEV6Iibx
	gMejCHIoggLLl0oeOkE=; b=S+EWRp2QvefFTeCHnxclDVi9ovX5Nt42G56PIN44
	pF5COMhMTPJxXak11m/FHsctPXIxqwBw37qLHIr5QbDxF+0ppfksC5sIwZ7YotKN
	nQaRVSOVfCZdxbF9lDFcmv2mQUJtepbuYGxZu8tEBbT0XVzEnLhjysUgJGfoaScG
	n+v76EaIEIJJeNq7XobU/91yMYW6vdJHJU1ujsIG+ZTVkSV5O+FjT+x2MAuCcacI
	VxKt0JDbiKcRZdyXqWl9e3b2Vx3DQRmrOo3bEc1hmu/0MKPK6cAnGrJoW82OZvHW
	/qWv5C8pesKEVGNA2skP33WqO1sJzJo/W1u7BDAQUMKCRw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfpg1whs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:02:29 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-744e7cb9f24so2487680137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784559741; x=1785164541; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QeHXLsm10YZKxXcyqEV6IibxgMejCHIoggLLl0oeOkE=;
        b=h4xXEP2R0hwo2jAxOXoqG2iktmYay/S4Mi7B2J3Ax7nE99ENZmB0GWT2IQinI4QrRS
         XWndIQyAqK6mroMuKp/7SLpTTlZWm5Fq32fJXRwLnn/t+9E5DLZFwminoCJJykH/Xemn
         JZM5sY+sSonTeLTfgQWcF7zpk/M8wQdd+KvaxWbGYHh30wXAYDo0+ZUtAeHB+PwqGmIx
         ufOw9rIr+O6stmy39bL3T6qaqgsbmg1S8/Opn2J8DYZj0NIaob1ygtvA1gPibs+Uvi4P
         78qtInuTQ19sV4CwMDiHRkUU2mtxKNN79Dy6I28BdVjq+xSzw30M34xDYBGxv9qNCSjH
         ksnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784559741; x=1785164541;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QeHXLsm10YZKxXcyqEV6IibxgMejCHIoggLLl0oeOkE=;
        b=pAJBSCr7s+Ca7CviKrgxQEYqt/Oac25f5JAN1iCBwcVeVD9lGlgLdHjhfA5VnKkZxx
         B4FAFNPlNgYNzuFB+PBulpyN7V7wmSD40go4fav5mlQRP3UXJKuuxPgp9x4sN0pBDqyO
         EzPT5KeWQlxNXBANZzpXcx5mKWv1LxVa/Uuf1S/APry3C6F/NaoLrGGjmwiIB9rpNKHm
         tokmPqKnnACgjinOCbAkaQTIIZojnWbQRMKYcQRacVRxHDShIV1vuaI5toLV9o/Eg1N0
         qU8F8VD26lgk/F4zPUjfnwBcK4ebFTqbjpJOVjCfr7LWfddqSGLx2XwBH4+5HQr7dhP6
         T5gA==
X-Forwarded-Encrypted: i=1; AHgh+RpQuu5bhZiLBs+wl9PivHHYGFkTOuq+ZD91RW+Mp00sJL5d1I4cZNpO6LU7O4nym6I82YNIYFnky6PZ9QbX@vger.kernel.org
X-Gm-Message-State: AOJu0YxNOKSrc5QSc4f3py2AqpgM7xU4a0G20gQiIuEQudi+dH17hBBG
	1E1q1RB2EaKQTt6vupvq0xeGkqtch5+JIXtyEZnRlWW5s6i8pRt6V9QvvFtBWXpA7yuFIbJ6iBs
	LEytN9RtUuI3i7NtfVan/g/pKqRHueqqzohxeIWD7fFmic/1VgCQgODNnLrk+mcoocQmX
X-Gm-Gg: AfdE7cnDg4uop78pf2gYCYhX/1PxgxBTYSHjAGyJJAHg9iPzQGJg3dak7fP0yOGGTvw
	JjoBzKCC7KRBW7Brp83K5LQuU21TQCXSmqSo77ow6niu5l8ReyJNudnMes2eRXBPADYXf0M6m00
	w1yMXwfQw27uKqTdVEc2ieLGlxnGGeRER1imFefF52a/cACUvoMi67kiAfJ2p90U9DTDUk+E9P1
	EBZ3T2EryNc7HzhYhjKuXpHja3yvwNWK/9+1xTifvzVG0CJSQIiPh+2PIZb63KF5Y5UfSyaVXPS
	MDGibf7Xnnf9V9fta5N2G6ZmTkgvNo+dgrj/gszTkV/aC85YCQxGWffu9Y/x/8kZIcYcZyMapIp
	nFuL0gHF2zm8++cc1BVrdfULO+Ge8Ve19l7RwpugYlxWoBrhGp7NlheJTOuD5GuXjeORamKFUBb
	L97tOz5IyBlhYacA==
X-Received: by 2002:a05:6102:5694:b0:73a:2195:4386 with SMTP id ada2fe7eead31-747537137c8mr3176290137.24.1784559740217;
        Mon, 20 Jul 2026 08:02:20 -0700 (PDT)
X-Received: by 2002:a05:6102:5694:b0:73a:2195:4386 with SMTP id ada2fe7eead31-747537137c8mr3176088137.24.1784559736563;
        Mon, 20 Jul 2026 08:02:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291da4ff2sm2389858e87.28.2026.07.20.08.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:02:14 -0700 (PDT)
Date: Mon, 20 Jul 2026 18:02:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: pmic_glink: Avoid losing early rpmsg probe
Message-ID: <u7zhuzcuzag2i5fivecltraodksji6kk6dmtgypcuanr4ahrjo@ty3zx7s7kttk>
References: <20260720-topic-pmic_glink_defer-v1-1-94c0f233f2f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-topic-pmic_glink_defer-v1-1-94c0f233f2f7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE2NyBTYWx0ZWRfX6nT1GAMkkgy6
 RcLNGB9qZF0yQh3bRWF6zKzab/KT2mJUgN4swY8hXyLaejwNh6FLpCpNCTERtDtqCCaqMWrVnUy
 3YEfsnRhfgx6r9UKCEHxnurIDpwMZXw=
X-Proofpoint-GUID: eXkpoeSvJu-H1Lx2X1halJKJ2YbExf-r
X-Proofpoint-ORIG-GUID: eXkpoeSvJu-H1Lx2X1halJKJ2YbExf-r
X-Authority-Analysis: v=2.4 cv=c+6bhx9l c=1 sm=1 tr=0 ts=6a5e3885 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=eCELuHJdjvsP2xuRGyAA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE2NyBTYWx0ZWRfX3+WKpZlsb12x
 Ss4pn7AsXZyOkeTtGe/o8ISb84JlgsYvoJp1ln1bxo66FXQr6iZlxm/oVtn884XsaK8nUsJJRZG
 BIJh/7ISV4HOTvJEZIDBo1aWTq+CuRj+KN4b2Lg+KIOh8JZL/94XgZvWcrwT5RFud6IoWTLsRnI
 Ve3xaBa3iLL4qgm6dvZkCJLIVTwU83EtGLs3tULAKlwjCGgM9AAqZoa2OzMB/qCLDIAJUw/Lt+S
 ryMhH9S8pzsWZdyLBS5GK2MY3ymipEpsPgnBSxbIfXZbj9IBxUJFGX0g1gJXKetvxl7LLZ38CeW
 01VYS81SIGHVwjmxxKA+/J53qxGI8BFHxtajkx7id28J1QjXn76HjmUfHt3lhdXDMzy2gQQCEJW
 NXfPeu+L/5x8FzJjdI9vxQ3KFN7QMhlwRPha59bypl0xzRyPx8q7pT6o/er3zH4sIL/K4w8fM24
 yG+g8jcBgE1TFglqcVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200167

On Mon, Jul 20, 2026 at 04:39:02PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The PMIC GLINK rpmsg device can appear before the platform device has
> finished probing. In that case pmic_glink_rpmsg_probe() sees
> __pmic_glink as NULL and returns -ENODEV, which is treated as a fatal
> probe failure for the rpmsg endpoint.
> 
> If this race is hit, pg->ept is never installed and PMIC GLINK clients
> never receive the service-up notification. This may leave the system
> with no Type-C functionality and without battery/power supply
> management.
> 
> Return -EPROBE_DEFER when the rpmsg endpoint arrives before the platform
> device is ready.
> 
> Fixes: 58ef4ece1e41 ("soc: qcom: pmic_glink: Introduce base PMIC GLINK driver")
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/pmic_glink.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
