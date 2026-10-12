Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6074AA00D
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820321; cv=none; b=YDbFAoAZPoED12FiXW76p0AQQNDZ0OHyKuZa5AycFewnestzO16MJAy8CRYj4Rc9N9+HfC6nxrpoSD4Izn069pzkWg3+1PyGi9JIKNtVpLzZcFa5ijNfz7AskonxV9Q5EMyNmcXAi5JVx2uoS3TykzDF+SBJIqDbrB7OOg/OI00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820321; c=relaxed/simple;
	bh=Elu2DUvxB4cGcjtKZawr81rvYGJthLEYsYyNE8ZKy7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FjV+8OsIP5WRpJJqh3L9M8g+vPiMcKXN21h5P7lLH3cJ3l98iLC2Jah+W1CapnwvrNCIeQ6CctmOHjN+RewRoeJiVcqZyTrU8OfO8Btn0upAda5SQ8cJWH13h2efW9yfE3dDCznb73ZxK2K3pGpMaXcaD5xI7sjtpgkQwG3e004=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qx4i6RZ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RCNx92bt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qx4i6RZ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RCNx92bt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFf0V12175323
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xELYLGb0jnmIxIf4Qmyj9hiIBGQ7G+MrqGgWqyJ++Mo=; b=Qx4i6RZ79HWZOYdy
	R0MOhv+NPqSqbKq2UbrjXzyI9yIFQxS7UNB8jKDHLTdSqtz6+7hIO4Ud3UYwexWh
	ONG9kcwEgPjsE21CdqgWa7fbPLxugDYsXFx8DsXCP+Heu2pb4FEAGdcUhpnp7QfK
	ZHU6vhNJQlHZ37cIs3KHtZxN0REvS9Fz2YX99zq35WA681VipiUbJXnHXcw45Lv7
	ggOcQOFwsBl5rH1xNBPX+WTyv9tMC+KAOc0gaRJ2L35eqVqSPIdeHmKcPibPg0Pj
	7Gzfg2FqbhoMgDgEEC9ls/CrXrSgcqB2UGUhtJHK8AMziIgsTDvWW8njtgAIGCRU
	GPnwDg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc1k71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:51:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc50fb0d2so30796985a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791820318; x=1792425118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xELYLGb0jnmIxIf4Qmyj9hiIBGQ7G+MrqGgWqyJ++Mo=;
        b=RCNx92btv+oB75KQXM/rQZ9e558heBoE2PNh2T8t0heSGC3RPn+/dTsnhwlfI2qGzP
         vpKeF48OnfKqDFuj0seohoxrxzLdE3y1rdxS40cN9dsAKplhGRDu+HE4CE32rcCE+oH/
         QuP6q5odVdCecGsM14Zv3bUbxQCm6VcMioQx/JWyFzfYQBe8KjvOj/l5RZKfZH0CVAVy
         VS97J2m90MoiUVXfTfBkwzy/vnGrdhw9MNqF0Mrh0iUr8TZroQPK0AlJ8vAgev3VH4yh
         nIkni3sCmzFNA7eo/rftBVN7jbR/7BqBRXIzY4kx8hzKUxmsvqmJytmob9oQEf1WiadT
         Btyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820318; x=1792425118;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xELYLGb0jnmIxIf4Qmyj9hiIBGQ7G+MrqGgWqyJ++Mo=;
        b=MlfUjMwVTC43m/e3ktO4XH7UafXPEx80vl5Nf1x5fI4cSWwupK1dqwBCSPBNVGx+Oo
         YRb4DnZM4GslGfAs7axT2MOMoc/MmRxxb0EKNkVcIVO4s9PLIXmY1bBEFa/BsN8M46AZ
         tdSTt02HSNIBhSuw55QoVM7+efJh5wabymTE+ThJ4m9ov3LnkWur+5amL7E8APEs10Lp
         /LapQQ1dz0NJR7AZBOwVy7lLPHlAJNCaWxzbtCxS1fbzAnBx5MQBDEhFdbgB45dayzby
         50fqMa8yILHl7uKO033/COd4HRgDd4PYPVEYtndMHfAxwz8J8aL4M4SNaqfEizWsZpjt
         IrxA==
X-Forwarded-Encrypted: i=1; AKwUvBzvnknhogQvPK8wC99zIbmW8YHTuiz9Qrz5l43eiBRBiOLO0jvtongc31+p3YL/7vKiQMFYh7YaX4qmMjpY@vger.kernel.org
X-Gm-Message-State: AFq9FYI3c++RLKO45fiYSW/k9cv3uDFx9lXiwbB6x9b+uXVMmeD8ehpY
	V0eJJsavYQLHzA+Es4gIoBf7cWskpgelc0zpFCNYp2vTbPxPSk2EnYOMXlFKHxqsegQ2B9DQ4bo
	71aXIEicTUk+hmsS3cMV0FopJTUhQClSj88/HGcDY9KjHbq9EUp4feebiJviZ2PJtbY8Z
X-Gm-Gg: AYBFou1J2/fc93jk3glVrHKmDP52ZLpvz29u9mbfqxhV8I498+CiQow6pUsXF45gk+0
	ZKfmEeXDXW7iVpkBRjqDeku2gYF/NZFvWposdpt4sLIrS/bg81ap1Q5BtGZIB1O+kNoTt35IpAl
	/gzeqABaqwEfYCtrnrKBJptvqX7bmv8H2+rwcF5tzR/ou5izXEK1AyIorbJPHML6yRGm37Rnw4S
	l0ogW63uHIfFM4aZkmLR66bGGrIJlaBu4LX3Vz49OW8kEtTH5Xuwo9gho7QNAWqzIcgwOtSNXNu
	Rvv0/Ck4HnJlh+Z2Ut/dXvivPxXXQ3RbEn5dBnwF1h1LOD3olq8ZP9g3+GeCeVEVD9aV19xZz/M
	pWjMMVGmQwn4CVz0XX5R0Uw==
X-Received: by 2002:a05:620a:1a17:b0:93e:70cd:e420 with SMTP id af79cd13be357-93ebd2605bdmr1907370685a.5.1791820317794;
        Mon, 12 Oct 2026 08:51:57 -0700 (PDT)
X-Received: by 2002:a05:620a:1a17:b0:93e:70cd:e420 with SMTP id af79cd13be357-93ebd2605bdmr1907366485a.5.1791820317315;
        Mon, 12 Oct 2026 08:51:57 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3498276daasm160389366b.51.2026.10.12.08.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:51:56 -0700 (PDT)
Message-ID: <bbe1ca16-4f1d-44d9-a354-3319f3644d14@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:51:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 36/38] arm: dts: qcom: sdx55: Properly indent subnode
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <1a3594753ee5f823f9de863dad39bb508603860d.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1a3594753ee5f823f9de863dad39bb508603860d.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX8Nvap6UY5iUw
 uIF14ig+OTHbkzAWVfe1NUcL24kCxreRJCeQcYZw/rL8vRONqzhDZt2T1QgQ+dAuUdzwWvNUi5z
 UitSIhknj5hT0jbQgaCTwAE1ddBJlas=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfXyoNo2wN8KFj5
 i0nWaSMISoDKFhmMJoShupWTCKG46MChFnBC+YkUtK5NqcV0AP63TG9HovLTnf+IN3EXI2FWNBg
 F4/gxOW4LqvUsLg7WQTsB3icva1YMUZzGij6eMUna8HmXy3jqxqBHJ25g3ztNGmGy5RBp9qaM2T
 SS20VHFhvnqmRjJWg4Gk0sYXyu5ifzGniJTxq9jIEKYeiD2pwXQVHDye29+XrEIB3FLW0LdyvSF
 yfKcXrfH7vFwIln/vwhEj4zCv2W+aXgJLkDdqquL9nv0JC3KIbX97MG4ZgQ31gYb+qT9Yk2b/jo
 y+9HcpF4dxJwvdlPTJ9suqGP0yt+SwcD/TYf4yxUbPvW7x4qKFbzGamtnw2s6lP7sMxS1T2BjZQ
 zs59MwLpyWj55961XehpCnh56LajdpWBMoKO54xZUxq3x9/FNrsEqC8PmYMjlV7OPEuSWv1cq1i
 UMWgJZcT4A+skE2nY8A==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6acd021f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: b_7hn_-KwbT2kg8eVv1NX4rK-01LwfSf
X-Proofpoint-GUID: b_7hn_-KwbT2kg8eVv1NX4rK-01LwfSf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120063

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> Subnodes should be indented with tabs only. Found/fixed with
> dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
