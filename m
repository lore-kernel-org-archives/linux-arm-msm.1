Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461643;
	b=haZjarQvY4ZVuBRByhq420B8nlFu2wI08q+SLhStU0/tygtzB8MNkZX7hwz0Ecrkx8fB
	 V3LVYrTgPJOQHtzHfIySyyP6XhTJfeKB4JkDkPJhAJfeF8UkDjpO02kUbP1FJoEDwP8Nr
	 stfMbOdJbCAJMm9gSXQHIzdMoMAR1ZJ5xNnu8LRDs3zZq3v7tB1iaUGZ12lNCPLjTrNL8
	 I9BkONhFxllZZsqyY9T7Mcf1nIkDwP7OLKmER8WdnFafekcw16ZVtCwaXDyvelV8S3J+K
	 WbRH0PJE4Z+3xzLmHWVG1zO35wf/o3rlcpNXyswf3Pq/ANkIqFVtq+BbHjOUjPErkOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461643;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RSUXyNbT/2UaKGkug9zQg3mlIMfpMREk/hGZ/9oRu/k=;
	b=Ir1racZsw5mOuHSAl/rpI2KD5nhn1hEtrZODgUfemy+yJYVWmfnf86Ml5ukeZrgud+Aw
	 ZDO77k+CauCgSBeRxKceHIz0H0u2O+/D8OSlnFcdJnjTvE9XGE/WMWB+EkvtPvO48XBbf
	 mrxoS+3MWj5SPPKkPK9oqmObnrujGJvkg2HjWU7b8C42A4EJ7lgCqnALAMfzGTdb+mAE0
	 8dbql4msMoHrLmIKRrO41JZhYWJUhX4YDr4EhIVwgTMX1nC20Uplux/ypFX5QMWvmi+u9
	 KI2fPcasADgzgKiyykP61ZcIWL2pntPVAt4Ou1HUBOYQKv2tGMq+AWoDqP+wbUE4Hjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LPBCBpwB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ayvFOWig;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7461F606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7461F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LPBCBpwB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ayvFOWig
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGlQw3730153
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:20:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RSUXyNbT/2UaKGkug9zQg3ml
	IMfpMREk/hGZ/9oRu/k=; b=LPBCBpwBNNR2kc7GU/rxBQn/EwK4UcnuLvuCj0lM
	xRC1IRIhNyHCTED8fvadKJVGyXr7+IkHslufrJ5rCZSQCULXnVL3jA1sQyrMNWI+
	FUfjMxLEaytl3Do0rTOwBRMD0bRfybfUJ+JRipwYU7nslrkAOKwRaRfREOmU3QNh
	tWq5ID2RxuGq/AcOYuWtcmNaHqNXThTkwR85PnM2unp22emabgATSAhxOuMHdR9W
	cL1zzXKt6PMT1rYlr45Beztc59lRHHRT3khYNOk13IlEhCg2avKq82VjgLCZLITo
	umerDyFOO490sP7IKJnrfiZVxutyXN+Gjve1rqr+PlSHuQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd343u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:20:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94961ed97d6so650520685a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795461642; x=1796066442; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RSUXyNbT/2UaKGkug9zQg3mlIMfpMREk/hGZ/9oRu/k=;
        b=ayvFOWigAXNyotWDzw5KK+DaE3uRP7lILBWVdO92rtEyfLfZKOb5D0ckspxaXX2ZRH
         FyzAYSztNtGAjHuqdGkEOXo8r1zHdvN8Gv+8s48CUQsAdEOT7ud1AEKwUX/6GbhpCU/V
         4UssPlGekmxb3iC+eOEZ08QWaZZ9G0Ofgmd0R+IBL/pcqi6bXB/RHAcv5lIrlnqj4t0w
         U/9U9lm+cm9XfVByeMB4rPd4Dt81r+YhFVNBxcQUEtzK/wvq7AZjospANbFkV0K6O0QS
         Q08yDpb5Tqx1ARWsXuSxmLryagl157/KA8BbV732gafqIAvdhcJ2SWGuqaM7ATo/vLoX
         m8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461642; x=1796066442;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RSUXyNbT/2UaKGkug9zQg3mlIMfpMREk/hGZ/9oRu/k=;
        b=eEpUP3aXZqm7mOZq3loKeSGXiOG9TcGnXUMuBjmdwUhPf/e4L+ZdtC7ePG1dMNWjG0
         y7UuB9Htkyltrei7vuI/oKkKyxyeNwQVXT9EHTQZeLeBdj/iiCrM+1bHLM27U+NzEKeA
         sbgizwHnA08fdEMDInDXZUsLTxGdoxGtGMCAtiizI9P9ywI4DfHkDoeCk7nAFcWfa3sW
         HeHV0HkN7M7znMRSH0Ao2oJtkH9LCUpb6C9uZ6FKuRhX0axTfBP8tMJSy5VYB2DGB3Fk
         doAkI1jzMnEbJjUlBK065mqIGfVVtp01i17TgIKxoaTXifCYTvS0ydm6ue6UDnYHjbV+
         qiwg==
X-Forwarded-Encrypted: i=1; AL+hErFeYS70LysKBIxYN6hpL1yPb48hiwq6q2JGpQtSvruucD6cNYD1MJZ3KIPOLxX+RYt302431ciDW6hKGKnY@vger.kernel.org
X-Gm-Message-State: APuU4Z/yiYJAlyyz0Hw5Pda+kmyT8XrG7KnYTEdmFVkeZGJOjvcTPHww
	WU3E0eER375cgGrktuzsZDZtgFgF5DLfFY35o56iB0PxiNrkvzXUU/+K3ja8gTtYXgEU5VwdNKA
	67tJDSY5eoTREgfzBDpEQvCKua9yramW3afMzuHOATgDfwH3D7BdWaq2a3W/J39P+/hYs
X-Gm-Gg: AZFdTZeT0eD/saZbnHpgDcXDO/qu2XCwOxrFeNK+c+buJufwMomD3MrJ75nyMpypAgt
	KevcCPrY1isoCMdsJCXNqzDC9sA0BJCHmvPcI/zOOOb9TA88Uq4+yiT5RTWjJGxe3d5NVF1BG14
	foVbbGR0yArZwGVKhFJzXpyev+DdlsHsVcr7CaAbmCXgY1e/4WLPe8u1bYeoIZfpZWxtmaJ+g6T
	POPQwsj4zxyFxqNLmqhnNHaWF2UQVGG8lQ5EOahck9qzk334lzARIVKQb/ilNzscnjnYu47qpTX
	ANLspbCjDWBEJuPGiG8KP1KOwVkLB9rnhnJsExxzulJ6Ne8E60PZ9w7II++N/E6NbryJlecsPfq
	erVw0UFxT7MotjjOaki+w0MgAL9kXz696CAKmr2thQgMUlvyN0jY7pRNwdGH6yQmY
X-Received: by 2002:a05:620a:6919:b0:949:7da0:af86 with SMTP id af79cd13be357-949b35723a5mr2288322485a.10.1795461641502;
        Mon, 23 Nov 2026 11:20:41 -0800 (PST)
X-Received: by 2002:a05:620a:6919:b0:949:7da0:af86 with SMTP id af79cd13be357-949b35723a5mr2288317385a.10.1795461640876;
        Mon, 23 Nov 2026 11:20:40 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm22372771f8f.26.2026.11.23.11.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:20:40 -0800 (PST)
Date: Mon, 23 Nov 2026 21:20:39 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 3/4] clk: qcom: Drop redundant ARM and ARM64
 dependency on IPQ_GCC_5018
Message-ID: <tx6vmkqulaq677uju7xabypeuji7avq4ib5eupwcbhzbhrxddl@yx3n3axrmlmu>
References: <20261123-qcom-kconfig-unify-v2-0-fe56c8fd15bf@oss.qualcomm.com>
 <20261123-qcom-kconfig-unify-v2-3-fe56c8fd15bf@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-qcom-kconfig-unify-v2-3-fe56c8fd15bf@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: u3Et-uaB4OsCLnH64PVb-x1JmY930-Wj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfX/WamMz5Bio4u
 22YXRkQU1E9sUvYJGdRjD489j7z6Bg8icQ2bjhWW+6w9ElVMkyiHduohf8l4jAMgotqyjzOrGXd
 c/66wEhky0dJL1n3vfTk68mQ0sdHe9mgDbRSL2wQTyB1AypAVF1vC5S0h5sYl1qLstV+V/916l2
 cl9pYYH/fjTwUxn+jZ6BCmci2pCL2q2qOELSDNK23HZNg7XE/d4akC6+QBL4PhmATevDiH2uhCO
 fXB8HBPsPFEkmOzTZx933KvehA8F0O3Ae0QQf7gFnoMz+Dm24on7EdikP8BWMWCirvtt6TRn5GY
 seeRygutomn+Zb+/S8HpRVq4fo6RS7dUB2DnfPuzQoW7QbVZEGP7XwlQZDdY8OM5Hf3vQbOzkly
 wh6pdJEu48ZFmmfh82id300s45A6ZIBfd6yEtI/KW2q0u7fUleAu3QA+sa7zw4ubo+MYCQDGamU
 +189OsUg03oiofryNrQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfX0AybKeqt6azP
 Qsb4If0kJ0+tp9LaN/mvkuiDjZQgFAM6v0iQ5ArZxAd11QHi2MG6wJfdBNdU+W9lwLeidWfAdxr
 Jz+fS9zXJYAHcftgxJzzkoEjbxWtcws=
X-Proofpoint-GUID: u3Et-uaB4OsCLnH64PVb-x1JmY930-Wj
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b04920a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=IGk637isbZX9iuLAz1UA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230077

On 26-11-23 08:38:13, Krzysztof Kozlowski wrote:
> All Qualcomm clock controller CONFIG entries depend on ARCH_QCOM which
> is ARM and ARM64 platform, thus additional depends for IPQ5018 is
> redundant.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
