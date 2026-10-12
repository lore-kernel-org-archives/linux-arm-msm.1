Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C1149D5B8
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818928; cv=none; b=nhMZlCEVjssYvylMnJheUlio8TOKSs4DYfYNlSjhVwMUzgzGioMS31kkFyXWzsAImIMXFF96xLGkFBkYQUeyvlf3ySH/B5+zzFLb+4gFZoT+/5M6psoLJIif5JlQxntsI1Ljz/2W3VoejgR9Xy0wwIG53LRu0D6nE55ln7V2+bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818928; c=relaxed/simple;
	bh=xRoJhJ1AvQpHt61hi2ZYmyap1RubXShFWJ+UOKcfqj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VX3dP7ujWaZuqpfqFcC3P8CgMreZU1eRX2snpH0Buu0kZrfTCtJh8JlBhk1TDvhVoSV0Z7rnBLMC2pJ5hZN5z7ZqPKVjjaXdtjyLJPXKl6VWnt7RunIRnVHop2UooWMY3G4RnjIJlepOvyiHQHszkK9N0G/eKByBDOKKJWQ30CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mkmsDk3t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GAFSokU3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mkmsDk3t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GAFSokU3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CBxrlN3363642
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n5VagN2mi3Fe/oMevwo3rCpI6oJ8tUsL3jWLuRR0zfs=; b=mkmsDk3t7JXGj9NW
	GiiirFEh6sLpZ5gc3S+7IJ8NPIXF7YyQLdsRlp/yFZbXjrKkujjcGq3+2/kyjBVl
	yEDSjYUtfOi1k0bxlssUJ5w3tclmYpDgG8WosdL6Xul+tvBrBDjqpe/0CTnJ1Qra
	goGtzMyQ/BG/SGXhtczwg6cdCGmTxrL1qZOPw9lzVXLXEZElbfq9sZdohMKSA54w
	b6Bj6WRDOZO7L5Q426uwxD+EvPtFMjwlB89tBBAc6re7Qy4jHRjiIl1WnegB10LX
	WVjlWiaRFCLXbPsUgEBPl+n/Fb77p9g/9cPLQ/Rxd7MIfbgDeS3KGQfbCpHE0XsF
	+vpSOw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wdr9ebq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:28:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea8a9cfe6so20645485a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818925; x=1792423725; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n5VagN2mi3Fe/oMevwo3rCpI6oJ8tUsL3jWLuRR0zfs=;
        b=GAFSokU3ptguN7d3ejsXqWFWVMvNPsQ94rU/VEwBy15LnT+ILm9KjJM7+1dC8qxRpU
         TNsm+hqmUgx6lLI1iit7XiEpJ0bn/yuoExRQ9zoOeMYcnVqIi6Ki7DfN2YtBwdIutzoQ
         AE9nlLW9glet+m38cJlwbT0xRyTRsvlDd0fWvq5wcbo508OO0IaybgeWbEg+m0DoW6A/
         XZFM9x5mZsnRo4nGleZbKFx8RRUV8q7Ld4tt3mvNwvs/M/Am9zsg4LZ86MTjqjhM9TxC
         6AhYYQPoIat0vvtOcA/tvqhwn0dMOOYsGbH7zr0Vi/Rrn5vKx+657KkBFuFRP26G3Ip/
         jPVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818925; x=1792423725;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n5VagN2mi3Fe/oMevwo3rCpI6oJ8tUsL3jWLuRR0zfs=;
        b=qDUGEHRDShSogYXPROY6Xf90iv/5kwJBDr8tHP8ex2TzAcaBMdOYhWaMRTLotgBQgP
         Z7apGdv4BvUhud6XSG2PTzQQJlzdhPmK7TPUdbCVW3AgGUBbORt8ceDhhxjAVvarfucy
         Sk5oK9UavHGhSYYlooM+uqyxi2rpRhLb7TV2gpAyY+OIgbH0qkpTxiDWImNcphkveH3B
         dDD3+ZALLjfUzyrfTv3xbI4ZAD9Ka8cRljnSoC+D1172DKGQwjZ9GC8Ngvqid/W4EAVV
         LNT40mjEuQ+FvGoOBxA/zQoVK7mve2VdJ5BALtnafQdxkfVh/CQ4r5H0XiKopTXrB3tj
         h6cA==
X-Forwarded-Encrypted: i=1; AKwUvBzOKQgG33zNJOzIJgLRFd59B21nT//CaPW4hQotDjEA6RZR8yyyX3Dw1QvEJtGb1f6Nxut8vTaySvS8mXor@vger.kernel.org
X-Gm-Message-State: AFq9FYJH7TvUV2FP9BIORK3sVKIbadUjV0xjMe/tKrzwTEPQtLBewk1s
	hi9MCNqtFrh3C7AmeKyogwuCOOQAEfhtKg2q57bxflvGhLC990VFWcGFguQDBE9qT3bVCC9Zf+8
	rwLHi7xcRIp84AWweDUcqqK6/7K9mdm/jWN/+QXl65rRb0UJ9mGpg+Ua2OtP5TZhqQSBzzkgvai
	/8
X-Gm-Gg: AYBFou3vi+4yoPyBBRGUi0jYNQbHp56tpT7NDa5sCx7HArMxACesB5LyidBeaI/m2JT
	bPtm4Ra4EL1dADI9Q2sPadVB5OTdczIkUF55+4AdzToVjfApTIXqOPERwT/CDPc9zmzmyCd4at9
	fXRpdLTDOAaM612I4cnpQApAcPwpBBFmAN8V7aA6Qzuc244IqgdtH7OvynVyYxaPJ4JMsYEPZ7h
	h4cmLhVLDfvzYZgEA5UArefCJmpZ8oxNBSUZJ9oQ7xMiDP5bupqAQWVjLIBxJGTN5aQ0hhTsHwt
	bxATuVGlTbPfussPUc7aYRmRK+stg4DXhZz1aXuIQlcKX+PBlrPp3n2Y4+s9o3lKL37hM7pJ40k
	mo1ihmQdJsoeeWTDFh+M4Kw==
X-Received: by 2002:a05:620a:2718:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93ebd6e4c09mr1934178885a.6.1791818925159;
        Mon, 12 Oct 2026 08:28:45 -0700 (PDT)
X-Received: by 2002:a05:620a:2718:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93ebd6e4c09mr1934173285a.6.1791818924627;
        Mon, 12 Oct 2026 08:28:44 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac702fsm475916266b.65.2026.10.12.08.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:28:43 -0700 (PDT)
Message-ID: <fb6f9a49-e9da-4650-9b28-06932034aabd@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:28:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/38] arm: dts: qcom: msm8226: Add space between
 OR-operator
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <9be1ad0392168b91389ce8d6a896d8be6173aea0.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9be1ad0392168b91389ce8d6a896d8be6173aea0.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX7RdAV9uDa+or
 YkmvoL1BOmxtCWjGP2wdRh0EiwDKi552g/MWadtj2/Hh/8ZQjGXAQVo0uOrQUW6pBLvlCgQ3IU5
 ABudp/RwfFFyHhIaaI8AFa0o2s2x8e7AA55l8ocTIvvaReXc9U0sBgj/TwW+xHf8N1S9SFFJOnU
 yLS+14JHhKZ9ONIrpVw5haUOV+ObauOcStwWKlLN50nWWwRWspE7J71MCUzQ12DJhsvewCR50Qa
 uAfAgWdU1OlM6pEMBwiP6AYEEKi71bz+20MW/0x28pgeA2fsWLHXk35SqfwFAeaUKyzFSarpsOx
 zODA7c/bQ/D2QPOzlo1/SJ1Mc6/9CoW10MElzpumtjguxDm+aPAgLAfZYpC0DFx/F5QdpB72GsZ
 b6ndQWS2YsUyithlgnHU3JdvSpD86lFhjcRNvu7TP2KcmsbYgRE58/zHEZJNfsnLcm9zz/sISw6
 H6XVR/QfBwe6ruYbuvg==
X-Authority-Analysis: v=2.4 cv=SvAFe/O0 c=1 sm=1 tr=0 ts=6accfcae cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=Ae01CA2AY_RmMo-c5YcA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX0ZaQPiYO1cYc
 tTcVMQRs3fY0cfMJ7UDyHhiLaYzz20yQz81Lu4ga+pDedicZlq/Bs4GXqtR22ZF6kE4Kybg5Wjd
 0TYY8KcEYSMenN0jrluLdVRrlYCrQwY=
X-Proofpoint-ORIG-GUID: UQ2aBuxcdbk-j8v6dzr4R2Vs6n2twzbD
X-Proofpoint-GUID: UQ2aBuxcdbk-j8v6dzr4R2Vs6n2twzbD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There should be a space between binary operators. Found/fixed with
> dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
