Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446923;
	b=OspK7k/ltOtfUMNx4nZSDFsLUNHi+PlRhzEa92J0kzzFKV8k4uR0AzM503vg3NzKZ9FZ
	 yLRyJtQL8PNNcmrarpD6yVzsvjlDqbJcCymKpDPOqp7TmI+sCQIdPrPbSzs6Jc+bwwxoI
	 NYo7GKsS0lA6f8+RM5/stw6IOVeZZPJM2R0bhf7p21fYvYqkDjF8Y/7v0OWu2Zp0VP9EL
	 LdeLgv82KJc022jzfp67cMfHJWJRjzcDGQWX0o3Kdzr6rWFUfOgk9etNYqEd+GiUJ2oPd
	 THbC5KJDNjGLV5OYNEYNbiKvtoBXQ2PV1pUYjlk3cQwZoUm03Bqwx3Z2BbjPK2zu/mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446923;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TyubDn+Ze5V5+6xDcRgigWXsNgQLDYZY+zwLnzFNAYM=;
	b=CfdDVrsQW39iJR7jf4RlhL1or2t5Zdg1on0zOBVhP74PhHF4lka0jCqj9l8c9OtXBWtg
	 +MdoN28wq88m2QT88rt4LHW6yZpclVzQPo1XPyF3BlRvieX62lw72dbsJlGykVwldOfKc
	 Gcxr86lR0CZdCbkVEfVrEWR9twW9yyQbhgnF2rd+/mMH6JUAKo2ecK7ANzehOoyYpPfrB
	 OstKbeUInK5p151/7AxZRBVWm++Yda4xI2La0F8YzI5C14+zZ1x5qzPBP5LhjoVL9yBQs
	 /65FuT/jWokuqEXueYE5Nsc+78dNa7APrqdWHvpxI+4O+mgzDG5uiWSI64rMumBFTsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UiQVUZX1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W0dsjeZV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC002606A330
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC002606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UiQVUZX1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W0dsjeZV
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDL5v63072636
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:15:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TyubDn+Ze5V5+6xDcRgigWXsNgQLDYZY+zwLnzFNAYM=; b=UiQVUZX1WE5gz8nr
	73DCiv9RJNkUWpfhPPg4J1ICoxnuwC1KDHLD/CEKY4l1n5WD8IPbDuAmSPsjxVSa
	8c4wHYJ368UFQI2eNKK3/mWH2hnwg1/CY0b8DtLEIRuxhJCdv0ac1G/g9WJVJo5Y
	n2Ax0Ru9487Y/EYF+zcVFAzNhybdEatA/BMIvOGcPsMQT7whKrkbOZsYmOLUzaGk
	ILCG6km/HOeP2D2GExaSzBXtIXmxpcPA23FM2iQ+9q5Hr41k0NjAD5QEsu9pSgkQ
	b/RI9+DBxy2Hc3zW610y5zshFdEC+R0FGGWAyDIt1uQ0LwR/IXVnkvZEYJd8TqQO
	KMFJTQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7smpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:15:21 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ee002e05f9so96799e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 07:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795446921; x=1796051721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TyubDn+Ze5V5+6xDcRgigWXsNgQLDYZY+zwLnzFNAYM=;
        b=W0dsjeZVyv9OC2Z/2kZaXKzsrpobCSZNQnRuL4genYAe93ZRZOrplj4kgMJkf4Ik40
         8OnOMIuDgrltCOYrswhgtXMDngN70ix/uEWsAdGZtvXk/7Moh97PXFt6IBHzyBEdFD5b
         r1SLvGk9njMFJx/ddvzg9fONASzqItM139UrN/HI7CvK8q8igLGTHfFkyTOfn15MdOII
         4V501ULywjDJVa/7xpEAdqPGiG+wanTvF4+KgOyvPMO0i2ElId+wXmb504wzP+V0Nz2U
         yHsSvtmwi9yE3fdfRMzPfZjXzjXTCwnmMzpd2nZ89zvUhgaYoS103sLFvasUK9dE95Ek
         5I+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446921; x=1796051721;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TyubDn+Ze5V5+6xDcRgigWXsNgQLDYZY+zwLnzFNAYM=;
        b=W6URpSqgO8C1Z8htCGWV5m8p4wanrR0mMXD+lTToSBMvVFdrGt5FiV1A+Bf5qPcTcg
         6ayNRKVpmq4J9cg185SJkgFItDYSWX60RDIV0uW1U918+7Tqqo5y+bV8cMg1zs1omPVH
         J8sC3veEexOdGK6FM7FNOj6VvXsHdUWHZaUL/OqME1bniVvLRAXuEQuriqosonS044wU
         RBzJesfXoNMe+6qyAbfwo564Xox9Bkmz4J5mcXenERbde35YtkqdMRf9QjOXGrr41mBm
         1dJHIlRrtY45yZ4/J0vCSEYLiXw3ltbdihVGX/d7bcOEjRHa9l1zdfQFWD5J37IiMMo9
         6XDQ==
X-Gm-Message-State: APuU4Z9mN9Hh30QH9phyRgTf439jQmFR4ZnPLgBGyoJEIVM6FsTx6NHA
	86Vvy/VfGMpRRcjLzi/iONvVo0E3FTnFUSjAhYsKF4xrYwaEBcuRf2+ROAOlHy1zc+ihaIjjzEA
	dQ4QTZawUNP00+sGrdyGFyWjZRTREcb31OOpMwpO2suL2dHoCI+Ut9lfwicVQJn23+PZx
X-Gm-Gg: AZFdTZe86L/w/bIznKzD/WrolzObv9FD57pyKtuaeQSzQgYECWRjZP6vxxvoQ6idSzD
	q+o4s23RrT8qZV+7tqoVIonbZbaM6JW8aeiAjUKFmeOuFdZHLtznzE3E+xkWF3QytBIhvLBZm9k
	VTZakQOQ6iZAVhXr/GRwiwn2+E3dqN7ghW9sssf8sKdpgcJ5LRCRaRGZ1Uarml99q4zrNdA8obb
	qstyXznyWXtxojLciLCbJshCj722tRDM6p21lfygRBRPBHoURI+HJqhz3wlfGbL79RGxj9R3d+V
	wDDWBU/zskVRf26yUboyUOb164qZlz2qLZW25Em8jgCf/YSktFBqQCgdEjQvg4RJ9fIGwYHLRjy
	baYzE6kk5Yn21RNsWRspWusXnKZNWDQVi7qC1mdBpAMLN5+ZpwplP9Y+fd1uyEXkmCwJJ944=
X-Received: by 2002:a05:6122:6107:b0:5ec:e6be:d626 with SMTP id 71dfb90a1353d-5ee8ae0f76bmr6761616e0c.2.1795446920971;
        Mon, 23 Nov 2026 07:15:20 -0800 (PST)
X-Received: by 2002:a05:6122:6107:b0:5ec:e6be:d626 with SMTP id 71dfb90a1353d-5ee8ae0f76bmr6761562e0c.2.1795446920454;
        Mon, 23 Nov 2026 07:15:20 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad026a4sm427533166b.2.2026.11.23.07.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:15:19 -0800 (PST)
Message-ID: <06cfb541-7c71-4046-baa5-c9e7c94ba1f1@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:15:18 +0100
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
Subject: Re: [PATCH 3/4] pinctrl: qcom: Consistently handle IPQ5018, MSM8953
 and others
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261122-b4-qcom-kconfig-unify-pinctrl-v1-0-f0068f161636@oss.qualcomm.com>
 <20261122-b4-qcom-kconfig-unify-pinctrl-v1-3-f0068f161636@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261122-b4-qcom-kconfig-unify-pinctrl-v1-3-f0068f161636@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b045889 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=H8iKfCz8fMhyOcouBNYA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfX/7VJ1/yKyfqT
 MRF+fZGL9jLRl+Y5Nq0pintV1gph7GeXCi6XfidJey50viDWX3KQjDIlSXD6nwOpu8qXR3Fn3EJ
 I+DEBJE/jzkuTsYqcsWgFqH5akxKTQOAHpZCr34IDIDOQe7tHajBd2hUJ8gRbDUbZv3l9OwG8Ax
 OAur6wgxuZJUuq+9/TWzimy0pKyTjFovI1zgD+94Nd3WUMeN5cjyv286AcoF+SKzyu5dsms4vrz
 CF7xeZX/+AmPFzFCvpoZaNT4mzLZefUgRUcj9W2fYJF1roxGydEcvA7w+8Uesu6vycJPx3rLS8u
 w/+c5nYo1X/AseQoUsrXhJ2oIMvy9PMGC45BCTQgJzz3xmNXHcoyWZf9LoacbcP0g0RQTcRwqra
 VfBwdlow1YJV/lyv3yEblaoOe503zLX9LeFdYcO95C64VCzVK9Do/on7BmYsVqgi/g6plBccMJQ
 ldY/SjFi/j+OpknGwMw==
X-Proofpoint-GUID: Eywfoqs1Cn7qPP5zx4qQJh7vnKe7GN7u
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfX+J+jVjCoTU1c
 aQQk2gMwaenKs12N9R9umfPODD4V286fH8NQGraNqWsUnOlnj0lv6BZFjlYZZof2Zy3c/zp+gQW
 BfTMV3Y718UjFII5/S3gayjFEiMNix8=
X-Proofpoint-ORIG-GUID: Eywfoqs1Cn7qPP5zx4qQJh7vnKe7GN7u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230060

On 11/22/26 2:34 PM, Krzysztof Kozlowski wrote:
> Other critical drivers, like clock and interconnect, for Qualcomm
> IPQ5018, MSM8953, MSM8976 MSM8994, MSM8996, MSM8998, QCS404 and SDX75
> are allowed for 32-bit ARM builds, so pin controller drivers should
> follow.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
