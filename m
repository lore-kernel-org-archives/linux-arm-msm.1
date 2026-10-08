Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481D33A872D
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 19:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791488742; cv=none; b=kWKTM6u6KqeqLbDvsQa0hZ3HsrUBmoBD0irZT4H91mQhqCoR1EPP17D0Z898S/2TnRjQQl3dyLM7G5naBApimMK5aPALq5LMZ66wEHTVcs0WxJhgNNJmikl2q0CZHDgH+bUFT2SzLb4Scx3iOMoHf34XNRDV6hc5p4xNDgeMVQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791488742; c=relaxed/simple;
	bh=SiXKJG2PO/AmoGF7S8/huQmSfsdK7b1//FbyQBx6Qu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N+q/89ZWT9D/uu9HOd2WGE/RVsIPoaEmOIAxkEBhaqVllj8ffc2OHNK5NfD/3SASeMsm4h9lR/gr1FUzznfaFGZSf9ZPgv+g+lPzvxwJS0Bagjy4u/K20+4eDKbbVCQlEZfmEQjXSEDhwQu5VM2MJ7NGnhDNIGdYr3UJYW/Riio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jfD1vmY5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Do7lx9PT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jfD1vmY5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Do7lx9PT"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698HsaXT3964497
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 19:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jb2QYRx23fNHLxJQ4komYZKPnagAt7gtPXM7krNr7DE=; b=jfD1vmY56ONHOBmP
	X6r+b5uQuumr4j3GXxzT9masxHagH4dB/UtE8UKFF4Hb2CWaW/ZPEhdj3fB8YDEJ
	hXuEhvOqYSux4hKQaCGyFrjimPTax5zA5XG0whEo91qQw3xC4vm6wM2HYLstMZmy
	R+lELEbP8pufCors9y3dVEdJwXoOGgkuo7soUvdSa3pQ+34r92oR3rZpyFyOTaA5
	Wj98cnRktpmBxBwaI1pmAhYD06mnoEg+ZxgMeqNDG8K80gHSiPRvazv1NszL9Xm7
	TbA6+WSZ4Hj0HlGxNAxiEgONywIMp/d00DYwMDx9zHSzbAXHluwYzUYv+W9wgFhh
	nvhdRA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fyj0cxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 19:45:40 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3515d2fc5ebso8824985eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 12:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791488739; x=1792093539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jb2QYRx23fNHLxJQ4komYZKPnagAt7gtPXM7krNr7DE=;
        b=Do7lx9PT4eQMy1r6P3P0rq/ybRyrXn1pbwOjztFBZrrjtkK8BnPIlztsDG4udQt4oD
         +zDvjsGNICCIuXXHSkV/DrX9a9hwRXpXBcBnlKDkbwnCrZsJkos6TQxU8o8nonQsT86z
         L7yx94SMN47yvXnow2jHw4zPEZakiXDlD7UhxU3S4dfJInodmEFvvdlww5xBg7AAekT6
         U6isEJ2ZldAWWNCJBFzuZGWKKyJqCDmaJP6BpqqiX/7m2K60R3TI6ZEJvVmtoiyXyjlv
         36fXho401oMUJZ0vD61K9PaPojQIG5PVw2kA/Bwf4hzpu0D8UF40LSXEjlYl7epu1LEk
         33Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488739; x=1792093539;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jb2QYRx23fNHLxJQ4komYZKPnagAt7gtPXM7krNr7DE=;
        b=C9YXwiIqNlMI+w1/daH3r1N0fOpLuB64V+XZEBCJnB2ZaoFpBnrsp0aIhVmBEJ3Zxi
         p44Z8xWgEJhIF/gIevum//VYIXfg3lKgWc57LVef6/PvHrxRZvR1wecwu6lr82wAqrZQ
         CCsV4VZLV/QKGUJNINxSQ0G27bxpvmlOE/7rrkRQ06rj/rMByetkXMru7djQyD2L2Axr
         FT31nbVUohi7Mqz1SLuKZEk8Bhy74/Eb4K73S1IxxJu7WAef+ksggtAHpWEvyYmtjeGM
         Ej2Kd2CshCJ40xxoAUI0ApaPhEG5CLVuTCM+EHWIDq3OrCy+ai4vGYinSm2XEVOrmouG
         tc8w==
X-Forwarded-Encrypted: i=1; AKwUvBx5kWpdZL8ztHhWSbc3/96hoARu+ERe4kXXsl/EvNeJ+VumRPlTHWuJEZqREklpO1An8ht/Dpa9Bk5lsGxa@vger.kernel.org
X-Gm-Message-State: AFq9FYLTccAxIQlBJ2GUBARVOVgVd1g/EovamBPDg4xW1hCmh9q294o+
	Vx42T30yMF78w3um7YKVaMWSPt6nt2HzdeqUv/ZMSWBzoZZmS3knhBn32FPGmWVNkL/XPzD9f85
	/wbGoNCRsEROEr+iukSZ6xPh7/R2fImuOS1+xyE0L+elVUzoxAKfZ0M3fBFi/KcAjiCr6
X-Gm-Gg: AYBFou3M3GNwHm5TVBa0rs+Y7EV23IC33MVMPhF8VhrlLh8sAW3tssdMwyGzni3R1WB
	YhDCmYUnsS0pr2JVJrnsKyU4k0gzdrwuDp3Ut64+p3+r2zmGVK7wDI+HFnDzYwEf8gYhXNjt7Uk
	8UdAMrlLkIlXW+/G83xvdukr48uoOcD1uIiTe9BS8MXRQhfsUWeXtjtboauqzVCCyky64GX9bDp
	L9toUMTggcCi++QPpNAievpaLLWlyIfvLRRONjkes4kQPUT0T+wUUkNbOGem7KBNs9rtJs5jnff
	LSM6GzQ11HQzJp2qCRvI+7NYWFLurdDz6D7CUvnZz98Q5yvBNB0/fqP+XOT3ZZexaxSmzxyhjJv
	GOD329lyxObIDuLVM8lP6+xuRdJXET97hbw==
X-Received: by 2002:a05:7301:5414:b0:352:2e10:10c3 with SMTP id 5a478bee46e88-3535f43829cmr468301eec.36.1791488738853;
        Thu, 08 Oct 2026 12:45:38 -0700 (PDT)
X-Received: by 2002:a05:7301:5414:b0:352:2e10:10c3 with SMTP id 5a478bee46e88-3535f43829cmr468256eec.36.1791488738093;
        Thu, 08 Oct 2026 12:45:38 -0700 (PDT)
Received: from [192.168.1.2] ([106.222.229.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm277985eec.9.2026.10.08.12.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 12:45:37 -0700 (PDT)
Message-ID: <dbc848a0-c963-4715-a3c1-7c669142d28d@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 01:15:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] spi: qcom-geni: Use geni_se_set_rate() for setting
 source clock frequency
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-6-091697dbeb02@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-6-091697dbeb02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BfpNQbt2 c=1 sm=1 tr=0 ts=6ac7f2e4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=soJen2uxB0ky/kNk6TDY8g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ld924GHQG9e8gPgwT3gA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: Ukj3hLesI-Hui4W09G0aXMDTFagrLbHo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA3OCBTYWx0ZWRfX6q5BUDHS6kDY
 eP2ahQ+9OEblKruOCHqUqUjJbwTMxoz8umA46SQf2P2pRaPkOw8FAkao5BCZmQ97GOfjIWbOP/f
 9L2oifu1j0/T28g1xXcGne+3Zpeq0vPG7lgC+C+vYcktBSf+VuYHxiilz953lgTWaZRENlOU718
 55Mic04tDexpJ81ur5nX6fjgBxzl4b4SuvI+QQJiHAcusUBm4KnarSly5qYT297PDOrDI9yyih5
 Td1aVkdsDqHXatmJSKlBtS9gsy6STCSbOJ5XLoCt5MBU10GnxaPqHHuOxSsFnQk3hVF9vzVqBHn
 dmBue/Q3JZgqdefFncT3Xw3zbK/0+4bRP8G1Uq0lGaNnBGLxxcl8errpBxlzI2wEV2Fsf61WYpy
 oInKQc7ZA8UKTNZQB7nmkecFdUxwHbkOAsHpeRNIoqIrUPLMHDYD0+aq+d/r8DeDv5qxtYUEJlE
 XLWJ03dSzHcgyRQc2EA==
X-Proofpoint-GUID: Ukj3hLesI-Hui4W09G0aXMDTFagrLbHo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA3OCBTYWx0ZWRfX/cOUR/uwdYNJ
 +jrPxqPwLZvyud5LOD0E00/3YGxDY2lu8ExZOSLqdzz2MoRdRR5xuYo2qKXq7w6si2VfJ8IBAF8
 J+YaJAloi0kMMCgrH6/DhI3zu44xqFs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_06,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080078



On 8/27/2026 11:29 PM, Praveen Talari wrote:
> On the SA8255P platform there is no Linux clock handler for the SE
> source clock, so the driver has no way to look up the source clock
> index and divider needed to fill the GSI CONFIG0 TRE for a requested
> transfer frequency. To work around this, firmware instead exposes the
> SE HW supported source clock frequencies as OPPs on the perf domain
> device.
> 
> geni_se_domain_attach() now populates clk_perf_tbl from
> the performance-domain OPP table, allowing firmware-managed
> platforms to use geni_se_clk_freq_match().
> 
> Use geni_se_set_rate() instead of dev_pm_opp_set_rate()
> so clock programming is handled centrally by the GENI core,
> independent of the underlying clock-control mechanism.
> 
> Acked-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

