Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772200;
	b=0KcyrShq9+M81IhPAbDOHXJWcYNqYJnIfyuz+xU15UWCfJYpdSjs9LUijZruUbvTm6U7
	 1LhLkUp6Ml88l6qBt+2NA4klKU8i7l77cyCyoydFOPLwLX+MP8BZu+InLuDnFpGsMTXc/
	 nQ/QiD7tG61kVn91oVsCp42PIdSFiRdYQhjTHO3q9ki2tiAHixgHw64/SHxUWLY+VbNv4
	 D8ZBbcXJEfkhmKN1DWvd6jnYz8ZUGj3NNqY/6UgVlTnWyJvRMHmm/JeFd0XZl9WUsOE5o
	 m1XF1GtnFlCe6nUwIWeZjLsallQ5af7Pbvwz/xxoaVAGtq03W7UvD6klsfRJ5VGHc8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772200;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xCYv2w/5BysKW2kccsXcVHwyXsZaG9BktG8t0e1CjWk=;
	b=clc5rOsP+fgqjNVqhjTzz31jrF6P+q4EAhqM77PfOV94LtozBHS8QSIwT4v4hNjSWwkt
	 mV23kB2y8h6ixSZ8alg9wixpQAdwO/kwFsrWr1v9crdiy7/R/5Qs96DxQgj6Egmg3QDhx
	 S+CUGkzsEx3GWxCJhx0ni770XOXNbO3/Ka74r99oFnO5S9cdq03oaTkirZrUlBvIGW1ak
	 U3yiazSEpkw2vo0XXlGbPzsMaFjAgFAj8JNV4Svk2P6rhsvf5VZnRbXHiYELKE2siFOxf
	 XagZ9II4/gUhp2pvFEgoe5WWdV+BuROKLBc9HoMfqkctxTInCsGcnNCS9s2mGv6kvOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eepVaFkO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jjk4lqsm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AF0606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63AF0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eepVaFkO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jjk4lqsm
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GiFc905651
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:36:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xCYv2w/5Bys
	KW2kccsXcVHwyXsZaG9BktG8t0e1CjWk=; b=eepVaFkOnyM83UTWIHlNgbUxcWG
	BajkL0lCb3KCqRsnLolSsnEx4/6q9o00bp/rAh5ifI/UMrVAw80iSJBQNKSF+Bb4
	zS4zqySl/tXHYsJ8FE1wVkhnaVHV0Q0J+Gp64blhnBaFQlEaCvbETJkdCQYqGAsy
	zGTXhavPSvQfRUUU2AYkHSEkTZWu/uIH5fconA+ZpXJKMLG364732+hSeSa7dq6p
	nZy1Dmd+ruEHXX4pYN30mBNS6DVnElgE9MJ37ZN3Vbt/uVErHEALQuKhmjJS1poc
	eZMJHc48I9PW7CbxHLLHiPJ4a1c/fKI1ozrCQc8oGQLc/cGH/lkGFgmDHtA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru39vy4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:36:38 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a064f294cbso5835427b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 01:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795772195; x=1796376995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xCYv2w/5BysKW2kccsXcVHwyXsZaG9BktG8t0e1CjWk=;
        b=jjk4lqsmdjW0BvlwFEoUMjJR9sikOhsmhuEkKgabTL/3OK2ZUeoAaWycmYK3qgEXVQ
         sAK6wT3YE0LPXwI54x/fdPHgTLnzeQv3oStnsqYT0Qm04WsBy5PYuQDM50yXfy+RyhyA
         7OVlCtm9jolmgha5EGVZspUdjnWgmN2Av65PK1/B2e09o2Kw5GtXJI+0goFeBqMFR3wo
         39jV8+YYAR+WGXddwc77JHNsWMJQB5LCbMZetTSO52cfCTVUXBjAc0xRyCwtqYjdZOhb
         IML8QvWlWzoXf1SXVVrWHp+RZ7UIUsgSJJbpzK/O4TsOmprIH102GSHSiUOhTKGseQdu
         nmtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772195; x=1796376995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xCYv2w/5BysKW2kccsXcVHwyXsZaG9BktG8t0e1CjWk=;
        b=hr+GTTQR8CvmsHMteatr8SkHSPe6ZrJ20nrSOSax3iq3zH3R7mtpH9pnnSKWDOdAI8
         Ylmiq7egJNSYbG2sapL71LcLBHzUMtaoyWf3MPZqmwjAv3nJnOpH4Vqs8E2N22LcbY8J
         gWRdoF9tldv+4ViHJWAkpCq4+8VIQVK768at3l7ZndbXiegNzSGV8MRvrVAVQnj4FVpW
         8zIvuW2HPk7WXGAxRCeT25RpPmJdpZyJQpeowrHSuzt2lui6POEsP4zH9jX4AmlYwikj
         SFRZJe5HF+RhLGnqyo6TVggq7BM1utACkECpkY06aU2OTng+1ONKaoMfFNW02rESmwHG
         yZQw==
X-Forwarded-Encrypted: i=1; AL+hErGvtV1XDM1NC//Pfk4gPS706LFFdC3yD1Q5HJ3BGkfozhYpb9oRCyLKl89p/LFtg/wQQCH/hAJKwAigUjC6@vger.kernel.org
X-Gm-Message-State: APuU4Z+rk5FTEbKPgFOqsJIM7QPeK3DbkwF0r5mhncLREB8Ww2j5gU2G
	LQLGshTYyG49PE19qqi9fpBLu84mPxo9LR2+sFU28HtQ9tSy0HjYrEXZysOJN5Y+ZnyjtGpKjRo
	fmWlgiO1YAM2ujC1ZzdllQanR8DlktEeT+cSNMdm5HZlMOuO8QKhVO4iJxuep4OL6B3BI
X-Gm-Gg: AZFdTZcMydqYbtnVcHnMYw5DthAw7yv2DUbz2FoOfpcP7Op92Mhaz42OUQVMBUyH7Lw
	vr9SeOPhdzMUOKnLD/SxLFIIGw+fiF9MUuSwlFIVEUtJFCIbbBM2++vy90loE9YxD71IF7yAr1N
	cCgf2IUU1EAJ06h6Jygmz7L94rShLKIfJRZoqA8NbkbtxIOwmMuhPOdExQ+0ugUTnZ3ZrDqKf82
	GYixVIlNjRu82HRyOOdNdmbGHoa/s12HgZxh1F7f3+F64Z7q9xKLs1D+lkXB1UNQeiYMn30A2HW
	X+BSWmh2XWZ9xT0f2kjzHi3jIhRzqNi2HZscZYBggfVnn1hS8ibfuLUXuq79YgOdGS0QdmfcJ5i
	J3lqUmu1u9yu/+MsQrtZBRON9dQHCyCQ/eQNUFX/FH4kMybHAMNZHo+ZNdhMNWtypQlwRhK6Ckz
	7ZOFdFXDB5uF9sQI+3FcK/GcoyoiZayHHAI3CmKAUfoDTbP3ZocBfvkXk=
X-Received: by 2002:a05:6a00:844:b0:88b:76e3:cd8a with SMTP id d2e1a72fcca58-8c87cb4bc4dmr23327026b3a.38.1795772195413;
        Fri, 27 Nov 2026 01:36:35 -0800 (PST)
X-Received: by 2002:a05:6a00:844:b0:88b:76e3:cd8a with SMTP id d2e1a72fcca58-8c87cb4bc4dmr23326998b3a.38.1795772194965;
        Fri, 27 Nov 2026 01:36:34 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873c1d71dsm12384340b3a.53.2026.11.27.01.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:36:34 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] pinctrl: qcom: Add Seca TLMM support
Date: Fri, 27 Nov 2026 15:06:27 +0530
Message-ID: <20261127093627.3292152-1-yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124115614.cqzo6ilr2shmzrxa@hu-mojha-hyd.qualcomm.com>
References: <cover.1795517583.git.yadu.mg@oss.qualcomm.com> <20261124115614.cqzo6ilr2shmzrxa@hu-mojha-hyd.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b094f26 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=RgwWSSqwODVOsrknLmAA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: LSOZXrInJR9XaRGY2CrfYsAYMxJuwoaS
X-Proofpoint-ORIG-GUID: LSOZXrInJR9XaRGY2CrfYsAYMxJuwoaS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX+Zcuiozb1xWr
 WqiomYH8IlvZdkolvRL5uDilveRA5ZO7y4jJ6t2SEfAF1tcI/bdFtp4dkh1P8ur4DNo/J12t39E
 wvmeA5Gww4RoBQxiFcMHVqLTwH++K2IPjgYFNewLbebKH1SS4iUQvlFO9dj/tIrWxRhZoLjxsM8
 5HAe8Yh1gl4okbZHUMHRY+Vto4m4Jj87JGKbIxq8SBdZSWaJtyMbaXr1ZV7dSjCuwRt12wlFOGi
 NxTYXCzmXHKLdNfCK5O4xTp37Pq9DmNtEsXPzeiwoHlnaTlHsBmpc9hsAlPVCv6rWEFcS7RQxET
 DjIej7eZluDeHxpmZ9PTFYGeSCtiMDT7iafFkSQjH4E9ZFZSuqlRdMmCad5wYyyu1LonWFvK+TS
 wL+lIIztQC6zQ+Sb6kIhD86BjVNY/8fQpCQxZKNgJhI2jZk8gqPj215Bzx/4f2YF51HD5kSVbht
 PHVfcw6ljFR86l2iu/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX4ksK7l4piQhD
 28dkoIJfZ/Je2beap7tT9hmV8tpq4YyJ6SgHA48ryOg1F3dUhbwJwa6xc7MEdOA6TdwGGW/RYRY
 JBVXpO0OvviB/PlnahiRkglnVVRvrgM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270038

On Tue, Nov 24, 2026 at 05:26:14PM +0530, Mukesh Ojha wrote:
> On Tue, Nov 24, 2026 at 04:23:01PM +0530, Yadu M G wrote:
> > Add the TLMM pin controller binding and driver for the Qualcomm Seca
> > automotive SoC.
>
> Where is the introduction of Seca ? what is  Seca..?

Seca is a Qualcomm automotive SoC. Its base device tree and the Seca
Ride reference board were posted separately:

https://lore.kernel.org/r/cover.1795517711.git.yadu.mg@oss.qualcomm.com

v2 will add a short introduction of the SoC to this cover letter and
link the DTS series, so the pinctrl series can be read on its own.

Yadu
