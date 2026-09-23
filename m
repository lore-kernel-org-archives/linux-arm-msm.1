Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B003B3BB12A
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 08:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153559; cv=none; b=AWZbB87RoJsJSDExSeLyxI9gP8d3quzfzq4AM4PY6oZnfqDy5Sv8zK3ayRaGcahAsE0FMUxyItgV/44T6e922tJYO694+KuN4220WeoEN8ti7e8GdmXk9HBw85IuZ/b3fUPYhUmBqpJvd5Ni2u5XXce8eIF0WKFA/eSAp8m66kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153559; c=relaxed/simple;
	bh=PLWW2hnEf6IevrdZ7b8dtjyCj2TTYWxcRo+NjhzeynE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jCAv5L8GVxlxBfea7fpe598M1JrjRDcm602mOglWdLbUvMZvW1k0PzRfEQ8bvsSav4aDJlWSOGEe6fo076GZlKRrGlVLFjPeyZWOFhNXrj0oYoN74xz2vsLyyGK7nPziNXYQF0aocgXtWs/k4YtctQhpYwgQtIKhx3G/EMuXP0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D1yXQXZW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L/oEQip1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D1yXQXZW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L/oEQip1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JhDM3332926
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 08:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PLWW2hnEf6IevrdZ7b8dtjyCj2TTYWxcRo+NjhzeynE=; b=D1yXQXZWi905ULVL
	vPltoe3VMdIlemBudUlnlMJ5AztG22PkcN1QTcuLm9BZXiVVVzpmtEg8jy3IJkdy
	KK2gslkctFmg+sLnvKIr9nuOb56TuBdZoVwPzzN9LjQuXdYdawey3T32MMXa1NXh
	/jXKvPkXaYZil5YUQ8fufDYgbGP36eWwgvOifq+/UIKnsKxWtfEOukRyeHmFdfED
	RPTXw8g3qhsXtIw4OxPLjZ5VoSAFMMcePZH5kkVTkrsyrJUWpTAtl7nnKHA8cIRQ
	v/y7AiqNPvEc7m9alyr1gIdS7pR/YJNotK0i7MDWspxD1Bgg7w57/oI1kpxWSH+W
	AHerpw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux7xuf5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 08:52:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93821883e26so28917685a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 01:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790153552; x=1790758352; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PLWW2hnEf6IevrdZ7b8dtjyCj2TTYWxcRo+NjhzeynE=;
        b=L/oEQip1IjS0u5oUWJpw7R7omKRCdXKys4Ij1zE5DZQXt4Mmx+8KvN04sf+nwveJai
         SltcnFJT3Q0I4tlzwkijdCGB6Qjdx4m2zw46EpK+orbN24Kpnqz0qk/OyRmrI5hNUEB3
         azRam49oJASiAE0wdNCHLtv6VBJchrqWwxBAu9d+DnIJfjbj0Tuw5tI/PoK4N0VkeXOP
         ffXe7xWxDBJd5NuG30euzqv1KnueP/2suOL+yE11m8cts6qb+zuZtMJsLP8uO2qybEzh
         FPTFu2vVzhvWagZOlHdEzp8LvL2wNK/lcWphRQstO7f55h+1Kp24s0lAuTw1UNF94lX3
         9xRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790153552; x=1790758352;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PLWW2hnEf6IevrdZ7b8dtjyCj2TTYWxcRo+NjhzeynE=;
        b=H316oTXjTPNHjopAjou0b++AlZn40krerKSErrHC31OJRNMlKMnR8Q/cy9LDesckDJ
         rA0tCspMHr/Sovq6On2o+0gVwe784D600nwE4caKPXqlVFKYA33vncOqtgPjoNWLTcze
         VyFYlueQBu4UdoP2PdvuhrZPPYAfTMZd+B2CPFhjrDx3DoFSwC44lRi4SmXeFnC6Et0y
         fDUMLsI+6BXKDtL1p/Ms34KHXDdmC+kXdUEL8IK6P2T1lecitpTJHiFOfxdv/d6c7jsc
         8rercU0i7+j0NnEBFXBg3bH9BttxCyapprEt5Do+NYIlBvaDSuAKE53DTUhNfzbuxPx9
         WZQg==
X-Forwarded-Encrypted: i=1; AKwUvBxuRNhucDlBW4T79SZ6Loz+UIFrz3kNqvS8DKtETllQ+BUJm6uydfovsBKcwuDSbgkvQ5LVSnvqNbdRan0P@vger.kernel.org
X-Gm-Message-State: AFuF++lzOSciuzbRHkjC957R3ofuOAWSk+HMZUzsLvwz03Y0KqFX2iLt
	KCA7UneRi2JDKjgtD5iJT0QUjaBf3gbu4SCfYA5X3nKnYVa4L1AhXkrLurigAbkkltYCjqjehpc
	/RZiMuPZO/POJzYfr5hu0mvrqzQ00O2IiaZaefqNkeTM56UcR1Ih/1x3KhCxmDqK67JjR
X-Gm-Gg: AYBFou2j/m/4ZqhkbIqwk4CPNP2mvnHTpV6Atp/FbJobJK4r8L0NOwtHTHrYcOYFRbO
	+JXARm5JB62uQpmFtIZm8Ssyn+1h9hF9OAwtn7434I/kT4vrhES/W4lzbHgffy7VgaIzL4rZizK
	mIz0pJsG/bCQnJPQl8PHKtKNm09bSHUUexKzCe7vxFV/ql0LoJJOShSuBaXLZF4ES+npcvOhhsF
	CUTpXEhUzYCPMqYLag8bAd5z1TM9xyJCJOEVKI+sqNbHbHKZBk84qEOzu/f3OB9c6cHKyTVDh8N
	PInHGhBbn35wTc1lAznAgZNQ9BfbUu5hSHlKJoa4L3eslqP6i0D5LfK0fBhQ8whBmCUzl2CCaB0
	Lx0QMdpGv4mxqO7i4OANEtQ==
X-Received: by 2002:a05:620a:8013:b0:93a:3e11:e2f9 with SMTP id af79cd13be357-93c2511c770mr256690485a.2.1790153552429;
        Wed, 23 Sep 2026 01:52:32 -0700 (PDT)
X-Received: by 2002:a05:620a:8013:b0:93a:3e11:e2f9 with SMTP id af79cd13be357-93c2511c770mr256688885a.2.1790153552106;
        Wed, 23 Sep 2026 01:52:32 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c604fsm73371366b.13.2026.09.23.01.52.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 01:52:31 -0700 (PDT)
Message-ID: <cacaa28b-28ef-4f69-b002-2757aac2a50b@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:52:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] interconnect: qcom: fix endian annotations of BCM aux
 data
To: Rosen Penev <rosenp@gmail.com>, linux-pm@vger.kernel.org
Cc: Georgi Djakov <djakov@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20260922182711.25176-1-rosenp@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922182711.25176-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: THOffnklKOb0ziewSFZrTve_SCVY0_xX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfX71tpyAWVDZ8W
 qTQa1xWbciDQY3qFVQx0w3LaPgnlUctGOq/YqewEtxhhQFxWtDYpJEGR10ts0nmgZhRYk35hUcZ
 sWs44h7fr09vzdLwbY2uHZD2p5cL8VIrSV+PhXJ2Ol7BY0CbV+cL8wqqlkRKLUkdki+oHX6lulm
 VeIRuPuTrA3iD7WgmBxgDNtBcToOAfkaHWBzwaaUj+Qw6uINpkhxnozWo1DBPD+uMedvLsXKkPd
 KCLDzvZjr58yVhY3EH5smhHA3Ex4Vz85wEOQopgj92sQZNlENq3o1REkUo8z9vjCdJCwNGy2HYn
 v8SD69Z4N1acLGC+Vp0CZ+wRNs/skbsfRysMsjaNyhwZ3ZIU5yDhx6RNzyQiqfaqJhTvjEf95EE
 gTsrUqgBVJjmvHQqKkAYZJ50O9HtMJLRxqKKbXaqJdzkejJxz+QY/55niSr+5X9lrr0Em0BLJl4
 dR9LPjxfXnqS0TrRBoA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfX1oR+p+CG8KVC
 QZA0yobtj6yIczUxv0YmWguUiUFiHAV0nD+JAFBGkTHhGLLnNN0Ja/v4+hBgabYF5z+5f27XLko
 zSph5+2sdrJamoyqx1+CRnEyv6AnHbU=
X-Authority-Analysis: v=2.4 cv=QsDLTlyd c=1 sm=1 tr=0 ts=6ab39351 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=kBXQb9JHnCtroGRzBYQA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: THOffnklKOb0ziewSFZrTve_SCVY0_xX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230035

On 9/22/26 8:27 PM, Rosen Penev wrote:
> struct qcom_icc_bcm::aux_data stores the values parsed from the command
> db, converted to native byte order, but is typed as the raw little-endian
> struct bcm_db. Sparse therefore complains when the converted values are
> assigned to the __le32/__le16 fields and when those restricted fields
> are used in bandwidth calculations.

This should be fixed by using cpu_to_leXX()/leXX_to_cpu() when
accessing these fields instead

Konrad
