Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08C63BE146
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 10:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787913074; cv=none; b=o0pIUK5ez4UdkXlP7wxM/3NjQJJR5/Ijm+4CQH8a76i/WsYLMajqlHgyZCtcIxwC1pcN+OL0UScXRTyw7+BdR9yfB7GBPQd0mPt17tQ/rqy2rphQBvzqXEAUzY+7Jvma1wqJ3QcjRWtM5JxVyTeIImPVdUmSEkydETxbyKEJn8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787913074; c=relaxed/simple;
	bh=86m+jQtyiDryJ353TE2T4jiTNSZGNRO0xDytgpSXI1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BguH65XKGIygGzmktaYMjmSLkjnK/zQtlyDQand6ERwq1ohhLcEM60jAHwhW30qvpjPa1IFwlhQcAYo3HnydGUyvTS2YQGtFjmdnjT1rvJxMAWPC7AEmKkKtis0o6nYi3pHX595TrdB1Dx9KNwGfNDoSikVMDsC5+TRRKo9/Cpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JypFwzu+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EAngVh37; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JypFwzu+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EAngVh37"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7q032152710
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 10:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MWfXPLTIqZ8F+cOvXMBdex/bsjYfL0IY7JVkckd48MA=; b=JypFwzu+6NxzF72r
	NZocvz6woGlKWVhwUXEcIhNWPeQYsAjJPYe6HQ1x9k02iWSsgOUef2bAj4J+O9YK
	duoGoYl5gqmUmvJOjOFPt/BTw2Nupd1r7q81k4PLax0UYaimnIM+KvqH9dhI2YvE
	mVNaA43oQRRXnzVzfl6hCjuqqopvNveaUfNm9DfGP4O/5Yj8eI0s2GdFV04z7yET
	bku2h4Bl7ds1S+zpDEW/cVfFsjfmS76bl/TtGuhwBjjMvjifbPT0zFTJMA2nvT3/
	J3XcbKos1eUbn1vaenC48ePjBEvEd0apNipYbnjKOC9TGiWtUf4jVaBFUSN8llC0
	+VfhSQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb42r97u8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 10:31:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9390890ae83so19456885a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 03:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787913071; x=1788517871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MWfXPLTIqZ8F+cOvXMBdex/bsjYfL0IY7JVkckd48MA=;
        b=EAngVh37dkjLY97X8L8R+3efxRHeepfFHq5Ms9HeRMlYM8adQ9c4IThb+AN9blqfyE
         mUapAomsIgtAfznV5zEeDl0nY6ox1Jfqhv2t3mKgvt0MWDDgdOT9ygnDSk84wUy9c2f3
         cAUQRuRh00EPOtVcpK6r98odDBJNSIbdloVpx5JGk/Jx9HKfa7z97JC3DJ/9mibObNE4
         0OE/ewNWeNQoRv3pJFSqqU9cbKJlNU+77YDHJJ8VeW07KsGB7RRWY4hRGNhd88aqC5tx
         CSSKcBdXVlglXoUMnEpy7UJubAgbKO8A+IvyujzYzyu0euTCMZ8a1py+8dWmG4d7PBmb
         EVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787913071; x=1788517871;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MWfXPLTIqZ8F+cOvXMBdex/bsjYfL0IY7JVkckd48MA=;
        b=gUkcChEuMHIBO/3AMEXFLCP/59YS1GcP2PaWS8JPPVqJbj+GChJTgqA+84RTZjYsME
         +YocXzUzreZ5sl/Q1APKgtLqxEyDL9zNUJ8HpXVqeihRX+maPyjKekMGjWgJ4db5/sk/
         yr8TGRWwDjUrmdaGA+ka80xprxxI0g6qIMy47CqPc5QVaeWIqtz0Ad+nAoSiH1awDD4a
         b4Qasj+JSmJMAJNpMow4Dkj+GIuK1Td2Uu0k8+eJnhEJL67RB8c5X+QSQJNPwSxv+Q8w
         K7eXomxgcIfv26Q3cXJcgTG/8xkah/5rksq6aNLO7+vENvwUKr3+aDA5NX6lMpD9OFsm
         0AMA==
X-Gm-Message-State: AFuF++kvFuvmsvwL06HJS9No+Zkk5RffYaYEVJSPoJuhUaAMasTff78L
	5McjZQ/fKwE6lhDTIjo5NfUh9Vr6nXLUwKHfy2f7YUes9Z2Jh7JW92pzdhLgBoLZrqsS/P1wQHk
	5RINfEQFc1Ksu0JHsOhCbg13Mfq7Sh7Z7Wt/iJQ6+GAmim1XpR6OW3Mpo7o7jpNsHhqsO
X-Gm-Gg: AR+sD11Fp6R5ONGC22ey3kLBSH3gIoRNdFiFnAszSs5gAr4LhxOrlOEGQuN/kEI+69G
	pPb8i8k9ZvDzNCLqiUQHMaLoP1RrlepFORHGblZiIBT/lfZq4+immN+aHX38wj4E8rh7Wzmc3xt
	kDlKUSe9fXNg9V+lz9e+pH1hGn3vZjSSMPj4tJy0VjQ4L5NwCl8x+8gSqe38ah5hikPPVrTLpz3
	PjXkwnA92JEHABLo+vIENbZRkNGWM7WWy0dyJ91h9YhsyeU29HNO/c+N2NDlM6oGVdsRN/mXBsI
	UidInXRxOF7LfyDrJskN77BJ9AljF4XLx09abQWpr5mbGi0gqM62Pxz55mP+l9b07IuYXL007Vy
	7TzAk5h65XCgzzqx6CGFDs6A=
X-Received: by 2002:a05:620a:4591:b0:936:5ad0:fdae with SMTP id af79cd13be357-93913968806mr378476885a.4.1787913071093;
        Fri, 28 Aug 2026 03:31:11 -0700 (PDT)
X-Received: by 2002:a05:620a:4591:b0:936:5ad0:fdae with SMTP id af79cd13be357-93913968806mr378467885a.4.1787913070418;
        Fri, 28 Aug 2026 03:31:10 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1fb4c3sm66033366b.48.2026.08.28.03.31.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 03:31:09 -0700 (PDT)
Message-ID: <620ac0de-0e40-4216-803d-23e7f0e49e12@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 12:31:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: smem: Fix byte order in v3 14-frequency parser
To: Linmao Li <lilinmao@kylinos.cn>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260827020447.2642830-1-lilinmao@kylinos.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827020447.2642830-1-lilinmao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: b9X_MMRuxn8dguFRxkNbr5PQqZE_MdkC
X-Proofpoint-ORIG-GUID: b9X_MMRuxn8dguFRxkNbr5PQqZE_MdkC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA4OSBTYWx0ZWRfX6VNALMJ4FW0A
 kwo3YLI7xtYaU+lIFmJpefjYZy69wQNZoc6Z24S1Um0hMDBNP8eVd4KoVnaPFPwQdTcUU9G9jso
 woHYRoj73nt5oR6q5X2Ek9PjenGEan3rOZLyqw+2dZuitOCKQSV/GMYfZxgia/sun2z0bfxAN81
 Pib18fETS5/gViIUpBOo1AA7ikK5UKpdYsTx44vB4wwqlF45MrMAahmZt7aG/+NEnWTq8+GLWbo
 WvZJB93ssMauwnqGrmyui9ANTPej2JJAoq7i7BHrZroZpU7WNWE9y9/j/ndXJUgItGG91mE6vJ8
 GURmUNNoap/Mg97eu2F5ruG6kQJ6QU+JbVAuB/rzrfJSAPAuRZDPF/t5cPv+noZU/hKLD/eWhfa
 IvoD+e54eS4RGIcg1CKH/hGaeslx3Eo1zYCwvq3w6LyuDaTvk7gamxhHXmvrBH9CxnJbgHz++kE
 DZ3G3BkpUTQ79tQhBrQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA4OSBTYWx0ZWRfXwQ9Gc9roFCcH
 Tb2TwZZVaDZFt7OpzhzeRkKAIgzn2Y8uVSuKfYh8CTAz7yhBxKDA7zyxyeKfdGVxZOB+qlgFbcI
 o1O9graVGRMPaLf7+gFL5tv41aybqKw=
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=6a91636f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=jKcKMFfexBXHAC4AiDYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280089

On 8/27/26 4:04 AM, Linmao Li wrote:
> smem_dram_parse_v3_14freqs_data() uses the little-endian
> freq_khz field directly when scaling the frequency from kHz to Hz. This
> produces byte-swapped values on big-endian systems.
> 
> Convert freq_khz to CPU byte order before using it, as the other DDR
> data parsers do.
> 
> Fixes: 1d234eeafc56 ("soc: qcom: smem: Expose DDR data from SMEM")
> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
