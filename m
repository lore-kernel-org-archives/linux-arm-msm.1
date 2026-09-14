Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A1242BC39
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 10:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382680; cv=none; b=oWTJ2JLZdteYVdPakeiwj9+2maQuVZcQXdhzBApxMj5B+dKBIypNO3ctSmRUlkbJJB+cOjTAE7wTupIwTBG+FdFRkxil4dEz4tQLE5O17A0EqCXULFlnAg0wkYImQpUntVEsQQyOwALzDHtBJb7+SisLNvZZ0XA31BFcgRrfD9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382680; c=relaxed/simple;
	bh=EM5ubO1aixQb+FUZWi1Wp/YH8k8mBG61YahscZCrD1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H+LPvIYr2QdFzoh9EyR5zG8QEF0Xf32ORGRvNZ+u8yEAifcQnSXdqfLeZ64yu6fmbXa76Rl0AH3yXtMbi3CLlahF5nxiH1cykExGWyq4QmTVIyelvxmzLRM25vcj1zeO7H/WBWMICYJZ501Mj1Lx5K37jsUAz08jk9M8lH0omHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dqyy4xTY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KYNyx07i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dqyy4xTY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KYNyx07i"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9nQd0599715
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 10:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nmRbbTFhta754R5/nqUbl89Ko2/yhTJcGsYbJIvf918=; b=dqyy4xTYt7/StkEq
	cuyn+618/x7cTTo39noc2AaVAAmX/iD8ye0YpgRE6RbtvcmgdwkA7VBeUUwSYTK1
	F0DeCWPuvJY1Y5Stpl1coMdOcPByMlgi6EDshrbOeYoWgwQ8a9mq9BDyPFMRnUqE
	asrNgOCueDyroZy4rfoCSKMCaxYoAMGSrtowV/T5erTuBzIlAqfVzPQywG1NrSh2
	1qSiywfO8OYInpRR5knspl5/1+GVF6h0N1QIaEabTOn68QnJ/KISDjG4vaOMc4Nx
	B4efhev3rzXfs3/JhmgGhOnL4pXg0YF0F4PeFP4kBRHIb0G7LmBgnWEQaRSOhWBr
	TM517w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5rf5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 10:44:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93495488976so54947485a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 03:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789382673; x=1789987473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nmRbbTFhta754R5/nqUbl89Ko2/yhTJcGsYbJIvf918=;
        b=KYNyx07ipdhVhqHEWiqR8CLQgdPKLwv+oEuDwk6nYbWh0BsTm5DqpHi4YH21rZCzSf
         c2MEBLH0C/quS/Qml+/uT9iZmj0EPZmPkl7kgDfPpzg26ilh5oXaISDLTGEit9h+6O0t
         EqWUYbeDZveKDacMDLccGlSRVHB7o4jfZW5M0JGqBbn0qpGagTl1Un8F5tCy2LUSnyvA
         l34Tm0GbEJUrheERO5zt+CiiJDxSuluPMb6oC018NwuNjrgLsVJjV5UnrfxeBL1F76Dh
         6tGV6gLdN8V4zm2i+ECTch4Zy8T+TBZpd1Dh5iSk00320IF0Sn/Rc6Y7Fj7z69m2K1sM
         zF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382673; x=1789987473;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nmRbbTFhta754R5/nqUbl89Ko2/yhTJcGsYbJIvf918=;
        b=nJaBYqg1l2DjrYwCa0JGCHXbfvVzKAyfTXdNzdmMEAZ00o73Ukl9XX/b7rNrEtS0pW
         a3yAOiMkbpN9221CdRfAmFk3X8qpGU+B7DMTYlhSqWNU6XMDmYStcejgnR4S+CC0xu2w
         t3/ud7uJXOr+BxVC2CuIHnd8jwRZ3Dm3dj5AAnlhXYNM4jgLColt5EIv3FNUvuuxHeqC
         ZUuAsC9MtJ28xQoZkhZPlFnTC8ZVeLnDJYmVn5LlIoXC4dbvdI+9HkMlshIUHU18MGcA
         hzKDF84VOu9Y5oBUndsQcP9nUX8QyE7W47eW6x4zoUtiWLx2VSQm6koaS7JciOE2BQ5T
         BPJg==
X-Forwarded-Encrypted: i=1; AKwUvBxyO56hevkMdPg2RKZ4AdBd3vY08Inh06B6zFpzgh/YjlXAi8QY5QtwgW7slP3JXdV2zH03UpfbOO3XlYZM@vger.kernel.org
X-Gm-Message-State: AFuF++kx/RzNOHMTLQYQ7lUEhzftNGKL4PMw0rcP1I3IOIoUSaZpfvig
	F0nDxBnGxxzy1XOEmSMgBJ0tJ3UIDUDKiS8sQhHZeM/nRaekd6oFeXQFpfvOw6CKZ6c3t1x3JSY
	9TGzCr2+jcVnFTv8f8YD4hFMQGBVXqtrMYWr5wIlZ4Gt9+vbIxyVaISZuBC+mH0njsuHR
X-Gm-Gg: AYBFou3nm426otsgsmoDug4iLTXKc6RbpM9mMb0FcnQsWF6S79FuL2l06A+oPwp5JBv
	tH3NNCKjsjYrRDxHjeN7fSgF4SEYnm+kL9T4mxTFR9dWpCVyZ0IyCD7a0MmVcyjoVMRnzIUCCgy
	Pb3r+AtuZNxwG1Bpst8vE7HYJqN64Oy1a9tGqJCNnJW2DsKDoOOi1GxYcaA4LiElnbS1mZ7m5zY
	D2f1+bNcGiZYl06i9pcrbLGke0OPBm3AhvIcLTASqFEse8WJ1J0c9Ez4/jFy65vlGkNuv7uoVjO
	SklB51RBTNDz1plbFjdSCcPGhml+d6zyID7/iP+PCIYCu/3CVyUtY4R+3BauDDBnS3ADtZ1XXxv
	Hjz2fs7u/D7M1o2hdHssZ6A==
X-Received: by 2002:a05:620a:3704:b0:939:9ef4:79eb with SMTP id af79cd13be357-93a29d48104mr211107285a.6.1789382673258;
        Mon, 14 Sep 2026 03:44:33 -0700 (PDT)
X-Received: by 2002:a05:620a:3704:b0:939:9ef4:79eb with SMTP id af79cd13be357-93a29d48104mr211102985a.6.1789382672631;
        Mon, 14 Sep 2026 03:44:32 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9ba8f3ab9sm3782485a12.15.2026.09.14.03.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 03:44:31 -0700 (PDT)
Message-ID: <0503b151-dc60-479d-8e31-4c2d75f4d639@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:44:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: dts: qcom: nord-rrd: Enable PCIe controllers
 and PHY
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
 <20260914071944.164217-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914071944.164217-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfX4QpHS+kIW+ds
 ubxnWqJJejD5HiI6lNwDBeXPQ6br6guk7j2LiyZCdqM+Dr73QiqfvzkhKItuyipYPm1kMgKzh9l
 gkCbwSW/rDfqzT+/Oh0G7W5BABUVdlo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfX5SEonSR0mrJj
 h+TMBHVHr/jF2+JiloZCeblG5I2FMoGZhGcpZmiM7Ccgqok382vnlZLYdQ0GZEJioR3Jbs+HiXg
 VUB9pZ4RNOyGRy59ZMQXS95sKP7yhUwo6qPQM5shext/owmWp/NMjc5g7n6BVKo6B6smzpk/Xy+
 A7saOcMJjdJEl0UAHV5HQlaFCMjg/Xyax+b6WR3m2WuUABJinbgBIiwgihoT05+0CVjDuUN4DDz
 lIsdsRdfX/Orwg3tdSTsh/O8iVPLZtRr8+Zi3FTNC1RcsJYP/fJPJgJp4HNDhsHGyMmPlTmTmBI
 F+MAYCs4bLyOlPvedmE7gFM2iCv7rWWgEs5rgl40LBMuwaerxf+FU6aLZXVWCu7Ab3ZwBX00gn0
 QESI+LvmIOXS+VBzvNF079+Ctq/ApvjAT1Gqyk+wbOD5ZTSaNwGnQwMniyEVI5c0W+npNQMB2Nb
 11MbjGqpsNo393hNCFw==
X-Proofpoint-GUID: BhWOXJZ371Q3CkcFHYoKmC4aQYAO-yth
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7d011 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=MrLAvLjqEOgBX2ddU8YA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: BhWOXJZ371Q3CkcFHYoKmC4aQYAO-yth
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140154

On 9/14/26 9:19 AM, Shawn Guo wrote:
> From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> 
> The Nord Robotics Reference Design board routes all four PCIe links, so
> enable pcie0-pcie3 and the QMP PHY, supply the per-port PHY and PLL
> rails, and describe the PERST# and WAKE# lines of each root port.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
