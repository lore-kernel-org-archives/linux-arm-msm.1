Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3081F03D9
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 12:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784723567; cv=none; b=Hp2aINwpeINC3K76PI/3meNiSxtwNwFW7+owHduFkySFZK9RHZyUnVyrvjwWeLuDniACeLJseYbQ4PdF/2eaQGX7L2zgTfgYH9an9H/qYpsq7hbo7L8b2DzYzKgAZNt+B2J97wacGfAvRrypzcON7sZf7mLa2tiqLZsiJ0SNxks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784723567; c=relaxed/simple;
	bh=o1ohGmEWWIKSBoZvafV1zOkNVXuoo+eI9ipfbv7otmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eR6sZQlqpKafeqNjgakYijjPghbUWMWio2dZTH9k0TG1wzBfyHuNV7isQyQW1KROlxd58+YV/RZyhZwFFBZqqgF+ROe3xxMmgQKuPkYgEZnrgTy6YKEqfYfGW9ig2+5IFLrJi2y+oHYXYUDu8Trskd9BblPSpiuH4yZIjDjkehY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c41JeAFA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AtuzoWEI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c41JeAFA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AtuzoWEI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xALs401215
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 12:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SV3anUXbS60DooWtn+9ZT4xK
	AKZbYJpCJxu2SMsK88E=; b=c41JeAFAmVaFTTr77McAwY9dTJRQMj9R68MCHkKV
	myyiVXIqu8UdAUw/V5l8uEtB87FTb6f4nGmfDz/p2M2JzUcwdwuugC62JQFOap/v
	Xzg6YnyJM2hsmPkdaBoSGn2GM7hoBp7VlIV3R8ocK6ZPFKcMHNgDNrJnqsiuJ8rH
	CIx7MneBWquPdnFy1SlboUeybjAtRm5lNUP9R4FRutiVzZyiotudCfLTqeO9iiUY
	YBXaf51FLwHKS0pMUy7Z/EIvekHIA9IeY+OUrzVUv+UIOm4o/URdfoSS2RdSIkXp
	+LFCmVOqVnc+lv5aONj4XyP8NBHfGpf9fOHu7aS9DkZpBA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjt7990wq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 12:32:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bec738909so151953651cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 05:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784723563; x=1785328363; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SV3anUXbS60DooWtn+9ZT4xKAKZbYJpCJxu2SMsK88E=;
        b=AtuzoWEImtfLUb/PP436HFMcnkfwCb4p8GWfgUUtwvkHVGfm8Ko2wdeq5OySvMoM9F
         zoyZACdaXWkVQS5+pXY60FhWKfS3HcwYQZbzgPHO26uHcDU/OoQyJv8ONH32JKCvZ8rJ
         i1d2tzYlLiLDkHSpeLAY0udrnx5/bp7OOjlfxM3M+8eEWXuihZjEL+OjGqaTq0/XOMMq
         ihDHKyhnsx5+Ht0PU/EKZjTDv2LYOwHOvqVXsH4L/clC3eVJC7y0v0RZFzgKOVsDdJuN
         h+kKiVQd2gvzbqK/jh4JHwH5GrfZEVEmEgiO8raSgOEbgT+XZGEtw8dHa/t7Kpy03gH+
         SyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784723563; x=1785328363;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SV3anUXbS60DooWtn+9ZT4xKAKZbYJpCJxu2SMsK88E=;
        b=W+80c6kOFXKua96YQmyaNBxAlcxMsIA/X3a8A+hnOlzDVavJtAc/PRLnsBOFpJgIym
         O1birNUZ04eQMpFm6ZNJVW/DuHM2uT0hJAqC+GzxDJSkOCikJ5wQnAEdktjCyRyOO2VQ
         ewsM4rx4z7MuCk0Eb4rKrGP0VCrf953sg4bqmH/IlJ6IANaAwen5od9ClQ8VKrO1nZ7V
         xlpzRo925PuqDzcLrX3ampIx0i+p7BlKi8Q64ygN9gkDLFVPv4hkM9eYphZsoctSg9e9
         ybGbLovMihagABXZ6YZPMpdjgFFz/mX6LZTe5fEaFwbw3pqvnyR9JeeDC0P/iJlA9cHf
         Oo5Q==
X-Forwarded-Encrypted: i=1; AHgh+RqHLnxNap7XsJ474uYs+zZckAlM9Wlvc0aHhg5RTWW5cfWirNDpX7XaVgxJZr75fHyKe1OgLynPmqEnfGBk@vger.kernel.org
X-Gm-Message-State: AOJu0YzEOkWM8bq2pBES5pB/TxThvqE9RROKrbFAgp8+G/BgKVcH1B4Q
	K4bVBDSNDBm7JQqZTthJP/lrxX+XqQn/rOWmRVgy8lfgfqBU8/+dUZ/m4CX6W8X50y8mXUnOjYR
	HLR+D+Z9wp2pt6E2Ey8rGCGgejPwIhppuqJn0wq/7pz0VTWh8iJJQqHxtgu4nH3w2KbmI
X-Gm-Gg: AR+sD13E3nu3u2s49Ur30cinxXixldOS8tlRWuwEnV2+ABdG7FvGjzcIIQ6oN2BLRrU
	b95bUa/8jpfwMiFb/ISCn9X99fRbWzqRsCL0USaTW85ftJGdlKiaraMqjdIhsFkU9dS3a2D1Oph
	DKik+CKNpn48wQh7StEKuBqP4Rmy6tQHpnfDo7yU4cuC8qUcS0riKEgf6wgW/6Rx+2HbgaEPP4H
	QnqZoJpN55g/1TUGZiPCLJ7Hz+xRasIerCjeeWrXkBXceJ3QSQ6uYzF1HV6IS83dwEKx41rWJd9
	Y0B/MDFXAeOg2XcUNPfPGZZprLy7ghrPgTotMuPjGRiO2b1gpOgCmAQGA96Lmte0nOqfdZMOFRb
	pvQ9qfCQ3aMtA35z0wCZUf47wYky1JxcoE2S6UY6muhuinKjFt+KoNKmDCItwNs+UWVM91dzVsT
	tlaCdUuCLDgKxfrQ==
X-Received: by 2002:ac8:5842:0:b0:51c:7b12:5fe0 with SMTP id d75a77b69052e-5213f06fc16mr205251511cf.76.1784723563151;
        Wed, 22 Jul 2026 05:32:43 -0700 (PDT)
X-Received: by 2002:ac8:5842:0:b0:51c:7b12:5fe0 with SMTP id d75a77b69052e-5213f06fc16mr205250891cf.76.1784723562408;
        Wed, 22 Jul 2026 05:32:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9e45fa5sm457806e87.66.2026.07.22.05.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:32:41 -0700 (PDT)
Date: Wed, 22 Jul 2026 15:32:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Gourav Kumar <gouravk@qti.qualcomm.com>
Subject: Re: [PATCH v2 0/3] media: iris: add LTR and hierarchical coding
 support for ar50lt
Message-ID: <5vmfrdc7skmo2e3holugnhryjkhwwhndbsrklpjp5dsxfujyvs@a64y4x6lb5mp>
References: <20260721-shikra_ltr_support-v2-0-702842f1f3c2@oss.qualcomm.com>
 <moj26vrjujn6ci74yrthdjyfdabg4tn67n7hczkeqvjhknm4ai@ilxz3c4jvcfe>
 <3c48c1fc-94a2-7180-0922-aff5a1a5ddb4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c48c1fc-94a2-7180-0922-aff5a1a5ddb4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Sr6gLvO0 c=1 sm=1 tr=0 ts=6a60b86c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=dOCu1lF06kczfvRyuycA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 977moyDAJEv-uG7MOYMC12kx7O6RmnYE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEyMiBTYWx0ZWRfX4Nc1H4aUHKCz
 OF+4OJpw4D3bN93DLQlN7NKTOcAgI8YSomkeEGMYdD9XtzNq6PVIXsn1ZjbvGOnz7SK+19wpT5Z
 BKrJidoYINOGCsZ6Jk3MFVAxJcGWyorSniioUMszUvcmZ+ZsCwafMLpWtpzyjLwX2NEGzaCkOkR
 eFGWSmelWyYvfZUbP7GDWHOikxOtrmouJa/9DJhZos5XkYigvcnmFAMlONsqe+lM0XmfeYWTuIr
 7WDsLERd//wPJNu/mATLSl3ZOOVsDeKUPO/soMbypKeX8CWHv+K5gC3dK2xVQLNXwwsJKxtzCyo
 x9gghoQN9H4vMEFjX2YdPbVKxZtt+V3/6XlLss/bW9j9thE5/Yz2shp/xPlVLZ5nqkfWB0/ImQf
 xS4rS3PFIqy3phHMPvFMoXAMKvfrzPx6ZvogMkUOEVkToaFYvUeNealPnHv30uEOL5DZtfBuD/P
 xwunCwYxn6qHvQClSfw==
X-Proofpoint-GUID: 977moyDAJEv-uG7MOYMC12kx7O6RmnYE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEyMiBTYWx0ZWRfX4ayJrNUS8Mc+
 WwR30MIVjsGYmmYd1YpMtv0AuSpI6aDccKn+UUOvq154Btfz1iaM6hwZEyWuA+wM4gJqOW8i7Cx
 O9FDAJUafzsRrR2xnexcKmUsKO1MC6s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220122

On Wed, Jul 22, 2026 at 05:54:03PM +0530, Vishnu Reddy wrote:
> 
> On 7/22/2026 2:45 AM, Dmitry Baryshkov wrote:
> > On Tue, Jul 21, 2026 at 07:06:22AM +0530, Vishnu Reddy wrote:
> >> This series adds support for Long-Term Reference (LTR), hierarchical
> >> coding and request key frame controls for the AR50LT encoder by enabling
> >> the required firmware capabilities in the iris driver.
> >>
> >> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> >> ---
> >> Changes in v2:
> >> - Added request key frame support
> >> - Link to v1: https://patch.msgid.link/20260710-shikra_ltr_support-v1-0-458b587268ea@oss.qualcomm.com
> > This should be coming as a review feedback rather than a separate
> > series. I'll incorporate those changes into the AR50LT series (together
> > with the similar changes to Gen1 firmware).
> 
> That works for me as well.

The third patch will still need to be submitted, corresponding defines
are not yet merged.


-- 
With best wishes
Dmitry
