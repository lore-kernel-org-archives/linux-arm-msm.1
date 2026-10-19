Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241C23DDDDE
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 06:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792390681; cv=none; b=CGXapJxZ8Jl2zOvcsLmAxh32IDl4lH1i7uA3pAJIc07skt/3NpW4Dsj4Fn1g8HJuuY43eXyjRnnixQ1R5euyK8obUMpXesqvz1MEK5bCRhhREoUdNqxqr2DDLM5tE3u5QhrO3NaocZxG315Au64Pp4uVLObVLVuerx3l7k7qLRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792390681; c=relaxed/simple;
	bh=hT3kconPAO71ZAgCnNBq9KkOENtVYYhR4KqdJA6cfk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AwWAMxX6ezqboEHTbFjffdRsVTxl7aIK3Ww4cZDHijqr23RGl8/9nNv1rWf1GgW4tOSbDSbJtZjPd4TqjfbmM/5mkX/hxkB+kxwdd2jvh7g0bJrfdBmedl4h6S5L+gg2bcgxBViEUimbLvu0ZKClSCkwScCofQg5JUePX8aZuK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CiLn2vQu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z3YifTYK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CiLn2vQu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z3YifTYK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4jGZ91751426
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 06:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	06159emas6EFWdKcDMqYp+aj70RJ3dHGp+7F881lMJ0=; b=CiLn2vQuMcLzGow0
	xpNe9dDGBIItBH+h7uzFCA1iQKtfahmc3/In2zjq7GhKXTRfzEGSauz/Z78BPQVk
	xskwMPfTcmOIblFHnjMnvWyIXs4fVo1tGPrHgQy6mX1fkZO38GJS5qVfMlbYMn/U
	p9I9sajflr3RWPxJfCsDcHfaQyog/f6a0lDFe3Gd95fs187trY/sT9dcnBCr5+lk
	5ln43iHtYpBeeFK6MZN3Yjfcb/ScRur4d+wLpbYnUbkuy8WP7JQnevsLtwy/TQJx
	CoHe2N3MnrV+dD+NmWmuyefVEjlHo96h5KqzW5n3Bx4FUJb9sETFXdFJidjRY6Ws
	rgzYJg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc183d5ur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 06:17:59 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3580c07911eso5463921eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 23:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792390678; x=1792995478; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=06159emas6EFWdKcDMqYp+aj70RJ3dHGp+7F881lMJ0=;
        b=Z3YifTYKDRVAWRXNDSmyANigfzz8LTAP9/oVknuHGVYYfkWbpMoj8wwQEdYi4UqCE7
         aOFDl8B/gVXDway+Ot/CdIPnJqZD0JQX/EXIJ3sZvQA4l60nyiKrJidLA1q9l7+ryh1O
         5TEx9TgY+atDHPPXgI1YbwRmd4BoP0fjdq8uxPzKNjkaetFAzcKKjHXxUU7hT35gVRLR
         ZLKZ2RTQnniauoaQefCQbZ7IulY8ZgD/ByDP698Mkyna1SK7Ch8wURen3/K4PZMw0w1b
         KJSdCkwco3Ekk+NGeqXjPX7HrujlCd7kqzaAg9bBcBA+M/JSOInQrcbg1czqmjq671oY
         yRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792390678; x=1792995478;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=06159emas6EFWdKcDMqYp+aj70RJ3dHGp+7F881lMJ0=;
        b=rUQPPRkHSiuvTzCogjwXNZf8VeUYx+aUqQVM4PxpjyiSk6exZAM1nTRKCgA1tCCJKI
         Q4TM2POsNSJQ5f/XQRF67oAqvKgoXsRI892Eot7EoyQKXyXPgDmWt7fO4Yt4yGPriZrU
         3uSI7PhfDluo7M28kPHC1ZksDqWA9StShi3o8m3tgi3BwEeYGGxmNvknf2PoktlRxv5S
         WruzuWXblm0GqADfsG9wCebi1XJRwiOL9SXxA8b/A9wUUzPv4p4nx2DXQ6War1e41T0I
         52Hwng37EujwWzv1WKrSBeb2bxTaQ4DpIblTZWXy6rQoFZfpKzsYkcXijECegjuO+9+Q
         5ixg==
X-Forwarded-Encrypted: i=1; AKwUvBx7GnwpGNViWDfgeq8kVGyRxbI6ZUUfu9MNfHBNbeyycO12pCdJc3aK3xRg6CAzNO7D8JhIhH+5E/R6T1rv@vger.kernel.org
X-Gm-Message-State: AFq9FYI0ktIC12YYVDQHveT36Hc2FYRIXnKaeRnBkEhe/kKApNI9ylEQ
	XaTSktWm2cTxBZvmojP2ZKw0GtTNMwbKC5v2xvJSed80lWPzvp+zQuT7IHpRx31NCNAsvG7utK1
	jxs1oo6miffToaQrRd0QSnA446Yc9DFwDK3cL1lipDevxHl0Xhq7CzW7foiVIk7SJtuhl
X-Gm-Gg: AYBFou3GrHi7NI6hxYJERzPQa3UDBSzMWqoTrvc+NY9uFQiPIz8EuDITgDj2W1Q871N
	39JFz91HjA+xLVUPUuv4Tp9RYCHhQDj9SUFViY6krW2aKArv0zgxKTQSFgORTVPvRV6uMXu0bqj
	nLA/WWUCTl/Q/32TVCdbf12tVqI76RA/swgaJfWSGhLkz1CJthKIH7kXEyEK6XTBYntSuhc8MnH
	22Kcf8xeGzrteZR26JEHDwGxozF4U8OHNahiSYFBA4dlienUowxZtixc4LCx4itcX7ssbCucNLX
	Wr+uvnY4b0dTVST9h9yV4L5NEeXc70m0DY8lUTR00V1UuLJ0LwV5hgGikn8Nt7VVRPtb0V2insF
	w60A0sgMOEveO+1iQip+Jmp4XTzkVuw==
X-Received: by 2002:a05:7300:ea8e:b0:35c:8abb:b4ae with SMTP id 5a478bee46e88-361a1f505eamr9695587eec.25.1792390678479;
        Sun, 18 Oct 2026 23:17:58 -0700 (PDT)
X-Received: by 2002:a05:7300:ea8e:b0:35c:8abb:b4ae with SMTP id 5a478bee46e88-361a1f505eamr9695458eec.25.1792390676169;
        Sun, 18 Oct 2026 23:17:56 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cc23sm34095658eec.2.2026.10.18.23.17.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 23:17:55 -0700 (PDT)
Message-ID: <fca1f5e8-2b11-4912-98b0-42ea2e9a3d1b@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 11:47:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] tpm: Introduce Qualcomm TPM driver
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>,
        linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
References: <20261015-tpm_qcom_driver-v3-0-247c8e50250e@qti.qualcomm.com>
 <20261015-tpm_qcom_driver-v3-2-247c8e50250e@qti.qualcomm.com>
 <atKpjLYdUuugwAUQ@kernel.org>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <atKpjLYdUuugwAUQ@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAyNCBTYWx0ZWRfX+mMV7VF16jDC
 Lwp1+V2GmMrDMk6zPEX7Zg42AontRtztZXmkWxBojKEy7XQllZdpDvWyA9XQT1Z5OUTu8my9TW6
 kWSSAKzbfl/xVecKcmE6YoTglm4NYBQ=
X-Proofpoint-GUID: bolMKVycfNImE95lFU-yt8lPHK9ORK09
X-Authority-Analysis: v=2.4 cv=Bu8IUoX5 c=1 sm=1 tr=0 ts=6ad5b617 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Ebq4Ce3iuLL-fAZv0N0A:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAyNCBTYWx0ZWRfX0AuP8X8bJE4A
 dEwDGWQFmqXrGvLZ6JhptuC8rFBg5kwPYAIMUmE83K7cLYRPbdmas28nsKVaX51gu1LWM+6MTXk
 4hkrMH8a4mh6ExnUZ0NR7yaKIhSF/i6A8M2ZCuhSBeD4s4OC0nNVZb5mvbe4IA1VlVhKDVqIS8k
 iyOqOfs6mhH9992davDzIV3FR0SojDf4IfCp1LiGgesvjbzhWoN16MJoLwftIPwCQbuV1IVMN98
 nigu3esHURT2TzntVbrc7fIm2eg5D9ECPbzw7nyodseDARytSUqGiIsVonIocrMo6lhuolHYLm7
 BiHMWB53QMapDnK4fq/aMFbls2G3oNxpxjqujVxyrpKTLbBvtVwhnuoP1efBnODsbmi4S850un3
 kuO2X7FVV7jRaMtrU3UPXukz2jy3QTtY175iVWe1CIYnduQsaGAX4WYnF0S/0y7YpD4UMuDuoha
 /Z3xoRv5pC3dVT7ETxQ==
X-Proofpoint-ORIG-GUID: bolMKVycfNImE95lFU-yt8lPHK9ORK09
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190024

>> +	err = tpm_chip_register(pvt_data->chip);
>> +	if (err) {
>> +		dev_err(dev, "tpm_chip_register failed with rc=%d\n", err);
>> +		goto out_svc_obj;
>> +	}
>> +
>> +	return 0;
>> +
>> +out_svc_obj:
>> +	tpm_qcom_release_object(pvt_data->ctx, tpm_svc_obj);
> 
> This is very cleanly laid out driver. This goes perhaps unhealthy
> levels of nitpicking but we usually tend to have newline before
> the next label.

No worries!!
I'll add new line before out_ctx and post next version.
Let me check any other goto usage and update that one too.

-- 
Regards
Kuldeep

