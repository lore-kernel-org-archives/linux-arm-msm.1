Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C3E1465B4
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 10:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786011567; cv=none; b=Xr8GfFBz4wtPk7Pl+h86ZDDSjUy33k64yoQfQOLm59AE3YEdQ/+AnR4TxBtFfBvFD/4QA9/sIxl1LC19EJpHZ8d6byQzNbFWhqcqOOvLr9+EvwDMBXi2KBZ2opsDTB3o2WcsSU4TuIZHnrpOlJCpqDL8LLCJujXAR2yP18aClAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786011567; c=relaxed/simple;
	bh=rNDF6Fc1Nx8BSJb7zv0d/HGA5TytMPXHoOXWeTu5FfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eRUxw+6fWY2UJQRSV/YQZIIakU4mUgOhMJjUgcwYW9kWTCTnmv3XSBDgMWBoxuch43weIOCTK74ix+/5VD94wW4VyG5WF3sbKQEEWT3wAtDpLeyHi8Gw2yKs7tmH2XJ2fMPBYEoHRCKjMH0dQZsMM4aHk02LVxDC9ZmCK1qrGls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L3RSyiy9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mk1WANRe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L3RSyiy9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mk1WANRe"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nhE61871348
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 10:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SF4YFqwTJaTZdpTLrS1SvnqTddRHfDqH32rIPLqrPVw=; b=L3RSyiy99zz3K7Tv
	5TxUKkgOkGgR/ViRGa0fVxGbIUQBcfjwliXHXWp0FuCrP1WCKmtsOgkVUH8AZ04+
	7JxR2Me0/iCWhiXva3cpnrWF4xNWhApDPXhQsLbABcAz8yyqgrMWiJQQFCH/eI2i
	TtYN8lmNOm4EX7AQWY+63KI2vST2amMHOs6zVikQ0yzWKOl1Vq0adEtZM6QF9YgK
	XaqQCpnvFeJETQ9FtVbh9yUIHQtng2oMKVe9M8ZhH/ibcHK/qm4bKZRikTeWLu5n
	o6ZB27TmM62XTh2lFYDYtqkz68R1zx1p/txoPAnadrIKomSwbVEzat37WBxhN6+S
	8NwyjA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjud1grg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 10:19:24 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e048a801dso2787378b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 03:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786011563; x=1786616363; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SF4YFqwTJaTZdpTLrS1SvnqTddRHfDqH32rIPLqrPVw=;
        b=Mk1WANRemLafgMJyyd2jDPkLPGe9aSk4O9DDRN5/hKQbPz276vzZqe+z4sLgKpTqWF
         dr3VUYpMQtLIco6QnjhQsuB5jduz16HOgdybl+6xkvMaAgd23nv040MgK29XZQtoFWUZ
         fG3AccYYacfqL7QxpzbuWNF3edks7aWM+H9W69GuIyFhlrqNUFLXMX5MJxv7GGfIXufc
         JXgvTgW/7+wPSnUAPurciBU6Fgdjpzn4qKR1ynKF9CpIkMGS/UNgk8Uh1cBBTS4Y+v/I
         wBe0fphyGdLbBVS/EruyURdvHIcvyYYwGn3YKj5EMq1xP6EuB7BRQY3NMRBP4gdLS6ul
         H9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786011563; x=1786616363;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SF4YFqwTJaTZdpTLrS1SvnqTddRHfDqH32rIPLqrPVw=;
        b=oJNthU+/OhyAyIT5Y3rN6bZoAK+3I7oMsUt4mBsxCZ6y7J5Ri7A957B+Ar+tWbFGgc
         FUiHP4S3zl6ZOHuug6Ugm/Yq33BMYh7adnhJUaU0uBJRkMW0qPZw3QvJoynBjd3h7O7Z
         RC/wILDTmGIFoBRGzYaY/jKsDeuw1vqEOOIlRlKgoEtD36dOycasUX3iSlLC4/9XGIK6
         J9ia2MKk10SXVwv0iWarWEvWlR1mtdKiTXv07PUNkZle1ve18QzCvIsfkzCHPtUURKqH
         iWmEj5FTgrPDj/f4FTc5CHFV1c/eOUfej2hstbjU1gBrvOzJTfL+u7iAKcXjWVeaU+UL
         4chg==
X-Forwarded-Encrypted: i=1; AHgh+RqUStwrK6x0IYEWlVLHlnkHBwqnTpVJqHm88VnbbKCnotuKs+UsD6ugDXaMUQxLTg8Oc789opf/RW8lIW1K@vger.kernel.org
X-Gm-Message-State: AOJu0YxQOnBGaP3LvZET3YY1DkcjexAErGdv60+gh1aIvwrArXLKIax6
	+f51aA2c01UdPlvUd4kRtIGBRzUsaOhnwhzt9IrCEFRr4Mni3s3WG+sgh+dtX1N/KAOP9eL+Nvr
	E/OxuWPFPoUGso0hXT0auT4KLB6IkUjrrk30jFieIk9zYtF71bmd0TIy88v6wH8Xe9UQO
X-Gm-Gg: AR+sD130ARVOIuvLNOvDTns2nAuaZlDGPqbTyud1IcXA6raVSc8tT1478k8t6r3UfDh
	o8mC4v60+RggWuc7gYwjGJ+6HcRf3ATd51o9q6F4nM8bFkjIgRnfldhYKrpN3Gh0d/GyhuyFE3A
	5tM6XOIFbNhyzBpuLY0kC2zBxAn8gcmWKYVCWooswanuy35fC5fCwXqN4b7/CB5lWa8SAMkQzn6
	a8Wkoa7zhcWD3Bs+/3W4ZQXzsLUePM9Abf3cntX4yt6aOhj8FAzrb2RkayHXLaT/QXHTto/Dx3o
	g/Wsq5ylxAkPVV/lkd1Bo4DsvYWFs/BHJ7YyWBL+xHt1J5BZwvx3Mreo+ZImpRHt1jJUe9yR5N6
	Xippa+Miq5SfNOOi2yYB3ikaRQka5nS4=
X-Received: by 2002:aa7:9303:0:b0:848:77b3:579a with SMTP id d2e1a72fcca58-84f2dfeb92dmr16446732b3a.17.1786011563506;
        Thu, 06 Aug 2026 03:19:23 -0700 (PDT)
X-Received: by 2002:aa7:9303:0:b0:848:77b3:579a with SMTP id d2e1a72fcca58-84f2dfeb92dmr16446688b3a.17.1786011562962;
        Thu, 06 Aug 2026 03:19:22 -0700 (PDT)
Received: from [10.218.14.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f459bad48sm1089601b3a.47.2026.08.06.03.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 03:19:22 -0700 (PDT)
Message-ID: <dd000244-fff4-48b5-9a6a-80554243b6fc@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 15:49:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qcom-geni: Simplify PM resume error handling
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        viken.dadhaniya@oss.qualcomm.com
References: <20260805070013.494426-1-mukesh.savaliya@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <20260805070013.494426-1-mukesh.savaliya@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4MCBTYWx0ZWRfX5UM15U497fKP
 3T3Rax+pTqwe9mVjbi7bCc8FXRPd983eNUj33mYBPjNqfEKZuIzujFrBko5n+lkg5wmNKiOmgmy
 16gZmwiS/yrKMElhuhqamBhwvUTUAp8JmyAb/Q5Vq9s0+jbWA+5Pyshq8V8a7NmD5ecJsF8wmOC
 4bcOHQedKqxzejvx4HsaDhsfaNVY0wwfpxIifGe9s3KsLHOSxFkc40rRcnUDdnHDFsnvqFj4m1L
 +SMvpw/65c3qFokinm+wF52Jq1mIr4f0Mdiwf8lPzlRY5oH1X+UEek4wzDQArD4jJIgj+Af2bvb
 3Vd/6jx1HHBE/YP5V8RrpYZ/JYM2YHLi/5Hv0tdGRAzlKV9QMfHORTFKglfQ8H0/EDQ4qCoUQYm
 fYq92tUOpkqWoKU3ocWvjrRjSvo/lGvH8HFDU13Ywb26XLmmmRCWjOXUFy6/16xqiHtPjy4BUMm
 7SuMpNbTWZHUnCJtOQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4MCBTYWx0ZWRfX3El3e3humCpW
 X8Md7Si3t95hroHCZvhGolcI+HatIEW9Ke0+Wu/k6YNYco/ye/obehagIw+pW21A/C0DN4nwy+3
 LdkwHmLpu2Rqmt33ZC+IK5sywQ9SrXY=
X-Proofpoint-GUID: ZNAEXRPFUYgafq1L0aob-TqJ-y7U1Uz0
X-Proofpoint-ORIG-GUID: ZNAEXRPFUYgafq1L0aob-TqJ-y7U1Uz0
X-Authority-Analysis: v=2.4 cv=DeInbPtW c=1 sm=1 tr=0 ts=6a745fac cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=6z8TwaGRFWoLiM2ZyNYA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060080


On 05-08-2026 12:30, Mukesh Kumar Savaliya wrote:
> The driver currently logs pm_runtime_resume_and_get() failures with
> dev_err() and returns the error code separately.
>
> Replace this with dev_err_probe(), which combines the dev_err() log
> message and the return value propagation into a single call, consistent
> with how all other error paths in this driver already report failures.
>
> No functional change intended.
>
> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index d5c977e34994..96015e077b69 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -994,10 +994,8 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
>   	int ret;
>   
>   	ret = pm_runtime_resume_and_get(gi2c->se.dev);
> -	if (ret < 0) {
> -		dev_err(gi2c->se.dev, "error turning on device :%d\n", ret);
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(gi2c->se.dev, ret, "error turning on device\n");
>   
>   	proto = geni_se_read_proto(&gi2c->se);
>   	if (proto == GENI_SE_INVALID_PROTO) {
Acked-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
