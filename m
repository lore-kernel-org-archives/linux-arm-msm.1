Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706382;
	b=lxTO8Y8xwYLeZNFgU8EE7jrZj6fvdLc1zSSZeBX1ujVrrVnBw5tk20/goRIFIt7EDxIm
	 P9984NUjXfbe4k/yJcUkCa4CzeV18GjIDUk8pBJhBWeITFJ+zaLENzYDd/9MVfv4E+62W
	 8mtlDICYuFFT8l9ZFlZ8UXDC4tMGPoqhkwzyvZJLzpEK7oh1LbDSLzeKW+uAY85mBc0y4
	 mE+/xSocsQTOQtj0kv8nc0tbWg9Qb3noAH4NVngm+QzKxVXkWYbAr4KCWytMeNR5c2LYK
	 0wY5QWWlVgnnB/cruBcwyf4xz0JkI/r4t+1LhN9i/3a33Z2ga1LaWI7/0b7ftx53WDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706382;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=f6YLhLfLVjeLIqcNMr5RDQlxnH+G7D4G2SjsiKW56tI=;
	b=Vtt9IgGsxd9p5fKyW+NCfTIMNVbT1el7f47EM26FweuO2Lw9t6vtqCYgTQt9vg9XJlHF
	 TLKr0ixshaao5oA0MLZ9hv4QMQFa4JGCwK+BBmyVehWv9GmVenZoubDdJ7VMAN8Vqz+Ol
	 99+uQq/OG9DZruOCmYvA5VOhfWTF8QIVKNHw+ttMsJcHgTX47VAkg3msbrVs/yX35jTkB
	 NctkFKXYGEbZrw87Ow0A3HwcqHGzCH2uGTRhYaWidDCoQN6RTMwgRnS8Dy68Y01Exv31L
	 EAlaJ+6vrBLvnl2XCZN0pmX80/LhEubexLWSNZ68iGtcQn4YQhsxt4cmET5jBxnMhhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BK4TgPyU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i+YjImph;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D075606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 15:19:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D075606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BK4TgPyU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i+YjImph
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEVUU83864001
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 15:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f6YLhLfLVjeLIqcNMr5RDQlxnH+G7D4G2SjsiKW56tI=; b=BK4TgPyUKEgrkGSe
	cjfO92XyyZP48aQlTte+MaGUesyNPhaEwk7ZaDx2KEGdneRTe6sRNpebid2qa1Yz
	r/Oj7Mwrz4785tUFwSSU4yZBcZschjTNrclCBP2GZPIfPJmGZtq28fJrZ+RXPQv4
	I3iWgdXczX1687eCMp+GI4Jo8lp3hDp6nkjRYzWGTP3PjuIrmQt9SxM9/15bmHwn
	qYbeK+di1cPMBeGBwKyn8wLnxgiJOl8DEVOca6AyC4pe4ug9fGZUfie5iR/iKT4f
	Infz5fM2rvWvehlykjyMXWszZkNNaLwTps58iH2GcS3j+Sa1rzFwgpLULkW8knCn
	Ms6EZw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rhy3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 15:19:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93edac5877bso100672485a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795706380; x=1796311180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f6YLhLfLVjeLIqcNMr5RDQlxnH+G7D4G2SjsiKW56tI=;
        b=i+YjImphDk4NMaM+ye5KYB8v/bkDJxEtxUcCTCjRfwgGkksM9iXgpJFUR5imk5Q/zY
         Dmb9KOXQXIiRghQOJkRgZGdCl40lHvJHGK1BVYjGp5MhzljvgXIXVCIsueV0wfjfROqE
         81+6UaUUbmJomvG4OHtOTvLTYqb8o1cKXtj6KBdESDG/QPyN7HlgdZ24vzO4RW4IJLqh
         S5DG7wFBn87r3/kpIToP8fWNo7X7LPD7OekSEFmtifQJl5Vcn7puJ0tBoDoLHOpUt6Sx
         0ky+elJFY2boyhaJWOyWVQdsGnqHP/+BNoAsZQAKRWULVLzSp2W3pEX8sL8NFEfSL14g
         n52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706380; x=1796311180;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f6YLhLfLVjeLIqcNMr5RDQlxnH+G7D4G2SjsiKW56tI=;
        b=NJfWRKR6hDXzFj7vlqCiS8MOFsWWYdFqHYNDaOYW16zKRJLJMFimXct9w1qNoB7Lsb
         FEwclL2cWzHs1/++DrsOl3iDA6LSgKG9WQSOZU6y3P43UjLdYvVDiNVJUxdEYrg6ygOT
         h6gdU6lKdZUaIrj2+09V9PK4fSW1wvAd86+tAtRvoXINl8f//YzwxwfOprP/SPVrmBaO
         A80OeBPCEJDFK8+m5Qfb67vV9gusQgGhcyXoZx4Sy7Xrdpz243p6racPqG0MewqJb3O9
         g+7S7ozP+jFQA/Jet2BYAblzsltR0KwAd+G3ZIWmbbTVbRsP/IyidSR4izRMdEYjHdJm
         iYYA==
X-Gm-Message-State: APuU4Z8kxqCutuhZsA32yLC5FkZaQ6taN9K6q5K1rInq32s9Lu1q8F39
	2blM9ha5ua/6ZB+CYKBpObTwu+0vKUqNRpR4mRtcfaqpCZnoF2JrkoahtO51/tKQJpV89U9AFX6
	hr8JwmpIKVWRIg2roShWsWlXo8YZ/yWBGf7x6FKpwRQnEogZweie75nb+VUtD64fzy15P
X-Gm-Gg: AZFdTZdnY1rQzzHRh9QGU6mxeTyiqDWaBKFJG3kxoIcMykrGBMw3pw6qQlzTZYnTMq7
	89zjd0dW1ZfkZ10HKQlrFbj3MxR0Dq/9/UNlwvrPzpc8EUPUACvgRk0wEVrSkRKNajVqaGeEDmz
	E+305P5SetVRS1zD0cshRaLsp7wyLV3EK9xL0NYI9WWhn2n15ITHUbuZxR7u40g4LfxGjgdGTXI
	c839alAP/D2YEFLT+GYg6wP4qhgD8ZDfsm5rdrqnn9Zfs/spk7LjdPN1llG06wk2jutdY+r8CA0
	EBfegQCC04D5y7T6tU6y+XhUWZWJhltNo2PLXlhXUjpILqkeLaRdnA1Y4KKVXkIhljdWJDMO6Cy
	p9zJxzvm4+xYoIFSuZ2Y1GUH2+mgSN18WR1hC5a8Q6hh/2sGvyRT29mwzSQDJChpIDhFFtyo=
X-Received: by 2002:a05:620a:6f82:10b0:93f:1eb0:88bc with SMTP id af79cd13be357-949ba7fc843mr3538276085a.1.1795706380434;
        Thu, 26 Nov 2026 07:19:40 -0800 (PST)
X-Received: by 2002:a05:620a:6f82:10b0:93f:1eb0:88bc with SMTP id af79cd13be357-949ba7fc843mr3538269785a.1.1795706379937;
        Thu, 26 Nov 2026 07:19:39 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37108c8esm9867226a12.31.2026.11.26.07.19.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:19:38 -0800 (PST)
Message-ID: <c351c004-50a7-407c-acde-0ca1a615efa2@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:19:35 +0100
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
Subject: Re: [PATCH 3/3] drm/msm/a3xx: update the CP_ME_INIT data to msm-3.10
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261111-a3xx-fix-me-v1-0-d81f50f1ba1e@oss.qualcomm.com>
 <20261111-a3xx-fix-me-v1-3-d81f50f1ba1e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261111-a3xx-fix-me-v1-3-d81f50f1ba1e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OSBTYWx0ZWRfXxFUohqrkEwjd
 sJXkc1AhdDWSq5zgaH57fu/Eghbuf0n7Vgd+hPLaGSOdjqbXI902y87HmYCjUo5QFoksQNm5H64
 eIcA6DchUeyqFzFz8cQpLjUgdlIku6KDQToFd5Bfx4gVeKNQ+rXhSEU5gWlBZ4SRPQInd7RZ1pK
 qS34O2RCMoAcbq38CSVjXEB9HgdvsJLePbV6tARgcphObxMh+Mtwyaxnee5YU5v9O4rgaybOPss
 63tmM2Kw2I6kSLRt5FQtxgvnxtshkKH5thyyzoN+g0JwO5cTdVbGsO4GqXowktSg7wHbiXE6wNG
 Y3pmE6pM2Ubh5sUG7Eql0PGX7Pc3lWbc5b4VyWdyZMU3uth8319OouE1wkCKUb4ImalFp29DjIl
 mh8c2NgjzBviD7+G3VaN+tp5hQKrIC2AB+sBpdnIvURdeAMOZTFYi8mcdZ1pmVCH3muGr1QhMWg
 6WPRDMdvTs9BqeGY5hQ==
X-Proofpoint-GUID: SDEcjbjF2f7SIVLX36lPXd0bjgPQT_WX
X-Proofpoint-ORIG-GUID: SDEcjbjF2f7SIVLX36lPXd0bjgPQT_WX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OSBTYWx0ZWRfX4x49ZEfJ9cTr
 as+l936SF507EKXHF6YoFZKlFpjtSHekXjlcC/2gOVT3OwqHrmYYkwpJRmFAgSQXabwcPpT6jNo
 /RMFXpRyL5yHITJs2JLPpRARJEqLwUw=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b084e0d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=LkFtg0SWbGx8eehL8ZQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260059

On 11/11/26 2:05 PM, Dmitry Baryshkov wrote:
> Update the CP_ME_INIT payload to the values used by the msm-3.10 kgsl
> driver.
> 
> Fixes: 7198e6b03155 ("drm/msm: add a3xx gpu support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
