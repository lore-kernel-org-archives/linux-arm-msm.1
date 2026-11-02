Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622409;
	b=uz3K9+Rtr3Vcwlzkze75hDjjsGqM+oLML6IGRZwh6r+0nBm+JvzIiUyQGtcZfq3N8o/c
	 /EwxerkF6NyQsQaeErspLrkP9lbTlu5AOrXvoo4lVPOp9eIvcUuAdQrx2d/IkiG3Fj/1w
	 SpGzOBxjLNIv0IN41NmDQvNcyqFWP9Ci4G2AbdZQGyZ3hLAmNGH8VfmT19xCEE+flAfzH
	 PlPsNZyVDfinYzFuSNVwZvziA/VQ/oQUqkicsMH4wHJyVYjCCaLaksZvRRRrP6beaUoCq
	 jcfmd9dQ/Y7NWwMyv8BPU3PhFZ35XmeWiOKpzhMaLbFMKbU00qbGdxU6MCUPw9X3z9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622409;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Lr8wxNz53gjidnft/ui9bDD2OfQ6pl9HcEvNDFeHwIA=;
	b=kgl3vbT6UTbQGusIVZqBoFydsYE1gj8p1QSUzHIjtJSehsgyb5F48sQYeKdD8ojSNVl+
	 4PpbRSopwLgUqQ1U5t2G/fNIa6We/VVxBSJoGkubXRacIbvPwuHUjwxNDrtjFYZfmG2V6
	 4/zzssTybTteF5oCCcvkFfzRQCs5mPixyOWFAK3Lrmkiw0tWkcjbZIgS+u9zl8zwyE7ks
	 D3FvOoVxiCy2URQSEs3myeKwBoiHmlQZ18HYlgek86KRlGzeYVHD4z6Otw+9A5S5SUod0
	 6/ztJqVz/35fvFlST91+N3S7YYqXqvN0N4gQY6t0LmUw6vd7xemzlmhySso0E2bZkXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I7NoyQdo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K6eq3mSu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC71606A330
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 12:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEC71606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I7NoyQdo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K6eq3mSu
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AOPu3086531
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 12:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lr8wxNz53gjidnft/ui9bDD2OfQ6pl9HcEvNDFeHwIA=; b=I7NoyQdoGVMJ/qAt
	/wzcBtF0syYg1aWjuYZvoFGr5Phw5ZLLgoTsqWA20MQki1et5biLMXS8FUpJxM1g
	mMS+HSzyHTafD+y3JhgnYnsd+5+v4xirzvgc+zWOIXXGbqRJkwlVwnhJGyxXzXe2
	yW9ZbcvRFL2g/n8XiC6+4P0mC95Cm34FfzMnp11u3hgFNabEuP728AwYMlqyU3hz
	HOfGNSoECgRq3p8lO99iB7QAWe5euFjQMl30ZPZwb3fOllXpV8V4+sgJgQ2Ia7Ob
	zow60SUFddUMxYARXYQN+tUuzvPW5WGbDvr3Up+pBB3Wp0Zidk8yoXtSM07IlYR+
	sRl6YA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka61sbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 12:26:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5356c6d98cbso4577031cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 04:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793622407; x=1794227207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lr8wxNz53gjidnft/ui9bDD2OfQ6pl9HcEvNDFeHwIA=;
        b=K6eq3mSuXhakRBHfUALOSGGPUsv1avxDwIXMr59TOvipAjI0fhOytAyrnPGvCAVtdP
         GdRpOMLsNrHL89ZdiLFBDgz0krx/kW2163XusFK3PJJAcmzqJE+NgOV3BjIRWhDjdnOj
         TbD7+SFaUHjKJND04YjANi5HFQu4KV7zmTCTSVA+6mTGvdSxtX2CStdAMPYSvI+gN9uE
         37NqbBRyJaKPJCPC1qne2jxVWarLwqRZ6y1LqcK3bRdXVrcL2wvHzvGFXxGoFQMjCE5N
         O1EAnOj73pStd4UXPo96qGqU1u0dgfuA+V6TbkvdHFkFrEqOVaLGXD116oimLdrbTaQG
         0TGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622407; x=1794227207;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lr8wxNz53gjidnft/ui9bDD2OfQ6pl9HcEvNDFeHwIA=;
        b=XkEakZ1EGn/dgGRjwdhxbtJi5E9ly/zPmIesyAq4HHcvVSfYWTmgwLaLR/BJkyWI2R
         4pE2870VmuOM9zDqPxgJ/B+ANUYdfEC4S/urTF4byYYt/thJ39ad3r1EXzdEvIwjPwhv
         pizlLqMP/dvKHYAGSTngj/To+OqRIjtwtJuw4+MlQJB49BZB3amHCFMRlgHorfo0457I
         VpzCGD2TZ1s7GoahaJUNTlH8XdWoSUygVf3MKOlbixv5BnpmG2Y3XIut/MUAWK1E91Cp
         MctSM1qudBX578OoViFdTEY4TbCLAKDCOb6fZtk8oQDDpkNMUZI/7LobqvKYYevl1ZWc
         UiQA==
X-Forwarded-Encrypted: i=1; AKwUvBwTnR9UKI0OxJiTzdS4dMjdobOFBub1LFl9RyRU5yhQe6UbBRJn0svrZhky1Z1ZOJCpHjSagrfvISYRa1oF@vger.kernel.org
X-Gm-Message-State: APuU4Z+MU+p/GP1oZSKqUxNYiwjzmKXOkxg+VFbZwjw/ITkS8Eb3XEvG
	1tOgCCJNSfcqsdyWtmN18B0Wclkov02y0+wssnbhRZt5qBadEiwPe5WdjIn5RDNxm6ijVmAkle6
	CdNN+EDjcbDm/5yKHrUuwNgCymqVkM1bbSWsxc1TP2E8q3PIpijho4Z6xJXJB3XuXFpvR
X-Gm-Gg: AYBFou0VFUZ4+kTVJ9NOGa7wKVgwdtsWnS/BqWXw9LcASI1EzsH7olgDDQt49QoNrZi
	LXBaReJ8s4oEGrcKOERBizp7nobJpdRtOUr1J848rNoyauCw1dX/zWEZ+IUAAFpZzysWuqyjayN
	3P9KbcWIxgN54D4gvDBQaQOT+DnQkI3Zr9Ux8pkPNPWLLCY+agRE7XSJkd6cXwjglo130JOcyAA
	BAMgSEw1BW6n9rTuC+4RQ99wHmDr73/w2OitPZvM8Eq1235zCWpzlJbJLkX/ouVhnta+pJRAMEV
	3AYbS2t86iJV0+Fhkq9tWp2fz5Aq9ALDpg7Yx+aMwKF60JFInTdUp4bA1gLIX/0Ps1fZthVVlN1
	Q+M8EAqADNeCxZeJjPbGm6enfpcKfjUUyB5Hz6q4VUguqXppj8FQPCP1ph+eK5BSvnybKqGU=
X-Received: by 2002:a05:622a:e0c7:20b0:51c:2324:666 with SMTP id d75a77b69052e-542b687da82mr163915191cf.3.1793622407184;
        Mon, 02 Nov 2026 04:26:47 -0800 (PST)
X-Received: by 2002:a05:622a:e0c7:20b0:51c:2324:666 with SMTP id d75a77b69052e-542b687da82mr163914731cf.3.1793622406580;
        Mon, 02 Nov 2026 04:26:46 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe07551e2sm1578902e87.84.2026.11.02.04.26.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:26:45 -0800 (PST)
Message-ID: <60afa31c-0c68-4e77-81b7-ef78f987f429@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:26:43 +0100
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
Subject: Re: [RFC PATCH 1/2] firmware: qcom: scm: Add QSEECOM app loading and
 shutdown
To: Haozhen Li <dezige131@foxmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
        =?UTF-8?Q?Dawid_Wr=C3=B3bel?=
 <me@dawidwrobel.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261101160110.3622-1-dezige131@foxmail.com>
 <tencent_1E7A74EBC425C78E07DED39F31807B7E1D0A@qq.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <tencent_1E7A74EBC425C78E07DED39F31807B7E1D0A@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6qyHRW2_3wfBKmAgMGJE9Fcu2YNCcQSh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0OSBTYWx0ZWRfX5vYfXLzxhIMj
 1VGdu0/gSlKvjxwtAjMligTvnUFbRBjkR4Lp9xASq471rf4IaG6yuqn5Z9HXBCrOItbpY4Klnl2
 bj3Y8Hk19j4iuM5omzFX0xFb3CXSkPQ=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae88187 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=X-gXLV8O-kk81oobTu8A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0OSBTYWx0ZWRfX+wUlrDTisdCa
 7gKneerNwjLpOogSylQgWH9S8SAVJ+2VX2Kcm5N+sxBLZp/LHAoEfNKlfEf+OtH4m09WtKB0PB0
 zJaOPZ4YitBTOU1movCmO8mNtdob/5EsF0sDRWkeS2XB2ObUcwyQ0Q15eSGcIE6HhZr0sceO2sM
 Qd9xlwic2gZPuMs4e6fjJQ/vgmpNCt5a3rVzcyOZtiMfy/FpEw0oP6XItoHgzV8P/chijNs6iZ/
 5s5/NTx90Z9QtSgXunImW6XE791N4hSL68v+DF2lL+Wx3PnjVSLnHqLpF/Tw9wGaVOlA63SRqU0
 sLmeW/gFzrqrbOFFFidqfVMZDuSf1b3RhU0/fTAffGcMKaBvcA/YIDDCofI0sISW5IRRdLZmJZq
 9ncPtW5KiBOVj2G+bbCztzf4bFTOyF1tsfs2hWqzrsGHMSIMqyv3IqjPXcoBOhYW34SsfQT9bM0
 07mt74CO1CuLGzgvLjw==
X-Proofpoint-GUID: 6qyHRW2_3wfBKmAgMGJE9Fcu2YNCcQSh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020049

On 11/1/26 5:01 PM, Haozhen Li wrote:
> QSEECOM clients in the kernel can currently only talk to trusted
> applications that some earlier boot stage happened to load:
> qcom_scm_qseecom_app_get_id() looks an app up and
> qcom_scm_qseecom_app_send() talks to it, but nothing lets Linux start
> one itself.

Adding some relevant folks to Cc for awareness

[...]

> + * The image buffer must lie entirely below the 4 GiB physical mark: QTEE
> + * reads the image address as a 32-bit value even under the 64-bit SMC
> + * calling convention, so a buffer above it would be truncated into a wrong
> + * address. Such buffers are rejected here rather than passed on.

I think that only holds for certain versions

> + *
> + * Return: Zero on success, nonzero on failure.
> + */
> +int qcom_scm_qseecom_app_load(void *img, size_t mdt_len, size_t img_len,
> +			      u32 *app_id)
> +{
> +	phys_addr_t img_phys;
> +	struct qcom_scm_qseecom_resp res = {};
> +	struct qcom_scm_desc desc = {};
> +	int status;

nit: please use reverse-Christmas-tree sorting

[...]

> +	/* See the comment on the 4 GiB limit in the function doc above. */
> +	if (upper_32_bits(img_phys) || (u64)img_phys + img_len > SZ_4G) {

This can overflow on 32b archs, do `|| img_len > SZ_4G - img_phys` instead
(also below)

Konrad
