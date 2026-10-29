Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266757;
	b=VWuPpnGVdpzLE5g/2DBaHy2nt8SutadTWVg6LUhui8ycGwjDj9mcE0oq5JEN2cDZ3oNb
	 SvXZZyqJi+lF39kJUb9hR6G9JEGLHMUKBiF7tRE/eueM9abIwIGvFJFib9oVsn7JxKetw
	 cAIX0UvyR4jnLDxUq3ZtUAzMlxZRWrMuq9H0MDjHMBzR7UvWxJHYt2CtAm95QjTTn8sIs
	 kkecIr80NY6xbVvf/m/NnNXfdKzHl9mZDBsXWShJYg4fgpn2NYkrYXEkOnT0eab73Tndg
	 /grxApLf65gB8Zi92f3H/teeIVEkvvzDRIl3TnRc1HqVEEhkL5J6zmwyykzok5W4efQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266757;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RjSyk8ABwu6/513QWu3MJQFpRorGj5Zx2uYf4wmQKdE=;
	b=NbgNl+fI32K6i9BWolo3jQHVmnxNlJYVn9qcEb0PBuzD4LjQo4l+NVzJuu+pvCodz1te
	 XXXhTeWquP0GCyuJoaHhpenR12Rk0jsD6BlPZY17HpKdr+EbBuMaU8/Kse+At79uSCmEn
	 GwiEZAF6zFF9S92A7dvL1FSRmDTP+4SKsGzn+51npmVj/Aax/CpFG3j+jTJl27KPsXgMt
	 JaPdl7XFj0T/vu6s4wlKE06sL7QeHJi4+PLFytJUkGffZM55RvePjeQvcDS1LefOoHgz+
	 vixgpnBI3YioGQJ34tEd7uH1cdnOnVEXKt9FMFc887+HnodR7VqwVUzBDvg6zTiNTUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lwbdQ80k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FrAxNDPj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBB6606A31A
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FBB6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lwbdQ80k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FrAxNDPj
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vDL82912447
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RjSyk8ABwu6
	/513QWu3MJQFpRorGj5Zx2uYf4wmQKdE=; b=lwbdQ80kSkREwFe1vR5ZX+w2oyM
	6lSga4mcLTHgPt84OXBskO33v4cAcbYVpf9OlMS7yDBQ0OEB3FGRIQ9Y0CNO62d8
	E92V+i12o480B6HZJqreNcaWQ2ulnc0P4BhZa979Havdsu8CHCpaXl6OTvJGz6FY
	VyRwrZWa/cs69gzjYuunoqRI33SSi0YXlxHaAZKoqmK1AqY9kSigOuePBwiW1r7H
	2eHsGnRC4f+HXE5hxQ6nz2ox17OgubFgR+yfy3XrcAfls2kHHB2PIa8G1iI/MRKd
	rW7qdSRRHyewioClQdgnoO7qRP2Sm7cAIawjrK0nfUmkog35/7kjIh6vpyA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknb2bav5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:39:15 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd5ca3840c5so2205820a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 02:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793266755; x=1793871555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RjSyk8ABwu6/513QWu3MJQFpRorGj5Zx2uYf4wmQKdE=;
        b=FrAxNDPjfESlF/MjW0eUwuxt4NXu+OBME4mwhBetE7UcNIzQtzrNFItPgk36u8WmFD
         hFVTufa9oJQbFkl7wIMhfBL49ysidE9AN1Zv+2THQ6tFPF+g5OpnmaKEeZ2BZm2Tp7qd
         UO9Mio5x5vhtnXOwZgP73g5LVdGyU61xptjd18BkOBymZcW6j/u2//OPKzYv+oCobbtp
         f3B2QOsjRJChOPwQh3Vr6o7UzZkFtSyzq4/fiR8SiXEvxDoiQTjCl026OJeEJW+MKbWA
         uUzx7paFpTP2kqDe38z3t6JnVcSi4of6Q0w5NTgfvBWDaFOdPb2HoZ5bxQNEglK4eIOy
         N9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266755; x=1793871555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RjSyk8ABwu6/513QWu3MJQFpRorGj5Zx2uYf4wmQKdE=;
        b=N2Z1rDOhZW2uQJV1whisjG0oLxZMQK31EeRDi2fWwFspBRaUtepTFlvsVpvk78YCPP
         ZlRMyepyvl8AMwpPdvOhVlnrWzFMyEYXAzPA8ET97BDdJJ0osP5rghN3eTayxpDjFHxv
         2CPmWO5IM+HiL4VpgKxAtM+HnUCnq0UxiVC/wgDjeN+jYJbahkujKLkSFgPpablMGh41
         3rk5UTMDG4jMvtb7FY1WpHvSl5+2VW8ZDbdTxJcNuIQu7TkIhEj8yqRvyYkR1J7uhjnC
         OKmta3+YsaGTrKg1tZ0vEuXDqN6Ho6gKjeD52xEINAem1skmwnE/W7eSVjuXfws9c46+
         cvlA==
X-Forwarded-Encrypted: i=1; AKwUvBz3Cn+/4y/RiTOQIcW5/oMuDwuUj66fmSNRm/TAR6dMq07xHLgq88Gk5sgH8piak2tHlNJR0lkSNevgE2aA@vger.kernel.org
X-Gm-Message-State: AFq9FYIXDBpdcxvDvHwmg0I1sN9kF+G3VYAniaan+VVGEcDvh4OuyO7X
	D4nuIPinNUW4/AnnAvipCW3Qa/Fp3PHTVI2YjYKBRpArQSRW0uBGTrhyaGi6GHPCQsNKctgNOmU
	pbcncuRrAO3da3T/WobYCrRhWri2vJeeit5JrPx8DFZ0C4Z+jO4jt200nQ3ilEob34cgz
X-Gm-Gg: AYBFou2WOIc5vRJd8eF7W69c+IUKDqQSYkeOGWlmALseP60ykAmc+zcrHrmmoASMzWN
	+ntIQ5irrv8IOXxasAKwS24Sv2dWwqMS929KVkfjZ1HW6hqF1eWFh2QQkDXZXx253/XCbBB5h0t
	bh3BxwsMAE28Spw3vFk7+wXEvm/bP4F+BLEM/xCkMQOGr3iMyy29NwYAu8uwm+Wk/N3+cxlJLT2
	ubBCtmHDnNKVoitRrhaF7t4cy1HvBsx+e6M3sUvgdTr9ec2d7hj5kEOSXRqcXuPBgOWNd2chjM/
	WspkHWyMKqRpjVR1vL6jtOGZyAjqt7tI0YJWUYjT5CvkcBkRxqgFPPmbZpQ52teL46uRGB5Gcq7
	91Nyj/RTW6lpkkJNdtu04tVqkQc06dnfa0zo6/jtOQsA3eKib6AvrwVN6bU1HSChQ7akVkRuO3h
	ohfK3GET8S9VI6iaXxV3ESJO7c3E4Vvl/SoKfRVL2zDFVfti5TCMyKaIMJSUSFZsd3cuvTKw==
X-Received: by 2002:a17:903:1acf:b0:2df:aed3:2ac0 with SMTP id d9443c01a7336-2eb00487143mr48433275ad.10.1793266755002;
        Thu, 29 Oct 2026 02:39:15 -0700 (PDT)
X-Received: by 2002:a17:903:1acf:b0:2df:aed3:2ac0 with SMTP id d9443c01a7336-2eb00487143mr48433115ad.10.1793266754588;
        Thu, 29 Oct 2026 02:39:14 -0700 (PDT)
Received: from hu-sivagupt-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm31434715ad.65.2026.10.29.02.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:39:14 -0700 (PDT)
From: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
To: konradybcio@kernel.org
Cc: abelvesa@kernel.org, andersson@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        gopikrishna.garmidi@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v1 0/3] Commonize Glymur regulator settings for fixed rails
Date: Thu, 29 Oct 2026 15:09:08 +0530
Message-ID: <20261029093908.100286-1-sivansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028-topic-sip_cob-v1-0-80ab6704aca3@oss.qualcomm.com>
References: <20261028-topic-sip_cob-v1-0-80ab6704aca3@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Yu2a1IYX c=1 sm=1 tr=0 ts=6ae31443 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=E6juKWS7BAkPFlJObQUA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: azW3E8jeE2qFBs97IvJbxKwzcWmIGnV1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNyBTYWx0ZWRfX3BaeTRwsahro
 OpDLvY016IWOYLESFtPe5wJlJgEcQOfV9wbDa8AEbVXJo1aAV+ALef0oRVWrzSa0EXCc1+pFeWE
 Z7zirg0W2o2Q8w4pb3OQpGi5my+ikpc=
X-Proofpoint-GUID: azW3E8jeE2qFBs97IvJbxKwzcWmIGnV1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNyBTYWx0ZWRfX9duX1D7JEDrl
 kM928zA0mA2DmaWyiFCHYqbA78GatPhqiVA+OXdrj9693IB1IZ/ZqP0+7TqixutK+WKqkLUT45N
 NdjCNjQ/3AfpYuZ5SnKpHYSax64ZOdPCJ3ESrTjZ6R2ctybTvLB/RkS7aLOQQVOUtOQGIcYJYTw
 IisrmaaNwuYjMuAbUz8th+yIpeQFzSfe348P7aWWzn/CABzlNZnw6yGFvIYu1fnZ650/36+cvOf
 7y9SpanjjAklRHK8VA2fNUd5+BJJe1qS/kNg+ML9RaOQunYUxD8a0BXI6rM+tpFXInucWLjMcow
 KIUAL4ytWy9Nj9VLlD+HadPujqvcJsYoRTzfHRZKKHIEcHbEMncdqLgkZ8V4WHikkN8CNLse6Y0
 8s5kDCVbq59q8ZdaL93497UJikEjAVF8tKv2yileGK6r/EtzcJfvP10Diwa4oQPW/Z7oR5GdYnK
 NtrwaeeOVcO5abfsyjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290037

Hey Konrad,
> Certain rails are predefined and will ALWAYS have to be the same for a
> given PMIC configuration (due to electrical and other requirements).
> Factor these out to remove a layer of pain when creating DTs and let
> one have a better way to reason about the settings across the platform.
> 
> Glymur-SiP will be the next target after/if this is accepted

This series conflicts with mine.
I attempted to rebase your series on top of mine, but it didnt apply
cleanly, hence wasnt able to boot test it.

Link: https://lore.kernel.org/all/20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com/
