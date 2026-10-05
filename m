Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF5147F3D1
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 12:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791201631; cv=none; b=oWG/kTiOFTBYENKqB66rv9qHiBmmtqpfm1e+whH1JjjSkg2cB0qe8QmHeh2GZETYPaHiSzUG6lAxxl2HEuE2ba9n4uJCMKq35D6XnTr7DvfwwDy2uXhQjEAffFNJnELInxM8vIAN0wxg5/f9n7aOJfQq/6xuij7G8+166NWQK7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791201631; c=relaxed/simple;
	bh=J4f3p9npyqHrcIAJJeagZsStVI/MJ0U6TEfe6bpSb0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F7TqZ+w++T/P1qAdTk1+tloPLzcHZqILSfqgn3dgxL416vA5S03uKIlkH9pOw5PdtSK1UfDyOJuPfnVo80/C4xuEwEDHu2NOkBrsG6IdCh1N9EtGHOG4WYiEJVj6fOnlgSFA4XD0tVormL7i5k37uaFp6rDTCzR9RtHwLUFQMxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=atC8/+GU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j/MVrc+0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="atC8/+GU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j/MVrc+0"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695BTwa8973220
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 12:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NjqrkeGFYtSDE4uh57Qyu5uwPPi7oB0ETinHFeakgL8=; b=atC8/+GUTPUwWVMT
	STecLuCaR8X/jeIAcvaelX0sxrJ2tEHRqQEXCaPKa8TyDKd0/V+vFJ8hLSNWBsP+
	LB1DqGTiYtnXMRMcGJ149UE6O8iQC/RsNxWuczKl8RUz8crNsbJgUun+XbXCTeJv
	hXnFNMW9YJizYijb6FCVtjjZUPLT35iJeBGe5jXL5U46IOywT7MngsgrqWeJp5lf
	B9STWTf/Q8NyXDTnju9F6sSRRarstjaLJ2gjGKZuz58BCH1OsXoFJ5XitnYIKbj1
	ZMJLiPlDAd+LeCRWOvSpmMmfAdQC0QzYqJNToF3aQy1k7Tq+pFnY64l1h8HbiOWf
	GV98xw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2u08nknj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 12:00:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso1601362a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 05:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791201627; x=1791806427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NjqrkeGFYtSDE4uh57Qyu5uwPPi7oB0ETinHFeakgL8=;
        b=j/MVrc+04j/nmdYVlTJ8snrVX6jWyo7IX/8hxE001EHnq2pPQW4HdCghGS2Lm4VqmO
         Myds1bEyfQGt4jyEHKf2NtY8IFwg1ZNb6BaLwnyc+9qkMnEzpGZkt1UHzPXH5zUFrL7L
         gRikHVVmCLCMIHjY/c0dFFvykFUu/qzIrmGUEC9FCGmP+ThhEmXcnze+P0MEiwXemWEM
         ppqiL9rlRqLPCrs4lmctxs/r9nWk35BG2/BxFlr1pWehSh1XqEfiW+svVkqUl6Ctikhk
         e9KM/8sK+Z+jwjQ01jJ7lik41qhooTuPA6Zzq2ed9QEeURExBTvgE3g/Gd0F/xIp4qVm
         j3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791201627; x=1791806427;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NjqrkeGFYtSDE4uh57Qyu5uwPPi7oB0ETinHFeakgL8=;
        b=cDiPEKenSWKrMx3FaEMwJuJ3VuVO2uLUDKnGMTkuB7Z+i7N2cRvzz+K2BrDfj9LSfd
         OiOMHHWvyeff1gpK6YAQTQq1lgXV+3j+qHGfzbT/VaYIT2YU4UMjvzULflEe/qgzJ5A/
         ujhKj1Jwd7llr76ZQTWURsehHFolL9S+luag9Ta4OuR3tTbV7zVpD5tcRf1ktiInIKQJ
         qx9ik83K+ebLslu70uw9x/4BD3wjsrZWj57hh5xFjYIo+EUOuVqBD8IH3KHxq+F2Dx63
         Eburz0yuRegc+83uEQoX04owq8jbQWvsP855DYYDTHdnAtSZ/6heWQnvmfEnyj8JHD1t
         Anxg==
X-Forwarded-Encrypted: i=1; AKwUvBwyCavW0cXsgw34SI0s+Pqy3uB94chlSRIuL3RQ0Po1cJO+EzNCMR46vFxn9JWXmBfhcKxwD67+2w8ZS9xc@vger.kernel.org
X-Gm-Message-State: AFq9FYJUeZRY+R2nc4n00C/72K9sRArdr0m9brCawOfBM2eLVf//6fg1
	OdCUr6TSybRpVhLMeDrq9ZL2vH3iiuj1PyjSksUvS5dUDSLRHHZxrTSfU2HF0N8nqJIfs9Q2aMV
	p8Xj5BCOTpEwvQp6fFu+5l9vxSXKyjLp4cAGB58xQkB37WaC+9aAxlQFzW0UYtSE3eM6i0y9kEI
	K6
X-Gm-Gg: AYBFou1FaJnvc/trP0xudbFSS+z7u2xtpLZJtelyAvcIRNYtk5rP/5m4FEY8n4N2+Ay
	ssBo2XfbFZQv471VVipx9J6W1UpB5KsQTV5bb3lFyFOnal+XZnJs5nHjXIHluviQLW5orgiEgFi
	IvvOmyXaZMbDatraAHn0YTaXQODjCXso4dkSwa7+hIIBI5IsZ7bBI+zCVLg++GLUXFQW1s7ChCA
	7BgZul6vbIOG5pb9+HChIBVzCVx9nq9cBoaexs5WANzqOL4xS9qRjzBjcSSzH2tJmZ85s5Auj9s
	1D2vuprLGEJxsk5VWdH+m2vCpgU2gKlXE7c96nJ6a7+NxuLst1AaPjfbnIDb7om9pohVDHZ+4NL
	U5wCWpd+Hpq6CGmzVxehSpXurdWLn+g==
X-Received: by 2002:a17:90b:4c05:b0:3a4:ba6e:65c9 with SMTP id 98e67ed59e1d1-3a6ce963ad0mr4301070a91.59.1791201627239;
        Mon, 05 Oct 2026 05:00:27 -0700 (PDT)
X-Received: by 2002:a17:90b:4c05:b0:3a4:ba6e:65c9 with SMTP id 98e67ed59e1d1-3a6ce963ad0mr4301044a91.59.1791201626566;
        Mon, 05 Oct 2026 05:00:26 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d6b3ceasm11047079a91.10.2026.10.05.05.00.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 05:00:26 -0700 (PDT)
Message-ID: <e1ae7f91-0787-434d-9553-3ced487fac6f@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 17:30:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add TPM support via Qualcomm TEE TPM TA
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Xilin Wu <sophon@radxa.com>
Cc: zeroknots <zeroknots@protonmail.com>, amirreza.zarrabi@oss.qualcomm.com,
        jarkko@kernel.org, jenswi@kernel.org, jgg@ziepe.ca,
        linux-arm-msm@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        peterhuewe@gmx.de, sumit.garg@kernel.org
References: <20261001055029.1960743-1-zeroknots@protonmail.com>
 <0c6d29ce-920a-4566-9a4f-a0687b0e5ddc@oss.qualcomm.com>
 <b2xdth3hkuypnvxlrgssnj4toffbceohhnh7w2ju46fzinflfd@qaq6ai5plolq>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <b2xdth3hkuypnvxlrgssnj4toffbceohhnh7w2ju46fzinflfd@qaq6ai5plolq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4jgOoqPvdWcm3C1LPA4np4ElTTO-UREp
X-Proofpoint-GUID: 4jgOoqPvdWcm3C1LPA4np4ElTTO-UREp
X-Authority-Analysis: v=2.4 cv=JqlkP84C c=1 sm=1 tr=0 ts=6ac3915c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=WzojQP8EweJUJc-V32sA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0NiBTYWx0ZWRfX3V7ykrown/1w
 1qFYr/Ypyyka35jXtpjpI3lDHSb4swLIqrR653ZCCidh0ZQ8LpZ6uICm9clsBBoFzuVh3dO+oH5
 rYbxb6sD0MAhjFwERS6JdsSY8E2CD2I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0NiBTYWx0ZWRfX9UPO+4CINNGn
 ct/kByg914IBEHQ40vijOhjU7KD+w/nFQ8+TXPEUY+nng6cz85cgmuH0aPldiINnogt4kJAaYc+
 FxAQak2WjGBY56G040IG9XmrxfcSSlQWZ56RoAgp447AdN9I201pbQT6z6uPDan3XFil2qWMLAV
 p6NJ6pykvmItcbvqDanulMJyrbnA1t3nfmc081APD1G+WuFY29zPdPAJ8gc9Oj3O7vZv8EcoEsb
 lJtwZuY+ipLBIUQyyelmv/ulMsXCH+pZIdm3HlYgyUk105nxXs7QGpXpX5kjozyQdHXQZVzwwSL
 lk7nFsv0Tg+5iqOmpRncCwn5IYXYffPWyegCg0l4q4l6teiAAqje+nEmPhpk5b2a7AeFqmTvUx2
 kwrnSZQZmsb/5yi4/npStNBBiKgivKa6GsBQGsQ03YEJXrVeODwYSaxRfIwip+Jj6k+ac97gZBX
 brq/Q46tIs/uUonDkVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050046

>>> Two questions:
>>>
>>>  - Is service 81 expected to appear on retail firmware through an
>>>    update, or is it specific to the CRD firmware?
>>
>> Yes, there's spinor update(bootfw2.mbn) needed which is in progress to
>> publish as QTEE side changes were already merged long back.
>> Roughly it takes ~1month(ideal scenario) to get firmware changes
>> available but somehow it's taking more this time.
>>
>> I think i should have captured this dependency info in my series cover
>> letter to avoid any confusion.
>>
>> With the changes, service uid 81 will be available and won't see qcomtee
>> driver issue log there.
> 
> You are responding to the user who uses a COTS commercial device. Are
> you suggesting that the user can somehow update the firmware on that
> device?

Ahh, for COTS devices as one cannot replace firmware so it's better to
use qseecom path in that case.
For latest ones, one can switch to qcomtee based approach.

If Xilin already has qseecom interface written then it's best to have it
for the COTS devices.

-- 
Regards
Kuldeep

