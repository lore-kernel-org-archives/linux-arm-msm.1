Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667664718CB
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 11:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791891105; cv=none; b=MaP2aBCaOVYiQfTfAdWhqqYYg4TD9gpIs+tXAAvYhz9FQnaSNnaL9w/5AqTGe5hvdy2VPSfVQFFLqEQAgZmIJwjIThr8aWnw8BmPmCx6rizsiTca5MsA6ts0/giIFpzoJUQEZONePY+9UYbfWo2dytBVfcy07g94SvlMcs5QNYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791891105; c=relaxed/simple;
	bh=qdiKT4pmaWhY8cndNRhuiVjoc5hyS/Nji++DpODZTw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dVJrANUa3tub+U9AKgAT4x2EOgJQtWCsh4IIaMhYuURI2X5+2HfMm2kA3PH2l6UUOwgz1B+T1VY9BNnlZStOB5KLnn0hkRs/a6Stal691W2jDRTkzC7RX/r1Ln9V61EVl1L+b2P1iEkoFqRajhDoahKgphb262Wj3X45k9QmxJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iOXrDDKv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RtStyIuA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iOXrDDKv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RtStyIuA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8GQw83054805
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 11:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZeY3naUwVeFhdjZs9x4ilplnPc1XUctRVcxbOkAAhzs=; b=iOXrDDKvGjszz741
	c0L1h/prwDSdpeda1xijIxjPOy1L109J40TmW+JsGyyG59V2t0pXMv/eyvF9o7qJ
	QcsokoUjqPJA7BiCiaKqUNdG5Pcb4S8xzChg4NXZiECjUObta/vaA1JicgByd2z4
	FnfsLB40AM+nYwTt6Zbc+wshjFuWtKvZU+ZwZ5iAI2ZGLP0xGLQFYxKv9HU/SDAi
	vqSvi9U/GLLcU0gqRaEcJn1CtmSHsF6CC/qX2dBRfMB7SfY/6dFBSz2URQ5TaCJq
	zI8R363Iv8flZkVNdAaew6XkkbgW8yn0qE9pEXFKsJxs0H0wdfyIa/KhTII/iBo3
	wu6zSg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h93aev20x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 11:31:43 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5e926bd536fso892267e0c.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 04:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791891102; x=1792495902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZeY3naUwVeFhdjZs9x4ilplnPc1XUctRVcxbOkAAhzs=;
        b=RtStyIuAiZm2bcugeU5vgumyAtQojOUCey+tFiv4yhI7Zaf1cGwh+3WDuA8zFIKuVf
         Fj+iYQVZUOL+I0xhPN2g2rzSuD1RHqMEFZEsFclpzlJwnfktilJmXrdsNR92+RURBOey
         1U9pfZeHcE/Mgal3CjAeMKfALdA5tbLB/J8Zo3p6c5k/SJAGEwodbsqSOHrNENGnDYK1
         2SjTCr8ePmrbW0nidWApPMRSiI1JD4OtX8wcOdliIRszM3eSgafWmys6qbt5evxWI8/o
         /vGcotO/gH5clXTiMJHyYp4TVu/Cps/HcHZ+pYLDpYd8GdMEW/zRH5T9nZwf0m95A+aN
         nnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791891102; x=1792495902;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZeY3naUwVeFhdjZs9x4ilplnPc1XUctRVcxbOkAAhzs=;
        b=tFmKAltyQj2RTkd2lPgjIKG2cRrtc7q31Uz5xROY4FF2/wtrty26Xq7Ll8AI1A/uiM
         mcu2XdvB0Ok6qk73Kp20EcLthZWSf0WEwiAmT/IoOnx7ZK+dtDzpLikIHPVDk38MaTru
         Op7aM+YrfST8WBFyYg/HeKeVcEsTpMmakkeFxE3o3pAT+pNBQ5dh/yAdbbGfk0LhuzNs
         +1rSCn6k5tFz7vcSuyqDcuBdVPf8IkfdAzOgniSKNVX3mzTTBCaCGJ6BJwT1toxELq9U
         Hw4Wb//h4Juq5YgQD1De48oXQZ3axLpgeJ3g2+kc84rLEfdFKKagza0jKXvwWop/cIqg
         o/XQ==
X-Forwarded-Encrypted: i=1; AKwUvBxg89Z0QFFGJUEJdsvdQfQCXiKRkTGG0U7B7lvQG28DfJozMyo/ghIvmYJuN7I9WjGKuMpyynW2IEcOOKL8@vger.kernel.org
X-Gm-Message-State: AFq9FYIUCZ08ZrYJ8OWw6H08GkYxF2kJItGPRrl2h8SLm6zLBRs8qXjS
	IAqKgfXobdQgrs2bBMvJlqgdOZc2zhOknATL+o+yxConp9b4JMQhpY7g7cLulaL0sK9Alsvscbj
	rLuYbvS25mOe+s5PnX4uWSQ3DbiL5j/c2rd3K5j+lRkV/KoKvaLDQIkzsL7PvB1+z7CDuSyjU9U
	QT
X-Gm-Gg: AYBFou05rlUOJP9EVQ4ntN4x//spHTg2KaHaTEB4m6NOnzhGyqxa1PU8pVYgcPIKHkA
	nLigXLgyQCA9BI8Sq0F+x9kHabOzxu3iKgvEnDtE4PCehC/cHv05XB0Xxd2gL5BjoGlz/c50exW
	BshWQJmrJyBDmd9cOccA58mYZCPmQliWXR/QQV8FQHigr/bujQZKTbV1vdU1wEJTIyU4XbPyVwd
	cUFqB+0uf9MIsgDYRfk02rG0gk0Mxt+Dl47V1VvWN9RJzxz3wLAf1+va6LCVZ6zyIStWuLGsgF5
	cRpWj7z0r6oKg9qnCqG0MhuWE+uuPQ/Xw5Y0Qjo6nknmhfVIO/iLzIqvPDuEHYCcRhu5C1kllA5
	Goftp9g2ZDSu16ekisixixUih4oaLLjTBOIQalrk=
X-Received: by 2002:a05:6102:370c:b0:7b2:b159:98c3 with SMTP id ada2fe7eead31-7cb3739b2c4mr3084621137.28.1791891102437;
        Tue, 13 Oct 2026 04:31:42 -0700 (PDT)
X-Received: by 2002:a05:6102:370c:b0:7b2:b159:98c3 with SMTP id ada2fe7eead31-7cb3739b2c4mr3084619137.28.1791891101934;
        Tue, 13 Oct 2026 04:31:41 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f318c31sm132972505e9.3.2026.10.13.04.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 04:31:41 -0700 (PDT)
Message-ID: <e4da8a65-4743-4f39-9d31-2b9c5626b60b@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:31:38 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] media: qcom: camss: rebase fixes and SC7280
 enablement for the streams API
To: Hitesh Patel <hitesh@ebytelogic.com>, linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        ravi@ebytelogic.com
References: <20261013083306.1132036-1-hitesh@ebytelogic.com>
 <20261013094751.1503021-1-hitesh@ebytelogic.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261013094751.1503021-1-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: n2rGvygkHX3Gk2M03e9j9zhH_VTPafbt
X-Authority-Analysis: v=2.4 cv=JJuuIMKb c=1 sm=1 tr=0 ts=6ace169f cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=baXj_NEP-ELrwSMyPQUA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0NSBTYWx0ZWRfX3ufVyaF1E27L
 a2063MgyCqmLmPrtrmm+O0e3mZP1s/8378iXDj2ACv6PfLLTdOm6zrhADMXQ5ExWo5seEzv04vI
 bXSTu41G74knfkPxgPDoxV1zFZtXO/c=
X-Proofpoint-ORIG-GUID: n2rGvygkHX3Gk2M03e9j9zhH_VTPafbt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0NSBTYWx0ZWRfXzbd2ZGrnjtcS
 IVEqXKd+kQuXmPA8Ai9lggUNxwITQ8I81GhgDWFRchem0fL1C7zTgbfFPx0gVyMKtPh5zOteJLz
 fmHPgcIZdP3YX7j+U2QrNGEk+C77JrrzGdBC4R9gTACt9C6fwhAMyY95hcdvfTLZoYMboBwmsVi
 +vi0pBF6slsLs2HrTYxc4sDP9LQBN04Iiae0+sRhie3H8oN4yfNsx1iFAMIqcYqY+dQS7JI90t8
 FnWdNDmpgoVvVF0orKzwpaENWoq7MhzoiZFczAYgbC1F1x1F+PjuRlPfaMKE+tUzsBFGkPXioly
 dqQU78fZQMY78wkHPrvVXlTTrs55vUBLvvtUcB6uqhVtJOR1IWa8oiuQMF322ksDeCelCZGmKUY
 QqPqNbUdHx3Uck91tAsAa+egm3TN1US0fkJBmUVvfm19kHcFssaIubiybbrhxF3w4tdI9GFaA57
 THhktxvYZb5KlAYKcKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130045

Hi Hitesh,


On 10/13/2026 12:47 PM, Hitesh Patel wrote:
> The Media CI failure on this series is expected: it cannot apply to
> media-committers next, because it depends on a series that is not merged
> yet.
> 
>   [PATCH 0/8] media: qcom: camss: add V4L2 subdev streams API support
>   https://lore.kernel.org/r/20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com
> 
> 1/4 changes csid_streams_set_format(), which only exists once patch 4/8
> of that series is applied, so the first patch fails and the rest follow.
> 
> My apologies for the noise - earlier revisions carried base-commit and
> prerequisite-patch-id trailers precisely so the CI would not try to build
> this standalone, and I dropped them when I reposted as a series. For the
> record the base is next-20261009 with Gjorgji's eight patches applied on
> top, with 1/8 rebased as described in my reply on that thread.
> 
> Gjorgji has asked to fold these four into his v2, so they will most
> likely reach the CI through that series rather than on their own. If a v6
> is wanted for any other reason I will restore the trailers.

Thank you for your series, most probably next week i will have some time
to post the v2. As discussed will need help for verification from your side.

Regards,
~Gjorgji
