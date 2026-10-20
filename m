Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501704;
	b=0Wue2D8TjxzsJRWjdjfkILE2XshX1uIqeojU53AhaX9yfqQqWddRpD1v9+pYL1/+Vg59
	 lfNYVJRBXLLXMgwytKQqC+sDMD7S1+at7nDWP1no4Nn13N7d2NDSGSwp3fJcZsRRfLaB1
	 3uQfN5+aaCSLNITE9sYkSdmMs/65DjNK5h4esCZuL96Rtyt9tyBaI7gqpSEKbwczi9Q/5
	 96Hd4L4V+K/HomXHUVVnxd75YcZCEDMaLKocV1pfC6nffvdU0yl7mXSq39JyvvqAeknFZ
	 BA4YT+A4XVXC0Vg1zvVgoJYs1Cu6sNrv2HytwIwaWFvw/7EYsMuAKSIGLOP2NXDGJ8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501704;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2EqJhnJ/Jsj/AwDrzxspTil346yYpeNL4pTvcJZq0tc=;
	b=qaJ29zVdytLkad+ikFT/cS+XePKjqUfpFFtKk8td2JgDibOTR4Jvdg2zQ8L8o/vRpMuK
	 dOkUne8oz3QvXW+uWPYc0i9jSb5pnxGqj3w9fSpxGHEw/PgpOx1AHDokdYpd3Tkm4m8s2
	 MQYKFsMo+7yfN3iVG44lNDYmiE35wpfyJ5o0Ynh9xHVa5YyhfFLtqRprItkBKNQMDRfWf
	 IDgQHm5tPiIeD2YTW0qvatsztZbO9bzV582cI2yg5y3V577/2BdSCinrRsyhAo/n2UO0E
	 RqpOXJeunn1U8K6qImYf5EFIVvmm31mYAJ+Y6+1CVQxAJCjvEnBOf3hhMPlqrjdzCUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b1qd9rTv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Np5DYapP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EC3606A319
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64EC3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b1qd9rTv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Np5DYapP
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KBZsOS1527297
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2EqJhnJ/Jsj/AwDrzxspTil3
	46yYpeNL4pTvcJZq0tc=; b=b1qd9rTv7O/QfbRQuei/An0s4vhxKdwNBYPzRsD+
	PiI+j8KxVbW4rKO5fUxg/Mi6XIlSAzNCNERGqBiBpYFAo0RaVvKSQ10nca6JcEup
	9aBEVfMPGc0oTssp34qxoSC4UuY3fsAJjlvoQuPi1+/1PqyKtP6Ka11EEnOYGT/m
	OQzTpd8vumH+ckh1DqHnE0wkICetIcjyVjR9OdmpylTCqlROZTfVgv2gcOdM2Mov
	nhzK5J6CuHhmqFzt6Z3u61WDeEW/MkVY+6WFqmHZev69uzsPM7mH3bC3fwEcUWiA
	htJpv8WYm3HJS5ceMp2rcFHi6xzru2jH4GmpdbuwoUsDZg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2jyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:08:23 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-988bc0ef0easo217816241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501703; x=1793106503; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2EqJhnJ/Jsj/AwDrzxspTil346yYpeNL4pTvcJZq0tc=;
        b=Np5DYapPqjfChlCB24jW6iR6tUrw7Y6GVI5CiLDc1bk7ed9kOZ91M3ODLLX4iz1Ib/
         EYnhRSIubkMxOZsvOhxyllCd8rYWqhzjaa+++Ibl/0WPgufrPwiBdMXbJH0zcjdQKDWv
         gAkF1npylZNYs6OD9RLYSB0GX3WsBC+ecWwjIaro7mRU7Lnc9Hg1ijDsx3gmd0+eahSq
         ck2bfUegVUEgjQShgXvr6Q2pQ82r7QPRl4TaRONO5izt5/avsYhEHIszIJ2R5oo/20RS
         jpHAfDM/pUsqmM8X+EqKgye1wGLHRtVxlkkR01khrAiIv7n349YcIYykgZ6lV1ZgmMhG
         gfdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501703; x=1793106503;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2EqJhnJ/Jsj/AwDrzxspTil346yYpeNL4pTvcJZq0tc=;
        b=0KM/Rvuru4XkEBKX8SBYoCdQC4vnUUXuR8lHoAANz8SUdZ+X6jEKPXBIQOJZHvsaZA
         wBU29pzhovjXeizdNF55kbm3MqTj1QgL2WNnhqN3VvljErdVCwShRHiT5MvX0dOJjquQ
         NNV8zP/YjCPpnPLU/bcfle8xcKgbqLOn/5c1K0C0bArQ3oNfIsolWPROvdMkPXbzCBYD
         awTLziQNigCKRcVdDagptiWr6C9SzjmyRjp0jCwL/WLBLnN3A393I5NlnhZgslUfC5on
         fkHEGu+2GkwYylUr2w01IkLd2pw0K7PGtYoXHRrvy4WueeqX32P1A7ziBXciPz5Ar1uG
         eOJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXFC+CkWy2uDnLfEhd8qBBzuf1hz45VA2jlE1fSgLNl1y/SoAMzEEC7ojHpasRQlqbo3lFUF63+EhYOM9O@vger.kernel.org
X-Gm-Message-State: AFq9FYLYKCXAPbCuptoJfdnylJXqO47+VYKq5rSxL84r2H2U8DA0nMHf
	oBNecBLLCFbxtFtvFuHTYrLj/rleW5JwHmJicy9vIRzepaS9k05/+lpszE00noENmZzVyxfCjju
	lbGFW0gBRgiM9Y4bSfH3y+giA4dZFfvbCpCpHbxeay/Fc5hydLtXKjlpa32R2qdvxxJPo
X-Gm-Gg: AYBFou2gR0NfrBfndAayfgoxnYfYzlRXmLyWfy+v6GVl2mqE8vlfD1fRsKqrk624FIv
	XGBhsuUYPVrkB66D3leys/bOaIAdReDFFn6MGfnTBZQmyJoB4q287dkj7xFwb/VnpNQwNfQrxm7
	JgeZGvcpogFOEJthTKu47WJKCw5xLfjxkRFzje7am1znl/DO+GdtqRvPWOP1xAe8uL8vlSzdNJQ
	ZNL3/VhGub5Ixc2sjQxBv/0sbvPlSKtdgGpt58YXNenY5+Hhkvesua4EwrkG4eM24hNbyepOR+A
	TlaMoVWnrApkRB2xTzls7Zx9g58Fz2f6u6p4oI+hSvS63uvMs05+63uwTEAKsiVHFD0OggkKs9p
	7QegT6AZbscyQ9Msf
X-Received: by 2002:a05:6102:5488:b0:7cc:2086:34cc with SMTP id ada2fe7eead31-7cc369c0cd8mr2444382137.16.1792501702673;
        Tue, 20 Oct 2026 06:08:22 -0700 (PDT)
X-Received: by 2002:a05:6102:5488:b0:7cc:2086:34cc with SMTP id ada2fe7eead31-7cc369c0cd8mr2444369137.16.1792501701989;
        Tue, 20 Oct 2026 06:08:21 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d6db78csm6193709f8f.2.2026.10.20.06.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:08:21 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:08:19 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8250: Set active-only tags for
 CPU interconnects
Message-ID: <gmiurdyvbr2zbkbzy2bi2telpxab6irchpfnzsv6gy2gxpb4gr@m4424rx2pbej>
References: <20261020-topic-icc_defines_ao-v1-0-cae8d22649ac@oss.qualcomm.com>
 <20261020-topic-icc_defines_ao-v1-7-cae8d22649ac@oss.qualcomm.com>
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
In-Reply-To: <20261020-topic-icc_defines_ao-v1-7-cae8d22649ac@oss.qualcomm.com>
X-Proofpoint-GUID: Ce9DzM-LftZK_eMRZF86Kv4p1URrGTPM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfXwarrQBPDnNM9
 HkJpuYGys4CHv4QpAhnD3gF5+v+s2uuPPIzmBs4IeiO2V89anjLJfg9FMYHxxfLsVdfnZ4rsGQl
 w5FUersRYIMF0+bInWaosGjMLKa1XYg=
X-Proofpoint-ORIG-GUID: Ce9DzM-LftZK_eMRZF86Kv4p1URrGTPM
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad767c7 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=PhDoQi8S-v1mXI6LFy8A:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfXw5V0GPd5GDgx
 A0vvcaP37YOf/pcUuop4FN+tUxYsyXvuUb+F5ZdRc/fhl9dHEV4CrDZx6h+KqFCXEUv7PsDrYHq
 GYbxARLls3uq4+FLMR6RiA0BtrXhjdgGT4JlU4nhEMYvwC29AIkX0YqqMBQ1xfLk5n5UQE5Crf7
 Nx2+cEkG/8xuBLrzclXkjgNE4+EPvHx1AJJHPGMifX3hsLSn01FMj/PtGovWCs2uWaIkfOZhOA5
 TQVa/3pp9WKmCYD9oclhzkI4OLGa+uaElSOLay+MneLIhiXNeX1R41VmSZf/f6Kyqw8ZbVf/g4y
 Sax329LT/tpuvhDXTK3ynhuWIkx7JmuPkU9vUQZexeKHEhoKwPBqmfKvZIMimkj4URYB5m4dD15
 EFMcyiJpHeeWIUyx6qp3rppgNVUlfgKgezlrPE/hcyt7QlIUNiqbanKsKNtNb2FeKYuYxPSlBF6
 cNtzkiOj87toCYdDBpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200052

On 26-10-20 14:42:11, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> RPMH lets some votes only stay active so long as the CPU subsystem is.
> Take advantage of that and make the CPU frequency-bound votes behave as
> such.
> 
> Fixes: 8e0e8016cb79 ("arm64: dts: qcom: sm8250: Add CPU opp tables")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
