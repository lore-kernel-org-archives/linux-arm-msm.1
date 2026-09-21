Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D979457E70
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 08:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789980988; cv=none; b=Hvua6mBGGE/3NU13iYd7CMNgPNqCcayjf5ckfb6ynx3fK1W9cQtzjC2c1xBePDkxO3sfTOqyL4yBO4vKSL7NAt8EcKqa68BKAnNkhvpDE4eRhe/PtV6wAEIAN0a1lzfT9tbTzyhxf96nh73u3YmcJ0ZjqNrGpW/HEkkWJfx7l1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789980988; c=relaxed/simple;
	bh=7XZtEpVGtm0f+NlP7kgan9JKIMeO+tGJEksciTcdIak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n23/3PT7pWTjEEXmeeBC5oM11gcrt1x3utGKkwPrBqEA/RaAnMnAMp5jLlwoC6Jrzu/23I/CkfsSXDTqGUyw7FFszojJPZbcJu/yNpeQfnvqZR3PXUJBHGH5YZSbhV6U5gKGbRDCYRgBNKKjDckuyn/GqHYSMiTlYOihDAdWOow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eug0UsD6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FhTom3N+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eug0UsD6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FhTom3N+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L79rdD1458379
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 08:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qIj4vi2FLq+WftfLVun+oqSNTJc6FU2XEuQk79/a7hM=; b=Eug0UsD6aF8mmSEI
	lGzCs/BJ5CwzaeqWXTm8P+m9Lf0/KN/MauSL4S3Ro6cMGSBKWtDTulzbHM9Kd5ez
	XI3bMCaUn67G0O/xUpSRRkkXcB7zf5LQt4Ls2HgO8nrEr03sWvJgPc557nfXaABd
	q17cKiMCWHCV9duhmpta4IIasRtasSkaHJz9s+faM2fj1Ueg/96/XghIWbNWOV9+
	rxZ8YrfBpJYeLuH7PYkWscYjIWUEPZYwjmpQNQgj1iPAakXp//WejaFPaZtv1KSK
	mYGYJJ2N5m/kPjZwOUqAxu/GJVnheNdUX9Ewt4YIovUyxWZc1lksFHGdI1c4QgmX
	xCkFPg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3v9hf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 08:56:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93821883e26so125801485a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 01:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789980985; x=1790585785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qIj4vi2FLq+WftfLVun+oqSNTJc6FU2XEuQk79/a7hM=;
        b=FhTom3N+Kaj5f5HFXTBK37X5W+OnAlSmlS4h3Ut1sNB66O6fRKPaDMdMmWogLVClhN
         d3J2/NDQmyYfDM7FRH6yxq69oPmE/Gd/Q8aiEP6pepkKw+zwSop3s27L+690n0P+gHyV
         y32VjYG91qGtK4p3NgujLu1rQP9yOUWc7Vk9o1U8zx9MLBm3ws+5N7oK2mZDQfMB3oxc
         8pDuhY9rxeqb0Sm4D4Oevs8SgwpAXzoq9vmpXX69acCEfoHcskgHW5+jP2xj2nkCzfu8
         aKEaTAltK+Ah1fplhI0ViOWITMnjEBIhPs6J9HA6uZLW7bBOToCLepXB/u1nZI3f+GzV
         4E+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789980985; x=1790585785;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qIj4vi2FLq+WftfLVun+oqSNTJc6FU2XEuQk79/a7hM=;
        b=MfCGDb0GiCg/szO2HETm0jsxygDqVBdeWq8Qjxlsw6Z7CLO7Nh0dUBw4Af4YNu0alo
         ERYK2ErkCEoP8S/KkNrULz4mMrkPIlZowjcRtvP+Iq3kHHp5t+PU88d1+UlwVX/J4HoT
         cZc41dJOdpXLjP5h86W8V6/4TJqFi3aCZGMNV02JFy7aMCdLnx2c7ct5njKSnqsu2xvw
         FPkEWgeeMQatmLHq4JHIVQ3kMmTz4aA4iRypVw2/1VFjHqemSZneSwkHpF3T7IE6jrle
         Jm9d/6ktBFaOJr7QkJ2mC4VY4iu7jbzH63d2ihLfl2tl7oyN5N757SMJCQ5JhfNrDWtn
         DCNA==
X-Forwarded-Encrypted: i=1; AKwUvBw9rrsqf4jv1dDkGTOBtKtgfmUnRXkczg+25jWi1+IxZIFzLAGRThrysGe0XOuygVZhKGJJr701NrXvIWUA@vger.kernel.org
X-Gm-Message-State: AFuF++mIEeNfdQK+PXXTdiiXlHJtxtpmZC6ia19dEztnJiwadti0rrSa
	0VAMfgYu50OMPE7bUEJNHRsYjukZ5pElbr1O3HwRvJckEmTcWSACDgqr/ao8UhNe8DrTZ6QOc7s
	gWerGe0YwdinUdhI6iIaoh676zFMm+wWITr8Ru1b+uL0tRy254Yhd72+SKg2tpCfITSfv
X-Gm-Gg: AYBFou0yXP2JfMhn71H2fOli16AFoblGMYP5ZEXXw6mFIsPjwEaB3cewk9/0QUyKC5n
	CmxJmXe3mDNiZ3sMnzyizTGW2MDI48F6julhkYSM5OZe5HGFq8yN4tGiWBxdsbMQtzlENoMVcNG
	+rt2xfVjPRJEJzQEwHJ/k23DVrzzxsMqyQ2QYsBU/IhwZT42D7H0EET2xIP3g9MVn43v1XwWOB+
	rrhl9EftwC7WjnDI2E6lrljMerDbuwHGyck///dS9N29xuCng/PY6VQJo5lqV63LHe9nVvKJCJf
	YQ6hAvSnStq4HCkm1F9vs94S+89WJVMyVOowSbAiEhzaJ33PtK5+MQTrt//7h0cq/IQB1/OjxJx
	kzAfskQxMcNAunF69XGLICA==
X-Received: by 2002:a05:6214:8611:b0:912:1b54:a4df with SMTP id 6a1803df08f44-912a8065a95mr109634586d6.5.1789980985333;
        Mon, 21 Sep 2026 01:56:25 -0700 (PDT)
X-Received: by 2002:a05:6214:8611:b0:912:1b54:a4df with SMTP id 6a1803df08f44-912a8065a95mr109634336d6.5.1789980984943;
        Mon, 21 Sep 2026 01:56:24 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67dbaf0esm3980740a12.15.2026.09.21.01.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 01:56:24 -0700 (PDT)
Message-ID: <daa5e0d2-a12d-4eb2-95f0-54099e7c8334@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 10:56:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] power: supply: qcom_battmgr: Report capacity on X1E80100
To: Liviu Nicoara <lnicoara@thinkoid.org>, Sebastian Reichel <sre@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260920193402.2402-1-lnicoara@thinkoid.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260920193402.2402-1-lnicoara@thinkoid.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ytia1IYX c=1 sm=1 tr=0 ts=6ab0f13a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KOsBq0R2AAAA:8 a=EUspDBNiAAAA:8 a=9jRi0BA2Tx-rpvEMm28A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=p7IlednmDx7li90OXeev:22
X-Proofpoint-ORIG-GUID: 3Swxc7NFgJcscY6z6n8cq7RaadKNA1r_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEyOCBTYWx0ZWRfX9hccH0SxKYCC
 dtg4BWZ+1x0J27i3CbHyiuCnqrG/KQU0YFewHqKATS/KgBVvz5fryGE4Gk+U95Kj+Fd8X5eS1rl
 WdmmYPVUimzSsYQmZ0qMnwUiOAY4VlA=
X-Proofpoint-GUID: 3Swxc7NFgJcscY6z6n8cq7RaadKNA1r_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEyOCBTYWx0ZWRfXyM0jgzCBc0sl
 XzeRD8QJ+n6QySg6qj7OqPDJ6WvZc/1IO7xF341LGj6QR3I9mIEztq7YZYTGErCDROvfc06beNK
 Bu31QrGO8yRvWy7McRk++wknoES+a8boymXsN6E4GtXmnttDEpY1zWh2nU3H+41Bf3f3y1YgIhU
 /m7bpdThPfy3VjM93Qc1jwktejkpSPLLq+HF+uwHkcWnAyp2LDQ4illKD7K6rp4y1yBnvSVVGTB
 0fxAMrvqVvPh3ohuf7BnZUSVvrS3kdw0qghiavm+wk9ubt7uIAjuYc6iwdY+sVp6c2RHuTyNCNS
 SGnKbw3DlrRwxBhTladyc3nG8kQggRFhsa5w3LU+hnvT6sC7tqmxGL3P/Q9lXU5yurNGOyljFST
 oEz8TA6lCQB66V+az0k3um3OwqMGGA6PvY06kGraApyADo5UgsCAws6pxEJi6tvP9aVeAzMIlsb
 MdRNOWGEddxwjmZoolg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210128

On 9/20/26 9:34 PM, Liviu Nicoara wrote:
> Commit 3f87baacea4d ("power: supply: qcom_battmgr: Report battery
> capacity") added POWER_SUPPLY_PROP_CAPACITY to the SC8280XP battery
> properties, computed from the firmware's charge and last-full values.
> When commit cc3e883a0625 ("power: supply: qcom_battmgr: Add charge
> control support") later gave X1E80100 a property table of its own, the
> table was copied without the capacity property, so X1E80100 machines
> expose energy_now and energy_full but no capacity.
> 
> The percentage is already computed for this variant in the shared
> SC8280XP callback; only the property list is missing it. Add it, in the
> same place it sits in the SC8280XP table.
> 
> Tested on a Dell XPS 13 9345: capacity reads 94 with energy_now
> 52640000 and energy_full 55540000.
> 
> Fixes: cc3e883a0625 ("power: supply: qcom_battmgr: Add charge control support")
> Signed-off-by: Liviu Nicoara <lnicoara@thinkoid.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
