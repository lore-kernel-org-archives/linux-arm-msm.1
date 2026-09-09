Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE4154A7E7
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 11:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788955183; cv=none; b=pY/Cle3K2ZmvR8VKrQZYQGS8XqwYsirIqNvm2n0GyswOXIP0dPFMlAqqa5Bz8HEcNn/FSkAbb7CX50Pi3qErwvz2uEJk83YJhPncGN3CVvQKIV/e0Qn10/5DJMoWilE6fvDwbDp9Lj24F0Nvgbommi5Gf2dB37Odc/IqxwVAGj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788955183; c=relaxed/simple;
	bh=mQGo/kM1USYPO495AM57tyk64N4Yg9aWFSY6H2z+lVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YAyrAiWwmv/a2dg8ZyNB3ELekcg/E1ir75gn8EztBiC8y+WeXKPJ2FHhXnLf/bnPyjfjgqWagmo5mxZ7PyHCH9vYMD1LOqFmzC2lXkNhTYA+zpU/czZm0yH05J8AvDmWae+2nTLI3VaF0Bocux3E5y89rhMJHCxihg98BqhS8cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RaXjou8U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fVUsGJPc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RaXjou8U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fVUsGJPc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU2sZ2019097
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 11:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	darzDWxNi93WLtlG8djJeoH4MhmVfYfnz9f+CuHi1rU=; b=RaXjou8UWMWFxPpI
	DNzucp7VqM190ZP8hpxGriIqIKBIR/kzttAp/gANyi38NJRE+0xmawUGRsP28PAb
	eWoGA45DYzVt0I7ytVfU/GuZHgRd14BBxFvqC9TD5Ae4p2xHYlc1kaP2WDNLcDA3
	YPNGewnyQfwqtvJ5XPesqg4Gh4omaz5ho1C+RH9c7aLNSEr3C687uI8T6iRjtpVr
	rSkH8NkFy3dXmS3QDGBNSG7OfFXvFi8K7RhyrX2ypfhY2IbViRAvVtaxA9ot9USc
	TsJdd1bV+QHNAmOm/UTT7c4psN9HYUn6oIwVvjjUD//CkNZI9hcG62Ngk/FcOaZs
	9bgo/g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk62x87jn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 11:59:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93495488976so72842185a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 04:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788955180; x=1789559980; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=darzDWxNi93WLtlG8djJeoH4MhmVfYfnz9f+CuHi1rU=;
        b=fVUsGJPcxPBISW+NKH18shFlM22P2JADwPM4LBfSvdnsq5N/oFVXFxuPZz31elzUgZ
         K8JydSXZbo4kw2omj+sQWLwhYsolNHb0htrD3h+NICG8QLo+iNBJiRCC6mgYiLmLN9gp
         6MjS/bo4DYHdKBRqpEfGmFfN8p0F6BWe/BcTluG2MpQY/5ovKlm0TpKovsF4NC7Qyu93
         G+58i2xTZ6jVooJZbnrKC3flwI1CgQ+NTxwKqjXfV5k0qffcOIkBmuK4W88u133Ikxu8
         jQBXcMiBx+tq18vYC4kWgvbQWywzt6c9vLPU9/pfcva4NIg6ERx0gQxBTqnk1t5Av8OQ
         mMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788955180; x=1789559980;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=darzDWxNi93WLtlG8djJeoH4MhmVfYfnz9f+CuHi1rU=;
        b=DME0bnjLsU23PH5WeMuYnbPVFMPq654/GLuwUcc7d63te3HHuN4miK/q4D9/bdXL69
         RQP85/crR69oTVtKJqd1kGmNdYD9syDbrYEMld1JyCkluMRhckrS5JkCYmbYnFb5cjcG
         YMeAAySFED6ABzjM45Qv8IOTLsBLb8yGjsfVi7nrUnEcuzFLGVu+099Jt0F7DvUmVEjs
         tRBaamCqC1djDfq1OLm53rKgCRKzo/dDSLSgWhLQsz6Cd/FDY3L+Fxk+SMxJp0yvuwwn
         LfPu3PQUr1gUkhm9bQ5dXEDiwD8URy1ljX43dQf85WN6opL9vVuEUpi0Zw6SCTe7SXD+
         u6zw==
X-Forwarded-Encrypted: i=1; AKwUvBxPgYzr4ko2g/puQucImWDxPXdHjdpRGffGMbBEj6rc6VQMeDNdSTBU0I8YmHC2VgtNh8Hxrs2c3KbijfUs@vger.kernel.org
X-Gm-Message-State: AFuF++kgLFUXr30TMqmklmjOAN9PssUoo20wrbNa6vPvLmKnCe9D3puC
	WpFEw7pQRSjOF+J0j185icksIa2YsuEcPgKdWoiW+dymImAduf5kO8z+Rdt+QUmXSYIHrc4KerL
	6f+GmjoU9PdplI0y2319gFj9tQrz86gugvCEW5FWhGz+dP6BILOeK+WjsXmvzzwb+KGPp
X-Gm-Gg: AYBFou0KcXfNLy9joxRG4GsbK3rH4ibe3Em3XBuwNCyInXt86sULnEuc3scm1uFRlZM
	Jpb5eZljGRM0nD/yUTjI4b0y1BgkCm4Ce+sEU2rvEHMOg0m3QLYp9x3kJ2lDRJWDS86BxYyG4aq
	uYuPZFwzYB9gThUIdhKu50mb9UYGZGAkcuFoMois3gQQ5Wtk8kF+ZyE6mSBVHjJtUVTfkTuFebL
	DUvLUBC+EKzzjocyi4rqbmNqfjYgClvVnGh21qiA8B6iIUQkbJH25n8WwK6jAdD3WTFbd2beluZ
	A0GlcplNRpqb/o+m56yK7bbvJTJJfTO3tJrb1nWYIU4pjbAkx4LKxOYIJyFL0oax046VWt6QF04
	iydCwpZ5qjHaM+KcCk9ODpg==
X-Received: by 2002:a05:620a:628e:b0:939:8b89:5076 with SMTP id af79cd13be357-939916c18a0mr2563685185a.1.1788955179990;
        Wed, 09 Sep 2026 04:59:39 -0700 (PDT)
X-Received: by 2002:a05:620a:628e:b0:939:8b89:5076 with SMTP id af79cd13be357-939916c18a0mr2563682285a.1.1788955179576;
        Wed, 09 Sep 2026 04:59:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68c3f00sm6660059a12.12.2026.09.09.04.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:59:38 -0700 (PDT)
Message-ID: <12554890-328c-4a47-abb4-f15fa589922d@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 13:59:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: shikra: Wire up usb-role-switch
 for USB Type-C ports
To: Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260821-shikra-usb-dt-v7-apply-v2-0-628885fc1d0e@oss.qualcomm.com>
 <20260821-shikra-usb-dt-v7-apply-v2-3-628885fc1d0e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260821-shikra-usb-dt-v7-apply-v2-3-628885fc1d0e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMiBTYWx0ZWRfX1EPQaMyKUAjo
 oPCbXrGIln8Njul3Eovz7wrRMglkpl1GaskQ+6iOKTr5eyHfCuKfWpRFSLJjCmQQtiJd8GfCt+l
 vY1x1oYULn0sswV8yRtIufvcpVevgxs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMiBTYWx0ZWRfX0Hycp4sGejfc
 JDRCek4+MkMM3J5N2ShEFKkjLrz+k7PSTC1DLhP6JDCrL5AFpaQ+E4IKgwhRJOevthgQEzteXns
 VzYkJmuX2Nd0vwnPHmTbFZ4OLz+x5PzAPLnjxDrYrrQF7JGmSiz2l9JKm9l4LfYYQ6tji99Ebhr
 /TOh/Ii39jonP+3X5fUWIE7ZX3zDVkq1yBRqcUlVN6oEovKCdIEA4PWwR5EiPyOuZkj9OZbTi7D
 0AFaR/2uqpJBylkaBsyBW5k9s+K/pNsQbrkfiHr19Q1LEvy/IGsNUBN8g3SBELUINFmWvfPbZdn
 B4vlorGZDbKqPtaX+tlJRi7dfWtJa7AXut2N9y4NLdmzUPNUlDBMU+i1mrF6b90AA3HpDw7p3ws
 Rj4Htet1r3rI5J6nO3rMQSQDHgxtpSZwiJLFAI6qKISafMipB5E8CKhVTYblmikC4bY5XzDnemf
 nQ2QrqkHjsRm+tsOGdg==
X-Authority-Analysis: v=2.4 cv=UeFhjqSN c=1 sm=1 tr=0 ts=6aa14a2c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=yj6YoaMyUvfbHJFEJfMA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: khAJTE7WdCFbPN_3C4MFrtL17IVeoK-H
X-Proofpoint-GUID: khAJTE7WdCFbPN_3C4MFrtL17IVeoK-H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090132

On 8/21/26 4:04 PM, Akash Kumar wrote:
> On Shikra CQS/CQM platforms, usb-role-switch is handled by PM4125 on
> the primary Type-C port and Cypress PD controller CYPD6129 on the
> second Type-C port. On Shikra IQS platform, usb-role-switch is
> handled by Cypress PD controller CYPD6129 on both Type-C ports.

[...]

> +&usb_1 {
> +	/delete-property/ dr_mode;
> +};

Why is this necessary? It's not even present in any Shikra DT
on linux-next/master

Konrad
