Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792992671;
	b=I4BrQK9KjS2btuP/s8GKcgE2xgDNIIhw1Cq3TS0In7wZwxKPjSslpMqxBEX7v3U5GrZl
	 fjvELz+4860e3YU5a/I3ujr+CndKaEP74A/eJbuS6n43/6rMPNrAQ2+vJbULoIG83RgFe
	 KeAq5j3sdqhYXY9OSiMQWMX5CI5Z+BZ/2Ys8A7k8obZyMMKKJH0KU05tqYO1SDfPI3yVK
	 1dSPVKNWZGzvDjo7kM5a8lzPdGeqYY4V4XIrUKdoVfaZGBInMMp+DkGuhK79ab+Kt+mTE
	 O4wn3+Dl66SDvkclGmwHNNNz7eDpib6yVVyVdXb8ZvgrSfRU6rWI+s+4LrQINxNCwyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792992671;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pWiYTS5xlZMJkO9ffGbPW6SlUMuEk+RahN2CrYFfdU8=;
	b=Q8CO+VaitBLm91nqS2pRlYnZRDXss0Xnf6bNKE7qQcwVseyW5gxpu/X3eHRttwzBWPJ8
	 /QxfKaFJ7pkGfBl1rD83hJ2s2UOCiu+okvRGsJQWwVQinrkzhX6HqUUCp6KJIfNaGrKBa
	 hUQiad1+28za3pqFpxv/U2Xry0Wy5w9d+WvB7vu2A4gwofTL/iWi/Sbb8WRPyKobNh+rD
	 IkzsB0CJQCLfDvfOdT5bGtynJVG6/RGDe29e3HE0iOMGwsh/Q2rH0hrdlepHPJpDLuPwj
	 5vMdpTE7WFmc09eK/19NTp1W7gK1HPayfRslv20ms7AE8D91CuL73C52JJl1IoRvj0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PKLEFtZ3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iWRsRuil;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA34606A31B
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BA34606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PKLEFtZ3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iWRsRuil
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b1822206176
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pWiYTS5xlZMJkO9ffGbPW6SlUMuEk+RahN2CrYFfdU8=; b=PKLEFtZ3m5ovf/FK
	FiMSaP+eiXFmhzCrPKaLjzAX0H5Tx3jcBhuuNeQFH7I6DQwxw6WUsAdQrpz0fads
	LQt8mip8M/jYaKXP44NZYvkSS67p17+vFnjbsF6UpToEh1OcVRjRMdiZ4hmLvoMj
	hLWexFGoDUWXyLWBjI+s9iRPLgVwf/0XufgOS4scare6NtemRj2NCYUfF6dabvrR
	GWIOfwfB7pntWVMPQsUWA2cPVj7nsQ6EijXoZPBWQZOjbb890yonUUVAWvM+OKTA
	xV2X81H2C5N0PB8g2BuIXcep/le4omOlFjDxF83QvzZ/QdPZncvq6g/cu66ng2p/
	kyRKCQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmrumvq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:31:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e942b1cc86so29392075ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 22:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792992669; x=1793597469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pWiYTS5xlZMJkO9ffGbPW6SlUMuEk+RahN2CrYFfdU8=;
        b=iWRsRuilFU0X2s4Py3ViXHhdw9EUmt/dEwtrzCEarvP9V1k9NsfUQSMKWCL1UO7or5
         VAu7k4UCMyZMTNOG2Dg6Y0hvT1PBUO5/QHODYHIQO7t0VO2dMRMKdHanqfNSwYOmxAA3
         EDSU6wqxH94CXStiqrnWWCgZOOpB3vHS9co3UrwWhwcnpb3ATjs112iImaq9jthEDo9l
         /0p6YfhvRL+qjCs4ZEuRxFcJzOiptph310KyvIdY9DVi7nqVlxCxEzwBMztxp0ADMde8
         kd2y7x5Z7FHjTT/ZMQgvXOdFuk7pt0NsGLQxHDzXZ2u9AHU9mbhdVUGeGIrS5vu1JWJz
         EEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792992669; x=1793597469;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pWiYTS5xlZMJkO9ffGbPW6SlUMuEk+RahN2CrYFfdU8=;
        b=jeEfErOr15H78eQErpV8o+rW9mm4RwIit9t9D+ePjz47QE5VBEdxY2uklx2QVFimML
         d1LO0XSIjoOrO+ykgCV7M9mBORHi26Cnx3WSOeDAO9FSA289X3hjz4f88y9hlTa3d2Vq
         FUykjyXJrhx6jyV8y0CEd9Bd2mXSrccNxuTA1CNS4SzzbYYEVfYmpbwa3s6mH7wV2vnp
         OBZGcohvwKVJ8k3/D75/AU+LVmJgywTVN8mEMP8j0P5/x58kkpNYdEjz2MW6GMEzrxmh
         I0T8f+FyIVxCVAQEcWJHRgVgjIHsyM6RRq6pcI7b4oWZAcorYgMOFvrX9qcnxASnYjmK
         5bUw==
X-Forwarded-Encrypted: i=1; AKwUvBwW912iGZ30DTpsFyKubrre+G6+tJuHSTKZD7x0y3n8h1obeFWshgZXN5wsoSrGxTuZmbiOLHHDp5rHDJ9e@vger.kernel.org
X-Gm-Message-State: AFq9FYJFhsjQZ/a0lL+wKC+sakNCE6E57sZlkV+N0Mopubj0Kgx0urdA
	GO1LTcrecf/YgVGG4ROww/NA9i0+2/noNVEz2YBjGmNVsNdGrUIZKvdNV7K7kojyjwv4hv5nJ38
	6J2PuptAJtpApPVarQgeOXbC+x88B94InLi8c5VH85hU9MgjWQV1ZmKgAlZ50fBQfFSFT
X-Gm-Gg: AYBFou28lKFZ0+kayxmbqCMYobKo3DwgA/1RxM9JsKw0j1U5ykZqlxkdL+esjBqDgeA
	dye53KktHUDFJA/HZWccNEDJ+4968T9CeAUDi/WY3itbeDWtx7lmOiNexIETBT3MLReAh+XRAKq
	x+kjleJRwxq8MoY9UjQCNFTyVqdY32+kNYo5k0VWpYpeq9MZm3wpWbFunGcHzYrhNaVWE7J5u3F
	jfryg6Czv5/FmqSZmMHI/4bN6O5tRm5JEDvgZ8FUoljBedeOVZFhdLqehrXdk0zQlt9VQeFjP3n
	Oo+dx5BWMY7kFdnqP9nEJj67MR22uKJAvgrIqNTCXsWBj3/muZ+M4ruO8AX2y2KkTVzsAMztj7E
	5NRCQpUwiZ9WSwb3KGQJUKhmvgV0zeg==
X-Received: by 2002:a17:903:2d1:b0:2e9:9522:ed3b with SMTP id d9443c01a7336-2ea9c84b245mr45565935ad.70.1792992669207;
        Sun, 25 Oct 2026 22:31:09 -0700 (PDT)
X-Received: by 2002:a17:903:2d1:b0:2e9:9522:ed3b with SMTP id d9443c01a7336-2ea9c84b245mr45565785ad.70.1792992668719;
        Sun, 25 Oct 2026 22:31:08 -0700 (PDT)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1dfee1sm11134745ad.64.2026.10.25.22.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 22:31:08 -0700 (PDT)
Message-ID: <5a761083-d031-4792-9471-93d013abc45b@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:01:03 +0530
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
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: lemans: Remove FastRPC compute
 CB9 entry
To: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@vger.kernel.org
References: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
 <20261023090308.2898683-2-abhinav.parihar@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261023090308.2898683-2-abhinav.parihar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyMSBTYWx0ZWRfX6Knwaid0xGla
 ADIyYCRr8FHwXQOlrRuK+xQLiF0/ffJ+6FPPIsINzSLZbxUgdONVOz9dpQJBbYu0o6usFl29hv0
 VgYtYu2rIXPG02pMWjSx6LfLR8xM/JbABr3Ynk7CSGin/Tqrr+Wpdmi+YyguBjOcpSCHIRtC/wb
 qTVVJ3ikOfVd2MJdrUVr6aNt3KpczGe6jvG4hBQh9MQHPBczXCGA7x+g1Tz3xY0wPpc0afdKyrw
 tK1FmXs9y46YRnsImtmAOMj/gGen2AUX/Kmss/FOK3wYK0EyvQ00iKdhw41SePJezkRXB4aWlZ7
 GOBpr1Kn/udqSjum+Jq5nIA0mJ7Ww5D7Nv7lv6w7AMcvrkBTJ7bvWngXrVjs50tauhsboGhdzc3
 QMOoHrz/l1WAx4qLuVowl1TjWlqF7iPZ0OJHqdoCy2JyVdwWRu8tpqp6SZXEtQanOGOCFW9rKwk
 xShh2OAv4tVbGF8nSjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyMSBTYWx0ZWRfXw0pr+NlkiO0P
 VwwFzbetN0eRO6BTCuxOhqVQoxL/k3tz+wbqkP7lb9VOG1yTQoSOVrY44hsamqtwnUrlGRO4x2C
 3I+MMeY/NsruzNNcfp4stpn87PxCbJk=
X-Proofpoint-ORIG-GUID: kmcMnghx9JOL8kdScOa5dlrTLTv-WTNb
X-Authority-Analysis: v=2.4 cv=e+aT2qp/ c=1 sm=1 tr=0 ts=6adee59e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fOTrkZ0PMPD3N0poT60A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: kmcMnghx9JOL8kdScOa5dlrTLTv-WTNb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260021

On 23-10-2026 14:33, Abhinav Parihar wrote:
> Remove the compute-cb@9 nodes from Lemans device tree to
> prevent clients from selecting a secure context bank for normal FastRPC
> workloads.
> 
> Secure use case support is not currently implemented upstream.
> 
> Fixes: f7b01bfb4b47 ("arm64: qcom: sa8775p: Add ADSP and CDSP0 fastrpc nodes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
