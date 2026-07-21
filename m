Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30F534F279
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784657715; cv=none; b=NB9AUGIr5tN8s3B+3kf6xuyr+m+/OwC2h4iJrfcd9vwd1qjJUiMOkEIDnoj5kzD1u0A5MCAWU0Ny9zpmQAMzxYVbkgKWyRS+1m1E2neRZqXy1wMsD4/tcpb91tnHOf7kMq5wAD3l94AvqIlf4holDieWh2EUbsyp0fKWKf/vH84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784657715; c=relaxed/simple;
	bh=jHDslgY4naOsDD/iTlKigpajtxUB2hMiQ6iSi1OgwUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U6tX8qFXprKQkvwqJw4QFPttmCuLUXLs9kW756LcLIqexX+VU3KN7bBQXKfBcnHMEGGZbj79WJO8iE+oYkoly4lQhenkvzALTawr8Hz47pjEzyrE35egPpi/v+KvkZnUlUjySH/5XY80hZ8adTpmiQAtgO3lZfNH3DvMB/jngvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YSb4FWru; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EfnowXdR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSb4FWru";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EfnowXdR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LHRTv71926637
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C9B7gQofAP5c3h+mXK9qB1+Y
	5wJGrLg5Siir/2Q9cAs=; b=YSb4FWruH5cKiGB1qnGj5ugUGy0l1gCpFN48u1Md
	y6njsdEQE5AMLmNIAYSV1802F2i1XilRVY3q2T/F3vNjSEY59nUm/ucae1OxyKir
	1GDJ3AUJuKdgUqXBvMzKbPdxhWJ7qyKuZBDaLHC0siVjncdXdNPg6dbIIswwiZJE
	4U+o1VSiLJNHbZgvqtMZLl3MzTGHyIuQ8zxjWOjheR8V7fugKgKGBiW2Z0VtAzvq
	Q1IGumN6aaGwWLmAPN7qPTVtjB/cuUcR8GroQgSsbqqAAKRsE7T4ARJcl0GZtEsZ
	MyTV+38xjn0+QRrn7aYiuMn/4iF9guJZaPD0JkbiPV5Tqw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6fr801-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:15:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92efd2ca21aso467869385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784657712; x=1785262512; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C9B7gQofAP5c3h+mXK9qB1+Y5wJGrLg5Siir/2Q9cAs=;
        b=EfnowXdReuPfhPPVnDSMhAdeSf+jEJjYLevVMDfpkA0THUdU9pZZOUw5TvzrGU11N0
         boSw6caoJp87g8vf9cySUyZkxeMt8yCzvyx/qj99qXq15QomxyU6V6wFYQT1Yid9C0OF
         rSIQE4e9tiCvH/rMk491Adm5ZfQptb2ojmZL6SnchWaF1cLfLqnTUEDVXAnU3DE37nuk
         2Qk80eEk+UyXxWdfkcUrA53cLdl0uO/SJJBwtLqE7rT94xyx+/poaBd11ixoeK9TrL4Z
         uMgeZbrCiokxy34KCm06Li/bFyk0jywj5b3Xt/k/1hOuev63dQ5LtB9risQP9hQnLKK/
         1Yeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784657712; x=1785262512;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9B7gQofAP5c3h+mXK9qB1+Y5wJGrLg5Siir/2Q9cAs=;
        b=JE+MKiAa1CyqS3lfOJ0br5bf6vdrbUsc2Lw04dGKggqud8iyrTyzcppvOuKmBVrcFD
         P+txo5f7bGlfskyAgTG+kA5FLW7Bit8X7460yC7yvDWEJvflVvjBWdmF4yiRDWB6rj6a
         8+Fx/KAq3YQXSJgoOgni2HufiepCFhzQ9tvJ4sYHctEknbL7+aur7nEpi+YCAbmjCrrd
         mQ7T7P7FcYpzeB/LA/5/vSSY52itpdQKcDFAyfcK+JcjYTLIxoYreMQmjX98C/+uedt6
         HG9cSxlRHJMDAFAvIAtNKLtK6WEO5QoWpgNmqyChoTrz3sDzJTo3ldMJqQ3yyG1iz5Yt
         Skcg==
X-Forwarded-Encrypted: i=1; AHgh+RpZrpK0U/fh/E1VfPhlNlH6XUGxMsn/3oU6sYH4/gbk3mX1o1tLyYx40Ic4YBpyRe2ku0uTtIjdEC0fqVUf@vger.kernel.org
X-Gm-Message-State: AOJu0YwN/URHk+/WGsZPMJ4cN3Cdhslq1szggWj2w/9n5urEHdCshxBE
	64RTUJ5g+0AJxVOPTF2OxKl+oD1T66+hqqROyEueMwY3sAKOqwua4VMe3nHtMpB6E38wbgrxrpq
	uPcwLm3hTyVyBOPZR02J04XJFBxecnc6cTyVAA0Hhc1DH6V6aYZ+jIdxT6Wr/VgLwg5cw
X-Gm-Gg: AfdE7ck0DjiP44z6Pb76+J6p1WY4n8KWUtvvn3GEiXWsHncqXJqiKpfutmw961IX4/z
	tzWVN7t3TdIO6stGioQ41SVRfbPxvIpGezzfNmpidzReGsGroUW8YP95TA8u9eSNVTE2dVGT19r
	peqn9sAv4qBqMMTpOWVxnxoUdbyV8sf77x/xwPhjwvu269aUOqWImwmQDPDcnqIRuXZm2nKRQbB
	QHIZKlq+/oy0CHxXqOKWr9gm4dcsDZt5ELyAzl9g4IcQGK5+fDL8A7ldx7+dNZrUI8Hrq8RVpwp
	gunVQM3f+Q4v7ilc/IBKOLufRVaMHrNu6xP5eUakPlvIlrlTIohRxWoaT9tk8X5ycpDsMgIegcs
	RlhWQmHoLUMifA+btbz63USlwSozTp48ZXRwowDzLF4qte27wwwk1a+VBtWDaKoT43u1aNE8hm5
	itc5L/XM9BoLRORg==
X-Received: by 2002:a05:620a:3190:b0:915:cda5:27f9 with SMTP id af79cd13be357-930b41d135amr2214054385a.56.1784657711779;
        Tue, 21 Jul 2026 11:15:11 -0700 (PDT)
X-Received: by 2002:a05:620a:3190:b0:915:cda5:27f9 with SMTP id af79cd13be357-930b41d135amr2214034485a.56.1784657710486;
        Tue, 21 Jul 2026 11:15:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9ba342esm62718e87.27.2026.07.21.11.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:15:09 -0700 (PDT)
Date: Tue, 21 Jul 2026 21:15:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] firmware: qcom: scm: Allow QSEECOM on Asus Zenbook
 A16 (UX3607OA)
Message-ID: <vqsxu4idfsk5tu3iigaxuzfeybj7uvu2wnwqim5kzhrkw5tfbl@uc6sacujyw3n>
References: <20260721-topic-a16_submission-v1-0-8ea213130d05@oss.qualcomm.com>
 <20260721-topic-a16_submission-v1-3-8ea213130d05@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-topic-a16_submission-v1-3-8ea213130d05@oss.qualcomm.com>
X-Proofpoint-GUID: z6kjPYh6El7UbpZJEe9fD5TWHyuIPnkI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5MSBTYWx0ZWRfX5ZmFYZIQ4kVj
 LpkCyPmUJEM9Rxam/iuMTN0dViHSU293hQAkM7lccGHc9V4TuF2TRAzsythM0euv1oEX3cTj6vX
 FhJmf0l2SVjSsc54DdkHr9uq+A9VKqPhF+sH5on9zlyZ26Faf83Gmzf/c9vLrcY4W3BjYkT4XzE
 DY9wqUPwcSIpER9HZ9ou+SVppKE63SamPHJ9QkDGyBxYAqzMWjt0sirmDXCww1jGC4H57t8criA
 6PLuxkb537bs0ME48GdRmpqJj+de2WoOvNmrHRflsF56vh08EQDO5V6EFoy+ADsXNDwVRdGXIMW
 yv4j+hglzOP5o7R5fIeaJxoXYp1gvwGQbeJAKvYLfVrZcD/mevVNujYs/Bl8camp7mWYflRO+oS
 dj/4aiq93Fi0km0T5YiUzQwH/UYMMcCthtk3hD0sGFvN+9YIq6R2yXXPo76YIarOsEnA80lyEU0
 tjDYbnlv89IEi86smPg==
X-Authority-Analysis: v=2.4 cv=e/o2j6p/ c=1 sm=1 tr=0 ts=6a5fb731 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Ss58B_KWQD8EFHPeiEAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: z6kjPYh6El7UbpZJEe9fD5TWHyuIPnkI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5MSBTYWx0ZWRfXx30zXZ7sKEwp
 4ZgLagKmc1UhiAFWYbzZ/YcJLEAbW9c5ccE5cwnHs5zU4dK1iMaHBtekU0t+S+P2M3Fsw8r+a3k
 u3i/SYQhtWiostGSR5r//Db2hY8uw+g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210191

On Tue, Jul 21, 2026 at 07:11:28PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> In line with other Glymur-based machines, the Asus Zenbook A16
> (UX3607OA) exposes EFI variables through the "uefisecapp".
> 
> Add it to the QSEECOM allowlist to enable this access.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
