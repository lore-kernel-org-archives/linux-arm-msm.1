Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309932;
	b=x/hAO4Gn5KTMDPWOfweF6eejZ0qU8ktdyWAWKhiKQ3Z4xX9qpIcAuPLdE77mRQ9930WA
	 DhaNi9sVRYvVSJr/40yXzohrYZxzQ6r78gU82GB5N7eoHyvG2G8JZCyNEgOXcfFbUbgGK
	 tqXwWmBAm8S2rt2s6O3YM+/arHelAid+6by+yLZtKm1qC6YFMdrQ3ILMf45wkqUgCUGkQ
	 rREq5jI2MKxiXtNq+mtO+mBqUA9nxp7CjRxidV8WODoNCVNvABYfk1M7kfMfJGUbqw8bc
	 xNNBJq+xOFapkESUIl1I1VRsq5xOE/Vq+myP0Bm+xwB08YJpNhCNtWTD0Axe9yvWJRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309932;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0rRn0vIVvyaA1qSueBAyNudw6eTRyVguZjtA8xYRe3w=;
	b=Xgn7wVCrQdeg6/+JC8BEt2q0tmkVfF+1vJzpdrSyCJ54E6/YTVOKd2FD5Tq6FBaEehpx
	 PjOM6lrWJcRSeqYzq7t7qUV1y5ADBTQPMZl7GnoBkgajvMpKtv3TyoBKQEgpyB1Qr9Niu
	 qGv8bcmQFke+ZDUPs76uLM1arsT6k3x6IBOwhQ6YsNJDXMG+/JJus41cEnsd71UbrlGt4
	 JGTpjDlnZYRW+tw4FP9l199BkZBLFIc1iOHpFTIBl+4dqNrzkCdecXYV6Y5/xtu7TtqNY
	 d+0+l8BTOs90LHNTt1aefzW8TlROzWIy4ihRDedXe7s4vdjREAvtOZnH8cjhlaM3qgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SsVTADHc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AWDHXQ7+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77712606A32A
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 11:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77712606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SsVTADHc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AWDHXQ7+
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAOuZ1599664
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 11:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0rRn0vIVvyaA1qSueBAyNudw6eTRyVguZjtA8xYRe3w=; b=SsVTADHcHBKzYavb
	nLGn+1vz37WypDtAQXwl9WLGZkVuoQ4m1NRqcSaxdHThnyYTnO0hVcmigznimkrC
	RBBSvTFukyiqAcq2iPekfLjEW47+v7j55zYxvWlTbjYTlnAmgH4RIsmrpCwOtz1E
	yg7YplOeUaClzVsIoGY4g6tPDU19Cavo4Wj+6RzgQXM6f/meoRHJEAefXIJUL0a8
	BSP7uwfY3ZX46ZIPVeAf1WN6DyxiQKxmUxe8SbjvUWDSs+RHPcX9rtLACiw4Q3bv
	lupQCnp2RpGoXvH7pMkjuX7GB6p6qAuKX6f1nHsa4rO3g/E3cz0tvqs5myKQ8cwi
	5nw72A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hutv49utv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 11:25:31 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375f0fd31f4so256846eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 03:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794309931; x=1794914731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0rRn0vIVvyaA1qSueBAyNudw6eTRyVguZjtA8xYRe3w=;
        b=AWDHXQ7+lkQeHnXLSfs8jAiAlq9QzOGFG9K/KfEFyIZL9sbAxgjqymFR0SqlWk5QPw
         a2Ct0zfthtspI97wnZNxiQOig+ivpeUDpduHk20ZyXzdT17H3UnCQ/gbMvuvt5r23ImF
         GSSZ5JBHjHIPpT+yjzVIqd6HkJ4I64h5Id1L0GKobEzk5L4yWWhpZbP32TDisqlO8/35
         JpaC4bEniXPCptKwU0pvuxwyF6hGMmAx/Fn2cnyPUJ/io7RTzuvKOk5mJ4QqmMCjsM1+
         g7BGMi/CVzDv/l2eIu7j6AOpoxKl8VtP8vbbiEL9MBY65ZdodMespu2NLO7y/XpRzIfx
         wXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309931; x=1794914731;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0rRn0vIVvyaA1qSueBAyNudw6eTRyVguZjtA8xYRe3w=;
        b=oPX04atWFwUgEKS/W8HJiSHbFbD1Ld3uX5fLhgvzMh5MZvh+D6G6cFNCv796vQ/o2w
         X06/BQ117hrPIjUee3cwOZVzjz5PimqHpmdVBq1Pp7SsrTiWAPMJuf55r6WsMqDcZF02
         KUf5hzOasEnLz3lCeK2FekPZUXSUNjFNIatwoZcwtQRWrrWUgYQ/iQvzOJ2Y5X1HlBSm
         3dpjwkCH+JqUrCbtLhmVxHzro0OCp3+eUgaL0CSPvh7RIIotccxZ6+dwR7YqB8YWCY+b
         eHQLSLreiIVCqFWZzQ51ftYRJqB+sMilVdJccZcInQDNdOcPaUK3Lzr2eFjJB5nqufLu
         mZrQ==
X-Forwarded-Encrypted: i=1; AL+hErFqWE5E+avEF6kkT3i8EG1MTvBfq5SoLRd9BEokDHlk+YtzLOaG407g7JcmH4teMS+aNx0hXwQZDAVfX5sb@vger.kernel.org
X-Gm-Message-State: APuU4Z8H13GlYcOIxzF5q0l5u9JzDXXBDsljQMApnPV0imy2uSDd0sju
	aMjcYJ48J8FDd0QKMWVEtUX94e/6jTJ6mIgd66U86oWXlV406a7WmyoHHIhro22oqViocvEWyyc
	/TBiryOXl0uZxcPQpGRKOG6jN3hE/nOVFFzMBksNQTzx1CLh1dDZhHqWnqFt/E1o5e/BW
X-Gm-Gg: AYBFou07uLVavk/vAi6m5VorFvNymzjtUc7amIqW1rRZGwAmP9q/B4hKm7avehL7gmO
	ZGuHEg5kd1GkqJ4BlYV/5a5tiFvNd56d5Sc35uWtHKt2MuMJM37hqToQRpY4m15ZkY7uKiVVOBU
	TvzlKIRw3K3iTtkMpMHKzqLFgVxadeL8A9lik4ljFV147P+ZAtUjVy6XyYPdyilVGEARLYl/hzw
	5NXd6z7c0wR5pVoA0h5q97fRC+ln7BTjxuGfkV1mZcuih6Ac9FMRmZBe/WXdzamha2axsjrKqPt
	CYDi7KjAYw/231CUsOd/w1vgkDRSQkkieO5uKZt7HDHpWj4tUF+zozhW0EgBLIHVwA1pphDXd42
	Qj+mGabSvkTmfAn/3RkJiWZm9I+/StpH3cUvO4cnHfBYyIt3y3J4SYDfxFm3rRyKqKeyzFn900e
	nO
X-Received: by 2002:a05:693c:80cf:b0:36f:2677:fc09 with SMTP id 5a478bee46e88-37520217bddmr2806035eec.18.1794309930875;
        Tue, 10 Nov 2026 03:25:30 -0800 (PST)
X-Received: by 2002:a05:693c:80cf:b0:36f:2677:fc09 with SMTP id 5a478bee46e88-37520217bddmr2806016eec.18.1794309930393;
        Tue, 10 Nov 2026 03:25:30 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c7c50sm11890587eec.29.2026.11.10.03.25.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 03:25:30 -0800 (PST)
Message-ID: <6f94633d-b134-4b1d-885b-13fea6334767@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 16:55:22 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: i2c: qcom,i2c-cci: Add Hawi
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261106-hawi-maili-camss-v4-0-d528c7a797b4@oss.qualcomm.com>
 <20261106-hawi-maili-camss-v4-1-d528c7a797b4@oss.qualcomm.com>
 <20261110-friendly-chipmunk-of-variation-eef4cd@quoll>
Content-Language: en-US
In-Reply-To: <20261110-friendly-chipmunk-of-variation-eef4cd@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0NSBTYWx0ZWRfXyCEgS5cglroJ
 K1xIXbM4HqY5nc7oWERxyPTUBiCu6zuEq/zvZ0pV14B9/nShyiKFWG9+MwVTrIDPaR1Hg+QKjIG
 LDlMgH7YK82EZt02a44QAB35alfRkyE=
X-Proofpoint-ORIG-GUID: 7eIt7b-GHtsLiXrGxh4ngcWBmv63WzPU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0NSBTYWx0ZWRfXy6xNQmvOPKMv
 cC18ZlQHBCpTvmyAVpAd1BydL3QrN3z801damT3HwCRirSqK6JH1fEwYRnAtatTYGVW2usKf1HU
 u+dnCdsH/m1jj9NhE1j6BYZUG4L4Rdps5+Qh3nK56NnVAgWIOJ+4PYgxoCwR+8i2UFSzAYUHi8m
 FSm9q9VFQUHuU95PlBnK79zNL+3g5EjBv0/4J8Pmg+nixvvbIOUqBBFg70nA7AYhAMZVE9DiqAU
 IeHxwfTcBf7r7tDCSYdTLTdOMWzLQQ59QevewvjAl3DSM9m5rdqRPvEiLE9sqdT/KH4jj3F4ukR
 fgyTehur/yrUQd5tl4kWVfDIAU72bDq9e+/+C5Xoed/YgcGjp2PHaFdqUaZKO5ISQIK/S1RMPdl
 fKaM9ZveHaYhZaHOCs7ITEp5tmnyY9/Vy7pkTW7dxYrl2RN+b7i+qaNtNmDv0vfNIBuSNdxd4eR
 waRf+SG9xWSbJoxLV/g==
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6af2ff2b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=FDn66hFibwGTVsjr8H0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 7eIt7b-GHtsLiXrGxh4ngcWBmv63WzPU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100045



On 10-11-2026 14:53, Krzysztof Kozlowski wrote:
> How could my tag go back in time?
> 
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Who received the tag and what was happening with this patchset in
> between?

You are right, the trailer ordering in v4 is wrong.

Your Reviewed-by was received on-list for v3 and carried forward to v4, but I
placed the collected trailers in the wrong order.

I will fix the tag history/order in the next version, and use b4 trailers -u
to collect trailers properly going forward.

Sorry for the confusion.

-- 
Regards,
Nihal Kumar Gupta

