Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498593;
	b=XNCs8+Z5crYKiWOsNV95pKpmG7wUdG1aQLCG5R/XEfMYXIud4mdkm0nwKE8NVpQjG2A+
	 4QiPo7eogPJiAC5nOUObBYW3W0hZpXNLsWjhRMbsk21UfTLoTnfElJDe4w9Pt/yguQUQb
	 cm3SML3Q1Bj1tOyTL+dJ3DtYLHrDhOPE7iQ0Q5HNnMILbNBNE4x0iD7HT6S/qGMqqFr8r
	 KRe30xAYHnTkiiGl2k9yNSfsB9Trf5sCcdJ7ITuQHzXqHZWlmbcqldGwXGDPV7KredKQM
	 7DsZ5IEjH8Ghta4zbaLgf4V7s0jAcddJ5tQFZWbIUKp01jLplZulM8bl8U25tRKOvmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498593;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vbXhFwaOyFV2hFdxf8mQgggsDq2L351KmjYmqaBgfHw=;
	b=dowU7uH6T+xoLA3Iurr6tpmqwQUaTVw5nLj5J4+0HBN+JYzXMxHlQAMEOOFiqeKVIRMV
	 Y6lBWqkIhpmDeQhE25eJkRNf6Ynod4jiRS7cCPt/0YRp8FQsJmu/ht1j6di4FQXTwI4VA
	 Cuesjape8HDTIM7KGCp7BHyMVCITLJGlUnmY0AEagcHg0v+mDgI//3yLaX0nm8tCa3Jeq
	 1A9+SZR/wEzfp4jHMYW9/AsqQ5vW9adOC7AeE1DDN9DBQwNiK+LBDfKoAjNmq2dXchmt1
	 SeVP0vmGZa/ok2Cq+pMtJO9CXdpJxxq3Lbut50snsYet2zZTHfjKXfEc4yLONuVa5/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JID9g8c7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dXO2qyA+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4D9606A31A
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C4D9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JID9g8c7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dXO2qyA+
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAx3MY2562778
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:16:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vbXhFwaOyFV2hFdxf8mQgggsDq2L351KmjYmqaBgfHw=; b=JID9g8c7iiFlgzX1
	UqmCHetnxCha9hRvNy75UyVveqNRK9Qoh2Ys0EfK4f2YLibkkImOYavuzM3T+PGi
	pU1fUvnEkgSJ8Kavwe6Wh1vcsHJL3sey4cIPpStBMpZ/Kcrf+V7dCncpovHl1Gqk
	SbupoRuTBSic0JRu8civ9BGVLizEl03Vf59gsE49hsmmLInkLiw86wPvZ1JcADdK
	mU0HsACFR7UUvhwoHLduWnukN8aPwoplQlhPQQhsaren7Xs1sYm4zGiUakLZ6nF6
	ZjWqqj9+uEWtQPQQCJdxjL0ssgN0BO2nlciDmv2fjUyDU/0hx7l37WeVTQFxMJ+t
	UGcfuQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nact9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:16:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53389750985so4840751cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 05:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792498591; x=1793103391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vbXhFwaOyFV2hFdxf8mQgggsDq2L351KmjYmqaBgfHw=;
        b=dXO2qyA+54p2+XXONPJkrVKegExcBGR7nB65DcQ8UmBLF6mdTFIfnBW3IH0I3vYtdi
         M3bikgLZTD1NZ+LqokCa5SgJQay5sZj7pJY6XMTXRdFYqTj+SMNmWg5tLfQJ5SDLeh7t
         7d3NRaMoiGTWn0wScwygMkk841D4kjsFG6BgyRYEIvqwBTwEpSvm+Kz258Vd/MclA5Bz
         nLDSlzhq7neEpjmqeaxw0hhfhnqJ519++vVdlB3WKE7vYuAqedxKURnrNtDqmZjMEpUX
         wtePp5DKr3lVmbb5bCkSTR8KQd7EK9JFQpCREGEeNzSiAuMsRVn6Y8YOt+nqYyU8B0lK
         KAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792498591; x=1793103391;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vbXhFwaOyFV2hFdxf8mQgggsDq2L351KmjYmqaBgfHw=;
        b=JLbA5Hy3YDaAlpgZwqtp6YQMtP4hCjPe8ft9qh+SlCT7UTuXvXyCyW5XzbRnRUiu1w
         kMWKKl67vuFXPYjNXWSXCuo1NwIOFOQuxfUCm4OU9uloOK5daImfXgQ9yoRkDi3RBssB
         OM+gW99qmXMkjMqTfNcPSFKOy5FZPEgyVqs2CHdfNM5KUdIB2ZvtoXlVR4JQr9XWkOiJ
         3N62MkChGAV5BwDGXXcUJOm9X/hqbB4g0VjxuhqEa401psYsQT/W1pfEXpHCZcHRcres
         uKOMU3VQh//PnvZU2WjFchhiaXpG3pZ67Xoh6B5NjlfoiAnyoJRny0QKVpixHBF/CZW3
         aRQA==
X-Forwarded-Encrypted: i=1; AKwUvBwKY/ZAYMWV9IOO2IfYB+NGt3JwBjnnH0tQIXjDiQ3STEEUYYTiuKw/fMHV5D+1YE1gZJEtntn27XljYdnd@vger.kernel.org
X-Gm-Message-State: AFq9FYLVEvgp/qrioKkk6bH35JqyicqCEk3ftQLpJnEnLtmuc4gGECta
	u44psljsrFCTyXL/0NBpybaZKIVKddBoLZiQODBLv04gs+bjCw6ZP0By1ujOxrnft+d9KnylHhB
	lQ7SuJHeukD0BqFrlxE6LAdLK5BrdwYKfQ//uWi0npOKMa1QVo1zhLBMXPpKAnyWxg55Q
X-Gm-Gg: AYBFou2tmBFJ/vMjYdaHAG/67wnUIify+1hsnIEr5F15+nsyjmKunVmBsEGS+q3gfTZ
	HKKvy84FiGHaUdcqzxZzAdKtgXDov7hTCjWiY22wd5u/WoPERvWrTZaJVyeiXn4DBkudK/OGr7T
	rpq2FDZ4ueNvIybHWEurF5Hg6k1/ckDtApEjsnpEgaX7042XId97XnKxuVbQ9PIdODH780hkYRD
	k/vsk3Ci7haYzg6VJoCkk72uNyDLpyTlvOvB6x7O61sMhuLLTPQllH8RoyQM7G2ZHtzTBR/gyKg
	SyvIt7esEd82+a+6X903mqm25eGy1ERd+ENODNSEc/aSb08JQ0vuqB2N5rBV9Pho/sBVIcHiNvB
	5WVf9+jXSe02vky1dJaelYA==
X-Received: by 2002:a05:622a:1304:b0:52e:3991:84c8 with SMTP id d75a77b69052e-53645d643e9mr189331861cf.2.1792498591306;
        Tue, 20 Oct 2026 05:16:31 -0700 (PDT)
X-Received: by 2002:a05:622a:1304:b0:52e:3991:84c8 with SMTP id d75a77b69052e-53645d643e9mr189331401cf.2.1792498590868;
        Tue, 20 Oct 2026 05:16:30 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dceeafsm477131966b.17.2026.10.20.05.16.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:16:30 -0700 (PDT)
Message-ID: <45b54ff8-a2a6-4eaf-9d5b-cfd9bb40c459@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 14:16:27 +0200
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
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: lemans: Enable
 lemans-sa8255p-ride board support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nikunj Kela <quic_nkela@quicinc.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-8-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015023711.721837-8-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nt1kAV2nUAKb2WHPhf03eAwIN7OQNqY6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfX84mCyx2DVRZs
 P8WkKs7iAB4lf9pQIvhcUiM4tiVNTZ+n/lFBansmHLWm0k0VZm6hEOWBz8djPV13yOnLF3Y5uON
 ORNsf5vtBt1wNRy0BSOQ+mj49jUP39CBWcE37VwGGBkgYf8GMcQOcBm4sy/b4+w3i311t6sCQbw
 IFSfdlY78LfeyZrffNF1MOY/7k6Q8Z/yyh//7NWg2Y2kuQ3fmqXZjfg61qm0CUtOnrv1fyptn3a
 w8qLiZs+hJ1MWnNepwCqp2LY+GweN06B72CX5Jt0yEJEikrW78mMJKga/xQLfiufCX2TwWjE1KW
 w26T8dw8xUHeombm3Hr3KJ8C41uisrgqVa/28faGxMwYiwfOOiDrZ/cfl+VUQvI7/Qo4nD9ZMW5
 cmeIWCgxWwRJLaJR2SGCtOwq7EgSWs1H5j0Y1aOnE3PB0nShGUEeNHtI+G9HzTDjhyBhw8TM6Tc
 4jZ2+QZSCl5Xam9g7/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfXwiz5UeCtNDls
 P8b5NYf8/pROj2VsxBNxvrO8VQv+bRPr1onOY2NH1QfTBKQ5qndQHIvU5aJkFur1eaD/VDEl5kk
 9hCZ09AJt/Tg7MMCKoa0V0bvwRWgVnc=
X-Authority-Analysis: v=2.4 cv=VI9IDNPX c=1 sm=1 tr=0 ts=6ad75ba0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=u5ebKnrMhyFaJCspccgA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: nt1kAV2nUAKb2WHPhf03eAwIN7OQNqY6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200048

On 10/15/26 4:37 AM, Shawn Guo wrote:
> From: Nikunj Kela <quic_nkela@quicinc.com>
> 
> Add initial device tree support for the Lemans SA8255P Ride board. Enable
> UFS storage, UART10 as the serial console, PCIe EP interfaces, thermal
> zones for PMM8654AU sensors, and SCMI protocol nodes.
> 
> Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

[...]

> +	thermal-zones {
> +		pmm8654au_0_thermal: pm8255-0-thermal {
> +			polling-delay-passive = <100>;

Do we need the polling, is there no interrupt?

[...]


> +&pcie0_ep {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie0_ep_clkreq_default &pcie0_ep_perst_default
> +		    &pcie0_ep_wake_default>;
> +	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;

This GPIO reference feels like a layering violation - the previous
commit promised TLMM is abstracted away

Konrad
