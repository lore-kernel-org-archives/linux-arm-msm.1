Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579368;
	b=nWQBkwqsPCJWP3Qx3kPQoxaG7ZrBnYEx1WXhgsLv+0ZFKUiAbsEQNUCGYxwS8TD1d2Bo
	 XJqATlRAbLdIplppdb2YyPv5OApxpEnWycA4vGZHfH4mD5UUR74FdQE3urbaA5ScYCtJP
	 qvbxwJd9ViZ51bpC5yH9QdIbiGmLs0GVj5AsDuhn7VhwNw4q5Bj9Zy+60GxH+CBMGkwYa
	 Yas0o9rI/idDIu980An87/2ohHucjaqSZ3zij3eNtktgRNTS1wkxNvJTS/SU6qq6G5qCr
	 lbEDHbYdbTW0KZZrKXyLICe7YTWVGKFYqOVrgYHN4Zl1ay3wFeHdOCjIHFudQoTeSEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579368;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cDr4z92Vg2vGjbMP4QfEv5oW9ZFER0bgpZkmEeJldKQ=;
	b=vW3fuUB5/aOuu3yATq2/y3DCCfN0aiE9rhJ51LAlKctrZhvlWYA+EHk9yaxGEVWwKGC4
	 UEidJUZ9FXvVEshKkERmUGckIfh9Pf9+eF696qyrOB2E6gY2AuRlqyJDjbfeJv8K31KzF
	 T/sWITN/PdoMllkTXjfoNnOY3YJRzXl2Z6DkI+uOPXqS+MBHJgso1frGeXWB9BLdOcQx/
	 n6GQQvCLlsjkUTjEdsP9Quom5F9JTifiXpJJSY2X7Ut9m1LfE6RLGwlqj84YXDuSRCykI
	 BesPEtfLyhqCp2Z4c7o23ZEHPtKZ60PXrYYH6aoJHQh5WAX6Xsyjyqy4DPCRPdfW43Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MZBI3eGB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="kX6/UWCR";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F54C606A31D
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F54C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MZBI3eGB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kX6/UWCR
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA6HPZ4170559
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cDr4z92Vg2vGjbMP4QfEv5oW9ZFER0bgpZkmEeJldKQ=; b=MZBI3eGBJ/uhGQ41
	SaQnds05VkpHjBzXDoJgOgh/0+HHDJYGFE8yIw1x98wpssQk8b9P4m6t3b4JhckQ
	iOAD8Nnzyp8/y8oGiv8VlgeENkedwh1Ko85bB1rPboQczRTDW632HRMXlUcBst0A
	LVveZZANXMyKPPC31TjtTwJZ6yRiJ9kNoaDOGQWat5tHtqbnK3i4Xeta7okO8jNN
	jjAQqo4cA4CgIXIUwy5M53tHUJMLCeRi+3fAchfqzF5+6/6srUeaFwkMyq6JLX8Z
	wU0snWaxXoqddtFnPX9pM/ofCvEHSM3zHY9DO44iMIMsrUxs270lvip2NKII9tkU
	uvAtHA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9huggc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:42:46 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9179ef12a03so3167046d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 03:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792579366; x=1793184166; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cDr4z92Vg2vGjbMP4QfEv5oW9ZFER0bgpZkmEeJldKQ=;
        b=kX6/UWCRHq6WtDGt3zG91bUrJ7HN30LPS3vyqc0vlYRIsivtXRi4OpVAqacpjS52zJ
         lHHdP04to4c6UynJOnpPjaU/OfWybQRlIJdJRP5OuHEdlYbLOWizBcxWGcayCBTE/rDi
         lTkOBgEitPPkRBT2o8+bBEKtdpkkh6hg+pUqS2F+oYv8DS1BNx/ERdZH1MX1nUpbezLc
         reiA5X80wrfbcaTfaOyvWDRFIdahjoYkDfrsU0AKI8On5MXMLN8Uwx9gN+F5H4KWsH9m
         ZqVpFaZpNsDWMBbxGet/NFgeAhAf1CLWDODCMX4aa+eSndYvypGHXxCnsVG+lhGF/G7N
         +uoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579366; x=1793184166;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cDr4z92Vg2vGjbMP4QfEv5oW9ZFER0bgpZkmEeJldKQ=;
        b=R8VYBoVmyO51Bdp8UodTu+CC/W+b1Iv22zDTKWuFuMfm7Tncxj55Pb2N6NK7FhBnRF
         Uvgz2LrPNJY+J67B/JAmcLgjQHh+kOmW0E8z5sz+pdKbyClpDiS4GeJ8sDqweq8WmHN2
         8RtinA4NK0N9zbboWJVzuxCy116VcwKEBaSomdwPqMb9vWRzL79Avwc8S4OJ+MFnNIiu
         IjUlTwtagVSV60eDXIk61hrf4C5vwobPlwvQb3L28GiGb0BtgOCGNWdcdtyvpwjupNOT
         XT/licSWgUCKpGNTwd67UmEGYMlmAMlXu5/jFiUKMUvm+eO+S22E6PAhRJ7d6VCHOSMY
         Mitw==
X-Forwarded-Encrypted: i=1; AKwUvByCwF5QmGik8kdT8gY9H9T6qY7WTr5rYAtjj1VGP7L/NVzjuTHPFtrUWIy71xQLD3kZebecQ8hCcFF2869/@vger.kernel.org
X-Gm-Message-State: AFq9FYJym72s69s60ycKX+PAxjOwe/eGzVJT1Fxhdni1o5cWi/VyVkgL
	+VaylfRUrICgzp8N2nf6q2lgxMJ1onyj6nR7F76UNjl8lGl/jhzyThcLZdX88TW2T+SxkbT5+KK
	PI795rzsuidYTC91pBu3vx/rHKdbr+xOiz92Cx5HBjSWdgfsuqpqoztZblEKm2uBTsoYh
X-Gm-Gg: AYBFou3O6+P3BpmGLcdDmVr/r3wgTr0H8uru1NemJB8JvI+MxOdSNeBt463rOajbOlE
	5EpJ1BU5VKkPT+sf73mxm3JnjGQCEqQt6dLi9JLC6Hn60PyHlrlnfvW5+jW+LGpx2BrWgqwXLQQ
	wnMTAZoYeJaoisBjZVoVefSMobrbOwGhyKr2hOmrmgpqVbQdjIAFjsaJLyzKnpC/f+2lZsDFVry
	Bm2mM4QYtt3s7D+63JSZkEOaaSfUMDOlb1IvZ4JKblfW3YYc26PcPdJyN9ywAMjJ5ZoX5wdagCy
	xmBCbBKDCaiyOl6ZBL7gwcG7qUAVaoTsZkauAzrQ0Yng2E9aS5vrjwxrInw4dnHCi0tdr3S1tTD
	0bQjbnuwC5BfusHkvqSRqdg==
X-Received: by 2002:a05:622a:1aa5:b0:52e:3991:84c8 with SMTP id d75a77b69052e-5369b5536dfmr27588071cf.2.1792579365838;
        Wed, 21 Oct 2026 03:42:45 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa5:b0:52e:3991:84c8 with SMTP id d75a77b69052e-5369b5536dfmr27587491cf.2.1792579364515;
        Wed, 21 Oct 2026 03:42:44 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678faa5b0sm64563866b.37.2026.10.21.03.42.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:42:43 -0700 (PDT)
Message-ID: <4cf59328-843a-40f4-bb9b-8fc5b9fcd574@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:42:41 +0200
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
Subject: Re: [PATCH v3 3/7] i2c: qcom-cci: Detect capabilities from
 CCI_HW_VERSION at runtime
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-cci-imp-v3-0-5ee7ec1ea1a1@oss.qualcomm.com>
 <20261016-cci-imp-v3-3-5ee7ec1ea1a1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-cci-imp-v3-3-5ee7ec1ea1a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad89726 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=NORypjkHWnF_li2zo8gA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfXw03TQKuWFehU
 UGtvuZlD56c7txkKZeZY+RpHSLaSQm9OmWdLJ+mJMYKnY0YNJ66/MfQOF5GuIi2+/DdoU7sSvYK
 2+rZ5yjN7KvIEiwP5UpI0I9wQWeqB34=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfXwe3+i9kANj/a
 Uz6ERZ0TtaZXXPNcMQ9bU+JWwsaGvplIUsURNGI1JLTL+ddrXtG1PMC6ZWDJ5+Rh7iZrsA3nSeU
 APLex0/ZWtwCI1L2c7FRVUyFWlx3i5iVUnlL8YfeXOmz3LGahtLuR9hpO3ZjEG9p86aa3gQy+Oi
 sMgTFbHv/kvVS0kBvjT+atQvEwO7K7SJO9IvLATjDukZj3hCCrhDNnYVxYZa9xobVa4oAcCXqzX
 AmSaJwA/IhI7aZWOxoB6elEDR1QS3D55SAXcGp8PaPecsJt5YdU8I7gk9VKB5pkvUVTWIF8j7py
 bNuxduJudOseHVIxzDIhwZAfOY5Tj6vPybLCGMpOqc0SlPDWfoS+/afcBTCKS917SBkZg4ooWud
 6lpaN4kBxlAyIk2LlWfO13E+R/+IGxSiZ1elWd0+iAWigWvVG97OT5Y/0JS3udqyNl3HuBfMbGg
 OWJNuf128VIYGaPcgBQ==
X-Proofpoint-GUID: rRXN-lsHEk-qkChMGhBs56YmZOOVQQxe
X-Proofpoint-ORIG-GUID: rRXN-lsHEk-qkChMGhBs56YmZOOVQQxe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210042

On 10/16/26 10:00 AM, Loic Poulain wrote:
> In theory, every SoC integrating a CCI revision that differs from
> an existing one should introduce a dedicated compatible string.
> In practice, most CCI instances still fall back to the msm8996
> compat (v1.4.0), one of the oldest supported versions. In order
> to take advantage of capabilities introduced in later versions,
> such as larger queues (v1.6.0) or threshold IRQ support (v1.7.0),
> we need to properly distinguish the different variants.
> 
> Replace the static per-compatible cci_data definitions with a
> version-sorted capability table keyed by (hw_major, hw_minor).
> During probe, read CCI hardware revision register and select
> the newest capability entry whose version is less than or equal
> to the detected hardware revision. This allows revisions to
> automatically inherit the closest supported capability set
> without requiring additional compatible strings.
> 
> Several compatibles that currently fall back to the msm8996
> configuration (e.g. sdm845, sm8250 and sm8450) will now resolve
> to the corresponding capability tier, gaining access to their
> larger queue sizes instead of the conservative msm8996 defaults.
> 
> - v1.2.x CCI increase I2C write payload + burst write support
> - v1.6.x CCI has increased queue sizes (64,16) -> (128,32)
> - v1.7.x CCI introduces threshold IRQs (leveraged later)
> - v1.10.x CCI increase queue 0 size (128) -> (1024)
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
