Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B30D23395D
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 12:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788264020; cv=none; b=Q/qY1qPuJwSDjPwt/OC1kUWE5A5I5WEMTAeZzSin0jo5aMu7vpcY9UzsQVvXEh4fFnBdZap6o9sGuvJ5iFkc9/pdWleUGuDJQvnMlGB2Nf0LlarYrXMgJ4P6JuJ5Q2xd36Fm0jTOzpiaQJqrda4DyKq8Do71hpd42Cob/NmGCRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788264020; c=relaxed/simple;
	bh=QCJewAmYP8pV6ka7p1vMXODbzprkzYwvsfa0YLhRqfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gGBqYw5/aiiPUGILhGw8WX4ta6jVY2xj3NZWyDsOEkdypc6a3Bf9Ed98GXiVA/zL7m2kAMbwJ49PClyTDAxysjvA2raps+4xmgR3PGW6FI5p6YmxqSbO2RF51pyAJe0+gSNUnVoTqeLeky+qwSWqnnsRqvKdZEa/ed9EUOKeAl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dGnJr/Zx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W6LHK05m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dGnJr/Zx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W6LHK05m"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJaLF1137412
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 12:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iXGlLDwHtFCPNeY7LA/k6nku
	L3mth9v8r6iZQj6mK18=; b=dGnJr/ZxZMEl07qYTJXS3W1m75CsCaLCDOBkh2z1
	neV9pt9HryvhFXz5KjibWJxqtkR/Jt74Cwm7C/cfmfx17r7g8+FtTg75jct8Z1nH
	SALFcItaHveyOSTrWC8cWn1fEVtu00y4TAs6tZMhtKh/qk2Y8hUwtd1iPXeOSr4Z
	Jy7SGMnBNFcsM7JCjDT5+7GMGFa3uHfdZEKjtAt6oqz9C4mxvmMEYGm6yDa/Bcif
	yHKqcuSRK8BWnNeMLq1UvOrqHISBB102AamsC95mSH69VeJKTDfVlB3AvHws69x4
	HFg4Ha7kBUWRCFfhir8NIkX7gTA5U97rUMQsvaLQ7oDlPw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcshq41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 12:00:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e88a0e8dfso24608396d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 05:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788264018; x=1788868818; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iXGlLDwHtFCPNeY7LA/k6nkuL3mth9v8r6iZQj6mK18=;
        b=W6LHK05m054A0ADLssetb6saHyepQEx5pIAXTpFrAZ8tE3HKbxxoqDEZSQoeybbhdY
         SgXgrzxN+yLJwUsxmbalC0uayuk0ptQ6pGl0GT4AlfuEWVEp/1bNV3pdappyNHmMQPSx
         dqajbNcf+zB4rFRE7+XJ2unCQotJmE5PSZ11oRQmkAiNxH+Bqh8/q2qQTSXE0/Oluc2M
         AzQGMPMN5XXWWRhP1lMmhAyp6YsSEaTIPcd7mW3R4ReN8s1khckMwD1lfpVAChVf45do
         GQ2uFnQ4Sx2cYh1dstPKpwxYDEfNCbH5F2BGK746VE2Q5xtT4RjQudNrB/lHLp0BbqH+
         dcAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788264018; x=1788868818;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iXGlLDwHtFCPNeY7LA/k6nkuL3mth9v8r6iZQj6mK18=;
        b=eAkHPEVNILINN08S9VU55wuhLza4MG/frleIDybyX6tj/+jGreYaAmUDrbFLX+pA4J
         yOomK0zj32n1eY9egM/ZhN2SMAj4Vi/vx6jmGErwen+yuFNO3qFWGIj7ek4lVhneDB84
         uZ7zKB5BrA5d4AUmVOlsCWgk4KRmIx5YocqY36BK4deWIemoT7nnbDVF2cCkx8fGATQH
         VVviYTVMjvPko2dSeBj/J74iKGOu3ZlJnq5vY2SvYmSERYJwAHG62QvEy7t6p/eGKXaa
         9mU4znmhNSqU9IAxHCH5/M5mxhE4f3cSLXlkcZafDLaxs/DU2TugoQMg5irukCVZOZEn
         LNjQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8beSijaA2P/vATbn8Iot/AAPCZSOi13026n+72hYdWiU+LZO7qanJIMVx6p9Tk83yCxiWUE7sFdmkLxbm@vger.kernel.org
X-Gm-Message-State: AFuF++lr9FJgBphr+LJ0pJy8QSrvvcAuXHlo8AGzTsoBcenAPZmaaOiP
	pHIIRFH/XXLYflc7ArPJTvGN6NW3v78Q0K48YRB3wsdhC7zgUwIOF71tIno2FRVXTVtJ64vxkWm
	H8jl0LZohIxqxSECNI8OUSXUo1+w6r3NfEAcbsyVUP7f3GZdu9LTbcQla0D8sJN1jjHEs
X-Gm-Gg: AR+sD12V5PGFVkDzRJPjYN4z2gEGbOn0sU3r+No+Tdo3SArAW/xPtLUzeaG0WbM10XN
	xCe86vUG+3+dqVi4Z3ADcZ44vV4XJG5bd9z7HqBdVYNRkcHce6BgeM18nIBCBF+xFaoWjJ/YjJM
	39/qsPY+PEVWVKjLfzjQBusY3rrP5Ff5jk293Ieyk9AuaZbKHcTLSJC3o3wrXGOlBblhu88mDIj
	47QmWRqIYa4kaECh4JKTNxDVfnwOW7UyW/R7wrOS3tPJBJ9XYcDNRX/jWGaBZ2evbds6VKoeC9N
	B3t3GgbF2/A7dTgL1l1pzP4bfV5xoyZ/YqDkQYQZRGYfdQO1KvHaeQW+g1I3c4dbBmFbdgM0+1h
	CIRBGGnYNmw+nKw==
X-Received: by 2002:a05:620a:29cd:b0:915:a953:4b9c with SMTP id af79cd13be357-93913749780mr3536584985a.3.1788264016282;
        Tue, 01 Sep 2026 05:00:16 -0700 (PDT)
X-Received: by 2002:a05:620a:29cd:b0:915:a953:4b9c with SMTP id af79cd13be357-93913749780mr3536559485a.3.1788264015261;
        Tue, 01 Sep 2026 05:00:15 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d7e687sm4664913f8f.34.2026.09.01.05.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:00:13 -0700 (PDT)
Date: Tue, 1 Sep 2026 15:00:10 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] cpuidle: psci: Move initialization a bit earlier
 in the boot sequence
Message-ID: <fuc24y6pvanwxxxan66pgwlshcwz23kiujk4s56vlflr2zm3zg@7tgx545sqlvm>
References: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
 <20260901111441.122436-6-ulf.hansson@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901111441.122436-6-ulf.hansson@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEwNiBTYWx0ZWRfX0ljIPPDAF+EQ
 xB58jvoyt77noVsGcyJTAxvzErBu8IikWLHod65IBPgZYPmgOTlO56mKRq9vbfuZ9h1MXUVBrzu
 LF5ivMwaA8JzjnPTXQ5zfD10Y2+BUN8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEwNiBTYWx0ZWRfXznJb/RtEp+lT
 vPisOHKyMa459YFma52t3qwlhvT/m6G0epiUsTb8Mdz023N59m++ynsfrISIMGoWW8gr7T9Sl2x
 u5i1YQgmmE4Y16xn+6veRuufLGkdcJp6dWsp2+b75qzo6WaWbnhy+em0whvX5qf+H6ISJpMLS4U
 G8Lql5g6DHZEDTzYVgKDzgBs7ueF4wWPipUtA29B/zxDyQZQ/E5ICR6dUcGE3egixjBMk1OPAIf
 Kjzs4LF+jLBcHfJffwPMY/hazQ/zBYR2CSwZ69r2reknl5wjS44fpt3WXoPbZUpT/QI9xK3dlKJ
 EndoZuOi54lKro6e9B8VogQKkUu3tPrHMhT8ESUYRsJSFlS4iYeaEIWZvnZFIpqgaRbrvE+sC4k
 4VjkWIHi/jAv8hhLnjXeUq5Q4gP8CNMzEmoMDCObRg8t6tdqpaBlw+oAgBqR3llJ+PM3Vyik4wv
 eNh+DNDqNwfiS9dlE5A==
X-Proofpoint-GUID: fFto_dr4Wg42uQg2mREamwREXDyN9XJy
X-Proofpoint-ORIG-GUID: fFto_dr4Wg42uQg2mREamwREXDyN9XJy
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a96be52 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=tsJcdtOPNZE9NDYWY0sA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010106

On 26-09-01 13:14:08, Ulf Hansson wrote:
> When using PSCI OS-initiated mode along with the cpuidle-psci-domain driver
> it's of great benefit to attach the CPU devices to their CPU PM domains as
> soon as possible, as other non-CPU devices sharing the same PM domains
> depends on it to allow their devices to be probed.
> 
> Let's therefore move to a subsys_initcall, which should be soon enough
> after the cpuidle-psci-domain have initialized the PM domain topology.
> 
> Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
