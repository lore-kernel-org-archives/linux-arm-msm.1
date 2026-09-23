Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61D245DF58
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 08:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790150414; cv=none; b=X1R6ao0IRaCpObbS5zAUGcmPpWL8UQfAxmtLJAnZ98SDpLod38bEMPy92Xlno4dg7rXZVBamMNQl2bWGrDBjGThtWl8rKx3nwaHEiQn85OYMcSBRDPMCapz5ixlNRffmMmK1S8ABsfO4yfrauPrF29l2IGQn5NHVTRePo8IIHIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790150414; c=relaxed/simple;
	bh=VEqNlpxOEe1fMjABVwJSU8ejy3HEKdIzvDohBBnBmiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gSFZjnlLuGL1XNgtzLOOfkuRZdVBECLIH/kUXRdNavt72jP/LWNpmCAjDYjhp3I0Ax3Qtbs9ppgx7se74xsN20pjdg+U4wB0xpX4QXuaqZXK/eXf1HXnDcQuLRlgABKwUJCh7zhUE5ih7raBf5/iuEZrNnSCCPhSVeFlh5u5lsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k+qt93AW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cvg6pAcy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+qt93AW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cvg6pAcy"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N79bpX3022269
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 07:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jlRVAzPdTtvrvPHTJO/m2JYQA28qrTWdb8pmwdvB0P0=; b=k+qt93AW5iBoxzIK
	N7HtfLFbROkpz7ZY3ck0/fD5KMHOkgKvY7ByiMsfRo7m94M1jShAkrgIqHNUaLEH
	ObxhLW0p0iTru0LrYyhPg1clg2YT2O8WeRTai78t3Od9Vk6DB6viNbMUaJGyNxt9
	0cjzJD4CyeLWGoP6LPsPLP5i4FCeFttw/YpKw8RYn4sFFjN0bmi4FZn0ub+ibS8t
	XzUZBfTbFfYyMxf4+p8UUZkfnFAAg9yM1M+MfWHqxVaV2r2NUneFmj5s2MwSMKdo
	eazMyuz1XHXdjgT13gSgtFKGm7l/0U7q7fQhie/YSx9FqJBk/jA7GzAbdE5wIWp+
	kDblKQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8638fx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 07:59:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939f4002c1aso13658885a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 00:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790150379; x=1790755179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jlRVAzPdTtvrvPHTJO/m2JYQA28qrTWdb8pmwdvB0P0=;
        b=Cvg6pAcykhv4csACJg1e6xLS3IkSmDDzTkSfC3dFPFGS8tP6YPoQikdv45Kft66EjY
         gmdWx0vO+cxVEbY3aywHcCOQHfo+BwDZRzJUBtTkGxMTOz330b4CZ2bogPx/KRsLtA7n
         Z9xiYxZKhgcki9wH85j42ecCo5z5FpY1pU3JN66CD9SNWogcKaQ6zWQ2NyQ75KrKtFr6
         MxD/k76hOsUrB/vhSNMGtt1iupbcAAp+NPg1RywsgNMJOparZ9IWUHfWGMYKDHURZJue
         qALLEItelV2/B2Snv3ao3EpaFLejiLVuShZjSRogNkZjcpUCXJ11SaSVi21p2TA0goq5
         8UNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790150379; x=1790755179;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jlRVAzPdTtvrvPHTJO/m2JYQA28qrTWdb8pmwdvB0P0=;
        b=l8cO700SD5fr1KrEd0jeZQPc4HjR2l7WzfB/cOrgga8GQdD3/HIKo0eIva4dA2xbCi
         0HrVZlDYsaAf+uxHwpGJO7rGRMfFJgZs4KkrKxB0LSYI4nQz4KdyKcuZA2qOkBLEA2G2
         YPjVNTq6geZR3DDDOXdHAVOn3e9DEPI2CvOPa3iCLN/6l7v9LXT9D76JBnGdfiIz/Kwk
         Kr7RaSABLnYcrT5onvRV7kn1HsM4A0hd0U5fnQGmyxqkOST3wd+KtMlVy88upWC9Lxon
         L1/vnfK6YG5Fx4cFilJpSXuidZKUgK6/+MgyUPsBkEdtOrRA4USEMCik/uodMwxzmezN
         s6eA==
X-Gm-Message-State: AFuF++mcZ3QPIkILUjtSc9G0tjp4BDKnXLkAYnTjEscozhO/S5es6JFC
	DgCYR3ABolapXwRc/FP7IdGFEX8ounC11V7asZeznn+FlpU6S0mHR1DTI9fttSJh3SHihE6Hk7A
	6WVvbWJ009htHL8Ase/p8sUpKJYlcDyDXNd/0BFINmk8lT4d5FmH5CVMi5eFYd2KY636P/OOsQq
	0Q
X-Gm-Gg: AYBFou1eeSZR1VQSbAoFza/9i3pW/GeVXdH4o94ryCedp+7w70XAK92E+R29Y0kjL4b
	Qpk5IVwFKfyOSMO4G855Km4+H/YZWmMed1QrawD6evhUvYJ6+KdF0yYxwNFAHCtkEqrWJPdadeb
	B/a1ixrUpfkzJfu/mybNyLxfNzJvd4UPddpl7j5YC/sV7hC+e26u5tLQcPlhlDVqmaYbzaZ5aYV
	msFKV0Ucky186U4CnWil8Z0DK87bpa0DS8yPxB1VUurEMcqeKjyPC06coTA0cMBmvWjsJ1pKZO0
	T2dAzYXLKEoUOQ8K87aWo5+kLJrwx5b96jAB+U1Vl/vPGiGZAGNCw7ng1/S0Oj+n6eGwWNB3SC5
	ZSqhToy8CF1HqgLY99HJJdQ==
X-Received: by 2002:a05:620a:44c2:b0:939:eb09:4458 with SMTP id af79cd13be357-93c251efb93mr285629085a.3.1790150378901;
        Wed, 23 Sep 2026 00:59:38 -0700 (PDT)
X-Received: by 2002:a05:620a:44c2:b0:939:eb09:4458 with SMTP id af79cd13be357-93c251efb93mr285626785a.3.1790150378530;
        Wed, 23 Sep 2026 00:59:38 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab38bbd28sm1087675a12.28.2026.09.23.00.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 00:59:37 -0700 (PDT)
Message-ID: <681ca16a-7452-44a1-871e-81a5db82c036@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 09:59:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus-common: Configure MBHC
 thresholds
To: =?UTF-8?Q?C=C3=A9dric_Bellegarde?= <cedric.bellegarde@adishatz.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260922-mbhc-v1-1-bd123e7fb899@adishatz.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-mbhc-v1-1-bd123e7fb899@adishatz.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yzxFG_An5TMVTXT4_eK7UqvMPVCpkGwz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzMSBTYWx0ZWRfX4kdvPsUe2E8+
 wKpRGGu0AE6YhqmqlYjTJYc1JHx30sAv5vaVTi5OyNaW2McdGEyrNmZ16zsUfb7wDHHJenmhqEu
 bCedMzCUa7IdrdVb9zUvN+RfeSOkfcQ=
X-Proofpoint-ORIG-GUID: yzxFG_An5TMVTXT4_eK7UqvMPVCpkGwz
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab386eb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=LCWlJkpBAAAA:8 a=EUspDBNiAAAA:8 a=C9R86eXXc2PCoiogm0UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=z1lahxahPt366DkPXCx7:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzMSBTYWx0ZWRfX8bVAp8i8kY2h
 CTJLAxxlMwfZn6vNp8NjPGAn1SjgaCnxhs118iJ7limXNUUcgr212hdjrih3PTeMSs2X5JSUfzp
 r7ltLqe0bg+KxrRG+SOVuOu2bInSLcbfazL9izw7qPh8N5mHISh/zQk1ey/vjlJmkjFoMmDlwBL
 ssQ5iKwb2eymYbRMs2rvr0vAJ9sHV0U8RkQxBeoXsMwcEYQEO5h9UrrzvCeHhr4n3pJcAxNDyPN
 544/7YyI8CxtC1UEvnZLc6+Ry00Y+x1HSuhRMX2MzZfo89YI9DKUOCfGwJ4Grbtz/gSFznq+Of7
 AgaAMc1BtrE/tOuw2rXG6+4vnvbw8y2XWpHT4Fq/wScg0N0jqJ9/2/kxziYwhKhDQtiSBsE3Oyg
 XX82EfQighTQgVFml3Igs37LRB3zVxny1vGokg/ZVcZN8Wkh1gED0Jf6cHVeTOThNv7w5vtMSfq
 zA4QkLO3W8wKcse0Xow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230031

On 9/22/26 9:48 PM, Cédric Bellegarde wrote:
> Configure the Multi-Button Headset Control (MBHC) thresholds for the
> WCD9340 audio codec to match the vendor downstream calibration.
> 
> Signed-off-by: Cédric Bellegarde <cedric.bellegarde@adishatz.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
