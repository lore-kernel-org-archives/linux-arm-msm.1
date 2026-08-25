Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D45B3DDAE2
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 08:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787646182; cv=none; b=u/YRaKzPv0xaqn9pG5CUaCGFi55jbg9jPEKK/VBurx+ouvQQ5eV7qi3/WKcnbN3ZRF24IsuVf8rJAQc1ELv9ui8DbZcOnt4cLl9IvVZapObTqqfEzmKPrOGc/JTc+w6MVG9tXORUF4rNSJMmFaJVr3+YnsULDitWSnY+7x91Aa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787646182; c=relaxed/simple;
	bh=3k4yRXSRua7NYMqAmmhy33cZ3AnCSJOK1rbJA9IReO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9OE9KiIPx1/vE8kD25/kWDe5pO0Tm97ob2gDVkiHGhNuHASHWPx9Sjq/h/zTz+VthJR3CHRQNInmaWOy/+n0MafxHS+0CyVXvtZO6fnm8d5xi00SvpEcIE2icO2Yjt7t25bwFGlT1ooxS1A+6Xv2oxQHsw/rta87CChEuQKmsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cJObNxZo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HyXWDdyD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cJObNxZo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HyXWDdyD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88SUn1163467
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 08:22:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ywz9kH7gTln627j++0eOYkrz
	Mzb6+AiHqb1QNVbCm78=; b=cJObNxZoa+HbrFvBFQ1ru1TxDdBS/19QcmdXzbsS
	JezWSTJ/JX6BEnSx3McaDZcdeRb8zxcJzt9OBCsmpJ5TbONQYMbmEoQXrw64sQKf
	+knun4kxmL+UuXAoIeVu2eeJdoDwUxzlTFYHo5k8TCUSyPXow1jnxrU1VAZ8b0Ck
	3y9kD7g9xKnIqG9hMv9IkhKaTlNAipvMBpAHTYzMTRN81ghQAbFEpV91PvrV8tWc
	b1aWJoSxXSMbwAQEArCCERwR63DVMQeE1thTJO9Qc7WQ38z/vr45Z9pmttd65BWE
	sHIopSczy/pbsFYxJVJUHaCWDWBE28+IsSynzfO7mzXeBQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8y5jhqqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 08:22:58 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97bf8ed9594so386487241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 01:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787646177; x=1788250977; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ywz9kH7gTln627j++0eOYkrzMzb6+AiHqb1QNVbCm78=;
        b=HyXWDdyD3OW2/m+QwPYkeAWHghMpqauY/tw6ep0hjnos0fjM/FRZK/NhHsOjHRkMld
         6HmWhlY2cvxgnjeJhekGMQVUgMt4F2ZZOO0lc6idx6fI2VzeyYZMC4jTHSu99IfX5pap
         ZoGwwP4eRi3QV4rtTgKWcGSyQbc18aLjLEKZBZRtBz9Yt4GgIoTMq8ukuSHoyQIQIlAw
         PscJ+3IfQB/N2+SbZTYz+k1+uL935bNCBD8mnRxuToDSTmX2wdEdC76ljCK2XnQcN1hw
         /VjNsQYV+Gq4qXxjGps9cCEr3NR5vLwtibDP/4cQeft+1D6nxFP+VIOWnPNarSjK7gJO
         VIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787646177; x=1788250977;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ywz9kH7gTln627j++0eOYkrzMzb6+AiHqb1QNVbCm78=;
        b=RPo8thFT7V7gDRpraNsphDVArOkA1rRwMSqUbtS7vyPll25p/pIwo9NDEbWrP5w6+c
         5bsrbAKqFCMjU6Cq023LfbPD8Cfinveea4Ud/6sFPe9CsTZaJCGcnpsborAo+40yuXCF
         3aqFJ0LRg51ArcoUFcq/B+JocsM/FGOMQWIJ4QjVb4LCttDGFYA4timFr5aH0UCe+E3X
         jDQd/kAD0KlkckTYcOA1GB+DtkdpuXT8IARd531vhE/OxQLd9vOL/ebOlogNnm8puvfZ
         k9Zo0X/5MaNImU9VWhCV9qnqH3ZtEEevgZJjSLVv9VQ9CfML/mmXCTAGmU6cCq0ZjCn+
         6H2w==
X-Forwarded-Encrypted: i=1; AHgh+RrPy4ce4ATdapm284YBbr5ZZJzV/AEwCbJj1vRpMwNxNbgF7pIN0xLkUeQN0x2C/yeleZgf1Vfsm+mCfYv8@vger.kernel.org
X-Gm-Message-State: AFuF++lmsEKWUDAMmOOUkV4P50fg0agzAZffEVm3Lv+tkozOPobxsg/X
	mu8bkFcIOpZH7yzZM0OakOlBxNuWW4sjqXFKsb5DFE8e+5vw0jHp8tFx28KYySo4u/85BF7+NkW
	xhFL/aw+Wn3XN0wa6JXj3W47VNEcaOI+HNsEDFdFMVm6zeZDtRaaA2C/tAGQfOT36aCSm
X-Gm-Gg: AR+sD10ucy1ax/fauDRFPyZd9Rm4qMJptqGwnRPxE8gBnRUP/9loy5YDP7nG1m4JIEP
	y2GaazoMZ98f51Y9ilLGV5X6u4cHvi1GM2hXq99tAUF9ClTDMZzC4WBT65hEGvXJ/FW9qSiIPO/
	3gK/5nRkCY+I6UkOWsTqHi00aicrP5t9aShAVSOOrtJNdDbBOYmGS3xJK1D2vqtK4pKO1odovca
	gmj4Y9oQGdFoshmzjJykQkmOSEzx2nAxMO29NKAbVb890e3mRELK4XBjl/5QYFv+3fIQjl6iABQ
	WdQ/tCvgLZijEtLAdzbDJZyM3fntGdOmp552BimCNmuCauPZhCDmWd1auHiyCCzIlFQtalNhtwd
	jjGjRlhZlkbJtlg==
X-Received: by 2002:a05:6102:6883:b0:777:4e99:6f84 with SMTP id ada2fe7eead31-77fe635f317mr1644163137.1.1787646177502;
        Tue, 25 Aug 2026 01:22:57 -0700 (PDT)
X-Received: by 2002:a05:6102:6883:b0:777:4e99:6f84 with SMTP id ada2fe7eead31-77fe635f317mr1644138137.1.1787646176998;
        Tue, 25 Aug 2026 01:22:56 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e2da49bsm14366325a12.29.2026.08.25.01.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 01:22:55 -0700 (PDT)
Date: Tue, 25 Aug 2026 11:22:53 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, mukesh.savaliya@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/7] pmdomain: arm: Fix -EINVAL from
 scmi_pd_set_perf_state() on state 0
Message-ID: <2ah2wpjrqixhnws6y33tlkuep3et36q6typfd7ausgaslykmrb@cn6usezfkae6>
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-1-61171ab1cdce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-1-61171ab1cdce@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=O5QJeh9W c=1 sm=1 tr=0 ts=6a8d50e2 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=dS1doENrTls30Ym8nGUA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA3MCBTYWx0ZWRfX7rx1NmsRQdkn
 XblwQPNHmsZEmWtWu12uhMGvp5wOVlj4JdxvyjLyC/y+SE4n3Q6gBY/Jpqqt4AlhhIG5fvpyCrm
 rUCmq1Z+ms3JhUw1YRlQr5PeXL04R7Fjk23va8PrBrKkmgl006FOTSBVX5XLfwCF+IDTl2lBbpQ
 VfmCtAp+XT+N88+1Dndn7qCAMCht2X59P2aldD2yL5JMRtHKAQg3Pnb4vvORrc+ZoKIwg6rPPTp
 dpWBCoUqbKi+m8fqjdakZsRViLdQI01AivHZAxr1Uf+D9gulzYgQWvXIDniu0An1rAnuYObXlmk
 htP1WP5AYSHgG4OSnC/CN11GRAFNI8adNAxZ7SmZTj1M7Xi2gPOHu98LTaViBDfZV6CRZDwqhpI
 ND/c5+yFuz5SQS/doKY4ASP8tuBhzVPCpcTf8pFbGmB5PuXP+xrgn2QIeSXLRjCaigwiEbtsI+Y
 un4hhag6YOX8GfUbYaw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA3MCBTYWx0ZWRfX17V6Er/GYjeg
 mRUXd5T2RzGIncCExJc04/u/5R+Vo8d/1mXMudGFA+u7PtljgV4x+r0DUCYzy7ju9Sz2Gg1qPiQ
 GRFu9KVVB6dXmG0Cr9E4soEPH3xF6Mw=
X-Proofpoint-GUID: 0xn25vPUgt8VwCEpHbDl1j6ZJyHQmbln
X-Proofpoint-ORIG-GUID: 0xn25vPUgt8VwCEpHbDl1j6ZJyHQmbln
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250070

On 26-08-05 01:27:39, Praveen Talari wrote:
> Currently, scmi_pd_set_perf_state() treats a performance state of 0 as
> invalid and returns -EINVAL. As a result, devices attached to SCMI
> performance domains can report failures when relinquishing their
> performance vote.
> 
> The OPP framework use performance state 0 to indicate that no performance
> vote is required. For example, dev_pm_opp_set_rate(dev, 0) is commonly
> used (by firmware or linux)  when a device is runtime suspended.
> 
> A zero performance state does not require any SCMI performance request
> to be sent. Treat it as a no-op and return success instead of reporting
> an error.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
