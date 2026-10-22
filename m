Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792657630;
	b=ZRxHBZDuR3Rhr45HdB8FsGZ9CGfhG8JIqRlA2DjF4jkhnl2aHkWJTAT5PtCE1E1QwPHT
	 KGGLj1fQU+3IG9Ae/5gx2NhicviRAgAv4cl2hafKC/sgPlWnh/l81GbfkMBdxQRjPYmtg
	 gHru3qfF2pRYXoaJPzk2qZkkhbHFlQUjbJmHu7y/ssGQd7pNhNRZDXX5IItX819N8ifee
	 4VRqX5AVhA6CZVKK0NdDWLMSAfipPrIOBXP1MfsBhoYKedMT8GHlwSYSC+EoTShriWm/i
	 f8d9PugcDlN4Mt5IYcyCgOS6u+u80Hl0KMGmsrO1hIeoa+ITl4KepS7uRrEeLcyZkEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657630;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fgqxS9x+QUp34QYI9MO5rz8NIdDGEyzpsmrDb5Pu9Ys=;
	b=LB4hVh+zsO8pkO2LDKECtdyqlCQWC+ulZ3qAyHMeT12ZX2JXa4Jqvmk38Kz1j35X5W8l
	 T4j866W5zJvegjAF4RsYViLi10HPDh4Y5qU1A9YsfGxejhfbLHuvQshkuAcgehfCcfMNT
	 CeepRgW7QKRFPS0L7exenaMFL7EHZSjwX6r4vrDyZrRRZlH9mlpVLNIDDYvPC6u8Y9Dpq
	 Y2FJ/K+o/6CHSQaWzV25C7RnbO5OUgPG+l1UmsCYNR+hlGJ85KjLHpSHZX+izGfz2n1xl
	 B83zpXBj9AMv/lxrts9sMz97VZaLrdUeTJetQWH2/IstvITC2/gnKnrbmMunQYYLrPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DbnG0unp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=apATCVoa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8571606A31A
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8571606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DbnG0unp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=apATCVoa
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M709ih1996049
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:27:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fgqxS9x+QUp34QYI9MO5rz8NIdDGEyzpsmrDb5Pu9Ys=; b=DbnG0unpk6sWpfqb
	IKvelYuVBi0BhugkYpcdHsRgZTKSLMa+LeObSiT/umhylgcTXscx8PZbPTwxgd4o
	e7x5J06rNzq1FGJHRy47TBHjyF9/9PD7nOrFIBgsWLmjsZSfMKiAjTV85sru1HYg
	rse1r0FdemHn6aWgtFbOH7it4YJY3givcAZuJ/RBtS8m9DLWp6mwjPcJ6ZufE5E9
	4+Hz9OIynMjXXSqX0v9rbgvF1qWGaYusRuSQ/c4yYpfhS3VpGz8xSIbb/9Y8teFx
	wVkLycmKEPIZkiMbY0nfaURhnbI6nxA6lumQQEGeviYasMcBkm9SpCuk2GNhXv2L
	LflWIw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bsdtu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:27:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cac495d99so29866685a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 01:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792657628; x=1793262428; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fgqxS9x+QUp34QYI9MO5rz8NIdDGEyzpsmrDb5Pu9Ys=;
        b=apATCVoaqScLP09u4VuOCOSRlqZP9FMCp89aT06cE4xge//ar39cLsAetCWgOqN8Th
         VrfJV56/Hae1Fn8l9CIEsp6Tbq557jDSwt+BNGHjPXVGraqdjALktSNm6jfPBRRCb8nf
         om9BGHNPQvMnALJ5jsRhhGZ17ufm2YBxoX3k5tk+wGvmUXyPiyv2AApclDVkB1lz8FEG
         OTd6zBJBml9TFGIKlSDSGPf7/seeyMY2iuSwsWCfvjVYWC9FkhHJvGyblUw/KmtTOCjk
         4ciNg7eiisylkvC4uqrjbwHQZI8BX9gW/OdK2jJ652rMoWpHjJrab/iOJW3DVRPtBA33
         /z7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792657628; x=1793262428;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fgqxS9x+QUp34QYI9MO5rz8NIdDGEyzpsmrDb5Pu9Ys=;
        b=NpYU8aE30XSFH8DrttxXSIGD9c5N40LLNi5YxGIneP10zTkkqBlaBVtWNAPLaKqNU5
         fiUED2OFNttS+KBJazmWmEXXe65qTsQfaTdWmBlIO2cH7XbgXvitBcTNGEPUDuciVZuq
         EkEBZG1bk919dITwjl96gahB1lAQRdmfqA+0OQbDoFJ6b1ylPQUP66j27souqRmXJhfz
         s9HBmbPQm/nWXGEUm0d+VqZIeDyerAIntjALXsk00rXvVDk+ZqloNoXKtEWlYN8DYAQ5
         ZxnWt/6WqrMQUFIXG9fG659rPpxpszWgYL2CXm7UQ58yP+voVj6gQQxlLnuO2x9x7FVE
         ulug==
X-Gm-Message-State: AFq9FYK7/ZSPt8vSJmriG/XMOsIim7UV2HgvzStgF5wjgOZD9JCRDbTl
	RFxZjLRZgEDQWz8K4Y3gR1f1vMoFuNlcwyP3iRuCW+J95hMpyfVh2bP9bb1Sk+vSAyWg9FEgT+3
	sHw2+S9FFKdEShWAE3CCrCTOC35zgUjn2R6+VLtSSgv18bj0QDBpMHQqXZ9wPFjBqeWBFvHJKGY
	Ju
X-Gm-Gg: AYBFou2yHOoYHDcQfikeqi3/QTOU4l4vyVj6a7H3Y2JcFnjpt4SubpOnPxYMmCpDY+M
	mPpbED8QPD8pPcXxHrikXea2atfMUkLf8w3JOCd+da1ByAwu6SR51EJVMRFCWa3xGyFuHVK6ain
	HKvPOnAYeNPzPsoKBCdX+lXJalBnAc4wsWSWAVvU/XxaqZRpJwR0ZVd3FQPq7l3J+dGLS9bGE0Q
	rcNhB8ey0m9ezkzYXhqF0z1jsj+swrpQUvy3A3L1t4iJ6ZCzfrTn3uXqpxVKrm85sUVqG70qBac
	tyXum+e1OrNp2syqcnY0vf1+l8dim19NJMufKu4vzr9X5qYIxZqzBOfRGhjivFwm5AbjraaOChU
	zr/Jie85sB6EuHqqH93RhNg==
X-Received: by 2002:a05:620a:45aa:b0:939:9205:4d78 with SMTP id af79cd13be357-93f57f96010mr971933185a.3.1792657627908;
        Thu, 22 Oct 2026 01:27:07 -0700 (PDT)
X-Received: by 2002:a05:620a:45aa:b0:939:9205:4d78 with SMTP id af79cd13be357-93f57f96010mr971929585a.3.1792657627400;
        Thu, 22 Oct 2026 01:27:07 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a61a2bcsm77995666b.87.2026.10.22.01.27.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:27:06 -0700 (PDT)
Message-ID: <1c8f4222-e7e3-4b10-8826-60de6dd89a61@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:27:03 +0200
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
Subject: Re: [PATCH v2 13/14] drm/msm/a8xx: Switch to generated protect regs
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
 <20261021204244.67160-14-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021204244.67160-14-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EFL-fstNO4iv7h1SLL_tAkxKk-uPl1tu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMyBTYWx0ZWRfX4ai1/rPJu04z
 9MhVX7EFnRte2eKI2S+W+6fuEL3y37vEfiZlKXwJc9Jog0qRr070zw+HWcoPdMCPqs20hDqXnxt
 bMrShKuSDOhpJxZuHfN5EmLAHi52sN4=
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ad9c8dc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=0S8MXAzXKKfm4D3irQ4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: EFL-fstNO4iv7h1SLL_tAkxKk-uPl1tu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMyBTYWx0ZWRfX6YL8c4jOuFuV
 EyLeUjvbeF6ucKh+TzfAoUYL8hN5+eQxthtcSrhmV3PGvnMIyv9j6nflszKoP4JcoACofGPLxt1
 uebdzveMMPYshkaTuJNx2a06eVRm2vO+kyyQJTrHDh/d2IzaCImkzrbjGTTJYySXHmFpkSuyAJF
 Sixns6X48YQ22xauNJ5eJ4UMTG+a0LTDWDIfwvbyyt/F0e7gjFI1NxD/I6SEO9QFIVSRW/DwyzJ
 QjIj6yhMZKzDRIocY4cVhQE0rHiPUWJlXiYT8WIbiEQOCaCmSTSL+4jhrT76dWMElZM8huT9HK+
 TwtpeUGXuFMq+ekAwB/QNsluL5E8a0Ss100NSC433hgi+X7V6kwy0d6XJcpjmyBYuS553yTiTUK
 ykATpgRfs6PMVzyMHsMUkjXQQ98xVp+hCwxwM5EzbPSrQQhr88hcXnILiMb4/8MFb0rh6U5IzGo
 WgCyUc6VT3coi+39i+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220033

On 10/21/26 10:41 PM, Rob Clark wrote:
> These also fix some perfcntr SEL regs which were mistakenly blocked
> since we previously just copied the protect tables from downstream kgsl
> (and only sometimes remembered to fix these).
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

LLM summary in case anyone is interested:

- Almost nothing carries over unchanged. Only 22–34 entries per GPU match exactly, out of 47–64 in each table.
- The generated tables use finer-grained ranges. For example, NORDWR 0x8600, 0x1ff becomes several smaller ranges (0x8600/0xf, 0x8700/0xf, 0x8740/0xbf, and so on).
- Several ranges that were RDONLY before are now NORDWR, or the other way round, and some change length. Some ranges appear only in the new tables, such as 0xd200/0x3ff and 0x20000–0x27810 on maili.
- The generated tables don't reproduce some old ranges exactly. 0xfc00/0x1fff and 0x3cc6/0x1fff, for example, are not in the new tables. I didn't check whether the new tables still protect that address space.
- count_max goes from 15 to 64 for x285, a840 and a850. The old 15 was already below the 47–57 entries those tables held. Patch 13 also adds BUILD_BUG_ON checks for all six protect tables. Before, only a810 and a830 were checked, so the old mismatch went unnoticed.

Also one robo-worry:

Unexpected: on hawi, GRAS_PERFCTR_TSEFE_SEL at 0x8610 is still
blocked, because the new NORDWR 0x8600, 0x10f entry covers it.

Konrad
