Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445231;
	b=Ey2uerYGVkuyCU9AREEUqfr8i6jnKAVI/6oAIkoHNAIv3GleKw+SG1EL8v1EWTNfW3T3
	 dVfbd0lilJ9FmjmyDDwtR0io4A2qC/T+0k5gbPByiojarlLtwMOSZ7+5DOedii0Xu0jXB
	 Y17adifmzS4LGMPq1X/dByf8R/50rVtdEUxI4O+AA9Z38PBLBtBnjvgSVhw3f8KBPpqsF
	 rNEVTDNLWB7UwiToqnSQiIFAJ9ih2Hn5z7qRMurs+W049RglxB+otwqkyzRKuTQtyYTv9
	 8Odh4BEH4D59dqBuXGE7Iv3V67dHylDynWATyVpEI3wnm5gzxl37ikHJh0Y/khVdW2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445231;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qASV5EJcsFYkTEgTYVe1aYx7dwh4PJgvJpGMmFQjtQM=;
	b=GZz1rzPZEzb3dfMFh+cvlP+2szWlhta5+hc20kyQZYAhCpYCxej5i8ptqfo57Io8HM3l
	 epvaSZ0jGGc673M4lMYIsMBrCxjDCmDzBgFt9z9U0rOZ11/ebKNb6uQkWhh2RLz0naz1K
	 GrBp75AMyLalq3WrItyqT6HZAnMVbkwKkjb/eAXgasOHAsa8yl4SkHXR7rwrN6TTNCpq1
	 yERRu+b9e07Y13Ec5IgeFGXZDja+KbZhS8NcgljLS/oEjKndLNvZOHVs7C8oexAHzl9zd
	 qRtj0QtjV2BtbY9VDlFGAFtD5GDDVmz+/Nva293iN5ayCbqsi8ZfA31Ur5ukcdokIUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Xvb/MKoo";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EFSDIjNX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631F3606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 631F3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xvb/MKoo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EFSDIjNX
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKvKH1974195
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qASV5EJcsFYkTEgTYVe1aYx7dwh4PJgvJpGMmFQjtQM=; b=Xvb/MKooYNv1VC3p
	k+KgrsFeqG6Xv6K4GvXIYSmfG1G6cCz/MJH6TiZddFnBpJnqkRSGczsC0nj/rQEa
	ci7nHZNwqff6i+UUOkT5U5mvwlbtqcK9qdFozkrsjQ+ECQVQJGkw7E3DPH6uaUEm
	Ti7GyA0fJsFFkO5b6reDx6U7chD5Qk+dvS6W5izS/9DImADS1PDYYIdUjGDpOIhM
	nDxiHQOBWMrw++gJEnxXfjxZdbsVWWxKd2FfXD31IznQIy9AUizj2HPoGelh2A7F
	u6ib6jM7zQrXrJqDlDeKJePbucYZ3O3EmMSsYiTJi2mlZG3lMnKOenGN3Yh90FE2
	ZCqkvA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7urtsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:47:10 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-313c7315becso284519eec.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795445229; x=1796050029; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qASV5EJcsFYkTEgTYVe1aYx7dwh4PJgvJpGMmFQjtQM=;
        b=EFSDIjNXkzU8AGYSFgVgWpOVI3LFh7nnQEi8G6ZgdjajzDZWTaBwTGIwOyrigK57MC
         yJjPDUjshHmmih2NTTF3ROMWHwUjZQigx7T6TTUYvSPX2kTw6GnMhOTkvwveUZgMlQl6
         udTMU5dMZ+hnM40hbcWvS8lJ9ivZ//DLy14425u8sq7lpbDiDGws9ir/8JGPwP+u5xwE
         DUmEP0QOgUt40v37aFNLgvXgcy9OBSBP3fI0xmysMOZ1F7/fWzxG5DwCbDdqpabIN5Ik
         EVAofaxBMB+48lL2Ou9eMbiLhp6nbwdVW0YbYrHWDVLtQUiHAhZzyG3QS2PkoHN4WL6Z
         ck5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445229; x=1796050029;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qASV5EJcsFYkTEgTYVe1aYx7dwh4PJgvJpGMmFQjtQM=;
        b=XNEMth1o76FgcDSCIbEQHJ1mpPF/VbRR0mN1X6rg0T+O6YE2lcXIWyRAyYa/FBOAaF
         9AswOe5Lk9l5MRZ6ccFt/cqEVTG35UW0xaEjoZpQTD1cc0OOoR74BNCsXroxMYFwkqxJ
         eSWKSxsr3DYYQp89iBpxpOZUwonlugP3TZ/6Blmyx3B8r6ccsicogtgA30S31Hq5+rTL
         XNawvVqfmU2T1fGu9ZOqYUuIz9BL0Z75V1QtaNKuEJsVR+2ChvNIU9OMe99f3KE5YBBu
         REQNu4Z1ElKJE4mC0UzoN4MwxvQtzrPMEcJBcz4N2G+yCxjbj2fYWzZ7xp936cgRHY7j
         OaKQ==
X-Gm-Message-State: APuU4Z9XuxJywo/Hw+2XUJU1GxvgjKA7an+gRqZJhiESfwoAc50ZDfOf
	jKeJ77A3l3MXyROHr8PhBF1UyM9GrqwfxJqGXMYfwqfAVtBDDycj3Rv3kvSwdC0u8BeO9cTLd61
	/5wCiRY8rYnWa2oj5rEx2TDy1w06DqAG49WPrmAyNi9Xjtxza03SjQkjPQvojPJCVsZG13t6xAS
	Jv
X-Gm-Gg: AZFdTZeO+VGmKQPtzhZEl0o51EJIKEC7uFhVxyCIO+jjrJx88JXwUOfNyuIXbuZ7sSb
	nGoBk5EibGwhV3Zssd+6raovqddy2f0PhzOBwP5FDEP1Mskgoa6TKCRlKx/P7Wo3NmPGcH9gAf5
	XwF2kecR5x+sbPWNZSb/jsAphC1+EnZQoGl2Z2wYNc0bm+Ez947YGA+luom7lV8Gs4TCh3BFO7I
	RJ1+Q2FNIFNvPfmIe3THM3lOhX3otb6fgd4i1wYIqWRcWaWn4G33Fm7YJt1DRq+S1oxeer5956G
	G4+dp7BGj3tZimdlSjK/ruyCmFU3dGg2VQhmaGpOK6XEBV+g4Xre6sSpU+byjVg/B5uYJAJgMd0
	wymNFnXPTiJLPrk11SlJo3iKY7z0awsm+DH8FG1B/LksV0xVqqmPd7Y2oBna2mvFkuTpp8Do=
X-Received: by 2002:a05:701b:450b:20b0:1b5:5a76:dfea with SMTP id a92af1059eb24-1b55a76e18emr15596911c88.0.1795445229274;
        Mon, 23 Nov 2026 06:47:09 -0800 (PST)
X-Received: by 2002:a05:701b:450b:20b0:1b5:5a76:dfea with SMTP id a92af1059eb24-1b55a76e18emr15596859c88.0.1795445228618;
        Mon, 23 Nov 2026 06:47:08 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cbb80sm5470868a12.9.2026.11.23.06.47.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:47:07 -0800 (PST)
Message-ID: <36450445-4ea2-4044-ba5e-09e894701fe6@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 15:47:05 +0100
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
Subject: Re: [PATCH v2 1/4] clk: qcom: Enable MSM8917 GCC by default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20261123-qcom-kconfig-unify-v2-0-fe56c8fd15bf@oss.qualcomm.com>
 <20261123-qcom-kconfig-unify-v2-1-fe56c8fd15bf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-qcom-kconfig-unify-v2-1-fe56c8fd15bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UUuDnsYFhplKKbs3f5v_x33WOKkaUOfa
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b0451ee cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Hix9-P7N-KviaBUsSn4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: UUuDnsYFhplKKbs3f5v_x33WOKkaUOfa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1OCBTYWx0ZWRfXyct2Xj6yumN5
 G7b23Q44rG7V9xP24cCM2yY564s3pNOfQX23XbgEsgcxELt0GTySFwAH8ceuoAC+k1F24uIdVp6
 tTCfgJsyu7g+T/iUh1LpouGDRXpsWnI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1OCBTYWx0ZWRfX2qrTHB7nMHr4
 NE4cK5T+2JCjKK2ij1ZOGUO5XiPv5WqdwED4hxx6UOKs3BXEb3hLDdUozx32g0nx6NGmikBwvPy
 u4tiy5G4MJ6CNeQREqI9d2xz5K7OQ5fCr8qnj2pGAqbo50SIfd2VN3zNwVcqlQXWdtQ66NQAj7t
 0U/xv4f0fH63ZPz5awcGEShYrxVbR594+73tw7GGhcsJeLk8mYT9gblV3U24BIlgFZ3irdIAadZ
 R28nWQ6lu5JdcaFVLlND/MLFM3ek4e1zSVR3FRxXg5av2cMd6LsY/tcuPjGskPLRxf6uTwSgU4H
 fpBO2jwrZV+K8CzIvQxqQOIUrEyUu+tAH0TONf7zracXa0UhtUFNuT/p1Wni3HZT27m05gBzW0q
 ji2pTfUVKQnMb0QAK7Df9y4BVZfafNTNN4h1yh2BWmNOdyV3HYBD/Tgl2ar/Jo9GW5H9AQN6xdo
 uXRVYnumKCo7KV0+AtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230058

On 11/23/26 8:38 AM, Krzysztof Kozlowski wrote:
> MSM8917 is an in-tree supported SoC, so its critical clock controller
> driver should be enabled by default.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
