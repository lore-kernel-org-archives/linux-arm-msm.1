Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758638;
	b=eIvKVNLg8Ff9MF6ahdqNppUI1JaYvcP2MRKUwDkH5JKpTgYmY9hUu4rM1Is+dwCyY374
	 iJsAuq5kMecewGfd+7XIUORR2sRBXFbw0JFhkH7mkkXXnWk/Wi8w592cche0LwtYm/rIQ
	 x+UhmVJVVWhL6uzl/obf4Q3L5Z4t+wCOxs+XIVBKD/GcRY7ZnkwfQvbUKMb1El0zefE1S
	 pD2wxuWASXL/c3rcB/5DkA6o6mLGtNWHRl5tTFwhZ8LKb0NfY3IwNVtSZOUDhE7tUqsc8
	 PpoZkpZFOEPFiEIB64NdF47HMJRFtSzvpLg5UHe84OppssIyqw/+ooEnIIHdf/KlS3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758638;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QYbMFzbjxkJpVo9pkN7QoDDHfc5w+jmedxWWYnZ4x1w=;
	b=nCax6bUQYcw1gOuTQUMn3GfLcwZx0kC2A2ZgKDbjCXfC0MviMa38XQmMY9iCkPIsHhqB
	 Ot+Z4MfWEUm3SZNHeGrdz/eRzDeqSHRkTAFHxSNgKdeUWx5GJGW45x9ng02f1wzU36zFi
	 ouBTS2xKxv6em2WgPvcCOLvdxrGY6YGRom9XIW98q58lqPO7X68d2DkkUDaSMGqEbGnSV
	 n7xQG5jrdyygVGBR4VT6zWaJnL5uj+HH/hJtSu1lfNgVC3c0HXelZI3A9OtE9tSzHekTU
	 Uod2Q6ywSENJqq2es49wBE6S5GbaI8n1DNGWMp/O+woj2H57BU3565nqpBvVulc5HpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GefZOR9V;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Al0PgfCm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECDA606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 12:30:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CECDA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GefZOR9V;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Al0PgfCm
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAHNg1597391
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 12:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QYbMFzbjxkJpVo9pkN7QoDDHfc5w+jmedxWWYnZ4x1w=; b=GefZOR9VYvH6EOhK
	atAViuU3eAyJtLYqjxrnvK/kHFS9xm0xRy38tdeV9SmjWO82HyM2sLAtwvvr/jTQ
	QKCimYHiLijfvBm1OLiLSCYFitDdnqJikRP+r1glZQZv7qjCLJWLZ5PxVuplORpY
	9EBXnnbKshrXsd36Xis1oOUz+0lHtrRD+BfoRXFxbuzCyhUIKTuZ+AKAMp7WhBxJ
	3DSm3PHsLgFkryi8SOI4inXDAItovCBMBcZug+mlREalBL1EHrN2nrKAHkS/Yhnb
	f+7TEEkMvwqUpsdhjKQsfRzLC4iIJgfM1E7t8diF6e0DATCfrWF3pEaBJGXdymKz
	vw7xkw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms3mbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 12:30:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cac495d99so16008785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 05:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792758636; x=1793363436; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QYbMFzbjxkJpVo9pkN7QoDDHfc5w+jmedxWWYnZ4x1w=;
        b=Al0PgfCmiteEWZG2LKzj8/55fOg8sluCdF6VTZqVwCuKU5K9lLbNDemal8/2Lr4DaE
         a7nDBmXe7AZI1NTRh/2821g4sU7G9orb/mhLR4ssfnqJP2GyVuZcw+8q50PHNDjbs1dJ
         3r/x5NstOqtdRNEBvUHvf0nprsd351UI2TLEXzrJLownSgEeUJp14RPB2Y1vpeYNU/Dh
         H9DxF1cFqPeMkfy/U4XhULSpsotp19xfKkS5ChPBSmqYMnm9NhJFOCgW/c7fS/9Zy4y8
         k27ah1rAic2eUssKkz45BrmxYQCTPPtcK/GZ7zVhXW5bo1kJwshiz/5Amin7EVornZEo
         3Aqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792758636; x=1793363436;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QYbMFzbjxkJpVo9pkN7QoDDHfc5w+jmedxWWYnZ4x1w=;
        b=otB7ZizpSjd2n2gOmuAH/j/tD/zXaDUL1SZzXi3K4yTrXdKul4u5gFudofeZsGVTZn
         F1titLx3HtSEGm+kUQIs47ZoIPXLIJzTwBDE1+mfhI09XZh6avnjKuS/yaYHO9aMGfmA
         arRs6VQRvT7V4Tra2qWpMNqNhgrHR/wM8jL3cDnsHTu5X8z/tA0gDkLBe02ZJW8+QdhB
         d0IRvFiW/c053VYfZDtbrnQQiBKqpBnqQICn+aGf0uyMAO/1+orvenr9qsrIJ0M41rnl
         8AeT+yPmsyOKqnXahS2k0JbFdY29o09OETOdW2uTyIZCHtPwK0gzAQveGA/BMkBp1xBJ
         wBQg==
X-Gm-Message-State: AFq9FYKG498QphT92DB4BK3rxVs/486A4xZzdonVBi9W0+Mqe2wTmyZz
	GRRfLnN4m9bTzRBk8KTl0WAHBfKOVzboLgBVfwy0ZPxpH/dyMsTpvkBFGlu2+Dh/tgFYg9QQ1NZ
	vzwn67FwYKjQank4TXfK9NZGVSmO3GX93gj7rqn/gIZQONZu504vmi48rVWnv3GENX9U/
X-Gm-Gg: AYBFou18BAFd5oB8gVphASa0GS8iDltPdMrNS/jG48L7WBfxLdm3SlrPXErF5HvFzPJ
	1RmRup3V5OUb78GPM6hkL/vlkOPyz41ub35ZwjHwBh3FYNZUfrJusJSkFwDQDaaM155dV8pTTVl
	RxIlVPMgzeYktF4QTQeYdhBVvT4oSyCYadAAp4B5KOVfEqL4gvlrDeM/xahJATJ9dSw8spEDRHO
	UYxcES48An5FWj7SkPeK1u/pebhgoyFLLi0R+62689KtCiveA7czKr/myLryC8DodU2zDH30WJu
	1s0Prhto1hI3EKi6T1sr/HGOZDqXPKXXRFFFi/8mbS6X2qNp5+CApVq199+1bCBbBlHulfiZ70Z
	4eGuPLCKp6uWphF47JYqHGg==
X-Received: by 2002:a05:620a:a184:20b0:93f:1eb0:88bc with SMTP id af79cd13be357-93f6f7a8441mr365716685a.1.1792758635947;
        Fri, 23 Oct 2026 05:30:35 -0700 (PDT)
X-Received: by 2002:a05:620a:a184:20b0:93f:1eb0:88bc with SMTP id af79cd13be357-93f6f7a8441mr365706885a.1.1792758635248;
        Fri, 23 Oct 2026 05:30:35 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5d17e95sm97254166b.83.2026.10.23.05.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 05:30:34 -0700 (PDT)
Message-ID: <ea77837c-0a64-4705-bd8d-946a0a03f16f@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 14:30:31 +0200
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
Subject: Re: [PATCH 1/3] arm64: dts: qcom: lemans: fix iommus SID mask for
 ethernet nodes
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20261023-sa8255p-emac-dts-v1-0-a34d778ce9ac@oss.qualcomm.com>
 <20261023-sa8255p-emac-dts-v1-1-a34d778ce9ac@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023-sa8255p-emac-dts-v1-1-a34d778ce9ac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0OCBTYWx0ZWRfX0QTjxnhgsirA
 oscKx+XgmXnv2phuod/yd3sCSO4EPT4tNi2wXUhjyxDD5Ik/7uKxtRh6S3VI9P1yOkYdD0aH2V3
 oHcQm/rjpX/CIQeEYMZpCcUiFNrncejuUcb80mKPFaYcZCR1e+DWcf84cPn+I29zpfcDtF+1kFj
 3h3socwFaq1gAaK8SpiMShnmcTFsgHfH7cwIuhTYHhTHuZ9A/w6g/FoVOyGQc9uDRtWp8hMhmvA
 z/n+gnd6qByACBagbVbzvzSe/2aw6jLiWLvV29f9Yc23+awgXCiwnyVpq6zkvnxTP5Tb6ke3Npx
 2q4m8QzQWysQMr/HDMm4QEfrpP626E/jJ3jV9cyAH0dnWiBi1XgDEtwngoErcw5YcidWV4TYBZw
 2WHOzD0Oyu//x8BBG1WLqSexawpKrdiJNrhhd9G+Vp+9FBOhSRds7pMcw2EAinXnHpXlQGMw6gn
 hbRpk1F2qmouqNhfL7Q==
X-Proofpoint-GUID: gdAAMAICs8uYaWbTGDDC8ejgRsbYCy1N
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0OCBTYWx0ZWRfX+N5E2x72H2KB
 +iu9BYpqn8yJUOB3KfrcjV53R8gMZfyJIyy5m+XYrRzQSgjeODBId8nVkzeijCwem/B/srYF2YU
 vopJ8DrVwrn4h1j0r089hAvrKAjXFhw=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb536d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=MNZHkl_XmBfbRSJpkuMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: gdAAMAICs8uYaWbTGDDC8ejgRsbYCy1N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230048

On 10/23/26 11:02 AM, Bartosz Golaszewski wrote:
> The iommus mask for ethernet nodes is wrong, it makes the SMMU mask 16
> stream IDs per MAC. We should actually only use 8 SIDs. This has
> triggered a crash on sa8255p after a boot firmware update. Use the
> correct value of 0x7.
> 
> Fixes: e952348a7cc7 ("arm64: dts: qcom: sa8775p: add a node for EMAC1")
> Fixes: ff499a0fbb23 ("arm64: dts: qcom: sa8775p: add the first 1Gb ethernet interface")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
