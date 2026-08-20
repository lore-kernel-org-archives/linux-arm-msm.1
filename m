Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF57A2417DE
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 08:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787213833; cv=none; b=YcCSRQ3qoAc6aUJkhamzW/Ok8VmxhUzIMJoLxNRnzRGP3sAfQIko4zGOLBUfjqGXLc90bYpITiTEOBDfEw5GjF6oNASf+j4S4XwVZm6lXe5v7ZLDbA4smoB2dUnm9X2ghaOSsuAfTnr2zQUa+tMSsPussuoJmFAGwE59Qu3XSRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787213833; c=relaxed/simple;
	bh=azdjVMN3GQau7neihQ/6K+zOum2258xhwA7RSd6+FXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dRAWjfvIb8S039tAqHZfBg6qVqkk664InAdU60DP06HiMTikk3jp3Qy04Ci+dSzyf2q0yRRhjDbQVFjTvDvLOv4uP2On7nV5NXF6uo5fHZ8J1bGS1bwwrGZ+gfcarPEEedNi04ypxKKTAc6XwRHWcC0jIaVMEms9OIq8yoWdli4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lScmViJZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QvnIo7gH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lScmViJZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QvnIo7gH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6IvEj1354285
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 08:17:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6kOKQx9GSDpN8SDqnvj/Olccsae+NtZfsVGGwbJTEyI=; b=lScmViJZvfvcDB5j
	iXaxpckD4fHZ8OeUNmwNYINlb9Q4vcB4yRa8dJuVLDOkLrmhbn+4CZqMNmoeQHCv
	z/MYpXV/1Zt8WEqOGaip83lFyzWmLFt2+jH5mrj6KSL2qa+G94jRuYDRc+kYau9G
	D4rHa94eYPbV5c3c1qeAmkkoKTS76KtzdBfVY4k6D2u+joovijf8gRRItm7X9yF+
	5WcdlApr9hlr3rVyidwFMYXPNuPCtWar/ZLHQxZmpr8+31veQYxdrNTsGAdxXYJP
	JGI/Lz1HBHBnjTMRiFPKgdKmZhgpBA8ttC1W58Y+SSHCxamgo3JaoxRhX2KE8h+6
	hroTjg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es5bwgf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 08:17:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d7ef17031so247891cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 01:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787213829; x=1787818629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6kOKQx9GSDpN8SDqnvj/Olccsae+NtZfsVGGwbJTEyI=;
        b=QvnIo7gH6mE16+N6EbmWzgHIyDaQME4Vkd/KSvxilUtVtXX7B1YW5CH3XSdGuvHqre
         iki1U2/Rd1m943NgyF1RNNzi9zSvGlS4yUzaDXNEZ8ESILz9gU65rm6Tmw9AwPNhZEis
         Jw4NXvqZD/VN22/7ahL1rKrrgBqvXNiBbcYOxwWPD7NcoEYa8bkOCU6TVEpOkEwiUn7f
         IXW16q0eb2jvIFrVFo2hmsxplLnv0ETy/Va5vnrZqlOkFrFNeKHwx2P975vmY2uxlUyL
         ojFNFWDNiJUNeWPVW8E0GQfCGTF2FkyufjcNDJ2hw+UfnkRU7LRYNh8qlZ9UjfF65sjs
         pgjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787213829; x=1787818629;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6kOKQx9GSDpN8SDqnvj/Olccsae+NtZfsVGGwbJTEyI=;
        b=MNENxpbqSp+bZDV/tokCbaGmqbUMKOTOqgF6kY1aN/N6lvsocj0Qtonu1zJ2VMSFVQ
         gLLXTdWI29maBSgT5mcCzEPVKzs+KUxCZV9JOeaf0GY6Y/teF8Y2BPrmpq5iwca0GrHv
         TII0MO2mjrlqzIRMfEp80aC5Lww5ZnnyDmLuiyDraUqbNaVbOm46cUXvGKaeG5KQSjey
         LYbJhB9916i1NoJYX/9YMk+R1OYFC4I6oqyfjDwecVBtkcyCJ8+gKk+AQIlnqjViZGE7
         cpLWLDVInQBaZ9mHSXttdm3cH7kdsjYx6hQosjEd41oY153AkwRCECiapcDXctSfZN6r
         ok9Q==
X-Forwarded-Encrypted: i=1; AHgh+RrYkpym/Kt8PMHndNvpN4DlAR1Yn7Un88rqEhuKkwOoHDjrAUhEvuD79Dt9YLNi1LMPTdS0xc2g1ivLGTm1@vger.kernel.org
X-Gm-Message-State: AOJu0YzmJTlJqREZAfF+GsD/5cbQLlO+DjSUdg1tgKYKOHAaxmZN/sfw
	n+BeGo8je9oNbx1ewYU/dDXUIidSggSC1jEDu+XoNV/Tz6//f9FBn+BxNhBomJMVVKUzNEcHhGs
	74Dm4UzMkk4rjjTDBWjSjxpgb9kzBYjGFWBPlsIwto/YTxnI2OcP96dwNUGSd3rUDet4lkUrS7h
	Ve
X-Gm-Gg: AR+sD10AZ7sAHnrhoiLNa2wr2ShtdoSyCYGIarPHA8Cs79J1JDN1b9jVTG367MkG4oi
	zErb20K3Vkab6zw4ncAMq1aHI36I+qldQH6RzBszDzr9S4PpZE65heWinJ2xqjbsgjOvGoe3nR2
	G9Vo/PRqIIZU5cRsnVJwFDvlsFAhefoUYPI/MHAwUCvjtZGbyS3PLXEgoZ935n4uUUfQXJp7ebE
	/ex2RQbG6nTVgEhQBurj44W/sm+iF89wGTqIvI9wYVKcitZOkfVgiiZFzlDUQU3qygr5RKlBHDI
	JzNxch+K7tt0araC+uDSYQGnL786rIDpdDeb/+bi90iISNpdRtRMfJ3DF28/7ILPxk+lylM0wLq
	euCj5UdbbDSoXH+7JdJfq/tbA
X-Received: by 2002:a05:622a:588:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-52dd579195emr73714211cf.2.1787213829201;
        Thu, 20 Aug 2026 01:17:09 -0700 (PDT)
X-Received: by 2002:a05:622a:588:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-52dd579195emr73714011cf.2.1787213828773;
        Thu, 20 Aug 2026 01:17:08 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2458b094c4sm41825266b.22.2026.08.20.01.17.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 01:17:08 -0700 (PDT)
Message-ID: <79fa9d60-f8e9-4e5b-8c01-9ddb3a86e3fd@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 10:17:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: qcom-pmic: cancel reset_work on stop
To: Fan Wu <fanwu01@zju.edu.cn>, linux-usb@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260819161448.76597-1-fanwu01@zju.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819161448.76597-1-fanwu01@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nDOQ8gu-LdzDc9qikULf4yAJ_fDpayFd
X-Proofpoint-GUID: nDOQ8gu-LdzDc9qikULf4yAJ_fDpayFd
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA1OSBTYWx0ZWRfX4cUkH9I9ksxS
 sjNoPUUjv7BAgxmhQ5w9Rcw0uNeQ3t7g5v2UyJFXC1uGDdn27+hjN2RLzFapzqIhLGcnk+V0DqI
 i/ZkQhBCM+Aq+HWdegS5cTumdAmjI/A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA1OSBTYWx0ZWRfX/9f78VeiKs2j
 sdVPr5EGlkoXGk8UH5X0WP7Qd4HV0Vg9y8r1b0yofnabCAM1Ne0dAzmQynTwjbu5vQNj8E5faZ0
 K254Cz63WVL6xnfxudAWPZdz/S8Vd83Mcy5JBSJz1qckYzoCNgQdagS7sTkiTuy1wc1YVTFaf4G
 VuGiEi4+hokhLouJxBJVXDucG9S5Tmd0gYYub1WeegH3nQq4yu5UOuDC1zEu76D+bFG1d5ff5VT
 h8v2HdYKWRbn54isQcfNdZkvSFbmwtzQoUj86rEWmFnpRh11EV77rDPZYIxf2IIGCEzkBtpUdK0
 /dUEWOcYekzMcbl5dt2uXa2PYKsJUvDJeANGHhhpNQIDE2SFdSUNFLGcvlu4Ka8Pjle52eeoK85
 jfQ2jaB42PVwRnhj/NXRI636WRkaJIHNvCfbiUNb4W2t1ssZQd83cGjGHflQfbRYnk7gOqb8hVV
 SZnxz50Ff8i/78EzuGw==
X-Authority-Analysis: v=2.4 cv=Oc+oyBTY c=1 sm=1 tr=0 ts=6a86b805 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EsPibtQv_QutKtu_k7wA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200059

On 8/19/26 6:14 PM, Fan Wu wrote:
> pdphy_stop() disables IRQs but leaves reset_work pending.  If the IRQ
> handler schedules it just before disable_irq(), the work runs after
> remove() frees the struct via devm.
> 
> Call cancel_work_sync() after disabling IRQs to close the window.
> 
> This issue was found by an in-house static analysis tool.
> 
> Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:gpt-5.6
> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
