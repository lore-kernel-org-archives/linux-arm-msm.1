Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462955;
	b=5G+Soq6Dy9PUgrvdGocMz7EjWiKsMhBmfHcKF+fFznrGi4r9nmiX5ElrPOMEOiUmrPz0
	 9XTiP+sXdICJIN1IRHafPRWLwQVdTdzXP84bxufKHBOrLZ5sGJ2qiVGTw7kWiZgp7JGa1
	 94Eu4KFWoODXEi2Ijwg2FbtF71mG65X3PZd74uWpND0boL6E9QHhcc42huXHOQoMzkVOV
	 LeDEQkdC6LWN0MBLRaiQuhFEXaxLMOsRfRF0i02W2DmzVEw+7Bn3MRahAjzlFOb49hoUT
	 KSmcHV7dBPp0lIpNbxGOIBh8ceaiCqX73sd2s627nhUDFM31z/FBi5PG5uHNATfm36w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FcFkDguCD/ilInffZmCjUgAcHpkPgkVvkAaNeAEJ7sU=;
	b=Vg/3fQ6CaptT1nAzkb4OurNDOkjaf37RY12mHw21ZbaT5JIt3rZZvXAWJvbCv+0jJZYE
	 KspKoILSuAWmFmqJJWxJnyMEYnrIyMHPHE6VIReK0r/TUON6QAxQxKfX1yPiG5CUN8BSU
	 pDeIB+bL/XEuBXyqyZiG6XdgqwC4Pe40KOwjoPob4FrawDqPHUu/w5kvCOF5mya+G/mZK
	 I9GX2Zz+FVo90IiATF76+o62FAaB2KUN7YIHb4KoyFF93ruboo71xrvUUvr64rel1hFnX
	 6UZlKv/pmQqYJWJ6cuI3J5jBQQXM1ZSndzYK+p9vEIXAx8Zb24fcjYE8FD7+2uA1r7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jHD4ndNq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CNIqRFor;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E263606A326
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E263606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jHD4ndNq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CNIqRFor
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH9oI2377537
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:42:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FcFkDguCD/ilInffZmCjUgAc
	HpkPgkVvkAaNeAEJ7sU=; b=jHD4ndNqjnzEpOp7UspnMzN5/djWeqmgMuO5E9ho
	DLvkgeW4Dt6EABFF3O7vVtIUcdoVCjho2j362cFdBBbWcpiXdASJz/jJ5PGtw6Mj
	xndbTqmmmiCl3X8ZKTrvuMQFrad2NuNRcOkOnRI8k0WmaO6Rb/2x31Vw8pZ1o/U5
	hwlQApGnztlZ7nQBBb7LuV11IgUob9XhYF56Q6ZzflQ04tLdYXc85XxqY2zN31YS
	1agpdCiZsP7kgh8Uy2MXjNmEmpvXmCpM3iGIOnEsvmHtja0DT6IItDUC976Q/98G
	wZv+JGyxNvSiQZ2XKOug+BgkuPRxKqLDY3Xjm8N9adRg9w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7ut4pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:42:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so692760085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462953; x=1796067753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FcFkDguCD/ilInffZmCjUgAcHpkPgkVvkAaNeAEJ7sU=;
        b=CNIqRForyG48SMWcdmLVp4x/M11woHQsgCXYsfV20VuLwlJupVemYIZPh3f7PSI95Z
         JQpa3B/zxU3+KcwKwXuzSzlxLWGyQkaITl2qiB+KXo/IYRQX9Aa3eB8mIo6pbtJBsH1B
         XEib8KLRjSKMOUQYGPP3pATRiCoP/TAiC8WzDJldQNpveRIkNU9htr7u40+THbAGuXu+
         i8PfYB517gbQF94Z5W53q6046kHqXmALihVpQb1OCayFMbhLiSw59XX0nd0Kbx20OeUa
         IuJ9X96zJA5GCPwLnao1f4dwaDJNMUMRBK26HdONzw2Ix6b+kKly9NJsXVF20d3HmCtz
         lMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462953; x=1796067753;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FcFkDguCD/ilInffZmCjUgAcHpkPgkVvkAaNeAEJ7sU=;
        b=qhrlVTPZMAaOOPsdv0iakL0RJE4GkqmpE0KOnL1Mgr1u6jaw/ByfW6GvjvP16QiO89
         06cduksX19kXX+HT4vEenSYABWmsj7jYc4o3J/x/4uZVqCQBWI1qpcC6T9bZNZtK5BEQ
         p3vFDvCJctlmv69YunwqxBbUN3giYGjJS5VzOnOffiONsEJRT0hxuJrYSv0KWLLaEM32
         zxK4zsB0ko0F6yElTxxDyMvjZz0JD7dJNKi9fu7dUsyjldnHV7GHRbvQuau+9ouzohSE
         HQgng8be9UxqJ4mB2LiANTttGo1rJStqR11lsRJLIQLhs5//HCEYAZOcaD85ayb+VR0N
         9mhw==
X-Forwarded-Encrypted: i=1; AL+hErHYyyOZh7olcl0V3N0wQyehurPU0ObVTjhyvwBaSDdFXcQmWO8rbdv22MwqKkIfhM9Qj7iieEv5kN/EwA6o@vger.kernel.org
X-Gm-Message-State: APuU4Z824wX/Hfs6TnEvOFEkH5gbom8GMqDEPQ9DUXa7xWpLO79OpeQ1
	vbvkeXWetuhDluAEZ+AIgtU/ccqKP4qhrewbjmqy3gTlmjvXWF2VwFlI/XrgXXVv6QpCRF35Uz9
	qZtljnocA0XLG5ZyNXGKRiPbmDCE+9HHRCQDg1+UMzlHbHoPZAMwvZITTVwqze7/jrhlm
X-Gm-Gg: AZFdTZcHJke5bkQ91nSi/lVE0/2P/WQCopJtb5Q4yNi/Qs6Y6qWkZIJqZG1pup+rmp8
	lECUHmHcWThpF3H6ntMNvkeCG45TilND5dpn88HeijGvQo6l8+2xuwRrSHLM6nwxj7mSFLVoorh
	U8Kd3wJLRzzVsGzylqIy4fhvHuxRC3j7qVsdHKC7bjVXqlQgE2veurnLdfP1BNU6M0niPVaD0Xx
	13yaGXzpq8HxXmk/W7R/j8zRxSg3c05g9Ih7tgARVXsLeWkR3YnIDF9jCMPKviaRzqSp+P/q07J
	U5WQODfDr1wx4PhfXFTr/vwrqasT82klemhb0yorNGJTuF/H3nCh2NPgytCHsVQfWTFCvLh8Car
	bsB+zdVwvscXlo4OzNiCcgyxUU1HVjbewL83N749VtkPTgCEuhKf0Mu2bpWnPo5Sr
X-Received: by 2002:a05:620a:c42:b0:949:5c62:e77e with SMTP id af79cd13be357-949ba9c6de4mr2148823185a.14.1795462953110;
        Mon, 23 Nov 2026 11:42:33 -0800 (PST)
X-Received: by 2002:a05:620a:c42:b0:949:5c62:e77e with SMTP id af79cd13be357-949ba9c6de4mr2148815185a.14.1795462952408;
        Mon, 23 Nov 2026 11:42:32 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm374404505e9.7.2026.11.23.11.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:42:31 -0800 (PST)
Date: Mon, 23 Nov 2026 21:42:30 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v4 18/20] arm64: dts: qcom: milos: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <2qyauqpne4p3a63jtwvvsbeyulgitvjrqmdija6pjkgh67m6c6@a5qe6jfxerga>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-18-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-18-be30526391d9@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: gSVgkbfCsCyJrapiO6IvDg0JFxu466Po
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b049729 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=II2oZZyV4uo1nSvD-RkA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: gSVgkbfCsCyJrapiO6IvDg0JFxu466Po
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX4mcOcLzq2eIF
 CUSFJk9/A1hArCS8XH2QsbVmSUohhOXKtjBVzu8Jy2KISHfuVWhh1WJYFGHD71c4jElV2e35v0q
 RT99PIHXzgGTl04m6Vsoqd6+98IyrNg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX6axr/2MP+QSs
 X9OP6hdxLk+U3I1otCmjPWQF7lIeC5R89YoEGeCEW1oE8x1UmQryHKpjnecKzftr3rvmP3KZmm2
 JSleH0H/GhhnS1YVrUZs7Ob4GLYNy42KsWPLcZ3BZuflIymHxAaSt9XMkDzshIMCp0VIXMYnUzz
 HBi3GO6YO32L0ccuF4hAbKuUYUrZ001gUBZTUSbyP2dx1qBTITASLoaOUkhhoGDq+DAqMnECwob
 0fEqELi8g7H9NtC3sujPQuaYIhJ/ook2fbWjwGTuZAH0+/gFW97gDloai6mctM9UjLxOQp6wZ4m
 toE0xAqQf3dTJf5s3JJkBpRy0qqoQA+ZqLxb7Ln+twSUnQuOqkz4dh724Z3hjE+uZDMMNHxU1MS
 z+wAW+ZMkf0uURlq8AgHXatRClTz5Kt3GDl99NDZRxRaG/iCG9rC91CCVYrUQ7fiZWQBGaqhNDA
 W8K5e0IOelQOjxaPiVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:49, Bibek Kumar Patro wrote:
> On Milos the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
