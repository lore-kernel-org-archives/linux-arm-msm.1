Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590298;
	b=cQXdr2rPjDcE3nCvwh4V+9lfELHdoYdUDuGyOYZTedHZLcyRWp31AIhvLfgkOJfYD9Zt
	 tZsGiUQwO1DUDpdT0ACBzQSXVBZFWQxVAnzMoNJ1hPJSN0C6CrxPgMvnuZNTKjnn7H/FS
	 Vmyrp96YiAw0vAuImnRppDBxLrYqqUDUC5zCf/HL25j8h7GzFT1zX8phnzmQnC3Yqrcrc
	 8oIud+79eIVlpAycOT5PunA6BN83oPyD+TEvbT5+71fYeGRc8rL3KS8OxlNh3uI8x5jm3
	 /xVZVnQYLM5Rj3en9RwnoNH5Pcz4L0ozYmSVNQjNSoi1ozyzZFkcJiyMiQxcJY/0SCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590298;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4HFJLn83kygPNb4chE01mOHDBkV5We/MxsvCuFn6o6U=;
	b=QC6A8pfadKjyCpcJmYRMc87bR+Gciiz4G6RBUg7BBbbD/rBHj0nk1m9v5Sm+YU15oWp4
	 WFF3XddU8xbszVakVu2/jE2b3XP9rwEG7rOYKGK4R7zp6HUG57K4Cpehz4jE2se22Tfbz
	 1+g4CQJG5KRPDdchStvrqWQZgy3cf2mkBavQnum1S7LqjpntoNulZ2/Gic8pVfYl1hh9f
	 ye9AY0Hcl4vMFIyfQAc2TZ1YeyI5u1u4JiPpxzzk+37gHoNtzOt8jvjHOg64Eb0bjxnAQ
	 n1hj8YNkUXHo0gizEVDCEx7b51vyr9a7Fd8KhQxwlG3jWF1/DThG95QscJbl2L/nRkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fUxQwyQc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hIQPDwi4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF7F606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FF7F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fUxQwyQc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hIQPDwi4
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg7jR3225034
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:44:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4HFJLn83kygPNb4chE01mOHDBkV5We/MxsvCuFn6o6U=; b=fUxQwyQcb1/73HkE
	hHGrufBLfRzLHURFpHedf2eLTNvdvRIEdUh26bdpVFAnaRqfFFuVyKAo2adWD80N
	JDkdtOtajuJYoeYPZjpUZtIEONH4emz+p1UZ/dygS2NMJi7GRC8OV8RXeggGUHWj
	9z8H09Sefd/RRvLUJgui1wN8hrP82AnWjrBlzS/HJmGXqoruEqrRTuXvQm6nSM/v
	ChRw0TNb/w49QEWr327yWiXq21MtWkZ3BlNDza/lzCBT724oMZDJesmjjQlBUkl1
	aMZh5rxyFNXqsbhoJJLsGY6JbGrIY91CZJpoI6OdONcKFM5QHDVNlDBkNfuqhIX8
	eXMNcg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy79b2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:44:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e629c7b16so17702385a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 06:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792590296; x=1793195096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4HFJLn83kygPNb4chE01mOHDBkV5We/MxsvCuFn6o6U=;
        b=hIQPDwi4OS6dLClXV33BIspcr4sidgyFCKs4COUUsc8aCkVg7ep8HxVKna94TNiLOW
         qiC3sHxsSASByLIgmD4BeIHSuePvop87TnZWXZtXaQlbTATfuMGYYyQxyf2MZ3BX5lZs
         lfTw8CduIUQ0DnCcx3rpHG1CeZZuKCtxzByWTfhJKkEgcElM36WvZVjGIm7hTrAYyrdZ
         wWnkbTmOYSCwkBr4wKZtvo7Uwzhzb6CQ2MltjdEJLReDtRgsTuv33crPldVNfthoxg3v
         WiFzZmKd+dKzwCFAzWziPUe8cpjKNl/trVXPiGEjvur87XTPU/qkLt0FkAk4/AmvDdtA
         I8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590296; x=1793195096;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4HFJLn83kygPNb4chE01mOHDBkV5We/MxsvCuFn6o6U=;
        b=UYQkVaMuS8maWTXzgU6caMDOLmdjZOYRpe5XwqpWwJMYLO0ZxsBrBaAfd/a+7UlrZ3
         Nwih6dAXY9sH+OeaFXRtbMrsOB/41VmCb2LSEOGSYE2kNmPR1HhcZKNTzNaQMuN9T/Bz
         6RB74oGt61WE+S02lJwFT9h5rizVLiEO9a1BFP/XiJA2asKGXQ37VLbIRjG3d2j8AMbl
         k42T+NuOhSN8WisgW4ibpPdTmY7g1rTkQLpdowF9cP483AYMk7/GU+nhLLpAzju25lmo
         e4YRYeNeiBnY7pd2qbJaXlYa4PqJDQs+N6f9lE1J+eQlLeo7PCqPoM1KiiYO8GwykUhD
         Vr1Q==
X-Forwarded-Encrypted: i=1; AKwUvByZk2vQzKXJ+TIoeahQjTVAa3xwR+RPPqn8D+x8CSLSVbVyElDIxsT7bMec3ExZW2mXfjIKtBAl7Uo50DOw@vger.kernel.org
X-Gm-Message-State: AFq9FYLL89u1FSGgeZMJEoBzboC+7u/glrpAjrX8wz/HOEk5evY87vmv
	W+2as9GdUuUM3GIpce0lxgcAk2vGHp//pos4pVRr7wqCd/kVbm113mWGj36MSjrTqyh01YTuGVe
	bf0dXVzdobDDWHTJsRhDWI9EJZOlII3kUO+j5ZzZzCahuN6oG9ArnZbMJOb8vHqmG8+k/
X-Gm-Gg: AYBFou06HGHho8G0hPTiopD5LJV1h49mKSsVfJNteoyd6vergm0VXptD4nEx5CTGHrm
	Fub7MgDHuHj4B67hgREiqiFIyMpRMouqQeneF9yKIgZEnEeeLf7Bsr5+D8E9dFNpGVawE2/FwXj
	5wPyZ63BliL/9hcDdR8HYTVhVGCdhcBAlhsmcYaghscm6mZ7kyZGA+BCdM3pJX3ppG2YN/sd2Hc
	2rmOkKFF646KbJmCko9J4uGhB8O6mwRP8LWohcjNv2KASC92Q60eZIJXajw+cMDd9ceiv79+Eli
	TrrInR6M/beDbZy/PpManot77svVJL+hfWo8goik9XQYOfTo2R/rcFHfZoLe+4mO0Ees8gN5hwR
	fGRUYwiMr8f/7SOgQcisiVA==
X-Received: by 2002:a05:620a:2a08:b0:92e:6485:f640 with SMTP id af79cd13be357-93f57fa2115mr496122885a.4.1792590295758;
        Wed, 21 Oct 2026 06:44:55 -0700 (PDT)
X-Received: by 2002:a05:620a:2a08:b0:92e:6485:f640 with SMTP id af79cd13be357-93f57fa2115mr496114885a.4.1792590295090;
        Wed, 21 Oct 2026 06:44:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a59d61esm6097366b.56.2026.10.21.06.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 06:44:54 -0700 (PDT)
Message-ID: <7eb8f0f7-9e5b-44e9-971c-54bfdab23c30@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:44:52 +0200
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
Subject: Re: [PATCH] usb: dwc3: qcom: Check for L2 only when suspending a host
 with wakeup
To: fabricioakio@gmail.com, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
References: <20260928-dwc3-qcom-l2-check-v1-1-43c5c6e97922@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260928-dwc3-qcom-l2-check-v1-1-43c5c6e97922@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Of9mJ2uTDoLqv4xJQKXAJJxenS4U6RYv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NCBTYWx0ZWRfX5yW09A2fEYV/
 86pULVCLGFZmgGYI1D/syn1GJUhmrekN3egXbqlVn1vZFH6umpgNQH/3y/0WFptkMvel5rjX24R
 e3nMz7+rl4FT5suwVqSLwgCyhuGn54p+n6J5Z2/F7u4qLTAywFpPU2Im3A27SdGB304PSiSlWij
 M9Q59+u3P1NFpZPCynpnQ8QLmWNECrbg9r2V1gkSe7ynfLB9FtkbKRN3XdI46GPho+4TGxsvVvT
 M38rTerveZPzATmSHyrjWZAG5vndd8arQvmMpUsNwkER74zVRBUjsLdJqTRzQimrqB8RJvP72n0
 RgMWQuZv/XU+SbTOAEWXHq+d70WxQfccVDNzPEHXdpkROGRnTrLFOq1RcdQo2hd+Sm3id7l+qgC
 k5mBjuVnn3oet/KjzFTYRmytYXn3ueg3oZsS+jABQS5M8C5gGasHslrPMO7XWEwHGWwtGruoFkb
 WUhiUEaHn6/UuoFqyjg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NCBTYWx0ZWRfX0SOCT6nPmwv/
 Ysiq2HOl4D/LTZbOmv/rf7K0VSXi+kQnTj9MiFFKeppdsUKrebv7q6UHTAJaNKcidLgqjOH8szB
 A1k4kC06pBCjigA+WjErRKy58t8b/S4=
X-Proofpoint-ORIG-GUID: Of9mJ2uTDoLqv4xJQKXAJJxenS4U6RYv
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad8c1d8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=QFNGBFAix9GFkXGs:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=0a4RfB2vrMYbvN3io2kA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210054

On 9/28/26 8:16 PM, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> In peripheral mode the core disconnects and powers the PHY off before
> the glue suspends, so the link never enters L2 and every system
> suspend logs "HS-PHY not in L2". Check only for a host with wakeup,
> the one case that parks the PHY in L2.
> 
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---

I think we should be able to retain the link in L2 in device
mode too upon suspend, but that needs more plumbing on the
clock/gdsc side? (+Cc)

Konrad
