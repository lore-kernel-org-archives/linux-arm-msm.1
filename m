Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705101;
	b=xyPoFeuQeBcgiV/AWmDd/U5A8jON2r2pgE6UKd/j0jCZLiLbWDUTwUSBafvLIU54i+Ii
	 vqEZSLd4q4x/pR8VADzSwGtxnl+urQS1a4lG8wEbaGVp6LT/LKshlz2o5NJiyP/ogvH7I
	 PB5tYX4lvjmM8PY9sowRlhy+tv5uFt7O5/LIxz8o8BpD78uKWjpQWo8Ao8F80b2fqD7zs
	 q/8sLBRN8xt3zHKxY6kqa9ObIZu4O5EtwZ3urnFldzZil0fWteS46qGr6TAGi9T70V3oL
	 Ksn6QnR11xsvHS84fSc/nmASJlRE8zfv58gROhy9yNAlzETzvhgOoitKewScEpwZ8ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705101;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iGMyTcAe2JPy7lK5xDkMwrISIdWLdzqB9J4ABUaidFI=;
	b=w1Hg/C7uDhPfoJ5A+qm1HQpRJCWchSbcxOlOsfGSzgJego/dGFCoIBAMdumHvrlhOZGv
	 S8mztpV1zX25wRuqZz0RfZM+GMDDTlSHYwC4YOKogWBHzZSHQGY9W6+zH+uryx8Kc5KIf
	 dhKh84HX2yahEcg3zqZQoTjA1gjjUGwoqvBvxI+mMRbZe5S1aLOTLKUQj7EauKbzkhN0B
	 sHdakdCxdOhVi/MR1QTbl7WSHZkr+1ZtL3v1DZZL7U+idiAuuFvt7F3Uv1HQAXjsF2tdh
	 u4X+zcj/mzs9mXeMI884i6Es7g1SN/ITGl37U0Z1zSRTP6wV8bFFl4eBrovziwZlz4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QwUTQ+xG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UuJBFhQC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89729606A337
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 11:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89729606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QwUTQ+xG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UuJBFhQC
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAVCQ1594201
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 11:24:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iGMyTcAe2JPy7lK5xDkMwrISIdWLdzqB9J4ABUaidFI=; b=QwUTQ+xG6Mwg3VW6
	5DKhYqOvR4Rc+lwaP7zzeye13XKtbpzK2TyJJc5x5f4hBi6CFwMSl7bWR1S3UrDj
	aAsjvyiGSLw8qw4DEsByU7eUZT55uyDiN120EsZ1+gdFc8yzQSpDPFu1O91SkwKz
	ILEHpdKjsyCYd8ENqmkYxA0SzvqIpTHrgHR3ZlNyh3UqvDe69A/P02E2x8lYcTQu
	izCxscBLt9cFUzhZCqTNG499POX0bEBoqYipqz9FqNpg/i0WkoijsijjizUZRANC
	vck7FSDSPVGplNzZnhHdroETs39nFOykljvOrBCnKNSZzE1wBuSAEeTy7GaKCs5/
	2l0OsA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq081uf7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 11:24:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c82e9d68fso10686726d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 03:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793705098; x=1794309898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iGMyTcAe2JPy7lK5xDkMwrISIdWLdzqB9J4ABUaidFI=;
        b=UuJBFhQCpIjXXz/StmHCVqqnT6KEsVdpYw3x6EiLNt5WiPOqP03aPy2V8qbfvpJQAx
         C4sdj14jpy0GxlTmfgVAJbEDK7Ly/aEOhObTQdvsmdVDFoJN10qzFJPdz51GF9d3PLEt
         EkbzXk7YVWl519QFNdRIE0N8HsvBM0DfIUuQTCexqGMPzDtF+TooEB2+bsZT1M+gPbtU
         7RX471BnyBG+D1dxGn5KmK+oY+ny2onUoufRwTpxpqRM7hR5QU4uHiXnKU5nmseyKRmE
         LQrEvRFa/6UB7ii8KwnGBFrsKICu/LU+nH79eD5PzKg7rdY3NfQFOKJv69eqeh2UNJwm
         M3fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705098; x=1794309898;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iGMyTcAe2JPy7lK5xDkMwrISIdWLdzqB9J4ABUaidFI=;
        b=UCkvt07zWoO3prL9+pezuDhwfQzReiMMTZhXbSNZPPu0Ybx1mAxQSBRNn4kbvGYwIo
         oZC1TJ1B+lREEBbuD6ZFWA6QDMb3ynhn4rlXL+IG89gSyS48mL69Wmd/CM9HG2h1hxll
         NmB94GYsDDjrh2UJLlQb4gNNk2LMiS2ejki/Xx/fZl7LLCMnHHnjP8iaK7IndX8x4Ncz
         sLrqFhiLJv9AhulQU36vTISI+HCahJV/ykrCVWBZRvPaH0Gj4p5p+GYnUkkDmXMyo/cB
         oSh3OQyMkJkit32j9rDy3RDcmsEGitoog2QELKwYSgQBAm4TavTKddtEZCsDFT+0nvyW
         x15w==
X-Gm-Message-State: APuU4Z+/nX188RaFZ49koULnmKLrADfVb7eCC1f/X/b6JEfDE3e//Z9i
	TAiLR6DfP8STDt1hh8MOy6qzf95yg4RUi6ONFNgapv0ZaOTw0R+Eghnd2+msgfHiPH5IDpV8ngv
	hSbCMdGglCOWdUuBKB4rwJ3TQ1h5bSnNOFHkMki3R5Ob57Q07vwA5otqHNQAxAEtvjy18
X-Gm-Gg: AYBFou2UqSGi+fN24dutQwFmZIfVp6LTO8QZTg3391smTN/SHF/eiTIMEBVHPXui+Tc
	c9he5BqQvtdjqmBSh1Ph2GirRmWPpianhkkChdZqcftWes/OiWDy0yeOCsYzVDN7QW+wQF1dYnK
	nwcFYAu7cMGMqg68XzX62Lb04b5zWMJB9/dmXP8OXZiYNgt7856I+Lrhe0YnNcPWHy7kI2J7S4X
	HclPpV1A3gmWHvhFTkcrISiZ1nhTIUG7h5GkNKP2qRlSH1WUDrOBG0DkKi+mguTrD7FPK51TnYF
	/MoeFJAyqj4RbRDzuWRyOsEgAwyKjH+mRLS/QaXfB77LhL4nuPkxrb5ywPmjW1j2MhbrHqN5U5A
	f7nZ19Hgym5AJzfRw9v5Qp3Lzp3ia6+qISdVfDN7ldCxXgOE3pT1V0ehw4QQ0xkNH78PyOw==
X-Received: by 2002:a05:620a:3c87:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-94421697192mr1942471485a.4.1793705098390;
        Tue, 03 Nov 2026 03:24:58 -0800 (PST)
X-Received: by 2002:a05:620a:3c87:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-94421697192mr1942469185a.4.1793705097997;
        Tue, 03 Nov 2026 03:24:57 -0800 (PST)
Received: from [192.168.226.81] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebefde4dsm75525666b.39.2026.11.03.03.24.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:24:56 -0800 (PST)
Message-ID: <7ace2198-61c0-43f9-806b-e97b32b36c18@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 12:24:54 +0100
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
Subject: Re: [PATCH v2 2/4] drm/msm: Add cleanup help for disabling IFPC
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Sean Paul
 <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261102190010.720443-1-robin.clark@oss.qualcomm.com>
 <20261102190010.720443-3-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102190010.720443-3-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfXytEkBOa9LQrY
 1rMr3NhMtIhOeGUbdRO0Hk0tUGJpOoSpaKBawZ7B4WM+ONTr5+/5q47f2+d+GuuG539fNbhE/6I
 tBh+FraNMomI4XFemp2ASfEjixkcahM=
X-Proofpoint-ORIG-GUID: bePLijVpMuQFfw473sIPzCkMqW9WC3ml
X-Authority-Analysis: v=2.4 cv=F73C5ahN c=1 sm=1 tr=0 ts=6ae9c48b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=cWb5AwZ_sP_0w0E8whcA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: bePLijVpMuQFfw473sIPzCkMqW9WC3ml
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfX00ZYqkOHjzRQ
 eepJ+Oy9PngathWoUArHAyQbFcV5BVQyLxEeM5tPVGemMbI41Cuay5HOVTTtdEmJGbRHU9AHxL9
 l6CvWETv9UGKSVaB2YXb3BdZA393ix1HBXEdx1amtjwIdr55zQLyAJQwYajUSiRt+xrmUuas89z
 90bS6Hh8rutqiShdGbeZYBkX4RdWZgZIGrcRkyI+iEbVGxri1zFznCJGdXWGhj8Kg7PuZEf7qLS
 dNIflzF3pve8ijk5z3Um26Sz/i5xzSwxUn2DRoxGW8Hmt0zStRKrTePZM1WSCKVK+Z0XDFDRSlj
 YpcNWgdL3tZe6CblAdZHvPlifgPecfkpIDY0MW8uyz4Svkm8Xt7VBaZgecQKmAdhZH0dcZ6yII2
 dd5KOLPYnhFIgWQYRNd9Ms2jC2sXN/W9VjMURKTaulA5dYSMBcDTMNEfvA3nuOgZRWLLol24Jfa
 VD5BofMFJA6nSwhrv8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030045

On 11/2/26 8:00 PM, Rob Clark wrote:
> Simplify error path cleanup for IFPC-disable critical sections.
> 
> Note that this moves where we re-enable IFPC until after the
> wake_up_all(), but that is harmless.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
