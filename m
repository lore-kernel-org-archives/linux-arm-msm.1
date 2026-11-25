Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603842;
	b=AblumjKZ49SSHKRpCiYewe+SemQCqfhQIdP4TO+rf+/t154j+t6Y/+/sqhhw3Te3LwUp
	 z4op6IyCZqwKYzn3ev37c5iWp+G4NesiQfn1WMIvmjdbwtDev5wXav20IOWL67LRvCv/k
	 nwTnPgZFQBVLRmtsm7ph1KIvL4XfbCis+5WugskwA+Fou4iRwBG1FNI1Ag0PQKEfbfRyK
	 sqMChw/v1SvvhpfMYPt9xfWD6MG+Q0UKYtUwW4sy5KiPfuVU8YMv+yfqzDV3t6mmn9nKk
	 qBLxUaeZ0WuQh6VKA2xjImx3AZfGP1OpsZFM4QJD+e3OwbK+rc4jx+FH1L/eq5oWkhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603842;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BkcA3UBi3z2Vo2rswGT3gpDM+Y0XNTnsc/3KgQ5NX68=;
	b=UMvylDppWfg+FTz9mb5Y2wDBT60uIN2T142QnXCrMCprU5L2GsOIt3dPv99GHWQ92Z1r
	 QhN4x0X3ohmJmUpu/HYKjdhhYnmBmPayBb1YRJD1cfdVSBgrPTPwq4+zXf5oTmbWoSVYt
	 rCa76fj+nr5UpzcVA431okefXX3BYQG9HgbOQLXyRqjEoQ/6TgDDzb19lNmWSzfe0699q
	 a3W7936/TsOHijKDqiF3a+1Bktg2vnyVUmi02ZxN3wYkKXAPHb7gIfS3y2MhcrD4NDZf5
	 3SVj339ibAwpwbGcgdTAIPy9l8kt46yYWCSkRx4YlYXAeo+C9BiucKYBQGGT6W2Kfjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NvewqBbt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xja69JoJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE61606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AE61606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NvewqBbt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xja69JoJ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mQVb3764050
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BkcA3UBi3z2Vo2rswGT3gpDM+Y0XNTnsc/3KgQ5NX68=; b=NvewqBbtFskKavjM
	uKNcqk1XCmGCgo1JU7Ag1oqkOAK+IHlslEo3KpW9GwEp0jR0gQ356zTk/PRhD0ig
	QjZyShjo00Bx7fx2yhQjKUEq/6xRcYx12EMfaOuGBnmCV5zo5UxpOqWV2KMrTCmp
	gLWYN21XGuZvYH9kz/L5wwgvOVlgYE4rYjcJGvYhOZDumCC1UF7x4gPv+6Tkg+Hx
	CFrFxyfi9xvSseZ8qxkZtpJReS2oIzGkHUPcysMO72kixvzlNIo0HUtZ4ddF4O84
	zrhGqcxck5/+3L9aQ6ecBjmLcmIuLcXTLAAB9caxCMuYvJvjGZJHbIDqTnkgxdtv
	hq9A0w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vv2rdq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:50:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55b9c41fc3cso16938001cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 02:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603841; x=1796208641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BkcA3UBi3z2Vo2rswGT3gpDM+Y0XNTnsc/3KgQ5NX68=;
        b=Xja69JoJoOnHbdyv6K9Hz/Wlw1JVkkRJq4UISAWMEl2YZvVpciidb4iivuLmHeuX3a
         PJPQvLi7whM7so5KxxPAcMxtZDD8dlfPee/wYHs3ld4oJD5J25A8kwsRKTFzY/VH1q+Q
         I0uWobOqZzHF+eMR25YIo2ALgN/BXm98yUeLcpfsP3MQ44UEJkRA++d65HvgytmrzHMW
         BkDUS4EDmB7DlyD5zO9gzA0+crsp9d/r8lxv0gMwq5wpdzBU7+IjhwcBI+IU6G0C9BTI
         soFv+KSZtWUGFnCJvcxaylYFVZHdXT6bUWYPiZYepdPiW8Fwn4qP7GYWE/6xom1bN5dh
         lZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603841; x=1796208641;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BkcA3UBi3z2Vo2rswGT3gpDM+Y0XNTnsc/3KgQ5NX68=;
        b=xTmEqw056hRZ/Jk0+ECYt3TivMQv147ZhKoclsK2i6FNNF9ZziMXykIvfbusY1W7cz
         sVCQO8LbXDMdl/39PKcQ2O2yiLYBqBOvD4rD+GmUpGH53NA1OhpsBnIC0yUkxhNmd6qb
         b9DbNjO5Xe1Xa2YAJz5NqmQg7foosJezU38pxUnEwGC+YBymahsVmmmlyExthKQBgDss
         4hOMdFP3eTPPvKYwIRD7c3SQuU8r07gXlELIv/jsoz6Ftyg7v6CIYTxrMERLn825oFwM
         nnHlvRLQRkeLC6T/I/0gBIbQARrf7PS1wmLoXhd4mysYH4cgJxNWyrnoxbYiBhMk9HV4
         uHlQ==
X-Gm-Message-State: APuU4Z+lFP9Nqb+N9hwTjnHzkdr4oCK5oTLvURHMHU3GaenoHNs69Alq
	Q4PRzG9oE48mO9s0Y7nqPZilhHLCoEqRxjXbG7I5o2cst69BrcfJHfBBRmmh8UYmrsqybyNkJha
	IHPUNIrHMZQDBLIU/pqJKPbFgRSRK8GTXd8UcM8mSUOou/UZs/18tCOKUpoHjVVEzDaOw
X-Gm-Gg: AZFdTZeiquTycdPlGmu1frdGlfOhNnHnMpzzj/x5TLkw4+lazqKF5zRPLANEKwMstH8
	l1tUmhjayOC6B9R9canPDnEw0ernyw5IcVNxRjz99KIdp6AETvuIm3rnG9MFZFIlSh8XaKTvS4w
	h3pX3pcM19Ng/+6RZLaDj8WmO/WONhlrE6SfpbxmfBtdD3F2PxxRhYHtiz2JLmzQQIkuavX/xrt
	kiWwujOoOju8OIkg0pwspvmXkO+tnLwMNTWfeYPwKkAovIGrZpfMy3nuOQamcN6sIXqNgfEM727
	BcxWfgK0FDgerq8PimlfK6YQyEsRlp+PRBMFjEMa1ioY/d9PgV9b32qLT4KQDaxiE2yCUcQ0/yV
	dyXVVMOKwLwIUpe1/Dm39ZSjnpU9ZCspwovPot1gAbIhYePKLA3Z0XuTSFv3lmksDDnX4938=
X-Received: by 2002:a05:622b:1ca:20b0:55c:2657:9cb8 with SMTP id d75a77b69052e-55d76b1a306mr308079641cf.5.1795603840548;
        Wed, 25 Nov 2026 02:50:40 -0800 (PST)
X-Received: by 2002:a05:622b:1ca:20b0:55c:2657:9cb8 with SMTP id d75a77b69052e-55d76b1a306mr308079171cf.5.1795603839996;
        Wed, 25 Nov 2026 02:50:39 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea31e4sm624414666b.39.2026.11.25.02.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:50:39 -0800 (PST)
Message-ID: <115a7167-d9cb-4a5f-934a-2da3974f1ade@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:50:37 +0100
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
Subject: Re: [PATCH 06/11] pinctrl: qcom: kaanapali: mark egpio as a GPIO pin
 function
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
 <20261124-qcom-pinctrl-egpio-v1-6-34f2c06b2658@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-6-34f2c06b2658@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MyBTYWx0ZWRfX90rj12MBamLl
 pbgKInHmPL0gWhbm7RAV66jb0ONPDzi0hItNcOr/r71Gqtc4rG10gJHepEYKbwQGIwjG8HS8JCv
 7pyC02l9U0RZCEyb5nik1ievp8SnkfQ=
X-Proofpoint-GUID: Qj8B4Uh1LBpu6IAINTbvMAwF-_Rj-3x3
X-Proofpoint-ORIG-GUID: Qj8B4Uh1LBpu6IAINTbvMAwF-_Rj-3x3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MyBTYWx0ZWRfX5w1X52oM9PsT
 CQLMxtf20eoRVLofx/km46f0u/aOdItzET5ZK54Y8jcBrpXjNJYjQ5ij7dVczclwTtLWsW5s1D7
 wCVDP9uofnpu9Qk5VU4LwAZbrXE9PbyFXTUh6bSU0f+6KgVDVZ7tbjCz4dajGqk66kaQGwu1+E5
 qlmyq7j7dpMRYhaqeG4Pk0pjhr+zM+57XIXTI1MPQGAZUU0NaLvRCY4F8V5HGJ5yz0nyJvX5Qth
 i/A9lvIL9Lz101d0B69YANK8FoTukmycsJgsjC5y1QG/L+hvq58h3H+DtKdFeMmxoh8yKEBZUwb
 UQsfdWOoi6LvfRwUVU/imoM+/MQ/9Pq3yMEZJ2Nxcch7g+lVxk+7Sl/BLhLSxsnOVsWyTudCF61
 Jl/Tn5ljHpN9ba4YSVRHO8+EBhwzAeBJe2bcezMTs6NU397tA9aYih5+VHT4rkbfeKq8lXWhEJQ
 OIDLZCL86LQD4ycz8gA==
X-Authority-Analysis: v=2.4 cv=A/z5rKWG c=1 sm=1 tr=0 ts=6b06bd81 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=AIZUApCXal3OlWm8CXsA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250043

On 11/24/26 3:29 PM, Bartosz Golaszewski wrote:
> The egpio function in the kaanapali driver is registered as a strict pin
> function. With strict pinmux, a pin muxed to egpio cannot then be
> requested as a GPIO.
> 
> Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
> be used as a GPIO.
> 
> Fixes: 35ff9c6b318a ("pinctrl: qcom: add the tlmm driver for Kaanapali platforms")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
