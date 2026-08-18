Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DBD3E833E
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 11:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787053111; cv=none; b=AMSHj+9yUap1q8y7e6aWzqBxmZkBfU8jjXXdM5I6SqCH9EqPxaB3LckEkhFb7+NMxlT4tCKDTLAF+J37mEXkXmCWE8qwtlbcCCosbVucPG4z4pCd0iCo2aP+AWaF8pE34okAQfhV+CZZOgU87u2OR+x24VYr078zFYfRXK65Jdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787053111; c=relaxed/simple;
	bh=q1CGJCRAI/H/kngkPmKzYnqyLDmlvmjfGxSF2tr6aTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4A3RDqjqT6KHqEcL607emcrE+YTBD0CJpNVAaCMMsQtXFXgHsqv6r8VQPiNqyd/sEr1oRS4E85Qo4MrPc3Gu8n11TN5jaZFyBWDyC5VGYXePjpZW5ZOjODBeQfOgzqFV7Al6oFNNQDGiDY+MuRRqoHijo4Vk7mCSJhuR48tBRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lk+NAF0L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tek0FcKj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lk+NAF0L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tek0FcKj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABhjQ599423
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 11:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ncYNu2KRJ/Tha91GQijJqGFI
	1sxsOUm6AvNieIht+IA=; b=lk+NAF0Lw5QWjWuij4iejIkPF2SY4V2TZnM2QcVP
	mUIH22UwZozyzLs6rtxPZIYSvWZFyjDw0xOrrCd3nv79rMQ8b1tu54jEwDuyhxNe
	yrwRZ69XwCKRuhrN7LVOQV0geCg5a4tXUDr9Deszx7/QE2ZpwOi8ko+rxeIu8i9B
	2VN0iXzFSdTZ7W+2/kJxCw0WfvYZwE2kjGEri7mdbqIeHQsQkENzdSnr/MgvHJQR
	zSbv5epVl8GeWGVRI7iIBDJjuqHgzbD5AzbfDQUtjCDJRcSsilHHhKnVLKtDR48w
	EW6Yz/0pO9RInCgjipw1ord9nOzi5ybMbUy2UBWnYlQ/Zw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4eqtt49p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 11:38:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936cadb0e8bso391273785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 04:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787053108; x=1787657908; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ncYNu2KRJ/Tha91GQijJqGFI1sxsOUm6AvNieIht+IA=;
        b=Tek0FcKjy7CLeU5jNNDwzTkDlieBYyAjsDqqZn4aQTSkjTAo6QlJpjTxozj8gt/3Il
         vAQuFuJwk6LfokJu2Z0WxJtC1YnhUU9gtID99sU5kOelvKbI1XoaMLgdxCaymcyKJ9tY
         hBrrkwQ4BKLUG3iYSJWOJZLg42crT5UGVUFgej9S994UneKY4TXbxI+Gth9IBSO0uu9c
         XHbpmzqi5dz6q+4ZQYuRRg6r4FdjuBFTeYBaHY15DUQT+bTGcnMikMQxvxcQLLdiy9we
         mmyV7Xu1PT+H6y8c57tIdx8M+Qx5zFPa1wkflj81G8CiE7H0OEs726ugyQqkanGF5Fzf
         bgqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787053108; x=1787657908;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ncYNu2KRJ/Tha91GQijJqGFI1sxsOUm6AvNieIht+IA=;
        b=Xa9kUxJMgJEd06k8OSNVgPFajxUJIdMqHQfnm4oc8P9sIi8NswO0ckiR0IKApJbad+
         IBsax//IhpNJEE8owkmCmYNMrwNw4/2AvQ6ekkuXg5sbppUB6wXX/psp0qWN566HUg7Z
         EjfpdVGCrz8XAsz8HJaB+QhGFHrHHwARjqqWRNlTlUWES8p/RhjRDQUl+qX51539GKlE
         QHq3AcO9wD+1GqkrfiJessXl4aFA8DroRw9EJJq70eaY5jL+lW7GbbXB1TRuWbcd7lDo
         aigh1JYOXJdieBqdL8nA7xDA7XdAH7hfdqUx26Cd0oiEZAyMulsf2WU4oQvswOng85Rg
         JRbg==
X-Forwarded-Encrypted: i=1; AHgh+RqpimNcYCC7MZ2ab88UgcJEUg/nbZZKROgvSNEdOK5hJZ6MAeqUpmZhh1AFhTPb1sEQoJJxocXG9uKC9Bcl@vger.kernel.org
X-Gm-Message-State: AOJu0YxWQcUKDiLn37vqMy9Tps7EP3po1s3rkcC+iUr8XA5X78SsUfSl
	/m9QJRGtFQDH12O2yB+xssQwg90uIWxR1LXPlbmAVkKfuUAuY+Ph9mXt1uPPRCfTo8LFe4d9Tkx
	PimfIxGT1noFRetOvVQDz3ckqFFFWQc4mDN1YqEetInjNSfQueDQ/nAsKEikdD7oMH7oa
X-Gm-Gg: AR+sD10SjpLvRLJK/MVKB6A/Wc1kWqc3bhDEOOaRzgTtlz9dkA7a+0/NERfr0pY2Q09
	EVKcb3MysbmR1gWl8jBG+FkjG9klvfAyEYeuzfOLbT883b60WDq2hFSfmbg0PC2XHl6LhcsYZHl
	Kal4UTmGdFsfIXWz9HeeIP5S/8u9N/aeWE39fDFQ7380A/WB2I1BzdG//z777wyjna/YMFJZQ03
	JNN6LjYharxM0W6wmtubTpWV94uHSyaicSNmPwpx8SToaxMugfapnMdGNm8a0RbYY5g/q5V/MPG
	jIdfznyBD0vfUVUNEqWjJZGirUJeibAdILjSJBJAZiKNOQ7lw7teGSZY8cBVKobfhOdYBddjHqM
	Jtt/irCXg3Ttb+sM=
X-Received: by 2002:a05:620a:a41c:10b0:912:bd42:b46d with SMTP id af79cd13be357-936d22e4635mr2503447285a.25.1787053107821;
        Tue, 18 Aug 2026 04:38:27 -0700 (PDT)
X-Received: by 2002:a05:620a:a41c:10b0:912:bd42:b46d with SMTP id af79cd13be357-936d22e4635mr2503445885a.25.1787053107231;
        Tue, 18 Aug 2026 04:38:27 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996188217sm541292715e9.13.2026.08.18.04.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 04:38:26 -0700 (PDT)
Date: Tue, 18 Aug 2026 14:38:24 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        quic_tdas@quicinc.com, bmasney@redhat.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: rpmh: Add SM7250 rpmh clocks
Message-ID: <7mh5tesovuk5qo6ebxhz4k74zwg3nx5ab2zibtqf6o52ybdxq3@v7urixq67lsb>
References: <20260816131646.10551-1-sreeshankar0910@gmail.com>
 <20260816131646.10551-2-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260816131646.10551-2-sreeshankar0910@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA4NSBTYWx0ZWRfXxtRPjRs4nQj8
 nqj28rnTDCbnZ6WKrkPPStx8LUXFC0zAXiv89jNZ1WYZc/m6fVbsf4LtLy0jubVPNm4r1m2RT7m
 SPWMC9N6Eo86t5kaIpK8bpK5JWWnPpI=
X-Proofpoint-ORIG-GUID: xo1UDFHTiPjeHcgmOGmod5n5xT2Aw0eJ
X-Authority-Analysis: v=2.4 cv=UfFhjqSN c=1 sm=1 tr=0 ts=6a844434 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=e_63XvbMukAsnnsCD6UA:9 a=CjuIK1q_8ugA:10
 a=Z0LeWUw4VpMA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: xo1UDFHTiPjeHcgmOGmod5n5xT2Aw0eJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA4NSBTYWx0ZWRfXxCfCo5qFLm8C
 4vvy+uZ+CrLhwI0LKOzCZfjAIBL22F1LTj3NlbPzHohV5pVYepWwptJ8mLVDELU/vzpxp5gP4Ij
 k34i0WDtHrmHVAyKCAPEaWb+2ieTGRmJ72QkTyfA50SmqdsmJdkiP4XtCFwDBFpZGz0yF/X8GlJ
 jpE8/stJXaDKyP+TlMCR4fYVxGpgDzHSuhyOJJrRcjX4gvkOuxVTr1UDNuKzHMdbubM9P+D7ra8
 lIObwLfTtUIdebtL3PMrWMPpQxWtxEIos6fZAt1flmGBxMG6BF5PLf+IVTYlhlzoLpaSQ3g8Tek
 jl5CkmEQg87gI+MKojZMzv7H+WHtZSKRqOgZTk3/jdfAvCyoVrERZJ7ZmsdDwxYcjeS1BKWR3j5
 GNS9C03m7FNXoQE5+2NEP0kfbWNpr7PnaJ/yj3ZtyfgyxBVy2QyyD6AqobSC1jm5GC/80R60/zc
 ++Lf3mN6XnoAU439MRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180085

On 26-08-16 13:16:44, Sreeshankar K wrote:
> Add the RPMH clocks present in SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
