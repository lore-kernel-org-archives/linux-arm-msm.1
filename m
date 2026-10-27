Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099039;
	b=zfjsbO0JBX64QXU9+x22IlKhm6W11quya92/BRzvNq7Rx9aoOUAG+S2ho0gfHuwyMoPj
	 8tP60hlVA7F2/pJ/XsG9jj+KKi2VsX+NMuwnVEZmIANZWOItPp2A1akd/rVWpnWDmDfgB
	 IpoWS+LFS/i5oZ7mtEv367745esqVCgPFgDIR+BXHrdcKqe/X1m6PKLWDeFB6zalOWkvD
	 Hl/WxlBvDBgHqppB+iKaUfqX1bJtu60PqhcM42sPgrHL9HEXyvjbEZGlPCrb0lzNmKrym
	 BV3xUdhSyXuPboVOOLErmVLoq/P4Yqn9qGjM8bYjFd14Lnv123WCgvdKDmx5YlzOTlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099039;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JMRU7tGm5kBuUWjUTUxq7zTWYVqEcyo9YxKY8UwEkw0=;
	b=XAqlQ1AiHabm3ysMDpn+XcMcAjTMQ83sjqKC/RLOl5jPuEf2RM5DgCH1Q3jRusBxBHNC
	 RU3vLyii0NH/rOUL2N0wrUr67kqhyCmgFWmfkq8w3ZqUMNDNEcMQRei73xhwQ9LkE0REb
	 q5mNZfEq2g+nazy6tj3Dlxy4PXDhv77W/sgpu5YsZgCmzLilY4WG4Fl8/b5SIq6+Y/FLl
	 aH2MW3e/EXKq+9VazNwqjUYmoJk2xoQLOQ4Y5SSFNKWV911SWnGfjYdBMZQT0MGQSv09P
	 sZ7XrHmhXi/5sakaXVXuF9gVOY2QB1bzwZOwDuLn779hY1z/AUJvqGj6MzwjvzM8F0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C+nB3XXC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=icjB0tQU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33745606A31A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33745606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C+nB3XXC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=icjB0tQU
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeAa7432954
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JMRU7tGm5kBuUWjUTUxq7zTW
	YVqEcyo9YxKY8UwEkw0=; b=C+nB3XXCIUGvxxBtpRWZYZJlwNkDFS1zJRavSUsH
	ttV9K/TLqxzPYExUJeYSYsEeNJyQya/MxZ1be2O6GcWlG7yHqSDDWLj6b2waAUCB
	7YbwG6iT8OaoD5qHTXVDGEtc3ZUzGgj2vSmStqxyHXOEgPs/r1h3PshtuoqAaKBT
	khHA6GavchaWEjpQrLgK78sSGfiecZVNXMQzpsHAaJ5+g6eXJZwc4IpZ6jslTc8c
	vXhuZRHF7L55xco+DfaZvBrIwOwQgh68FuTG0UkYuaiNxdIiI7dboTbdy7uhMLEO
	3570Lhvxb8nPsr0OsEW8HiQJPzk4SNjz5tP5C0a3878KgQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54kepd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:03:58 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-988c7363ee1so4044976241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793099037; x=1793703837; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JMRU7tGm5kBuUWjUTUxq7zTWYVqEcyo9YxKY8UwEkw0=;
        b=icjB0tQUe9z8wNDFYlSKhY6dFkzZlQS1d7nBWmWfZcANDqh+23D5VplEbwfsDJQyXf
         33/PBypaeAX9jwVeThptytORsGGl8V5FW4nZFoSklnVuGD/fQp/uNPCMf3lgc1K1tSRz
         WorlYPCQeHYedahT/XamRuSJoi2ze8TMqB6Z4/ATZWemZglX1JKFGLSuER+3gY9HJnXm
         cBAkD+ZL4145O4BdqV3zcZmk8L9t3l9f+VC5jj6/VWZkVkFjiaOFXIr9nfgc6XutQhzv
         0CYcE2rSA9lY2Kj/gErUKbTUwnzeJmP1jTPQibm1RydxDKuppNk+asj8LMpWCWHlJ0x0
         YWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793099037; x=1793703837;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JMRU7tGm5kBuUWjUTUxq7zTWYVqEcyo9YxKY8UwEkw0=;
        b=cTPd3EETxdhJmKAy+OKAUSxbEqsMBRMr3ZqsbCwa/Ic2aaI7kN1KktYbzygNOZt7iT
         42BNoUoKk4mg/pz7PE+9+PY/leELPknXfOCnscqJiDuWy04H+ag10Y6jdLgAR9EJyAdr
         p1i8ZItEj0fyAPyKUKIMUdjFfXCzjesfa9HI0DcOaLf1PowEzx6lmRSdJDygwzpA6cbv
         JJmjDzvg2GztU+o2wtDpwf0vnx8hESJtG9/UA7GWbkxvRki7F4Bt9thC56Y4DpwodGDb
         Gs5NAMXhQxXZNd0WEolis37OosYLwY87HAWKu9mB18p3OoiEMiS2E02XwQebo0wkTuac
         i89w==
X-Forwarded-Encrypted: i=1; AKwUvBwJl+b2vM46XEOOV/vSVOvyiZ6V2nYhr6cKFftBumyaXCu8wjg6ziOxWMrrB0B0SVnb8C4gGlusqd7drqza@vger.kernel.org
X-Gm-Message-State: AFq9FYJQ6yBEV3ROnY4HY3d4XZzqeRmgfzaN5tLnLT4nnAcUyfMkaBjM
	J7j6w5fw8NKIo/5iRy+b4C8PsYiBQSprFu4wl7YsbMmVCX5sKeXlc2g9TGdDm7T15t6zk5wYNKu
	IkHOtlIQ1Uz8/1rYwimZufUW3ogwtRyK2JYSMhrnH+8s+mDicePLSBq4+qbe9RinoL1gtmGuOau
	iG
X-Gm-Gg: AYBFou2x+DW3CK2aMcq4xt1HLJw7kEatA37ybLyRYe9r0lbSQvIK5ITUZI6fT13jVpD
	OJdyYN5WKAKvWTi3Zkb1xUr/QqmMs8to3u+jZX5CfkNcvWWKisXO0MaEFg1B+Z05HD44w2V3dX5
	i+hd91ks+eQmYFXCY8p/pRbs9iD8btttcdbUmES3HfbO6kgjY7748KOMGH2JSRWTh0k3ghnl53/
	JPaS+//GxggKMOzTfce6Oe//uATmXGGlhbUU/9cx9xHODa5SfZFiMijv48/u4HFSPC+gx49l9eF
	eJNYlI5d+z5O+sgmKcDqIG5XSaUxYsW+mQMgBH11r/tHBL8IQyXdrEV5MWdnI2qudShJ52OA8AV
	CH5CJ/3rukhIT/a5Z
X-Received: by 2002:a05:6102:8655:20b0:7ce:645a:13bd with SMTP id ada2fe7eead31-7ce645a1bcdmr2481353137.18.1793099037041;
        Tue, 27 Oct 2026 04:03:57 -0700 (PDT)
X-Received: by 2002:a05:6102:8655:20b0:7ce:645a:13bd with SMTP id ada2fe7eead31-7ce645a1bcdmr2481332137.18.1793099036427;
        Tue, 27 Oct 2026 04:03:56 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fbb725sm258526535e9.0.2026.10.27.04.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:03:54 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:03:53 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ishu Brar <patches@brar.si>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: ubwc: Add SM7250 configuration
Message-ID: <d7sepni2rnaopzifvozadtmtzddrs7wf77f5534rj7523nq6x3@bpxittn4b26p>
References: <20261027-ubwc-sm7250-v1-1-e766b1e264cf@brar.si>
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
In-Reply-To: <20261027-ubwc-sm7250-v1-1-e766b1e264cf@brar.si>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfXwIr/h/zaSllk
 j/dI/trMMDfV2jBF3ctIpf981Zv/RMh+4qm9RnfZp08W0n6RIUwckCylriOTRmy0dI3o96UFVTN
 iLfXhdcocPruy4udkt50w0P5tXNr9D8=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae0851e cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=GK7zBLNOynR7OwqPiSgA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: cMd0MM_6CpJstKj-nH8h1dFbe_-N2vFH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX3JRoJ6LpHiv4
 OvHcsS9HKEA6kVkVVm98rN5GRW5I97U3DaKI3DixgqGRlxKcxujGxJynkmUDT2BeZ1UmZdwThDL
 TAsGirQaUSOKAJF0AkghzEzW1rQlj4ePAKkSVJ2p8cF3I4m5KmEUyDGKR17pWQmV1Aszh0EoMue
 K/0wxwwiuOUvyvIV5l/Bt7MUFdLJHYN8SLw3Q8eLO4MlmEtJ3FWaTqsXXw6wcUTaK0LrLIev6sU
 Yu6lu8N5ZSnfAhjN5SbR9I4+EnLdmq8vvj28Ezhq3Em9V4Uq6m6WaxfUkXTQvwVpDqvngut3PD3
 uBhtsjYaBy7/H5taG0b1x/eW8hw+miB1PqmMG3PB5g9D2/+2mXd3qw7X8gRQx25FE7o94Y9tr+3
 lwGMOXW6C4yPU5TEeG2NtcL0i9s7cqfZTKPyoXBxsy8Cz3Gt1P9KSEU2WfsPm8AIPk79OJ6yV81
 1J+B4SDb/hJ3SUwW7xg==
X-Proofpoint-GUID: cMd0MM_6CpJstKj-nH8h1dFbe_-N2vFH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270043

On 26-10-27 11:49:31, Ishu Brar wrote:
> Add the UBWC configuration of the Qualcomm SM7250 SoC (Snapdragon
> 765/765G/768G): UBWC encoder version 3.0 with highest bank bit 14.
> 
> The downstream GPU devicetree of the platform sets qcom,ubwc-mode to 3
> (UBWC 3.0) and a highest bank bit of 14, the downstream GPU driver does
> not enable the 8-channel macrotile mode of UBWC 3.1, and the downstream
> display devicetree also gives UBWC 3.0. No existing entry has UBWC 3.0
> with this bank bit, so add one.
> 
> Without an entry, the Adreno and DPU drivers fail to probe on SM7250,
> because qcom_ubwc_config_get_data() returns an error.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
