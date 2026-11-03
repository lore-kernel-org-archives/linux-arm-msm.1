Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793700576;
	b=02wQqGqc6tq+N5e+uGANyNC3RZjVi+04zLobd9Ryk99WCp+1VnUqoSumS/r6uwU0qsEE
	 3QcqHnYgCapepAMRKLS+J3WC6GLKB33wrQi5j4feW4erftgKQsTpVjxY7enTrCCS2DOnJ
	 l2vet+luA7xfBc5is2WzL4fUg7aY6DNTbWtYQSXlabJf6IvtN2s4z/J0avF5o4pg6hYSk
	 KKRwejs0DqSIMkTmyYyaAfeIgOO4+tC3uwpMet+zL5rVk8cR5jPrs9JNPoPLYB2TDd1qd
	 7Z5S8Ur1SII8qh78uMSq9Y+vFuSUe0Oqx6rSGFq6NsHAH6jusL8++cvCyfVBJxnsFJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793700576;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QQ8twuEJ5meSbMw6ETl2SRtG0VXLH1wyQ/qz8n5Y1kU=;
	b=z/1TNYTcvv5l1/CIW+bj8NP3zXGTLQwy8l8C7IZHXPwucDws0+gxBuvIYHol17kYuAZs
	 wCqXAyXMjv/xBNOqvJYSNsY4T3aLEjLWXzYX4zU+vl5ul2Ucn1VOV+xHi6jYO4wMZL6Ye
	 06TWeAeHB7Ews+MMe3hd+et3wIQi8zOGqxjl7Q8FZuwPAbEGOpr/hE2NWq0yXmFfT0NW+
	 Kh37/C7t23cgTRlmzd5N54Y0s1YoYdvqFPzxfI3OnketlqxeVdqcf9oDa+g2kOpTM99ah
	 6t+UdgZxhAlyFcVeFMbAC7QsIEhfVzcX1HBWkbY5Bi/BZa617gHKqflqDOW9Rxi701Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FVswWsur;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BVpyWTgu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DD5606C542
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 10:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9DD5606C542
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FVswWsur;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BVpyWTgu
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A38CxqG1082278
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 10:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QQ8twuEJ5meSbMw6ETl2SRtG0VXLH1wyQ/qz8n5Y1kU=; b=FVswWsurstDEMrrU
	w+tfoqutVbOqqOlCgZzgL+6C3MdtINlpK+m+oWDnotKSTx0q+fMikAhDWf80GQj5
	NJ2QbedhTAixPap/UVSIGZyP5b9lG+UtMzoAayFXHLfV1lDtjmx4fYqitc0G+QLE
	AwNcapM8NGZiD368H6FizAOUzsXO7FH/rpNPWoX29Tc/rId6d4jbzytPv7HZ+Gk2
	9JSvNvLje0ae/cCEqopLqBQXU67gzxkgvOqczzkWCy+YnNFpxUandO4CE4C4ecgX
	NnbVGq8wSMtSety3enTnqnjwbfE/RaNh72t8XXNLN6DbK2JeEXIQohQrm7cAjIwP
	r4NjyQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r36rm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 10:09:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c7047e84aso13732916d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 02:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793700574; x=1794305374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QQ8twuEJ5meSbMw6ETl2SRtG0VXLH1wyQ/qz8n5Y1kU=;
        b=BVpyWTgu7WDTZUzwLZQ2RBLxJuB4ZCB1jLcFFUrQ7Q/x+yP4I/8rVDcOxxMQGoy5bX
         Qu1mxp28O4vBFv4X6F6T4q37XQb4WtxkXMW8sCyJlwdy5yin9mkmLiCbuT7PXdvNqY31
         blrWVqDCijparo/7wmEHTWC2uVF9feoVbrHOH0/neMRQqrQRCPwO7sRJ+aPTqzNKdVdM
         8CMjW+EAwt0HA3LrS69QYF1HUcYsJpy7+Oyot1gv2D4+awnVJaC9pLVcOY+hmyRuZ2rz
         A/Bqk7Lx+8BobpgV9qdFZV9cJIXXdS/Q+eOGS4+eFfpK7PpXM0jEFQNGQ95UjzoF5DTT
         2b4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793700574; x=1794305374;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QQ8twuEJ5meSbMw6ETl2SRtG0VXLH1wyQ/qz8n5Y1kU=;
        b=pwbDbR69IQ2DHLL1Q2fOWeNJgnVlrvKkC51E5X37TBXVT56suCRu0MiTHAFjmWSMLO
         3JUkL3y1lw5SDJYbYRQMRBflKEqutIuUIDoLTIO9IOFe6wQ3LNWU0b4Txq9drDUu9U/y
         tm4+PRTK3J1XTXQ7yhC7h5U9+FmSrwqVILkwGT+sVfcbndQ53gw2euobMZUbBn+L9a3a
         l5Tb3eb+fDMBtJXcmsaBNmLwkCWZfWx6/QYkdoBjvcdx0DtCLgqs/NzzWVF93oT3+6Yt
         YQRPEKRlwt54jGFjGjVcn3VJlOxq4sL+PLY/nMTggM6+rK58zQsC5gnj1z+K0WKvJqBp
         L2iw==
X-Forwarded-Encrypted: i=1; AKwUvBxAU3aj/Y8rg/v3pWJuQRXFKD72GvoAp6IejT95OeuN0Q8ETJQgIyNt3WJx8zGovYQdnqig6FkZaBv2ZGah@vger.kernel.org
X-Gm-Message-State: APuU4Z9kRZ+3aRk5UsWarjhIUprXVmxfaz4qFez0EzwTSnYowWCn9YZA
	kfAM+HAa0T9DYRcH0nHgYDNW/hr2zH9jC2ludHOpHThaNZ1O0MYe/DmxTyd5HzIH9T7i9YhsQn3
	IV8UoBpDv2i/wv7URDOHZ9KSzk8WMcv4szEMDWmhYCmsp0k5zhSg6LzToNJSHLJYGTXCy
X-Gm-Gg: AYBFou1jJE7ca7dToobjUxtoT1DOAEi1CtHCWoytrirxFrUjVxCPsj7V3KUAYXrgTCX
	ggC9JNe5TABebK8gDd+8v+oL6GabjbTqOkOjTLN5iaAb/NtfIa0FkLi6ZLE2/t9T3IEY0wbI20W
	GoUDhHrq3H74EC8vg0/R7s2is+vlsGd1VJZTvpmj44T+qW30XADHA27CyhC8CW3uKj7AiukBeEW
	bCfBq6d1Tq0OwgLUJYY2RMZCU5t/anV0+k/57s82iPHVTlafA6CWFUwrwfgOdB26ggSqwHQ8oyK
	pp005RPsfEdfGGBUgScaDkP338KvQWysJ7XQcw/4KsjpvTMdmGTsDcnR5wziA+a/We9u03cGy2m
	PLpanU6D9PEzjZDcAEo9N5kzm+7i/nVNVyWxC9M+9+6+n5Hd1/0hPPvb8juWodaI1Tfr03g==
X-Received: by 2002:a05:622a:8458:20b0:536:27d7:abee with SMTP id d75a77b69052e-542b443bb1bmr203162711cf.2.1793700573879;
        Tue, 03 Nov 2026 02:09:33 -0800 (PST)
X-Received: by 2002:a05:622a:8458:20b0:536:27d7:abee with SMTP id d75a77b69052e-542b443bb1bmr203162281cf.2.1793700573226;
        Tue, 03 Nov 2026 02:09:33 -0800 (PST)
Received: from [192.168.226.81] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca2112bsm4247945a12.32.2026.11.03.02.09.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 02:09:32 -0800 (PST)
Message-ID: <4db1afd4-d56e-4118-a467-33acfc96e4fd@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 11:09:30 +0100
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
Subject: Re: [PATCH] spmi: pmic-arb: bound id before using it as the IRQ ID
 field in spec_to_hwirq()
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
References: <20261103-spmi-pmic-arb-fieldprep-fix-v1-1-405bc58b5565@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261103-spmi-pmic-arb-fieldprep-fix-v1-1-405bc58b5565@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MktmtOkTD4Y9Yk_kIEMVb05IE_7LVseL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0MCBTYWx0ZWRfXxniCU1LEf1BH
 miT64EWfWxzBKbI/NY5Xdp3xoQmk3+3jAQG1VCcukctMJjIpK4X6g3RXTw+gFum0CLNeQBTeUH+
 1wSlvTioGJzT6krnSppcKmaV6tvDYW8FVLv38wzVgXSAaAQ7pgmdIoJIo8ZvJfvxd3AB4FO3IG3
 dwCwEDi9AEloejecN9YdkSl2PwEDJ1qz480nojGJ9+zupCS7QLEXtivJfLWFhaN8Ru0AmAV5Tn9
 hyv+ik9lJWca8+39rsJ5IphwHlapt0eQo4E20N/wBqd2rGWIx1JBf3VAMIZZJS9U2yu0UM438PX
 mULvqtIVeyF7gLswxfqk5l/oMS+mwxkcajdRGmKNN8VWnzMUXtUf8vUu5l0kD5+96pX2f09VA8/
 e8hu49nkFIgrrvBPV4LoqNbwcFHO3W5suaxLrh4tgjMMp5FkwbBqR0prWnd90ki+SHzzasWljsj
 boEOpnEwIOy7lJX+bCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0MCBTYWx0ZWRfXzS4ikfq0Dp7u
 FSJAGZC+IAhL8pXpTakXjO8fK+5bHJchbC6cUlJh3fgpo6SdT6KvU6PfkqUpayENMoPJVdAxdaf
 XpUlj6hfeHwsO7TVm3lfPqr3FHwxsW8=
X-Proofpoint-GUID: MktmtOkTD4Y9Yk_kIEMVb05IE_7LVseL
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae9b2de cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=VGL-YO-I9sm8S5do92AA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030040

On 11/3/26 11:05 AM, Jishnu Prakash wrote:
> periph_interrupt() derives id from ffs(status) - 1, giving the compiler
> no source-level guarantee that id stays within the 3-bit range of
> HWIRQ_IRQID_MASK before it is passed to spec_to_hwirq()'s
> FIELD_PREP(HWIRQ_IRQID_MASK, id). On targets where ffs() has no native
> instruction and is expanded in software (e.g. MIPS), the expansion's
> internal handling of the "no bit set" case lets some compilers prove id
> is a literal that overflows the field along that path, even though the
> enclosing while (status) loop guarantees it is never taken. This trips
> FIELD_PREP()'s compile-time "value too large for the field" check.
> 
> Clamp id to HWIRQ_IRQID_MASK's width (via FIELD_MAX()) right after
> computing it, so the "no bit set" literal is bounded to the field's max
> value instead of overflowing it.
> 
> Root cause and fix were diagnosed and verified with AI assistance.
> Reviewed and tested by the author.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610260532.Zb5KDgRE-lkp@intel.com/
> Fixes: 815be38ad8c8 ("spmi: spmi-pmic-arb: add support for PMIC arbiter v8")
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
