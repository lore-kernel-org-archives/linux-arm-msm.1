Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866670;
	b=niIfsf/EI//Bv2/EBCdzFcPZEFMqpm/+SxSVdiqUcPB4OKfrx8ncysx0FIZE1mGjFzxJ
	 EGyC7Mj0K7rlez24xtcx8u4ZfEE+O2Xdgo+AmJ4itpq1pqI7CKemq+92nFOoEvm/t1xq5
	 3MHv9V6MViN6SsFKohwzC+DPgLE149dsXTlYQEAvxTYuToqdFs7sGCowD4YObMIGUKYLH
	 pONUAi8Bdr2VvzsgsRK9A4Q5ehAyqXhDTiZgmwhVVJHx/FsKhCKMGu9g3DVI3vlle+0N9
	 VDf8ICipvHBdFBDZxkFOecpK9BvF0ZroY1k4dyIyHhAk4jK4uazwt53XTeKZ+Xq9E4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866670;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RIDXH7P+jdTY9AZB5lDTIxU+JVMIyRXXtejliGs9E3E=;
	b=pwV/tu65ys44i+01Zv3KNByaOEBFOwLcoOXhexKiDQf4zA8zaUvkrsx4WUfQxI4rlAj+
	 tJB4sLzWlZApNvl3I5qtGmMzccF4HjOFvIICVLsOLHBEIUyhvM+ADOFekVayLn+wzX+Dg
	 VVJDIhZxIJrfV1S9kj2nK70uiXw+sYxNo7qEsXQGbaP+f4ZgneXW/dAB9bwWsLlaNiQQe
	 BhQ7iv5Oo29poDCgBrX0idfF75vmI3/N6MxAM0FAtIZ+E+JnTwae4xR29cVOAvJqHdKc6
	 nbxhtukM3CyNDkwnvBoK6RDfS7X/6ijeoH0WBOCt9A1NtrRgxTwzHYlbuGx/PPcRX6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LV5rhpYz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EFvnwAPs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B471606A337
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 08:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B471606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LV5rhpYz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EFvnwAPs
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UGNS4179299
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 08:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RIDXH7P+jdTY9AZB5lDTIxU+JVMIyRXXtejliGs9E3E=; b=LV5rhpYz68Pukncc
	sucjCXNXBQlpVt+QyxUcq0H+iQ+bTO6rR7Ap37bSdyStHxGBrOwOI/DsFmvIlGb5
	wDEmtQEZEnKaiGP075HOPgj+2oKZRrNUIaA380zwuM86zO1L6DB4tvTNkjcffvMb
	uoyMxeki+M5kmlNoRoj2ftp/Mb0fV+lWs8wzWpHZ8/e8KUlxUJNK06NHCo1+Wvs1
	Am4yqLDAxOpB3rO89T0V4G3T1Nut5PzoxQEL5UlpOHx2i2oz4nG9A/X2nklGFpH/
	HEcr1ao7fFRYjkjcpUeZxH8tRKQZknveQ4TFrg5X+CKQa0WHr9YjHwrKGcb/qPM6
	a4fkFw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr4bn4m3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 08:17:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso35910785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 00:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793866668; x=1794471468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RIDXH7P+jdTY9AZB5lDTIxU+JVMIyRXXtejliGs9E3E=;
        b=EFvnwAPsOxqWB1bCixAbGQM0KxaG78+7mDA0JmRBgf2N4USYQJUgdDvtCu6SH1ulZ/
         woVWqrQcTB+y0Xmd/l6fO9bUwUhmtvKtPAzY4+ZVD0e0L0irXX/paSD8VCAKKmIGPitK
         HMaBsbdv+dxT/sehss9M7UTU3tEJ2OnHL5xtWz3h+Hwikjm42twBtPVbPy8OH4keKxnh
         pLxs2A95a3VhwYEoH4/jHL+D3L/LE/5hCkBmCief8PLKOyAM6G7NslGtESiGM8cWB6DC
         LNp73WIqMsdg+8JnD1n2xxM7p/bt7ivP5mRiuivgWRQIjGLgO/vaF5Fu+LLyQAwogCdC
         vFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866668; x=1794471468;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RIDXH7P+jdTY9AZB5lDTIxU+JVMIyRXXtejliGs9E3E=;
        b=14eOrx+2dyH5bPPAAAZwGfl6iVs0vGmdBql0Mj4nqPkSdmw38hngMfjXNlkOKCo/Ye
         YUB8HVxm6sMFoZksibNeBPEehS/6KONQPRKcO846dQFO67cS6iNnpFK+1GxAQQyubQP7
         k/eg92J35TcevQKoRDYConm+WW18aNJnsg2E/SIxv3gaEEinkWb5pD4SrTvo3WW7b/HT
         fiyHOQ5JysVHXZ5w5vMUkEwSUbhal46vAP7o5mzRZ+IuPXQRqz4m5vTibRuftuz0m1kj
         He2/hGIF7hm+8lQLKKYQPKVS79Iei8DWF146gnzn5rS+om1Pwxo+NwJebE2dIbEWKfwE
         HgKg==
X-Gm-Message-State: APuU4Z/worzlJJGrj1Ra3YJM5lv/w4SQBvsNIgDiZN1vzd/niELqgB63
	YA2FRh+hGlkfBved8/gSYXk26Xdgv+UdOcRaGR0kMU/PfRVQgMZdRnK6ZwiZYuAK8bCkIowrPkE
	Lu6ZGVPEESu0vHW3ycttnjnvxokK/s/BDDxb/WgPyRC9fs0yJXpQiEOMRan5P1jEW6MPx
X-Gm-Gg: AYBFou0B4WghasUBUm9kSmw8K8r9DJj0h4odbOqgla621mR2RPtaaMWajEXKLxEBm4s
	lG0VOCVvmWesSeQE+9b00R84z5+wQ9GbajtrKZlrUWom1OjRmJ6gfjwk8+v7x9ashhrBEJXDL++
	rcw4e9iC+Ov4WPioXrw4E1G2n7KpBbG9Ups6DdF+eNneLgwDFc9RkhHSTLAL5B9GijTRBxhkFbm
	y8PtWJwbxJcROEnlsBcFsXppeznE3MHbX4unbmAznkZEmGx2al4XQi8R/5BxeKAPq6vrxCaESze
	YzlcNyuNqc9/LtefnedceHK3pXYtDS7/8EiXQ1llywqWgmm635TeSIYCgwfWq+fL1hp8Fd/VC+d
	9Db7jFJoz+ROpBWl3m6LwYNpLMi4uG/FGFtPZp+oexReTZC5q+6Sr8w+Sgn/+vtR2+TvI
X-Received: by 2002:a05:620a:6e46:10b0:939:c7d1:7471 with SMTP id af79cd13be357-944216cc78bmr2969118285a.4.1793866668266;
        Thu, 05 Nov 2026 00:17:48 -0800 (PST)
X-Received: by 2002:a05:620a:6e46:10b0:939:c7d1:7471 with SMTP id af79cd13be357-944216cc78bmr2969116285a.4.1793866667807;
        Thu, 05 Nov 2026 00:17:47 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e14093bsm150254866b.11.2026.11.05.00.17.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:17:46 -0800 (PST)
Message-ID: <d4be1b6c-3380-4c04-a003-9c7923839ef7@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:17:44 +0100
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
Subject: Re: [PATCH v3] ARM: defconfig: qcom: Drop Qualcomm SoC drivers with
 defaults
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20261104-qcom-soc-kconfig-v3-1-6bd233ccd1ba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104-qcom-soc-kconfig-v3-1-6bd233ccd1ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX5aSKwFOSwIUL
 vrmJQe6DE82Y9etf4j9PtzN+GFUFKpH+w9M0ZYSnRGDazFDcMQkaM0qKWSil9lf2mfnv5dv9V8X
 SPpSyFWGGFIsFJmLwCcTGxw9GkDqUhJm1/jVDa8Eo22fuj7uiiliVcNJu+IUTBpSEz04p2ftSMh
 dW5jMSK7mDooOxGKtu5m3ApthlQ1TIkQzwFchF41smGsaueSfrn76VNOmMCNt9rP7yvXZ/iIRZQ
 RTC34zWEguz3LFSJUGrMnIM0RWIKu3xLoBsLOoCo8auLb1Jd1dOJdYa/5GkUtcZ/uu1K5KjhDO0
 DeWcOR0PDVGs1y40Jne8chfAP5/pca8CYP4iryuti1FghIxskvUJe1HiVpWZcfTjbBTQDluM5qy
 i7bD6V8KgQYi2dd9fegqPFqbPqd7pxB05aqj82e+Dce56aGBcI5IgZ9/8a3AR2NVG6K1UWRoROi
 ws95VuAnezOtAfR/9Mw==
X-Proofpoint-GUID: tt0W30J6x--9I0lEllBhWFiT7TYinNBI
X-Authority-Analysis: v=2.4 cv=IcUSymqa c=1 sm=1 tr=0 ts=6aec3bad cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=7rGjOUnHYHVD1fYbDD8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX1HxFTMrZ5oNN
 LIOPjW3PYwPncZUMyVa9YldGeufU4GFop5uafYE9Y1dNeTASncoddyKGOc5lBirWQQ67VR6GQDl
 PBN335ZyV30Bbz47Wg/UK+Rf9heay2k=
X-Proofpoint-ORIG-GUID: tt0W30J6x--9I0lEllBhWFiT7TYinNBI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050032

On 11/4/26 3:40 PM, Krzysztof Kozlowski wrote:
> Several Qualcomm SoC drivers have defaults, so their defconfig entries
> are redundant.  Keep the few options which choose specific choice
> different than the default.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
