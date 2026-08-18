Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDA6471CF4
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 12:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787056760; cv=none; b=lI0kXJFKoMXwoVRvPg4xSmUPN5PRbKFNj0Z5t7XPT+ISxQRuRWsj+70RRNsgeyMCssA2u/OVEwJlWMKjPY24ynEzohsgT6WwJvvGzsVIIBJiQy6Yr+99q16m1UpFrntF6wBNJOHAYvpR0Qe0PlX3cfJm66otNYs8JGPFk3TZEW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787056760; c=relaxed/simple;
	bh=YWSxs0QhOciQmaLVZF+gvmiXEVMso+zn92JvOv5pGPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lUO+dNjz/AJiVZQn4GPkQ5VPcrKPEabYwJuKhr0EUUcvprwyv8/S7eJv407rDwmtdPNMb6ngYqyKK3XqUhvGtLFpgdgSWhvIsBsmxi4JJiMyzbOycDN5ACP7lYgfi/E/FH4ug2gB9NjsrUheo0uKLyfj5sm188r9Z/97NbziBGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TM8J0xCm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EZLyoFlL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TM8J0xCm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EZLyoFlL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABXLS581257
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 12:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9sT+fDlFKf91nl/V9cobhIbz6pURUSVOTqoQvdEFabo=; b=TM8J0xCmEZewL4S/
	dbMxsHXBib6HAbyTZYLYPSDrx98anNKB/jwnSq93FKHHtlEArfohkCMk9DwbTodI
	BqmbJPZuGmAcR0xw6sJSe54hZZDWpw9qS8CFhcteeqgU3YNuRH6svWAMPmBrepPW
	Qdz9yumvQ8pokDpLIlf6Wr1v/e5jbQkHHe7QhuBGkNgOMOzWGLlfuC8/Tj7qm63U
	QQ2E23BbF53ab0rT4lZHVxrmy9ZGdOr8KBeGaW4v+LCcC5psbnTdZPwyai3yThAN
	3QVLrArxnwkbQfhgRdvCTYgOl2vNxL73a4zhE8qdlaXppS6yzJNgRFf7/UOUL/PE
	jUZgPA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fbaa6bs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 12:39:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51e9d892f0dso13094111cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 05:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787056753; x=1787661553; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9sT+fDlFKf91nl/V9cobhIbz6pURUSVOTqoQvdEFabo=;
        b=EZLyoFlLa2KWV0GjaNRl3/3ivdsDBrbbApSUd/PXaJQhS3opRs94QEoogcrGsKiIvB
         sjVyyuQjZO4LDhK+UhrOMSFBkqLkNN8xunF06lg6dbZxSUJjMOhu2Mry1KSGQ/Qmf+tl
         tgjZ/u/w8E2QufPq4H4eyo3QqQkn7ihk0vH0WBEkVOjXCn3HSX7axDUv31CDnl48vX+v
         4bGUZUijTVvwKf24ulb0ClOdC9ynPda94meQ7xSisJp6oz6Qo19jDxmRzO1qokqaOULg
         joueCzl1gfZRUCcNO1HN56hm0MxajKJTe/z1gbt+p1cdhOLPeoWXjBgeEDXnygco5Inp
         6hog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787056753; x=1787661553;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9sT+fDlFKf91nl/V9cobhIbz6pURUSVOTqoQvdEFabo=;
        b=AGLSo6MpYPjexklpISGK/88YUDoTrOnW/8hLNIx9wGILrSwqEo3valuoRis/ejHYaH
         mWIf+W9WAJpVhaW2yijzoREhMHV+OM311t9pmGnzRPWYCruIttjtw7gLbmSqwKL8m3FZ
         z5tO1FXt9jXfKZ4chSMadO8aC00poM5eg4il6e0MmQjQ4wrRGIK5C4amI31QpD/sq1bK
         hViWPpZH/EZJKjfxK2hoq9PSjUa2wLj+yQbLe518vovmnegNYW3Jb4fhEyDjaf1GqYGy
         Jfi7Ng+dB5W37ynByGobnTBIlm7Afv/ymvi7vPgfttbgZuxsFLEn7pOJxTdZeyzYv4T/
         j8Vg==
X-Gm-Message-State: AOJu0YzMJYpQw7pvdpzV89dsP4mFXq3ItOVz13UJgFJ68GxXlNjdBOPe
	HqPYi7OyHPdVPVPb+0sOmcxH/1s9IFTfgCYtuQ/FV+Kz/ssz9PZs5o7+OLgCPsLzhKcWOa9vBu1
	Scri1HjkCvHICv/UgBBbGgCti4LPdGHQFNOwMpty6IOBK3WWqr2NTrmVsCxDEuHpHrm+h
X-Gm-Gg: AR+sD10pHuvUe0K0ew/fyVyKDfJlaF1TW4/73FFHzuq6aFFAbs+0yom3vszBqBLCcQY
	T06KHCcbQtbj4eX+KUjGdASYXtTN8ZMbT7vhfHcbsQgwGLW7ATAP3TttZyY1mpGaB8/Xs38gAdd
	1tWNzBHHhlLD5RVIdEAs2wuI67FoFosOC4rVnAD/rXXfsku7QVCytV6zsPWvDV0JOg56uA17do7
	Fv4JbnEyit5VaOm7tmxRY7h9e/OkFCFqjhtuPwrURp3sqBl12VyeZ9n/3R3SYU6T3fWpwxjGfE+
	C5A21iM7mMEk+785+edsBogQJphZtvOk1vb/KRCEMa5cE0+AXWwVgfts0H9itUpAVh+0wYGuX5n
	P4vt8D8f74BYpGVX0Zp18vAR1
X-Received: by 2002:a05:622a:1787:b0:51a:8079:795e with SMTP id d75a77b69052e-52d854d318amr235315841cf.4.1787056752721;
        Tue, 18 Aug 2026 05:39:12 -0700 (PDT)
X-Received: by 2002:a05:622a:1787:b0:51a:8079:795e with SMTP id d75a77b69052e-52d854d318amr235314971cf.4.1787056751991;
        Tue, 18 Aug 2026 05:39:11 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d8517775sm1713144a12.2.2026.08.18.05.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 05:39:10 -0700 (PDT)
Message-ID: <4b0287b4-6fa7-4fe8-a880-446ecdf01b1d@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 14:39:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm7325-nothing-spacewar: Add ultra
 wide camera support
To: Danila Tikhonov <danila@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eugene Lepshy
 <fekz115@gmail.com>, Vasiliy Doylov <neko@altlinux.org>,
        Achill Gilgenast <achill@achill.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20260801143125.267054-1-danila@mainlining.org>
 <20260801143125.267054-3-danila@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260801143125.267054-3-danila@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA5MyBTYWx0ZWRfX1J/yvSTJTi/a
 jYn2f+rcTHw3W743+zXjayjcJ5jhlJK2Hc7pqk5zhr3UKxrKUNkTqL46Ccd1Db2fZC4EG8FkIUX
 xnqevVzBem6Dsx8fXfqF/lN7xIbHCww=
X-Authority-Analysis: v=2.4 cv=VsITxe2n c=1 sm=1 tr=0 ts=6a845271 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=OuZLqq7tAAAA:8 a=2Ii_74CIHdEfXmswDR0A:9 a=QEXdDO2ut3YA:10 a=4cnV9WtFwDsA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: mJAFYP7qa9iRjVLZsIjQywmlpZ6kaB86
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA5MyBTYWx0ZWRfXwTYzikPMSRTl
 HmdkTfuWg7AqbgiMWoK3ljGuxT1pSVK21hRuveSy0QFddk0x7Z/4lbvqaQ8EhgtwHaIfpgcflMj
 azGI2Ltow8rzzojgE5al+lcsfL8OPTt/ADuL6X+fUCvbcKNRjMSQQIMbzdZFZ1dMQpJ6XWCKPOA
 xIAS8i48yGBjOQyjtR9UgjDseeiice30uwzfMZ4WKJN5qN/8efujXdKe0f/yF41Kvma/G0NiZPp
 +NeXbXqQMj8M0+G/ynZb7lQYI1u0H1KUvRji0es9ZpUMhK9aYmIioKXvA8IjDKXmmkB00toUAIE
 BoEC8dbUKcJCjdbDu8U4MkzvgFc0Rg9OlC4XdoTShrABou84y1nySsOLI6zmuyyjh009luRDXpe
 +FlUa6d0XufMU8cnJs3n+Ow2RBP+VvGcmmDhWGODbQqnXcMeIiKzaCUaw5gaGMJFjs9yGxLuILZ
 LJo1ltIkAI8wgX/da4A==
X-Proofpoint-GUID: mJAFYP7qa9iRjVLZsIjQywmlpZ6kaB86
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180093

On 8/1/26 4:31 PM, Danila Tikhonov wrote:
> Add and configure the necessary nodes to enable the ultra wide camera
> (Samsung S5KJN1), connected to CSIPHY 2.
> 
> Signed-off-by: Danila Tikhonov <danila@mainlining.org>
> ---

Same comments as on the other patchset

Konrad
