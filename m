Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9913E8342
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371521; cv=none; b=H4KOR98IAPB8h4LJ9CkoAwundRMzLFDs7PcuKf5/tzvN5ELKqEjJvWARTL+srKz6PgvsoxEoa1qAQX5N7X7UjjRPbDLFH4bjetH6pAefMGDP4POXmnjp3gOEehi0BqA3VWUnZgv1SOTyVqZPMUITmP25LkS/94xwFPtDpGaRLhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371521; c=relaxed/simple;
	bh=9lhWc9Q0YUdhC/rcymm8R0voA5GEGve0e7eHh6Z1qqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T+9u0TafYyrpSFxMvOv5bYcvkQfufD8qNhk7CroNMgIYzJESKGWPsSyYDkzDWYsQHf5yKqUEm/fR0ByzAgElljFep1jg0ugxqxKezmo0mhh+yOmxOa/tBKzZ+mGTM9zEoP8kVfpHB1uvuKUjB2Y/an9Th1H4gjBJnAXVh4Vjt+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eVALo1y3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BfavzusE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eVALo1y3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BfavzusE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ikhp3369126
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:38:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0tTsNx29CoG6/4vw/G06mPMr
	5YxJX+XX7lhbZ+hijuw=; b=eVALo1y3fejK7+uPWF2QkjP1WZhAe73qN0dyxw7m
	CCGaKZtRZXayaF6abO6B1pOSMvgpMmeUnwJR4Mpz7Cyqn0pXcnED0fKzBBmpvDOC
	0Jcs4dDMVyZh1PtToH5C2ZNuO2KI0gEDbqB1smE2/OVrdqX+gNGuIF8q6jYIl11u
	agO0xk2K7Yky+hVxd9eNUhjNGatF89qOIS7HOC0sYH/HjIEN6cQwjZEMdITOnEvq
	xX7i9Lcx6J3x1ExtqzfRriAI5oCrLJDif/HHaGnFoEVlArRTMH2iq0fn3aVXm4Ny
	qkPi9F4GhTvmd6We/ack3mYQXH/+PluKaTLgqt6BXH81sg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd5jsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:38:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934956beec8so555547485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371518; x=1789976318; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0tTsNx29CoG6/4vw/G06mPMr5YxJX+XX7lhbZ+hijuw=;
        b=BfavzusEL72duVok3pZPPptkfaew/efItXU0BcZuh1RPJEutHuaPwct1FJWmnsETnm
         CvIsD8ZbafP8OXIKXsZnNBZfILNe5MDsCpCHoeav9TmvxowKLMcbB7v3LoOA7Be9YZ4l
         AXzg2emOGxqmPykTAELtp8Al2YqUYgHSNSTAkrdnpJfvnzdUuxt4bSdeVtC3gYO4audP
         K6rPlXGmlucqfThaJAT1iPzsOt8NC9HYWyyuPl1W1gQypzRPgONry78ec2TCCb3+OPCD
         fuzxKuTme4gB+8igfrS2AHDXfVj2tQGYOkEtEcSW0MUeqvi6D8dUlWEfo6unqul1Vge7
         Fvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371518; x=1789976318;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0tTsNx29CoG6/4vw/G06mPMr5YxJX+XX7lhbZ+hijuw=;
        b=BYCGaNF5rIMzLCnCPeGfggfbc3IVJWSxld+NXZTHayZ6YhQqiatAyGUNO0PVa+aL9p
         ndu/zqcniQ82K0DL0lf+meILEVml9KhPu3CIro9REizw4RXdsu7x+n8P0wxLZzGDSwwi
         9rETH+6QiYhlYFqgOddKnf3NuffPwrrI6nKWEzLC7jmGr9AHjJBYT0y16O3srzOlxQ4S
         AQTFXpbZhvFqCTnpDkgwCxDnyEzWVIO1o116pPnFuKx4M1jR9WlWxLw8p1y3L1Wlppk2
         ltAiR4BgfupRvBrnMVy3vXbh81a6t8xmzzAe7AuDTFva1+vOzB4V3o+k3gwuno3M3+fJ
         Phdw==
X-Forwarded-Encrypted: i=1; AKwUvBx8/2ejgwkebyT7dP7es/XbDA7Lz2RKW3ISFwdhbyIOiFIOCGvk3Y6uPRmyTfpKtrGJBl57JjO8mV6Fz1GI@vger.kernel.org
X-Gm-Message-State: AFuF++lGgzZRmCx0spWcG2IgpQsb9HPt7HjOHvU7cMftl1jHmakuugYg
	iqOyqme36lFwhG5safMdsLyDm9GhIK0sWm2/0vtU1cRIZcdRzs19qnzuDB3aPJpHxnLuroKnEZB
	ModteOsjNlvzpjlRVI33BNW0yOFo+pCDpxJApWQYID5dakr0t4YAa9K+a/8veYieSLQdv
X-Gm-Gg: AYBFou17St/tLv2Ct6V88OVWVl4GcIK694aZL33p/tm+1RId+Tpsq2r5up2gB9qIxzz
	t0f6DXrF/DBy1ifcLQtnFHkktiUl2KMa49vcCaC56xq+LUGuAaX70jyEzcYufTvgxfzYR3lJoS4
	r+izyKSQuj6a6MDw5dxtzFKBW8w8EE9wUfuxV7LeuimAH2RTITRbgY6VDAgYjf8oMXia/shZ+T5
	7qSvnz8g4hTH9kyndCKqBbRr5krFM41BGJd+MvYi9pDEHaKMBAU6GTlt+Pf6MlHd2kD4JvT/N2G
	WJjt7kFomrqwS4aNTwIDsEMh5kAbeeSByxBMtMqFFhNwkzuYwdHBSCb60sCKEhwi7XhPAV1xWf3
	My9j4dgP4SF8Lbw==
X-Received: by 2002:a05:620a:1983:b0:939:7fc4:fb1a with SMTP id af79cd13be357-93a29947dc7mr176250585a.27.1789371518230;
        Mon, 14 Sep 2026 00:38:38 -0700 (PDT)
X-Received: by 2002:a05:620a:1983:b0:939:7fc4:fb1a with SMTP id af79cd13be357-93a29947dc7mr176222385a.27.1789371513008;
        Mon, 14 Sep 2026 00:38:33 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6499d57bsm440823315e9.3.2026.09.14.00.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:38:32 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:38:30 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 11/31] arm64: dts: qcom: sm6375: Add domain idle state
 names
Message-ID: <yh7ote3ijg5vlvdd5v4twoa3yumuwc72mlckjimjqdjohaikjt@2il3lgvyhhst>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-11-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-11-660c31187819@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa7a47f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX4WAbhPq5TJVy
 iowCRUe1aoYWsBSZmQNN7xqVJ0XA0FZ22m5qfWGHHBBO2vN96RWRFCUzLijA/Ro/jRHDN8n0oa2
 duEqnbhMjQicIetTj7Pe/j2kZA30VXivcXda/11aiXEgKskv+VTZNRtD5tnz2M/JEh3uo68DYZM
 v26dRK4apj1pZCOfL9C6uSK3GT/3WS+KRUf03YKQy/mWV6XUGY8Nsqj41vsqqiQXaBA+hzLmBBN
 XW16Rm/2dmcRrOdhnBVC7YeoPIgtsiA1JnsxXkDvuqRxXdehXbHk92CtqGYzKp/wv6cdnjPRFbe
 M+9g9dBPrfjHUZ55bdUuRj7ywYyYMdCNz8gXcodqWi4PLAoLdZYAUWzPuN0FacZGdJeopySaLGf
 iQb2MlhLGKwC3OBzouOLvfJtpCjYoJGQC2BZT/i+rV/OqSo33jLi6L7dZs5vZTygVeqaQqoNB1f
 HECqF9GjhSbQbPZcyMA==
X-Proofpoint-ORIG-GUID: oG0843pO-2BOs8kLDqRk4XT6niVn_E25
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX8y1rtglB5K3/
 M42OpBaj8XrCkNcV2o4tkV7DoOPEpEitip0zGPKxG0jyj3S8aQLVqowQh8K+vLLAYLMJRiNuBDk
 WbBikuPguRBnCoy17mW4SxuttuZkbzw=
X-Proofpoint-GUID: oG0843pO-2BOs8kLDqRk4XT6niVn_E25
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140106

On 26-09-14 12:29:43, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
