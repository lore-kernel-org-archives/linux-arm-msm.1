Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B1F4334CA
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 08:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425446; cv=none; b=DqtXIpZkj6JmLvgSwc+pWg1QYVok+SMLSuQq8rJwfy9ybGQZrmaGsQDODt372MRxCpe/57OcskRMNTwVfAbMe6FHlAPoNM0vNXJXRXV269LS8OyHHXd71ESdw/NscfvukobadeMDyqdM4qcTZRMvuPHuDhEVPqfxOL5m0N3NyVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425446; c=relaxed/simple;
	bh=yvRA6+RhpqKbBpG7vuhCaw8flA1Rlh5NgzfC5O25f+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=trVrmzeqMB4ihRzvGSXVke4yEsLh+g/fD8ldHCh6UnbExre1rTBtfqLRDj5RtAsA4gKpOBxSKS1pM6Ye0+JqMBKP0SFLAdFHVP/BVFDU6/S9ufgTq0UKhpur28TjRIQ0J1pFPIhtlBG6WBxhlaa761vgDAcVyRm3r941ZggN/i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nx9e6pA5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BnyiAw17; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nx9e6pA5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BnyiAw17"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6837Lt974124123
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 08:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	61ALK7PnCM34Vxnk/ZtnoDcsbGV97BxWP36hX11Z9IM=; b=Nx9e6pA5Lf9U0cjf
	02ESwiiizuR3tzGVYi1FxMJ3vSW7c95Z32Wk5jvxhM++h2xlKT8MciY8HqsDQS4D
	uMvbyvB5+dw1G2bDYO5w+q4u9cQL1tBh9muvPJV1WX2aGWL4MsyzIZqpnXKIvAFb
	Pd982xeucypNlYMW5fzturDSj5SAMzxPQbdUOch989M4XSuDqG8BMfaeVSqDIzOf
	VdVBldJvfPSPCexq77YCE/sNsIwh27y+SSM2xkoiNMN99287XZdekqgyRCMS/0ev
	ozxqPFgKmomtMxFp0q4vrGeby7S0pwLI4ST/IK/d7MkeJKCGq/iSubyOXWP4S+KX
	o3NvVA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekgb7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 08:50:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso51374385a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 01:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788425442; x=1789030242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=61ALK7PnCM34Vxnk/ZtnoDcsbGV97BxWP36hX11Z9IM=;
        b=BnyiAw17itWnuOEuyCXX3XBcXz5ZLrkW/V/ufuanpB1xl5Ok+H1wnx3SkGdo6+Lf9G
         2qaYdGEJD+lK0IKrVa2dOjjzkcbPWPJvZZBgPjzDdkkHbZNw+QH588iiMgWBcl6HPplA
         cXGtK7F4B6/E22pE8Q06MKXUxFC/5N78rcGuBJ3kSWFZLWiUtwdU1tL7zwh2YTvpJMYX
         Y26bi5Uvauo9LdapbBI+PEZM2tDiRqLsPeA5tkgiZ/V4He+vmYls7zs2iTh//5PWfSC7
         jJgVOhLorfElyHZjyg0f2LWMa5lVzIcTkmx51mfu2XhrRzLB3iGhlgb8FY3Yxis2bwei
         UvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788425442; x=1789030242;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=61ALK7PnCM34Vxnk/ZtnoDcsbGV97BxWP36hX11Z9IM=;
        b=CZA7pZ4JhBkl9Q1uBVZlZot6u+rlZwlpu10FecYONPx7cIPy+mQAcsxX7fC6SjgGq5
         DyK3J4QPockfwF76WEP5NSCyCmOc6dj9AshZ2ckpRjAk4pSOZ3VfxKVWb3kvv6lN4D2j
         A8nkAx9iqKNNC+9eYOHJyCyW/B2wa32/PzEOkIB/InzxrZLZ4qiNtoR21JtsvU2z9TOn
         3BCywBAS1372E3b6Zao+X/R84Gnt/twj0uYVEcyt45RpRtLm37MBwbgdpWSt0nTFMx7r
         Talf/cB/hA01nmyNU0juyLRlVLNo+v3E8rdIXEoLPS46DqCJz5JBVi0Z0SLdofwHY03k
         UxnA==
X-Forwarded-Encrypted: i=1; AKwUvBzNpmrAltL8KcteS3rSsgbUWVlySFDGz4s6FEekoApS/8mCz4gsnfS5tK/jg4Xvp/IqSwXQJNghTzJdFaoA@vger.kernel.org
X-Gm-Message-State: AFuF++kj8KSEVUhGHYU+js9Ek2VZ7/J+2ISr9kHqjL89C03Rl9ibQ9Mv
	4EOpf8uMIa+9BP6RJK8/eWqvARqWXU3Zydq4FsFIdHd7MRtdeZ3WxYSA2s8RGxRf2NSm8ljs4+n
	QExOyOLoX/n/hduEIizGnl20nPAu60WPS+bxd2rtFriVYsaJmVAFZlgRBowi9U95L33SQ
X-Gm-Gg: AYBFou2dwHdEQ8IiX7uMfiZZv9cuSBHTzc0XKzC+iZq11dyaR0DjXPMYi1SyvPBq/NA
	5hkFi6KS+Sag4ahIPIvsxgcO+pgo2h8SexbWLOxv2bxhHU5xzcYS3MV/mAegK59WXiiA0IWrSO+
	cUOH9xKW4wHuoE8YpcMGSABhMZEEsXSpLmJ4mWqAxq/G6SiG/r4gVcPk7ogJrYRXXZ9C2Ywxq8P
	gCMzaWhYxvvh4sA20ghSRghiXoTVqqr07Kr1fZjpbWKAmQ6Q+YISI4/ygnkmAZsKB7bXnQl6ahe
	OHOxXB9aG4Cfj94+Z8TlcdNphwgz1cnlYmEqJRd8AtwcDJUIYXe50JjYdEe0+QjQUK29Mtzb0FX
	uI0wwm9Q37ja2n03VS/DboQ==
X-Received: by 2002:a05:620a:2704:b0:939:288a:8a0c with SMTP id af79cd13be357-939610b5598mr738055485a.6.1788425437636;
        Thu, 03 Sep 2026 01:50:37 -0700 (PDT)
X-Received: by 2002:a05:620a:2704:b0:939:288a:8a0c with SMTP id af79cd13be357-939610b5598mr738043485a.6.1788425435305;
        Thu, 03 Sep 2026 01:50:35 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f41733b2sm67614866b.17.2026.09.03.01.50.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 01:50:34 -0700 (PDT)
Message-ID: <6ffd13db-1ca0-4497-9ad6-fdb65b001dbf@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 10:50:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: kaanapali: Add ADC support for
 Kaanapali boards
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>
References: <20260731-pmic5_gen4_adc-v1-0-9c49b2eea6f9@oss.qualcomm.com>
 <20260731-pmic5_gen4_adc-v1-7-9c49b2eea6f9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260731-pmic5_gen4_adc-v1-7-9c49b2eea6f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9QSMjII9PDGPuriUy0VVkmS_drHhUwF7
X-Proofpoint-GUID: 9QSMjII9PDGPuriUy0VVkmS_drHhUwF7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3NSBTYWx0ZWRfX+JgyJwgifmY2
 c+13HL6QzkMNeNebgmeDAw+Cgc6Bm7QEvr7DlB3BfpGP8f3ARK0zDn1o/mhR9Cmzagw9MfYAVtR
 38oXah2p2rn4vuPj7PxtJr6CFcICK56Mdc8qm2emccsMlmRqxMKGup7MTcDmxny0AeS4nMpTxov
 AgZvWIV9hxdKTMcdDdVDbuNgxvHt+PIayrR8g2YHIoEbLRtnW4NXh4SCJfwRiH6mYrqcQz/v3XK
 gUdo6D3042Q5cEzth4FOHt7e1w/TafgWuW1Yw6EFUAYP4NEQhpprYr75a66btWaHxfgxMSukS3B
 ppk4dInyr22ORdYJfVWMhhoXt5RW/P+xKVPpyJpItjOd6+9lwKoDNouWLBtoWckqRsnmBrYlPTH
 MFAUm1Ji7J8Xj4w+2+NA3u8dPZDo8yajMrgHh0SoeATeHjgXfWAipBwNge1Eqgkiu7ezO8U0W1Y
 YCEPhfVKQDjDkpJUUXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3NSBTYWx0ZWRfX720TPoGab71q
 YxRoRLda39voixtwtyLOXd9ACEaBRncLR8FjW5wR3Jhq3BpNf1jMMqVqAu9GjVYGNZhPMZz3bD2
 RkZfhsoVd5CYenxs/P7+oTPOcKXMyuk=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a9934e3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=T6yAfy7FHkEd-x0P2_YA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030075

On 7/31/26 8:06 PM, Jishnu Prakash wrote:
> Add the ADC channels under the PMK8850 ADC node for the
> other PMICS on the board with ADC peripherals. This includes
> die temperature and VPH power channels per PMIC and channels
> for available system thermistors.

[...]

> +		sys-0-thermal {

likewise - sys-n-thermal is unnecessarily cryptic

Konrad
