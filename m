Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482064;
	b=CDlbEfwgnGXTia7o5EDKL6sIX7IzfibhJ3hubeekiudl+Y7bsQCQMF2onBZ61Zt/eWhn
	 9nhagilwpXRCEbUVT30ae3PpqUvjuiKpfp1Ft/GqRyLG8Px8rHxL2k3JXtqqznP0AHlMv
	 Jm5SK8Sf9ubaHQXMfbdh/DUzTZYbHIqzU4mrSiVByfgopmnn0Wv/rUrdUnzffpTw6wxz4
	 pmiXHZ7y4YKJsOUfS7AnWT+trgPJBmoF5wnkRQ9sngN+8U77HpZAM4PS89+eGJYHFHbnQ
	 NYhlEG/I4gAY07nmAyPPx1yksZ0Z01qi9cdm7tBbKOvMX0tZeeqAykDd7/lZ9SJasLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482064;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WHyBOCxfyR08rNIzaaeSaXMBvmHX20z2ZAI9yVNfQCo=;
	b=PnsPdKJstl0rQLeLzx0BUK99Y/VX1191T8ciY1U0K6Rvxttg9bt608UhK/wwwR35MMZu
	 tgNBMfddUJYv2yBnJd19VYVgy6rpDby5NEWa4GNWPRcOplrkJjuv4Ao3MEtNwanEdpzBh
	 dqyOsXhy7eOYhAkky1iaxgbgoz/taXj0Rmlz7YQ4ImSDDxw7CkKgUPoD9ZKdaqbPBklM5
	 93clhPWAK5DzWo0c1MgNZqlmf0skHkfjycWRvVJEtKKd6jHnviBMRUjH19MK2MEOzazKa
	 TbqXVRpymVXiVrzfAb0t7sNdMaSII/jU6vyG0YmRTX/8nsBRi13iwOZIPEtcKhkXklA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fLNiTKrn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BAJpXqTD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5008C606A326
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5008C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fLNiTKrn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BAJpXqTD
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0t7Ap3806848
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WHyBOCxfyR08rNIzaaeSaXMBvmHX20z2ZAI9yVNfQCo=; b=fLNiTKrnOBPyf1/E
	V2zDkk9bGOlg4SOcYxissGvnz8OBNDf87jH0opux+vHeArndM1oEDDxAaMeab8hw
	jI0RYFzm4JAqYhfvHASL1C7nkKCRw/0GcmSNBsIsd+qijrhP4cwvXd+xItb+SRU/
	SYxV1ud0ar4BkiOv0OhmQTxTsQO9NYF6DQ1lkeGojNfHf0PAeHX8Xa/lO2nHakDV
	R6aJ5Dt4nehkKO/gmbOc/PmkU5Rdegt7qzZZEczaLCSfhW3kUdtszdda13fiNsMW
	bLXtkNA9UeDGrTc3iFh2x2+5SStB0Kq2ZtH/C6urwn2dd5A7PLZp2PZiNDgiS/6t
	RGfUEg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p9edt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:41:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f33438950so763250885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 00:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792482063; x=1793086863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WHyBOCxfyR08rNIzaaeSaXMBvmHX20z2ZAI9yVNfQCo=;
        b=BAJpXqTDMdaOdil+3GEfoNO+K5s0MMzRZxjtoMmV3+SrQaYnWEKhlAvz1fRQN/yw+Y
         T8HVGtbgvmCJ5b3ZU7QmWo7Pzm5mtJAIyIEPEJN3WFL+fCkyT7Ctmd9XDNDtg1sd3iil
         fcnPQ1WSSIe//5Fmd+HGdp5in3qMgiJYe348XZkN4pFNKL/lmmxjNBLQbqUr9i85BLR7
         ZTpMb7U6Dn/kFbXfmYs7neaMWSh68h+zrHGykpye8Ym2BD3BC2ITDQYtLzzIgew0pWJQ
         Ud8N00wGTphzIcY5Q3r7yXtk/t+knUq2I578uY4JDQ88hGPCDIYPX032ZoC8lZcOQKwY
         LB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482063; x=1793086863;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WHyBOCxfyR08rNIzaaeSaXMBvmHX20z2ZAI9yVNfQCo=;
        b=Ti0PNRksRjCd8qKGTrS5V80/o6z8LPgTQNt7d4Zua1bc6cMM6o8axQ8+eCBh0NcXHl
         N9YRkwDpi6iqB8RpRwcyROZL18RbcRV+wfgwdDNKfczU+kQkVSYe9Lgxu3D26aVCxoPL
         G5GOfTR8sbvaK07HpV6TXfL8trVPxkj/ZYavzR1WLBu7u0LtxtNceynQmsZ6kOL9oprR
         MtGL05PlL5NB7dfH356SQoyv6beeTPHKvp2mowv/W7kIacYUJP+ahkgV0W23l5A46Ibv
         JPalReQ3mwzm4B7FA/Zb7SFoDF2z+ndMPCzZ8jFOq//OIItDRayBuM6ruK4h0sg55aJ1
         t0MA==
X-Forwarded-Encrypted: i=1; AKwUvBzhsk8VlyBnRdJAOWYtlZA4PkX8Xx++stun2OHpKMrF+nSDrO9ZQKNFptqqhYsjXXSgx2EWra+XF8tsYge1@vger.kernel.org
X-Gm-Message-State: AFq9FYIQvVa92IEBuoww1TYPyWD9ZclyqGD6j8vXZNzZ4K1+RENWHOfu
	H0EtGIq1dqo6Kisf+VhOuzopph/n9EyGxLppGtqP0exiAKViNd754FGWpZDjafnqhV/xk9u9d/M
	zPcwX0N+FMDsRWSJB7QpeIqhgpsFhqNNctlq90aUzkeiX6Mm719RNixYEn/C00ic/00ib
X-Gm-Gg: AYBFou2cOqGMrUlSxPXSYd5qGmGBpPJ6AAzMCH8QfFI3Hh0cEHCZckvWiign1DKh00C
	W1/r88krlqVkrToAvl4cZWYMDAXs4JWh1Tb71aBYasUiM88GjdCoDgNwd+9rbqdHsPfGRbHweU8
	m6ld6HGNcmVYGVEDq9EVFMcaBcvQ8dbAWerB5igubeiC2acIcUONFZL+RCz7pECP2JdHJvCkqJa
	D+5SgpVlpt0ItlnBYA/sGOXAsQ6juRP8274o8inEXom9y6PRc7XmGrt7nN4QQa+3oqiwyxiSmQE
	9tW/4O5u7qoVEIDRZPhnqB0ZZOMkjkfnHPGqqBAwEzja0+PG84ZwkOlIqS4uESiToh9t8sHyGi3
	d239zvW/cbnAo9qDfelcI77N4rzlkCJ7TlQdSW/co
X-Received: by 2002:a05:620a:6410:b0:93c:c538:2b23 with SMTP id af79cd13be357-93f29b7e6f0mr1606491085a.1.1792482062682;
        Tue, 20 Oct 2026 00:41:02 -0700 (PDT)
X-Received: by 2002:a05:620a:6410:b0:93c:c538:2b23 with SMTP id af79cd13be357-93f29b7e6f0mr1606487885a.1.1792482062245;
        Tue, 20 Oct 2026 00:41:02 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f6631abfsm34100475e9.1.2026.10.20.00.41.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:41:01 -0700 (PDT)
Message-ID: <1eb062d9-6662-4b10-856c-6f5a3daa3962@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:40:59 +0300
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
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: qcom,camcc-sm8250: add
 interconnect provider
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
 <20261016170701.1504338-2-atanas.filipov@oss.qualcomm.com>
 <20261020-bloodhound-of-remarkable-debate-11afe3@quoll>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261020-bloodhound-of-remarkable-debate-11afe3@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: G3DoO1RRI-ArApX2fcAeY8Zt8D_pATGr
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad71b0f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=YZ1k_EG-GQ4t5jaSdRAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX2v0EvR1SZUTj
 jBtMQ9o2BItxPw5Slzqtx1saJBSWTfRgswsdn8k5+Ot8VaXtXx5lsaa++PoK3ChExDG++ewhBVs
 x+cZO7T6b1xUJiqAwDd+VKqVOvyK834dGCqm2zD0vHrIurJcXnZytojpJ3K7SwPrKR6zxNSI3Vz
 +6bjJ2Gr6FzLyCrAuum2rdlA6d/rNBsTDg2swaSsaW9w/SHBuMIfhp0FcBiksPFnfiHxwCDs35T
 nOXO1DSwoxdvVcCu3agEz1pVJaQ1D/1COl97VEjCzgInHPXO2qLGx2mkhlIzp/dQePhARacUnIM
 rY/+LzaDDG5JpP/SE3Lw0pkZvQwBrqf8wW3dGnxVPZxrsKB5hcKn/l8KrWL13xG1eBqvas/Q32S
 AYbvd100xfxaq/OiSbKLNw8qAn8fEQxGkA73+iQaqa36v+vUefBpBG/t5owTeRICabjw0aUKTnf
 TtLeB/6N7wYLatM7JLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX0a7aqwhj8SX1
 Iq4AlZRUwyIugKwE3h/DMsm2ipKluJlFcjPlltAoGKEAWkdAGGVsLyfOobhvZT/IHKq7WYTV0d/
 fQaDEZpnGtOFDZEUts/C8KAz7nL7RJQ=
X-Proofpoint-ORIG-GUID: G3DoO1RRI-ArApX2fcAeY8Zt8D_pATGr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200030

Hi Krzysztof,

On 10/20/2026 10:12 AM, Krzysztof Kozlowski wrote:
> On Fri, Oct 16, 2026 at 08:06:59PM +0300, Atanas Filipov wrote:
>> CAM_CC_CAMNOC_AXI_CLK is shared by several camera blocks. Setting its
> 
> Clock is not an interconnect, although AXI suggests this could be
> something with bus, but it seems you solve driver problem with
> interconnect description.
> 
> If you only need to solve "last writer" problem, why not fixing the
> clock framework to accept the votes? Otherwise this should have
> description why it is an interconnect.

There are two approaches which we have looked in to resolving the sharing of the AXI clock.

1. The drivers newer touch this clock but vote on new icc camera which controls this clock (The v1 and v2) patches.

2. Use icc-clk in the extension in clock framework same approach as: 
https://lore.kernel.org/all/20240430064214.2030013-6-quic_varada@quicinc.com/
This is already merged and i believe resolved similar issue. 

3. Which you are proposing to have clock framework to accept the votes.

Before we jump and implement the v4 it will be really good to have common agreement on which direction to go.

Regards,
~Gjorgji
