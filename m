Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2398244A3F0
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387178; cv=none; b=se0fiBHQ9oxHdHf0R7vvkI6HwnXw5rM9dkZ8semLAoxwHivkOevzkKWhuelZHD0m9pyzsUWexp4x1GnouHRvEliZZuGztUT6QI8T/5O55AO9rcLUPZiv//HLZgMoaPjD0Osoir2pK91Wyj1lGY4n5TkJevAy0+ECgjZdIvb3/vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387178; c=relaxed/simple;
	bh=voYq/7WpilR3FczPUR6KD8QW5pL6j6cFboxPZXecj18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N2QkSF5o+6Gm7Do5qzOtAApOobrAaF/vM3RBg5yXPCn+7tXWwPrSpFagjuTvda6DHb7UvD8GEs4S5aPP2r7pZ4cjhgBT8RUMcjLH1it0lKm/+/aqqphqjGuIrTP8LBiGbm0AYepWXHRFvCulz2VtX7r8SMW2roAqftFdGcqDg2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H00Q2wNQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kxbWdBxs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H00Q2wNQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kxbWdBxs"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EBRFCl406579
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:59:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+1Zd4uPLrJ+Xu+XVywJmW7smaAlDGHp+icf8MnTk3zk=; b=H00Q2wNQ8auLtK3Q
	J0sUm8LnC/4dd9SxlWq3yPZdDsVhJlAQQ15Mtct/5d1hfKXtEb/V+LD2uiDhVDW8
	cryLlt+d+WxbD8FvlN7ovH8GPRQ6tuZq0PinGkM2P/l+q0kAqNYvvq5nCOcLj4UU
	C0N/5jPGSNnSjyDX8cVfwdj3qvN2kXzDDcXp/jUREi4c7FTanHE7PuX/80qNX4vc
	2UU0UK2mItOgArLOQmz/VNpkUcaUZMp3oGMZukbA8tfWWC0NQxGCHksY+wymTwZ0
	3rZHRnG1v4DGzW7puBsQBiyQ1FL5XuEHFPwT7pCmbKjQFDX8nEGk6swys+3c00H5
	z6uqNg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kr30u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:59:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939fc317691so53637685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 04:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789387166; x=1789991966; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+1Zd4uPLrJ+Xu+XVywJmW7smaAlDGHp+icf8MnTk3zk=;
        b=kxbWdBxsK66EcWQVYXph+JwAsLjpyEOl54Ddhbo8WYdY36S0L/HADBAMT8aYR9GQ6T
         1DzhJ798KtZaq32HPcLJqV2HaydO8UiBUvRt31f0Na9RysAOdKw6UGEpTE8diiL+Nn6Y
         I7h7ZYp+3AhY/Tn1pdOZDgJMtiWVHF/5x3pNXClGVmNTBcQzQmhXk7C3Qzd5hQ1Q8OZH
         tX59f75NpKGXBryg7RSSZAlACik6xLFOGcl/hpDJ72KPGNMqaIzbLFKUNc+v6bKKVXXb
         9l8s/TJVo0EXc0BItvxKzLZgKbGuu6yabPYvj8uaQq8xtrgzh9H/P4l9wcOq/ARJBIkh
         a/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789387166; x=1789991966;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+1Zd4uPLrJ+Xu+XVywJmW7smaAlDGHp+icf8MnTk3zk=;
        b=QQ3FL6/zKRnvHJ3Ug15S8yGLSDsc019f7+Ny5eBs4YdhaIdlqv5ssMQEfEmhX43Qul
         5s/V6Uufhe1vBx1vlLw01P+hXddpCpHEUxtVO1Y8q9pi+6/1eBBNtfugejG1vZE9vC2m
         2lGq3QtC/pMvNN3utf5YMBoknNy9jdwVzq9R71a2JoANAnKPZgqcSgbtBCh8KRkVt7Pf
         qEhKwiuoK3PZeFvjjXBSB8E7IY9b8slnPN8yp29oIbE2wHOK/fmsSQFIFDAvqZhg3oVt
         n9bBSxceLuqAs1WPFPfBqSAFjkrSWsIjIxcgRrYI5tvIixFik+9nmPlIlvGS6/FHQ5x3
         Jzug==
X-Forwarded-Encrypted: i=1; AKwUvBy2ENxEdTUS4n58FzN8Mz6sUIqG09dIyg6DZaKdsXiTyWRElqYRm1qyQZzZpYLn35J8+7RHTFo6QMJUbLzd@vger.kernel.org
X-Gm-Message-State: AFuF++njU28o7Naq8iQuquGH2ynqI3tBAnJ7f5QLvak8qx/gcZKK7Bo1
	Wrzmn4Uja+8DcfjrbUgRFl+RJcfS4U08mag7L8Fn4gTLaRlYLs7YjRBm1NtOp5K3mJcRWY2xEmL
	DQ20CLRB+ywjlY3f49ROBFsIb9OdD4uhZs+vFCNXELqKBbRnUc5L+blYLPt+E2S0ARCjB
X-Gm-Gg: AYBFou3uCvz5Ew/SZj6wuJoFHv2ii15oyTLVrWNoGQrTFJQHPwSh/rd5lqurF/222p3
	o+7wR6YkcEYcrZk3YIG6NdaBgXqqzxrh3GGQzjyAIlUzYEuZf5l/CMnREedZcACFZPiypNy1I8Q
	niH4OE5HUjG1g3XkLQQrobWNWPS6Nvm/iZR0uUYfW7bmG7M3t90q9Y7W65aZwF1CHGJtauOomiN
	4Azrx+oCtVa1/faSnUm3H0Unal/XTACOo4Ecj0IogzDkFBlKD8xtbPcYA3mK0LStFpg9yxuW8zv
	FLxVUP4JwfZnfcpa1ryRYLRPf4tsRGpFe7QQt3eGMklm461wRVBnEPoJrsmYP8ujBS+NoqMyeu4
	DHClWjxFHz7099xpNeW01Ag==
X-Received: by 2002:a05:620a:2b9c:b0:931:23a:83ca with SMTP id af79cd13be357-93a29a3892fmr239016285a.4.1789387165904;
        Mon, 14 Sep 2026 04:59:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9c:b0:931:23a:83ca with SMTP id af79cd13be357-93a29a3892fmr239013385a.4.1789387165442;
        Mon, 14 Sep 2026 04:59:25 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b58f8beesm3960445a12.8.2026.09.14.04.59.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:59:24 -0700 (PDT)
Message-ID: <ac9ed925-21a6-4611-b1f6-bd018dea3c0b@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:59:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] clk: qcom: ipq8074: set BRANCH_HALT_VOTED flag for
 usb master clocks
To: Chukun Pan <amadeus@jmu.edu.cn>, Bjorn Andersson <andersson@kernel.org>
Cc: Jerome Brunet <jbrunet+clk@baylibre.com>,
        Brian Masney <bmasney+clk@redhat.com>, Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20260910100000.2627799-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910100000.2627799-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bkFMyoILH-ZsX2dl3Rw6LI0Xl8BnpVgO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3MSBTYWx0ZWRfX3/jMTyyR79pe
 p+GwzxW8l8e9RiJxaJA1EZKkw2pTC8/03re0n2WlPFv0mH5RWkGy16wR0O8oVYj4aaXV2HQ2xGV
 NKb1IRwTd7nE3H2OydCiy8MqPb/A60Jo5UvYXedS2iRH8fpYP5djDdVvd1a78p0ck9qznQPCHFN
 fAlJpGSuGNWVXzIzbeweU3zpgXh+F/l89epUmkXykMPqaKsceENXfHckgpCdTuHACCMtA+RETr9
 1nie//YuYFWXBz+soP/1k0fdTdxm/R6t77j78DUHTT3z2+D84CfpshlnNC7pNG4KE3I9ActYEqZ
 TRuoU91w+tkmVRzeX3s+hcbtIaV2xVYO31Ds2WsQ7AkYbw4cjwy6mjcotSTaXug9QxibkyuqxKo
 r9/pOKYiJWmKmOCkyjYNLjTWsuZ+4HpT2wCnojh8/Xc2smBof3fL5iFWXPbVebFhG3oozq2pC+H
 zcnsqCJ32MQLvT75Xbw==
X-Proofpoint-GUID: bkFMyoILH-ZsX2dl3Rw6LI0Xl8BnpVgO
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa7e19e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=rrY2T4ysBfleW38DPu0A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3MSBTYWx0ZWRfX2r3LXOksyQAd
 bvVO4cS2AnlEj4oPEeh4NYCw/1JgJ6z3mWUmiNtpjYqUtSGZHv850mHbbK1KPxI2bedtrYuNRHh
 w++zOY4qYbQQ0OT6kyWG+i2MGcRXWl4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140171

On 9/10/26 12:00 PM, Chukun Pan wrote:
> Currently, on some boards with older versions of U-Boot, attempting
> to disable usb master clocks results in a "stuck at on" warning:
> 
> [    3.005088] gcc_usb1_master_clk status stuck at 'on'
> [    3.187119] gcc_usb0_master_clk status stuck at 'on'

This starts off nicely, zooming in on the reproduction steps, but it's
missing the key point - the "why?". What causes that to happen, and why
the older u-boot specifically is the problem

Konrad
