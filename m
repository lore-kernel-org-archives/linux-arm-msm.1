Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795758335;
	b=JNMn4IZLEVtulT0pLcd6e6IdlV0BIiVYiZf4uc84QCO0PrMijo/IGrvfVg8NJNA0ZTHc
	 nHJ7U4ecOzXGBuDbBWeoAatUWJ91oOgD4i/jUzbiCEmh16ca0fDwbJ1Mh/RlKVe6zxK1S
	 QLKe6dq5XAACuemI6y6dMvKU3vfJUpP5iS/Ik2c1gkYWNmAbBDY/yjWpVCIwjfB7Fftiu
	 VDnNAA+a81MJIDxfckU72NhUqzsxnElXfzKQsNsUDLJc4cDHrms457d2vDV24dXSrShLI
	 tdpBKKv8Bp/RBv5mqmllq4WCSStUfCKnTjwEHmeJBo7zENu8DH4XYn/cHO5aOwj3aWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795758335;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fcD/0QzP6Uu5TJMErj6mHvKcxrHhKf5K1ci9/BYkfZ8=;
	b=a/4MpKOsml+9tT4e1mvWkqb1K3gfueSP+MqJ8Tc1dUnH67GGE662wBeWf8Em9GBNfB+k
	 KEHDuhCW3Q+h5E2fpi6HGtr/mFZNZhmD/RSV/vHF1akm568D6I4WHP3SbUyERHcfymfc3
	 O2bnNAmVyMrGU4PC/KG9lx0g+OTj5Baj1ucxjrSG0PsWiyssWwwg4ENq/qy/ciOElSG5i
	 HFSqd1NkKPVKmtWPxJan0FAD8PqzfUYot0VqpqLcZ4yGAblcHEbIGBx8zHwyyORVHBj7J
	 cnpVe512tgz4qXgBKwGoQMQT6AXsPmUBo/B7TSYRFSs1VJeBTyy9zPcr0xA2Afym4gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F2RCzZ9n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jfSpOohA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E4A606A321
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7E4A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F2RCzZ9n;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jfSpOohA
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJwpBm783351
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fcD/0QzP6Uu
	5TJMErj6mHvKcxrHhKf5K1ci9/BYkfZ8=; b=F2RCzZ9nTr+6BRavNkqkUYuPl1i
	ViJPyC92Cch2sqsX+LbSQNCy85D5SY5gL1bETmtvM0KM1GHwhNng95mw89ySDb1H
	XuNVzIiDHRZ4skoKgNgYuGJEk3ye1E2k6BIL0ygcWsUETtqLWgv1dYR0GlZhfE3G
	6tyjxLcZvuLOKGuan24OGeXNm997Rj+HzwdFrzsqBx3H6gjZs7tUz9NGLu6g2EG1
	UZXxKCbu2B88zFya7jEpfel3RDh/HWOYDIPuBF3sfxeuykIBzu290qJxxxfMHkyC
	Y2fe3dLuyDKaKd5BM1KpuvXsBHbbX7eG5Xj9QLFKiEJyxU8jk8IeM+GxHOA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm83fnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:45:33 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cddf34086c8so4349335a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 21:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795758333; x=1796363133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fcD/0QzP6Uu5TJMErj6mHvKcxrHhKf5K1ci9/BYkfZ8=;
        b=jfSpOohAoMsCyaNNmcgedkwPyz/e+3hlcKj/UceoZ0C/bSzOhwcHjFxl+bvEQkmwAD
         VEhum9HGU6PmY6aNaGRrWyC6QOxW5nrqhpr4y4TLAI20uRLxhY7pl8mEwGqLnEkBvQpT
         wjQ8g4Lh1kMHx3rWnwju1+uyKBMqkyUamNnhSweqjKzwkyw5QEEVt+IicKmJm68stjMR
         iZTVxX20ElTHxmW6F86/o6nTaOKqgB0n5YjV78UwbPDkupRdlESw0FsJLPMQegPZLAjn
         IFdVGb8r8cI4GAb1N979uAIZX3Y4iSSJljI8yT1760X3KmuJqbLGwxM5b39tb7VGE/Em
         S3gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795758333; x=1796363133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fcD/0QzP6Uu5TJMErj6mHvKcxrHhKf5K1ci9/BYkfZ8=;
        b=hWgssuT9qXu4At9HLTsE1pjuBC55coUaqVvvOdyC5OGnslLN92BI26SyDdqdliE4RB
         SbYgVfNQTD/Qq+2UNlEf/5tj+Wp6qBnk2iItiG/ha7a6T/TdjEdSdqttzdX7PqvOs2R/
         waATZvqAVrfmZdn8SUSnGv8E7RDv+Mnvao0BJfVlVcInojMdOodMlFtQQgqgiaNtaLDL
         aVAv9/4OpiAJQPQ/Eiw79WgpFSSgh97C5Ebbi3BNEWpojlGtHc3X8NqMFYsTLGu6gEWq
         IufgcNFTg+KWlcAKR+YwpYU2Ft5On6o+/dSPfq8KIlpVqhpJxbWjhxpw9M6awQXQVJK7
         k1BA==
X-Gm-Message-State: APuU4Z8QHMR2YLSIdwieIUg1Qkspprnzzwzj5w6xxr5MKqrzA2QrMZuM
	tcLlQnUzi90CBBi/7t+ETm+0Nk6W9Sjswz4R0uhEwWNe7fGeCk8kAjvs7TMIEIgdOTafcnKqCPj
	9Avx9b0CWFC+cTOabQSgubh5FbJwFPpgclqgNFJlaBnewkRFNAXDF73lTHxsfa7/K7b9H
X-Gm-Gg: AZFdTZd5zXA5nXwMcWNE1oKdYlxQ4kOS2JUarA8j5WYAx3vV71P8/BAQbAhFhC6LRHn
	DAuyUly/6L69GbPCIsHp5HjsnVs9nNQroCyjFQFX5nsIhVtqO1rqMlrmq4tejDN3v9HGpXOC8tY
	k9jbJwK+Jpglia06xIpaHRXSwvlFDs/MHYqP31E5l0p3DEhPq29FfmbuJAAQUarc43zNZM4EYW/
	EevTJEFdKPZ4g7qirR4tn8N+CS0hPlfOYnAG8x4YS4OFeDqGkVnKRCjaKijxdlld8NaXJqaZq9c
	erLEIqq2XD/uCUVF/EfZ7jWlG/s9KpenLUfMIxSN/H4965ajOKF8BiGez/VCo0Jd4E88II1GseG
	R22uip2+tV0GyrGqieyLtqn5WHmFZvqFvt6htk8+5tLi4NxMjv4rOAmW5FHWTSbJLkQThwuSG
X-Received: by 2002:a17:903:32ce:b0:2ef:ed25:514a with SMTP id d9443c01a7336-2f03f16ac68mr227140275ad.44.1795758332791;
        Thu, 26 Nov 2026 21:45:32 -0800 (PST)
X-Received: by 2002:a17:903:32ce:b0:2ef:ed25:514a with SMTP id d9443c01a7336-2f03f16ac68mr227140025ad.44.1795758332348;
        Thu, 26 Nov 2026 21:45:32 -0800 (PST)
Received: from hu-anane-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c42a6sm114418385ad.23.2026.11.26.21.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:45:32 -0800 (PST)
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com, srini@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: nord: use "hpass" label for adsp fastrpc node
Date: Fri, 27 Nov 2026 11:15:25 +0530
Message-Id: <20261127054525.646822-1-anandu.e@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125-nord-label-change-v1-1-0d6292feddcc@oss.qualcomm.com>
References: <20261125-nord-label-change-v1-1-0d6292feddcc@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: e0Qg8Al0gmW0sz_-Fvki6CsjsO9EgK43
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyMiBTYWx0ZWRfX+6Ga5o+fGJp7
 jncB4dpzV2wN1rj2O6HJXUyW1ISIwoMkIHVujvGD/JkZrxvLaTcJnxxlLKywdMtxXZwDphWhgBO
 bMvHCUYi/7puAwpwu0s6HmGD7fC9jek=
X-Proofpoint-GUID: e0Qg8Al0gmW0sz_-Fvki6CsjsO9EgK43
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyMiBTYWx0ZWRfX7tXqKM+O1g4c
 /bJpLH/cODwmHZ2SvZ4F9tDGUfRNx95WpC0tza2EwmOJcuj/THBXmO3VQWZyylgDsmXoqcxAtLv
 ZBz3BwCQwjzbtgbi/tQ/N4aWFPGb0dqFFE2flGzgSlqZ0JTDRSoqL2PdoQaZ/oFV6dORk/xx+fF
 c5bkWmdcBxSL49BBQCZWG+nKLUvwNPn8fTnX7At3QcGDSNw5grM6LnP9Ivgfjh9/F0E0GzMy8uX
 n5EJrQfBdvh87zTeWDkqJ1ZsAcbOhTBp4gvLmeaVhCRdvFo4nJfnQE3dPJiCAi0z3fnQKR929f0
 SpoL3eX4PyeJQwDqi57dP28FwAz7ZDhCmOQTS/IWDAhnOHmgcPLpzF9zVUI6wB71PHA1zTcqV+B
 xA2WAfdJPfpsTlYQlzhUXGB9dKQMNMevigLz7qwKwBjka5nzFaewKSs7UvQEc+oDnmjGW2WRoja
 S28LZL9GyW/NCy5lBoA==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b0918fd cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=HMxxIxWglf0TOBfGhZcA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270022

I'm dropping this patch for now, will revisit later. Please disregard.
Thanks for the review.

Regards,
Anandu
